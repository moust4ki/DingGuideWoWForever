-- The presentation (UI/Intro.lua; Yendi, in game: lost on a long trip, on quests the NPCs offer
-- that the guide does not take, on a bank step): six pages shown once per account at the first
-- launch, then the Keybinds tab; skipped at any page; again from the Guide tab or /ding intro.
-- Gamepad: A goes on, LB / RB and the D-pad change pages, B closes, each action once (chips on
-- the buttons, no hint bar); mouse: the buttons, the dots, Esc. Every language has every page,
-- and the window fits the longest one.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local I, Cfg, G, F, W, L = Ding.Intro, Ding.Config, Ding.Gamepad, Ding.Finder, Ding.ImportWindow, Ding.L
local root = tools .. "/.."

local function pad(on)
    H.setGamepadConnected(on)
    H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
    H.flush()
end

local function closeAll()
    I:Close()
    H.flush()
    if F.frame then F:Close() end
    if W.frame then W:Close() end
    Cfg:Close()
    H.flush()
end

local function start()
    closeAll()
    T.reset({ level = 1 })
    pad(true)
end

-- A new account: nothing seen, "Open Ding! settings" not bound; then the login's flow.
local function firstLaunch()
    start()
    local ui = Ding.db.ui
    ui.introSeen, ui.welcomed = false, false
    G:Unbind("DING_CONFIG")
    Cfg:Init()
    H.tick(2.5)
end

local function click(frame, button)
    frame.scripts.OnClick(frame, button or "LeftButton")
    H.flush()
end

-- The keys of the chips shown on a button (UI.ButtonKeys).
local function chipsOn(b)
    local keys = {}
    for _, g in ipairs(b.keyGlyphs or {}) do
        if g:IsShown() then keys[g.padKey] = true end
    end
    return keys
end

local function count(t)
    local n = 0
    for _ in pairs(t) do n = n + 1 end
    return n
end

-- Ding's temporary bindings still set by the presentation's frame.
local function introBindings()
    local map = H.overrides[I.frame]
    return map and count(map) or 0
end

---------------------------------------------------------------------------
-- First launch
---------------------------------------------------------------------------
T.test("first launch: the presentation first, then the Keybinds tab with its banner", function()
    firstLaunch()
    T.ok(I:IsShown(), "the presentation does not open at the first launch")
    T.eq(I.page, 1, "first page")
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the settings open over the presentation")
    T.ok(introBindings() > 0, "no temporary binding for the gamepad")
    H.press("PAD2")
    T.ok(not I:IsShown(), "B does not close the presentation")
    T.ok(Ding.db.ui.introSeen, "the presentation is not remembered as seen")
    T.ok(Cfg.frame and Cfg.frame:IsShown(), "the Keybinds tab does not follow")
    T.eq(Cfg.tab, Cfg.TAB.bindings)
    T.ok(Cfg.welcome, "no welcome banner")
    T.eq(Cfg.focus.opts.action, "DING_CONFIG", 'focus not on "Open Ding! settings"')
    T.ok(Ding.db.ui.welcomed, "first launch not remembered")
    closeAll()
    -- The next login: neither again.
    Cfg:Init()
    H.tick(2.5)
    T.ok(not I:IsShown(), "the presentation comes back at the next login")
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the Keybinds tab comes back at the next login")
end)

T.test("first launch, read to the end: A on every page, the last one closes; then the Keybinds tab", function()
    firstLaunch()
    for page = 1, #I.PAGES do
        T.eq(I.page, page, "A does not go to the next page")
        H.press("PAD1")
    end
    T.ok(not I:IsShown(), "A on the last page does not close")
    T.ok(Cfg.frame and Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.bindings, "the Keybinds tab does not follow")
    closeAll()
end)

T.test("an account that saw it, or bound the settings: no presentation; the Keybinds tab as before", function()
    firstLaunch()
    closeAll()
    -- Seen, but the Keybinds tab never shown (closed in combat at the time): it still comes.
    Ding.db.ui.welcomed = false
    Cfg:Init()
    H.tick(2.5)
    T.ok(not I:IsShown(), "the presentation shows twice")
    T.ok(Cfg.frame and Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.bindings, "the Keybinds tab does not come")
    closeAll()
    -- Restoring all defaults does not show it again.
    Ding:ResetSettings()
    T.ok(Ding.db.ui.introSeen and Ding.db.ui.welcomed, "the defaults show the first launch again")
end)

---------------------------------------------------------------------------
-- Skipping, reopening
---------------------------------------------------------------------------
T.test("skipped at any page: B, Start, the close cross or Esc; seen, the bindings gone", function()
    T.ok(table.concat(UISpecialFrames, ","):find("DingIntro", 1, true), "Esc would not close the presentation")
    for _, how in ipairs({ "PAD2", "PADFORWARD", "cross", "esc" }) do
        start()
        Ding.db.ui.introSeen = false
        I:Open(3)
        T.eq(I.page, 3)
        if how == "cross" then
            click(I.frame.close)
        elseif how == "esc" then
            I.frame:Hide()  -- what the game's UISpecialFrames does
            H.flush()
        else
            H.press(how)
        end
        T.ok(not I:IsShown(), how .. ": not closed")
        T.ok(Ding.db.ui.introSeen, how .. ": not remembered as seen")
        T.eq(introBindings(), 0, how .. ": temporary bindings left")
    end
end)

T.test("/ding intro and the Guide tab's row reopen it; closed, the settings come back on that row", function()
    start()
    SlashCmdList.DING("intro")
    T.ok(I:IsShown() and I.page == 1, "/ding intro does not open the first page")
    closeAll()
    T.ok(L.HELP:find("/ding intro", 1, true), "/ding intro missing from the help")

    Cfg:Open("guide", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.INTRO_ROW end, "intro row")
    local row = Cfg.focus
    T.eq(row.button.text:GetText(), L.INTRO_BTN)
    H.press("PAD1")
    T.ok(I:IsShown(), "the row does not open the presentation")
    T.ok(not Cfg.frame:IsShown(), "the settings stay open under it")
    H.press("PADRSHOULDER")
    H.press("PAD2")
    T.ok(not I:IsShown(), "B does not close it")
    T.ok(Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.guide, "the settings do not come back on the Guide tab")
    T.eq(Cfg.focus, row, "the focus is not back on the row")
    -- With the mouse: a click on the row.
    closeAll()
    pad(false)
    Cfg:Open("guide"); H.flush()
    click(Cfg.focus)
    T.ok(I:IsShown(), "a click on the row does not open it")
    closeAll()
    pad(true)
end)

T.test("another Ding window takes over: the presentation closes, seen, and the Keybinds tab waits", function()
    for _, open in ipairs({
        function() Cfg:Open("arrow") end,
        function() F:Open(1) end,
        function() W:Open("import") end,
    }) do
        firstLaunch()
        T.ok(I:IsShown(), "no presentation")
        open()
        H.flush()
        T.ok(not I:IsShown(), "the presentation stays under another window")
        T.ok(Ding.db.ui.introSeen, "not remembered as seen")
        T.ok(not Ding.db.ui.welcomed, "the Keybinds tab came over the window opened")
        closeAll()
    end
end)

T.test("a fight: the first launch's presentation closes, then comes back where it was", function()
    firstLaunch()
    H.press("PAD1"); H.press("PAD1")
    T.eq(I.page, 3)
    -- The event comes just before the lockdown, while bindings can still be cleared.
    H.fire("PLAYER_REGEN_DISABLED")
    H.setCombat(true)
    H.flush()
    T.ok(not I:IsShown(), "still open in combat")
    T.eq(introBindings(), 0, "temporary bindings kept in combat")
    T.ok(not Ding.db.ui.introSeen, "counted as seen")
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the Keybinds tab came in combat")
    T.ok(not I:Open(1), "opened in combat")
    H.setCombat(false)
    H.fire("PLAYER_REGEN_ENABLED")
    H.tick(1.5)
    T.ok(I:IsShown(), "not back after the fight")
    T.eq(I.page, 3, "not back on its page")
    H.press("PAD2")
    T.ok(Cfg.frame and Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.bindings, "the Keybinds tab does not follow")
    closeAll()
    -- Reopened by hand, a fight only closes it.
    I:Open(2)
    H.fire("PLAYER_REGEN_DISABLED")
    H.setCombat(true)
    H.setCombat(false)
    H.fire("PLAYER_REGEN_ENABLED")
    H.tick(1.5)
    T.ok(not I:IsShown(), "reopened by hand: back after a fight")
end)

---------------------------------------------------------------------------
-- Pages, gamepad and mouse
---------------------------------------------------------------------------
T.test("gamepad: RB / LB and the D-pad change pages, within the first and the last", function()
    start()
    I:Open()
    H.press("PADRSHOULDER")
    T.eq(I.page, 2, "RB")
    H.press("PADDRIGHT")
    T.eq(I.page, 3, "D-pad right")
    H.press("PADLSHOULDER")
    T.eq(I.page, 2, "LB")
    H.press("PADDLEFT")
    H.press("PADDLEFT")
    T.eq(I.page, 1, "D-pad left, past the first page")
    for _ = 1, 10 do H.press("PADRSHOULDER") end
    T.eq(I.page, #I.PAGES, "RB past the last page")
    T.ok(I:IsShown(), "RB on the last page closes")
    closeAll()
end)

T.test("gamepad, each action once: A and RB on Next, LB on Previous, B by the cross; no hint bar", function()
    start()
    I:Open()
    local f = I.frame
    local function check(where, prev, nextKeys)
        local p, n = chipsOn(f.prev), chipsOn(f.next)
        T.eq(count(p), #prev, where .. ": chips on Previous")
        for _, key in ipairs(prev) do T.ok(p[key], where .. ": " .. key .. " not on Previous") end
        T.eq(count(n), #nextKeys, where .. ": chips on Next")
        for _, key in ipairs(nextKeys) do T.ok(n[key], where .. ": " .. key .. " not on Next") end
        T.ok(f.back:IsShown(), where .. ": no B by the close cross")
        T.ok(f.next.focus.ring:IsShown(), where .. ": Next has no focus ring")
        T.ok(not f.hints, where .. ": a hint bar")
    end
    check("first page", {}, { "PAD1", "PADRSHOULDER" })
    T.ok(not f.prev.enabled, "Previous enabled on the first page")
    T.eq(f.prev.text:GetText(), L.INTRO_PREV)
    T.eq(f.next.text:GetText(), L.INTRO_NEXT)
    H.press("PADRSHOULDER")
    check("second page", { "PADLSHOULDER" }, { "PAD1", "PADRSHOULDER" })
    I:Show(#I.PAGES)
    check("last page", { "PADLSHOULDER" }, { "PAD1" })
    T.eq(f.next.text:GetText(), L.INTRO_DONE)
    -- The buttons keep their width from a page to the next.
    local widths = { f.prev:GetWidth(), f.next:GetWidth() }
    I:Show(1)
    T.eq(f.prev:GetWidth(), widths[1], "Previous changed width")
    T.eq(f.next:GetWidth(), widths[2], "Next changed width")
    closeAll()
end)

T.test("mouse: Next, Previous and the dots; no chip, no focus ring; unplugged or plugged in while open", function()
    start()
    I:Open()
    local f = I.frame
    pad(false)
    T.eq(count(chipsOn(f.prev)) + count(chipsOn(f.next)), 0, "a gamepad chip without a gamepad")
    T.ok(not f.back:IsShown(), "B by the cross without a gamepad")
    T.ok(not f.next.focus.ring:IsShown(), "a focus ring without a gamepad")
    click(f.prev)
    T.eq(I.page, 1, "Previous works on the first page")
    click(f.next)
    T.eq(I.page, 2, "Next")
    click(f.prev)
    T.eq(I.page, 1, "Previous")
    click(f.dots[5])
    T.eq(I.page, 5, "a dot")
    T.eq(f.dots[5].icon.vertexColor[1], Ding.UI.C.accent[1], "the current dot is not the accent")
    click(f.dots[#I.PAGES])
    click(f.next)
    T.ok(not I:IsShown(), "Next on the last page does not close")
    I:Open(2)
    pad(true)
    T.ok(chipsOn(f.prev).PADLSHOULDER and chipsOn(f.next).PAD1, "chips missing once plugged in")
    closeAll()
end)

T.test("own frames only: nothing protected, opening keeps one Ding window", function()
    start()
    F:Open(1); H.flush()
    I:Open()
    T.ok(not F.frame:IsShown(), "the directory stays open under it")
    -- The guide's focus mode would take the gamepad from it.
    Ding.Panel:StartFocus()
    T.ok(not Ding.Panel.focusing, "focus mode starts over the presentation")
    T.ok(H.overrides[I.frame] ~= nil, "the presentation lost its gamepad")
    T.ok(not I.frame.protected, "a protected frame")
    for _, w in ipairs(H.widgets) do
        local p = w
        while p and p ~= I.frame do p = p.parent end
        T.ok(not (p and w.protected), "a protected frame in the presentation")
    end
    closeAll()
end)

---------------------------------------------------------------------------
-- Every language
---------------------------------------------------------------------------
local function loadStrings(name)
    local ns, getLocale = {}, _G.GetLocale
    _G.GetLocale = function() return name end
    local ok, err = pcall(assert(loadfile(root .. "/Ding/Locales/" .. name .. ".lua")), "Ding", ns)
    _G.GetLocale = getLocale
    assert(ok, err)
    return ns.Locales[name]
end

-- Ding.L takes the strings of `strings` (the window reads it when it lays out).
local function useStrings(strings)
    local keys = {}
    for k in pairs(L) do keys[#keys + 1] = k end
    for _, k in ipairs(keys) do L[k] = nil end
    for k, v in pairs(strings) do L[k] = v end
end

local KEYS = { "INTRO_TITLE", "INTRO_PREV", "INTRO_NEXT", "INTRO_DONE", "HEADER_HELP", "INTRO_ROW",
    "INTRO_ROW_DESC", "INTRO_BTN" }

T.test("every language: every page and button, texts never cut, nothing overlaps, a small screen", function()
    start()
    local own = {}
    for k, v in pairs(L) do own[k] = v end
    local languages = { "enUS" }
    for _, name in ipairs(dofile(tools .. "/guide_texts.lua").LOCALES) do languages[#languages + 1] = name end
    for _, name in ipairs(languages) do
        local strings = loadStrings(name)
        for _, key in ipairs(KEYS) do
            T.ok(type(strings[key]) == "string" and strings[key] ~= "", name .. ": " .. key .. " missing")
        end
        useStrings(strings)
        for _, on in ipairs({ true, false }) do
            pad(on)
            local where = name .. (on and ", gamepad" or ", mouse")
            I:Open()
            local f = I.frame
            local height = f:GetHeight()
            T.ok(height <= 560, ("%s: %d high, too tall for a small screen"):format(where, height))
            for page, texts in ipairs(I.PAGES) do
                local title, text = texts()
                T.ok(type(title) == "string" and title ~= "" and type(text) == "string" and text ~= "",
                    ("%s: page %d has no title or text"):format(where, page))
                I:Show(page)
                T.eq(f.heading:GetText(), title)
                T.ok(not f.text:IsTruncated() and not f.heading:IsTruncated(), ("%s: page %d cut"):format(where, page))
                local need = 32 + 1 + 20 + f.heading:GetStringHeight() + 8 + f.text:GetStringHeight() + 20 + 1 + 48
                T.ok(height >= need, ("%s: page %d needs %d, the window has %d"):format(where, page, need, height))
                T.eq(f:GetHeight(), height, where .. ": the window changes height with the page")
                -- Previous and Next stay clear of the dots, 8 apart at least.
                local dotsLeft = (f:GetWidth() - f.dots:GetWidth()) / 2
                T.ok(12 + f.prev:GetWidth() + 8 <= dotsLeft, ("%s: Previous runs into the dots"):format(where))
                T.ok(12 + f.next:GetWidth() + 8 <= dotsLeft, ("%s: Next runs into the dots"):format(where))
            end
            closeAll()
        end
    end
    useStrings(own)
    pad(true)
end)

T.test("every page is in every language, translated, with the English page's paragraphs and lines", function()
    local own = {}
    for k, v in pairs(L) do own[k] = v end
    local english = loadStrings("enUS")
    for _, name in ipairs(dofile(tools .. "/guide_texts.lua").LOCALES) do
        local strings = loadStrings(name)
        for page = 1, #I.PAGES do
            useStrings(strings)
            local title, text = I.PAGES[page]()
            useStrings(english)
            local enTitle, enText = I.PAGES[page]()
            T.ok(title and text, ("%s: page %d missing"):format(name, page))
            T.ok(title ~= enTitle and text ~= enText, ("%s: page %d left in English"):format(name, page))
            -- The same paragraphs and lines as the English page.
            local _, lines = text:gsub("\n", "")
            local _, enLines = enText:gsub("\n", "")
            T.eq(lines, enLines, ("%s: page %d lines"):format(name, page))
        end
    end
    useStrings(own)
end)

T.run()
