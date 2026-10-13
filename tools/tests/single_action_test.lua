-- Each action shows once (Yendi, in game: "the gamepad interface and the mouse interface
-- coexist, so I get duplicate buttons": "(A) Import" in the hint bar next to the Import
-- button). With a gamepad, a button carries its chips (A on the focused one, B on the one
-- that closes, Y where a button selects) and the hint bar keeps only what has no button;
-- without one, the buttons alone and the mouse help. Checked in every window with a hint bar
-- (import / export, settings, move mode, nearby services), gamepad plugged in and not, while
-- it is plugged in or out, and in every language (buttons and hints fit).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local Cfg, G, W, F, L = Ding.Config, Ding.Gamepad, Ding.ImportWindow, Ding.Finder, Ding.L
local root = tools .. "/.."

local GUIDE = [[{ id = "t-once", title = "Once", minLevel = 1, maxLevel = 10,
    steps = { { accept = 456 }, { turnin = 456 } } }]]

local function pad(on)
    H.setGamepadConnected(on)
    H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
    H.flush()
end

local function closeAll()
    if G:IsMoving() then G:CancelMove() end
    if W.frame then W:Close() end
    if F.frame then F:Close() end
    Cfg:Close()
    H.flush()
end

local function start()
    closeAll()
    T.reset({ level = 1 })
    for id in pairs(Ding.db.imported) do Ding.Import:Delete(id) end
    Ding.Engine:SetGuide("nightelf-01-shadowglen", 1, true)
    pad(true)
end

---------------------------------------------------------------------------
-- What is on screen: the hints of a bar, the buttons with their chips
---------------------------------------------------------------------------
-- The bar's entries shown: { label, keys = { key = true } }.
local function hintsOf(bar)
    local out = {}
    for i, hint in ipairs(bar.list or {}) do
        local item = bar.items[i]
        if item and item.label:IsShown() then
            local keys = {}
            if type(hint.keys) == "string" then keys[hint.keys] = true end
            if type(hint.keys) == "table" then
                for _, key in ipairs(hint.keys) do keys[key] = true end
            end
            out[#out + 1] = { label = hint.label, keys = keys }
        end
    end
    return out
end

-- The keys of the chips shown on a button (UI.ButtonKeys).
local function chipsOn(b)
    local keys = {}
    for _, g in ipairs(b.keyGlyphs or {}) do
        if g:IsShown() then keys[g.padKey] = true end
    end
    return keys
end

local function anyKey(keys) return next(keys) ~= nil end

-- No label both a hint and a button, no gamepad button both a hint and a chip on screen.
local function once(where, hints, buttons)
    for _, hint in ipairs(hints) do
        for _, b in ipairs(buttons) do
            T.ok(not b.label or H.plain(b.label) ~= H.plain(hint.label),
                ("%s: %q both a hint and a button"):format(where, hint.label))
            for key in pairs(hint.keys) do
                T.ok(not b.keys[key], ("%s: %s both in the hints (%q) and on %s"):format(where, key, hint.label,
                    b.label and ("the button " .. b.label) or "the window"))
            end
        end
    end
end

-- Without a gamepad: no chip anywhere, the bar is the mouse help (one text without keys).
local function mouseOnly(where, bar, buttons)
    for _, b in ipairs(buttons) do
        T.ok(not anyKey(b.keys), ("%s: a gamepad chip on %s without a gamepad"):format(where, b.label or "the window"))
    end
    local hints = hintsOf(bar)
    T.eq(#hints, 1, where .. ": mouse help")
    T.ok(not anyKey(hints[1].keys), where .. ": a gamepad hint without a gamepad")
end

---------------------------------------------------------------------------
-- Import window
---------------------------------------------------------------------------
local function importButtons()
    local out = {}
    for i, b in ipairs(W.frame.buttons) do
        if b:IsShown() then out[#out + 1] = { label = W.actions[i].label, keys = chipsOn(b), button = b } end
    end
    return out
end

local function checkImport(where)
    local f = W.frame
    local buttons = importButtons()
    if G:Active() then
        once(where, hintsOf(f.hints), buttons)
    else
        mouseOnly(where, f.hints, buttons)
    end
    -- Everything fits: the hints all shown, left of the buttons or on a line of their own.
    T.eq(f.hints.shown, #f.hints.list, where .. ": a hint left out")
    local left = f:GetWidth()
    for _, b in ipairs(buttons) do
        local p = b.button.points[1]
        left = math.min(left, f:GetWidth() + p[4] - b.button:GetWidth())
    end
    T.ok(left >= 12, ("%s: the buttons do not fit (%d)"):format(where, left))
    local p = f.hints.points[#f.hints.points]
    if p[5] == 9 then
        T.ok(p[4] + (f.hints.used or 0) + 16 <= left, where .. ": the hints run into the buttons")
    else
        T.ok(f:GetHeight() > 440, where .. ": hints on a line of their own, the window did not grow")
    end
end

T.test("import window, gamepad: A on the focused button, B on Cancel; only Y in the hint bar", function()
    start()
    SlashCmdList.DING("import"); H.flush()
    local f = W.frame
    local import, cancel = f.buttons[1], f.buttons[2]
    T.ok(chipsOn(import).PAD1 and not chipsOn(import).PAD2, "A not on the focused Import button")
    T.ok(chipsOn(cancel).PAD2 and not chipsOn(cancel).PAD1, "B not on Cancel")
    local hints = hintsOf(f.hints)
    T.eq(#hints, 1, "hints")
    T.eq(hints[1].label, L.IMPORT_SELECT)
    checkImport("import")
    -- D-pad: A goes to Cancel, which keeps B; the buttons keep their size.
    local widths = { import:GetWidth(), cancel:GetWidth() }
    H.press("PADDRIGHT")
    T.ok(chipsOn(cancel).PAD1 and chipsOn(cancel).PAD2, "A and B not both on the focused Cancel")
    T.ok(not anyKey(chipsOn(import)), "A left on Import")
    T.eq(import:GetWidth(), widths[1], "Import changed size with the focus")
    T.eq(cancel:GetWidth(), widths[2], "Cancel changed size with the focus")
    checkImport("import, Cancel focused")
    -- The Y hint is still a button for the mouse.
    local item = f.hints.items[1]
    T.ok(item.button:IsShown(), "the Y hint is not clickable")
    item.button.scripts.OnClick(item.button)
    T.ok(f.text.edit.selection, "a click on the Y hint does not select the text")
    closeAll()
end)

T.test("import window, gamepad: after an import, B on Close; export: Y on Select all, nothing left to hint", function()
    start()
    W:Open("import"); H.flush()
    local f = W.frame
    H.type(f.text.edit, GUIDE)
    H.press("PAD1")
    T.ok(Ding:GetGuide("t-once"), "not imported")
    T.ok(chipsOn(f.buttons[1]).PAD1, "A not on Follow")
    T.ok(chipsOn(f.buttons[3]).PAD2, "B not on Close")
    checkImport("after an import")
    closeAll()
    SlashCmdList.DING("export"); H.flush()
    T.ok(chipsOn(f.buttons[1]).PAD4 and chipsOn(f.buttons[1]).PAD1, "A and Y not on Select all")
    T.ok(chipsOn(f.buttons[3]).PAD2, "B not on Close")
    T.eq(#hintsOf(f.hints), 0, "the export repeats a button in its hints")
    checkImport("export")
    H.press("PAD4")
    T.ok(f.text.edit.selection, "Y does not select the text")
    closeAll()
end)

T.test("import window, mouse: buttons alone, the mouse help; plugged in or out while open, it follows", function()
    start()
    pad(false)
    W:Open("import"); H.flush()
    local f = W.frame
    checkImport("import, mouse")
    T.eq(hintsOf(f.hints)[1].label, L.IMPORT_MOUSE)
    T.ok(not f.buttons[1].focus.ring:IsShown(), "gamepad focus ring without a gamepad")
    pad(true)
    T.ok(chipsOn(f.buttons[1]).PAD1 and chipsOn(f.buttons[2]).PAD2, "chips missing once plugged in")
    T.eq(hintsOf(f.hints)[1].label, L.IMPORT_SELECT, "the hint bar did not switch to the gamepad")
    checkImport("import, plugged in")
    pad(false)
    checkImport("import, unplugged")
    T.eq(hintsOf(f.hints)[1].label, L.IMPORT_MOUSE, "the hint bar did not switch back")
    pad(true)
    closeAll()
end)

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------
-- The chips of the window (B on the close cross or the page's title, LB / RB at the tabs'
-- ends) and of the focused row (A on a check box or a button).
local function settingsButtons()
    local f = Cfg.frame
    local out = {}
    if f.back:IsShown() then out[#out + 1] = { keys = { PAD2 = true } } end
    if f.lb:IsShown() then out[#out + 1] = { keys = { PADLSHOULDER = true } } end
    if f.rb:IsShown() then out[#out + 1] = { keys = { PADRSHOULDER = true } } end
    local title = Cfg.page and Cfg.page.rows[1]
    if title and title.key:IsShown() then out[#out + 1] = { keys = { PAD2 = true } } end
    local row = Cfg.focus
    if row and row.aGlyph and row.aGlyph:IsShown() then out[#out + 1] = { keys = { PAD1 = true } } end
    if row and row.button then
        out[#out + 1] = { label = row.button.text:GetText(), keys = chipsOn(row.button) }
    end
    return out
end

local function checkSettings(where)
    if G:Active() then
        once(where, hintsOf(Cfg.frame.help), settingsButtons())
    else
        mouseOnly(where, Cfg.frame.help, settingsButtons())
    end
    T.eq(Cfg.frame.help.shown, #Cfg.frame.help.list, where .. ": a hint left out")
end

-- Every focusable row of every tab.
local function eachRow(fn)
    for i, tab in ipairs(Cfg.TABS) do
        Cfg:Open(i, 1); H.flush()
        for n = 1, #(tab.focusable or {}) do
            Cfg:SetFocus(tab.focusable[n])
            fn(tab.key .. " #" .. n, tab.focusable[n])
        end
    end
end

T.test("settings, gamepad and mouse: every row of every tab shows each action once", function()
    start()
    for _, on in ipairs({ true, false }) do
        pad(on)
        eachRow(function(where, row)
            checkSettings((on and "gamepad, " or "mouse, ") .. where)
            if on and (row.kind == "check" or row.kind == "button") then
                T.eq(#Cfg.frame.help.list, 0, where .. ": the footer repeats the row's A")
            end
        end)
        closeAll()
    end
    pad(true)
end)

T.test("settings, gamepad: a confirmation, an open list and a page show each action once", function()
    start()
    Cfg:Open("appearance", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.RESET_ALL end, "default")
    H.press("PAD1")
    T.ok(Cfg.focus.confirming, "no confirmation")
    checkSettings("confirmation")
    H.press("PAD2")
    Cfg:Open("guide", 1); H.flush()
    H.press("PAD1")
    T.ok(Cfg.dropdown, "the list does not open")
    checkSettings("list open")
    H.press("PAD2")
    Cfg:Open("guide", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.IMPORTED_ROW end, "guides as text")
    H.press("PAD1")
    T.ok(Cfg.page, "the page of guides as text does not open")
    T.ok(Cfg.page.rows[1].key:IsShown(), "no B on the page's title")
    checkSettings("page")
    H.press("PADDDOWN")
    T.ok(Cfg.focus.button, "no button row on the page")
    checkSettings("page, a button row")
    pad(false)
    T.ok(not Cfg.page.rows[1].key:IsShown(), "B on the page's title without a gamepad")
    checkSettings("page, unplugged")
    pad(true)
    closeAll()
end)

---------------------------------------------------------------------------
-- Move mode, nearby services
---------------------------------------------------------------------------
local function startMove()
    local plate = G.plate
    -- The plate is built once: its labels in the language of the moment.
    if plate then
        plate.save.text:SetText(L.HINT_SAVE)
        plate.cancel.text:SetText(L.HINT_CANCEL)
        plate.reset.text:SetText(L.HINT_RESET)
    end
    Cfg:Open("appearance", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MOVE_PANEL end, "move")
    H.press("PAD1")
    T.ok(G:IsMoving(), "move mode not started")
    return G.plate
end

local function checkPlate(where)
    local plate = G.plate
    local buttons, right = {}, 12
    for _, b in ipairs({ plate.save, plate.cancel, plate.reset }) do
        buttons[#buttons + 1] = { label = b.text:GetText(), keys = chipsOn(b) }
        right = right + b:GetWidth() + 8
    end
    if G:Active() then
        once(where, hintsOf(plate.hints), buttons)
    else
        mouseOnly(where, plate.hints, buttons)
    end
    T.eq(plate.hints.shown, #plate.hints.list, where .. ": a hint left out")
    T.ok(right - 8 <= plate:GetWidth() - 12, ("%s: the buttons do not fit (%d)"):format(where, right - 8))
end

T.test("move mode: chips on Save, Cancel and Reset with a gamepad, none without; plugged in or out, it follows", function()
    start()
    startMove()
    checkPlate("move, gamepad")
    pad(false)
    checkPlate("move, unplugged")
    T.eq(hintsOf(G.plate.hints)[1].label, L.MOVE_DRAG)
    pad(true)
    checkPlate("move, plugged in")
    closeAll()
end)

T.test("nearby services: no button, the hints with a gamepad, the mouse help without; it follows", function()
    start()
    F:Open(); H.flush()
    local hints = hintsOf(F.frame.help)
    T.ok(#hints == 2 and hints[1].keys.PAD1 and hints[2].keys.PAD2, "A Go · B Back")
    pad(false)
    mouseOnly("services, unplugged", F.frame.help, {})
    T.eq(hintsOf(F.frame.help)[1].label, L.FINDER_MOUSE, "the help did not switch to the mouse")
    pad(true)
    T.ok(hintsOf(F.frame.help)[1].keys.PAD1, "the help did not switch back to the gamepad")
    closeAll()
end)

---------------------------------------------------------------------------
-- Every language: the buttons, their chips and the hints fit
---------------------------------------------------------------------------
local function loadStrings(name)
    local ns, getLocale = {}, _G.GetLocale
    _G.GetLocale = function() return name end
    local ok, err = pcall(assert(loadfile(root .. "/Ding/Locales/" .. name .. ".lua")), "Ding", ns)
    _G.GetLocale = getLocale
    assert(ok, err)
    return ns.Locales[name]
end

-- Ding.L takes the strings of `strings` (the modules read it when they lay out).
local function useStrings(strings)
    local keys = {}
    for k in pairs(L) do keys[#keys + 1] = k end
    for _, k in ipairs(keys) do L[k] = nil end
    for k, v in pairs(strings) do L[k] = v end
end

T.test("every language: import, export, settings buttons and move mode fit, gamepad and mouse", function()
    start()
    local own = {}
    for k, v in pairs(L) do own[k] = v end
    local languages = { "enUS" }
    for _, name in ipairs(dofile(tools .. "/guide_texts.lua").LOCALES) do languages[#languages + 1] = name end
    for _, name in ipairs(languages) do
        useStrings(loadStrings(name))
        for _, on in ipairs({ true, false }) do
            pad(on)
            local where = name .. (on and ", gamepad" or ", mouse")
            W:Open("import"); H.flush()
            checkImport(where .. ", import")
            H.press("PADDRIGHT")
            checkImport(where .. ", import, Cancel focused")
            H.type(W.frame.text.edit, GUIDE)
            W:Press(1); H.flush()
            T.ok(Ding:GetGuide("t-once"), where .. ": not imported")
            checkImport(where .. ", after an import")
            Ding.Import:Delete("t-once")
            W:Open("export"); H.flush()
            checkImport(where .. ", export")
            W:ToggleCompact(); H.flush()
            checkImport(where .. ", export on one line")
            closeAll()
            -- Every button row, focused: its button (with room for A) stays in its 160 units.
            for _, tab in ipairs(Cfg.TABS) do tab.built = nil end
            eachRow(function(row_where, row)
                if row.button then
                    T.ok(row.button:GetWidth() + 8 <= 160, ("%s, %s: the button %q is too wide (%d)"):format(
                        where, row_where, row.button.text:GetText(), row.button:GetWidth()))
                end
                T.eq(Cfg.frame.help.shown, #Cfg.frame.help.list, where .. ", " .. row_where .. ": a hint left out")
            end)
            closeAll()
            startMove()
            checkPlate(where .. ", move")
            closeAll()
        end
    end
    useStrings(own)
    for _, tab in ipairs(Cfg.TABS) do tab.built = nil end
    pad(true)
end)

T.run()
