-- Settings window, by intent: six tabs (Guide, Route, Automation, Arrow and maps, Keybinds,
-- Appearance) in titled blocks, every setting still reachable, long lists on a page of their
-- own (dungeons), rarely used rows folded, "Defaults for this tab", one-line descriptions;
-- with the gamepad (LB / RB, D-pad, A / B / Y), the mouse and the keyboard (Esc).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, L, Cfg = Ding.Engine, Ding.L, Ding.Config

-- Two dungeons whose quests have different levels (Alpha's 916 above Beta's 456).
Ding.RegisterGuide({ id = "t-settings", title = "Settings", races = { "NightElf" }, steps = {
    { accept = 458 },
    { accept = 916, dungeon = "Alpha" },
    { accept = 456, dungeon = "Beta" },
    { text = "End" },
} })

local function start()
    T.reset({ level = 5 })
    E:SetGuide("t-settings", 1, true); H.flush()
end

local function labels(key)
    Cfg:Open(key); H.flush()
    local found = {}
    for _, row in ipairs(Cfg.TABS[Cfg.TAB[key]].rows) do
        local label = row.opts and row.opts.label or (row.header and row.label:GetText())
        if label then found[label] = row end
    end
    return found
end

T.test("six tabs by intent, in order, each with a key", function()
    start()
    local want = { "guide", "route", "automation", "arrow", "bindings", "appearance" }
    T.eq(#Cfg.TABS, #want)
    for i, key in ipairs(want) do
        T.eq(Cfg.TABS[i].key, key)
        T.eq(Cfg.TAB[key], i)
    end
    Cfg:Open("route"); H.flush()
    T.eq(Cfg.tab, 2, "Open does not take a tab's key")
    H.press("PADRSHOULDER")
    T.eq(Cfg.tab, 3)
    H.press("PADLSHOULDER"); H.press("PADLSHOULDER")
    T.eq(Cfg.tab, 1)
    Cfg:Close(); H.flush()
end)

T.test("every setting is reachable, in the tab of its intent, under small block headers", function()
    start()
    local expect = {
        guide = { L.ACTIVE_GUIDE, L.GUIDE_SECTION, L.RESTART, L.SHOW_GUIDE, L.PREVIEW, L.TAB_DEFAULTS },
        route = { L.HEADER_TRAVEL, L.OPT_HEARTH, L.OPT_DEATHSKIP, L.HEADER_GROUP, L.OPT_ELITES, L.OPT_DUNGEONS,
            L.HEADER_STOPS, L.OPT_TRAINER, L.OPT_FLIGHT, L.OPT_SERVICE, L.TAB_DEFAULTS },
        automation = { L.HEADER_QUESTS, L.AUTO_ACCEPT, L.AUTO_TURNIN, L.CHOOSE_REWARD, L.SKIP_GREY,
            L.HEADER_MERCHANT, L.SELL_GREY, L.AUTO_REPAIR, L.HEADER_EQUIPMENT, L.AUTO_EQUIP, L.HEADER_FLIGHTS,
            L.AUTO_FLY, L.TAB_DEFAULTS },
        arrow = { L.HEADER_ARROW, L.SHOW_ARROW, L.ARROW_STYLE, L.ARROW_SIZE, L.FARM_LOOP_OPT, L.MOVE_ARROW,
            L.HEADER_MAPS, L.WORLD_MARK, L.MINIMAP_PINS, L.HEADER_TARGET, L.MARK_TARGET, L.TAB_DEFAULTS },
        bindings = { L.BIND_CONFIG, L.BIND_NEXT, L.BIND_ITEM, L.BIND_TARGET, L.BIND_CYCLE, L.BUTTON_NAMES, L.KEY_HINTS },
        appearance = { L.HEADER_WINDOW, L.BG_OPACITY, L.WINDOW_SCALE, L.LOCK, L.COMBAT_COMPACT, L.HIDE_INSTANCE,
            L.MOVE_PANEL, L.HEADER_ITEM_BUTTON, L.ITEM_BUTTON, L.MOVE_ITEM, L.HEADER_MINIMAP_SOUND,
            L.MINIMAP_BUTTON, L.SOUND, L.TAB_DEFAULTS },
    }
    for key, list in pairs(expect) do
        local found = labels(key)
        for _, label in ipairs(list) do T.ok(found[label], key .. ": no " .. tostring(label)) end
    end
    -- Folded: the rarely used ones.
    Cfg.unfolded.arrow, Cfg.unfolded.appearance = true, true
    local arrow, appearance = labels("arrow"), labels("appearance")
    for _, label in ipairs({ L.ORIENTATION, L.USE_TOMTOM, L.RESET_POS_ARROW }) do
        T.ok(arrow[label], "arrow, More options: no " .. label)
    end
    for _, label in ipairs({ L.RESET_POS, L.DEBUG, L.TIMING, L.RESET_ALL }) do
        T.ok(appearance[label], "appearance, Advanced: no " .. label)
    end
    Cfg:Close(); H.flush()
    -- The saved keys a tab resets are the existing ones.
    for key, list in pairs(Cfg.TAB_SETTINGS) do
        for _, s in ipairs(list) do
            local section, name = s[1], s[2]
            if section and name ~= "dungeonChoice" then
                T.ok(Ding.DEFAULTS[section][name] ~= nil, key .. ": " .. section .. "." .. name .. " has no default")
            end
        end
    end
end)

T.test("descriptions on one line", function()
    start()
    Cfg.unfolded.arrow, Cfg.unfolded.appearance = true, true
    for _, tab in ipairs(Cfg.TABS) do
        Cfg:Open(tab.key); H.flush()
        for _, row in ipairs(tab.rows) do
            if row.desc then
                local text = H.plain(row.desc:GetText() or "")
                local chars = #(text:gsub("[\128-\191]", ""))
                T.ok(chars * 6 <= row.desc.w + 0.5, ("%s: a description on two lines: %s"):format(tab.key, text))
            end
        end
    end
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- More options
---------------------------------------------------------------------------
T.test("More options: A unfolds and folds, the focus stays on the fold", function()
    start()
    T.ok(not labels("arrow")[L.ORIENTATION], "orientation shown before unfolding")
    H.focusOn(Cfg, function(r) return r.kind == "fold" end, "More options")
    T.eq(Cfg.focus.label:GetText(), L.MORE_OPTIONS)
    H.press("PAD1")
    T.eq(Cfg.focus.kind, "fold", "the focus left the fold")
    T.eq(Cfg.focus.label:GetText(), L.FEWER_OPTIONS)
    H.press("PADDDOWN")
    T.eq(Cfg.focus.opts.label, L.ORIENTATION)
    H.press("PADDUP"); H.press("PAD1")
    local folded = true
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.arrow].rows) do
        if row.opts and row.opts.label == L.ORIENTATION then folded = false end
    end
    T.ok(folded, "A does not fold again")
    -- The mouse: a click.
    local fold = Cfg.focus
    fold.scripts.OnClick(fold, "LeftButton"); H.flush()
    T.ok(Cfg.unfolded.arrow, "a click does not unfold")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- The dungeons' page
---------------------------------------------------------------------------
local function openDungeons()
    Cfg:Open("route"); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.OPT_DUNGEONS end, "dungeons")
    H.press("PAD1")
    T.ok(Cfg.page and Cfg.page.key == "dungeons", "no dungeons page")
end

local function pageChecks()
    local list = {}
    for _, row in ipairs(Cfg.page.rows) do
        if row.kind == "check" then list[#list + 1] = row end
    end
    return list
end

T.test("dungeons: one row with how many are on; A opens their page, sorted by level", function()
    start()
    local row = labels("route")[L.OPT_DUNGEONS]
    T.eq(row.kind, "page")
    T.eq(row.value:GetText(), L.DUNGEONS_OFF)
    openDungeons()
    local checks = pageChecks()
    T.eq(#checks, 2)
    T.ok(H.plain(checks[1].opts.label):find("Beta", 1, true), "not by level: " .. H.plain(checks[1].opts.label))
    T.ok(H.plain(checks[2].opts.label):find("Alpha", 1, true))
    -- All / None at the top.
    T.eq(Cfg.focus.opts.label, L.DUNGEONS_EVERY)
    H.press("PAD1")
    T.eq(Ding.db.ui.dungeons, true)
    for _, c in ipairs(pageChecks()) do T.ok(c.checked, "not all checked") end
    H.focusOn(Cfg, function(r) return r == checks[1] end, "Beta")
    H.press("PAD1")
    T.eq(Ding.db.ui.dungeonChoice.Beta, false)
    -- The help follows the page: B goes back, its chip on the page's title (not on the close
    -- cross, not in the footer).
    T.ok(Cfg.page.rows[1].key:IsShown(), "no B on the page's title")
    T.ok(not Cfg.frame.back:IsShown(), "B on the close cross, on a page")
    for _, item in ipairs(Cfg.frame.help.items) do
        T.ok(not item.label:IsShown() or item.label:GetText() ~= L.HINT_BACK, "\"B Back\" repeats the page's title")
    end
    H.press("PAD2")
    T.eq(Cfg.page, nil, "B does not go back")
    T.ok(Cfg.frame:IsShown(), "B closed the window")
    T.eq(Cfg.focus.opts.label, L.OPT_DUNGEONS, "the focus is not back on the row")
    T.eq(Cfg.focus.value:GetText(), L.DUNGEONS_SOME:format(1, 2))
    Cfg:Close(); H.flush()
end)

T.test("dungeons: back with Esc, a right click, the title; LB / RB leave the page for a tab", function()
    start()
    openDungeons()
    local f = Cfg.frame
    f.scripts.OnKeyDown(f, "ESCAPE"); H.flush()
    T.eq(Cfg.page, nil, "Esc does not go back")
    T.ok(f:IsShown(), "Esc closed the window")
    openDungeons()
    local row = Cfg.focus
    row.scripts.OnClick(row, "RightButton"); H.flush()
    T.eq(Cfg.page, nil, "a right click on a row does not go back")
    openDungeons()
    f.content.scripts.OnMouseUp(f.content, "RightButton"); H.flush()
    T.eq(Cfg.page, nil, "a right click on the page does not go back")
    openDungeons()
    local title = Cfg.page.rows[1]
    title.scripts.OnClick(title, "LeftButton"); H.flush()
    T.eq(Cfg.page, nil, "the title does not go back")
    openDungeons()
    H.press("PADRSHOULDER")
    T.eq(Cfg.page, nil, "RB keeps the page")
    T.eq(Cfg.tab, Cfg.TAB.automation)
    -- Elsewhere, Esc is the game's (the window closes through UISpecialFrames).
    f.scripts.OnKeyDown(f, "ESCAPE"); H.flush()
    T.eq(Cfg.page, nil)
    Cfg:Close(); H.flush()
end)

T.test("dungeons: the mouse help on the page; the page with the mouse", function()
    start()
    H.setGamepadConnected(false)
    Cfg:Open("route"); H.flush()
    local row = labels("route")[L.OPT_DUNGEONS]
    row.scripts.OnClick(row, "LeftButton"); H.flush()
    T.ok(Cfg.page, "a click does not open the page")
    T.eq(Cfg.frame.help.items[1].label:GetText(), L.MOUSE_PAGE_HINT)
    local check = pageChecks()[2]
    check.scripts.OnClick(check, "LeftButton"); H.flush()
    T.eq(Ding.db.ui.dungeonChoice.Alpha, true)
    Cfg:Close(); H.flush()
    H.setGamepadConnected(true)
end)

T.test("a guide without dungeons: one box for the dungeon quests", function()
    T.reset({ level = 5 })
    Ding.RegisterGuidePack({ id = "tnod", title = "No dungeon" })
    Ding.RegisterGuide({ id = "tnod-1", pack = "tnod", title = "No dungeon", races = { "NightElf" },
        steps = { { text = "x" } } })
    E:SetGuide("tnod-1", 1, true); H.flush()
    local row = labels("route")[L.OPT_DUNGEONS]
    T.eq(row.kind, "check")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Defaults for this tab
---------------------------------------------------------------------------
T.test("Defaults for this tab: only that tab's settings, confirmed", function()
    start()
    local ui = Ding.db.ui
    ui.autoAccept, ui.sellGrey, ui.autoFly = false, false, true
    ui.hearth = false    -- the Route tab's
    Cfg:Open("automation"); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.TAB_DEFAULTS end, "defaults")
    H.press("PAD1")
    T.eq(ui.autoAccept, false, "reset without confirmation")
    H.press("PAD1")
    T.eq(ui.autoAccept, true)
    T.eq(ui.sellGrey, true)
    T.eq(ui.autoFly, false)
    T.eq(ui.hearth, false, "another tab's setting reset")
    -- The Route tab's, dungeons included.
    ui.dungeonChoice = { Alpha = true }
    Cfg:TabDefaults("route")
    T.eq(ui.hearth, true)
    T.eq(ui.dungeonChoice, nil)
    Cfg:Close(); H.flush()
end)

T.test("section wrap-up: \"Stay\" chosen, the Guide tab offers the choices again", function()
    start()
    Ding.char.stay = { ["t-settings"] = true }
    local row = labels("guide")[L.WRAP_STAYING]
    T.ok(row, "no wrap-up row")
    row:Activate()
    T.eq(Ding.char.stay["t-settings"], nil)
    T.ok(not labels("guide")[L.WRAP_STAYING], "the row stays")
    Cfg:Close(); H.flush()
end)

T.run()
