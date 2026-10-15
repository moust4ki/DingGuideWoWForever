-- Ding! - Dungeon quests, the fifth built-in pack (Ding/Guides/Dungeons): one section per dungeon
-- and side, the character's side only in the Guide tab, by level, the ones above the character's
-- level greyed; a section takes the player to every quest giver, then into the dungeon (the step
-- of its entrance passes once the player is inside), then to the turn-ins. Every step resolves in
-- DingDB and every text is translated in each language.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local root = tools .. "/.."

-- The guide files, from Ding.toc (Ding/Guides/Dungeons/<Side>/<NN>_<Name>.lua), in load order.
local FILES, SIDE_OF = {}, {}
do
    local handle = assert(io.open(root .. "/Ding/Ding.toc", "rb"))
    for line in handle:read("*a"):gmatch("[^\r\n]+") do
        local side, name = line:match("^Guides\\Dungeons\\(%a+)\\(.+%.lua)$")
        if side then FILES[#FILES + 1] = { side = side, name = name } end
    end
    handle:close()
end
local IDS = {}
for _, f in ipairs(FILES) do
    local def
    _G.Ding = { RegisterGuide = function(d) def = d end }
    dofile(("%s/Ding/Guides/Dungeons/%s/%s"):format(root, f.side, f.name))
    _G.Ding = nil
    f.id = def.id
    IDS[#IDS + 1] = def.id
    SIDE_OF[def.id] = f.side
end

local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = IDS, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, C, L = Ding.Engine, Ding.Config, Ding.L
local DB = Ding.DB

local function list(v)
    if v == nil then return {} end
    if type(v) == "table" then return v end
    return { v }
end

local function guides(side)
    local out = {}
    for _, id in ipairs(IDS) do
        if not side or SIDE_OF[id] == side then out[#out + 1] = Ding:GetGuide(id) end
    end
    return out
end

T.test("Ding! - Dungeon quests: a fifth built-in pack, one section per dungeon and side", function()
    local pack = Ding:GetGuidePack(Ding.DUNGEONS_PACK)
    T.eq(Ding.DUNGEONS_PACK, "ding-dungeons")
    T.eq(pack.title, L.PACK_DUNGEONS)
    T.eq(pack.builtin, 5)
    T.eq(pack.category, "dungeon")
    T.fails(function() Ding.RegisterGuidePack({ id = Ding.DUNGEONS_PACK }) end, "already used")
    T.ok(#guides("Alliance") >= 17 and #guides("Horde") >= 17, "a guide per Classic dungeon and side")
    local n = 0
    for _ in Ding:IterateGuides(Ding.DUNGEONS_PACK) do n = n + 1 end
    T.eq(n, #IDS, "sections of the pack")
    for _, g in ipairs(guides()) do
        T.eq(g.pack, Ding.DUNGEONS_PACK)
        T.eq(g.faction, SIDE_OF[g.id])
        T.eq(g.id:sub(1, #("dungeon-" .. g.faction:lower() .. "-")), "dungeon-" .. g.faction:lower() .. "-")
        T.ok(g.races == nil and g.classes == nil, g.id .. ": for the whole side")
        -- The title is the dungeon's name and its levels.
        T.eq(g.title:match("%((%d+)%-%d+%)$"), tostring(g.minLevel), g.id .. ": title " .. g.title)
        T.eq(g.title:match("%(%d+%-(%d+)%)$"), tostring(g.maxLevel), g.id .. ": title " .. g.title)
        -- Followed for the dungeon, not the experience: grey quests stay in the guide.
        T.ok(E:KeepsGrey(g), g.id .. " skips its grey quests")
    end
    -- Listed by level: each side's sections from the lowest dungeon to the highest.
    for _, side in ipairs({ "Alliance", "Horde" }) do
        local last = 0
        for _, g in ipairs(guides(side)) do
            T.ok(g.minLevel >= last, g.id .. " comes before a lower dungeon")
            last = g.minLevel
        end
    end
end)

T.test("the Guide tab lists the character's side only, by level, the higher ones greyed", function()
    T.reset({ race = "Orc", faction = "Horde", class = "WARRIOR", level = 20 })
    T.ok(E:SetPack(Ding.DUNGEONS_PACK), "the pack does not start")
    T.eq(SIDE_OF[E.guide.id], "Horde")
    C:Open("guide", 1); H.flush()
    T.eq(C.focus.box.text:GetText(), L.PACK_DUNGEONS, "the pack's name")
    H.press("PADDDOWN")
    T.eq(C.focus.opts.label, L.GUIDE_SECTION)
    H.press("PAD1")
    local entries = C.dropdown.entries
    T.eq(#entries, #guides("Horde"), "the other side's dungeons listed")
    for i, e in ipairs(entries) do
        local g = Ding:GetGuide(e.value)
        T.eq(SIDE_OF[e.value], "Horde")
        T.eq(e.value, guides("Horde")[i].id, "listed in level order")
        T.eq(e.dim, g.minLevel > 20, e.value .. ": greyed above the character's level only")
    end
    H.press("PAD2")
    C:Close(); H.flush()
end)

T.test("picking the pack takes a dungeon of the character's level, of its side", function()
    for _, c in ipairs({ { "Human", "Alliance", 20 }, { "Tauren", "Horde", 30 }, { "Gnome", "Alliance", 45 },
        { "Scourge", "Horde", 58 } }) do
        T.reset({ race = c[1], faction = c[2], class = "WARRIOR", level = c[3] })
        local g = Ding:SuggestGuide(Ding.DUNGEONS_PACK)
        T.ok(g, "nothing suggested at level " .. c[3])
        T.eq(SIDE_OF[g.id], c[2])
        T.ok(g.minLevel <= c[3] and c[3] <= g.maxLevel, g.id .. " for a level " .. c[3])
    end
end)

T.test("the setup assistant's last screen offers the pack, with the levels it covers", function()
    T.reset({ race = "Dwarf", faction = "Alliance", class = "PALADIN", level = 30 })
    local found
    for _, choice in ipairs(Ding.Setup.SCREENS[4].choices()) do
        if choice.label == L.PACK_DUNGEONS then found = choice end
    end
    T.ok(found, "no dungeon pack among the choices")
    T.ok(found.sub and found.sub ~= "", "no line under the pack")
    T.ok(not found.dim, "the pack greyed for an Alliance character")
    found.run()
    T.eq(E.guide.pack, Ding.DUNGEONS_PACK)
    T.eq(SIDE_OF[E.guide.id], "Alliance")
end)

-- The first step of the guide that goes to the dungeon's entrance.
local function entranceStep(g)
    for i, step in ipairs(g.steps) do
        if step.go and Ding.Data:DungeonAtEntrance(step.go[1], step.go[2], step.go[3]) then return i, step end
    end
end

T.test("every section goes to its dungeon's entrance, and notes say where to go inside", function()
    for _, g in ipairs(guides()) do
        local index = entranceStep(g)
        T.ok(index, g.id .. ": no step at a dungeon's entrance (DingDB)")
        T.ok(g.steps[index].text, g.id .. ": the entrance step has no text")
        -- The arrow does not work inside: every objective after the entrance has a note.
        for i = index or #g.steps + 1, #g.steps do
            local step = g.steps[i]
            if step.complete then T.ok(step.note, ("%s, step %d: no note"):format(g.id, i)) end
        end
    end
end)

T.test("Ragefire Chasm: the pick-ups, the entrance passed from inside the dungeon, then the dungeon's steps", function()
    T.reset({ race = "Orc", faction = "Horde", class = "WARRIOR", level = 15 })
    local g = Ding:GetGuide("dungeon-horde-ragefire")
    E:SetGuide(g.id, 1, true); H.flush()
    -- The pick-ups: each quest accepted, worked and turned in moves the guide on.
    local index = entranceStep(g)
    local guard = 0
    while E.index < index and guard < 50 do
        guard = guard + 1
        H.play(E:CurrentStep())
        H.flush()
        if E.index < index and not E:IsStepDone(E:CurrentStep(), E.index) then E:Next(); H.flush() end
    end
    T.eq(E.index, index, "the guide does not reach the entrance")
    T.eq(E:CurrentStep().text, "Enter Ragefire Chasm")
    -- Inside, no position: entering the instance passes the trip to the entrance.
    H.setInstance(true)
    H.fire("PLAYER_ENTERING_WORLD"); H.flush()
    T.ok(E.index > index, "the entrance step stays once inside the dungeon")
    T.ok(E:CurrentStep().complete or E:CurrentStep().turnin, "the next step is not the dungeon's")
    T.ok(E:CurrentStep().note, "the dungeon's first step has no note")
    -- Back outside, the step stays done.
    H.setInstance(false)
    E:Update(); H.flush()
    T.ok(E.index > index, "the entrance step comes back once outside")
end)

T.test("a trip that is not to a dungeon's entrance does not pass inside an instance", function()
    T.reset({ race = "Orc", faction = "Horde", class = "WARRIOR", level = 15 })
    Ding.RegisterGuide({ id = "test-dungeon-go", pack = Ding.DUNGEONS_PACK, faction = "Horde",
        steps = { { go = { 1454, 30, 30 }, text = "Somewhere in Orgrimmar" }, { text = "Next" } } })
    E:SetGuide("test-dungeon-go", 1, true); H.flush()
    H.setInstance(true)
    H.fire("PLAYER_ENTERING_WORLD"); H.flush()
    T.eq(E.index, 1, "a trip elsewhere passed inside an instance")
    H.setInstance(false)
end)

-- requiredClasses bits (Data's mask, as the client's class file names).
local CLASS_BIT = { WARRIOR = 1, PALADIN = 2, HUNTER = 4, ROGUE = 8, PRIEST = 16, SHAMAN = 64, MAGE = 128,
    WARLOCK = 256, DRUID = 1024 }
local FACTION_RACES = {
    Alliance = { Human = true, Dwarf = true, NightElf = true, Gnome = true, Skyborne = true },
    Horde = { Orc = true, Scourge = true, Tauren = true, Troll = true, Skyborne = true },
}

T.test("every step resolves in DingDB: quests, items, races of the side, classes", function()
    local QL = DB.LAYOUT.Quest
    for _, g in ipairs(guides()) do
        for i, step in ipairs(g.steps) do
            local at = ("%s, step %d"):format(g.id, i)
            for _, key in ipairs({ "accept", "turnin", "complete" }) do
                for _, q in ipairs(list(step[key])) do
                    local quest = DB.quests[q]
                    T.ok(quest, at .. ": quest " .. q .. " not in DingDB")
                    local mask = quest and quest[QL.requiredClasses] or 0
                    if mask ~= 0 then
                        T.ok(step.classes, at .. ": quest " .. q .. " is for some classes only")
                        for _, class in ipairs(step.classes or {}) do
                            T.ok(math.floor(mask / CLASS_BIT[class]) % 2 == 1, at .. ": quest " .. q .. " is not for " .. class)
                        end
                    end
                end
            end
            for _, id in ipairs(list(step.use)) do T.ok(DB.items[id], at .. ": item " .. id .. " not in DingDB") end
            for _, pair in ipairs(step.collect or {}) do
                T.ok(DB.items[pair[1]], at .. ": item " .. pair[1] .. " not in DingDB")
            end
            for _, id in ipairs(list(step.talk)) do T.ok(DB.npcs[id], at .. ": NPC " .. id .. " not in DingDB") end
            for _, race in ipairs(step.races or {}) do
                T.ok(FACTION_RACES[g.faction][race], at .. ": race " .. race .. " of the other side")
            end
            T.ok(not (step.dungeon or step.elite), at .. ": a dungeon guide's step behind the Route options")
        end
    end
end)

-- The texts of a guide that a translation must cover.
local function texts(g)
    local out = { [g.title] = true }
    for _, step in ipairs(g.steps) do
        if step.note then out[step.note] = true end
        if step.text then out[step.text] = true end
        local why = type(step.why) == "table" and step.why.text or step.why
        if why then out[why] = true end
    end
    return out
end

T.test("every text of every dungeon guide is translated in each language", function()
    local LOCALES = dofile(tools .. "/guide_texts.lua").LOCALES
    for _, f in ipairs(FILES) do
        local g = Ding:GetGuide(f.id)
        local want = texts(g)
        for _, locale in ipairs(LOCALES) do
            local path = ("%s/Ding/Locales/Guides/%s/Dungeons/%s/%s"):format(root, locale, f.side, f.name)
            local map
            local chunk = assert(loadfile(path), "no translation file " .. path)
            local saved = _G.Ding
            _G.Ding = { RegisterGuideTranslation = function(loc, id, m)
                T.eq(loc, locale)
                T.eq(id, g.id)
                map = m
            end }
            chunk()
            _G.Ding = saved
            for text in pairs(want) do
                T.ok(map[text], ("%s %s: untranslated \"%s\""):format(locale, g.id, text))
            end
        end
    end
end)

T.run()
