-- The setup assistant (UI/Setup.lua; Yendi: a window of text gets "next, next, next" without
-- reading, then "still too many options"): four screens, three choices at most, the current or
-- recommended one selected, shown once per account at the first launch before the Keybinds tab; "Keep the recommended settings" ends it
-- from any screen; the last screen picks the guide. Each choice writes its setting; gamepad
-- (D-pad, A, LB / RB, Y, B: each action once) and mouse; every language has every string and
-- every text fits.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local LEVELING, ZONES, ITEMS = "leveling-a03-night-elf-starter", "nightelf-01-shadowglen", "items-cozy-sleeping-bag"
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { LEVELING, ZONES, ITEMS } })
local Ding, H = T.Ding, T.H
local S, Cfg, G, F, W, L = Ding.Setup, Ding.Config, Ding.Gamepad, Ding.Finder, Ding.ImportWindow, Ding.L
local root = tools .. "/.."

local function pad(on)
    H.setGamepadConnected(on)
    H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
    H.flush()
end

local function closeAll()
    S:Close()
    H.flush()
    if F.frame then F:Close() end
    if W.frame then W:Close() end
    Cfg:Close()
    H.flush()
end

-- The assistant's settings at their defaults, a gamepad plugged in, Ding's Leveling guide.
local function start()
    closeAll()
    T.reset({ level = 1 })
    local ui, panel = Ding.db.ui, Ding.db.panel
    for _, key in ipairs({ "autoAccept", "autoTurnin", "sellGrey", "repair", "chooseReward", "autoFly", "hearth",
        "elites", "dungeons", "deathSkip", "mobIcons", "offers", "buttonStyle" }) do
        ui[key] = Ding.DEFAULTS.ui[key]
    end
    ui.dungeonChoice = nil
    panel.weaponReminder = Ding.DEFAULTS.panel.weaponReminder
    Ding.Engine:SetGuide(LEVELING, 1, true)
    pad(true)
end

-- A new account: nothing done, "Open Ding! settings" not bound; then the login's flow.
local function firstLaunch()
    start()
    local ui = Ding.db.ui
    ui.setupDone, ui.welcomed = false, false
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

-- The current screen's rows shown, and the row whose label is `label`.
local function rows()
    local s, out = S:Current(), {}
    for i = 1, #s.choices do out[i] = s.rows[i] end
    return out
end
local function rowOf(label)
    for i, r in ipairs(rows()) do
        if r.choice.label == label then return r, i end
    end
end

-- Focuses the row `label` with the D-pad, then presses A.
local function pressOn(label)
    local _, i = rowOf(label)
    T.ok(i, "no choice " .. tostring(label))
    for _ = 1, 10 do
        if S.focus[S.screen] == i then break end
        H.press("PADDDOWN")
    end
    T.eq(S.focus[S.screen], i, "the D-pad does not reach " .. label)
    H.press("PAD1")
end

-- Ding's temporary bindings still set by the assistant's frame.
local function bindings()
    local map = H.overrides[S.frame]
    return map and count(map) or 0
end

---------------------------------------------------------------------------
-- First launch
---------------------------------------------------------------------------
T.test("first launch, gamepad: the assistant first, the gamepad preselected, then the Keybinds tab", function()
    firstLaunch()
    T.ok(S:IsShown(), "the setup assistant does not open at the first launch")
    T.eq(S.screen, 1)
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the settings open over the assistant")
    T.ok(bindings() > 0, "no temporary binding for the gamepad")
    local xbox = rowOf(L.SETUP_PAD_XBOX)
    T.ok(xbox.on, "the gamepad in use is not preselected")
    T.eq(xbox.choice.tag, L.SETUP_RECOMMENDED, "the gamepad is not the recommended choice")
    T.eq(rows()[S.focus[1]], xbox, "the focus is not on the selected choice")
    H.press("PAD2")
    T.ok(not S:IsShown(), "B does not close the assistant")
    T.ok(Ding.db.ui.setupDone, "not remembered as done")
    T.ok(Cfg.frame and Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.bindings, "the Keybinds tab does not follow")
    T.ok(Cfg.welcome, "no welcome banner")
    T.eq(Cfg.focus.opts.action, "DING_CONFIG", 'focus not on "Open Ding! settings"')
    closeAll()
    -- The next login: neither again.
    Cfg:Init()
    H.tick(2.5)
    T.ok(not S:IsShown(), "the assistant comes back at the next login")
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the Keybinds tab comes back at the next login")
end)

T.test("first launch, keyboard and mouse: preselected without a gamepad; no Keybinds tab after it", function()
    firstLaunch()
    closeAll()
    Ding.db.ui.setupDone, Ding.db.ui.welcomed = false, false
    pad(false)
    Cfg:Init()
    H.tick(2.5)
    local mouse = rowOf(L.SETUP_MOUSE)
    T.ok(mouse.on and mouse.choice.tag == L.SETUP_RECOMMENDED, "keyboard and mouse not preselected without a gamepad")
    T.eq(count(chipsOn(S.frame.next)) + count(chipsOn(S.frame.keep)), 0, "a gamepad chip without a gamepad")
    T.ok(not S.frame.back:IsShown(), "B by the cross without a gamepad")
    click(S.frame.next)
    T.eq(S.screen, 2, "Next")
    click(S.frame.close)
    T.ok(not S:IsShown(), "the close cross does not close")
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the Keybinds tab opens for a keyboard and mouse player")
    T.ok(Ding.db.ui.welcomed, "the Keybinds tab would come at the next login")
    pad(true)
end)

T.test("how you play: the PlayStation buttons change the button names at once; Xbox back", function()
    start()
    S:Open()
    pressOn(L.SETUP_PAD_PS)
    T.eq(Ding.db.ui.buttonStyle, "ps", "PlayStation not set")
    T.ok(rowOf(L.SETUP_PAD_PS).on and not rowOf(L.SETUP_PAD_XBOX).on, "one choice at a time")
    pressOn(L.SETUP_PAD_XBOX)
    T.eq(Ding.db.ui.buttonStyle, "xbox")
    -- Keyboard and mouse leaves the button names alone.
    pressOn(L.SETUP_MOUSE)
    T.eq(Ding.db.ui.buttonStyle, "xbox")
    T.ok(rowOf(L.SETUP_MOUSE).on, "keyboard and mouse not selected")
    closeAll()
end)

---------------------------------------------------------------------------
-- Each choice writes its setting
---------------------------------------------------------------------------
local CHECKS = {
    { 2, "SETUP_AUTO_QUESTS", function(ui) return ui.autoAccept and ui.autoTurnin end },
    { 2, "SETUP_AUTO_SELL", function(ui) return ui.sellGrey end },
    { 2, "SETUP_AUTO_REPAIR", function(ui) return ui.repair end },
    { 3, "SETUP_ROUTE_HEARTH", function(ui) return ui.hearth end },
    { 3, "SETUP_ROUTE_GROUP", function(ui) return ui.elites and ui.dungeons end },
    { 3, "SETUP_ROUTE_DEATHSKIP", function(ui) return ui.deathSkip end },
}

T.test("each choice writes its setting at once, both ways, with A and with a click", function()
    start()
    S:Open()
    for _, c in ipairs(CHECKS) do
        local screen, key, value = c[1], c[2], c[3]
        S:Show(screen)
        local before = value(Ding.db.ui) and true or false
        T.eq(rowOf(L[key]).on, before, key .. ": the box does not show the setting")
        pressOn(L[key])
        T.eq(value(Ding.db.ui) and true or false, not before, key .. ": A does not change the setting")
        T.eq(rowOf(L[key]).on, not before, key .. ": the box does not follow")
        click(rowOf(L[key]))
        T.eq(value(Ding.db.ui) and true or false, before, key .. ": a click does not change it back")
    end
    closeAll()
end)

T.test("quests: one choice for accepting and turning in; group quests: elites and every dungeon together", function()
    start()
    Ding.db.ui.autoTurnin = false
    S:Open(2)
    T.ok(not rowOf(L.SETUP_AUTO_QUESTS).on, "shown on with turning in off")
    pressOn(L.SETUP_AUTO_QUESTS)
    T.ok(Ding.db.ui.autoAccept and Ding.db.ui.autoTurnin, "both not on")
    S:Show(3)
    Ding.db.ui.elites, Ding.db.ui.dungeons, Ding.db.ui.dungeonChoice = true, false, { Deadmines = true }
    S:Show(3)
    T.ok(not rowOf(L.SETUP_ROUTE_GROUP).on, "shown on with the dungeons off")
    pressOn(L.SETUP_ROUTE_GROUP)
    T.ok(Ding.db.ui.elites and Ding.db.ui.dungeons and Ding.db.ui.dungeonChoice == nil,
        "group quests: not both on, or the choices per dungeon stay")
    pressOn(L.SETUP_ROUTE_GROUP)
    T.ok(not Ding.db.ui.elites and not Ding.db.ui.dungeons, "group quests: not both off")
    closeAll()
end)

T.test("few choices: three at most on a settings screen; the help on screen and the rarer automations are not asked", function()
    start()
    S:Open()
    for screen = 1, #S.SCREENS - 1 do
        S:Show(screen)
        T.ok(#rows() <= 3, ("screen %d: %d choices"):format(screen, #rows()))
    end
    T.eq(#S.SCREENS, 4, "screens")
    for _, def in ipairs(S.SCREENS) do
        for _, choice in ipairs(def.choices()) do
            T.ok(choice.id ~= "mobs" and choice.id ~= "why" and choice.id ~= "offers" and choice.id ~= "weapon"
                and choice.id ~= "reward" and choice.id ~= "fly", "asked: " .. tostring(choice.id))
        end
    end
    closeAll()
end)

---------------------------------------------------------------------------
-- Keep the recommended settings, close
---------------------------------------------------------------------------
-- Settings away from the defaults, as an account that played with them: some the assistant
-- asks, some it leaves to the settings (reward, monster marks, weapon reminder).
local function customize()
    local ui = Ding.db.ui
    ui.chooseReward, ui.elites, ui.mobIcons, ui.sellGrey, ui.deathSkip = true, true, false, false, true
    ui.dungeonChoice = { Deadmines = true }
    Ding.db.panel.weaponReminder = false
end

T.test("Keep the recommended settings, from every screen: the defaults, but for what was changed here", function()
    for screen = 1, #S.SCREENS do
        start()
        customize()
        S:Open(2)
        pressOn(L.SETUP_AUTO_REPAIR)        -- changed here: kept
        T.ok(not Ding.db.ui.repair, "repair not off")
        S:Show(screen)
        T.ok(chipsOn(S.frame.keep).PAD4, "Y not on Keep the recommended settings")
        H.press("PAD4")
        T.ok(not S:IsShown(), screen .. ": Y does not end the assistant")
        local ui = Ding.db.ui
        T.ok(not ui.repair, screen .. ": a choice made here went back to its default")
        T.ok(not ui.elites and ui.sellGrey and not ui.deathSkip, screen .. ": not back to the defaults")
        T.ok(ui.dungeonChoice == nil, screen .. ": the choices per dungeon stay")
        -- What the assistant does not ask stays as the player set it.
        T.ok(ui.chooseReward and not ui.mobIcons and not Ding.db.panel.weaponReminder,
            screen .. ": a setting the assistant does not ask changed")
        T.eq(Ding.Engine.guide.id, LEVELING, screen .. ": the guide changed")
    end
    -- With the mouse: the button.
    start()
    customize()
    S:Open(3)
    click(S.frame.keep)
    T.ok(not S:IsShown() and not Ding.db.ui.elites, "the button does not keep the recommended settings")
end)

T.test("B, Start, the close cross or Esc close it as it is: the settings stay as they are", function()
    T.ok(table.concat(UISpecialFrames, ","):find("DingSetup", 1, true), "Esc would not close the assistant")
    for _, how in ipairs({ "PAD2", "PADFORWARD", "cross", "esc" }) do
        start()
        customize()
        Ding.db.ui.setupDone = false
        S:Open(3)
        if how == "cross" then
            click(S.frame.close)
        elseif how == "esc" then
            S.frame:Hide()  -- what the game's UISpecialFrames does
            H.flush()
        else
            H.press(how)
        end
        T.ok(not S:IsShown(), how .. ": not closed")
        T.ok(Ding.db.ui.setupDone, how .. ": not remembered as done")
        T.ok(Ding.db.ui.elites and not Ding.db.ui.sellGrey and Ding.db.ui.deathSkip, how .. ": settings changed")
        T.eq(bindings(), 0, how .. ": temporary bindings left")
    end
end)

---------------------------------------------------------------------------
-- What to do first
---------------------------------------------------------------------------
T.test("what first: the packs (Leveling recommended, the current one checked) and taking it up where I am", function()
    start()
    if not Ding:GetGuidePack("test-pack") then
        Ding.RegisterGuidePack({ id = "test-pack", title = "Test pack", author = "Someone" })
        Ding.RegisterGuide({ id = "test-pack-1", pack = "test-pack", title = "Test", minLevel = 1, maxLevel = 10,
            steps = { { accept = 456 }, { turnin = 456 } } })
    end
    S:Open(4)
    local leveling, zones, items = Ding:GetGuidePack(Ding.BUILTIN_PACK), Ding:GetGuidePack(Ding.ZONES_PACK),
        Ding:GetGuidePack(Ding.ITEMS_PACK)
    local r = rowOf(leveling.title)
    T.ok(r and r.on and r.choice.tag == L.SETUP_RECOMMENDED, "Leveling not recommended and checked")
    T.eq(rows()[S.focus[4]], r, "the focus is not on the current guide")
    T.ok(rowOf(zones.title) and not rowOf(zones.title).on, "Zones missing")
    T.ok(rowOf(items.title).choice.sub:find(Ding:GetGuide(ITEMS).title, 1, true), "the item pack does not name its item")
    T.ok(rowOf("Test pack").choice.sub:find("Someone", 1, true), "a community pack without its author")
    T.ok(rowOf(L.SETUP_RESUME), "no way to take the guide up where I am")
    T.eq(S.frame.next.text:GetText(), L.SETUP_DONE, "the last screen's button")
    -- A pick: that pack, the end.
    pressOn(zones.title)
    T.ok(not S:IsShown(), "a pick does not end the assistant")
    T.eq(Ding.Engine.guide.pack, Ding.ZONES_PACK, "Zones not taken")
    -- A click on another.
    S:Open(4)
    click(rowOf(leveling.title))
    T.eq(Ding.Engine.guide.pack, Ding.BUILTIN_PACK, "a click does not take Leveling")
    -- Where I am: the guide taken up again.
    local reset, called = Ding.Engine.Reset, false
    Ding.Engine.Reset = function() called = true end
    S:Open(4)
    pressOn(L.SETUP_RESUME)
    Ding.Engine.Reset = reset
    T.ok(called and not S:IsShown(), "taking the guide up where I am does not run")
    -- Finish keeps the guide.
    S:Open(4)
    H.press("PADRSHOULDER")
    T.ok(not S:IsShown(), "RB on the last screen does not finish")
    T.eq(Ding.Engine.guide.pack, Ding.BUILTIN_PACK, "Finish changed the guide")
end)

---------------------------------------------------------------------------
-- Navigation, reopening, other windows, combat
---------------------------------------------------------------------------
T.test("gamepad, each action once: A on the focused choice, LB / RB, Y, B; the D-pad between the choices", function()
    start()
    S:Open()
    local f = S.frame
    local function check(where, prev)
        local focused = rows()[S.focus[S.screen]]
        for _, r in ipairs(rows()) do
            T.eq(r.key:IsShown(), r == focused, where .. ": A not on the focused choice only")
            T.eq(r.focus.ring:IsShown(), r == focused, where .. ": the focus ring")
        end
        T.ok(chipsOn(f.keep).PAD4 and count(chipsOn(f.keep)) == 1, where .. ": Y on Keep")
        T.ok(chipsOn(f.next).PADRSHOULDER and count(chipsOn(f.next)) == 1, where .. ": RB on Next")
        T.eq(chipsOn(f.prev).PADLSHOULDER == true, prev, where .. ": LB on Previous")
        T.ok(f.back:IsShown(), where .. ": B by the close cross")
    end
    check("first screen", false)
    T.ok(not f.prev.enabled, "Previous on the first screen")
    H.press("PADDDOWN")
    T.eq(S.focus[1], 2, "D-pad down")
    check("first screen, second choice", false)
    H.press("PADDUP"); H.press("PADDUP")
    T.eq(S.focus[1], #rows(), "D-pad up from the first choice goes around")
    H.press("PADRSHOULDER")
    T.eq(S.screen, 2, "RB")
    check("second screen", true)
    H.press("PADLSHOULDER")
    T.eq(S.screen, 1, "LB")
    T.eq(S.focus[1], 3, "the screen's focus not kept")
    H.press("PADLSHOULDER")
    T.eq(S.screen, 1, "LB before the first screen")
    -- The buttons keep their width from a screen to the next.
    local widths = { f.prev:GetWidth(), f.next:GetWidth() }
    S:Show(#S.SCREENS)
    T.eq(f.prev:GetWidth(), widths[1], "Previous changed width")
    T.eq(f.next:GetWidth(), widths[2], "Next changed width")
    closeAll()
end)

T.test("mouse: hover focuses a choice, the dots and Previous / Next change screens; plugged in while open", function()
    start()
    pad(false)
    S:Open()
    local f = S.frame
    local second = rows()[2]
    second.scripts.OnEnter(second)
    T.eq(S.focus[1], 2, "hover does not focus")
    T.ok(not second.key:IsShown(), "an A chip without a gamepad")
    click(f.dots[4])
    T.eq(S.screen, 4, "a dot")
    click(f.prev)
    T.eq(S.screen, 3, "Previous")
    click(f.next)
    T.eq(S.screen, 4, "Next")
    pad(true)
    T.ok(chipsOn(f.prev).PADLSHOULDER and chipsOn(f.next).PADRSHOULDER and chipsOn(f.keep).PAD4,
        "chips missing once plugged in")
    closeAll()
end)

T.test("/ding intro and the Guide tab's row reopen it; closed, the settings come back on that row", function()
    start()
    SlashCmdList.DING("intro")
    T.ok(S:IsShown() and S.screen == 1, "/ding intro does not open the first screen")
    closeAll()
    T.ok(L.HELP:find("/ding intro", 1, true), "/ding intro missing from the help")
    Cfg:Open("guide", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.SETUP_ROW end, "setup row")
    local row = Cfg.focus
    T.eq(row.button.text:GetText(), L.SETUP_BTN)
    H.press("PAD1")
    T.ok(S:IsShown() and not Cfg.frame:IsShown(), "the row does not open the assistant")
    H.press("PAD2")
    T.ok(Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.guide and Cfg.focus == row, "the settings do not come back on the row")
    closeAll()
end)

T.test("another Ding window takes over: the assistant closes, done, and the Keybinds tab waits", function()
    for _, open in ipairs({
        function() Cfg:Open("arrow") end,
        function() F:Open(1) end,
        function() W:Open("import") end,
    }) do
        firstLaunch()
        T.ok(S:IsShown(), "no assistant")
        open()
        H.flush()
        T.ok(not S:IsShown(), "the assistant stays under another window")
        T.ok(Ding.db.ui.setupDone, "not remembered as done")
        T.ok(not Ding.db.ui.welcomed, "the Keybinds tab came over the window opened")
        closeAll()
    end
    -- The guide's focus mode does not take the gamepad from it.
    start()
    S:Open()
    Ding.Panel:StartFocus()
    T.ok(not Ding.Panel.focusing and H.overrides[S.frame] ~= nil, "focus mode over the assistant")
    closeAll()
end)

T.test("a fight: the first launch's assistant closes, then comes back where it was, its choices kept", function()
    firstLaunch()
    H.press("PADRSHOULDER")
    pressOn(L.SETUP_AUTO_SELL)
    T.ok(not Ding.db.ui.sellGrey)
    -- The event comes just before the lockdown, while bindings can still be cleared.
    H.fire("PLAYER_REGEN_DISABLED")
    H.setCombat(true)
    H.flush()
    T.ok(not S:IsShown(), "still open in combat")
    T.eq(bindings(), 0, "temporary bindings kept in combat")
    T.ok(not Ding.db.ui.setupDone, "counted as done")
    T.ok(not S:Open(), "opened in combat")
    H.setCombat(false)
    H.fire("PLAYER_REGEN_ENABLED")
    H.tick(1.5)
    T.ok(S:IsShown() and S.screen == 2, "not back on its screen after the fight")
    H.press("PAD4")
    T.ok(not Ding.db.ui.sellGrey, "the choice made before the fight was not kept")
    T.ok(Cfg.frame and Cfg.frame:IsShown() and Cfg.tab == Cfg.TAB.bindings, "the Keybinds tab does not follow")
    closeAll()
    -- Reopened by hand, a fight only closes it.
    S:Open(2)
    H.fire("PLAYER_REGEN_DISABLED")
    H.setCombat(true)
    H.setCombat(false)
    H.fire("PLAYER_REGEN_ENABLED")
    H.tick(1.5)
    T.ok(not S:IsShown(), "reopened by hand: back after a fight")
end)

T.test("restoring all defaults does not run it again; own frames only", function()
    start()
    Ding:ResetSettings()
    T.ok(Ding.db.ui.setupDone and Ding.db.ui.welcomed, "the defaults run the first launch again")
    S:Open()
    for _, w in ipairs(H.widgets) do
        local p = w
        while p and p ~= S.frame do p = p.parent end
        T.ok(not (p and w.protected), "a protected frame in the assistant")
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

T.test("every language: every string, texts never cut, nothing overlaps, a small screen", function()
    start()
    local own = {}
    for k, v in pairs(L) do own[k] = v end
    local english = loadStrings("enUS")
    local languages = { "enUS" }
    for _, name in ipairs(dofile(tools .. "/guide_texts.lua").LOCALES) do languages[#languages + 1] = name end
    for _, name in ipairs(languages) do
        local strings = loadStrings(name)
        for key in pairs(english) do
            if key:find("^SETUP_") or key == "HEADER_HELP" then
                T.ok(type(strings[key]) == "string" and strings[key] ~= "", name .. ": " .. key .. " missing")
                T.ok(name == "enUS" or key == "SETUP_LEVELS" or strings[key] ~= english[key],
                    name .. ": " .. key .. " left in English")
            end
        end
        useStrings(strings)
        for _, on in ipairs({ true, false }) do
            pad(on)
            local where = name .. (on and ", gamepad" or ", mouse")
            S:Open()
            local f = S.frame
            local height = f:GetHeight()
            T.ok(height <= 600, ("%s: %d high, too tall for a small screen"):format(where, height))
            for screen = 1, #S.SCREENS do
                S:Show(screen)
                local s = S:Current()
                T.ok((s.heading:GetText() or "") ~= "" and (s.text:GetText() or "") ~= "", where .. ": an empty screen")
                T.ok(not s.heading:IsTruncated() and not s.text:IsTruncated(), ("%s: screen %d cut"):format(where, screen))
                T.ok(s:GetHeight() <= height - 32 - 1 - 1 - 81, ("%s: screen %d taller than the window"):format(where, screen))
                for _, r in ipairs(rows()) do
                    T.ok(not r.label:IsTruncated() and not r.sub:IsTruncated(), where .. ": a choice cut")
                    local need = 8 + r.label:GetStringHeight() + (r.sub:IsShown() and 2 + r.sub:GetStringHeight() or 0) + 8
                    T.ok(r:GetHeight() >= need, ("%s: the choice %q needs %d"):format(where, r.choice.label, need))
                end
                T.eq(f:GetHeight(), height, where .. ": the window changes height with the screen")
                local dotsLeft = (f:GetWidth() - f.dots:GetWidth()) / 2
                T.ok(12 + f.prev:GetWidth() + 8 <= dotsLeft, where .. ": Previous runs into the dots")
                T.ok(12 + f.next:GetWidth() + 8 <= dotsLeft, where .. ": Next runs into the dots")
                T.ok(f.keep.text:GetStringWidth() + 24 + 28 <= f.keep:GetWidth(), where .. ": Keep does not fit")
            end
            closeAll()
        end
    end
    useStrings(own)
    pad(true)
end)

T.run()
