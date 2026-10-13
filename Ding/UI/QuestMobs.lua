-- Quest monsters: a small mark above the nameplate of a monster that counts for a quest of
-- the log (an objective to kill, or it drops an item a quest still needs) with the
-- objective's counter ("3/8"), and a line in its tooltip that says the mark in words ("Ding! ·
-- Kill for “The Balance of Nature” 3/8 · current step"). The current step's monsters stand out
-- (accent); those of the log's other quests are quieter. A finished objective loses its mark.
-- On a friendly nameplate, the current step's quest giver ("!") or turn-in NPC ("?").
-- Ding never changes the game's nameplates: one frame of its own per plate is parented to it.
-- A monster is known by its creature id (UnitGUID): when the client keeps the GUID secret (in
-- combat, maybe), the plate keeps what was decided when it appeared, else its name is matched
-- with the monsters Ding knows. Nothing here is protected: frames are only created, anchored,
-- shown and hidden, in combat too.
-- "Show enemy nameplates farther": the client's nameplate distance at its maximum, the value
-- before put back when the option goes off (kept in Ding.db.farPlatesFrom, outside the
-- settings: "Restore all defaults" still puts it back). The console variable is only changed
-- out of combat.
local _, Ding = ...
local Compat, UI = Ding.Compat, Ding.UI
local L = Ding.L
local C = UI.C

local QM = {}
Ding.QuestMobs = QM

local HEIGHT = 18             -- the mark's height (units of the plate)
local MAX_LINES = 3           -- tooltip lines at most
local MAX_PLATES = 40         -- nameplate unit tokens looked at when the plates are read again
local DISTANCE_CVAR = "nameplateMaxDistance"
local FAR_DISTANCE = 60       -- yards asked for: the client keeps its own maximum
QM.DISTANCE_CVAR, QM.FAR_DISTANCE = DISTANCE_CVAR, FAR_DISTANCE

-- [npc id] = entries, best first: { kind = "kill" | "drop" | "accept" | "turnin", quest,
-- label, have, need, current, enemy }. `enemy`: the mark goes on a monster (kill, drop),
-- else on a friendly NPC (accept, turnin).
QM.byNpc = {}
QM.plates = {}                -- [unit token] = { unit, plate, npc, name, attackable, badge }
local badgeOf = setmetatable({}, { __mode = "k" })   -- [game nameplate] = Ding's mark on it

local function ui() return Ding.db and Ding.db.ui or {} end
local function wanted() return ui().mobIcons ~= false or ui().mobTooltip ~= false end

---------------------------------------------------------------------------
-- What counts, by creature id
---------------------------------------------------------------------------
local function hasNpcs(target) return target.npcs ~= nil and #target.npcs > 0 end

-- have, need of an objective: the client's numbers, else the "3/8" of its text.
local function counts(obj)
    local have, need = tonumber(obj.numFulfilled), tonumber(obj.numRequired)
    if have and need and need > 0 then return have, need end
    local a, b = tostring(obj.text or ""):match("(%d+)%s*/%s*(%d+)")
    if a then return tonumber(a), tonumber(b) end
    return nil
end

local KIND_ORDER = { kill = 1, drop = 2, turnin = 3, accept = 4 }
local function better(a, b)
    if a.current ~= b.current then return a.current end
    local ca, cb = a.need ~= nil, b.need ~= nil
    if ca ~= cb then return ca end
    if a.kind ~= b.kind then return KIND_ORDER[a.kind] < KIND_ORDER[b.kind] end
    return a.order < b.order
end

-- After a change of the quest log or of the step (Engine:Refresh).
function QM:Rebuild()
    local byNpc = {}
    self.byNpc, self.byName = byNpc, nil
    if not wanted() or not Ding.Data.available then return end
    local E, D, AW = Ding.Engine, Ding.Data, Ding.Along
    local step = E.guide and not E.finished and E:CurrentStep() or nil
    local inStep = step and AW:StepQuests() or {}
    local order = 0
    local function add(npc, entry)
        order = order + 1
        local e = {}
        for k, v in pairs(entry) do e[k] = v end
        e.order = order
        local list = byNpc[npc]
        if not list then
            list = {}
            byNpc[npc] = list
        end
        list[#list + 1] = e
    end

    -- Objectives of the log's quests: monsters to kill, monsters that drop an item.
    for _, q in ipairs(E:LogQuests()) do
        if not E:IsReady(q) then
            local label = L.QUOTE:format(D:QuestName(q))
            for _, o in ipairs(AW:Objectives(q, hasNpcs)) do
                local have, need = counts(o.objective)
                local entry = { kind = o.target.kind == "drop" and "drop" or "kill", quest = q, label = label,
                    have = have, need = need, current = inStep[q] == true, enemy = true }
                for _, npc in ipairs(o.target.npcs) do add(npc, entry) end
            end
        end
    end

    if step then
        -- The monster a level step farms, the step's goals without a quest.
        if step.level and not (step.accept or step.complete or step.turnin) and not E:LevelReached(step) then
            local spot = Ding.Grind:Spot(E.index)
            if spot and spot.npc then
                add(spot.npc, { kind = "kill", label = L.REACH_LEVEL:format(math.floor(step.level)), current = true,
                    enemy = true })
            end
        end
        for _, part in ipairs(Ding.Goals:Parts(step, E.index)) do
            if not part.done and part.kind == "kill" then
                add(part.id, { kind = "kill", label = L.GOAL_KILL:format(D:NpcName(part.id) or ("#" .. part.id)),
                    have = part.have, need = part.count, current = true, enemy = true })
            elseif not part.done and part.kind == "collect" then
                local entry = { kind = "drop", label = L.GOAL_COLLECT:format(D:ItemName(part.id) or ("#" .. part.id)),
                    have = part.have, need = part.count, current = true, enemy = true }
                for _, npc in ipairs(D:ItemDropNpcs(part.id)) do add(npc, entry) end
            end
        end
        -- Friendly NPCs: whom to take the step's quests from, whom to turn them in to.
        local level = UnitLevel("player")
        for _, q in ipairs(step.accept or {}) do
            if not Compat.IsInLog(q) and not Compat.IsQuestCompleted(q) and not E.turnedIn[q]
                and D:QuestRequiredLevel(q) <= level then
                local entry = { kind = "accept", quest = q, label = L.QUOTE:format(D:QuestName(q)), current = true }
                for _, npc in ipairs(D:StarterNpcs(q)) do add(npc, entry) end
            end
        end
        for _, q in ipairs(step.turnin or {}) do
            if not E.turnedIn[q] and Compat.IsQuestReady(q) then
                local entry = { kind = "turnin", quest = q, label = L.QUOTE:format(D:QuestName(q)), current = true }
                for _, npc in ipairs(D:FinisherNpcs(q)) do add(npc, entry) end
            end
        end
    end
    for _, list in pairs(byNpc) do table.sort(list, better) end
end

-- Entries by lowercase name, for a plate whose GUID the client keeps secret (built once per
-- rebuild, the first time one is needed).
local nameOf = {}             -- [npc id] = its name in the client's language, or false
function QM:ByName(name)
    if not self.byName then
        local byName = {}
        for npc, list in pairs(self.byNpc) do
            local n = nameOf[npc]
            if n == nil then
                n = Ding.Data:NpcName(npc) or false
                nameOf[npc] = n
            end
            if n then
                local key = n:lower()
                if not byName[key] or better(list[1], byName[key][1]) then byName[key] = list end
            end
        end
        self.byName = byName
    end
    return self.byName[name:lower()]
end

-- What a unit counts for ({ unit, npc, name, attackable }), best first, or nil. A monster
-- gets the kill and drop entries, a friendly NPC the quest givers'; one the client says
-- nothing about is taken for a monster.
function QM:EntriesOf(info)
    if info.npc == nil and info.unit then info.npc = Compat.UnitNpcID(info.unit) end
    if info.name == nil and info.unit then info.name = Compat.UnitName(info.unit) end
    local list
    if info.npc then
        list = self.byNpc[info.npc]
    elseif info.npc == nil and info.name then
        list = self:ByName(info.name)
    end
    if not list then return nil end
    local enemy = info.attackable ~= false
    local out = {}
    for _, e in ipairs(list) do
        if (e.enemy == true) == enemy then out[#out + 1] = e end
    end
    return #out > 0 and out or nil
end

local function counterText(e)
    if not e.need then return nil end
    return ("%d/%d"):format(e.have or 0, e.need)
end

---------------------------------------------------------------------------
-- The mark on a nameplate
---------------------------------------------------------------------------
local function newBadge(plate)
    local b = CreateFrame("Frame", nil, plate)
    b:SetSize(HEIGHT, HEIGHT)
    b:SetPoint("BOTTOM", plate, "TOP", 0, 2)
    b:EnableMouse(false)
    b.bg = UI.Shape(b, "small", C.itemBg, "BACKGROUND"):Place(b)
    b.border = UI.Shape(b, "smallBorder", C.border, "BORDER"):Place(b)
    b.glyph = UI.Icon(b, "icon_diamond", 7, C.accent, "ARTWORK")
    b.letter = UI.Text(b, "bold", 12, C.accent)
    b.letter:SetJustifyH("CENTER")
    b.counter = UI.Text(b, "semibold", 11, C.text)
    b:Hide()
    return b
end

-- Kill: the diamond of the guide's kill lines; drop: its dot; a quest giver "!", a turn-in
-- "?", like the window's rows.
local function paint(b, e)
    local current = e.current
    local tint = current and C.accent or C.secondary
    b.border:SetColor(current and C.accent or C.border)
    b:SetAlpha(current and 1 or 0.8)
    local counter = counterText(e)
    local glyph = (e.kind == "accept" or e.kind == "turnin") and b.letter or b.glyph
    b.glyph:Hide()
    b.letter:Hide()
    if glyph == b.letter then
        b.letter:SetText(e.kind == "accept" and "!" or "?")
        b.letter:SetTextColor(unpack(tint))
    else
        b.glyph:SetTexture(UI.TEX .. (e.kind == "drop" and "circle" or "icon_diamond"))
        b.glyph:SetVertexColor(unpack(tint))
    end
    glyph:ClearAllPoints()
    b.counter:ClearAllPoints()
    if counter then
        b.counter:SetText(counter)
        b.counter:SetTextColor(unpack(current and C.text or C.secondary))
        local width = UI.Measure(b.counter)
        b:SetWidth(5 + 8 + 4 + width + 6)
        glyph:SetPoint("CENTER", b, "LEFT", 5 + 4, 0)
        b.counter:SetPoint("LEFT", b, "LEFT", 5 + 8 + 4, 0)
        b.counter:Show()
    else
        b:SetWidth(HEIGHT)
        glyph:SetPoint("CENTER", b, "CENTER", 0, 0)
        b.counter:Hide()
    end
    glyph:Show()
    b.entry = e
end

function QM:UpdatePlate(info)
    local entries = ui().mobIcons ~= false and self:EntriesOf(info)
    local b = info.badge
    if not entries then
        if b then b:Hide() end
        return
    end
    if not b then
        b = badgeOf[info.plate] or newBadge(info.plate)
        badgeOf[info.plate] = b
        info.badge = b
    end
    paint(b, entries[1])
    b:Show()
end

function QM:UpdatePlates()
    for _, info in pairs(self.plates) do Ding:Safe(self.UpdatePlate, self, info) end
end

-- A nameplate appears: what its unit is, read now (kept while the plate lives).
function QM:Added(unit)
    if type(unit) ~= "string" then return end
    local plate = Compat.NamePlateForUnit(unit)
    if not plate then return end
    -- The client reuses its plates: a mark left from an earlier unit goes.
    for token, other in pairs(self.plates) do
        if token == unit or other.plate == plate then
            if other.badge then other.badge:Hide() end
            self.plates[token] = nil
        end
    end
    local info = { unit = unit, plate = plate, npc = Compat.UnitNpcID(unit), name = Compat.UnitName(unit),
        attackable = Compat.UnitAttackable(unit) }
    self.plates[unit] = info
    self:UpdatePlate(info)
end

function QM:Removed(unit)
    local info = type(unit) == "string" and self.plates[unit]
    if not info then return end
    if info.badge then info.badge:Hide() end
    self.plates[unit] = nil
end

-- The plates already on screen (a reload, the option turned on).
function QM:ReadPlates()
    for i = 1, MAX_PLATES do
        local unit = "nameplate" .. i
        if Compat.UnitExists(unit) and not self.plates[unit] then self:Added(unit) end
    end
end

-- After any change of the guide or of the quest log (Engine:Refresh).
function QM:Refresh()
    self:Rebuild()
    self:UpdatePlates()
end

---------------------------------------------------------------------------
-- The unit tooltip: hooked, never replaced
---------------------------------------------------------------------------
-- What the mark says, in words: kill or loot for a quest, a quest to take or to turn in (a goal
-- or a level step names its own action), the counter, and "current step" for the accent ones.
local KIND_TEXT = { kill = "MOB_KILL", drop = "MOB_DROP", accept = "MOB_ACCEPT", turnin = "MOB_TURNIN" }
function QM:Words(e)
    local text = e.quest and L[KIND_TEXT[e.kind]]:format(e.label) or e.label
    local counter = counterText(e)
    if counter then text = text .. " " .. counter end
    if e.current then text = text .. " · " .. L.MOB_CURRENT end
    return text
end

function QM:TooltipLines(info)
    local out = {}
    if ui().mobTooltip == false then return out end
    for i, e in ipairs(self:EntriesOf(info) or {}) do
        if i > MAX_LINES then break end
        out[#out + 1] = { text = UI.Colored("accent", Ding.TITLE) .. " · " .. self:Words(e),
            color = e.current and C.text or C.secondary }
    end
    return out
end

local function onTooltipUnit(tooltip, data)
    if tooltip ~= GameTooltip or ui().mobTooltip == false then return end
    local ok, _, unit = pcall(tooltip.GetUnit, tooltip)
    unit = ok and Compat.Plain(unit)
    if type(unit) ~= "string" then unit = nil end
    local info = { unit = unit, attackable = unit and Compat.UnitAttackable(unit) }
    if not unit then
        -- No unit token: the tooltip's own data (the processor's GUID).
        info.npc = Compat.GuidNpcID(type(data) == "table" and data.guid)
        if info.npc == nil then return end
    end
    for _, line in ipairs(QM:TooltipLines(info)) do
        tooltip:AddLine(line.text, line.color[1], line.color[2], line.color[3])
    end
end
QM.OnTooltipUnit = onTooltipUnit

-- The client's tooltip processor when it has one (modern clients), else the unit script.
local function hookTooltip()
    local TDP, kinds = _G.TooltipDataProcessor, _G.Enum and _G.Enum.TooltipDataType
    if type(TDP) == "table" and type(TDP.AddTooltipPostCall) == "function" and type(kinds) == "table" and kinds.Unit then
        local ok = pcall(TDP.AddTooltipPostCall, kinds.Unit, function(tooltip, data)
            Ding:Safe(onTooltipUnit, tooltip, data)
        end)
        if ok then return "processor" end
    end
    local tip = _G.GameTooltip
    if tip and tip.HasScript and tip.HookScript then
        local okHas, has = pcall(tip.HasScript, tip, "OnTooltipSetUnit")
        if okHas and has and pcall(tip.HookScript, tip, "OnTooltipSetUnit", function(tooltip)
            Ding:Safe(onTooltipUnit, tooltip)
        end) then
            return "script"
        end
    end
    return nil
end
local okHook, hook = pcall(hookTooltip)
QM.tooltipHook = okHook and hook or nil

---------------------------------------------------------------------------
-- Enemy nameplates farther
---------------------------------------------------------------------------
-- The distance the client keeps now, in yards (nil when it has no such setting).
function QM:Distance()
    return tonumber(Compat.GetCVar(DISTANCE_CVAR))
end

-- Puts the console variable where the option wants it; `announce`: says the distance in
-- the chat (a change from the settings). In combat, waits for the end of the fight.
function QM:ApplyDistance(announce)
    local db = Ding.db
    if not db then return end
    if InCombatLockdown() then
        self.distancePending = self.distancePending or announce or false
        return
    end
    self.distancePending = nil
    if ui().farPlates then
        local now = self:Distance()
        if now and now < FAR_DISTANCE then
            local before = Compat.GetCVar(DISTANCE_CVAR)
            if Compat.SetCVar(DISTANCE_CVAR, FAR_DISTANCE) and db.farPlatesFrom == nil then
                db.farPlatesFrom = before
            end
        end
    elseif db.farPlatesFrom ~= nil then
        Compat.SetCVar(DISTANCE_CVAR, db.farPlatesFrom)
        db.farPlatesFrom = nil
    end
    if not announce then return end
    local now = self:Distance()
    if now then
        Ding:Print(L.FAR_PLATES_SET:format(math.floor(now + 0.5)))
    else
        Ding:Print(L.FAR_PLATES_NONE)
    end
end

-- After a change of the options (Config): the marks, the tooltip's entries and the distance.
function QM:Apply(announce)
    self:Refresh()
    if ui().mobIcons ~= false then self:ReadPlates() end
    self:ApplyDistance(announce)
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
Ding:On("NAME_PLATE_UNIT_ADDED", function(_, unit) QM:Added(unit) end)
Ding:On("NAME_PLATE_UNIT_REMOVED", function(_, unit) QM:Removed(unit) end)
Ding:On("PLAYER_REGEN_ENABLED", function()
    if QM.distancePending ~= nil then QM:ApplyDistance(QM.distancePending) end
end)
Ding:On("PLAYER_LOGIN", function()
    QM:ApplyDistance()
    QM:ReadPlates()
end)
-- Without a guide the engine refreshes nothing: the log is read here.
local pending = false
Ding:On("QUEST_LOG_UPDATE", function()
    if Ding.Engine.guide or pending then return end
    pending = true
    C_Timer.After(0.3, function()
        pending = false
        Ding:Safe(QM.Refresh, QM)
    end)
end)
