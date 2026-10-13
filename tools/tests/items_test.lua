-- Ding - Items, the third built-in pack, and its first section: the Cozy Sleeping Bag, a
-- chain of quests started and turned in by clicking objects, played for an Alliance and a
-- Horde character (each starts on its own continent); the step key `faction`.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { "items-cozy-sleeping-bag" }, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E = Ding.Engine
local GUIDE = "items-cozy-sleeping-bag"

-- The engine updates 0.2 s after an event.
local function settle() H.tick(0.5) end

local function at(map, x, y)
    local p = H.player
    p.map, p.x, p.y = map, x, y
    Ding.Arrow.point = nil
    Ding.Arrow:Tick()
    settle()
end

-- An object that starts or ends a quest opens the quest window directly (no gossip); Ding
-- accepts and turns in the guide's quests by itself.
local function click(kind, q)
    H.showQuest({}, kind, q)
    settle()
end

-- Taken at an object: nothing to do but bring it to the next one (ready in the log).
local function take(q)
    click("detail", q)
    T.ok(H.log()[q], q .. " not accepted")
    T.quests({ [q] = "ready" })
end

local function handIn(q)
    click("progress", q)
    T.ok(H.completed()[q], q .. " not turned in")
end

local function stepIs(index, key, q)
    T.eq(E.index, index, "step")
    if q then T.eq(E:CurrentStep()[key][1], q, ("step %d %s"):format(index, key)) end
end

-- Every candidate of the arrow is on `map`, and the nearest one is that object spawn.
local function arrowOn(map, x, y)
    T.ok(#E.candidates > 0, "no target for the arrow")
    for _, p in ipairs(E.candidates) do T.eq(p.map, map, "a target on another map") end
    local p = E:NearestPoint()
    T.ok(math.abs(p.x - x) < 0.5 and math.abs(p.y - y) < 0.5,
        ("arrow on %.2f, %.2f instead of %.2f, %.2f"):format(p.x, p.y, x, y))
end

local function start(race, faction, map, x, y)
    T.reset({ race = race, faction = faction, level = 20 })
    at(map, x, y)
    T.ok(E:SetPack(Ding.ITEMS_PACK), "the pack does not start")
    T.eq(E.guide.id, GUIDE)
    settle()
end

-- From the Stonetalon Mountains on, both sides walk the same trail; `dam` is the Loch Modan
-- step of the side.
local function trail(dam)
    stepIs(6, "go")
    T.eq(E:CurrentStep().go[1], 1442, "Stonetalon Mountains")
    at(1442, 50.9, 52.3)
    stepIs(7, "turnin", 79192)
    arrowOn(1442, 40.76, 52.57)
    at(1442, 40.7, 52.5)
    handIn(79192)
    take(79980)
    stepIs(8, "turnin", 79980)
    arrowOn(1442, 39.62, 49.86)
    handIn(79980)
    take(79974)
    stepIs(dam, "turnin", 79974)
    arrowOn(1432, 49.4, 12.9)
    at(1432, 49.4, 12.9)
    handIn(79974)
    take(79975)
    -- Thoradin's Wall: first the cart on the Hillsbrad side.
    stepIs(11, "go")
    T.eq(E:CurrentStep().go[1], 1424, "Hillsbrad Foothills")
    at(1424, 87.3, 49.6)
    stepIs(12, "turnin", 79975)
    arrowOn(1417, 22.46, 24.21)
    at(1417, 22.5, 24.2)
    handIn(79975)
    take(79976)
    stepIs(13, "turnin", 79976)
    arrowOn(1417, 22.45, 24.21)
    handIn(79976)
    -- Last step: the bag itself.
    T.eq(E.index, #E.guide.steps, "the bag's step")
    T.ok(not E.finished, "finished before the bag")
    E:Next()
    T.ok(E.finished, "not finished after the bag")
    T.eq(#H.logOrder(), 0, "quests left in the log")
end

T.test("Ding - Items: a third built-in pack, after Leveling and Zones", function()
    local pack = Ding:GetGuidePack(Ding.ITEMS_PACK)
    T.eq(Ding.ITEMS_PACK, "ding-items")
    T.eq(pack.title, Ding.L.PACK_ITEMS)
    T.eq(pack.builtin, 3)
    T.eq(pack.category, "items")
    T.fails(function() Ding.RegisterGuidePack({ id = Ding.ITEMS_PACK }) end, "already used")
    -- A pack's category: an engine that does not know it yet still registers the pack.
    T.ok(Ding.RegisterGuidePack({ id = "t-items-pack", title = "Items", category = "items" }), "pack refused")
    Ding.RegisterGuide({ id = "t-items-zones", pack = Ding.ZONES_PACK, steps = { { accept = 456 } } })
    Ding.RegisterGuide({ id = "t-items-leveling", steps = { { accept = 456 } } })
    local ids = {}
    for i, p in ipairs(Ding:GuidePacks()) do ids[i] = p.id end
    T.eq(table.concat(ids, ","), "ding,ding-zones,ding-items")
    local g = Ding:GetGuide(GUIDE)
    T.eq(g.pack, Ding.ITEMS_PACK)
    T.eq(g.faction, nil, "both sides")
    T.eq(g.minLevel, 14)
end)

T.test("the bag's section for both sides, from level 14", function()
    T.reset({ race = "Human", faction = "Alliance", level = 14 })
    T.eq(Ding:SuggestGuide(Ding.ITEMS_PACK).id, GUIDE)
    T.reset({ race = "Tauren", faction = "Horde", level = 30 })
    T.eq(Ding:SuggestGuide(Ding.ITEMS_PACK).id, GUIDE)
end)

T.test("a step's faction: only that side gets it", function()
    T.reset({ race = "Gnome", faction = "Alliance" })
    T.ok(Ding:StepMatchesPlayer({ faction = "Alliance" }), "Alliance step refused")
    T.ok(not Ding:StepMatchesPlayer({ faction = "Horde" }), "Horde step given to the Alliance")
    T.reset({ race = "Troll", faction = "Horde" })
    T.ok(Ding:StepMatchesPlayer({ faction = "Horde", classes = { "WARRIOR" } }), "Horde step refused")
    T.ok(not Ding:StepMatchesPlayer({ faction = "Alliance" }), "Alliance step given to the Horde")
    T.fails(function()
        Ding.RegisterGuide({ id = "t-bad-faction", steps = { { accept = 456, faction = "Neutral" } } })
    end, "faction = \"Alliance\" or \"Horde\"")
end)

T.test("Alliance: Westfall, the Barrens, then the trail to the bag", function()
    start("Human", "Alliance", 1436, 50, 50)
    stepIs(1, "accept", 79008)
    arrowOn(1436, 37.4, 50.6)
    at(1436, 37.4, 50.6)
    take(79008)
    -- The Horde's turn-in in Westfall is passed: the remains to find are in the Barrens.
    stepIs(3, "turnin", 79008)
    arrowOn(1413, 46.36, 73.8)
    at(1413, 46.36, 73.8)
    handIn(79008)
    stepIs(5, "accept", 79192)
    -- The next clue also lies in Westfall: the arrow takes the one at hand.
    local p = E:NearestPoint()
    T.eq(p.map, 1413, "next clue")
    take(79192)
    trail(9)
end)

T.test("Horde: the Barrens, Westfall, then the same trail", function()
    start("Orc", "Horde", 1413, 50, 60)
    stepIs(2, "accept", 79007)
    arrowOn(1413, 46.34, 73.88)
    at(1413, 46.34, 73.88)
    take(79007)
    stepIs(4, "turnin", 79007)
    arrowOn(1436, 37.4, 50.6)
    at(1436, 37.4, 50.6)
    handIn(79007)
    stepIs(5, "accept", 79192)
    T.eq(E:NearestPoint().map, 1436, "next clue")
    take(79192)
    trail(10)
    T.ok(E.guide.steps[10].note:find("Alliance land", 1, true), "no warning for the Horde in Loch Modan")
end)

T.run()
