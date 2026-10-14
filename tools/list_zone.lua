-- Lists the quests of a zone that a race can take, sorted by level.
-- usage: lua5.1 tools/list_zone.lua <combined dir> <areaId> <raceBit | raceName>
--   ex.: lua5.1 tools/list_zone.lua ../QuestieDB/src/corrections/Forever/combined 141 8
-- A quest belongs to the zone when its zoneOrSort is that AreaID, or when its giver
-- (NPC, object, or monster dropping the starting item) spawns there. Subzone quests
-- (Shadowglen = 188) are therefore listed with their parent zone (Teldrassil = 141).
local here = arg[0]:match("^(.*)[/\\]") or "."
local X = dofile(here .. "/questiedb_export.lua")
local QK = X.QUEST

local dir, areaArg, raceArg = arg[1], arg[2], arg[3]
local areaId = tonumber(areaArg)
local raceBit = tonumber(raceArg) or (raceArg and X.RACE_BITS[raceArg])
if not dir or not areaId or not raceBit then
    io.stderr:write("usage: lua5.1 tools/list_zone.lua <combined dir> <areaId> <race bit | race name>\n"
        .. "  bits: Human 1, Orc 2, Dwarf 4, NightElf 8, Scourge 16, Tauren 32, Gnome 64, Troll 128\n")
    os.exit(2)
end

local db = X.loadCorrected(dir)

local function spawnsIn(spawns)
    return type(spawns) == "table" and X.hasEntries(spawns[areaId])
end

local function startsInZone(quest)
    local givers = quest[QK.startedBy]
    if type(givers) ~= "table" then return false end
    for _, id in ipairs(givers[1] or {}) do
        local npc = db.Npc[id]
        if npc and spawnsIn(npc[X.NPC.spawns]) then return true end
    end
    for _, id in ipairs(givers[2] or {}) do
        local obj = db.Object[id]
        if obj and spawnsIn(obj[X.OBJECT.spawns]) then return true end
    end
    for _, id in ipairs(givers[3] or {}) do
        local item = db.Item[id]
        for _, npcId in ipairs(item and item[X.ITEM.npcDrops] or {}) do
            local npc = db.Npc[npcId]
            if npc and spawnsIn(npc[X.NPC.spawns]) then return true end
        end
    end
    return false
end

local function prereqs(quest)
    local parts = {}
    local single = quest[QK.preQuestSingle]
    if X.hasEntries(single) then parts[#parts + 1] = table.concat(single, "|") end
    local group = quest[QK.preQuestGroup]
    if X.hasEntries(group) then parts[#parts + 1] = table.concat(group, "+") end
    local parent = quest[QK.parentQuest] or 0
    if parent ~= 0 then parts[#parts + 1] = "active:" .. parent end
    return #parts > 0 and table.concat(parts, " ") or "-"
end

local function classes(quest)
    local mask = quest[QK.requiredClasses] or 0
    if mask == 0 then return nil end
    local names = {}
    for name, bit in pairs(X.CLASS_BITS) do
        if X.hasBit(mask, bit) then names[#names + 1] = name end
    end
    table.sort(names)
    return table.concat(names, ",")
end

local rows = {}
for id, quest in pairs(db.Quest) do
    local inZone = (quest[QK.zoneOrSort] or 0) == areaId or startsInZone(quest)
    if inZone and X.raceAllowed(quest, raceBit) then
        rows[#rows + 1] = { id = id, quest = quest }
    end
end
table.sort(rows, function(a, b)
    local la, lb = a.quest[QK.questLevel] or 0, b.quest[QK.questLevel] or 0
    if la ~= lb then return la < lb end
    local ra, rb = a.quest[QK.requiredLevel] or 0, b.quest[QK.requiredLevel] or 0
    if ra ~= rb then return ra < rb end
    return a.id < b.id
end)

-- Pads to n bytes, always keeping at least one space before the next column.
local function pad(s, n)
    s = tostring(s)
    return s .. string.rep(" ", math.max(1, n - #s))
end

print(string.format("Zone %d, race bit %d: %d quests", areaId, raceBit, #rows))
print(pad("id", 7) .. pad("lvl", 4) .. pad("req", 4) .. pad("name", 34) .. pad("prerequisites", 17) .. "giver  =>  turn-in")
for _, row in ipairs(rows) do
    local q = row.quest
    local flags = {}
    local cls = classes(q)
    if cls then flags[#flags + 1] = "classes:" .. cls end
    if X.hasBit(q[QK.specialFlags] or 0, 1) then flags[#flags + 1] = "repeatable" end
    local zone = q[QK.zoneOrSort] or 0
    if zone ~= areaId then flags[#flags + 1] = "zone:" .. zone end
    print(pad(row.id, 7) .. pad(q[QK.questLevel] or 0, 4) .. pad(q[QK.requiredLevel] or 0, 4)
        .. pad(q[QK.name] or "?", 34) .. pad(prereqs(q), 16)
        .. X.giverLabel(db, q[QK.startedBy], areaId) .. "  =>  " .. X.giverLabel(db, q[QK.finishedBy], areaId)
        .. (#flags > 0 and ("  [" .. table.concat(flags, " ") .. "]") or ""))
end
