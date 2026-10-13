-- Time and XP model of the route optimizer (tools/draft_guide.lua, tools/route_solver.lua).
-- Every estimate the optimizer makes comes from here: walking speed, time per kill, quest
-- and monster XP, grinding rate. The values are our own estimates from public game
-- mechanics, gathered in PARAMS so that they can be recalibrated with the real step timings
-- Ding records in game (DingDB.timings, docs/SPEC.md §4-5).
--
-- Units: world coordinates in yards (the game's own unit, shared by every map of a
-- continent), times in seconds, XP in points.
local M = {}

M.PARAMS = {
    -- Movement
    runSpeed = 7.0,          -- yards per second on foot
    mountLevel = 40,         -- first mount, 60 % faster
    mountSpeed = 11.2,
    detour = 1.25,           -- paths are not straight lines: roads, slopes, monsters to avoid
    flightLevel = 14,        -- from this level a long trip may take a flight path instead
    flightSpeed = 30,        -- yards per second on a flight path
    flightDetour = 1.3,      -- flight paths follow their own roads, from hub to hub
    flightOverhead = 45,     -- seconds: talk to the flight master, take off, land (the walk to
                             -- the flight master is counted apart, tools/route_travel.lua)
    boatTime = 150,          -- seconds: wait for and ride a boat between two land masses
    otherMapTime = 300,      -- seconds: trip to a map whose geometry is unknown
    -- Hearthstone (tools/route_solver.lua): back to the bound inn, once an hour.
    hearthTime = 30,         -- seconds: the 10-second cast and the loading screen
    hearthCooldown = 3600,
    hearthGain = 60,         -- used only when it saves this many seconds at least
    -- Quest givers
    npcTime = 8,             -- seconds to accept or turn in one quest (dialog, reading)
    -- Objectives
    fightBase = 22,          -- seconds per kill: fight, loot and rest...
    fightPerLevel = 0.4,     -- ...longer at higher levels
    objectTime = 5,          -- seconds to loot or use an object
    respawnTime = 300,       -- seconds before a monster or an object comes back
    minSpacing = 15,         -- yards between two spawns of a group, at least...
    maxSpacing = 120,        -- ...and at most
    defaultKills = 8,        -- counts when the objective text gives none
    defaultItems = 8,
    defaultObjects = 6,
    defaultDropRate = 0.6,   -- quest item drop chance when QuestieDB has no figure
    maxObjectiveKills = 60,  -- kills for one item objective, at most: beyond, the count or the
                             -- drop rate is more likely wrong than the quest that slow
    minStartDropRate = 0.10, -- quest-starting items rarer than this are left out
    -- Levels (Yendi's rule, 12/10/2026): a quest at most questAbove levels above the
    -- player (its required level is never above the player's: the game refuses it), its
    -- monsters at most mobAbove levels above the player (the average of their level range).
    -- A quest up to +2 is still yellow, done solo at a normal pace; a +2 monster already hits
    -- much harder.
    questAbove = 2,
    mobAbove = 1,
    -- A grinding stop inside a guide ("Finish the level on nearby monsters") is a wall. For
    -- a quest that a later guide needs (pinned: the search never drops it), the stops of one
    -- guide add up to this many seconds at most, so that one such quest cannot drag the
    -- guide into hours of grinding (Tanaris before: 33 h of stops, one level at a time).
    -- Out of reach, it waits for a later guide. Other quests: route_solver.lua weighs each
    -- stop (S.PARAMS.grindStepPenalty).
    maxGrindStop = 3600,
    -- Share of the estimated XP used to simulate the level. Quest XP from QuestieDB's
    -- QuestXP table is the game's own figure (Forever keeps Classic's): counted in full.
    -- Kill XP, 20-75 % of a tour, rests on estimates (default counts, drop rates, the
    -- monsters' levels), and so does the XP of a quest missing from the table (some Forever
    -- quests): counted at 90 %. The player also kills monsters on the way, which the model
    -- ignores, so the real kill XP is rarely lower; the margin only keeps the simulated
    -- player from running ahead of the real one. With quests allowed up to +2, a player half
    -- a level behind the simulation still takes them at +2.5 at worst. (0.85 on every XP
    -- until 12/10/2026: 15 % of the quests' exact XP was planned as grinding instead.)
    killXPMargin = 0.9,
    -- Grinding: what a player does when quests run out, and the bar a quest must beat.
    -- Kills at the pace of a quest (fight, loot, rest), the walk between two monsters of a
    -- dense spot, plus the search for fresh ones: Ding does not show grinding spots yet, the
    -- player finds their own, shared with others on a fresh realm. Not calibrated yet (too few
    -- DingDB.timings): 6 400 XP/h at level 10, 9 100 at 20, 14 100 at 40, 17 600 at 60
    -- (before killXPMargin), 40-70 % of a questing tour's pace in the generated guides.
    grindSpacing = 40,       -- yards between two monsters of a grinding spot
    grindSearch = 20,        -- seconds per kill to find fresh monsters (others farm too)
}

-- XP needed to go from each level to the next (Classic table).
M.XP_TO_LEVEL = {
    400, 900, 1400, 2100, 2800, 3600, 4500, 5400, 6500, 7600,
    8800, 10100, 11400, 12900, 14400, 16000, 17700, 19400, 21300, 23200,
    25200, 27300, 29400, 31700, 34000, 36400, 38900, 41400, 44300, 47400,
    50800, 54500, 58600, 62800, 67100, 71600, 76100, 80800, 85700, 90700,
    95800, 101000, 106300, 111800, 117500, 123200, 129100, 135100, 141200, 147500,
    153900, 160400, 167100, 173900, 180800, 187900, 195000, 202300, 209800,
}
M.MAX_LEVEL = #M.XP_TO_LEVEL + 1

---------------------------------------------------------------------------
-- Levels
---------------------------------------------------------------------------
-- Adds XP to a level and the XP inside it; returns the new level and XP.
function M.addXP(level, xp, amount)
    xp = xp + amount
    while M.XP_TO_LEVEL[level] and xp >= M.XP_TO_LEVEL[level] do
        xp = xp - M.XP_TO_LEVEL[level]
        level = level + 1
    end
    return level, xp
end

-- XP still needed to reach `target` (0 %) from `level` and the XP inside it.
function M.xpTo(level, xp, target)
    local need = -xp
    for l = level, target - 1 do need = need + (M.XP_TO_LEVEL[l] or 0) end
    return math.max(0, need)
end

-- Highest level shown grey (no XP) to a player of this level: Classic formula, also used
-- by Ding's engine to skip grey quests (Core/Compat.lua, IsQuestGrey).
function M.greyLevel(level)
    if level <= 5 then return 0 end
    if level <= 39 then return level - math.floor(level / 10) - 5 end
    return level - math.floor(level / 5) - 1
end

function M.isQuestGrey(questLevel, level)
    return questLevel > 0 and questLevel <= M.greyLevel(level)
end

---------------------------------------------------------------------------
-- XP
---------------------------------------------------------------------------
-- Level gap that brings a lower monster's XP to zero (Classic "zero difference" table).
local function zeroDifference(level)
    if level <= 7 then return 5 elseif level <= 9 then return 6 elseif level <= 11 then return 7
    elseif level <= 15 then return 8 elseif level <= 19 then return 9 elseif level <= 29 then return 11
    elseif level <= 39 then return 12 elseif level <= 44 then return 13 elseif level <= 49 then return 14
    elseif level <= 54 then return 15 elseif level <= 59 then return 16 end
    return 17
end

-- XP for killing a normal monster of mobLevel at the player's level (Classic formula).
function M.mobXP(mobLevel, level)
    if mobLevel <= M.greyLevel(level) then return 0 end
    local base = 45 + 5 * level
    if mobLevel >= level then
        return base * (1 + 0.05 * math.min(4, mobLevel - level))
    end
    return base * (1 - (level - mobLevel) / zeroDifference(level))
end

-- Quest XP at the player's level: full up to 5 levels above the quest, then 20 % less per
-- level, 10 % from 10 levels above (Classic).
function M.questXP(baseXP, questLevel, level)
    if questLevel <= 0 then return baseXP end
    local diff = level - questLevel
    -- Integer steps (tenths): 0.2 is not exact in floating point.
    if diff >= 10 then return math.floor(baseXP / 10) end
    if diff >= 6 then return math.floor(baseXP * (10 - 2 * (diff - 5)) / 10) end
    return baseXP
end

-- Quest XP when QuestieDB has no figure for the quest.
function M.defaultQuestXP(questLevel)
    return math.floor(70 + 22 * questLevel + 1.6 * questLevel * questLevel)
end

-- Typical level of a group of monsters (average of their level ranges): the level checked
-- against the player's.
function M.monsterLevel(mobLevel)
    return mobLevel and math.floor(mobLevel) or 0
end

-- Lowest player level allowed to take a quest: its required level, and its own level
-- minus questAbove (a quest further above the player is not worth sending the player to).
function M.levelFor(questLevel, requiredLevel, questAbove)
    local need = requiredLevel or 0
    if questLevel and questLevel > 0 then need = math.max(need, questLevel - (questAbove or M.PARAMS.questAbove)) end
    return need
end

-- XP per second when grinding monsters of the player's level: the rate a quest must beat.
function M.grindRate(level)
    local P = M.PARAMS
    return M.mobXP(level, level) / (M.targetTime(level, P.grindSpacing, false) + P.grindSearch)
end

---------------------------------------------------------------------------
-- Time
---------------------------------------------------------------------------
function M.speed(level)
    local P = M.PARAMS
    return level >= P.mountLevel and P.mountSpeed or P.runSpeed
end

-- Straight-line distance in yards between two world points ({ x, y, region }), or nil when
-- they are not on the same land mass.
function M.distance(a, b)
    if a.region ~= b.region then return nil end
    local dx, dy = a.x - b.x, a.y - b.y
    return math.sqrt(dx * dx + dy * dy)
end

-- Seconds to go from a to b at this level, and the distance walked (yards). Land masses of
-- one continent are linked by boats; anything else is a fixed trip.
function M.travel(a, b, level)
    if not a or not b then return 0, 0 end
    local P = M.PARAMS
    local d = M.distance(a, b)
    local extra = 0
    if not d then
        if a.continent ~= b.continent or not a.continent then return P.otherMapTime, 0 end
        local dx, dy = a.x - b.x, a.y - b.y
        d = math.sqrt(dx * dx + dy * dy)
        extra = P.boatTime
    end
    local walk = d * P.detour / M.speed(level)
    if level >= P.flightLevel then
        walk = math.min(walk, P.flightOverhead + d / P.flightSpeed)
    end
    return walk + extra, d
end

-- Seconds per target for a group of spawns `spacing` yards apart: the fight (or the loot)
-- plus the walk to the next one.
function M.targetTime(level, spacing, object)
    local P = M.PARAMS
    local act = object and P.objectTime or (P.fightBase + P.fightPerLevel * level)
    return act + spacing * P.detour / M.speed(level)
end

-- Seconds to get `count` targets out of a group of `spawns` spawns: once every spawn is
-- used, each further target waits for a respawn (shared by the group).
function M.workTime(level, count, spawns, spacing, object)
    local per = M.targetTime(level, spacing, object)
    local t = count * per
    spawns = math.max(1, spawns)
    if count > spawns then
        t = t + (count - spawns) * math.max(0, M.PARAMS.respawnTime / spawns - per)
    end
    return t
end

return M
