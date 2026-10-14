-- Ding's dialog windows (the NPC directory, the settings, the setup assistant, import /
-- export): on every row, in every language, gamepad on and off, nothing overlaps (the A chip, a
-- time, a caret, a value, a text) and nothing leaves its row (tools/layout.lua places the
-- mocked widgets); the sizes the windows share (UI.SIZE, a little denser than the design's
-- first handoff at the user's request); their size setting (Appearance tab, 60 % to 120 %,
-- 85 % by default) on each of them.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local root = tools .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Layout = dofile(tools .. "/layout.lua")
local Ding, H = T.Ding, T.H
local UI, L = Ding.UI, Ding.L
local F, Cfg, S, W = Ding.Finder, Ding.Config, Ding.Setup, Ding.ImportWindow

Ding.RegisterGuide({ id = "t-layout", title = "Layout", steps = {
    { accept = 456 },
    { level = 60 },
} })

local function pad(on)
    H.setGamepadConnected(on)
    H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
    H.flush()
end

local function closeAll()
    if W.frame then W:Close() end
    if F.frame then F:Close() end
    if S:IsShown() then S:Close(true) end
    Cfg:Close()
    H.flush()
end

-- A dwarf hunter in Ironforge, level 20: weapons to learn, cities near and far.
local function start()
    closeAll()
    H.closeDialog()
    T.reset({ level = 20, class = "HUNTER", race = "Dwarf" })
    H.player.map, H.player.x, H.player.y = 1455, 55, 50
    Ding.Engine:SetGuide("t-layout", 1, true); H.flush()
    H.tick(1)
    pad(true)
end

---------------------------------------------------------------------------
-- Every language: Ding.L takes its strings while the windows lay out
---------------------------------------------------------------------------
local function loadStrings(name)
    local ns, getLocale = {}, _G.GetLocale
    _G.GetLocale = function() return name end
    local ok, err = pcall(assert(loadfile(root .. "/Ding/Locales/" .. name .. ".lua")), "Ding", ns)
    _G.GetLocale = getLocale
    assert(ok, err)
    return ns.Locales[name]
end

local function useStrings(strings)
    local keys = {}
    for k in pairs(L) do keys[#keys + 1] = k end
    for _, k in ipairs(keys) do L[k] = nil end
    for k, v in pairs(strings) do L[k] = v end
end

-- fn(where) in every language, gamepad then mouse; Ding.L as it was afterwards.
local function everyLanguage(fn)
    local own = {}
    for k, v in pairs(L) do own[k] = v end
    local languages = { "enUS" }
    for _, name in ipairs(dofile(tools .. "/guide_texts.lua").LOCALES) do languages[#languages + 1] = name end
    for _, name in ipairs(languages) do
        useStrings(loadStrings(name))
        for _, on in ipairs({ true, false }) do
            pad(on)
            fn(name .. (on and ", gamepad" or ", mouse"))
            closeAll()
        end
    end
    useStrings(own)
    pad(true)
end

-- Fails with the first problems found (the list says where).
local function none(problems, what)
    if #problems == 0 then return end
    local shown = {}
    for i = 1, math.min(8, #problems) do shown[i] = problems[i] end
    error(("%d %s:\n  %s"):format(#problems, what, table.concat(shown, "\n  ")), 2)
end

local function report(problems, where, row, list)
    for _, p in ipairs(list) do problems[#problems + 1] = ("%s, %s: %s"):format(where, row, p) end
end

---------------------------------------------------------------------------
-- The NPC directory
---------------------------------------------------------------------------
local function finderParts(r)
    return { label = r.label, sub = r.sub, time = r.time, caret = r.caret, A = r.key }
end

-- Every row of the page on screen, each focused in turn.
local function checkFinderPage(where, problems)
    for i = 1, #F.rows do
        F:SetFocus(i)
        for j, r in ipairs(F.frame.rows) do
            if r:IsShown() then
                local name = ("%s, row %d %q (focus on %d)"):format(F:Page().kind, j, r.label:GetText() or "", i)
                report(problems, where, name, Layout.check(r, finderParts(r)))
            end
        end
    end
end

-- The first row of the page that opens a list of `kind`.
local function opener(kind)
    for i, row in ipairs(F.rows) do
        if row.open and row.open.kind == kind then return i end
    end
end

local function checkFinder(where, problems)
    F:Open(1); H.flush()
    checkFinderPage(where, problems)
    local choices = opener("choices")
    T.ok(choices, where .. ": no list of weapons or professions")
    F:Activate(choices); H.flush()
    checkFinderPage(where, problems)
    F:SelectTab(2); H.flush()
    checkFinderPage(where, problems)
    F:Activate(opener("city")); H.flush()
    checkFinderPage(where, problems)
    F:Activate(opener("citylist")); H.flush()
    checkFinderPage(where, problems)
end

T.test("directory: the A chip takes the caret's place, the time stays left of it (« Ironforge — Capitale · par vol »)", function()
    start()
    F:Open(2); H.flush()
    local found
    for i, row in ipairs(F.rows) do
        if row.right and row.right ~= "" and row.caret then
            found = i
            F:SetFocus(i)
            local r = F.frame.rows[i]
            T.ok(r.key:IsShown(), "no A on the focused row")
            T.ok(not r.caret:IsShown(), "the caret under the A chip")
            local key, time = Layout.ink(r.key), Layout.ink(r.time)
            T.ok(time.right <= key.left, ("the time (%d-%d) runs into the A chip (%d-%d)"):format(
                time.left, time.right, key.left, key.right))
            -- Not focused: the caret in the chip's place, the time where it was.
            F:SetFocus(i == 1 and 2 or 1)
            T.ok(r.caret:IsShown() and not r.key:IsShown(), "the caret back once the focus left")
            local caret, again = Layout.ink(r.caret), Layout.ink(r.time)
            T.ok(again.right <= caret.left, "the time runs into the caret")
            T.eq(again.right, time.right, "the time moves with the focus")
            break
        end
    end
    T.ok(found, "no city with a time and a caret")
    closeAll()
end)

T.test("directory, every language, gamepad and mouse: nothing overlaps on a row, nothing leaves it", function()
    start()
    local problems = {}
    everyLanguage(function(where) checkFinder(where, problems) end)
    none(problems, "overlaps in the directory")
end)

---------------------------------------------------------------------------
-- The settings
---------------------------------------------------------------------------
local function settingsParts(row)
    if row.kind == "dropdown" then
        return { text = row.box.text, detail = row.box.detail, caret = row.box.caret }
    elseif row.kind == "slider" then
        return { label = row.label, value = row.value, min = row.minText, max = row.maxText, help = row.help }
    end
    return { label = row.label, desc = row.desc, A = row.aGlyph, value = row.value, left = row.left, right = row.right,
        button = row.button, caret = row.caret, chip = row.chip, status = row.status, box = row.box }
end

local function checkSettings(where, problems)
    for _, tab in ipairs(Cfg.TABS) do tab.built = nil end
    for i, tab in ipairs(Cfg.TABS) do
        Cfg:Open(i, 1); H.flush()
        for n, row in ipairs(tab.focusable or {}) do
            Cfg:SetFocus(row)
            local name = ("%s #%d %q"):format(tab.key, n, row.label:GetText() or "")
            report(problems, where, name, Layout.check(row, settingsParts(row)))
        end
    end
end

T.test("settings, every language, gamepad and mouse: nothing overlaps on a row, nothing leaves it", function()
    start()
    local problems = {}
    everyLanguage(function(where) checkSettings(where, problems) end)
    none(problems, "overlaps in the settings")
end)

---------------------------------------------------------------------------
-- The setup assistant
---------------------------------------------------------------------------
local function checkSetup(where, problems)
    S:Open()
    for screen = 1, #S.SCREENS do
        S:Show(screen)
        local s = S:Current()
        for i = 1, #s.choices do
            S:SetFocus(i)
            for j = 1, #s.choices do
                local r = s.rows[j]
                local name = ("screen %d, choice %d %q (focus on %d)"):format(screen, j, r.label:GetText() or "", i)
                report(problems, where, name,
                    Layout.check(r, { box = r.box, label = r.label, sub = r.sub, tag = r.tag, A = r.key }))
            end
        end
    end
end

T.test("setup assistant, every language, gamepad and mouse: nothing overlaps on a choice, nothing leaves it", function()
    start()
    local problems = {}
    everyLanguage(function(where) checkSetup(where, problems) end)
    none(problems, "overlaps in the setup assistant")
end)

---------------------------------------------------------------------------
-- Shared sizes
---------------------------------------------------------------------------
T.test("the windows share their sizes, a little denser than the design's first handoff", function()
    start()
    local SIZE = UI.SIZE
    T.ok(SIZE.row <= 30 and SIZE.row2 <= 38 and SIZE.title <= 28 and SIZE.gap <= 2 and SIZE.pad <= 8,
        "not denser than the handoff")
    Cfg:Open("appearance", 1); H.flush()
    local heights = {}
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.appearance].rows) do
        if row.kind == "check" then heights[row.desc and "two" or "one"] = row:GetHeight() end
    end
    T.eq(heights.one, SIZE.row, "a check row")
    T.eq(heights.two, SIZE.row2, "a check row with its description")
    T.eq(Cfg.frame:GetHeight(), 430, "the settings window")
    closeAll()
    F:Open(1); H.flush()
    T.eq(F.frame.rows[1]:GetHeight(), SIZE.row2, "a directory row")
    closeAll()
    -- The texts of a two-line row fit, 16 + 2 + 14 (UI.Wrap's line heights).
    T.ok(SIZE.row2 >= 16 + 2 + 14 + 2 * 2, "two lines do not fit in a row")
end)

---------------------------------------------------------------------------
-- The windows' size (Appearance)
---------------------------------------------------------------------------
local function dialogs()
    return {
        { "settings", function() Cfg:Open("appearance", 1) end, function() return Cfg.frame end, 0 },
        { "directory", function() F:Open(1) end, function() return F.frame end, 80 },
        { "setup assistant", function() S:Open() end, function() return S.frame end, 40 },
        { "import", function() W:Open("import") end, function() return W.frame end, 40 },
    }
end

-- Each window at `scale`, kept on the screen, as far from its center whatever its size.
local function checkScale(scale, when)
    for _, d in ipairs(dialogs()) do
        local name, open, frame, y = d[1], d[2], d[3], d[4]
        closeAll()
        open(); H.flush()
        local f = frame()
        T.ok(f:IsShown(), name .. " not shown")
        T.eq(f:GetScale(), scale, when .. ": " .. name)
        T.ok(f.clamped, name .. ": may leave the screen")
        local point = f.points[1]
        T.ok(point[1] == "CENTER" and point[2] == UIParent and point[3] == "CENTER", name .. ": not centered")
        T.ok(math.abs(point[5] * scale - y) < 0.001, ("%s: %.1f from the center, not %d"):format(name, point[5] * scale, y))
    end
    closeAll()
end

local function scaleRow()
    Cfg:Open("appearance", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.DIALOG_SCALE end, "the windows' size")
    return Cfg.focus
end

T.test("windows' size: 85 % by default on the settings, the directory, the setup assistant and import", function()
    start()
    T.eq(Ding.DEFAULTS.ui.dialogScale, 0.85)
    Ding.db.ui.dialogScale = nil
    T.eq(UI.DialogScale(), 0.85, "nothing saved")
    Ding.db.ui.dialogScale = 0.85
    checkScale(0.85, "by default")
    -- Not the guide window: it has its own size.
    T.eq(Ding.Panel.frame:GetScale(), Ding.db.panel.scale)
end)

T.test("windows' size: the Appearance slider, 60 % to 120 % by 5 %, at once on the open window", function()
    start()
    local row = scaleRow()
    T.eq(row.kind, "slider")
    T.eq(row.opts.min, 60)
    T.eq(row.opts.max, 120)
    T.eq(row.opts.step, 5)
    T.eq(row.value:GetText(), "85 %")
    H.press("PADDRIGHT")
    T.eq(Ding.db.ui.dialogScale, 0.9)
    T.eq(Cfg.frame:GetScale(), 0.9, "the settings window does not follow at once")
    checkScale(0.9, "after the slider")
    -- Its bounds.
    row = scaleRow()
    for _ = 1, 20 do H.press("PADDRIGHT") end
    T.eq(Ding.db.ui.dialogScale, 1.2, "above 120 %")
    for _ = 1, 20 do H.press("PADDLEFT") end
    T.eq(Ding.db.ui.dialogScale, 0.6, "below 60 %")
    T.eq(Cfg.frame:GetScale(), 0.6)
    -- Y: back to 85 %.
    H.press("PAD4")
    T.eq(Ding.db.ui.dialogScale, 0.85, "Y does not restore 85 %")
    T.eq(Cfg.frame:GetScale(), 0.85)
    closeAll()
end)

T.test("windows' size: dragging with the mouse resizes the window once the mouse lets go", function()
    start()
    local row = scaleRow()
    local track = row.track
    -- The mock's cursor is left of the track: the thumb goes to 60 %.
    track:SetWidth(400)
    track.scripts.OnMouseDown(track)
    T.eq(Ding.db.ui.dialogScale, 0.6)
    T.eq(row.value:GetText(), "60 %", "the value does not follow the thumb")
    T.eq(Cfg.frame:GetScale(), 0.85, "the window moves under the mouse while it drags")
    track.scripts.OnMouseUp(track)
    T.eq(Cfg.frame:GetScale(), 0.6, "not resized once the mouse let go")
    UI.SetDialogScale(0.85)
    closeAll()
end)

T.test("windows' size: a saved size out of bounds or broken is brought back", function()
    start()
    T.eq(UI.SetDialogScale(2), 1.2)
    T.eq(UI.SetDialogScale(0.1), 0.6)
    T.eq(UI.SetDialogScale("x"), 0.85)
    Ding.db.ui.dialogScale = 7
    T.eq(UI.DialogScale(), 1.2)
    Ding.db.ui.dialogScale = "?"
    T.eq(UI.DialogScale(), 0.85)
    Ding.db.ui.dialogScale = 0.85
end)

T.test("windows' size: the Appearance tab's defaults and \"restore all\" bring back 85 %", function()
    start()
    UI.SetDialogScale(1.1)
    Cfg:TabDefaults("appearance"); H.flush()
    T.eq(Ding.db.ui.dialogScale, 0.85, "the tab's defaults")
    UI.SetDialogScale(0.7)
    Cfg:Open("appearance", 1); H.flush()
    T.eq(Cfg.frame:GetScale(), 0.7)
    Ding:ResetSettings()
    T.eq(Ding.db.ui.dialogScale, 0.85, "restore all")
    closeAll()
end)

T.run()
