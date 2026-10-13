-- Travel engine (Core/Travel.lua): the fastest way to the arrow's target over walking, the
-- flight paths the character knows, boats, zeppelins, the tram and the hearthstone; the
-- arrow follows its first leg, the flight map marks the destination (UI/TaxiMap.lua).
-- The mock lays the zones side by side on two continents: Westfall and Redridge are about
-- 12,000 yards apart, Stormwind and Ironforge 8,000.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, Travel, Data = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Travel, Ding.Data

-- Flight masters (QuestieDB): Thor at Sentinel Hill (Westfall), Ariena Stormfeather at
-- Lakeshire (Redridge), Dungar Longdrink in Stormwind.
local THOR, ARIENA, DUNGAR = 523, 931, 352
local function spawn(npc) return Data:NpcPoints(npc)[1] end

local function point(map, x, y) return { map = map, x = x, y = y, label = "Target" } end

local function start(opts)
    opts = opts or {}
    T.reset({ level = opts.level or 20, race = opts.race or "Human", faction = opts.faction or "Alliance" })
    local at = opts.at
    H.player.map, H.player.x, H.player.y = at[1], at[2], at[3]
end

-- The flight map at Thor, with Lakeshire known and Stormwind not.
local function openAtThor(lakeshireMap)
    local thor, ariena, dungar = spawn(THOR), spawn(ARIENA), spawn(DUNGAR)
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = 1, map = lakeshireMap or ariena.map, x = ariena.x, y = ariena.y },
        { name = "Stormwind, Elwynn", state = 2, map = dungar.map, x = dungar.x, y = dungar.y },
    })
end

---------------------------------------------------------------------------
-- Flight paths
---------------------------------------------------------------------------
T.test("no flight path known: walk", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    local ariena = spawn(ARIENA)
    T.eq(Travel:Leg(point(ariena.map, ariena.x, ariena.y)), nil)
end)

T.test("the flight map teaches the paths it shows reachable, matched to their flight masters", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    openAtThor()
    local flights = Ding.char.flights
    T.ok(flights[THOR], "the flight master at hand is not known")
    T.eq(flights[ARIENA], "Lakeshire, Redridge")
    T.eq(flights[DUNGAR], nil, "a path never discovered is known")
    H.closeTaxi()
end)

T.test("a flight is faster: the arrow goes to the flight master and says where to fly", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    openAtThor()
    H.closeTaxi()
    H.player.x, H.player.y = thor.x + 3, thor.y + 3   -- then a little away from Thor
    local ariena = spawn(ARIENA)
    local leg = Travel:Leg(point(ariena.map, ariena.x + 1, ariena.y))
    T.ok(leg, "walking 12,000 yards beats a known flight")
    T.eq(leg.kind, "fly")
    T.eq(leg.flight, ARIENA)
    T.eq(leg.hint, L.TRAVEL_FLY:format("Lakeshire, Redridge"))
    T.eq(leg.point.map, thor.map)
    T.eq(leg.point.x, thor.x)
    -- A target near the player: walk.
    T.eq(Travel:Leg(point(thor.map, thor.x, thor.y + 6)), nil)
end)

T.test("flight map coordinates that do not match: only the flight master at hand is learned", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    local ariena, dungar = spawn(ARIENA), spawn(DUNGAR)
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = dungar.map, x = 10, y = 10 },   -- off
        { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    T.ok(Ding.char.flights[THOR], "the flight master at hand is not known")
    T.eq(Ding.char.flights[ARIENA], nil, "a node learned from coordinates that do not hold")
    H.closeTaxi()
end)

T.test("flight map: a banner names the destination and a ring marks its node", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    openAtThor()
    H.closeTaxi()
    local ariena = spawn(ARIENA)
    local target = point(ariena.map, ariena.x, ariena.y)
    Travel:Leg(target)
    openAtThor()
    local TM = Ding.TaxiMap
    T.ok(TM.banner:IsShown(), "no banner on the flight map")
    T.ok(H.plain(TM.banner.text:GetText()):find("Lakeshire, Redridge", 1, true), H.plain(TM.banner.text:GetText()))
    T.ok(TM.marker:IsShown(), "no ring on the destination")
    local p = TM.marker.points[1]
    T.eq(p[2], UIParent)
    T.eq(p[4], 100 + 20 * 2, "the ring is not on the Lakeshire node")
    H.closeTaxi()
    T.ok(not TM.banner:IsShown() and not TM.marker:IsShown(), "banner or ring left after the map closed")
end)

T.test("on a flight: the plan starts where it lands", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    openAtThor()
    TakeTaxiNode(2)
    H.closeTaxi()
    local ariena = spawn(ARIENA)
    local start = Travel:Start()
    T.eq(start.map, ariena.map)
    T.eq(start.x, ariena.x)
    -- From Lakeshire, a target there is a walk, though the player is still above Westfall.
    T.eq(Travel:Leg(point(ariena.map, ariena.x + 2, ariena.y)), nil)
    H.land(ariena.map, ariena.x, ariena.y)
    T.eq(Travel.flyingTo, nil)
end)

---------------------------------------------------------------------------
-- Hearthstone
---------------------------------------------------------------------------
T.test("hearthstone: the inn is learned when binding, and taken when it is the fastest", function()
    start({ at = { 1429, 43.8, 65.8 } })    -- Goldshire
    H.player.bind = "Goldshire"
    H.fire("HEARTHSTONE_BOUND"); H.flush()
    T.eq(Ding.char.bind.map, 1429)
    T.eq(Ding.char.bind.name, "Goldshire")
    H.player.map, H.player.x, H.player.y = 1433, 50, 50   -- Redridge, far from the inn
    local target = point(1429, 44, 66)
    T.eq(Travel:Leg(target), nil, "a hearthstone without the item")
    H.setItem(Travel.HEARTHSTONE_ITEM, 1, { use = true })
    Travel.cache = nil
    local leg = Travel:Leg(target)
    T.ok(leg and leg.kind == "hearth", "the hearthstone is not used")
    T.eq(leg.point, nil)
    T.eq(leg.hint, L.TRAVEL_HEARTH:format("Goldshire"))
    -- The arrow says it, the item button offers it.
    E:SetGuide("t-travel-home", 1, true); H.flush()
    A.point = nil; A:Tick()
    T.eq(A.hint, L.TRAVEL_HEARTH:format("Goldshire"))
    T.eq(Ding.ItemButton:Wanted(), Travel.HEARTHSTONE_ITEM)
end)

T.test("hearthstone: not while it cools down, nor once bound elsewhere", function()
    start({ at = { 1429, 43.8, 65.8 } })
    H.player.bind = "Goldshire"
    H.fire("HEARTHSTONE_BOUND"); H.flush()
    H.player.map, H.player.x, H.player.y = 1433, 50, 50
    H.setItem(Travel.HEARTHSTONE_ITEM, 1, { use = true, start = H.now(), duration = 3 * 3600 })
    T.eq(Travel:Leg(point(1429, 44, 66)), nil, "the hearthstone is offered during its cooldown")
    H.setItem(Travel.HEARTHSTONE_ITEM, 1, { use = true })
    H.player.bind = "Lakeshire"
    Travel.cache = nil
    T.eq(Travel:Leg(point(1429, 44, 66)), nil, "the old inn is used after binding elsewhere")
end)

T.test("hearthstone: where it lands is learned too", function()
    start({ at = { 1433, 50, 50 } })
    H.player.bind = "Lakeshire"
    H.fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 8690)
    H.player.map, H.player.x, H.player.y = 1433, 26.5, 44.9
    H.fire("PLAYER_ENTERING_WORLD"); H.tick(2)
    T.ok(Ding.char.bind, "the landing place is not learned")
    T.eq(Ding.char.bind.x, 26.5)
    T.eq(Ding.char.bind.name, "Lakeshire")
    -- Without a loading screen: the position jumps.
    Ding.char.bind = nil
    H.player.map, H.player.x, H.player.y = 1433, 80, 80
    H.fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 8690)
    H.player.map, H.player.x, H.player.y = 1433, 26.5, 44.9
    H.tick(5)
    T.ok(Ding.char.bind and Ding.char.bind.y == 44.9, "the landing place is not learned without a loading screen")
end)

---------------------------------------------------------------------------
-- Boats, zeppelins, tram
---------------------------------------------------------------------------
local function dock(kind, map)
    local docks = Travel:Docks()
    for _, d in ipairs(docks) do
        if d.kind == kind then
            if d.a.map == map then return d.a, d.b end
            if d.b.map == map then return d.b, d.a end
        end
    end
end

T.test("another continent: the boat, from its dock, then on board to the far side", function()
    start({ at = { 1439, 36, 46 } })      -- Auberdine, Darkshore
    local from, to = dock("boat", 1439)
    T.ok(from, "no boat from Darkshore")
    local target = point(1437, 10, 60)    -- Menethil Harbor, Wetlands
    local leg = Travel:Leg(target)
    T.ok(leg and leg.kind == "boat", "no boat to the other continent")
    T.eq(leg.hint, L.TRAVEL_BOAT:format("Wetlands"))
    T.eq(leg.point.map, 1439)
    -- At the dock, then sailing: the arrow waits for the far side.
    H.player.x, H.player.y = leg.point.x, leg.point.y
    Travel:Leg(target)
    H.player.x, H.player.y = leg.point.x - 5, leg.point.y
    Travel.cache = nil
    local onBoard = Travel:Leg(target)
    T.ok(onBoard and onBoard.kind == "boat", "the boat is forgotten once on board")
    T.eq(onBoard.point.map, 1437)
    -- Landed: walk.
    H.player.map, H.player.x, H.player.y = onBoard.point.map, onBoard.point.x, onBoard.point.y
    T.eq(Travel:Leg(target), nil)
    T.eq(Travel.boarding, nil)
end)

T.test("zeppelins are the Horde's; the Alliance never gets them", function()
    local from = dock("zeppelin", 1411)
    T.ok(from, "no zeppelin from Durotar")
    start({ at = { from.map, from.x + 1, from.y }, race = "Orc", faction = "Horde" })
    local leg = Travel:Leg(point(1420, 60, 60))
    T.ok(leg and leg.kind == "zeppelin", "no zeppelin for the Horde")
    T.eq(leg.hint, L.TRAVEL_ZEPPELIN:format("Tirisfal Glades"))
    start({ at = { from.map, from.x + 1, from.y } })
    leg = Travel:Leg(point(1420, 60, 60))
    T.ok(not leg or leg.kind ~= "zeppelin", "a zeppelin for the Alliance")
end)

T.test("the tram, from QuestieDB's entrances: Stormwind to Ironforge", function()
    local from, to = dock("tram", 1453)
    T.ok(from and to and to.map == 1455, "no tram between Stormwind and Ironforge")
    start({ at = { 1453, from.x + 1, from.y } })
    local leg = Travel:Leg(point(1455, to.x, to.y + 2))
    T.ok(leg and leg.kind == "tram", "walking beats the tram")
    T.eq(leg.hint, L.TRAVEL_TRAM:format("Ironforge"))
end)

---------------------------------------------------------------------------
-- The arrow and the window
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-travel-go", title = "Travel", races = { "Human" }, steps = {
    { go = { 1433, 26, 46 }, text = "Lakeshire" },
    { level = 60 },
} })
Ding.RegisterGuide({ id = "t-travel-home", title = "Home", races = { "Human" }, steps = {
    { go = { 1429, 44, 66 }, text = "Goldshire" },
} })

T.test("the arrow follows the leg, the window says it; reaching the place still validates the step", function()
    local thor = spawn(THOR)
    start({ at = { thor.map, thor.x, thor.y } })
    openAtThor()
    H.closeTaxi()
    H.player.x, H.player.y = thor.x + 3, thor.y + 3
    E:SetGuide("t-travel-go", 1, true); H.flush()
    A.point = nil; A:Tick(); H.flush()
    T.eq(H.plain(A.frame.label:GetText()), L.TRAVEL_FLY:format("Lakeshire, Redridge"))
    T.eq(A.hint, L.TRAVEL_FLY:format("Lakeshire, Redridge"))
    local found = false
    for _, row in ipairs(P.rowsShown or {}) do
        if row.sub and H.plain(row.sub):find(A.hint, 1, true) then found = true end
    end
    T.ok(found, "the window does not say how to get there")
    -- Landed at Lakeshire, at the step's place: the go step is done.
    H.player.map, H.player.x, H.player.y = 1433, 26, 46
    A.point = nil; A:Tick(); H.flush()
    T.eq(E.index, 2, "the go step does not validate")
    T.eq(A.hint, nil)
end)

T.run()
