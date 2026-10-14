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
    Ding.db.ui.configKeyDone = nil
end

local function gamepadSettingsUntouched(what)
    for _, name in ipairs(H.cvarsSet()) do
        T.ok(not name:find("^GamePad"), what .. ": Ding changed the game's gamepad setting " .. name)
    end
end

T.test("default button of \"Open Ding! settings\": LT + Start when free, once", function()
    fresh()
    T.eq(G:BindDefaultConfig(), "SHIFT-PADFORWARD")
    T.eq(keysOf(ACTION), "SHIFT-PADFORWARD")
    T.eq(G:BindingText(ACTION), "LT+Start")
    T.ok(Ding.db.ui.configKeyDone, "not remembered")
    H.bindings["SHIFT-PADFORWARD"] = nil
    T.eq(G:BindDefaultConfig(), nil, "offered twice")
    T.eq(keysOf(ACTION), "", "bound again after the player took it off")
end)

T.test("RB + Up (the wish) when the game's gamepad settings make RB a modifier", function()
    fresh()
    H.setCVar("GamePadEmulateAlt", "PADRSHOULDER")
    T.eq(G:BindDefaultConfig(), "ALT-PADDUP")
    T.eq(G:BindingText(ACTION), "RB+" .. L.PAD_UP)
    H.setCVar("GamePadEmulateAlt", "NONE")
    -- Without any modifier in the game's settings: nothing to bind, nothing changed.
    fresh()
    H.setCVar("GamePadEmulateShift", "none")
    H.setCVar("GamePadEmulateCtrl", "none")
    T.eq(G:BindDefaultConfig(), nil)
    T.eq(keysOf(ACTION), "")
    H.setCVar("GamePadEmulateShift", "PADLTRIGGER")
    H.setCVar("GamePadEmulateCtrl", "PADRTRIGGER")
    gamepadSettingsUntouched("no modifier")
end)

T.test("never over a button the action has, nor a key in use; without a gamepad, later", function()
    fresh()
    H.bindings.PAD3 = ACTION
    T.eq(G:BindDefaultConfig(), nil, "a second button added")
    T.eq(keysOf(ACTION), "PAD3")

    fresh()
    H.bindings["SHIFT-PADFORWARD"] = "TOGGLEWORLDMAP"
    T.eq(G:BindDefaultConfig(), "CTRL-PADFORWARD", "LT + Start taken from the world map")
    T.eq(H.bindings["SHIFT-PADFORWARD"], "TOGGLEWORLDMAP")
    H.bindings["SHIFT-PADFORWARD"] = nil

    fresh()
    local active = G.Active
    G.Active = function() return false end
    T.eq(G:BindDefaultConfig(), nil)
    G.Active = active
    T.ok(not Ding.db.ui.configKeyDone, "not offered again once a gamepad is in use")
end)

T.test("Easy Controller loaded: its keys never taken by default, bound by hand with a word", function()
    fresh()
    H.setAddOnLoaded("EasyController", true)
    local ec = CreateFrame("Frame")
    SetOverrideBinding(ec, true, "SHIFT-PADFORWARD", "CONTROLLERKEYBOARD_NOOP")
    T.eq(G:BindDefaultConfig(), "CTRL-PADFORWARD", "Easy Controller's LT + Start taken by default")
    T.eq(H.overrideActions[ec]["SHIFT-PADFORWARD"], "CONTROLLERKEYBOARD_NOOP")
    -- By hand: named, A binds it anyway.
    Cfg:Open("bindings", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.action == ACTION end, ACTION)
    H.press("PAD1")
    H.padDown("PADFORWARD", { shift = true })
    T.eq(Cfg.focus.status:GetText(), L.BIND_ALSO_ADDON:format("LT+Start", "Easy Controller"))
    H.press("PAD1")
    T.eq(keysOf(ACTION), "SHIFT-PADFORWARD", "A does not bind Easy Controller's key")
    T.eq(H.overrideActions[ec]["SHIFT-PADFORWARD"], "CONTROLLERKEYBOARD_NOOP", "Easy Controller's binding changed")
    Cfg:Close(); H.flush()
    ClearOverrideBindings(ec)
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
    T.eq(keysOf(ACTION), "SHIFT-PADFORWARD", "the default button not set at login")
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
