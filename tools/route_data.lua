-- Reads what the route optimizer needs from a QuestieDB checkout, at generation time only
-- (nothing from QuestieDB is ever written into Ding): world geometry of the maps, spawn
-- groups, objective counts, drop rates and quest XP.
-- usage: local D = dofile("tools/route_data.lua").new(db, combinedDir)
--   db: tables loaded by questiedb_export.lua; combinedDir: .../src/corrections/Forever/combined
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local X = dofile(here .. "/questiedb_export.lua")
local Model = dofile(here .. "/route_model.lua")
local QK = X.QUEST

local M = {}

-- Islands: land masses of a continent reached by boat only (UiMapID -> name).
M.ISLANDS = { [1438] = "teldrassil", [1457] = "teldrassil" }
-- Five-player dungeons (AreaID of the instance, where QuestieDB puts the spawns inside it)
-- and their names: our own list, from the game. Raids are left out.
M.DUNGEONS = {
    [2437] = "Ragefire Chasm", [718] = "Wailing Caverns", [1581] = "The Deadmines",
    [209] = "Shadowfang Keep", [719] = "Blackfathom Deeps", [717] = "The Stockade",
    [721] = "Gnomeregan", [491] = "Razorfen Kraul", [796] = "Scarlet Monastery",
    [722] = "Razorfen Downs", [1337] = "Uldaman", [1176] = "Zul'Farrak", [2100] = "Maraudon",
    [1477] = "The Temple of Atal'Hakkar", [1584] = "Blackrock Depths", [1583] = "Blackrock Spire",
    [2557] = "Dire Maul", [2017] = "Stratholme", [2057] = "Scholomance",
}
-- Map size assumed when the geometry of a map is unknown (yards).
local FALLBACK_SIZE = { 4000, 2667 }

---------------------------------------------------------------------------
-- Minimal JSON reader (objects, arrays, strings, numbers, true/false/null)
---------------------------------------------------------------------------
function M.decodeJSON(text)
    local pos = 1
    local function skip()
        pos = text:find("[^ \t\r\n]", pos) or (#text + 1)
    end
    local value
    local function str()
        local out, i = {}, pos + 1
        while true do
            local c = text:sub(i, i)
            if c == "" then error("JSON: unterminated string") end
            if c == '"' then break end
            if c == "\\" then
                local n = text:sub(i + 1, i + 1)
                local map = { n = "\n", t = "\t", r = "\r", b = "\b", f = "\f" }
                if n == "u" then
                    local code = tonumber(text:sub(i + 2, i + 5), 16) or 63
                    out[#out + 1] = code < 128 and string.char(code) or "?"
                    i = i + 6
                else
                    out[#out + 1] = map[n] or n
                    i = i + 2
                end
            else
                out[#out + 1] = c
                i = i + 1
            end
        end
        pos = i + 1
        return table.concat(out)
    end
    function value()
        skip()
        local c = text:sub(pos, pos)
        if c == "{" then
            local obj = {}
            pos = pos + 1
            skip()
            if text:sub(pos, pos) == "}" then pos = pos + 1 return obj end
            while true do
                skip()
                local key = str()
                skip()
                assert(text:sub(pos, pos) == ":", "JSON: ':' expected")
                pos = pos + 1
                obj[key] = value()
                skip()
                local sep = text:sub(pos, pos)
                pos = pos + 1
                if sep == "}" then return obj end
                assert(sep == ",", "JSON: ',' expected")
            end
        elseif c == "[" then
            local arr = {}
            pos = pos + 1
            skip()
            if text:sub(pos, pos) == "]" then pos = pos + 1 return arr end
            while true do
                arr[#arr + 1] = value()
                skip()
                local sep = text:sub(pos, pos)
                pos = pos + 1
                if sep == "]" then return arr end
                assert(sep == ",", "JSON: ',' expected")
            end
        elseif c == '"' then
            return str()
        elseif text:sub(pos, pos + 3) == "true" then
            pos = pos + 4 return true
        elseif text:sub(pos, pos + 4) == "false" then
            pos = pos + 5 return false
        elseif text:sub(pos, pos + 3) == "null" then
            pos = pos + 4 return nil
        end
        local num = text:match("^-?%d+%.?%d*[eE]?[-+]?%d*", pos)
        assert(num and #num > 0, "JSON: unexpected value at position " .. pos)
        pos = pos + #num
        return tonumber(num)
    end
    return value()
end

---------------------------------------------------------------------------
-- Objective counts from the quest's objective text ("Kill 10 Kobold Vermin...")
---------------------------------------------------------------------------
local function words(s)
    local out = {}
    for w in s:lower():gmatch("[%w']+") do out[#out + 1] = w end
    return out
end

-- Do the words after a number name this target? Plurals are allowed on the last word
-- ("Young Wolf" matches "12 Young Wolves"), and up to two words may come first ("8 pieces
-- of Tough Wolf Meat").
local function namesTarget(after, target)
    if #target == 0 then return false end
    for skip = 0, 2 do
        if #after - skip < #target then return false end
        local same = true
        for i = 1, #target - 1 do
            if after[skip + i] ~= target[i] then same = false break end
        end
        local last, said = target[#target], after[skip + #target]
        local n = math.max(3, #last - 2)
        if same and said:sub(1, n) == last:sub(1, n) then return true end
    end
    return false
end

-- Count the text asks for `name`, or nil. A number before the name gives it; "a", "an",
-- "the" or "one" before the name, or the name in a text without any number ("Bring a
-- Prairie Wolf Heart, Flatland Cougar Femur and Swoop Gizzard"), mean one. `single`: the
-- quest has one objective, so a lone number in the text is its count.
function M.countInText(text, name, single)
    if type(text) ~= "string" or text == "" then return nil end
    local target = name and words(name) or {}
    local numbers = 0
    local lone
    for num, rest in text:gmatch("(%d+)%s+([^%d]*)") do
        numbers = numbers + 1
        lone = tonumber(num)
        if namesTarget(words(rest), target) then
            return math.max(1, math.min(40, tonumber(num)))
        end
    end
    if #target > 0 then
        local all = words(text)
        for i = 1, #all - #target + 1 do
            local same = true
            for j = 1, #target do
                if all[i + j - 1] ~= target[j] then same = false break end
            end
            local before = all[i - 1]
            if same and (numbers == 0 or before == "a" or before == "an" or before == "the" or before == "one") then
                return 1
            end
        end
    end
    if single and numbers == 1 and lone and lone >= 1 and lone <= 40 then return lone end
    return nil
end

---------------------------------------------------------------------------
-- Instance
---------------------------------------------------------------------------
function M.new(db, combined)
    local D = { db = db }
    local qdbRoot = combined:gsub("[/\\]src[/\\]corrections[/\\]Forever[/\\]combined[/\\]?$", "")
    local support = qdbRoot .. "/support/Forever"
    local P = Model.PARAMS

    -- QuestieDB support modules are written for QuestieLoader: run them in a sandbox.
    local function sandboxLoad(path, private, imports)
        local chunk = loadfile(path)
        if not chunk then return false end
        local module = { private = private }
        local loader = {
            ImportModule = function(_, name) return (imports and imports[name]) or module end,
            CreateModule = function() return module end,
        }
        setfenv(chunk, setmetatable({ QuestieLoader = loader }, { __index = _G }))
        local ok = pcall(chunk)
        return ok and module
    end

    -- AreaID -> UiMapID
    D.areaToMap = {}
    do
        local private = {}
        local module = sandboxLoad(support .. "/Zones/areaIdToUiMapId.lua", private)
        if not module then
            error("Cannot read " .. support .. "/Zones/areaIdToUiMapId.lua", 0)
        end
        for _, key in ipairs({ "areaIdToUiMapId", "areaIdToUiMapIdOverride" }) do
            local src = private[key]
            if type(src) == "string" then src = loadstring(src)() end
            for area, map in pairs(src or {}) do D.areaToMap[area] = map end
        end
    end

    -- Quest XP: { [questID] = { questLevel, xp } }
    D.questXPTable = {}
    do
        local module = sandboxLoad(support .. "/QuestXP/xpDB-classic.lua", {})
        if module and type(module.db) == "table" then D.questXPTable = module.db end
    end

    -- Drop rates (percent): Wowhead data, then cMaNGOS, then QuestieDB's own corrections.
    local drops = {}
    do
        local WOWHEAD = {}
        local module = sandboxLoad(support .. "/DropTables/classicItemDrops.lua", {})
        local function decode(src)
            if type(src) == "string" then
                local f = loadstring(src)
                return f and f() or {}
            end
            return type(src) == "table" and src or {}
        end
        local wowhead = module and decode(module.wowheadData) or {}
        local cmangos = module and decode(module.cmangosData) or {}
        local corrections = sandboxLoad(support .. "/DropTables/itemDropCorrections.lua", {},
            { DropDB = { correctionKeys = { WOWHEAD = WOWHEAD } } })
        for _, src in ipairs({ cmangos, wowhead }) do
            for item, npcs in pairs(src) do
                drops[item] = drops[item] or {}
                for npc, rate in pairs(npcs) do drops[item][npc] = rate end
            end
        end
        for item, npcs in pairs(corrections and corrections.Era or {}) do
            for npc, rate in pairs(npcs) do
                if type(rate) == "number" then
                    drops[item] = drops[item] or {}
                    drops[item][npc] = rate
                end
            end
        end
    end

    -- World bounds of each UiMap (yards) and its continent, from QuestieDB's conversion
    -- manifest of the Forever client's map geometry.
    local bounds = {}
    D.geometry = false
    do
        local f = io.open(qdbRoot .. "/data/Forever/conversion.json", "r")
        if f then
            local text = f:read("*a")
            f:close()
            local ok, data = pcall(M.decodeJSON, text)
            if ok and type(data) == "table" and data.geometry then
                for _, t in ipairs(data.geometry.transforms or {}) do
                    local b = t.target_bounds
                    if b and t.ui_map_id and t.map_id then
                        bounds[t.ui_map_id] = { left = b.left, right = b.right, top = b.top,
                            bottom = b.bottom, continent = t.map_id }
                    end
                end
                D.geometry = true
            end
        end
    end

    ---------------------------------------------------------------------------
    -- Points: { map, px, py (map percent), x, y (world yards), region, continent }
    ---------------------------------------------------------------------------
    function D.point(map, px, py)
        local b = bounds[map]
        if b then
            return {
                map = map, px = px, py = py,
                x = b.left + (b.right - b.left) * px / 100,
                y = b.top + (b.bottom - b.top) * py / 100,
                continent = b.continent,
                region = b.continent .. ":" .. (M.ISLANDS[map] or "main"),
            }
        end
        return { map = map, px = px, py = py, x = FALLBACK_SIZE[1] * px / 100,
            y = FALLBACK_SIZE[2] * py / 100, region = "map:" .. map }
    end

    function D.dist(a, b)
        return Model.distance(a, b)
    end

    function D.spawnPoints(spawns, maps, out)
        out = out or {}
        if type(spawns) ~= "table" then return out end
        local areas = {}
        for area in pairs(spawns) do areas[#areas + 1] = area end
        table.sort(areas)
        for _, area in ipairs(areas) do
            local map, list = D.areaToMap[area], spawns[area]
            if map and map ~= 0 and (not maps or maps[map]) and type(list) == "table" then
                for _, p in ipairs(list) do
                    if type(p) == "table" and p[1] and p[1] >= 0 then
                        out[#out + 1] = D.point(map, p[1], p[2])
                    end
                end
            end
        end
        return out
    end

    function D.npcPoints(id, maps)
        local npc = db.Npc[id]
        return npc and D.spawnPoints(npc[X.NPC.spawns], maps) or {}
    end
    function D.objectPoints(id, maps)
        local obj = db.Object[id]
        return obj and D.spawnPoints(obj[X.OBJECT.spawns], maps) or {}
    end
    function D.npcRank(id)
        local npc = db.Npc[id]
        return npc and npc[6] or 0
    end
    function D.npcLevel(id)
        local npc = db.Npc[id]
        if not npc then return nil end
        local lo, hi = npc[4] or 0, npc[5] or 0
        if lo <= 0 then return nil end
        return (lo + math.max(lo, hi)) / 2
    end

    -- NPCs with a service flag (QuestieDB's npcFlags, Classic values), friendly to a faction
    -- ("Alliance", "Horde"; nil: any): { { id, name, area, point, faction = "A" | "H" | "AH" }, ... },
    -- one per spawn, sorted by id.
    local FACTION_CODE = { Alliance = "A", Horde = "H" }
    local function npcsWithFlag(flag, faction)
        local ids = {}
        for id, npc in pairs(db.Npc) do
            if X.hasBit(npc[15] or 0, flag) then ids[#ids + 1] = id end
        end
        table.sort(ids)
        local out = {}
        for _, id in ipairs(ids) do
            local npc = db.Npc[id]
            local code = npc[13]
            if not faction or code == "AH" or code == FACTION_CODE[faction] then
                local areas = {}
                for area in pairs(type(npc[X.NPC.spawns]) == "table" and npc[X.NPC.spawns] or {}) do areas[#areas + 1] = area end
                table.sort(areas)
                for _, area in ipairs(areas) do
                    local map = D.areaToMap[area]
                    for _, p in ipairs(map and npc[X.NPC.spawns][area] or {}) do
                        if type(p) == "table" and p[1] and p[1] >= 0 then
                            out[#out + 1] = { id = id, name = npc[X.NPC.name], area = area, point = D.point(map, p[1], p[2]),
                                faction = code }
                        end
                    end
                end
            end
        end
        return out
    end
    function D.flightMasters(faction) return npcsWithFlag(8, faction) end
    function D.innkeepers(faction) return npcsWithFlag(128, faction) end
    function D.spiritHealers() return npcsWithFlag(32) end

    -- Where a quest giver or ender stands (NPCs and objects; items are handled apart).
    function D.giverPoints(givers, maps)
        local out = {}
        if type(givers) ~= "table" then return out end
        for _, id in ipairs(givers[1] or {}) do D.spawnPoints(db.Npc[id] and db.Npc[id][X.NPC.spawns], maps, out) end
        for _, id in ipairs(givers[2] or {}) do D.spawnPoints(db.Object[id] and db.Object[id][X.OBJECT.spawns], maps, out) end
        return out
    end

    -- Base XP of a quest, and true when it is an estimate (no figure in the QuestXP table).
    function D.questXP(q, quest)
        local entry = D.questXPTable[q]
        if entry and entry[2] then return entry[2], false end
        local level = quest and quest[QK.questLevel] or 0
        return Model.defaultQuestXP(math.max(1, level)), true
    end

    -- Drop chance (0-1) of an item on a monster, or nil when unknown.
    function D.dropRate(item, npc)
        local rate = drops[item] and drops[item][npc]
        return rate and rate > 0 and math.min(1, rate / 100) or nil
    end

    ---------------------------------------------------------------------------
    -- Spawn groups: up to k places where a target is densest
    ---------------------------------------------------------------------------
    -- Returns { { at = point, n = spawns within radius, spacing = yards, mobLevel }, ... },
    -- best first. mobLevel: average level of the monsters within radius (points tagged with
    -- one by questJobs), nil when untagged.
    function D.clusters(points, radius, k)
        local out = {}
        local count = #points
        if count == 0 then return out end
        local step = math.max(1, math.floor(count / 300))
        local cands = {}
        for i = 1, count, step do
            local p, n = points[i], 0
            local levels, tagged = 0, 0
            local minX, maxX, minY, maxY = p.x, p.x, p.y, p.y
            for j = 1, count do
                local q = points[j]
                local d = Model.distance(p, q)
                if d and d <= radius then
                    n = n + 1
                    if q.mobLevel then levels, tagged = levels + q.mobLevel, tagged + 1 end
                    if q.x < minX then minX = q.x elseif q.x > maxX then maxX = q.x end
                    if q.y < minY then minY = q.y elseif q.y > maxY then maxY = q.y end
                end
            end
            local spacing = 0
            if n > 1 then
                local area = math.max(maxX - minX, 20) * math.max(maxY - minY, 20)
                spacing = math.max(P.minSpacing, math.min(P.maxSpacing, math.sqrt(area / n)))
            end
            cands[#cands + 1] = { at = p, n = n, spacing = spacing, i = i,
                mobLevel = tagged > 0 and levels / tagged or nil }
        end
        table.sort(cands, function(a, b)
            if a.n ~= b.n then return a.n > b.n end
            return a.i < b.i
        end)
        for _, c in ipairs(cands) do
            local free = true
            for _, o in ipairs(out) do
                local d = Model.distance(c.at, o.at)
                if d and d < 2 * radius then free = false break end
            end
            if free then
                out[#out + 1] = c
                if #out >= k then break end
            end
        end
        return out
    end

    ---------------------------------------------------------------------------
    -- Objective jobs of a quest
    ---------------------------------------------------------------------------
    -- A job is one thing to do in the zone: { kind = "kill" | "object" | "vendor" | "explore",
    -- npc (main monster), npcs (set), count (kills or loots), points, mobLevel, label }.
    -- Returns jobs, killers (monsters killed: drops of item-started quests), elite, unknown.
    function D.questJobs(q, quest, maps)
        local jobs, killers, elite, unknown = {}, {}, false, false
        local objectives = quest[QK.objectives] or {}
        local text = quest[8]
        if type(text) == "table" then text = table.concat(text, " ") end
        local nObjectives = 0
        for _, group in pairs(objectives) do
            if type(group) == "table" then nObjectives = nObjectives + #group end
        end
        local single = nObjectives == 1

        local function countOf(name, spawnsTotal, default)
            local n = M.countInText(text, name, single)
            if n then return n end
            if spawnsTotal <= 2 then return 1 end
            return default
        end
        local function totalSpawns(kind, id)
            local row = kind == "npc" and db.Npc[id] or db.Object[id]
            local spawns = row and row[kind == "npc" and X.NPC.spawns or X.OBJECT.spawns]
            local n = 0
            for _, list in pairs(type(spawns) == "table" and spawns or {}) do
                if type(list) == "table" then n = n + #list end
            end
            return n
        end
        -- Average level of the monsters, weighted by their spawns in the zone (the player
        -- meets the common ones); each point keeps its own monster's level, so that each
        -- spawn group gets the level of the monsters found there (D.clusters).
        local function mobLevel(ids, points)
            local sum, n = 0, 0
            for _, id in ipairs(ids) do
                local l = D.npcLevel(id)
                if l then
                    for _, p in ipairs(points[id] or {}) do
                        p.mobLevel = l
                        sum, n = sum + l, n + 1
                    end
                end
            end
            return n > 0 and sum / n or nil
        end

        for _, o in ipairs(objectives[1] or {}) do
            local id = o[1]
            local npc = db.Npc[id]
            -- An objective on a quest giver or ender is someone to talk to (or a scripted
            -- event), not a monster: no kill, no monster level.
            local talk = npc and (X.hasEntries(npc[10]) or X.hasEntries(npc[11]))
            if not talk then
                killers[id] = true
                if D.npcRank(id) > 0 then elite = true end
            end
            local points = D.npcPoints(id, maps)
            if #points == 0 then
                unknown = "monster " .. id
            elseif talk then
                jobs[#jobs + 1] = { kind = "explore", npcs = {}, points = points, count = 0, label = "npc " .. id }
            else
                local name = db.Npc[id] and db.Npc[id][X.NPC.name]
                jobs[#jobs + 1] = { kind = "kill", npc = id, npcs = { [id] = true }, points = points,
                    count = countOf(name, totalSpawns("npc", id), P.defaultKills),
                    mobLevel = mobLevel({ id }, { [id] = points }), label = "monster " .. id }
            end
        end
        for _, o in ipairs(objectives[2] or {}) do
            local id = o[1]
            local points = D.objectPoints(id, maps)
            if #points == 0 then
                unknown = "object " .. id
            else
                local name = db.Object[id] and db.Object[id][X.OBJECT.name]
                jobs[#jobs + 1] = { kind = "object", points = points, npcs = {},
                    count = countOf(name, totalSpawns("object", id), P.defaultObjects),
                    label = "object " .. id }
            end
        end
        for _, o in ipairs(objectives[3] or {}) do
            local itemId = o[1]
            local item = db.Item[itemId]
            local name = item and item[X.ITEM.name]
            local fromStart = (quest[QK.sourceItemId] or 0) == itemId
            local npcPts, npcs, ids, eliteOnly, any = {}, {}, {}, true, false
            local byNpc = {}
            local rateSum, rateN, main, mainN = 0, 0, nil, 0
            for _, npcId in ipairs(item and item[X.ITEM.npcDrops] or {}) do
                local pts = D.npcPoints(npcId, maps)
                if #pts > 0 then
                    any = true
                    killers[npcId] = true
                    npcs[npcId] = true
                    ids[#ids + 1] = npcId
                    byNpc[npcId] = pts
                    if D.npcRank(npcId) == 0 then eliteOnly = false end
                    for _, p in ipairs(pts) do npcPts[#npcPts + 1] = p end
                    local rate = D.dropRate(itemId, npcId) or P.defaultDropRate
                    rateSum, rateN = rateSum + rate * #pts, rateN + #pts
                    if #pts > mainN then main, mainN = npcId, #pts end
                end
            end
            local objPts, vendorPts = {}, {}
            for _, objId in ipairs(item and item[X.ITEM.objectDrops] or {}) do
                D.spawnPoints(db.Object[objId] and db.Object[objId][X.OBJECT.spawns], maps, objPts)
            end
            for _, npcId in ipairs(item and item[14] or {}) do -- vendors
                D.spawnPoints(db.Npc[npcId] and db.Npc[npcId][X.NPC.spawns], maps, vendorPts)
            end
            if any and eliteOnly then elite = true end
            if any then
                local total = 0
                for _, id in ipairs(ids) do total = total + totalSpawns("npc", id) end
                local need = countOf(name, total, P.defaultItems)
                local rate = rateSum / rateN
                jobs[#jobs + 1] = { kind = "kill", npc = main, npcs = npcs, points = npcPts,
                    count = math.min(P.maxObjectiveKills, math.ceil(need / rate)), mobLevel = mobLevel(ids, byNpc),
                    label = "quest item " .. itemId }
            elseif #objPts > 0 then
                jobs[#jobs + 1] = { kind = "object", npcs = {}, points = objPts,
                    count = countOf(name, #objPts, P.defaultItems), label = "quest item " .. itemId }
            elseif #vendorPts > 0 then
                jobs[#jobs + 1] = { kind = "vendor", npcs = {}, points = vendorPts, count = 1,
                    label = "quest item " .. itemId }
            elseif not fromStart then
                -- An item handed out with the quest needs nothing; anything else is unknown.
                unknown = "quest item " .. itemId
            end
        end
        for _, o in ipairs(objectives[5] or {}) do
            local points, ids, npcs, main, mainN = {}, {}, {}, nil, 0
            local byNpc = {}
            for _, npcId in ipairs(o[1] or {}) do
                killers[npcId] = true
                if D.npcRank(npcId) > 0 then elite = true end
                local pts = D.npcPoints(npcId, maps)
                if #pts > 0 then
                    ids[#ids + 1] = npcId
                    byNpc[npcId] = pts
                    npcs[npcId] = true
                    for _, p in ipairs(pts) do points[#points + 1] = p end
                    if #pts > mainN then main, mainN = npcId, #pts end
                end
            end
            if #points == 0 then
                unknown = "credit " .. tostring(o[2])
            else
                local total = 0
                for _, id in ipairs(ids) do total = total + totalSpawns("npc", id) end
                jobs[#jobs + 1] = { kind = "kill", npc = main, npcs = npcs, points = points,
                    count = countOf(o[3], total, P.defaultKills), mobLevel = mobLevel(ids, byNpc),
                    label = "credit " .. tostring(o[2]) }
            end
        end
        if X.hasEntries(objectives[4]) then unknown = "reputation" end
        local trigger = quest[QK.triggerEnd]
        if type(trigger) == "table" and type(trigger[2]) == "table" then
            local points = D.spawnPoints(trigger[2], maps)
            if #points == 0 then
                unknown = "place to explore"
            else
                jobs[#jobs + 1] = { kind = "explore", npcs = {}, points = points, count = 0, label = "place to explore" }
            end
        end
        -- Two objectives on the same monster share their kills (wolves and wolf pelts).
        local merged, byNpc = {}, {}
        for _, job in ipairs(jobs) do
            local same = job.kind == "kill" and byNpc[job.npc]
            if same then
                same.count = math.max(same.count, job.count)
            else
                merged[#merged + 1] = job
                if job.kind == "kill" then byNpc[job.npc] = job end
            end
        end
        return merged, killers, elite, unknown
    end

    -- The dungeon a quest is done in, or nil: one of its objectives (monsters, objects, the
    -- monsters or objects that drop its items) is found only inside that dungeon.
    function D.questDungeon(quest)
        local objectives = quest[QK.objectives] or {}
        -- Sources of an objective: { { row, spawns field }, ... }; the dungeon when every one
        -- of their spawns lies inside it (one at least).
        local function only(sources)
            local name
            for _, src in ipairs(sources) do
                local spawns = src[1] and src[1][src[2]]
                for area in pairs(type(spawns) == "table" and spawns or {}) do
                    if not M.DUNGEONS[area] then return nil end
                    name = name or M.DUNGEONS[area]
                end
            end
            return name
        end
        local function npcs(ids, out)
            out = out or {}
            for _, id in ipairs(ids) do out[#out + 1] = { db.Npc[id], X.NPC.spawns } end
            return out
        end
        local function objects(ids, out)
            out = out or {}
            for _, id in ipairs(ids) do out[#out + 1] = { db.Object[id], X.OBJECT.spawns } end
            return out
        end
        local all = {}
        for _, o in ipairs(objectives[1] or {}) do all[#all + 1] = npcs({ o[1] }) end
        for _, o in ipairs(objectives[2] or {}) do all[#all + 1] = objects({ o[1] }) end
        for _, o in ipairs(objectives[3] or {}) do
            local item = db.Item[o[1]]
            if item then
                all[#all + 1] = objects(item[X.ITEM.objectDrops] or {}, npcs(item[X.ITEM.npcDrops] or {}))
            end
        end
        for _, o in ipairs(objectives[5] or {}) do all[#all + 1] = npcs(o[1] or {}) end
        for _, sources in ipairs(all) do
            local name = only(sources)
            if name then return name end
        end
        -- QuestieDB puts some monsters and events of an instance at its entrance, in the zone
        -- outside (Foreman Thistlenettle in Westfall): the quest's own zone tells then, for a
        -- quest that fights monsters or has an event to trigger. One that only talks, or picks
        -- objects outside (the Sapphires of Aku'Mai), stays outside.
        local dungeon = M.DUNGEONS[quest[QK.zoneOrSort] or 0]
        if dungeon then
            if #(objectives[1] or {}) > 0 or #(objectives[5] or {}) > 0 then return dungeon end
            if X.hasEntries(quest[QK.triggerEnd]) then return dungeon end
            for _, o in ipairs(objectives[3] or {}) do
                local item = db.Item[o[1]]
                if item and #(item[X.ITEM.npcDrops] or {}) > 0 then return dungeon end
            end
        end
        return nil
    end

    -- The class of a quest QuestieDB has no class data for (Forever's new content): the class
    -- whose trainer gives or ends it ("Mage Trainer"), or nil. Profession trainers do not count.
    function D.trainerClass(quest)
        for _, key in ipairs({ QK.startedBy, QK.finishedBy }) do
            local npcs = type(quest[key]) == "table" and quest[key][1] or {}
            for _, id in ipairs(npcs) do
                local npc = db.Npc[id]
                local title = npc and npc[14]
                local class = type(title) == "string" and title:match("^(%a+) Trainer$")
                if class and X.CLASS_BITS[class:upper()] then return class:upper() end
            end
        end
        return nil
    end

    -- Drop chance of an item-started quest's item on the monsters of the zone: the best known
    -- rate, or nil when QuestieDB has no figure.
    function D.startDropRate(givers, maps)
        local best
        for _, itemId in ipairs(type(givers) == "table" and givers[3] or {}) do
            local item = db.Item[itemId]
            for _, npcId in ipairs(item and item[X.ITEM.npcDrops] or {}) do
                if #D.npcPoints(npcId, maps) > 0 then
                    local rate = D.dropRate(itemId, npcId)
                    if rate and (not best or rate > best) then best = rate end
                end
            end
        end
        return best
    end

    return D
end

return M
