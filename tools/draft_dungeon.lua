-- Drafts a guide of "Ding! - Dungeon quests" from the QuestieDB Forever export (with DingDB's
-- corrections): the quests of one dungeon for one side, the chains that lead to them, an order
-- that keeps the trips short, then the dungeon, then the turn-ins and what they open.
-- usage: lua5.1 tools/draft_dungeon.lua <combined dir> <dungeon> <Alliance|Horde> [options]
--   <dungeon>        its name ("The Deadmines") or AreaID (1581); --list prints them
--   --list           the dungeons the tool knows, with their quests per side
--   --level <n>      the level of the player the trips are timed for (default: the dungeon's
--                    lowest level)
--   --iterations <n> local search moves per tour (default 4000)
--
-- The draft is a starting point: the guides of Ding/Guides/Dungeons are finished by hand
-- (notes inside the dungeon, `why` lines, steps merged or moved), then checked with
-- tools/check_guides.lua. Comments in the draft name the NPCs, places, rewards and experience
-- the tool read, to write those notes; nothing from QuestieDB is meant to stay in the guide but
-- quest ids. Selection rules, in the order they apply:
--   1. a quest of the dungeon: filed under the dungeon (its zone, or one of the dungeon's other
--      AreaIDs), or with an objective found only inside it (monsters, objects, the monsters and
--      objects that drop its items);
--   2. open to the side (its races, and a giver friendly to that side), not repeatable, no
--      profession, reputation or holiday event, not a raid's (Molten Core, Onyxia, Blackwing
--      Lair, Zul'Gurub, Ahn'Qiraj, Naxxramas, the Upper Spire: `RAID_QUESTS` below), not one
--      of the level 60 armor-set chains (`SET_QUESTS`);
--   3. with the quests before it (prerequisites, breadcrumbs that lead to it, as optional), the
--      quests started inside by an item the dungeon drops, and the follow-ups given by the NPC
--      that takes it back (or by the item it gives).
-- The order: the trips before the dungeon (accept, outside objectives, prerequisites turned in)
-- form one path that ends at the entrance, the trips after it one path from the entrance; both
-- are the shortest found under the quests' rules (tools/route_travel.lua: walking, flight paths
-- from level 14, boats and zeppelins, mounted from level 40).
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local X = dofile(here .. "/questiedb_export.lua")
local RouteData = dofile(here .. "/route_data.lua")
local Travel = dofile(here .. "/route_travel.lua")
local QK = X.QUEST

local COMBINED, NAME, SIDE, LIST, LEVEL, ITERATIONS
do
    local pos = {}
    local i = 1
    while i <= #arg do
        local a = arg[i]
        if a == "--list" then
            LIST = true
        elseif a == "--level" then
            i = i + 1
            LEVEL = tonumber(arg[i])
        elseif a == "--iterations" then
            i = i + 1
            ITERATIONS = tonumber(arg[i])
        else
            pos[#pos + 1] = a
        end
        i = i + 1
    end
    COMBINED, NAME, SIDE = pos[1], pos[2], pos[3]
end
if not COMBINED or (not LIST and not (NAME and (SIDE == "Alliance" or SIDE == "Horde"))) then
    io.stderr:write("usage: lua5.1 tools/draft_dungeon.lua <combined dir> <dungeon> <Alliance|Horde> [--level n]\n"
        .. "       lua5.1 tools/draft_dungeon.lua <combined dir> --list\n")
    os.exit(2)
end
ITERATIONS = ITERATIONS or 4000

-- The dungeons: their AreaIDs (the instance first, then the other ids QuestieDB files their
-- quests or spawns under) and the levels the game recommends for them. Our own list, from the
-- game; Forever's own dungeons take the levels of their quests.
local DUNGEONS = {
    { name = "Ragefire Chasm", key = "ragefire", areas = { 2437 }, levels = { 13, 18 } },
    { name = "Wailing Caverns", key = "wailing", areas = { 718 }, levels = { 17, 24 } },
    { name = "The Deadmines", key = "deadmines", areas = { 1581, 10029 }, levels = { 17, 26 } },
    { name = "The Hall of Thanes", key = "thanes", areas = { 16919 }, levels = { 13, 18 } },
    { name = "Ruins of Lordaeron", key = "lordaeron", areas = { 16611 }, levels = { 18, 24 } },
    { name = "Shadowfang Keep", key = "shadowfang", areas = { 209, 10014, 10015, 10016, 10017, 10018, 10019 }, levels = { 22, 30 } },
    { name = "Blackfathom Deeps", key = "blackfathom", areas = { 719, 10020, 10021 }, levels = { 24, 32 } },
    { name = "The Stockade", key = "stockade", areas = { 717 }, levels = { 24, 32 } },
    { name = "Excavation Site: Wetlands", key = "excavation", areas = { 16732 }, levels = { 25, 31 } },
    { name = "Gnomeregan", key = "gnomeregan", areas = { 721, 133, 10030, 10031, 10032 }, levels = { 29, 38 } },
    { name = "Razorfen Kraul", key = "kraul", areas = { 491, 1717 }, levels = { 29, 38 } },
    { name = "City of Dalaran", key = "dalaran", areas = { 16544 }, levels = { 30, 36 } },
    { name = "Scarlet Monastery", key = "scarlet", areas = { 796, 6109, 6386, 10008, 10009, 10010 }, levels = { 34, 45 } },
    { name = "Razorfen Downs", key = "downs", areas = { 722 }, levels = { 37, 46 } },
    { name = "Uldaman", key = "uldaman", areas = { 1337, 1517, 10033 }, levels = { 41, 51 } },
    { name = "Zul'Farrak", key = "zulfarrak", areas = { 1176, 978 }, levels = { 44, 54 } },
    { name = "Maraudon", key = "maraudon", areas = { 2100, 10000 }, levels = { 46, 55 } },
    { name = "The Temple of Atal'Hakkar", key = "sunken", areas = { 1477, 1417 }, levels = { 50, 60 } },
    { name = "Blackrock Depths", key = "depths", areas = { 1584, 1585 }, levels = { 52, 60 } },
    { name = "Blackrock Spire", key = "spire", areas = { 1583, 10003, 10004, 10005, 10006, 10007 }, levels = { 55, 60 } },
    { name = "Dire Maul", key = "diremaul", areas = { 2557, 10022, 10023, 10024, 10025, 10026, 10027 }, levels = { 55, 60 } },
    { name = "Scholomance", key = "scholomance", areas = { 2057, 10011, 10012, 10013 }, levels = { 58, 60 } },
    { name = "Stratholme", key = "stratholme", areas = { 2017, 10001 }, levels = { 58, 60 } },
}
local AREA = {}
for _, d in ipairs(DUNGEONS) do
    for _, a in ipairs(d.areas) do AREA[a] = d end
end

-- Quests of raids and of their attunements, the Upper Spire's (a raid of ten in the original
-- game) and the level 60 armor sets: never in a dungeon guide. Our own lists, by quest id.
local RAID_QUESTS = {
    -- Upper Blackrock Spire (the Rookery, the eggs, Gyth's chromatic armor, Rend, Drakkisath)
    -- and Onyxia's attunement; the Blackhand's Command (Blackwing Lair)
    [4734] = true, [4735] = true, [4907] = true, [4974] = true, [4941] = true,
    [5089] = true, [5102] = true, [6502] = true, [6602] = true, [6569] = true, [7761] = true,
    [6821] = true, [5160] = true, [5047] = true, [4764] = true, [4765] = true, [4766] = true,
    [5161] = true, [5162] = true, [5164] = true, [5166] = true, [5167] = true, [4768] = true,
    [4769] = true, [6402] = true, [6403] = true, [6501] = true,
    -- Molten Core's attunement, Thorium Brotherhood contracts
    [7848] = true, [7604] = true,
    -- Quel'Serrar (Onyxia)
    [7507] = true, [7508] = true,
}
-- Level 60 chains for the dungeon armor sets (the "Dungeon Set 2" upgrade, Lord Valthalak's
-- amulet), Dire Maul's class books and the Lorekeeper's librams: long, with raids or gold.
local SET_RANGES = { { 8900, 9025 }, { 7498, 7506 }, { 7481, 7485 } }
local function setQuest(q)
    for _, r in ipairs(SET_RANGES) do
        if q >= r[1] and q <= r[2] then return true end
    end
    return false
end

---------------------------------------------------------------------------
-- Data
---------------------------------------------------------------------------
local db = X.loadCorrected(COMBINED, here .. "/data/corrections")
local D = RouteData.new(db, COMBINED)

-- DingDB's dungeon entrances (Ding/DB/Zones.lua, Forever coordinates).
local ENTRANCES
do
    local chunk = assert(loadfile(root .. "/Ding/DB/Zones.lua"))
    local zones = { areaToUiMap = {}, dungeons = {}, dungeonsHorde = {}, dungeonNames = {} }
    chunk(nil, { DB = { zones = zones } })
    ENTRANCES = zones.dungeons
end

local function quest(q) return db.Quest[q] end
local function questName(q) return quest(q) and quest(q)[QK.name] or ("quest " .. q) end
local function npcName(id) local n = db.Npc[id]; return n and n[1] or ("npc " .. id) end
local function objectName(id) local o = db.Object[id]; return o and o[1] or ("object " .. id) end
local function itemName(id) local i = db.Item[id]; return i and i[1] or ("item " .. id) end

local SIDE_RACES = {
    Alliance = { "Human", "Dwarf", "NightElf", "Gnome" },
    Horde = { "Orc", "Scourge", "Tauren", "Troll" },
}
-- Races of the side the quest is open to: nil for all of them (Skyborne of that side
-- included), else the list; false when none.
local function sideRaces(q, side)
    local mask = quest(q)[QK.requiredRaces] or 0
    if mask == 0 then return nil end
    local out = {}
    for _, race in ipairs(SIDE_RACES[side]) do
        if X.hasBit(mask, X.RACE_BITS[race]) then out[#out + 1] = race end
    end
    local sky = X.RACE_FACTION_BITS.Skyborne[side]
    local skyOK = X.hasBit(mask, sky)
    if #out == #SIDE_RACES[side] and skyOK then return nil end
    if skyOK then out[#out + 1] = "Skyborne" end
    if #out == 0 then return false end
    return out
end
local function sideClasses(q, side)
    local mask = quest(q)[QK.requiredClasses] or 0
    local sort = quest(q)[QK.zoneOrSort] or 0
    if mask == 0 then
        local class = X.CLASS_SORTS[sort] or D.trainerClass(quest(q))
        if class then return { class } end
        return nil
    end
    local list = X.classesAllowed(mask, side)
    if #list == #X.FACTION_CLASSES[side] then return nil end
    if #list == 0 then return false end
    return list
end
local FACTION_CODE = { Alliance = "A", Horde = "H" }
-- A giver or ender NPC the side may talk to (an object or an item always).
local function friendly(npcId, side)
    local n = db.Npc[npcId]
    local f = n and n[13]
    return f == nil or f == "AH" or f == FACTION_CODE[side]
end
local function givenTo(q, side)
    local givers = quest(q)[QK.startedBy] or {}
    local npcs = givers[1] or {}
    if #npcs == 0 then return true end
    for _, id in ipairs(npcs) do
        if friendly(id, side) then return true end
    end
    return false
end
local function openTo(q, side)
    if not quest(q) then return false end
    return sideRaces(q, side) ~= false and sideClasses(q, side) ~= false and givenTo(q, side)
end

-- Why a quest is left out of every guide, or nil.
local function leftOutRule(q)
    local qq = quest(q)
    if RAID_QUESTS[q] then return "raid" end
    if setQuest(q) then return "armor set / books" end
    if (qq[QK.specialFlags] or 0) % 2 == 1 then return "repeatable" end
    if qq[QK.requiredSkill] then return "profession" end
    if qq[QK.requiredMinRep] then return "reputation" end
    local sort = qq[QK.zoneOrSort] or 0
    if sort < 0 and not X.CLASS_SORTS[sort] then return "category " .. sort end
    if sort == 1377 then return "Silithus war effort" end
    return nil
end

---------------------------------------------------------------------------
-- Where things are
---------------------------------------------------------------------------
-- Spawn areas of a spawns table: inside (all in the dungeon's areas), outside, or none.
local function placeOf(spawns, dungeon)
    local inside, outside = false, false
    for area in pairs(type(spawns) == "table" and spawns or {}) do
        if dungeon.set[area] then inside = true else outside = true end
    end
    if outside then return "outside" end
    if inside then return "inside" end
    return nil
end
local function npcSpawns(id) local n = db.Npc[id]; return n and n[X.NPC.spawns] end
local function objectSpawns(id) local o = db.Object[id]; return o and o[X.OBJECT.spawns] end

-- The objective sources of a quest: { { kind, id, place, label } }.
local function objectiveSources(q, dungeon)
    local o = quest(q)[QK.objectives] or {}
    local out = {}
    for _, e in ipairs(o[1] or {}) do
        out[#out + 1] = { kind = "npc", id = e[1], place = placeOf(npcSpawns(e[1]), dungeon), label = "kill " .. npcName(e[1]) }
    end
    for _, e in ipairs(o[2] or {}) do
        out[#out + 1] = { kind = "object", id = e[1], place = placeOf(objectSpawns(e[1]), dungeon), label = "use " .. objectName(e[1]) }
    end
    for _, e in ipairs(o[3] or {}) do
        local item = db.Item[e[1]] or {}
        local srcs = {}
        local place
        for _, id in ipairs(item[X.ITEM.npcDrops] or {}) do
            local p = placeOf(npcSpawns(id), dungeon)
            srcs[#srcs + 1] = npcName(id) .. "#" .. id .. (p == "inside" and "(in)" or "")
            if p == "outside" then place = "outside" elseif p == "inside" and place ~= "outside" then place = "inside" end
        end
        for _, id in ipairs(item[X.ITEM.objectDrops] or {}) do
            local p = placeOf(objectSpawns(id), dungeon)
            srcs[#srcs + 1] = objectName(id) .. "#o" .. id .. (p == "inside" and "(in)" or "")
            if p == "outside" then place = "outside" elseif p == "inside" and place ~= "outside" then place = "inside" end
        end
        out[#out + 1] = { kind = "item", id = e[1], place = place, label = "item " .. itemName(e[1]) .. "#" .. e[1]
            .. (#srcs > 0 and (" from " .. table.concat(srcs, ", ", 1, math.min(4, #srcs)) .. (#srcs > 4 and (" +" .. (#srcs - 4)) or "")) or "") }
    end
    for _, e in ipairs(o[5] or {}) do
        local place
        for _, id in ipairs(e[1] or {}) do
            local p = placeOf(npcSpawns(id), dungeon)
            if p == "outside" then place = "outside" elseif p == "inside" and place ~= "outside" then place = "inside" end
        end
        out[#out + 1] = { kind = "credit", id = e[2], place = place, label = "credit " .. tostring(e[3] or e[2]) }
    end
    local trig = quest(q)[QK.triggerEnd]
    if type(trig) == "table" and type(trig[2]) == "table" then
        out[#out + 1] = { kind = "area", place = placeOf(trig[2], dungeon), label = "reach " .. tostring(trig[1]) }
    end
    return out
end

-- A quest done inside the dungeon: one objective source at least found only inside, or a
-- quest filed under the dungeon whose objectives have no place outside.
local function doneInside(q, dungeon)
    local sources = objectiveSources(q, dungeon)
    for _, s in ipairs(sources) do
        if s.place == "inside" then return true end
    end
    if dungeon.set[quest(q)[QK.zoneOrSort] or 0] and #sources > 0 then
        for _, s in ipairs(sources) do
            if s.place == "outside" then return false end
        end
        return true
    end
    return false
end

-- Points of the givers or enders of a quest (NPCs and objects): the world points, and
-- whether one of them stands inside the dungeon.
local function standPoints(v, dungeon)
    v = v or {}
    local pts, inside = {}, false
    for _, id in ipairs(v[1] or {}) do
        if placeOf(npcSpawns(id), dungeon) == "inside" or (db.Npc[id] and not npcSpawns(id) and AREA[(db.Npc[id] or {})[9] or 0] == dungeon) then
            inside = true
        end
        for _, p in ipairs(D.npcPoints(id)) do pts[#pts + 1] = p end
    end
    for _, id in ipairs(v[2] or {}) do
        if placeOf(objectSpawns(id), dungeon) == "inside" then inside = true end
        for _, p in ipairs(D.objectPoints(id)) do pts[#pts + 1] = p end
    end
    return pts, inside
end
local function whoLabel(v)
    v = v or {}
    local parts = {}
    for _, id in ipairs(v[1] or {}) do parts[#parts + 1] = npcName(id) end
    for _, id in ipairs(v[2] or {}) do parts[#parts + 1] = objectName(id) end
    for _, id in ipairs(v[3] or {}) do parts[#parts + 1] = "item " .. itemName(id) end
    return table.concat(parts, " / ")
end
local function pointLabel(p)
    if not p then return "?" end
    return ("%d %.1f, %.1f"):format(p.map, p.px, p.py)
end

---------------------------------------------------------------------------
-- Selection
---------------------------------------------------------------------------
local function dungeonByArg(text)
    local id = tonumber(text)
    for _, d in ipairs(DUNGEONS) do
        if d.name == text or d.key == text or (id and d.areas[1] == id) then return d end
    end
    return nil
end
for _, d in ipairs(DUNGEONS) do
    d.set = {}
    for _, a in ipairs(d.areas) do d.set[a] = true end
end

-- The quests of a dungeon (rule 1), sorted.
local function dungeonQuests(dungeon)
    local out = {}
    for q, qq in pairs(db.Quest) do
        if dungeon.set[qq[QK.zoneOrSort] or 0] or doneInside(q, dungeon) then out[#out + 1] = q end
    end
    table.sort(out)
    return out
end

-- Quests started by an item dropped inside the dungeon.
local function startedInside(dungeon)
    local out = {}
    for q, qq in pairs(db.Quest) do
        local items = (qq[QK.startedBy] or {})[3] or {}
        for _, it in ipairs(items) do
            local item = db.Item[it]
            local inside = false
            for _, id in ipairs(item and item[X.ITEM.npcDrops] or {}) do
                if placeOf(npcSpawns(id), dungeon) == "inside" then inside = true end
            end
            for _, id in ipairs(item and item[X.ITEM.objectDrops] or {}) do
                if placeOf(objectSpawns(id), dungeon) == "inside" then inside = true end
            end
            if inside then out[q] = it end
        end
    end
    return out
end

local function prereqs(q)
    local qq = quest(q)
    local single, group = {}, {}
    for _, p in ipairs(qq[QK.preQuestSingle] or {}) do
        if p ~= q then single[#single + 1] = p end
    end
    for _, p in ipairs(qq[QK.preQuestGroup] or {}) do group[#group + 1] = p end
    return single, group
end

-- Every quest whose prerequisites name q.
local followers = {}
for q, qq in pairs(db.Quest) do
    for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
        for _, p in ipairs(qq[key] or {}) do
            if p ~= q then
                followers[p] = followers[p] or {}
                table.insert(followers[p], q)
            end
        end
    end
end
for _, list in pairs(followers) do table.sort(list) end
local breadcrumbsOf = {}
for q, qq in pairs(db.Quest) do
    local target = qq[QK.breadcrumbForQuestId]
    if type(target) == "number" and target ~= 0 then
        breadcrumbsOf[target] = breadcrumbsOf[target] or {}
        table.insert(breadcrumbsOf[target], q)
    end
end
for _, list in pairs(breadcrumbsOf) do table.sort(list) end

local function select(dungeon, side)
    local chosen, why, notes, leftOut = {}, {}, {}, {}
    local order = {}
    local function add(q, reason)
        if chosen[q] then return false end
        chosen[q] = reason
        order[#order + 1] = q
        return true
    end
    local core = {}
    for _, q in ipairs(dungeonQuests(dungeon)) do
        local rule = leftOutRule(q)
        if not openTo(q, side) then
            -- the other side's
        elseif rule then
            leftOut[#leftOut + 1] = { q = q, why = rule }
        else
            core[#core + 1] = q
        end
    end
    local inside = startedInside(dungeon)
    for q, item in pairs(inside) do
        if openTo(q, side) and not leftOutRule(q) then
            local found = false
            for _, c in ipairs(core) do found = found or c == q end
            if not found then core[#core + 1] = q end
        end
    end
    table.sort(core)
    -- A class quest at the end of a longer class chain, or that also needs another dungeon,
    -- stays with Ding! - Class quests, which leads that chain from its start.
    local function chainSize(q, seen)
        seen = seen or {}
        if seen[q] then return 0 end
        seen[q] = true
        local n = 1
        local single, group = prereqs(q)
        for _, p in ipairs(group) do if quest(p) then n = n + chainSize(p, seen) end end
        if single[1] and quest(single[1]) then n = n + chainSize(single[1], seen) end
        return n
    end
    local function otherDungeon(q)
        for _, d in ipairs(DUNGEONS) do
            if d ~= dungeon and doneInside(q, d) then return d.name end
        end
    end
    for k = #core, 1, -1 do
        local q = core[k]
        if sideClasses(q, side) then
            local size, other = chainSize(q), otherDungeon(q)
            if size > 2 or other then
                leftOut[#leftOut + 1] = { q = q, why = ("class chain of %d quests%s: Ding! - Class quests"):format(size,
                    other and (", also in " .. other) or "") }
                table.remove(core, k)
            end
        end
    end
    for _, q in ipairs(core) do add(q, "dungeon") end

    -- Prerequisites and breadcrumbs, recursively.
    local i = 1
    while i <= #order do
        local q = order[i]
        local single, group = prereqs(q)
        for _, p in ipairs(group) do
            if quest(p) and openTo(p, side) and not leftOutRule(p) then
                add(p, "before " .. q)
            elseif quest(p) and openTo(p, side) then
                notes[#notes + 1] = ("%d %s needs %d %s (%s)"):format(q, questName(q), p, questName(p), leftOutRule(p))
            end
        end
        if #single > 0 then
            local pick
            for _, p in ipairs(single) do
                if chosen[p] then pick = p end
            end
            if not pick then
                for _, p in ipairs(single) do
                    if not pick and quest(p) and openTo(p, side) and not leftOutRule(p) then pick = p end
                end
            end
            if pick then
                add(pick, "before " .. q)
            else
                notes[#notes + 1] = ("%d %s needs one of %s: none open to %s"):format(q, questName(q), table.concat(single, ","), side)
            end
        end
        for _, b in ipairs(chosen[q] == "dungeon" and breadcrumbsOf[q] or {}) do
            if openTo(b, side) and not leftOutRule(b) and add(b, "breadcrumb " .. q) then
                why[b] = "breadcrumb"
            end
        end
        i = i + 1
    end
    -- Follow-ups given by the ender (or by an item the quest leaves), recursively; not into
    -- another dungeon or a raid.
    i = 1
    while i <= #order do
        local q = order[i]
        local fromCore = chosen[q] == "dungeon" or chosen[q]:sub(1, 6) == "after "
        local enders = fromCore and (quest(q)[QK.finishedBy] or {})[1] or {}
        local enderSet = {}
        for _, id in ipairs(enders) do enderSet[id] = true end
        for _, f in ipairs(fromCore and followers[q] or {}) do
            local ff = quest(f)
            local givers = (ff[QK.startedBy] or {})[1] or {}
            local byEnder = false
            for _, id in ipairs(givers) do byEnder = byEnder or enderSet[id] end
            local byItem = #(((ff[QK.startedBy] or {})[3]) or {}) > 0
            local other
            for _, d in ipairs(DUNGEONS) do
                if d ~= dungeon and (d.set[ff[QK.zoneOrSort] or 0] or doneInside(f, d)) then other = d.name end
            end
            if (byEnder or byItem) and openTo(f, side) then
                local rule = leftOutRule(f)
                if rule then
                    notes[#notes + 1] = ("follow-up %d %s of %d left out: %s"):format(f, questName(f), q, rule)
                elseif other then
                    notes[#notes + 1] = ("follow-up %d %s of %d leads into %s"):format(f, questName(f), q, other)
                elseif not chosen[f] then
                    -- every other prerequisite of a group must be in the guide too
                    local _, group = prereqs(f)
                    local ok = true
                    for _, p in ipairs(group) do ok = ok and (chosen[p] ~= nil or p == q) end
                    if ok then add(f, "after " .. q) else
                        notes[#notes + 1] = ("follow-up %d %s of %d needs %s too"):format(f, questName(f), q, table.concat(group, "+"))
                    end
                end
            end
        end
        i = i + 1
    end
    return order, chosen, why, notes, leftOut, inside
end

---------------------------------------------------------------------------
-- Actions and tours
---------------------------------------------------------------------------
local function centroidOf(points)
    if #points == 0 then return nil end
    -- the point with the most others within 300 yards: the heart of the spawns
    local best, bestN
    for i = 1, #points, math.max(1, math.floor(#points / 60)) do
        local n = 0
        for j = 1, #points do
            local d = D.dist(points[i], points[j])
            if d and d < 300 then n = n + 1 end
        end
        if not bestN or n > bestN then best, bestN = points[i], n end
    end
    return best
end

local function objectivePoints(q, dungeon)
    local pts = {}
    for _, s in ipairs(objectiveSources(q, dungeon)) do
        if s.kind == "npc" then
            for _, p in ipairs(D.npcPoints(s.id)) do pts[#pts + 1] = p end
        elseif s.kind == "object" then
            for _, p in ipairs(D.objectPoints(s.id)) do pts[#pts + 1] = p end
        elseif s.kind == "item" then
            local item = db.Item[s.id] or {}
            for _, id in ipairs(item[X.ITEM.npcDrops] or {}) do
                for _, p in ipairs(D.npcPoints(id)) do pts[#pts + 1] = p end
            end
            for _, id in ipairs(item[X.ITEM.objectDrops] or {}) do
                for _, p in ipairs(D.objectPoints(id)) do pts[#pts + 1] = p end
            end
        end
    end
    local trig = quest(q)[QK.triggerEnd]
    if type(trig) == "table" and type(trig[2]) == "table" then
        for _, p in ipairs(D.spawnPoints(trig[2])) do pts[#pts + 1] = p end
    end
    return pts
end

-- Builds the actions of the chosen quests: { kind, q, at (point), inside, label }.
local function actions(order, chosen, dungeon, insideStart, entrance)
    local list = {}
    for _, q in ipairs(order) do
        local qq = quest(q)
        local gp, gin = standPoints(qq[QK.startedBy], dungeon)
        local accept = { kind = "accept", q = q, label = whoLabel(qq[QK.startedBy]) }
        if insideStart[q] or (#gp == 0 and gin) or gin then
            accept.inside = true
        elseif #gp > 0 then
            accept.at = centroidOf(gp)
        else
            -- an item from outside: picked with the objectives of another quest
            accept.loose = true
        end
        list[#list + 1] = accept
        if X.hasObjectives(qq) then
            local done = { kind = "complete", q = q }
            if doneInside(q, dungeon) then
                done.inside = true
            else
                done.at = centroidOf(objectivePoints(q, dungeon))
                if not done.at then done.loose = true end
            end
            local labels = {}
            for _, s in ipairs(objectiveSources(q, dungeon)) do labels[#labels + 1] = s.label .. (s.place == "inside" and " [inside]" or "") end
            done.label = table.concat(labels, "; ")
            list[#list + 1] = done
        end
        local ep, ein = standPoints(qq[QK.finishedBy], dungeon)
        local turnin = { kind = "turnin", q = q, label = whoLabel(qq[QK.finishedBy]) }
        if ein then turnin.inside = true elseif #ep > 0 then turnin.at = centroidOf(ep) else turnin.loose = true end
        list[#list + 1] = turnin
    end
    for _, a in ipairs(list) do
        if a.inside then a.at = entrance end
    end
    return list
end

-- Precedence: accept < complete < turnin of a quest; a prerequisite's turn-in before the
-- quest's accept.
local function mustPrecede(a, b, chosen)
    if a.q == b.q then
        local rank = { accept = 1, complete = 2, turnin = 3 }
        return rank[a.kind] < rank[b.kind]
    end
    if a.kind == "turnin" and b.kind == "accept" then
        local single, group = prereqs(b.q)
        for _, p in ipairs(single) do if p == a.q then return true end end
        for _, p in ipairs(group) do if p == a.q then return true end end
        -- a breadcrumb is turned in before the quest it leads to is taken
        if quest(a.q)[QK.breadcrumbForQuestId] == b.q then return true end
    end
    return false
end

local function feasible(seq, chosen)
    for i = 1, #seq do
        for j = i + 1, #seq do
            if mustPrecede(seq[j], seq[i], chosen) then return false end
        end
    end
    return true
end

-- Total seconds of a sequence of actions from `start` (or its first action) to `finish`.
local function tourCost(net, seq, level, start, finish)
    local t, prev = 0, start
    for _, a in ipairs(seq) do
        if a.at then
            if prev then t = t + net:travel(prev, a.at, level) end
            prev = a.at
        end
    end
    if finish and prev then t = t + net:travel(prev, finish, level) end
    return t
end

-- A deterministic pseudo-random generator (the drafts stay the same from one run to the next).
local seed = 12345
local function rand(n)
    seed = (seed * 1103515245 + 12345) % 2147483648
    return math.floor(seed / 2147483648 * n) + 1
end

local function improve(net, seq, level, start, finish, chosen)
    local best = tourCost(net, seq, level, start, finish)
    local n = #seq
    if n < 2 then return seq, best end
    for _ = 1, ITERATIONS do
        local cand = {}
        for k = 1, n do cand[k] = seq[k] end
        local i, j = rand(n), rand(n)
        if i ~= j then
            if rand(2) == 1 then
                -- move one action
                local a = table.remove(cand, i)
                table.insert(cand, j, a)
            else
                -- reverse a segment
                if i > j then i, j = j, i end
                while i < j do
                    cand[i], cand[j] = cand[j], cand[i]
                    i, j = i + 1, j - 1
                end
            end
            if feasible(cand, chosen) then
                local c = tourCost(net, cand, level, start, finish)
                if c < best - 0.5 then seq, best = cand, c end
            end
        end
    end
    return seq, best
end

-- A first order: nearest feasible action first.
local function greedy(net, list, level, start, chosen)
    local left, seq, at = {}, {}, start
    for _, a in ipairs(list) do left[#left + 1] = a end
    while #left > 0 do
        local bestI, bestT
        for i, a in ipairs(left) do
            local ready = true
            for _, b in ipairs(left) do
                if b ~= a and mustPrecede(b, a, chosen) then ready = false end
            end
            if ready then
                local t = (at and a.at) and net:travel(at, a.at, level) or 0
                if not bestT or t < bestT then bestI, bestT = i, t end
            end
        end
        if not bestI then bestI = 1 end
        local a = table.remove(left, bestI)
        seq[#seq + 1] = a
        if a.at then at = a.at end
    end
    return seq
end

---------------------------------------------------------------------------
-- Rewards and experience, for the comments
---------------------------------------------------------------------------
local rewardsOf = {}
for id, item in pairs(db.Item) do
    for _, q in ipairs(item[X.ITEM.questRewards] or {}) do
        rewardsOf[q] = rewardsOf[q] or {}
        table.insert(rewardsOf[q], id)
    end
end
local ITEM_CLASS = { [2] = "weapon", [4] = "armor" }
local ARMOR = { [1] = "cloth", [2] = "leather", [3] = "mail", [4] = "plate", [6] = "shield" }
local function rewardLabel(q)
    local out = {}
    for _, id in ipairs(rewardsOf[q] or {}) do
        local item = db.Item[id]
        local class, sub = item[12], item[13]
        local kind = ITEM_CLASS[class] or ("class " .. tostring(class))
        if class == 4 and ARMOR[sub] then kind = ARMOR[sub] end
        out[#out + 1] = itemName(id) .. " (" .. kind .. ")"
    end
    table.sort(out)
    return table.concat(out, ", ")
end

---------------------------------------------------------------------------
-- --list
---------------------------------------------------------------------------
if LIST then
    for _, d in ipairs(DUNGEONS) do
        local counts = {}
        for _, side in ipairs({ "Alliance", "Horde" }) do
            local order, chosen = select(d, side)
            local core = 0
            for _, q in ipairs(order) do if chosen[q] == "dungeon" then core = core + 1 end end
            counts[#counts + 1] = ("%s %d (+%d)"):format(side, core, #order - core)
        end
        print(("%-28s %-6d %2d-%2d  %s"):format(d.name, d.areas[1], d.levels[1], d.levels[2], table.concat(counts, ", ")))
    end
    os.exit(0)
end

---------------------------------------------------------------------------
-- The draft
---------------------------------------------------------------------------
local dungeon = dungeonByArg(NAME)
if not dungeon then
    io.stderr:write("unknown dungeon: " .. NAME .. " (--list names them)\n")
    os.exit(2)
end
local level = LEVEL or dungeon.levels[1]
local entranceList = (dungeon.areas[1] and ENTRANCES[dungeon.areas[1]]) or {}
local entranceAt = entranceList[1] and D.point(entranceList[1][1], entranceList[1][2], entranceList[1][3])
local net = Travel.new(D, SIDE)
local order, chosen, whyOf, notes, leftOut, insideStart = select(dungeon, SIDE)
local list = actions(order, chosen, dungeon, insideStart, entranceAt)

-- Before the dungeon: the accepts whose prerequisites are turned in before it, the outside
-- objectives of those quests, and the turn-ins that open another quest of the guide taken
-- before it. Inside: what the dungeon holds. After: every other turn-in, and what they open.
local hasInside, acceptInside = {}, {}
for _, a in ipairs(list) do
    if a.inside and a.kind ~= "turnin" then hasInside[a.q] = true end
    if a.inside and a.kind == "accept" then acceptInside[a.q] = true end
end
local opensBefore = {}
local acceptBefore = {}
local function prereqList(q)
    local single, group = prereqs(q)
    local out = {}
    for _, p in ipairs(single) do if chosen[p] then out[#out + 1] = p end end
    for _, p in ipairs(group) do if chosen[p] then out[#out + 1] = p end end
    return out
end
-- turnin(p) before <=> p needs nothing inside, its accept is before, and it opens a quest of
-- the guide; accept(q) before <=> every prerequisite is turned in before.
local turninBefore = {}
local changed = true
-- The largest such plan: everything starts before, and moves after while a rule says so.
for _, q in ipairs(order) do acceptBefore[q], turninBefore[q] = true, not hasInside[q] end
while changed do
    changed = false
    for _, q in ipairs(order) do
        local ok = not acceptInside[q]
        for _, p in ipairs(prereqList(q)) do ok = ok and turninBefore[p] end
        if acceptBefore[q] ~= ok then acceptBefore[q], changed = ok, true end
        local opens = false
        for _, f in ipairs(followers[q] or {}) do
            if chosen[f] and acceptBefore[f] then opens = true end
        end
        local tb = opens and acceptBefore[q] and not hasInside[q]
        if turninBefore[q] ~= tb then turninBefore[q], changed = tb, true end
    end
end
local before, inside, after = {}, {}, {}
for _, a in ipairs(list) do
    if a.inside then
        inside[#inside + 1] = a
    elseif a.kind == "turnin" then
        table.insert(turninBefore[a.q] and before or after, a)
    else
        table.insert(acceptBefore[a.q] and before or after, a)
    end
end

local function sorted(seq, start, finish)
    local s = greedy(net, seq, level, start, chosen)
    return improve(net, s, level, start, finish, chosen)
end
local beforeSeq, beforeT = sorted(before, nil, entranceAt)
-- inside: accept first (item starts), then by quest level, turn-ins inside last
table.sort(inside, function(a, b)
    local rank = { accept = 1, complete = 2, turnin = 3 }
    if rank[a.kind] ~= rank[b.kind] then return rank[a.kind] < rank[b.kind] end
    local la, lb = quest(a.q)[QK.questLevel] or 0, quest(b.q)[QK.questLevel] or 0
    if la ~= lb then return la < lb end
    return a.q < b.q
end)
local afterSeq, afterT = sorted(after, entranceAt, nil)

---------------------------------------------------------------------------
-- Writing
---------------------------------------------------------------------------
local out = {}
local function w(s) out[#out + 1] = s end
local sideKey = SIDE:lower()
local stepOf = {}

local function restrictions(q)
    local parts = {}
    local races = sideRaces(q, SIDE)
    if races then parts[#parts + 1] = ('races = { "%s" }'):format(table.concat(races, '", "')) end
    local classes = sideClasses(q, SIDE)
    if classes then parts[#parts + 1] = ('classes = { "%s" }'):format(table.concat(classes, '", "')) end
    return parts
end

-- Groups consecutive actions on the same spot (40 yards) into steps.
local function emit(seq, header)
    w("        -- " .. header)
    local i = 1
    while i <= #seq do
        -- A step runs its turn-ins, then its accepts: a turn-in after an accept starts a new one.
        local group = { seq[i] }
        local accepted = seq[i].kind == "accept"
        local j = i + 1
        while j <= #seq and seq[j].at and seq[i].at and D.dist(seq[i].at, seq[j].at) and D.dist(seq[i].at, seq[j].at) < 40
            and seq[j].kind ~= "complete" and seq[i].kind ~= "complete" and not (accepted and seq[j].kind == "turnin") do
            group[#group + 1] = seq[j]
            accepted = accepted or seq[j].kind == "accept"
            j = j + 1
        end
        local keys = { turnin = {}, accept = {}, complete = {} }
        local comments, restr = {}, {}
        for _, a in ipairs(group) do
            table.insert(keys[a.kind], a.q)
            comments[#comments + 1] = ("%s %d %s (L%d): %s @ %s%s"):format(a.kind, a.q, questName(a.q),
                quest(a.q)[QK.questLevel] or 0, a.label or "", a.inside and "inside" or pointLabel(a.at),
                chosen[a.q] ~= "dungeon" and (" [" .. chosen[a.q] .. "]") or "")
            for _, r in ipairs(restrictions(a.q)) do restr[r] = true end
        end
        local parts = {}
        for _, k in ipairs({ "turnin", "accept", "complete" }) do
            if #keys[k] == 1 then
                parts[#parts + 1] = ("%s = %d"):format(k, keys[k][1])
            elseif #keys[k] > 1 then
                parts[#parts + 1] = ("%s = { %s }"):format(k, table.concat(keys[k], ", "))
            end
        end
        for r in pairs(restr) do parts[#parts + 1] = r end
        for _, a in ipairs(group) do
            if whyOf[a.q] == "breadcrumb" then parts[#parts + 1] = "optional = true"; break end
        end
        for _, c in ipairs(comments) do w("        -- " .. c) end
        w("        { " .. table.concat(parts, ", ") .. " },")
        i = j
    end
end

w(("-- %s, %s, \"Ding! - Dungeon quests\" (draft of tools/draft_dungeon.lua)."):format(dungeon.name, SIDE))
w("Ding.RegisterGuide({")
w(('    id       = "dungeon-%s-%s",'):format(sideKey, dungeon.key))
w('    pack     = "ding-dungeons",')
w(('    title    = "%s (%d-%d)",'):format(dungeon.name, dungeon.levels[1], dungeon.levels[2]))
w(('    faction  = "%s",'):format(SIDE))
w(("    minLevel = %d, maxLevel = %d,"):format(dungeon.levels[1], dungeon.levels[2]))
w("    steps    = {")
emit(beforeSeq, ("Before the dungeon (about %d min of trips at level %d)"):format(math.floor(beforeT / 60 + 0.5), level))
if entranceAt then
    w(("        { go = { %d, %.2f, %.2f }, text = \"Enter %s\" },"):format(entranceList[1][1], entranceList[1][2], entranceList[1][3], dungeon.name))
end
emit(inside, "Inside")
emit(afterSeq, ("After the dungeon (about %d min of trips)"):format(math.floor(afterT / 60 + 0.5)))
w("    },")
w("})")
print(table.concat(out, "\n"))

-- Report: experience, rewards, chains, what was left out.
print("\n-- Report")
for _, q in ipairs(order) do
    local qq = quest(q)
    local xp = D.questXP(q, qq)
    local rw = rewardLabel(q)
    print(("--   %6d L%-2d req %-2d %-40s xp %5d %s%s"):format(q, qq[QK.questLevel] or 0, qq[QK.requiredLevel] or 0,
        questName(q), xp, chosen[q], rw ~= "" and ("; rewards: " .. rw) or ""))
end
for _, e in ipairs(leftOut) do
    print(("--   left out %d %s: %s"):format(e.q, questName(e.q), e.why))
end
for _, n in ipairs(notes) do print("--   note: " .. n) end
