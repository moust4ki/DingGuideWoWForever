-- How a quest's objectives are done, shared by tools/draft_guide.lua and tools/write_leveling.lua:
-- the spawn groups of each job (monsters, objects, places) and the ways to chain them.
-- usage: local Work = dofile(tools .. "/route_work.lua").new(D)   (D: route_data.lua)
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local Model = dofile(here .. "/route_model.lua")

local M = {}
M.GIVER_RADIUS = 30  -- yards: spawns of a quest giver closer than this are one spot
M.WORK_RADIUS = 120  -- yards: radius of the area worked for an objective

function M.new(D)
    local W = {}

    -- Spots of a quest giver or ender: its spawns, close ones merged (nil when none).
    function W.spots(points)
        if #points == 0 then return nil end
        local out = {}
        for _, c in ipairs(D.clusters(points, M.GIVER_RADIUS, 4)) do out[#out + 1] = c.at end
        return out
    end

    -- Spawn groups of a job: the densest ones, plus those of its weakest monsters (within a
    -- level of the lowest) when the job mixes monsters of several levels: the densest groups
    -- may all be of the strongest ones, out of the player's reach.
    function W.jobGroups(job, radius)
        local groups = D.clusters(job.points, radius, 4)
        if job.kind ~= "kill" then return groups end
        local low
        for _, p in ipairs(job.points) do
            if p.mobLevel and (not low or p.mobLevel < low) then low = p.mobLevel end
        end
        local weak = {}
        for _, p in ipairs(job.points) do
            if p.mobLevel and p.mobLevel <= low + 1 then weak[#weak + 1] = p end
        end
        if #weak == 0 or #weak == #job.points then return groups end
        for _, c in ipairs(D.clusters(weak, radius, 2)) do
            local free = true
            for _, g in ipairs(groups) do
                local d = Model.distance(c.at, g.at)
                if d and d < radius and g.mobLevel and c.mobLevel and g.mobLevel <= c.mobLevel + 1 then free = false end
            end
            if free then groups[#groups + 1] = c end
        end
        return groups
    end

    -- Ways to do the objectives of a quest: each job (monster, object, place) in one of its
    -- spawn groups; several jobs are chained nearest first from the longest one.
    -- trip(a, b, level) -> seconds, yards.
    function W.workOptions(jobs, level, trip)
        local per = {}
        for j, job in ipairs(jobs) do
            local radius = job.kind == "explore" and M.GIVER_RADIUS or M.WORK_RADIUS
            local list = {}
            for _, c in ipairs(W.jobGroups(job, radius)) do
                -- The monsters' level where this group is: the player picks the group in reach.
                local o = { at = c.at, time = 0, kills = 0, perKill = 0, npc = job.npc, mobLevel = c.mobLevel or job.mobLevel }
                if job.kind == "kill" then
                    o.time = Model.workTime(level, job.count, c.n, c.spacing, false)
                    o.kills, o.perKill = job.count, Model.targetTime(level, c.spacing, false)
                elseif job.kind == "object" then
                    o.time = Model.workTime(level, job.count, c.n, c.spacing, true)
                elseif job.kind == "vendor" then
                    o.time = Model.PARAMS.npcTime
                end
                list[#list + 1] = o
            end
            per[j] = list
        end
        local function jobOf(o) return { npc = o.npc, kills = o.kills, mobLevel = o.mobLevel, perKill = o.perKill } end
        local options = {}
        if #jobs == 1 then
            for _, o in ipairs(per[1]) do
                options[#options + 1] = { entry = o.at, exit = o.at, time = o.time, dist = 0, jobs = { jobOf(o) } }
            end
            return options
        end
        local anchor = 1
        for j = 2, #jobs do
            if per[j][1].time > per[anchor][1].time then anchor = j end
        end
        for _, first in ipairs(per[anchor]) do
            local cur, t, dist, chosen = first.at, first.time, 0, { jobOf(first) }
            local left = {}
            for j = 1, #jobs do if j ~= anchor then left[#left + 1] = j end end
            while #left > 0 do
                local bestN, bestO, bestC, bestD
                for n, j in ipairs(left) do
                    for _, o in ipairs(per[j]) do
                        local tt, d = trip(cur, o.at, level)
                        local c = tt + o.time
                        if not bestC or c < bestC - 1e-9 then bestN, bestO, bestC, bestD = n, o, c, d end
                    end
                end
                table.remove(left, bestN)
                t, dist, cur = t + bestC, dist + bestD, bestO.at
                chosen[#chosen + 1] = jobOf(bestO)
            end
            options[#options + 1] = { entry = first.at, exit = cur, time = t, dist = dist, jobs = chosen }
        end
        return options
    end

    return W
end

return M
