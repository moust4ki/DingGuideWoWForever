-- LibDingDB: DingDB, Ding's game database, for other addons (docs/dingdb.md). Read-only: every
-- answer is a fresh copy, so nothing a caller does changes Ding's data. Present as soon as Ding
-- is loaded: list Ding in your TOC's ## Dependencies (or ## OptionalDeps and test the global).
-- (The global DingDB is Ding's saved settings: the library is LibDingDB.)
local _, Ding = ...
local DB = Ding.DB
if type(DB) ~= "table" then return end

local KINDS = { quest = "Quest", npc = "Npc", object = "Object", item = "Item" }
local TABLES = { Quest = "quests", Npc = "npcs", Object = "objects", Item = "items" }

local function copy(v)
    if type(v) ~= "table" then return v end
    local t = {}
    for k, x in pairs(v) do t[k] = copy(x) end
    return t
end

local API = { version = 1, source = DB.source }

-- A record by kind ("quest", "npc", "object" or "item") and id: { id, its fields by name
-- (docs/dingdb.md) }, `name` in the client's language when DingDB has it, `englishName`
-- always; nil when unknown.
function API.Get(kind, id)
    local K = KINDS[kind]
    local rec = K and DB[TABLES[K]][id]
    if not rec then return nil end
    local out = { id = id }
    for field, index in pairs(DB.LAYOUT[K]) do out[field] = copy(rec[index]) end
    out.englishName = out.name
    out.name = DB.names[TABLES[K]][id] or out.name
    return out
end

-- The name of a record in the client's language (English when DingDB has no other), or nil.
function API.Name(kind, id)
    local K = KINDS[kind]
    local rec = K and DB[TABLES[K]][id]
    if not rec then return nil end
    return DB.names[TABLES[K]][id] or rec[DB.LAYOUT[K].name]
end

-- Every id of a kind, sorted.
function API.Ids(kind)
    local K = KINDS[kind]
    local ids = {}
    if not K then return ids end
    for id in pairs(DB[TABLES[K]]) do ids[#ids + 1] = id end
    table.sort(ids)
    return ids
end

-- The UiMapID of an AreaID (QuestieDB's and the game's zone ids), or nil.
function API.UiMap(areaID)
    return DB.zones.areaToUiMap[areaID]
end

-- Entrances of a dungeon (or of the Deeprun Tram) by its AreaID: { { uiMapID, x, y }, ... };
-- side "Horde" for the few battlegrounds whose entrance differs (default: the Alliance's).
function API.Entrances(areaID, side)
    local list = side == "Horde" and DB.zones.dungeonsHorde[areaID] or DB.zones.dungeons[areaID]
    return copy(list or {})
end

_G.LibDingDB = API
