-- The NPC directory's trip ends whenever the player moves the guide (next, mark done, skip,
-- back, another step or section), and on demand: the "Cancel the trip" control under the
-- trip's notice (a click, A in focus mode), the step menu's first entry, the directory's first
-- row, /ding cancel. Then the arrow follows the step again at once.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, F = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Finder

local G = "t-trip-cancel"
Ding.RegisterGuide({ id = G, title = "Trip cancel", races = { "NightElf" }, steps = {
    { accept = 456 },                 -- 1
    { accept = 458 },                 -- 2
    { turnin = 456 },                 -- 3
    { text = "End" },                 -- 4
} })
Ding.RegisterGuide({ id = G .. "-2", title = "Trip cancel 2", races = { "NightElf" }, steps = {
    { accept = 457 },
} })

local chat = {}
local addMessage = DEFAULT_CHAT_FRAME.AddMessage
DEFAULT_CHAT_FRAME.AddMessage = function(frame, msg)
    chat[#chat + 1] = H.plain(msg)
    return addMessage(frame, msg)
end
local function said(text)
    for _, line in ipairs(chat) do
        if line:find(text, 1, true) then return true end
    end
    return false
end

local function start()
    if P.stepMenu then P:CloseStepMenu() end
    F:Close()
    T.reset({ level = 3 })
    Ding.char.skipped = {}
    Ding.db.panel.shown = true
    H.player.map, H.player.x, H.player.y = 1438, 58.7, 44
    H.setGamepadConnected(true)
    E:SetGuide(G, 1, true); H.flush()
    H.tick(1)
    T.ok(F:Go("vendor"), "no vendor in Shadowglen")
    A.point = nil; A:Tick()
    T.eq(A.point.npc, F.trip.npc, "the arrow does not go to the vendor")
end

-- The arrow is back on the step: one of its targets.
local function onStep(where)
    T.eq(F.trip, nil, where .. ": the trip goes on")
    A:Tick()
    local point = A.point
    T.ok(point, where .. ": no target")
    local found = false
    for _, p in ipairs(E.candidates or {}) do
        if p.map == point.map and p.x == point.x and p.y == point.y then found = true end
    end
    T.ok(found, where .. ": the arrow is not on the step's target")
    for _, r in ipairs(P.rowsShown or {}) do
        T.ok(r.notice ~= "trip" and r.action ~= "tripcancel", where .. ": the trip is still shown")
    end
end

local function row(test)
    for i, r in ipairs(P.rowsShown or {}) do
        if test(r) then return r, i end
    end
end

local function click(frame, button)
    frame.scripts.OnClick(frame, button or "LeftButton")
    H.flush()
end

---------------------------------------------------------------------------
-- Moving the guide ends the trip
---------------------------------------------------------------------------
T.test("next, mark done, skip, back: the trip ends, the arrow takes the step's target at once", function()
    start()
    E:Next(); H.flush()
    T.eq(E.index, 2)
    onStep("next")
    start()
    P.frame.scripts.OnMouseUp(P.frame, "RightButton")
    click(P.stepMenu.done)
    onStep("mark done")
    start()
    P.frame.scripts.OnMouseUp(P.frame, "RightButton")
    click(P.stepMenu.skip)
    onStep("skip")
    start()
    E:Next(); H.flush()
    F:Go("vendor")
    E:Prev(); H.flush()
    T.eq(E.index, 1)
    onStep("back")
    -- The window's buttons: next, then back to a skipped step.
    start()
    click(P.frame.next)
    onStep("the next button")
end)

T.test("another step or section: a jump, the guide picked in the settings, a reset", function()
    start()
    E:SetGuide(G, 3, true); H.flush()
    onStep("another step")
    start()
    E:Resume(G .. "-2"); H.flush()
    T.eq(E.guide.id, G .. "-2")
    onStep("another section")
    start()
    E:Reset(); H.flush()
    onStep("take the guide up where I am")
end)

T.test("the guide's progress alone does not end it", function()
    start()
    T.quests({ [456] = "log" })
    H.tick(1)
    T.eq(E.index, 2, "the step did not move on")
    T.ok(F.trip, "the guide's own progress ended the trip")
    A.point = nil; A:Tick()
    T.eq(A.point.npc, F.trip.npc)
end)

---------------------------------------------------------------------------
-- Cancelling on demand
---------------------------------------------------------------------------
T.test("the trip's notice has a \"Cancel the trip\" control under it: a click ends the trip", function()
    start()
    local notice, i = row(function(r) return r.notice == "trip" end)
    T.ok(notice, "no trip notice")
    local cancel, j = row(function(r) return r.action == "tripcancel" end)
    T.ok(cancel and j == i + 1, "no cancel control right under the trip's notice")
    T.eq(cancel.text, L.TRIP_CANCEL)
    -- The notice itself only informs.
    P:Aim(notice)
    T.ok(F.trip, "the notice ended the trip")
    -- A control: lighter under the mouse; no chip without the focus.
    local r = P.frame.rows[j]
    T.ok(r.hover:IsShown(), "no hover on the control")
    T.ok(not r.key:IsShown(), "A on the control without the focus")
    click(r)
    onStep("the cancel control")
end)

T.test("focus mode: A on the cancel control (its chip with a gamepad, none without)", function()
    start()
    P:StartFocus(); H.flush()
    local _, j = row(function(r) return r.action == "tripcancel" end)
    P.focusIndex = j; P:Update()
    T.ok(P.frame.rows[j].key:IsShown(), "no A on the focused control")
    H.setGamepadConnected(false); P:Update()
    T.ok(not P.frame.rows[j].key:IsShown(), "A on the control without a gamepad")
    H.setGamepadConnected(true); P:Update()
    H.press("PAD1")
    onStep("A on the cancel control")
    P:StopFocus()
end)

T.test("the step menu: \"Cancel the trip to …\" first during a trip, absent without one", function()
    start()
    P.frame.scripts.OnMouseUp(P.frame, "RightButton")
    local m = P.stepMenu
    T.ok(m.cancel:IsShown() and m.items[1] == m.cancel, "the cancel entry is not first")
    T.eq(m.cancel.text:GetText(), L.TRIP_CANCEL_TO:format(F.trip.name))
    T.ok(m:GetWidth() >= m.cancel.text:GetStringWidth() + 16, "the entry does not fit the menu")
    click(m.cancel)
    T.eq(E.index, 1, "cancelling moved the step")
    onStep("the menu")
    P.frame.scripts.OnMouseUp(P.frame, "RightButton")
    T.ok(not m.cancel:IsShown() and m.items[1] == m.done, "a cancel entry without a trip")
    P:CloseStepMenu()
end)

T.test("the directory's binding during a trip: its first row cancels, focused", function()
    start()
    F:Toggle(); H.flush()
    T.eq(F.rows[1].label, L.TRIP_CANCEL)
    T.eq(F:Page().focus, 1)
    H.press("PAD1")
    T.ok(not F.frame:IsShown(), "the directory stays open")
    onStep("the directory's first row")
end)

T.test("/ding cancel", function()
    start()
    SlashCmdList.DING("cancel"); H.flush()
    T.ok(said(L.TRIP_CANCELLED), "not said")
    onStep("/ding cancel")
    SlashCmdList.DING("cancel"); H.flush()
    T.ok(said(L.TRIP_NONE), "no trip: not said")
    T.ok(L.HELP:find("/ding cancel", 1, true), "/ding cancel not in the help")
end)

T.run()
