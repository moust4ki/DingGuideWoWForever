-- "Along the way": the objectives of other quests of the log whose monsters or items are
-- right around the player, listed under the current step so that the player kills what is
-- in front of them. The guide's next quests come first. An objective joins the list within
-- ENTER yards of one of its targets and stays until the player is LEAVE yards away (no
-- flicker at the edge), it is done, or its quest leaves the log.
local _, Ding = ...
local Compat = Ding.Compat

local AW = {}
Ding.Along = AW

local ENTER, LEAVE = 100, 160   -- yards
local MAX_ROWS = 3
local INTERVAL = 2              -- seconds between two looks around the player

AW.entries = {}   -- unfinished objectives of other log quests: { quest, index, key, points }
AW.shown = {}     -- the ones near the player, in guide order: what the window lists

local targetsOf = {}   -- [quest] = QuestieDB objective targets, with world positions

local function targets(q)
    local list = targetsOf[q]
    if not list then
        list = Ding.Data:ObjectiveTargets(q)
        for _, target in ipairs(list) do
            for _, p in ipairs(target.points) do
                local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
                p.continent, p.wx, p.wy = c or false, wx, wy
            end
        end
        targetsOf[q] = list
    end
    return list
end

local function finished(obj)
    if obj.finished then return true end
    local have, need = tonumber(obj.numFulfilled), tonumber(obj.numRequired)
    return have ~= nil and need ~= nil and need > 0 and have >= need
end

local function hasPoints(target) return #target.points > 0 end

-- The quests the current step works on: its own, and the missing link of their chains
-- ({ [quest] = true }; shared with Ding.QuestMobs).
function AW:StepQuests()
    local E = Ding.Engine
    local step = E:CurrentStep()
    local set = {}
    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        for _, q in ipairs(step and step[key] or {}) do
            set[q] = true
            local p = E:CatchUp(q, step)
            if p then set[p] = true end
        end
    end
    return set
end

-- The unfinished objectives of a quest of the log, each with the database target its text
-- names: { { index, objective (Compat.GetObjectives), target } }. `accept(target)`, when
-- given, leaves out the targets it refuses (shared with Ding.QuestMobs).
function AW:Objectives(q, accept)
    local out = {}
    for i, obj in ipairs(Compat.GetObjectives(q)) do
        local text = obj.text and obj.text:lower()
        if text and text ~= "" and not finished(obj) then
            for _, target in ipairs(targets(q)) do
                local name = target.name and target.name:lower()
                if name and name ~= "" and text:find(name, 1, true) and (not accept or accept(target)) then
                    out[#out + 1] = { index = i, objective = obj, target = target }
                    break
                end
            end
        end
    end
    return out
end

-- Quests of the log in the order the guide does them (the next steps first), then the
-- others; without those the current step works on.
local function orderedQuests(E)
    local skip, seen, out = AW:StepQuests(), {}, {}
    local inLog = {}
    local logQuests = E:LogQuests()
    for _, q in ipairs(logQuests) do inLog[q] = true end
    local steps = E.guide.steps
    for i = E.index, #steps do
        local s = steps[i]
        for _, key in ipairs({ "complete", "turnin" }) do
            for _, q in ipairs(s[key] or {}) do
                if inLog[q] and not skip[q] and not seen[q] then
                    seen[q] = true
                    out[#out + 1] = q
                end
            end
        end
    end
    for _, q in ipairs(logQuests) do
        if not skip[q] and not seen[q] then
            seen[q] = true
            out[#out + 1] = q
        end
    end
    return out
end

-- The unfinished objectives of the log, matched to their targets by name.
function AW:Rebuild()
    local E = Ding.Engine
    local entries = {}
    self.entries = entries
    if not E.guide or E.finished or not Ding.Data.available then return end
    local current = E:CurrentStep()
    local grind = current and current.level and Ding.Grind.spot
    -- Persistent objectives (a step's `sticky`): listed wherever the player is, except a
    -- quest the next step still to do works on: it comes right after, and listed now, far
    -- from its monsters, its rows read as the step's (in game, "The Cursed Crew" under the
    -- step that makes it sticky, the one before its own). Among its monsters, it is an
    -- ordinary along-the-way row.
    local sticky = {}
    for _, q in ipairs(E:StickyQuests()) do sticky[q] = true end
    local nextStep = E:NextSteps(1)[1]
    for _, key in ipairs({ "complete", "turnin" }) do
        for _, q in ipairs(nextStep and nextStep[key] or {}) do sticky[q] = nil end
    end
    for _, q in ipairs(orderedQuests(E)) do
        if not E:IsReady(q) then
            for _, o in ipairs(self:Objectives(q, hasPoints)) do
                -- The monster the level step already sends the player to.
                local same = grind and grind.quest == q and grind.objective == o.target.name
                if not same then
                    entries[#entries + 1] = { quest = q, index = o.index, key = q .. ":" .. o.index,
                        points = o.target.points, sticky = sticky[q] or nil }
                end
            end
        end
    end
end

local function distance(points, continent, x, y)
    local best
    for _, p in ipairs(points) do
        if p.continent == continent and p.wx then
            local d = (p.wx - x) ^ 2 + (p.wy - y) ^ 2
            if not best or d < best then best = d end
        end
    end
    return best and math.sqrt(best)
end

-- Picks the objectives near the player; true when the list changed.
function AW:Select()
    local before = {}
    for _, e in ipairs(self.shown) do before[#before + 1] = e.key end
    local shown, sticky = {}, {}
    for _, key in ipairs(before) do sticky[key] = true end
    local continent, px, py = Compat.GetPlayerWorld()
    if continent then
        local nearby = 0
        for _, e in ipairs(self.entries) do
            local d = not e.sticky and distance(e.points, continent, px, py)
            if e.sticky then
                shown[#shown + 1] = e
            elseif d and d <= (sticky[e.key] and LEAVE or ENTER) and nearby < MAX_ROWS then
                shown[#shown + 1] = e
                nearby = nearby + 1
            end
        end
    else
        for _, e in ipairs(self.entries) do
            if e.sticky then shown[#shown + 1] = e end
        end
    end
    self.shown = shown
    if #shown ~= #before then return true end
    for i, e in ipairs(shown) do
        if e.key ~= before[i] then return true end
    end
    return false
end

-- After any change of the guide or of the quest log (Engine:Refresh).
function AW:Refresh()
    self:Rebuild()
    self:Select()
end

-- Every INTERVAL seconds, while the window shows: the player moved.
local driver = CreateFrame("Frame")
driver.elapsed = 0
driver:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    if self.elapsed < INTERVAL then return end
    self.elapsed = 0
    local P = Ding.Panel
    if not (P and P.frame and P.frame:IsShown()) or #AW.entries == 0 and #AW.shown == 0 then return end
    if AW:Select() then Ding:Safe(P.Update, P) end
end)
