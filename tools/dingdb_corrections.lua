-- DingDB's corrections and additions (tools/data/corrections/*.lua): reading, checking, and
-- applying them on top of the records built from Questie's data. Shared by build_data.lua and
-- check_data.lua; the format is in docs/dingdb.md.
local M = {}

M.KINDS = { quests = "Quest", npcs = "Npc", objects = "Object", items = "Item" }
M.LOCALES = { deDE = true, esES = true, esMX = true, frFR = true, koKR = true, ptBR = true,
    ruRU = true, zhCN = true, zhTW = true }

-- The fields a correction may set, by kind, with their shape.
M.FIELDS = {
    Quest = { name = "string", startedBy = "givers", finishedBy = "givers", requiredLevel = "level",
        questLevel = "level", requiredRaces = "mask", requiredClasses = "mask", triggerEnd = "trigger",
        objectives = "objectives", sourceItemId = "id", preQuestGroup = "ids", preQuestSingle = "ids" },
    Npc = { name = "string", minLevel = "level", maxLevel = "level", rank = "rank", spawns = "spawns",
        friendlyToFaction = "faction", subName = "string", npcFlags = "mask", dungeon = "id" },
    Object = { name = "string", spawns = "spawns", dungeon = "id" },
    Item = { name = "string", npcDrops = "ids", objectDrops = "ids", vendors = "ids" },
}

local function isId(v) return type(v) == "number" and v == math.floor(v) and v > 0 and v < 2 ^ 31 end
local function isIds(v)
    if type(v) ~= "table" then return false end
    local n = 0
    for _ in pairs(v) do n = n + 1 end
    for i = 1, n do if not isId(v[i]) then return false end end
    return true
end
local function isSpawns(v)
    if type(v) ~= "table" or next(v) == nil then return false end
    for map, coords in pairs(v) do
        if not isId(map) or type(coords) ~= "table" or #coords == 0 or #coords % 2 ~= 0 then return false end
        for _, c in ipairs(coords) do
            if type(c) ~= "number" or c < 0 or c > 100 then return false end
        end
    end
    return true
end

local SHAPES = {
    string = function(v) return type(v) == "string" and v ~= "" and #v <= 200 end,
    level = function(v) return type(v) == "number" and v == math.floor(v) and v >= -1 and v <= 100 end,
    mask = function(v) return type(v) == "number" and v == math.floor(v) and v >= 0 and v < 2 ^ 53 end,
    rank = function(v) return type(v) == "number" and v == math.floor(v) and v >= 0 and v <= 4 end,
    id = isId,
    ids = isIds,
    spawns = isSpawns,
    faction = function(v) return v == "A" or v == "H" or v == "AH" end,
    -- { npc ids?, object ids?, item ids? }
    givers = function(v)
        if type(v) ~= "table" then return false end
        for k, list in pairs(v) do
            if not (k == 1 or k == 2 or k == 3) or not isIds(list) then return false end
        end
        return true
    end,
    -- { text, spawns }: an area to reach
    trigger = function(v) return type(v) == "table" and type(v[1]) == "string" and isSpawns(v[2]) end,
    -- QuestieDB's objectives: { [1] creatures, [2] objects, [3] items, [4] reputation,
    -- [5] kill credit, [6] spells }, each a list of tables starting with an id (or a list of ids)
    objectives = function(v)
        if type(v) ~= "table" then return false end
        for k, list in pairs(v) do
            if type(k) ~= "number" or k < 1 or k > 6 or type(list) ~= "table" then return false end
            for _, o in ipairs(list) do
                if type(o) ~= "table" or not (isId(o[1]) or isIds(o[1])) then return false end
            end
        end
        return true
    end,
}

-- Every correction file of `dir`, sorted by name: { { file = name, data = table } }, plus
-- errors for the files that cannot be read. A file runs in an empty environment: data only.
function M.load(dir)
    local files, errors = {}, {}
    local windows = package.config:sub(1, 1) == "\\"
    local list = io.popen(windows and ('dir /b "' .. dir:gsub("/", "\\") .. '\\*.lua" 2>nul')
        or ('ls "' .. dir .. '" 2>/dev/null'))
    local names = {}
    for name in list:lines() do
        if name:find("%.lua$") then names[#names + 1] = name end
    end
    list:close()
    table.sort(names)
    for _, name in ipairs(names) do
        local chunk, err = loadfile(dir .. "/" .. name)
        if not chunk then
            errors[#errors + 1] = name .. ": " .. tostring(err)
        else
            setfenv(chunk, {})
            local ok, data = pcall(chunk)
            if not ok then
                errors[#errors + 1] = name .. ": " .. tostring(data)
            elseif type(data) ~= "table" then
                errors[#errors + 1] = name .. ": must return a table"
            else
                files[#files + 1] = { file = name, data = data }
            end
        end
    end
    return files, errors
end

-- Errors of one correction table (file = its name, for the messages).
function M.check(data, file)
    local errors = {}
    local function err(fmt, ...) errors[#errors + 1] = file .. ": " .. fmt:format(...) end
    for key, list in pairs(data) do
        local kind = M.KINDS[key]
        if key == "names" then
            if type(list) ~= "table" then err("names must be a table") else
                for locale, kinds in pairs(list) do
                    if not M.LOCALES[locale] then err("names: unknown language %s", tostring(locale))
                    elseif type(kinds) ~= "table" then err("names.%s must be a table", locale)
                    else
                        for k, byId in pairs(kinds) do
                            if not M.KINDS[k] or type(byId) ~= "table" then err("names.%s: unknown kind %s", locale, tostring(k))
                            else
                                for id, name in pairs(byId) do
                                    if not isId(id) or not SHAPES.string(name) then
                                        err("names.%s.%s[%s]: a name (text) by id", locale, k, tostring(id))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif not kind then
            err("unknown section %s (quests, npcs, objects, items, names)", tostring(key))
        elseif type(list) ~= "table" then
            err("%s must be a table", key)
        else
            for id, rec in pairs(list) do
                if not isId(id) then err("%s: %s is not an id", key, tostring(id))
                elseif rec ~= false then
                    if type(rec) ~= "table" then err("%s[%d]: a table of fields, or false to remove it", key, id)
                    else
                        for field, v in pairs(rec) do
                            local shape = M.FIELDS[kind][field]
                            if not shape then err("%s[%d]: unknown field %s", key, id, tostring(field))
                            elseif v ~= false and not SHAPES[shape](v) then
                                err("%s[%d].%s: not a valid %s", key, id, field, shape)
                            end
                        end
                    end
                end
            end
        end
    end
    table.sort(errors)
    return errors
end

-- Applies the corrections in file order: records[kind][id] = positional record (pos[kind][field]
-- gives a field's position), names[locale][kind][id] = name. A field set to false is removed; a
-- record set to false is removed. Returns the corrected ids: { quests = { [id] = true }, ... }.
function M.apply(files, records, names, pos)
    local corrected = { quests = {}, npcs = {}, objects = {}, items = {} }
    for _, f in ipairs(files) do
        for key, list in pairs(f.data) do
            local kind = M.KINDS[key]
            if kind then
                for id, rec in pairs(list) do
                    corrected[key][id] = true
                    if rec == false then
                        records[kind][id] = nil
                    else
                        local target = records[kind][id] or {}
                        records[kind][id] = target
                        for field, v in pairs(rec) do
                            target[pos[kind][field]] = (v ~= false) and v or nil
                        end
                    end
                end
            end
        end
        for locale, kinds in pairs(f.data.names or {}) do
            names[locale] = names[locale] or {}
            for k, byId in pairs(kinds) do
                local kind = M.KINDS[k]
                names[locale][kind] = names[locale][kind] or {}
                for id, name in pairs(byId) do names[locale][kind][id] = name end
            end
        end
    end
    return corrected
end

return M
