-- Shared helpers for the offline tools: reads the QuestieDB Forever export
-- (src/corrections/Forever/combined/forever{Quest,Npc,Item,Object}DB.lua) and names
-- the positional fields we use. Field indexes come from QuestieDB's src/meta/*Meta.lua.
local M = {}

M.QUEST = {
    name = 1, startedBy = 2, finishedBy = 3, requiredLevel = 4, questLevel = 5,
    requiredRaces = 6, requiredClasses = 7, triggerEnd = 9, objectives = 10, sourceItem = 11, sourceItemId = 11,
    preQuestGroup = 12, preQuestSingle = 13, exclusiveTo = 16, zoneOrSort = 17,
    requiredSkill = 18, requiredMinRep = 19, requiredSourceItems = 21,
    specialFlags = 24, parentQuest = 25, breadcrumbForQuestId = 27, extraObjectives = 29, requiredSpell = 30,
    requiredMaxLevel = 32, availableUntilCompleted = 33, disabledByQuest = 36,
}
M.NPC = { name = 1, spawns = 7 }
M.OBJECT = { name = 1, spawns = 4 }
M.ITEM = { name = 1, npcDrops = 2, objectDrops = 3, itemDrops = 4, questRewards = 6, vendors = 14 }

-- zoneOrSort of Forever's camping quests (QuestieDB's sort CAMPING): given on the map by the
-- starting zones' NPCs, ordinary quests for a route, not a category to leave out.
M.CAMPING = -666
-- `when.item` as the engine reads it: an id, a pair { id, count } (two numbers, the second
-- below 1000), a list of ids (all held) or a list of pairs. { { id, count }, ... }, or nil for
-- any other shape.
function M.heldItems(v)
    if type(v) == "number" then return { { v, 1 } } end
    if type(v) ~= "table" or #v == 0 then return nil end
    local out = {}
    if type(v[1]) == "table" then
        for _, p in ipairs(v) do
            if type(p) == "number" then
                out[#out + 1] = { p, 1 }
            elseif type(p) == "table" and type(p[1]) == "number" and (p[2] == nil or type(p[2]) == "number") then
                out[#out + 1] = { p[1], p[2] or 1 }
            else
                return nil
            end
        end
        return out
    end
    if #v == 2 and type(v[1]) == "number" and type(v[2]) == "number" and v[2] < 1000 then return { { v[1], v[2] } } end
    for _, id in ipairs(v) do
        if type(id) ~= "number" then return nil end
        out[#out + 1] = { id, 1 }
    end
    return out
end

-- zoneOrSort of the class categories (QuestieDB's sorts): the class a quest filed there is for,
-- when its requiredClasses is empty (Forever's new class quests).
M.CLASS_SORTS = {
    [-263] = "DRUID", [-262] = "PRIEST", [-261] = "HUNTER", [-162] = "ROGUE", [-161] = "MAGE",
    [-141] = "PALADIN", [-82] = "SHAMAN", [-81] = "WARRIOR", [-61] = "WARLOCK",
}

-- requiredRaces bits, keyed by the client's race file names (UnitRace, 2nd value).
-- Forever masks go beyond 32 bits (Skyborne): never use 32-bit bit operations on them.
M.RACE_BITS = {
    Human = 1, Orc = 2, Dwarf = 4, NightElf = 8, Scourge = 16, Tauren = 32, Gnome = 64, Troll = 128,
}
-- Races found on both sides, one requiredRaces bit per faction (QuestieDB's race ids 95 and
-- 96: Forever's Skyborne): { [race] = { Alliance = bit, Horde = bit } }. The race name is
-- the client's file name as Ding expects it (UnitRace, 2nd value): to check in game.
M.RACE_FACTION_BITS = {
    Skyborne = { Alliance = 4294967296, Horde = 8589934592 },
}
-- The bit of a race on a side (nil: unknown race, or a two-sided race without a side).
function M.raceBit(race, faction)
    if M.RACE_BITS[race] then return M.RACE_BITS[race] end
    local bits = M.RACE_FACTION_BITS[race]
    return bits and faction and bits[faction] or nil
end
M.FACTION_RACES = {
    Alliance = { "Human", "Dwarf", "NightElf", "Gnome" },
    Horde = { "Orc", "Scourge", "Tauren", "Troll" },
}
-- requiredClasses bits, keyed by the client's class file names (UnitClass, 2nd value).
M.CLASS_BITS = {
    WARRIOR = 1, PALADIN = 2, HUNTER = 4, ROGUE = 8, PRIEST = 16,
    SHAMAN = 64, MAGE = 128, WARLOCK = 256, DRUID = 1024,
}
-- Classes of each faction, in requiredClasses bit order.
M.FACTION_CLASSES = {
    Alliance = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" },
    Horde = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" },
}

-- Classes of a faction a requiredClasses mask allows (all of them for 0).
function M.classesAllowed(mask, faction)
    local out = {}
    for _, class in ipairs(M.FACTION_CLASSES[faction or "Alliance"]) do
        if (mask or 0) == 0 or M.hasBit(mask, M.CLASS_BITS[class]) then out[#out + 1] = class end
    end
    return out
end

-- Works on masks above 2^32, where 32-bit bit libraries would truncate.
function M.hasBit(mask, bit)
    return math.floor(mask / bit) % 2 == 1
end

-- Every quest is open to everyone when requiredRaces is absent or 0.
function M.raceAllowed(quest, raceBit)
    local mask = quest[M.QUEST.requiredRaces] or 0
    return mask == 0 or M.hasBit(mask, raceBit)
end

function M.load(dir)
    local db = {}
    for _, kind in ipairs({ "Quest", "Npc", "Item", "Object" }) do
        local path = dir .. "/forever" .. kind .. "DB.lua"
        local chunk, err = loadfile(path)
        if not chunk then
            io.stderr:write("Cannot read " .. path .. ": " .. tostring(err) .. "\n"
                .. "Run tools/export-forever.lua in QuestieDB first (see tools/README.md).\n")
            os.exit(2)
        end
        db[kind] = chunk()
    end
    return db
end

-- Where each field a DingDB correction may set sits in the export's records (QuestieDB's
-- indexes). `spawns` and a trigger's place are converted (corrections give them by UiMapID, the
-- export by AreaID); `dungeon` and `weaponSkills` are DingDB's own fields, unknown to the export.
local CORRECTED = {
    Quest = { name = 1, startedBy = 2, finishedBy = 3, requiredLevel = 4, questLevel = 5, requiredRaces = 6,
        requiredClasses = 7, triggerEnd = 9, objectives = 10, sourceItemId = 11, preQuestGroup = 12,
        preQuestSingle = 13 },
    Npc = { name = 1, minLevel = 4, maxLevel = 5, rank = 6, spawns = 7, friendlyToFaction = 13, subName = 14,
        npcFlags = 15 },
    Object = { name = 1, spawns = 4 },
    Item = { name = 1, npcDrops = 2, objectDrops = 3, vendors = 14, class = 12, subClass = 13,
        requiredLevel = 10, flags = 7 },
}

-- AreaID -> UiMapID of the export's zone tables (support/Forever/Zones, a QuestieLoader module).
function M.areaToMap(dir)
    local root = dir:gsub("[/\\]src[/\\]corrections[/\\]Forever[/\\]combined[/\\]?$", "")
    local path = root .. "/support/Forever/Zones/areaIdToUiMapId.lua"
    local chunk = loadfile(path)
    local private = {}
    if chunk then
        local module = { private = private }
        setfenv(chunk, setmetatable({ QuestieLoader = {
            ImportModule = function() return module end, CreateModule = function() return module end,
        } }, { __index = _G }))
        if not pcall(chunk) then chunk = nil end
    end
    if not chunk then error("Cannot read " .. path, 0) end
    local out = {}
    for _, key in ipairs({ "areaIdToUiMapId", "areaIdToUiMapIdOverride" }) do
        local src = private[key]
        if type(src) == "string" then src = loadstring(src)() end
        for area, map in pairs(src or {}) do out[area] = map end
    end
    return out
end

-- The export with DingDB's corrections on top (tools/data/corrections, docs/dingdb.md): the data
-- Ding plays with in game, for the tools that write and check guides. build_data.lua reads the
-- export as it is (it applies the corrections in DingDB's own layout). Returns db, and the ids the
-- corrections changed ({ quests = { [id] = true }, ... }). A file the check refuses stops the tool.
function M.loadCorrected(dir, correctionsDir)
    local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
    local C = dofile(here .. "/dingdb_corrections.lua")
    local db = M.load(dir)
    local files, problems = C.load(correctionsDir or (here .. "/data/corrections"))
    for _, f in ipairs(files) do
        for _, e in ipairs(C.check(f.data, f.file)) do problems[#problems + 1] = e end
    end
    if #problems > 0 then
        io.stderr:write("DingDB corrections refused (tools/check_data.lua shows them too):\n  "
            .. table.concat(problems, "\n  ") .. "\n")
        os.exit(1)
    end
    -- { [uiMap] = { x, y, ... } } -> { [area] = { { x, y }, ... } }, through the smallest AreaID
    -- of that map (the export's coordinates are the map's).
    local mapArea
    local function byArea(spawns)
        if not mapArea then
            mapArea = {}
            for area, map in pairs(M.areaToMap(dir)) do
                if not mapArea[map] or area < mapArea[map] then mapArea[map] = area end
            end
        end
        local out = {}
        for map, coords in pairs(spawns) do
            local area = assert(mapArea[map], "DingDB correction: no AreaID for UiMapID " .. tostring(map))
            out[area] = out[area] or {}
            for i = 1, #coords, 2 do table.insert(out[area], { coords[i], coords[i + 1] }) end
        end
        return out
    end
    -- C.apply with the export's positions; a field the export has no place for goes under a
    -- text key, removed afterwards, and the names in other languages are not kept.
    local pos = {}
    for kind, fields in pairs(CORRECTED) do
        pos[kind] = {}
        for field in pairs(C.FIELDS[kind]) do pos[kind][field] = fields[field] or ("ding:" .. field) end
    end
    for _, f in ipairs(files) do
        for key, list in pairs(f.data) do
            local kind = C.KINDS[key]
            for _, rec in pairs(kind and list or {}) do
                if type(rec) == "table" then
                    if type(rec.spawns) == "table" then rec.spawns = byArea(rec.spawns) end
                    if type(rec.triggerEnd) == "table" then rec.triggerEnd = { rec.triggerEnd[1], byArea(rec.triggerEnd[2]) } end
                end
            end
        end
    end
    local corrected = C.apply(files, db, {}, pos)
    for key, ids in pairs(corrected) do
        for id in pairs(ids) do
            local row = db[C.KINDS[key]][id]
            for k in pairs(row or {}) do
                if type(k) == "string" then row[k] = nil end
            end
        end
    end
    return db, corrected
end

local function hasEntries(t)
    return type(t) == "table" and next(t) ~= nil
end
M.hasEntries = hasEntries

-- True when turning the quest in needs something done first (kills, items, an area...).
function M.hasObjectives(quest)
    local objectives = quest[M.QUEST.objectives]
    if type(objectives) == "table" then
        for _, group in pairs(objectives) do
            if hasEntries(group) then return true end
        end
    end
    return hasEntries(quest[M.QUEST.triggerEnd])
end

-- First spawn of an NPC or object, preferring the given AreaID: x, y, areaID, count.
function M.spawnOf(spawns, areaId)
    if type(spawns) ~= "table" then return nil end
    local list = areaId and spawns[areaId]
    local area = areaId
    if not hasEntries(list) then
        area, list = next(spawns)
    end
    if not hasEntries(list) or type(list[1]) ~= "table" then return nil end
    return list[1][1], list[1][2], area, #list
end

-- "Name (x, y)" for the first NPC, object or item of a startedBy / finishedBy value.
function M.giverLabel(db, givers, areaId)
    if type(givers) ~= "table" then return "-" end
    local parts = {}
    local function add(name, spawns, kind)
        local x, y, _, count = M.spawnOf(spawns, areaId)
        local where = x and string.format(" (%.1f, %.1f%s)", x, y, count > 1 and (", +" .. (count - 1)) or "") or ""
        parts[#parts + 1] = (kind or "") .. tostring(name or "?") .. where
    end
    for _, id in ipairs(givers[1] or {}) do
        local npc = db.Npc[id]
        add(npc and npc[M.NPC.name] or ("NPC " .. id), npc and npc[M.NPC.spawns])
    end
    for _, id in ipairs(givers[2] or {}) do
        local obj = db.Object[id]
        add(obj and obj[M.OBJECT.name] or ("object " .. id), obj and obj[M.OBJECT.spawns])
    end
    for _, id in ipairs(givers[3] or {}) do
        local item = db.Item[id]
        local dropper = item and item[M.ITEM.npcDrops] and item[M.ITEM.npcDrops][1]
        local npc = dropper and db.Npc[dropper]
        add((item and item[M.ITEM.name] or ("item " .. id))
            .. (npc and (" <- " .. tostring(npc[M.NPC.name])) or ""), npc and npc[M.NPC.spawns], "[item] ")
    end
    if #parts == 0 then return "-" end
    return table.concat(parts, " / ")
end

return M
