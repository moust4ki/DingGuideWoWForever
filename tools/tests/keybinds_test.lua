-- Keybinds tab: binding a gamepad button, a combination or a key (Gamepad:Capture).
-- Reported in game (WoW Forever, gamepad): every button pressed showed "RB". The capture read
-- each button right, but a new button was added to the action's old ones instead of replacing
-- them, and the row showed the first: RB, pressed first for an "RB + Up" (the client's
-- bindings then held RB, D-pad down, up, left and X for "Open Ding! settings").
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local Cfg, G, L = Ding.Config, Ding.Gamepad, Ding.L

local ACTION = "DING_CONFIG"

local function bindingsRow(action)
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.bindings].rows) do
        if row.opts and row.opts.action == action then return row end
    end
end

-- The Keybinds tab, focus on the row of `action`, nothing bound to it.
local function open(action)
    action = action or ACTION
    Cfg:Close(); H.flush()
    for key, a in pairs(H.bindings) do
        if a == action then H.bindings[key] = nil end
    end
    Cfg:Open("bindings", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.action == action end, action)
    return Cfg.focus
end

local function close()
    Cfg:Close(); H.flush()
end

-- A starts waiting for a button.
local function startCapture(row)
    H.press("PAD1")
    T.ok(Cfg.capturing == row, "A does not start waiting for a button")
end

local function keysOf(action)
    return table.concat(G:BindingKeys(action), " ")
end

local function navTaken()
    return H.overrides[Cfg.frame] ~= nil and H.overrides[Cfg.frame].PADRSHOULDER ~= nil
end

T.test("A alone: taken when released, saved, shown as A; Ding's navigation released meanwhile", function()
    local row = open()
    T.ok(navTaken(), "the settings' navigation bindings are not set")
    startCapture(row)
    T.ok(not navTaken(), "Ding's navigation bindings stay during the capture: RB would change tab")
    T.eq(row.status:GetText(), L.BIND_WAIT_PAD)
    H.padHold("PAD1")
    T.ok(Cfg.capturing, "a button is taken before it is released (no combination possible)")
    H.padRelease("PAD1")
    T.ok(not Cfg.capturing, "still waiting after A")
    T.eq(H.bindings.PAD1, ACTION)
    T.eq(row.chip.key, "A")
    T.ok(navTaken(), "Ding's navigation bindings are not back after the capture")
    close()
end)

T.test("the bug: RB then X, then D-pad down: each new button replaces the last, the row shows it", function()
    local row = open()
    startCapture(row)
    H.padDown("PADRSHOULDER")
    T.eq(keysOf(ACTION), "PADRSHOULDER")
    T.eq(row.chip.key, "RB")
    startCapture(row)
    H.padDown("PAD3")
    T.eq(keysOf(ACTION), "PAD3", "RB stays bound beside X")
    T.eq(row.chip.key, "X", "the row still shows the old button")
    T.eq(H.bindings.PADRSHOULDER, nil)
    startCapture(row)
    H.padDown("PADDDOWN")
    T.eq(keysOf(ACTION), "PADDDOWN")
    T.eq(row.chip.key, L.PAD_DOWN)
    close()
end)

T.test("combinations with the game's modifiers: LT + A, LT + D-pad down, RT + X, LT + RT + Start, LB + Y", function()
    local row = open()
    -- The mocked client: LT is Shift, RT is Ctrl (GamePadEmulateShift / Ctrl).
    startCapture(row)
    H.padHold("PADLTRIGGER")
    T.ok(Cfg.capturing, "LT alone (a modifier) ends the wait")
    H.padHold("PAD1")
    T.ok(not Cfg.capturing, "LT + A not taken when A goes down")
    H.padRelease("PAD1"); H.padRelease("PADLTRIGGER")
    T.eq(keysOf(ACTION), "SHIFT-PAD1")
    T.eq(row.chip.key, "LT+A")
    T.ok(Cfg.frame:IsShown(), "releasing the buttons after the capture closes the window")

    startCapture(row)
    H.padHold("PADLTRIGGER"); H.padHold("PADDDOWN"); H.padRelease("PADDDOWN"); H.padRelease("PADLTRIGGER")
    T.eq(keysOf(ACTION), "SHIFT-PADDDOWN", "LT + D-pad down")
    T.eq(row.chip.key, "LT+" .. L.PAD_DOWN)
    -- Its chip: LT, "+", the D-pad's down caret.
    local parts = row.chip.glyph.parts
    T.eq(#parts, 3)
    T.eq(parts[1].text, "LT"); T.eq(parts[2].text, "+"); T.eq(parts[3].caret, "DOWN")

    startCapture(row)
    H.padHold("PADRTRIGGER"); H.padHold("PAD3"); H.padRelease("PAD3"); H.padRelease("PADRTRIGGER")
    T.eq(keysOf(ACTION), "CTRL-PAD3", "RT + X replaces LT + D-pad down")
    T.eq(row.chip.key, "RT+X")

    startCapture(row)
    H.padHold("PADLTRIGGER"); H.padHold("PADRTRIGGER"); H.padHold("PADFORWARD")
    H.padRelease("PADFORWARD"); H.padRelease("PADRTRIGGER"); H.padRelease("PADLTRIGGER")
    T.eq(keysOf(ACTION), "CTRL-SHIFT-PADFORWARD")
    T.eq(row.chip.key, "RT+LT+Start")

    -- LB made Alt by the game's settings: LB + Y.
    H.setCVar("GamePadEmulateAlt", "PADLSHOULDER")
    startCapture(row)
    H.padHold("PADLSHOULDER"); H.padHold("PAD4"); H.padRelease("PAD4"); H.padRelease("PADLSHOULDER")
    T.eq(keysOf(ACTION), "ALT-PAD4")
    T.eq(row.chip.key, "LB+Y")
    H.setCVar("GamePadEmulateAlt", "NONE")
    close()
end)

T.test("a combination the game cannot make (RB + Up): said in words, the wait goes on", function()
    local row = open()
    startCapture(row)
    H.padHold("PADRSHOULDER")
    T.ok(Cfg.capturing, "RB taken while it is held: an RB + Up could not start")
    H.padHold("PADDUP")
    T.ok(Cfg.capturing, "the wait ends on a combination the game cannot make")
    local combo = G:ButtonName("PADRSHOULDER") .. "+" .. G:ButtonName("PADDUP")
    T.eq(row.status:GetText(), L.BIND_NOT_MODIFIER:format(combo, "RT" .. L.BIND_OR .. "LT"))
    -- Their release is no press of RB alone.
    H.padRelease("PADDUP"); H.padRelease("PADRSHOULDER")
    T.ok(Cfg.capturing, "the release after a refused combination is taken")
    T.eq(keysOf(ACTION), "", "something bound")
    H.padDown("PAD3")
    T.eq(keysOf(ACTION), "PAD3", "the next button is not taken after a refusal")
    T.eq(row.notice, nil, "the words stay once bound")

    -- No button is a modifier in the game's settings: no combination at all.
    H.setCVar("GamePadEmulateShift", "none")
    H.setCVar("GamePadEmulateCtrl", "NONE")
    startCapture(row)
    H.padHold("PADLTRIGGER"); H.padHold("PAD1")
    T.eq(row.status:GetText(), L.BIND_NO_MODIFIER:format("LT+A"))
    H.padRelease("PAD1"); H.padRelease("PADLTRIGGER")
    T.ok(Cfg.capturing, "the wait ends")
    H.padDown("PAD2")
    T.ok(not Cfg.capturing, "B does not cancel")
    H.setCVar("GamePadEmulateShift", "PADLTRIGGER")
    H.setCVar("GamePadEmulateCtrl", "PADRTRIGGER")
    close()
end)

T.test("B tapped cancels; B held binds B; Escape and a long wait cancel", function()
    local row = open()
    H.bindings.PAD3 = ACTION
    startCapture(row)
    H.padDown("PAD2")
    T.ok(not Cfg.capturing, "B tapped does not cancel")
    T.eq(keysOf(ACTION), "PAD3", "B tapped changes the binding")
    T.ok(navTaken(), "Ding's navigation bindings are not back after B")
    T.ok(Cfg.frame:IsShown(), "B closes the window instead of cancelling the wait")

    startCapture(row)
    H.padHold("PAD2")
    H.tick(G.HOLD_B + 0.2)
    T.ok(not Cfg.capturing, "B held is not taken")
    T.eq(keysOf(ACTION), "PAD2")
    H.padRelease("PAD2")
    T.ok(Cfg.frame:IsShown(), "the release of B held closes the window")

    startCapture(row)
    H.keyDown("ESCAPE")
    T.ok(not Cfg.capturing, "Escape does not cancel")
    T.eq(keysOf(ACTION), "PAD2")

    startCapture(row)
    H.tick(G.CAPTURE_TIMEOUT + 1)
    T.ok(not Cfg.capturing, "the wait never ends by itself")
    T.ok(not _G.DingCaptureFrame.gamepadButtons, "the capture frame still takes the gamepad")
    T.ok(navTaken(), "Ding's navigation bindings are not back after the wait")
    close()
end)

T.test("keyboard: a key, Ctrl + a key; modifiers alone wait; the gamepad button stays beside it", function()
    local row = open()
    startCapture(row)
    H.padDown("PAD3")
    startCapture(row)
    H.keyDown("LSHIFT", { shift = true })
    T.ok(Cfg.capturing, "Shift alone is taken")
    H.keyDown("N", { ctrl = true })
    T.ok(not Cfg.capturing, "Ctrl + N not taken")
    T.eq(H.bindings["CTRL-N"], ACTION)
    T.eq(H.bindings.PAD3, ACTION, "a key replaced the gamepad's button")
    T.eq(row.chip.key, "Ctrl+N", "the row does not show the key just bound")
    T.eq(G:BindingText(ACTION), "X", "with a gamepad, the guide's chips do not show its button")
    startCapture(row)
    H.keyDown("K")
    T.eq(keysOf(ACTION), "PAD3 K", "a key adds to the keys instead of replacing Ctrl + N")
    T.eq(row.chip.key, "K")
    -- Y unbinds what the row shows: the key; the gamepad's button stays, shown again.
    H.press("PAD4")
    T.eq(keysOf(ACTION), "PAD3")
    T.eq(row.chip.key, "X")
    H.press("PAD4")
    T.eq(keysOf(ACTION), "")
    -- Without a gamepad, the row shows the keyboard's key first.
    SetBinding("PAD3", ACTION)
    SetBinding("K", ACTION)
    local active = G.Active
    G.Active = function() return false end
    row:Refresh()
    T.eq(row.chip.key, "K")
    G.Active = active
    row:Refresh()
    T.eq(row.chip.key, "X")
    close()
end)

T.test("several buttons on an action (the old bug): \"and 2 more\", a new button replaces them", function()
    local row = open()
    SetBinding("PADRSHOULDER", ACTION)
    SetBinding("PADDDOWN", ACTION)
    SetBinding("PAD3", ACTION)
    SetBinding("N", ACTION)
    row:Refresh()
    T.eq(row.chip.key, "RB")
    T.ok(row.status:IsShown(), "the other buttons are not mentioned")
    T.eq(row.status:GetText(), Ding.UI.More(2))
    local _, text = row:Tooltip()
    T.eq(text, L.BIND_ALL:format("RB, " .. L.PAD_DOWN .. ", X, N"))
    startCapture(row)
    H.padDown("PAD4")
    T.eq(keysOf(ACTION), "N PAD4")
    T.eq(row.chip.key, "Y")
    T.ok(not row.status:IsShown(), "\"and … more\" stays with one button")
    close()
end)

T.test("conflict with another action: said by name, B keeps it, A replaces it", function()
    local row = open()
    H.bindings["SHIFT-PADDRIGHT"] = "DING_NEXT"
    startCapture(row)
    H.padDown("PADDRIGHT", { shift = true })
    T.ok(Cfg.conflictRow == row, "no conflict")
    T.eq(row.status:GetText(), L.BIND_CONFLICT:format(L.BIND_NEXT))
    H.press("PAD2")
    T.eq(H.bindings["SHIFT-PADDRIGHT"], "DING_NEXT", "B replaced it")
    T.ok(Cfg.frame:IsShown(), "B closed the window")
    startCapture(row)
    H.padDown("PADDRIGHT", { shift = true })
    H.press("PAD1")
    T.eq(H.bindings["SHIFT-PADDRIGHT"], ACTION, "A did not replace it")
    T.eq(G:BindingKey("DING_NEXT"), nil)
    SetBinding("SHIFT-PADDRIGHT", "DING_NEXT")
    close()
end)

T.test("the game's gamepad interface: its buttons refused in words, a free combination taken", function()
    local row = open()
    H.setGamepadInterface(true, { PAD1 = "GAMEPADACTIONBUTTON1", PADRSHOULDER = "GAMEPADRIGHTTARGETMODIFIER" })
    startCapture(row)
    H.padDown("PAD1")
    T.ok(Cfg.capturing, "the game's own button taken")
    T.eq(row.status:GetText(), L.BIND_TAKEN_GAMEPAD:format("A"))
    H.padDown("PADRSHOULDER")
    T.ok(Cfg.capturing, "RB taken from the game's gamepad interface")
    H.padHold("PADLTRIGGER"); H.padHold("PAD1"); H.padRelease("PAD1"); H.padRelease("PADLTRIGGER")
    T.ok(not Cfg.capturing, "LT + A refused although the game leaves it free")
    T.eq(keysOf(ACTION), "SHIFT-PAD1")
    T.eq(H.contextBindings.PAD1, "GAMEPADACTIONBUTTON1", "the game's gamepad binding changed")
    H.setGamepadInterface(false)
    close()
end)

T.test("another addon's override binding (Easy Controller): refused by name, never taken", function()
    local row = open()
    local ec = CreateFrame("Frame", "ControllerKeyboardMapping")
    SetOverrideBinding(ec, false, "SHIFT-PAD3", "CONTROLLERKEYBOARD_NOOP")
    local other = CreateFrame("Frame")
    SetOverrideBinding(other, true, "SHIFT-PAD4", "TOGGLEWORLDMAP")
    startCapture(row)
    H.padDown("PAD3", { shift = true })
    T.ok(Cfg.capturing, "a key of Easy Controller taken")
    T.eq(row.status:GetText(), L.BIND_TAKEN_ADDON:format("LT+X", "Easy Controller"))
    H.padDown("PAD4", { shift = true })
    T.eq(row.status:GetText(), L.BIND_TAKEN_ADDON:format("LT+Y", L.BIND_SOMEONE))
    T.eq(H.overrideActions[ec]["SHIFT-PAD3"], "CONTROLLERKEYBOARD_NOOP", "Easy Controller's binding changed")
    H.padDown("PAD2")
    T.ok(not Cfg.capturing, "B does not cancel after a refusal")
    ClearOverrideBindings(ec)
    ClearOverrideBindings(other)
    close()
end)

T.test("the game refuses a key: the action keeps its button, said in words", function()
    local row = open()
    H.bindings.PAD3 = ACTION
    local set = _G.SetBinding
    _G.SetBinding = function(key, action, context)
        if key == "PADBACK" and action then return false end
        return set(key, action, context)
    end
    startCapture(row)
    H.padDown("PADBACK")
    _G.SetBinding = set
    T.eq(keysOf(ACTION), "PAD3", "the old button lost")
    T.eq(row.status:GetText(), L.BIND_REFUSED:format("Back"))
    H.press("PADDDOWN")
    T.eq(row.notice, nil, "the words stay once the focus moves")
    close()
end)

T.test("combat during the wait: the capture ends, nothing taken, the gamepad given back", function()
    local row = open()
    H.bindings.PAD3 = ACTION
    startCapture(row)
    H.padHold("PADLTRIGGER")
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    T.ok(not Cfg.frame:IsShown(), "the settings stay open in combat")
    T.ok(not Cfg.capturing, "still waiting in combat")
    T.ok(not _G.DingCaptureFrame:IsShown() and not _G.DingCaptureFrame.gamepadButtons,
        "the capture frame keeps the gamepad in combat")
    T.eq(H.overrides[Cfg.frame], nil, "temporary bindings left in combat")
    H.padRelease("PADLTRIGGER")
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
    T.eq(keysOf(ACTION), "PAD3")
end)

T.run()
