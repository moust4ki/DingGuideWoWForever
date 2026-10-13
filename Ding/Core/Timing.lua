-- Records how long each step really takes, for the offline optimizer.
-- Stored in DingDB.timings[guideId][stepIndex] = { sample, ... }, the last 20 per step:
--   [1] seconds, [2] level and [3] experience at the start, [4] level and [5] experience at
--   the end, [6] date "YYYY-MM-DD" (older samples have only these six);
--   map = UiMapID where the step ended, deaths, kills and killXP (experience of the kills
--   during the step, rested bonus included), levelStep = true for a `level` step,
--   step = what the step asks ("a456,458 c456 t457 l12 g"), to find it again once the
--   guide is regenerated and its steps move.
local _, Ding = ...

local T = {}
Ding.Timing = T

local MAX_SAMPLES = 20
local MAX_DURATION = 3600          -- longer than this means the player was away
local MAX_LEVEL_DURATION = 4 * 3600 -- a level step can take hours of grinding

-- Short description of a step's actions: its signature in the samples.
local function describe(step)
    if type(step) ~= "table" then return nil end
    local parts = {}
    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        local ids = step[key]
        if ids and #ids > 0 then
            local list = {}
            for i, q in ipairs(ids) do list[i] = tostring(q) end
            parts[#parts + 1] = key:sub(1, 1) .. table.concat(list, ",")
        end
    end
    if step.level then parts[#parts + 1] = "l" .. step.level end
    for _, key in ipairs({ "go", "fly", "hearth", "sethearth", "train", "vendor", "repair" }) do
        if step[key] then parts[#parts + 1] = key == "go" and "g" or key end
    end
    return table.concat(parts, " ")
end
T.Describe = describe

function T:Start(guideId, index)
    local guide = Ding:GetGuide(guideId)
    local step = guide and guide.steps[index]
    self.current = {
        guide = guideId,
        index = index,
        t = GetTime(),
        level = UnitLevel("player"),
        xp = Ding.Compat.PlayerXP() or 0,
        deaths = 0,
        kills = 0,
        killXP = 0,
        levelStep = step and step.level and true or nil,
        step = describe(step),
    }
end

-- Called when the active step is finished during play.
function T:Finish(guideId, index)
    local cur = self.current
    self.current = nil
    if not cur or cur.guide ~= guideId or cur.index ~= index then return end
    local sec = GetTime() - cur.t
    if sec <= 0 or sec > (cur.levelStep and MAX_LEVEL_DURATION or MAX_DURATION) then return end

    local timings = Ding.db.timings
    timings[guideId] = timings[guideId] or {}
    local samples = timings[guideId][index] or {}
    timings[guideId][index] = samples
    samples[#samples + 1] = {
        math.floor(sec + 0.5), cur.level, cur.xp,
        UnitLevel("player"), Ding.Compat.PlayerXP() or 0, date("%Y-%m-%d"),
        map = Ding.Compat.PlayerMap(),
        deaths = cur.deaths,
        kills = cur.kills,
        killXP = cur.killXP,
        levelStep = cur.levelStep,
        step = cur.step,
    }
    while #samples > MAX_SAMPLES do table.remove(samples, 1) end
end

-- A step skipped, rewound or caught up automatically is not measured.
function T:Cancel()
    self.current = nil
end

-- A kill during the step (Core/Grind.lua); returns the measure it counts in, so that a
-- turn-in arriving just after can take it back (CancelKill).
function T:OnKill(xp)
    local cur = self.current
    if not cur then return nil end
    cur.kills = cur.kills + 1
    cur.killXP = cur.killXP + xp
    return cur
end

function T:CancelKill(cur, xp)
    if not cur then return end
    cur.kills = math.max(0, cur.kills - 1)
    cur.killXP = math.max(0, cur.killXP - (xp or 0))
end

Ding:On("PLAYER_DEAD", function()
    if T.current then T.current.deaths = T.current.deaths + 1 end
end)
