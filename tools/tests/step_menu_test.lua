-- Step menu (right click on the guide window): mark the step done by hand or skip it. Steps
-- left that way keep their own color (violet: marked done, amber: skipped) for what the game
-- does not confirm; "take this guide up where I am" forgets the marks.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P, L, C = Ding.Engine, Ding.Panel, Ding.L, Ding.UI.C

local G = "t-menu"
Ding.RegisterGuide({ id = G, title = "Menu", races = { "NightElf" }, steps = {
    { accept = { 456, 458 } },        -- 1
    { complete = 456 },               -- 2
    { turnin = 456 },                 -- 3
    { train = true },                 -- 4
} })

local function start(states)
    if P.stepMenu then P:CloseStepMenu() end
    T.reset({ level = 3 })
    Ding.char.skipped = {}
    Ding.db.panel.shown = true
    T.quests(states or {})
    E:SetGuide(G, 1, true)
    H.flush()
end

local function rightClickRow(i)
    local r = P.frame.rows[i or 1]
    r.scripts.OnClick(r, "RightButton")
end

local function choose(item)
    local b = P.stepMenu[item]
    b.scripts.OnClick(b, "LeftButton")
    H.flush()
end

-- The step's own rows (not the control that undoes its mark).
local function stepRows()
    local out = {}
    for _, row in ipairs(P.rowsShown) do
        if row.action ~= "unmark" then out[#out + 1] = row end
    end
    return out
end

local function undoRow()
    for i, row in ipairs(P.rowsShown) do
        if row.action == "unmark" then return row, i end
    end
end

local function hasHint(text)
    for _, row in ipairs(P.rowsShown) do
        if row.sub and row.sub:find(text, 1, true) then return true end
    end
    return false
end

T.test("right click on a row: \"mark as done\" and \"skip\" menu", function()
    start()
    rightClickRow()
    T.ok(P.stepMenu and P.stepMenu:IsShown(), "menu missing")
    T.eq(P.stepMenu.done.text:GetText(), L.STEP_MENU_DONE)
    T.eq(P.stepMenu.skip.text:GetText(), L.STEP_MENU_SKIP)
    T.eq(E.index, 1, "a right click changed the step")
end)

T.test("right click on the window: the same menu; a click elsewhere closes it", function()
    start()
    P.frame.scripts.OnMouseUp(P.frame, "RightButton")
    T.ok(P.stepMenu:IsShown(), "menu missing")
    P.stepMenu.catcher.scripts.OnClick(P.stepMenu.catcher, "LeftButton")
    T.ok(not P.stepMenu:IsShown(), "menu stayed open")
end)

T.test("mark as done: step validated by hand, violet when going back to it", function()
    start()
    rightClickRow()
    choose("done")
    T.ok(not P.stepMenu:IsShown(), "menu stayed open")
    T.eq(E.index, 2)
    T.eq(E:StepMark(1), "manual")
    E:Prev(); H.flush()
    T.eq(E.index, 1)
    T.eq(E:StepMark(1), "manual", "\"previous\" cleared the mark")
    for _, row in ipairs(stepRows()) do T.eq(row.state, "manual", row.text) end
    T.ok(hasHint(L.STEP_MARKED_DONE), "no \"marked by hand\" hint")
    -- Violet: the row's glyph (and its background in the themes that tint rows).
    local r = P.frame.rows[1]
    local glyph = r.icon.tex:IsShown() and r.icon.tex.vertexColor or r.icon.letter.color
    T.ok(glyph and glyph[1] == C.manual[1], "glyph not violet")
    T.ok(not r.bg:IsShown() or r.bg.color[1] == C.manualRowBg[1], "background not violet")
end)

T.test("skip: step recorded as skipped, amber when going back to it", function()
    start()
    rightClickRow()
    choose("skip")
    T.eq(E.index, 2)
    T.eq(E:StepMark(1), "skipped")
    T.ok(not (Ding.char.manual[G] or {})[1], "skipped step marked done")
    E:Prev(); H.flush()
    for _, row in ipairs(stepRows()) do T.eq(row.state, "skipped", row.text) end
    T.ok(hasHint(L.STEP_MARKED_SKIPPED), "no \"skipped\" hint")
end)

T.test("what the game confirms stays green in a step marked by hand", function()
    start({ [456] = "log" })
    T.eq(E.index, 1)
    rightClickRow()
    choose("done")
    E:Prev(); H.flush()
    local states = {}
    for _, row in ipairs(stepRows()) do states[row.quest] = row.state end
    T.eq(states[456], "done", "accepted quest not green")
    T.eq(states[458], "manual", "quest not accepted not violet")
end)

T.test("undo \"mark as done\": the control under the step (a click, A in focus mode), or the menu", function()
    start()
    rightClickRow()
    choose("done")
    T.eq(undoRow(), nil, "an undo control on a step not marked")
    E:Prev(); H.flush()
    local row, i = undoRow()
    T.ok(row and row.text == L.STEP_UNDO_DONE, "no undo control under the marked step")
    T.eq(row.state, "button")
    local r = P.frame.rows[i]
    r.scripts.OnClick(r, "LeftButton"); H.flush()
    T.eq(E:StepMark(1), nil, "the mark stays")
    T.eq(E.index, 1, "not on the step any more")
    T.ok(not E.hold, "the step is still held")
    for _, row2 in ipairs(stepRows()) do T.ok(row2.state ~= "manual", "still violet: " .. tostring(row2.text)) end
    T.eq(undoRow(), nil, "the control stays once undone")
    -- Again, from the menu.
    rightClickRow()
    choose("done")
    E:Prev(); H.flush()
    rightClickRow()
    T.ok(P.stepMenu.undo:IsShown() and P.stepMenu.items[1] == P.stepMenu.undo, "the menu's undo is not first")
    T.eq(P.stepMenu.undo.text:GetText(), L.STEP_UNDO_DONE)
    choose("undo")
    T.eq(E:StepMark(1), nil, "the menu's undo does not clear the mark")
    -- Focus mode: A on the control.
    rightClickRow()
    choose("done")
    E:Prev(); H.flush()
    P:StartFocus(); H.flush()
    local _, j = undoRow()
    P.focusIndex = j; P:Update()
    T.ok(P.frame.rows[j].key:IsShown(), "no A on the focused undo control")
    H.press("PAD1")
    T.eq(E:StepMark(1), nil, "A on the undo control")
    P:StopFocus()
end)

T.test("undo the skip; undo from a later step goes back to it; a step the game says is done goes on", function()
    start()
    rightClickRow()
    choose("skip")
    E:Prev(); H.flush()
    local row = undoRow()
    T.eq(row and row.text, L.STEP_UNDO_SKIP)
    rightClickRow()
    T.eq(P.stepMenu.undo.text:GetText(), L.STEP_UNDO_SKIP)
    choose("undo")
    T.eq(E:StepMark(1), nil)
    T.eq(E.index, 1)
    -- Marked done, the player two steps further: undoing it goes back there.
    start()
    E:Next(); H.flush()
    E:Next(); H.flush()
    T.eq(E.index, 3)
    T.ok(E:Unmark(1))
    T.eq(E.index, 1, "not back to the step to do")
    T.eq(E:StepMark(1), nil)
    T.ok(not E:Unmark(4), "a step without a mark")
    -- Done in the game since: the mark goes, the guide goes on from there.
    start({ [456] = "log", [458] = "log" })
    T.eq(E.index, 2, "the accepted quests do not pass step 1")
    E:Next(); H.flush()
    T.eq(E.index, 3)
    T.quests({ [456] = "ready" })
    E:Prev(); H.flush()
    T.eq(E.index, 2)
    T.eq(E:StepMark(2), "manual")
    T.ok(E:Unmark())
    T.eq(E:StepMark(2), nil)
    T.eq(E.index, 3, "a step the game says is done is not passed again")
end)

T.test("going back to do a skipped step clears its mark", function()
    start()
    E:Skip(); H.flush()
    T.eq(E:StepMark(1), "skipped")
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 1)
    T.eq(E:StepMark(1), nil, "mark kept when going back to do it")
end)

T.test("resume where I am clears the marks: a step not done becomes to do again", function()
    start()
    rightClickRow()
    choose("done")              -- step 1 marked done by hand, nothing taken
    E:Skip(); H.flush()         -- step 2 skipped
    T.eq(E:StepMark(1), "manual")
    T.eq(E:StepMark(2), "skipped")
    E:Reset(); H.flush()
    T.eq(E:StepMark(1), nil)
    T.eq(E:StepMark(2), nil)
    T.ok(not E:IsStepDone(E.guide.steps[1], 1), "step marked by hand still done")
    T.eq(E.index, 1, "did not go back to the step not done")
end)

T.run()
