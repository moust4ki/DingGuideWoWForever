-- tools/route_why.lua on a simulation written by hand: a detour out of the zone and back (its
-- cost beyond the direct trip, the chain it opens), a step far off the way, a quest taken now
-- or never, a level step; the races must agree; nothing is said without a quest to show for it.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local X = dofile(tools .. "/questiedb_export.lua")
local Why = dofile(tools .. "/route_why.lua")
local QK = X.QUEST

-- Quests: 200 opens 201, which opens 202; 300 and 400 alone; 500 and 501 are level 12-13.
local function quest(level, pre)
    local q = {}
    q[QK.questLevel] = level
    q[QK.preQuestSingle] = pre and { pre } or nil
    return q
end
local db = { Quest = {
    [100] = quest(5), [101] = quest(5), [200] = quest(6), [201] = quest(6, 200), [202] = quest(7, 201),
    [300] = quest(6), [400] = quest(7), [500] = quest(12), [501] = quest(13), [600] = quest(6),
} }
local XP = { [101] = 300, [200] = 500, [201] = 1500, [202] = 2500, [300] = 400, [400] = 800, [600] = 100 }

-- Points on a line: map (the zone), x in yards; 10 yards a second.
local function at(map, x, continent)
    return { map = map, x = x, y = 0, region = (continent or 0) .. ":main", continent = continent or 0 }
end
local function trip(a, b) return math.abs(a.x - b.x) / 10 end

-- A race's visits from { step, place, turned, accepted, grind } (time: the trips, plus 10 s per step).
local function sim(list)
    local visits, time, pos = {}, 0, nil
    local section = { id = "s1" }
    for _, e in ipairs(list) do
        local v = { step = e.step, section = e.section or section, from = time, pos0 = pos, level = e.level or 5,
            travel = 0, grind = e.grind or 0, xp = 0, turned = e.turned or {}, accepted = e.accepted or {},
            places = {}, legs = {} }
        if e.place then
            local t = pos and trip(pos, e.place) or 0
            v.places[1], v.legs[1], v.travel = e.place, t, t
            time = time + t
            pos = e.place
        end
        for _, q in ipairs(v.turned) do v.xp = v.xp + (XP[q] or 0) end
        time = time + 10 + v.grind
        v.to, v.pos = time, pos
        visits[#visits + 1] = v
    end
    return { visits = visits, xpOf = XP, starts = { s1 = { trip = trip }, s2 = { trip = trip } } }
end

local S = {}
for i = 1, 12 do S[i] = { uid = i } end
S[5].level = 10
local ROUTE = {
    { step = S[1], place = at(1, 0), accepted = { 100 } },
    { step = S[2], place = at(1, 100), turned = { 101 } },
    -- Out of zone 1 for two steps: turn in 200, take 201 (its chain goes on later).
    { step = S[3], place = at(2, 5000), turned = { 200 }, accepted = { 201 } },
    { step = S[4], place = at(2, 5050), accepted = { 400 } },
    -- Back in zone 1.
    { step = S[5], place = at(1, 150), turned = { 300 }, grind = 900 },
    { step = S[6], place = at(1, 200), accepted = { 500, 501 } },
    { step = S[7], place = at(1, 250), turned = { 201 }, accepted = { 202 } },
    -- One step far off the way, in the same zone, with nothing to show for it but a quest.
    { step = S[8], place = at(1, 4000), turned = { 600 } },
    { step = S[9], place = at(1, 300), turned = { 202 }, grind = 4000 },
    -- Another continent, much later: 400 is turned in there.
    { step = S[10], place = at(9, 0, 1), section = { id = "s2" } },
    { step = S[11], place = at(9, 10, 1), section = { id = "s2" }, turned = { 400 }, level = 8 },
}

T.test("a detour out of the zone and back: its cost beyond the direct trip, the chain it opens", function()
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(ROUTE) } })
    local r = reasons[S[3]]
    T.ok(r, "no reason on the first step of the detour")
    T.eq(r.kind, "detour")
    T.eq(r.back, true)
    T.eq(r.steps, 2)
    -- Into it (490 s), within (5 s), out of it (490 s), minus the direct trip (5 s).
    T.eq(r.seconds, 980)
    T.eq(r.short, true)
    -- 200 turned in there opens 201 (taken there) and 202: the quest the window names.
    T.eq(r.quest, 200)
    T.eq(r.action, "turnin")
    T.eq(r.chain, 2)
    T.eq(r.questXP, 500 + 1500 + 2500)
    -- 400, taken there, counts in the whole detour.
    T.eq(r.xp, 500 + 1500 + 2500 + 800)
    T.eq(#r.quests, 4)
    T.ok(not (reasons[S[4]] and reasons[S[4]].kind == "detour"), "the detour is said once, on its first step")
end)

T.test("as the guide writes it: rounded figures, only what the window reads", function()
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(ROUTE) } })
    local w = Why.data(reasons[S[3]])
    T.eq(w.kind, "detour")
    T.eq(w.quest, 200)
    T.eq(w.action, nil, "a turn-in is the default")
    T.eq(w.chain, 2)
    T.eq(w.xp, 4500)
    T.eq(w.total, 5300)
    T.eq(w.quests, 4)
    T.eq(w.seconds, 960)
    T.eq(w.back, true)
    T.eq(w.short, true)
    T.eq(Why.roundXP(13010), 13000)
    T.eq(Why.roundXP(1094), 1100)
    T.eq(Why.roundXP(68), 70)
    T.eq(Why.roundSeconds(20), 60)
end)

T.test("one step far off the way in its own zone: a detour too", function()
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(ROUTE) } })
    local r = reasons[S[8]]
    T.ok(r, "no reason on the step far off the way")
    T.eq(r.kind, "detour")
    T.eq(r.quest, 600)
    -- 375 s there and 370 s back, instead of 5 s.
    T.eq(r.seconds, 740)
    T.eq(r.short, true)
end)

T.test("a quest taken now or never: turned in on another continent, the zone never seen again", function()
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(ROUTE) } })
    -- (400 is taken during the detour, whose first step has the detour's reason.)
    local r = reasons[S[4]]
    T.ok(r, "no reason on the step that takes 400")
    T.eq(r.kind, "carry")
    T.eq(r.quest, 400)
    T.eq(r.continent, true)
    T.eq(r.short, true, "on another continent, never back here: said under the step")
    T.eq(r.comesBack, nil)
    local w = Why.data(r)
    T.eq(w.once, true)
    T.eq(w.xp, 800)
end)

T.test("a quest carried while the route comes back to its zone: on demand only", function()
    local route = {}
    for i, e in ipairs(ROUTE) do route[i] = e end
    -- The route passes zone 2 again before turning 400 in.
    table.insert(route, 10, { step = S[12], place = at(2, 5000) })
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(route) } })
    local r = reasons[S[4]]
    T.ok(r and r.kind == "carry", "no carry reason")
    T.eq(r.comesBack, true)
    T.eq(r.short, nil)
    T.eq(Why.data(r).once, nil)
end)

T.test("a level step: the quests that follow, when they are above it; never otherwise", function()
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(ROUTE) } })
    local r = reasons[S[5]]
    T.ok(r, "no reason on the level step")
    T.eq(r.kind, "level")
    -- (500, 501 and 202 are taken after it.)
    T.eq(r.next[1], 7)
    T.eq(r.next[2], 13)
    T.eq(r.short, nil, "on demand only")
    T.eq(Why.data(r).seconds, nil, "no time: the window counts the kills left")
    -- The quests that follow are not above the level: nothing to say.
    S[5].level = 20
    reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(ROUTE) } })
    T.eq(reasons[S[5]], nil)
    S[5].level = 10
end)

T.test("honesty: no quest to show for a detour, no reason; the races must agree", function()
    local route = {}
    for i, e in ipairs(ROUTE) do route[i] = e end
    -- The detour without its quests (a trainer, say: the simulation does not value it).
    route[3] = { step = S[3], place = at(2, 5000) }
    route[4] = { step = S[4], place = at(2, 5050) }
    local reasons = Why.reasons({ db = db, races = { "Human" }, sims = { Human = sim(route) } })
    T.eq(reasons[S[3]], nil)
    -- Two races: one goes out of the way, the other does not.
    reasons = Why.reasons({ db = db, races = { "Human", "Dwarf" }, sims = { Human = sim(ROUTE), Dwarf = sim(route) } })
    T.eq(reasons[S[3]], nil, "a reason only one race finds")
    -- Both find it: kept, the figures averaged.
    reasons = Why.reasons({ db = db, races = { "Human", "Dwarf" }, sims = { Human = sim(ROUTE), Dwarf = sim(ROUTE) } })
    T.ok(reasons[S[3]], "a reason both races find")
end)

T.test("left out by the free-quests audit: the route's own reasons, with their figures", function()
    T.eq(Why.leftOut({ why = "pays off less than 4 times the pace", xp = 312, added = 250 }).kind, "detour")
    local e = Why.leftOut({ why = "pace", xp = 812, added = 70 })
    T.eq(e.xp, 800)
    T.eq(e.seconds, 60)
    T.eq(Why.leftOut({ why = "long detour", xp = 3000, added = 200 }).kind, "long")
    T.eq(Why.leftOut({ why = "giver off the route" }).kind, "away")
    T.eq(Why.leftOut({ why = "ender off the route" }).turnin, true)
    T.eq(Why.leftOut({ why = "after 98319" }).quest, 98319)
    -- Not the route's reason, or nothing measured: nothing said.
    T.eq(Why.leftOut({ why = "class quest" }), nil)
    T.eq(Why.leftOut({ why = "pace" }), nil)
    T.eq(Why.leftOut({ why = "free" }), nil)
end)

T.run()
