-- Shared UI pieces of the Ding design (docs/UI-handoff.md): color tokens, Noto Sans fonts,
-- rounded shapes drawn as nine-slices of the design textures, gamepad glyphs, fades and
-- the settings rows. Plain frames only (no templates), so nothing here is protected.
local _, Ding = ...
local L = Ding.L

local UI = {}
Ding.UI = UI

local unpack = unpack

UI.MEDIA = "Interface\\AddOns\\Ding\\Media\\"
UI.TEX = UI.MEDIA .. "Textures\\"
UI.WHITE = "Interface\\Buttons\\WHITE8X8"

-- Design tokens (#RRGGBBAA as 0-1). The window background alpha comes from the settings.
local C = {
    bg = { 0.086, 0.094, 0.110, 1 },
    control = { 0.133, 0.145, 0.169, 1 },
    itemBg = { 0.086, 0.094, 0.110, 0.85 },
    border = { 1, 1, 1, 0.078 },
    divider = { 1, 1, 1, 0.059 },
    subtle = { 1, 1, 1, 0.039 },
    hover = { 1, 1, 1, 0.078 },
    glyphBg = { 1, 1, 1, 0.122 },
    strong = { 1, 1, 1, 0.149 },
    text = { 0.910, 0.918, 0.929, 1 },
    glyph = { 0.788, 0.804, 0.827, 1 },
    secondary = { 0.639, 0.663, 0.702, 1 },
    muted = { 0.490, 0.514, 0.549, 1 },
    disabled = { 0.373, 0.396, 0.431, 1 },
    accent = { 0.357, 0.706, 1, 1 },
    accentBg = { 0.357, 0.706, 1, 0.122 },
    accentHalo = { 0.357, 0.706, 1, 0.2 },
    onAccent = { 0.043, 0.047, 0.055, 1 },
    done = { 0.298, 0.765, 0.541, 1 },
    doneIconBg = { 0.298, 0.765, 0.541, 0.2 },
    doneRowBg = { 0.298, 0.765, 0.541, 0.122 },
    todo = { 0.898, 0.404, 0.420, 1 },
    todoIconBg = { 0.898, 0.404, 0.420, 0.18 },
    todoRowBg = { 0.898, 0.282, 0.302, 0.122 },
    todoBorder = { 0.898, 0.404, 0.420, 0.5 },
    -- A quest above the player's level: WoW's orange for hard quests (shown, never blocked).
    above = { 1, 0.502, 0.251, 1 },
    -- A step the player left by hand: marked done (violet) or skipped (amber), not the green
    -- of what the game confirms.
    manual = { 0.655, 0.545, 0.980, 1 },
    manualIconBg = { 0.655, 0.545, 0.980, 0.2 },
    manualRowBg = { 0.655, 0.545, 0.980, 0.122 },
    skipped = { 0.910, 0.773, 0.278, 1 },
    skippedIconBg = { 0.910, 0.773, 0.278, 0.2 },
    skippedRowBg = { 0.910, 0.773, 0.278, 0.122 },
    impossibleIconBg = { 1, 1, 1, 0.059 },
    cooldown = { 0, 0, 0, 0.65 },
    shadow = { 0, 0, 0, 0.35 },
    textShadow = { 0, 0, 0, 0.8 },
    scene = { 0.165, 0.145, 0.122, 1 },
}
UI.C = C

-- Inline color codes for texts made of several colors.
local HEX = {
    accent = "5bb4ff", text = "e8eaed", secondary = "a3a9b3", muted = "7d838c", disabled = "5f656e",
    done = "4cc38a", todo = "e5676b", above = "ff8040",
}
function UI.Colored(name, s) return "|cff" .. HEX[name] .. s .. "|r" end

function UI.StripColors(s)
    return (s:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
end

---------------------------------------------------------------------------
-- Fonts: Noto Sans in four weights (OFL, shipped in Media/Fonts).
---------------------------------------------------------------------------
local FONT_FILES = { regular = "Regular", medium = "Medium", semibold = "SemiBold", bold = "Bold" }
-- Noto Sans has no Korean nor Chinese glyphs: those clients keep the game's own font.
local GAME_FONT = { koKR = true, zhCN = true, zhTW = true }
UI.GAME_FONT = GAME_FONT
local fonts = {}

-- Font object for a weight ("regular", "medium", "semibold", "bold") and a size. If the
-- client refuses the file, the game's own font stands in at the same size.
function UI.Font(weight, size)
    local key = weight .. size
    if fonts[key] then return fonts[key] end
    local font = CreateFont("DingFont_" .. key)
    local path = UI.MEDIA .. "Fonts\\NotoSans-" .. FONT_FILES[weight] .. ".ttf"
    if GAME_FONT[Ding.locale] then path = STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF" end
    local ok, loaded = pcall(font.SetFont, font, path, size, "")
    -- A refused file leaves the font unset, and SetText on it would then error.
    if not ok or loaded == false or not font:GetFont() then
        pcall(font.SetFont, font, STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", size, "")
    end
    fonts[key] = font
    return font
end

-- One-line text by default; multi-line texts call UI.Wrap.
function UI.Text(parent, weight, size, color, layer)
    local fs = parent:CreateFontString(nil, layer or "ARTWORK")
    fs:SetFontObject(UI.Font(weight, size))
    fs:SetJustifyH("LEFT")
    fs:SetWordWrap(false)
    fs:SetTextColor(unpack(color or C.text))
    return fs
end

-- Line height 16 for 12 px, 14 for 11 px (design typography), at most `lines` lines.
function UI.Wrap(fs, size, lines)
    fs:SetWordWrap(true)
    fs:SetJustifyV("TOP")
    if fs.SetSpacing then pcall(fs.SetSpacing, fs, size >= 12 and 4 or 3) end
    if lines and fs.SetMaxLines then pcall(fs.SetMaxLines, fs, lines) end
end

-- Width of a text as written. The client bounds GetStringWidth by a width already set:
-- the width is released first, so a text that grew is not measured at its old size.
function UI.Measure(fs)
    fs:SetWidth(0)
    return fs:GetStringWidth()
end

-- Texts drawn over the game world (arrow, item name) carry a dark shadow.
function UI.Shadow(fs)
    fs:SetShadowOffset(0, -1)
    fs:SetShadowColor(unpack(C.textShadow))
end

---------------------------------------------------------------------------
-- Nine-slices: a white texture with rounded corners of `margin` texels, stretched over
-- a region at one texel per unit, so corners stay round at any size. Plain textures and
-- SetTexCoord only, which every client has (SetTextureSliceMargins may be missing).
---------------------------------------------------------------------------
local Slice = {}
Slice.__index = Slice

-- file: texture name in Media/Textures; size: 32 or 64 (its width in texels).
function UI.Slice(parent, file, margin, size, layer, sublevel)
    local s = setmetatable({ parts = {}, margin = margin }, Slice)
    local m = margin / size
    local coords = { 0, m, 1 - m, 1 }
    for row = 0, 2 do
        for col = 0, 2 do
            local t = parent:CreateTexture(nil, layer or "BACKGROUND", nil, sublevel or 0)
            t:SetTexture(UI.TEX .. file)
            t:SetTexCoord(coords[col + 1], coords[col + 2], coords[row + 1], coords[row + 2])
            s.parts[#s.parts + 1] = t
        end
    end
    return s
end

-- Covers `region`, grown by `outset` on each side (negative: inside), moved down by `drop`.
function Slice:Place(region, outset, drop)
    local o, d, m, p = outset or 0, drop or 0, self.margin, self.parts
    for _, t in ipairs(p) do t:ClearAllPoints() end
    p[1]:SetPoint("TOPLEFT", region, "TOPLEFT", -o, o - d)
    p[3]:SetPoint("TOPRIGHT", region, "TOPRIGHT", o, o - d)
    p[7]:SetPoint("BOTTOMLEFT", region, "BOTTOMLEFT", -o, -o - d)
    p[9]:SetPoint("BOTTOMRIGHT", region, "BOTTOMRIGHT", o, -o - d)
    for _, i in ipairs({ 1, 3, 7, 9 }) do p[i]:SetSize(m, m) end
    p[2]:SetPoint("TOPLEFT", p[1], "TOPRIGHT", 0, 0)
    p[2]:SetPoint("BOTTOMRIGHT", p[3], "BOTTOMLEFT", 0, 0)
    p[8]:SetPoint("TOPLEFT", p[7], "TOPRIGHT", 0, 0)
    p[8]:SetPoint("BOTTOMRIGHT", p[9], "BOTTOMLEFT", 0, 0)
    p[4]:SetPoint("TOPLEFT", p[1], "BOTTOMLEFT", 0, 0)
    p[4]:SetPoint("BOTTOMRIGHT", p[7], "TOPRIGHT", 0, 0)
    p[6]:SetPoint("TOPLEFT", p[3], "BOTTOMLEFT", 0, 0)
    p[6]:SetPoint("BOTTOMRIGHT", p[9], "TOPRIGHT", 0, 0)
    p[5]:SetPoint("TOPLEFT", p[1], "BOTTOMRIGHT", 0, 0)
    p[5]:SetPoint("BOTTOMRIGHT", p[9], "TOPLEFT", 0, 0)
    return self
end

function Slice:SetColor(r, g, b, a)
    if type(r) == "table" then r, g, b, a = r[1], r[2], r[3], r[4] end
    self.color = { r, g, b, a or 1 }
    for _, t in ipairs(self.parts) do t:SetVertexColor(r, g, b, a or 1) end
    return self
end

function Slice:SetShown(shown)
    self.shown = shown and true or false
    for _, t in ipairs(self.parts) do t:SetShown(shown) end
end
function Slice:Show() self:SetShown(true) end
function Slice:Hide() self:SetShown(false) end
function Slice:IsShown() return self.shown ~= false end

-- Shapes of the kit, by name: { file, margin, texture size }.
local SHAPES = {
    window = { "rr6_fill", 6, 32 }, windowBorder = { "rr6_stroke1", 6, 32 },
    row = { "rr4_fill", 4, 32 }, rowBorder = { "rr4_stroke1", 4, 32 }, ring = { "rr4_stroke2", 4, 32 },
    halo = { "focus_halo", 7, 32 }, small = { "rr3_fill", 3, 32 }, smallBorder = { "rr3_stroke15", 3, 32 },
    bar = { "rr2_fill", 2, 32 }, shadow = { "shadow", 24, 64 },
}
function UI.Shape(parent, shape, color, layer, sublevel)
    local s = SHAPES[shape]
    local slice = UI.Slice(parent, s[1], s[2], s[3], layer, sublevel)
    if color then slice:SetColor(color) end
    return slice
end

-- Window look: drop shadow, rounded background and 1-unit border.
-- Returns { shadow, fill, border, SetBgAlpha(alpha) }: with a see-through background the
-- border and the shadow fade too, so a 0 % window shows its texts only.
function UI.Window(frame, bgColor, borderColor)
    local w = {
        shadow = UI.Shape(frame, "shadow", C.shadow, "BACKGROUND", -8):Place(frame, 16, 4),
        fill = UI.Shape(frame, "window", bgColor or C.bg, "BACKGROUND", -7):Place(frame),
        border = UI.Shape(frame, "windowBorder", borderColor or C.border, "BORDER", 7):Place(frame),
    }
    local base = { fill = bgColor or C.bg, border = borderColor or C.border }
    function w:SetBgAlpha(alpha)
        self.alpha = alpha
        local f, b = base.fill, base.border
        self.fill:SetColor(f[1], f[2], f[3], alpha)
        self.border:SetColor(b[1], b[2], b[3], b[4] * math.min(1, alpha / 0.5))
        self.shadow:SetColor(0, 0, 0, C.shadow[4] * alpha)
    end
    w:SetBgAlpha(1)
    return w
end

-- 1-unit separator line between two points of a frame, at vertical offset y.
function UI.Divider(frame, y, color, left, right)
    local t = frame:CreateTexture(nil, "ARTWORK")
    t:SetColorTexture(unpack(color or C.divider))
    t:SetHeight(1)
    t:SetPoint("TOPLEFT", frame, "TOPLEFT", left or 1, y)
    t:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -(right or 1), y)
    return t
end

-- Gamepad focus. Inside (list rows): accent fill and a 2-unit ring along the inner edge.
-- Outside (an isolated field): the ring 2 units outside the field, then a 3-unit halo.
function UI.Focus(frame, outside)
    local f = {
        fill = UI.Shape(frame, "row", C.accentBg, "BACKGROUND", 2):Place(frame),
        ring = UI.Shape(frame, "ring", C.accent, "OVERLAY", 6):Place(frame, outside and 2 or 0),
    }
    if outside then f.halo = UI.Shape(frame, "halo", C.accentHalo, "BACKGROUND", -6):Place(frame, 5) end
    function f:SetShown(shown)
        self.fill:SetShown(shown)
        self.ring:SetShown(shown)
        if self.halo then self.halo:SetShown(shown) end
    end
    f:SetShown(false)
    return f
end

-- Small square button with a hover background (title bar icons, ‹ ›).
function UI.IconButton(parent, size, idle)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(size, size)
    b:RegisterForClicks("LeftButtonUp")
    b.bg = UI.Shape(b, "row", idle or C.hover, "BACKGROUND"):Place(b)
    b.idle = idle
    b.bg:SetShown(idle ~= nil)
    b:SetScript("OnEnter", function(self)
        self.bg:SetColor(C.hover)
        self.bg:Show()
        if self.tooltip then
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText(self.tooltip)
            GameTooltip:Show()
        end
    end)
    b:SetScript("OnLeave", function(self)
        if self.idle then self.bg:SetColor(self.idle) else self.bg:Hide() end
        if self.tooltip and GameTooltip:GetOwner() == self then GameTooltip:Hide() end
    end)
    return b
end

-- Texture of the kit, sized and tinted.
function UI.Icon(parent, file, size, color, layer, sublevel)
    local t = parent:CreateTexture(nil, layer or "ARTWORK", nil, sublevel or 0)
    t:SetTexture(UI.TEX .. file)
    t:SetSize(size, size)
    t:SetVertexColor(unpack(color or C.text))
    return t
end

---------------------------------------------------------------------------
-- Marks over the game's own windows (flight map, quest rewards): Ding's frames on UIParent,
-- placed where a game button stands. The game's windows are only read, never anchored to,
-- shown, hidden nor changed.
---------------------------------------------------------------------------
-- Banner at the top of the screen: window look, an accent caret, one line of text.
function UI.Banner(name, width)
    width = width or 300
    local b = CreateFrame("Frame", name, UIParent)
    b:SetSize(width, 32)
    b:SetPoint("TOP", UIParent, "TOP", 0, -96)
    b:SetFrameStrata("DIALOG")
    b:EnableMouse(false)
    b.look = UI.Window(b)
    b.icon = UI.Caret(b, "RIGHT", 8, C.accent, "ARTWORK")
    b.icon:SetPoint("LEFT", b, "LEFT", 12, 0)
    b.text = UI.Text(b, "semibold", 13, C.text)
    b.text:SetPoint("LEFT", b, "LEFT", 28, 0)
    b.text:SetWidth(width - 40)
    b:Hide()
    return b
end

-- Accent ring, shown centered on a point of the screen (UIParent units).
function UI.Ring(name, size)
    size = size or 34
    local r = CreateFrame("Frame", name, UIParent)
    r:SetSize(size, size)
    r:SetFrameStrata("TOOLTIP")
    r:EnableMouse(false)
    r.ring = UI.Icon(r, "ring", size, C.accent, "OVERLAY")
    r.ring:SetPoint("CENTER", r, "CENTER", 0, 0)
    r:Hide()
    function r:ShowAt(x, y)
        self:ClearAllPoints()
        self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
        self:Show()
    end
    return r
end

-- Center of a game frame on the screen, in UIParent units; nil when it is missing or hidden.
function UI.ScreenCenter(frame)
    if type(frame) ~= "table" or type(frame.GetCenter) ~= "function" then return nil end
    if type(frame.IsVisible) == "function" then
        local okV, visible = pcall(frame.IsVisible, frame)
        if okV and not visible then return nil end
    end
    local ok, x, y = pcall(frame.GetCenter, frame)
    local okScale, scale = pcall(frame.GetEffectiveScale, frame)
    if not (ok and x and y and okScale and scale) then return nil end
    local ui = UIParent:GetEffectiveScale()
    return x * scale / ui, y * scale / ui
end

-- caret_up points up; the other directions are rotations of it.
local CARET = { UP = 0, DOWN = math.pi, LEFT = math.pi / 2, RIGHT = -math.pi / 2 }
UI.CARET = CARET
function UI.Caret(parent, direction, size, color, layer)
    local t = UI.Icon(parent, "caret_up", size, color or C.secondary, layer)
    t:SetRotation(CARET[direction] or 0)
    return t
end

-- Real item icons: the Blizzard frame trimmed, corners rounded by a mask when the client
-- has masks.
function UI.ItemIcon(parent, size, layer)
    local t = parent:CreateTexture(nil, layer or "ARTWORK")
    t:SetSize(size, size)
    t:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    if parent.CreateMaskTexture and t.AddMaskTexture then
        local ok, mask = pcall(parent.CreateMaskTexture, parent)
        if ok and mask then
            mask:SetTexture(UI.TEX .. "rr4_fill", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
            mask:SetAllPoints(t)
            pcall(t.AddMaskTexture, t, mask)
        end
    end
    return t
end

---------------------------------------------------------------------------
-- Fades
---------------------------------------------------------------------------
-- Older clients only know SetChange on alpha animations.
local function setAlphaRange(anim, from, to)
    if anim.SetFromAlpha then
        anim:SetFromAlpha(from)
        anim:SetToAlpha(to)
    else
        anim:SetChange(to - from)
    end
end

local function fader(frame)
    local group = frame.dingFade
    if group then return group end
    group = frame:CreateAnimationGroup()
    group.anim = group:CreateAnimation("Alpha")
    group:SetScript("OnFinished", function(self)
        if self.hiding then
            self.hiding = false
            frame:Hide()
        end
    end)
    frame.dingFade = group
    return group
end

function UI.FadeIn(frame, duration)
    local group = fader(frame)
    local visible = frame:IsShown() and not group.hiding
    group:Stop()
    group.hiding = false
    frame:Show()
    if visible then return end
    setAlphaRange(group.anim, 0, 1)
    group.anim:SetDuration(duration or 0.15)
    group:Play()
end

function UI.FadeOut(frame, duration)
    if not frame:IsShown() then return end
    local group = fader(frame)
    if group.hiding then return end
    group:Stop()
    group.hiding = true
    setAlphaRange(group.anim, 1, 0)
    group.anim:SetDuration(duration or 0.3)
    group:Play()
end

---------------------------------------------------------------------------
-- Gamepad glyph: the name of a button in a small plate. Shoulders, triggers and words
-- (LB, RB, LB RB, Start, keyboard keys) in a rounded pill; face buttons (A, B, X, Y) in
-- a circle. Ding.Gamepad:Glyph(key) says what to draw.
-- style: { height = 14, font = 9, bg = color, text = color, border = color or nil }
---------------------------------------------------------------------------
local GLYPH = { height = 14, font = 9, bg = C.glyphBg, text = C.glyph }
UI.GLYPH = GLYPH

function UI.Glyph(parent, style)
    style = style or GLYPH
    local g = CreateFrame("Frame", nil, parent)
    g.style = style
    g:SetSize(style.height, style.height)
    g.pill = UI.Shape(g, "small", style.bg, "BACKGROUND"):Place(g)
    g.circle = UI.Icon(g, "circle", style.height, style.bg, "BACKGROUND")
    g.circle:SetPoint("CENTER", g, "CENTER", 0, 0)
    if style.border then
        g.ring = UI.Icon(g, "ring", style.height, style.border, "BORDER")
        g.ring:SetPoint("CENTER", g, "CENTER", 0, 0)
    end
    g.parts = {}

    local function part(i)
        local p = g.parts[i]
        if not p then
            p = {
                text = UI.Text(g, "bold", style.font, style.text, "OVERLAY"),
                tex = g:CreateTexture(nil, "OVERLAY"),
            }
            g.parts[i] = p
        end
        return p
    end

    -- glyph = { face = bool, parts = { { text = "LB" } | { caret = "LEFT" } | { tex = file } } }
    -- (a part with space = true is followed by a wider gap).
    function g:SetGlyph(glyph, color)
        local textColor = color or self.style.text
        local h = self.style.height
        local icon = math.floor(h * 0.6 + 0.5)
        -- Measure, then center the content in the plate.
        local widths, total = {}, 0
        for i, item in ipairs(glyph.parts) do
            local p = part(i)
            if item.text then
                p.text:SetText(item.text)
                widths[i] = p.text:GetStringWidth()
            else
                widths[i] = icon
            end
            total = total + widths[i] + (i < #glyph.parts and (item.space and 3 or 1) or 0)
        end
        local face = glyph.face
        local width = face and h or math.max(h, total + 6)
        self:SetWidth(width)
        local x = math.floor((width - total) / 2 + 0.5)
        for i, item in ipairs(glyph.parts) do
            local p = self.parts[i]
            p.text:ClearAllPoints()
            p.tex:ClearAllPoints()
            if item.text then
                p.tex:Hide()
                p.text:SetTextColor(unpack(textColor))
                p.text:SetPoint("LEFT", self, "LEFT", x, 0)
                p.text:Show()
            else
                p.text:Hide()
                p.tex:SetTexture(UI.TEX .. (item.caret and "caret_up" or item.tex))
                p.tex:SetRotation(item.caret and CARET[item.caret] or 0)
                p.tex:SetVertexColor(unpack(textColor))
                p.tex:SetSize(icon, icon)
                p.tex:SetPoint("LEFT", self, "LEFT", x, 0)
                p.tex:Show()
            end
            x = x + widths[i] + (item.space and 3 or 1)
        end
        for i = #glyph.parts + 1, #self.parts do
            self.parts[i].text:Hide()
            self.parts[i].tex:Hide()
        end
        self.circle:SetShown(face)
        if self.ring then self.ring:SetShown(face) end
        self.pill:SetShown(not face)
        self.glyph = glyph
    end

    function g:SetColors(bg, text)
        self.circle:SetVertexColor(unpack(bg))
        self.pill:SetColor(bg)
        if self.glyph then self:SetGlyph(self.glyph, text) end
    end

    -- Shortcut: the glyph of a binding key ("SHIFT-PADDRIGHT"), of a list of buttons, or text.
    function g:SetKey(key)
        self:SetGlyph(Ding.Gamepad:Glyph(key))
    end
    return g
end

---------------------------------------------------------------------------
-- Settings rows (Ding.Config). A row is a Button as wide as the content; the whole line
-- is the target. Focusable rows implement Activate (A), Left / Right (D-pad), Reset (Y),
-- Cancel, Refresh, SetFocused, and Hints() for the footer.
---------------------------------------------------------------------------
local function hint(keys, label) return { keys = keys, label = label } end
UI.Hint = hint

local function baseRow(parent, owner, opts, height, width)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(width, height)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row.owner, row.opts = owner, opts
    row.focusable = true
    row.focus = UI.Focus(row)

    row.label = UI.Text(row, "regular", 12, C.text)
    row.label:SetText(opts.label or "")

    row:SetScript("OnEnter", function(self) self.owner:SetFocus(self) end)
    -- Mouse: a click does what A does; a right click what Y does (default value, unbind),
    -- or cancels a confirmation. A binding conflict or capture answers the click first.
    row:SetScript("OnClick", function(self, button)
        self.owner:SetFocus(self)
        if self.owner.OnRowClick and self.owner:OnRowClick(self, button) then return end
        if button == "RightButton" then
            if self.confirming then self:Cancel() else self:Reset() end
        else
            self:Activate()
        end
    end)

    function row:Activate() end
    function row:Cancel() end
    function row:Left() end
    function row:Right() end
    function row:Reset() end
    function row:Refresh()
        if self.desc and type(self.opts.desc) == "function" then self.desc:SetText(self.opts.desc()) end
    end
    function row:SetFocused(focused)
        self.focused = focused
        self.focus:SetShown(focused)
        self.label:SetFontObject(UI.Font(focused and "medium" or "regular", 12))
    end
    function row:Hints() return {} end
    function row:Tooltip()
        local desc = self.opts.desc
        return self.opts.label, type(desc) == "function" and desc() or desc
    end
    return row
end

-- Label (and its description) on the left, vertically centered in the row.
local function placeLabel(row, x, rightRoom)
    local width = row:GetWidth() - x - 8 - (rightRoom or 0)
    row.label:SetWidth(width)
    if row.opts.desc then
        -- One line: the settings stay light (a longer text is cut, its row's tooltip has it).
        row.desc = UI.Text(row, "regular", 11, C.secondary)
        UI.Wrap(row.desc, 11, 1)
        row.desc:SetWidth(width)
        row.desc:SetText(type(row.opts.desc) == "function" and row.opts.desc() or row.opts.desc)
        local block = 16 + 2 + 14
        row.label:SetPoint("TOPLEFT", row, "TOPLEFT", x, -math.floor((row:GetHeight() - block) / 2))
        row.desc:SetPoint("TOPLEFT", row.label, "BOTTOMLEFT", 0, -2)
    else
        row.label:SetPoint("LEFT", row, "LEFT", x, 0)
    end
end

-- Corner A glyph of a focused row: "this row reacts to A".
local function aGlyph(row)
    row.aGlyph = UI.Glyph(row)
    row.aGlyph:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    row.aGlyph:SetKey("PAD1")
    row.aGlyph:Hide()
end

-- opts: label, desc, get(), set(value)
function UI.CheckRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, opts.desc and 44 or 36, width)
    row.kind = "check"
    row.box = CreateFrame("Frame", nil, row)
    row.box:SetSize(16, 16)
    row.box:SetPoint("LEFT", row, "LEFT", 8, 0)
    row.box.fill = UI.Shape(row.box, "small", C.accent, "ARTWORK"):Place(row.box)
    row.box.stroke = UI.Shape(row.box, "smallBorder", C.muted, "ARTWORK"):Place(row.box)
    row.box.check = UI.Icon(row.box, "icon_check", 11, C.onAccent, "OVERLAY")
    row.box.check:SetPoint("CENTER", row.box, "CENTER", 0, 0)
    placeLabel(row, 8 + 16 + 10, 24)
    aGlyph(row)

    local refresh, setFocused = row.Refresh, row.SetFocused
    function row:Refresh()
        refresh(self)
        local on = opts.get() and true or false
        self.checked = on
        self.box.fill:SetShown(on)
        self.box.check:SetShown(on)
        self.box.stroke:SetShown(not on)
    end
    function row:SetFocused(focused)
        setFocused(self, focused)
        self.aGlyph:SetShown(focused and Ding.Gamepad:Active())
    end
    function row:Activate()
        opts.set(not opts.get())
        self:Refresh()
    end
    function row:Hints() return { hint("PAD1", L.HINT_TOGGLE) } end
    row:Refresh()
    return row
end

-- Slider block of the Appearance tab. opts: label, min, max, step, default, get(), set(v),
-- format(v) -> text, help (bottom center, optional)
local SLIDER_HEIGHT = 8 + 16 + 8 + 16 + 8 + 14 + 8
function UI.SliderRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, SLIDER_HEIGHT, width)
    row.kind = "slider"
    row.label:SetFontObject(UI.Font("medium", 12))
    row.label:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -8)
    row.value = UI.Text(row, "semibold", 12, C.text)
    row.value:SetJustifyH("RIGHT")
    row.value:SetPoint("TOPRIGHT", row, "TOPRIGHT", -8, -8)

    local track = CreateFrame("Button", nil, row)
    track:SetHeight(16)
    track:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -32)
    track:SetPoint("TOPRIGHT", row, "TOPRIGHT", -8, -32)
    track:RegisterForClicks("LeftButtonDown")
    row.track = track
    local rail = CreateFrame("Frame", nil, track)
    rail:SetHeight(4)
    rail:SetPoint("LEFT", track, "LEFT", 0, 0)
    rail:SetPoint("RIGHT", track, "RIGHT", 0, 0)
    row.rail = UI.Shape(rail, "bar", C.glyphBg, "ARTWORK"):Place(rail)
    row.fillFrame = CreateFrame("Frame", nil, track)
    row.fillFrame:SetHeight(4)
    row.fillFrame:SetPoint("LEFT", track, "LEFT", 0, 0)
    row.fill = UI.Shape(row.fillFrame, "bar", C.accent, "ARTWORK", 1):Place(row.fillFrame)
    row.thumbShadow = UI.Icon(track, "circle", 16, { 0, 0, 0, 0.5 }, "OVERLAY", 1)
    row.thumb = UI.Icon(track, "circle", 14, C.text, "OVERLAY", 2)

    row.minText = UI.Text(row, "regular", 11, C.secondary)
    row.minText:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -56)
    row.maxText = UI.Text(row, "regular", 11, C.secondary)
    row.maxText:SetJustifyH("RIGHT")
    row.maxText:SetPoint("TOPRIGHT", row, "TOPRIGHT", -8, -56)
    row.minText:SetText(opts.format(opts.min))
    row.maxText:SetText(opts.format(opts.max))
    if opts.help then
        -- "D-pad ◂ ▸ · 5 % steps": the carets are textures, the font has no such glyphs.
        local help = CreateFrame("Frame", nil, row)
        help:SetHeight(14)
        help:SetPoint("TOP", row, "TOP", 0, -56)
        help.prefix = UI.Text(help, "regular", 11, C.secondary)
        help.prefix:SetText(L.SLIDER_HELP_PAD)
        help.left = UI.Caret(help, "LEFT", 8, C.secondary)
        help.right = UI.Caret(help, "RIGHT", 8, C.secondary)
        help.suffix = UI.Text(help, "regular", 11, C.secondary)
        help.suffix:SetText(opts.help)
        help.prefix:SetPoint("LEFT", help, "LEFT", 0, 0)
        help.left:SetPoint("LEFT", help.prefix, "RIGHT", 4, 0)
        help.right:SetPoint("LEFT", help.left, "RIGHT", 2, 0)
        help.suffix:SetPoint("LEFT", help.right, "RIGHT", 4, 0)
        help:SetWidth(help.prefix:GetStringWidth() + 4 + 8 + 2 + 8 + 4 + help.suffix:GetStringWidth())
        row.help = help
    end

    local function snap(v)
        v = math.floor(v / opts.step + 0.5) * opts.step
        return math.max(opts.min, math.min(opts.max, v))
    end
    local function setValue(v)
        opts.set(snap(v))
        row:Refresh()
    end

    -- Mouse: click or drag along the track.
    local function fromCursor()
        local left, w = track:GetLeft(), track:GetWidth()
        if not left or w <= 0 then return end
        local x = GetCursorPosition() / track:GetEffectiveScale()
        setValue(opts.min + (opts.max - opts.min) * math.max(0, math.min(1, (x - left) / w)))
    end
    track:SetScript("OnMouseDown", function(self)
        owner:SetFocus(row)
        self.dragging = true
        fromCursor()
    end)
    track:SetScript("OnMouseUp", function(self) self.dragging = false end)
    track:SetScript("OnUpdate", function(self) if self.dragging then fromCursor() end end)

    local refresh, setFocused = row.Refresh, row.SetFocused
    function row:Refresh()
        refresh(self)
        local v = opts.get()
        self.value:SetText(opts.format(v))
        local ratio = (v - opts.min) / (opts.max - opts.min)
        local w = width - 16
        self.fillFrame:SetWidth(math.max(4, w * ratio))
        self.fill:SetShown(ratio > 0)
        self.thumb:ClearAllPoints()
        self.thumb:SetPoint("CENTER", track, "LEFT", w * ratio, 0)
        self.thumbShadow:ClearAllPoints()
        self.thumbShadow:SetPoint("CENTER", track, "LEFT", w * ratio, -1)
    end
    function row:SetFocused(focused)
        setFocused(self, focused)
        self.label:SetFontObject(UI.Font("medium", 12))
        self.value:SetTextColor(unpack(focused and C.accent or C.text))
    end
    function row:Left() setValue(opts.get() - opts.step) end
    function row:Right() setValue(opts.get() + opts.step) end
    function row:Reset() setValue(opts.default) end
    function row:Activate() end
    function row:Hints()
        return { hint({ "PADDLEFT", "PADDRIGHT" }, L.HINT_ADJUST), hint("PAD4", L.HINT_RESET) }
    end
    row:Refresh()
    return row
end

-- A choice among values (◂ value ▸). opts: values = { { value, text } }, get, set, default
-- or text() / left() / right() without values.
function UI.SelectorRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, opts.desc and 44 or 36, width)
    row.kind = "selector"
    local right = UI.Caret(row, "RIGHT", 8, C.secondary)
    right:SetPoint("RIGHT", row, "RIGHT", -10, 0)
    local value = UI.Text(row, "medium", 12, C.text)
    value:SetJustifyH("CENTER")
    value:SetWidth(132)
    value:SetPoint("RIGHT", right, "LEFT", -6, 0)
    local left = UI.Caret(row, "LEFT", 8, C.secondary)
    left:SetPoint("RIGHT", value, "LEFT", -6, 0)
    row.value, row.left, row.right = value, left, right
    placeLabel(row, 8, 8 + 8 + 6 + 132 + 6 + 10)

    local values = opts.values
    local function index()
        local current = opts.get and opts.get()
        for i, v in ipairs(values or {}) do
            if v[1] == current then return i end
        end
        return 1
    end
    local function step(delta)
        if values then
            local i = (index() - 1 + delta) % #values + 1
            opts.set(values[i][1])
        elseif delta < 0 then
            opts.left()
        else
            opts.right()
        end
        row:Refresh()
    end

    local refresh, setFocused = row.Refresh, row.SetFocused
    function row:Refresh()
        refresh(self)
        value:SetText(values and values[index()][2] or opts.text())
    end
    function row:SetFocused(focused)
        setFocused(self, focused)
        local c = focused and C.accent or C.secondary
        left:SetVertexColor(unpack(c))
        right:SetVertexColor(unpack(c))
    end
    function row:Left() step(-1) end
    function row:Right() step(1) end
    function row:Activate() step(1) end
    function row:Reset()
        if opts.default ~= nil then
            opts.set(opts.default)
            self:Refresh()
        end
    end
    function row:Hints()
        local list = { hint({ "PADDLEFT", "PADDRIGHT" }, L.HINT_CHANGE) }
        if opts.default ~= nil then list[#list + 1] = hint("PAD4", L.HINT_RESET) end
        return list
    end
    row:Refresh()
    return row
end

-- A command (move, reset...). opts: button (text), run(), confirm (A twice within 4 s)
function UI.ButtonRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, opts.desc and 44 or 36, width)
    row.kind = "button"
    local b = CreateFrame("Frame", nil, row)
    b:SetHeight(24)
    b.bg = UI.Shape(b, "row", C.control, "ARTWORK"):Place(b)
    b.text = UI.Text(b, "medium", 12, C.text, "OVERLAY")
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    row.button = b
    local function setButton(text, color)
        b.text:SetText(text)
        b.text:SetTextColor(unpack(color or C.text))
        b:SetWidth(math.max(72, b.text:GetStringWidth() + 24))
    end
    setButton(opts.button)
    placeLabel(row, 8, 160)

    local token = 0
    function row:Cancel()
        if not self.confirming then return end
        self.confirming = false
        token = token + 1
        setButton(opts.button)
        self.owner:UpdateHelp()
    end
    function row:Activate()
        if opts.confirm and not self.confirming then
            self.confirming = true
            token = token + 1
            local mine = token
            local text = Ding.Gamepad:Active() and L.CONFIRM:format(Ding.Gamepad:KeyName("PAD1")) or L.CONFIRM_CLICK
            setButton(text, C.accent)
            self.owner:UpdateHelp()
            C_Timer.After(4, function()
                if token == mine then self:Cancel() end
            end)
            return
        end
        self:Cancel()
        opts.run()
        self.owner:RefreshRows()
    end
    function row:Hints()
        if self.confirming then return { hint("PAD1", L.HINT_CONFIRM) } end
        return { hint("PAD1", opts.hint or L.HINT_RUN) }
    end
    return row
end

-- A long list on a page of its own: the row says how much is on (value()), A or a click
-- opens the page (open()). opts: label, desc, value() -> text, open()
function UI.PageRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, opts.desc and 44 or 36, width)
    row.kind = "page"
    local caret = UI.Caret(row, "RIGHT", 8, C.secondary)
    caret:SetPoint("RIGHT", row, "RIGHT", -10, 0)
    local value = UI.Text(row, "medium", 12, C.text)
    value:SetJustifyH("RIGHT")
    value:SetPoint("RIGHT", caret, "LEFT", -8, 0)
    row.value, row.caret = value, caret
    placeLabel(row, 8, 8 + 8 + 8 + 132)
    local refresh, setFocused = row.Refresh, row.SetFocused
    function row:Refresh()
        refresh(self)
        value:SetText(opts.value and opts.value() or "")
    end
    function row:SetFocused(focused)
        setFocused(self, focused)
        caret:SetVertexColor(unpack(focused and C.accent or C.secondary))
    end
    function row:Activate() opts.open() end
    function row:Right() opts.open() end
    function row:Hints() return { hint("PAD1", L.HINT_OPEN) } end
    row:Refresh()
    return row
end

-- "More options": rows used rarely, folded. A or a click unfolds or folds them.
-- opts: label, get() -> unfolded, set(unfolded)
function UI.FoldRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, 32, width)
    row.kind = "fold"
    row.label:SetTextColor(unpack(C.secondary))
    local caret = UI.Caret(row, "DOWN", 8, C.secondary)
    caret:SetPoint("LEFT", row, "LEFT", 8, 0)
    row.caret = caret
    placeLabel(row, 8 + 8 + 8, 0)
    local refresh = row.Refresh
    function row:Refresh()
        refresh(self)
        local open = opts.get()
        caret:SetRotation(UI.CARET[open and "DOWN" or "RIGHT"])
        self.label:SetText(open and opts.labelOpen or opts.label)
    end
    function row:Activate() opts.set(not opts.get()) end
    function row:Hints() return { hint("PAD1", opts.get() and L.HINT_FOLD or L.HINT_UNFOLD) } end
    row:Refresh()
    return row
end

-- Title of a page opened from a PageRow: a back caret and the page's name; a click goes
-- back. Not focusable: B, Esc or a right click go back too.
function UI.PageTitleRow(parent, text, width, back)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(width, 30)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row.caret = UI.Caret(row, "LEFT", 8, C.accent)
    row.caret:SetPoint("LEFT", row, "LEFT", 8, 0)
    row.label = UI.Text(row, "semibold", 13, C.text)
    row.label:SetPoint("LEFT", row.caret, "RIGHT", 8, 0)
    row.label:SetText(text)
    row:SetScript("OnClick", function() back() end)
    function row:Refresh() end
    return row
end

-- A Ding key binding (DING_NEXT...): A waits for a button, Y clears it.
function UI.BindingRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, 36, width)
    row.kind = "binding"
    placeLabel(row, 8, 180)
    row.chip = UI.Glyph(row, { height = 18, font = 10, bg = C.glyphBg, text = C.text })
    row.chip:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    row.status = UI.Text(row, "regular", 11, C.disabled)
    row.status:SetJustifyH("RIGHT")
    row.status:SetPoint("RIGHT", row, "RIGHT", -8, 0)

    local refresh = row.Refresh
    function row:Refresh()
        refresh(self)
        local G = Ding.Gamepad
        local message, color
        if self.conflict then
            local text = Ding.Gamepad:Active() and L.BIND_CONFLICT or L.BIND_CONFLICT_MOUSE
            message, color = text:format(self.conflict), C.accent
        elseif self.capturing then
            message, color = L.BIND_WAIT, C.accent
        end
        local key = not message and G:BindingKey(opts.action)
        if key then
            self.chip:SetKey(key)
            self.chip.key = G:KeyName(key)
            self.chip:Show()
            self.status:Hide()
        else
            self.chip.key = nil
            self.chip:Hide()
            self.status:SetText(message or L.NOT_BOUND)
            self.status:SetTextColor(unpack(color or C.disabled))
            self.status:Show()
        end
    end
    function row:Activate() self.owner:StartCapture(self) end
    function row:Reset()
        Ding.Gamepad:Unbind(opts.action)
        self:Refresh()
    end
    function row:Hints() return { hint("PAD1", L.HINT_ASSIGN), hint("PAD4", L.HINT_UNBIND) } end
    row:Refresh()
    return row
end

---------------------------------------------------------------------------
-- Dropdown (Guide tab): a 32-high field showing the choice; A opens the list below it.
-- opts: items() -> { { value, text, detail, dim, current } }, get(), set(value), empty
-- While the list is open, owner.dropdown is the list and owner routes keys to
-- list:OnKey(key) (true when handled).
---------------------------------------------------------------------------
local DROPDOWN = { boxHeight = 32, itemHeight = 28, gap = 2, visible = 8, pad = 4 }
UI.DROPDOWN = DROPDOWN

local function dropdownItem(list, i)
    local item = CreateFrame("Button", nil, list)
    item:SetHeight(DROPDOWN.itemHeight)
    local y = -DROPDOWN.pad - (i - 1) * (DROPDOWN.itemHeight + DROPDOWN.gap)
    item:SetPoint("TOPLEFT", list, "TOPLEFT", DROPDOWN.pad, y)
    item:SetPoint("TOPRIGHT", list, "TOPRIGHT", -DROPDOWN.pad, y)
    item:RegisterForClicks("LeftButtonUp")
    item.focus = UI.Focus(item)
    item.mark = UI.Icon(item, "icon_check", 11, C.accent)
    item.mark:SetPoint("LEFT", item, "LEFT", 8 + 0.5, 0)
    item.detail = UI.Text(item, "regular", 11, C.secondary)
    item.detail:SetJustifyH("RIGHT")
    item.detail:SetPoint("RIGHT", item, "RIGHT", -8, 0)
    item.text = UI.Text(item, "regular", 12, C.text)
    item:SetScript("OnEnter", function() list:Highlight(list.offset + i) end)
    item:SetScript("OnClick", function() list:Pick(list.offset + i) end)
    return item
end

local function dropdownList(row)
    local owner = row.owner
    local list = CreateFrame("Frame", nil, owner.frame)
    list:SetFrameStrata("FULLSCREEN_DIALOG")
    list:SetClampedToScreen(true)
    list:EnableMouse(true)
    list:EnableMouseWheel(true)
    list.look = {
        shadow = UI.Shape(list, "shadow", C.shadow, "BACKGROUND", -8):Place(list, 16, 4),
        fill = UI.Shape(list, "row", C.control, "BACKGROUND", -7):Place(list),
        border = UI.Shape(list, "rowBorder", C.border, "BORDER"):Place(list),
    }
    list:Hide()
    list.items, list.entries, list.index, list.offset = {}, {}, 1, 0

    -- A header entry ({ header = true, text }) names the group of entries under it: it can
    -- be neither highlighted nor picked.
    function list:Selectable(n)
        local entry = self.entries[n]
        return entry ~= nil and not entry.header
    end

    -- The selectable entry nearest to n, looking first in the direction dir (1 or -1).
    function list:Nearest(n, dir)
        for _, d in ipairs({ dir, -dir }) do
            local m = n
            while self.entries[m] do
                if self:Selectable(m) then return m end
                m = m + d
            end
        end
    end

    -- Keeps `index` inside the visible window, with the header right above it.
    function list:Scroll()
        local visible = math.min(#self.entries, DROPDOWN.visible)
        local top = self.index
        if top > 1 and self.entries[top - 1].header then top = top - 1 end
        if top <= self.offset then
            self.offset = top - 1
        elseif self.index > self.offset + visible then
            self.offset = self.index - visible
        end
        self.offset = math.max(0, math.min(self.offset, #self.entries - visible))
    end

    function list:Render()
        local visible = math.min(#self.entries, DROPDOWN.visible)
        self:SetHeight(2 * DROPDOWN.pad + visible * DROPDOWN.itemHeight + math.max(0, visible - 1) * DROPDOWN.gap)
        local width = self:GetWidth()
        for i = 1, math.max(visible, #self.items) do
            local item = self.items[i]
            if i <= visible then
                item = item or dropdownItem(self, i)
                self.items[i] = item
                local n = self.offset + i
                local entry = self.entries[n]
                local focused = n == self.index
                item.text:SetText(entry.text)
                item.text:ClearAllPoints()
                if entry.header then
                    item.text:SetPoint("LEFT", item, "LEFT", 8, 0)
                    item.text:SetFontObject(UI.Font("semibold", 11))
                    item.text:SetTextColor(unpack(C.secondary))
                else
                    item.text:SetPoint("LEFT", item, "LEFT", 8 + 12 + 8, 0)
                    item.text:SetFontObject(UI.Font(focused and "medium" or "regular", 12))
                    item.text:SetTextColor(unpack(entry.dim and C.disabled or C.text))
                end
                item.detail:SetText(entry.detail or "")
                item.detail:SetTextColor(unpack(entry.dim and C.disabled or C.secondary))
                item.text:SetWidth(math.max(60, width - 2 * DROPDOWN.pad - 28 - 8 - 8 - item.detail:GetStringWidth()))
                item.mark:SetShown(entry.current and not entry.header and true or false)
                item.focus:SetShown(focused)
                item.fill = item.focus.fill
                item:Show()
            elseif item then
                item:Hide()
            end
        end
    end

    function list:Open()
        self.entries = row.opts.items()
        self.index, self.offset = self:Nearest(1, 1), 0
        if not self.index then return false end
        local current = row.opts.get()
        for n, entry in ipairs(self.entries) do
            if not entry.header and entry.value == current then self.index = n end
        end
        self:Scroll()
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", row.box, "BOTTOMLEFT", 0, -4)
        self:SetWidth(row.box:GetWidth())
        self:Render()
        self:Show()
        row:SetOpen(true)
        owner.dropdown = self
        owner:UpdateHelp()
        return true
    end

    function list:Close()
        if not self:IsShown() then return end
        self:Hide()
        row:SetOpen(false)
        if owner.dropdown == self then owner.dropdown = nil end
        owner:UpdateHelp()
    end

    function list:Highlight(n)
        if not self:Selectable(n) then return end
        self.index = n
        self:Scroll()
        self:Render()
    end

    function list:Move(delta)
        local count = #self.entries
        local n = self.index
        for _ = 1, count do
            n = (n - 1 + delta) % count + 1
            if self:Selectable(n) then return self:Highlight(n) end
        end
    end

    function list:Pick(n)
        local entry = self.entries[n or self.index]
        if entry and entry.header then return end
        self:Close()
        if entry then row.opts.set(entry.value) end
        if row.Refresh then row:Refresh() end
    end

    function list:OnKey(key)
        if key == "PAD1" then
            self:Pick()
        elseif key == "PAD2" then
            self:Close()
        elseif key == "PADDUP" then
            self:Move(-1)
        elseif key == "PADDDOWN" then
            self:Move(1)
        elseif key == "PADDLEFT" then
            self:Highlight(self:Nearest(math.max(1, self.index - DROPDOWN.visible), -1))
        elseif key == "PADDRIGHT" then
            self:Highlight(self:Nearest(math.min(#self.entries, self.index + DROPDOWN.visible), 1))
        else
            return false
        end
        return true
    end

    list:SetScript("OnMouseWheel", function(self, delta)
        local visible = math.min(#self.entries, DROPDOWN.visible)
        self.offset = math.max(0, math.min(#self.entries - visible, self.offset - delta))
        self:Render()
    end)
    return list
end

-- The row holds the field only; the label ("Active guide") is a LabelRow above it.
function UI.DropdownRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, DROPDOWN.boxHeight, width)
    row.kind = "dropdown"
    row.label:Hide()
    row.focus:SetShown(false)
    local box = CreateFrame("Button", nil, row)
    box:SetAllPoints(row)
    box:RegisterForClicks("LeftButtonUp")
    box.bg = UI.Shape(box, "row", C.control, "BACKGROUND"):Place(box)
    box.focus = UI.Focus(box, true)
    box.caret = UI.Caret(box, "DOWN", 8, C.secondary)
    box.caret:SetPoint("RIGHT", box, "RIGHT", -10, 0)
    box.detail = UI.Text(box, "regular", 11, C.secondary)
    box.detail:SetJustifyH("RIGHT")
    box.detail:SetPoint("RIGHT", box.caret, "LEFT", -8, 0)
    box.text = UI.Text(box, "medium", 12, C.text)
    box.text:SetPoint("LEFT", box, "LEFT", 10, 0)
    box:SetScript("OnEnter", function() owner:SetFocus(row) end)
    box:SetScript("OnClick", function()
        owner:SetFocus(row)
        row:Activate()
    end)
    row.box = box

    function row:SetOpen(open)
        box.caret:SetRotation(open and 0 or math.pi)
    end
    local refresh = row.Refresh
    function row:Refresh()
        refresh(self)
        local current, entry = opts.get(), nil
        for _, e in ipairs(opts.items()) do
            if not e.header and e.value == current then entry = e end
        end
        box.text:SetText(entry and entry.text or opts.empty or "")
        box.detail:SetText(entry and entry.levels or "")
        box.text:SetWidth(math.max(40, width - 10 - 8 - 8 - 8 - box.detail:GetStringWidth() - 10))
    end
    function row:SetFocused(focused)
        self.focused = focused
        box.focus:SetShown(focused)
    end
    function row:Activate()
        if self.list and self.list:IsShown() then
            self.list:Pick()
            return
        end
        self.list = self.list or dropdownList(self)
        self.list:Open()
    end
    function row:Cancel()
        if self.list then self.list:Close() end
    end
    function row:Hints() return { hint("PAD1", L.HINT_SELECT) } end
    row:Refresh()
    return row
end

---------------------------------------------------------------------------
-- Non-focusable content
---------------------------------------------------------------------------
-- Small secondary label above a field ("Active guide") or a group of rows.
function UI.LabelRow(parent, text, width)
    local row = CreateFrame("Frame", nil, parent)
    row:SetSize(width, 14)
    row.label = UI.Text(row, "regular", 11, C.secondary)
    row.label:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
    row.label:SetText(text)
    function row:Refresh() end
    return row
end

-- Header of a block of rows ("Quests", "Merchant"): small, secondary, a little space above.
function UI.HeaderRow(parent, text, width)
    local row = CreateFrame("Frame", nil, parent)
    row:SetSize(width, 24)
    row.label = UI.Text(row, "semibold", 11, C.secondary)
    row.label:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 2)
    row.label:SetText(text)
    row.header = true
    function row:Refresh() end
    return row
end

-- Plain paragraph (help text above a list).
function UI.InfoRow(parent, text, width)
    local row = CreateFrame("Frame", nil, parent)
    row.text = UI.Text(row, "regular", 11, C.secondary)
    UI.Wrap(row.text, 11)
    row.text:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -4)
    row.text:SetWidth(width - 16)
    row.text:SetText(text)
    row:SetSize(width, row.text:GetStringHeight() + 8)
    function row:Refresh() end
    return row
end

-- Accent banner (first launch).
function UI.BannerRow(parent, title, text, width)
    local row = CreateFrame("Frame", nil, parent)
    row.bg = UI.Shape(row, "row", C.accentBg, "BACKGROUND"):Place(row)
    row.title = UI.Text(row, "semibold", 12, C.text)
    row.title:SetPoint("TOPLEFT", row, "TOPLEFT", 10, -8)
    row.title:SetText(title)
    row.text = UI.Text(row, "regular", 11, C.secondary)
    UI.Wrap(row.text, 11)
    row.text:SetPoint("TOPLEFT", row.title, "BOTTOMLEFT", 0, -4)
    row.text:SetWidth(width - 20)
    row.text:SetText(text)
    row:SetSize(width, 8 + 16 + 4 + row.text:GetStringHeight() + 8)
    function row:Refresh() end
    return row
end
