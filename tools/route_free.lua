-- Free quests: quests a Leveling route leaves out although they cost almost nothing on its way.
-- Shared by tools/write_leveling.lua (a warning for each one) and tools/audit_free_quests.lua
-- (the audit, and the steps it adds to a route).
-- usage: local Free = dofile(tools .. "/route_free.lua"); Free.audit(input) (see M.audit)
--
-- A quest is looked at where the game offers it on the route: open to the race, its
-- prerequisites turned in by then, its required level reached, at most 2 levels above the
-- player, not grey; not a class, dungeon, elite, escort, repeatable, profession, reputation or
-- event quest, nor one the route leaves out on purpose (`exclude`). Its giver and its ender must
-- stand on the route's way (a step's own place, next to it, or between two steps that follow
-- each other), away from elite monsters, and its objectives cost little: none (talk, delivery),
-- objects or places by the way, or monsters the route already kills for its own quests while
-- this one is in the log.
--
-- The time it adds is the detour through the route's own travel network (route_travel.lua),
-- the work of route_work.lua and route_model.lua, and PARAMS.talkTime per quest NPC; its XP is
-- the game's figure (QuestieDB's QuestXP table) at the player's level. Measured against the
-- section's own pace (XP per second of the simulated section, grinding included), a quest is
-- free when its XP per added second is PARAMS.ratio times that pace or more, within
-- PARAMS.maxAdded seconds; borderline from PARAMS.borderline, or when the data cannot tell
-- what its objective costs (left to a person to decide).
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local X = dofile(here .. "/questiedb_export.lua")
local Model = dofile(here .. "/route_model.lua")
local QK = X.QUEST

local M = {}

M.PARAMS = {
    ratio = 10,        -- free: XP per added second at least this many times the section's pace...
    maxAdded = 120,    -- ...and at most this many seconds added
    borderline = 4,    -- listed for a decision from this ratio on (up to twice maxAdded)
    talkTime = 3,      -- seconds to accept or turn in one more quest: Ding accepts and turns in by
                       -- itself (route_model's npcTime, 8 s, counts reading the text)
    maxLeg = 120,      -- seconds: a giver, ender or objective whose detour costs more is not looked at
    maxHold = 10800,   -- seconds of the route a free quest may wait in the quest log
    eliteRadius = 40,  -- yards: a place this close to an elite monster's spawn is not free
}

local FACTION_CODE = { Alliance = "A", Horde = "H" }
local GRID = 300      -- yards: cell of the index of the route's places

local function num(v) return type(v) == "number" and v ~= 0 and v or nil end

-- XP from level 1 to a fractional level (12.5: halfway through level 12).
function M.totalXP(level)
    local l = math.floor(level)
    local xp = 0
    for k = 1, l - 1 do xp = xp + (Model.XP_TO_LEVEL[k] or 0) end
    return xp + (level - l) * (Model.XP_TO_LEVEL[l] or 0)
end

-- Name, givers and enders: two quests alike are versions of one (one per race, one per patch).
function M.signature(quest)
    local function ids(givers)
        local parts = {}
        for k = 1, 2 do
            local list = {}
            for _, id in ipairs(type(givers) == "table" and givers[k] or {}) do list[#list + 1] = id end
            table.sort(list)
            parts[k] = table.concat(list, ",")
        end
        return table.concat(parts, ";")
    end
    return tostring(quest[QK.name]) .. "|" .. ids(quest[QK.startedBy]) .. "|" .. ids(quest[QK.finishedBy])
end

-- Why a quest can never be a free quest of the route (nil: it may be one), from its data alone.
-- exclude: { [quest] = reason } (the route's); versions: { [signature] = quest } (M.signature) of
-- the route's own quests.
function M.screen(q, quest, D, exclude, versions)
    local zone = quest[QK.zoneOrSort] or 0
    local special = quest[QK.specialFlags] or 0
    if exclude and exclude[q] then return "left out by the route" end
    if (quest[QK.requiredClasses] or 0) ~= 0 or X.CLASS_SORTS[zone] or D.trainerClass(quest) then return "class quest" end
    if X.hasBit(special, 1) then return "repeatable" end
    -- (QuestieDB: an event or a script completes it, escorts above all.)
    if X.hasBit(special, 2) then return "escort or event" end
    if zone < 0 and zone ~= X.CAMPING then return "category (event, profession, class...)" end
    if (quest[QK.parentQuest] or 0) ~= 0 then return "subquest" end
    if X.hasEntries(quest[QK.requiredSkill]) then return "profession" end
    if X.hasEntries(quest[QK.requiredMinRep]) then return "reputation" end
    if num(quest[QK.requiredSpell]) then return "spell" end
    if X.hasEntries(quest[QK.requiredSourceItems]) then return "items to hold" end
    if num(quest[QK.availableUntilCompleted]) or num(quest[QK.disabledByQuest]) then return "limited availability" end
    local v = versions and versions[M.signature(quest)]
    if v then return "another version of a route quest" end
    return nil
end

-- What the data cannot tell about a quest's objectives (nil: nothing): it is then borderline
-- at best.
local function doubt(quest)
    if X.hasEntries(quest[QK.extraObjectives]) then return "scripted objectives" end
    if not X.hasObjectives(quest) then
        -- Taken and handed in to the same one with nothing to do: an objective QuestieDB lacks.
        local s, e = quest[QK.startedBy] or {}, quest[QK.finishedBy] or {}
        for k = 1, 2 do
            for _, a in ipairs(s[k] or {}) do
                for _, b in ipairs(e[k] or {}) do
                    if a == b then return "objective not in the data" end
                end
            end
        end
    end
    return nil
end

-- input = {
--   db, D, Jobs,              the export, route_data.lua, route_work.lua
--   faction, races,           the route's side and races (those with a path)
--   raceBit = { [race] = bit }, logLimit,
--   known = { [quest] = true },          quests on the route's steps (its own and those added)
--   exclude = { [quest] = reason },      quests the route leaves out on purpose
--   paths = { [race] = { nodes = { { p, level, log, time, step, section, work } ... },
--             accepted = { [quest] = node }, turned = { [quest] = node },
--             trips = { [section] = trip(a, b, level) } } },   the simulated route of each race
--   rate = function(race, section) -> XP per second of the section,
--   anchor = function(step) -> true when new steps may follow this one,
--   position = function(step) -> where new steps after it go (default: the step itself): races
--              placed at the same positions share one finding,
-- }
-- Returns { findings = { ... }, skipped = { [reason] = count }, quests = { [quest] = outcome } };
-- a finding: { q, name, level, kind = "free" | "borderline", why, races (nil: all those
-- reaching), xp, estimated, added, rate, ratio, hold, objectives, accept = step, work = step or
-- nil, turnin = step, section }; an outcome (each quest of the side looked at and not free): {
-- why (the reason counted in `skipped`, or the finding's kind), xp, added, ratio, section (where
-- it was measured) }.
function M.audit(input)
    local P = M.PARAMS
    local db, D, Jobs = input.db, input.D, input.Jobs
    local races, logLimit = input.races, input.logLimit or 20
    local code = FACTION_CODE[input.faction]
    local skipped, outcomes = {}, {}
    local current
    local function skip(why, measure)
        skipped[why] = (skipped[why] or 0) + 1
        if current then
            local o = measure or {}
            o.why = why
            outcomes[current] = o
        end
    end

    local function friendly(id)
        local npc = db.Npc[id]
        if not npc then return false end
        local c = npc[13]
        return c == nil or c == "AH" or c == code
    end
    local function places(givers)
        local out = {}
        if type(givers) ~= "table" then return out end
        for _, id in ipairs(givers[1] or {}) do
            if friendly(id) then D.spawnPoints(db.Npc[id][X.NPC.spawns], nil, out) end
        end
        for _, id in ipairs(givers[2] or {}) do
            D.spawnPoints(db.Object[id] and db.Object[id][X.OBJECT.spawns], nil, out)
        end
        return out
    end

    -- Elite monsters hostile to the side, by place.
    local elites = {}
    do
        for id, npc in pairs(db.Npc) do
            local rank, c = npc[6] or 0, npc[13]
            if rank >= 1 and rank <= 3 and not (c == "AH" or c == code) then
                for _, p in ipairs(D.spawnPoints(npc[X.NPC.spawns], nil)) do
                    local key = p.region .. ":" .. math.floor(p.x / GRID) .. ":" .. math.floor(p.y / GRID)
                    elites[key] = elites[key] or {}
                    table.insert(elites[key], p)
                end
            end
        end
    end
    local function guarded(p)
        local cx, cy = math.floor(p.x / GRID), math.floor(p.y / GRID)
        for dx = -1, 1 do
            for dy = -1, 1 do
                for _, e in ipairs(elites[p.region .. ":" .. (cx + dx) .. ":" .. (cy + dy)] or {}) do
                    local d = Model.distance(p, e)
                    if d and d <= P.eliteRadius then return true end
                end
            end
        end
        return false
    end
    local function open(points)
        local out = {}
        for _, p in ipairs(points) do if not guarded(p) then out[#out + 1] = p end end
        return out
    end

    ---------------------------------------------------------------------------
    -- Candidates
    ---------------------------------------------------------------------------
    local versions = {}
    for q in pairs(input.known) do
        local quest = db.Quest[q]
        if quest then versions[M.signature(quest)] = q end
    end
    local ids = {}
    for q in pairs(db.Quest) do ids[#ids + 1] = q end
    table.sort(ids)
    local cands, isCand = {}, {}
    for _, q in ipairs(ids) do
        local quest = db.Quest[q]
        current = q
        if not input.known[q] and (quest[QK.questLevel] or 0) > 0 then
            local raceList = {}
            for _, race in ipairs(races) do
                if X.raceAllowed(quest, input.raceBit[race]) then raceList[#raceList + 1] = race end
            end
            local why = #raceList > 0 and M.screen(q, quest, D, input.exclude, versions)
            local starts, ends
            if #raceList > 0 and not why then
                starts, ends = places(quest[QK.startedBy]), places(quest[QK.finishedBy])
                if #starts == 0 then why = "no giver on a map"
                elseif #ends == 0 then why = "no ender on a map"
                else
                    starts, ends = open(starts), open(ends)
                    if #starts == 0 or #ends == 0 then why = "among elites" end
                end
            end
            if why then
                skip(why)
            elseif #raceList > 0 then
                local xp, estimated = D.questXP(q, quest)
                local c = { q = q, quest = quest, name = quest[QK.name], races = raceList, starts = starts, ends = ends,
                    xp = xp, estimated = estimated, qLevel = quest[QK.questLevel] or 0,
                    req = quest[QK.requiredLevel] or 0, maxLevel = num(quest[QK.requiredMaxLevel]),
                    breadcrumbFor = num(quest[QK.breadcrumbForQuestId]), doubt = doubt(quest) }
                cands[#cands + 1] = c
                isCand[q] = c
            end
        end
    end
    -- Objectives, once a quest's giver and ender are found on the way: { jobs } or nil, why.
    local function jobsOf(c)
        if c.jobs == nil then
            local quest = c.quest
            if D.questDungeon(quest) then
                c.jobs, c.jobsWhy = false, "dungeon"
            else
                local jobs, _, elite, unknown = D.questJobs(c.q, quest, nil)
                if elite then
                    c.jobs, c.jobsWhy = false, "elite"
                elseif unknown or (X.hasObjectives(quest) and #jobs == 0) then
                    c.jobs, c.jobsWhy = false, "objectives unknown"
                else
                    c.jobs = jobs
                end
            end
        end
        return c.jobs or nil, c.jobsWhy
    end
    -- Prerequisites first (a chain of free quests), then by level.
    local depth = {}
    local function depthOf(q, seen)
        if depth[q] then return depth[q] end
        seen = seen or {}
        if seen[q] then return 0 end
        seen[q] = true
        local quest, d = db.Quest[q], 0
        for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
            for _, p in ipairs(quest[key] or {}) do
                if p > 0 and isCand[p] then d = math.max(d, depthOf(p, seen) + 1) end
            end
        end
        depth[q] = d
        return d
    end
    table.sort(cands, function(a, b)
        local da, dbb = depthOf(a.q), depthOf(b.q)
        if da ~= dbb then return da < dbb end
        if a.qLevel ~= b.qLevel then return a.qLevel < b.qLevel end
        return a.q < b.q
    end)

    ---------------------------------------------------------------------------
    -- Paths: each race's simulated route, one node per step (its last place)
    ---------------------------------------------------------------------------
    local position = input.position or tostring
    local stepLevel, stepLog, reaching = {}, {}, {}
    for _, race in ipairs(races) do
        for _, n in ipairs(input.paths[race].nodes) do
            local s = n.step
            stepLevel[s] = math.min(stepLevel[s] or 99, n.level)
            stepLog[s] = math.max(stepLog[s] or 0, n.log)
            local key = position(s)
            reaching[key] = reaching[key] or {}
            reaching[key][race] = true
        end
    end
    local paths = {}
    for _, race in ipairs(races) do
        local src = input.paths[race]
        local nodes, at = {}, {}
        for r, n in ipairs(src.nodes) do
            local last = nodes[#nodes]
            if last and last.step == n.step then
                last.p, last.time = n.p, n.time
            else
                last = { p = n.p, time = n.time, step = n.step, section = n.section, work = {} }
                nodes[#nodes + 1] = last
            end
            for _, w in ipairs(n.work or {}) do last.work[#last.work + 1] = w end
            at[r] = #nodes
        end
        local function index(events)
            local out = {}
            for q, r in pairs(events or {}) do out[q] = at[r] or 0 end
            return out
        end
        local path = { race = race, nodes = nodes, done = index(src.turned), taken = index(src.accepted),
            trips = src.trips, extra = {}, edges = {}, placed = {}, grid = {}, killers = {} }
        -- Index of places: each node, and the way to the next one when it is a walk.
        for i, n in ipairs(nodes) do
            local a, b = n.p, nodes[i + 1] and nodes[i + 1].p
            local x0, x1, y0, y1 = a.x, a.x, a.y, a.y
            if b and b.region == a.region and (Model.distance(a, b) or math.huge) <= 2000 then
                x0, x1, y0, y1 = math.min(a.x, b.x), math.max(a.x, b.x), math.min(a.y, b.y), math.max(a.y, b.y)
            end
            for cx = math.floor(x0 / GRID), math.floor(x1 / GRID) do
                for cy = math.floor(y0 / GRID), math.floor(y1 / GRID) do
                    local key = a.region .. ":" .. cx .. ":" .. cy
                    local list = path.grid[key] or {}
                    path.grid[key] = list
                    list[#list + 1] = i
                end
            end
            -- Monsters the route kills there for its own quests: each kind of a job gets its
            -- share of the job's kills.
            for _, w in ipairs(n.work) do
                local npcs = w.npcs or (w.npc and { [w.npc] = true }) or {}
                local kinds = 0
                for _ in pairs(npcs) do kinds = kinds + 1 end
                for npc in pairs(npcs) do
                    path.killers[npc] = path.killers[npc] or {}
                    table.insert(path.killers[npc], { i = i, kills = (w.kills or 0) / kinds, perKill = w.perKill or 0,
                        label = w.label })
                end
            end
        end
        paths[race] = path
    end

    local function level(path, i) return stepLevel[path.nodes[i].step] or 1 end
    local function trip(path, i) return path.trips[path.nodes[i].section] end
    local function edge(path, i)
        local e = path.edges[i]
        if not e then
            local n, m = path.nodes[i], path.nodes[i + 1]
            e = m and trip(path, i)(n.p, m.p, level(path, i)) or 0
            path.edges[i] = e
        end
        return e
    end
    -- Seconds added by a visit to these points after node i, before node i + 1.
    local function detour(path, i, pts)
        local nodes, L, go = path.nodes, level(path, i), trip(path, i)
        local a, t = nodes[i].p, 0
        for _, x in ipairs(pts) do
            t = t + go(a, x, L)
            a = x
        end
        if nodes[i + 1] then t = t + go(a, nodes[i + 1].p, L) - edge(path, i) end
        return math.max(0, t)
    end
    local RADIUS = P.maxLeg / 2 * Model.PARAMS.mountSpeed / Model.PARAMS.detour
    local function near(path, p)
        local out, seen = {}, {}
        local r = math.ceil(RADIUS / GRID)
        local cx, cy = math.floor(p.x / GRID), math.floor(p.y / GRID)
        for dx = -r, r do
            for dy = -r, r do
                for _, i in ipairs(path.grid[p.region .. ":" .. (cx + dx) .. ":" .. (cy + dy)] or {}) do
                    if not seen[i] then
                        seen[i] = true
                        out[#out + 1] = i
                    end
                end
            end
        end
        return out
    end
    -- Best detour per node for a set of points: { [i] = { cost, point } }.
    local function legs(path, points, ok)
        local best = {}
        for _, p in ipairs(points) do
            for _, i in ipairs(near(path, p)) do
                if ok(i) then
                    local c = detour(path, i, { p })
                    if c <= P.maxLeg and (not best[i] or c < best[i].cost) then best[i] = { cost = c, point = p } end
                end
            end
        end
        return best
    end

    ---------------------------------------------------------------------------
    -- Placement of a candidate on a race's path: accept after node i, the objectives finished
    -- after node J (one complete step), turned in after node k.
    ---------------------------------------------------------------------------
    local function place(c, path)
        local quest = c.quest
        local nodes = path.nodes
        local N = #nodes
        -- Where it can be taken: prerequisites turned in, nothing exclusive on the route.
        local earliest, latest, after = 1, N, nil
        local single = quest[QK.preQuestSingle]
        if X.hasEntries(single) then
            local best
            for _, p in ipairs(single) do
                local at = path.done[p]
                if at and (not best or at < best) then best, after = at, path.placed[p] end
            end
            if not best then return nil, "prerequisite not on the route" end
            earliest = math.max(earliest, best)
        end
        for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
            if p > 0 then
                if not path.done[p] then return nil, "prerequisite not on the route" end
                earliest = math.max(earliest, path.done[p])
                after = after or path.placed[p]
            elseif p < 0 and (path.done[-p] or path.taken[-p]) then
                return nil, "exclusive with a route quest"
            end
        end
        for _, e in ipairs(quest[QK.exclusiveTo] or {}) do
            if path.done[e] or path.taken[e] then return nil, "exclusive with a route quest" end
        end
        -- A breadcrumb is gone once its quest is taken.
        if c.breadcrumbFor and path.taken[c.breadcrumbFor] then latest = path.taken[c.breadcrumbFor] - 1 end
        if latest < earliest then return nil, "its follow-up is taken first" end
        -- (New steps go after every step at their position: after the last node there.)
        local function anchorable(i)
            return input.anchor(nodes[i].step) and (i == N or position(nodes[i + 1].step) ~= position(nodes[i].step))
        end
        local function fits(i)
            local L = level(path, i)
            return i >= earliest and i <= latest and anchorable(i) and c.req <= L and c.qLevel <= L + 2
                and not Model.isQuestGrey(c.qLevel, L) and (not c.maxLevel or L <= c.maxLevel)
        end
        local A = legs(path, c.starts, fits)
        if not next(A) then return nil, "giver off the route" end
        local T = legs(path, c.ends, function(i) return i >= earliest and i <= latest and anchorable(i) end)
        if not next(T) then return nil, "ender off the route" end
        local jobs, why = jobsOf(c)
        if not jobs then return nil, why end
        -- Objectives: where the route already kills the job's monsters (shared), or by the way
        -- (own: { [node] = { cost, kills, mobLevel } }).
        local shared, own = {}, {}
        for m, job in ipairs(jobs) do
            local list = {}
            if job.kind == "kill" then
                for npc in pairs(job.npcs or {}) do
                    for _, k in ipairs(path.killers[npc] or {}) do
                        -- (The same quest item for both quests: the two counts add up.)
                        if not (k.label and k.label == job.label and k.label:sub(1, 10) == "quest item") then
                            local extra = math.max(0, job.count - k.kills)
                            list[#list + 1] = { i = k.i, cost = extra * k.perKill }
                        end
                    end
                end
            end
            local ownAt = {}
            local opts = Jobs.workOptions({ job }, math.max(1, c.qLevel), function(a, b, l) return Model.travel(a, b, l) end)
            for _, o in ipairs(opts) do
                if job.kind == "kill" or not guarded(o.entry) then
                    for _, i in ipairs(near(path, o.entry)) do
                        if anchorable(i) and Model.monsterLevel(o.jobs[1].mobLevel) <= level(path, i) + 1 then
                            local cost = detour(path, i, { o.entry }) + o.time
                            if cost <= P.maxLeg * 2 and (not ownAt[i] or cost < ownAt[i].cost) then
                                ownAt[i] = { cost = cost, kills = o.jobs[1].kills or 0, mobLevel = o.jobs[1].mobLevel }
                            end
                        end
                    end
                end
            end
            shared[m], own[m] = list, ownAt
            if #list == 0 and not next(ownAt) then return nil, "objectives off the route" end
        end
        -- Nodes where every objective can be done (its own way) for one complete step.
        local function finish(i, k)
            if #jobs == 0 then return 0, nil, 0 end
            local best, bestJ, bestXP
            local function try(J)
                local cost, kxp = 0, 0
                for m in ipairs(jobs) do
                    local w = own[m][J]
                    local s
                    for _, e in ipairs(shared[m]) do
                        if e.i > i and e.i <= J and (not s or e.cost < s.cost) then s = e end
                    end
                    if s and (not w or s.cost <= w.cost) then
                        cost = cost + s.cost
                    elseif w then
                        cost = cost + w.cost
                        if w.kills > 0 and w.mobLevel then
                            kxp = kxp + w.kills * Model.mobXP(w.mobLevel, level(path, J)) * Model.PARAMS.killXPMargin
                        end
                    else
                        return
                    end
                end
                if not best or cost < best then best, bestJ, bestXP = cost, J, kxp end
            end
            for J = i, k do try(J) end
            return best, bestJ, bestXP
        end
        local As, Ts = {}, {}
        for i in pairs(A) do As[#As + 1] = i end
        for k in pairs(T) do Ts[#Ts + 1] = k end
        table.sort(As)
        table.sort(Ts)
        local best
        for _, i in ipairs(As) do
            for _, k in ipairs(Ts) do
                if k >= i and nodes[k].time - nodes[i].time <= P.maxHold then
                    local room = true
                    for x = i, k do
                        if (stepLog[nodes[x].step] or 0) + (path.extra[x] or 0) >= logLimit then
                            room = false
                            break
                        end
                    end
                    if room then
                        local cost = i == k and detour(path, i, { A[i].point, T[k].point }) or (A[i].cost + T[k].cost)
                        local work, J, kxp = finish(i, k)
                        if work and (not best or cost + work < best.cost) then
                            best = { i = i, k = k, J = J, cost = cost + work + 2 * P.talkTime, killXP = kxp }
                        end
                    end
                end
            end
        end
        if not best then return nil, "no room in the quest log" end
        best.after = after
        return best
    end

    local findings = {}
    local covered = {} -- [signature] = { [race] = true }: versions of one quest placed once per race
    for _, c in ipairs(cands) do
        current = c.q
        -- Races placed at the same steps share one verdict: the average of their measures.
        local groups, order, lastWhy, measure = {}, {}, nil, nil
        local sigOf = M.signature(c.quest)
        covered[sigOf] = covered[sigOf] or {}
        for _, race in ipairs(c.races) do
            local path = paths[race]
            local pl, why
            if covered[sigOf][race] then
                why = "another version placed"
            else
                pl, why = place(c, path)
            end
            if not pl then
                lastWhy = why
            else
                local nodes = path.nodes
                local xp = Model.questXP(c.xp, c.qLevel, level(path, pl.k)) + pl.killXP
                local rate = input.rate(race, nodes[pl.i].section) or 0
                local added = math.max(1, pl.cost)
                local work = pl.J and nodes[pl.J].step or nil
                local sig = table.concat({ position(nodes[pl.i].step), work and position(work) or "",
                    position(nodes[pl.k].step) }, "|")
                if not groups[sig] then
                    groups[sig] = { members = {}, accept = nodes[pl.i].step, work = work, turnin = nodes[pl.k].step,
                        section = nodes[pl.i].section }
                    order[#order + 1] = sig
                end
                table.insert(groups[sig].members, { race = race, path = path, pl = pl, xp = xp, added = added,
                    rate = rate, ratio = rate > 0 and xp / added / rate or math.huge,
                    hold = nodes[pl.k].time - nodes[pl.i].time })
            end
        end
        local objectives = "none"
        if #(c.jobs or {}) > 0 then
            local parts = {}
            for _, job in ipairs(c.jobs) do
                parts[#parts + 1] = job.kind == "kill" and "monsters" or job.kind == "object" and "objects"
                    or job.kind == "vendor" and "a purchase" or "a place"
            end
            objectives = table.concat(parts, ", ")
        end
        local listed = 0
        for _, sig in ipairs(order) do
            local g = groups[sig]
            local n, xp, added, rate, ratio, hold, after = #g.members, 0, 0, 0, 0, 0, nil
            for _, m in ipairs(g.members) do
                xp, rate, ratio = xp + m.xp / n, rate + m.rate / n, ratio + m.ratio / n
                added, hold = math.max(added, m.added), math.max(hold, m.hold)
                after = after or m.pl.after
            end
            local kind, why
            if ratio >= P.ratio and added <= P.maxAdded then
                kind = "free"
            elseif ratio >= P.borderline and added <= 2 * P.maxAdded then
                kind, why = "borderline", ratio >= P.ratio and "long detour" or "pace"
            end
            if kind == "free" and (c.doubt or after) then kind, why = "borderline", c.doubt or ("after " .. after) end
            if kind then
                listed = listed + 1
                local races, all = {}, true
                for _, m in ipairs(g.members) do
                    races[#races + 1] = m.race
                    covered[sigOf][m.race] = true
                    -- Its follow-ups may come after it; only a free quest takes room in the log.
                    local path, pl = m.path, m.pl
                    path.done[c.q], path.taken[c.q] = pl.k, pl.i
                    path.placed[c.q] = kind ~= "free" and c.q or nil
                    if kind == "free" then
                        for x = pl.i, pl.k do path.extra[x] = (path.extra[x] or 0) + 1 end
                    end
                end
                for race in pairs(reaching[position(g.accept)] or {}) do
                    local found = false
                    for _, r in ipairs(races) do if r == race then found = true end end
                    if not found then all = false end
                end
                -- (Placed at other steps for other races: each finding names its own.)
                if #order > 1 then all = false end
                findings[#findings + 1] = { q = c.q, name = c.name, level = c.qLevel, kind = kind, why = why,
                    races = not all and races or nil, xp = math.floor(xp + 0.5), estimated = c.estimated,
                    added = added, rate = rate, ratio = ratio, hold = hold, objectives = objectives,
                    accept = g.accept, work = g.work, turnin = g.turnin, section = g.section }
                if not outcomes[c.q] or outcomes[c.q].why ~= "free" then
                    outcomes[c.q] = { why = kind == "free" and "free" or (why or kind), xp = xp, added = added,
                        ratio = ratio, section = g.section }
                end
            else
                lastWhy = "pays off less than " .. P.borderline .. " times the pace"
                measure = { xp = xp, added = added, ratio = ratio, section = g.section }
            end
        end
        if listed == 0 then skip(lastWhy or "not on the route", lastWhy == nil and nil or measure) end
    end
    current = nil
    return { findings = findings, skipped = skipped, quests = outcomes }
end

return M
