-- Class training reminder: when a class trainer's window is open, Ding notes what it offers
-- (what can be learned now, and at which level the rest comes, with its cost). From those
-- levels the window says "New spells at your class trainer (cost)", until the player visits
-- a class trainer again; a click (A in focus mode) leads to the nearest one (UI/Finder.lua).
-- Only what the trainer's list shows counts: the game's own filters are left as they are.
-- Before the first visit (nothing known yet), new spells come at even levels. Near a class
-- trainer while something waits, one chat line says so (once per level).
local _, Ding = ...
local Compat = Ding.Compat
local L = Ding.L

local TR = {}
Ding.Training = TR

local NEAR = 80                  -- yards: the player is at a class trainer
local NEAR_CHECK = 3             -- seconds between two looks for a trainer around

-- Reads the open class trainer: Ding.char.training = { now = cost learnable now,
-- future = { [level] = cost }, level = the player's level then }.
function TR:Record()
    if Compat.ProfessionTrainer() then return end
    local ok, count = Compat.Call("GetNumTrainerServices")
    count = ok and Compat.Plain(count)
    if type(count) ~= "number" then return end
    local level = UnitLevel("player")
    local now, future = 0, {}
    for i = 1, count do
        local okI, _, _, kind = Compat.Call("GetTrainerServiceInfo", i)
        local okL, req = Compat.Call("GetTrainerServiceLevelReq", i)
        local okC, cost = Compat.Call("GetTrainerServiceCost", i)
        kind, req, cost = okI and Compat.Plain(kind), okL and Compat.Plain(req), okC and Compat.Plain(cost)
        cost = type(cost) == "number" and cost or 0
        if kind == "available" then
            now = now + cost
        elseif kind == "unavailable" and type(req) == "number" and req > level then
            future[req] = (future[req] or 0) + cost
        end
    end
    Ding.char.training = { now = now, future = future, level = level }
end

-- Cost of what waits at the trainer for the player's level, or nil when nothing does;
-- true before the first visit, at an even level (the cost is unknown then).
function TR:Due()
    local t = Ding.char and Ding.char.training
    if not t then
        local level = UnitLevel("player")
        return (level >= 2 and level % 2 == 0) or nil
    end
    local level, cost, due = UnitLevel("player"), t.now or 0, (t.now or 0) > 0
    for req, c in pairs(t.future or {}) do
        if req <= level then
            cost = cost + c
            due = true
        end
    end
    return due and cost or nil
end

local function changed()
    if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
end
Ding:On("TRAINER_SHOW", function() TR:Record(); changed() end)
Ding:On("TRAINER_UPDATE", function() TR:Record(); changed() end)
Ding:On("PLAYER_LEVEL_UP", changed)

-- Near a class trainer of the player's class with spells waiting: one chat line per level.
function TR:CheckNear()
    if not (Ding.char and Ding.Services) or not self:Due() then return end
    local level = UnitLevel("player")
    if Ding.char.trainingReminded == level then return end
    local near = Ding.Services:Nearest("trainer", 1)[1]
    if near and near.distance and near.distance <= NEAR then
        Ding.char.trainingReminded = level
        Ding:Print(L.TRAINING_NEAR:format(near.name or "?"))
    end
end

local ticker = CreateFrame("Frame")
ticker.elapsed = 0
ticker:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    if self.elapsed < NEAR_CHECK then return end
    self.elapsed = 0
    Ding:Safe(TR.CheckNear, TR)
end)
