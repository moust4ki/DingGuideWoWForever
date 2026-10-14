-- Ding's gamepad chords in play (Gamepad.lua, "Chords in play") and its windows' own reading of
-- the gamepad. Reported in game, Easy Controller on: LB + Up could not be bound, LT + Start (a
-- game binding) did nothing, and in focus mode the D-pad cast the gamepad bar's spells. A chord
-- is watched like Easy Controller's RB + Down; while its first button is held a frame of Ding's
-- keeps its second button from the game. The mocked client goes through those frames first, then
-- the override bindings, the game's gamepad interface, the saved bindings (H.gamepadDown).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local Cfg, G, L, P, E = Ding.Config, Ding.Gamepad, Ding.L, Ding.Panel, Ding.Engine

-- The game's gamepad interface on, its bar on the D-pad and the face buttons.
local BAR = { PADDUP = "GAMEPADACTIONBUTTON5", PADDDOWN = "GAMEPADACTIONBUTTON6", PAD1 = "GAMEPADACTIONBUTTON1",
    PADRSHOULDER = "GAMEPADRIGHTTARGETMODIFIER", PADLSHOULDER = "GAMEPADLEFTTARGETMODIFIER" }

local function start()
    if Cfg.frame and Cfg.frame:IsShown() then Cfg:Close() end
    if P.focusing then P:StopFocus() end
    T.reset({ level = 1 })
    Ding.db.panel.shown = true
    E:SetGuide("nightelf-01-shadowglen", 1, true)
    Ding.db.chords = {}
    H.setGamepadInterface(true, BAR)
    H.clearFired()
    H.flush()
end

-- Counts the runs of an engine call while fn runs.
local function counting(object, method, fn)
    local count, original = 0, object[method]
    object[method] = function(...) count = count + 1 end
    local ok, err = pcall(fn)
    object[method] = original
    assert(ok, err)
    return count
end

local function fired(command)
    for _, c in ipairs(H.fired()) do
        if c == command then return true end
    end
    return false
end

local function firedUp(command)
    for _, c in ipairs(H.firedUp()) do
        if c == command then return true end
    end
    return false
end

local function chordInputOn()
    local f = _G.DingChordInput
    return f ~= nil and f:IsShown() and f.gamepadButtons == true
end

T.test("LB held + Up runs the action once, the game's Up does not; Up alone goes to the game", function()
    start()
    Ding.db.chords.DING_NEXT = "PADLSHOULDER+PADDUP"
    local runs = counting(E, "Next", function()
        H.gamepadDown("PADLSHOULDER")
        H.tick(0.1)
        T.ok(chordInputOn(), "no frame keeps Up from the game while LB is held")
        H.gamepadDown("PADDUP")
        H.tick(0.3)
        H.gamepadUp("PADDUP")
        H.gamepadUp("PADLSHOULDER")
        H.tick(0.1)
    end)
    T.eq(runs, 1, "the chord's action")
    T.ok(not fired(BAR.PADDUP), "the gamepad bar's Up ran with the chord")
    T.ok(fired(BAR.PADLSHOULDER), "LB's own use taken from the game")
    T.ok(not chordInputOn(), "the frame still reads the gamepad once LB is up")
    H.clearFired()
    runs = counting(E, "Next", function()
        H.gamepadPress("PADDUP")
        H.tick(0.1)
    end)
    T.eq(runs, 0, "Up alone runs the chord")
    T.ok(fired(BAR.PADDUP), "Up alone does not reach the game")
    -- LB + Down: not a chord, Down goes to the game.
    H.clearFired()
    runs = counting(E, "Next", function()
        H.gamepadDown("PADLSHOULDER"); H.tick(0.1)
        H.gamepadPress("PADDDOWN"); H.tick(0.1)
        H.gamepadUp("PADLSHOULDER"); H.tick(0.1)
    end)
    T.eq(runs, 0)
    T.ok(fired(BAR.PADDDOWN), "Down kept from the game while LB is held")
end)

T.test("RB + Up (the default) opens the settings; while a Ding window is open chords do nothing", function()
    start()
    Ding.db.ui.configChordDone, Ding.db.ui.configKeyDone = nil, nil
    T.eq(G:BindDefaultConfig(), "PADRSHOULDER+PADDUP")
    H.gamepadDown("PADRSHOULDER"); H.tick(0.1)
    H.gamepadDown("PADDUP"); H.tick(0.1)
    T.ok(Cfg.frame and Cfg.frame:IsShown(), "RB + Up does not open the settings")
    T.ok(not fired(BAR.PADDUP), "the gamepad bar's Up ran too")
    -- RB is still held: the settings leave it to the game until it is released (reported: the
    -- game kept RB held, its release went to the settings' binding).
    T.ok(H.overrides[Cfg.frame] and H.overrides[Cfg.frame].PAD1, "the settings without their buttons")
    T.eq(H.overrides[Cfg.frame].PADRSHOULDER, nil, "the settings bind RB while the game holds it")
    H.gamepadUp("PADDUP"); H.gamepadUp("PADRSHOULDER")
    T.ok(firedUp(BAR.PADRSHOULDER), "RB's release does not reach the game")
    H.tick(0.1)
    T.ok(H.overrides[Cfg.frame].PADRSHOULDER, "RB not the settings' once released")
    T.ok(not chordInputOn(), "the chord frame reads the gamepad over the settings")
    T.ok(fired(BAR.PADRSHOULDER), "RB's own use taken from the game")
    -- In the settings, RB changes tab and Up moves the focus: no chord.
    H.clearFired()
    local tab = Cfg.tab
    H.gamepadDown("PADRSHOULDER"); H.tick(0.1)
    T.eq(Cfg.tab, tab % #Cfg.TABS + 1, "RB does not change tab in the settings")
    H.gamepadPress("PADDUP"); H.tick(0.1)
    H.gamepadUp("PADRSHOULDER"); H.tick(0.1)
    T.ok(Cfg.frame:IsShown(), "RB + Up closed the settings from inside")
    T.ok(not fired(BAR.PADDUP) and not fired(BAR.PADRSHOULDER), "the settings' buttons reached the game")
    Cfg:Close(); H.flush()
end)

T.test("LB + Up opens focus mode: LB's release reaches the game, then LB is focus mode's", function()
    start()
    Ding.db.chords.DING_FOCUS = "PADLSHOULDER+PADDUP"
    H.gamepadDown("PADLSHOULDER"); H.tick(0.1)
    H.gamepadDown("PADDUP"); H.tick(0.1)
    T.ok(P.focusing, "LB + Up does not start focus mode")
    T.eq(H.overrides[P.frame].PADLSHOULDER, nil, "focus mode binds LB while the game holds it")
    H.gamepadUp("PADDUP"); H.gamepadUp("PADLSHOULDER")
    T.ok(firedUp(BAR.PADLSHOULDER), "LB's release does not reach the game")
    T.ok(not firedUp(BAR.PADDUP), "Up's release reached the game (its press was Ding's)")
    H.tick(0.1)
    T.ok(H.overrides[P.frame].PADLSHOULDER, "LB not focus mode's once released")
    -- A window closed while the button is still held: nothing bound afterwards.
    P:StopFocus(); H.flush()
    H.gamepadDown("PADLSHOULDER"); H.tick(0.1)
    H.gamepadDown("PADDUP"); H.tick(0.1)
    T.ok(P.focusing)
    P:StopFocus(); H.flush()
    H.gamepadUp("PADDUP"); H.gamepadUp("PADLSHOULDER"); H.tick(0.1)
    T.eq(next(H.overrides), nil, "a binding set after the window closed")
    T.eq(next(G.heldKeys), nil, "a held button still waited for")
end)

T.test("combat: the chord still runs (the frame cannot change), the second button's own action too", function()
    start()
    Ding.db.chords.DING_NEXT = "PADLSHOULDER+PADDUP"
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    local runs = counting(E, "Next", function()
        H.gamepadDown("PADLSHOULDER"); H.tick(0.1)
        T.ok(not chordInputOn(), "a frame enabled in combat")
        H.gamepadDown("PADDUP"); H.tick(0.1)
        H.gamepadUp("PADDUP"); H.gamepadUp("PADLSHOULDER"); H.tick(0.1)
    end)
    T.eq(runs, 1, "the chord does not run in combat")
    T.ok(fired(BAR.PADDUP), "the game's Up in combat")
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")

    -- LB held when the fight starts: the frame goes before the lockdown.
    H.gamepadDown("PADLSHOULDER"); H.tick(0.1)
    T.ok(chordInputOn())
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    T.ok(not chordInputOn(), "the frame still reads the gamepad in combat")
    H.gamepadUp("PADLSHOULDER"); H.tick(0.1)
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
end)

T.test("no chord while a Keybinds row waits for a button", function()
    start()
    Ding.db.chords.DING_NEXT = "PADLSHOULDER+PADDUP"
    Cfg:Open("bindings", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.action == "DING_PREV" end, "DING_PREV")
    H.press("PAD1")
    T.ok(Cfg.capturing, "not waiting")
    local runs = counting(E, "Next", function()
        H.padHold("PADLSHOULDER"); H.tick(0.1)
        H.padHold("PADDUP"); H.tick(0.1)
        H.padRelease("PADDUP"); H.padRelease("PADLSHOULDER"); H.tick(0.1)
    end)
    T.eq(runs, 0, "the chord ran during the capture")
    T.eq(Cfg.focus.status:GetText(), L.BIND_CONFLICT:format(L.BIND_NEXT), "the chord not named as Next step's")
    H.press("PAD2")
    Cfg:Close(); H.flush()
end)

T.test("focus mode, gamepad interface on, Easy Controller's override on the D-pad: Ding's D-pad", function()
    start()
    H.setAddOnLoaded("EasyController", true)
    local ec = CreateFrame("Frame")
    SetOverrideBinding(ec, true, "PADDDOWN", "CLICK ControllerKeyboardBarRelay:LeftButton")
    SetOverrideBinding(ec, true, "PAD1", "CLICK ControllerKeyboardBarRelay:LeftButton")
    P:StartFocus(); H.flush()
    T.ok(P.focusing, "focus mode does not start")
    T.ok(_G.DingPadInput and _G.DingPadInput:IsShown() and _G.DingPadInput.gamepadButtons,
        "focus mode does not read the gamepad itself")
    local before = P.focusIndex
    H.gamepadPress("PADDDOWN")
    T.eq(P.focusIndex, before + 1, "D-pad down does not move in focus mode")
    T.eq(#H.fired(), 0, "the D-pad reached the game or Easy Controller: " .. tostring(H.fired()[1]))
    -- A button focus mode does not use goes on to the game.
    H.gamepadPress("PADLTRIGGER")
    H.gamepadPress("PADBACK")
    T.eq(#H.fired(), 0)
    P:StopFocus(); H.flush()
    T.ok(not _G.DingPadInput:IsShown() and not _G.DingPadInput.gamepadButtons, "the gamepad kept after focus mode")
    H.gamepadPress("PADDDOWN")
    T.ok(fired("CLICK ControllerKeyboardBarRelay:LeftButton"), "the D-pad not back to Easy Controller")
    ClearOverrideBindings(ec)
    H.setAddOnLoaded("EasyController", false)
end)

T.test("the settings with the gamepad interface on: RB, the D-pad and A are Ding's", function()
    start()
    Cfg:Open("guide", 1); H.flush()
    local tab = Cfg.tab
    H.gamepadPress("PADRSHOULDER")
    T.eq(Cfg.tab, tab % #Cfg.TABS + 1, "RB does not change tab")
    H.gamepadPress("PADDDOWN")
    H.gamepadPress("PAD2")
    T.ok(not Cfg.frame:IsShown(), "B does not close the settings")
    T.eq(#H.fired(), 0, "the settings' buttons reached the game: " .. tostring(H.fired()[1]))
    T.ok(not _G.DingPadInput:IsShown(), "the gamepad kept after closing")
end)

T.test("the quest item's actions take no chord; every other binding of Ding's has one", function()
    T.ok(not G:ChordAllowed("CLICK DingItemButton:LeftButton"))
    T.ok(not G:ChordAllowed("CLICK DingItemButton:Target"))
    local file = assert(io.open(tools .. "/../Ding/Bindings.xml"))
    local xml = file:read("*a")
    file:close()
    local count = 0
    for name in xml:gmatch('<Binding name="([%w_]+)"') do
        count = count + 1
        T.ok(G:ChordAllowed(name), name .. " has no chord")
    end
    T.ok(count >= 10, "Bindings.xml not read")
end)

T.test("the assistant's first line and /ding help show the chord RB + Up", function()
    start()
    for key, a in pairs(H.bindings) do
        if a == "DING_CONFIG" then H.bindings[key] = nil end
    end
    G:Bind("DING_CONFIG", "PADRSHOULDER+PADDUP")
    Ding.Setup:Open(1); H.flush()
    local s = Ding.Setup.frame.screens[1]
    T.eq(s.note:GetText(), L.SETUP_OPEN_LATER)
    local parts = s.noteKey.glyph.parts
    T.eq(parts[1].text, "RB"); T.eq(parts[2].text, "+"); T.eq(parts[3].caret, "UP")
    Ding.Setup:Close(true); H.flush()
    local lines, print = {}, Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = H.plain(msg) end
    SlashCmdList.DING("help")
    Ding.Print = print
    T.eq(lines[#lines], L.HELP_OPEN_KEY:format("RB+" .. L.PAD_UP))
end)

T.run()
