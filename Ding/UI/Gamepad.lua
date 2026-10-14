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
    { name = "ALT", prefix = "ALT-", cvar = "GamePadEmulateAlt", text = "Alt", down = "IsAltKeyDown" },
    { name = "CTRL", prefix = "CTRL-", cvar = "GamePadEmulateCtrl", text = "Ctrl", down = "IsControlKeyDown" },
    { name = "SHIFT", prefix = "SHIFT-", cvar = "GamePadEmulateShift", text = "Shift", down = "IsShiftKeyDown" },
}
-- Keys never taken alone by a capture: the modifiers themselves, the mouse's two buttons.
local IGNORED_KEYS = {
    LSHIFT = true, RSHIFT = true, LCTRL = true, RCTRL = true, LALT = true, RALT = true, LMETA = true,
    RMETA = true, SHIFT = true, CTRL = true, ALT = true, META = true, UNKNOWN = true, BUTTON1 = true,
    BUTTON2 = true,
}

local function style()
    return (Ding.db and Ding.db.ui.buttonStyle == "ps") and "ps" or "xbox"
end

-- A console variable, nil when empty or "none" (the client writes it in either case).
local function cvar(name)
    local get = (C_CVar and C_CVar.GetCVar) or GetCVar
    if type(get) ~= "function" then return nil end
    local ok, value = pcall(get, name)
    if ok and type(value) == "string" and value ~= "" and value:upper() ~= "NONE" then return value end
    return nil
end

-- The modifier a gamepad button acts as (the game's gamepad settings make LT Shift, for
-- example), or nil.
local function modifierOf(button)
    for _, mod in ipairs(MODIFIERS) do
        if cvar(mod.cvar) == button then return mod end
    end
    return nil
end

-- The gamepad buttons the game makes modifiers, in binding order ({ "PADRTRIGGER", "PADLTRIGGER" }).
function G:ModifierButtons()
    local list = {}
    for _, mod in ipairs(MODIFIERS) do
        local button = cvar(mod.cvar)
        if button then list[#list + 1] = button end
    end
    return list
end

-- The button or key of a binding without its modifiers: "SHIFT-PAD1" -> "PAD1".
local function baseKey(key)
    local rest, found = key, true
    while found do
        found = false
        for _, prefix in ipairs({ "ALT-", "CTRL-", "SHIFT-", "META-" }) do
            if rest:sub(1, #prefix) == prefix and #rest > #prefix then
                rest, found = rest:sub(#prefix + 1), true
            end
        end
    end
    return rest
end

-- A gamepad button ("PAD1", "SHIFT-PADDUP"), not a key of the keyboard or the mouse.
function G:IsPadKey(key)
    return type(key) == "string" and baseKey(key):sub(1, 3) == "PAD"
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
    -- A key of the keyboard keeps its modifiers' names: "Ctrl+N", not "RT+N".
    local pad = G:IsPadKey(key)
    for _, mod in ipairs(MODIFIERS) do
        if rest:sub(1, #mod.prefix) == mod.prefix then
            rest = rest:sub(#mod.prefix + 1)
            parts[#parts + 1] = pad and cvar(mod.cvar) or { word = mod.text }
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

---------------------------------------------------------------------------
-- Saved bindings. Like the game's own Keybindings: a binding of `action` goes in the action's
-- binding context (C_KeyBindings.GetBindingContextForAction, when the client has it), a new
-- button replaces the action's buttons and a new key its keys (the other kind stays: a
-- player can have a key on the keyboard and a button on the gamepad for the same action).
---------------------------------------------------------------------------
local function contextOf(action)
    if not (C_KeyBindings and C_KeyBindings.GetBindingContextForAction) then return nil end
    local ok, context = pcall(C_KeyBindings.GetBindingContextForAction, action)
    return ok and type(context) == "number" and context or nil
end

-- The game's gamepad interface keeps its buttons in a binding context of its own while it is
-- on (WoW Forever: Enum.BindingContext.GamepadModeInGameCore); nil when off or unknown.
local function gamepadContext()
    local context = Enum and Enum.BindingContext and Enum.BindingContext.GamepadModeInGameCore
    if type(context) ~= "number" or not (C_KeyBindings and C_KeyBindings.IsBindingContextActive) then return nil end
    local ok, active = pcall(C_KeyBindings.IsBindingContextActive, context)
    return ok and active == true and context or nil
end

local function setBinding(key, action, context)
    local ok, result
    if context then
        ok, result = pcall(SetBinding, key, action, context)
    else
        ok, result = pcall(SetBinding, key, action)
    end
    return ok and result ~= false
end

local function saveBindings()
    local ok, set = pcall(GetCurrentBindingSet)
    pcall(SaveBindings, ok and set or 1)
end

-- Every key bound to `action`, in the order the game gives them (the order they were bound).
function G:BindingKeys(action)
    local context = contextOf(action)
    local ok, keys = pcall(function()
        if context then return { GetBindingKey(action, nil, context) } end
        return { GetBindingKey(action) }
    end)
    local list = {}
    if not ok then return list end
    for _, key in ipairs(keys) do
        if type(key) == "string" and key ~= "" then list[#list + 1] = key end
    end
    return list
end

-- The keys of `action` for the input in use: the gamepad's buttons while a gamepad is active,
-- the keyboard's keys without one (`pad`: that kind instead); the other kind when that one
-- has none.
function G:ShownKeys(action, pad)
    if pad == nil then pad = self:Active() end
    local mine, other = {}, {}
    for _, key in ipairs(self:BindingKeys(action)) do
        if self:IsPadKey(key) == pad then mine[#mine + 1] = key else other[#other + 1] = key end
    end
    return #mine > 0 and mine or other
end

function G:BindingKey(action)
    return self:ShownKeys(action)[1]
end

function G:BindingText(action)
    local key = self:BindingKey(action)
    return key and self:KeyName(key) or nil
end

-- Unbinds what the Keybinds row of `action` shows: its gamepad buttons, or its keys (`pad`:
-- as G:ShownKeys).
function G:Unbind(action, pad)
    local context = contextOf(action)
    for _, key in ipairs(self:ShownKeys(action, pad)) do setBinding(key, nil, context) end
    saveBindings()
end

-- Binds `key` to `action` in place of the action's keys of the same kind, and saves. False
-- when the game refuses the key: the action keeps the keys it had.
function G:Bind(action, key)
    local context = contextOf(action)
    local pad, removed = self:IsPadKey(key), {}
    for _, old in ipairs(self:BindingKeys(action)) do
        if old ~= key and self:IsPadKey(old) == pad then
            setBinding(old, nil, context)
            removed[#removed + 1] = old
        end
    end
    if not setBinding(key, action, context) then
        for _, old in ipairs(removed) do setBinding(old, action, context) end
        return false
    end
    saveBindings()
    return true
end

-- Addons known by the frames and commands of their override bindings.
local ADDONS = {
    { find = "controllerkeyboard", name = "Easy Controller" },
    { find = "easycontroller", name = "Easy Controller" },
    { find = "consoleport", name = "ConsolePort" },
}

local function bindingName(action)
    local name = _G["BINDING_NAME_" .. action]
    if type(name) == "string" and name ~= "" then return name end
    return nil
end

local function actionAt(key, checkOverride, context)
    local ok, action
    if context then
        ok, action = pcall(GetBindingAction, key, checkOverride, context)
    else
        ok, action = pcall(GetBindingAction, key, checkOverride)
    end
    return ok and type(action) == "string" and action or ""
end

-- Who else has `key`, the one that wins first, or nil:
--   { kind = "addon", name }    another addon's override binding (Easy Controller...): it would
--                               win over Ding's binding, which Ding never takes from it;
--   { kind = "gamepad", name }  the game's gamepad interface (its own bindings, while it is on);
--   { kind = "binding", name, action }  a saved binding of the game or of Ding, which A replaces.
function G:WhoUses(action, key)
    local saved = actionAt(key, false)
    local over = actionAt(key, true)
    -- Ding's own temporary bindings (the windows' navigation) are not in the way.
    if over ~= "" and over ~= saved and over ~= action and not over:find("^CLICK Ding") then
        local lower = over:lower()
        for _, addon in ipairs(ADDONS) do
            if lower:find(addon.find, 1, true) then return { kind = "addon", name = addon.name, action = over } end
        end
        return { kind = "addon", name = L.BIND_SOMEONE, action = over }
    end
    local context = gamepadContext()
    local own = context and actionAt(key, false, context) or ""
    if own ~= "" and own ~= saved and own ~= action then
        return { kind = "gamepad", name = bindingName(own), action = own }
    end
    if saved ~= "" and saved ~= action then
        return { kind = "binding", name = bindingName(saved) or saved, action = saved }
    end
    return nil
end

---------------------------------------------------------------------------
-- "Open Ding! settings" on the gamepad from the start. Wished: RB + Up (beside Easy
-- Controller's RB + Down). The game binds a button with Shift, Ctrl or Alt only, which its
-- gamepad settings give to some buttons, and Ding never changes those settings: RB + Up when
-- RB already is one of them, else LT + Start, else RT + Start (Start with a trigger: a
-- combination the game's gamepad interface leaves free; a trigger with the D-pad or a face
-- button is a slot of its gamepad bars). Once per account, with a gamepad in use, never over a
-- button the action has, nor over a key in use (G:WhoUses: another addon, the game).
---------------------------------------------------------------------------
function G:DefaultConfigKeys()
    local list = {}
    for _, pair in ipairs({ { "PADRSHOULDER", "PADDUP" }, { "PADLTRIGGER", "PADFORWARD" }, { "PADRTRIGGER", "PADFORWARD" } }) do
        local mod = modifierOf(pair[1])
        if mod then list[#list + 1] = mod.prefix .. pair[2] end
    end
    return list
end

-- Returns the key bound, or nil (nothing to do, or nothing free).
function G:BindDefaultConfig()
    local ui = Ding.db.ui
    if ui.configKeyDone or InCombatLockdown() or not self:Active() then return nil end
    ui.configKeyDone = true
    for _, key in ipairs(self:BindingKeys("DING_CONFIG")) do
        if self:IsPadKey(key) then return nil end
    end
    for _, key in ipairs(self:DefaultConfigKeys()) do
        if not self:WhoUses("DING_CONFIG", key) and self:Bind("DING_CONFIG", key) then return key end
    end
    return nil
end

-- How to open the settings, in words (the chat's /ding help): their key or button first.
function G:OpenText()
    local key = self:BindingKey("DING_CONFIG")
    if key then return L.HELP_OPEN_KEY:format(self:KeyName(key)) end
    return L.HELP_OPEN
end

-- Who else has `key`, in words, with what A (a click) and B (a right click) do: a saved
-- binding is replaced; a key another addon or the game's gamepad interface also uses is bound
-- anyway, theirs possibly winning in play (reported: refusing Easy Controller's keys left
-- nothing to bind).
function G:ConflictText(key, who)
    local pad = self:Active()
    if who.kind == "binding" then return (pad and L.BIND_CONFLICT or L.BIND_CONFLICT_MOUSE):format(who.name) end
    if who.kind == "gamepad" then
        return (pad and L.BIND_ALSO_GAMEPAD or L.BIND_ALSO_GAMEPAD_MOUSE):format(self:KeyName(key))
    end
    return (pad and L.BIND_ALSO_ADDON or L.BIND_ALSO_ADDON_MOUSE):format(self:KeyName(key), who.name)
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
            UI.Color(item.label, UI.C.text)
        end)
        b:SetScript("OnLeave", function()
            item.hover:Hide()
            UI.Color(item.label, item.button.key and UI.C.text or UI.C.secondary)
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
            UI.Color(item.label, button and UI.C.text or UI.C.secondary)
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
-- Other gamepad addons (docs/compatibility.md): Ding's windows take their buttons whatever
-- another addon does (reported: waiting for Easy Controller's windows left Ding unusable), and
-- Ding never changes the game's gamepad settings (GamePadEmulate...: the modifiers Easy
-- Controller sets up). G:HasWindow() tells them a Ding window holds the gamepad, for them to
-- leave it alone meanwhile if they wish.
---------------------------------------------------------------------------
-- A Ding window (settings, setup assistant, NPC directory, import / export, focus mode, move
-- mode) holds the gamepad's buttons.
function G:HasWindow()
    return self.owner ~= nil
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
-- Capturing a button, a combination or a key (key binding rows)
--
-- The capture reads the buttons themselves (OnGamePadButtonDown / Up, OnKeyDown), with
-- Ding's navigation bindings released until it ends, and lets nothing through to the game.
-- A gamepad button is taken on its release when it was pressed alone, so that a held button
-- can start a combination: a second button while it is held makes "LT+A". The game binds a
-- button with Shift, Ctrl or Alt only, which its gamepad settings give to some buttons
-- (GamePadEmulateShift / Ctrl / Alt: LT, RT...): a combination is taken on its second
-- button when the first is one of those, and refused in words otherwise.
-- B tapped alone cancels; held HOLD_B seconds it is taken like any button. Escape cancels
-- too, and so does a wait of CAPTURE_TIMEOUT seconds without a press.
---------------------------------------------------------------------------
local HOLD_B, CAPTURE_TIMEOUT = 1, 20
G.HOLD_B, G.CAPTURE_TIMEOUT = HOLD_B, CAPTURE_TIMEOUT

local capture -- the capture in progress: { held = { [button] = time }, single, spoiled, last, opts }

local function isDown(fnName)
    local fn = _G[fnName]
    if type(fn) ~= "function" then return false end
    local ok, down = pcall(fn)
    return ok and down == true
end

-- "ALT-CTRL-SHIFT-" as far as held: the keyboard's modifiers, and the gamepad buttons of
-- `held` the game makes modifiers.
local function modifierPrefix(held)
    local prefix = ""
    for _, mod in ipairs(MODIFIERS) do
        local down = isDown(mod.down)
        if not down and held then
            local button = cvar(mod.cvar)
            down = button ~= nil and held[button] ~= nil
        end
        if down then prefix = prefix .. mod.prefix end
    end
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
    local opts = capture and capture.opts or {}
    capture = nil
    setCaptureInput(frame, false)
    frame:Hide()
    if self.owner then applyNav(self.owner, self.keys or NAV_KEYS) end
    if opts.done then opts.done(key) end
end

-- A word on what was just pressed, the capture going on (a combination the game cannot make).
local function say(text)
    if capture and capture.opts.say then capture.opts.say(text) end
end

-- The key is taken, unless the caller refuses it (another addon has it...): it says why and
-- the capture waits for another button.
local function take(key)
    local why = capture.opts.refuse and capture.opts.refuse(key)
    if why then
        say(why)
        capture.spoiled = next(capture.held) ~= nil
        return
    end
    G:StopCapture(key)
end

-- "RB + Up" refused: the game joins a button with its modifiers only (LT, RT...).
local function comboText(first, button)
    local combo = G:ButtonName(first) .. "+" .. G:ButtonName(button)
    local mods = {}
    for _, b in ipairs(G:ModifierButtons()) do mods[#mods + 1] = G:ButtonName(b) end
    if #mods == 0 then return L.BIND_NO_MODIFIER:format(combo) end
    return L.BIND_NOT_MODIFIER:format(combo, table.concat(mods, L.BIND_OR))
end

local function onPadDown(button)
    local c = capture
    if not c then return true end
    c.last = GetTime()
    if c.held[button] then return false end
    local first
    for b in pairs(c.held) do
        if not modifierOf(b) then first = b end
    end
    c.held[button] = c.last
    -- A modifier waits for the button it goes with; a button pressed after a refusal waits
    -- for every button to be up.
    if modifierOf(button) or c.spoiled then return false end
    if first then
        c.single, c.spoiled = nil, true
        say(comboText(first, button))
        return false
    end
    local prefix = modifierPrefix(c.held)
    if prefix ~= "" then
        take(prefix .. button)
    else
        c.single = button
    end
    return false
end

local function onPadUp(button)
    local c = capture
    if not c then return true end
    c.held[button] = nil
    if c.spoiled then
        if not next(c.held) then c.spoiled = nil end
        return false
    end
    if c.single == button then
        c.single = nil
        if button == "PAD2" then
            G:StopCapture(nil)
        else
            take(modifierPrefix(c.held) .. button)
        end
    end
    return false
end

local function onKeyDown(key)
    local c = capture
    if not c or type(key) ~= "string" then return end
    -- Some clients send the gamepad's buttons here too: the same press is read once.
    if G:IsPadKey(key) then
        onPadDown(baseKey(key))
        return
    end
    c.last = GetTime()
    if IGNORED_KEYS[key] then return end
    local prefix = modifierPrefix(c.held)
    if key == "ESCAPE" and prefix == "" then
        G:StopCapture(nil)
        return
    end
    take(prefix .. key)
end

local function onKeyUp(key)
    if not (capture and type(key) == "string" and G:IsPadKey(key)) then return end
    if capture.held[baseKey(key)] then onPadUp(baseKey(key)) end
end

-- B held long enough is taken; a capture left alone ends.
local function onCaptureUpdate()
    local c = capture
    if not c then return end
    local now = GetTime()
    if c.single == "PAD2" and c.held.PAD2 and now - c.held.PAD2 >= HOLD_B then
        c.single = nil
        take(modifierPrefix(c.held) .. "PAD2")
    elseif now - c.last >= CAPTURE_TIMEOUT then
        G:StopCapture(nil)
    end
end

-- opts.done(key): the key taken ("SHIFT-PADDRIGHT"), nil when cancelled;
-- opts.refuse(key) -> text or nil: why that key cannot be taken (the capture goes on);
-- opts.say(text): a word for the player while the capture goes on.
-- (A function alone is opts.done.)
function G:Capture(opts)
    if type(opts) == "function" then opts = { done = opts } end
    local frame = self.captureFrame
    if not frame then
        frame = CreateFrame("Frame", "DingCaptureFrame", UIParent)
        frame:SetAllPoints(UIParent)
        frame:SetFrameStrata("FULLSCREEN_DIALOG")
        -- SetScript errors on script types the client does not know. A gamepad handler that
        -- returns false keeps the button from the game.
        pcall(frame.SetScript, frame, "OnGamePadButtonDown", function(_, button) return onPadDown(button) end)
        pcall(frame.SetScript, frame, "OnGamePadButtonUp", function(_, button) return onPadUp(button) end)
        pcall(frame.SetScript, frame, "OnKeyDown", function(_, key) onKeyDown(key) end)
        pcall(frame.SetScript, frame, "OnKeyUp", function(_, key) onKeyUp(key) end)
        frame:SetScript("OnUpdate", onCaptureUpdate)
        frame:Hide()
        self.captureFrame = frame
    end
    if frame:IsShown() then self:StopCapture(nil) end
    capture = { held = {}, last = GetTime(), opts = opts }
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
    plate.look = UI.Window(plate, "dialog")
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
