-- Route optimizer (tools/route_solver.lua) on small hand-made guides: rules of the game,
-- time and XP accounting, first tour, local search.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local S = dofile(tools .. "/route_solver.lua")
local M = dofile(tools .. "/route_model.lua")
local P = M.PARAMS

local function pt(x, y) return { x = x, y = y, region = "0:main", continent = 0 } end

-- A quest given and ended at `giver`, its objective (kills of monster `npc`) at `area`.
local function quest(id, giver, area, opts)
    opts = opts or {}
    local mobLevel = opts.mobLevel or 10
    local q = {
        id = id, xp = opts.xp or 500, qLevel = opts.qLevel or 10, reqLevel = opts.reqLevel or 1,
        xpEstimated = opts.xpEstimated,
        accept = { giver }, turnin = { opts.ender or giver },
        single = opts.single, group = opts.group, exclusive = opts.exclusive,
        pinned = opts.pinned, forced = opts.forced,
    }
    if area then
        local kills = opts.kills or 8
        q.work = { { entry = area, exit = area, time = opts.work or 200, dist = 0,
            jobs = { { npc = opts.npc or id, kills = kills, mobLevel = mobLevel, perKill = (opts.work or 200) / kills } } } }
        q.killers = { [opts.npc or id] = true }
    end
    if opts.deferred then q.turnin = nil end
    return q
end

local function instance(quests, opts)
    opts = opts or {}
    return S.prepare({
        quests = quests,
        start = { level = opts.level or 10, xp = 0, pos = opts.pos or pt(0, 0), done = opts.done or {},
            log = opts.log or {}, extraLog = opts.extraLog, bind = opts.bind },
        targetLevel = opts.target or 11, maxLevel = 12, logLimit = opts.logLimit or 18,
        finish = opts.finish, questAbove = opts.questAbove, mobAbove = opts.mobAbove, shortWaits = opts.shortWaits,
    })
end

-- Plan from a readable order: { "A1", "C1", "T1", ... } (A accept, C objectives, T turn-in).
local KIND = { A = S.ACCEPT, C = S.WORK, T = S.TURNIN }
local function plan(inst, order)
    local p = { seq = {}, inc = {} }
    for _, s in ipairs(order) do
        local i = inst.byId[tonumber(s:sub(2))]
        p.seq[#p.seq + 1] = assert(inst.qActs[i][KIND[s:sub(1, 1)]], "unknown action " .. s)
        p.inc[i] = true
    end
    return p
end

local function order(inst, p)
    local out = {}
    for _, ai in ipairs(p.seq) do
        local a = inst.acts[ai]
        out[#out + 1] = ({ "A", "C", "T" })[a.kind] .. inst.quests[a.q].id
    end
    return table.concat(out, " ")
end

T.test("one quest: time, distance and XP of the tour", function()
    local inst = instance({ quest(1, pt(0, 0), pt(700, 0)) })
    local cost, st = S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }))
    T.ok(cost < math.huge)
    local walk = 700 * P.detour / P.runSpeed
    T.ok(math.abs(st.time - (2 * P.npcTime + 200 + 2 * walk)) < 1e-6, "time: " .. st.time)
    T.ok(math.abs(st.dist - 1400) < 1e-6)
    -- Quest XP (QuestXP table) is exact; kill XP is counted with the prudence margin.
    T.ok(math.abs(st.questXP - 500) < 1e-6)
    T.ok(math.abs(st.killXP - 8 * M.mobXP(10, 10) * P.killXPMargin) < 1e-6)
    T.eq(st.turnins, 1)
    -- Time to reach the target level: the tour, then grinding the missing XP.
    local rate = M.grindRate(10) * P.killXPMargin
    local need = M.xpTo(10, 0, 11) - st.credit
    T.ok(math.abs(st.effective - (st.time + need / rate)) < 1e-6)
    -- The cost adds what the kills earn beyond grinding: they are not worth more.
    local surplus = math.max(0, st.killXP / rate - 200)
    T.ok(math.abs(cost - (st.effective + surplus)) < 1e-6, "cost: " .. cost)
end)

T.test("rules: accept, then objectives, then turn-in; unfinished quest", function()
    local inst = instance({ quest(1, pt(0, 0), pt(700, 0)) })
    T.eq(S.evaluate(inst, plan(inst, { "C1", "A1", "T1" })), math.huge, "objectives before accepting")
    T.eq(S.evaluate(inst, plan(inst, { "A1", "T1", "C1" })), math.huge, "turned in before the objectives")
    T.eq(S.evaluate(inst, plan(inst, { "A1", "C1" })), math.huge, "never turned in")
    T.ok(S.evaluate(inst, plan(inst, { "A1", "C1" }), nil, true) < math.huge, "insertion in progress")
end)

T.test("rules: prerequisites, exclusive quests, limited quest log", function()
    local inst = instance({ quest(1, pt(0, 0)), quest(2, pt(0, 0), nil, { single = { 1 } }) })
    T.eq(S.evaluate(inst, plan(inst, { "A2", "T2", "A1", "T1" })), math.huge, "prerequisite not turned in")
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1", "A2", "T2" })) < math.huge)
    inst = instance({ quest(1, pt(0, 0)), quest(2, pt(0, 0), nil, { exclusive = { 1 } }) })
    T.eq(S.evaluate(inst, plan(inst, { "A1", "T1", "A2", "T2" })), math.huge, "exclusive")
    inst = instance({ quest(1, pt(0, 0)), quest(2, pt(0, 0)) }, { logLimit = 1 })
    T.eq(S.evaluate(inst, plan(inst, { "A1", "A2", "T1", "T2" })), math.huge, "quest log full")
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1", "A2", "T2" })) < math.huge)
    inst = instance({ quest(2, pt(0, 0), nil, { single = { 99 } }) })
    T.eq(inst.quests[1].unavailable, "prerequisite missing")
    inst = instance({ quest(2, pt(0, 0), nil, { single = { 99 } }) }, { done = { [99] = true } })
    T.eq(inst.quests[1].unavailable, nil, "prerequisite turned in by an earlier guide")
end)

T.test("levels: waiting for a level, grey quest", function()
    -- A quest the route forces may wait for a grinding stop, however long.
    local inst = instance({ quest(1, pt(0, 0), nil, { reqLevel = 12, qLevel = 12, forced = true }) })
    local trace = {}
    local cost, st = S.evaluate(inst, plan(inst, { "A1", "T1" }), trace)
    T.ok(cost < math.huge)
    T.eq(trace[1].kind, "level")
    T.eq(trace[1].level, 12)
    T.eq(st.waits, 1)
    T.ok(st.grind > 0)
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 3 }) }, { level = 10 })
    T.eq(S.evaluate(inst, plan(inst, { "A1", "T1" })), math.huge, "grey: the engine would skip it")
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 3, forced = true }) }, { level = 10 })
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1" })) < math.huge, "forced by the route")
end)

T.test("estimated quest XP: counted with the kill margin", function()
    local inst = instance({ quest(1, pt(0, 0), nil, { xpEstimated = true }) })
    local _, st = S.evaluate(inst, plan(inst, { "A1", "T1" }))
    T.ok(math.abs(st.questXP - 500 * P.killXPMargin) < 1e-6, "questXP: " .. st.questXP)
end)

T.test("grinding stops: a pinned quest gets an hour per guide at most", function()
    -- Quest level 13, player 10 (questAbove 2), needed by a later guide: a whole level of
    -- grinding for it is refused (the search could never take the stop back).
    local inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 13, pinned = true }) })
    T.eq(S.evaluate(inst, plan(inst, { "A1", "T1" })), math.huge)
    T.ok(not S.greedy(inst).inc[1], "left out of the first tour")
    -- An ordinary quest: the cost decides (a stop is plain time plus a penalty).
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 13 }) })
    local trace = {}
    local cost, st = S.evaluate(inst, plan(inst, { "A1", "T1" }), trace)
    T.ok(cost < math.huge, "ordinary quest: the stop is allowed")
    T.eq(trace[1].kind, "level")
    T.ok(math.abs(cost - (st.effective + st.grindXP / inst.rateEnd + S.PARAMS.grindStepPenalty)) < 1e-6,
        "the stop costs its time and the penalty")
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 13, pinned = true, forced = true }) })
    trace = {}
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1" }), trace) < math.huge, "forced: the stop is allowed")
    T.eq(trace[1].kind, "level")
    -- Close to the level: a stop of a few minutes is allowed.
    local short = M.xpTo(10, 0, 11) - 0.5 * P.maxGrindStop * P.killXPMargin * M.grindRate(10)
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 13, pinned = true }) })
    inst.start.xp = short
    trace = {}
    cost, st = S.evaluate(inst, plan(inst, { "A1", "T1" }), trace)
    T.ok(cost < math.huge, "short stop")
    T.eq(trace[1].kind, "level")
    T.ok(st.grind <= P.maxGrindStop, "stop of " .. st.grind .. " s")
    T.ok(S.grindOK(inst, { level = 10, lxp = short, grind = 0 }, inst.quests[1], 11))
    T.ok(not S.grindOK(inst, { level = 10, lxp = 0, grind = 0 }, inst.quests[1], 11), "a whole level")
    -- The stops of a guide add up: a second stop beyond the hour is refused.
    T.ok(not S.grindOK(inst, { level = 10, lxp = short, grind = 0.6 * P.maxGrindStop }, inst.quests[1], 11))
    inst.quests[1].forced = true
    T.ok(S.grindOK(inst, { level = 10, lxp = 0, grind = 10 * P.maxGrindStop }, inst.quests[1], 11), "forced")
end)

T.test("quest level: never above the player + questAbove", function()
    -- Quest level 12, required level 8: the player (10) may take it, but it is above him.
    local inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 12, reqLevel = 8 }) }, { questAbove = 0 })
    T.eq(inst.quests[1].needLevel, 12)
    local _, early = S.evaluate(inst, plan(inst, { "A1", "T1" }))
    T.eq(early.waits, 1, "two levels too high: a grinding stop first")
    local first = S.greedy(inst)
    T.ok(not first.inc[1], "the greedy tour does not send the player two levels too high")
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 12, reqLevel = 8, forced = true }) }, { questAbove = 0 })
    local trace = {}
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1" }), trace) < math.huge)
    T.eq(trace[1].kind, "level", "a grinding stop before accepting it")
    T.eq(trace[1].level, 12)
    T.eq(trace[2].level, 12, "accepted at level 12")
    -- One level above is allowed with questAbove = 1... and two with questAbove = 2.
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 11, reqLevel = 8 }) }, { questAbove = 1 })
    trace = {}
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1" }), trace) < math.huge)
    T.eq(trace[1].kind, "accept", "no grinding stop for a one-level gap")
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 12, reqLevel = 8 }) }, { questAbove = 2 })
    T.ok(S.greedy(inst).inc[1])
    -- Three levels above: still a grinding stop with questAbove = 2.
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 13, reqLevel = 8 }) }, { questAbove = 2 })
    T.eq(inst.quests[1].needLevel, 11)
    -- The required level stays a hard limit, whatever questAbove.
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 12, reqLevel = 12, forced = true }) }, { questAbove = 2 })
    T.eq(inst.quests[1].needLevel, 12)
    trace = {}
    T.ok(S.evaluate(inst, plan(inst, { "A1", "T1" }), trace) < math.huge)
    T.eq(trace[1].kind, "level", "grinding stop up to the required level")
    T.eq(trace[1].level, 12)
    -- The defaults come from route_model.lua: quests +2, monsters +1.
    inst = instance({ quest(1, pt(0, 0), nil, { qLevel = 12 }) })
    T.eq(inst.questAbove, P.questAbove)
    T.eq(inst.mobAbove, P.mobAbove)
    T.eq(P.questAbove, 2)
    T.eq(P.mobAbove, 1)
end)

T.test("objective monsters: never above the player + mobAbove", function()
    -- A level 10 quest whose monsters are level 12 (forced: the grinding stop is allowed).
    local inst = instance({ quest(1, pt(0, 0), pt(300, 0), { mobLevel = 12.5, forced = true }) }, { mobAbove = 0 })
    local trace = {}
    local cost, st = S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }), trace)
    T.ok(cost < math.huge)
    T.eq(trace[1].kind, "accept")
    T.eq(trace[2].kind, "level", "grinding stop before the monsters")
    T.eq(trace[2].level, 12)
    T.eq(trace[3].monsters, 12, "monster level: average rounded down")
    T.ok(st.waits == 1)
    inst = instance({ quest(1, pt(0, 0), pt(300, 0), { mobLevel = 12.5 }) }, { mobAbove = 0 })
    T.eq(select(2, S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }))).waits, 1)
    T.ok(not S.greedy(inst).inc[1], "the greedy tour does not send the player against monsters too strong")
    inst = instance({ quest(1, pt(0, 0), pt(300, 0), { mobLevel = 12.5 }) }, { mobAbove = 2 })
    trace = {}
    S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }), trace)
    T.eq(trace[2].kind, "complete")
    -- One level above with mobAbove = 1; two levels: a grinding stop up to one level below them.
    inst = instance({ quest(1, pt(0, 0), pt(300, 0), { mobLevel = 11.5 }) }, { mobAbove = 1 })
    trace = {}
    S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }), trace)
    T.eq(trace[2].kind, "complete")
    inst = instance({ quest(1, pt(0, 0), pt(300, 0), { mobLevel = 12.5, forced = true }) }, { mobAbove = 1 })
    trace = {}
    S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }), trace)
    T.eq(trace[2].kind, "level")
    T.eq(trace[2].level, 11)
    -- Quests and monsters are separate limits: a +2 quest whose monsters are +2 waits.
    inst = instance({ quest(1, pt(0, 0), pt(300, 0), { qLevel = 12, mobLevel = 12, forced = true }) },
        { questAbove = 2, mobAbove = 1 })
    trace = {}
    S.evaluate(inst, plan(inst, { "A1", "C1", "T1" }), trace)
    T.eq(trace[1].kind, "accept", "the quest itself is within +2")
    T.eq(trace[2].kind, "level", "its monsters are not within +1")
end)

T.test("quest too high: done later, once the level is reached", function()
    -- Quest 2 is level 11: the player (10) reaches it with quest 1's XP.
    local quests = {
        quest(1, pt(0, 0), nil, { xp = 9000, qLevel = 10 }),
        quest(2, pt(50, 0), nil, { qLevel = 11 }),
    }
    local inst = instance(quests, { questAbove = 0, mobAbove = 0, target = 12 })
    local _, early = S.evaluate(inst, plan(inst, { "A2", "T2", "A1", "T1" }))
    T.eq(early.waits, 1, "too early: it would need a grinding stop")
    local best = S.optimize(inst, S.greedy(inst), { seed = 1, iterations = 300 })
    local trace = {}
    local _, st = S.evaluate(inst, best, trace)
    T.eq(st.waits, 0)
    T.eq(order(inst, best), "A1 T1 A2 T2")
end)

T.test("quest started by an item: accepted while killing the monsters of another", function()
    local host = quest(1, pt(0, 0), pt(500, 0), { npc = 77 })
    local item = quest(2, pt(0, 0))
    item.accept, item.itemStart, item.optional = nil, { [77] = true }, true
    local inst = instance({ host, item })
    local trace = {}
    T.ok(S.evaluate(inst, plan(inst, { "A1", "C1", "T2", "T1" }), trace) < math.huge)
    T.eq(trace[3].kind, "accept")
    T.eq(trace[3].q, 2)
    T.eq(trace[3].optional, true)
    T.eq(S.evaluate(inst, plan(inst, { "T2", "A1", "C1", "T1" })), math.huge, "item not dropped yet")
end)

T.test("shared monsters: two quests on the same monsters at the same place", function()
    local a = quest(1, pt(0, 0), pt(500, 0), { npc = 5, kills = 10, work = 250 })
    local b = quest(2, pt(0, 0), pt(500, 0), { npc = 5, kills = 10, work = 250 })
    local inst = instance({ a, b })
    local _, together = S.evaluate(inst, plan(inst, { "A1", "A2", "C1", "C2", "T1", "T2" }))
    local _, apart = S.evaluate(inst, plan(inst, { "A1", "C1", "A2", "C2", "T1", "T2" }))
    T.ok(together.work < apart.work, "killed only once when both are taken")
    T.ok(together.killXP < apart.killXP, "and the monsters' XP counts only once")
end)

T.test("carried quests: XP counted where the quest is accepted", function()
    local carried = quest(1, pt(0, 0))
    carried.inLog, carried.completed, carried.accept = true, true, nil
    local inst = instance({ carried, quest(2, pt(0, 0), pt(300, 0), { deferred = true }) }, { log = { [1] = true } })
    local cost, st = S.evaluate(inst, plan(inst, { "T1", "A2", "C2" }))
    T.ok(cost < math.huge)
    T.ok(math.abs(st.questXP - 500) < 1e-6, "only the quest turned in later (the carried quest is counted already)")
    T.eq(st.logSize, 1, "the accepted quest stays in the log")
end)

T.test("first tour: nearest first, everything done", function()
    local inst = instance({
        quest(1, pt(0, 0), pt(300, 0)),
        quest(2, pt(0, 0), pt(-300, 0)),
        quest(3, pt(0, 0), nil, { single = { 1 } }),
    })
    local p = S.greedy(inst)
    T.ok(S.evaluate(inst, p) < math.huge)
    T.eq(#p.seq, 8)
    T.ok(p.inc[1] and p.inc[2] and p.inc[3])
end)

-- Quests on both sides of the start, ever further: always going to the nearest one walks
-- back and forth across the start.
local function zigzag()
    local quests = {}
    for n = 1, 6 do
        local side = n % 2 == 1 and -1 or 1
        quests[#quests + 1] = quest(n, pt(side * n * 100, 0))
    end
    -- Far away and barely worth anything.
    quests[#quests + 1] = quest(99, pt(0, 6000), pt(0, 6100), { xp = 50 })
    return instance(quests, { target = 13 })
end

T.test("local search: less walking, quest too far away left out", function()
    local inst = zigzag()
    local first = S.greedy(inst)
    local firstCost, firstSt = S.evaluate(inst, first)
    local best, cost = S.optimize(inst, first, { seed = 7, iterations = 3000 })
    local _, st = S.evaluate(inst, best)
    T.ok(cost < firstCost, ("cost %.0f -> %.0f"):format(firstCost, cost))
    T.ok(st.dist < firstSt.dist, ("distance %.0f -> %.0f"):format(firstSt.dist, st.dist))
    T.ok(not best.inc[inst.byId[99]], "the far quest is not worth the trip")
    for n = 1, 6 do T.ok(best.inc[inst.byId[n]], "quest " .. n .. " kept") end
end)

T.test("local search: deterministic for a given seed", function()
    local inst = zigzag()
    local first = S.greedy(inst)
    local a = S.optimize(inst, first, { seed = 3, iterations = 1500 })
    local b = S.optimize(inst, first, { seed = 3, iterations = 1500 })
    T.eq(order(inst, a), order(inst, b))
end)

T.test("forced quests: never dropped, nor what they depend on", function()
    local quests = {
        quest(1, pt(0, 0)),
        quest(2, pt(0, 0), nil, { single = { 1 }, pinned = true }),
        quest(99, pt(0, 6000), pt(0, 6100), { xp = 50, pinned = true }),
    }
    local inst = instance(quests)
    local best = S.optimize(inst, S.greedy(inst), { seed = 1, iterations = 800 })
    T.ok(best.inc[inst.byId[99]], "forced")
    local p = S.clone(best)
    T.eq(S.removeQuest(inst, p, inst.byId[1]), false, "forced quest 2 depends on it")
    T.ok(p.inc[inst.byId[1]])
end)

T.test("dropping a quest: its follow-ups go with it", function()
    local inst = instance({ quest(1, pt(0, 0)), quest(2, pt(0, 0), nil, { single = { 1 } }), quest(3, pt(0, 0)) })
    local p = plan(inst, { "A1", "T1", "A2", "T2", "A3", "T3" })
    T.ok(S.removeQuest(inst, p, inst.byId[1]))
    T.eq(order(inst, p), "A3 T3")
    T.ok(S.insertQuest(inst, p, inst.byId[2]), "inserted again with its prerequisite")
    T.ok(S.evaluate(inst, p) < math.huge, order(inst, p))
    T.ok(p.inc[inst.byId[1]])
end)

T.test("hearthstone: back to the bound inn when it saves time, once an hour", function()
    local inn = { at = pt(0, 0), name = "Inn" }
    local quests = { quest(1, pt(0, 0), pt(5000, 0)), quest(2, pt(0, 0), pt(-5000, 0)) }
    local inst = instance(quests, { bind = inn, target = 13 })
    local trace = {}
    local _, st = S.evaluate(inst, plan(inst, { "A1", "A2", "C1", "T1", "C2", "T2" }), trace)
    local kinds = {}
    for _, a in ipairs(trace) do kinds[#kinds + 1] = a.kind end
    T.eq(table.concat(kinds, " "), "accept accept complete hearth turnin complete turnin",
        "the first trip back takes the hearthstone, the second one waits for its cooldown")
    T.eq(st.hearths, 1)
    local walkBack = 5000 * P.detour / P.runSpeed
    local _, noStone = S.evaluate(instance(quests, { target = 13 }), plan(inst, { "A1", "A2", "C1", "T1", "C2", "T2" }))
    T.ok(math.abs(noStone.time - st.time - (walkBack - P.hearthTime)) < 1e-6, "saves the walk back, minus the cast")
end)

T.test("binding the hearthstone: an action the search adds where it saves time", function()
    local bind = { id = -1, accept = { pt(0, 0) }, bind = { at = pt(0, 0), name = "Inn" } }
    local inst = instance({ bind, quest(1, pt(0, 0), pt(5000, 0), { xp = 20000 }) }, { target = 13 })
    local first = S.greedy(inst)
    T.ok(not first.inc[inst.byId[-1]], "not in the first tour")
    local best = S.optimize(inst, first, { seed = 2, iterations = 300 })
    T.ok(best.inc[inst.byId[-1]], "bound by the search")
    local trace = {}
    S.evaluate(inst, best, trace)
    local kinds = {}
    for _, a in ipairs(trace) do kinds[#kinds + 1] = a.kind end
    T.eq(table.concat(kinds, " "), "sethearth accept complete hearth turnin")
    T.eq(trace[1].name, "Inn")
end)

T.test("first tour over many zones: a level is worth waiting for when it opens several quests", function()
    local function quests(n)
        local list = {}
        for i = 1, n do list[i] = quest(i, pt(i * 10, 0), nil, { qLevel = 13 }) end
        return list
    end
    -- At level 10, quests of level 13 need level 11: a whole level of grinding.
    local two = instance(quests(2), { shortWaits = true, target = 14 })
    T.ok(not S.greedy(two).inc[1], "two quests: no wait")
    local three = instance(quests(3), { shortWaits = true, target = 14 })
    local p = S.greedy(three)
    T.ok(p.inc[1] and p.inc[2] and p.inc[3], "three quests: the wait pays")
    T.ok(S.greedy(instance(quests(2), { target = 14 })).inc[1], "one zone: always a wait of a level at most")
end)

T.test("end of the tour: the start of the next guide counts", function()
    local quests = { quest(1, pt(0, 0)), quest(2, pt(1000, 0)) }
    local inst = instance(quests, { finish = pt(0, 0), pos = pt(500, 0) })
    local towardEnd = S.evaluate(inst, plan(inst, { "A2", "T2", "A1", "T1" }))
    local away = S.evaluate(inst, plan(inst, { "A1", "T1", "A2", "T2" }))
    T.ok(towardEnd < away, "end close to the next start")
end)

T.run()
