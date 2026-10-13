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
    for _, row in ipairs(P.rowsShown) do T.eq(row.state, "manual", row.text) end
    T.ok(hasHint(L.STEP_MARKED_DONE), "no \"marked by hand\" hint")
    T.ok(P.frame.rows[1].bg.color[1] == C.manualRowBg[1], "background not violet")
end)

T.test("skip: step recorded as skipped, amber when going back to it", function()
    start()
    rightClickRow()
    choose("skip")
    T.eq(E.index, 2)
    T.eq(E:StepMark(1), "skipped")
    T.ok(not (Ding.char.manual[G] or {})[1], "skipped step marked done")
    E:Prev(); H.flush()
    for _, row in ipairs(P.rowsShown) do T.eq(row.state, "skipped", row.text) end
    T.ok(hasHint(L.STEP_MARKED_SKIPPED), "no \"skipped\" hint")
end)

T.test("what the game confirms stays green in a step marked by hand", function()
    start({ [456] = "log" })
    T.eq(E.index, 1)
    rightClickRow()
    choose("done")
    E:Prev(); H.flush()
    local states = {}
    for _, row in ipairs(P.rowsShown) do states[row.quest] = row.state end
    T.eq(states[456], "done", "accepted quest not green")
    T.eq(states[458], "manual", "quest not accepted not violet")
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
