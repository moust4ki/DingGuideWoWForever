-- Guides as text, in Ding's own window (/ding import, /ding export, the Guide tab's page of
-- imported guides): the text in a box (paste with Ctrl+V, copy with Ctrl+C), what Ding found
-- under it in a second box (plain text, to copy back to whoever wrote the guide), and the
-- buttons. Gamepad: D-pad left / right between the buttons, A presses the focused one, Y
-- selects the text (or the report) for Ctrl+C, B closes; temporary bindings, out of combat
-- only. Each action shows once: a button carries its chips (A when focused, B on the one that
-- closes), the hint bar the actions without a button. Mouse and keyboard: the buttons are
-- clicked, Esc closes.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C

local W = {}
Ding.ImportWindow = W

local WIDTH, HEIGHT, PAD, TITLE, FOOTER = 560, 440, 12, 32, 40
local TEXT_HEIGHT, REPORT_HEIGHT = 196, 104
local KEYS = { "PADDLEFT", "PADDRIGHT", "PAD1", "PAD2", "PAD4" }

local function G() return Ding.Gamepad end

---------------------------------------------------------------------------
-- Keyboard focus
---------------------------------------------------------------------------
-- Ding never takes the keyboard from a box that is not one of its own: the game's chat box
-- above all, which still has it while /ding export or /ding import runs from it. Taken away
-- inside Ding's code, the chat's own focus-lost handler runs in Ding's name, and with the
-- game's gamepad interface it ends in actions only the Blizzard UI may take (the game's
-- "AddOn blocked" popup, in game, 13/10/2026). The box waits until the keyboard is free.
local function keyboardTaken()
    if type(GetCurrentKeyBoardFocus) ~= "function" then return false end
    local ok, focus = pcall(GetCurrentKeyBoardFocus)
    if not ok or focus == nil then return false end
    local f = W.frame
    return not (f and (focus == f.text.edit or focus == f.report.edit))
end

-- The box takes the keyboard (its text selected with `select`), now or once it is free.
function W:Focus(box, select)
    local f = self.frame
    if keyboardTaken() then
        self.pendingFocus = { box = box, select = select }
        if (f.status:GetText() or "") == "" then
            f.status:SetText(L.IMPORT_WAIT_KEYBOARD)
            f.status:SetTextColor(unpack(C.secondary))
        end
        return false
    end
    self.pendingFocus = nil
    if f.status:GetText() == L.IMPORT_WAIT_KEYBOARD then f.status:SetText("") end
    box.edit:SetFocus()
    if select then box.edit:HighlightText() end
    return true
end

function W:OnUpdate()
    local pending = self.pendingFocus
    if pending and not keyboardTaken() then self:Focus(pending.box, pending.select) end
end

---------------------------------------------------------------------------
-- Pieces
---------------------------------------------------------------------------
-- A box of text that scrolls: a multi-line edit box in a scroll frame. A read-only box (or
-- a text set locked) puts its text back when it is typed into (selecting and Ctrl+C still
-- work).
local function textBox(parent, height, readOnly)
    local box = CreateFrame("Frame", nil, parent)
    box:SetHeight(height)
    box.bg = UI.Shape(box, "row", C.control, "BACKGROUND"):Place(box)
    local scroll = CreateFrame("ScrollFrame", nil, box)
    scroll:SetPoint("TOPLEFT", box, "TOPLEFT", 8, -6)
    scroll:SetPoint("BOTTOMRIGHT", box, "BOTTOMRIGHT", -8, 6)
    scroll:EnableMouseWheel(true)
    local edit = CreateFrame("EditBox", nil, scroll)
    edit:SetMultiLine(true)
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(0)
    edit:SetFontObject(UI.Font("regular", 11))
    edit:SetTextColor(unpack(readOnly and C.secondary or C.text))
    edit:SetWidth(WIDTH - 2 * PAD - 16)
    edit:SetHeight(height - 12)
    scroll:SetScrollChild(edit)
    scroll:SetScript("OnMouseWheel", function(self, delta)
        local range = self:GetVerticalScrollRange() or 0
        self:SetVerticalScroll(math.max(0, math.min(range, self:GetVerticalScroll() - delta * 28)))
    end)
    -- The cursor stays in view while typing or moving through the text.
    edit:SetScript("OnCursorChanged", function(_, _, y, _, h)
        local top, view = scroll:GetVerticalScroll(), scroll:GetHeight()
        y = -(y or 0)
        if y < top then
            scroll:SetVerticalScroll(y)
        elseif y + (h or 0) > top + view then
            scroll:SetVerticalScroll(y + (h or 0) - view)
        end
    end)
    edit:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
        W:Close()
    end)
    edit:SetScript("OnTextChanged", function(self, typed)
        if typed and self.fixed then
            self:SetText(self.fixed)
            self:HighlightText()
        end
    end)
    box:EnableMouse(true)
    box:SetScript("OnMouseDown", function() W:Focus(box) end)
    function box:SetValue(text, locked)
        edit.fixed = (readOnly or locked) and text or nil
        edit:SetText(text)
        scroll:SetVerticalScroll(0)
    end
    function box:GetValue() return edit:GetText() or "" end
    -- Everything selected, ready for Ctrl+C.
    function box:SelectAll() W:Focus(box, true) end
    box.scroll, box.edit = scroll, edit
    return box
end

local function newButton(parent, index)
    local b = CreateFrame("Button", nil, parent)
    b:SetHeight(26)
    b:RegisterForClicks("LeftButtonUp")
    b.bg = UI.Shape(b, "row", C.control, "BACKGROUND"):Place(b)
    b.hover = UI.Shape(b, "row", C.hover, "BACKGROUND", 1):Place(b)
    b.hover:Hide()
    b.focus = UI.Focus(b, true)
    b.text = UI.Text(b, "medium", 12, C.text)
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b:SetScript("OnClick", function() W:Press(index) end)
    b:SetScript("OnEnter", function()
        b.hover:Show()
        W:SetFocus(index)
    end)
    b:SetScript("OnLeave", function() b.hover:Hide() end)
    return b
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
function W:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingImport", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetSize(WIDTH, HEIGHT)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 40)
    f.look = UI.Window(f)
    f.title = UI.Text(f, "semibold", 13, C.text)
    f.title:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -10)
    f.help = UI.Text(f, "regular", 11, C.secondary)
    f.help:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -TITLE)
    f.help:SetPoint("TOPRIGHT", f, "TOPRIGHT", -PAD, -TITLE)
    f.help:SetJustifyH("LEFT")
    f.text = textBox(f, TEXT_HEIGHT, false)
    f.text:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -(TITLE + 20))
    f.text:SetPoint("TOPRIGHT", f, "TOPRIGHT", -PAD, -(TITLE + 20))
    f.status = UI.Text(f, "medium", 12, C.text)
    f.status:SetPoint("TOPLEFT", f.text, "BOTTOMLEFT", 0, -10)
    f.status:SetPoint("TOPRIGHT", f.text, "BOTTOMRIGHT", 0, -10)
    f.status:SetJustifyH("LEFT")
    f.report = textBox(f, REPORT_HEIGHT, true)
    f.report:SetPoint("TOPLEFT", f.status, "BOTTOMLEFT", 0, -6)
    f.report:SetPoint("TOPRIGHT", f.status, "BOTTOMRIGHT", 0, -6)
    f.buttons = {}
    f.hints = G():NewHintBar(f, WIDTH / 2, 22, function(key) W:OnKey(key) end)
    f.hints:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", PAD, 9)
    f:SetScript("OnHide", function() W:OnHide() end)
    f:SetScript("OnUpdate", function() if W.pendingFocus then Ding:Safe(W.OnUpdate, W) end end)
    f:Hide()
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingImport") end
    self.frame = f
end

-- The buttons of the moment: { label, run, primary, key }, laid out from the right; `key`:
-- the gamepad button that presses it wherever the focus is (B for the one that closes).
function W:SetButtons(list)
    self.actions = list
    self:LayoutButtons()
    self:SetFocus(1)
end

-- With a gamepad, every button keeps room for its chips (A, and its own key), so that it does
-- not grow when the focus comes to it.
function W:LayoutButtons()
    local f, list = self.frame, self.actions
    local pad = G():Active()
    local x = -PAD
    for i = #list, 1, -1 do
        local b = f.buttons[i] or newButton(f, i)
        f.buttons[i] = b
        local action = list[i]
        b.text:SetText(action.label)
        b.bg:SetColor(action.primary and C.accent or C.control)
        b.text:SetTextColor(unpack(action.primary and C.onAccent or C.text))
        local room = pad and UI.KeysWidth({ "PAD1", action.key }) or 0
        b:SetWidth(math.max(88, b.text:GetStringWidth() + 28 + room))
        b:ClearAllPoints()
        b:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", x, 8)
        x = x - b:GetWidth() - 8
        b:Show()
    end
    for i = #list + 1, #f.buttons do f.buttons[i]:Hide() end
    self.buttonsWidth = -x - PAD - 8
end

function W:SetFocus(index)
    self.focusIndex = math.max(1, math.min(index or 1, #(self.actions or {})))
    local pad = G():Active()
    for i, b in ipairs(self.frame.buttons) do
        local action = self.actions[i]
        local focused = i == self.focusIndex and b:IsShown()
        b.focus:SetShown(pad and focused)
        local keys = {}
        if pad and focused then keys[#keys + 1] = "PAD1" end
        if pad and action and action.key then keys[#keys + 1] = action.key end
        UI.ButtonKeys(b, keys, action and action.primary)
    end
    self:UpdateHelp()
end

-- The hint bar: what has no button (Y selects for Ctrl+C, unless a button does it), or the
-- mouse help. Left of the buttons, or on a line of its own above them when it does not fit
-- there (long languages, three buttons): the window grows by that line.
local LINE = 30
function W:UpdateHelp()
    local f = self.frame
    local hints
    if G():Active() then
        hints = {}
        local selects = false
        for _, action in ipairs(self.actions or {}) do
            if action.key == "PAD4" then selects = true end
        end
        if not selects then hints[#hints + 1] = UI.Hint("PAD4", L.IMPORT_SELECT) end
    else
        hints = { UI.Hint(nil, self.mode == "export" and L.EXPORT_MOUSE or L.IMPORT_MOUSE) }
    end
    local full = WIDTH - 2 * PAD
    f.hints:SetRoom(math.max(0, full - (self.buttonsWidth or 0) - 16))
    f.hints:SetHints(hints)
    local below = f.hints.shown < #hints
    if below then
        f.hints:SetRoom(full)
        f.hints:SetHints(hints)
    end
    f.hints:ClearAllPoints()
    f.hints:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", PAD, 9 + (below and LINE or 0))
    f:SetHeight(HEIGHT + (below and LINE or 0))
end

-- A gamepad plugged in or out (Ding.Gamepad): chips and help again.
function W:Refresh()
    if not self.actions then return end
    self:LayoutButtons()
    self:SetFocus(self.focusIndex)
end

function W:Press(index)
    local action = self.actions and self.actions[index or self.focusIndex]
    if action then action.run() end
end

-- What Ding found: a colored line, then one plain line per problem (copied as they are).
function W:ShowReport(status, color, report)
    local f = self.frame
    f.status:SetText(status or "")
    f.status:SetTextColor(unpack(color or C.text))
    local lines = {}
    for _, line in ipairs(report and report.errors or {}) do lines[#lines + 1] = L.IMPORT_ERROR_LINE:format(line) end
    for _, line in ipairs(report and report.warnings or {}) do lines[#lines + 1] = L.IMPORT_WARNING_LINE:format(line) end
    f.report:SetValue(table.concat(lines, "\n"))
    f.report:SetShown(#lines > 0)
end

---------------------------------------------------------------------------
-- Import
---------------------------------------------------------------------------
function W:Import()
    local packId, report = Ding.Import:Import(self.frame.text:GetValue())
    if not packId then
        self:ShowReport(L.IMPORT_FAILED:format(#report.errors, #report.warnings), C.todo, report)
        return false
    end
    local pack = Ding:GetGuidePack(packId)
    local steps = 0
    for _, guide in Ding:IterateGuides(packId) do steps = steps + #guide.steps end
    self.imported = packId
    self:ShowReport(L.IMPORT_DONE:format(pack and pack.title or packId, steps, #report.warnings), C.done, report)
    self:SetButtons({
        { label = L.IMPORT_FOLLOW, primary = true, run = function() W:Follow() end },
        { label = L.IMPORT_ANOTHER, run = function() W:Open("import", nil, W.back) end },
        { label = L.IMPORT_CLOSE, key = "PAD2", run = function() W:Close() end },
    })
    return true
end

-- The imported guide becomes the character's guide.
function W:Follow()
    local packId = self.imported
    self.back = nil
    self:Close()
    if packId then Ding.Engine:SetPack(packId) end
end

---------------------------------------------------------------------------
-- Opening
---------------------------------------------------------------------------
-- mode: "import", or "export" with `id` (a pack or a guide; the active guide when nil).
-- back: run once the window closes (the settings page it was opened from).
function W:Open(mode, id, back)
    if InCombatLockdown() then
        Ding:Print(L.CONFIG_COMBAT)
        return false
    end
    local text
    if mode == "export" then
        text = Ding.Import:Export(id, false)
        if not text then
            Ding:Print(L.EXPORT_NONE:format(id or ""))
            return false
        end
    end
    self:Create()
    local f = self.frame
    if Ding.Config.frame and Ding.Config.frame:IsShown() then Ding.Config:Close() end
    if Ding.Finder.frame and Ding.Finder.frame:IsShown() then Ding.Finder:Close() end
    if Ding.Panel.focusing then Ding.Panel:StopFocus() end
    self.mode, self.exportId, self.compact, self.imported = mode, id, false, nil
    self.back = back
    self:ShowReport(nil)
    if mode == "export" then
        local guide = Ding:GetGuidePack(id or "") or Ding:GetGuide(id or "") or Ding.Engine.guide
        f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.EXPORT_TITLE:format(guide and guide.title or ""))
        f.help:SetText(L.EXPORT_HELP)
        f.text:SetValue(text, true)
        self:SetButtons({
            { label = L.EXPORT_SELECT, primary = true, key = "PAD4", run = function() W.frame.text:SelectAll() end },
            { label = L.EXPORT_ONE_LINE, run = function() W:ToggleCompact() end },
            { label = L.IMPORT_CLOSE, key = "PAD2", run = function() W:Close() end },
        })
    else
        f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.IMPORT_TITLE)
        f.help:SetText(L.IMPORT_HELP)
        f.text:SetValue("")
        self:SetButtons({
            { label = L.IMPORT_BUTTON, primary = true, run = function() W:Import() end },
            { label = L.IMPORT_CANCEL, key = "PAD2", run = function() W:Close() end },
        })
    end
    if not f:IsShown() then
        f:Show()
        G():Take(f, function(key) W:OnKey(key) end, 0.4, 0.12, KEYS)
    end
    self:Focus(f.text, mode == "export")
    return true
end

-- The exported text in full, or on one line (safe for the chat).
function W:ToggleCompact()
    self.compact = not self.compact
    local text = Ding.Import:Export(self.exportId, self.compact)
    if not text then return end
    self.frame.text:SetValue(text, true)
    self.actions[2].label = self.compact and L.EXPORT_FULL or L.EXPORT_ONE_LINE
    self:SetButtons(self.actions)
    self:SetFocus(2)
    self.frame.text:SelectAll()
end

function W:Close()
    if self.frame then self.frame:Hide() end
end

function W:OnHide()
    local f = self.frame
    if not f then return end
    G():Release(f)
    self.pendingFocus = nil
    f.text.edit:ClearFocus()
    f.report.edit:ClearFocus()
    local back = self.back
    self.back = nil
    if back and not InCombatLockdown() then back() end
end

function W:OnKey(key)
    local count = #(self.actions or {})
    if key == "PADDLEFT" then
        self:SetFocus(self.focusIndex <= 1 and count or self.focusIndex - 1)
    elseif key == "PADDRIGHT" then
        self:SetFocus(self.focusIndex >= count and 1 or self.focusIndex + 1)
    elseif key == "PAD1" then
        self:Press()
    elseif key == "PAD4" then
        local f = self.frame
        if self.mode ~= "export" and f.report:IsShown() then f.report:SelectAll() else f.text:SelectAll() end
    elseif key == "PAD2" then
        self:Close()
    end
end

Ding:On("PLAYER_REGEN_DISABLED", function() W:Close() end)
