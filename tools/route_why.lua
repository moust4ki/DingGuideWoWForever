-- Reasons of a Leveling route's choices, measured on its simulation (tools/write_leveling.lua):
-- what a surprising step brings, in XP and time, so that the guide window can say why in plain
-- words (Ding/Core/Why.lua). Only what the tools measure: the simulated player's XP and time
-- (route_model.lua, route_travel.lua) and the quests a chain opens (QuestieDB's prerequisites).
-- Nothing is guessed: a step whose effect the tools cannot measure gets no reason.
-- usage: local Why = dofile(tools .. "/route_why.lua"); Why.reasons(input) (see M.reasons)
--
-- Reasons of a step (`why` in the guide, docs/guide-packs.md):
--   detour  the step takes the player out of their way: a few steps in another zone, or one
--           step far from the steps around it. What it brings: its turn-ins, the quests taken
--           there and the chains they open (follow-ups the route turns in later); what it costs:
--           the time on the way beyond the direct trip from the step before to the step after.
--           Told under the step (`short`) from PARAMS.detourMin seconds.
--   carry   a quest taken here and turned in much later, in another zone: when, and its XP;
--           told under the step when the turn-in is on another continent and the route never
--           comes back to this zone before it (taken now or never).
--   level   a level step: the level of the quests that follow, when they are above the level it
--           asks for.
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local X = dofile(here .. "/questiedb_export.lua")
local Model = dofile(here .. "/route_model.lua")
local QK = X.QUEST

local M = {}

M.PARAMS = {
    detourMin = 240,     -- seconds a detour costs beyond the direct trip, at least, to be told...
    detourSteps = 6,     -- ...made of at most this many steps out of the zone...
    detourSpan = 1800,   -- ...over at most this many seconds of the route
    walkMin = 300,       -- seconds one step costs beyond the direct trip, in its own zone
    carryHold = 3600,    -- seconds of the route a quest waits in the log, at least, to be noted
    levelNext = 6,       -- quests taken after a level step, looked at
}

-- "9 000" (the report's figures).
local function thousands(n)
    local s = tostring(math.floor(n + 0.5))
    local out = s:reverse():gsub("(%d%d%d)", "%1 "):reverse()
    return (out:gsub("^ ", ""))
end
M.thousands = thousands

-- Figures the guide writes: XP to two significant digits (to the hundred below 10 000), time to
-- the minute.
function M.roundXP(xp)
    if xp < 100 then return math.max(10, math.floor(xp / 10 + 0.5) * 10) end
    local step = xp < 10000 and 100 or 1000
    return math.floor(xp / step + 0.5) * step
end
function M.roundSeconds(s)
    return math.max(60, math.floor(s / 60 + 0.5) * 60)
end

-- input = {
--   db,                     the export
--   races = { race... },
--   sims = { [race] = { visits = { { step, section, from, to, pos0, pos, places, legs, travel,
--            grind, xp, turned, accepted, hearth, level, levelTo } ... }, xpOf = { [quest] = xp },
--            starts = { [section id] = { trip } } } },
-- }
-- Returns { [step] = reason }; a reason = { kind, quest, action ("turnin" | "accept"), chain
-- (follow-ups counted), xp (all the XP counted), questXP (the named quest and its chain),
-- seconds, quests (counted), short (said under the step), and per kind: steps, back (detour:
-- back in the zone it left), continent, later (carry: the section of the turn-in), next
-- (level: { low, high } levels of the quests that follow) }.
function M.reasons(input)
    local P = M.PARAMS
    local db = input.db

    -- Prerequisites of a quest (any of `single`, all of `group`).
    local function prereqs(q)
        local quest = db.Quest[q]
        local out = {}
        if not quest then return out end
        for _, p in ipairs(quest[QK.preQuestSingle] or {}) do out[#out + 1] = p end
        for _, p in ipairs(quest[QK.preQuestGroup] or {}) do if p > 0 then out[#out + 1] = p end end
        return out
    end
    local function questLevel(q)
        local quest = db.Quest[q]
        return quest and quest[QK.questLevel] or 0
    end

    local perRace = {}
    for _, race in ipairs(input.races) do
        local sim = input.sims[race]
        local V = sim.visits
        local found = {}
        perRace[race] = found
        local turnedAt, takenAt = {}, {}
        for i, v in ipairs(V) do
            for _, q in ipairs(v.turned) do turnedAt[q] = turnedAt[q] or i end
            for _, q in ipairs(v.accepted) do takenAt[q] = takenAt[q] or i end
        end
        -- Follow-ups of each quest among those the route turns in.
        local followers = {}
        for q in pairs(turnedAt) do
            for _, p in ipairs(prereqs(q)) do
                followers[p] = followers[p] or {}
                table.insert(followers[p], q)
            end
        end
        for _, list in pairs(followers) do table.sort(list) end
        -- What visits [a, b] bring: the quests turned in there, those taken there (turned in
        -- later) and the chains they open (follow-ups turned in after b); the quest whose chain
        -- brings the most is the one the window names.
        local function value(a, b)
            local counted, list, xp = {}, {}, 0
            local function add(q)
                if counted[q] then return false end
                counted[q] = true
                list[#list + 1] = q
                xp = xp + (sim.xpOf[q] or 0)
                return true
            end
            local seeds = {}
            for i = a, b do
                for _, q in ipairs(V[i].turned) do seeds[#seeds + 1] = { q = q, action = "turnin" } end
                for _, q in ipairs(V[i].accepted) do
                    if turnedAt[q] and turnedAt[q] > b then seeds[#seeds + 1] = { q = q, action = "accept" } end
                end
            end
            local best
            for _, s in ipairs(seeds) do
                local before = xp
                add(s.q)
                local chain, queue = 0, { s.q }
                while #queue > 0 do
                    local q = table.remove(queue, 1)
                    for _, f in ipairs(followers[q] or {}) do
                        if turnedAt[f] > b and (takenAt[f] or a) >= a and add(f) then
                            chain = chain + 1
                            queue[#queue + 1] = f
                        end
                    end
                end
                local mine = xp - before
                if not best or mine > best.xp then
                    best = { q = s.q, action = s.action, xp = mine, chain = chain }
                end
            end
            -- The monsters killed there for these quests.
            local kills = 0
            for i = a, b do
                local own = 0
                for _, q in ipairs(V[i].turned) do own = own + (sim.xpOf[q] or 0) end
                kills = kills + math.max(0, V[i].xp - own)
            end
            return xp + kills, best, list
        end
        local function zone(v) return v.pos and v.pos.map end
        local function tripOf(v, a, b)
            local start = sim.starts[v.section.id]
            return (start and start.trip or Model.travel)(a, b, v.level)
        end
        -- The first place after visit i: its visit, the place, the leg that reached it.
        local function nextPlace(i)
            for k = i + 1, #V do
                if V[k].places[1] then return k, V[k].places[1], V[k].legs[1] end
            end
            return nil
        end
        -- Seconds visits [s, e] cost beyond the direct trip from visit s - 1 to the place after.
        local function extra(s, e)
            local k, place, leg = nextPlace(e)
            if not k or not V[s - 1].pos then return nil end
            local onWay = leg
            for i = s, e do onWay = onWay + V[i].travel end
            return onWay - tripOf(V[k], V[s - 1].pos, place), k
        end
        local function record(i, r)
            r.level = r.level or V[i].level
            found[V[i].step] = r
        end
        local taken = {}
        -- Detours out of the zone: a short run of steps in another zone, between two steps
        -- elsewhere (back in the zone left, or on to a third one).
        local i = 2
        while i <= #V do
            local za, zb = zone(V[i - 1]), zone(V[i])
            if za and zb and zb ~= za and V[i].section == V[i - 1].section then
                local e = i
                while e < #V and zone(V[e + 1]) == zb do e = e + 1 end
                local nextZone = V[e + 1] and zone(V[e + 1])
                if nextZone and e - i + 1 <= P.detourSteps and V[e].to - V[i - 1].to <= P.detourSpan then
                    local cost = extra(i, e)
                    local xp, best, list = value(i, e)
                    if cost and best and cost > 0 then
                        record(i, { kind = "detour", quest = best.q, action = best.action, chain = best.chain,
                            questXP = best.xp, xp = xp, seconds = cost, quests = list, steps = e - i + 1,
                            last = V[e].step, back = nextZone == za or nil, short = cost >= P.detourMin or nil })
                        for x = i, e do taken[x] = true end
                    end
                end
                i = e + 1
            else
                i = i + 1
            end
        end
        -- One step far off the way, in its own zone.
        for x = 2, #V - 1 do
            local v = V[x]
            if not taken[x] and v.places[1] and zone(V[x - 1]) == zone(v) and V[x - 1].section == v.section then
                local cost = extra(x, x)
                if cost and cost >= P.walkMin then
                    local xp, best, list = value(x, x)
                    if best then
                        record(x, { kind = "detour", quest = best.q, action = best.action, chain = best.chain,
                            questXP = best.xp, xp = xp, seconds = cost, quests = list, steps = 1, back = true,
                            last = v.step, short = true })
                        taken[x] = true
                    end
                end
            end
        end
        -- Quests carried: taken here, turned in much later in another zone.
        for x, v in ipairs(V) do
            if not found[v.step] and v.pos then
                local best
                for _, q in ipairs(v.accepted) do
                    local j = turnedAt[q]
                    if j and j > x and V[j].from - v.to >= P.carryHold and zone(V[j]) ~= zone(v) then
                        -- (Taken now or never: the route never comes back to this zone first.)
                        local back = false
                        for y = x + 1, j - 1 do
                            for _, p in ipairs(V[y].places) do if p.map == zone(v) then back = true end end
                        end
                        local place = V[j].places[#V[j].places] or V[j].pos
                        local continent = place and v.pos.continent and place.continent ~= v.pos.continent or false
                        local r = { kind = "carry", quest = q, action = "accept", xp = sim.xpOf[q] or 0,
                            questXP = sim.xpOf[q] or 0, seconds = V[j].from - v.to, quests = { q },
                            later = V[j].section.id, continent = continent or nil, comesBack = back or nil,
                            short = (continent and not back) or nil }
                        if not best or (r.short and not best.short) or (r.short == best.short and r.xp > best.xp) then
                            best = r
                        end
                    end
                end
                if best then record(x, best) end
            end
        end
        -- Level steps: the time they take, and the quests that follow when they are above.
        for x, v in ipairs(V) do
            if v.step.level and not found[v.step] and v.grind > 0 then
                local low, high, n = nil, nil, 0
                for y = x + 1, #V do
                    for _, q in ipairs(V[y].accepted) do
                        if n < P.levelNext then
                            local l = questLevel(q)
                            if l > 0 then
                                low, high = math.min(low or l, l), math.max(high or l, l)
                                n = n + 1
                            end
                        end
                    end
                    if n >= P.levelNext then break end
                end
                local target = math.floor(v.step.level)
                if high and high > target then
                    record(x, { kind = "level", xp = 0, questXP = 0, seconds = v.grind, quests = {},
                        next = { low, high } })
                end
            end
        end
    end
    -- One reason per step, when every race that plays it finds the same one (kind and quest);
    -- the figures are their average.
    local out, steps = {}, {}
    local plays = {}
    for _, race in ipairs(input.races) do
        for _, v in ipairs(input.sims[race].visits) do plays[v.step] = (plays[v.step] or 0) + 1 end
        for step, r in pairs(perRace[race]) do
            steps[step] = steps[step] or {}
            table.insert(steps[step], r)
        end
    end
    for step, list in pairs(steps) do
        local first, same = list[1], true
        for _, r in ipairs(list) do
            if r.kind ~= first.kind or r.quest ~= first.quest or (r.short or false) ~= (first.short or false) then
                same = false
            end
        end
        if same and #list == plays[step] then
            local r = {}
            for k, v in pairs(first) do r[k] = v end
            local xp, questXP, seconds = 0, 0, 0
            for _, x in ipairs(list) do
                xp, questXP, seconds = xp + x.xp / #list, questXP + x.questXP / #list, seconds + x.seconds / #list
            end
            r.xp, r.questXP, r.seconds = xp, questXP, seconds
            out[step] = r
        end
    end
    return out
end

-- A reason as the guide writes it (`why`, docs/guide-packs.md): rounded figures, only the keys
-- the window reads.
function M.data(r)
    local w = { kind = r.kind, short = r.short or nil }
    if r.kind ~= "level" then w.seconds = M.roundSeconds(r.seconds) end
    if r.kind == "detour" then
        w.quest = r.quest
        if r.action == "accept" then w.action = "accept" end
        if (r.chain or 0) > 0 then w.chain = r.chain end
        -- One quest: all the XP of the detour is its own (turn-in and monsters); several: the
        -- named quest's chain, and the whole detour when it brings more.
        local own = #r.quests == 1 and r.xp or r.questXP
        w.xp = M.roundXP(own)
        if #r.quests > 1 and r.xp >= own * 1.1 then
            w.total, w.quests = M.roundXP(r.xp), #r.quests
        end
        w.back = r.back or nil
    elseif r.kind == "carry" then
        w.quest, w.xp = r.quest, M.roundXP(r.xp)
        w.continent = r.continent or nil
        w.once = not r.comesBack or nil
    elseif r.kind == "level" then
        w.levels = { r.next[1], r.next[2] }
    end
    return w
end

-- Why the free-quests audit left a quest out (route_free.lua's outcome), as a section's
-- `leftOut` entry; nil when the reason is not the route's (class, profession, event...: the
-- game or Ding tells those) or not measured.
local OUTCOMES = {
    ["giver off the route"] = { kind = "away" },
    ["objectives off the route"] = { kind = "far" },
    ["ender off the route"] = { kind = "far", turnin = true },
    ["no room in the quest log"] = { kind = "log" },
    ["prerequisite not on the route"] = { kind = "prereq" },
    ["another version of a route quest"] = { kind = "version" },
    ["exclusive with a route quest"] = { kind = "exclusive" },
    ["its follow-up is taken first"] = { kind = "followup" },
    ["objective not in the data"] = { kind = "unsure" },
    ["scripted objectives"] = { kind = "unsure" },
}
function M.leftOut(o)
    if not o or o.why == "free" then return nil end
    local measured = o.xp and o.added
    if o.why:find("^pays off less") or o.why == "pace" then
        return measured and { kind = "detour", xp = M.roundXP(o.xp), seconds = M.roundSeconds(o.added) } or nil
    end
    if o.why == "long detour" then
        return measured and { kind = "long", xp = M.roundXP(o.xp), seconds = M.roundSeconds(o.added) } or nil
    end
    local after = tonumber(o.why:match("^after (%d+)$"))
    if after then return { kind = "prereq", quest = after } end
    local known = OUTCOMES[o.why]
    if not known then return nil end
    local e = {}
    for k, v in pairs(known) do e[k] = v end
    return e
end

return M
