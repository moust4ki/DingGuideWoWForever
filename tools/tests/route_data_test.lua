-- What the route optimizer reads from QuestieDB (tools/route_data.lua): JSON manifest,
-- objective counts, world geometry, spawn groups, objective jobs.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local X = dofile(tools .. "/questiedb_export.lua")
local RouteData = dofile(tools .. "/route_data.lua")
local Model = dofile(tools .. "/route_model.lua")

T.test("JSON: objects, arrays, numbers, strings", function()
    local v = RouteData.decodeJSON('{"a": [1, -2.5, 3e2], "b": {"c": "x\\"y", "d": true, "e": null}, "f": []}')
    T.eq(v.a[1], 1)
    T.eq(v.a[2], -2.5)
    T.eq(v.a[3], 300)
    T.eq(v.b.c, 'x"y')
    T.eq(v.b.d, true)
    T.eq(v.b.e, nil)
    T.eq(#v.f, 0)
    T.fails(function() RouteData.decodeJSON('{"a": }') end, "JSON")
end)

T.test("target count read from the objective text", function()
    local count = RouteData.countInText
    T.eq(count("Kill 10 Kobold Vermin, then return to Marshal McBride.", "Kobold Vermin"), 10)
    T.eq(count("Kill 12 Young Wolves for Eagan.", "Young Wolf"), 12, "plural")
    T.eq(count("Bring 8 pieces of Tough Wolf Meat to Eagan.", "Tough Wolf Meat"), 8, "words before the name")
    local two = "Bring 8 Gnoll Paws and 4 Gnoll Collars to Lakeshire."
    T.eq(count(two, "Gnoll Paw"), 8)
    T.eq(count(two, "Gnoll Collar"), 4)
    T.eq(count(two, "Murloc Fin"), nil, "target not in the text")
    T.eq(count("Check the 4 traps in the lake.", "Fishing Trap", true), 4, "single objective, single number")
    T.eq(count("Check the 4 traps in the lake.", "Fishing Trap", false), nil)
    T.eq(count("Kill Princess and bring her collar.", "Princess", true), 1, "named without a number: one")
    T.eq(count(nil, "x"), nil)
    -- "a", "an", "the", or a name in a text without any number: one.
    local list = "Bring a Prairie Wolf Heart, Flatland Cougar Femur, Plainstrider Scale and Swoop Gizzard to Maur."
    T.eq(count(list, "Prairie Wolf Heart"), 1)
    T.eq(count(list, "Swoop Gizzard"), 1, "in a list without numbers")
    T.eq(count("Bring the Burning Blade Medallion to Zureetha.", "Burning Blade Medallion"), 1)
    T.eq(count("Bring 8 Gnoll Paws and an Ogre Tooth.", "Ogre Tooth"), 1)
    T.eq(count("Bring 8 Gnoll Paws and Gnoll Collars.", "Gnoll Collar"), nil, "plural without a number: unknown")
end)

local db = X.load(T.combined)
local D = RouteData.new(db, T.combined)
local ELWYNN, TELDRASSIL, DARKSHORE = 1429, 1438, 1439

T.test("world geometry: distances in yards, land masses split by the sea", function()
    T.ok(D.geometry, "conversion.json read")
    local goldshire, abbey = D.point(ELWYNN, 42.1, 65.9), D.point(ELWYNN, 48.9, 41.6)
    local d = D.dist(goldshire, abbey)
    T.ok(d > 500 and d < 750, "Goldshire - abbey: " .. tostring(d))
    local dolanaar, auberdine = D.point(TELDRASSIL, 55.6, 59.8), D.point(DARKSHORE, 36.8, 44.3)
    T.eq(D.dist(dolanaar, auberdine), nil, "Teldrassil and Darkshore: boat")
    T.eq(dolanaar.continent, auberdine.continent)
    local stormwind = D.point(1453, 70, 85)
    T.ok(D.dist(stormwind, goldshire) < 1500, "Stormwind and Elwynn share their coordinates")
end)

T.test("spawn groups: densest first, apart from each other", function()
    local points = {}
    for i = 1, 10 do points[#points + 1] = D.point(ELWYNN, 40 + i * 0.1, 40) end
    for i = 1, 3 do points[#points + 1] = D.point(ELWYNN, 70 + i * 0.1, 70) end
    local groups = D.clusters(points, 120, 4)
    T.eq(#groups, 2)
    T.eq(groups[1].n, 10)
    T.eq(groups[2].n, 3)
    T.ok(groups[1].spacing >= 15 and groups[1].spacing <= 120)
    T.eq(groups[1].mobLevel, nil, "untagged points: no monster level")
    T.eq(#D.clusters({}, 120, 4), 0)
    -- Points tagged with their monster's level: each group gets the average of its own.
    points = {}
    for i = 1, 6 do
        local p = D.point(ELWYNN, 40 + i * 0.1, 40)
        p.mobLevel = i <= 3 and 10 or 12
        points[#points + 1] = p
    end
    for i = 1, 3 do
        local p = D.point(ELWYNN, 70 + i * 0.1, 70)
        p.mobLevel = 20
        points[#points + 1] = p
    end
    groups = D.clusters(points, 120, 4)
    T.eq(groups[1].mobLevel, 11)
    T.eq(groups[2].mobLevel, 20)
end)

T.test("objectives of a quest: count, loot, shared monsters", function()
    local maps = { [ELWYNN] = true }
    -- Kobold Camp Cleanup: kill 10 Kobold Vermin.
    local jobs, killers = D.questJobs(7, db.Quest[7], maps)
    T.eq(#jobs, 1)
    T.eq(jobs[1].kind, "kill")
    T.eq(jobs[1].count, 10)
    T.ok(killers[6], "Kobold Vermin")
    T.ok(#jobs[1].points > 5)
    -- An item that drops one time in two needs about twice the kills.
    jobs = D.questJobs(33, db.Quest[33], maps)
    T.eq(#jobs, 1)
    T.ok(jobs[1].count > 8, "more monsters than pieces of meat: " .. jobs[1].count)
    -- Mazzranache: four items named once each, with low drop rates: a bounded number of kills.
    local mulgore = { [1412] = true }
    local total = 0
    for _, job in ipairs((D.questJobs(766, db.Quest[766], mulgore))) do
        T.ok(job.count <= Model.PARAMS.maxObjectiveKills, "objective " .. job.label .. ": " .. job.count)
        total = total + job.count
    end
    T.ok(total > 4 and total < 200, "monsters for Mazzranache: " .. total)
    -- No objective: nothing to do in the zone.
    T.eq(#D.questJobs(109, db.Quest[109], maps), 0)
end)

T.test("objective monsters: the level of each spawn, the common ones weigh more", function()
    -- The Zhevra: hooves from zhevras of several levels across the Barrens.
    local barrens = { [1413] = true }
    local jobs = D.questJobs(845, db.Quest[845], barrens)
    T.eq(#jobs, 1)
    local low, high, sum = nil, nil, 0
    for _, p in ipairs(jobs[1].points) do
        T.ok(p.mobLevel, "every spawn carries its monster's level")
        low, high = math.min(low or p.mobLevel, p.mobLevel), math.max(high or p.mobLevel, p.mobLevel)
        sum = sum + p.mobLevel
    end
    T.ok(low < high, ("several levels: %s-%s"):format(tostring(low), tostring(high)))
    T.ok(math.abs(jobs[1].mobLevel - sum / #jobs[1].points) < 1e-9, "average over the spawns")
end)

T.test("quest XP: the QuestXP figure, or an estimate said so", function()
    local xp, estimated = D.questXP(7, db.Quest[7])
    T.ok(xp > 0)
    T.eq(estimated, false)
    xp, estimated = D.questXP(-1, { [X.QUEST.questLevel] = 20 })
    T.eq(xp, Model.defaultQuestXP(20))
    T.eq(estimated, true)
end)

T.test("an objective on a quest giver is someone to talk to, not a monster", function()
    -- The Missing Diplomat (1249): Tapoke "Slim" Jahn gives and ends quests.
    local jobs, killers = D.questJobs(1249, db.Quest[1249], nil)
    T.eq(#jobs, 1)
    T.eq(jobs[1].kind, "explore")
    T.eq(jobs[1].mobLevel, nil)
    T.eq(next(killers), nil, "nobody to kill")
end)

T.test("a class quest without class data: the class whose trainer gives or ends it", function()
    T.eq(D.trainerClass(db.Quest[92481]), "MAGE", "A Student of the Arcane: ends at a Mage Trainer")
    T.eq(D.trainerClass(db.Quest[90902]), "PALADIN", "Rediscovering the Light")
    T.eq(D.trainerClass(db.Quest[96629]), nil, "Camping 101: a profession trainer is no class")
    T.eq(D.trainerClass(db.Quest[33]), nil)
end)

T.test("dungeon quests: objectives found only inside, or a dungeon quest that fights", function()
    local function dungeon(q) return D.questDungeon(db.Quest[q]) end
    T.eq(dungeon(2040), "The Deadmines", "Underground Assault: Sneed's Shredder inside")
    T.eq(dungeon(167), "The Deadmines", "Oh Brother: QuestieDB puts the foreman in Westfall")
    T.eq(dungeon(959), "Wailing Caverns", "Trouble at the Docks: Mad Magglish")
    T.eq(dungeon(418), nil, "Thelsamar Blood Sausages: one of the droppers also lives in a dungeon")
    T.eq(dungeon(6563), nil, "The Essence of Aku'Mai: the sapphires lie before the instance")
    T.eq(dungeon(1489), nil, "Hamuul Runetotem: a talk on the way to Wailing Caverns")
    T.eq(dungeon(33), nil)
end)

T.run()
