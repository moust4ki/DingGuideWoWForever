-- Ding's own database (Ding/DB, tools/build_data.lua) against QuestieDB: through Core/Data.lua,
-- Ding gets the same answers from both, for every quest, NPC, object and item. English client:
-- the names compared are the base ones (Ding/DB's other languages come from QuestieDB too).
-- Run it with the export Ding/DB was built from (Ding.DB.source): another release differs.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding = T.Ding
local D = Ding.Data

local function round2(v) return math.floor(v * 100 + 0.5) / 100 end

-- Points as sorted text: the order of spawns is not part of the contract.
local function points(list)
    local out = {}
    for _, p in ipairs(list or {}) do
        out[#out + 1] = ("%s@%s,%.2f,%.2f%s%s"):format(tostring(p.label), tostring(p.map), round2(p.x), round2(p.y),
            p.npc and ("#" .. p.npc) or "", p.area and "*" or "")
    end
    table.sort(out)
    return table.concat(out, ";")
end

local function show(v)
    if type(v) ~= "table" then return tostring(v) end
    local keys = {}
    for k in pairs(v) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local parts = {}
    for _, k in ipairs(keys) do parts[#parts + 1] = tostring(k) .. "=" .. show(v[k]) end
    return "{" .. table.concat(parts, ",") .. "}"
end

local function targets(list)
    local out = {}
    for i, t in ipairs(list) do out[i] = tostring(t.name) .. ":" .. points(t.points) end
    return table.concat(out, "|")
end

-- Every question Ding asks about a quest, as one text per backend.
local RACES = { { "Human" }, { "Orc" }, { "Dwarf" }, { "NightElf" }, { "Scourge" }, { "Tauren" }, { "Gnome" }, { "Troll" } }
local function questFacts(q)
    local single, group = D:QuestPrereqs(q)
    local races = {}
    for i, r in ipairs(RACES) do races[i] = D:QuestOpenToRaces(q, r) and "1" or "0" end
    return table.concat({
        tostring(D:QuestExists(q)), D:QuestName(q), D:QuestRequiredLevel(q), D:QuestLevel(q),
        show(single), show(group), tostring(D:QuestSourceItem(q)), table.concat(races),
        tostring(D:StarterName(q)), tostring(D:FinisherName(q)),
        points(D:StartPoints(q)), points(D:EndPoints(q)), targets(D:ObjectiveTargets(q)),
        show(D:ObjectiveItems(q)), show(D:ObjectiveNpcs(q)),
    }, "\n")
end

local function npcFacts(id)
    return table.concat({ tostring(D:NpcName(id)), show(D:NpcInfo(id)), tostring(D:NpcFriendly(id)),
        points(D:NpcPoints(id)) }, "\n")
end

-- Every id of a kind, except those DingDB's own corrections changed on purpose
-- (tools/data/corrections, Ding.DB.corrected): dingdb_corrections_test checks those.
local function ids(kind)
    local skip = {}
    for _, id in ipairs(Ding.DB.corrected and Ding.DB.corrected[kind] or {}) do skip[id] = true end
    local list = {}
    for id in pairs(Ding.DB[kind]) do
        if not skip[id] then list[#list + 1] = id end
    end
    table.sort(list)
    return list
end

-- Collects the facts of `list` with both backends and reports the first differences.
local function compare(list, facts)
    local before = {}
    T.ok(D:UseBackend("questiedb"), "QuestieDB backend")
    for _, id in ipairs(list) do before[id] = facts(id) end
    T.ok(D:UseBackend("ding"), "Ding/DB backend")
    local diffs = {}
    for _, id in ipairs(list) do
        local now = facts(id)
        if now ~= before[id] then
            -- Around the first character that differs.
            local a, b, at = before[id], now, 1
            while at <= #a and a:sub(at, at) == b:sub(at, at) do at = at + 1 end
            local from = math.max(1, at - 120)
            diffs[#diffs + 1] = ("%d (at %d):\n  QuestieDB …%s\n  Ding/DB   …%s"):format(id, at,
                a:sub(from, at + 120):gsub("\n", " / "), b:sub(from, at + 120):gsub("\n", " / "))
        end
    end
    T.eq(#diffs, 0, #diffs .. " differ, the first:\n" .. table.concat(diffs, "\n", 1, math.min(3, #diffs)) .. "\n")
end

T.test("Ding/DB is loaded and says where it comes from", function()
    T.ok(Ding.DB and Ding.DB.source:find("QuestieDB", 1, true), "Ding.DB.source")
    D:UseBackend()
    T.eq(D.backend, "ding", "Ding/DB comes first")
end)

T.test("every quest: names, levels, races, prerequisites, givers, objectives and their places", function()
    compare(ids("quests"), questFacts)
end)

T.test("every NPC: name, levels, rank, friendliness, spawns", function()
    compare(ids("npcs"), npcFacts)
end)

T.test("every object and item: names and places", function()
    compare(ids("objects"), function(id) return tostring(D:ObjectName(id)) .. "\n" .. points(D:ObjectPoints(id)) end)
    compare(ids("items"), function(id) return tostring(D:ItemName(id)) .. "\n" .. points(D:ItemSourcePoints(id)) end)
end)

T.test("services, flight masters, dungeon entrances and zones", function()
    local function services()
        local s = D:Services()
        local trainers = {}
        for class, list in pairs(s.trainer) do trainers[class] = list end
        local masters = {}
        for _, fm in ipairs(D:FlightMasters()) do
            masters[#masters + 1] = fm.npc .. ":" .. tostring(fm.name) .. ":" .. tostring(fm.friendly) .. ":" .. points(fm.points)
        end
        local areas, entrances = {}, {}
        for area in pairs(Ding.DB.zones.areaToUiMap) do areas[#areas + 1] = area end
        table.sort(areas)
        for _, area in ipairs(areas) do
            entrances[#entrances + 1] = area .. ">" .. tostring(D:UiMap(area)) .. ":" .. points(D:DungeonEntrances(area))
        end
        return table.concat({ show(s.vendor), show(s.repair), show(s.innkeeper), show(s.flight), show(trainers),
            table.concat(masters, "|"), table.concat(entrances, "|") }, "\n")
    end
    compare({ 0 }, services)
end)

T.test("Without QuestieDB, Ding still has its data", function()
    local saved = { _G.QuestDB, _G.NpcDB, _G.ItemDB, _G.ObjectDB, _G.LibQuestieDB }
    _G.QuestDB, _G.NpcDB, _G.ItemDB, _G.ObjectDB, _G.LibQuestieDB = nil, nil, nil, nil, nil
    local ok = D:UseBackend()
    _G.QuestDB, _G.NpcDB, _G.ItemDB, _G.ObjectDB, _G.LibQuestieDB = saved[1], saved[2], saved[3], saved[4], saved[5]
    T.ok(ok and D.backend == "ding", "Ding/DB alone")
    T.eq(D:QuestName(783), "A Threat Within")
    T.ok(#D:StartPoints(783) > 0, "the giver's place")
end)

T.run()
