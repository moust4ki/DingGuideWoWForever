-- The setup assistant ("Ding! · Setup"; Yendi: a window of text gets "next, next, next"
-- without reading, then "still too many options"): four short screens, each one line saying
-- what it is for then three choices at most, the current or recommended choice already
-- selected. 1 how you play (gamepad Xbox / PlayStation, keyboard and mouse: the button names,
-- and whether the Keybinds tab follows), 2 what Ding does for you, 3 the route (the steps behind
-- an option), 4 what to do first (a guide pack, or the current guide taken up where you are: a
-- pick ends the assistant). The help on screen (quest monster marks, the guide's explanations,
-- the NPC panel, the weapon to learn) is on by default and stays in the settings, as do the
-- rarer automations (rewards, flights). A choice writes its setting at once, as the settings
-- window does. "Keep the recommended settings" ends it from any
-- screen: every setting the player did not change here goes back to its default (Ding.DEFAULTS).
-- Shown once per account at the first launch (Config:Init), again from the Guide tab or
-- /ding intro. Gamepad (temporary bindings, out of combat only): the D-pad up / down between the
-- choices, A ticks or picks, LB / RB the screens, Y keeps the recommended settings, B closes as it
-- is. Each action once: A on the focused choice, LB on Previous, RB on Next, Y on Keep, B by the
-- close cross; no hint bar. Mouse: hover and click, Esc. Plain frames of Ding's own, nothing
-- protected, no game window touched.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C

local S = {}
Ding.Setup = S

local SIZE = UI.SIZE
local WIDTH, TITLE, PAD, INSET, BUTTON = 460, SIZE.title, 14, SIZE.pad, SIZE.button     -- [460, 32, 20, 12, 26]
local EDGE, BETWEEN = 8, 6                       -- the footer's margins; between its two lines
local FOOTER = EDGE + BUTTON + BETWEEN + BUTTON + EDGE     -- Keep, then Previous · the dots · Next
local HEADING, GAP, ROWS_TOP, ROW_GAP = 16, 4, 8, SIZE.gap     -- [16, 6, 12, 2]
local ROW_PAD, ROW_MIN = 6, 28                   -- a choice's margin above and below; its height [8, 32]
local ROW_WIDTH = WIDTH - 2 * INSET
local MARK, CHIP = 8 + 16 + 10, 24               -- the mark before a label; room for the A chip
local DOT, DOT_GAP = 14, 2
S.LAYOUT = { title = TITLE, footer = FOOTER, rowPad = ROW_PAD, inset = INSET }
local KEYS = { "PADDUP", "PADDDOWN", "PAD1", "PAD2", "PAD4", "PADLSHOULDER", "PADRSHOULDER", "PADFORWARD" }

local function G() return Ding.Gamepad end
local function ui() return Ding.db.ui end

---------------------------------------------------------------------------
-- The settings the assistant changes: get() -> boolean, set(boolean) as the settings window
-- does it, recommended() -> Ding.DEFAULTS' value.
---------------------------------------------------------------------------
local function setting(section, key, after)
    return {
        get = function()
            local v = Ding.db[section][key]
            if v == nil then v = Ding.DEFAULTS[section][key] end
            return v and true or false
        end,
        set = function(v)
            Ding.db[section][key] = v and true or false
            if after then Ding:Safe(after, v) end
        end,
        recommended = function() return Ding.DEFAULTS[section][key] and true or false end,
    }
end

local function engineUpdate() Ding.Engine:Update() end

-- Accepting and turning in: one choice for the two settings.
local QUESTS = {
    get = function() return (ui().autoAccept and ui().autoTurnin) and true or false end,
    set = function(v) ui().autoAccept, ui().autoTurnin = v and true or false, v and true or false end,
    recommended = function() return (Ding.DEFAULTS.ui.autoAccept and Ding.DEFAULTS.ui.autoTurnin) and true or false end,
}

-- Group quests: the elite quests and every dungeon's quests together (the Route tab's page:
-- all or none, the choices per dungeon go). One question: does the player play in a group?
local GROUP = {
    get = function() return (ui().elites and ui().dungeons) and true or false end,
    set = function(v)
        v = v and true or false
        ui().elites, ui().dungeons, ui().dungeonChoice = v, v, nil
        engineUpdate()
    end,
    recommended = function() return (Ding.DEFAULTS.ui.elites and Ding.DEFAULTS.ui.dungeons) and true or false end,
    custom = function()
        return ui().elites ~= ui().dungeons or (ui().dungeonChoice ~= nil and next(ui().dungeonChoice) ~= nil)
    end,
}

---------------------------------------------------------------------------
-- Screens: a title, one sentence, the choices. A choice: { kind = "check" (a setting on or
-- off) | "radio" (how you play) | "go" (a guide: picked, the assistant ends), id, label, sub,
-- tag, setting, value, current, dim, run }. Read when shown: the client's language, the packs.
---------------------------------------------------------------------------
-- How the player plays: a gamepad when one is in use, with its button names.
local function detectedInput()
    if not G():Active() then return "mouse" end
    return ui().buttonStyle == "ps" and "ps" or "xbox"
end

local function inputChoices()
    local recommended = detectedInput()
    local list = {}
    for _, v in ipairs({ { "xbox", L.SETUP_PAD_XBOX }, { "ps", L.SETUP_PAD_PS }, { "mouse", L.SETUP_MOUSE } }) do
        list[#list + 1] = { kind = "radio", id = "input", value = v[1], label = v[2],
            tag = v[1] == recommended and L.SETUP_RECOMMENDED or nil }
    end
    return list
end

local function check(id, label, s) return { kind = "check", id = id, label = label, setting = s } end

local function autoChoices()
    return {
        check("quests", L.SETUP_AUTO_QUESTS, QUESTS),
        check("sell", L.SETUP_AUTO_SELL, setting("ui", "sellGrey")),
        check("repair", L.SETUP_AUTO_REPAIR, setting("ui", "repair")),
    }
end

local function routeChoices()
    return {
        check("hearth", L.SETUP_ROUTE_HEARTH, setting("ui", "hearth", engineUpdate)),
        check("group", L.SETUP_ROUTE_GROUP, GROUP),
        check("deathSkip", L.SETUP_ROUTE_DEATHSKIP, setting("ui", "deathSkip", engineUpdate)),
    }
end

-- A pack's line under its name: its sections for an item pack ("Cozy Sleeping Bag"), else the
-- levels it covers for the character; its author for a community pack.
local function packSub(pack)
    local titles, low, high = {}, nil, nil
    for _, guide in Ding:IterateGuides(pack.id) do
        if Ding:GuideMatchesPlayer(guide) then
            titles[#titles + 1] = guide.title
            low = math.min(low or guide.minLevel, guide.minLevel)
            high = math.max(high or guide.maxLevel, guide.maxLevel)
        end
    end
    local sub
    if #titles == 0 then
        sub = L.GUIDE_OTHER_CHAR
    elseif pack.category == "items" then
        sub = table.concat(titles, ", ", 1, math.min(2, #titles))
        if #titles > 2 then sub = sub .. " " .. L.PREVIEW_MORE:format(#titles - 2) end
    else
        sub = L.SETUP_LEVELS:format(low, high)
    end
    if pack.author and not pack.builtin then sub = sub .. " · " .. L.PACK_BY:format(pack.author) end
    return sub, #titles == 0
end

local function guideChoices()
    local list = {}
    local guide = Ding.Engine.guide
    local active = guide and guide.pack
    for _, pack in ipairs(Ding:GuidePacks()) do
        local id = pack.id
        local sub, dim = packSub(pack)
        list[#list + 1] = { kind = "go", id = "pack", label = pack.title, sub = sub, dim = dim, current = id == active,
            tag = id == Ding.BUILTIN_PACK and L.SETUP_RECOMMENDED or nil,
            run = function() Ding.Engine:SetPack(id) end }
    end
    if guide then
        list[#list + 1] = { kind = "go", id = "resume", label = L.SETUP_RESUME, sub = L.SETUP_RESUME_SUB:format(guide.title),
            run = function() Ding.Engine:Reset() end }
    end
    return list
end

local SCREENS = {
    { title = function() return L.SETUP_WELCOME_TITLE, L.SETUP_WELCOME_TEXT end, choices = inputChoices },
    { title = function() return L.SETUP_AUTO_TITLE, L.SETUP_AUTO_TEXT end, choices = autoChoices },
    { title = function() return L.SETUP_ROUTE_TITLE, L.SETUP_ROUTE_TEXT end, choices = routeChoices },
    { title = function() return L.SETUP_GUIDE_TITLE, L.SETUP_GUIDE_TEXT end, choices = guideChoices },
}
S.SCREENS = SCREENS

---------------------------------------------------------------------------
-- Pieces
---------------------------------------------------------------------------
-- A push button of the footer (the import window's look); a disabled one does nothing.
local function newButton(parent, onClick)
    local b = CreateFrame("Button", nil, parent)
    b:SetHeight(BUTTON)
    b:RegisterForClicks("LeftButtonUp")
    b.bg = UI.Shape(b, "row", C.control, "BACKGROUND"):Place(b)
    b.hover = UI.Shape(b, "row", C.hover, "BACKGROUND", 1):Place(b)
    b.hover:Hide()
    b.text = UI.Text(b, "medium", 12, C.text)
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.enabled = true
    b:SetScript("OnClick", function(self) if self.enabled then onClick() end end)
    b:SetScript("OnEnter", function(self) if self.enabled then self.hover:Show() end end)
    b:SetScript("OnLeave", function(self) self.hover:Hide() end)
    return b
end

-- A screen dot: the current one accent and larger; a click opens its screen.
local function newDot(parent, i)
    local d = CreateFrame("Button", nil, parent)
    d:SetSize(DOT, DOT)
    d:SetPoint("LEFT", parent, "LEFT", (i - 1) * (DOT + DOT_GAP), 0)
    d:RegisterForClicks("LeftButtonUp")
    d.icon = UI.Icon(d, "circle", 6, C.disabled)
    d.icon:SetPoint("CENTER", d, "CENTER", 0, 0)
    d:SetScript("OnClick", function() S:Show(i) end)
    d:SetScript("OnEnter", function(self)
        if S.screen ~= i then self.icon:SetVertexColor(unpack(C.secondary)) end
    end)
    d:SetScript("OnLeave", function(self)
        self.icon:SetVertexColor(unpack(S.screen == i and C.accent or C.disabled))
    end)
    return d
end

-- A choice: its mark (the settings' check box, a radio ring, or the current guide's check), its
-- label and the line under it wrapped whole, a tag on the right ("Recommended"), the inset focus
-- of list rows with the A chip on the right (gamepad). The mouse: hover focuses, a click acts.
local function newRow(parent)
    local r = CreateFrame("Button", nil, parent)
    r:SetWidth(ROW_WIDTH)
    r:RegisterForClicks("LeftButtonUp")
    r.focus = UI.Focus(r)
    local box = CreateFrame("Frame", nil, r)
    box:SetSize(16, 16)
    box:SetPoint("TOPLEFT", r, "TOPLEFT", 8, -ROW_PAD)
    box.fill = UI.Shape(box, "small", C.accent, "ARTWORK"):Place(box)
    box.stroke = UI.Shape(box, "smallBorder", C.muted, "ARTWORK"):Place(box)
    box.check = UI.Icon(box, "icon_check", 11, C.onAccent, "OVERLAY")
    box.check:SetPoint("CENTER", box, "CENTER", 0, 0)
    box.ring = UI.Icon(box, "ring", 16, C.muted, "ARTWORK")
    box.ring:SetPoint("CENTER", box, "CENTER", 0, 0)
    box.dot = UI.Icon(box, "circle", 8, C.accent, "OVERLAY")
    box.dot:SetPoint("CENTER", box, "CENTER", 0, 0)
    r.box = box
    r.label = UI.Text(r, "regular", 12, C.text)
    UI.Wrap(r.label, 12)
    r.label:SetPoint("TOPLEFT", r, "TOPLEFT", MARK, -ROW_PAD)
    r.sub = UI.Text(r, "regular", 11, C.secondary)
    UI.Wrap(r.sub, 11)
    r.sub:SetPoint("TOPLEFT", r.label, "BOTTOMLEFT", 0, -2)
    r.tag = UI.Text(r, "semibold", 11, C.accent)
    r.tag:SetJustifyH("RIGHT")
    r.tag:SetPoint("TOPRIGHT", r, "TOPRIGHT", -(8 + CHIP), -(ROW_PAD + 1))
    r.key = UI.Glyph(r)
    r.key:SetPoint("RIGHT", r, "RIGHT", -8, 0)
    r.key:Hide()
    r:SetScript("OnEnter", function(self) S:SetFocus(self.index) end)
    r:SetScript("OnClick", function(self)
        S:SetFocus(self.index)
        S:Activate(self.index)
    end)
    return r
end

-- Lays a choice out on its row; returns the row's height.
local function layoutRow(r, choice)
    r.choice = choice
    local box, kind = r.box, choice.kind
    local on
    if kind == "check" then on = choice.setting.get()
    elseif kind == "radio" then on = S.input == choice.value
    else on = choice.current end
    box.fill:SetShown(kind == "check" and on)
    box.stroke:SetShown(kind == "check" and not on)
    box.check:SetShown((kind == "check" or kind == "go") and on and true or false)
    box.check:SetVertexColor(unpack(kind == "go" and C.accent or C.onAccent))
    box.ring:SetShown(kind == "radio")
    box.dot:SetShown(kind == "radio" and on)
    r.on = on

    r.tag:SetText(choice.tag or "")
    local room = choice.tag and (UI.Measure(r.tag) + 8) or 0
    local width = ROW_WIDTH - MARK - 8 - CHIP - room
    r.label:SetWidth(width)
    r.label:SetText(choice.label)
    r.label:SetTextColor(unpack(choice.dim and C.disabled or C.text))
    local height = ROW_PAD + r.label:GetStringHeight()
    r.sub:SetWidth(width)
    r.sub:SetText(choice.sub or "")
    r.sub:SetShown(choice.sub ~= nil)
    if choice.sub then height = height + 2 + r.sub:GetStringHeight() end
    height = math.max(ROW_MIN, math.ceil(height + ROW_PAD))
    r:SetHeight(height)
    return height
end

local function newScreen(f, i)
    local s = CreateFrame("Frame", nil, f)
    s:SetWidth(WIDTH)
    s:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -(TITLE + 1))
    s.heading = UI.Text(s, "semibold", HEADING, C.text)
    UI.Wrap(s.heading, HEADING)
    s.heading:SetWidth(WIDTH - 2 * PAD)
    s.heading:SetPoint("TOPLEFT", s, "TOPLEFT", PAD, -PAD)
    s.text = UI.Text(s, "regular", 12, C.text)
    UI.Wrap(s.text, 12)
    s.text:SetWidth(WIDTH - 2 * PAD)
    s.text:SetPoint("TOPLEFT", s.heading, "BOTTOMLEFT", 0, -GAP)
    s.rows, s.index = {}, i
    return s
end

-- Lays a screen out (its title, its sentence, its choices); returns its height.
local function layoutScreen(s, def)
    local title, text = def.title()
    s.heading:SetText(title)
    s.text:SetText(text)
    s.choices = def.choices()
    local y = PAD + s.heading:GetStringHeight() + GAP + s.text:GetStringHeight() + ROWS_TOP
    for i, choice in ipairs(s.choices) do
        local r = s.rows[i] or newRow(s)
        s.rows[i] = r
        r.index = i
        r:ClearAllPoints()
        r:SetPoint("TOPLEFT", s, "TOPLEFT", INSET, -math.ceil(y))
        y = y + layoutRow(r, choice) + ROW_GAP
        r:Show()
    end
    for i = #s.choices + 1, #s.rows do s.rows[i]:Hide() end
    local height = math.ceil(y - ROW_GAP + PAD)
    s:SetHeight(height)
    return height
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
function S:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingSetup", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetSize(WIDTH, 400)
    UI.Dialog(f, 0, 40)
    f.look = UI.Window(f)

    -- Title bar: "Ding! · Setup", B, close cross.
    f.title = UI.Text(f, "semibold", 13, C.text)
    f.title:SetPoint("LEFT", f, "TOPLEFT", 12, -TITLE / 2)
    f.close = UI.IconButton(f, 24)
    f.close:SetPoint("RIGHT", f, "TOPRIGHT", -6, -TITLE / 2)
    f.close.label = UI.Text(f.close, "regular", 16, C.secondary)
    f.close.label:SetPoint("CENTER", f.close, "CENTER", 0, 1)
    f.close.label:SetText("×")
    f.close:SetScript("OnClick", function() S:Close() end)
    f.back = UI.Glyph(f)
    f.back:SetKey("PAD2")
    f.back:SetPoint("RIGHT", f.close, "LEFT", -8, 0)
    UI.Divider(f, -TITLE)

    f.screens = {}
    for i = 1, #SCREENS do f.screens[i] = newScreen(f, i) end

    -- Footer: Keep the recommended settings; Previous, the screen dots, Next.
    f.divider = UI.Divider(f, -100)
    f.keep = newButton(f, function() S:Keep() end)
    f.keep:SetWidth(ROW_WIDTH)
    f.keep:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", INSET, EDGE + BUTTON + BETWEEN)
    f.prev = newButton(f, function() S:Show(S.screen - 1) end)
    f.prev:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", INSET, EDGE)
    f.next = newButton(f, function() S:Next() end)
    f.next:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -INSET, EDGE)
    f.next.bg:SetColor(C.accent)
    f.next.text:SetTextColor(unpack(C.onAccent))
    f.dots = CreateFrame("Frame", nil, f)
    f.dots:SetSize(#SCREENS * DOT + (#SCREENS - 1) * DOT_GAP, DOT)
    f.dots:SetPoint("BOTTOM", f, "BOTTOM", 0, EDGE + (BUTTON - DOT) / 2)
    for i = 1, #SCREENS do f.dots[i] = newDot(f.dots, i) end

    f:SetScript("OnHide", function() S:OnHide() end)
    f:Hide()
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingSetup") end
    self.frame = f
end

-- Every screen laid out (the window is as high as the tallest one, the same on every screen:
-- no text is ever cut, the buttons stay in place), the current one shown, the footer.
function S:Layout()
    local f = self.frame
    local pad = G():Active()
    local count = #SCREENS
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.SETUP_TITLE)
    local tallest = 0
    for i, s in ipairs(f.screens) do
        tallest = math.max(tallest, layoutScreen(s, SCREENS[i]))
        s:SetShown(i == self.screen)
    end
    local top = TITLE + 1 + tallest
    f.divider:ClearAllPoints()
    f.divider:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -top)
    f.divider:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -top)
    f:SetHeight(top + 1 + FOOTER)

    for i = 1, count do
        local current = i == self.screen
        f.dots[i].icon:SetSize(current and 8 or 6, current and 8 or 6)
        f.dots[i].icon:SetVertexColor(unpack(current and C.accent or C.disabled))
    end
    f.back:SetShown(pad)

    -- Each button keeps room for its chip, and Next for its longer label: nothing moves.
    f.keep.text:SetText(L.SETUP_KEEP)
    UI.ButtonKeys(f.keep, pad and { "PAD4" } or nil)

    local first, last = self.screen == 1, self.screen == count
    local prev = f.prev
    prev.enabled = not first
    prev.hover:Hide()
    prev.text:SetText(L.SETUP_PREV)
    prev.text:SetTextColor(unpack(first and C.disabled or C.text))
    UI.ButtonKeys(prev, pad and not first and { "PADLSHOULDER" } or nil)
    prev:SetWidth(math.max(96, UI.Measure(prev.text) + 28 + (pad and UI.KeysWidth({ "PADLSHOULDER" }) or 0)))

    local nextButton = f.next
    nextButton.text:SetText(L.SETUP_DONE)
    local widest = UI.Measure(nextButton.text)
    nextButton.text:SetText(L.SETUP_NEXT)
    widest = math.max(widest, UI.Measure(nextButton.text))
    nextButton.text:SetText(last and L.SETUP_DONE or L.SETUP_NEXT)
    UI.ButtonKeys(nextButton, pad and { "PADRSHOULDER" } or nil, true)
    nextButton:SetWidth(math.max(96, widest + 28 + (pad and UI.KeysWidth({ "PADRSHOULDER" }) or 0)))

    self:SetFocus(self.focus[self.screen] or self:FirstFocus())
end

-- The current screen and its rows.
function S:Current()
    return self.frame.screens[self.screen]
end

-- The focused choice: its ring, and the A chip on its right (gamepad).
function S:SetFocus(i)
    local s = self:Current()
    local count = #(s.choices or {})
    if count == 0 then return end
    i = math.max(1, math.min(count, i or 1))
    self.focus[self.screen] = i
    local pad = G():Active()
    for j = 1, count do
        local r = s.rows[j]
        local on = j == i
        r.focus:SetShown(on)
        if on and pad then r.key:SetKey("PAD1") end
        r.key:SetShown(on and pad)
    end
end

-- The row first focused on a screen: the choice selected (how you play, the current guide),
-- else the first one.
function S:FirstFocus()
    for i, choice in ipairs(self:Current().choices or {}) do
        if (choice.kind == "radio" and self.input == choice.value) or (choice.kind == "go" and choice.current) then
            return i
        end
    end
    return 1
end

---------------------------------------------------------------------------
-- Choices, screens, the end
---------------------------------------------------------------------------
-- How the player plays: the gamepad's button names now; the Keybinds tab or not at the end.
function S:SetInput(value)
    self.input, self.touched.input = value, true
    if value ~= "mouse" and ui().buttonStyle ~= value then
        ui().buttonStyle = value
        if Ding.Panel.frame then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
        if Ding.ItemButton.button then Ding:Safe(Ding.ItemButton.Update, Ding.ItemButton) end
        if Ding.Arrow.frame then Ding:Safe(Ding.Arrow.Update, Ding.Arrow) end
    end
end

-- A or a click on a choice: ticks it, picks it, or starts that guide and ends.
function S:Activate(i)
    local s = self:Current()
    local choice = s.choices and s.choices[i]
    if not choice then return end
    if choice.kind == "check" then
        choice.setting.set(not choice.setting.get())
        self.touched[choice.id] = true
    elseif choice.kind == "radio" then
        self:SetInput(choice.value)
    else
        Ding:Safe(choice.run)
        self:Close()
        return
    end
    self:Layout()
end

function S:Show(screen)
    if not self.frame then return end
    self.screen = math.max(1, math.min(#SCREENS, screen or 1))
    self:Layout()
end

-- Next screen, or the end on the last one (the guide as it is).
function S:Next()
    if self.screen >= #SCREENS then
        self:Close()
    else
        self:Show(self.screen + 1)
    end
end

-- "Keep the recommended settings": what the player did not change here goes back to its
-- default; the end.
function S:Keep()
    for _, def in ipairs(SCREENS) do
        for _, choice in ipairs(def.choices()) do
            local s = choice.setting
            if s and not self.touched[choice.id] then
                local recommended = s.recommended()
                if s.get() ~= recommended or (s.custom and s.custom()) then s.set(recommended) end
            end
        end
    end
    self:Close()
end

function S:MoveFocus(delta)
    local count = #(self:Current().choices or {})
    if count == 0 then return end
    self:SetFocus((self.focus[self.screen] - 1 + delta) % count + 1)
end

function S:OnKey(key)
    if key == "PADDUP" or key == "PADDDOWN" then
        self:MoveFocus(key == "PADDUP" and -1 or 1)
    elseif key == "PAD1" then
        self:Activate(self.focus[self.screen])
    elseif key == "PAD4" then
        self:Keep()
    elseif key == "PADRSHOULDER" then
        self:Next()
    elseif key == "PADLSHOULDER" then
        self:Show(self.screen - 1)
    elseif key == "PAD2" or key == "PADFORWARD" then
        self:Close()
    end
end

---------------------------------------------------------------------------
-- Opening and closing
---------------------------------------------------------------------------
function S:IsShown()
    return self.frame ~= nil and self.frame:IsShown()
end

-- Opens the assistant on `screen` (the first by default); `back(input)` runs once the player
-- closes it, one frame later ("mouse", "xbox" or "ps": how they play): the settings it was
-- opened from, the first launch's Keybinds tab.
function S:Open(screen, back)
    if InCombatLockdown() then
        Ding:Print(L.CONFIG_COMBAT)
        return false
    end
    self:Create()
    -- One Ding window at a time; the import window does not go back to the settings.
    if Ding.Config.frame and Ding.Config.frame:IsShown() then Ding.Config:Close() end
    if Ding.Finder.frame and Ding.Finder.frame:IsShown() then Ding.Finder:Close() end
    local W = Ding.ImportWindow
    if W.frame and W.frame:IsShown() then
        W.back = nil
        W:Close()
    end
    if Ding.Panel.focusing then Ding.Panel:StopFocus() end
    if not self.frame:IsShown() then
        -- A run cut by a fight keeps what was chosen; a new one starts from the detection.
        self.input, self.touched, self.focus = self.input or detectedInput(), self.touched or {}, self.focus or {}
        self.frame:Show()
        G():Take(self.frame, function(key) S:OnKey(key) end, 0.4, 0.12, KEYS)
    end
    self.back = back
    self:Show(screen or 1)
    return true
end

-- quiet: another Ding window takes over (the settings, the directory): the assistant counts as
-- done, and what was to come after it does not run.
function S:Close(quiet)
    if not self:IsShown() then return end
    self.quiet = quiet
    self.frame:Hide()
end

function S:OnHide()
    G():Release(self.frame)
    local back, quiet, input = self.back, self.quiet, self.input
    self.back, self.quiet = nil, nil
    if self.interrupted then
        -- Closed by a fight: the first launch's assistant comes back where it was.
        self.interrupted = nil
        if self.first then self.resume = { screen = self.screen, back = back } end
        return
    end
    self.first, self.input, self.touched, self.focus = nil, nil, nil, nil
    Ding.db.ui.setupDone = true
    -- Next frame: Esc (the game's UISpecialFrames) closes this window only.
    if back and not quiet then C_Timer.After(0, function() back(input) end) end
end

-- At login (Config:Init): the assistant, once per account, then `after(input)` (the first
-- launch's Keybinds tab); `after()` alone once it has been done.
function S:FirstLaunch(after)
    C_Timer.After(2, function()
        if Ding.db.ui.setupDone then return after() end
        if InCombatLockdown() then
            S.resume = { screen = 1, back = after }
            return
        end
        S.first = true
        S:Open(1, after)
    end)
end

-- Closes before the combat lockdown starts (the temporary bindings must go now).
Ding:On("PLAYER_REGEN_DISABLED", function()
    if not S:IsShown() then return end
    S.interrupted = true
    S.frame:Hide()
end)

-- The first launch's assistant, cut by a fight, comes back a moment after it.
Ding:On("PLAYER_REGEN_ENABLED", function()
    if not S.resume then return end
    C_Timer.After(1, function()
        local resume = S.resume
        if not resume or InCombatLockdown() then return end
        S.resume = nil
        if Ding.db.ui.setupDone then return resume.back and resume.back() end
        S.first = true
        S:Open(resume.screen, resume.back)
    end)
end)
