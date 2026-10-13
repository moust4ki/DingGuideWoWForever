-- Walking passages (Core/Passages.lua): a walk from one side of a lift, tunnel, bridge, city
-- gate or portal to the other goes through it; the arrow leads to its entry with a hint, then
-- to its far end once the player is in it, then on to the target.
-- The mock lays the zones side by side: a passage's two ends are far apart there, which only
-- makes the way through them longer, never different.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, Travel, Passages = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Travel, Ding.Passages

local function point(map, x, y) return { map = map, x = x, y = y, label = "Target" } end

local function start(opts)
    T.reset({ level = opts.level or 20, race = opts.race or "Human", faction = opts.faction or "Alliance" })
    H.player.map, H.player.x, H.player.y = opts.at[1], opts.at[2], opts.at[3]
    Travel:Reset()
end

local function horde(at) start({ at = at, race = "Tauren", faction = "Horde" }) end
local function alliance(at) start({ at = at, race = "Dwarf" }) end

local function kinds(plan)
    local out = {}
    for _, l in ipairs(plan and plan.legs or {}) do out[#out + 1] = l.kind end
    return table.concat(out, " ")
end

-- The passage of the data whose end `key` is at (map, x, y).
local function passageAt(key, map, x, y)
    for _, p in ipairs(Passages.LIST) do
        local e = p[key]
        if e[1] == map and math.abs(e[2] - x) < 0.01 and math.abs(e[3] - y) < 0.01 then return p end
    end
end

local function at(p, map, x, y)
    return p and p.map == map and math.abs(p.x - x) < 0.01 and math.abs(p.y - y) < 0.01
end

local MULGORE, THUNDER_BLUFF = 1412, 1456
local BLOODHOOF = { MULGORE, 47.5, 58.5 }
local TB_LIFTS = { { 31.9, 66.6 }, { 51.3, 31.4 } }
local function atTbLift(p)
    for _, xy in ipairs(TB_LIFTS) do
        if at(p, THUNDER_BLUFF, xy[1], xy[2]) then return true end
    end
    return false
end

---------------------------------------------------------------------------
-- The data
---------------------------------------------------------------------------
T.test("every passage joins its two sides: each end on its own side, a known kind", function()
    local kinds = { lift = true, tunnel = true, bridge = true, gate = true, portal = true }
    for i, p in ipairs(Passages.LIST) do
        T.ok(kinds[p.kind], "passage " .. i .. ": kind " .. tostring(p.kind))
        T.ok(p.sides and p.sides[1] and p.sides[2], "passage " .. i .. ": no sides")
        for side, key in ipairs({ "a", "b" }) do
            local e = p[key]
            T.ok(type(e[1]) == "number" and e[2] >= 0 and e[2] <= 100 and e[3] >= 0 and e[3] <= 100,
                "passage " .. i .. ": end " .. key .. " is not { map, x, y }")
            local here = { map = e[1], x = e[2], y = e[3], zone = e.zone }
            T.eq(Passages.SideOf(p.sides, here), side, "passage " .. i .. ": end " .. key .. " on the wrong side")
        end
        if p.kind == "lift" then T.ok(p.up == "a" or p.up == "b", "passage " .. i .. ": a lift without its upper end") end
        T.ok(not p.faction or p.faction == "A" or p.faction == "H", "passage " .. i .. ": faction " .. tostring(p.faction))
        T.eq(type(p.verified), "boolean", "passage " .. i .. ": no verified flag")
    end
end)

T.test("sides: a city against the rest of the world, a box of a zone, a pair of zone lists", function()
    local S = Passages.SIDES
    T.eq(Passages.SideOf(S.thunderBluff, point(THUNDER_BLUFF, 45, 55)), 1)
    T.eq(Passages.SideOf(S.thunderBluff, point(MULGORE, 47, 58)), 2)
    T.eq(Passages.SideOf(S.thunderBluff, point(1413, 50, 50)), 2)
    T.eq(Passages.SideOf(S.rutTheran, point(1438, 56, 92)), 1, "Rut'theran Village")
    T.eq(Passages.SideOf(S.rutTheran, point(1438, 56, 60)), 2, "Dolanaar")
    T.eq(Passages.SideOf(S.rutTheran, point(1457, 40, 50)), 2, "Darnassus")
    T.eq(Passages.SideOf(S.rutTheran, point(1439, 36, 46)), 2, "Darkshore, over the sea")
    T.eq(Passages.SideOf(S.dunAlgaz, point(1437, 10, 60)), 1, "the Wetlands")
    T.eq(Passages.SideOf(S.dunAlgaz, point(1432, 35, 47)), 2, "Loch Modan")
    T.eq(Passages.SideOf(S.thandol, point(1437, 10, 60)), 2, "the Wetlands, south of the bridge")
    -- A cave or a dungeon of a zone is on its zone's side.
    T.eq(Passages.SideOf(S.dunAlgaz, point(1581, 50, 50)), 2, "the Deadmines, under Westfall")
end)

---------------------------------------------------------------------------
-- Thunder Bluff's lifts
---------------------------------------------------------------------------
T.test("Thunder Bluff from Mulgore: the lift up, then straight on once on top", function()
    horde(BLOODHOOF)
    local target = point(THUNDER_BLUFF, 45, 55)
    local leg = Travel:Leg(target)
    T.ok(leg and leg.kind == "passage", "no lift: " .. kinds(Travel:Plan(target)))
    T.eq(leg.hint, L.PASSAGE_LIFT_UP:format("Thunder Bluff"))
    T.ok(atTbLift(leg.point), "the arrow is not at a lift of Thunder Bluff")
    T.eq(leg.passage.kind, "lift")
    T.eq(kinds(Travel.plan), "walk passage walk")
    -- On top of the lift, the map is Thunder Bluff's: a straight walk to the target.
    H.player.map, H.player.x, H.player.y = THUNDER_BLUFF, leg.point.x + 0.2, leg.point.y
    T.eq(Travel:Leg(target), nil, "on top of the lift, still a passage")
    T.eq(Travel.plan, nil)
end)

T.test("Thunder Bluff to Mulgore: the lift down; standing on it, its foot", function()
    horde({ THUNDER_BLUFF, 45, 55 })
    local target = point(MULGORE, 47.5, 58.5)
    local leg = Travel:Leg(target)
    T.ok(leg and leg.kind == "passage", "no lift: " .. kinds(Travel:Plan(target)))
    T.eq(leg.hint, L.PASSAGE_LIFT_DOWN:format("Mulgore"))
    T.ok(atTbLift(leg.point), "the arrow is not at a lift of Thunder Bluff")
    -- On the lift: its first leg is the ride itself, to its foot in Mulgore.
    H.player.x, H.player.y = leg.point.x, leg.point.y
    local onLift = Travel:Leg(target)
    T.ok(onLift and onLift.kind == "passage", "the lift is forgotten once on it")
    T.eq(onLift.hint, L.PASSAGE_LIFT_DOWN:format("Mulgore"))
    T.eq(onLift.point.zone, MULGORE, "the arrow is not at the lift's foot")
    T.eq(kinds(Travel.plan), "passage walk")
    -- Down in Mulgore: straight to the target.
    H.player.map, H.player.x, H.player.y = MULGORE, 47, 58
    T.eq(Travel:Leg(target), nil)
end)

T.test("a lift goes up without moving: on another map, the plan is made again", function()
    horde(BLOODHOOF)
    local target = point(MULGORE, 60, 22)
    local plan = Travel:PlanFor(target)
    T.eq(Travel:PlanFor(target), plan, "the plan is not kept on the spot")
    Travel.cache.from.map = THUNDER_BLUFF    -- made at the same place, read on another map
    T.ok(Travel:PlanFor(target) ~= plan, "the plan made on another map is kept")
end)

T.test("a walk on one side stays straight", function()
    horde(BLOODHOOF)
    T.eq(Travel:Leg(point(MULGORE, 60, 22)), nil, "Bloodhoof to Red Rocks")
    horde({ THUNDER_BLUFF, 45, 55 })
    T.eq(Travel:Leg(point(THUNDER_BLUFF, 30, 30)), nil, "across Thunder Bluff")
    alliance({ 1437, 10.5, 60 })
    T.eq(Travel:Leg(point(1437, 50, 40)), nil, "across the Wetlands")
    alliance({ 1426, 46.5, 52 })
    T.eq(Travel:Leg(point(1432, 35, 47)), nil, "Dun Morogh to Loch Modan: no passage between them")
    start({ at = { 1429, 42, 65 } })
    T.eq(Travel:Leg(point(1436, 56, 47)), nil, "Elwynn Forest to Westfall")
    T.eq(Travel:Itinerary(Travel:Plan(point(1436, 56, 47))), nil, "an itinerary for a plain walk")
end)

---------------------------------------------------------------------------
-- Dun Algaz
---------------------------------------------------------------------------
local ALGAZ = passageAt("a", 1437, 54.0, 83.5)

T.test("Dun Algaz: from the Wetlands to Loch Modan through the tunnel, and back", function()
    T.ok(ALGAZ, "no Dun Algaz passage")
    alliance({ 1437, 10.5, 60 })                 -- Menethil Harbor
    local thelsamar = point(1432, 35, 47)
    local leg = Travel:Leg(thelsamar)
    T.ok(leg and leg.kind == "passage", "no tunnel: " .. kinds(Travel:Plan(thelsamar)))
    T.eq(leg.hint, L.PASSAGE_TUNNEL:format("Loch Modan"))
    T.ok(at(leg.point, 1437, 54.0, 83.5), "the arrow is not at the tunnel's Wetlands end")
    T.eq(kinds(Travel.plan), "walk passage walk")
    -- Back from Loch Modan.
    alliance({ 1432, 35, 47 })
    local menethil = point(1437, 10.5, 60)
    leg = Travel:Leg(menethil)
    T.ok(leg and leg.kind == "passage", "no tunnel back")
    T.eq(leg.hint, L.PASSAGE_TUNNEL:format("Wetlands"))
    T.ok(at(leg.point, 1432, 25.3, 1.5), "the arrow is not at the tunnel's Loch Modan end")
end)

T.test("Dun Algaz: in the tunnel, the arrow goes on to its far end", function()
    alliance({ 1437, 54.0, 83.5 })               -- at the Wetlands end
    local thelsamar = point(1432, 35, 47)
    local leg = Travel:Leg(thelsamar)
    T.ok(leg and leg.kind == "passage", "no tunnel from its entry")
    T.ok(at(leg.point, 1432, 25.3, 1.5), "the arrow points back at the entry")
    T.eq(kinds(Travel.plan), "passage walk")
    -- A plan made a moment ago, outside the tunnel, kept while the player steps in.
    alliance({ 1437, 56.0, 83.5 })               -- some 100 yards off the tunnel's line
    leg = Travel:Leg(thelsamar)
    T.ok(at(leg.point, 1437, 54.0, 83.5), "the arrow is not at the entry")
    H.player.x = 54.5                            -- in the tunnel's mouth, the plan not made again
    leg = Travel:Leg(thelsamar)
    T.eq(kinds(Travel.plan), "walk passage walk", "the plan was made again")
    T.ok(at(leg.point, 1432, 25.3, 1.5), "in the tunnel, the arrow still points at its entry")
    -- Out in Loch Modan: straight on.
    H.player.map, H.player.x, H.player.y = 1432, 25, 10
    T.eq(Travel:Leg(thelsamar), nil)
end)

T.test("Thandol Span then Dun Algaz: from Arathi to Loch Modan, one passage after the other", function()
    alliance({ 1417, 46, 47 })                   -- Refuge Pointe
    local thelsamar = point(1432, 35, 47)
    local leg = Travel:Leg(thelsamar)
    T.ok(leg and leg.kind == "passage", "no bridge: " .. kinds(Travel:Plan(thelsamar)))
    T.eq(leg.hint, L.PASSAGE_BRIDGE:format("Wetlands"))
    T.eq(kinds(Travel.plan), "walk passage walk passage walk")
    T.eq(Travel.plan.legs[4].node.passage, ALGAZ)
end)

---------------------------------------------------------------------------
-- Cities: Ironforge's gates, the Rut'theran portal
---------------------------------------------------------------------------
T.test("Ironforge from Dun Morogh: through its gates; inside, straight on", function()
    alliance({ 1426, 46.5, 52 })                 -- Kharanos
    local forge = point(1455, 55.5, 47.8)
    local leg = Travel:Leg(forge)
    T.ok(leg and leg.kind == "passage", "no gate: " .. kinds(Travel:Plan(forge)))
    T.eq(leg.hint, L.PASSAGE_GATE_IN:format("Ironforge"))
    T.ok(at(leg.point, 1426, 52.9, 36.2), "the arrow is not at the gates in Dun Morogh")
    alliance({ 1455, 30, 60 })
    T.eq(Travel:Leg(forge), nil, "a walk inside Ironforge")
    -- Out again, to Kharanos.
    leg = Travel:Leg(point(1426, 46.5, 52))
    T.ok(leg and leg.kind == "passage", "no gate out")
    T.eq(leg.hint, L.PASSAGE_GATE_OUT:format("Ironforge"))
    T.ok(at(leg.point, 1455, 21.5, 78.0), "the arrow is not at the end of the entrance hall")
end)

T.test("a flight into a city flies over its gates", function()
    local thor, dungar = Ding.Data:NpcPoints(523)[1], Ding.Data:NpcPoints(352)[1]
    start({ at = { thor.map, thor.x + 1, thor.y } })
    Ding.char.flights = { [523] = "Sentinel Hill, Westfall", [352] = "Stormwind, Elwynn" }
    local target = point(1453, dungar.x, dungar.y + 1)
    local leg = Travel:Leg(target)
    T.ok(leg and leg.kind == "fly", "no flight to Stormwind: " .. kinds(Travel:Plan(target)))
    T.eq(leg.hint, L.TRAVEL_FLY:format("Stormwind, Elwynn"))
end)

T.test("the tram into Ironforge is not held back by its gates", function()
    local docks = Travel:Docks()
    local tram
    for _, d in ipairs(docks) do
        if d.kind == "tram" then tram = d end
    end
    local sw, forge = tram.a.map == 1453 and tram.a or tram.b, tram.a.map == 1453 and tram.b or tram.a
    alliance({ 1453, sw.x + 1, sw.y })
    local leg = Travel:Leg(point(1455, forge.x, forge.y + 2))
    T.ok(leg and leg.kind == "tram", "no tram: " .. kinds(Travel.plan))
end)

T.test("Rut'theran Village: the portal up to Darnassus, then on into Teldrassil", function()
    start({ at = { 1438, 55.0, 95.0 }, race = "NightElf" })   -- by the dock
    local dolanaar = point(1438, 56, 60)
    local leg = Travel:Leg(dolanaar)
    T.ok(leg and leg.kind == "passage", "no portal: " .. kinds(Travel:Plan(dolanaar)))
    T.eq(leg.hint, L.PASSAGE_PORTAL:format("Darnassus"))
    T.ok(at(leg.point, 1438, 55.9, 89.4), "the arrow is not at the portal")
    -- From Dolanaar, the boat's dock is down the portal of Darnassus.
    start({ at = { 1438, 56, 60 }, race = "NightElf" })
    leg = Travel:Leg(point(1438, 55, 95))
    T.ok(leg and leg.kind == "passage", "no portal down: " .. kinds(Travel:Plan(point(1438, 55, 95))))
    T.eq(leg.hint, L.PASSAGE_PORTAL:format("Teldrassil"))
    T.ok(at(leg.point, 1457, 30.2, 41.4), "the arrow is not at Darnassus' portal")
end)

---------------------------------------------------------------------------
-- Islands: never a walk over the sea
---------------------------------------------------------------------------
-- The ways a plan takes besides walking (a passage by its kind); every walk stays on Teldrassil
-- or off it.
local function ways(plan)
    local out = {}
    for _, l in ipairs(plan and plan.legs or {}) do
        if l.kind == "walk" then
            T.eq(Passages.SideOf(Passages.SIDES.teldrassil, l.from), Passages.SideOf(Passages.SIDES.teldrassil, l.to),
                "a walk between Teldrassil and the mainland")
        else
            out[#out + 1] = l.kind == "passage" and l.node.passage.kind or l.kind
        end
    end
    return table.concat(out, " ")
end

T.test("Darnassus to Menethil Harbor: the portal, the boat to Auberdine, the boat to Menethil", function()
    start({ at = { 1457, 40, 50 }, race = "NightElf" })
    local plan = Travel:Plan(point(1437, 10.5, 60))
    T.eq(ways(plan), "portal boat boat")
    T.eq(plan.legs[4].to.map, 1439, "the first boat does not land in Darkshore")
    T.eq(plan.legs[6].to.map, 1437, "the second boat does not land in the Wetlands")
end)

T.test("Darnassus to Ironforge: down the portal, two boats, never a walk over the sea", function()
    -- (The mock's Stranglethorn lies next to Dun Morogh: there, the Booty Bay boat wins.)
    start({ at = { 1457, 40, 50 }, race = "NightElf" })
    local forge = point(1455, 55.5, 47.8)
    local steps = ways(Travel:Plan(forge))
    T.ok(steps:find("^portal boat boat ") and steps:find(" gate$"), steps)
    local leg = Travel:Leg(forge)
    T.eq(leg.hint, L.PASSAGE_PORTAL:format("Teldrassil"), "the arrow does not lead to the portal down")
end)

T.test("Darnassus to Auberdine: down the portal and over by boat, not a swim", function()
    start({ at = { 1457, 40, 50 }, race = "NightElf" })
    T.eq(kinds(Travel:Plan(point(1439, 36, 46))), "walk passage walk boat walk")
end)

---------------------------------------------------------------------------
-- One faction's passage
---------------------------------------------------------------------------
T.test("a passage for one faction only is never another's way", function()
    local sides = { { 1433 }, "*" }
    local passage = { sides = sides, kind = "gate", faction = "H", a = { 1433, 20, 50 }, b = { 1429, 80, 70 } }
    Passages.SIDES.test = sides
    Passages.LIST[#Passages.LIST + 1] = passage
    local ok, err = pcall(function()
        local target = point(1433, 26, 46)
        start({ at = { 1429, 42, 65 } })
        local leg = Travel:Leg(target)
        T.ok(not leg or leg.kind ~= "passage", "the Alliance takes the Horde's passage")
        start({ at = { 1429, 42, 65 }, race = "Orc", faction = "Horde" })
        leg = Travel:Leg(target)
        T.ok(leg and leg.kind == "passage", "the Horde does not take its passage")
    end)
    Passages.SIDES.test = nil
    table.remove(Passages.LIST)
    Travel:Reset()
    if not ok then error(err, 0) end
end)

---------------------------------------------------------------------------
-- The arrow and the window
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-passage", title = "Passage", races = { "Tauren" }, steps = {
    { go = { THUNDER_BLUFF, 45, 55 }, text = "Thunder Bluff" },
    { level = 60 },
} })

T.test("the arrow leads to the lift with its hint, the window gives the route; the step validates on its place", function()
    horde(BLOODHOOF)
    E:SetGuide("t-passage", 1, true); H.flush()
    A.point = nil; A:Tick(); H.flush()
    local hint = L.PASSAGE_LIFT_UP:format("Thunder Bluff")
    T.eq(A.hint, hint)
    T.eq(H.plain(A.frame.label:GetText()), hint)
    T.ok(atTbLift(A.shownPoint), "the arrow does not show the lift")
    local route = Travel:Itinerary(Travel.plan)
    T.ok(route and route:find(L.ROUTE_TO:format(L.ROUTE_LIFT:format("0:45"), "Thunder Bluff"), 1, true),
        "no lift in the itinerary: " .. tostring(route))
    local said, routed = false, false
    for _, row in ipairs(P.rowsShown or {}) do
        if row.notice == "travel" then
            local text = H.plain(row.text or "") .. " " .. H.plain(row.sub or "")
            if text:find(hint, 1, true) then said = true end
            if text:find(route, 1, true) then routed = true end
        end
    end
    T.ok(said, "the window does not say to take the lift")
    T.ok(routed, "the window does not give the route")
    -- On top, at the step's place: the go step is done, the hint gone.
    H.player.map, H.player.x, H.player.y = THUNDER_BLUFF, 45, 55
    A.point = nil; A:Tick(); H.flush()
    T.eq(E.index, 2, "the go step does not validate")
    T.eq(A.hint, nil)
end)

---------------------------------------------------------------------------
-- /ding passages: for testers
---------------------------------------------------------------------------
local function chat(fn)
    local printed = {}
    local add = DEFAULT_CHAT_FRAME.AddMessage
    DEFAULT_CHAT_FRAME.AddMessage = function(_, msg) printed[#printed + 1] = H.plain(msg) end
    local ok, err = pcall(fn)
    DEFAULT_CHAT_FRAME.AddMessage = add
    assert(ok, err)
    return printed
end

T.test("/ding passages: the nearest passages, checked or not, their ends; the arrow on the one asked", function()
    horde({ THUNDER_BLUFF, 32.5, 66 })      -- by the south-western lift, on top
    E:SetGuide("t-passage", 1, true); H.flush()
    local printed = chat(function() SlashCmdList.DING("passages") end)
    T.ok(printed[1]:find(L.PASSAGES_TITLE:format(1), 1, true), printed[1])
    T.eq(#printed, 6, "five passages listed")
    local first = printed[2]
    T.ok(first:find("1. " .. L.PASSAGE_LIFT_DOWN:format("Mulgore"), 1, true), first)
    T.ok(first:find(L.PASSAGES_UNCHECKED, 1, true), first)
    T.ok(first:find("a = { 1456, ", 1, true) and first:find("b = { 1456, ", 1, true), first)
    -- The arrow points at that lift's foot, with what to do there.
    A.point = nil; A:Tick(); H.flush()
    T.ok(atTbLift(A.shownPoint), "the arrow is not at the lift")
    T.eq(H.plain(A.frame.label:GetText()), L.PASSAGE_LIFT_DOWN:format("Mulgore"))
    -- The second one on asking, a checked passage said so.
    Passages.LIST[1].verified, Passages.LIST[2].verified = true, true
    printed = chat(function() SlashCmdList.DING("passages 2") end)
    Passages.LIST[1].verified, Passages.LIST[2].verified = false, false
    T.ok(printed[1]:find(L.PASSAGES_TITLE:format(2), 1, true), printed[1])
    T.ok(printed[2]:find(L.PASSAGES_CHECKED, 1, true), printed[2])
    A:Unfocus()
end)

T.run()
