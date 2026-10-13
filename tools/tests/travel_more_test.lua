-- Travel additions (Core/Travel.lua): flight masters never seen ("Try to fly to …"), flight
-- times measured on real flights, mage and druid teleports, walks through zones well above
-- the player's level, and the itinerary under the step.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, Travel, Data = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Travel, Ding.Data

local THOR, ARIENA = 523, 931    -- Sentinel Hill (Westfall), Lakeshire (Redridge)
local function spawn(npc) return Data:NpcPoints(npc)[1] end
local function point(map, x, y) return { map = map, x = x, y = y, label = "Target" } end

local function start(opts)
    opts = opts or {}
    T.reset({ level = opts.level or 20, race = opts.race or "Human", faction = opts.faction or "Alliance",
        class = opts.class })
    local at = opts.at
    H.player.map, H.player.x, H.player.y = at[1], at[2], at[3]
end

local function kinds(plan)
    local out = {}
    for _, l in ipairs(plan and plan.legs or {}) do out[#out + 1] = l.kind end
    return table.concat(out, " ")
end

T.test("a flight master never seen: walk to it, learn it, fly on; \"Try to fly to …\"", function()
    local thor, ariena = spawn(THOR), spawn(ARIENA)
    start({ at = { thor.map, thor.x + 2, thor.y } })
    Ding.char.flights = { [ARIENA] = "Lakeshire, Redridge" }    -- learned elsewhere, Thor never seen
    local leg = Travel:Leg(point(ariena.map, ariena.x + 1, ariena.y))
    T.ok(leg and leg.kind == "fly", "no flight from the unknown flight master: " .. kinds(Travel:Plan(point(ariena.map, ariena.x + 1, ariena.y))))
    T.eq(leg.hint, L.TRAVEL_TRY_FLY:format("Lakeshire, Redridge"))
    T.eq(leg.point.x, thor.x)
end)

T.test("a flight master never seen is never a destination", function()
    local thor, ariena = spawn(THOR), spawn(ARIENA)
    start({ at = { ariena.map, ariena.x, ariena.y } })
    Ding.char.flights = { [ARIENA] = "Lakeshire, Redridge" }    -- Thor not known
    local plan = Travel:Plan(point(thor.map, thor.x, thor.y + 1))
    T.ok(not kinds(plan):find("fly", 1, true), "a flight to an unknown flight master: " .. kinds(plan))
end)

T.test("flight times measured on real flights replace the estimate", function()
    local thor, ariena = spawn(THOR), spawn(ARIENA)
    start({ at = { thor.map, thor.x, thor.y } })
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    TakeTaxiNode(2)
    H.closeTaxi()
    H.tick(180)
    H.land(ariena.map, ariena.x, ariena.y)
    local measured = Ding.db.flightTimes[THOR .. ":" .. ARIENA]
    T.ok(measured and math.abs(measured.seconds - 180) < 1, "flight not measured")
    H.player.map, H.player.x, H.player.y = thor.map, thor.x, thor.y
    Travel.cache = nil
    local plan = Travel:Plan(point(ariena.map, ariena.x, ariena.y))
    local fly
    for _, l in ipairs(plan.legs) do if l.kind == "fly" then fly = l end end
    T.ok(fly, "no flight: " .. kinds(plan))
    T.ok(math.abs(fly.seconds - (180 + 15 + 20)) < 1, "the measured time is not used: " .. fly.seconds)
end)

T.test("mage teleports: with the spell and a rune, the city is a hearthstone of its own", function()
    start({ at = { 1433, 50, 50 }, class = "MAGE" })
    local target = point(1453, 70, 72)    -- Stormwind, next to Dungar Longdrink
    T.ok(not kinds(Travel:Plan(target)):find("teleport", 1, true), "a teleport the mage does not know")
    H.learnSpell(3561)
    Travel.cache = nil
    T.ok(not kinds(Travel:Plan(target)):find("teleport", 1, true), "a teleport without a rune")
    H.setItem(Travel.RUNE_OF_TELEPORTATION, 5)
    Travel.cache = nil
    local leg = Travel:Leg(target)
    T.ok(leg and leg.kind == "teleport", "no teleport: " .. kinds(Travel:Plan(target)))
    T.eq(leg.hint, L.TRAVEL_TELEPORT:format("Stormwind City"))
    T.eq(leg.point, nil, "the arrow should keep the target")
    T.eq(leg.spell, 3561)
end)

T.test("the item button casts the teleport, like the hearthstone", function()
    start({ at = { 1433, 50, 50 }, class = "MAGE" })
    H.learnSpell(3561)
    H.setItem(Travel.RUNE_OF_TELEPORTATION, 5)
    Ding.RegisterGuide({ id = "t-teleport", title = "Teleport", races = { "Human" }, steps = {
        { go = { 1453, 70, 72 }, text = "Stormwind" },
    } })
    E:SetGuide("t-teleport", 1, true); H.flush()
    A.point = nil; A:Tick(); H.flush()
    local B = Ding.ItemButton
    T.eq(A.hint, L.TRAVEL_TELEPORT:format("Stormwind City"))
    T.eq(select(3, B:Wanted()), "spell")
    T.eq(B.spell, 3561)
    T.eq(B.item, nil)
    T.eq(B.button:GetAttribute("type"), "spell")
    H.bindings["PAD5"] = "CLICK DingItemButton:LeftButton"
    T.eq(H.pressBinding("PAD5"), "spell:Teleport: Stormwind")
    H.bindings["PAD5"] = nil
    -- Once there (or the spell forgotten), the button goes back to items.
    H.forgetSpells()
    Travel.cache = nil
    A.point = nil; A:Tick(); H.flush()
    B:Update()
    T.eq(B.spell, nil)
    T.eq(B.button:GetAttribute("type"), "item")
end)

T.test("druid teleport to Moonglade, no rune; the Horde's cities never for the Alliance", function()
    start({ at = { 1433, 50, 50 }, class = "DRUID" })
    H.learnSpell(18960)
    local moonglade = spawn(12042)
    local leg = Travel:Leg(point(moonglade.map, moonglade.x, moonglade.y))
    T.ok(leg and leg.kind == "teleport", "no Moonglade teleport")
    start({ at = { 1433, 50, 50 }, class = "MAGE" })
    H.learnSpell(3567)    -- Orgrimmar
    H.setItem(Travel.RUNE_OF_TELEPORTATION, 5)
    T.ok(not kinds(Travel:Plan(point(1454, 45, 64))):find("teleport", 1, true), "Orgrimmar for an Alliance mage")
end)

T.test("a walk through zones well above the player's level is slower", function()
    start({ at = { 1436, 50, 50 }, level = 10 })
    local target = point(1428, 50, 50)    -- the Burning Steppes (level 50)
    local young = Travel:Plan(target).walk
    start({ at = { 1436, 50, 50 }, level = 60 })
    local old = Travel:Plan(target).walk
    T.ok(young > old * 1.3, ("no penalty: %d at level 10, %d at level 60"):format(young, old))
end)

T.test("the itinerary and its total time under the step", function()
    local thor, ariena = spawn(THOR), spawn(ARIENA)
    start({ at = { thor.map, thor.x, thor.y } })
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    H.closeTaxi()
    H.player.x, H.player.y = thor.x + 3, thor.y + 3
    Ding.RegisterGuide({ id = "t-route", title = "Route", races = { "Human" }, steps = {
        { go = { ariena.map, ariena.x + 1, ariena.y }, text = "Lakeshire" },
    } })
    E:SetGuide("t-route", 1, true); H.flush()
    A.point = nil; A:Tick(); H.flush()
    local route = Travel:Itinerary(Travel.plan)
    T.ok(route and route:find(L.ROUTE_FLY:format(""), 1, true), "no flight in the itinerary: " .. tostring(route))
    local found = false
    for _, row in ipairs(P.rowsShown or {}) do
        if row.sub and H.plain(row.sub):find(route, 1, true) then found = true end
    end
    T.ok(found, "the itinerary is not under the step")
end)

---------------------------------------------------------------------------
-- Taking the planned flight automatically
---------------------------------------------------------------------------
local function atThor(opts)
    local thor, ariena = spawn(THOR), spawn(ARIENA)
    start({ at = { thor.map, thor.x, thor.y } })
    Ding.char.flights = { [THOR] = "Sentinel Hill, Westfall", [ARIENA] = "Lakeshire, Redridge" }
    Ding.RegisterGuide({ id = "t-autofly", title = "Fly", races = { "Human" }, steps = {
        { go = { ariena.map, ariena.x + 1, ariena.y }, text = "Lakeshire" },
    } })
    E:SetGuide("t-autofly", 1, true); H.flush()
    A.point = nil; A:Tick(); H.flush()
    T.eq(Travel.leg and Travel.leg.kind, "fly", "no flight planned")
    return thor, ariena
end

local function openMap(thor, ariena, state)
    local lines, print = {}, Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = H.plain(msg) end
    local ok, err = pcall(H.openTaxi, {
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = state or 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    Ding.Print = print
    assert(ok, err)
    return lines
end

T.test("automatic flight: off by default, the flight map only highlights", function()
    local thor, ariena = atThor()
    T.eq(Ding.db.ui.autoFly, false)
    openMap(thor, ariena)
    T.eq(H.taxi().taken, nil, "a flight taken with the option off")
    T.ok(Ding.TaxiMap.banner:IsShown(), "no highlight")
    H.closeTaxi()
end)

T.test("automatic flight: on, the planned destination is taken, after getting off the mount", function()
    local thor, ariena = atThor()
    Ding.db.ui.autoFly = true
    H.setMounted(true)
    local lines = openMap(thor, ariena)
    T.eq(H.taxi().taken, 2)
    T.eq(H.isMounted(), false, "still mounted")
    T.eq(lines[#lines], L.AUTO_FLY_DONE:format("Lakeshire, Redridge"))
    T.ok(Travel.flyingTo, "the flight is not followed")
    H.closeTaxi()
end)

T.test("automatic flight: not with Shift (LT) held, in combat, or to a node out of reach", function()
    local thor, ariena = atThor()
    Ding.db.ui.autoFly = true
    H.setModifier("shift", true)
    openMap(thor, ariena)
    T.eq(H.taxi().taken, nil, "taken with Shift held")
    H.closeTaxi()
    H.setModifier("shift", false)
    H.setCombat(true)
    openMap(thor, ariena)
    T.eq(H.taxi().taken, nil, "taken in combat")
    H.closeTaxi()
    H.setCombat(false)
    openMap(thor, ariena, 2)
    T.eq(H.taxi().taken, nil, "taken to a node out of reach")
    H.closeTaxi()
end)

---------------------------------------------------------------------------
-- A continent where no flight map was opened yet
---------------------------------------------------------------------------
T.test("new continent: next to a flight master, a row to open its map; gone once opened", function()
    local thor, ariena = spawn(THOR), spawn(ARIENA)
    start({ at = { thor.map, thor.x + 1, thor.y } })
    Ding.char.taxiSeen = nil
    Ding.RegisterGuide({ id = "t-continent", title = "Continent", races = { "Human" }, steps = {
        { text = "Somewhere" },
    } })
    E:SetGuide("t-continent", 1, true); H.flush()
    P:Update()
    local row
    for _, r in ipairs(P.rowsShown or {}) do
        if r.action == "service" and r.service == "flight" then row = r end
    end
    T.ok(row, "no prompt next to a flight master on a new continent")
    T.eq(H.plain(row.text), L.TAXI_NEW_CONTINENT:format(Data:NpcName(THOR)))
    -- Far from any flight master: nothing.
    H.player.x, H.player.y = 10, 10
    P:Update()
    for _, r in ipairs(P.rowsShown or {}) do T.ok(r.service ~= "flight", "a prompt far from flight masters") end
    -- The map opened: this continent is seen.
    H.player.x, H.player.y = thor.x, thor.y
    H.openTaxi({ { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y } })
    H.closeTaxi()
    P:Update()
    for _, r in ipairs(P.rowsShown or {}) do T.ok(r.service ~= "flight", "the prompt stays once the map was opened") end
    T.ok(Ding.char.taxiSeen[0], "the continent is not remembered")
end)

T.run()
