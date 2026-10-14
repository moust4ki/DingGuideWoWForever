-- Ding! beside Easy Controller (the author's gamepad addon) and the default button of "Open Ding!
-- settings" (docs/compatibility.md). Ding never changes the game's gamepad settings; its windows
-- take their buttons whatever Easy Controller shows (reported: waiting for its windows left Ding
-- unusable); a key Easy Controller uses is bound by hand with a word, never by default; the setup
-- assistant says how to open Ding! later.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local Cfg, G, L, S = Ding.Config, Ding.Gamepad, Ding.L, Ding.Setup

local ACTION = "DING_CONFIG"

local function chat(fn)
    local lines, print = {}, Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = H.plain(msg) end
    local ok, err = pcall(fn)
    Ding.Print = print
    assert(ok, err)
    return lines
end

local function keysOf(action)
    return table.concat(G:BindingKeys(action), " ")
end

-- "Open Ding! settings" with nothing bound, the default not offered yet.
local function fresh()
    Cfg:Close(); S:Close(true); H.flush()
    for key, a in pairs(H.bindings) do
        if a == ACTION then H.bindings[key] = nil end
    end
    Ding.db.chords = {}
    Ding.db.ui.configKeyDone, Ding.db.ui.configChordDone = nil, nil
end

local function gamepadSettingsUntouched(what)
    for _, name in ipairs(H.cvarsSet()) do
        T.ok(not name:find("^GamePad"), what .. ": Ding changed the game's gamepad setting " .. name)
    end
end

T.test("default of \"Open Ding! settings\": the chord RB + Up, once; LB + Up when RB + Up is taken", function()
    fresh()
    T.eq(G:BindDefaultConfig(), "PADRSHOULDER+PADDUP")
    T.eq(keysOf(ACTION), "PADRSHOULDER+PADDUP")
    T.eq(G:BindingText(ACTION), "RB+" .. L.PAD_UP)
    T.ok(Ding.db.ui.configChordDone, "not remembered")
    Ding.db.chords[ACTION] = nil
    T.eq(G:BindDefaultConfig(), nil, "offered twice")
    T.eq(keysOf(ACTION), "", "bound again after the player took it off")

    -- RB + Up already another action's chord: LB + Up.
    fresh()
    Ding.db.chords.DING_NEXT = "PADRSHOULDER+PADDUP"
    T.eq(G:BindDefaultConfig(), "PADLSHOULDER+PADDUP")
    T.eq(Ding.db.chords.DING_NEXT, "PADRSHOULDER+PADDUP", "the player's chord taken")
    -- Both taken: nothing.
    fresh()
    Ding.db.chords.DING_NEXT = "PADRSHOULDER+PADDUP"
    Ding.db.chords.DING_PREV = "PADLSHOULDER+PADDUP"
    T.eq(G:BindDefaultConfig(), nil)
    T.eq(keysOf(ACTION), "")
    Ding.db.chords = {}
    gamepadSettingsUntouched("default")
end)

T.test("default: never over a gamepad button the player gave; the first v1.5.0 default replaced", function()
    fresh()
    H.bindings.PAD3 = ACTION
    T.eq(G:BindDefaultConfig(), nil, "a second button added")
    T.eq(keysOf(ACTION), "PAD3")

    -- LT + Start, set by the first v1.5.0 builds (it did nothing in play): RB + Up instead.
    fresh()
    H.bindings["SHIFT-PADFORWARD"] = ACTION
    Ding.db.ui.configKeyDone = true
    T.eq(G:BindDefaultConfig(), "PADRSHOULDER+PADDUP")
    T.eq(keysOf(ACTION), "PADRSHOULDER+PADDUP", "LT + Start kept beside it")
    -- The player's own LT + Start (no earlier default): kept.
    fresh()
    H.bindings["SHIFT-PADFORWARD"] = ACTION
    T.eq(G:BindDefaultConfig(), nil)
    T.eq(keysOf(ACTION), "SHIFT-PADFORWARD")
    H.bindings["SHIFT-PADFORWARD"] = nil

    fresh()
    local active = G.Active
    G.Active = function() return false end
    T.eq(G:BindDefaultConfig(), nil)
    G.Active = active
    T.ok(not Ding.db.ui.configChordDone, "not offered again once a gamepad is in use")
end)

T.test("Easy Controller loaded: its chord and keys never taken by default, bound by hand with a word", function()
    fresh()
    H.setAddOnLoaded("EasyController", true)
    -- Its settings' shortcut set to RB + Up: Ding's default goes to LB + Up.
    _G.ControllerKeyboardDB = { settings = { shortcut = { hold = "PADRSHOULDER", press = "PADDUP" },
        features = { configShortcut = true } } }
    T.eq(G:EasyControllerChord(), "PADRSHOULDER+PADDUP")
    T.eq(G:BindDefaultConfig(), "PADLSHOULDER+PADDUP", "Easy Controller's RB + Up taken by default")
    -- Its shortcut as it ships (RB + Down): RB + Up stays free.
    fresh()
    _G.ControllerKeyboardDB.settings.shortcut = { hold = "PADRSHOULDER", press = "PADDDOWN" }
    T.eq(G:BindDefaultConfig(), "PADRSHOULDER+PADDUP")
    -- By hand: RB + Down named, A takes it anyway.
    Cfg:Open("bindings", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.action == ACTION end, ACTION)
    H.press("PAD1")
    H.padHold("PADRSHOULDER"); H.padHold("PADDDOWN"); H.padRelease("PADDDOWN"); H.padRelease("PADRSHOULDER")
    T.eq(Cfg.focus.status:GetText(), L.BIND_ALSO_ADDON:format("RB+" .. L.PAD_DOWN, "Easy Controller"))
    H.press("PAD1")
    T.eq(keysOf(ACTION), "PADRSHOULDER+PADDDOWN", "A does not take Easy Controller's chord")
    -- Its shortcut turned off: nothing in the way.
    _G.ControllerKeyboardDB.settings.features.configShortcut = false
    T.eq(G:EasyControllerChord(), nil)
    Cfg:Close(); H.flush()
    _G.ControllerKeyboardDB = nil
    H.setAddOnLoaded("EasyController", false)
    gamepadSettingsUntouched("Easy Controller")
end)

-- Easy Controller's frames, all shown (some of them may always be, in the client).
local EC_FRAMES = { "ControllerKeyboardFrame", "ControllerKeyboardConsolePort", "ControllerKeyboardPhrases",
    "ControllerKeyboardWheel", "ControllerKeyboardConfigFrame", "ControllerKeyboardGuide" }
local function easyControllerShown(on)
    H.setAddOnLoaded("EasyController", on)
    for _, name in ipairs(EC_FRAMES) do
        local f = _G[name] or CreateFrame("Frame", name, UIParent)
        f:SetShown(on)
    end
end

T.test("Easy Controller loaded, its windows shown: every Ding window takes its buttons at once", function()
    fresh()
    easyControllerShown(true)
    local function takes(frame, what)
        T.ok(H.overrides[frame] and H.overrides[frame].PAD1 and H.overrides[frame].PAD2,
            what .. ": its buttons wait for Easy Controller")
        T.ok(G:HasWindow(), what .. ": Easy Controller cannot tell a Ding window holds the gamepad")
    end
    local lines = chat(function()
        Cfg:Open("guide", 1); H.flush()
        takes(Cfg.frame, "settings")
        H.press("PADRSHOULDER")
        T.eq(Cfg.tab, 2, "RB does not change the settings' tab")
        Cfg:Close(); H.flush()
        S:Open(1); H.flush()
        takes(S.frame, "setup assistant")
        S:Close(true); H.flush()
        Ding.Finder:Open(); H.flush()
        takes(Ding.Finder.frame, "NPC directory")
        Ding.Finder:Close(); H.flush()
        Ding.ImportWindow:Open("import"); H.flush()
        takes(Ding.ImportWindow.frame, "import window")
        Ding.ImportWindow:Close(); H.flush()
        Ding.Panel:StartFocus(); H.flush()
        takes(Ding.Panel.frame, "focus mode")
        Ding.Panel:StopFocus(); H.flush()
    end)
    T.eq(#lines, 0, "a chat line about Easy Controller: " .. tostring(lines[1]))
    T.eq(next(H.overrides), nil, "bindings left after closing")
    T.ok(not G:HasWindow(), "a Ding window still said to hold the gamepad")
    easyControllerShown(false)
end)

T.test("first launch with Easy Controller loaded and its guide shown: the assistant comes as usual", function()
    fresh()
    easyControllerShown(true)
    Ding.db.ui.setupDone, Ding.db.ui.welcomed = false, false
    Cfg:Init()
    H.tick(2.5)
    T.ok(S:IsShown(), "the assistant does not come")
    T.ok(H.overrides[S.frame] and H.overrides[S.frame].PADRSHOULDER, "the assistant without its buttons")
    T.eq(keysOf(ACTION), "PADRSHOULDER+PADDUP", "the default chord not set at login")
    S:Close(); H.tick(0.1)
    T.ok(not (Cfg.frame and Cfg.frame:IsShown()), "the Keybinds tab comes although the default button is set")
    easyControllerShown(false)
end)

T.test("the assistant's first screen says how to open Ding! later: the chip, or the mouse's ways", function()
    fresh()
    G:Bind(ACTION, "SHIFT-PADFORWARD")
    S:Open(1); H.flush()
    local s = S.frame.screens[1]
    T.eq(s.note:GetText(), L.SETUP_OPEN_LATER)
    T.ok(s.noteKey:IsShown(), "no chip")
    local parts = s.noteKey.glyph.parts
    T.eq(parts[1].text, "LT"); T.eq(parts[3].text, "Start")
    S:SetInput("mouse"); S:Layout()
    T.eq(s.note:GetText(), L.SETUP_OPEN_LATER_MOUSE)
    T.ok(not s.noteKey:IsShown(), "a gamepad chip for the mouse")
    SetBinding("K", ACTION)
    S:Layout()
    T.eq(s.note:GetText(), L.SETUP_OPEN_LATER_KEY:format("K"))
    S:SetInput("xbox")
    G:Unbind(ACTION, true)
    S:Layout()
    T.eq(s.note:GetText(), L.SETUP_OPEN_LATER_UNBOUND)
    T.ok(not s.noteKey:IsShown())
    T.eq(S.frame.screens[2].note:IsShown(), false, "the line on another screen")
    S:Close(true); H.flush()
    H.bindings.K = nil
end)

T.test("/ding help says how to open the settings, the button first", function()
    fresh()
    local lines = chat(function() SlashCmdList.DING("help") end)
    T.eq(lines[#lines], L.HELP_OPEN)
    G:Bind(ACTION, "SHIFT-PADFORWARD")
    lines = chat(function() SlashCmdList.DING("help") end)
    T.eq(lines[#lines], L.HELP_OPEN_KEY:format("LT+Start"))
end)

T.test("no shared names: Ding's globals and slash command are its own", function()
    T.eq(SLASH_DING1, "/ding")
    for _, slash in ipairs({ "/ec", "/ck", "/easycontroller", "/controllerkeyboard", "/cp", "/consoleport" }) do
        for name, value in pairs(_G) do
            if type(name) == "string" and name:find("^SLASH_DING") then T.ok(value ~= slash, name .. " = " .. slash) end
        end
    end
    for name in pairs(_G) do
        if type(name) == "string" and name:find("^Ding") then
            T.ok(not name:find("ControllerKeyboard") and not name:find("ConsolePort"), "global " .. name)
        end
    end
    gamepadSettingsUntouched("the whole file")
end)

T.run()
