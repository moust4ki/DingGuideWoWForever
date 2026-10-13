-- Game data: names, quest givers and objective locations as UiMap points. Read from Ding's own
-- database (Ding/DB, built from Questie's data by tools/build_data.lua), or from the QuestieDB
-- addon when Ding/DB is missing. The rest of Ding only sees this interface.
-- Ding/DB stores spawns by UiMapID ({ [map] = { x, y, x, y, ... } }); QuestieDB stores them
-- by AreaID ({ [area] = { { x, y }, ... } }), converted here.
local _, Ding = ...
local L = Ding.L

local D = {}
Ding.Data = D

D.available = false
D.backend = nil   -- "ding" (Ding/DB) or "questiedb"

-- Used only if no zone table can be read.
local FALLBACK_AREA_TO_UIMAP = {
    [141] = 1438,  -- Teldrassil
    [188] = 1438,  -- Shadowglen
    [1657] = 1457, -- Darnassus
    [148] = 1439,  -- Darkshore
}

local DB            -- Ding.DB with the "ding" backend
local areaToUiMap
local services, flightMasters

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

local function questieZones()
    local ok, zoneDB = pcall(function() return LibQuestieDB.Support.Get("ZoneDB") end)
    if ok and type(zoneDB) == "table" and type(zoneDB.private) == "table" then return zoneDB.private end
    return nil
end

local function loadZones()
    areaToUiMap = {}
    if D.backend == "ding" then
        mergeZoneTable(DB.zones.areaToUiMap)
    else
        local private = questieZones()
        if private then
            mergeZoneTable(private.areaIdToUiMapId)
            mergeZoneTable(private.areaIdToUiMapIdOverride)
        end
    end
    for area, ui in pairs(FALLBACK_AREA_TO_UIMAP) do
        if not areaToUiMap[area] then areaToUiMap[area] = ui end
    end
end

local function ownDatabase()
    local db = Ding.DB
    return type(db) == "table" and type(db.quests) == "table" and next(db.quests) ~= nil and db or nil
end

local function questieDatabase()
    return type(LibQuestieDB) == "table" and type(QuestDB) == "table" and type(NpcDB) == "table"
end

-- "ding", "questiedb", or nil for the first one available (Ding/DB first).
function D:UseBackend(name)
    DB, areaToUiMap, services, flightMasters = nil, nil, nil, nil
    self.backend, self.available = nil, false
    if (name == nil or name == "ding") and ownDatabase() then
        DB = ownDatabase()
        self.backend, self.available = "ding", true
    elseif (name == nil or name == "questiedb") and questieDatabase() then
        self.backend, self.available = "questiedb", true
    end
    return self.available
end

function D:Init()
    if not self:UseBackend() then
        Ding:Print(L.DB_MISSING)
        return
    end
    -- QuestieDB alone: it localizes its names once told the client's language (Questie
    -- forwards it itself). Ding/DB loads the names of the client's language by itself.
    if self.backend == "questiedb" and not Ding.Compat.IsAddOnLoaded("Questie") and GetLocale() ~= "enUS"
        and LibQuestieDB.l10n and LibQuestieDB.l10n.SetLocale then
        pcall(LibQuestieDB.l10n.SetLocale, GetLocale())
    end
    loadZones()
end

function D:UiMap(areaID)
    if not areaToUiMap then loadZones() end
    return areaToUiMap[areaID]
end

---------------------------------------------------------------------------
-- One getter for both backends, with QuestieDB's semantics (docs/api.md): a missing number
-- is 0; startedBy, finishedBy and objectives are always tables; other empty tables are nil.
---------------------------------------------------------------------------
local KINDS = { Quest = "quests", Npc = "npcs", Object = "objects", Item = "items" }
local QUESTIE = { Quest = function() return QuestDB end, Npc = function() return NpcDB end,
    Object = function() return ObjectDB end, Item = function() return ItemDB end }
local NUMBERS = { requiredLevel = true, questLevel = true, requiredRaces = true, requiredClasses = true,
    sourceItemId = true, minLevel = true, maxLevel = true, rank = true, npcFlags = true }
local NEVER_NIL = { startedBy = true, finishedBy = true, objectives = true }

local function own(kind, field, id)
    local rec = DB[KINDS[kind]][id]
    if not rec then return nil end
    local index = DB.LAYOUT[kind][field]
    local v = index and rec[index]
    if field == "name" then v = DB.names[KINDS[kind]][id] or v end
    if NUMBERS[field] then return v or 0 end
    if v == nil and NEVER_NIL[field] then return {} end
    return v
end

local function get(kind, field, id)
    if not D.available then return nil end
    if D.backend == "ding" then return own(kind, field, id) end
    local db = QUESTIE[kind]()
    if type(db) ~= "table" or type(db[field]) ~= "function" then return nil end
    local ok, value = pcall(db[field], id)
    if ok then return value end
    return nil
end

-- A field in English whatever the client's language (QuestieDB's GetRaw).
local function raw(kind, field, id)
    if not D.available then return nil end
    if D.backend == "ding" then
        local rec = DB[KINDS[kind]][id]
        local index = DB.LAYOUT[kind][field]
        return rec and index and rec[index]
    end
    local db = QUESTIE[kind]()
    if type(db) ~= "table" or type(db.GetRaw) ~= "function" then return nil end
    local ok, value = pcall(db.GetRaw, id, field)
    if ok then return value end
    return nil
end

-- Every id of a kind, sorted.
local function allIds(kind)
    if D.backend == "ding" then
        local ids = {}
        for id in pairs(DB[KINDS[kind]]) do ids[#ids + 1] = id end
        table.sort(ids)
        return ids
    end
    local db = QUESTIE[kind]()
    local ok, ids = pcall(db and db.GetAllIds)
    return ok and type(ids) == "table" and ids or {}
end

---------------------------------------------------------------------------
-- Names and quest facts
---------------------------------------------------------------------------
function D:QuestName(questID)
    return get("Quest", "name", questID) or string.format(L.UNKNOWN_QUEST, questID)
end

function D:QuestRequiredLevel(questID)
    return get("Quest", "requiredLevel", questID) or 0
end

-- Quest difficulty level (0 when unknown).
function D:QuestLevel(questID)
    return get("Quest", "questLevel", questID) or 0
end

-- Quests to turn in first: single = at least one of them, group = all of them (or nil).
function D:QuestPrereqs(questID)
    return get("Quest", "preQuestSingle", questID), get("Quest", "preQuestGroup", questID)
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
    return allows(get("Quest", "requiredRaces", questID), RACE_BITS[Ding.Compat.PlayerRace()])
        and allows(get("Quest", "requiredClasses", questID), CLASS_BITS[Ding.Compat.PlayerClass()])
end

-- The quest is open to one of these races at least (client race file names; a race the
-- database has no bit for counts as open).
function D:QuestOpenToRaces(questID, races)
    local mask = get("Quest", "requiredRaces", questID)
    for _, race in ipairs(races) do
        if allows(mask, RACE_BITS[race]) then return true end
    end
    return false
end

-- Item the quest giver hands out with the quest, or nil.
function D:QuestSourceItem(questID)
    local id = get("Quest", "sourceItemId", questID)
    if type(id) == "number" and id ~= 0 then return id end
    return nil
end

function D:QuestExists(questID)
    if not self.available then return false end
    if self.backend == "ding" then return DB.quests[questID] ~= nil end
    local ok, exists = pcall(QuestDB.Exists, questID)
    return ok and exists == true
end

function D:NpcName(id) return get("Npc", "name", id) end

-- A monster's levels, rank (0 normal, 1 elite, 2 rare elite, 3 boss, 4 rare) and the
-- factions it is friendly to ("A", "H", "AH" or nil); nil for an unknown NPC.
function D:NpcInfo(id)
    local min = get("Npc", "minLevel", id)
    if type(min) ~= "number" or min == 0 then return nil end
    local max = get("Npc", "maxLevel", id)
    return {
        minLevel = min,
        maxLevel = (type(max) == "number" and max >= min) and max or min,
        rank = get("Npc", "rank", id) or 0,
        friendly = get("Npc", "friendlyToFaction", id),
    }
end
function D:ObjectName(id) return get("Object", "name", id) end
function D:ItemName(id) return get("Item", "name", id) end

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
    if D.backend == "ding" then
        for map, coords in pairs(spawns) do
            for i = 1, #coords - 1, 2 do
                out[#out + 1] = { map = map, x = coords[i], y = coords[i + 1], label = label }
            end
        end
        return
    end
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
    addSpawns(out, get("Npc", "spawns", npcID), self:NpcName(npcID))
    for i = first, #out do out[i].npc = npcID end
    return out
end

-- NPCs that sell an item, or an empty list.
function D:ItemVendors(itemID)
    local vendors = get("Item", "vendors", itemID)
    return type(vendors) == "table" and vendors or {}
end

function D:ObjectPoints(objectID, out)
    out = out or {}
    addSpawns(out, get("Object", "spawns", objectID), self:ObjectName(objectID))
    return out
end

-- Where an item can be obtained: monsters and objects that drop it.
function D:ItemSourcePoints(itemID, out)
    out = out or {}
    local first = #out + 1
    for _, npcID in ipairs(get("Item", "npcDrops", itemID) or {}) do self:NpcPoints(npcID, out) end
    for _, objectID in ipairs(get("Item", "objectDrops", itemID) or {}) do self:ObjectPoints(objectID, out) end
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
    return giverPoints(get("Quest", "startedBy", questID))
end

function D:EndPoints(questID)
    return giverPoints(get("Quest", "finishedBy", questID))
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

function D:StarterName(questID) return self:GiverName(get("Quest", "startedBy", questID)) end
function D:FinisherName(questID) return self:GiverName(get("Quest", "finishedBy", questID)) end

---------------------------------------------------------------------------
-- Objectives: list of { name = string, points = {...} } in the database's order.
-- Groups: 1 creature, 2 object, 3 item, 5 kill credit. The trigger area comes last.
---------------------------------------------------------------------------
function D:ObjectiveTargets(questID)
    local targets = {}
    local objectives = get("Quest", "objectives", questID) or {}

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

    local trigger = get("Quest", "triggerEnd", questID)
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
-- npcFlags bits of the services (Classic flags).
local SERVICE_FLAGS = { vendor = 4, flight = 8, trainer = 16, innkeeper = 128, repair = 16384 }
-- A class trainer's English subtitle names its class ("Warrior Trainer", "Master Mage").
local CLASS_WORDS = { WARRIOR = "Warrior", PALADIN = "Paladin", HUNTER = "Hunter", ROGUE = "Rogue",
    PRIEST = "Priest", SHAMAN = "Shaman", MAGE = "Mage", WARLOCK = "Warlock", DRUID = "Druid" }

-- The NPCs offering a service, read once per session over every NPC (a pass of a few tens of
-- milliseconds, the first time one is needed): { vendor, repair, innkeeper,
-- flight = { npc ids }, trainer = { [class file name] = { npc ids } } }.
function D:Services()
    if services then return services end
    services = { vendor = {}, repair = {}, innkeeper = {}, flight = {}, trainer = {} }
    for class in pairs(CLASS_WORDS) do services.trainer[class] = {} end
    for _, id in ipairs(allIds("Npc")) do
        local flags = get("Npc", "npcFlags", id)
        if type(flags) == "number" and flags > 0 then
            for kind, bit in pairs(SERVICE_FLAGS) do
                if math.floor(flags / bit) % 2 == 1 then
                    if kind == "trainer" then
                        -- The English subtitle, whatever the client's language.
                        local sub = raw("Npc", "subName", id)
                        if type(sub) == "string" and not sub:find("Pet", 1, true) then
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
function D:NpcFriendly(id) return get("Npc", "friendlyToFaction", id) end

-- Every flight master: { npc, name, friendly ("A", "H", "AH"), points }.
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

-- Entrances of a dungeon (or of the Deeprun Tram) by its AreaID, as points (Forever
-- coordinates).
function D:DungeonEntrances(areaID)
    local out = {}
    if self.backend == "ding" then
        -- A few battlegrounds have their own entrance for the Horde.
        local horde = UnitFactionGroup and select(2, pcall(UnitFactionGroup, "player")) == "Horde"
        local list = horde and DB.zones.dungeonsHorde and DB.zones.dungeonsHorde[areaID]
        for _, at in ipairs(list or DB.zones.dungeons[areaID] or {}) do
            out[#out + 1] = { map = at[1], x = at[2], y = at[3] }
        end
        return out
    end
    local private = questieZones()
    local dungeons = private and private.dungeons
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
    local objectives = get("Quest", "objectives", questID) or {}
    for _, o in ipairs(objectives[3] or {}) do out[#out + 1] = o[1] end
    return out
end

-- Monsters that count for a quest's objectives, killed (creatures, kill credit) or looted
-- (items they drop): list of { npc = id, name = objective name }.
function D:ObjectiveNpcs(questID)
    local out = {}
    local objectives = get("Quest", "objectives", questID) or {}
    for _, o in ipairs(objectives[1] or {}) do
        out[#out + 1] = { npc = o[1], name = self:NpcName(o[1]) }
    end
    for _, o in ipairs(objectives[3] or {}) do
        local name = self:ItemName(o[1])
        for _, npc in ipairs(get("Item", "npcDrops", o[1]) or {}) do out[#out + 1] = { npc = npc, name = name } end
    end
    for _, o in ipairs(objectives[5] or {}) do
        local name = o[3] or self:NpcName(o[2])
        for _, npc in ipairs(o[1] or {}) do out[#out + 1] = { npc = npc, name = name } end
    end
    return out
end
