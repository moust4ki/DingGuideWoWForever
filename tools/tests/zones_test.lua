-- Zones and the world map: a target outside the player's zone names its zone, under the arrow
-- and on the step's line (with the NPC for a quest giver or a turn-in), and in the travel
-- itinerary; the arrow's target as the client's own map waypoint, else a TomTom pin.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, D = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Data

local function start(steps, at)
    H.closeDialog()
    T.reset({ level = 5 })
    Ding.RegisterGuide({ id = "t-zones", title = "Zones", races = { "NightElf" }, steps = steps })
    H.player.map, H.player.x, H.player.y = at[1], at[2], at[3]
    E:SetGuide("t-zones", 1, true); H.flush()
    A.point = nil; A:Tick(); H.flush()
end

local function rowFor(action)
    for _, row in ipairs(P.rowsShown or {}) do
        if row.action == action then return row end
    end
end

---------------------------------------------------------------------------
-- Zone names
---------------------------------------------------------------------------
T.test("the arrow names the target's zone when it is not the player's", function()
    start({ { go = { 1431, 50, 50 }, text = "Darkshire" } }, { 1429, 50, 50 })    -- Elwynn -> Duskwood
    -- On the line under the target's name, the distance alone under it.
    local f = A.frame
    T.ok(f.detail:IsShown() and H.plain(f.detail:GetText()) == "Duskwood", tostring(f.detail:GetText()))
    T.ok(not H.plain(f.distance:GetText()):find("Duskwood", 1, true), H.plain(f.distance:GetText()))
    T.eq(f.line.points[1][2], f.detail, "the distance is not under the zone")
    H.player.map, H.player.x, H.player.y = 1431, 40, 40
    E.playerZoneAt = nil
    A.point = nil; A:Tick()
    T.ok(not f.detail:IsShown(), "the zone named inside it")
    T.eq(f.line.points[1][2], f.label, "the distance is not under the name")
end)

T.test("the step's line: the quest giver and the zone, only outside the player's zone", function()
    start({ { accept = 456 } }, { 1439, 50, 50 })    -- in Darkshore, the giver in Teldrassil
    local row = rowFor("accept")
    T.ok(row, "no accept row")
    T.ok(H.plain(row.text):find(" — " .. L.WHERE_WHO:format(D:StarterName(456), "Teldrassil"), 1, true), H.plain(row.text))
    start({ { accept = 456 } }, { 1438, 58.7, 44 })
    T.ok(not H.plain(rowFor("accept").text):find(" — ", 1, true), "a zone in the player's zone")
end)

T.test("objectives and goals: the zone of the nearest target", function()
    start({ { kill = { { 2031, 2 } } } }, { 1439, 50, 50 })
    local row = rowFor("goal")
    T.ok(row and H.plain(row.text):find(" — Teldrassil", 1, true), row and H.plain(row.text))
end)

T.test("a sub-map (a dungeon, a cave) is named by its zone", function()
    T.reset({ level = 5 })
    H.player.map = 1438
    E.playerZoneAt = nil
    T.eq(E:ZoneLabel({ map = 1581, x = 50, y = 50 }), "Westfall")
    H.player.map = 1436
    E.playerZoneAt = nil
    T.eq(E:ZoneLabel({ map = 1581, x = 50, y = 50 }), nil, "named while in its zone")
end)

T.test("the itinerary names the zone each flight leads to", function()
    local thor, ariena = D:NpcPoints(523)[1], D:NpcPoints(931)[1]
    T.reset({ level = 20, race = "Human" })
    H.player.map, H.player.x, H.player.y = thor.map, thor.x, thor.y
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    H.closeTaxi()
    local route = Ding.Travel:Itinerary(Ding.Travel:Plan({ map = ariena.map, x = ariena.x, y = ariena.y, label = "T" }))
    T.ok(route and route:find(L.ROUTE_TO:format(L.ROUTE_FLY:format(""), ""):sub(1, 3), 1, true), tostring(route))
    T.ok(route:find("Redridge Mountains", 1, true), route)
end)

---------------------------------------------------------------------------
-- World map mark
---------------------------------------------------------------------------
T.test("world map: the target as the client's waypoint, super-tracked, moved with the target", function()
    start({ { go = { 1438, 40, 40 }, text = "A" }, { go = { 1438, 60, 60 }, text = "B" } }, { 1438, 50, 50 })
    local w = H.userWaypoint()
    T.ok(w and w.map == 1438 and math.abs(w.x - 40) < 0.1 and math.abs(w.y - 40) < 0.1, "no waypoint on the target")
    T.ok(w.tracked, "not super-tracked")
    local calls = H.waypointCalls()
    A:Tick(); A:Tick()
    T.eq(H.waypointCalls(), calls, "set again while the target is the same")
    E:Next(); H.flush()
    A.point = nil; A:Tick()
    w = H.userWaypoint()
    T.ok(w and math.abs(w.x - 60) < 0.1, "the waypoint does not follow the target")
end)

T.test("world map: a waypoint the player set is left alone; off, Ding's is cleared", function()
    start({ { go = { 1438, 40, 40 }, text = "A" }, { go = { 1438, 60, 60 }, text = "B" } }, { 1438, 50, 50 })
    H.setUserWaypoint(1439, 30, 30)    -- the player's own
    E:Next(); H.flush()
    A.point = nil; A:Tick()
    T.eq(H.userWaypoint().map, 1439, "the player's waypoint replaced")
    -- Cleared by the player: Ding's comes back with the next target.
    H.setUserWaypoint(nil)
    start({ { go = { 1438, 40, 40 }, text = "A" } }, { 1438, 50, 50 })
    T.ok(H.userWaypoint(), "no waypoint")
    Ding.db.arrow.worldMap = false
    A:Tick()
    T.eq(H.userWaypoint(), nil, "Ding's waypoint stays with the option off")
    Ding.db.arrow.worldMap = true
    A.worldKey = nil; A:Tick()
    T.ok(H.userWaypoint(), "not back with the option on")
    P:SetShown(false); A:Tick()
    T.eq(H.userWaypoint(), nil, "stays with the guide window closed")
    P:SetShown(true)
end)

T.test("world map: after a reload, Ding's own waypoint is still Ding's", function()
    start({ { go = { 1438, 40, 40 }, text = "A" }, { go = { 1438, 60, 60 }, text = "B" } }, { 1438, 50, 50 })
    A.worldMark, A.worldKey = nil, nil    -- a reload: only the saved variables remain
    E:Next(); H.flush()
    A.point = nil; A:Tick()
    T.ok(math.abs(H.userWaypoint().x - 60) < 0.1, "Ding's old waypoint taken for the player's")
end)

T.test("world map: without the client's waypoint, a TomTom pin (no TomTom arrow); else nothing", function()
    local added, removed = {}, 0
    _G.TomTom = {
        AddWaypoint = function(_, map, x, y, opts)
            added[#added + 1] = { map = map, x = x, y = y, opts = opts }
            return #added
        end,
        RemoveWaypoint = function() removed = removed + 1 end,
    }
    start({ { go = { 1438, 40, 40 }, text = "A" }, { go = { 1438, 60, 60 }, text = "B" } }, { 1438, 50, 50 })
    -- A client without map waypoints.
    H.setWaypointApi(false)
    H.setUserWaypoint(nil)
    A.worldMark, A.worldKey, Ding.char.worldMark = nil, nil, nil
    added = {}
    local calls = H.waypointCalls()
    A.point = nil; A:Tick()
    T.eq(#added, 1, "no TomTom pin")
    T.eq(added[1].opts.crazy, false, "TomTom's arrow shown")
    T.eq(added[1].opts.world, true)
    E:Next(); H.flush()
    A.point = nil; A:Tick()
    T.eq(#added, 2)
    T.eq(removed, 1, "the old pin stays")
    _G.TomTom = nil
    A.worldMark, A.worldKey = nil, nil
    A.point = nil; A:Tick()
    T.eq(H.waypointCalls(), calls, "a waypoint without the client's API")
    T.eq(#added, 2, "a TomTom pin without TomTom")
    H.setWaypointApi(true)
end)

T.test("world map: the option in the Arrow tab says which way it marks", function()
    T.reset({ level = 5 })
    local C = Ding.Config
    C:Open("arrow")
    local row
    for _, r in ipairs(C.TABS[C.TAB.arrow].rows) do
        if r.opts and r.opts.label == L.WORLD_MARK then row = r end
    end
    T.ok(row, "no world map row in the Arrow tab")
    T.eq(row.opts.desc, L.WORLD_MARK_DESC)
    C:Close()
end)

T.run()
