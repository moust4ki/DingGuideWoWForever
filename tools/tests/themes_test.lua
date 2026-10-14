-- Themes (docs/UI-themes.md, UI/Themes.lua): four themes with every token, applied and
-- previewed without rebuilding a frame, the picker in Settings > Appearance (gamepad and
-- mouse, live preview, A or a click saves, leaving puts the saved theme back, Y: Halo), the
-- opacity's default per theme, the window styles (feather, panel, bands), the chips, the fonts
-- (the game's font for titles, outlined texts), the hover card, the gradients on every client,
-- and no color of the old palette left in Ding/UI.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P, A, Cfg, UI, L = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.Config, Ding.UI, Ding.L
local C, Theme = UI.C, UI.Theme
local G = "nightelf-01-shadowglen"

local function start(theme)
    T.reset({ level = 1 })
    Ding.db.ui.opacityTouched = nil
    Theme.Apply(theme or "halo")
    E:SetGuide(G, 1, true)
    H.flush()
end

local function grid()
    for _, row in ipairs(Cfg:BuildTab(Cfg.TAB.appearance).rows) do
        if row.kind == "themes" then return row end
    end
end

local function openPicker()
    Cfg:Open("appearance", 1); H.flush()
    T.eq(Cfg.focus and Cfg.focus.kind, "themes", "the theme cards are not the tab's first element")
    return Cfg.focus
end

local function close(a, b) return math.abs(a - b) < 1e-6 end

---------------------------------------------------------------------------
-- The themes
---------------------------------------------------------------------------
T.test("four themes in order, Halo by default; every theme has every token, its flags, textures and radii", function()
    T.eq(table.concat(UI.ThemeOrder, ","), "halo,ardoise,bandes,dingdark")
    T.eq(Theme.DEFAULT, "halo")
    T.eq(Ding.DEFAULTS.ui.theme, "halo")
    T.ok(#UI.TOKENS >= 60, "too few tokens: " .. #UI.TOKENS)
    for _, id in ipairs(UI.ThemeOrder) do
        local theme = UI.Themes[id]
        T.eq(theme.id, id)
        T.ok(type(theme.name) == "string" and theme.name ~= "" and theme.name ~= "THEME_" .. id:upper(), id .. ": no name")
        T.ok(type(theme.desc) == "string" and theme.desc ~= "", id .. ": no description")
        for _, key in ipairs(UI.TOKENS) do
            local v = theme.C[key]
            T.ok(type(v) == "table" and (#v == 4 or #v == 8), ("%s: token %s missing or not 4 / 8 numbers"):format(id, key))
            for i = 1, #v do T.ok(type(v[i]) == "number" and v[i] >= 0 and v[i] <= 1, ("%s.%s[%d]"):format(id, key, i)) end
        end
        for key in pairs(theme.C) do
            T.ok(C[key] ~= nil, ("%s: token %s unknown to the other themes"):format(id, key))
        end
        local f = theme.flags
        T.ok(f.windowStyle == "feather" or f.windowStyle == "panel" or f.windowStyle == "bands", id .. ": windowStyle")
        T.ok(f.titleFont == "game" or f.titleFont == "noto", id .. ": titleFont")
        T.ok(f.fontOutline == false or f.fontOutline == "OUTLINE", id .. ": fontOutline")
        T.ok(type(f.stateRowBg) == "boolean" and type(f.focusChevron) == "boolean" and type(f.arrowLabelPlate) == "boolean",
            id .. ": flags")
        T.ok(theme.opacityDefault >= 0 and theme.opacityDefault <= 100 and theme.opacityDefault % 1 == 0, id .. ": opacity")
        for _, key in ipairs({ "arrow", "arrowBack", "arrived", "arrivedCheck", "chipDisc", "chipPill", "focusRing" }) do
            local file = io.open(tools .. "/../Ding/Media/Textures/" .. tostring(theme.tex[key]) .. ".tga", "rb")
            T.ok(file, ("%s: tex.%s = %s is not shipped"):format(id, key, tostring(theme.tex[key])))
            if file then file:close() end
        end
        for _, key in ipairs({ "chipPill", "focusRing" }) do
            T.ok(UI.SLICES[theme.tex[key]], ("%s: tex.%s has no slice margins"):format(id, key))
        end
        for _, key in ipairs({ "window", "row", "control", "icon", "card" }) do
            local r = theme.radius[key]
            T.ok(r == 0 and key == "window" or r == 2 or r == 3 or r == 4 or r == 6, ("%s: radius.%s = %s"):format(id, key, tostring(r)))
        end
    end
end)

T.test("the handoff's values: Halo 60 % gold feather, Ardoise 80 % panel, Bandes 82 % bands, Ding dark unchanged", function()
    local function hex(token) return UI.HexOf(token) end
    local halo, ardoise, bandes, dd = UI.Themes.halo, UI.Themes.ardoise, UI.Themes.bandes, UI.Themes.dingdark
    T.eq(halo.opacityDefault, 60)
    T.eq(ardoise.opacityDefault, 80)
    T.eq(bandes.opacityDefault, 82)
    T.eq(dd.opacityDefault, 85)
    T.eq(hex(halo.C.accent), "ffd100")
    T.eq(hex(halo.C.link), "8ccbff")
    T.eq(hex(halo.C.quest), "ffd100")
    T.eq(hex(ardoise.C.todo), "ffb040")
    T.eq(hex(bandes.C.accent), "63c2ff")
    T.eq(hex(bandes.C.quest), "ffd100")
    T.eq(#bandes.C.todoRowBg, 8, "Bandes: the to-do band is a gradient")
    -- No red in the Forever themes: to do is gold, amber, white.
    for _, id in ipairs({ "halo", "ardoise", "bandes" }) do
        local todo = UI.Themes[id].C.todo
        T.ok(not (todo[1] > 0.8 and todo[2] < 0.5 and todo[3] < 0.5), id .. ": a red to-do")
    end
    -- Ding dark: the first handoff's tokens.
    T.eq(hex(dd.C.accent), "5bb4ff")
    T.eq(hex(dd.C.bg), "16181c")
    T.eq(hex(dd.C.todo), "e5676b")
    T.eq(hex(dd.C.done), "4cc38a")
    T.eq(hex(dd.C.quest), hex(dd.C.accent))
    T.eq(halo.flags.windowStyle, "feather")
    T.eq(ardoise.flags.windowStyle, "panel")
    T.eq(bandes.flags.windowStyle, "bands")
    T.eq(dd.flags.windowStyle, "panel")
    T.ok(not halo.flags.stateRowBg and ardoise.flags.stateRowBg and bandes.flags.stateRowBg and dd.flags.stateRowBg,
        "rows tinted by state")
    T.ok(ardoise.flags.focusChevron and ardoise.flags.arrowLabelPlate, "Ardoise: chevron and plate")
    T.eq(bandes.flags.fontOutline, "OUTLINE")
    T.eq(halo.flags.titleFont, "game")
    T.eq(bandes.flags.titleFont, "noto")
end)

T.test("Apply: the tokens change in place, the theme is saved; preview shows without saving; Restore", function()
    start("halo")
    local accent = C.accent
    T.ok(close(C.accent[1], 1) and close(C.accent[2], 0xD1 / 255), "Halo's gold accent")
    Theme.Apply("ardoise", true)
    T.eq(C.accent, accent, "the token table was replaced: references kept by the modules break")
    T.eq(UI.HexOf(C.accent), "f5c842")
    T.eq(Theme.current.id, "ardoise")
    T.eq(Ding.db.ui.theme, "halo", "a preview saved")
    T.eq(Theme.Saved(), "halo")
    Theme.Restore()
    T.eq(Theme.current.id, "halo")
    T.eq(UI.HexOf(C.accent), "ffd100")
    Theme.Apply("bandes")
    T.eq(Ding.db.ui.theme, "bandes")
    T.eq(#C.todoRowBg, 8, "a gradient token keeps its second color")
    Theme.Apply("dingdark")
    T.eq(C.todoRowBg[5], nil, "a gradient's second color left over")
    Theme.Apply("nope")
    T.eq(Theme.current.id, "halo", "an unknown theme: Halo")
end)

T.test("nothing rebuilt: every theme applied and previewed creates no frame, texture nor text", function()
    start("halo")
    P:SetCompact(true); P:SetCompact(false)
    Cfg:Open("appearance", 1); H.flush()
    for _, id in ipairs(UI.ThemeOrder) do Theme.Apply(id, true) end
    Theme.Restore()
    local before = #H.widgets
    local panelFrame, rows = P.frame, P.frame.rows[1]
    for _ = 1, 2 do
        for _, id in ipairs(UI.ThemeOrder) do
            Theme.Apply(id, true)
            H.flush()
        end
    end
    Theme.Restore()
    T.eq(#H.widgets, before, "a theme change made new widgets")
    T.eq(P.frame, panelFrame)
    T.eq(P.frame.rows[1], rows)
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Window styles
---------------------------------------------------------------------------
T.test("feather (Halo): the veil 20 outside the window, no border nor shadow; 0 % hides it", function()
    start("halo")
    local look = P.frame.look
    T.ok(look.feather:IsShown() and not look.fill:IsShown(), "no feathered background")
    T.ok(not look.border:IsShown() and not look.shadow:IsShown(), "a border or a shadow")
    T.eq(look.feather.file, "soft_rect")
    T.eq(look.feather.outset, 20)
    T.ok(close(look.feather.color[4], 0.6), "not at 60 %: " .. tostring(look.feather.color[4]))
    T.eq(UI.HexOf(look.feather.color), "080604")
    -- The separators: gold lines fading at both ends.
    T.eq(P.frame.titleDivider.texture, UI.TEX .. "line_fade")
    P:SetBackgroundAlpha(0, true)
    T.eq(look.feather.color[4], 0, "still visible at 0 %")
end)

T.test("panel (Ardoise, Ding dark): rounded fill and shadow; a border only in Ding dark", function()
    start("ardoise")
    local look = P.frame.look
    T.ok(look.fill:IsShown() and not look.feather:IsShown(), "no panel")
    T.eq(look.fill.file, "rr3_fill")
    T.ok(not look.border:IsShown(), "Ardoise has no border")
    T.ok(look.shadow:IsShown(), "no shadow")
    T.ok(close(look.fill.color[4], 0.8), "not at 80 %")
    T.ok(P.frame.titleBand.bg:IsShown(), "no darker title bar")
    Theme.Apply("dingdark")
    T.eq(look.fill.file, "rr6_fill")
    T.ok(look.border:IsShown(), "Ding dark lost its border")
    T.ok(close(look.fill.color[4], 0.85), "not at 85 %")
    T.ok(not P.frame.titleBand.bg:IsShown(), "a title band in Ding dark")
end)

T.test("bands (Bandes): no window; the bars and the rows are bands fading to the right, following the opacity", function()
    start("bandes")
    local f = P.frame
    T.ok(not f.look.fill:IsShown() and not f.look.feather:IsShown(), "a window background")
    T.ok(f.titleBand.bg:IsShown() and f.stepBand.bg:IsShown(), "no band on the bars")
    T.ok(f.titleBand.bg.gradient, "the bar's band is not a gradient")
    T.eq(f.titleDivider:GetAlpha(), 0, "a separator between bands")
    local todo
    for i, row in ipairs(P.rowsShown) do
        if row.state == "todo" then todo = f.rows[i] end
    end
    T.ok(todo and todo.bg:IsShown() and todo.bg.gradient, "the to-do row has no band")
    local middle = todo.bg.parts[5]
    T.ok(middle.gradient and middle.gradient[1] == "HORIZONTAL", "no horizontal gradient")
    local alpha = todo.bg.color[4]
    T.ok(close(alpha, C.todoRowBg[4]), "the band's alpha at the default opacity")
    P:SetBackgroundAlpha(0.41, true)
    T.ok(close(todo.bg.color[4], C.todoRowBg[4] * 0.41 / 0.82), "the band does not follow the slider")
    P:SetBackgroundAlpha(0, true)
    T.eq(todo.bg.color[4], 0, "a band at 0 %")
    P:SetCompact(true)
    T.ok(f.mini.band:IsShown(), "the minimized window is not one band")
    P:SetCompact(false)
end)

T.test("section titles: a line above (Halo, Ardoise, Ding dark), on the right of the title in Bandes", function()
    start("halo")
    Ding.db.panel.preview = 2
    P:Update()
    local section
    for i, row in ipairs(P.rowsShown) do
        if row.state == "section" then section = P.frame.rows[i] end
    end
    T.ok(section, "no section title")
    T.ok(section.rule:IsShown() and not section.ruleRight:IsShown(), "Halo: the line above")
    Theme.Apply("bandes")
    T.ok(not section.rule:IsShown() and section.ruleRight:IsShown() and section.ruleShadow:IsShown(),
        "Bandes: the line on the right")
    T.eq(section.ruleRight.texture, UI.TEX .. "line_fade_right")
    Ding.db.panel.preview = 0
end)

T.test("rows by theme: Halo without backgrounds (gold glyph and counter), Ardoise tinted amber", function()
    start("halo")
    T.quests({ [456] = "log" })
    local todo
    for i, row in ipairs(P.rowsShown) do
        if row.state == "todo" then todo = P.frame.rows[i] end
    end
    T.ok(todo, "no row to do")
    T.ok(not todo.bg:IsShown(), "Halo: a row background")
    local glyph = todo.icon.tex:IsShown() and todo.icon.tex.vertexColor or todo.icon.letter.color
    T.eq(UI.HexOf(glyph), "ffd100", "Halo: the glyph is not gold")
    Theme.Apply("ardoise")
    T.ok(todo.bg:IsShown(), "Ardoise: no tint")
    T.eq(UI.HexOf(todo.bg.color), "ffb040")
    T.ok(close(todo.bg.color[4], 0.2), "Ardoise: the tint's alpha")
end)

---------------------------------------------------------------------------
-- Focus and chips
---------------------------------------------------------------------------
T.test("focus: the theme's ring (2, 1.5 with Ardoise's chevron, Bandes' square), no outer halo in Forever", function()
    start("halo")
    local holder = CreateFrame("Frame", nil, UIParent)
    local focus = UI.Focus(holder)
    focus:SetShown(true)
    T.eq(focus.ring.file, "rr4_stroke2")
    T.ok(not focus.chevron:IsShown(), "a chevron in Halo")
    Theme.Apply("ardoise")
    T.eq(focus.ring.file, "rr3_stroke15")
    T.ok(focus.chevron:IsShown(), "no chevron in Ardoise")
    T.eq(focus.chevron.texture, UI.TEX .. "chevron_focus")
    T.ok(focus.chevron.w == 7 and focus.chevron.h == 16, "chevron size")
    T.eq(focus.chevron.points[1][4], -9, "the chevron 9 left of the element")
    Theme.Apply("bandes")
    T.eq(focus.ring.file, "rr2_stroke2")
    T.ok(not focus.chevron:IsShown(), "a chevron in Bandes")
    focus:SetShown(false)
    T.ok(not focus.chevron:IsShown(), "the chevron stays without the focus")
    local outer = P.frame.finder.focus
    T.eq(outer.halo.color[4], 0, "an outer halo in Bandes")
    Theme.Apply("dingdark")
    T.ok(outer.halo.color[4] > 0, "Ding dark lost its outer halo")
end)

T.test("chips: Forever's light discs and pills (Halo, Ardoise), outlined rings (Bandes), Ding dark's", function()
    start("halo")
    local g = P.frame.lb
    g:SetKey("PADLSHOULDER")
    local face = UI.Glyph(UIParent)
    face:SetKey("PAD1")
    local function check(id, disc, pill, bg)
        Theme.Apply(id)
        T.eq(face.circle.texture, UI.TEX .. disc, id .. ": face button")
        T.eq(g.pill.file, pill, id .. ": shoulder button")
        T.eq(UI.HexOf(face.circle.vertexColor), bg, id .. ": chip color")
    end
    check("halo", "chip_disc_forever", "chip_pill_forever", "e2dccd")
    check("ardoise", "chip_disc_forever", "chip_pill_forever", "e2dccd")
    check("bandes", "chip_ring", "chip_pill_stroke", "f5f7fa")
    check("dingdark", "circle", "rr3_fill", "ffffff")
    -- Chips have no shadow nor outline (their own plate carries them).
    Theme.Apply("bandes")
    local font = face.parts[1].text.fontObject
    T.eq(select(3, font:GetFont()), "", "an outlined chip")
end)

---------------------------------------------------------------------------
-- Fonts
---------------------------------------------------------------------------
T.test("titles: the game's font in Halo and Ardoise (13, settings 14), Noto Sans SemiBold in Bandes and Ding dark", function()
    start("halo")
    local title = P.frame.title.fontObject
    T.eq(title:GetFont(), STANDARD_TEXT_FONT)
    T.eq(select(2, title:GetFont()), 13)
    Theme.Apply("bandes")
    T.ok(tostring(title:GetFont()):find("NotoSans%-SemiBold"), "Bandes: Noto Sans SemiBold")
    T.eq(select(2, title:GetFont()), 12)
    Theme.Apply("ardoise")
    T.eq(UI.TitleFont("settings"):GetFont(), STANDARD_TEXT_FONT)
    T.eq(select(2, UI.TitleFont("settings"):GetFont()), 14)
    T.eq(select(2, UI.TitleFont("block"):GetFont()), 12, "Ardoise: block headers in the game's font, 12")
    Theme.Apply("dingdark")
    T.eq(select(2, UI.TitleFont("arrow", "world"):GetFont()), 13)
end)

T.test("outline: Bandes outlines the guide window, the arrow and the card, never the settings", function()
    start("bandes")
    local function flags(font) return select(3, font:GetFont()) end
    T.eq(flags(P.frame.rows[1].text.fontObject), "OUTLINE", "guide window")
    T.eq(flags(A.frame.distance.fontObject), "OUTLINE", "arrow")
    T.eq(flags(UI.Font("regular", 11, "card")), "OUTLINE", "card")
    T.eq(flags(UI.Font("regular", 12)), "", "settings")
    Theme.Apply("halo")
    T.eq(flags(P.frame.rows[1].text.fontObject), "", "Halo at 60 %: no outline")
    T.eq(UI.Font("regular", 12, "scene").shadowOffset[2], -1, "Halo: a shadow under every text")
end)

T.test("Halo below 40 %: the guide window's texts get an outline (light scenes), back above", function()
    start("halo")
    local font = P.frame.rows[1].text.fontObject
    P:SetBackgroundAlpha(0.35, true)
    T.eq(select(3, font:GetFont()), "OUTLINE", "no outline at 35 %")
    T.eq(select(3, UI.Font("regular", 12):GetFont()), "", "the settings outlined too")
    P:SetBackgroundAlpha(0.40, true)
    T.eq(select(3, font:GetFont()), "", "an outline at 40 %")
    P:SetBackgroundAlpha(0.2, true)
    Theme.Apply("ardoise")
    T.eq(select(3, font:GetFont()), "", "Ardoise outlined at a low opacity")
end)

T.test("Korean and Chinese: the game's font everywhere already, titles included", function()
    local saved = Ding.locale
    Ding.locale = "koKR"
    Theme.Apply("bandes")
    UI.RefreshFonts()
    T.eq(UI.TitleFont("window", "scene"):GetFont(), STANDARD_TEXT_FONT)
    T.eq(UI.Font("regular", 12, "scene"):GetFont(), STANDARD_TEXT_FONT)
    Ding.locale = saved
    Theme.Apply("halo")
    UI.RefreshFonts()
end)

---------------------------------------------------------------------------
-- Opacity
---------------------------------------------------------------------------
T.test("opacity: the slider follows the theme's default until the player moves it", function()
    start("halo")
    T.eq(Ding.db.panel.bgAlpha, 0.6)
    Theme.Apply("ardoise")
    T.eq(Ding.db.panel.bgAlpha, 0.8, "not the new theme's default")
    Theme.Apply("bandes", true)
    T.eq(Ding.db.panel.bgAlpha, 0.82, "the preview not at its theme's default")
    Theme.Restore()
    T.eq(Ding.db.panel.bgAlpha, 0.8, "back to the saved theme's")
    Cfg:Open("appearance", 2); H.flush()
    T.eq(Cfg.focus.opts.label, L.BG_OPACITY)
    T.eq(Cfg.focus.value:GetText(), "80 %")
    H.press("PADDLEFT")
    T.ok(Ding.db.ui.opacityTouched, "moving the slider not remembered")
    Theme.Apply("halo")
    T.eq(Ding.db.panel.bgAlpha, 0.75, "a chosen opacity replaced by the theme's")
    H.press("PAD4")
    T.eq(Ding.db.panel.bgAlpha, 0.6, "Y: not the theme's default")
    T.ok(not Ding.db.ui.opacityTouched, "Y: the slider does not follow the theme again")
    Theme.Apply("dingdark")
    T.eq(Ding.db.panel.bgAlpha, 0.85)
    Cfg:Close(); H.flush()
end)

T.test("an install before themes: Halo for everyone, the old default opacity follows it, a chosen one stays", function()
    local function old(alpha)
        return { layout = 2, panel = { bgAlpha = alpha, scale = 1 }, arrow = { point = "CENTER", x = 0, y = 120 },
            ui = { theme = nil } }
    end
    local db = old(0.85)
    Ding.Migrate(db)
    T.eq(db.layout, 3)
    T.eq(db.ui.theme, "halo")
    T.eq(db.panel.bgAlpha, 0.6, "the old default kept")
    T.ok(not db.ui.opacityTouched, "the old default counted as chosen")
    db = old(0.5)
    Ding.Migrate(db)
    T.eq(db.panel.bgAlpha, 0.5, "a chosen opacity changed")
    T.ok(db.ui.opacityTouched, "a chosen opacity not remembered")
    db.panel.bgAlpha = 0.3
    Ding.Migrate(db)
    T.eq(db.panel.bgAlpha, 0.3, "migration replayed")
end)

---------------------------------------------------------------------------
-- The picker
---------------------------------------------------------------------------
T.test("picker (gamepad): four cards, the saved one \"Active\"; the D-pad previews live, A saves", function()
    start("halo")
    local row = openPicker()
    T.eq(#row.cards, 4)
    for i, id in ipairs(UI.ThemeOrder) do
        T.eq(row.cards[i].name:GetText(), UI.Themes[id].name)
        T.eq(row.cards[i].desc:GetText(), UI.Themes[id].desc)
    end
    T.eq(row.index, 1, "the focus not on the saved theme")
    T.ok(row.cards[1].active:IsShown() and not row.cards[2].active:IsShown(), "\"Active\" not on Halo")
    T.ok(not row.cards[1].key:IsShown(), "A on the active card")
    H.press("PADDRIGHT")
    T.eq(row.index, 2)
    T.eq(Theme.current.id, "ardoise", "no live preview")
    T.eq(Ding.db.ui.theme, "halo", "the preview saved")
    -- Live on the guide window, the arrow and this window.
    T.ok(P.frame.look.fill:IsShown() and not P.frame.look.feather:IsShown(), "the guide window does not follow")
    T.eq(A.frame.arrow.texture:match("arrow_%a+$") or A.frame.arrow.texture, A.state == "behind" and "arrow_slate" or "arrow_slate")
    T.ok(Cfg.frame.look.fill:IsShown(), "the settings window does not follow")
    T.ok(row.cards[2].key:IsShown(), "no A chip on the focused card")
    T.ok(row.cards[2].focus:IsShown() and not row.cards[1].focus:IsShown(), "focus not on the card")
    H.press("PAD1")
    T.eq(Ding.db.ui.theme, "ardoise", "A does not save")
    T.ok(row.cards[2].active:IsShown() and not row.cards[1].active:IsShown(), "\"Active\" did not move")
    T.ok(not row.cards[2].key:IsShown(), "A still on the active card")
    Cfg:Close(); H.flush()
    T.eq(Theme.current.id, "ardoise", "closing undid the saved theme")
end)

T.test("picker (gamepad): leaving the cards without A puts the saved theme back (up, down, LB / RB, B)", function()
    start("halo")
    for _, key in ipairs({ "PADDDOWN", "PADDUP", "PADRSHOULDER", "PADLSHOULDER", "PAD2" }) do
        openPicker()
        H.press("PADDRIGHT"); H.press("PADDRIGHT")
        T.eq(Theme.current.id, "bandes")
        H.press(key)
        T.eq(Theme.current.id, "halo", key .. " kept the preview")
        T.eq(Ding.db.ui.theme, "halo", key .. " saved the preview")
        Cfg:Close(); H.flush()
    end
    -- Closed in another way (Esc, the cross, a fight).
    openPicker()
    H.press("PADDRIGHT")
    Cfg:Close(); H.flush()
    T.eq(Theme.current.id, "halo", "closing kept the preview")
end)

T.test("picker: Y goes back to Halo; the footer says only that (A on the card, B and LB / RB on the window)", function()
    start("dingdark")
    local row = openPicker()
    T.eq(row.index, 4)
    local hints = Cfg.frame.help.list
    T.eq(#hints, 1)
    T.eq(hints[1].keys, "PAD4")
    T.eq(hints[1].label, L.HINT_THEME_DEFAULT)
    H.press("PAD4")
    T.eq(Ding.db.ui.theme, "halo")
    T.eq(Theme.current.id, "halo")
    T.eq(row.index, 1)
    T.ok(row.cards[1].active:IsShown(), "\"Active\" not on Halo")
    Cfg:Close(); H.flush()
end)

T.test("picker (mouse): hovering a card previews it, leaving it puts the saved one back, a click saves; no chips", function()
    start("halo")
    local getCVar = _G.GetCVar
    _G.GetCVar = function(name) if name == "GamePadEnable" then return "0" end return getCVar(name) end
    Cfg:Open("appearance", 3); H.flush()
    local row = grid()
    local card = row.cards[3]
    card.scripts.OnEnter(card)
    T.eq(Theme.current.id, "bandes", "hover: no preview")
    T.eq(Cfg.focus, row)
    for _, c in ipairs(row.cards) do T.ok(not c.key:IsShown(), "a chip without a gamepad") end
    card.scripts.OnLeave(card)
    T.eq(Theme.current.id, "halo", "leaving the card kept the preview")
    card.scripts.OnEnter(card)
    card.scripts.OnClick(card, "LeftButton")
    T.eq(Ding.db.ui.theme, "bandes", "a click does not save")
    card.scripts.OnLeave(card)
    T.eq(Theme.current.id, "bandes", "leaving a saved card undid it")
    T.eq(Cfg.frame.help.list[1].label, L.MOUSE_HINT, "no mouse help")
    Cfg:Close(); H.flush()
    _G.GetCVar = getCVar
end)

T.test("theme cards: 4 columns, 6 apart, a 34-high preview of our own scene with a bar in each card's theme", function()
    start("halo")
    local row = openPicker()
    local width = row.cards[1]:GetWidth()
    T.eq(width, math.floor((560 - 16 - 18) / 4))
    T.eq(row.cards[2].points[1][4] - row.cards[1].points[1][4], width + 6)
    for _, card in ipairs(row.cards) do
        T.eq(card.preview.h, 34)
        T.eq(card.preview.scene.texture, UI.TEX .. "theme_preview_bg")
        T.ok(card:GetHeight() == row.cards[1]:GetHeight(), "cards of different heights")
    end
    -- Each card in its own theme, whatever the theme on screen.
    local bandes = row.cards[3].preview.bar
    T.ok(bandes.bg.gradient, "the Bandes card has no band")
    local halo = row.cards[1].preview.bar
    T.eq(halo.bg.file, "soft_rect", "the Halo card has no veil")
    H.press("PADDRIGHT")
    T.ok(halo.bg.file == "soft_rect" and bandes.bg.gradient, "a card's preview follows the theme on screen")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- The hover card, the arrow
---------------------------------------------------------------------------
T.test("hover card: Ding's own frame, 220 wide, 10 right of the window at the row's top; the click line in the accent", function()
    start("halo")
    -- A window with room on its right.
    Ding.db.panel.point, Ding.db.panel.x, Ding.db.panel.y = "TOPLEFT", 100, -100
    P:ApplyPosition()
    T.quests({ [456] = "log" })
    local r = P.frame.rows[2]
    r.scripts.OnEnter(r)
    local Card = UI.Card
    T.ok(Card:IsShown() and Card:GetOwner() == r, "no card")
    T.ok(not GameTooltip:IsShown() or GameTooltip:GetOwner() ~= r, "the game's tooltip used")
    local f = Card.frame
    T.eq(f.w, 220)
    local point = f.points[1]
    T.eq(point[1], "TOPLEFT")
    T.eq(point[2], r)
    T.eq(point[3], "TOPRIGHT")
    T.eq(point[4], 10 + (P.frame:GetRight() - r:GetRight()), "not 10 right of the window")
    T.eq(point[5], 0, "not at the row's top")
    T.eq(f.look.style, "feather")
    local last = f.texts[#Card.lines]
    T.eq(last:GetText(), L.ROW_CLICK)
    T.eq(UI.HexOf(last.color), UI.HexOf(C.accent), "the click line not in the accent")
    T.eq(UI.HexOf(f.texts[1].color), UI.HexOf(C.cardText))
    r.scripts.OnLeave(r)
    T.ok(not Card:IsShown(), "the card stays")
    -- No room on the right of the screen: on the left of the window.
    Ding.db.panel.x = 1366 - 300 - 100
    P:ApplyPosition()
    r.scripts.OnEnter(r)
    T.eq(f.points[1][1], "TOPRIGHT", "the card goes off the screen")
    T.eq(f.points[1][3], "TOPLEFT")
    r.scripts.OnLeave(r)
    P:ResetPosition()
end)

T.test("arrow: the theme's textures and colors in 3 states; Ardoise's label plate", function()
    start("ardoise")
    local f = A.frame
    A:SetState("route", true)
    T.eq(f.arrow.texture, UI.TEX .. "arrow_slate")
    T.eq(UI.HexOf(f.arrow.vertexColor), "f2ede4")
    A:SetState("behind")
    T.eq(UI.HexOf(f.arrow.vertexColor), "ffb040")
    T.eq(UI.HexOf(f.distance.color), "ffb040", "the line not in the turn-around color")
    A:SetState("arrived")
    T.ok(f.arrivedBg:IsShown() and f.ring:IsShown() and f.check:IsShown(), "arrived: ring, check, disc")
    T.ok(f.arrivedBg.vertexColor[4] > 0, "Ardoise: no dark disc under the ring")
    A:LayoutLabel()
    T.ok(f.plate:IsShown(), "no label plate")
    Theme.Apply("bandes")
    T.eq(f.ring.texture, UI.TEX .. "ring_outlined")
    T.eq(f.check.texture, UI.TEX .. "icon_check_large_outlined")
    T.ok(not f.plate:IsShown(), "a plate in Bandes")
    A:SetState("route")
    T.eq(f.arrow.texture, UI.TEX .. "arrow_band")
    T.eq(UI.HexOf(f.arrow.vertexColor), "63c2ff")
    Theme.Apply("halo")
    T.eq(f.arrow.texture, UI.TEX .. "arrow_halo_gold")
    T.eq(UI.HexOf(f.arrow.vertexColor), "ffffff", "Halo's arrow tinted")
    A:SetState("behind")
    T.eq(f.arrow.texture, UI.TEX .. "arrow_halo_back")
end)

---------------------------------------------------------------------------
-- Gradients, other surfaces, old colors
---------------------------------------------------------------------------
T.test("gradients: SetGradient with CreateColor, else SetGradientAlpha, else the mean color", function()
    local tex = UIParent:CreateTexture()
    T.eq(Ding.Compat.SetGradient(tex, "HORIZONTAL", { 1, 0, 0, 1 }, { 0, 0, 1, 0.5 }), "color")
    T.eq(tex.gradient[1], "HORIZONTAL")
    T.ok(tex.gradient[3][3] == 1 and tex.gradient[3][4] == 0.5, "the second color")
    local old = { SetGradientAlpha = function(self, o, ...) self.args = { o, ... } end,
        SetVertexColor = function(self, ...) self.flat = { ... } end }
    T.eq(Ding.Compat.SetGradient(old, "VERTICAL", { 1, 1, 1, 0 }, { 1, 1, 1, 1 }), "alpha")
    T.eq(#old.args, 9)
    local none = { SetVertexColor = function(self, ...) self.flat = { ... } end }
    T.eq(Ding.Compat.SetGradient(none, "HORIZONTAL", { 1, 0, 0, 1 }, { 0, 0, 1, 1 }), "flat")
    T.ok(close(none.flat[1], 0.5) and close(none.flat[3], 0.5), "not the mean color")
    -- A failing SetGradient (a client that wants other arguments): the old call.
    local broken = { SetGradient = function() error("bad argument") end,
        SetGradientAlpha = function(self) self.alpha = true end, SetVertexColor = function() end }
    T.eq(Ding.Compat.SetGradient(broken, "HORIZONTAL", { 1, 1, 1, 1 }, { 1, 1, 1, 0 }), "alpha")
end)

T.test("other windows take the theme: settings, directory, setup, import, offers, marks, item button", function()
    start("halo")
    Cfg:Open("guide", 1); H.flush()
    T.eq(Cfg.frame.look.style, "feather")
    T.eq(Cfg.frame.title.fontObject:GetFont(), STANDARD_TEXT_FONT)
    Cfg:Close(); H.flush()
    Ding.Finder:Open(); H.flush()
    T.eq(Ding.Finder.frame.look.style, "feather")
    Theme.Apply("bandes")
    T.eq(Ding.Finder.frame.look.style, "panel", "Bandes: dialogs are panels")
    T.eq(Ding.Finder.frame.look.fill.file, "rr2_fill")
    T.ok(Ding.Finder.frame.titleBar.bg.gradient, "Bandes: the title bar's accent gradient")
    Ding.Finder:Close(); H.flush()
    T.eq(UI.HexOf(C.itemChipBg), "f5f7fa")
    Theme.Apply("dingdark")
    T.eq(UI.HexOf(C.itemChipBg), "22252b")
end)

-- A file of Ding/UI may name a color only through a token (UI.C): the palettes live in
-- UI/Themes.lua. Allowed: zeros (no color), white (an untinted item icon).
T.test("no color of the old palette left in Ding/UI: colors come from the theme's tokens", function()
    local handle = io.popen('ls "' .. tools .. '/../Ding/UI"')
    local checked = 0
    for name in handle:lines() do
        if name:find("%.lua$") and name ~= "Themes.lua" then
            checked = checked + 1
            local n = 0
            for line in io.lines(tools .. "/../Ding/UI/" .. name) do
                n = n + 1
                local code = line:gsub("%-%-.*$", "")
                local where = ("%s:%d: %s"):format(name, n, line)
                T.ok(not code:find("|c%x%x%x%x%x%x%x%x"), "a color code: " .. where)
                T.ok(not code:find("[\"']%x%x%x%x%x%x[\"']"), "a hexadecimal color: " .. where)
                T.ok(code:find("SetTexCoord") or not code:find("%d?%.%d+%s*,%s*%d?%.?%d+%s*,%s*%d?%.%d+"),
                    "color numbers: " .. where)
                T.ok(not code:find("SetTextColor%(%s*%d") and not code:find("SetVertexColor%(%s*0?%.%d"),
                    "a literal color: " .. where)
                for _, old in ipairs({ "0%.357", "0%.706", "0%.898", "0%.086, 0%.094", "0%.910, 0%.918" }) do
                    T.ok(not code:find(old), "the old palette: " .. where)
                end
            end
        end
    end
    handle:close()
    T.ok(checked >= 15, "Ding/UI not read")
end)

T.run()
