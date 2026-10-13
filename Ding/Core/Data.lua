-- QuestieDB adapter: names, quest givers and objective locations as UiMap points.
-- QuestieDB stores spawns by AreaID in 0-100 percentages; the client needs UiMapIDs.
local _, Ding = ...
local L = Ding.L

local D = {}
Ding.Data = D

D.available = false

-- Used only if QuestieDB's zone table cannot be read.
local FALLBACK_AREA_TO_UIMAP = {
    [141] = 1438,  -- Teldrassil
    [188] = 1438,  -- Shadowglen
    [1657] = 1457, -- Darnassus
    [148] = 1439,  -- Darkshore
}

local areaToUiMap

local function mergeZoneTable(src)
    if type(src) == "string" then
        local fn = loadstring(src)
        if not fn then return end
        local ok, t = pcall(fn)
        if ok then src = t else return end
    end
    if type(src) ~= "table" then return end
    for area, ui in pairs(src) do areaToUiMap[area] = ui end
end

local function loadZones()
    areaToUiMap = {}
    local ok, zoneDB = pcall(function() return LibQuestieDB.Support.Get("ZoneDB") end)
    if ok and type(zoneDB) == "table" and type(zoneDB.private) == "table" then
        mergeZoneTable(zoneDB.private.areaIdToUiMapId)
        mergeZoneTable(zoneDB.private.areaIdToUiMapIdOverride)
    end
    for area, ui in pairs(FALLBACK_AREA_TO_UIMAP) do
        if not areaToUiMap[area] then areaToUiMap[area] = ui end
    end
end

function D:Init()
    self.available = (type(LibQuestieDB) == "table" and type(QuestDB) == "table" and type(NpcDB) == "table")
    if not self.available then
        Ding:Print(L.DB_MISSING)
        return
    end
    -- Questie forwards the client locale itself; do it only when Questie is absent.
    if not Ding.Compat.IsAddOnLoaded("Questie") and GetLocale() ~= "enUS" and LibQuestieDB.l10n and LibQuestieDB.l10n.SetLocale then
        pcall(LibQuestieDB.l10n.SetLocale, GetLocale())
    end
    loadZones()
end

function D:UiMap(areaID)
    if not areaToUiMap then loadZones() end
    return areaToUiMap[areaID]
end

local function get(db, field, id)
    if not D.available or type(db) ~= "table" or type(db[field]) ~= "function" then return nil end
    local ok, value = pcall(db[field], id)
    if ok then return value end
    return nil
end

---------------------------------------------------------------------------
-- Names and quest facts
---------------------------------------------------------------------------
function D:QuestName(questID)
    return get(QuestDB, "name", questID) or string.format(L.UNKNOWN_QUEST, questID)
end

function D:QuestRequiredLevel(questID)
    return get(QuestDB, "requiredLevel", questID) or 0
end

-- Quest difficulty level (0 when unknown).
function D:QuestLevel(questID)
    return get(QuestDB, "questLevel", questID) or 0
end

-- Quests to turn in first: single = at least one of them, group = all of them (or nil).
function D:QuestPrereqs(questID)
    return get(QuestDB, "preQuestSingle", questID), get(QuestDB, "preQuestGroup", questID)
end

-- requiredRaces / requiredClasses bits, by the client's race and class file names.
-- Masks can go beyond 32 bits: test bits with arithmetic, never 32-bit bit operations.
local RACE_BITS = {
    Human = 1, Orc = 2, Dwarf = 4, NightElf = 8, Scourge = 16, Tauren = 32, Gnome = 64, Troll = 128,
}
local CLASS_BITS = {
    WARRIOR = 1, PALADIN = 2, HUNTER = 4, ROGUE = 8, PRIEST = 16,
    SHAMAN = 64, MAGE = 128, WARLOCK = 256, DRUID = 1024,
}

local function allows(mask, bit)
    if type(mask) ~= "number" or mask == 0 or not bit then return true end
    return math.floor(mask / bit) % 2 == 1
end

-- The quest exists and is open to the player's race and class.
function D:QuestOpenToPlayer(questID)
    if not self:QuestExists(questID) then return false end
    return allows(get(QuestDB, "requiredRaces", questID), RACE_BITS[Ding.Compat.PlayerRace()])
        and allows(get(QuestDB, "requiredClasses", questID), CLASS_BITS[Ding.Compat.PlayerClass()])
end

-- The quest is open to one of these races at least (client race file names; a race
-- QuestieDB has no bit for counts as open).
function D:QuestOpenToRaces(questID, races)
    local mask = get(QuestDB, "requiredRaces", questID)
    for _, race in ipairs(races) do
        if allows(mask, RACE_BITS[race]) then return true end
    end
    return false
end

-- Item the quest giver hands out with the quest, or nil.
function D:QuestSourceItem(questID)
    local id = get(QuestDB, "sourceItemId", questID)
    if type(id) == "number" and id ~= 0 then return id end
    return nil
end

function D:QuestExists(questID)
    return get(QuestDB, "Exists", questID) == true
end

function D:NpcName(id) return get(NpcDB, "name", id) end

-- A monster's levels, rank (0 normal, 1 elite, 2 rare elite, 3 boss, 4 rare) and the
-- factions it is friendly to ("A", "H", "AH" or nil); nil for an unknown NPC.
function D:NpcInfo(id)
    local min = get(NpcDB, "minLevel", id)
    if type(min) ~= "number" or min == 0 then return nil end
    local max = get(NpcDB, "maxLevel", id)
    return {
        minLevel = min,
        maxLevel = (type(max) == "number" and max >= min) and max or min,
        rank = get(NpcDB, "rank", id) or 0,
        friendly = get(NpcDB, "friendlyToFaction", id),
    }
end
function D:ObjectName(id) return get(ObjectDB, "name", id) end
function D:ItemName(id) return get(ItemDB, "name", id) end

---------------------------------------------------------------------------
-- Points: { map = uiMapID, x = 0-100, y = 0-100, label = string, area = bool }
-- area: one spawn among others of what the player hunts or gathers (objective targets,
-- sources of an item): together they make an area, not a single spot.
---------------------------------------------------------------------------
local function markArea(points, from)
    for i = from, #points do points[i].area = true end
    return points
end
local function addSpawns(out, spawns, label)
    if type(spawns) ~= "table" then return end
    for areaID, coords in pairs(spawns) do
        local uiMap = D:UiMap(areaID)
        if uiMap and type(coords) == "table" then
            for _, c in ipairs(coords) do
                -- -1,-1 marks "inside an instance"; skip it.
                if type(c) == "table" and c[1] and c[2] and c[1] >= 0 and c[2] >= 0 then
                    out[#out + 1] = { map = uiMap, x = c[1], y = c[2], label = label }
                end
            end
        end
    end
end

-- An NPC's spawns; each point names it (`npc`), so that it can be targeted.
function D:NpcPoints(npcID, out)
    out = out or {}
    local first = #out + 1
    addSpawns(out, get(NpcDB, "spawns", npcID), self:NpcName(npcID))
    for i = first, #out do out[i].npc = npcID end
    return out
end

-- NPCs that sell an item (QuestieDB's vendors), or an empty list.
function D:ItemVendors(itemID)
    local vendors = get(ItemDB, "vendors", itemID)
    return type(vendors) == "table" and vendors or {}
end

function D:ObjectPoints(objectID, out)
    out = out or {}
    addSpawns(out, get(ObjectDB, "spawns", objectID), self:ObjectName(objectID))
    return out
end

-- Where an item can be obtained: monsters and objects that drop it.
function D:ItemSourcePoints(itemID, out)
    out = out or {}
    local first = #out + 1
    for _, npcID in ipairs(get(ItemDB, "npcDrops", itemID) or {}) do self:NpcPoints(npcID, out) end
    for _, objectID in ipairs(get(ItemDB, "objectDrops", itemID) or {}) do self:ObjectPoints(objectID, out) end
    return markArea(out, first)
end

-- startedBy / finishedBy: { npcIds?, objectIds?, itemIds? }
local function giverPoints(givers, out)
    out = out or {}
    if type(givers) ~= "table" then return out end
    for _, id in ipairs(givers[1] or {}) do D:NpcPoints(id, out) end
    for _, id in ipairs(givers[2] or {}) do D:ObjectPoints(id, out) end
    for _, id in ipairs(givers[3] or {}) do D:ItemSourcePoints(id, out) end
    return out
end

function D:StartPoints(questID)
    return giverPoints(get(QuestDB, "startedBy", questID))
end

function D:EndPoints(questID)
    return giverPoints(get(QuestDB, "finishedBy", questID))
end

-- First NPC or object name of a quest giver, for display.
function D:GiverName(givers)
    if type(givers) ~= "table" then return nil end
    local npc = givers[1] and givers[1][1]
    if npc then return self:NpcName(npc) end
    local obj = givers[2] and givers[2][1]
    if obj then return self:ObjectName(obj) end
    return nil
end

function D:StarterName(questID) return self:GiverName(get(QuestDB, "startedBy", questID)) end
function D:FinisherName(questID) return self:GiverName(get(QuestDB, "finishedBy", questID)) end

---------------------------------------------------------------------------
-- Objectives: list of { name = string, points = {...} } in QuestieDB order.
-- Groups: 1 creature, 2 object, 3 item, 5 kill credit. The trigger area comes last.
---------------------------------------------------------------------------
function D:ObjectiveTargets(questID)
    local targets = {}
    local objectives = get(QuestDB, "objectives", questID) or {}

    for _, o in ipairs(objectives[1] or {}) do
        targets[#targets + 1] = { name = self:NpcName(o[1]), points = self:NpcPoints(o[1]) }
    end
    for _, o in ipairs(objectives[2] or {}) do
        targets[#targets + 1] = { name = self:ObjectName(o[1]), points = self:ObjectPoints(o[1]) }
    end
    for _, o in ipairs(objectives[3] or {}) do
        targets[#targets + 1] = { name = self:ItemName(o[1]), points = self:ItemSourcePoints(o[1]) }
    end
    for _, o in ipairs(objectives[5] or {}) do
        local points = {}
        for _, npcID in ipairs(o[1] or {}) do self:NpcPoints(npcID, points) end
        targets[#targets + 1] = { name = o[3] or self:NpcName(o[2]), points = points }
    end

    local trigger = get(QuestDB, "triggerEnd", questID)
    if type(trigger) == "table" then
        local points = {}
        addSpawns(points, trigger[2], trigger[1])
        targets[#targets + 1] = { name = trigger[1], points = points }
    end
    for _, target in ipairs(targets) do markArea(target.points, 1) end
    return targets
end

---------------------------------------------------------------------------
-- Travel: flight masters and dungeon entrances
---------------------------------------------------------------------------
-- npcFlags bits of the services (Classic flags, as QuestieDB stores them).
local SERVICE_FLAGS = { vendor = 4, flight = 8, trainer = 16, innkeeper = 128, repair = 16384 }
-- A class trainer's English subtitle names its class ("Warrior Trainer", "Master Mage").
local CLASS_WORDS = { WARRIOR = "Warrior", PALADIN = "Paladin", HUNTER = "Hunter", ROGUE = "Rogue",
    PRIEST = "Priest", SHAMAN = "Shaman", MAGE = "Mage", WARLOCK = "Warlock", DRUID = "Druid" }
local services, flightMasters

-- The NPCs offering a service, read once per session over every NPC of QuestieDB (a pass
-- of a few tens of milliseconds, the first time one is needed): { vendor, repair,
-- innkeeper, flight = { npc ids }, trainer = { [class file name] = { npc ids } } }.
function D:Services()
    if services then return services end
    services = { vendor = {}, repair = {}, innkeeper = {}, flight = {}, trainer = {} }
    for class in pairs(CLASS_WORDS) do services.trainer[class] = {} end
    local ok, ids = pcall(NpcDB.GetAllIds)
    if not ok or type(ids) ~= "table" then return services end
    for _, id in ipairs(ids) do
        local flags = get(NpcDB, "npcFlags", id)
        if type(flags) == "number" and flags > 0 then
            for kind, bit in pairs(SERVICE_FLAGS) do
                if math.floor(flags / bit) % 2 == 1 then
                    if kind == "trainer" then
                        -- The English subtitle, whatever the client's language.
                        local okRaw, sub = pcall(NpcDB.GetRaw, id, "subName")
                        if okRaw and type(sub) == "string" and not sub:find("Pet", 1, true) then
                            for class, word in pairs(CLASS_WORDS) do
                                if sub:find(word, 1, true) then
                                    local list = services.trainer[class]
                                    list[#list + 1] = id
                                end
                            end
                        end
                    else
                        local list = services[kind]
                        list[#list + 1] = id
                    end
                end
            end
        end
    end
    return services
end

-- Factions an NPC is friendly to: "A", "H", "AH" or nil.
function D:NpcFriendly(id) return get(NpcDB, "friendlyToFaction", id) end

-- Every flight master of QuestieDB: { npc, name, friendly ("A", "H", "AH"), points }.
function D:FlightMasters()
    if flightMasters then return flightMasters end
    flightMasters = {}
    for _, id in ipairs(self:Services().flight) do
        local points = self:NpcPoints(id)
        if #points > 0 then
            flightMasters[#flightMasters + 1] = { npc = id, name = self:NpcName(id),
                friendly = self:NpcFriendly(id), points = points }
        end
    end
    return flightMasters
end

-- Entrances of a dungeon (or of the Deeprun Tram) by its AreaID, as points; QuestieDB's
-- support table, in Forever coordinates.
function D:DungeonEntrances(areaID)
    local out = {}
    local ok, zoneDB = pcall(function() return LibQuestieDB.Support.Get("ZoneDB") end)
    local dungeons = ok and type(zoneDB) == "table" and type(zoneDB.private) == "table" and zoneDB.private.dungeons
    local entry = type(dungeons) == "table" and dungeons[areaID]
    if type(entry) ~= "table" or type(entry[4]) ~= "table" then return out end
    for _, at in ipairs(entry[4]) do
        local map = type(at) == "table" and self:UiMap(at[1])
        if map and at[2] and at[3] then out[#out + 1] = { map = map, x = at[2], y = at[3] } end
    end
    return out
end

-- Items a quest's objectives ask for.
function D:ObjectiveItems(questID)
    local out = {}
    local objectives = get(QuestDB, "objectives", questID) or {}
    for _, o in ipairs(objectives[3] or {}) do out[#out + 1] = o[1] end
    return out
end

-- Monsters that count for a quest's objectives, killed (creatures, kill credit) or looted
-- (items they drop): list of { npc = id, name = objective name }.
function D:ObjectiveNpcs(questID)
    local out = {}
    local objectives = get(QuestDB, "objectives", questID) or {}
    for _, o in ipairs(objectives[1] or {}) do
        out[#out + 1] = { npc = o[1], name = self:NpcName(o[1]) }
    end
    for _, o in ipairs(objectives[3] or {}) do
        local name = self:ItemName(o[1])
        for _, npc in ipairs(get(ItemDB, "npcDrops", o[1]) or {}) do out[#out + 1] = { npc = npc, name = name } end
    end
    for _, o in ipairs(objectives[5] or {}) do
        local name = o[3] or self:NpcName(o[2])
        for _, npc in ipairs(o[1] or {}) do out[#out + 1] = { npc = npc, name = name } end
    end
    return out
end
