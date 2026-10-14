-- The design (docs/UI-handoff.md, docs/UI-themes.md): kit textures only, Noto Sans everywhere
-- (the game's own font for some themes' titles), no character the font lacks, the sizes of the
-- screens, row colors by state, background opacity. The look checks of Ding dark (the theme of
-- the first handoff) run with that theme; tools/tests/themes_test.lua checks the others.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P, A, Cfg, UI = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.Config, Ding.UI
local C, L = UI.C, Ding.L
local G = "nightelf-01-shadowglen"

-- 456 accepted (done), 458 to do, 457 needs 456 turned in first (impossible).
Ding.RegisterGuide({ id = "t-look", title = "Appearance", races = { "NightElf" }, steps = {
    { accept = 456, complete = 458, turnin = 457 },
} })

local function start(guide, theme)
    T.reset({ level = 1 })
    Ding.db.ui.opacityTouched = nil
    UI.Theme.Apply(theme or "dingdark")
    E:SetGuide(guide or G, 1, true)
    H.flush()
end

local function alphaOf(slice) return slice.color and slice.color[4] end
local function same(a, b)
    for i = 1, 3 do if math.abs(a[i] - b[i]) > 1e-6 then return false end end
    return true
end

-- Every widget the player can see: guide window (full and minimized), every settings
-- tab with the dropdown open, the arrow, the item button and the minimap button.
local function showEverything()
    start()
    P:SetCompact(true); P:SetCompact(false)
    Cfg:Open("guide", 1); H.flush()
    H.press("PAD1")                   -- dropdown list
    H.press("PAD2")
    for tab = 2, #Cfg.TABS do Cfg:SelectTab(tab) end
    Cfg:Close(); H.flush()
end

T.test("textures: the kit's, item icons, the minimap arrow; no WoW frame", function()
    showEverything()
    local allowed = { "^Interface\\AddOns\\Ding\\Media\\Textures\\", "^Interface\\Icons\\",
        "^Interface\\Minimap\\MinimapArrow$", "^Interface\\Buttons\\WHITE8X8$" }
    for _, w in ipairs(H.widgets) do
        T.ok(w.backdrop == nil, "SetBackdrop used: " .. tostring(w.name or w.kind))
        if type(w.texture) == "string" then
            local ok = false
            for _, pattern in ipairs(allowed) do ok = ok or w.texture:find(pattern) ~= nil end
            T.ok(ok, "texture outside the kit: " .. w.texture)
        end
    end
end)

T.test("kit textures: every referenced file is shipped", function()
    showEverything()
    local prefix = "Interface\\AddOns\\Ding\\Media\\Textures\\"
    for _, w in ipairs(H.widgets) do
        if type(w.texture) == "string" and w.texture:sub(1, #prefix) == prefix then
            local file = tools .. "/../Ding/Media/Textures/" .. w.texture:sub(#prefix + 1) .. ".tga"
            local handle = io.open(file, "rb")
            T.ok(handle, "texture missing: " .. file)
            if handle then handle:close() end
        end
    end
end)

T.test("kit textures: uncompressed 32-bit TGA, powers of 2, bottom-left origin", function()
    local POWERS = { [4] = true, [16] = true, [32] = true, [64] = true, [128] = true, [256] = true }
    local handle = io.popen('ls "' .. tools .. '/../Ding/Media/Textures"')
    local count = 0
    for name in handle:lines() do
        if name:find("%.tga$") then
            count = count + 1
            local file = assert(io.open(tools .. "/../Ding/Media/Textures/" .. name, "rb"))
            local header = file:read(18)
            file:close()
            local w = header:byte(13) + 256 * header:byte(14)
            local h = header:byte(15) + 256 * header:byte(16)
            T.eq(header:byte(3), 2, name .. ": uncompressed TGA expected")
            T.eq(header:byte(17), 32, name .. ": 32 bits expected")
            T.ok(POWERS[w] and POWERS[h], name .. ": size " .. w .. " x " .. h)
            -- Rows from the bottom, like Blizzard's files: a loader that ignores the origin
            -- flag cannot show them upside down.
            T.eq(math.floor(header:byte(18) / 32) % 2, 0, name .. ": origin at the top")
        end
    end
    handle:close()
    T.ok(count >= 34, "kit textures missing: " .. count)
end)

T.test("addon icon (.toc: the logo) and minimap button icon (in its own colors): shipped with Ding", function()
    local toc = assert(io.open(tools .. "/../Ding/Ding.toc")):read("*a")
    local icon = toc:match("## IconTexture: Interface\\AddOns\\Ding\\([^\r\n]+)")
    T.ok(icon, "IconTexture does not point to a Ding texture")
    T.eq(icon, "Media\\Textures\\logo64", "the AddOns list does not show the logo")
    local file = io.open(tools .. "/../Ding/" .. icon:gsub("\\", "/") .. ".tga", "rb")
    T.ok(file, ".toc icon missing: " .. tostring(icon))
    if file then file:close() end
    showEverything()
    local b = _G.DingMinimapButton
    T.eq(b.icon.texture, UI.TEX .. "minimap_icon64", "the minimap button does not have Ding's icon")
    T.ok(b.icon.vertexColor[1] == 1 and b.icon.vertexColor[2] == 1 and b.icon.vertexColor[3] == 1
        and b.icon.vertexColor[4] == 1, "the icon is tinted")
    -- Under 24 pixels on the screen (a small UI scale): the 32-texel icon.
    b:SetScale(0.6)
    Ding.Minimap:Update()
    T.eq(b.icon.texture, UI.TEX .. "minimap_icon32", "no small icon at a small scale")
    b:SetScale(1)
    Ding.Minimap:Update()
    T.eq(b.icon.texture, UI.TEX .. "minimap_icon64")
    -- The old white icons are gone.
    for _, name in ipairs({ "icon", "icon32" }) do
        T.eq(io.open(tools .. "/../Ding/Media/Textures/" .. name .. ".tga", "rb"), nil, name .. ".tga still shipped")
    end
end)

T.test("font refused by the client: the game font takes over, no text breaks", function()
    local font = _G.CreateFont("DingFont_test_missing")
    T.eq(font:SetFont("Interface\\AddOns\\Ding\\Media\\Fonts\\Missing.ttf", 12, ""), false)
    T.eq(font:GetFont(), nil, "the fake client keeps a missing font")
    -- UI.Font on a missing file: same code path as Noto Sans refused by the client.
    local exists = io.open
    io.open = function(path, ...)
        if tostring(path):find("NotoSans%-Bold") then return nil end
        return exists(path, ...)
    end
    local ok, fallback = pcall(UI.Font, "bold", 77)
    io.open = exists
    T.ok(ok, tostring(fallback))
    T.eq(fallback:GetFont(), STANDARD_TEXT_FONT, "no fallback font")
    local fs = UIParent:CreateFontString()
    fs:SetFontObject(fallback)
    T.ok(pcall(fs.SetText, fs, "text"), "SetText breaks with the fallback font")
end)

T.test("fonts: Noto Sans from the Media/Fonts folder, never the fallback font", function()
    showEverything()
    local count = 0
    for name, font in pairs(_G) do
        -- (DingFont_bold77 and DingFont_test_* come from the fallback test above)
        if type(name) == "string" and name:find("^DingFont_") and name ~= "DingFont_bold77"
            and not name:find("^DingFont_test_") then
            count = count + 1
            T.ok(font.path and font.path:find("^Interface\\AddOns\\Ding\\Media\\Fonts\\NotoSans%-"),
                name .. ": " .. tostring(font.path))
        end
    end
    T.ok(count >= 8, "too few fonts created: " .. count)
end)

-- The design font has neither arrows nor geometric shapes: they are textures.
local MISSING = { "←", "→", "↑", "↓", "◂", "▸", "▴", "▾", "◀", "▶", "▲", "▼", "✕", "✓", "□", "△", "○", "●", "◆" }
local function missingChar(text)
    for _, c in ipairs(MISSING) do
        if text:find(c, 1, true) then return c end
    end
end

T.test("no interface or guide text uses a character missing from Noto Sans", function()
    for _, name in ipairs({ "enUS", "frFR" }) do
        for key, text in pairs(Ding.Locales[name] or {}) do
            local c = missingChar(text)
            T.ok(not c, ("%s.%s contains %s"):format(name, key, tostring(c)))
        end
    end
    for id, guide in Ding:IterateGuides() do
        T.ok(not missingChar(guide.title), id .. ": title")
        for i, step in ipairs(guide.steps) do
            for _, field in ipairs({ "text", "note" }) do
                local text = step[field]
                if type(text) == "string" then
                    local c = missingChar(text)
                    T.ok(not c, ("%s, step %d, %s: %s"):format(id, i, field, tostring(c)))
                end
            end
        end
    end
    showEverything()
    for _, w in ipairs(H.widgets) do
        if w.kind == "FontString" and type(w.text) == "string" then
            local c = missingChar(w.text)
            T.ok(not c, "text shown with " .. tostring(c) .. ": " .. w.text)
        end
    end
end)

T.test("guide window (Ding dark): 300 wide, #16181C background at 85%, border and shadow follow", function()
    start()
    local f = P.frame
    T.eq(f.w, 300)
    T.ok(same(f.look.fill.color, C.bg), "background color")
    T.eq(alphaOf(f.look.fill), 0.85)
    T.ok(alphaOf(f.look.border) > 0 and alphaOf(f.look.shadow) > 0, "border or shadow invisible")
    P:SetBackgroundAlpha(0)
    T.eq(alphaOf(f.look.fill), 0, "background still visible at 0%")
    T.eq(alphaOf(f.look.border), 0, "border still visible without background")
    T.eq(alphaOf(f.look.shadow), 0, "shadow still visible without background")
    P:SetBackgroundAlpha(0.85)
end)

T.test("guide window: bars of 24 and 28, minimized to 300 x 28", function()
    start()
    local f = P.frame
    T.eq(f.titleDivider.points[1][5], -24, "title bar")
    T.eq(f.stepDivider.points[1][5], -53, "step bar (24 + 1 + 28)")
    T.eq(f.menu.w, 20)
    T.eq(f.prev.w, 24)
    P:SetCompact(true)
    T.ok(f.w == 300 and f.h == 28, ("minimized: %s x %s"):format(tostring(f.w), tostring(f.h)))
    P:SetCompact(false)
end)

T.test("rows (Ding dark): background, icon and text by state (done, to do, impossible)", function()
    start("t-look")
    T.quests({ [456] = "log", [458] = "log" })
    E:Refresh()
    local states = {}
    for i, row in ipairs(P.rowsShown) do
        local r = P.frame.rows[i]
        states[row.state] = r
    end
    local done, todo, impossible = states.done, states.todo, states.impossible
    T.ok(done and todo and impossible, "a state is missing")
    T.ok(same(done.bg.color, C.doneRowBg) and same(done.icon.bg.color, C.doneIconBg), "done row background")
    T.ok(same(done.text.color, C.secondary), "done row text")
    T.ok(same(todo.bg.color, C.todoRowBg) and same(todo.counter.color, C.todo), "to-do row")
    T.ok(same(todo.text.color, C.text), "to-do row text")
    T.ok(not impossible.bg:IsShown() and same(impossible.text.color, C.disabled), "impossible row")
    T.ok(same(impossible.icon.bg.color, C.impossibleIconBg), "impossible row icon")
end)

T.test("settings: 560 x 430 (the design's 440, denser at the user's request, the theme cards), six tabs by intent in order, LB and RB at the ends", function()
    start()
    Cfg:Open("guide", 1); H.flush()
    local f = Cfg.frame
    T.ok(f.w == 560 and f.h == 430, "window size")
    local want = { L.TAB_GUIDE, L.TAB_ROUTE, L.TAB_AUTOMATION, L.TAB_ARROW, L.TAB_BINDINGS, L.TAB_APPEARANCE }
    T.eq(#f.tabs, #want)
    for i, b in ipairs(f.tabs) do T.eq(b.label:GetText(), want[i]) end
    -- The six tabs fit between LB and RB.
    local last = f.tabs[#f.tabs]
    local right = last.points[1][4] + last:GetWidth()
    T.ok(right <= 560 - 8 - f.rb:GetWidth() - 4 + 0.5, ("the tabs overflow: %d"):format(right))
    T.ok(f.tabs[1].underline:IsShown() and not f.tabs[2].underline:IsShown(), "active tab underline")
    T.ok(f.lb:IsShown() and f.rb:IsShown(), "LB / RB hidden with a gamepad")
    Cfg:Close(); H.flush()
end)

T.test("without a gamepad: the window and settings glyphs are hidden", function()
    start()
    local getCVar = _G.GetCVar
    _G.GetCVar = function(name) if name == "GamePadEnable" then return "0" end return getCVar(name) end
    P:Update()
    T.ok(not P.frame.lb:IsShown() and not P.frame.rb:IsShown(), "LB / RB shown without a gamepad")
    Cfg:Open("guide", 1); H.flush()
    T.ok(not Cfg.frame.lb:IsShown() and not Cfg.frame.back:IsShown(), "settings glyphs without a gamepad")
    Cfg:Close(); H.flush()
    _G.GetCVar = getCVar
    P:Update()
    T.ok(P.frame.lb:IsShown(), "LB hidden with a gamepad")
end)

T.test("Appearance: the theme cards first, opacity updates the window live, \"reset all\" restores Halo at 60%", function()
    start()
    Cfg:Open("appearance", 1); H.flush()
    T.eq(Cfg.focus.kind, "themes", "first Appearance item: the theme cards")
    H.press("PADDDOWN")
    T.eq(Cfg.focus.opts.label, L.BG_OPACITY, "second Appearance item")
    H.press("PADDLEFT")
    T.eq(Ding.db.panel.bgAlpha, 0.8)
    T.ok(Ding.db.ui.opacityTouched, "moving the slider is not remembered")
    T.eq(alphaOf(P.frame.look.fill), 0.8, "the window does not follow")
    H.press("PAD4")
    T.eq(Ding.db.panel.bgAlpha, 0.85, "Y does not restore the theme's default (85% in Ding dark)")
    T.ok(not Ding.db.ui.opacityTouched, "Y: the slider follows the theme again")
    H.press("PADDDOWN")
    T.eq(Cfg.focus.opts.label, L.WINDOW_SCALE)
    H.press("PADDRIGHT")
    T.eq(Ding.db.panel.scale, 1.05)
    T.eq(P.frame:GetScale(), 1.05)
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.RESET_ALL end, "default")
    H.press("PAD1"); H.press("PAD1")
    T.eq(Ding.db.panel.scale, 1)
    T.eq(Ding.db.ui.theme, "halo")
    T.eq(UI.Theme.current.id, "halo")
    T.eq(Ding.db.panel.bgAlpha, 0.6)
    Cfg:Close(); H.flush()
end)

T.test("arrow: no background, the name then the distance, shadow under the text", function()
    start()
    local f = A.frame
    T.ok(not f.look and not f.backdrop, "the arrow has a background")
    T.eq(f.line.points[1][2], f.label, "the distance is not under the name")
    T.ok(same(f.label.color, C.text), "name color")
end)

-- After the Noto Sans test above: the fonts made here are the game's.
T.test("Korean and Chinese: the game font, Noto Sans lacks their characters", function()
    local saved = Ding.locale
    for i, name in ipairs({ "koKR", "zhCN", "zhTW" }) do
        Ding.locale = name
        T.eq(UI.Font("regular", 60 + i):GetFont(), STANDARD_TEXT_FONT, name)
        T.eq(UI.Font("bold", 60 + i):GetFont(), STANDARD_TEXT_FONT, name .. " bold")
    end
    Ding.locale = "deDE"
    T.ok(tostring(UI.Font("regular", 64):GetFont()):find("NotoSans%-Regular"), "German: Noto Sans")
    Ding.locale = saved
end)

T.run()
