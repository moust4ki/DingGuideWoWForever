-- Route optimizer of tools/draft_guide.lua: plays the quests of one guide in a given order
-- (time, XP, level and quest log are simulated with tools/route_model.lua), builds a first
-- tour the way a player would (always the nearest thing to do), then improves it by local
-- search. Knows nothing of QuestieDB: draft_guide.lua builds the instance.
--
-- Instance:
--   inst = {
--     quests = { {
--       id, xp (base quest XP), qLevel, reqLevel,
--       xpEstimated   the XP is an estimate (no QuestXP figure): counted with the kill margin
--       pinned        never dropped (forced by the route, carried in, opens a later chain)
--       forced        may be taken grey
--       optional      the guide marks its steps optional (item-started quest)
--       single, group, exclusive   prerequisite ids as in QuestieDB (group < 0: must not be done)
--       itemStart     { [npcId] = true }: accepted while killing these (no accept action)
--       killers       { [npcId] = true }: monsters its objectives kill
--       accept        { point, ... } quest giver spots
--       work          { { entry, exit, time, dist, jobs = { { npc, kills, mobLevel, perKill } } }, ... }
--                     ways to do the objectives; entry nil: done on the spot
--       turnin        { point, ... } quest ender spots; nil: turned in by a later guide
--       inLog, completed   carried in from an earlier guide (already in the log)
--     }, ... },
--     start = { level, xp, pos, done = { [questId] = true }, log = { [questId] = true }, extraLog,
--               bind = { at = point, name } (the inn of the hearthstone), hearthReady (seconds) },
--   A quest with `bind = { at = point, name }` is no quest: binding the hearthstone at that
--   inn (accept = { point }, nothing else). The first tour has none; the search adds those
--   that save time, like quests (one per inn and guide).
--     finish        point where the next guide starts: the tour should end close to it
--     targetLevel, maxLevel, logLimit,
--     questAbove    quests at most this many levels above the player (their required level
--                   never above the player's; default route_model.lua PARAMS.questAbove)
--     mobAbove      objective monsters at most this many levels above the player (default
--                   PARAMS.mobAbove)
--     maxGrindStop  seconds of grinding stops inside the guide, at most, for a quest a later
--                   guide needs (pinned; default PARAMS.maxGrindStop)
--     travel        function(a, b, level) -> seconds, yards: trips (tools/route_travel.lua);
--                   default route_model.lua's travel
--     shortWaits    the first tour waits for a level only as long as maxGrindStop allows (a
--                   guide over many zones always has another zone to go to); otherwise up to
--                   a level at a time, up to maxLevel
--   }
-- Kill XP (and estimated quest XP) is counted at route_model.lua PARAMS.killXPMargin of its
-- estimate: the simulated player stays below the real one rather than above.
-- A plan is { seq = { action index, ... }, inc = { [quest index] = true } }.
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local Model = dofile(here .. "/route_model.lua")

local S = {}
local INF = math.huge
local ACCEPT, WORK, TURNIN = 1, 2, 3
S.ACCEPT, S.WORK, S.TURNIN = ACCEPT, WORK, TURNIN
S.KIND = { "accept", "complete", "turnin" }
local RANK = { [TURNIN] = 1, [ACCEPT] = 2, [WORK] = 3 }

S.PARAMS = {
    iterations = 20000,     -- simulated annealing moves per guide
    tempStart = 60,         -- seconds of worse tour accepted with chance 1/e at the start...
    tempEnd = 0.5,          -- ...and at the end
    window = 12,            -- final polish: positions tried around each action
    placeRadius = 200,      -- yards: actions this close share their kills (same monsters)
    grindStepPenalty = 900, -- seconds: a grinding stop is a wall in the guide (Yendi's feedback):
                            -- fewer, longer stops rather than one per level
    farAway = 3000,         -- yards: cheap insertion cost of a trip between land masses
    waitQuests = 3,         -- first tour over many zones: a level worth waiting for opens this many
}

-- Deterministic random numbers (Park-Miller), identical on every platform.
function S.rng(seed)
    local state = math.floor(seed) % 2147483647
    if state <= 0 then state = state + 2147483646 end
    return function(n)
        state = (state * 16807) % 2147483647
        local r = (state - 1) / 2147483646
        if n then return 1 + math.floor(r * n) end
        return r
    end
end

---------------------------------------------------------------------------
-- Preparation: actions, prerequisites, item-started quests
---------------------------------------------------------------------------
function S.prepare(inst)
    local start = inst.start
    local byId = {}
    for i, q in ipairs(inst.quests) do byId[q.id] = i end
    inst.byId = byId
    inst.logLimit = inst.logLimit or 18
    inst.acts, inst.qActs = {}, {}
    local function addAct(i, kind, a)
        inst.acts[#inst.acts + 1] = { q = i, kind = kind }
        a[kind] = #inst.acts
    end
    for i, q in ipairs(inst.quests) do
        local a = {}
        if q.accept and not q.itemStart and not q.inLog then addAct(i, ACCEPT, a) end
        if q.work and not q.completed then addAct(i, WORK, a) end
        if q.turnin then addAct(i, TURNIN, a) end
        inst.qActs[i] = a
        q.deferred = not q.turnin and not q.bind
        -- Prerequisites, as instance indices; what was done before the guide is met.
        if not q.inLog then
            local why
            local single = q.single or {}
            if #single > 0 then
                local met, any = false, {}
                for _, p in ipairs(single) do
                    if start.done[p] then met = true elseif byId[p] then any[#any + 1] = byId[p] end
                end
                if not met then
                    if #any == 0 then why = "prerequisite missing" else q.needAny = any end
                end
            end
            for _, p in ipairs(q.group or {}) do
                if p > 0 and not start.done[p] then
                    if byId[p] then q.needAll = q.needAll or {}; table.insert(q.needAll, byId[p])
                    else why = "prerequisite missing" end
                elseif p < 0 then
                    if start.done[-p] then why = "no longer available"
                    elseif byId[-p] then q.needNot = q.needNot or {}; table.insert(q.needNot, byId[-p]) end
                end
            end
            for _, e in ipairs(q.exclusive or {}) do
                if start.done[e] or start.log[e] then why = "exclusive"
                elseif byId[e] then q.excl = q.excl or {}; table.insert(q.excl, byId[e]) end
            end
            if q.itemStart and not q.accept then
                -- Accepted only while doing another quest of the guide (see hosts below).
            elseif not q.accept then
                why = why or "quest giver not found"
            end
            q.unavailable = why
        end
    end
    -- Item-started quests: the quests whose kills may drop their item (hosts).
    for j, other in ipairs(inst.quests) do
        if other.itemStart then
            other.hosts = {}
            for i, q in ipairs(inst.quests) do
                if i ~= j and q.killers and inst.qActs[i][WORK] then
                    for npc in pairs(other.itemStart) do
                        if q.killers[npc] then
                            other.hosts[#other.hosts + 1] = i
                            q.starts = q.starts or {}
                            q.starts[#q.starts + 1] = j
                            break
                        end
                    end
                end
            end
            if #other.hosts == 0 and not other.inLog then other.unavailable = other.unavailable or "starting item not found" end
        end
    end
    -- A quest whose prerequisites can never be met is out too.
    local changed = true
    while changed do
        changed = false
        for _, q in ipairs(inst.quests) do
            if not q.unavailable then
                for _, p in ipairs(q.needAll or {}) do
                    if inst.quests[p].unavailable then q.unavailable = "prerequisite " .. inst.quests[p].id .. " impossible" end
                end
                if q.needAny then
                    local any = false
                    for _, p in ipairs(q.needAny) do if not inst.quests[p].unavailable then any = true end end
                    if not any then q.unavailable = "prerequisite " .. inst.quests[q.needAny[1]].id .. " impossible" end
                end
                if q.hosts and not q.inLog and not q.unavailable then
                    local any = false
                    for _, h in ipairs(q.hosts) do if not inst.quests[h].unavailable then any = true end end
                    if not any then q.unavailable = "starting item not found" end
                end
                if q.unavailable then changed = true end
            end
        end
    end
    -- Grey quests are taken anyway when another quest of the guide needs them (as in game).
    for _, q in ipairs(inst.quests) do
        for _, list in ipairs({ q.needAny or {}, q.needAll or {} }) do
            for _, p in ipairs(list) do inst.quests[p].greyOK = true end
        end
        if q.forced then q.greyOK = true end
    end
    -- Static spots of each action, for cheap insertion.
    for _, a in ipairs(inst.acts) do
        local q = inst.quests[a.q]
        if a.kind == WORK then
            a.pin, a.pout = q.work[1].entry, q.work[1].exit
        else
            local pts = a.kind == ACCEPT and q.accept or q.turnin
            a.pin, a.pout = pts[1], pts[1]
        end
    end
    inst.margin = Model.PARAMS.killXPMargin
    inst.questAbove = inst.questAbove or Model.PARAMS.questAbove
    inst.mobAbove = inst.mobAbove or Model.PARAMS.mobAbove
    inst.maxGrindStop = inst.maxGrindStop or Model.PARAMS.maxGrindStop
    for _, q in ipairs(inst.quests) do
        q.needLevel = Model.levelFor(q.qLevel, q.reqLevel, inst.questAbove)
        q.margin = q.xpEstimated and inst.margin or 1
    end
    inst.xpTarget = Model.xpTo(start.level, start.xp, inst.targetLevel or start.level)
    inst.rateEnd = inst.margin * Model.grindRate(math.max(start.level, (inst.targetLevel or start.level) - 1))
    return inst
end

---------------------------------------------------------------------------
-- Simulation
---------------------------------------------------------------------------
local function newState(inst)
    local s = inst.start
    local st = {
        level = s.level, lxp = s.xp, time = 0, travel = 0, dist = 0, work = 0, npc = 0,
        grind = 0, grindXP = 0, waits = 0, credit = 0, questXP = 0, killXP = 0, turnins = 0, surplus = 0,
        log = {}, logSize = s.extraLog or 0, done = {}, acceptPos = {}, pos = s.pos, place = {},
        trip = inst.travel or Model.travel,
        bind = s.bind, hearthReady = s.hearthReady or 0, hearths = 0,
    }
    for i, q in ipairs(inst.quests) do
        if q.inLog then
            st.log[i] = q.completed and 2 or 1
            st.logSize = st.logSize + 1
            st.acceptPos[i] = 0
        end
    end
    return st
end

local function prereqsOK(q, st)
    if q.needAny then
        local ok = false
        for _, j in ipairs(q.needAny) do if st.done[j] then ok = true break end end
        if not ok then return false end
    end
    if q.needAll then for _, j in ipairs(q.needAll) do if not st.done[j] then return false end end end
    if q.needNot then for _, j in ipairs(q.needNot) do if st.done[j] then return false end end end
    if q.excl then for _, j in ipairs(q.excl) do if st.done[j] or st.log[j] then return false end end end
    return true
end

local function gain(st, amount)
    st.level, st.lxp = Model.addXP(st.level, st.lxp, amount)
end

-- Moves the player to a point: on foot, by flight path or boat (st.trip), or by hearthstone
-- when it is ready and saves time (to the bound inn, then the trip from there).
local function moveTo(inst, st, point, trace)
    if not point then return end
    local P = Model.PARAMS
    local t, d = st.trip(st.pos, point, st.level)
    if st.bind and st.time >= st.hearthReady then
        local th = P.hearthTime + st.trip(st.bind.at, point, st.level)
        if th + P.hearthGain < t then
            t, d = th, 0
            st.hearthReady = st.time + P.hearthCooldown
            st.hearths, st.place = st.hearths + 1, {}
            if trace then trace[#trace + 1] = { kind = "hearth", at = st.bind.at, level = st.level, name = st.bind.name } end
        end
    end
    st.time, st.travel, st.dist = st.time + t, st.travel + t, st.dist + d
    if not st.pos or d > S.PARAMS.placeRadius or t >= Model.PARAMS.boatTime then st.place = {} end
    st.pos = point
end

local function nearestPoint(points, st)
    local best, bestT
    for _, p in ipairs(points) do
        local t = st.trip(st.pos, p, st.level)
        if not bestT or t < bestT then best, bestT = p, t end
    end
    return best, bestT
end

-- Level of the highest monsters a way of doing the objectives fights.
local function topMonster(o)
    local top = 0
    for _, job in ipairs(o.jobs) do
        if job.kills > 0 then top = math.max(top, Model.monsterLevel(job.mobLevel)) end
    end
    return top
end

-- Cheapest way of doing the objectives from here among those whose monsters are not above
-- the player's level + mobAbove; nil (st.why set) when there is none yet.
local function bestWork(inst, work, st)
    local best, bestC, lowest
    for _, o in ipairs(work) do
        local top = topMonster(o)
        if top <= st.level + inst.mobAbove then
            local c = o.time + (o.entry and st.trip(st.pos, o.entry, st.level) or 0)
            if not bestC or c < bestC then best, bestC = o, c end
        elseif not lowest or top < lowest then
            lowest = top
        end
    end
    if not best then
        st.why = string.format("monsters of level %d > player level %d", lowest, st.level)
    end
    return best
end

-- Grinding stop up to `target`; why: what waits for that level (kept in st.grindWhy).
local function grindTo(inst, st, target, trace, why, q)
    if q and (q.forced or q.pinned) then why = why .. (q.forced and " (forced)" or " (pinned)") end
    st.grindWhy = why
    local need = Model.xpTo(st.level, st.lxp, target)
    local t = need / (inst.margin * Model.grindRate(st.level))
    st.time, st.grind, st.waits = st.time + t, st.grind + t, st.waits + 1
    st.credit, st.grindXP = st.credit + need, st.grindXP + need
    st.level, st.lxp = target, 0
    if trace then trace[#trace + 1] = { kind = "level", level = target, why = why, seconds = t } end
end

-- Do the guide's grinding stops stay within maxGrindStop seconds with one up to `target`?
local function shortStop(inst, st, target)
    local need = Model.xpTo(st.level, st.lxp, target)
    return st.grind + need / (inst.margin * Model.grindRate(st.level)) <= inst.maxGrindStop
end

-- May the player stop to grind up to `target` for quest q? For an ordinary quest the cost
-- decides: a stop is plain time, plus S.PARAMS.grindStepPenalty, so it pays only when it
-- opens enough quests. A pinned quest (a later guide needs it, or it is carried in) is never
-- dropped by the search, so a stop placed for it would stay for good: the guide's stops add
-- up to route_model.lua PARAMS.maxGrindStop seconds at most for it; out of reach, it waits
-- for a later guide. A quest the route forces (include) may wait any time.
local function grindOK(inst, st, q, target)
    if q.forced or not q.pinned then return true end
    return shortStop(inst, st, target)
end
S.grindOK = grindOK

-- Can quest i be accepted now? st.why says why not. allowGrind: a quest above the player
-- (required level, or quest level beyond questAbove) may wait for a grinding stop (grindOK).
local function canAccept(inst, st, i, q, allowGrind)
    if st.log[i] or st.done[i] then st.why = "already taken" return false end
    if st.logSize >= inst.logLimit then st.why = "quest log full" return false end
    if not prereqsOK(q, st) then st.why = "prerequisite not turned in yet, or exclusive quest taken" return false end
    local level = st.level
    if level < q.needLevel then
        if not allowGrind or not grindOK(inst, st, q, q.needLevel) then
            if level < q.reqLevel then
                st.why = string.format("required level %d > player level %d", q.reqLevel, level)
            else
                st.why = string.format("quest level %d > player level %d", q.qLevel, level)
            end
            return false
        end
        level = q.needLevel
    end
    if not q.greyOK and Model.isQuestGrey(q.qLevel, level) then st.why = "grey quest" return false end
    return true
end

local function accept(inst, st, i, q, k, at, trace)
    st.log[i] = inst.qActs[i][WORK] and 1 or 2
    st.logSize = st.logSize + 1
    st.acceptPos[i] = k
    if trace then
        trace[#trace + 1] = { kind = "accept", q = q.id, at = at or st.pos, optional = q.optional, level = st.level, t = st.time }
    end
end

-- Plays one action at position k of the plan; false when it cannot be done there.
local function doAction(inst, st, plan, k, a, trace, noGrind)
    local i, q = a.q, inst.quests[a.q]
    local P = Model.PARAMS
    if a.kind == ACCEPT and q.bind then
        -- Binding the hearthstone at an inn.
        if st.done[i] then st.why = "already bound there" return false end
        moveTo(inst, st, q.bind.at, trace)
        st.time, st.npc = st.time + P.npcTime, st.npc + P.npcTime
        st.bind, st.done[i] = q.bind, true
        if trace then trace[#trace + 1] = { kind = "sethearth", at = q.bind.at, level = st.level, name = q.bind.name } end
    elseif a.kind == ACCEPT then
        if not canAccept(inst, st, i, q, not noGrind) then return false end
        if st.level < q.needLevel then
            grindTo(inst, st, q.needLevel, trace, (st.level < q.reqLevel and ("required level " .. q.reqLevel)
                or ("quest level " .. q.qLevel)) .. " of " .. q.id, q)
        end
        local p = nearestPoint(q.accept, st)
        moveTo(inst, st, p, trace)
        st.time, st.npc = st.time + P.npcTime, st.npc + P.npcTime
        accept(inst, st, i, q, k, p, trace)
    elseif a.kind == WORK then
        if st.log[i] ~= 1 then st.why = "objectives of a quest not in the log" return false end
        local o = bestWork(inst, q.work, st)
        if not o and not noGrind then
            -- Monsters above the player: a grinding stop (grindOK) until the lowest ones are in reach.
            local lowest
            for _, w in ipairs(q.work) do
                local top = topMonster(w)
                if not lowest or top < lowest then lowest = top end
            end
            local target = math.min(Model.MAX_LEVEL, lowest - inst.mobAbove)
            if grindOK(inst, st, q, target) then
                grindTo(inst, st, target, trace, "monsters of level " .. lowest .. " of " .. q.id, q)
                o = bestWork(inst, q.work, st)
            end
        end
        if not o then return false end
        local level = st.level
        moveTo(inst, st, o.entry, trace)
        local t, xp = o.time, 0
        local accepted = st.acceptPos[i] or k
        for _, job in ipairs(o.jobs) do
            if job.kills > 0 then
                local prev = st.place[job.npc]
                local shared = 0
                if prev and accepted < prev.pos then shared = math.min(job.kills, prev.kills) end
                t = t - shared * job.perKill
                xp = xp + (job.kills - shared) * Model.mobXP(job.mobLevel or st.level, st.level) * inst.margin
                st.place[job.npc] = { kills = math.max(job.kills, prev and prev.kills or 0),
                    pos = (shared > 0 and prev.pos) or k }
            end
        end
        st.time, st.work = st.time + t, st.work + t
        st.dist = st.dist + (o.dist or 0)
        -- Monsters killed for a quest are not worth more than grinding: otherwise the
        -- search would rather kill them twice than share them between two quests.
        st.surplus = st.surplus + math.max(0, xp / inst.rateEnd - t)
        if o.exit and o.entry and o.exit ~= o.entry then st.pos = o.exit end
        st.log[i] = 2
        if trace then
            trace[#trace + 1] = { kind = "complete", q = q.id, at = o.entry or st.pos, optional = q.optional,
                level = level, monsters = topMonster(o), t = st.time }
        end
        gain(st, xp)
        st.killXP, st.credit = st.killXP + xp, st.credit + xp
        -- Item-started quests whose item drops from these kills.
        for _, j in ipairs(q.starts or {}) do
            local other = inst.quests[j]
            if plan.inc[j] and canAccept(inst, st, j, other, false) then
                st.time, st.npc = st.time + P.npcTime, st.npc + P.npcTime
                accept(inst, st, j, other, k, st.pos, trace)
            end
        end
    else
        if st.log[i] ~= 2 then st.why = "turned in before its objectives" return false end
        local p = nearestPoint(q.turnin, st)
        moveTo(inst, st, p, trace)
        st.time, st.npc = st.time + P.npcTime, st.npc + P.npcTime
        local level = st.level
        local xp = Model.questXP(q.xp, q.qLevel, st.level) * q.margin
        gain(st, xp)
        if not q.inLog then st.credit, st.questXP = st.credit + xp, st.questXP + xp end
        st.log[i] = nil
        st.logSize = st.logSize - 1
        st.done[i] = true
        st.turnins = st.turnins + 1
        if trace then trace[#trace + 1] = { kind = "turnin", q = q.id, at = p, optional = q.optional, level = level, t = st.time } end
    end
    return true
end

-- Plays a plan. Returns the cost to minimize and the final state; INF, state, position,
-- quest index when the plan breaks a rule. The cost: seconds to reach the guide's target
-- level (st.effective: the tour, then grinding what is missing; extra XP credited at the
-- grinding rate), plus the walk to the next guide. A grinding stop inside the guide is
-- forced on the player, unlike the XP missing at the end (often made up on the way): it
-- counts as plain time, plus a penalty. trace: list filled with the actions played.
-- partial: quests may be left unfinished.
function S.evaluate(inst, plan, trace, partial)
    local st = newState(inst)
    local acts, seq = inst.acts, plan.seq
    for k = 1, #seq do
        local a = acts[seq[k]]
        if not doAction(inst, st, plan, k, a, trace) then return INF, st, k, a.q end
    end
    for i, q in ipairs(inst.quests) do
        if plan.inc[i] then
            -- Every quest of the tour is turned in, or completed for a later guide.
            if not partial and ((q.turnin and not st.done[i]) or (q.deferred and st.log[i] ~= 2)) then
                return INF, st, nil, i
            end
            -- Quests turned in by a later guide: their XP counts for this tour.
            if q.deferred and not q.inLog and st.log[i] == 2 then
                local xp = Model.questXP(q.xp, q.qLevel, st.level) * q.margin
                st.credit, st.questXP = st.credit + xp, st.questXP + xp
            end
        end
    end
    st.effective = st.time + (inst.xpTarget - st.credit) / inst.rateEnd
    -- The walk to the next guide's start is part of the route.
    local finish = inst.finish and st.trip(st.pos, inst.finish, st.level) or 0
    st.finish = finish
    return st.effective + finish + st.surplus + st.grindXP / inst.rateEnd
        + st.waits * S.PARAMS.grindStepPenalty, st
end

---------------------------------------------------------------------------
-- Plans
---------------------------------------------------------------------------
local function clone(plan)
    local seq, inc = {}, {}
    for k = 1, #plan.seq do seq[k] = plan.seq[k] end
    for i, v in pairs(plan.inc) do inc[i] = v end
    return { seq = seq, inc = inc }
end
S.clone = clone

local function positions(plan)
    local pos = {}
    for k, a in ipairs(plan.seq) do pos[a] = k end
    return pos
end

-- Removes quest i and every included quest that can no longer be done without it.
-- Returns false (plan untouched) when a pinned quest would go, unless force.
local function removeQuest(inst, plan, i, force)
    local gone = { [i] = true }
    local changed = true
    while changed do
        changed = false
        for j, q in ipairs(inst.quests) do
            if plan.inc[j] and not gone[j] then
                local lost = false
                for _, p in ipairs(q.needAll or {}) do if gone[p] then lost = true end end
                if q.needAny then
                    local any = false
                    for _, p in ipairs(q.needAny) do if plan.inc[p] and not gone[p] then any = true end end
                    if not any then lost = true end
                end
                if q.hosts and not q.inLog then
                    local any = false
                    for _, h in ipairs(q.hosts) do if plan.inc[h] and not gone[h] then any = true end end
                    if not any then lost = true end
                end
                if lost then gone[j] = true; changed = true end
            end
        end
    end
    if not force then
        for j in pairs(gone) do if inst.quests[j].pinned then return false end end
    end
    local seq = {}
    for _, a in ipairs(plan.seq) do
        if not gone[inst.acts[a].q] then seq[#seq + 1] = a end
    end
    plan.seq = seq
    for j in pairs(gone) do plan.inc[j] = nil end
    return true
end
S.removeQuest = removeQuest

local function far(a, b)
    if not a or not b then return 0 end
    return Model.distance(a, b) or S.PARAMS.farAway
end

-- Earliest position an action may take: after its quest's previous action, after the
-- turn-in of its prerequisites, after a host's objectives for an item-started quest.
local function lowerBound(inst, pos, a)
    local i, q = a.q, inst.quests[a.q]
    local acts = inst.qActs[i]
    local lo = 1
    for kind = a.kind - 1, ACCEPT, -1 do
        local prev = acts[kind]
        if prev and pos[prev] then lo = math.max(lo, pos[prev] + 1) break end
    end
    local first = a.kind == ACCEPT or (a.kind == WORK and not acts[ACCEPT]) or (a.kind == TURNIN and not acts[ACCEPT] and not acts[WORK])
    if first and not q.inLog then
        for _, p in ipairs(q.needAll or {}) do
            local t = inst.qActs[p][TURNIN]
            if t and pos[t] then lo = math.max(lo, pos[t] + 1) end
        end
        if q.needAny then
            local best
            for _, p in ipairs(q.needAny) do
                local t = inst.qActs[p][TURNIN]
                if t and pos[t] and (not best or pos[t] < best) then best = pos[t] end
            end
            if best then lo = math.max(lo, best + 1) end
        end
        if q.hosts then
            local best
            for _, h in ipairs(q.hosts) do
                local w = inst.qActs[h][WORK]
                if w and pos[w] and (not best or pos[w] < best) then best = pos[w] end
            end
            if best then lo = math.max(lo, best + 1) end
        end
    end
    return lo
end

local function upperBound(inst, pos, a, n)
    local acts = inst.qActs[a.q]
    for kind = a.kind + 1, TURNIN do
        local nxt = acts[kind]
        if nxt and pos[nxt] then return pos[nxt] end
    end
    return n + 1
end

-- Inserts action ai where it lengthens the walk least (static spots).
local function cheapInsert(inst, plan, ai)
    local a = inst.acts[ai]
    local pos = positions(plan)
    local seq = plan.seq
    local lo, hi = lowerBound(inst, pos, a), upperBound(inst, pos, a, #seq)
    if lo > hi then return false end
    local best, bestD
    for p = lo, hi do
        local prev = seq[p - 1] and inst.acts[seq[p - 1]].pout
        local nxt = seq[p] and inst.acts[seq[p]].pin
        local d = far(prev, a.pin) + far(a.pout, nxt) - far(prev, nxt)
        if not bestD or d < bestD - 1e-9 then best, bestD = p, d end
    end
    table.insert(seq, best, ai)
    return true
end

-- The quests to add with quest i: its missing prerequisites first. nil when impossible.
local function chainOf(inst, plan, i, out, seen)
    out, seen = out or {}, seen or {}
    if seen[i] then return out end
    seen[i] = true
    local q = inst.quests[i]
    if q.unavailable then return nil end
    for _, e in ipairs(q.excl or {}) do if plan.inc[e] then return nil end end
    for _, p in ipairs(q.needAll or {}) do
        if not plan.inc[p] and not chainOf(inst, plan, p, out, seen) then return nil end
    end
    if q.needAny then
        local any = false
        for _, p in ipairs(q.needAny) do if plan.inc[p] or seen[p] then any = true end end
        if not any then
            local ok = false
            for _, p in ipairs(q.needAny) do
                if chainOf(inst, plan, p, out, seen) then ok = true break end
            end
            if not ok then return nil end
        end
    end
    if q.hosts then
        local any = false
        for _, h in ipairs(q.hosts) do if plan.inc[h] then any = true end end
        if not any then return nil end
    end
    out[#out + 1] = i
    return out
end

-- Adds quest i (and its missing prerequisites) by cheap insertion.
local function insertQuest(inst, plan, i)
    local chain = chainOf(inst, plan, i)
    if not chain then return false end
    for _, j in ipairs(chain) do
        plan.inc[j] = true
        for kind = ACCEPT, TURNIN do
            local ai = inst.qActs[j][kind]
            if ai and not cheapInsert(inst, plan, ai) then return false end
        end
    end
    return true
end
S.insertQuest = insertQuest

-- Removes the quests whose actions break a rule until the plan plays. A pinned quest that
-- cannot be played at all (above the player even after grinding, prerequisite out) goes
-- too: inst.unplaced lists them with the reason.
function S.repair(inst, plan)
    plan = clone(plan)
    for _ = 1, #inst.quests + 1 do
        local cost, st, _, i = S.evaluate(inst, plan)
        if cost < INF then return plan end
        if not removeQuest(inst, plan, i) then
            inst.unplaced = inst.unplaced or {}
            inst.unplaced[#inst.unplaced + 1] = { id = inst.quests[i].id, why = st.why or "?", forced = inst.quests[i].forced }
            removeQuest(inst, plan, i, true)
        end
    end
    error("plan cannot be repaired", 0)
end

---------------------------------------------------------------------------
-- First tour: always the nearest thing to do, as tools/draft_guide.lua did before
---------------------------------------------------------------------------
-- Lowest player level at which a way of doing quest q's objectives fights no monster above
-- that level + mobAbove (0 when the objectives fight none).
local function workLevel(inst, q)
    local lowest
    for _, o in ipairs(q.work or {}) do
        local top = topMonster(o)
        if not lowest or top < lowest then lowest = top end
    end
    return lowest and math.max(0, lowest - inst.mobAbove) or 0
end

-- A quest is taken only when its objectives will be within reach a level later at most: a
-- quest log full of quests whose monsters are still too strong blocks the whole tour.
local function canDo(inst, st, plan, a)
    local i, q = a.q, inst.quests[a.q]
    if a.kind == ACCEPT then return canAccept(inst, st, i, q, false) and workLevel(inst, q) <= st.level + 1 end
    if a.kind == WORK then return st.log[i] == 1 and bestWork(inst, q.work, st) ~= nil end
    return st.log[i] == 2
end

local function travelTo(inst, st, a)
    local q = inst.quests[a.q]
    if a.kind == WORK then
        local best
        for _, o in ipairs(q.work) do
            if topMonster(o) <= st.level + inst.mobAbove then
                local t = o.entry and st.trip(st.pos, o.entry, st.level) or 0
                if not best or t < best then best = t end
            end
        end
        return best
    end
    local _, t = nearestPoint(a.kind == ACCEPT and q.accept or q.turnin, st)
    return t
end

function S.greedy(inst)
    local plan = { seq = {}, inc = {} }
    for i, q in ipairs(inst.quests) do
        if not q.unavailable and not q.bind then plan.inc[i] = true end
    end
    local st = newState(inst)
    local doneAct = {}
    for _ = 1, 4 * #inst.acts + 50 do
        local best, bestT, bestRank
        for ai, a in ipairs(inst.acts) do
            if not doneAct[ai] and plan.inc[a.q] and canDo(inst, st, plan, a) then
                local t = travelTo(inst, st, a)
                local rank = RANK[a.kind]
                if not best or t < bestT - 0.01 or (math.abs(t - bestT) <= 0.01
                    and (rank < bestRank or (rank == bestRank and inst.quests[a.q].id < inst.quests[inst.acts[best].q].id))) then
                    best, bestT, bestRank = ai, t, rank
                end
            end
        end
        if best then
            plan.seq[#plan.seq + 1] = best
            doneAct[best] = true
            doAction(inst, st, plan, #plan.seq, inst.acts[best], nil, true)
        else
            -- Waiting on a level: grind up to one level when quests (or the monsters of a
            -- quest in the log) are close behind. shortWaits (a guide over many zones): only
            -- when that level opens S.PARAMS.waitQuests quests at least, or the stop is short.
            local want
            local opened = {}
            for ai, a in ipairs(inst.acts) do
                local q = inst.quests[a.q]
                local level
                if not doneAct[ai] and plan.inc[a.q] then
                    if a.kind == ACCEPT and prereqsOK(q, st) and st.logSize < inst.logLimit then
                        level = math.max(q.needLevel, workLevel(inst, q))
                    elseif a.kind == WORK and st.log[a.q] == 1 then
                        level = workLevel(inst, q)
                    end
                end
                if level and level > st.level and level <= st.level + 1 and level <= (inst.maxLevel or Model.MAX_LEVEL)
                    and grindOK(inst, st, q, level) then
                    opened[level] = opened[level] or {}
                    opened[level][a.q] = true
                end
            end
            for level, quests in pairs(opened) do
                local n = 0
                for _ in pairs(quests) do n = n + 1 end
                if not inst.shortWaits or n >= S.PARAMS.waitQuests or shortStop(inst, st, level) then
                    if not want or level < want then want = level end
                end
            end
            if not want then break end
            grindTo(inst, st, want)
        end
    end
    -- Quests left half done (never accepted, objectives never reached) are not in the tour.
    -- A quest the route forces goes at the end, after a grinding stop if need be; one pinned
    -- for another reason (a later guide needs it, carried in) waits for a later guide.
    for i = 1, #inst.quests do
        for kind = ACCEPT, TURNIN do
            local ai = inst.qActs[i][kind]
            if ai and not doneAct[ai] and plan.inc[i] and not removeQuest(inst, plan, i) then
                if inst.quests[i].forced then
                    for rest = kind, TURNIN do
                        local left = inst.qActs[i][rest]
                        if left and not doneAct[left] then
                            plan.seq[#plan.seq + 1] = left
                            doneAct[left] = true
                        end
                    end
                else
                    removeQuest(inst, plan, i, true)
                end
            end
        end
    end
    -- An item-started quest whose item never dropped on the way has no action at all.
    for i, q in ipairs(inst.quests) do
        if plan.inc[i] and q.itemStart and not q.inLog and not st.acceptPos[i] then plan.inc[i] = nil end
    end
    return S.repair(inst, plan)
end

---------------------------------------------------------------------------
-- Local search: simulated annealing over moves, then a deterministic polish
---------------------------------------------------------------------------
local function siblingsOK(inst, seq, k)
    local a = inst.acts[seq[k]]
    local acts = inst.qActs[a.q]
    for kind = ACCEPT, TURNIN do
        local other = acts[kind]
        if other and other ~= seq[k] then
            for p = 1, #seq do
                if seq[p] == other then
                    if (kind < a.kind and p > k) or (kind > a.kind and p < k) then return false end
                end
            end
        end
    end
    return true
end

local MOVES = {
    -- Move one action elsewhere between its quest's other actions.
    { weight = 30, fn = function(inst, plan, rng)
        local n = #plan.seq
        if n < 2 then return nil end
        local k = rng(n)
        local ai = table.remove(plan.seq, k)
        local pos = positions(plan)
        local a = inst.acts[ai]
        local lo, hi = lowerBound(inst, pos, a), upperBound(inst, pos, a, n - 1)
        if lo > hi then return nil end
        local p = lo + rng(hi - lo + 1) - 1
        if p == k then return nil end
        table.insert(plan.seq, p, ai)
        return plan
    end },
    -- Or-opt: move a run of 2 or 3 actions.
    { weight = 20, fn = function(inst, plan, rng)
        local n = #plan.seq
        local len = 1 + rng(2)
        if n <= len + 1 then return nil end
        local k = rng(n - len + 1)
        local block = {}
        for _ = 1, len do block[#block + 1] = table.remove(plan.seq, k) end
        local p = rng(#plan.seq + 1)
        if p == k then return nil end
        for b = len, 1, -1 do table.insert(plan.seq, p, block[b]) end
        return plan
    end },
    -- Swap two actions.
    { weight = 12, fn = function(inst, plan, rng)
        local n = #plan.seq
        if n < 2 then return nil end
        local k1, k2 = rng(n), rng(n)
        if k1 == k2 then return nil end
        plan.seq[k1], plan.seq[k2] = plan.seq[k2], plan.seq[k1]
        if not siblingsOK(inst, plan.seq, k1) or not siblingsOK(inst, plan.seq, k2) then return nil end
        return plan
    end },
    -- 2-opt: walk a stretch backwards.
    { weight = 10, fn = function(inst, plan, rng)
        local n = #plan.seq
        if n < 3 then return nil end
        local k = rng(n - 1)
        local e = math.min(n, k + rng(math.min(30, n - k)))
        local i, j = k, e
        while i < j do
            plan.seq[i], plan.seq[j] = plan.seq[j], plan.seq[i]
            i, j = i + 1, j - 1
        end
        return plan
    end },
    -- Drop a quest (and the quests that need it).
    { weight = 7, fn = function(inst, plan, rng)
        local list = {}
        for i in ipairs(inst.quests) do
            if plan.inc[i] and not inst.quests[i].pinned then list[#list + 1] = i end
        end
        if #list == 0 then return nil end
        if not removeQuest(inst, plan, list[rng(#list)]) then return nil end
        return plan
    end },
    -- Add a quest left out (with its missing prerequisites).
    { weight = 9, fn = function(inst, plan, rng)
        local list = {}
        for i, q in ipairs(inst.quests) do
            if not plan.inc[i] and not q.unavailable then list[#list + 1] = i end
        end
        if #list == 0 then return nil end
        if not insertQuest(inst, plan, list[rng(#list)]) then return nil end
        return plan
    end },
    -- Take a quest out and put it back where it costs least.
    { weight = 6, fn = function(inst, plan, rng)
        local list = {}
        for i, q in ipairs(inst.quests) do
            if plan.inc[i] and not q.inLog then list[#list + 1] = i end
        end
        if #list == 0 then return nil end
        local i = list[rng(#list)]
        local acts = inst.qActs[i]
        local seq = {}
        for _, ai in ipairs(plan.seq) do
            if inst.acts[ai].q ~= i then seq[#seq + 1] = ai end
        end
        plan.seq = seq
        for kind = ACCEPT, TURNIN do
            if acts[kind] and not cheapInsert(inst, plan, acts[kind]) then return nil end
        end
        return plan
    end },
    -- Ruin and recreate: take out a few quests close to each other, put them back one by one.
    -- (A quest with no action here, started by an item and turned in later, has no place.)
    { weight = 6, fn = function(inst, plan, rng)
        local list = {}
        for i, q in ipairs(inst.quests) do
            local acts = inst.qActs[i]
            if plan.inc[i] and not q.pinned and (acts[ACCEPT] or acts[WORK] or acts[TURNIN]) then list[#list + 1] = i end
        end
        if #list < 2 then return nil end
        local seed = list[rng(#list)]
        local spot = inst.acts[inst.qActs[seed][ACCEPT] or inst.qActs[seed][WORK] or inst.qActs[seed][TURNIN]].pin
        table.sort(list, function(x, y)
            local ax = inst.acts[inst.qActs[x][ACCEPT] or inst.qActs[x][WORK] or inst.qActs[x][TURNIN]].pin
            local ay = inst.acts[inst.qActs[y][ACCEPT] or inst.qActs[y][WORK] or inst.qActs[y][TURNIN]].pin
            local dx, dy = far(spot, ax), far(spot, ay)
            if dx ~= dy then return dx < dy end
            return x < y
        end)
        local take = {}
        for n = 1, math.min(#list, 1 + rng(3)) do take[#take + 1] = list[n] end
        for _, i in ipairs(take) do
            if plan.inc[i] and not removeQuest(inst, plan, i) then return nil end
        end
        for n = #take, 2, -1 do
            local m = rng(n)
            take[n], take[m] = take[m], take[n]
        end
        for _, i in ipairs(take) do
            if not plan.inc[i] then insertQuest(inst, plan, i) end
        end
        return plan
    end },
}
local TOTAL_WEIGHT = 0
for _, m in ipairs(MOVES) do TOTAL_WEIGHT = TOTAL_WEIGHT + m.weight end

local function propose(inst, plan, rng)
    local r = rng(TOTAL_WEIGHT)
    for _, m in ipairs(MOVES) do
        if r <= m.weight then return m.fn(inst, clone(plan), rng) end
        r = r - m.weight
    end
end

-- Best place of each action within a window around it, until nothing improves.
local function polish(inst, plan, cost)
    local W = S.PARAMS.window
    for _ = 1, 3 do
        local improved = false
        for k = 1, #plan.seq do
            local bestPlan, bestCost
            for p = math.max(1, k - W), math.min(#plan.seq, k + W) do
                if p ~= k then
                    local cand = clone(plan)
                    local ai = table.remove(cand.seq, k)
                    table.insert(cand.seq, p, ai)
                    local c = S.evaluate(inst, cand)
                    if c < (bestCost or cost) - 1e-6 then bestPlan, bestCost = cand, c end
                end
            end
            if bestPlan then plan, cost, improved = bestPlan, bestCost, true end
        end
        if not improved then break end
    end
    return plan, cost
end

-- Actions played on the same spot: turn-ins, then accepts, then objectives, as a guide
-- step reads (only when it costs nothing).
local function canonical(inst, plan, cost)
    local seq = plan.seq
    local k = 1
    while k <= #seq do
        local e = k
        local spot = inst.acts[seq[k]].pout
        while e < #seq do
            local nxt = inst.acts[seq[e + 1]]
            if not spot or not nxt.pin or far(spot, nxt.pin) > 5 then break end
            e = e + 1
        end
        if e > k then
            local cand = clone(plan)
            local run = {}
            for p = k, e do run[#run + 1] = { ai = cand.seq[p], n = p } end
            table.sort(run, function(x, y)
                local rx, ry = RANK[inst.acts[x.ai].kind], RANK[inst.acts[y.ai].kind]
                if rx ~= ry then return rx < ry end
                return x.n < y.n
            end)
            for p = k, e do cand.seq[p] = run[p - k + 1].ai end
            local c = S.evaluate(inst, cand)
            if c <= cost + 1e-6 then plan, cost, seq = cand, c, cand.seq end
        end
        k = e + 1
    end
    return plan, cost
end

-- Improves a plan; deterministic for a given seed.
function S.optimize(inst, plan, opts)
    opts = opts or {}
    local P = S.PARAMS
    local rng = S.rng(opts.seed or 1)
    local cur = clone(plan)
    local curCost = S.evaluate(inst, cur)
    if curCost == INF then
        cur = S.repair(inst, cur)
        curCost = S.evaluate(inst, cur)
    end
    local best, bestCost = cur, curCost
    local n = opts.iterations or P.iterations
    local t0, t1 = P.tempStart, P.tempEnd
    for it = 1, n do
        local temp = t0 * (t1 / t0) ^ (it / n)
        local cand = propose(inst, cur, rng)
        if cand then
            local c = S.evaluate(inst, cand)
            if c < INF then
                local delta = c - curCost
                if delta <= 0 or rng() < math.exp(-delta / temp) then
                    cur, curCost = cand, c
                    if c < bestCost - 1e-9 then best, bestCost = cand, c end
                end
            end
        end
    end
    best, bestCost = S.reinsert(inst, best, bestCost)
    best, bestCost = polish(inst, best, bestCost)
    best, bestCost = S.reinsert(inst, best, bestCost)
    best, bestCost = canonical(inst, best, bestCost)
    return best, bestCost
end

---------------------------------------------------------------------------
-- Quests left out: best insertion into a plan, and why they stay out
---------------------------------------------------------------------------
-- Adds quest i (and missing prerequisites), each action at its best position by full
-- simulation. Returns the plan and its cost, or nil and the most frequent reason why no
-- position works.
function S.bestInsertion(inst, plan, i)
    local chain = chainOf(inst, plan, i)
    if not chain then return nil, "prerequisite impossible" end
    local cur = clone(plan)
    for _, j in ipairs(chain) do
        cur.inc[j] = true
        for kind = ACCEPT, TURNIN do
            local ai = inst.qActs[j][kind]
            if ai then
                local pos = positions(cur)
                local a = inst.acts[ai]
                local lo, hi = lowerBound(inst, pos, a), upperBound(inst, pos, a, #cur.seq)
                local bestPlan, bestCost
                -- Reasons by kind (levels left out); the message kept is the last position's,
                -- the latest in the tour.
                local reasons, last, top = {}, {}, nil
                for p = lo, hi do
                    local cand = clone(cur)
                    table.insert(cand.seq, p, ai)
                    -- The quest's later actions are not placed yet: judge on what plays.
                    local c, st = S.evaluate(inst, cand, nil, true)
                    if c < INF and (not bestCost or c < bestCost - 1e-9) then bestPlan, bestCost = cand, c end
                    if c == INF and st.why then
                        local kind = st.why:gsub("%d+", "N")
                        reasons[kind], last[kind] = (reasons[kind] or 0) + 1, st.why
                        if not top or reasons[kind] > reasons[top] then top = kind end
                    end
                end
                if not bestPlan then return nil, top and last[top] end
                cur = bestPlan
            end
        end
    end
    local cost, st = S.evaluate(inst, cur)
    if cost == INF then return nil, st.why end
    return cur, cost
end


-- Adds back every quest left out whose best insertion lowers the cost.
function S.reinsert(inst, plan, cost)
    for _ = 1, 3 do
        local improved = false
        for i, q in ipairs(inst.quests) do
            if not plan.inc[i] and not q.unavailable then
                local cand, c = S.bestInsertion(inst, plan, i)
                if cand and c < cost - 1e-6 then plan, cost, improved = cand, c, true end
            end
        end
        if not improved then break end
    end
    return plan, cost
end

-- Why quest i cannot join the plan at all, or nil when it could.
function S.blocker(inst, plan, i)
    local q = inst.quests[i]
    if q.unavailable then return q.unavailable end
    for _, e in ipairs(q.excl or {}) do
        if plan.inc[e] then return "exclusive", inst.quests[e].id end
    end
    for _, p in ipairs(q.needAll or {}) do
        local why, other = S.blocker(inst, plan, p)
        if not plan.inc[p] and why then return "prerequisite " .. inst.quests[p].id .. ": " .. why, other end
    end
    if q.hosts then
        local any = false
        for _, h in ipairs(q.hosts) do if plan.inc[h] then any = true end end
        if not any then return "no quest of the guide drops its starting item" end
    end
    return nil
end

return S
