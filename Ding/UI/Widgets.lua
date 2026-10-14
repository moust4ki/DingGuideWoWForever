-- Shared UI pieces of the Ding design (docs/UI-handoff.md, docs/UI-themes.md): color tokens
-- (UI.C, filled by the active theme: UI/Themes.lua), Noto Sans fonts, rounded shapes drawn as
-- nine-slices of the design textures, gamepad glyphs, fades, the settings rows and the hover
-- card. Plain frames only (no templates), so nothing here is protected.
--
-- Every paint goes through a token: UI.Color (texts), UI.Tint (textures), UI.Fill (color
-- textures), UI.Paint (gradients), Slice:SetColor. The region remembers its last token, and a
-- theme change paints it again with the new values (UI.Repaint); what a widget draws by
-- itself (a window's style, a chip's shape) is its skin (UI.Skin).
local _, Ding = ...
local L = Ding.L

local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local unpack = unpack

UI.MEDIA = "Interface\\AddOns\\Ding\\Media\\"
UI.TEX = UI.MEDIA .. "Textures\\"
UI.WHITE = "Interface\\Buttons\\WHITE8X8"

local function theme() return UI.Theme.current end

-- Sizes shared by Ding's dialog windows (settings, NPC directory, setup assistant, import /
-- export), so that they stay alike. A little denser than the design's first handoff, at the
-- user's request ("too big, too airy": docs/UI-handoff.md, Density); the handoff's values in
-- brackets. Themes never change them.
UI.SIZE = {
    title = 28,       -- title bar [32]
    tabs = 28,        -- tab bar [settings 36, directory 30]
    footer = 26,      -- hint bar [settings 32, directory 28]
    pad = 8,          -- from the window's edge to its rows [12]
    gap = 2,          -- between two rows [4]
    row = 30,         -- a row of one line [36]
    row2 = 36,        -- a row of two lines, a label and a line under it [44; directory 38]
    fold = 28,        -- "More options" [32]
    header = 20,      -- a block's header [24]
    pageTitle = 26,   -- a page's title [30]
    button = 24,      -- push buttons [26]
}
local SIZE = UI.SIZE

-- Ding's dialog windows are drawn at the size chosen in the Appearance tab (Ding.db.ui.
-- dialogScale, 60 % to 120 %): on a high-resolution screen the game's UI scale draws them big.
-- The guide window has its own size.
UI.DIALOG_SCALE = { min = 0.6, max = 1.2, default = 0.85 }
local dialogs = {}

function UI.DialogScale()
    local S = UI.DIALOG_SCALE
    local v = tonumber(Ding.db and Ding.db.ui and Ding.db.ui.dialogScale) or S.default
    return math.max(S.min, math.min(S.max, v))
end

-- A dialog window at the size chosen: `dialogX`, `dialogY` units from the screen's center
-- whatever its size, and kept on the screen.
local function placeDialog(frame)
    local scale = UI.DialogScale()
    frame:SetScale(scale)
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", UIParent, "CENTER", frame.dialogX / scale, frame.dialogY / scale)
end

-- A dialog window of Ding: its size follows the setting, its place the screen's center.
function UI.Dialog(frame, x, y)
    frame.dialogX, frame.dialogY = x or 0, y or 0
    frame:SetClampedToScreen(true)
    dialogs[#dialogs + 1] = frame
    placeDialog(frame)
end

-- Sets the dialog windows' size (0.6 to 1.2), the open ones at once.
function UI.SetDialogScale(value)
    local S = UI.DIALOG_SCALE
    local scale = math.max(S.min, math.min(S.max, tonumber(value) or S.default))
    Ding.db.ui.dialogScale = scale
    for _, frame in ipairs(dialogs) do placeDialog(frame) end
    return scale
end

---------------------------------------------------------------------------
-- Painting through tokens, and painting again on a theme change
---------------------------------------------------------------------------
local painted = setmetatable({}, { __mode = "k" })    -- region -> true
local skins = setmetatable({}, { __mode = "k" })      -- object -> skin(object, theme)
local skinOrder = setmetatable({}, { __mode = "k" })  -- object -> registration number
local skinCount = 0

local function alphaOf(token, i, mul) return (token[i] or 1) * (mul or 1) end

-- A text in a token's color.
function UI.Color(fs, token)
    fs:SetTextColor(token[1], token[2], token[3], token[4] or 1)
    fs.dingPaint = { "color", token }
    painted[fs] = true
end

-- A texture (white mask) tinted by a token; `mul` scales its alpha.
function UI.Tint(tex, token, mul)
    tex:SetVertexColor(token[1], token[2], token[3], alphaOf(token, 4, mul))
    tex.dingPaint = { "tint", token, mul }
    painted[tex] = true
end

-- A color texture (lines, plain areas).
function UI.Fill(tex, token, mul)
    tex:SetColorTexture(token[1], token[2], token[3], alphaOf(token, 4, mul))
    tex.dingPaint = { "fill", token, mul }
    painted[tex] = true
end

-- A texture (white, or a file) in a token's color, a gradient when the token has two colors
-- (8 numbers): HORIZONTAL left to right, VERTICAL bottom to top (Compat.SetGradient).
function UI.Paint(tex, token, orientation, mul)
    if token[5] then
        tex:SetVertexColor(1, 1, 1, 1)
        Compat.SetGradient(tex, orientation or "HORIZONTAL",
            { token[1], token[2], token[3], alphaOf(token, 4, mul) },
            { token[5], token[6], token[7], alphaOf(token, 8, mul) })
    else
        tex:SetVertexColor(token[1], token[2], token[3], alphaOf(token, 4, mul))
    end
    tex.dingPaint = { "paint", token, mul, orientation }
    painted[tex] = true
end

local PAINT = {
    color = function(r, p) UI.Color(r, p[2]) end,
    tint = function(r, p) UI.Tint(r, p[2], p[3]) end,
    fill = function(r, p) UI.Fill(r, p[2], p[3]) end,
    paint = function(r, p) UI.Paint(r, p[2], p[4], p[3]) end,
}

-- skin(object, theme): what `object` draws by itself, run again on every theme change, in
-- the order the objects registered (a window before its parts).
function UI.Skin(object, skin)
    skins[object] = skin
    skinCount = skinCount + 1
    skinOrder[object] = skinCount
end

local slices = setmetatable({}, { __mode = "k" })

-- After UI.Theme.Apply copied the new tokens: the recorded paints, the slices (their shape
-- and color), then the skins.
function UI.Repaint(t)
    for region in pairs(painted) do
        local p = region.dingPaint
        if p then PAINT[p[1]](region, p) end
    end
    for slice in pairs(slices) do slice:Reskin() end
    local list = {}
    for object in pairs(skins) do list[#list + 1] = object end
    table.sort(list, function(a, b) return skinOrder[a] < skinOrder[b] end)
    for _, object in ipairs(list) do skins[object](object, t) end
end

-- Inline color codes for texts made of several colors, from the theme's tokens.
local function hexOf(token)
    local function byte(v) return math.floor(math.max(0, math.min(1, v)) * 255 + 0.5) end
    return ("%02x%02x%02x"):format(byte(token[1]), byte(token[2]), byte(token[3]))
end
UI.HexOf = hexOf
function UI.Colored(name, s) return "|cff" .. hexOf(C[name]) .. s .. "|r" end

function UI.StripColors(s)
    return (s:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
end

-- "Ding! · Settings": the name in the accent, the dot dimmed; painted again with the theme.
function UI.Title(fs, rest)
    fs.dingTitle = rest
    fs:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. rest)
    UI.Skin(fs, function(self) self:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. self.dingTitle) end)
end

-- After a list cut short, what is left in words ("and 2 more"; `quests`: "and 1 more quest"),
-- never a bare "+2".
function UI.More(n, quests)
    if quests then return n == 1 and L.MORE_QUESTS_ONE or L.MORE_QUESTS:format(n) end
    return n == 1 and L.MORE_ONE or L.MORE:format(n)
end

---------------------------------------------------------------------------
-- Fonts: Noto Sans in four weights (OFL, shipped in Media/Fonts), and the game's own font for
-- titles in some themes (never shipped). A font object is kept per weight, size and surface;
-- a theme change sets its file, flags and shadow again in place, so the texts using it follow.
-- Surfaces: "dialog" (settings and Ding's windows), "scene" (the guide window), "card" (the
-- hover card), "world" (the arrow, the item's name: over the game world), "chip" (gamepad
-- chips: no shadow, no outline).
---------------------------------------------------------------------------
local FONT_FILES = { regular = "Regular", medium = "Medium", semibold = "SemiBold", bold = "Bold" }
-- Noto Sans has no Korean nor Chinese glyphs: those clients keep the game's own font.
local GAME_FONT = { koKR = true, zhCN = true, zhTW = true }
UI.GAME_FONT = GAME_FONT
local fonts, fontList = {}, {}

local function gamePath() return STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF" end
local function notoPath(weight) return UI.MEDIA .. "Fonts\\NotoSans-" .. FONT_FILES[weight] .. ".ttf" end

-- Titles by role (docs/UI-themes.md, Typography): the game's font at `game`, or Noto Sans
-- SemiBold at `noto`; the line height stays the same in every theme. `flag`: the theme flag
-- that picks the font.
UI.TITLE_ROLES = {
    window = { game = 13, noto = 12, line = 16, flag = "titleFont" },     -- guide window title
    header = { game = 13, noto = 12, line = 16, flag = "titleFont" },     -- a quest's header
    settings = { game = 14, noto = 13, line = 18, flag = "titleFont" },   -- dialog titles
    arrow = { game = 14, noto = 13, line = 18, flag = "titleFont" },      -- the arrow's first line
    block = { game = 12, noto = 11, line = 14, flag = "blockHeaderFont" },  -- settings block headers
}

-- Outline flag and shadow offset of a surface in the current theme.
local function surfaceLook(surface)
    if surface == "chip" then return "", nil end
    local flags = theme().flags
    local outline
    if surface == "scene" then
        outline = UI.Theme.SceneOutline()
    elseif surface == "card" or surface == "world" then
        outline = flags.fontOutline or nil
    end
    local shadow = flags.textShadow
    -- Over the game world a text always has its shadow, unless it is outlined.
    if not shadow and surface == "world" and not outline then shadow = { 0, -1 } end
    return outline or "", shadow
end

local function setFont(entry)
    local font, path, size = entry.font, nil, nil
    if entry.role then
        -- Korean and Chinese: the game's file whatever the theme, at the theme's size.
        local role = UI.TITLE_ROLES[entry.role]
        local game = theme().flags[role.flag] == "game"
        path = (game or GAME_FONT[Ding.locale]) and gamePath() or notoPath("semibold")
        size = game and role.game or role.noto
    else
        path, size = GAME_FONT[Ding.locale] and gamePath() or notoPath(entry.weight), entry.size
    end
    local flags, shadow = surfaceLook(entry.surface)
    local ok, loaded = pcall(font.SetFont, font, path, size, flags)
    -- A refused file leaves the font unset, and SetText on it would then error.
    if not ok or loaded == false or not font:GetFont() then
        pcall(font.SetFont, font, gamePath(), size, flags)
    end
    if font.SetShadowOffset then
        local s = C.textShadow
        if shadow then
            font:SetShadowOffset(shadow[1], shadow[2])
            font:SetShadowColor(s[1], s[2], s[3], s[4] or 1)
        else
            font:SetShadowOffset(0, 0)
            font:SetShadowColor(s[1], s[2], s[3], 0)
        end
    end
end

local function makeFont(key, name, entry)
    if fonts[key] then return fonts[key].font end
    entry.font = CreateFont(name)
    fonts[key] = entry
    fontList[#fontList + 1] = entry
    setFont(entry)
    return entry.font
end

-- Font object for a weight ("regular", "medium", "semibold", "bold"), a size and a surface
-- (default "dialog"). If the client refuses the file, the game's own font stands in.
function UI.Font(weight, size, surface)
    surface = surface or "dialog"
    local key = (surface == "dialog" and "" or (surface .. "_")) .. weight .. size
    return makeFont(key, "DingFont_" .. key, { weight = weight, size = size, surface = surface })
end

-- Font object of a title role (UI.TITLE_ROLES) on a surface.
function UI.TitleFont(role, surface)
    surface = surface or "dialog"
    local key = "title:" .. role .. ":" .. surface
    return makeFont(key, "DingTitleFont_" .. role .. "_" .. surface, { role = role, surface = surface })
end

-- Every font object again (a theme change, the guide window's opacity in halo).
function UI.RefreshFonts()
    for _, entry in ipairs(fontList) do setFont(entry) end
end

-- One-line text by default; multi-line texts call UI.Wrap. `surface`: see above.
function UI.Text(parent, weight, size, color, layer, surface)
    local fs = parent:CreateFontString(nil, layer or "ARTWORK")
    fs.dingSurface = surface
    fs.dingWeight, fs.dingSize = weight, size
    fs:SetFontObject(UI.Font(weight, size, surface))
    fs:SetJustifyH("LEFT")
    fs:SetWordWrap(false)
    UI.Color(fs, color or C.text)
    return fs
end

-- Another weight or size for a text, on its own surface.
function UI.SetFont(fs, weight, size)
    fs.dingWeight, fs.dingSize, fs.dingRole = weight, size, nil
    fs:SetFontObject(UI.Font(weight, size, fs.dingSurface))
end

-- A title role's font for a text (UI.TITLE_ROLES); wrapped texts keep the role's line height.
function UI.SetTitleFont(fs, role)
    fs.dingRole = role
    fs:SetFontObject(UI.TitleFont(role, fs.dingSurface))
end

-- Line height 16 for 12 px, 14 for 11 px (design typography), at most `lines` lines.
-- `size` may be a title role: its line height whatever the theme's font.
function UI.Wrap(fs, size, lines)
    fs:SetWordWrap(true)
    fs:SetJustifyV("TOP")
    local spacing
    local role = type(size) == "string" and UI.TITLE_ROLES[size]
    if role then
        local game = theme().flags[role.flag] == "game"
        spacing = role.line - (game and role.game or role.noto)
    else
        spacing = size >= 12 and 4 or 3
    end
    if fs.SetSpacing then pcall(fs.SetSpacing, fs, spacing) end
    if lines and fs.SetMaxLines then pcall(fs.SetMaxLines, fs, lines) end
end

-- Width of a text as written. The client bounds GetStringWidth by a width already set:
-- the width is released first, so a text that grew is not measured at its old size.
function UI.Measure(fs)
    fs:SetWidth(0)
    return fs:GetStringWidth()
end

-- Texts drawn over the game world (arrow, item name): their shadow (or the theme's outline)
-- comes with their font, the "world" surface.
function UI.Shadow(fs)
    fs.dingSurface = "world"
    if fs.dingRole then
        UI.SetTitleFont(fs, fs.dingRole)
    elseif fs.dingWeight then
        UI.SetFont(fs, fs.dingWeight, fs.dingSize)
    end
end

---------------------------------------------------------------------------
-- Nine-slices: a white texture with rounded corners of `margin` texels, stretched over
-- a region at one texel per unit, so corners stay round at any size. Plain textures and
-- SetTexCoord only, which every client has (SetTextureSliceMargins may be missing).
---------------------------------------------------------------------------
local Slice = {}
Slice.__index = Slice

local function sliceCoords(s)
    local m = s.margin / s.size
    local coords = { 0, m, 1 - m, 1 }
    local i = 0
    for row = 0, 2 do
        for col = 0, 2 do
            i = i + 1
            local t = s.parts[i]
            t:SetTexture(UI.TEX .. s.file)
            t:SetTexCoord(coords[col + 1], coords[col + 2], coords[row + 1], coords[row + 2])
        end
    end
end

-- file: texture name in Media/Textures; size: 32 or 64 (its width in texels).
function UI.Slice(parent, file, margin, size, layer, sublevel)
    local s = setmetatable({ parts = {}, margin = margin, size = size, file = file }, Slice)
    for i = 1, 9 do s.parts[i] = parent:CreateTexture(nil, layer or "BACKGROUND", nil, sublevel or 0) end
    sliceCoords(s)
    slices[s] = true
    return s
end

-- Covers `region`, grown by `outset` on each side (negative: inside), moved down by `drop`.
function Slice:Place(region, outset, drop)
    self.region, self.outset, self.drop = region, outset, drop
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

-- Another texture of the kit (a theme's radius): coordinates and corners follow.
function Slice:SetFile(file)
    if file == self.file then return self end
    local spec = UI.SLICES[file]
    self.file, self.margin, self.size = file, spec[1], spec[2]
    sliceCoords(self)
    if self.region then self:Place(self.region, self.outset, self.drop) end
    return self
end

-- A color: numbers (r, g, b, a), or a token, its alpha times `mul`; a token of two colors is
-- a gradient across the slice (HORIZONTAL by default, VERTICAL: bottom to top).
local COLUMNS = { { 1, 4, 7 }, { 2, 5, 8 }, { 3, 6, 9 } }
local ROWS = { { 7, 8, 9 }, { 4, 5, 6 }, { 1, 2, 3 } }    -- bottom, middle, top
function Slice:SetColor(r, g, b, a)
    local token, mul, orientation
    if type(r) == "table" then
        token, mul, orientation = r, g, b
        r, g, b, a = token[1], token[2], token[3], alphaOf(token, 4, mul)
    end
    self.token, self.mul, self.orientation = token, mul, orientation
    self.color = { r, g, b, a or 1 }
    if token and token[5] then
        local first = { r, g, b, a }
        local last = { token[5], token[6], token[7], alphaOf(token, 8, mul) }
        local groups = orientation == "VERTICAL" and ROWS or COLUMNS
        for _, i in ipairs(groups[1]) do self.parts[i]:SetVertexColor(unpack(first)) end
        for _, i in ipairs(groups[3]) do self.parts[i]:SetVertexColor(unpack(last)) end
        for _, i in ipairs(groups[2]) do
            self.parts[i]:SetVertexColor(1, 1, 1, 1)
            Compat.SetGradient(self.parts[i], orientation or "HORIZONTAL", first, last)
        end
        self.gradient = last
    else
        self.gradient = nil
        for _, t in ipairs(self.parts) do t:SetVertexColor(r, g, b, a or 1) end
    end
    return self
end

-- A theme change: the shape of its theme (UI.Shape) and its token's new values.
function Slice:Reskin()
    if self.shape then self:SetFile(UI.ShapeFile(self.shape)) end
    if self.token then self:SetColor(self.token, self.mul, self.orientation) end
end

function Slice:SetShown(shown)
    self.shown = shown and true or false
    for _, t in ipairs(self.parts) do t:SetShown(shown) end
end
function Slice:Show() self:SetShown(true) end
function Slice:Hide() self:SetShown(false) end
function Slice:IsShown() return self.shown ~= false end

-- Shapes of the kit, by name: a texture, or what the theme picks (its radii, its focus ring).
local function rr(n) return "rr" .. n .. "_fill" end
local SHAPES = {
    window = function(t) return rr(t.radius.window > 0 and t.radius.window or t.radius.row) end,
    windowBorder = "rr6_stroke1",
    row = function(t) return rr(t.radius.row) end,
    rowBorder = "rr4_stroke1",
    ring = function(t) return t.tex.focusRing end,
    halo = "focus_halo",
    small = function(t) return rr(t.radius.icon) end,
    smallBorder = "rr3_stroke15",
    bar = "rr2_fill",
    card = function(t) return rr(t.radius.card) end,
    shadow = "shadow",
    feather = "soft_rect",
}
function UI.ShapeFile(shape)
    local s = SHAPES[shape]
    return type(s) == "function" and s(theme()) or s
end

function UI.Shape(parent, shape, color, layer, sublevel)
    local file = UI.ShapeFile(shape)
    local spec = UI.SLICES[file]
    local slice = UI.Slice(parent, file, spec[1], spec[2], layer, sublevel)
    slice.shape = shape
    if color then slice:SetColor(color) end
    return slice
end

---------------------------------------------------------------------------
-- Window looks. kind: "panel" (the guide window: its opacity, its bands drawn by the panel),
-- "dialog" (settings, directory, setup, import, NPC offers, banners, plates), "card" (the
-- hover card), "popup" (menus, dropdown lists), "item" (the item button). The theme's
-- windowStyle: "feather" (a veil with soft edges, 20 outside the frame; 12 for the card),
-- "panel" (rounded fill, shadow; Ding dark: a 1-unit border), "bands" (the guide window draws
-- a band per row; the card is one band; dialogs are panels). Every piece is made once; a theme
-- change only shows, hides and paints them.
---------------------------------------------------------------------------
local FEATHER_OUT = { card = 12 }

function UI.WindowStyle(kind)
    local style = theme().flags.windowStyle
    if kind == "popup" or kind == "item" then return "panel" end
    if kind == "dialog" and style == "bands" then return "panel" end
    return style
end

-- Returns { shadow, feather, fill, border, topLine, SetBgAlpha(alpha), Skin() }: with a
-- see-through background the border and the shadow fade too, so a 0 % window shows its texts
-- only.
function UI.Window(frame, kind)
    kind = kind or "dialog"
    local w = { frame = frame, kind = kind }
    w.shadow = UI.Shape(frame, "shadow", nil, "BACKGROUND", -8):Place(frame, 16, 4)
    w.feather = UI.Shape(frame, "feather", nil, "BACKGROUND", -8):Place(frame, FEATHER_OUT[kind] or 20)
    w.fill = UI.Shape(frame, kind == "popup" and "row" or "window", nil, "BACKGROUND", -7):Place(frame)
    w.border = UI.Shape(frame, kind == "popup" and "rowBorder" or "windowBorder", nil, "BORDER", 7):Place(frame)
    -- A card's top line (Ardoise).
    w.topLine = frame:CreateTexture(nil, "BORDER", nil, 6)
    w.topLine:SetHeight(1)
    w.topLine:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    w.topLine:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    local BG = { panel = C.bg, dialog = C.bgSettings, card = C.cardBg, popup = C.popup, item = C.itemBg }

    function w:Skin()
        local t = theme()
        local style = UI.WindowStyle(kind)
        self.style = style
        local token = BG[kind]
        -- The guide window's background: the opacity setting (SetBgAlpha) instead of the
        -- token's alpha.
        local alpha = self.alpha
        local mul = alpha and alpha / math.max(token[4] or 1, 0.001) or nil
        local feather = style == "feather"
        local filled = style == "panel" or (style == "bands" and kind ~= "panel")
        self.feather:SetShown(feather)
        self.fill:SetShown(filled)
        if feather then self.feather:SetColor(token, mul) end
        if filled then self.fill:SetColor(token, mul) end
        local bordered = style == "panel" and (t.flags.windowBorder or kind == "item" or kind == "popup")
        self.border:SetShown(bordered)
        local edge = kind == "item" and C.strong or C.border
        if bordered then self.border:SetColor(edge, alpha and math.min(1, alpha / 0.5) or 1) end
        local shadowed = style == "panel" or (kind == "card" and style ~= "bands" and style ~= "feather")
        self.shadow:SetShown(shadowed)
        if shadowed then self.shadow:SetColor(C.shadow, alpha or 1) end
        local line = kind == "card" and (C.cardLine[4] or 0) > 0
        self.topLine:SetShown(line)
        if line then UI.Fill(self.topLine, C.cardLine) end
    end

    function w:SetBgAlpha(alpha)
        self.alpha = alpha
        self:Skin()
    end
    UI.Skin(w, w.Skin)
    w:Skin()
    return w
end

-- 1-unit separator line between two points of a frame, at vertical offset y.
function UI.Divider(frame, y, color, left, right)
    local t = frame:CreateTexture(nil, "ARTWORK")
    UI.Fill(t, color or C.divider)
    t:SetHeight(1)
    t:SetPoint("TOPLEFT", frame, "TOPLEFT", left or 1, y)
    t:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -(right or 1), y)
    return t
end

-- The line under a title bar or a step bar, by the theme: a gold line fading at both ends
-- (feather), a plain line (panel), none (bands: the bars are bands).
function UI.Separator(frame, y, left, right)
    local t = frame:CreateTexture(nil, "ARTWORK")
    t:SetHeight(1)
    t:SetPoint("TOPLEFT", frame, "TOPLEFT", left or 1, y)
    t:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -(right or 1), y)
    local function skin(self)
        local style = theme().flags.windowStyle
        self.style = style
        if style == "feather" then
            self:SetTexture(UI.TEX .. "line_fade")
            UI.Tint(self, C.line)
        else
            UI.Fill(self, C.line)
        end
        self:SetAlpha(style == "bands" and 0 or 1)
    end
    UI.Skin(t, skin)
    skin(t)
    return t
end

-- A dialog's title bar and tab strip backgrounds (Ardoise: a darker title bar; Bandes: an
-- accent gradient under the title, a light tab strip); transparent in the other themes.
function UI.DialogBars(frame, titleHeight, tabsHeight)
    local function bar(y, height, token)
        local holder = CreateFrame("Frame", nil, frame)
        holder:SetHeight(height)
        holder:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, y)
        holder:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, y)
        holder.bg = UI.Shape(frame, "window", token, "BACKGROUND", -5):Place(holder)
        return holder
    end
    frame.titleBar = bar(0, titleHeight, C.bgTitlebar)
    if tabsHeight then frame.tabsBar = bar(-(titleHeight + 1), tabsHeight, C.bgTabs) end
end

-- Gamepad focus. Inside (list rows): accent fill and a ring along the inner edge (the theme's:
-- 2 units, 1.5 in Ardoise); Ardoise adds a chevron 9 left of the element. Outside (an isolated
-- field): the ring 2 units outside the field, then a 3-unit halo (Ding dark only).
function UI.Focus(frame, outside)
    local f = {
        fill = UI.Shape(frame, "row", C.accentBg, "BACKGROUND", 2):Place(frame),
        ring = UI.Shape(frame, "ring", C.accent, "OVERLAY", 6):Place(frame, outside and 2 or 0),
    }
    if outside then f.halo = UI.Shape(frame, "halo", C.accentHalo, "BACKGROUND", -6):Place(frame, 5) end
    f.chevron = frame:CreateTexture(nil, "OVERLAY", nil, 7)
    f.chevron:SetTexture(UI.TEX .. "chevron_focus")
    f.chevron:SetSize(7, 16)
    f.chevron:SetPoint("LEFT", frame, "LEFT", -9 - (outside and 2 or 0), 0)
    UI.Tint(f.chevron, C.accent)
    function f:SetShown(shown)
        self.shown = shown and true or false
        self.fill:SetShown(shown)
        self.ring:SetShown(shown)
        if self.halo then self.halo:SetShown(shown) end
        self.chevron:SetShown(shown and theme().flags.focusChevron and true or false)
    end
    function f:IsShown() return self.shown == true end
    UI.Skin(f, function(self) self:SetShown(self.shown) end)
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
    UI.Tint(t, color or C.text)
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
    b.look = UI.Window(b, "dialog")
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
-- a disc. The theme picks the shapes (tex.chipDisc, tex.chipPill: Forever's light embossed
-- chips, outlined rings, or Ding dark's discs). Ding.Gamepad:Glyph(key) says what to draw.
-- style: { height = 14, font = 9, bg = token, text = token, border = token or nil }
---------------------------------------------------------------------------
local GLYPH = { height = 14, font = 9, bg = C.chipBg, text = C.chipText }
UI.GLYPH = GLYPH

function UI.Glyph(parent, style)
    style = style or GLYPH
    local g = CreateFrame("Frame", nil, parent)
    g.style = style
    g:SetSize(style.height, style.height)
    local pill = theme().tex.chipPill
    local spec = UI.SLICES[pill]
    g.pill = UI.Slice(g, pill, spec[1], spec[2], "BACKGROUND"):Place(g)
    g.pill:SetColor(style.bg)
    g.circle = UI.Icon(g, theme().tex.chipDisc, style.height, style.bg, "BACKGROUND")
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
                text = UI.Text(g, "bold", style.font, style.text, "OVERLAY", "chip"),
                tex = g:CreateTexture(nil, "OVERLAY"),
            }
            g.parts[i] = p
        end
        return p
    end

    -- glyph = { face = bool, parts = { { text = "LB" } | { caret = "LEFT" } | { tex = file } } }
    -- (a part with space = true is followed by a wider gap).
    function g:SetGlyph(glyph, color)
        local textColor = color or self.textColor or self.style.text
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
                UI.Color(p.text, textColor)
                p.text:SetPoint("LEFT", self, "LEFT", x, 0)
                p.text:Show()
            else
                p.text:Hide()
                p.tex:SetTexture(UI.TEX .. (item.caret and "caret_up" or item.tex))
                p.tex:SetRotation(item.caret and CARET[item.caret] or 0)
                UI.Tint(p.tex, textColor)
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

    -- Plate and letter colors (tokens), kept through theme changes.
    function g:SetColors(bg, text)
        self.bgColor, self.textColor = bg, text
        UI.Tint(self.circle, bg)
        self.pill:SetColor(bg)
        if self.glyph then self:SetGlyph(self.glyph, text) end
    end

    -- Shortcut: the glyph of a binding key ("SHIFT-PADDRIGHT"), of a list of buttons, or text.
    function g:SetKey(key)
        self:SetGlyph(Ding.Gamepad:Glyph(key))
    end

    UI.Skin(g, function(self, t)
        local file = t.tex.chipPill
        self.pill:SetFile(file)
        self.circle:SetTexture(UI.TEX .. t.tex.chipDisc)
    end)
    return g
end

---------------------------------------------------------------------------
-- Gamepad buttons on a push button, before its label: "(A) Import", "(B) Cancel". With a
-- gamepad, a button carries the buttons that press it and no hint repeats it (Yendi: the same
-- action shown twice, once as a hint, once as a button).
---------------------------------------------------------------------------
local measure

-- Width the chips of `keys` take before a label, the gap to the label included.
function UI.KeysWidth(keys)
    if not keys or #keys == 0 then return 0 end
    measure = measure or UI.Glyph(UIParent)
    measure:Hide()
    local width = 6 + 3 * (#keys - 1)
    for _, key in ipairs(keys) do
        measure:SetKey(key)
        width = width + measure:GetWidth()
    end
    return width
end

-- Chips of `keys` ({} or nil: none) before `b.text`, chips and label centered together in
-- `b`; on an accent button (`accent`), the chips take the label's dark color. Returns the
-- width of the chips (UI.KeysWidth).
function UI.ButtonKeys(b, keys, accent)
    b.keyGlyphs = b.keyGlyphs or {}
    local count = keys and #keys or 0
    local anchor, gap = b.text, 6
    for i = count, 1, -1 do
        local g = b.keyGlyphs[i]
        if not g then
            g = UI.Glyph(b)
            b.keyGlyphs[i] = g
        end
        g:SetKey(keys[i])
        g.padKey = keys[i]
        g:SetColors(accent and C.glyphOnAccent or C.chipBg, accent and C.onAccent or C.chipText)
        g:ClearAllPoints()
        g:SetPoint("RIGHT", anchor, "LEFT", -gap, 0)
        g:Show()
        anchor, gap = g, 3
    end
    for i = count + 1, #b.keyGlyphs do b.keyGlyphs[i]:Hide() end
    local width = UI.KeysWidth(keys)
    b.text:ClearAllPoints()
    b.text:SetPoint("CENTER", b, "CENTER", math.floor(width / 2 + 0.5), 0)
    return width
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
        UI.SetFont(self.label, focused and "medium" or "regular", 12)
    end
    function row:Hints() return {} end
    function row:Tooltip()
        local desc = self.opts.desc
        return self.opts.label, type(desc) == "function" and desc() or desc
    end
    return row
end
UI.BaseRow = baseRow

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
        local block = 16 + 2 + 14     -- line heights of 12 and 11 (UI.Wrap)
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
UI.AGlyph = aGlyph

-- opts: label, desc, get(), set(value)
function UI.CheckRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, opts.desc and SIZE.row2 or SIZE.row, width)
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
    -- A is on the row (its corner chip): the footer does not repeat it.
    function row:Hints() return {} end
    row:Refresh()
    return row
end

-- Slider block of the Appearance tab. opts: label, min, max, step, default (a number, or a
-- function: the theme's opacity), get(), set(v, dragging) (dragging: the mouse still moves the
-- thumb; a last set(v) comes when it lets go), format(v) -> text, help (bottom center,
-- optional), reset() (Y, instead of set(default))
local SLIDER = { top = 6, track = 16 + 6, under = 16 + 4, bottom = 14 + 6 }    -- [8, 24, 24, 22]
local SLIDER_HEIGHT = SLIDER.top + SLIDER.track + SLIDER.under + SLIDER.bottom
function UI.SliderRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, SLIDER_HEIGHT, width)
    row.kind = "slider"
    UI.SetFont(row.label, "medium", 12)
    row.label:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -SLIDER.top)
    row.value = UI.Text(row, "semibold", 12, C.text)
    row.value:SetJustifyH("RIGHT")
    row.value:SetPoint("TOPRIGHT", row, "TOPRIGHT", -8, -SLIDER.top)

    local trackTop = SLIDER.top + SLIDER.track
    local underTop = trackTop + SLIDER.under
    local track = CreateFrame("Button", nil, row)
    track:SetHeight(16)
    track:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -trackTop)
    track:SetPoint("TOPRIGHT", row, "TOPRIGHT", -8, -trackTop)
    track:RegisterForClicks("LeftButtonDown")
    row.track = track
    local rail = CreateFrame("Frame", nil, track)
    rail:SetHeight(4)
    rail:SetPoint("LEFT", track, "LEFT", 0, 0)
    rail:SetPoint("RIGHT", track, "RIGHT", 0, 0)
    row.rail = UI.Shape(rail, "bar", C.sliderTrack, "ARTWORK"):Place(rail)
    row.fillFrame = CreateFrame("Frame", nil, track)
    row.fillFrame:SetHeight(4)
    row.fillFrame:SetPoint("LEFT", track, "LEFT", 0, 0)
    row.fill = UI.Shape(row.fillFrame, "bar", C.accent, "ARTWORK", 1):Place(row.fillFrame)
    row.thumbShadow = UI.Icon(track, "circle", 16, C.textShadow, "OVERLAY", 1)
    row.thumb = UI.Icon(track, "circle", 14, C.thumb, "OVERLAY", 2)

    row.minText = UI.Text(row, "regular", 11, C.secondary)
    row.minText:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -underTop)
    row.maxText = UI.Text(row, "regular", 11, C.secondary)
    row.maxText:SetJustifyH("RIGHT")
    row.maxText:SetPoint("TOPRIGHT", row, "TOPRIGHT", -8, -underTop)
    row.minText:SetText(opts.format(opts.min))
    row.maxText:SetText(opts.format(opts.max))
    if opts.help then
        -- "D-pad ◂ ▸ · 5 % steps": the carets are textures, the font has no such glyphs.
        local help = CreateFrame("Frame", nil, row)
        help:SetHeight(14)
        help:SetPoint("TOP", row, "TOP", 0, -underTop)
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
        opts.set(snap(v), track.dragging)
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
    track:SetScript("OnMouseUp", function(self)
        if not self.dragging then return end
        self.dragging = false
        setValue(opts.get())
    end)
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
        UI.SetFont(self.label, "medium", 12)
        UI.Color(self.value, focused and C.accent or C.text)
    end
    function row:Left() setValue(opts.get() - opts.step) end
    function row:Right() setValue(opts.get() + opts.step) end
    function row:Reset()
        if opts.reset then
            opts.reset()
            self:Refresh()
            return
        end
        setValue(type(opts.default) == "function" and opts.default() or opts.default)
    end
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
    local row = baseRow(parent, owner, opts, opts.desc and SIZE.row2 or SIZE.row, width)
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
        UI.Tint(left, c)
        UI.Tint(right, c)
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
    local row = baseRow(parent, owner, opts, opts.desc and SIZE.row2 or SIZE.row, width)
    row.kind = "button"
    local b = CreateFrame("Frame", nil, row)
    b:SetHeight(22)     -- [24], in a row of SIZE.row
    b.bg = UI.Shape(b, "row", C.control, "ARTWORK"):Place(b)
    b.text = UI.Text(b, "medium", 12, C.text, "OVERLAY")
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    row.button = b
    -- With a gamepad, the focused row's button carries A (the footer does not repeat it); every
    -- button keeps room for it, so that it does not grow with the focus. A confirmation names
    -- the button in its text ("Confirm? (A)").
    local function setButton(text, color)
        b.text:SetText(text)
        UI.Color(b.text, color or C.text)
        local pad = Ding.Gamepad:Active() and not row.confirming
        UI.ButtonKeys(b, pad and row.focused and { "PAD1" } or nil)
        b:SetWidth(math.max(72, b.text:GetStringWidth() + 24 + (pad and UI.KeysWidth({ "PAD1" }) or 0)))
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
    local refresh, setFocused = row.Refresh, row.SetFocused
    function row:Refresh()
        refresh(self)
        if not self.confirming then setButton(opts.button) end
    end
    function row:SetFocused(focused)
        setFocused(self, focused)
        if not self.confirming then setButton(opts.button) end
    end
    -- A is on the button, or in its text while it asks to confirm.
    function row:Hints() return {} end
    return row
end

-- A long list on a page of its own: the row says how much is on (value()), A or a click
-- opens the page (open()). opts: label, desc, value() -> text, open()
function UI.PageRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, opts.desc and SIZE.row2 or SIZE.row, width)
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
        UI.Tint(caret, focused and C.accent or C.secondary)
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
    local row = baseRow(parent, owner, opts, SIZE.fold, width)
    row.kind = "fold"
    UI.Color(row.label, C.secondary)
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
-- back. Not focusable: B, Esc or a right click go back too. With a gamepad, the B chip sits
-- between the caret and the name (ShowKey): the footer does not repeat it.
function UI.PageTitleRow(parent, text, width, back)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(width, SIZE.pageTitle)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row.caret = UI.Caret(row, "LEFT", 8, C.accent)
    row.caret:SetPoint("LEFT", row, "LEFT", 8, 0)
    row.key = UI.Glyph(row)
    row.key:SetPoint("LEFT", row.caret, "RIGHT", 8, 0)
    row.key:SetKey("PAD2")
    row.label = UI.Text(row, "semibold", 13, C.text)
    row.label:SetText(text)
    row:SetScript("OnClick", function() back() end)
    function row:ShowKey(shown)
        self.key:SetKey("PAD2")
        self.key:SetShown(shown)
        self.label:ClearAllPoints()
        if shown then
            self.label:SetPoint("LEFT", self.key, "RIGHT", 6, 0)
        else
            self.label:SetPoint("LEFT", self.caret, "RIGHT", 8, 0)
        end
    end
    row:ShowKey(false)
    function row:Refresh() end
    return row
end

-- A Ding key binding (DING_NEXT...): A waits for a button, Y clears it.
function UI.BindingRow(parent, owner, opts, width)
    local row = baseRow(parent, owner, opts, SIZE.row, width)
    row.kind = "binding"
    placeLabel(row, 8, 180)
    row.chip = UI.Glyph(row, { height = 18, font = 10, bg = C.chipBg, text = C.chipText })
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
            UI.Color(self.status, color or C.disabled)
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
-- Dropdown (Guide tab): a 28-high field showing the choice; A opens the list below it.
-- opts: items() -> { { value, text, detail, dim, current } }, get(), set(value), empty
-- While the list is open, owner.dropdown is the list and owner routes keys to
-- list:OnKey(key) (true when handled).
---------------------------------------------------------------------------
local DROPDOWN = { boxHeight = 28, itemHeight = 24, gap = 2, visible = 8, pad = 4 }     -- [32, 28]
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
    list.look = UI.Window(list, "popup")
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
                    UI.SetFont(item.text, "semibold", 11)
                    UI.Color(item.text, C.secondary)
                else
                    item.text:SetPoint("LEFT", item, "LEFT", 8 + 12 + 8, 0)
                    UI.SetFont(item.text, focused and "medium" or "regular", 12)
                    UI.Color(item.text, entry.dim and C.disabled or C.text)
                end
                item.detail:SetText(entry.detail or "")
                UI.Color(item.detail, entry.dim and C.disabled or C.secondary)
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

-- Header of a block of rows ("Quests", "Merchant"): small, a little space above; the theme's
-- color and font (Ardoise: the game's font in the accent).
function UI.HeaderRow(parent, text, width)
    local row = CreateFrame("Frame", nil, parent)
    row:SetSize(width, SIZE.header)
    row.label = UI.Text(row, "semibold", 11, C.blockHeader)
    UI.SetTitleFont(row.label, "block")
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

---------------------------------------------------------------------------
-- Hover card: Ding's own tooltip frame for the guide window's rows (never the game's tooltip
-- restyled). 220 wide, padding 8 / 10, 3 between lines: the title 12 SemiBold, the lines 11
-- Regular in `cardText`, a click's line in the accent. Placed 10 to the right of the window,
-- its top on the row's (on the left when the screen has no room). Read like GameTooltip:
-- `text` (the title), `lines` (plain strings), IsShown, GetOwner.
---------------------------------------------------------------------------
local CARD = { width = 220, padX = 10, padY = 8, gap = 3, side = 10 }
UI.CARD = CARD
local Card = { lines = {}, text = nil }
UI.Card = Card

local function cardFrame()
    if Card.frame then return Card.frame end
    local f = CreateFrame("Frame", "DingCardFrame", UIParent)
    f:SetFrameStrata("TOOLTIP")
    f:SetClampedToScreen(true)
    f:EnableMouse(false)
    f:SetWidth(CARD.width)
    f.look = UI.Window(f, "card")
    f.title = UI.Text(f, "semibold", 12, C.text, "ARTWORK", "card")
    UI.Wrap(f.title, 12)
    f.title:SetPoint("TOPLEFT", f, "TOPLEFT", CARD.padX, -CARD.padY)
    f.title:SetWidth(CARD.width - 2 * CARD.padX)
    f.texts = {}
    f:Hide()
    Card.frame = f
    return f
end

-- Roles of a line: nil (cardText), "accent" (a click, a "Why?"), "done", "text", "dim".
local CARD_COLORS = { accent = "accent", done = "done", text = "text", dim = "muted" }

function Card:SetOwner(owner, window)
    self.owner, self.window = owner, window or owner
    self.text, self.lines, self.roles = nil, {}, {}
end

function Card:GetOwner() return self.shown and self.owner or nil end
function Card:IsShown() return self.shown == true end
function Card:NumLines() return #self.lines + (self.text and 1 or 0) end

function Card:SetText(text)
    self.text = UI.StripColors(tostring(text or ""))
end

function Card:AddLine(text, role)
    self.lines[#self.lines + 1] = tostring(text or "")
    self.roles[#self.lines] = role or false
end

-- Lays the card out and places it next to its window.
function Card:Show()
    local f = cardFrame()
    local width = CARD.width - 2 * CARD.padX
    f.title:SetText(self.text or "")
    local y = CARD.padY + f.title:GetStringHeight()
    for i, line in ipairs(self.lines) do
        local fs = f.texts[i]
        if not fs then
            fs = UI.Text(f, "regular", 11, C.cardText, "ARTWORK", "card")
            UI.Wrap(fs, 11)
            fs:SetWidth(width)
            f.texts[i] = fs
        end
        local role = self.roles[i]
        UI.Color(fs, role and C[CARD_COLORS[role]] or C.cardText)
        fs:SetText(line)
        fs:ClearAllPoints()
        fs:SetPoint("TOPLEFT", f, "TOPLEFT", CARD.padX, -(y + CARD.gap))
        fs:Show()
        -- A blank line keeps its room, like the game's tooltip.
        y = y + CARD.gap + math.max(fs:GetStringHeight(), line:match("^%s*$") and 6 or 0)
    end
    for i = #self.lines + 1, #f.texts do f.texts[i]:Hide() end
    f:SetHeight(y + CARD.padY)
    -- Next to the window, its top on the owner's; the window's scale.
    local owner, window = self.owner, self.window
    local scale = (owner.GetEffectiveScale and owner:GetEffectiveScale() or 1) / UIParent:GetEffectiveScale()
    f:SetScale(scale)
    f:ClearAllPoints()
    local right = window.GetRight and window:GetRight()
    local ownerRight = owner.GetRight and owner:GetRight()
    local room = right and GetScreenWidth and (right + CARD.side + CARD.width) * scale <= GetScreenWidth()
    if right and ownerRight and room ~= false then
        f:SetPoint("TOPLEFT", owner, "TOPRIGHT", CARD.side + (right - ownerRight), 0)
    elseif right and ownerRight then
        local left, ownerLeft = window:GetLeft(), owner:GetLeft()
        f:SetPoint("TOPRIGHT", owner, "TOPLEFT", -(CARD.side + (ownerLeft - left)), 0)
    else
        f:SetPoint("TOPLEFT", owner, "TOPRIGHT", CARD.side, 0)
    end
    f:Show()
    self.shown = true
end

function Card:Hide()
    self.shown = false
    if self.frame then self.frame:Hide() end
end
