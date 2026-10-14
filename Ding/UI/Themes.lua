-- Themes (docs/UI-themes.md): the look of Ding's interface, picked in Settings > Appearance
-- with a live preview. A theme changes only the look (colors, alphas, textures, font flags, a
-- few decorations), never a size nor a position: the layout (UI.SIZE, the windows' own
-- constants) is shared by every theme, so there is one code path.
--
-- UI.C holds one table per color token ({ r, g, b, a } in 0-1, or 8 numbers for a horizontal
-- gradient: left then right). The tables never change identity: UI.Theme.Apply copies the
-- theme's values into them, so a module may keep `local C = UI.C` and token references
-- (C.accent) at load. What was already painted is painted again: the paints recorded by
-- UI.Color / UI.Tint / UI.Fill / Slice:SetColor (UI/Widgets.lua), then every registered skin
-- (UI.Skin), then the guide window's layout (wrapping changes with the title font).
local _, Ding = ...
local L = Ding.L

local UI = Ding.UI or {}
Ding.UI = UI

-- "#RRGGBB" or "#RRGGBBAA" (the handoff's notation) as 0-1 values.
local function hex(s)
    s = s:gsub("^#", "")
    local function byte(i) return tonumber(s:sub(i, i + 1), 16) / 255 end
    return { byte(1), byte(3), byte(5), #s >= 8 and byte(7) or 1 }
end
-- Horizontal gradient: left color, then right color (UI.Paint, Slice:SetColor).
local function grad(a, b) return { a[1], a[2], a[3], a[4], b[1], b[2], b[3], b[4] } end
local NONE = { 0, 0, 0, 0 }

---------------------------------------------------------------------------
-- The four themes. Keys are the previous handoff's (dingdark: its values, unchanged) plus
-- the theme handoff's; every theme has every key (themes_test).
---------------------------------------------------------------------------
-- Ding dark: the look before themes (docs/UI-handoff.md), tokens unchanged.
local DD = {
    bg = { 0.086, 0.094, 0.110, 1 },
    bgSettings = { 0.086, 0.094, 0.110, 1 },
    bgTitlebar = NONE, bgTabs = NONE, panelTitlebar = NONE, panelStepbar = NONE,
    control = { 0.133, 0.145, 0.169, 1 },
    popup = { 0.133, 0.145, 0.169, 1 },
    itemBg = { 0.086, 0.094, 0.110, 0.85 },
    border = { 1, 1, 1, 0.078 },
    divider = { 1, 1, 1, 0.059 },
    tabLine = { 1, 1, 1, 0.078 },
    line = { 1, 1, 1, 0.059 },
    lineShadow = NONE, cardLine = NONE,
    subtle = { 1, 1, 1, 0.039 },
    hover = { 1, 1, 1, 0.078 },
    strong = { 1, 1, 1, 0.149 },
    text = { 0.910, 0.918, 0.929, 1 },
    secondary = { 0.639, 0.663, 0.702, 1 },
    subText = { 0.639, 0.663, 0.702, 1 },
    muted = { 0.490, 0.514, 0.549, 1 },
    disabled = { 0.373, 0.396, 0.431, 1 },
    accent = { 0.357, 0.706, 1, 1 },
    accentBg = { 0.357, 0.706, 1, 0.122 },
    accentHalo = { 0.357, 0.706, 1, 0.2 },
    onAccent = { 0.043, 0.047, 0.055, 1 },
    -- A gamepad chip on an accent button: a dark disc under a letter in the label's color.
    glyphOnAccent = { 0.043, 0.047, 0.055, 0.2 },
    done = { 0.298, 0.765, 0.541, 1 },
    doneIconBg = { 0.298, 0.765, 0.541, 0.2 },
    doneRowBg = { 0.298, 0.765, 0.541, 0.122 },
    todo = { 0.898, 0.404, 0.420, 1 },
    todoIconBg = { 0.898, 0.404, 0.420, 0.18 },
    todoRowBg = { 0.898, 0.282, 0.302, 0.122 },
    todoBorder = { 0.898, 0.404, 0.420, 0.5 },
    -- A quest above the player's level (quest.above): shown, never held back.
    above = hex("#FF9A3C"),
    -- A step the player left by hand: marked done (violet) or skipped (amber).
    manual = { 0.655, 0.545, 0.980, 1 },
    manualIconBg = { 0.655, 0.545, 0.980, 0.2 },
    manualRowBg = { 0.655, 0.545, 0.980, 0.122 },
    skipped = { 0.910, 0.773, 0.278, 1 },
    skippedIconBg = { 0.910, 0.773, 0.278, 0.2 },
    skippedRowBg = { 0.910, 0.773, 0.278, 0.122 },
    impossibleIconBg = { 1, 1, 1, 0.059 },
    otherIconBg = { 1, 1, 1, 0.059 },
    previewIconBg = { 1, 1, 1, 0.059 },
    previewGlyph = { 0.373, 0.396, 0.431, 1 },
    extraIconBg = { 0.357, 0.706, 1, 0.122 },
    extraGlyph = { 0.357, 0.706, 1, 1 },
    infoRowBg = NONE,
    cooldown = { 0, 0, 0, 0.65 },
    shadow = { 0, 0, 0, 0.35 },
    textShadow = { 0, 0, 0, 0.8 },
    quest = { 0.357, 0.706, 1, 1 },
    link = { 0.357, 0.706, 1, 1 },
    cardBg = { 0.086, 0.094, 0.110, 1 },
    cardText = { 0.8, 0.8, 0.8, 1 },
    themeCardBg = { 1, 1, 1, 0.039 },
    noticeBg = { 1, 1, 1, 0.039 },
    arrowSub = { 0.788, 0.804, 0.827, 1 },
    arrowBack = { 0.898, 0.404, 0.420, 1 },
    arrowTint = { 0.357, 0.706, 1, 1 },
    arrowBackTint = { 0.898, 0.404, 0.420, 1 },
    labelPlate = NONE, arrivedBg = NONE,
    chipBg = { 1, 1, 1, 0.122 },
    chipText = { 0.788, 0.804, 0.827, 1 },
    itemChipBg = { 0.133, 0.145, 0.169, 1 },
    itemChipText = { 0.910, 0.918, 0.929, 1 },
    itemChipBorder = { 1, 1, 1, 0.149 },
    track = { 1, 1, 1, 0.078 },
    trackEdge = NONE,
    sliderTrack = { 1, 1, 1, 0.122 },
    thumb = { 0.910, 0.918, 0.929, 1 },
    tabActive = { 0.910, 0.918, 0.929, 1 },
    tabActiveBg = NONE,
    blockHeader = { 0.639, 0.663, 0.702, 1 },
}

-- 1a Halo: no frame, a feathered veil under the text, the game's gold.
local HALO = {
    bg = hex("#080604"), bgSettings = hex("#080604E6"),
    bgTitlebar = NONE, bgTabs = NONE, panelTitlebar = NONE, panelStepbar = NONE,
    control = hex("#FFFFFF12"), popup = hex("#120E0AF7"), itemBg = hex("#080604D9"),
    border = hex("#FFFFFF14"), divider = hex("#FFFFFF1F"), tabLine = hex("#FFFFFF1F"),
    line = hex("#FFD10059"), lineShadow = NONE, cardLine = NONE,
    subtle = hex("#FFFFFF12"), hover = hex("#FFFFFF17"), strong = hex("#FFFFFF26"),
    text = hex("#F4EFE6"), secondary = hex("#C2B9A9"), subText = hex("#C2B9A9"),
    muted = hex("#8F8778"), disabled = hex("#6E675C"),
    accent = hex("#FFD100"), accentBg = hex("#FFD1001F"), accentHalo = NONE,
    onAccent = hex("#17130E"), glyphOnAccent = hex("#17130E33"),
    -- No row backgrounds (stateRowBg off): the state reads from the word, the glyph, the counter.
    done = hex("#5FD068"), doneIconBg = NONE, doneRowBg = NONE,
    todo = hex("#FFD100"), todoIconBg = NONE, todoRowBg = NONE, todoBorder = hex("#FFD10080"),
    above = hex("#FF9A3C"),
    -- Not in the handoff (later visual pass): violet and teal, apart from gold and green.
    manual = hex("#B49CFF"), manualIconBg = NONE, manualRowBg = NONE,
    skipped = hex("#5CC8D6"), skippedIconBg = NONE, skippedRowBg = NONE,
    impossibleIconBg = NONE, otherIconBg = NONE, previewIconBg = NONE,
    previewGlyph = hex("#6E675C"), extraIconBg = NONE, extraGlyph = hex("#C2B9A9"), infoRowBg = NONE,
    cooldown = hex("#000000A6"), shadow = hex("#00000059"), textShadow = hex("#000000E6"),
    quest = hex("#FFD100"), link = hex("#8CCBFF"),
    cardBg = hex("#080604E0"), cardText = hex("#E0D9CC"), themeCardBg = hex("#FFFFFF0F"),
    noticeBg = hex("#FFFFFF0F"),
    arrowSub = hex("#E0D9CC"), arrowBack = hex("#FFA35C"),
    -- The halo arrows carry their own colors: not tinted.
    arrowTint = { 1, 1, 1, 1 }, arrowBackTint = { 1, 1, 1, 1 },
    labelPlate = NONE, arrivedBg = NONE,
    chipBg = hex("#E2DCCD"), chipText = hex("#17130E"),
    itemChipBg = hex("#E2DCCD"), itemChipText = hex("#17130E"), itemChipBorder = NONE,
    track = hex("#FFFFFF24"), trackEdge = NONE, sliderTrack = hex("#FFFFFF29"), thumb = hex("#F4EFE6"),
    tabActive = hex("#FFD100"), tabActiveBg = NONE,
    blockHeader = hex("#C2B9A9"),
}

-- 1b Ardoise: a dark panel, gold hairlines, tinted rows, a focus chevron.
local GOLD_LINE = hex("#C6A05066")
local ARDOISE = {
    bg = hex("#0E0B08"), bgSettings = hex("#0E0B08F0"),
    bgTitlebar = hex("#00000047"), bgTabs = NONE, panelTitlebar = hex("#00000047"), panelStepbar = NONE,
    control = hex("#FFFFFF0F"), popup = hex("#16120DF7"), itemBg = hex("#0E0B08D9"),
    border = hex("#FFFFFF14"), divider = hex("#C6A0504D"), tabLine = hex("#C6A05040"),
    line = GOLD_LINE, lineShadow = NONE, cardLine = hex("#C6A05080"),
    subtle = hex("#FFFFFF0F"), hover = hex("#FFFFFF14"), strong = hex("#FFFFFF26"),
    text = hex("#F2EDE4"), secondary = hex("#B9AFA0"), subText = hex("#B9AFA0"),
    muted = hex("#8C8375"), disabled = hex("#6B6458"),
    accent = hex("#F5C842"), accentBg = hex("#F5C8421F"), accentHalo = NONE,
    onAccent = hex("#17130E"), glyphOnAccent = hex("#17130E33"),
    done = hex("#6FD36F"), doneIconBg = hex("#6FD36F38"), doneRowBg = hex("#6FD36F21"),
    -- Amber, not red.
    todo = hex("#FFB040"), todoIconBg = hex("#FFB0403D"), todoRowBg = hex("#FFB04033"), todoBorder = hex("#FFB04080"),
    above = hex("#FF9A3C"),
    manual = hex("#B49CFF"), manualIconBg = hex("#B49CFF38"), manualRowBg = hex("#B49CFF21"),
    skipped = hex("#5CC8D6"), skippedIconBg = hex("#5CC8D638"), skippedRowBg = hex("#5CC8D621"),
    impossibleIconBg = hex("#FFFFFF0D"), otherIconBg = hex("#FFFFFF12"), previewIconBg = hex("#FFFFFF0D"),
    previewGlyph = hex("#6B6458"), extraIconBg = hex("#FFFFFF12"), extraGlyph = hex("#F5C842"), infoRowBg = NONE,
    cooldown = hex("#000000A6"), shadow = hex("#00000059"), textShadow = hex("#00000099"),
    quest = hex("#F5C842"), link = hex("#8CCBFF"),
    cardBg = hex("#0E0B08F0"), cardText = hex("#DAD2C4"), themeCardBg = hex("#FFFFFF0D"),
    noticeBg = hex("#FFFFFF0D"),
    arrowSub = hex("#B9AFA0"), arrowBack = hex("#FFB040"),
    arrowTint = hex("#F2EDE4"), arrowBackTint = hex("#FFB040"),
    labelPlate = hex("#0E0B08B8"), arrivedBg = hex("#0E0B0880"),
    chipBg = hex("#E2DCCD"), chipText = hex("#17130E"),
    itemChipBg = hex("#E2DCCD"), itemChipText = hex("#17130E"), itemChipBorder = NONE,
    track = hex("#FFFFFF1F"), trackEdge = NONE, sliderTrack = hex("#FFFFFF24"), thumb = hex("#F2EDE4"),
    -- The active tab: an accent glow from the bottom (UI.Paint, vertical: bottom then top).
    tabActive = hex("#F2EDE4"),
    tabActiveBg = { 0.961, 0.784, 0.259, 0.14, 0.961, 0.784, 0.259, 0 },
    blockHeader = hex("#F5C842"),
}

-- 1c Bandes: no window, a band per line fading to the right, outlined text.
local BAND = grad(hex("#040609D1"), hex("#04060966"))
local BAND_INFO = grad(hex("#04060999"), hex("#0406093D"))
local BANDES = {
    bg = hex("#040609"), bgSettings = hex("#06080BE6"),
    bgTitlebar = grad(hex("#63C2FF24"), hex("#63C2FF00")), bgTabs = hex("#FFFFFF08"),
    panelTitlebar = BAND, panelStepbar = BAND,
    control = hex("#FFFFFF14"), popup = hex("#0A0D12F7"), itemBg = hex("#040609D9"),
    border = hex("#FFFFFF14"), divider = hex("#FFFFFF1A"), tabLine = NONE,
    line = hex("#FFFFFF66"), lineShadow = hex("#00000099"), cardLine = NONE,
    subtle = hex("#FFFFFF14"), hover = hex("#FFFFFF17"), strong = hex("#000000E6"),
    -- Sub-lines lighter than in the other themes: the outline darkens them.
    text = hex("#F5F7FA"), secondary = hex("#C3CAD3"), subText = hex("#D3D9E0"),
    muted = hex("#AEB6C1"), disabled = hex("#8E97A3"),
    accent = hex("#63C2FF"), accentBg = hex("#63C2FF29"), accentHalo = NONE,
    onAccent = hex("#0A1118"), glyphOnAccent = hex("#0A111833"),
    done = hex("#5ED38A"), doneIconBg = NONE, doneRowBg = grad(hex("#103822D1"), hex("#0406095C")),
    -- White on a blue band.
    todo = hex("#F5F7FA"), todoIconBg = NONE, todoRowBg = grad(hex("#12283EEB"), hex("#12283E8C")),
    todoBorder = hex("#F5F7FA80"),
    above = hex("#FF9A3C"),
    manual = hex("#B49CFF"), manualIconBg = NONE, manualRowBg = grad(hex("#2C2148D1"), hex("#0406095C")),
    skipped = hex("#E8C547"), skippedIconBg = NONE, skippedRowBg = grad(hex("#3A3010D1"), hex("#0406095C")),
    impossibleIconBg = NONE, otherIconBg = NONE, previewIconBg = NONE,
    previewGlyph = hex("#AEB6C1"), extraIconBg = NONE, extraGlyph = hex("#63C2FF"), infoRowBg = BAND_INFO,
    cooldown = hex("#000000A6"), shadow = hex("#00000066"), textShadow = hex("#000000CC"),
    -- The game's quest gold; links in the accent blue.
    quest = hex("#FFD100"), link = hex("#63C2FF"),
    cardBg = grad(hex("#040609F0"), hex("#040609D1")), cardText = hex("#D3D9E0"),
    themeCardBg = grad(hex("#FFFFFF12"), hex("#FFFFFF05")), noticeBg = BAND_INFO,
    arrowSub = hex("#D3D9E0"), arrowBack = hex("#FF8E5E"),
    arrowTint = hex("#63C2FF"), arrowBackTint = hex("#FF8E5E"),
    labelPlate = NONE, arrivedBg = NONE,
    -- Outlined chips: the ring and the letter in the text color.
    chipBg = hex("#F5F7FA"), chipText = hex("#F5F7FA"),
    itemChipBg = hex("#F5F7FA"), itemChipText = hex("#F5F7FA"), itemChipBorder = NONE,
    track = hex("#0000008C"), trackEdge = hex("#00000080"), sliderTrack = hex("#FFFFFF29"), thumb = hex("#F5F7FA"),
    tabActive = hex("#F5F7FA"), tabActiveBg = hex("#63C2FF2E"),
    blockHeader = hex("#C3CAD3"),
}

-- Flags: what a theme draws differently (UI.Window, UI.Focus, UI.Glyph, fonts, the panel).
--   windowStyle   "feather" | "panel" | "bands" (the guide window, the card; dialogs: panel
--                 for bands)
--   textShadow    { x, y } offset of a shadow on every text (C.textShadow), or nil
--   fontOutline   "OUTLINE" on the guide window's, the arrow's and the card's texts, or false
--   outlineBelow  opacity (0-100) under which the guide window's texts are outlined (halo)
--   titleFont     "game" (the client's own font, never shipped) | "noto"
--   blockHeaderFont  "game" | "noto": the settings' block headers
--   focusChevron, arrowLabelPlate, stateRowBg (tinted rows by state; bands for "bands")
UI.Themes = {
    halo = {
        id = "halo", name = L.THEME_HALO, desc = L.THEME_HALO_DESC, C = HALO, opacityDefault = 60,
        flags = { windowStyle = "feather", textShadow = { 0, -1 }, fontOutline = false, outlineBelow = 40,
            titleFont = "game", blockHeaderFont = "noto", focusChevron = false, arrowLabelPlate = false,
            stateRowBg = false },
        tex = { arrow = "arrow_halo_gold", arrowBack = "arrow_halo_back", arrived = "ring",
            arrivedCheck = "icon_check_large", chipDisc = "chip_disc_forever", chipPill = "chip_pill_forever",
            focusRing = "rr4_stroke2" },
        radius = { window = 0, row = 3, control = 3, icon = 3, card = 4, chip = 3 },
    },
    ardoise = {
        id = "ardoise", name = L.THEME_ARDOISE, desc = L.THEME_ARDOISE_DESC, C = ARDOISE, opacityDefault = 80,
        flags = { windowStyle = "panel", textShadow = { 0, -1 }, fontOutline = false, titleFont = "game",
            blockHeaderFont = "game", focusChevron = true, arrowLabelPlate = true, stateRowBg = true },
        tex = { arrow = "arrow_slate", arrowBack = "arrow_slate", arrived = "ring",
            arrivedCheck = "icon_check_large", chipDisc = "chip_disc_forever", chipPill = "chip_pill_forever",
            focusRing = "rr3_stroke15" },
        radius = { window = 3, row = 3, control = 3, icon = 3, card = 3, chip = 3 },
    },
    bandes = {
        id = "bandes", name = L.THEME_BANDES, desc = L.THEME_BANDES_DESC, C = BANDES, opacityDefault = 82,
        flags = { windowStyle = "bands", textShadow = nil, fontOutline = "OUTLINE", titleFont = "noto",
            blockHeaderFont = "noto", focusChevron = false, arrowLabelPlate = false, stateRowBg = true },
        tex = { arrow = "arrow_band", arrowBack = "arrow_band", arrived = "ring_outlined",
            arrivedCheck = "icon_check_large_outlined", chipDisc = "chip_ring", chipPill = "chip_pill_stroke",
            focusRing = "rr2_stroke2" },
        radius = { window = 2, row = 2, control = 2, icon = 2, card = 2, chip = 3 },
    },
    dingdark = {
        id = "dingdark", name = L.THEME_DINGDARK, desc = L.THEME_DINGDARK_DESC, C = DD, opacityDefault = 85,
        flags = { windowStyle = "panel", textShadow = nil, fontOutline = false, titleFont = "noto",
            blockHeaderFont = "noto", focusChevron = false, arrowLabelPlate = false, stateRowBg = true,
            windowBorder = true },
        tex = { arrow = "arrow", arrowBack = "arrow", arrived = "ring", arrivedCheck = "icon_check_large",
            chipDisc = "circle", chipPill = "rr3_fill", focusRing = "rr4_stroke2" },
        radius = { window = 6, row = 4, control = 4, icon = 3, card = 4, chip = 3 },
    },
}
UI.ThemeOrder = { "halo", "ardoise", "bandes", "dingdark" }

-- Slice margin and size of each texture a theme can name (UI.Slice).
UI.SLICES = {
    rr2_fill = { 2, 32 }, rr3_fill = { 3, 32 }, rr4_fill = { 4, 32 }, rr6_fill = { 6, 32 },
    rr6_stroke1 = { 6, 32 }, rr4_stroke1 = { 4, 32 }, rr4_stroke2 = { 4, 32 }, rr3_stroke15 = { 3, 32 },
    rr2_stroke2 = { 2, 32 }, focus_halo = { 7, 32 }, shadow = { 24, 64 }, soft_rect = { 24, 64 },
    chip_pill_forever = { 6, 32 }, chip_pill_stroke = { 6, 32 },
}

---------------------------------------------------------------------------
-- Tokens: one table per key, filled in place.
---------------------------------------------------------------------------
local Theme = { DEFAULT = "halo" }
UI.Theme = Theme

local C = {}
UI.C = C
UI.TOKENS = {}
for key in pairs(DD) do UI.TOKENS[#UI.TOKENS + 1] = key end
table.sort(UI.TOKENS)
for _, key in ipairs(UI.TOKENS) do C[key] = {} end

local function copyTokens(theme)
    for _, key in ipairs(UI.TOKENS) do
        local from, to = theme.C[key] or NONE, C[key]
        for i = 1, 8 do to[i] = from[i] end
    end
end

Theme.current = UI.Themes[Theme.DEFAULT]
copyTokens(Theme.current)

-- The theme saved in the settings (Ding.db.ui.theme), the default when unknown.
function Theme.Saved()
    local id = Ding.db and Ding.db.ui and Ding.db.ui.theme
    return UI.Themes[id] and id or Theme.DEFAULT
end

-- The theme on screen (a preview while the player picks one).
function Theme.Current() return Theme.current end

-- Background opacity of the guide window (0-1): Ding.db.panel.bgAlpha.
function Theme.Opacity()
    local panel = Ding.db and Ding.db.panel
    local v = tonumber(panel and panel.bgAlpha) or Theme.current.opacityDefault / 100
    return math.max(0, math.min(1, v))
end

-- The guide window's texts are outlined: the theme's outline, or, in halo, a background too
-- see-through to carry them (below flags.outlineBelow %): light scenes (snow, desert).
function Theme.SceneOutline()
    local flags = Theme.current.flags
    if flags.fontOutline then return flags.fontOutline end
    if flags.outlineBelow and Theme.Opacity() * 100 < flags.outlineBelow - 0.001 then return "OUTLINE" end
    return nil
end

-- Bands (windowStyle "bands") follow the opacity slider: their alpha x setting / default.
function Theme.BandScale()
    return Theme.Opacity() / (Theme.current.opacityDefault / 100)
end

local listeners = {}
-- fn(theme, preview) after every Apply (windows that lay out again, the arrow...).
function Theme.OnApply(fn) listeners[#listeners + 1] = fn end

-- Puts theme `id` on screen. preview: shown only (the theme picker), the saved theme stays;
-- otherwise saved in Ding.db.ui.theme. While the player never moved the opacity slider
-- (Ding.db.ui.opacityTouched), it follows the theme's default. Nothing is rebuilt: tokens,
-- fonts and textures change in place, then the guide window lays out again.
function Theme.Apply(id, preview)
    local theme = UI.Themes[id] or UI.Themes[Theme.DEFAULT]
    local db = Ding.db
    if db and db.ui then
        if not preview then db.ui.theme = theme.id end
        if not db.ui.opacityTouched then db.panel.bgAlpha = theme.opacityDefault / 100 end
    end
    Theme.current = theme
    Theme.previewing = preview and theme.id ~= Theme.Saved() or nil
    copyTokens(theme)
    if UI.RefreshFonts then UI.RefreshFonts() end
    if UI.Repaint then UI.Repaint(theme) end
    local P = Ding.Panel
    if P and P.Relayout then Ding:Safe(P.Relayout, P) end
    for _, fn in ipairs(listeners) do Ding:Safe(fn, theme, preview) end
    return theme
end

-- Back to the saved theme after a preview (leaving the picker without A).
function Theme.Restore()
    if Theme.current.id ~= Theme.Saved() or Theme.previewing then Theme.Apply(Theme.Saved(), true) end
    Theme.previewing = nil
end

-- The saved theme, as soon as the settings are loaded: the frames made at login take it.
Ding:On("ADDON_LOADED", function(_, name)
    if name ~= Ding.name or not Ding.db then return end
    Theme.current = UI.Themes[Theme.Saved()]
    copyTokens(Theme.current)
    if UI.RefreshFonts then UI.RefreshFonts() end
end)
