-- The guides of Ding - Leveling, written by tools/write_leveling.lua from the Leveling routes
-- (tools/routes/leveling/*.lua): one guide per section, the route's order kept, the steps tagged
-- for Ding's options complete; and, in the zone guides, no route text on a tagged step.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })

local function ids(v)
    if type(v) == "number" then return { v } end
    return v or {}
end
local function readGuide(file)
    local def
    local saved = _G.Ding
    _G.Ding = { RegisterGuide = function(d) def = d end }
    dofile(tools .. "/../Ding/Guides/" .. file)
    _G.Ding = saved
    return def
end

local FACTIONS = {}
for _, name in ipairs({ "alliance", "horde" }) do
    local route = dofile(tools .. "/routes/leveling/" .. name .. ".lua")
    local guides = {}
    for _, s in ipairs(route.sections) do
        local file = ("Leveling/%s/%s.lua"):format(route.faction, s.id:match("^leveling%-%a(%d+)"))
        guides[#guides + 1] = { section = s, def = readGuide(file), file = file }
    end
    FACTIONS[#FACTIONS + 1] = { route = route, guides = guides }
end

T.test("one guide per route section, in Ding's default pack", function()
    for _, f in ipairs(FACTIONS) do
        for _, g in ipairs(f.guides) do
            local s, def = g.section, g.def
            T.ok(def, g.file .. " missing")
            T.eq(def.id, s.id)
            T.eq(def.pack, nil, s.id .. ": Ding - Leveling")
            T.eq(def.faction, f.route.faction)
            T.eq(def.title, ("%s (%d-%d)"):format(s.title, s.minLevel, s.maxLevel))
            T.eq(def.next, s.next, s.id .. ": next")
            T.eq(table.concat(def.races or {}, ","), table.concat(s.races or {}, ","), s.id .. ": races")
        end
    end
end)

-- The Leveling route is the plan: the quest actions a guide keeps follow the route order (a
-- repair may move a few: a quest waiting for its prerequisite).
T.test("the route order holds", function()
    for _, f in ipairs(FACTIONS) do
        for _, g in ipairs(f.guides) do
            -- Positions of each action in the route section (an objective may come back at
            -- several places: the n-th one in the guide stands for the n-th one there).
            local index = {}
            local n = 0
            local function at(key)
                n = n + 1
                index[key] = index[key] or {}
                table.insert(index[key], n)
            end
            for _, step in ipairs(g.section.steps) do
                -- (A quest accepted and turned in on one step is done on the spot: accept first.)
                local accepted, instant = {}, {}
                for _, q in ipairs(ids(step.accept)) do accepted[q] = true end
                for _, q in ipairs(ids(step.turnin)) do
                    if accepted[q] then instant[#instant + 1] = q else at("turnin" .. q) end
                end
                for _, q in ipairs(ids(step.accept)) do at("accept" .. q) end
                for _, q in ipairs(ids(step.complete)) do at("complete" .. q) end
                for _, q in ipairs(instant) do at("turnin" .. q) end
            end
            local seq, seen = {}, {}
            for _, step in ipairs(g.def.steps) do
                for _, k in ipairs({ "turnin", "accept", "complete" }) do
                    for _, q in ipairs(ids(step[k])) do
                        local list = index[k .. q]
                        if list then
                            seen[k .. q] = (seen[k .. q] or 0) + 1
                            seq[#seq + 1] = list[math.min(seen[k .. q], #list)]
                        end
                    end
                end
            end
            -- Longest run in route order (longest non-decreasing subsequence).
            local tails = {}
            for _, v in ipairs(seq) do
                local lo, hi = 1, #tails + 1
                while lo < hi do
                    local mid = math.floor((lo + hi) / 2)
                    if tails[mid] <= v then lo = mid + 1 else hi = mid end
                end
                tails[lo] = v
            end
            T.ok(#seq == 0 or #tails >= 0.9 * #seq,
                ("%s: %d of %d actions in route order"):format(g.section.id, #tails, #seq))
        end
    end
end)

T.test("a dungeon or elite quest is tagged on every step, its death skips complete", function()
    for _, f in ipairs(FACTIONS) do
        local tagOf, plain = {}, {}
        for _, g in ipairs(f.guides) do
            for i, step in ipairs(g.def.steps) do
                local tag = step.dungeon or (step.elite and "elite")
                for _, k in ipairs({ "turnin", "accept", "complete" }) do
                    for _, q in ipairs(ids(step[k])) do
                        if tag then
                            tagOf[q] = tagOf[q] or tag
                        else
                            plain[q] = plain[q] or (g.section.id .. ", step " .. i)
                        end
                    end
                end
                if step.deathskip then
                    T.eq(type(step.text), "string", g.section.id .. ", step " .. i .. ": death skip without text")
                end
            end
        end
        for q, tag in pairs(tagOf) do
            T.ok(not plain[q], ("quest %d is tagged %s, not at %s"):format(q, tag, tostring(plain[q])))
        end
    end
end)

-- The Skyborne starts (tools/routes/skyborne_<side>.lua): a Skyborne has a side from
-- creation, one start per side with the quests open to it, then that side's Leveling route;
-- the Skyborne join the Leveling routes (`entries`), which keep for them what the other races'
-- starts already did.
T.test("Skyborne: a start per side, then the faction's Leveling route", function()
    local X = dofile(tools .. "/questiedb_export.lua")
    local db = X.loadCorrected(T.combined)
    local bits = X.RACE_FACTION_BITS.Skyborne
    local NEXT = { Alliance = "leveling-a04-westfall", Horde = "leveling-h04-silverpine-forest" }
    for _, side in ipairs({ "Alliance", "Horde" }) do
        local route = dofile(tools .. "/routes/skyborne_" .. side:lower() .. ".lua")
        local def = readGuide(route.guides[1].file)
        T.eq(def.faction, side)
        T.eq(table.concat(def.races, ","), "Skyborne")
        T.eq(def.next, NEXT[side])
        local n = 0
        for _, step in ipairs(def.steps) do
            for _, q in ipairs(ids(step.accept)) do
                n = n + 1
                T.ok(X.raceAllowed(db.Quest[q], bits[side]), ("%s: quest %d is closed to that side"):format(side, q))
            end
        end
        T.ok(n > 50, side .. ": quests on Zephras Isle: " .. n)
        -- The way off the isle closes the start; the isle's class quests are for their class.
        local exit = side == "Alliance" and 94946 or 95349
        local last = def.steps[#def.steps]
        local out = side == "Alliance" and def.steps[#def.steps - 1] or last
        T.eq(ids(out.turnin)[1], exit, side .. ": exit quest turned in at the end")
        if side == "Alliance" then T.ok(last.go and last.go[1] == 1416, "Alliance: the portal in Dalaran last") end
        local classSteps = 0
        for _, step in ipairs(def.steps) do
            if step.classes then
                classSteps = classSteps + 1
                T.eq(#step.classes, 1, side .. ": a class quest step is for one class")
            end
        end
        T.ok(classSteps > 0, side .. ": class quests of the isle")
    end
    for _, f in ipairs(FACTIONS) do
        local entry = f.route.entries and f.route.entries.Skyborne
        T.ok(entry, f.route.faction .. ": Skyborne entry")
        local joined = false
        for _, g in ipairs(f.guides) do
            if g.section.id == entry.section then joined = true end
            for i, step in ipairs(g.def.steps) do
                if not joined and step.races then
                    for _, r in ipairs(step.races) do
                        T.ok(r ~= "Skyborne", ("%s, step %d: Skyborne before they join"):format(g.section.id, i))
                    end
                end
            end
        end
        T.ok(joined, entry.section .. " found")
    end
    -- Westfall: the human start did these quests; the other races, the Skyborne included, get them.
    local westfall = FACTIONS[1].guides[4].def
    local found = false
    for _, step in ipairs(westfall.steps) do
        if ids(step.accept)[1] == 64 and step.races then
            found = table.concat(step.races, ","):find("Skyborne", 1, true) ~= nil
        end
    end
    T.ok(found, "Westfall: accept 64 for the Skyborne too")
end)

-- A trip says where it goes or what for (without a text, the window only shows coordinates),
-- and no character gets the same trip twice in a row (steps under conditions:
-- tools/check_guides.lua replays them).
T.test("every trip has a text, and none comes right after the same trip", function()
    local X = dofile(tools .. "/questiedb_export.lua")
    local ACTIONS = { "accept", "turnin", "complete", "level", "sethearth", "hearth", "deathskip", "train", "fly",
        "vendor", "repair", "kill", "collect", "talk", "gossip", "useitem", "buy", "object", "equip", "destroy", "bank",
        "unbank", "abandon", "patrol" }
    local function onlyTravels(step)
        if not step.go then return false end
        for _, k in ipairs(ACTIONS) do
            if step[k] ~= nil then return false end
        end
        return true
    end
    local function has(list, v)
        if not list then return true end
        for _, x in ipairs(list) do if x == v then return true end end
        return false
    end
    for _, f in ipairs(FACTIONS) do
        local races = {}
        for _, r in ipairs(X.FACTION_RACES[f.route.faction]) do races[#races + 1] = r end
        for r in pairs(f.route.entries or {}) do races[#races + 1] = r end
        for _, g in ipairs(f.guides) do
            local def = g.def
            for i, step in ipairs(def.steps) do
                if step.go then
                    T.ok(type(step.text) == "string" and step.text ~= "", ("%s, step %d: go without text"):format(def.id, i))
                end
            end
            for _, race in ipairs(races) do
                for _, class in ipairs(X.FACTION_CLASSES[f.route.faction]) do
                    local previous
                    for i, step in ipairs(def.steps) do
                        if has(def.races, race) and has(step.races, race) and has(step.classes, class) then
                            if previous and not previous.step.when and not step.when and onlyTravels(previous.step)
                                and onlyTravels(step) and previous.step.go[1] == step.go[1]
                                and math.abs(previous.step.go[2] - step.go[2]) <= 0.1
                                and math.abs(previous.step.go[3] - step.go[3]) <= 0.1 then
                                T.ok(false, ("%s, step %d (%s %s): the same trip as step %d"):format(def.id, i, race, class,
                                    previous.index))
                            end
                            previous = { step = step, index = i }
                        end
                    end
                end
            end
        end
    end
end)

-- A note that says "the NPC" is about the step's quest giver, ender or the NPC it talks to: on a
-- step whose targets are only objects or monsters it sends the player looking for someone who
-- is not there ("The object is...", "The target is..." instead). And "This one roams" is for a
-- target that moves: a quest giver with a path in QuestieDB, a patrol, or monsters.
T.test("notes: the NPC only where there is one, roaming only where someone moves", function()
    local X = dofile(tools .. "/questiedb_export.lua")
    local Texts = dofile(tools .. "/guide_texts.lua")
    local QK = X.QUEST
    local db = X.loadCorrected(T.combined)
    local dict = dofile(tools .. "/routes/locales/frFR.lua")
    local ROAMS = "This one roams, so scan the surrounding area."
    -- (Phrases about another NPC than the step's target.)
    local ABOUT_OTHERS = {
        ["Bring any feathers you collect to the NPC at 64.8, 8.1."] = true,
        ["Steer clear of hostile Alliance NPCs."] = true,
    }
    local function targets(step)
        local t = { npc = {}, monster = {}, object = {}, item = {} }
        local function source(itemId)
            local item = db.Item[itemId]
            for _, id in ipairs(item and item[X.ITEM.npcDrops] or {}) do t.monster[id] = true end
            for _, id in ipairs(item and item[X.ITEM.objectDrops] or {}) do t.object[id] = true end
            for _, id in ipairs(item and item[X.ITEM.vendors] or {}) do t.npc[id] = true end
        end
        for _, q in ipairs(ids(step.accept)) do
            local s = db.Quest[q] and db.Quest[q][QK.startedBy] or {}
            for _, id in ipairs(s[1] or {}) do t.npc[id] = true end
            for _, id in ipairs(s[2] or {}) do t.object[id] = true end
            for _, id in ipairs(s[3] or {}) do t.item[id] = true end
        end
        for _, q in ipairs(ids(step.turnin)) do
            local s = db.Quest[q] and db.Quest[q][QK.finishedBy] or {}
            for _, id in ipairs(s[1] or {}) do t.npc[id] = true end
            for _, id in ipairs(s[2] or {}) do t.object[id] = true end
        end
        for _, q in ipairs(ids(step.complete)) do
            local quest = db.Quest[q]
            local o = quest and quest[QK.objectives] or {}
            for _, e in ipairs(o[1] or {}) do
                local npc = db.Npc[e[1]]
                -- (An objective on a quest giver or ender is someone to talk to.)
                local talk = npc and (X.hasEntries(npc[10]) or X.hasEntries(npc[11]))
                if talk then t.npc[e[1]] = true else t.monster[e[1]] = true end
            end
            for _, e in ipairs(o[2] or {}) do t.object[e[1]] = true end
            for _, e in ipairs(o[3] or {}) do
                if e[1] ~= (quest[QK.sourceItem] or 0) then source(e[1]) end
            end
            for _, e in ipairs(o[5] or {}) do
                for _, id in ipairs(e[1] or {}) do t.monster[id] = true end
            end
        end
        for _, id in ipairs(ids(step.talk)) do t.npc[id] = true end
        for _, id in ipairs(ids(step.object)) do t.object[id] = true end
        for _, p in ipairs(type(step.kill) == "table" and step.kill or {}) do t.monster[type(p) == "table" and p[1] or p] = true end
        for _, p in ipairs(type(step.collect) == "table" and step.collect or {}) do source(type(p) == "table" and p[1] or p) end
        t.service = step.vendor or step.train or step.repair or step.sethearth or step.fly or step.buy
        return t
    end
    local function moves(set)
        for id in pairs(set) do
            if db.Npc[id] and X.hasEntries(db.Npc[id][8]) then return true end
        end
        return false
    end
    for _, f in ipairs(FACTIONS) do
        for _, g in ipairs(f.guides) do
            for i, step in ipairs(g.def.steps) do
                local parts = step.note and Texts.phrases(step.note, dict) or {}
                local t = targets(step)
                local someone = next(t.npc) ~= nil or t.service
                local other = next(t.monster) ~= nil or next(t.object) ~= nil or next(t.item) ~= nil
                for _, p in ipairs(parts) do
                    if (p:find("^The NPC") or p:find("^This NPC")) and not ABOUT_OTHERS[p] then
                        T.ok(someone or not other, ("%s, step %d: \"%s\", but no NPC there"):format(g.def.id, i, p))
                    end
                    if p == ROAMS then
                        local still = next(t.npc) ~= nil and not moves(t.npc) and not step.patrol and next(t.monster) == nil
                        T.ok(not still, ("%s, step %d: roams, but its NPCs stand still"):format(g.def.id, i))
                    end
                end
            end
        end
    end
end)

-- Putting an item in the bank, or taking it out, happens at a banker: on the step that talks to
-- one, or right after it (steps that only bank in between). Elsewhere the player has no bank.
T.test("bank steps: at a banker, with a note saying why", function()
    local X = dofile(tools .. "/questiedb_export.lua")
    local db = X.loadCorrected(T.combined)
    local function banker(id)
        local flags = db.Npc[id] and db.Npc[id][15] or 0
        return type(flags) == "number" and math.floor(flags / 256) % 2 == 1 -- (the banker flag)
    end
    local function atBanker(step)
        for _, id in ipairs(ids(step.talk)) do
            if banker(id) then return true end
        end
        return false
    end
    local BANK_ONLY = { bank = true, unbank = true, when = true, note = true, races = true, classes = true, keep = true }
    local function bankOnly(step)
        for k in pairs(step) do
            if not BANK_ONLY[k] then return false end
        end
        return true
    end
    for _, f in ipairs(FACTIONS) do
        for _, g in ipairs(f.guides) do
            local steps = g.def.steps
            for i, step in ipairs(steps) do
                if step.bank or step.unbank then
                    local ok = atBanker(step)
                    for j = i - 1, 1, -1 do
                        if ok then break end
                        if atBanker(steps[j]) then ok = true elseif not bankOnly(steps[j]) then break end
                    end
                    T.ok(ok, ("%s, step %d: bank or unbank away from a banker"):format(g.def.id, i))
                end
                if step.bank then
                    T.ok(type(step.note) == "string" and step.note:find("in the bank", 1, true) ~= nil,
                        ("%s, step %d: a bank step says why"):format(g.def.id, i))
                end
            end
        end
    end
end)

T.test("the zone guides keep route texts off the steps behind an option", function()
    -- (Off, the option takes its whole step away: a zone intro there would be lost.)
    for _, name in ipairs({ "human", "dwarf_gnome", "nightelf", "alliance", "orc_troll", "tauren", "undead", "horde" }) do
        local route = dofile(tools .. "/routes/" .. name .. ".lua")
        for _, g in ipairs(route.guides) do
            local def = readGuide(g.file)
            for i, step in ipairs(def.steps) do
                local tagged = step.sethearth or step.hearth or step.deathskip or step.dungeon or step.elite
                T.ok(not (tagged and step.note), ("%s, step %d: note on a tagged step"):format(def.id, i))
            end
        end
    end
end)

T.run()
