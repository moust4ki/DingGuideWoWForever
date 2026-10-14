-- Ding! - Class quests, the fourth built-in pack (Ding/Guides/Class): one section per class and
-- side, each for its class only. Picking the pack takes the character's own section, the Guide
-- tab lists that one alone, the setup assistant names it; every step resolves in DingDB and
-- every text is translated in each language.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local root = tools .. "/.."
local CLASSES = { "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "WARRIOR" }
local SIDES = { "Alliance", "Horde" }
local IDS = {}
for _, side in ipairs(SIDES) do
    for _, class in ipairs(CLASSES) do IDS[#IDS + 1] = "class-" .. side:lower() .. "-" .. class:lower() end
end
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = IDS, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, C, L = Ding.Engine, Ding.Config, Ding.L
local DB = Ding.DB

-- A character of each class and side: a race the guide is written for.
local RACE = {
    Alliance = { DRUID = "NightElf", HUNTER = "Dwarf", MAGE = "Human", PALADIN = "Human", PRIEST = "Dwarf",
        ROGUE = "Human", SHAMAN = "Dwarf", WARLOCK = "Gnome", WARRIOR = "Human" },
    Horde = { DRUID = "Tauren", HUNTER = "Orc", MAGE = "Troll", PALADIN = "Scourge", PRIEST = "Troll",
        ROGUE = "Orc", SHAMAN = "Orc", WARLOCK = "Orc", WARRIOR = "Tauren" },
}
local FILE = {}
for _, class in ipairs(CLASSES) do FILE[class] = class:sub(1, 1) .. class:sub(2):lower() end

local function idOf(side, class) return "class-" .. side:lower() .. "-" .. class:lower() end

local function each(fn)
    for _, side in ipairs(SIDES) do
        for _, class in ipairs(CLASSES) do fn(side, class, Ding:GetGuide(idOf(side, class))) end
    end
end

local function list(v)
    if v == nil then return {} end
    if type(v) == "table" then return v end
    return { v }
end

T.test("Ding! - Class quests: a fourth built-in pack, one section per class and side", function()
    local pack = Ding:GetGuidePack(Ding.CLASS_PACK)
    T.eq(Ding.CLASS_PACK, "ding-class")
    T.eq(pack.title, L.PACK_CLASS)
    T.eq(pack.builtin, 4)
    T.eq(pack.category, "class")
    T.fails(function() Ding.RegisterGuidePack({ id = Ding.CLASS_PACK }) end, "already used")
    local n = 0
    for _ in Ding:IterateGuides(Ding.CLASS_PACK) do n = n + 1 end
    T.eq(n, #IDS, "sections of the pack")
    each(function(side, class, g)
        T.ok(g, "no guide " .. idOf(side, class))
        T.eq(g.pack, Ding.CLASS_PACK)
        T.eq(g.faction, side)
        T.eq(#g.classes, 1, g.id .. ": one class")
        T.eq(g.classes[1], class)
        T.ok(#g.steps > 0, g.id .. " has no step")
        -- Followed for their rewards: grey quests stay in the guide.
        T.ok(E:KeepsGrey(g), g.id .. " skips its grey quests")
    end)
end)

T.test("picking the pack takes the character's own section, and only that class sees it", function()
    each(function(side, class, g)
        T.reset({ race = RACE[side][class], faction = side, class = class, level = 20 })
        T.ok(Ding:GuideMatchesPlayer(g), g.id .. ": not for its own class")
        for _, other in ipairs(IDS) do
            if other ~= g.id then
                T.ok(not Ding:GuideMatchesPlayer(Ding:GetGuide(other)), other .. " shown to a " .. side .. " " .. class)
            end
        end
        T.eq(Ding:SuggestGuide(Ding.CLASS_PACK).id, g.id, "suggested for a " .. side .. " " .. class)
        T.ok(E:SetPack(Ding.CLASS_PACK), "the pack does not start")
        T.eq(E.guide.id, g.id, "section taken for a " .. side .. " " .. class)
    end)
end)

T.test("the Guide tab lists the character's class guide alone in the section list", function()
    T.reset({ race = "Tauren", faction = "Horde", class = "DRUID", level = 12 })
    T.ok(E:SetPack(Ding.CLASS_PACK), "the pack does not start")
    C:Open("guide", 1); H.flush()
    T.eq(C.focus.box.text:GetText(), L.PACK_CLASS, "the pack's name")
    H.press("PADDDOWN")
    T.eq(C.focus.opts.label, L.GUIDE_SECTION)
    H.press("PAD1")
    T.eq(#C.dropdown.entries, 1, "other classes' guides listed")
    T.eq(C.dropdown.entries[1].value, "class-horde-druid")
    T.ok(C.dropdown.entries[1].current, "the active section is not marked")
    H.press("PAD2")
    C:Close(); H.flush()
end)

T.test("the setup assistant's last screen offers the pack, named by the character's guide", function()
    T.reset({ race = "Human", faction = "Alliance", class = "PALADIN", level = 12 })
    local found
    for _, choice in ipairs(Ding.Setup.SCREENS[4].choices()) do
        if choice.label == L.PACK_CLASS then found = choice end
    end
    T.ok(found, "no class pack among the choices")
    T.eq(found.sub, Ding:GetGuide("class-alliance-paladin").title)
    T.ok(not found.dim, "the pack greyed for its own class")
    found.run()
    T.eq(E.guide.id, "class-alliance-paladin")
end)

-- requiredClasses bits (Data's mask, as the client's class file names).
local CLASS_BIT = { WARRIOR = 1, PALADIN = 2, HUNTER = 4, ROGUE = 8, PRIEST = 16, SHAMAN = 64, MAGE = 128,
    WARLOCK = 256, DRUID = 1024 }
local FACTION_RACES = {
    Alliance = { Human = true, Dwarf = true, NightElf = true, Gnome = true, Skyborne = true },
    Horde = { Orc = true, Scourge = true, Tauren = true, Troll = true, Skyborne = true },
}

T.test("every step resolves in DingDB: quests of the class, items, NPCs, races of the side", function()
    local QL = DB.LAYOUT.Quest
    each(function(side, class, g)
        for i, step in ipairs(g.steps) do
            local at = ("%s, step %d"):format(g.id, i)
            for _, key in ipairs({ "accept", "turnin", "complete" }) do
                for _, q in ipairs(list(step[key])) do
                    local quest = DB.quests[q]
                    T.ok(quest, at .. ": quest " .. q .. " not in DingDB")
                    local mask = quest and quest[QL.requiredClasses] or 0
                    if mask ~= 0 then
                        T.ok(math.floor(mask / CLASS_BIT[class]) % 2 == 1, at .. ": quest " .. q .. " is not for " .. class)
                    end
                end
            end
            for _, key in ipairs({ "use", "useitem" }) do
                for _, id in ipairs(list(step[key])) do T.ok(DB.items[id], at .. ": item " .. id .. " not in DingDB") end
            end
            for _, pair in ipairs(step.collect or {}) do
                T.ok(DB.items[pair[1]], at .. ": item " .. pair[1] .. " not in DingDB")
            end
            for _, id in ipairs(list(step.talk)) do T.ok(DB.npcs[id], at .. ": NPC " .. id .. " not in DingDB") end
            for _, race in ipairs(step.races or g.races or {}) do
                T.ok(FACTION_RACES[side][race], at .. ": race " .. race .. " of the other side")
            end
        end
    end)
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

T.test("every text of every class guide is translated in each language", function()
    local LOCALES = dofile(tools .. "/guide_texts.lua").LOCALES
    each(function(side, class, g)
        local want = texts(g)
        for _, locale in ipairs(LOCALES) do
            local path = ("%s/Ding/Locales/Guides/%s/Class/%s/%s.lua"):format(root, locale, side, FILE[class])
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
    end)
end)

T.run()
