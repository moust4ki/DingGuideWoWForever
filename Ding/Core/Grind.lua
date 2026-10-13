-- Guided grinding, for the level steps: the experience left to the step's level, about how
-- many kills that makes (from the player's own recent kills, rested experience included),
-- and where to kill: monsters around the player's level near the next steps, those a quest
-- of the log or of the coming steps needs first (QuestieDB spawns, through Core/Data.lua).
local _, Ding = ...
local Compat = Ding.Compat

local G = {}
Ding.Grind = G

-- Classic experience from one level to the next ([level] = experience to level + 1).
local XP_TO_LEVEL = {
    400, 900, 1400, 2100, 2800, 3600, 4500, 5400, 6500, 7600,
    8800, 10100, 11400, 12900, 14400, 16000, 17700, 19400, 21300, 23200,
    25200, 27300, 29400, 31700, 34000, 36400, 38900, 41400, 44300, 47400,
    50800, 54500, 58600, 62800, 67100, 71600, 76100, 80800, 85700, 90700,
    95800, 101000, 106300, 111800, 117500, 123200, 129100, 135100, 141200, 147500,
    153900, 160400, 167100, 173900, 180800, 187900, 195000, 202300, 209800,
}
G.XP_TO_LEVEL = XP_TO_LEVEL

local MAX_SAMPLES = 30     -- kills remembered per character
local QUEST_WINDOW = 1.5   -- seconds around a turn-in: that experience is the quest's
local MAX_RATIO = 3        -- above 3 monsters of the player's level: a quest or a discovery
local SPOT_TTL = 15        -- seconds before the grinding spot is chosen again
local LOOKAHEAD, LOOKBACK = 15, 15  -- steps whose monsters are worth farming

-- Experience of a normal monster of the player's level (Classic formula, Azeroth). Kills are
-- remembered as a ratio of it, so that they stay valid from one level to the next.
local function sameLevelXP(level) return 5 * level + 45 end
G.SameLevelXP = sameLevelXP

---------------------------------------------------------------------------
-- Kills: the experience of each one, rested bonus removed
---------------------------------------------------------------------------
local function samples()
    Ding.char.killXP = Ding.char.killXP or {}
    return Ding.char.killXP
end

local function median(list)
    local sorted = {}
    for i, v in ipairs(list) do sorted[i] = v end
    table.sort(sorted)
    local n = #sorted
    if n == 0 then return nil end
    if n % 2 == 1 then return sorted[(n + 1) / 2] end
    return (sorted[n / 2] + sorted[n / 2 + 1]) / 2
end

-- Experience of one kill at this level without rested bonus, and the number of kills it
-- is measured on (0: the Classic formula for a monster of the player's level).
function G:KillXP(level)
    local list = samples()
    local ratio = median(list) or 1
    return math.max(1, math.floor(sameLevelXP(level) * ratio + 0.5)), #list
end

local last           -- { level, xp, max, rested } at the last experience update
local lastTurnIn     -- time of the last quest turned in
local pending = {}   -- kills of the last seconds: { t, ratio, gained, timing }

-- A kill is kept once no turn-in came within QUEST_WINDOW of it (the server sends the
-- quest's experience and its turn-in in either order).
local function commit(kill)
    if lastTurnIn and math.abs(lastTurnIn - kill.t) <= QUEST_WINDOW then return end
    local list = samples()
    list[#list + 1] = math.floor(kill.ratio * 1000 + 0.5) / 1000
    while #list > MAX_SAMPLES do table.remove(list, 1) end
    -- The kills left of a level step on screen follow the new measure.
    local E = Ding.Engine
    local step = E:CurrentStep()
    if step and step.level then Ding:Safe(E.Refresh, E) end
end

local function read()
    local xp, max, rested = Compat.PlayerXP()
    if not xp then return nil end
    return { level = UnitLevel("player"), xp = xp, max = max, rested = rested }
end

function G:OnXP()
    local now = read()
    if not now then return end
    local before = last
    last = now
    if not before then return end
    local gained
    if now.level == before.level then
        gained = now.xp - before.xp
    elseif now.level == before.level + 1 then
        gained = before.max - before.xp + now.xp
    end
    if not gained or gained <= 0 then return end
    -- Rested, a kill gives twice its experience: the bonus is never more than the kill's
    -- own share, nor more than the rested pool had. Rest still left after the kill: the
    -- bonus was whole.
    local restedBefore = now.rested > 0 and math.huge or (before.rested or 0)
    local base = math.max(gained / 2, gained - restedBefore)
    local ratio = base / sameLevelXP(before.level)
    if ratio > MAX_RATIO then return end
    local t = GetTime()
    if lastTurnIn and t - lastTurnIn <= QUEST_WINDOW then return end
    local kill = { t = t, ratio = ratio, gained = gained, timing = Ding.Timing:OnKill(gained) }
    pending[#pending + 1] = kill
    C_Timer.After(QUEST_WINDOW, function()
        for i, k in ipairs(pending) do
            if k == kill then table.remove(pending, i) break end
        end
        commit(kill)
    end)
end

-- Experience that came with a turn-in is the quest's, not a kill.
function G:OnTurnIn()
    lastTurnIn = GetTime()
    for _, kill in ipairs(pending) do
        if lastTurnIn - kill.t <= QUEST_WINDOW then Ding.Timing:CancelKill(kill.timing, kill.gained) end
    end
end

-- Rested experience earned at an inn: the next kill compares with it.
function G:OnRested()
    local now = read()
    if last and now and now.level == last.level and now.xp == last.xp then last.rested = now.rested end
end

---------------------------------------------------------------------------
-- What is left to the level of a step
---------------------------------------------------------------------------
-- { missing = experience left, percent = 0-99 of the current level, kills = about how many,
--   rested = true when the rested bonus shortens them, measured = kills measured } or nil
-- (level reached, or experience unknown).
-- Experience needed into level `whole` for a `level` step: its `xp`, or the fraction of
-- `level = 12.5` (of that level's experience), else 0.
function G:Into(step, maxNow)
    local whole = math.floor(step.level)
    if step.xp then return whole, step.xp end
    local frac = step.level - whole
    if frac <= 0 then return whole, 0 end
    local size = (whole == UnitLevel("player") and maxNow) or XP_TO_LEVEL[whole] or 0
    return whole, math.floor(frac * size)
end

-- Experience and kills left to reach level `target` (plus `into` experience into it).
function G:Status(target, into)
    local level = UnitLevel("player")
    into = into or 0
    if not target or level > target or (level == target and into <= 0) then return nil end
    local xp, max, rested = Compat.PlayerXP()
    if not xp then return nil end
    local missing
    if level == target then
        missing = into - xp
        if missing <= 0 then return nil end
    else
        missing = math.max(0, max - xp)
        for l = level + 1, target - 1 do missing = missing + (XP_TO_LEVEL[l] or 0) end
        missing = missing + into
    end
    local perKill, measured = self:KillXP(level)
    -- Rested, each kill brings twice its experience and uses as much of the pool.
    local kills = math.ceil(math.max(missing - rested, missing / 2) / perKill)
    return {
        missing = missing,
        percent = math.min(99, math.floor(xp / max * 100)),
        kills = math.max(1, kills),
        rested = rested > 0,
        measured = measured,
    }
end

---------------------------------------------------------------------------
-- Where to grind
---------------------------------------------------------------------------
local npcPoints = {}    -- [npc] = spawns as points, with their world position (session cache)

local function pointsOf(npc)
    local points = npcPoints[npc]
    if not points then
        points = Ding.Data:NpcPoints(npc)
        for _, p in ipairs(points) do
            p.area = true
            local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
            p.continent, p.wx, p.wy = c or false, wx, wy
        end
        npcPoints[npc] = points
    end
    return points
end

-- Nearest of the points to a world position on that continent: point, distance.
local function nearest(points, continent, x, y)
    local best, bestD
    for _, p in ipairs(points) do
        if p.continent == continent and p.wx then
            local d = (p.wx - x) ^ 2 + (p.wy - y) ^ 2
            if not bestD or d < bestD then best, bestD = p, d end
        end
    end
    return best, bestD and math.sqrt(bestD)
end

local FACTION_LETTER = { Alliance = "A", Horde = "H" }

-- Worth killing at this level: gives experience (not grey), at most 2 levels above, not an
-- elite nor a boss, and not on the player's side ("A" or "H": the peons a quest wakes up).
-- QuestieDB marks the neutral beasts "AH": those are fine.
local function fits(info, level)
    if not info or info.rank == 1 or info.rank == 2 or info.rank == 3 then return false end
    local letter = FACTION_LETTER[UnitFactionGroup("player")]
    if letter and info.friendly == letter then return false end
    return info.maxLevel > Compat.GreyLevel(level) and info.minLevel <= level + 2
end

-- Levels below the player's at which a monster stops giving experience ("zero
-- difference", Classic).
local function zeroDifference(level)
    if level <= 7 then return 5 end
    if level <= 9 then return 6 end
    if level <= 11 then return 7 end
    if level <= 15 then return 8 end
    if level <= 19 then return 9 end
    if level <= 29 then return 11 end
    if level <= 39 then return 12 end
    if level <= 44 then return 13 end
    if level <= 49 then return 14 end
    if level <= 54 then return 15 end
    if level <= 59 then return 16 end
    return 17
end

-- Experience of a monster of these levels, as a share of one of the player's level (Classic
-- formula): +5 % per level above (4 at most), down to nothing at the zero difference.
local function xpShare(info, level)
    local diff = (info.minLevel + info.maxLevel) / 2 - level
    if diff >= 0 then return 1 + 0.05 * math.min(diff, 4) end
    return math.max(0, 1 + diff / zeroDifference(level))
end

local YARDS_PER_KILL = 140   -- a kill (finding the monster, the fight, the rest) as a walk: ~20 s

-- Cost of farming a monster, in yards: the trip there (and half the trip on to the next
-- place), plus the kills left, more of them when the monster gives less experience;
-- riskier above the player's level, cheaper for a quest's monsters (they count twice).
local function cost(info, level, distance, onward, weight, kills)
    local share = xpShare(info, level)
    if share < 0.1 then return nil end
    local risk = (info.minLevel + info.maxLevel) / 2 > level + 1 and 1.3 or 1
    return (distance + onward / 2 + YARDS_PER_KILL * kills / share) * weight * risk
end

-- Monsters the guide has to do with around this step: { npc, weight, quest, objective }.
-- Weight: 0.5 for a quest of the log still to complete (each kill counts twice), 0.8 for
-- the coming steps, 1 for the steps just done (the player is in their area).
local function candidates(index)
    local E = Ding.Engine
    local steps = E.guide.steps
    local found, list = {}, {}
    local function add(npc, weight, quest, objective)
        local c = found[npc]
        if c then
            if weight < c.weight then c.weight, c.quest, c.objective = weight, quest, objective end
            return
        end
        c = { npc = npc, weight = weight, quest = quest, objective = objective }
        found[npc], list[#list + 1] = c, c
    end
    for _, q in ipairs(Ding.Engine:LogQuests()) do
        if not E:IsReady(q) then
            for _, o in ipairs(Ding.Data:ObjectiveNpcs(q)) do
                if not E:ObjectiveDone(q, o.name) then add(o.npc, 0.5, q, o.name) end
            end
        end
    end
    local function stepQuests(i, weight)
        local step = steps[i]
        if not step or not Ding:StepApplies(step) then return end
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            for _, q in ipairs(step[key] or {}) do
                if not E:IsReady(q) then
                    for _, o in ipairs(Ding.Data:ObjectiveNpcs(q)) do add(o.npc, weight) end
                end
            end
        end
    end
    for i = index + 1, math.min(#steps, index + LOOKAHEAD) do stepQuests(i, 0.8) end
    for i = index - 1, math.max(1, index - LOOKBACK), -1 do stepQuests(i, 1) end
    return list
end

-- First place the guide goes to after this step, to grind on the way there.
local function nextPlace(index, continent, x, y)
    local E = Ding.Engine
    local steps = E.guide.steps
    for i = index + 1, math.min(#steps, index + LOOKAHEAD) do
        local step = steps[i]
        if Ding:StepApplies(step) and not step.level then
            local points = E:Candidates(step, i)
            if #points > 0 then
                for _, p in ipairs(points) do
                    if p.continent == nil then
                        local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
                        p.continent, p.wx, p.wy = c or false, wx, wy
                    end
                end
                return nearest(points, continent, x, y)
            end
        end
    end
    return nil
end

-- What the choice depends on in the quest log: its quests, ready or not, and how many of
-- their objectives are done.
local function logKey()
    local parts = {}
    for _, q in ipairs(Ding.Engine:LogQuests()) do
        local done = 0
        for _, obj in ipairs(Compat.GetObjectives(q)) do
            if obj.finished then done = done + 1 end
        end
        parts[#parts + 1] = q .. (Compat.IsQuestReady(q) and "r" or "") .. done
    end
    return table.concat(parts, ",")
end

-- The monster to farm for the level step at `index`: { npc, name, minLevel, maxLevel,
-- quest, objective, points } or nil. Chosen again when the step, the level or the quest log
-- changes, and every SPOT_TTL seconds as the player moves.
function G:Spot(index)
    local E = Ding.Engine
    if not E.guide then return nil end
    local level = UnitLevel("player")
    local key = E.guide.id .. ":" .. index .. ":" .. level .. ":" .. logKey()
    local cache = self.cache
    if cache and cache.key == key and GetTime() - cache.t < SPOT_TTL then return cache.spot end
    local spot
    local continent, px, py = Compat.GetPlayerWorld()
    if continent then
        local after = nextPlace(index, continent, px, py)
        local step = E.guide.steps[index]
        local status = step and step.level and self:Status(self:Into(step))
        local kills = status and status.kills or 10
        local bestCost
        for _, c in ipairs(candidates(index)) do
            local info = Ding.Data:NpcInfo(c.npc)
            if fits(info, level) then
                local spawn, d = nearest(pointsOf(c.npc), continent, px, py)
                if spawn then
                    local onward = 0
                    if after then onward = math.sqrt((spawn.wx - after.wx) ^ 2 + (spawn.wy - after.wy) ^ 2) end
                    local value = cost(info, level, d, onward, c.weight, kills)
                    if value and (not bestCost or value < bestCost) then
                        bestCost = value
                        spot = { npc = c.npc, name = Ding.Data:NpcName(c.npc), minLevel = info.minLevel,
                            maxLevel = info.maxLevel, quest = c.quest, objective = c.objective,
                            points = pointsOf(c.npc) }
                    end
                end
            end
        end
    end
    self.cache = { key = key, t = GetTime(), spot = spot }
    self.spot = spot
    return spot
end

-- Forgets the spot and the kills in flight; the experience baseline is read again.
function G:Reset()
    self.cache, self.spot = nil, nil
    pending, lastTurnIn = {}, nil
    last = read()
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
Ding:On("PLAYER_ENTERING_WORLD", function() last = read() end)
Ding:On("PLAYER_XP_UPDATE", function() G:OnXP() end)
Ding:On("UPDATE_EXHAUSTION", function() G:OnRested() end)
Ding:On("QUEST_TURNED_IN", function() G:OnTurnIn() end)
