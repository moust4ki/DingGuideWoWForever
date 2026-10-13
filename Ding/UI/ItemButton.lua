-- Quest item button (screen 04 of docs/UI-handoff.md): the item the current step needs,
-- floating where the player put it, with its name above and the glyph of its binding
-- ("CLICK DingItemButton:LeftButton"). One click or one gamepad button uses it.
-- Using an item needs a secure button, the only protected frame in Ding. In combat its
-- attributes, visibility and position are locked: changes wait for PLAYER_REGEN_ENABLED,
-- and meanwhile the button keeps showing the item it would really use. It is anchored to
-- UIParent only, never to another Ding frame.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local B = {}
Ding.ItemButton = B

local NAME = "DingItemButton"
B.BINDING = "CLICK " .. NAME .. ":LeftButton"
-- Its second action, through a binding only: target the arrow's NPC or monster by name
-- (a macro on the virtual button "Target": attributes "type-Target", "macrotext-Target").
B.TARGET_BINDING = "CLICK " .. NAME .. ":Target"
local TARGET_MARK = 8            -- raid marker (skull) put on that target when playing solo
local MARK_WINDOW = 1            -- seconds after the press in which the new target is marked
B.HEARTHSTONE = 6948

local SIZE, ICON = 44, 36
local UPDATE_DELAY = 0.1         -- bag events come in bursts
local TICK = 0.2                 -- cooldown seconds and range
local PRESS_FLASH = 0.15
local FALLBACK_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"

---------------------------------------------------------------------------
-- Which item
---------------------------------------------------------------------------
local function owned(itemID)
    return Compat.ItemCount(itemID) > 0
end

-- Item for a quest still in progress: the one the quest log shows next to the quest,
-- else the item the quest giver handed out, if it has a "Use:" effect.
local function questItem(q)
    if not Compat.IsInLog(q) or Compat.IsQuestReady(q) then return nil end
    local id = Compat.QuestSpecialItem(q)
    if id and owned(id) then return id end
    id = Ding.Data:QuestSourceItem(q)
    if id and owned(id) and Compat.ItemHasUse(id) then return id end
    return nil
end

-- Item the current step needs, in the bags: the guide's `use`, else one of its quests'.
-- Returns the item and the quest it is for (nil for a guide's `use` item); a teleport the
-- travel planner chose returns its spell, nil, "spell".
function B:Wanted()
    local E = Ding.Engine
    if not E.guide or E.finished then return nil end
    local step = E:CurrentStep()
    if not step or not Ding:StepApplies(step) then return nil end
    for _, id in ipairs(step.use or {}) do
        if owned(id) then
            local quests = step.complete or step.turnin or {}
            return id, quests[1]
        end
    end
    -- An item a goal of the step uses or wears (Core/Goals.lua).
    local goalItem = Ding.Goals and Ding.Goals:ButtonItem(step, E.index)
    if goalItem then return goalItem, nil end
    -- A `hearth` step, or the hearthstone as the fastest way to the target (Core/Travel.lua):
    -- the hearthstone, one button away.
    local leg = Ding.Travel and Ding.Travel.leg
    if (step.hearth or (leg and leg.kind == "hearth")) and owned(B.HEARTHSTONE) then return B.HEARTHSTONE, nil end
    -- A teleport (mage, druid) the same way: its spell on the button.
    if leg and leg.kind == "teleport" and leg.spell and Compat.SpellKnown(leg.spell) then
        return leg.spell, nil, "spell"
    end
    for _, key in ipairs({ "complete", "turnin" }) do
        for _, q in ipairs(step[key] or {}) do
            local id = questItem(q)
            if id then return id, q end
        end
    end
    -- Nothing for the step: a gear upgrade of the bags (Core/Gear.lua); using it equips it.
    local up = Ding.Gear and Ding.Gear:Suggested()
    if up and owned(up.id) then return up.id, nil end
    return nil
end

local function shouldShow()
    local db = Ding.db.panel
    return db.itemButton and db.shown
end

---------------------------------------------------------------------------
-- Construction
---------------------------------------------------------------------------
-- Why the button shows this item, and what its dimmed look or its number mean, in words.
function B:Explain()
    local lines = {}
    local id = self.item or self.spell
    if not id then return lines end
    local wanted, q, kind = self:Wanted()
    local step = Ding.Engine:CurrentStep()
    local up = Ding.Gear and Ding.Gear:Suggested()
    if wanted ~= id then
        lines[#lines + 1] = L.ITEM_FOR_STEP           -- in combat: the item it really uses
    elseif kind == "spell" or (id == B.HEARTHSTONE and not (step and step.hearth)) then
        lines[#lines + 1] = L.ITEM_FASTEST
    elseif q then
        lines[#lines + 1] = L.ITEM_FOR_QUEST:format(L.QUOTE:format(Ding.Data:QuestName(q)))
    elseif up and up.id == id and not (step and step.use) then
        lines[#lines + 1] = L.ITEM_UPGRADE
    else
        lines[#lines + 1] = L.ITEM_FOR_STEP
    end
    if (self.left or 0) > 0 then lines[#lines + 1] = L.ITEM_COOLDOWN:format(math.ceil(self.left)) end
    if self.usable == false then lines[#lines + 1] = L.ITEM_UNUSABLE end
    return lines
end

local function showTooltip(self)
    local id = B.item or B.spell
    if not id then return end
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    if B.spell then
        if not pcall(GameTooltip.SetSpellByID, GameTooltip, id) then
            GameTooltip:SetText(Compat.SpellName(id) or L.BIND_ITEM)
        end
    elseif not pcall(GameTooltip.SetItemByID, GameTooltip, id) then
        GameTooltip:SetText(Compat.ItemName(id) or Ding.Data:ItemName(id) or L.BIND_ITEM)
    end
    for _, line in ipairs(B:Explain()) do GameTooltip:AddLine(line, C.accent[1], C.accent[2], C.accent[3], true) end
    local key = Ding.Gamepad:BindingText(B.BINDING)
    if key then GameTooltip:AddLine(key, 0.8, 0.8, 0.8) end
    GameTooltip:AddLine(L.ITEM_DRAG, 0.8, 0.8, 0.8)
    GameTooltip:Show()
end

function B:Create()
    if self.button then return end
    if InCombatLockdown() then
        self.createAfterCombat = true
        return
    end
    local b = CreateFrame("Button", NAME, UIParent, "SecureActionButtonTemplate")
    b:SetSize(SIZE, SIZE)
    b:SetFrameStrata("MEDIUM")
    b:SetClampedToScreen(true)
    b:SetMovable(true)
    -- Bindings click on key down or key up depending on ActionButtonUseKeyDown, with the
    -- left button or the virtual "Target" one. The right button has no action: it drags.
    b:RegisterForClicks("AnyUp", "AnyDown")
    b:RegisterForDrag("RightButton")
    b:SetAttribute("type", "item")
    b:SetAttribute("type-Target", "macro")
    b:SetAttribute("macrotext-Target", "")

    b.look = UI.Window(b, C.itemBg, C.strong)
    b.look:SetBgAlpha(C.itemBg[4])
    b.icon = UI.ItemIcon(b, ICON)
    b.icon:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.veil = UI.Shape(b, "row", C.cooldown, "ARTWORK", 2):Place(b.icon)
    b.seconds = UI.Text(b, "bold", 13, C.text, "OVERLAY")
    b.seconds:SetJustifyH("CENTER")
    b.seconds:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.ring = UI.Shape(b, "ring", C.accent, "OVERLAY", 6):Place(b, 2)
    b.halo = UI.Shape(b, "halo", C.accentHalo, "BACKGROUND", -6):Place(b, 5)

    b.name = UI.Text(b, "medium", 11, C.text, "OVERLAY")
    b.name:SetJustifyH("CENTER")
    b.name:SetPoint("BOTTOM", b, "TOP", 0, 10)
    UI.Shadow(b.name)

    -- Glyph of the binding: an 18 circle overlapping the bottom-right corner by 6.
    b.glyph = UI.Glyph(b, { height = 18, font = 10, bg = C.control, text = C.text, border = C.strong })
    b.glyph:SetPoint("CENTER", b, "BOTTOMRIGHT", -3, 3)
    b.glyph:SetFrameLevel(b:GetFrameLevel() + 2)

    b:SetScript("OnEnter", showTooltip)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:SetScript("OnDragStart", function(self)
        if not InCombatLockdown() then self:StartMoving() end
    end)
    b:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        B:SavePosition()
    end)
    -- A short pressed look after each use (mouse or binding); after the target binding,
    -- the raid marker.
    b:SetScript("PostClick", function(_, button)
        if button == "Target" then
            B.marking = { names = B.targetNames, t = GetTime() }
            B:MarkTarget()
            return
        end
        B.pressedUntil = GetTime() + PRESS_FLASH
        B:Render()
    end)

    -- Cooldown seconds and range, on a plain frame (the secure one stays untouched).
    local ticker = CreateFrame("Frame", nil, b)
    ticker.elapsed = 0
    ticker:SetScript("OnUpdate", function(t, elapsed)
        t.elapsed = t.elapsed + elapsed
        if t.elapsed < TICK then return end
        t.elapsed = 0
        if B.item or B.spell then B:Render() end
    end)

    b:Hide()
    self.button, self.item, self.spell = b, nil, nil
    self:Update()
end

---------------------------------------------------------------------------
-- Position (Ding.db.item), out of combat only
---------------------------------------------------------------------------
function B:Place()
    local b, db = self.button, Ding.db.item
    b:ClearAllPoints()
    b:SetPoint(db.point, UIParent, db.point, db.x, db.y)
end

function B:SavePosition()
    local b, db = self.button, Ding.db.item
    if b.SetUserPlaced then pcall(b.SetUserPlaced, b, false) end
    local point, _, _, x, y = b:GetPoint()
    if point then db.point, db.x, db.y = point, x, y end
    if not InCombatLockdown() then self:Place() end
end

function B:ResetPosition()
    local db, default = Ding.db.item, Ding.DEFAULTS.item
    db.point, db.x, db.y = default.point, default.x, default.y
    if self.button and not InCombatLockdown() then self:Place() end
end

-- Target for the gamepad move mode. The button shows while it moves, even without item.
function B:MoveTarget()
    local db = Ding.db.item
    return {
        frame = self.button,
        title = L.MOVE_TITLE_ITEM,
        get = function() return db.x, db.y end,
        set = function(x, y)
            db.x, db.y = x, y
            B:Place()
        end,
        save = function() end,
        dragged = function() B:SavePosition() end,
        reset = function() B:ResetPosition() end,
        start = function()
            B.moving = true
            B.button:Show()
        end,
        stop = function()
            B.moving = false
            B:Update()
        end,
    }
end

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------
local function cooldownLeft(id)
    local start, duration = Compat.ItemCooldown(id)
    if not start or not duration or duration <= 1.5 or start <= 0 then return 0 end
    return math.max(0, start + duration - GetTime())
end

-- Looks of the item (or spell) the button really uses (allowed in combat): ready, pressed,
-- cooldown, or unusable / out of range.
function B:Render()
    local b, spell = self.button, self.spell
    local id = self.item or spell
    if not id then return end
    local left, usable, inRange
    if spell then
        b.icon:SetTexture(Compat.SpellIcon(spell) or FALLBACK_ICON)
        left = Compat.SpellCooldown(spell)
        left = left > 1.5 and left or 0
        usable, inRange = Compat.SpellUsable(spell) ~= false, true
    else
        b.icon:SetTexture(Compat.ItemIcon(id) or FALLBACK_ICON)
        left = cooldownLeft(id)
        usable = Compat.ItemUsable(id) ~= false
        inRange = Compat.ItemInRange(id) ~= false
    end
    local pressed = (self.pressedUntil or 0) > GetTime()
    local key = Ding.db.panel.keyHints and Ding.Gamepad:BindingKey(self.BINDING)
    self.left, self.usable = left, usable     -- said in words by its tooltip (B:Explain)

    b.veil:SetShown(left > 0)
    b.seconds:SetText(left > 0 and tostring(math.ceil(left)) or "")
    b.icon:SetAlpha((usable and inRange) and 1 or 0.45)
    b.ring:SetShown(pressed)
    b.halo:SetShown(pressed)
    b.look.border:SetShown(not pressed)
    b.look.border:SetColor((usable and inRange) and C.strong or C.todoBorder)
    if inRange then
        local name = spell and (Compat.SpellName(spell) or "") or Compat.ItemName(id) or Ding.Data:ItemName(id) or ""
        local up = Ding.Gear and Ding.Gear:Suggested()
        b.name:SetText(up and up.id == id and L.EQUIP_ITEM:format(name) or name)
        b.name:SetTextColor(unpack(C.text))
    else
        b.name:SetText(L.OUT_OF_RANGE)
        b.name:SetTextColor(unpack(C.todo))
    end
    if key then
        b.glyph:SetKey(key)
        local dim = left > 0 or not usable or not inRange
        b.glyph:SetColors(pressed and C.accent or C.control, pressed and C.onAccent or (dim and C.muted or C.text))
        b.glyph:SetAlpha(1)
    else
        -- Opacity only: a child of the secure button is left alone in combat.
        b.glyph:SetAlpha(0)
    end
end

---------------------------------------------------------------------------
-- Target binding
---------------------------------------------------------------------------
-- The NPCs and monsters of the step, by name, nearest first (a name, a list, or nil:
-- nothing to target). The macro changes out of combat only; in combat the binding keeps
-- the last one.
function B:SetTarget(names)
    if type(names) == "string" then names = { names } end
    if names and #names == 0 then names = nil end
    local key = names and table.concat(names, "\n") or nil
    if key == self.wantedKey then return end
    self.wantedKey, self.wantedTargets = key, names
    self.wantedTarget = names and names[1] or nil
    if not self.button then return end
    if InCombatLockdown() then
        self.dirty = true
    else
        self:ApplyTarget()
    end
end

function B:ApplyTarget()
    if self.wantedKey == self.targetKey then return end
    local names = self.wantedTargets or {}
    self.targetKey, self.targetName, self.targetNames = self.wantedKey, names[1], names
    -- Each line that finds its unit takes the target: the nearest name goes last.
    local lines = {}
    for i = #names, 1, -1 do lines[#lines + 1] = "/targetexact " .. names[i] end
    self.button:SetAttribute("macrotext-Target", table.concat(lines, "\n"))
end

-- Solo, the target just taken gets a raid marker (setting "Mark the target").
function B:MarkTarget()
    local m = self.marking
    if not m or GetTime() - m.t > MARK_WINDOW then return end
    local ui = Ding.db and Ding.db.ui
    if not (ui and ui.markTarget) or Compat.InGroup() then return end
    local target = Compat.TargetName()
    local wanted = false
    for _, name in ipairs(m.names or {}) do
        if name == target then wanted = true end
    end
    if wanted then
        self.marking = nil
        Compat.MarkTarget(TARGET_MARK)
    end
end

-- Out of combat only: attributes, position and visibility.
function B:Apply()
    local b = self.button
    self:ApplyTarget()
    local id, kind
    if shouldShow() then
        local wanted, _, what = self:Wanted()
        id, kind = wanted, what
    end
    local item = kind ~= "spell" and id or nil
    local spell = kind == "spell" and id or nil
    if item ~= self.item or spell ~= self.spell then
        self.item, self.spell = item, spell
        -- A hidden button keeps no item nor spell: its binding must not use a stale one.
        b:SetAttribute("type", spell and "spell" or "item")
        b:SetAttribute("spell", spell and (Compat.SpellName(spell) or spell) or nil)
        b:SetAttribute("item", item and ("item:" .. item) or nil)
    end
    self:Place()
    b:SetShown(id ~= nil or self.moving == true)
    self.dirty = false
    self:Render()
end

function B:Update()
    if not self.button then return end
    if InCombatLockdown() then
        self.dirty = true
        self:Render()
    else
        self:Apply()
    end
end

local pending = false
local function scheduleUpdate()
    if pending then return end
    pending = true
    C_Timer.After(UPDATE_DELAY, function()
        pending = false
        Ding:Safe(B.Update, B)
    end)
end
B.ScheduleUpdate = scheduleUpdate

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
Ding:On("PLAYER_REGEN_ENABLED", function()
    if B.createAfterCombat then
        B.createAfterCombat = false
        B:Create()
    elseif B.dirty then
        B:Update()
    end
end)
Ding:On("BAG_UPDATE", scheduleUpdate)
Ding:On("BAG_UPDATE_COOLDOWN", function() if B.button and B.item then B:Render() end end)
Ding:On("SPELL_UPDATE_COOLDOWN", function() if B.button and B.spell then B:Render() end end)
Ding:On("PLAYER_TARGET_CHANGED", function() if B.button and B.item then B:Render() end end)
-- The target of the target binding arrives: mark it when the player plays solo.
Ding:On("PLAYER_TARGET_CHANGED", function() B:MarkTarget() end)
