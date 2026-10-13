-- "Impossible" lines (quest not in the log) and skipping a step to do it later.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P = Ding.Engine, Ding.Panel

-- Quest ids above 900000 are not in QuestieDB: no required level.
local A, B, C, D = 900701, 900702, 900703, 900704
Ding.RegisterGuide({ id = "t-skip", title = "Skip", races = { "NightElf" }, steps = {
    { accept = { A, B } },     -- 1
    { complete = A },          -- 2
    { complete = B },          -- 3
    { turnin = B },            -- 4
    { train = true },          -- 5 manual
    { turnin = A },            -- 6
} })
Ding.RegisterGuide({ id = "t-skip-end", title = "End", races = { "NightElf" },
    steps = { { accept = C }, { complete = C }, { accept = D } } })
Ding.RegisterGuide({ id = "t-skip-next", title = "Next", races = { "NightElf" }, steps = { { accept = C } } })
Ding.RegisterGuide({ id = "t-skip-chain", title = "Chain", races = { "NightElf" }, next = "t-skip-next",
    steps = { { accept = D }, { complete = D } } })

local function start(states, guide, index)
    T.reset({ level = 2 })
    T.quests(states or { [A] = "log", [B] = "log" })
    E:SetGuide(guide or "t-skip", index or 1, true)
    H.tick(11)    -- past the resume window
    H.flush()
end

local function line(lines, kind)
    for _, l in ipairs(lines) do
        if l.icon and l.icon:find(kind) and not l.indent then return l end
    end
end

---------------------------------------------------------------------------
-- Impossible lines
---------------------------------------------------------------------------
T.test("complete a quest not in the log: impossible row, after \"Accept\"", function()
    start({ [B] = "log" })
    T.eq(E.index, 1)
    local lines = E:Describe(E.guide.steps[2])
    T.ok(lines[1].text:find(Ding.L.ACCEPT, 1, true), "no \"Accept\" row first")
    T.ok(not lines[1].impossible, "\"Accept\" marked impossible")
    T.ok(lines[2].impossible, "\"Complete\" not marked impossible")
end)

T.test("quest in the log or turned in: nothing impossible", function()
    start()
    T.ok(not E:Describe(E.guide.steps[2])[1].impossible, "quest in the log")
    T.quests({ [A] = "turnedin" })
    for _, l in ipairs(E:Describe(E.guide.steps[6])) do T.ok(not l.impossible, "quest turned in") end
end)

T.test("turn in a quest not in the log: impossible row", function()
    start({ [A] = "log" })
    local turnin
    for _, l in ipairs(E:Describe(E.guide.steps[4])) do
        if l.text:find(Ding.L.TURNIN, 1, true) then turnin = l end
    end
    T.ok(turnin and turnin.impossible, "turn-in not marked impossible")
end)

T.test("preview of the next step: never impossible", function()
    start({})
    for _, l in ipairs(E:Describe(E.guide.steps[2], true)) do T.ok(not l.impossible) end
end)

T.test("window: impossible row greyed out, without background or counter", function()
    start({ [B] = "log" })
    T.eq(E.index, 1, "the guide does not wait for A to be accepted")
    E.index, E.hold = 2, true
    E:Refresh()
    local found, index
    for i, row in ipairs(P.rowsShown) do
        if row.state == "impossible" then found, index = row, i end
    end
    T.ok(found, "no impossible row in the window")
    T.ok(H.plain(found.text):find(Ding.L.ROW_COMPLETE:format(""), 1, true), "wrong row: " .. H.plain(found.text))
    local r = P.frame.rows[index]
    local grey = Ding.UI.C.disabled
    T.eq(r.text.color[1], grey[1], "text not greyed out")
    T.ok(not r.bg:IsShown(), "an impossible row has no background")
    T.ok(not r.counter:IsShown(), "an impossible row has no counter")
end)

---------------------------------------------------------------------------
-- Skip
---------------------------------------------------------------------------
T.test("skip: goes to the next step without validating this one", function()
    start()
    T.eq(E.index, 2)
    E:Skip(); H.flush()
    T.eq(E.index, 3)
    T.ok(not (Ding.char.manual["t-skip"] or {})[2], "skipped step marked done")
    T.ok(not E:IsStepDone(E.guide.steps[2], 2), "skipped step counted as done")
end)

T.test("skip: also skips the steps already done", function()
    start({ [A] = "log", [B] = "ready" })
    T.eq(E.index, 2)
    E:Skip(); H.flush()
    T.eq(E.index, 4, "step 3, already done, not skipped")
end)

T.test("skip: the engine does not go back on its own", function()
    start()
    E:Skip(); H.flush()
    T.quests({ [B] = "ready" })
    T.eq(E.index, 4)
end)

T.test("skipping a manual step: it stays to do", function()
    start({ [A] = "ready", [B] = "turnedin" })
    T.eq(E.index, 5)
    E:Skip(); H.flush()
    T.eq(E.index, 6)
    T.ok(not E:IsStepDone(E.guide.steps[5], 5), "manual step validated by \"skip\"")
end)

T.test("skipping the last step: guide finished, or next guide", function()
    start({ [A] = "ready", [B] = "turnedin" }, "t-skip", 6)
    T.eq(E.index, 6)
    E:Skip(); H.flush()
    T.ok(E.finished, "guide not finished")
    start({ [D] = "log" }, "t-skip-chain")
    T.eq(E.index, 2)
    E:Skip(); H.flush()
    T.eq(E.guide.id, "t-skip-next", "next guide not loaded")
    T.eq(E.index, 1)
end)

T.test("skipping in a finished guide or without a guide: nothing", function()
    start({ [A] = "ready", [B] = "turnedin" }, "t-skip", 6)
    E:Skip(); H.flush()
    E:Skip(); H.flush()
    T.ok(E.finished)
    E.guide = nil
    E:Skip()
end)

T.test("skip after \"previous\": the position is no longer held", function()
    start({ [A] = "ready", [B] = "log" })
    T.eq(E.index, 3)
    E:Prev(); H.flush()
    T.eq(E.index, 2)
    E:Skip(); H.flush()
    T.eq(E.index, 3)
    T.ok(not E.hold, "position still held")
    T.quests({ [B] = "ready" })
    T.eq(E.index, 4, "the guide no longer advances on its own")
end)

T.test("skipping does not time the step", function()
    start()
    Ding.db.timings = {}
    H.tick(5)
    E:Skip(); H.flush()
    T.eq(next(Ding.db.timings), nil, "duration saved for a skipped step")
end)

---------------------------------------------------------------------------
-- Back to a skipped step
---------------------------------------------------------------------------
T.test("go back: finds the skipped step, then moves forward again once it is done", function()
    start()
    E:Skip(); H.flush()
    E:Skip(); H.flush()
    T.eq(E.index, 4)
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 3, "not the closest skipped step")
    T.eq(Ding.char.step, 3, "step not saved")
    T.quests({ [B] = "ready" })
    T.eq(E.index, 4, "does not move on after the step is done")
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 2)
end)

T.test("go back with no skipped step: nothing moves, message", function()
    start()
    T.eq(E.index, 2)
    local said = {}
    local print = Ding.Print
    Ding.Print = function(_, msg) said[#said + 1] = msg end
    P:BackToSkipped()
    Ding.Print = print
    T.eq(E.index, 2)
    T.eq(said[1], Ding.L.NO_SKIPPED)
end)

T.test("go back from the end of the guide", function()
    start()
    E:Skip(); H.flush()
    T.quests({ [B] = "turnedin", [A] = "ready" })
    E:Next(); H.flush()    -- trainer
    T.eq(E.index, 6)
    T.quests({ [A] = "turnedin" })
    T.ok(E.finished)
    -- Step 2 (complete A) counts as done now that A is turned in: nothing left behind.
    T.ok(not E:BackToIncomplete(), "done step found again")
    T.ok(E.finished)
end)

T.test("go back from a finished guide to a skipped quest", function()
    start({ [C] = "log" }, "t-skip-end")
    T.eq(E.index, 2)
    E:Skip(); H.flush()
    T.quests({ [D] = "log" })
    T.ok(E.finished)
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 2)
    T.ok(not E.finished, "guide still marked finished")
    T.eq(H.plain(P.frame.stepText.text) .. H.plain(P.frame.stepTotal.text), Ding.L.STEP_LABEL:format(2) .. Ding.L.STEP_TOTAL:format(3))
    T.quests({ [C] = "ready" })
    T.ok(E.finished, "the guide does not finish once the step is done")
end)

T.test("go back to a skipped manual step", function()
    start({ [A] = "ready", [B] = "turnedin" })
    T.eq(E.index, 5)
    E:Skip(); H.flush()
    T.eq(E.index, 6)
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 5)
end)

T.test("a skipped manual step counts as done as soon as a later step progresses", function()
    -- Engine rule for manual steps (SPEC §3): progress in the next steps means the player is past it.
    start({ [A] = "ready", [B] = "turnedin" })
    E:Skip(); H.flush()
    T.quests({ [A] = "turnedin" })
    T.ok(E.finished)
    T.ok(not E:BackToIncomplete(), "manual step found again despite the progress")
    T.ok(E.finished)
end)

---------------------------------------------------------------------------
-- Controls
---------------------------------------------------------------------------
T.test("right click on next / previous; left click unchanged", function()
    start()
    local f = P.frame
    f.next.scripts.OnClick(f.next, "RightButton"); H.flush()
    T.eq(E.index, 3, "right click on next")
    f.prev.scripts.OnClick(f.prev, "RightButton"); H.flush()
    T.eq(E.index, 2, "right click on previous")
    f.next.scripts.OnClick(f.next, "LeftButton"); H.flush()
    T.eq(E.index, 3)
    T.ok(Ding.char.manual["t-skip"][2], "left click no longer validates the step")
end)

T.test("/ding skip and /ding back commands", function()
    start()
    SlashCmdList.DING("skip"); H.flush()
    T.eq(E.index, 3)
    SlashCmdList.DING("back"); H.flush()
    T.eq(E.index, 2)
end)

T.test("bindings declared and named, rows in the Bindings tab", function()
    local xml = assert(io.open(tools .. "/../Ding/Bindings.xml")):read("*a")
    T.ok(xml:find('name="DING_SKIP"', 1, true) and xml:find("Ding.Engine:Skip()", 1, true), "DING_SKIP")
    T.ok(xml:find('name="DING_UNSKIP"', 1, true) and xml:find("Ding.Panel:BackToSkipped()", 1, true), "DING_UNSKIP")
    T.eq(_G.BINDING_NAME_DING_SKIP, Ding.L.BIND_SKIP)
    T.eq(_G.BINDING_NAME_DING_UNSKIP, Ding.L.BIND_UNSKIP)
    local C = Ding.Config
    C:Open("bindings", 1); H.flush()
    local actions = {}
    local first = C.focus
    repeat
        if C.focus.opts and C.focus.opts.action then actions[C.focus.opts.action] = true end
        H.press("PADDDOWN")
    until C.focus == first
    C:Close(); H.flush()
    T.ok(actions.DING_SKIP and actions.DING_UNSKIP, "rows missing")
end)

T.test("the gamepad triggers the assigned binding", function()
    start()
    H.bindings["SHIFT-PADDDOWN"] = "DING_SKIP"
    -- Bindings.xml body, as the client runs it.
    local xml = assert(io.open(tools .. "/../Ding/Bindings.xml")):read("*a")
    local body = xml:match('name="DING_SKIP"[^>]*>(.-)</Binding>')
    assert(loadstring(body))()
    H.flush()
    T.eq(E.index, 3)
    H.bindings["SHIFT-PADDDOWN"] = nil
end)

T.run()
