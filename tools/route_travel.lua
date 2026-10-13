-- Travel network of the route optimizer: how long a player takes from one point of the
-- world to another, on foot (mounted from level 40), by flight path between the flight
-- masters of the player's faction, and by boat, zeppelin or tram between land masses and continents.
-- (The hearthstone depends on the tour so far: tools/route_solver.lua handles it.)
-- usage: local Travel = dofile("tools/route_travel.lua")
--        local net = Travel.new(D, "Alliance", { areas = { [areaId] = true, ... } })
--        local seconds, yards = net:travel(a, b, level)
-- D: tools/route_data.lua (points, flight masters from QuestieDB's NPC flags). areas: the
-- zones whose flight masters the player knows (nil: all of them).
--
-- A trip is the best of: the straight walk (same land mass), or a walk to one of the network
-- nodes near the start, the shortest path between nodes (flights, transports, walks between
-- nodes of a land mass), and a walk from a node near the end. Shortest paths between nodes
-- are computed once per speed class (on foot, on foot with flights, mounted with flights),
-- trips are kept in a cache: a tour asks for the same trips over and over.
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local Model = dofile(here .. "/route_model.lua")

local M = {}

-- Boats, zeppelins and the tram: { name, faction ("A", "H", "AH"), end a, end b, seconds },
-- ends as { UiMapID, x, y }. Our own list, from the game (docks and towers placed by hand;
-- the zeppelin towers and the Booty Bay and Ratchet docks match their masters' spawns in
-- QuestieDB). Seconds: half a crossing's wait, then the crossing.
M.TRANSPORTS = {
    { "Menethil Harbor - Auberdine", "A", { 1437, 4.6, 57.1 }, { 1439, 32.4, 43.8 }, 330 },
    { "Menethil Harbor - Theramore", "A", { 1437, 5.0, 63.5 }, { 1445, 71.5, 56.4 }, 330 },
    { "Auberdine - Rut'theran Village", "A", { 1439, 33.2, 40.2 }, { 1438, 55.0, 94.5 }, 270 },
    { "Stormwind - Ironforge (Deeprun Tram)", "A", { 1453, 64.0, 33.0 }, { 1455, 76.6, 51.0 }, 120 },
    { "Booty Bay - Ratchet", "AH", { 1434, 26.0, 73.4 }, { 1413, 63.6, 38.6 }, 330 },
    { "Orgrimmar - Undercity", "H", { 1411, 50.8, 13.5 }, { 1420, 60.7, 58.9 }, 330 },
    { "Orgrimmar - Grom'gol", "H", { 1411, 50.7, 12.9 }, { 1434, 31.5, 29.4 }, 330 },
    { "Undercity - Grom'gol", "H", { 1420, 61.8, 59.2 }, { 1434, 31.4, 29.9 }, 330 },
}

-- Town of each innkeeper (QuestieDB NPC id): the name a `sethearth` step gives. Our own list.
M.INNS = {
    -- Alliance
    [295] = "Goldshire", [1247] = "Kharanos", [1464] = "Menethil Harbor", [2352] = "Southshore",
    [5111] = "Ironforge", [6272] = "Theramore", [6727] = "Lakeshire", [6734] = "Thelsamar",
    [6735] = "Darnassus", [6736] = "Dolanaar", [6737] = "Auberdine", [6738] = "Astranaar",
    [6740] = "Stormwind", [6790] = "Darkshire", [7736] = "Feathermoon Stronghold", [7744] = "Aerie Peak",
    [8931] = "Sentinel Hill", [11103] = "Nijel's Point", [16458] = "Stonetalon Peak",
    -- Neutral
    [6791] = "Ratchet", [6807] = "Booty Bay", [7733] = "Gadgetzan", [11118] = "Everlook",
    [15174] = "Cenarion Hold", [16256] = "Light's Hope Chapel",
    -- Horde
    [2388] = "Tarren Mill", [3934] = "The Crossroads", [5688] = "Brill", [5814] = "Grom'gol",
    [6739] = "The Sepulcher", [6741] = "Undercity", [6746] = "Thunder Bluff", [6747] = "Bloodhoof Village",
    [6928] = "Razor Hill", [6929] = "Orgrimmar", [6930] = "Stonard", [7714] = "Camp Taurajo",
    [7731] = "Sun Rock Retreat", [7737] = "Camp Mojache", [9356] = "Kargath", [9501] = "Hammerfall",
    [11106] = "Shadowprey Village", [11116] = "Freewind Post", [12196] = "Splintertree Post",
    [14731] = "Revantusk Village",
}

local FACTION_CODE = { Alliance = "A", Horde = "H" }
local NEAR = 3   -- network nodes tried at each end of a trip

local function usable(code, faction)
    return code == "AH" or code == FACTION_CODE[faction]
end

-- Speed class of a level: 1 on foot, 2 on foot with flight paths, 3 mounted with flights.
local function class(level)
    local P = Model.PARAMS
    if level >= P.mountLevel then return 3 end
    if level >= P.flightLevel then return 2 end
    return 1
end
M.class = class

local function speedOf(c)
    local P = Model.PARAMS
    return c == 3 and P.mountSpeed or P.runSpeed
end

local function walkTime(a, b, c)
    local d = Model.distance(a, b)
    if not d then return nil end
    return d * Model.PARAMS.detour / speedOf(c), d
end

function M.new(D, faction, opts)
    opts = opts or {}
    local P = Model.PARAMS
    local net = { nodes = {}, faction = faction }
    local nodes = net.nodes

    -- Flight masters of the faction in the known zones.
    for _, fm in ipairs(D.flightMasters(faction)) do
        if not opts.areas or opts.areas[fm.area] then
            nodes[#nodes + 1] = { at = fm.point, fm = true, name = fm.name }
        end
    end
    local links = {}
    for _, t in ipairs(M.TRANSPORTS) do
        if usable(t[2], faction) then
            local a = D.point(t[3][1], t[3][2], t[3][3])
            local b = D.point(t[4][1], t[4][2], t[4][3])
            nodes[#nodes + 1] = { at = a, name = t[1] }
            nodes[#nodes + 1] = { at = b, name = t[1] }
            links[#links + 1] = { #nodes - 1, #nodes, t[5] }
        end
    end

    -- Shortest paths between nodes, per speed class (Floyd-Warshall, a few dozen nodes).
    local n = #nodes
    net.dist = {}
    for c = 1, 3 do
        local d = {}
        for i = 1, n do
            d[i] = {}
            for j = 1, n do
                if i == j then
                    d[i][j] = 0
                else
                    local t = walkTime(nodes[i].at, nodes[j].at, c) or math.huge
                    if c >= 2 and nodes[i].fm and nodes[j].fm and nodes[i].at.continent == nodes[j].at.continent then
                        local dx, dy = nodes[i].at.x - nodes[j].at.x, nodes[i].at.y - nodes[j].at.y
                        local fly = P.flightOverhead + math.sqrt(dx * dx + dy * dy) * P.flightDetour / P.flightSpeed
                        if fly < t then t = fly end
                    end
                    d[i][j] = t
                end
            end
        end
        for _, l in ipairs(links) do
            local i, j, t = l[1], l[2], l[3]
            if t < d[i][j] then d[i][j], d[j][i] = t, t end
        end
        for k = 1, n do
            local dk = d[k]
            for i = 1, n do
                local di, dik = d[i], d[i][k]
                if dik < math.huge then
                    for j = 1, n do
                        local t = dik + dk[j]
                        if t < di[j] then di[j] = t end
                    end
                end
            end
        end
        net.dist[c] = d
    end

    -- The NEAR nodes closest to a point, on its land mass (cached per point).
    local nearCache = setmetatable({}, { __mode = "k" })
    local function near(p)
        local list = nearCache[p]
        if list then return list end
        list = {}
        for i, node in ipairs(nodes) do
            local d = Model.distance(p, node.at)
            if d then list[#list + 1] = { i = i, d = d } end
        end
        table.sort(list, function(x, y)
            if x.d ~= y.d then return x.d < y.d end
            return x.i < y.i
        end)
        for k = #list, NEAR + 1, -1 do list[k] = nil end
        nearCache[p] = list
        return list
    end

    local cache = { setmetatable({}, { __mode = "k" }), setmetatable({}, { __mode = "k" }),
        setmetatable({}, { __mode = "k" }) }

    -- Seconds from a to b at this level, and the straight distance walked (0 between two
    -- land masses). Points without known geometry fall back to route_model.lua's trip.
    function net:travel(a, b, level)
        if not a or not b then return 0, 0 end
        if a.region:sub(1, 4) == "map:" or b.region:sub(1, 4) == "map:" then return Model.travel(a, b, level) end
        local c = class(level)
        local row = cache[c][a]
        if not row then
            row = setmetatable({}, { __mode = "k" })
            cache[c][a] = row
        end
        local hit = row[b]
        if hit then return hit[1], hit[2] end
        local best, dist = math.huge, 0
        local direct, d = walkTime(a, b, c)
        if direct then best, dist = direct, d end
        local dc = net.dist[c]
        local speed = speedOf(c)
        for _, x in ipairs(near(a)) do
            local tx = x.d * P.detour / speed
            if tx < best then
                local dx = dc[x.i]
                for _, y in ipairs(near(b)) do
                    local t = tx + dx[y.i] + y.d * P.detour / speed
                    if t < best then best, dist = t, d or 0 end
                end
            end
        end
        if best == math.huge then
            -- No way known to the network (another continent without transport).
            best, dist = Model.travel(a, b, level)
        end
        row[b] = { best, dist }
        return best, dist
    end

    return net
end

return M
