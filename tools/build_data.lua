-- Builds Ding's own game database (Ding/DB/) from a QuestieDB release: the Forever export
-- (src/corrections/Forever/combined), its zone tables (support/Forever/Zones) and its names in
-- every language (l10n/Forever). Questie's data is GPL v3: the files keep its credits.
-- Spawns are converted from AreaIDs to UiMapIDs here, once, so that the game never has to.
-- DingDB's own corrections and additions (tools/data/corrections/*.lua, docs/dingdb.md) are
-- applied on top, in file order.
-- usage: lua5.1 tools/build_data.lua <combined dir> [--out <dir>] [--source <text>]
--                                    [--corrections <dir>]
--   <combined dir>   .../QuestieDB/src/corrections/Forever/combined (exported with
--                    tools/export-forever.lua --include-authored)
--   --out            output folder (default: Ding/DB next to this script)
--   --source         what the data comes from, written in the files (e.g. "QuestieDB v1.0.6")
--   --corrections    folder of the corrections (default: tools/data/corrections)
local here = arg[0]:match("^(.*)[/\\]") or "."
local X = dofile(here .. "/questiedb_export.lua")
local C = dofile(here .. "/dingdb_corrections.lua")

local combined, out, source, correctionsDir
do
    local i = 1
    while arg[i] do
        local a = arg[i]
        if a == "--out" then i = i + 1; out = arg[i]
        elseif a == "--source" then i = i + 1; source = arg[i]
        elseif a == "--corrections" then i = i + 1; correctionsDir = arg[i]
        elseif not combined then combined = a
        else io.stderr:write("unknown argument: " .. a .. "\n"); os.exit(2) end
        i = i + 1
    end
end
if not combined then
    io.stderr:write("usage: lua5.1 tools/build_data.lua <combined dir> [--out <dir>] [--source <text>]"
        .. " [--corrections <dir>]\n")
    os.exit(2)
end
out = out or (here .. "/../Ding/DB")
source = source or "QuestieDB"
correctionsDir = correctionsDir or (here .. "/data/corrections")
local qdbRoot = combined:gsub("[/\\]src[/\\]corrections[/\\]Forever[/\\]combined[/\\]?$", "")

-- The fields Ding reads (Core/Data.lua), by the export's indexes (QuestieDB src/meta/*Meta.lua);
-- false: a field of DingDB's own, only set by its corrections.
local FIELDS = {
    Quest = { "name", 1, "startedBy", 2, "finishedBy", 3, "requiredLevel", 4, "questLevel", 5,
        "requiredRaces", 6, "requiredClasses", 7, "triggerEnd", 9, "objectives", 10, "sourceItemId", 11,
        "preQuestGroup", 12, "preQuestSingle", 13 },
    Npc = { "name", 1, "minLevel", 4, "maxLevel", 5, "rank", 6, "spawns", 7, "friendlyToFaction", 13,
        "subName", 14, "npcFlags", 15, "dungeon", "spawns:7", "weaponSkills", false },
    Object = { "name", 1, "spawns", 4, "dungeon", "spawns:4" },
    Item = { "name", 1, "npcDrops", 2, "objectDrops", 3, "vendors", 14, "class", 12, "subClass", 13,
        "requiredLevel", 10, "flags", 7 },
}
-- Our layout: the position of each field in a record (Core/Data.lua reads the same table).
-- `dungeon` is ours: the AreaID of the dungeon an NPC or object is only found in (its spawns are
-- all inside it), so that Ding can lead to the dungeon's entrance. `weaponSkills` is ours too:
-- the weapon skills a weapon master teaches (tools/data/corrections).
local LAYOUT = {}
for kind, list in pairs(FIELDS) do
    LAYOUT[kind] = {}
    for i = 1, #list, 2 do LAYOUT[kind][#LAYOUT[kind] + 1] = { name = list[i], from = list[i + 1] } end
end

---------------------------------------------------------------------------
-- Reading QuestieDB
---------------------------------------------------------------------------
local db = X.load(combined)

-- QuestieDB's support modules expect QuestieLoader: run them in a sandbox.
local function sandbox(path, private, imports, faction)
    local chunk = loadfile(path)
    if not chunk then return false end
    local module = { private = private }
    setfenv(chunk, setmetatable({ QuestieLoader = {
        ImportModule = function(_, name) return (imports and imports[name]) or module end,
        CreateModule = function() return module end,
    }, UnitFactionGroup = function() return faction or "Alliance" end }, { __index = _G }))
    return pcall(chunk)
end

-- Dungeon entrances depend on the side for a few battlegrounds: read them for each side.
local zones = { areaIdToUiMapId = {} }
local dungeonsBySide = {}
do
    local dir = qdbRoot .. "/support/Forever/Zones/"
    assert(sandbox(dir .. "areaIdToUiMapId.lua", zones), "cannot read " .. dir .. "areaIdToUiMapId.lua")
    local expansions = setmetatable({ Current = 1 }, { __index = function() return 99 end })
    for _, side in ipairs({ "Alliance", "Horde" }) do
        local private = {}
        assert(sandbox(dir .. "dungeons.lua", private, { Expansions = expansions }, side),
            "cannot read " .. dir .. "dungeons.lua")
        assert(type(private.dungeons) == "table" and next(private.dungeons), "no dungeons in " .. dir .. "dungeons.lua")
        dungeonsBySide[side] = private.dungeons
    end
end
local areaToMap = {}
for _, key in ipairs({ "areaIdToUiMapId", "areaIdToUiMapIdOverride" }) do
    local src = zones[key]
    if type(src) == "string" then src = loadstring(src)() end
    for area, map in pairs(src or {}) do areaToMap[area] = map end
end

-- Names in every language QuestieDB has: l10n/Forever/lookup<Kind>/<locale>.lua.
local LOOKUPS = { Quest = { "lookupQuests", "questLookup" }, Npc = { "lookupNpcs", "npcNameLookup" },
    Object = { "lookupObjects", "objectLookup" }, Item = { "lookupItems", "itemLookup" } }
local LOCALES = { "deDE", "esES", "esMX", "frFR", "koKR", "ptBR", "ruRU", "zhCN", "zhTW" }
local function lookup(kind, locale)
    local folder, field = LOOKUPS[kind][1], LOOKUPS[kind][2]
    local chunk = loadfile(("%s/l10n/Forever/%s/%s.lua"):format(qdbRoot, folder, locale))
    if not chunk then return {} end
    local l10n = { [field] = {} }
    setfenv(chunk, setmetatable({
        GetLocale = function() return locale end,
        QuestieLoader = { ImportModule = function() return l10n end },
    }, { __index = _G }))
    if not pcall(chunk) then return {} end
    local fn = l10n[field][locale]
    local ok, t = pcall(fn)
    return ok and type(t) == "table" and t or {}
end

---------------------------------------------------------------------------
-- Converting
---------------------------------------------------------------------------
local function round2(v) return math.floor(v * 100 + 0.5) / 100 end

-- { [areaID] = { { x, y }, ... } } -> { [uiMapID] = { x, y, x, y, ... } }: unknown zones and
-- the -1, -1 of "inside an instance" are left out, as Ding always did.
local function spawnsByMap(spawns)
    if type(spawns) ~= "table" then return nil end
    local maps, any = {}, false
    local areas = {}
    for area in pairs(spawns) do areas[#areas + 1] = area end
    table.sort(areas)
    for _, area in ipairs(areas) do
        local map = areaToMap[area]
        local coords = spawns[area]
        if map and type(coords) == "table" then
            for _, c in ipairs(coords) do
                if type(c) == "table" and type(c[1]) == "number" and type(c[2]) == "number"
                    and c[1] >= 0 and c[2] >= 0 then
                    local list = maps[map] or {}
                    maps[map] = list
                    list[#list + 1] = round2(c[1])
                    list[#list + 1] = round2(c[2])
                    any = true
                end
            end
        end
    end
    return any and maps or nil
end

-- The dungeon (AreaID) of spawns that are all inside one: none of them on a map outside.
local function dungeonOf(spawns)
    if type(spawns) ~= "table" or spawnsByMap(spawns) then return nil end
    local areas = {}
    for area in pairs(spawns) do areas[#areas + 1] = area end
    table.sort(areas)
    for _, area in ipairs(areas) do
        if dungeonsBySide.Alliance[area] then return area end
    end
    return nil
end

local function convert(kind, row)
    local rec = {}
    for i, f in ipairs(LAYOUT[kind]) do
        local v
        if f.from == false then
            v = nil
        elseif f.name == "dungeon" then
            v = dungeonOf(row[tonumber(f.from:match("%d+"))])
        else
            v = row[f.from]
        end
        if f.name == "spawns" then
            v = spawnsByMap(v)
        elseif f.name == "triggerEnd" and type(v) == "table" then
            v = { v[1], spawnsByMap(v[2]) }
        end
        if type(v) == "table" and next(v) == nil then v = nil end
        rec[i] = v
    end
    return rec
end

---------------------------------------------------------------------------
-- Writing compact Lua
---------------------------------------------------------------------------
local function num(v)
    if v == math.floor(v) and math.abs(v) < 2 ^ 53 then return ("%.0f"):format(v) end
    local s = ("%.2f"):format(v):gsub("0+$", ""):gsub("%.$", "")
    if tonumber(s) == v then return s end
    return ("%.17g"):format(v)
end

local serialize
local function isList(t)
    local n = 0
    for _ in pairs(t) do n = n + 1 end
    for i = 1, n do if t[i] == nil then return false end end
    return true
end
function serialize(v)
    local kind = type(v)
    if kind == "number" then return num(v) end
    if kind == "string" then return (("%q"):format(v):gsub("\\\n", "\\n")) end
    if kind == "boolean" then return tostring(v) end
    if kind == "nil" then return "nil" end
    assert(kind == "table", "cannot write a " .. kind)
    local parts = {}
    if isList(v) then
        for i = 1, #v do parts[i] = serialize(v[i]) end
        return "{" .. table.concat(parts, ",") .. "}"
    end
    local keys = {}
    for k in pairs(v) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b)
        if type(a) == type(b) then return a < b end
        return type(a) == "number"
    end)
    for _, k in ipairs(keys) do
        local key = type(k) == "number" and ("[" .. num(k) .. "]") or ("[" .. ("%q"):format(k) .. "]")
        parts[#parts + 1] = key .. "=" .. serialize(v[k])
    end
    return "{" .. table.concat(parts, ",") .. "}"
end

-- A positional record with holes: { a, nil, c } keeps its positions.
local function record(rec, size)
    local last = 0
    for i = 1, size do if rec[i] ~= nil then last = i end end
    local parts = {}
    for i = 1, last do parts[i] = serialize(rec[i]) end
    return "{" .. table.concat(parts, ",") .. "}"
end

local HEADER = [[
-- Generated by tools/build_data.lua from %s (Forever): do not edit, run the tool again.
-- Game data from Questie (https://github.com/Questie/Questie) and QuestieDB
-- (https://github.com/Questie/QuestieDB), under the GNU General Public License v3; see
-- Ding/DB/CREDITS.md.
]]

local CHUNK = 500   -- records per function: Lua 5.1 limits the constants of one function

local written = {}
local function write(name, body)
    local path = out .. "/" .. name
    local f = assert(io.open(path, "wb"))
    f:write(HEADER:format(source), body)
    f:close()
    written[#written + 1] = name
end

local function sortedIds(t)
    local ids = {}
    for id in pairs(t) do ids[#ids + 1] = id end
    table.sort(ids)
    return ids
end

-- Records of one kind, in chunks: `t[id] = { ... }` statements inside small functions.
local function table_(var, ids, line)
    local parts = { "local _, Ding = ...\nlocal t = Ding.DB." .. var .. "\n" }
    for start = 1, #ids, CHUNK do
        parts[#parts + 1] = "do local function f()\n"
        for i = start, math.min(start + CHUNK - 1, #ids) do
            parts[#parts + 1] = "t[" .. ids[i] .. "]=" .. line(ids[i]) .. "\n"
        end
        parts[#parts + 1] = "end f() end\n"
    end
    return table.concat(parts)
end

local function sizeOf(name)
    local f = io.open(out .. "/" .. name, "rb")
    if not f then return 0 end
    local n = f:seek("end")
    f:close()
    return n
end

---------------------------------------------------------------------------
-- The files
---------------------------------------------------------------------------
os.execute((package.config:sub(1, 1) == "\\" and 'mkdir "%s\\Locales" 2>nul' or 'mkdir -p "%s/Locales"')
    :format((out:gsub(package.config:sub(1, 1) == "\\" and "/" or "\\", package.config:sub(1, 1)))))

---------------------------------------------------------------------------
-- The records in memory: Questie's data, then DingDB's corrections on top
---------------------------------------------------------------------------
local KINDS = { "Quest", "Npc", "Object", "Item" }
local VAR = { Quest = "quests", Npc = "npcs", Object = "objects", Item = "items" }
local POS = {}
for _, kind in ipairs(KINDS) do
    POS[kind] = {}
    for i, f in ipairs(LAYOUT[kind]) do POS[kind][f.name] = i end
end

local records = {}
for _, kind in ipairs(KINDS) do
    records[kind] = {}
    for id, row in pairs(db[kind]) do records[kind][id] = convert(kind, row) end
end

-- Names in each language: QuestieDB's, by kind.
local NAME = { Quest = function(v) return type(v) == "table" and v[1] or v end,
    Npc = function(v) return type(v) == "table" and v[1] or v end,
    Object = function(v) return v end, Item = function(v) return v end }
local names = {}
for _, locale in ipairs(LOCALES) do
    names[locale] = {}
    for _, kind in ipairs(KINDS) do
        names[locale][kind] = {}
        for id, v in pairs(lookup(kind, locale)) do
            local name = NAME[kind](v)
            if type(id) == "number" and type(name) == "string" and name ~= "" then names[locale][kind][id] = name end
        end
    end
end

local corrections, problems = C.load(correctionsDir)
for _, f in ipairs(corrections) do
    for _, e in ipairs(C.check(f.data, f.file)) do problems[#problems + 1] = e end
end
if #problems > 0 then
    io.stderr:write("DingDB corrections refused (tools/check_data.lua shows them too):\n  "
        .. table.concat(problems, "\n  ") .. "\n")
    os.exit(1)
end
local corrected = C.apply(corrections, records, names, POS)

---------------------------------------------------------------------------
-- The files
---------------------------------------------------------------------------
local layout = {}
for _, kind in ipairs(KINDS) do
    local list = {}
    for i, f in ipairs(LAYOUT[kind]) do list[i] = ("%s = %d"):format(f.name, i) end
    layout[#layout + 1] = ("    %s = { %s },"):format(kind, table.concat(list, ", "))
end
local correctedIds = {}
for _, kind in ipairs(KINDS) do correctedIds[VAR[kind]] = sortedIds(corrected[VAR[kind]]) end
write("DB.lua", ([[
-- DingDB, Ding's game database: what Core/Data.lua reads (and LibDingDB shows other addons).
-- Records are positional; LAYOUT gives each field's position. Spawns: { [uiMapID] = { x, y, x,
-- y, ... } } (0-100). `corrected`: the ids DingDB's own corrections changed (docs/dingdb.md).
local _, Ding = ...
Ding.DB = {
    source = %q,
    LAYOUT = {
%s
    },
    corrected = %s,
    quests = {}, npcs = {}, objects = {}, items = {},
    zones = { areaToUiMap = {}, dungeons = {}, dungeonsHorde = {}, dungeonNames = {} },
    names = { quests = {}, npcs = {}, objects = {}, items = {} },
}
]]):format(source, table.concat(layout, "\n"), serialize(correctedIds)))

-- Zones: AreaID -> UiMapID, and dungeon entrances as { uiMapID, x, y }.
do
    local parts = { "local _, Ding = ...\nlocal z = Ding.DB.zones\nz.areaToUiMap = " .. serialize(areaToMap) .. "\n" }
    local function entrances(entries)
        local dungeons = {}
        for area, entry in pairs(entries) do
            local list = {}
            if type(entry) == "table" and type(entry[4]) == "table" then
                for _, at in ipairs(entry[4]) do
                    local map = type(at) == "table" and areaToMap[at[1]]
                    if map and at[2] and at[3] then list[#list + 1] = { map, round2(at[2]), round2(at[3]) } end
                end
            end
            if #list > 0 then dungeons[area] = list end
        end
        return dungeons
    end
    local alliance, horde = entrances(dungeonsBySide.Alliance), entrances(dungeonsBySide.Horde)
    -- The Horde's own entrances: only where they differ from the Alliance's.
    local hordeOnly = {}
    for area, list in pairs(horde) do
        if serialize(list) ~= serialize(alliance[area] or {}) then hordeOnly[area] = list end
    end
    parts[#parts + 1] = "z.dungeons = " .. serialize(alliance) .. "\n"
    parts[#parts + 1] = "z.dungeonsHorde = " .. serialize(hordeOnly) .. "\n"
    -- English names of the dungeons (the client names them in its own language when it can).
    local names = {}
    for area, entry in pairs(dungeonsBySide.Alliance) do
        if type(entry) == "table" and type(entry[1]) == "string" then names[area] = entry[1] end
    end
    parts[#parts + 1] = "z.dungeonNames = " .. serialize(names) .. "\n"
    write("Zones.lua", table.concat(parts))
end

local counts = {}
for _, spec in ipairs({ { "Quest", "Quests.lua" }, { "Npc", "Npcs.lua" }, { "Object", "Objects.lua" },
    { "Item", "Items.lua" } }) do
    local kind, file = spec[1], spec[2]
    local ids = sortedIds(records[kind])
    counts[kind] = #ids
    local size = #LAYOUT[kind]
    write(file, table_(VAR[kind], ids, function(id) return record(records[kind][id], size) end))
end

-- Names in each language, loaded only by a client in that language.
for _, locale in ipairs(LOCALES) do
    local parts = { ("if GetLocale() ~= %q then return end\nlocal _, Ding = ...\nlocal n = Ding.DB.names\n"):format(locale) }
    for _, kind in ipairs(KINDS) do
        local byId = names[locale][kind] or {}
        local ids = {}
        for id in pairs(byId) do
            if records[kind][id] then ids[#ids + 1] = id end
        end
        table.sort(ids)
        for start = 1, #ids, CHUNK * 4 do
            parts[#parts + 1] = "do local t = n." .. VAR[kind] .. " local function f()\n"
            for i = start, math.min(start + CHUNK * 4 - 1, #ids) do
                parts[#parts + 1] = "t[" .. ids[i] .. "]=" .. serialize(byId[ids[i]]) .. "\n"
            end
            parts[#parts + 1] = "end f() end\n"
        end
    end
    write("Locales/" .. locale .. ".lua", table.concat(parts))
end

local total, fixes = 0, 0
for _, name in ipairs(written) do total = total + sizeOf(name) end
for _, list in pairs(correctedIds) do fixes = fixes + #list end
print(("DingDB from %s: %d quests, %d NPCs, %d objects, %d items, %d zones; %d corrections from %d files; %d files, %.1f MB")
    :format(source, counts.Quest, counts.Npc, counts.Object, counts.Item, #sortedIds(areaToMap), fixes,
        #corrections, #written, total / 1048576))
