-- The NPC directory's trips end to end, through Core/Travel.lua like any target of the arrow:
-- the row says how long and by which ways; the arrow goes to the flight master or the dock
-- first, the guide window says what to take and the whole way, under the trip's line; then
-- the NPC, until its window opens.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local A11 = "leveling-a11-duskwood-and-redridge-mountains"
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS", guides = { A11 } })
local Ding, H = T.Ding, T.H
local E, P, A, L, F, Dir, Travel = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Finder, Ding.Directory,
    Ding.Travel

local BULIWYF, ANSEKHWA = 11865, 11869
local DARKSHIRE_FM, IRONFORGE_FM, ORGRIMMAR_FM, THUNDER_BLUFF_FM, STORMWIND_FM = 2409, 1573, 3310, 2995, 352

Ding.RegisterGuide({ id = "t-directory-travel", title = "Directory travel",
    steps = { { accept = 456 }, { level = 60 } } })

-- The mocked world lays the zones side by side; these trips need one closer to the real one:
-- Teldrassil across the water from Darkshore, Darnassus and Ironforge inside their zone,
-- Wetlands north of Dun Morogh with Loch Modan at the end of the Dun Algaz pass, Undercity under
-- the ruins by the Tirisfal zeppelin tower, Orgrimmar by Durotar, Thunder Bluff in Mulgore. { continent, x, y, width, height } in yards; any other
-- map lies far away. (The mock's convention: a map's y goes along the world's x.)
local WORLD = {
    [1438] = { 1, 0, 0, 3400, 5100 }, [1457] = { 1, 1360, 1275, 680, 1020 }, [1439] = { 1, 4000, 1000, 3400, 5100 },
    [1411] = { 1, 8000, 12000, 3400, 5100 }, [1454] = { 1, 6600, 13000, 1200, 1500 },
    [1413] = { 1, 8000, 6000, 3400, 5100 }, [1412] = { 1, 12000, 5000, 3400, 5100 },
    [1456] = { 1, 12680, 6530, 900, 1100 }, [1445] = { 1, 14000, 12000, 3400, 5100 },
    [1420] = { 0, 0, 10000, 3400, 5100 }, [1458] = { 0, 2108, 12907, 340, 510 },
    [1437] = { 0, 10000, 10000, 3400, 5100 }, [1432] = { 0, 12900, 11464, 3400, 5100 },
    [1426] = { 0, 14000, 9000, 3400, 5100 }, [1455] = { 0, 14680, 11295, 510, 765 },
    [1429] = { 0, 20000, 8000, 3400, 5100 }, [1453] = { 0, 20000, 7000, 1200, 1500 },
    [1431] = { 0, 24000, 8000, 3400, 5100 }, [1434] = { 0, 36000, 8000, 3400, 5100 },
}
local CITIES = { [1457] = true, [1454] = true, [1456] = true, [1458] = true, [1455] = true, [1453] = true }
local toWorld = C_Map.GetWorldPosFromMapPos
C_Map.GetWorldPosFromMapPos = function(map, pos)
    local r = WORLD[map]
    if r then return r[1], { x = r[2] + pos.y * r[4], y = r[3] + pos.x * r[5] } end
    local continent, world = toWorld(map, pos)
    if continent and world and map ~= 1414 and map ~= 1415 then world = { x = world.x + 200000, y = world.y } end
    return continent, world
end
C_Map.GetMapPosFromWorldPos = function(continent, pos)
    for map, r in pairs(WORLD) do
        if not CITIES[map] and r[1] == continent and pos.x >= r[2] and pos.x <= r[2] + r[4] and pos.y >= r[3]
            and pos.y <= r[3] + r[5] then
            return map, { x = (pos.y - r[3]) / r[5], y = (pos.x - r[2]) / r[4] }
        end
    end
    return nil
end
Travel:Reset()
Dir:Reset()

local function start(opts)
    H.closeDialog()
    T.reset({ level = opts.level or 20, class = opts.class or "HUNTER", race = opts.race or "Dwarf",
        faction = opts.faction or "Alliance" })
    H.player.map, H.player.x, H.player.y = opts.map, opts.x, opts.y
    H.setGamepadConnected(true)
    Ding.char.flights = opts.flights
    E:SetGuide("t-directory-travel", 1, true); H.flush()
    H.tick(1)
    Dir:Forget()
end

-- Moves the player and lets the arrow look again.
local function at(map, x, y)
    H.player.map, H.player.x, H.player.y = map, x, y
    A.point = nil
    A:Tick()
    P:Update()
end

-- The ways a plan takes besides walking; a passage (Core/Passages.lua) by its kind.
local function kinds(plan)
    local out = {}
    for _, l in ipairs(plan and plan.legs or {}) do
        if l.kind ~= "walk" then out[#out + 1] = l.kind == "passage" and l.node.passage.kind or l.kind end
    end
    return table.concat(out, ",")
end

local function tripRow()
    for _, r in ipairs(P.rowsShown or {}) do
        if r.action == "notice" and r.notice == "trip" then return r end
    end
end

local function rowIndex(label)
    for i, r in ipairs(F.rows or {}) do
        if r.label == label then return i end
    end
end

T.test("Darkshire to Buliwyf: the row says flight, the arrow flies first, then walks; his trainer ends it", function()
    start({ map = 1431, x = 75, y = 46, flights = { [DARKSHIRE_FM] = "Darkshire", [IRONFORGE_FM] = "Ironforge" } })
    -- The directory: Weapon masters, Guns.
    F:Open(1); H.flush()
    F:Activate(rowIndex(L.DIR_WEAPONS)); H.flush()
    local i = rowIndex(L.WEAPON_GUNS)
    local row = F.rows[i]
    T.ok(row.sub:find("Buliwyf Stonehand · Ironforge · " .. L.DIR_BY_FLY, 1, true), row.sub)
    T.ok(row.right:match("^%d+ min$"), "no time in minutes: " .. row.right)
    T.eq(row.entry.means[1], "fly")
    F:Activate(i); H.flush()
    T.ok(F.trip and F.trip.npc == BULIWYF, "no trip to Buliwyf")
    -- The arrow: Darkshire's flight master first, the guide window says it and the whole way.
    at(1431, 75, 46)
    local leg = Travel.leg
    T.ok(leg and leg.kind == "fly" and leg.flight == IRONFORGE_FM, "no flight to Ironforge: " .. kinds(Travel.plan))
    T.eq(A.shownPoint.map, 1431, "the arrow does not show Darkshire's flight master")
    T.eq(A.hint, L.TRAVEL_FLY:format("Ironforge"))
    local trip = tripRow()
    local itinerary = Travel:Itinerary(Travel.plan)
    T.ok(trip and itinerary, "no trip line or no itinerary")
    T.ok(H.plain(trip.sub):find(A.hint, 1, true) and H.plain(trip.sub):find(itinerary, 1, true),
        "the way there is not under the trip's line: " .. H.plain(trip.sub or ""))
    T.ok(H.plain(trip.sub):find(L.DIR_TRIP_PAD:format(Ding.Gamepad:ButtonName("PAD1")), 1, true), "no way back")
    -- Landed in Ironforge: on foot to Buliwyf.
    H.land(1455, 55.5, 47.8)
    at(1455, 55.5, 47.8)
    T.eq(Travel.leg, nil, "still a leg in Ironforge")
    T.eq(A.hint, nil)
    T.eq(A.shownPoint.npc, BULIWYF, "the arrow does not go to Buliwyf")
    T.ok(not H.plain(tripRow().sub):find(L.TRAVEL_FLY:format("Ironforge"), 1, true), "the flight is still told")
    -- His trainer window: the guide takes the arrow back.
    H.setNpcName("Buliwyf Stonehand"); H.openTrainer(false); H.closeTrainer(); H.setNpcName(nil)
    T.eq(F.trip, nil, "the trip does not end at his trainer window")
    -- His list (the client tells his id) is not the class trainer's.
    Ding.char.training = nil
    H.talk({ id = BULIWYF })
    H.setTrainerServices({ { name = "Guns", category = "available", level = 1, cost = 1000 } })
    H.openTrainer(false); H.closeTrainer(); H.closeDialog()
    T.eq(Ding.char.training, nil, "a weapon master's list taken for class training")
    H.setTrainerServices({})
end)

T.test("Darnassus to an Ironforge banker: the portal, the boats by Auberdine and Menethil, then on foot", function()
    start({ class = "WARRIOR", race = "NightElf", map = 1457, x = 50, y = 50 })
    local banker = Dir:CityList(Dir:City("ironforge"), Dir:Category("bank"))[1]
    T.ok(banker and banker.seconds, "no Ironforge banker priced from Darnassus")
    T.eq(table.concat(banker.means, ","), "boat,boat", "the row's ways")
    F:Open(2); H.flush()
    T.ok(F.rows[rowIndex("Ironforge")].sub:find(L.DIR_BY_BOAT, 1, true), "the city row does not say boat")
    F:Close(); H.flush()
    F:GoTo(banker)
    at(1457, 50, 50)
    T.eq(kinds(Travel.plan), "portal,boat,boat,tunnel,gate")
    -- Down the portal to Rut'theran, then its boat.
    T.ok(Travel.leg.kind == "passage" and Travel.leg.point.map == 1457, "not Darnassus' portal first")
    T.eq(A.hint, L.PASSAGE_PORTAL:format("Teldrassil"))
    at(1438, 55.9, 89.4)
    T.ok(Travel.leg.kind == "boat" and Travel.leg.point.map == 1438, "not the Rut'theran boat after the portal")
    T.eq(A.hint, L.TRAVEL_BOAT:format("Darkshore"))
    T.ok(H.plain(tripRow().sub):find(A.hint, 1, true), "the boat is not told under the trip")
    -- On board, then Auberdine: the other pier, the boat to Menethil.
    local dock = Travel.leg.point
    at(dock.map, dock.x, dock.y)
    T.eq(Travel.leg.kind, "boat", "on board: the far side")
    at(1439, 33.2, 40.2)
    T.ok(Travel.leg and Travel.leg.kind == "boat" and Travel.leg.point.map == 1439, "no boat to Menethil")
    T.eq(A.hint, L.TRAVEL_BOAT:format("Wetlands"))
    at(Travel.leg.point.map, Travel.leg.point.x, Travel.leg.point.y)
    -- Menethil Harbor: on foot through Dun Algaz and the gates of Ironforge to the banker.
    at(1437, 4.6, 57.1)
    T.ok(Travel.leg and Travel.leg.kind == "passage", "no tunnel from Menethil: " .. kinds(Travel.plan))
    T.eq(A.hint, L.PASSAGE_TUNNEL:format("Loch Modan"))
    at(1432, 25.3, 1.5)
    T.eq(A.hint, L.PASSAGE_GATE_IN:format("Ironforge"))
    at(1455, 21.5, 78.0)
    T.eq(Travel.leg, nil, "still a leg inside Ironforge: " .. kinds(Travel.plan))
    T.eq(A.shownPoint.npc, banker.npc, "the arrow does not go to the banker")
    H.setNpcName(nil)
    H.fire("BANKFRAME_OPENED"); H.flush()
    T.eq(F.trip, nil, "the bank window does not end the trip")
end)

T.test("Orgrimmar to Thunder Bluff: the wind rider; Undercity: the zeppelin, then the wind rider", function()
    local flights = { [ORGRIMMAR_FM] = "Orgrimmar", [THUNDER_BLUFF_FM] = "Thunder Bluff" }
    start({ race = "Tauren", faction = "Horde", map = 1454, x = 45, y = 62, flights = flights })
    local guns = Dir:Best("weapon:46")
    T.eq(guns.npc, ANSEKHWA)
    T.eq(table.concat(guns.means, ","), "fly")
    F:GoTo(guns)
    at(1454, 45, 62)
    T.ok(Travel.leg and Travel.leg.kind == "fly" and Travel.leg.flight == THUNDER_BLUFF_FM,
        "no flight to Thunder Bluff")
    T.eq(A.hint, L.TRAVEL_FLY:format("Thunder Bluff"))
    F:Cancel()
    -- From Undercity: the zeppelin to Durotar, then the flight.
    start({ race = "Tauren", faction = "Horde", map = 1458, x = 60, y = 50, flights = flights })
    guns = Dir:Best("weapon:46")
    T.eq(guns.npc, ANSEKHWA)
    T.eq(table.concat(guns.means, ","), "zeppelin,fly")
    F:GoTo(guns)
    at(1458, 60, 50)
    T.eq(kinds(Travel.plan), "lift,zeppelin,gate,fly")
    -- Up the lift (its foot and its top share a spot: the ride changes the map), then the zeppelin.
    T.ok(Travel.leg.kind == "passage" and Travel.leg.passage.kind == "lift", "not the lift first")
    T.eq(A.hint, L.PASSAGE_LIFT_UP:format("Tirisfal Glades"))
    at(1420, 63.15, 66.56)
    T.ok(Travel.leg.kind == "zeppelin" and Travel.leg.point.map == 1420, "not the Tirisfal zeppelin after the lift")
    T.eq(A.hint, L.TRAVEL_ZEPPELIN:format("Durotar"))
    local trip = tripRow()
    T.ok(H.plain(trip.sub):find(Travel:Itinerary(Travel.plan), 1, true), "no itinerary under the trip")
    F:Cancel()
    at(1458, 60, 50)
    T.eq(tripRow(), nil)
end)

T.test("a guide's bank step in Darkshire: the arrow flies to Stormwind's bank, until its window opens", function()
    start({ race = "Human", class = "WARRIOR", level = 28, map = 1431, x = 75, y = 46,
        flights = { [DARKSHIRE_FM] = "Darkshire", [STORMWIND_FM] = "Stormwind" } })
    local index
    for i, step in ipairs(Ding:GetGuide(A11).steps) do
        if step.bank == 916 and step.when and step.when.log == 74 then index = i end
    end
    T.ok(index, "no bank step in " .. A11)
    T.quests({ [74] = "log" })
    H.setItem(916, 1)
    E:SetGuide(A11, index, true); H.flush()
    H.tick(1)
    T.eq(E.index, index, "the bank step is passed")
    local bank = Dir:Best("bank")
    T.eq(Dir:Place(bank.point), "Stormwind City", "not Stormwind's bank")
    T.eq(table.concat(bank.means, ","), "fly")
    at(1431, 75, 46)
    T.eq(A.point and A.point.npc, bank.npc, "the arrow does not lead to the bank")
    T.ok(Travel.leg and Travel.leg.kind == "fly" and Travel.leg.flight == STORMWIND_FM, "no flight to Stormwind")
    T.eq(A.hint, L.TRAVEL_FLY:format("Stormwind"))
    -- Landed: on foot to the banker; his window open, the arrow has nothing left to show there.
    H.land(1453, 70.9, 72.5)
    at(1453, 70.9, 72.5)
    T.eq(Travel.leg, nil)
    T.eq(A.point and A.point.npc, bank.npc, "the arrow does not walk to the bank")
    H.fire("BANKFRAME_OPENED"); H.flush()
    H.tick(1)
    at(1453, 64, 80.8)
    T.ok(not (A.point and A.point.npc == bank.npc), "the arrow still points to the bank in its window")
    -- The item deposited: the step is done.
    H.setItem(916, nil)
    H.fire("BAG_UPDATE", 0); H.fire("BANKFRAME_CLOSED"); H.flush()
    H.tick(1)
    T.ok(E.index > index, "the bank step stays once the item is banked")
end)

T.run()
