-- Accepts and turns in the guide's quests when the player talks to an NPC: the quests of
-- the current step and the next ones at the same place, plus the guide's later quests the
-- NPC offers on the way (taken ahead, not above the player's level, with room in the log),
-- never anything else. Turn-ins stay where the guide puts them. A reward is taken only when
-- there is no choice to make. Holding Shift (LT on a gamepad) pauses it.
local _, Ding = ...
local Compat = Ding.Compat

local AQ = {}
Ding.AutoQuest = AQ

local WINDOW = 5          -- steps looked at from the current one
local AHEAD_LOG_LIMIT = 15  -- quests in the log from which nothing is taken ahead of the guide
local RESELECT_DELAY = 2  -- seconds before the same quest can be selected again

local function enabled(kind)
    local ui = Ding.db and Ding.db.ui
    if not ui then return false end
    if kind == "accept" and not ui.autoAccept then return false end
    if kind == "turnin" and not ui.autoTurnin then return false end
    return not IsShiftKeyDown()
end

-- The last step at the player's place: from the current one, up to WINDOW of them, stopping
-- after a step that leaves the place (go, fly, hearth). 0 without a guide to follow.
function AQ:PlaceEnd()
    local E = Ding.Engine
    local guide = E.guide
    if not guide or E.finished then return 0 end
    local last = math.min(#guide.steps, E.index + WINDOW - 1)
    for i = E.index, last do
        local step = guide.steps[i]
        if Ding:StepApplies(step) and (step.go or step.fly or step.hearth) then return i end
    end
    return last
end

-- Quests the guide wants right now: accept[q], turnin[q], from the steps at the player's
-- place (PlaceEnd). ahead[q]: a quest of a later step, taken on the way if the NPC offers it.
function AQ:Wanted()
    local accept, turnin, ahead = {}, {}, {}
    local E = Ding.Engine
    local guide = E.guide
    if not guide or E.finished then return accept, turnin, ahead end
    local stop = self:PlaceEnd()
    for i = E.index, stop do
        local step = guide.steps[i]
        if Ding:StepApplies(step) then
            for _, q in ipairs(step.accept or {}) do accept[q] = true end
            for _, q in ipairs(step.turnin or {}) do turnin[q] = true end
            -- Earlier quests of a chain the step waits on (see Engine:CatchUp).
            for _, key in ipairs({ "accept", "complete", "turnin" }) do
                for _, q in ipairs(step[key] or {}) do
                    local p = E:CatchUp(q, step)
                    if p then
                        accept[p] = true
                        turnin[p] = true
                    end
                end
            end
            -- A quest to finish or turn in that is not in the log: the step asks to take it.
            for _, key in ipairs({ "turnin", "complete" }) do
                for _, q in ipairs(step[key] or {}) do
                    if not Compat.IsInLog(q) and not Compat.IsQuestCompleted(q) and not E.turnedIn[q] then
                        accept[q] = true
                    end
                end
            end
        end
    end
    -- The guide's later quests, while the log has room: the trip back is saved.
    if Compat.NumQuestsInLog() < AHEAD_LOG_LIMIT then
        for i = stop + 1, #guide.steps do
            local step = guide.steps[i]
            if Ding:StepApplies(step) then
                for _, q in ipairs(step.accept or {}) do
                    if not accept[q] then accept[q], ahead[q] = true, true end
                end
            end
        end
    end
    -- Quests the guide says the player takes by hand (`noauto`: timed, escorts).
    for q in pairs(accept) do
        if E:NoAuto(q) then accept[q], ahead[q] = nil, nil end
    end
    for q in pairs(accept) do
        if Compat.IsInLog(q) or Compat.IsQuestCompleted(q) or E.turnedIn[q] or E:IsGrey(q)
            or (ahead[q] and E:AboveLevel(q)) then
            accept[q], ahead[q] = nil, nil
        end
    end
    return accept, turnin, ahead
end

-- A selection that does not open the quest (server refusal...) must not loop on every
-- GOSSIP_SHOW: the same quest is selected again only after a short delay.
AQ.selected = {}    -- ["active:" or "available:" .. questID] = time of the last selection

local function canSelect(q, active)
    local key = (active and "active:" or "available:") .. q
    local t = AQ.selected[key]
    if t and GetTime() - t < RESELECT_DELAY then return false end
    AQ.selected[key] = GetTime()
    return true
end

-- Quest ids by lower-case name, for the greeting window (titles only).
local function byName(set)
    local names = {}
    for q in pairs(set) do
        local name = Ding.Data:QuestName(q)
        if name then names[string.lower(name)] = q end
    end
    return names
end

-- Gossip or greeting: turn in a finished guide quest first, else take one.
function AQ:OnQuestList(greeting)
    local wantAccept, wantTurnin = enabled("accept"), enabled("turnin")
    if not (wantAccept or wantTurnin) then return end
    local accept, turnin = self:Wanted()
    if greeting then
        local active, available = Compat.GreetingQuests()
        local turninNames, acceptNames = byName(turnin), byName(accept)
        if wantTurnin then
            for _, quest in ipairs(active) do
                local q = turninNames[string.lower(quest.title)]
                if q and quest.isComplete and canSelect(q, true) then
                    return Compat.Call("SelectActiveQuest", quest.index)
                end
            end
        end
        if wantAccept then
            for _, quest in ipairs(available) do
                local q = acceptNames[string.lower(quest.title)]
                if q and canSelect(q, false) then return Compat.Call("SelectAvailableQuest", quest.index) end
            end
        end
        return
    end
    local active, available = Compat.GossipQuests()
    if not active then return end
    if wantTurnin then
        for _, quest in ipairs(active) do
            if turnin[quest.questID] and quest.isComplete and canSelect(quest.questID, true) then
                return Compat.SelectGossipQuest(quest.questID, true)
            end
        end
    end
    if wantAccept then
        for _, quest in ipairs(available) do
            if accept[quest.questID] and canSelect(quest.questID, false) then
                return Compat.SelectGossipQuest(quest.questID, false)
            end
        end
    end
end

function AQ:OnDetail()
    if not enabled("accept") then return end
    local q = Compat.DialogQuestID()
    local accept, _, ahead = self:Wanted()
    if q and accept[q] then
        if ahead[q] then Ding.Engine:MarkEarly(q) end
        Compat.Call("AcceptQuest")
    end
end

function AQ:OnProgress()
    if not enabled("turnin") then return end
    local q = Compat.DialogQuestID()
    local _, turnin = self:Wanted()
    if not (q and turnin[q]) then return end
    local ok, completable = Compat.Call("IsQuestCompletable")
    if ok and completable then Compat.Call("CompleteQuest") end
end

-- Reward: taken only with no choice (0) or a single item (1).
function AQ:OnComplete()
    if not enabled("turnin") then return end
    local q = Compat.DialogQuestID()
    local _, turnin = self:Wanted()
    if not (q and turnin[q]) then return end
    local ok, choices = Compat.Call("GetNumQuestChoices")
    if not ok or type(choices) ~= "number" or choices > 1 then return end
    Compat.Call("GetQuestReward", choices)
end

Ding:On("GOSSIP_SHOW", function() AQ:OnQuestList(false) end)
Ding:On("QUEST_GREETING", function() AQ:OnQuestList(true) end)
Ding:On("QUEST_DETAIL", function() AQ:OnDetail() end)
Ding:On("QUEST_PROGRESS", function() AQ:OnProgress() end)
Ding:On("QUEST_COMPLETE", function() AQ:OnComplete() end)
