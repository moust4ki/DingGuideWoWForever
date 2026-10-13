-- Walking passages: the lifts, tunnels, bridges, city gates and portals a walk has to take
-- where the straight line meets a cliff or a wall. Each passage joins two sides of the world
-- (`sides`: zones, or a box of a zone); a walk from one side to the other goes through one of
-- the passages that join them (Core/Travel.lua), never in a straight line.
-- Data: game facts noted by hand, in the form `/ding where` prints (UiMap, x, y in percent),
-- placed where the guards and NPCs of DingDB stand at each gate, lift and tunnel.
local _, Ding = ...
local Compat = Ding.Compat
local L = Ding.L

local P = {}
Ding.Passages = P

local CORRIDOR = 60   -- yards from a passage's line: the player is in it (on a lift, in a tunnel)

-- Sides. Each is a list of UiMaps or boxes { map, x1, y1, x2, y2 } (percent); "*" is anywhere
-- else. A place on neither side of a pair is not held back by its passages.
local NORTH_EK = { 1416, 1417, 1420, 1421, 1422, 1423, 1424, 1425, 1458 }   -- Arathi and beyond
local SOUTH_EK = { 1418, 1419, 1426, 1427, 1428, 1429, 1430, 1431, 1432, 1433, 1434, 1435, 1436,
    1453, 1455 }                                                             -- Loch Modan and beyond
local function join(...)
    local out = {}
    for _, list in ipairs({ ... }) do
        for _, v in ipairs(list) do out[#out + 1] = v end
    end
    return out
end

local SIDES = {
    thunderBluff = { { 1456 }, "*" },
    undercity = { { 1458 }, "*" },
    ironforge = { { 1455 }, "*" },
    stormwind = { { 1453 }, "*" },
    orgrimmar = { { 1454 }, "*" },
    -- Rut'theran Village, on its island below Teldrassil: only the portal (or a boat) leaves it.
    rutTheran = { { { 1438, 50, 84, 64, 100 } }, "*" },
    -- Thandol Span: Arathi and the north; the Wetlands and the south.
    thandol = { NORTH_EK, join({ 1437 }, SOUTH_EK) },
    -- Dun Algaz: the Wetlands and the north; Loch Modan and the south.
    dunAlgaz = { join({ 1437 }, NORTH_EK), SOUTH_EK },
    -- The Great Lift: the Barrens and the north of Kalimdor; Thousand Needles and the south.
    greatLift = { { 1411, 1412, 1413, 1439, 1440, 1442, 1445, 1447, 1448, 1450, 1452, 1454, 1456 },
        { 1441, 1446, 1449, 1451 } },
}
P.SIDES = SIDES

-- The passages. `a` is on the first side of `sides`, `b` on the second: { map, x, y, zone }
-- (`zone`: the zone the place lies in when its coordinates are read on another map, a lift's
-- foot on the city's map). `kind`: "lift" (`up`: its upper end, "a" or "b"), "tunnel",
-- "bridge", "gate" (a city's: `a` is inside), "portal". `seconds`: the time it takes (a lift's
-- wait and ride, a portal); else the walk from one end to the other. `faction`: "A" or "H"
-- when only that side may take it.
P.LIST = {
    -- Thunder Bluff's lifts, to the south-west and to the north of the central mesa.
    { sides = SIDES.thunderBluff, kind = "lift", up = "a", seconds = 45,
        a = { 1456, 31.9, 66.6 }, b = { 1456, 31.9, 66.6, zone = 1412 } },
    { sides = SIDES.thunderBluff, kind = "lift", up = "a", seconds = 45,
        a = { 1456, 51.3, 31.4 }, b = { 1456, 51.3, 31.4, zone = 1412 } },
    -- The Undercity's three lifts, below the ruins of Lordaeron's throne room.
    { sides = SIDES.undercity, kind = "lift", up = "b", seconds = 45,
        a = { 1458, 61.5, 45.6 }, b = { 1458, 61.5, 45.6, zone = 1420 } },
    { sides = SIDES.undercity, kind = "lift", up = "b", seconds = 45,
        a = { 1458, 70.5, 42.5 }, b = { 1458, 70.5, 42.5, zone = 1420 } },
    { sides = SIDES.undercity, kind = "lift", up = "b", seconds = 45,
        a = { 1458, 67.1, 50.9 }, b = { 1458, 67.1, 50.9, zone = 1420 } },
    -- The Gates of Ironforge, from Dun Morogh's road to the end of the entrance hall.
    { sides = SIDES.ironforge, kind = "gate", a = { 1455, 21.5, 78.0 }, b = { 1426, 52.9, 36.2 } },
    -- Stormwind's gate: from the bridge in Elwynn Forest through the Valley of Heroes.
    { sides = SIDES.stormwind, kind = "gate", a = { 1453, 69.0, 82.5 }, b = { 1429, 32.3, 49.8 } },
    -- Orgrimmar's front gate, to Durotar, and its western gate.
    { sides = SIDES.orgrimmar, kind = "gate", a = { 1454, 49.4, 90.5 }, b = { 1411, 50.5, 13.6 } },
    { sides = SIDES.orgrimmar, kind = "gate", a = { 1454, 20.0, 61.6 }, b = { 1454, 13.0, 61.8, zone = 1411 } },
    -- The portal in the tree of Rut'theran Village, to Darnassus and back.
    { sides = SIDES.rutTheran, kind = "portal", seconds = 10, a = { 1438, 55.9, 89.4 }, b = { 1457, 30.2, 41.4 } },
    -- Thandol Span, between the Arathi Highlands and the Wetlands.
    { sides = SIDES.thandol, kind = "bridge", a = { 1417, 44.2, 88.5 }, b = { 1437, 51.2, 10.5 } },
    -- The Dun Algaz pass, between the Wetlands and Loch Modan's North Gate.
    { sides = SIDES.dunAlgaz, kind = "tunnel", a = { 1437, 54.0, 83.5 }, b = { 1432, 25.3, 1.5 } },
    -- The Great Lift, from the Barrens down to Thousand Needles.
    { sides = SIDES.greatLift, kind = "lift", up = "a", seconds = 45,
        a = { 1441, 32.2, 22.3, zone = 1413 }, b = { 1441, 32.2, 22.3 } },
}

---------------------------------------------------------------------------
-- Sides of a place
---------------------------------------------------------------------------
local zones = {}   -- [map] = its zone (the map itself, or its parent for a cave or a dungeon)
local function zoneOf(map)
    local z = zones[map]
    if z == nil then
        z = Compat.ZoneOf(map) or false
        zones[map] = z
    end
    return z or nil
end

local function inSide(side, point)
    if side == "*" then return true end
    -- A passage's end read on another map is in its own zone.
    local zone = point.zone
    for _, area in ipairs(side) do
        if type(area) == "number" then
            if zone then
                if zone == area then return true end
            elseif point.map == area or zoneOf(point.map) == area then
                return true
            end
        elseif not zone and point.map == area[1] and point.x >= area[2] and point.y >= area[3]
            and point.x <= area[4] and point.y <= area[5] then
            return true
        end
    end
    return false
end

-- The side (1 or 2) of `sides` a point is on, or nil when it is on neither.
function P.SideOf(sides, point)
    if not (point and point.map) then return nil end
    if inSide(sides[1], point) then return 1 end
    if inSide(sides[2], point) then return 2 end
    return nil
end

-- The sides of a graph node, by pair of sides: a passage's end is on its own side of its pair
-- whatever its map; any other place by its map. Cached on the node.
function P.Sides(node)
    local s = node.passageSides
    if s then return s end
    s = {}
    for _, sides in pairs(SIDES) do s[sides] = P.SideOf(sides, node.point) end
    if node.passage then s[node.passage.sides] = node.passageEnd == "a" and 1 or 2 end
    node.passageSides = s
    return s
end

-- A straight walk between two nodes crosses a pair of sides: a passage has to be taken.
function P.Blocked(u, w)
    local su, sw = P.Sides(u), P.Sides(w)
    for sides, side in pairs(su) do
        local other = sw[sides]
        if other and other ~= side then return true end
    end
    return false
end

-- Distance from a world point to the segment between two others, in yards (nil across
-- continents).
local function toSegment(p, a, b)
    if not (p.continent and a.continent and p.continent == a.continent and a.continent == b.continent
        and p.wx and a.wx and b.wx) then return nil end
    local dx, dy = b.wx - a.wx, b.wy - a.wy
    local len2 = dx * dx + dy * dy
    local t = 0
    if len2 > 0 then t = math.max(0, math.min(1, ((p.wx - a.wx) * dx + (p.wy - a.wy) * dy) / len2)) end
    local x, y = a.wx + dx * t, a.wy + dy * t
    return math.sqrt((p.wx - x) ^ 2 + (p.wy - y) ^ 2)
end

-- The player stands in a passage (on a lift, in a tunnel, on a bridge): the end to come out at,
-- "a" or "b", away from the side the player is on; nil when outside it. A portal has no inside:
-- the arrow stays on it until it takes the player across.
function P.Inside(passage, start, a, b)
    if passage.kind == "portal" then return nil end
    local d = toSegment(start, a, b)
    if not d or d > CORRIDOR then return nil end
    local side = P.SideOf(passage.sides, start)
    if side == 1 then return "b" end
    if side == 2 then return "a" end
    return nil
end

---------------------------------------------------------------------------
-- What the arrow says
---------------------------------------------------------------------------
-- The zone a passage's end lies in: a point, or its { map, x, y, zone } in the data.
function P.Zone(point)
    return point.zone or point.map or point[1]
end

-- The hint for going through a passage toward its end `to` ("a" or "b").
function P.Hint(passage, to)
    local far = passage[to]
    local name = Compat.MapName(P.Zone(far)) or "?"
    local kind = passage.kind
    if kind == "lift" then
        return (passage.up == to and L.PASSAGE_LIFT_UP or L.PASSAGE_LIFT_DOWN):format(name)
    elseif kind == "gate" then
        -- A city's gate: `a` is inside, named either way.
        local city = Compat.MapName(P.Zone(passage.a)) or "?"
        return (to == "a" and L.PASSAGE_GATE_IN or L.PASSAGE_GATE_OUT):format(city)
    elseif kind == "bridge" then
        return L.PASSAGE_BRIDGE:format(name)
    elseif kind == "portal" then
        return L.PASSAGE_PORTAL:format(name)
    end
    return L.PASSAGE_TUNNEL:format(name)
end

-- The passages open to a faction ("A", "H", or nil).
function P.Open(letter)
    local out = {}
    for _, passage in ipairs(P.LIST) do
        if not passage.faction or passage.faction == letter then out[#out + 1] = passage end
    end
    return out
end

function P.Reset()
    zones = {}
end
