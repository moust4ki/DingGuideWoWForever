-- "Report a problem" (binding DING_REPORT, the guide window's flag button beside the
-- directory's pin, /ding bug): Ding's own window, in two pages. First what the report will
-- contain, in plain words (the facts are read when the window opens: Core/Report.lua), what
-- went wrong (four ready reasons: a gamepad types little) and the player's words (optional;
-- the box takes the keyboard only once no other box has it: the game's chat above all). Then
-- "Create the text": in the order the player goes (Yendi, in game), 1. the address of the
-- GitHub form, whole on its line and selected first, 2. the report in a read-only box; each
-- button selects its box for Ctrl+C (an addon cannot write the clipboard: the window says so);
-- then where Ding keeps the last reports for a player without a keyboard (DingDB.reports).
-- Gamepad (temporary bindings, out of combat only): the D-pad up / down between the reasons,
-- the box and the buttons, left / right along the buttons, A picks or presses, Y selects the
-- text, B closes. Each action shows once: A on the focused row or button, Y on "Select the
-- text", B by the close cross; the footer is the mouse help without a gamepad. Mouse: hover and
-- click, right click or Esc closes.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C

local W = {}
Ding.ReportWindow = W

local SIZE = UI.SIZE
-- 560 wide, as the import window: the GitHub address fits its box whole (LINK_FONT).
local WIDTH, TITLE, PAD, INSET, BUTTON = 560, SIZE.title, 12, SIZE.pad, SIZE.button
local EDGE, LINE = 8, 30                         -- the footer's margins; a hint line above the buttons
local FOOTER = EDGE + BUTTON + EDGE
local HEADER, GAP, ROW_GAP = 20, 4, SIZE.gap
local ROW_PAD, ROW_MIN = 6, 28                   -- a reason's margin above and below; its height
local ROW_WIDTH = WIDTH - 2 * INSET
local MARK, CHIP = 8 + 16 + 10, 24               -- the radio mark before a reason; room for the A chip
local COMMENT_HEIGHT, TEXT_HEIGHT, LINK_HEIGHT = 52, 196, 26
-- The address in 10: 432 units in Noto Sans (475 in 11, which the game cut in a 520 window).
local LINK_FONT = 10
W.WIDTH, W.LINK_FONT = WIDTH, LINK_FONT
local QUESTS_SHOWN = 3
local KEYS = { "PADDUP", "PADDDOWN", "PADDLEFT", "PADDRIGHT", "PAD1", "PAD2", "PAD4", "PADFORWARD" }

local function G() return Ding.Gamepad end
local function R() return Ding.Report end

---------------------------------------------------------------------------
-- Keyboard focus (as the import window: UI/ImportWindow.lua)
---------------------------------------------------------------------------
-- Ding never takes the keyboard from a box that is not one of its own (the chat's still has it
-- while /ding bug runs): taken away in Ding's code, the chat's focus-lost handler runs in Ding's
-- name and the game blocks it with its gamepad interface on. The box waits until it is free.
local function ownBox(focus)
    local f = W.frame
    return f and (focus == f.comment.edit or focus == f.text.edit or focus == f.link.edit)
end

local function keyboardTaken()
    if type(GetCurrentKeyBoardFocus) ~= "function" then return false end
    local ok, focus = pcall(GetCurrentKeyBoardFocus)
    if not ok or focus == nil then return false end
    return not ownBox(focus)
end

-- The status line of the page on screen: what the window waits for.
local function setStatus(text)
    local f = W.frame
    local status = W.page == "done" and f.doneStatus or f.formStatus
    status:SetText(text or "")
end

-- The box takes the keyboard (its text selected with `select`), now or once it is free.
function W:Focus(box, select)
    if keyboardTaken() then
        self.pendingFocus = { box = box, select = select }
        setStatus(L.IMPORT_WAIT_KEYBOARD)
        self:Layout()
        return false
    end
    local waited = self.pendingFocus ~= nil
    self.pendingFocus = nil
    if waited then
        setStatus(nil)
        self:Layout()
    end
    box.edit:SetFocus()
    if select then box.edit:HighlightText() end
    box:UpdatePlaceholder()
    return true
end

function W:OnUpdate()
    local pending = self.pendingFocus
    if pending and not keyboardTaken() then self:Focus(pending.box, pending.select) end
end

---------------------------------------------------------------------------
-- Pieces
---------------------------------------------------------------------------
-- A box of text: a multi-line edit box that scrolls, or one line (`single`). A read-only box
-- puts its text back when it is typed into (selecting and Ctrl+C still work). `placeholder`:
-- a line shown while the box is empty and has not the keyboard.
local function textBox(parent, height, opts)
    local box = CreateFrame("Frame", nil, parent)
    box:SetHeight(height)
    box.bg = UI.Shape(box, "row", C.control, "BACKGROUND"):Place(box)
    local edit
    if opts.single then
        edit = CreateFrame("EditBox", nil, box)
        edit:SetPoint("TOPLEFT", box, "TOPLEFT", 8, -4)
        edit:SetPoint("BOTTOMRIGHT", box, "BOTTOMRIGHT", -8, 4)
    else
        local scroll = CreateFrame("ScrollFrame", nil, box)
        scroll:SetPoint("TOPLEFT", box, "TOPLEFT", 8, -6)
        scroll:SetPoint("BOTTOMRIGHT", box, "BOTTOMRIGHT", -8, 6)
        scroll:EnableMouseWheel(true)
        edit = CreateFrame("EditBox", nil, scroll)
        edit:SetMultiLine(true)
        edit:SetWidth(ROW_WIDTH - 16)
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
        box.scroll = scroll
    end
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(opts.readOnly and 0 or 500)
    edit:SetFontObject(UI.Font("regular", opts.size or 11))
    UI.Color(edit, opts.readOnly and C.secondary or C.text)
    if opts.placeholder then
        box.placeholder = UI.Text(box, "regular", 11, C.muted)
        box.placeholder:SetPoint("TOPLEFT", box, "TOPLEFT", 8, -6)
        box.placeholder:SetWidth(ROW_WIDTH - 16)
        box.placeholder:SetJustifyH("LEFT")
    end
    function box:UpdatePlaceholder()
        if not self.placeholder then return end
        self.placeholder:SetText(opts.placeholder())
        self.placeholder:SetShown((edit:GetText() or "") == "" and not edit:HasFocus())
    end
    -- Esc: out of the player's box (the words stay), or the window closes.
    edit:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
        if opts.readOnly then W:Close() end
    end)
    edit:SetScript("OnEditFocusLost", function() box:UpdatePlaceholder() end)
    edit:SetScript("OnTextChanged", function(self, typed)
        if typed and self.fixed then
            self:SetText(self.fixed)
            self:HighlightText()
        end
        box:UpdatePlaceholder()
    end)
    box:EnableMouse(true)
    box:SetScript("OnMouseDown", function() W:Focus(box) end)
    function box:SetValue(text)
        edit.fixed = opts.readOnly and text or nil
        edit:SetText(text)
        if self.scroll then self.scroll:SetVerticalScroll(0) end
        self:UpdatePlaceholder()
    end
    function box:GetValue() return edit:GetText() or "" end
    -- Everything selected, ready for Ctrl+C.
    function box:SelectAll() W:Focus(box, true) end
    box.edit = edit
    return box
end

-- A section's title ("What went wrong?").
local function header(parent)
    local t = UI.Text(parent, "semibold", 11, C.muted)
    t:SetJustifyH("LEFT")
    return t
end

-- A text that wraps, as wide as the rows.
local function paragraph(parent, weight, size, color)
    local t = UI.Text(parent, weight, size, color)
    UI.Wrap(t, size)
    t:SetJustifyH("LEFT")
    return t
end

-- A reason: a radio ring (its dot when chosen), its words, the A chip on the right (gamepad).
local function reasonRow(parent, i)
    local r = CreateFrame("Button", nil, parent)
    r:SetWidth(ROW_WIDTH)
    r:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    r.focus = UI.Focus(r)
    r.ring = UI.Icon(r, "ring", 16, C.muted, "ARTWORK")
    r.ring:SetPoint("TOPLEFT", r, "TOPLEFT", 8, -ROW_PAD)
    r.dot = UI.Icon(r, "circle", 8, C.accent, "OVERLAY")
    r.dot:SetPoint("CENTER", r.ring, "CENTER", 0, 0)
    r.label = paragraph(r, "regular", 12, C.text)
    r.label:SetPoint("TOPLEFT", r, "TOPLEFT", MARK, -ROW_PAD)
    r.key = UI.Glyph(r)
    r.key:SetKey("PAD1")
    r.key:SetPoint("RIGHT", r, "RIGHT", -8, 0)
    r.key:Hide()
    r:SetScript("OnEnter", function() W:SetFocus(i) end)
    r:SetScript("OnClick", function(_, button)
        if button == "RightButton" then return W:Close() end
        W:SetFocus(i)
        W:Choose(R().REASONS[i].key)
    end)
    return r
end

local function newButton(parent, index)
    local b = CreateFrame("Button", nil, parent)
    b:SetHeight(BUTTON)
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
        W:FocusButton(index)
    end)
    b:SetScript("OnLeave", function() b.hover:Hide() end)
    return b
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
function W:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingReport", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetSize(WIDTH, 400)
    UI.Dialog(f, 0, 40)
    f.look = UI.Window(f, "dialog")
    UI.DialogBars(f, TITLE)

    -- Title bar: "Ding! · Report a problem", B, close cross.
    f.title = UI.Text(f, "semibold", 13, C.text)
    UI.SetTitleFont(f.title, "settings")
    f.title:SetPoint("LEFT", f, "TOPLEFT", 12, -TITLE / 2)
    f.close = UI.IconButton(f, 24)
    f.close:SetPoint("RIGHT", f, "TOPRIGHT", -6, -TITLE / 2)
    f.close.label = UI.Text(f.close, "regular", 16, C.secondary)
    f.close.label:SetPoint("CENTER", f.close, "CENTER", 0, 1)
    f.close.label:SetText("×")
    f.close:SetScript("OnClick", function() W:Close() end)
    f.back = UI.Glyph(f)
    f.back:SetKey("PAD2")
    f.back:SetPoint("RIGHT", f.close, "LEFT", -8, 0)
    UI.Separator(f, -TITLE)

    -- First page: what the report holds, what went wrong, the player's words.
    local form = CreateFrame("Frame", nil, f)
    form:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -(TITLE + 1))
    form:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, -(TITLE + 1))
    f.form = form
    f.intro = paragraph(form, "regular", 12, C.text)
    f.containsTitle = header(form)
    f.parts = {}
    f.whatTitle = header(form)
    f.reasons = {}
    for i = 1, #R().REASONS do f.reasons[i] = reasonRow(form, i) end
    f.commentTitle = header(form)
    f.commentKey = UI.Glyph(form)
    f.commentKey:SetKey("PAD1")
    f.commentKey:Hide()
    f.comment = textBox(form, COMMENT_HEIGHT, { placeholder = function() return L.REPORT_COMMENT_HINT end })
    f.comment.focus = UI.Focus(f.comment, true)
    f.comment:SetScript("OnEnter", function() W:SetFocus(#f.reasons + 1) end)
    f.formStatus = paragraph(form, "regular", 11, C.secondary)

    -- Second page: the text, the link, where the reports are kept.
    local done = CreateFrame("Frame", nil, f)
    done:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -(TITLE + 1))
    done:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, -(TITLE + 1))
    f.done = done
    f.linkStep = paragraph(done, "medium", 12, C.text)
    f.link = textBox(done, LINK_HEIGHT, { readOnly = true, single = true, size = LINK_FONT })
    f.textStep = paragraph(done, "medium", 12, C.text)
    f.text = textBox(done, TEXT_HEIGHT, { readOnly = true })
    f.clipboard = paragraph(done, "regular", 11, C.secondary)
    f.saved = paragraph(done, "regular", 11, C.secondary)
    f.doneStatus = paragraph(done, "regular", 11, C.secondary)

    f.divider = UI.Divider(f, -100)
    f.buttons = {}
    f.hints = G():NewHintBar(f, WIDTH / 2, 22)
    f:SetScript("OnMouseUp", function(_, button) if button == "RightButton" then W:Close() end end)
    f:SetScript("OnHide", function() W:OnHide() end)
    f:SetScript("OnUpdate", function() if W.pendingFocus then Ding:Safe(W.OnUpdate, W) end end)
    f:Hide()
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingReport") end
    self.frame = f
end

-- A theme change: the open window again (the texts' fonts may change their heights).
UI.Theme.OnApply(function()
    if W.frame and W.frame:IsShown() then Ding:Safe(W.Layout, W) end
end)

---------------------------------------------------------------------------
-- What the report will contain, in plain words (the text itself is in English)
---------------------------------------------------------------------------
local STATE_WORDS = { log = "REPORT_STATE_LOG", ready = "REPORT_STATE_READY", turnedin = "REPORT_STATE_DONE",
    none = "REPORT_STATE_NONE" }

local function questWords(q)
    local words = L.REPORT_QUEST:format(L.QUOTE:format(q.shownName or q.name or "?"), L[STATE_WORDS[q.state]])
    local counts = {}
    for _, o in ipairs(q.objectives) do
        if o.have and o.need then counts[#counts + 1] = ("%d/%d"):format(o.have, o.need) end
    end
    if #counts > 0 then words = words .. ", " .. table.concat(counts, ", ") end
    return words
end

local function coordinate(n) return ("%.1f"):format(n or 0) end

-- The parts of the report, one sentence each.
function W:Parts(info)
    local parts = {}
    local g = info.guide
    if g then
        parts[#parts + 1] = L.REPORT_PART_GUIDE:format(g.pack or g.packId or "?", g.title or g.id)
        parts[#parts + 1] = L.REPORT_PART_STEP:format(g.number, g.total, g.index, g.summary or "")
    else
        parts[#parts + 1] = L.REPORT_NO_GUIDE
    end
    local p = info.player
    if p.map then
        parts[#parts + 1] = L.REPORT_PART_PLACE:format(p.zone or p.place or "?", coordinate(p.x), coordinate(p.y))
    else
        parts[#parts + 1] = L.REPORT_PLACE_UNKNOWN
    end
    parts[#parts + 1] = L.REPORT_PART_CHARACTER:format(p.level or "?", p.raceName or p.race or "?",
        p.className or p.class or "?", p.factionName or p.faction or "?")
    if #info.quests == 0 then
        parts[#parts + 1] = L.REPORT_QUESTS_NONE
    else
        local list = {}
        for i = 1, math.min(QUESTS_SHOWN, #info.quests) do list[i] = questWords(info.quests[i]) end
        local words = table.concat(list, "; ")
        if #info.quests > QUESTS_SHOWN then words = words .. "; " .. UI.More(#info.quests - QUESTS_SHOWN, true) end
        parts[#parts + 1] = L.REPORT_PART_QUESTS:format(words)
    end
    local a = info.arrow
    if a.label or a.map then
        local far = a.distance and L.YARDS:format(Ding.Compat.Number(a.distance))
            or (a.map and L.DISTANCE_UNKNOWN) or L.ANOTHER_CONTINENT
        parts[#parts + 1] = L.REPORT_PART_ARROW:format(a.label or "?", far)
    else
        parts[#parts + 1] = L.REPORT_ARROW_NONE
    end
    parts[#parts + 1] = L.REPORT_PART_SETTINGS
    parts[#parts + 1] = L.REPORT_PART_CLIENT:format(tostring(info.client.version))
    parts[#parts + 1] = L.REPORT_PART_PRIVATE
    return parts
end

---------------------------------------------------------------------------
-- Layout
---------------------------------------------------------------------------
-- Places a wrapped text at `y` (from the page's top); returns the y under it.
local function place(fs, page, y, text, x, width)
    fs:SetText(text or "")
    fs:SetShown((text or "") ~= "")
    if (text or "") == "" then return y end
    fs:ClearAllPoints()
    fs:SetPoint("TOPLEFT", page, "TOPLEFT", x or PAD, -math.ceil(y))
    fs:SetWidth(width or (WIDTH - 2 * PAD))
    return y + fs:GetStringHeight()
end

-- The page's status line (what the window waits for), 6 under the rest; hidden when empty.
local function status(fs, page, y)
    local text = fs:GetText() or ""
    if text == "" then
        fs:Hide()
        return y
    end
    return place(fs, page, y + 6, text)
end

local function placeBox(box, page, y)
    box:ClearAllPoints()
    box:SetPoint("TOPLEFT", page, "TOPLEFT", INSET, -math.ceil(y))
    box:SetPoint("TOPRIGHT", page, "TOPRIGHT", -INSET, -math.ceil(y))
    return y + box:GetHeight()
end

function W:LayoutForm()
    local f, pad = self.frame, G():Active()
    local page = f.form
    local y = PAD
    y = place(f.intro, page, y, L.REPORT_INTRO) + 8
    y = place(f.containsTitle, page, y, L.REPORT_CONTAINS) + GAP
    local parts = self:Parts(self.info)
    for i, text in ipairs(parts) do
        f.parts[i] = f.parts[i] or paragraph(page, "regular", 11, C.secondary)
        y = place(f.parts[i], page, y, text, PAD + 8, WIDTH - 2 * PAD - 8) + 2
    end
    for i = #parts + 1, #f.parts do f.parts[i]:Hide() end
    y = y + 8
    y = place(f.whatTitle, page, y, L.REPORT_WHAT) + GAP
    for i, reason in ipairs(R().REASONS) do
        local r = f.reasons[i]
        r.label:SetWidth(ROW_WIDTH - MARK - 8 - CHIP)
        r.label:SetText(L[reason.label])
        local chosen = self.reason == reason.key
        r.dot:SetShown(chosen)
        UI.Tint(r.ring, chosen and C.accent or C.muted)
        r:SetHeight(math.max(ROW_MIN, math.ceil(ROW_PAD * 2 + r.label:GetStringHeight())))
        r:ClearAllPoints()
        r:SetPoint("TOPLEFT", page, "TOPLEFT", INSET, -math.ceil(y))
        r:Show()
        y = y + r:GetHeight() + ROW_GAP
    end
    y = y + 8
    -- The words' title, the A chip at its right when the box is focused (gamepad).
    local chip = pad and UI.KeysWidth({ "PAD1" }) or 0
    y = place(f.commentTitle, page, y, L.REPORT_COMMENT, PAD, WIDTH - 2 * PAD - chip)
    f.commentKey:ClearAllPoints()
    f.commentKey:SetPoint("RIGHT", page, "TOPRIGHT", -INSET - 2, -math.ceil(y - 7))
    y = placeBox(f.comment, page, y + GAP)
    f.comment:UpdatePlaceholder()
    return status(f.formStatus, page, y) + PAD
end

function W:LayoutDone()
    local f = self.frame
    local page = f.done
    local y = PAD
    y = place(f.linkStep, page, y, L.REPORT_STEP_LINK) + 6
    y = placeBox(f.link, page, y) + 12
    y = place(f.textStep, page, y, L.REPORT_STEP_TEXT) + 6
    y = placeBox(f.text, page, y) + 8
    y = place(f.clipboard, page, y, L.REPORT_CLIPBOARD) + 6
    y = place(f.saved, page, y, L.REPORT_SAVED:format(R().KEEP, R().FILE))
    return status(f.doneStatus, page, y) + PAD
end

-- The page on screen, its buttons and the footer; the window as high as its content.
function W:Layout()
    local f = self.frame
    if not (f and self.page) then return end
    local pad = G():Active()
    UI.Title(f.title, L.BIND_REPORT)
    f.back:SetShown(pad)
    local form = self.page == "form"
    f.form:SetShown(form)
    f.done:SetShown(not form)
    local height = form and self:LayoutForm() or self:LayoutDone()
    local page = form and f.form or f.done
    page:SetHeight(height)
    local top = TITLE + 1 + height
    f.divider:ClearAllPoints()
    f.divider:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -top)
    f.divider:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -top)
    self:LayoutButtons()
    local below = self:UpdateHelp()
    f:SetHeight(top + 1 + FOOTER + (below and LINE or 0))
    self:ShowFocus()
end

-- The buttons of the page: { label, run, primary, key }, laid out from the right; `key`: the
-- gamepad button that presses it wherever the focus is. With a gamepad every button keeps
-- room for its chips, so that it does not grow when the focus comes to it.
function W:LayoutButtons()
    local f, list = self.frame, self.actions or {}
    local pad = G():Active()
    local x = -INSET
    for i = #list, 1, -1 do
        local b = f.buttons[i] or newButton(f, i)
        f.buttons[i] = b
        local action = list[i]
        b.text:SetText(action.label)
        b.bg:SetColor(action.primary and C.accent or C.control)
        UI.Color(b.text, action.primary and C.onAccent or C.text)
        local room = pad and UI.KeysWidth({ "PAD1", action.key }) or 0
        b:SetWidth(math.max(96, UI.Measure(b.text) + 28 + room))
        b:ClearAllPoints()
        b:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", x, EDGE)
        x = x - b:GetWidth() - 8
        b:Show()
    end
    for i = #list + 1, #f.buttons do f.buttons[i]:Hide() end
    self.buttonsWidth = -x - INSET - 8
end

-- The footer's help: nothing with a gamepad (every action has its chip), the mouse help
-- without; left of the buttons, or on a line of its own above them when it does not fit.
-- Returns true when it takes that line.
function W:UpdateHelp()
    local f = self.frame
    local hints = {}
    if not G():Active() then
        hints[1] = UI.Hint(nil, self.page == "form" and L.REPORT_MOUSE or L.EXPORT_MOUSE)
    end
    local full = WIDTH - 2 * INSET
    f.hints:SetRoom(math.max(0, full - (self.buttonsWidth or 0) - 16))
    f.hints:SetHints(hints)
    local below = f.hints.shown < #hints
    if below then
        f.hints:SetRoom(full)
        f.hints:SetHints(hints)
    end
    f.hints:ClearAllPoints()
    f.hints:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", INSET, EDGE + 1 + (below and LINE or 0))
    return below
end

---------------------------------------------------------------------------
-- Focus: the D-pad's stops on the page
---------------------------------------------------------------------------
-- The form: the reasons, the box, then the buttons; the text page: its buttons.
function W:Stops()
    local stops = {}
    if self.page == "form" then
        for i = 1, #R().REASONS do stops[#stops + 1] = { kind = "reason", i = i } end
        stops[#stops + 1] = { kind = "comment" }
    end
    for i = 1, #(self.actions or {}) do stops[#stops + 1] = { kind = "button", i = i } end
    return stops
end

function W:Focused()
    return self:Stops()[self.focus or 1]
end

function W:SetFocus(i)
    local count = #self:Stops()
    self.focus = math.max(1, math.min(count, i or 1))
    self:ShowFocus()
end

function W:FocusButton(index)
    for i, stop in ipairs(self:Stops()) do
        if stop.kind == "button" and stop.i == index then return self:SetFocus(i) end
    end
end

-- The focus ring and the A chip where the focus is (A only with a gamepad), the buttons' own
-- chips (Y on "Select the text").
function W:ShowFocus()
    local f = self.frame
    local pad = G():Active()
    local stop = self:Focused() or {}
    for i, r in ipairs(f.reasons) do
        local on = stop.kind == "reason" and stop.i == i
        r.focus:SetShown(on)
        r.key:SetShown(on and pad)
    end
    local onComment = stop.kind == "comment"
    f.comment.focus:SetShown(onComment and self.page == "form")
    f.commentKey:SetShown(onComment and pad and self.page == "form")
    for i, b in ipairs(f.buttons) do
        local action = self.actions and self.actions[i]
        local focused = stop.kind == "button" and stop.i == i and b:IsShown()
        b.focus:SetShown(pad and focused)
        local keys = {}
        if pad and focused then keys[#keys + 1] = "PAD1" end
        if pad and action and action.key then keys[#keys + 1] = action.key end
        UI.ButtonKeys(b, keys, action and action.primary)
    end
end

---------------------------------------------------------------------------
-- Actions
---------------------------------------------------------------------------
function W:Choose(key)
    self.reason = key
    self:Layout()
end

function W:Press(index)
    local action = self.actions and self.actions[index]
    if action then action.run() end
end

-- A on the focused stop: a reason is chosen (and the focus goes on to "Create the text": a
-- gamepad types little), the box takes the keyboard, a button is pressed.
function W:Activate()
    local stop = self:Focused()
    if not stop then return end
    if stop.kind == "reason" then
        self:Choose(R().REASONS[stop.i].key)
        self:FocusButton(1)
    elseif stop.kind == "comment" then
        self:Focus(self.frame.comment)
    else
        self:Press(stop.i)
    end
end

-- "Create the text": the report written and kept; the address selected for Ctrl+C first (the
-- page's first step), its button focused, then the text's.
function W:Make()
    local f = self.frame
    local comment = f.comment:GetValue()
    f.comment.edit:ClearFocus()
    self.pendingFocus = nil
    self.made = R():Make(self.info, self.reason, comment)
    self.page = "done"
    f.formStatus:SetText("")
    f.doneStatus:SetText("")
    f.text:SetValue(self.made)
    f.link:SetValue(R().ISSUE_URL)
    self.actions = {
        { label = L.REPORT_SELECT_LINK, primary = true, run = function() W.frame.link:SelectAll() end },
        { label = L.REPORT_SELECT_TEXT, key = "PAD4", run = function() W.frame.text:SelectAll() end },
    }
    self.focus = 1
    self:Layout()
    f.link:SelectAll()
end

---------------------------------------------------------------------------
-- Opening
---------------------------------------------------------------------------
function W:Open()
    if InCombatLockdown() then
        Ding:Print(L.CONFIG_COMBAT)
        return false
    end
    -- What the report holds is read before anything changes on screen.
    local info = R():Collect()
    self:Create()
    local f = self.frame
    if Ding.Config.frame and Ding.Config.frame:IsShown() then Ding.Config:Close() end
    if Ding.Finder.frame and Ding.Finder.frame:IsShown() then Ding.Finder:Close() end
    if Ding.ImportWindow.frame and Ding.ImportWindow.frame:IsShown() then Ding.ImportWindow:Close() end
    if Ding.Setup:IsShown() then Ding.Setup:Close(true) end
    if Ding.Panel.focusing then Ding.Panel:StopFocus() end
    self.info, self.reason, self.made, self.pendingFocus = info, nil, nil, nil
    self.page = "form"
    f.formStatus:SetText("")
    f.comment:SetValue("")
    self.actions = { { label = L.REPORT_CREATE, primary = true, run = function() W:Make() end } }
    self.focus = 1
    f:Show()
    self:Layout()
    G():Take(f, function(key) W:OnKey(key) end, 0.4, 0.12, KEYS)
    -- With a keyboard the words come first; with a gamepad, the ready reasons.
    if not G():Active() then self:Focus(f.comment) end
    return true
end

function W:Close()
    if self.frame then self.frame:Hide() end
end

function W:Toggle()
    if self.frame and self.frame:IsShown() then self:Close() else self:Open() end
end

function W:IsShown()
    return self.frame ~= nil and self.frame:IsShown()
end

function W:OnHide()
    local f = self.frame
    if not f then return end
    G():Release(f)
    self.pendingFocus = nil
    f.comment.edit:ClearFocus()
    f.text.edit:ClearFocus()
    f.link.edit:ClearFocus()
end

-- A gamepad plugged in or out (Ding.Gamepad): chips and help again.
function W:Refresh()
    if self:IsShown() then self:Layout() end
end

function W:OnKey(key)
    local stops = self:Stops()
    local count = #stops
    local stop = stops[self.focus or 1] or {}
    if key == "PADDUP" or key == "PADDDOWN" then
        if count > 0 then self:SetFocus(((self.focus or 1) - 1 + (key == "PADDUP" and -1 or 1)) % count + 1) end
    elseif key == "PADDLEFT" or key == "PADDRIGHT" then
        -- Along the buttons.
        local buttons = #(self.actions or {})
        if stop.kind == "button" and buttons > 1 then
            self:FocusButton((stop.i - 1 + (key == "PADDLEFT" and -1 or 1)) % buttons + 1)
        end
    elseif key == "PAD1" then
        self:Activate()
    elseif key == "PAD4" then
        if self.page == "done" then self.frame.text:SelectAll() end
    elseif key == "PAD2" or key == "PADFORWARD" then
        self:Close()
    end
end

Ding:On("PLAYER_REGEN_DISABLED", function() W:Close() end)
