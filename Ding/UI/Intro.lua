-- The presentation of Ding! ("Ding! · Introduction"): six short pages on what Ding does, why
-- its routes sometimes send the player far or leave a quest out, taking steps in another
-- order, finding an NPC, the controls and the settings. Shown once per account at the first
-- launch, before the Keybinds tab (Config:Init), and again from the Guide tab ("Show the
-- introduction again") or /ding intro. Gamepad: LB / RB or the D-pad left / right change
-- pages, A goes on, B closes (temporary bindings, out of combat only). Each action once: A and
-- RB on Next, LB on Previous, B on the close cross; no hint bar, every action has its button.
-- Mouse: the buttons, the page dots, Esc. Plain frames of Ding's own, nothing protected.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C

local I = {}
Ding.Intro = I

local WIDTH, TITLE, PAD, FOOTER, BUTTON = 460, 32, 20, 48, 26
local HEADING, GAP = 16, 8          -- the page's title (size), then the gap to its text
local DOT, DOT_GAP = 14, 2
local KEYS = { "PADDLEFT", "PADDRIGHT", "PAD1", "PAD2", "PADLSHOULDER", "PADRSHOULDER", "PADFORWARD" }

-- The pages, in order: their title and their text, read when shown (the client's language).
local PAGES = {
    function() return L.INTRO_WHAT_TITLE, L.INTRO_WHAT_TEXT end,
    function() return L.INTRO_ROUTES_TITLE, L.INTRO_ROUTES_TEXT end,
    function() return L.INTRO_FREEDOM_TITLE, L.INTRO_FREEDOM_TEXT end,
    function() return L.INTRO_FIND_TITLE, L.INTRO_FIND_TEXT end,
    function() return L.INTRO_CONTROLS_TITLE, L.INTRO_CONTROLS_TEXT end,
    function() return L.INTRO_SETTINGS_TITLE, L.INTRO_SETTINGS_TEXT end,
}
I.PAGES = PAGES

local function G() return Ding.Gamepad end

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
    b.focus = UI.Focus(b, true)
    b.text = UI.Text(b, "medium", 12, C.text)
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.enabled = true
    b:SetScript("OnClick", function(self) if self.enabled then onClick() end end)
    b:SetScript("OnEnter", function(self) if self.enabled then self.hover:Show() end end)
    b:SetScript("OnLeave", function(self) self.hover:Hide() end)
    return b
end

-- A page dot: the current one accent and larger; a click opens its page.
local function newDot(parent, i)
    local d = CreateFrame("Button", nil, parent)
    d:SetSize(DOT, DOT)
    d:SetPoint("LEFT", parent, "LEFT", (i - 1) * (DOT + DOT_GAP), 0)
    d:RegisterForClicks("LeftButtonUp")
    d.icon = UI.Icon(d, "circle", 6, C.disabled)
    d.icon:SetPoint("CENTER", d, "CENTER", 0, 0)
    d:SetScript("OnClick", function() I:Show(i) end)
    d:SetScript("OnEnter", function(self)
        if I.page ~= i then self.icon:SetVertexColor(unpack(C.secondary)) end
    end)
    d:SetScript("OnLeave", function(self)
        self.icon:SetVertexColor(unpack(I.page == i and C.accent or C.disabled))
    end)
    return d
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
function I:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingIntro", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetSize(WIDTH, 300)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 40)
    f.look = UI.Window(f)

    -- Title bar: "Ding! · Introduction", B, close cross.
    f.title = UI.Text(f, "semibold", 13, C.text)
    f.title:SetPoint("LEFT", f, "TOPLEFT", 12, -TITLE / 2)
    f.close = UI.IconButton(f, 24)
    f.close:SetPoint("RIGHT", f, "TOPRIGHT", -6, -TITLE / 2)
    f.close.label = UI.Text(f.close, "regular", 16, C.secondary)
    f.close.label:SetPoint("CENTER", f.close, "CENTER", 0, 1)
    f.close.label:SetText("×")
    f.close:SetScript("OnClick", function() I:Close() end)
    f.back = UI.Glyph(f)
    f.back:SetKey("PAD2")
    f.back:SetPoint("RIGHT", f.close, "LEFT", -8, 0)
    UI.Divider(f, -TITLE)

    -- The page: its title, then its text, both wrapped whole.
    f.heading = UI.Text(f, "semibold", HEADING, C.text)
    UI.Wrap(f.heading, HEADING)
    f.heading:SetWidth(WIDTH - 2 * PAD)
    f.heading:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -(TITLE + 1 + PAD))
    f.text = UI.Text(f, "regular", 12, C.text)
    UI.Wrap(f.text, 12)
    f.text:SetWidth(WIDTH - 2 * PAD)
    f.text:SetPoint("TOPLEFT", f.heading, "BOTTOMLEFT", 0, -GAP)

    -- Footer: Previous, the page dots, Next.
    f.divider = UI.Divider(f, -100)
    f.prev = newButton(f, function() I:Show(I.page - 1) end)
    f.prev:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, (FOOTER - BUTTON) / 2)
    f.next = newButton(f, function() I:Next() end)
    f.next:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -12, (FOOTER - BUTTON) / 2)
    f.next.bg:SetColor(C.accent)
    f.next.text:SetTextColor(unpack(C.onAccent))
    f.dots = CreateFrame("Frame", nil, f)
    f.dots:SetSize(#PAGES * DOT + (#PAGES - 1) * DOT_GAP, DOT)
    f.dots:SetPoint("BOTTOM", f, "BOTTOM", 0, (FOOTER - DOT) / 2)
    for i = 1, #PAGES do f.dots[i] = newDot(f.dots, i) end

    f:SetScript("OnHide", function() I:OnHide() end)
    f:Hide()
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingIntro") end
    self.frame = f
end

-- The height of the tallest page: the window keeps it on every page, so that no text is ever
-- cut and the buttons stay in place.
function I:Measure()
    local f = self.frame
    local tallest = 0
    for _, page in ipairs(PAGES) do
        local title, text = page()
        f.heading:SetText(title)
        f.text:SetText(text)
        tallest = math.max(tallest, f.heading:GetStringHeight() + GAP + f.text:GetStringHeight())
    end
    local top = TITLE + 1 + PAD + math.ceil(tallest) + PAD
    f.divider:ClearAllPoints()
    f.divider:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -top)
    f.divider:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -top)
    f:SetHeight(top + 1 + FOOTER)
end

-- The page on screen, its dots, and the buttons with their chips (gamepad): LB on Previous,
-- A and RB on Next (A only on the last page, where it closes), B by the close cross. Each
-- button keeps room for its chips, and Next for its longer label, so nothing moves from a
-- page to the next.
function I:Layout()
    local f = self.frame
    local pad = G():Active()
    local count = #PAGES
    local first, last = self.page == 1, self.page == count
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.INTRO_TITLE)
    local title, text = PAGES[self.page]()
    f.heading:SetText(title)
    f.text:SetText(text)
    for i = 1, count do
        local dot = f.dots[i]
        local current = i == self.page
        dot.icon:SetSize(current and 8 or 6, current and 8 or 6)
        dot.icon:SetVertexColor(unpack(current and C.accent or C.disabled))
    end
    f.back:SetShown(pad)

    local prev = f.prev
    prev.enabled = not first
    prev.hover:Hide()
    prev.text:SetText(L.INTRO_PREV)
    prev.text:SetTextColor(unpack(first and C.disabled or C.text))
    UI.ButtonKeys(prev, pad and not first and { "PADLSHOULDER" } or nil)
    prev:SetWidth(math.max(96, UI.Measure(prev.text) + 28 + (pad and UI.KeysWidth({ "PADLSHOULDER" }) or 0)))

    local nextButton = f.next
    nextButton.text:SetText(L.INTRO_DONE)
    local widest = UI.Measure(nextButton.text)
    nextButton.text:SetText(L.INTRO_NEXT)
    widest = math.max(widest, UI.Measure(nextButton.text))
    nextButton.text:SetText(last and L.INTRO_DONE or L.INTRO_NEXT)
    nextButton.focus:SetShown(pad)
    UI.ButtonKeys(nextButton, pad and (last and { "PAD1" } or { "PAD1", "PADRSHOULDER" }) or nil, true)
    nextButton:SetWidth(math.max(96, widest + 28 + (pad and UI.KeysWidth({ "PAD1", "PADRSHOULDER" }) or 0)))
end

---------------------------------------------------------------------------
-- Pages
---------------------------------------------------------------------------
function I:Show(page)
    if not self.frame then return end
    self.page = math.max(1, math.min(#PAGES, page or 1))
    self:Layout()
end

-- Next page, or the end on the last one.
function I:Next()
    if self.page >= #PAGES then
        self:Close()
    else
        self:Show(self.page + 1)
    end
end

function I:OnKey(key)
    if key == "PAD1" then
        self:Next()
    elseif key == "PADRSHOULDER" or key == "PADDRIGHT" then
        self:Show(self.page + 1)
    elseif key == "PADLSHOULDER" or key == "PADDLEFT" then
        self:Show(self.page - 1)
    elseif key == "PAD2" or key == "PADFORWARD" then
        self:Close()
    end
end

---------------------------------------------------------------------------
-- Opening and closing
---------------------------------------------------------------------------
function I:IsShown()
    return self.frame ~= nil and self.frame:IsShown()
end

-- Opens the presentation on `page` (the first by default); `back` runs once the player
-- closes it (the settings it was opened from, the first launch's Keybinds tab).
function I:Open(page, back)
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
    self.back = back
    self:Measure()
    self.page = math.max(1, math.min(#PAGES, page or 1))
    if not self.frame:IsShown() then
        self.frame:Show()
        G():Take(self.frame, function(key) I:OnKey(key) end, 0.4, 0.12, KEYS)
    end
    self:Layout()
    return true
end

-- quiet: another Ding window takes over (the settings, the directory): the presentation
-- counts as seen, and what was to come after it does not run.
function I:Close(quiet)
    if not self:IsShown() then return end
    self.quiet = quiet
    self.frame:Hide()
end

function I:OnHide()
    G():Release(self.frame)
    local back, quiet = self.back, self.quiet
    self.back, self.quiet = nil, nil
    if self.interrupted then
        -- Closed by a fight: the first launch's presentation comes back where it was.
        self.interrupted = nil
        if self.first then self.resume = { page = self.page, back = back } end
        return
    end
    self.first = nil
    Ding.db.ui.introSeen = true
    -- Next frame: Esc (the game's UISpecialFrames) closes this window only.
    if back and not quiet then C_Timer.After(0, back) end
end

-- At login (Config:Init): the presentation, once per account, then `after` (the first
-- launch's Keybinds tab); `after` alone once it has been seen.
function I:FirstLaunch(after)
    C_Timer.After(2, function()
        if Ding.db.ui.introSeen then return after() end
        if InCombatLockdown() then
            I.resume = { page = 1, back = after }
            return
        end
        I.first = true
        I:Open(1, after)
    end)
end

-- Closes before the combat lockdown starts (the temporary bindings must go now).
Ding:On("PLAYER_REGEN_DISABLED", function()
    if not I:IsShown() then return end
    I.interrupted = true
    I.frame:Hide()
end)

-- The first launch's presentation, cut by a fight, comes back a moment after it.
Ding:On("PLAYER_REGEN_ENABLED", function()
    if not I.resume then return end
    C_Timer.After(1, function()
        local resume = I.resume
        if not resume or InCombatLockdown() then return end
        I.resume = nil
        if Ding.db.ui.introSeen then return resume.back and resume.back() end
        I.first = true
        I:Open(resume.page, resume.back)
    end)
end)
