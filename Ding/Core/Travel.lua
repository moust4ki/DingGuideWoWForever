-- Travel engine: the fastest way to the arrow's target, in seconds, over walking, the flight
-- paths the character knows, boats, zeppelins and the tram, and the hearthstone (where it is
-- bound, its cooldown). The arrow follows the first leg that is not a walk: the flight master
-- to fly from, the dock to board at, the hearthstone to use, or the lift, tunnel, bridge, gate
-- or portal a walk has to take (Core/Passages.lua).
-- Data: flight masters from QuestieDB (npcFlags), zeppelin towers and the Booty Bay - Ratchet
-- boat where their masters stand in QuestieDB, the tram where QuestieDB's dungeon table
-- enters it; only the Alliance boats, with no NPC on their piers, come from this file.
-- What the character knows is learned in game: the flight paths when a flight map opens,
-- the inn when the hearthstone is bound or used.
local _, Ding = ...
local Compat = Ding.Compat
local L = Ding.L

local T = {}
Ding.Travel = T

local RUN_SPEED, MOUNT_SPEED, MOUNT_LEVEL = 7, 11, 40   -- yards per second; a mount from 40
local DETOUR = 1.2               -- roads and hills: a walk is longer than the straight line
local FLY_SPEED, FLY_DETOUR, FLY_START = 30, 1.25, 15   -- flight paths: speed, route, take-off
local HEARTH_TIME = 30           -- cast and loading screen
local HASSLE = 20                -- seconds a change of transport must save to be worth it
local MATCH = 150                -- yards between a flight map node and its flight master
local AT_NODE = 60               -- yards: the player stands at a flight master or a dock
local REPLAN_MOVE, REPLAN_TTL = 150, 15   -- the plan is made again past these yards or seconds
local BOARDING_TIME = 5 * 60     -- seconds a crossing may last once the dock is left
local UNKNOWN_FLIGHT = 60        -- seconds added to a flight from a flight master never seen
local TELEPORT_TIME = 30         -- cast and loading screen of a teleport
local NEW_CONTINENT_NEAR = 400   -- yards: a flight master this close on a continent never seen
local DANGER_ABOVE = 4           -- a zone this many levels above the player is dangerous to cross
local DANGER_FACTOR = 1.5        -- a walk wholly through such zones takes 2.5 times as long
local DANGER_STEP = 400          -- yards between two looks at the zones a walk crosses
T.HEARTHSTONE_ITEM = 6948
T.RUNE_OF_TELEPORTATION = 17031

-- Teleports a class knows: spell, the reagent it needs, the faction, and an NPC standing
-- where it lands (QuestieDB), as a hearthstone of its own.
local TELEPORTS = {
    { spell = 3561, class = "MAGE", faction = "A", npc = 352, reagent = true },    -- Stormwind
    { spell = 3562, class = "MAGE", faction = "A", npc = 1573, reagent = true },   -- Ironforge
    { spell = 3565, class = "MAGE", faction = "A", npc = 3562, reagent = true },   -- Darnassus
    { spell = 3567, class = "MAGE", faction = "H", npc = 3310, reagent = true },   -- Orgrimmar
    { spell = 3563, class = "MAGE", faction = "H", npc = 4551, reagent = true },   -- Undercity
    { spell = 3566, class = "MAGE", faction = "H", npc = 2995, reagent = true },   -- Thunder Bluff
    { spell = 18960, class = "DRUID", npc = 12042 },                               -- Moonglade
}
T.TELEPORTS = TELEPORTS

-- Levels of the leveling zones (Classic), by UiMap: walking through a zone well above the
-- player's level costs more (see DANGER_*).
local ZONE_LEVELS = {
    [1429] = 1, [1426] = 1, [1438] = 1, [1411] = 1, [1412] = 1, [1420] = 1,
    [1436] = 10, [1432] = 10, [1439] = 10, [1413] = 10, [1421] = 10,
    [1433] = 15, [1442] = 15, [1440] = 18, [1431] = 18, [1424] = 20, [1437] = 20,
    [1441] = 25, [1416] = 30, [1417] = 30, [1443] = 30, [1434] = 30, [1445] = 35, [1418] = 35, [1435] = 35,
    [1444] = 40, [1425] = 40, [1446] = 40, [1427] = 43, [1447] = 45, [1419] = 45, [1449] = 48, [1448] = 48,
    [1428] = 50, [1422] = 51, [1423] = 53, [1452] = 55, [1451] = 55, [1430] = 55,
}
T.ZONE_LEVELS = ZONE_LEVELS

-- Transports between two docks. RIDE: the crossing; WAIT: half a round trip, on average.
local RIDE = { boat = 100, zeppelin = 100, tram = 60 }
local WAIT = { boat = 120, zeppelin = 100, tram = 30 }
local TRANSPORTS = {
    -- Zeppelin towers: Durotar (Frezza, Snurk Bucksquick), Tirisfal (Hin Denburg, Zapetta),
    -- Grom'gol (Nez'raz, Squibby Overspeck).
    { kind = "zeppelin", faction = "H", a = { npcs = { 9564, 12136 } }, b = { npcs = { 3150, 9566 } } },
    { kind = "zeppelin", faction = "H", a = { npcs = { 9564, 12136 } }, b = { npcs = { 3149, 12137 } } },
    { kind = "zeppelin", faction = "H", a = { npcs = { 3150, 9566 } }, b = { npcs = { 3149, 12137 } } },
    -- Booty Bay (Grizzlowe) - Ratchet (Grimble), both sides.
    { kind = "boat", a = { npcs = { 9559 } }, b = { npcs = { 9558 } } },
    -- Deeprun Tram: its two entrances, Stormwind and Ironforge (QuestieDB dungeon 2257).
    { kind = "tram", faction = "A", dungeon = 2257 },
    -- Alliance boats, by AreaID and zone percentages: Menethil Harbor - Auberdine,
    -- Menethil Harbor - Theramore, Auberdine - Rut'theran Village.
    { kind = "boat", faction = "A", a = { area = 11, x = 4.6, y = 57.1 }, b = { area = 148, x = 32.4, y = 43.8 } },
    { kind = "boat", faction = "A", a = { area = 11, x = 5.0, y = 63.5 }, b = { area = 15, x = 71.6, y = 56.4 } },
    { kind = "boat", faction = "A", a = { area = 148, x = 33.2, y = 40.2 }, b = { area = 141, x = 54.9, y = 96.8 } },
}
T.TRANSPORTS = TRANSPORTS

local FACTION_LETTER = { Alliance = "A", Horde = "H" }

local function factionLetter() return FACTION_LETTER[UnitFactionGroup("player")] end

-- A transport or flight master for this side: neutral ones are open to everyone.
local function usable(side, letter)
    if not side or side == "AH" then return true end
    return letter ~= nil and side:find(letter, 1, true) ~= nil
end

local function withWorld(p)
    if p.continent == nil then
        local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
        p.continent, p.wx, p.wy = c or false, wx, wy
    end
    return p
end

local function distance(a, b)
    if not (a.continent and b.continent) or a.continent ~= b.continent or not (a.wx and b.wx) then return nil end
    return math.sqrt((a.wx - b.wx) ^ 2 + (a.wy - b.wy) ^ 2)
end

---------------------------------------------------------------------------
-- Places: flight masters and docks, resolved once QuestieDB is there
---------------------------------------------------------------------------
local flights = {}     -- [npc] = { npc, friendly, point }: the flight masters looked at
local allFlights       -- every flight master of QuestieDB, read when a flight map opens
local docks            -- list of { kind, faction, a = point, b = point }

local function centre(points)
    if #points == 0 then return nil end
    local x, y = 0, 0
    for _, p in ipairs(points) do x, y = x + p.x, y + p.y end
    return { map = points[1].map, x = x / #points, y = y / #points }
end

-- A dock: where its NPCs stand (their first spawn), or a place by AreaID.
local function dockPoint(where)
    if where.npcs then
        local points = {}
        for _, npc in ipairs(where.npcs) do
            local spawn = Ding.Data:NpcPoints(npc)[1]
            if spawn then points[#points + 1] = spawn end
        end
        return centre(points)
    end
    local map = Ding.Data:UiMap(where.area)
    return map and { map = map, x = where.x, y = where.y } or nil
end

-- A flight master by NPC id: { npc, friendly, point }, or nil.
local function flightMaster(npc)
    local fm = flights[npc]
    if fm == nil then
        local spawn = Ding.Data:NpcPoints(npc)[1]
        local info = Ding.Data:NpcInfo(npc)
        fm = spawn and { npc = npc, friendly = info and info.friendly,
            point = withWorld({ map = spawn.map, x = spawn.x, y = spawn.y, label = spawn.label }) } or false
        flights[npc] = fm
    end
    return fm or nil
end

-- The docks of the transports, resolved once QuestieDB is there.
function T:Docks()
    if docks then return docks end
    docks = {}
    if not Ding.Data.available then return docks end
    for _, t in ipairs(TRANSPORTS) do
        local a, b
        if t.dungeon then
            local ends = Ding.Data:DungeonEntrances(t.dungeon)
            a, b = ends[1], ends[2]
        else
            a, b = dockPoint(t.a), dockPoint(t.b)
        end
        if a and b then
            docks[#docks + 1] = { kind = t.kind, faction = t.faction, a = withWorld(a), b = withWorld(b) }
        end
    end
    return docks
end

-- The flight master nearest to a point (same continent), within `range` yards. The first
-- call reads every NPC of QuestieDB (a flight map just opened: a hitch nobody notices).
local function flightMasterNear(point, range)
    if not allFlights then
        allFlights = {}
        for _, fm in ipairs(Ding.Data:FlightMasters()) do allFlights[#allFlights + 1] = fm.npc end
    end
    local best, bestD
    for _, npc in ipairs(allFlights) do
        local fm = flightMaster(npc)
        local d = fm and distance(point, fm.point)
        if d and d <= range and (not bestD or d < bestD) then best, bestD = npc, d end
    end
    return best
end

---------------------------------------------------------------------------
-- What the character knows: flight paths, the inn
---------------------------------------------------------------------------
local function known()
    Ding.char.flights = Ding.char.flights or {}
    return Ding.char.flights
end

-- Flights measured: [from npc .. ":" .. to npc] = { seconds (average), count }.
local function flightTimes()
    Ding.db.flightTimes = Ding.db.flightTimes or {}
    return Ding.db.flightTimes
end

-- A flight just done: its real duration joins the average of that route.
function T:RecordFlight(from, to, seconds)
    if not (from and to) or seconds < 10 or seconds > 1800 then return end
    local key = from .. ":" .. to
    local entry = flightTimes()[key] or { seconds = 0, count = 0 }
    entry.seconds = (entry.seconds * entry.count + seconds) / (entry.count + 1)
    entry.count = math.min(entry.count + 1, 20)
    flightTimes()[key] = entry
end

-- Teleports open to the player now: { spell, point, name, cooldown } (the class knows the
-- spell, has its reagent).
local function teleports()
    local out = {}
    local class, letter = Compat.PlayerClass(), factionLetter()
    for _, t in ipairs(TELEPORTS) do
        if t.class == class and (not t.faction or t.faction == letter) and Compat.SpellKnown(t.spell)
            and (not t.reagent or Compat.ItemCount(T.RUNE_OF_TELEPORTATION) > 0) then
            local spawn = Ding.Data:NpcPoints(t.npc)[1]
            if spawn then
                out[#out + 1] = { spell = t.spell, point = withWorld({ map = spawn.map, x = spawn.x, y = spawn.y }),
                    name = Compat.MapName(spawn.map), cooldown = Compat.SpellCooldown(t.spell) }
            end
        end
    end
    return out
end

-- The zone under a world position (cached per 300-yard cell), its level, or nil.
local cells = {}
local function zoneLevel(continent, wx, wy)
    local key = continent .. ":" .. math.floor(wx / 300) .. ":" .. math.floor(wy / 300)
    local level = cells[key]
    if level == nil then
        local map = Compat.WorldToMap(continent, wx, wy)
        level = map and ZONE_LEVELS[map] or false
        cells[key] = level
    end
    return level or nil
end

-- Share of a walk that crosses zones well above the player's level (0-1).
local function danger(a, b, playerLevel)
    local d = distance(a, b)
    if not d or d < DANGER_STEP then return 0 end
    local samples, bad = math.min(6, math.floor(d / DANGER_STEP)), 0
    for i = 1, samples do
        local f = i / (samples + 1)
        local level = zoneLevel(a.continent, a.wx + (b.wx - a.wx) * f, a.wy + (b.wy - a.wy) * f)
        if level and level > playerLevel + DANGER_ABOVE then bad = bad + 1 end
    end
    return bad / samples
end

local function playerPoint()
    local map, x, y = Compat.GetPlayerMapPosition()
    if not map then return nil end
    return withWorld({ map = map, x = x, y = y })
end

-- The flight map is open: every node it shows as reachable is a flight path the character
-- knows, matched to its flight master by position. The node the player stands at is known
-- in any case (the flight master next to the player), even if the map's coordinates cannot
-- be read. Returns the nodes with their flight master (`npc`) for the flight map hint.
function T:LearnTaxi()
    local flightsKnown = known()
    local here = playerPoint()
    local current = here and flightMasterNear(here, AT_NODE)
    if current then flightsKnown[current] = flightsKnown[current] or true end
    local continentMap = Compat.ContinentMap()
    local nodes = Compat.TaxiNodes(continentMap)
    -- The map's coordinates are trusted only if its current node is where the player is.
    local trusted = false
    for _, node in ipairs(nodes) do
        local point = continentMap and withWorld({ map = continentMap, x = node.x, y = node.y })
        node.npc = point and flightMasterNear(point, MATCH)
        if node.state == "current" then trusted = current ~= nil and node.npc == current end
    end
    for _, node in ipairs(nodes) do
        if not trusted and node.state ~= "current" then node.npc = nil end
        if node.state == "current" and current then node.npc = current end
        if node.npc and node.state ~= "unknown" then flightsKnown[node.npc] = node.name or flightsKnown[node.npc] or true end
    end
    self.taxiNodes = nodes
    self.cache = nil
    return nodes
end

-- The inn: where the player was when binding the hearthstone, or where a hearthstone
-- landed them.
function T:LearnBind()
    local here = playerPoint()
    if not here then return end
    Ding.char.bind = { map = here.map, x = here.x, y = here.y, name = Compat.BindLocation() }
    self.cache = nil
end

-- Where the hearthstone takes the player, as a point, or nil (not learned yet, or bound
-- elsewhere since: its name changed).
local function bindPoint()
    local bind = Ding.char and Ding.char.bind
    if not bind or not bind.map then return nil end
    local name = Compat.BindLocation()
    if name and bind.name and name ~= bind.name then return nil end
    return withWorld({ map = bind.map, x = bind.x, y = bind.y, label = name or bind.name })
end

-- Seconds before the hearthstone can be used, or nil without one.
local function hearthCooldown()
    if Compat.ItemCount(T.HEARTHSTONE_ITEM) == 0 then return nil end
    local start, duration = Compat.ItemCooldown(T.HEARTHSTONE_ITEM)
    if start > 0 and duration > 0 then return math.max(0, start + duration - GetTime()) end
    return 0
end

---------------------------------------------------------------------------
-- Planning: Dijkstra over the player, the target, the known flight masters, the docks and
-- the inn. Legs: { kind = "walk" | "fly" | "boat" | "zeppelin" | "tram" | "hearth", from, to,
-- seconds, name }.
---------------------------------------------------------------------------
local function speed()
    return UnitLevel("player") >= MOUNT_LEVEL and MOUNT_SPEED or RUN_SPEED
end

-- The walking passages open to the player's side, both ends as graph nodes (`through`: the
-- other end). Returns the ends the player can reach from inside a passage: standing on a lift
-- or in a tunnel, the far end is a leg of its own.
local function addPassages(nodes, start, letter)
    local entered = {}
    for _, passage in ipairs(Ding.Passages.Open(letter)) do
        local pa, pb = Ding.Passages.End(passage, "a"), Ding.Passages.End(passage, "b")
        local a = { point = pa, passage = passage, passageEnd = "a" }
        local b = { point = pb, passage = passage, passageEnd = "b", through = a }
        a.through = b
        nodes[#nodes + 1] = a
        nodes[#nodes + 1] = b
        local out = Ding.Passages.Inside(passage, start, pa, pb)
        if out then entered[out == "a" and a or b] = true end
    end
    return entered
end

-- Where the player starts from: on a flight, where it lands.
function T:Start()
    if Compat.OnTaxi() and self.flyingTo then return self.flyingTo end
    return playerPoint()
end

function T:Plan(target)
    local start = self:Start()
    if not start or not target then return nil end
    withWorld(target)
    local transports = self:Docks()
    local letter = factionLetter()
    local nodes = { { point = start }, { point = target } }
    local knownFlights = known()
    for npc, name in pairs(knownFlights) do
        local fm = flightMaster(npc)
        if fm and usable(fm.friendly, letter) then
            nodes[#nodes + 1] = { point = fm.point, flight = npc, name = type(name) == "string" and name or nil }
        end
    end
    -- Flight masters of the player's side never seen yet: talking to one learns it, so a
    -- flight can start there (to a known one), with a penalty for the doubt.
    for _, fm in ipairs(Ding.Data:FlightMasters()) do
        if not knownFlights[fm.npc] and usable(fm.friendly, letter) then
            local f = flightMaster(fm.npc)
            if f then nodes[#nodes + 1] = { point = f.point, flight = fm.npc, unknown = true } end
        end
    end
    -- Teleports (mage cities, Moonglade), from where the player stands.
    local links = {}
    for _, t in ipairs(teleports()) do
        local node = { point = t.point, teleport = t }
        nodes[#nodes + 1] = node
        links[node] = true
    end
    for _, t in ipairs(transports) do
        if usable(t.faction, letter) then
            local a = { point = t.a, transport = t }
            local b = { point = t.b, transport = t, pair = a }
            a.pair = b
            nodes[#nodes + 1] = a
            nodes[#nodes + 1] = b
        end
    end
    local bind, cooldown = bindPoint(), hearthCooldown()
    local inn
    if bind and cooldown then
        inn = { point = bind, inn = true }
        nodes[#nodes + 1] = inn
    end
    local entered = addPassages(nodes, start, letter)

    local v = speed()
    local level = UnitLevel("player")
    local measured = flightTimes()
    -- Seconds from node u to node w, by the fastest single leg, and that leg's kind.
    local function leg(u, w)
        local best, kind
        local d = distance(u.point, w.point)
        -- Never in a straight line from one side of a passage to the other.
        if d and not Ding.Passages.Blocked(u, w) then
            best, kind = d * DETOUR / v, "walk"
            -- Through zones well above the player's level: slower, if at all.
            local risk = danger(u.point, w.point, level)
            if risk > 0 then best = best * (1 + DANGER_FACTOR * risk) end
        end
        -- Through a passage, from one end to the other, or from inside it to its far end.
        if d and (u.through == w or (u == nodes[1] and entered[w])) then
            local t = w.passage.seconds or d * DETOUR / v
            if not best or t < best then best, kind = t, "passage" end
        end
        if u.flight and w.flight and not w.unknown and d then
            local real = measured[u.flight .. ":" .. w.flight]
            local t = (real and real.seconds or d * FLY_DETOUR / FLY_SPEED) + FLY_START + HASSLE
            if u.unknown then t = t + UNKNOWN_FLIGHT end
            if not best or t < best then best, kind = t, "fly" end
        end
        if u == nodes[1] and links[w] then
            local t = TELEPORT_TIME + w.teleport.cooldown + HASSLE
            if not best or t < best then best, kind = t, "teleport" end
        end
        if u.pair == w then
            local t = RIDE[u.transport.kind] + WAIT[u.transport.kind] + HASSLE
            if not best or t < best then best, kind = t, u.transport.kind end
        end
        if u == nodes[1] and w == inn then
            local t = HEARTH_TIME + cooldown + HASSLE
            if not best or t < best then best, kind = t, "hearth" end
        end
        return best, kind
    end

    local time, prev, how, done = { [1] = 0 }, {}, {}, {}
    while true do
        local u, best
        for i in ipairs(nodes) do
            if not done[i] and time[i] and (not best or time[i] < best) then u, best = i, time[i] end
        end
        if not u or u == 2 then break end
        done[u] = true
        for w in ipairs(nodes) do
            if not done[w] then
                local t, kind = leg(nodes[u], nodes[w])
                if t and (not time[w] or best + t < time[w]) then
                    time[w], prev[w], how[w] = best + t, u, kind
                end
            end
        end
    end
    if not time[2] then return nil end
    local legs, i = {}, 2
    while prev[i] do
        local from, to = nodes[prev[i]], nodes[i]
        table.insert(legs, 1, { kind = how[i], from = from.point, to = to.point, node = to, start = from,
            seconds = time[i] - time[prev[i]] })
        i = prev[i]
    end
    local direct = leg(nodes[1], nodes[2])
    return { legs = legs, seconds = time[2], walk = direct, target = target, start = start }
end

-- The plan as a line: "walk 1:20, fly 6:30 to Redridge Mountains, walk 0:40" and its total
-- time; each leg that is not a walk names the zone it leads to.
local ROUTE_PARTS = { walk = "ROUTE_WALK", fly = "ROUTE_FLY", boat = "ROUTE_BOAT", zeppelin = "ROUTE_ZEPPELIN",
    tram = "ROUTE_TRAM", hearth = "ROUTE_HEARTH", teleport = "ROUTE_TELEPORT" }
local PASSAGE_PARTS = { lift = "ROUTE_LIFT", tunnel = "ROUTE_TUNNEL", bridge = "ROUTE_BRIDGE", gate = "ROUTE_GATE",
    portal = "ROUTE_PORTAL" }
local function clock(seconds)
    local s = math.floor(seconds + 0.5)
    return ("%d:%02d"):format(math.floor(s / 60), s % 60)
end
function T:Itinerary(plan)
    if not plan or #plan.legs == 0 then return nil end
    local parts, travel = {}, false
    for _, l in ipairs(plan.legs) do
        if l.kind ~= "walk" then travel = true end
        local part = l.kind == "passage" and PASSAGE_PARTS[l.node.passage.kind] or ROUTE_PARTS[l.kind]
        if l.seconds >= 1 then
            local text = L[part]:format(clock(l.seconds))
            local zone = l.kind ~= "walk" and l.to and Ding.Engine:ZoneOf(l.to.zone or l.to.map)
            if zone and zone.name then text = L.ROUTE_TO:format(text, zone.name) end
            parts[#parts + 1] = text
        end
    end
    if not travel then return nil end
    return L.ROUTE:format(table.concat(parts, ", "), clock(plan.seconds))
end

---------------------------------------------------------------------------
-- The leg the arrow follows
---------------------------------------------------------------------------
local HINT = { fly = "TRAVEL_FLY", boat = "TRAVEL_BOAT", zeppelin = "TRAVEL_ZEPPELIN", tram = "TRAVEL_TRAM",
    hearth = "TRAVEL_HEARTH", teleport = "TRAVEL_TELEPORT" }

-- Where a leg leads, as the hint names it: the flight path's name, the inn, or the zone.
local function legName(l)
    if l.kind == "fly" then return l.node.name or Compat.MapName(l.to.map) or "?" end
    if l.kind == "hearth" then return l.to.label or Compat.MapName(l.to.map) or "?" end
    return Compat.MapName(l.to.map) or "?"
end

local function describe(l, point)
    if l.kind == "passage" then
        local passage = l.node.passage
        return { kind = "passage", point = point, hint = Ding.Passages.Hint(passage, l.node.passageEnd), to = l.to,
            name = Compat.MapName(Ding.Passages.Zone(l.to)) or "?", passage = passage }
    end
    local name = legName(l)
    -- From a flight master never seen, the flight is only likely: "Try to fly to …".
    local key = (l.kind == "fly" and l.start and l.start.unknown) and "TRAVEL_TRY_FLY" or HINT[l.kind]
    return { kind = l.kind, point = point, hint = L[key]:format(name), to = l.to, name = name,
        flight = l.kind == "fly" and l.node.flight or nil, spell = l.node.teleport and l.node.teleport.spell or nil }
end

-- The plan for a target, made again when the target changes, the player moved far or to
-- another map (a lift goes up without moving on the map), or after REPLAN_TTL seconds.
function T:PlanFor(target)
    local here = self:Start()
    local c = self.cache
    if c and c.target == target and here and c.from and (distance(here, c.from) or math.huge) < REPLAN_MOVE
        and here.map == c.from.map and GetTime() - c.t < REPLAN_TTL and c.taxi == Compat.OnTaxi() then
        return c.plan
    end
    local plan = self:Plan(target)
    self.cache = { target = target, from = here, t = GetTime(), plan = plan, taxi = Compat.OnTaxi() }
    return plan
end

-- What the arrow does for a target: nil to walk straight there, else { kind, point (the
-- flight master, dock or passage to go to; nil for the hearthstone), hint, to }. A passage
-- leads the arrow to its entry, then, once the player is in it, to its far end.
function T:Leg(target)
    if not target or not Ding.Data.available then
        self.leg = nil
        return nil
    end
    local here = playerPoint()
    -- On board: the transport goes on to its far side.
    local b = self.boarding
    if b then
        local atStart = here and (distance(here, b.from) or math.huge) <= AT_NODE
        local arrived = here and (distance(here, b.to) or math.huge) <= AT_NODE
        if arrived or GetTime() - b.t > BOARDING_TIME or b.target ~= target then
            self.boarding = nil
        elseif not atStart then
            self.leg = b.leg
            return b.leg
        end
    end
    local plan = self:PlanFor(target)
    local result
    if plan and #plan.legs > 0 then
        -- The first leg that is not a walk (the walks before it lead to where it starts).
        local i = 1
        while plan.legs[i + 1] and plan.legs[i].kind == "walk" do i = i + 1 end
        local l = plan.legs[i]
        if l.kind == "passage" then
            -- In the passage already (its first leg, or a plan made a moment ago): its far end.
            local passage = l.node.passage
            local inside = i == 1 or (here and Ding.Passages.Inside(passage, here, Ding.Passages.End(passage, "a"),
                Ding.Passages.End(passage, "b")) == l.node.passageEnd)
            result = describe(l, inside and l.to or l.from)
        elseif l.kind == "hearth" or l.kind == "teleport" then
            result = describe(l, nil)
        elseif l.kind ~= "walk" then
            result = describe(l, l.from)
        end
    end
    self.plan = result and plan or nil
    if result and result.kind ~= "fly" and result.kind ~= "hearth" and result.kind ~= "teleport"
        and result.kind ~= "passage" and here and (distance(here, result.point) or math.huge) <= AT_NODE then
        -- At the dock: from now on, the arrow waits for the far side.
        local onBoard = { kind = result.kind, point = result.to, hint = result.hint, to = result.to, name = result.name }
        self.boarding = { from = result.point, to = result.to, t = GetTime(), target = target, leg = onBoard }
    end
    self.leg = result
    return result
end

function T:Reset()
    self.cache, self.leg, self.boarding, self.flyingTo, self.taxiNodes = nil, nil, nil, nil, nil
    self.plan, self.flight = nil, nil
    flights, allFlights, docks = {}, nil, nil
    cells = {}
    Ding.Passages.Reset()
end

---------------------------------------------------------------------------
-- Continents where a flight map was opened
---------------------------------------------------------------------------
-- A flight map opened on this continent (Ding.char.taxiSeen), or a flight path known there.
function T:ContinentSeen(continent)
    local seen = Ding.char.taxiSeen
    if seen and seen[continent] then return true end
    for npc in pairs(known()) do
        local fm = flightMaster(npc)
        if fm and fm.point.continent == continent then return true end
    end
    return false
end

-- The flight master of the player's side right here on a continent where no flight map was
-- opened yet (talking to it learns this continent's paths), or nil.
function T:NewContinentFlightMaster()
    local continent = Compat.GetPlayerWorld()
    if not continent or self:ContinentSeen(continent) or not Ding.Services then return nil end
    local near = Ding.Services:Nearest("flight", 1)[1]
    if near and near.distance and near.distance <= NEW_CONTINENT_NEAR then return near end
    return nil
end

---------------------------------------------------------------------------
-- Taking the planned flight
---------------------------------------------------------------------------
-- "Take the flight automatically" (Automation tab, off by default): the flight map open, the
-- planned destination a node the player can reach, out of combat and without Shift (LT),
-- Ding takes that flight with the taxi API's own call (the game's flight map frame is never
-- touched). Mounted, it dismounts first when the client allows it. Returns true if it flew.
function T:AutoFly()
    local ui = Ding.db.ui
    if not ui.autoFly or IsShiftKeyDown() or InCombatLockdown() then return false end
    local leg = self.leg
    if not (leg and leg.kind == "fly" and leg.flight) then return false end
    for _, node in ipairs(self.taxiNodes or {}) do
        if node.npc == leg.flight and node.state == "known" and node.index then
            if Compat.Mounted() then Compat.Dismount() end
            if Compat.TakeTaxi(node.index) then
                Ding:Print(L.AUTO_FLY_DONE:format(node.name or leg.name or "?"))
                return true
            end
            return false
        end
    end
    return false
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
Ding:On("TAXIMAP_OPENED", function()
    T:LearnTaxi()
    local continent = Compat.GetPlayerWorld()
    if continent then
        Ding.char.taxiSeen = Ding.char.taxiSeen or {}
        Ding.char.taxiSeen[continent] = true
    end
    if Ding.TaxiMap then Ding:Safe(Ding.TaxiMap.Show, Ding.TaxiMap) end
    Ding:Safe(T.AutoFly, T)
end)
Ding:On("TAXIMAP_CLOSED", function()
    if Ding.TaxiMap then Ding:Safe(Ding.TaxiMap.Hide, Ding.TaxiMap) end
end)
Ding:On("HEARTHSTONE_BOUND", function() T:LearnBind() end)

-- The hearthstone used: where it lands is the inn, seen by a loading screen or by a jump of
-- the player's position (no loading screen on the same continent).
Ding:On("UNIT_SPELLCAST_SUCCEEDED", function(_, unit, _, spellID)
    if unit ~= "player" or Compat.Plain(spellID) ~= 8690 then return end
    T.hearthing = GetTime()
    local from = playerPoint()
    local cast = T.hearthing
    for _, delay in ipairs({ 4, 10, 20 }) do
        C_Timer.After(delay, function()
            if T.hearthing ~= cast then return end
            local here = playerPoint()
            local moved = from and here and distance(from, here)
            if here and from and (not moved or moved > 300) then
                T.hearthing = nil
                Ding:Safe(T.LearnBind, T)
            end
        end)
    end
end)
Ding:On("PLAYER_ENTERING_WORLD", function()
    if T.hearthing and GetTime() - T.hearthing < 60 then
        T.hearthing = nil
        C_Timer.After(1, function() Ding:Safe(T.LearnBind, T) end)
    end
end)

-- Where the flight the player takes lands: the node chosen on the flight map. Watched after
-- the game's own function runs (hooksecurefunc never changes it).
local function onTakeTaxi(index)
    local from
    for _, node in ipairs(T.taxiNodes or {}) do
        if node.state == "current" then from = node.npc end
    end
    for _, node in ipairs(T.taxiNodes or {}) do
        local fm = node.index == index and node.npc and flightMaster(node.npc)
        if fm then
            T.flyingTo = fm.point
            -- Timed until the landing: the planner learns the route's real duration.
            T.flight = { from = from, to = node.npc, t = GetTime() }
        end
    end
    T.cache = nil
end
if type(hooksecurefunc) == "function" and type(TakeTaxiNode) == "function" then
    pcall(hooksecurefunc, "TakeTaxiNode", onTakeTaxi)
end
Ding:On("PLAYER_CONTROL_GAINED", function()
    if T.flyingTo and not Compat.OnTaxi() then
        local f = T.flight
        if f then T:RecordFlight(f.from, f.to, GetTime() - f.t) end
        T.flyingTo, T.flight = nil, nil
        T.cache = nil
    end
end)
