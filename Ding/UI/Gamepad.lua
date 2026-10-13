-- Gamepad support: button names and glyphs, temporary navigation bindings, key repeat,
-- the move mode (guide window, arrow, item button) and capturing a button for a binding.
-- Every binding call is made out of combat and protected by pcall.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI

local G = {}
Ding.Gamepad = G

-- Keys Ding takes over while its settings window or the move mode is open.
local NAV_KEYS = {
    "PAD1", "PAD2", "PAD3", "PAD4", "PADLSHOULDER", "PADRSHOULDER",
    "PADDUP", "PADDDOWN", "PADDLEFT", "PADDRIGHT", "PADFORWARD",
}
G.NAV_KEYS = NAV_KEYS
local REPEATING = { PADDUP = true, PADDDOWN = true, PADDLEFT = true, PADDRIGHT = true }
local MAX_HOLD = 10 -- seconds: stop repeating if the release was never seen

---------------------------------------------------------------------------
-- Button names (texts) and glyphs (chips)
---------------------------------------------------------------------------
-- The design font has no arrow glyphs: the D-pad is written in words, and drawn with
-- the caret texture in chips.
local DPAD = { PADDUP = "UP", PADDDOWN = "DOWN", PADDLEFT = "LEFT", PADDRIGHT = "RIGHT" }
local DPAD_TEXT = { PADDUP = L.PAD_UP, PADDDOWN = L.PAD_DOWN, PADDLEFT = L.PAD_LEFT, PADDRIGHT = L.PAD_RIGHT }
local NAMES = {
    xbox = {
        PAD1 = "A", PAD2 = "B", PAD3 = "X", PAD4 = "Y",
        PADLSHOULDER = "LB", PADRSHOULDER = "RB", PADLTRIGGER = "LT", PADRTRIGGER = "RT",
        PADLSTICK = "LS", PADRSTICK = "RS", PADFORWARD = "Start", PADBACK = "Back",
    },
    ps = {
        PAD1 = L.PS_CROSS, PAD2 = L.PS_CIRCLE, PAD3 = L.PS_SQUARE, PAD4 = L.PS_TRIANGLE,
        PADLSHOULDER = "L1", PADRSHOULDER = "R1", PADLTRIGGER = "L2", PADRTRIGGER = "R2",
        PADLSTICK = "L3", PADRSTICK = "R3", PADFORWARD = L.PS_OPTIONS, PADBACK = "Share",
    },
}
-- Face buttons in a circle chip: a letter (Xbox), a shape (PlayStation).
local FACE = {
    xbox = { PAD1 = { text = "A" }, PAD2 = { text = "B" }, PAD3 = { text = "X" }, PAD4 = { text = "Y" } },
    ps = { PAD1 = { text = "×" }, PAD2 = { tex = "ring" }, PAD3 = { tex = "glyph_ps_square" }, PAD4 = { caret = "UP" } },
}
-- Binding strings list modifiers in this order: ALT-CTRL-SHIFT-KEY.
local MODIFIERS = {
    { prefix = "ALT-", cvar = "GamePadEmulateAlt", text = "Alt" },
    { prefix = "CTRL-", cvar = "GamePadEmulateCtrl", text = "Ctrl" },
    { prefix = "SHIFT-", cvar = "GamePadEmulateShift", text = "Shift" },
}
local KEYBOARD_MODIFIERS = { LSHIFT = true, RSHIFT = true, LCTRL = true, RCTRL = true, LALT = true, RALT = true }

local function style()
    return (Ding.db and Ding.db.ui.buttonStyle == "ps") and "ps" or "xbox"
end

local function cvar(name)
    local get = (C_CVar and C_CVar.GetCVar) or GetCVar
    if type(get) ~= "function" then return nil end
    local ok, value = pcall(get, name)
    if ok and value and value ~= "" and value ~= "NONE" then return value end
    return nil
end

-- Gamepad buttons that act as Shift / Ctrl / Alt (LT / RT by default).
local function emulatedModifiers()
    local set = {}
    for _, mod in ipairs(MODIFIERS) do
        local button = cvar(mod.cvar)
        if button then set[button] = true end
    end
    return set
end

-- Is a gamepad in use? The chips of the guide window hide without one.
-- A gamepad the player can use: enabled in the game's options and plugged in. Enabled but
-- unplugged, the help would show buttons nobody can press (players' report): the mouse and
-- keyboard help shows instead.
function G:Active()
    local enabled = false
    if C_GamePad and C_GamePad.IsEnabled then
        local ok, value = pcall(C_GamePad.IsEnabled)
        enabled = ok and value == true
    end
    if not enabled and cvar("GamePadEnable") ~= "1" then return false end
    if C_GamePad and C_GamePad.GetAllDeviceIDs then
        local ok, ids = pcall(C_GamePad.GetAllDeviceIDs)
        if ok and type(ids) == "table" and #ids == 0 then return false end
    end
    return true
end

function G:ButtonName(button)
    if DPAD_TEXT[button] then return DPAD_TEXT[button] end
    local name = NAMES[style()][button]
    if name then return name end
    local ok, text = pcall(GetBindingText, button)
    if ok and type(text) == "string" and text ~= "" then return text end
    return button
end

-- Splits "SHIFT-PADDRIGHT" into its buttons: { "PADLTRIGGER", "PADDRIGHT" } (Shift is
-- emulated by LT on a gamepad), or a word when a modifier has no gamepad button.
local function splitKey(key)
    local parts, rest = {}, key
    for _, mod in ipairs(MODIFIERS) do
        if rest:sub(1, #mod.prefix) == mod.prefix then
            rest = rest:sub(#mod.prefix + 1)
            parts[#parts + 1] = cvar(mod.cvar) or { word = mod.text }
        end
    end
    parts[#parts + 1] = rest
    return parts
end

-- "SHIFT-PADDRIGHT" -> "LT+Right".
function G:KeyName(key)
    local names = {}
    for i, part in ipairs(splitKey(key)) do
        names[i] = type(part) == "table" and part.word or self:ButtonName(part)
    end
    return table.concat(names, "+")
end

-- What a chip draws for a binding key, or for a list of buttons shown together
-- ({ "PADLSHOULDER", "PADRSHOULDER" } -> "LB RB", { "PADDLEFT", "PADDRIGHT" } -> ◂ ▸).
-- Returns { face = bool, parts = { { text } | { caret } | { tex } } } (see UI.Glyph).
function G:Glyph(key)
    local s = style()
    local buttons, joined = key, true
    if type(key) == "string" then buttons, joined = splitKey(key), false end
    if #buttons == 1 and type(buttons[1]) == "string" and FACE[s][buttons[1]] then
        return { face = true, parts = { FACE[s][buttons[1]] } }
    end
    local parts = {}
    for i, button in ipairs(buttons) do
        if i > 1 and not joined then parts[#parts + 1] = { text = "+" } end
        local part
        if type(button) == "table" then
            part = { text = button.word }
        elseif DPAD[button] then
            part = { caret = DPAD[button] }
        elseif FACE[s][button] and s == "ps" then
            part = FACE[s][button]
        else
            part = { text = self:ButtonName(button) }
        end
        part = { text = part.text, caret = part.caret, tex = part.tex, space = joined and not DPAD[button] }
        parts[#parts + 1] = part
    end
    return { face = false, parts = parts }
end

function G:BindingKey(action)
    local ok, key = pcall(GetBindingKey, action)
    if ok and type(key) == "string" and key ~= "" then return key end
    return nil
end

function G:BindingText(action)
    local key = self:BindingKey(action)
    return key and self:KeyName(key) or nil
end

local function saveBindings()
    local ok, set = pcall(GetCurrentBindingSet)
    pcall(SaveBindings, ok and set or 1)
end

function G:Unbind(action)
    local ok, keys = pcall(function() return { GetBindingKey(action) } end)
    if not ok then return end
    for _, key in ipairs(keys) do pcall(SetBinding, key) end
    saveBindings()
end

function G:Bind(action, key)
    pcall(SetBinding, key, action)
    saveBindings()
end

-- Action currently bound to a key, other than `action` ("" or nil when free).
function G:ConflictFor(action, key)
    local ok, current = pcall(GetBindingAction, key)
    if ok and type(current) == "string" and current ~= "" and current ~= action then
        return current, _G["BINDING_NAME_" .. current] or current
    end
    return nil
end

---------------------------------------------------------------------------
-- Hint bar: glyph + label entries ("A Select   B Back   LB RB Tabs"), 11 px secondary
-- text, 6 between a glyph and its label, 16 between entries. Entries that do not fit
-- in `width` are left out (the last ones are the least useful).
---------------------------------------------------------------------------
-- The key a click on a hint stands for: its button, or RB for the LB / RB pair (next tab).
-- The D-pad has nothing to click.
local function pressKey(keys)
    if type(keys) == "string" then return keys end
    if type(keys) == "table" and keys[2] == "PADRSHOULDER" then return "PADRSHOULDER" end
    return nil
end

-- A clickable hint looks like a button: rounded box, border, lighter on hover.
local HINT_PAD, HINT_GAP, HINT_TEXT_GAP, HINT_BOX = 7, 6, 16, 22

-- onPress(key): optional; each hint with a button to press is then a button too, so a
-- mouse can do what the glyph says (players without a gamepad plugged in could not press
-- A or B). After SetHints, `bar.list` is the list, `bar.shown` the number of entries that fit
-- and `bar.used` the width they take; SetRoom(width) changes the width they may take.
function G:NewHintBar(parent, width, height, onPress)
    local bar = CreateFrame("Frame", nil, parent)
    bar:SetSize(width, height)
    bar.items = {}
    local boxHeight = math.min(height, HINT_BOX)

    local function newItem(self)
        local item = { glyph = UI.Glyph(self), label = UI.Text(self, "regular", 11, UI.C.secondary) }
        -- The button only takes the clicks; its box is drawn on the bar, under the texts.
        local b = CreateFrame("Button", nil, self)
        b:RegisterForClicks("LeftButtonUp")
        item.box = UI.Shape(self, "row", UI.C.control, "BACKGROUND"):Place(b)
        item.hover = UI.Shape(self, "row", UI.C.hover, "BACKGROUND", 1):Place(b)
        item.border = UI.Shape(self, "rowBorder", UI.C.strong, "BORDER"):Place(b)
        item.hover:Hide()
        b:SetScript("OnClick", function(self) if onPress and self.key then onPress(self.key) end end)
        b:SetScript("OnEnter", function()
            item.hover:Show()
            item.label:SetTextColor(unpack(UI.C.text))
        end)
        b:SetScript("OnLeave", function()
            item.hover:Hide()
            item.label:SetTextColor(unpack(item.button.key and UI.C.text or UI.C.secondary))
        end)
        item.button = b
        return item
    end

    function bar:SetRoom(w)
        width = w
        self:SetWidth(w)
    end

    function bar:SetHints(list)
        local x, shown, used = 0, 0, 0
        for i, hint in ipairs(list) do
            local item = self.items[i] or newItem(self)
            self.items[i] = item
            -- A hint without keys is a text alone (mouse and keyboard help).
            if hint.keys then item.glyph:SetGlyph(G:Glyph(hint.keys)) end
            item.label:SetText(hint.label)
            local key = onPress and pressKey(hint.keys) or nil
            local glyphWidth = hint.keys and (item.glyph:GetWidth() + 6) or 0
            local pad = key and HINT_PAD or 0
            local w = glyphWidth + item.label:GetStringWidth() + pad * 2
            local fits = x + w <= width
            if fits then
                item.glyph:ClearAllPoints()
                item.glyph:SetPoint("LEFT", self, "LEFT", x + pad, 0)
                item.label:ClearAllPoints()
                item.label:SetPoint("LEFT", self, "LEFT", x + pad + glyphWidth, 0)
                item.button:ClearAllPoints()
                item.button:SetPoint("LEFT", self, "LEFT", x, 0)
                item.button:SetSize(w, boxHeight)
                used = x + w
                x = x + w + (key and HINT_GAP or HINT_TEXT_GAP)
                shown = shown + 1
            end
            item.button.key = key
            local button = fits and key ~= nil
            item.glyph:SetShown(fits and hint.keys ~= nil)
            item.label:SetShown(fits)
            item.label:SetTextColor(unpack(button and UI.C.text or UI.C.secondary))
            item.button:SetShown(button)
            item.box:SetShown(button)
            item.border:SetShown(button)
            item.hover:Hide()
        end
        for i = #list + 1, #self.items do
            local item = self.items[i]
            item.glyph:Hide()
            item.label:Hide()
            item.button:Hide()
            item.box:Hide()
            item.border:Hide()
            item.hover:Hide()
        end
        self.list, self.shown, self.used = list, shown, used
    end
    return bar
end

---------------------------------------------------------------------------
-- Temporary navigation bindings
---------------------------------------------------------------------------
G.held = {}

local navButtons = {}
local function navButton(key)
    if navButtons[key] then return navButtons[key] end
    local b = CreateFrame("Button", "DingNav_" .. key, UIParent)
    b:RegisterForClicks("AnyDown", "AnyUp")
    b:SetScript("OnClick", function(_, _, down) G:Dispatch(key, down) end)
    navButtons[key] = b
    return b
end

local function applyNav(owner, keys)
    for _, key in ipairs(keys) do
        navButton(key)
        pcall(SetOverrideBindingClick, owner, true, key, "DingNav_" .. key)
    end
end

-- `down` is true on press, false on release; nil if the client does not tell.
function G:Dispatch(key, down)
    if down == false then
        self.held[key] = nil
        if self.repeatKey == key then self.repeatKey = nil end
        return
    end
    if down == true then self.held[key] = true end
    if self.handler then self.handler(key, false) end
    if down == true and REPEATING[key] then
        self.repeatKey, self.repeatWait, self.repeatAge = key, self.repeatDelay, 0
    end
end

local driver = CreateFrame("Frame")
driver:SetScript("OnUpdate", function(_, elapsed)
    local key = G.repeatKey
    if not key then return end
    G.repeatAge = G.repeatAge + elapsed
    if G.repeatAge > MAX_HOLD then
        G.repeatKey = nil
        return
    end
    G.repeatWait = G.repeatWait - elapsed
    if G.repeatWait <= 0 then
        G.repeatWait = G.repeatInterval
        if G.handler then G.handler(key, true) end
    end
end)

-- Routes `keys` (the navigation keys by default) to handler(key, isRepeat) until
-- Release(owner). Other keys keep their game binding.
function G:Take(owner, handler, delay, interval, keys)
    if self.owner and self.owner ~= owner then pcall(ClearOverrideBindings, self.owner) end
    self.owner, self.handler = owner, handler
    self.keys = keys or NAV_KEYS
    self.repeatDelay, self.repeatInterval = delay or 0.4, interval or 0.12
    self.held, self.repeatKey = {}, nil
    applyNav(owner, self.keys)
end

-- `key` clicks the button named `name` instead of reaching the handler (a secure
-- button: the guide's focus mode uses the quest item with A), or nil to restore it.
function G:Redirect(key, name)
    if not self.owner then return end
    pcall(SetOverrideBindingClick, self.owner, true, key, name or ("DingNav_" .. key))
end

function G:Release(owner)
    pcall(ClearOverrideBindings, owner)
    if self.owner == owner then
        self.owner, self.handler, self.repeatKey, self.keys = nil, nil, nil, nil
        self.held = {}
    end
end

---------------------------------------------------------------------------
-- Capturing a button (key binding rows)
---------------------------------------------------------------------------
local function modifierPrefix()
    local prefix = ""
    if IsAltKeyDown and IsAltKeyDown() then prefix = prefix .. "ALT-" end
    if IsControlKeyDown and IsControlKeyDown() then prefix = prefix .. "CTRL-" end
    if IsShiftKeyDown and IsShiftKeyDown() then prefix = prefix .. "SHIFT-" end
    return prefix
end

local function setCaptureInput(frame, enabled)
    if frame.EnableGamePadButton then pcall(frame.EnableGamePadButton, frame, enabled) end
    if frame.EnableKeyboard then pcall(frame.EnableKeyboard, frame, enabled) end
    if enabled and frame.SetPropagateKeyboardInput then pcall(frame.SetPropagateKeyboardInput, frame, false) end
end

function G:StopCapture(key)
    local frame = self.captureFrame
    if not frame or not frame:IsShown() then return end
    setCaptureInput(frame, false)
    frame:Hide()
    if self.owner then applyNav(self.owner, self.keys or NAV_KEYS) end
    local callback = self.captureCallback
    self.captureCallback = nil
    if callback then callback(key) end
end

local function onCaptured(button)
    if KEYBOARD_MODIFIERS[button] or emulatedModifiers()[button] then return end
    local prefix = modifierPrefix()
    -- B (or Escape) alone cancels, so B can only be bound with a modifier.
    if prefix == "" and (button == "PAD2" or button == "ESCAPE") then
        G:StopCapture(nil)
        return
    end
    G:StopCapture(prefix .. button)
end

-- callback(key) with "SHIFT-PADDRIGHT"-like keys, or callback(nil) when cancelled.
function G:Capture(callback)
    local frame = self.captureFrame
    if not frame then
        frame = CreateFrame("Frame", "DingCaptureFrame", UIParent)
        frame:SetAllPoints(UIParent)
        frame:SetFrameStrata("FULLSCREEN_DIALOG")
        -- SetScript errors on script types the client does not know.
        pcall(frame.SetScript, frame, "OnGamePadButtonDown", function(_, button) onCaptured(button) end)
        pcall(frame.SetScript, frame, "OnKeyDown", function(_, key) onCaptured(key) end)
        frame:Hide()
        self.captureFrame = frame
    end
    self.captureCallback = callback
    if self.owner then pcall(ClearOverrideBindings, self.owner) end
    frame:Show()
    setCaptureInput(frame, true)
end

function G:IsCapturing()
    return self.captureFrame ~= nil and self.captureFrame:IsShown()
end

---------------------------------------------------------------------------
-- Move mode: the D-pad moves the guide window, the arrow or the item button.
-- target = { frame, title, get() -> x, y, set(x, y), save(), reset(),
--            dragged() (mouse drag ended: save), start(), stop() (optional) }
-- The mouse can drag the frame too while the mode is on.
---------------------------------------------------------------------------
local PLATE_WIDTH = 340

-- A text button of the plate: clicked with the mouse, pressed with `key` on a gamepad (its
-- chip then sits before the label, and the hints leave it out).
local function plateButton(plate, text, key)
    local b = CreateFrame("Button", nil, plate)
    b:SetHeight(22)
    b:RegisterForClicks("LeftButtonUp")
    b.bg = UI.Shape(b, "row", UI.C.control, "BACKGROUND"):Place(b)
    b.hover = UI.Shape(b, "row", UI.C.hover, "HIGHLIGHT"):Place(b)
    b.text = UI.Text(b, "medium", 11, UI.C.text)
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.text:SetText(text)
    b.key = key
    b:SetScript("OnClick", function() G:OnMoveKey(key) end)
    return b
end

-- The plate's help: with a gamepad, the chips go on the buttons (A Save, B Cancel, Y Reset)
-- and the hints keep what has no button (D-pad, LB / RB); without one, the mouse help.
local function plateHelp(plate)
    local pad = G:Active()
    for _, b in ipairs({ plate.save, plate.cancel, plate.reset }) do
        local keys = pad and { b.key } or nil
        b:SetWidth(math.max(64, UI.Measure(b.text) + 20 + UI.ButtonKeys(b, keys)))
    end
    if pad then
        plate.hints:SetHints({
            UI.Hint({ "PADDUP", "PADDDOWN", "PADDLEFT", "PADDRIGHT" }, L.HINT_MOVE),
            UI.Hint({ "PADLSHOULDER", "PADRSHOULDER" }, L.MOVE_STEP),
        })
    else
        plate.hints:SetHints({ UI.Hint(nil, L.MOVE_DRAG) })
    end
end

local function movePlate()
    if G.plate then return G.plate end
    local plate = CreateFrame("Frame", "DingMoveFrame", UIParent)
    plate:SetSize(PLATE_WIDTH, 98)
    plate:SetFrameStrata("DIALOG")
    plate:SetClampedToScreen(true)
    plate.look = UI.Window(plate)
    plate.title = UI.Text(plate, "semibold", 12, UI.C.text)
    plate.title:SetPoint("TOPLEFT", plate, "TOPLEFT", 12, -10)
    plate.pos = UI.Text(plate, "regular", 11, UI.C.muted)
    plate.pos:SetJustifyH("RIGHT")
    plate.pos:SetPoint("TOPRIGHT", plate, "TOPRIGHT", -12, -11)
    plate.hints = G:NewHintBar(plate, PLATE_WIDTH - 24, 22, function(key) G:OnMoveKey(key) end)
    plate.hints:SetPoint("TOPLEFT", plate, "TOPLEFT", 12, -34)
    -- Save (A, Enter), Cancel (B, Escape), Reset (Y).
    plate.save = plateButton(plate, L.HINT_SAVE, "PAD1")
    plate.save:SetPoint("BOTTOMLEFT", plate, "BOTTOMLEFT", 12, 10)
    plate.cancel = plateButton(plate, L.HINT_CANCEL, "PAD2")
    plate.cancel:SetPoint("LEFT", plate.save, "RIGHT", 8, 0)
    plate.reset = plateButton(plate, L.HINT_RESET, "PAD4")
    plate.reset:SetPoint("LEFT", plate.cancel, "RIGHT", 8, 0)
    if plate.EnableKeyboard then pcall(plate.EnableKeyboard, plate, true) end
    pcall(plate.SetScript, plate, "OnKeyDown", function(self, key)
        local mine = key == "ENTER" or key == "ESCAPE"
        if self.SetPropagateKeyboardInput then pcall(self.SetPropagateKeyboardInput, self, not mine) end
        if key == "ENTER" then G:OnMoveKey("PAD1") elseif key == "ESCAPE" then G:OnMoveKey("PAD2") end
    end)

    -- Accent ring 2 units outside the moved frame.
    plate.outline = CreateFrame("Frame", nil, UIParent)
    plate.outline:SetFrameStrata("DIALOG")
    plate.outline:Hide()
    G.plate = plate
    return plate
end

local function refreshPlate()
    local plate, target = G.plate, G.moving
    local x, y = target.get()
    plate.pos:SetText(L.MOVE_POS:format(x, y))
end

local function setDraggable(target, enabled)
    local f = target.frame
    if enabled then
        target.mouse = f:IsMouseEnabled()
        f:SetMovable(true)
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        target.drag = { f:GetScript("OnDragStart"), f:GetScript("OnDragStop") }
        f:SetScript("OnDragStart", function(self) self:StartMoving() end)
        f:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            if self.SetUserPlaced then pcall(self.SetUserPlaced, self, false) end
            target.dragged()
            refreshPlate()
        end)
    elseif target.drag then
        f:SetScript("OnDragStart", target.drag[1])
        f:SetScript("OnDragStop", target.drag[2])
        f:EnableMouse(target.mouse)
        target.drag = nil
    end
end

function G:StartMove(target, onDone)
    local plate = movePlate()
    self.moving, self.moveDone = target, onDone
    self.moveOrigin = { target.get() }

    plate.title:SetText(target.title)
    plateHelp(plate)
    plate:ClearAllPoints()
    plate:SetPoint("BOTTOMLEFT", target.frame, "TOPLEFT", 0, 12)

    -- One ring per moved frame, created once.
    local outline = plate.outline
    outline.rings = outline.rings or {}
    for frame, ring in pairs(outline.rings) do ring:SetShown(frame == target.frame) end
    if not outline.rings[target.frame] then
        outline.rings[target.frame] = UI.Shape(outline, "ring", UI.C.accent, "OVERLAY"):Place(target.frame, 2)
    end
    outline:Show()
    plate:Show()
    if target.start then target.start() end
    if target.dragged then setDraggable(target, true) end
    refreshPlate()

    self:Take(plate, function(key) G:OnMoveKey(key) end, 0.25, 0.05)
end

function G:OnMoveKey(key)
    local target = self.moving
    if not target then return end
    local step = self.held.PADLSHOULDER and 1 or (self.held.PADRSHOULDER and 20 or 5)
    local x, y = target.get()
    if key == "PADDUP" then target.set(x, y + step)
    elseif key == "PADDDOWN" then target.set(x, y - step)
    elseif key == "PADDLEFT" then target.set(x - step, y)
    elseif key == "PADDRIGHT" then target.set(x + step, y)
    elseif key == "PAD1" then
        target.save()
        self:StopMove(true)
        return
    elseif key == "PAD2" or key == "PADFORWARD" then
        self:CancelMove()
        return
    elseif key == "PAD4" then
        target.reset()
    end
    refreshPlate()
end

-- Back to the position the frame had before the move mode.
function G:CancelMove()
    local target = self.moving
    if not target then return end
    target.set(self.moveOrigin[1], self.moveOrigin[2])
    self:StopMove(false)
end

function G:StopMove(saved)
    local plate, target = self.plate, self.moving
    if target then setDraggable(target, false) end
    if target and target.stop then target.stop() end
    self:Release(plate)
    plate:Hide()
    plate.outline:Hide()
    local done = self.moveDone
    self.moving, self.moveDone, self.moveOrigin = nil, nil, nil
    if done then done(saved) end
end

function G:IsMoving()
    return self.moving ~= nil
end

-- A gamepad plugged in or out: the open windows switch between the gamepad (chips on the
-- buttons, hints) and the mouse (buttons alone, mouse help).
local function gamepadChanged()
    local Cfg = Ding.Config
    if Cfg and Cfg.frame and Cfg.frame:IsShown() then
        Ding:Safe(Cfg.RefreshRows, Cfg)
        Ding:Safe(Cfg.UpdateHelp, Cfg)
    end
    local W = Ding.ImportWindow
    if W and W.frame and W.frame:IsShown() then Ding:Safe(W.Refresh, W) end
    local F = Ding.Finder
    if F and F.frame and F.frame:IsShown() then Ding:Safe(F.Layout, F) end
    local S = Ding.Setup
    if S and S:IsShown() then Ding:Safe(S.Layout, S) end
    if G.moving then Ding:Safe(plateHelp, G.plate) end
    if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
end
Ding:On("GAME_PAD_CONNECTED", gamepadChanged)
Ding:On("GAME_PAD_DISCONNECTED", gamepadChanged)
