-- Keyboard and mouse, gamepad off: the settings and the move mode must work with clicks
-- (right click: default value or cancel), Escape and Enter, and the help must say so.
-- Reported by players: the settings showed only gamepad buttons, nothing to click.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local Cfg, G, L = Ding.Config, Ding.Gamepad, Ding.L

local getCVar = _G.GetCVar
local function gamepad(on)
    if on then
        _G.GetCVar = getCVar
    else
        _G.GetCVar = function(name) if name == "GamePadEnable" then return "0" end return getCVar(name) end
    end
end

local function click(frame, button)
    frame.scripts.OnClick(frame, button or "LeftButton")
    H.flush()
end

local function open(tab, focus)
    if G:IsMoving() then G:CancelMove() end
    Cfg:Close(); H.flush()
    gamepad(false)
    Cfg:Open(tab, focus); H.flush()
end

local function close()
    Cfg:Close(); H.flush()
    gamepad(true)
end

local function help() return Cfg.frame.help.items[1] end

T.test("without a gamepad: the help bar speaks mouse and keyboard, without glyphs", function()
    open("appearance", 1)
    T.eq(help().label:GetText(), L.MOUSE_HINT)
    T.ok(not help().glyph:IsShown(), "gamepad glyph shown")
    T.ok(not help().box:IsShown(), "the help text is framed like a button")
    close()
end)

T.test("right click on a setting: its default value", function()
    open("appearance", 2)       -- after the theme cards
    T.eq(Cfg.focus.opts.label, L.BG_OPACITY)
    Ding.Panel:SetBackgroundAlpha(0.5, true)
    click(Cfg.focus, "RightButton")
    T.eq(Ding.db.panel.bgAlpha, Ding.UI.Theme.current.opacityDefault / 100,
        "right click does not restore the default value (the theme's)")
    close()
end)

T.test("mouse confirmation: \"click again\", right click cancels, the second click runs it", function()
    open("appearance", 1)
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.RESET_ALL end, "default")
    local row = Cfg.focus
    Ding.db.panel.scale = 1.2
    click(row)
    T.eq(row.button.text:GetText(), L.CONFIRM_CLICK, "the button asks for the gamepad")
    T.eq(help().label:GetText(), L.MOUSE_CONFIRM)
    click(row, "RightButton")
    T.ok(not row.confirming, "right click does not cancel")
    T.eq(Ding.db.panel.scale, 1.2, "settings reset without confirmation")
    click(row)
    click(row)
    T.eq(Ding.db.panel.scale, 1, "the second click does not confirm")
    close()
end)

T.test("keyboard binding: capture, conflict settled with the mouse (click: replace, right click: cancel)", function()
    open("bindings", 1)
    local row = Cfg.focus
    T.eq(row.opts.action, "DING_CONFIG")
    local used = G:BindingKey("DING_NEXT")
    click(row)
    T.ok(Cfg.capturing == row, "capture not started")
    T.eq(help().label:GetText(), L.MOUSE_CAPTURE)
    G:StopCapture(used); H.flush()
    T.ok(Cfg.conflictRow == row, "no conflict")
    T.eq(row.status:GetText(), L.BIND_CONFLICT_MOUSE:format(L.BIND_NEXT), "conflict message for the gamepad")
    click(row, "RightButton")
    T.ok(not Cfg.conflictRow, "right click does not cancel the conflict")
    T.eq(G:BindingKey("DING_NEXT"), used, "binding replaced despite cancelling")
    click(row)
    G:StopCapture(used); H.flush()
    click(row)
    T.eq(G:BindingKey("DING_CONFIG"), used, "the click does not replace")
    click(row, "RightButton")    -- right click on a binding: unbind, like Y
    T.eq(G:BindingKey("DING_CONFIG"), nil, "right click does not unbind")
    close()
end)

T.test("move mode with the mouse: drag, then Save; Cancel and Default clickable", function()
    open("appearance", 1)
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MOVE_PANEL end, "move")
    click(Cfg.focus)
    T.ok(G:IsMoving(), "move mode not started")
    local plate = G.plate
    T.eq(plate.hints.items[1].label:GetText(), L.MOVE_DRAG, "gamepad help without a gamepad")
    T.ok(plate.save:IsShown() and plate.cancel:IsShown() and plate.reset:IsShown(), "buttons missing")
    for _, b in ipairs({ plate.save, plate.cancel, plate.reset }) do
        T.ok(not (b.keyGlyphs and b.keyGlyphs[1] and b.keyGlyphs[1]:IsShown()), "gamepad chip on a button without a gamepad")
    end
    local target = G.moving
    local x, y = target.get()
    target.set(x + 30, y - 20)
    click(plate.cancel)
    T.ok(not G:IsMoving(), "Cancel does not leave the mode")
    T.eq(target.get(), x, "Cancel does not restore the position")
    T.ok(Cfg.frame:IsShown(), "the settings do not come back")
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MOVE_PANEL end, "move")
    click(Cfg.focus)
    target = G.moving
    target.set(x + 30, y - 20)
    click(G.plate.save)
    T.ok(not G:IsMoving(), "Save does not leave the mode")
    T.eq(target.get(), x + 30, "position not kept")
    close()
end)

T.test("move mode with the keyboard: Enter saves, Escape cancels", function()
    open("appearance", 1)
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MOVE_PANEL end, "move")
    click(Cfg.focus)
    local target = G.moving
    local x = target.get()
    target.set(x + 10, 0)
    G.plate.scripts.OnKeyDown(G.plate, "ESCAPE"); H.flush()
    T.ok(not G:IsMoving(), "Escape does not leave the mode")
    T.eq(target.get(), x, "Escape does not restore the position")
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MOVE_PANEL end, "move")
    click(Cfg.focus)
    target = G.moving
    target.set(x + 10, 0)
    G.plate.scripts.OnKeyDown(G.plate, "ENTER"); H.flush()
    T.ok(not G:IsMoving(), "Enter does not leave the mode")
    T.eq(target.get(), x + 10, "Enter does not keep the position")
    close()
end)

-- A hint of a hint bar, by its label: { glyph, label, button }.
local function hintItem(bar, label)
    for _, item in ipairs(bar.items) do
        if item.label:IsShown() and item.label:GetText() == label then return item end
    end
end

T.test("gamepad enabled but unplugged: the help speaks mouse; plugged in, it comes back", function()
    gamepad(true)
    H.setGamepadConnected(false)
    Cfg:Open("appearance", 1); H.flush()
    T.eq(help().label:GetText(), L.MOUSE_HINT, "gamepad help with no gamepad plugged in")
    H.setGamepadConnected(true)
    H.fire("GAME_PAD_CONNECTED"); H.flush()
    T.ok(help().label:GetText() ~= L.MOUSE_HINT and help().glyph:IsShown(), "gamepad help not back")
    Cfg:Close(); H.flush()
end)

T.test("clickable help bar: \"Y Reset\" resets; B and LB / RB sit on the window, not in the footer", function()
    gamepad(true)
    Cfg:Open("appearance", 2); H.flush()
    local f = Cfg.frame
    T.eq(Cfg.focus.opts.label, L.BG_OPACITY)
    T.ok(f.back:IsShown() and f.lb:IsShown() and f.rb:IsShown(), "B, LB or RB chip missing")
    T.eq(hintItem(f.help, L.HINT_BACK), nil, "\"B Back\" repeats the close cross")
    local reset = hintItem(f.help, L.HINT_RESET)
    T.ok(reset and reset.button:IsShown(), "\"Reset\" not clickable")
    T.ok(reset.box:IsShown() and reset.border:IsShown(), "\"Reset\" not framed like a button")
    reset.button.scripts.OnEnter(reset.button)
    T.ok(reset.hover:IsShown(), "no highlight on hover")
    reset.button.scripts.OnLeave(reset.button)
    T.ok(not reset.hover:IsShown(), "highlight still there after hovering")
    Ding.Panel:SetBackgroundAlpha(0.5)
    click(reset.button)
    T.eq(Ding.db.panel.bgAlpha, Ding.UI.Theme.current.opacityDefault / 100, "clicking \"Reset\" does not reset")
    click(f.close)
    T.ok(not f:IsShown(), "the close cross does not close")
end)

T.test("confirmation with a gamepad: the button says A, the footer only \"B Cancel\", clickable", function()
    gamepad(true)
    Cfg:Open("appearance", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.RESET_ALL end, "default")
    local row = Cfg.focus
    local chip = row.button.keyGlyphs and row.button.keyGlyphs[1]
    T.ok(chip and chip:IsShown() and chip.padKey == "PAD1", "no A on the focused row's button")
    T.eq(#Cfg.frame.help.list, 0, "the footer repeats the button")
    Ding.db.panel.scale = 1.2
    H.press("PAD1")
    T.ok(row.confirming, "no confirmation")
    T.eq(row.button.text:GetText(), L.CONFIRM:format(G:KeyName("PAD1")))
    T.ok(not chip:IsShown(), "A twice on the button")
    T.eq(hintItem(Cfg.frame.help, L.HINT_CONFIRM), nil, "\"A Confirm\" repeats the button")
    T.ok(not Cfg.frame.back:IsShown(), "B on the close cross while B cancels")
    click(hintItem(Cfg.frame.help, L.HINT_CANCEL).button)
    T.ok(not row.confirming and Ding.db.panel.scale == 1.2, "\"Cancel\" does not cancel")
    T.ok(chip:IsShown() and Cfg.frame.back:IsShown(), "chips not back after the cancel")
    H.press("PAD1")
    H.press("PAD1")
    T.eq(Ding.db.panel.scale, 1, "A twice does not confirm")
    Cfg:Close(); H.flush()
end)

T.test("move mode with a gamepad: Save, Cancel and Reset carry A, B and Y; the hints keep the D-pad and LB / RB", function()
    gamepad(true)
    Cfg:Open("appearance", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MOVE_PANEL end, "move")
    H.press("PAD1")
    T.ok(G:IsMoving(), "move mode not started")
    local plate = G.plate
    for _, pair in ipairs({ { plate.save, "PAD1" }, { plate.cancel, "PAD2" }, { plate.reset, "PAD4" } }) do
        local b, key = pair[1], pair[2]
        local chip = b.keyGlyphs and b.keyGlyphs[1]
        T.ok(b:IsShown() and chip and chip:IsShown() and chip.padKey == key, key .. " missing on " .. b.text:GetText())
        T.eq(hintItem(plate.hints, b.text:GetText()), nil, b.text:GetText() .. " repeated as a hint")
    end
    T.ok(hintItem(plate.hints, L.MOVE_STEP), "LB / RB hint missing")
    local move = hintItem(plate.hints, L.HINT_MOVE)
    T.ok(move and not move.button:IsShown() and not move.box:IsShown(), "the D-pad hint (move) looks like a button")
    local target = G.moving
    local x = target.get()
    target.set(x + 7, 0)
    click(plate.save)
    T.ok(not G:IsMoving(), "clicking Save does not leave the mode")
    T.eq(target.get(), x + 7, "position not kept")
    Cfg:Close(); H.flush()
end)

T.test("with a gamepad: the help and the messages stay the gamepad ones", function()
    gamepad(true)
    Cfg:Open("appearance", 1); H.flush()
    T.ok(help().label:GetText() ~= L.MOUSE_HINT, "mouse help with a gamepad")
    T.ok(help().glyph:IsShown(), "glyph missing with a gamepad")
    Cfg:Close(); H.flush()
end)

T.run()
