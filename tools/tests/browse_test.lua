-- In game (13/10/2026, v1.4.0 candidate): "When I go back through the steps with the left
-- arrow, clicking several times, then press the right arrow, it jumps a number of steps. It
-- doesn't go to the one right after." "Next" after "Previous" marked the step shown done and
-- went to the next step still to do. Browsing is one step at a time both ways.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local GUIDE = "leveling-a12-wetlands"
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { GUIDE }, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P = Ding.Engine, Ding.Panel

-- A Dwarf hunter plays the Wetlands like the player (quests, then "next" on the steps only
-- the player can validate) past the class trainers' steps, those of other classes included.
local function play()
    T.reset({ level = 27, race = "Dwarf", class = "HUNTER" })
    Ding.db.panel.shown = true
    E:SetGuide(GUIDE, 1, true); H.flush()
    H.tick(11)
    for _ = 1, 200 do
        if E.index >= 53 then break end
        local before = E.index
        H.play(E:CurrentStep()); H.flush()
        if E.index == before then E:Next(); H.flush() end
    end
    H.tick(2)    -- past the finished step kept on screen
    return E.index
end

local function marks()
    local n = 0
    for _ in pairs(Ding.char.manual[GUIDE] or {}) do n = n + 1 end
    for _ in pairs(Ding.char.skipped and Ding.char.skipped[GUIDE] or {}) do n = n + 1 end
    return n
end

-- "Previous" n times: the steps shown, the latest first.
local function back(n)
    local shown = {}
    for k = 1, n do
        E:Prev(); H.flush()
        shown[k] = E.index
    end
    return shown
end

T.test("previous five times, then next five times: one step at a time back to the guide's step", function()
    local current = play()
    T.ok(current >= 53, "premise: past the trainers' steps (" .. current .. ")")
    local before = marks()
    local shown = back(5)
    for k = 2, 5 do T.ok(shown[k] < shown[k - 1], "\"previous\" did not go back") end
    for i = shown[5], current - 1 do
        -- Every step between is one "previous" showed, or one for another class or race.
        local listed = false
        for _, s in ipairs(shown) do if s == i then listed = true end end
        T.ok(listed or not Ding:StepApplies(E.guide.steps[i]), ("step %d skipped by \"previous\""):format(i))
    end
    local expected = { shown[4], shown[3], shown[2], shown[1], current }
    for k = 1, 5 do
        local preview = E:NextSteps(1)[1]
        E:Next(); H.flush()
        T.eq(E.index, expected[k], ("\"next\" number %d jumped"):format(k))
        T.ok(E:CurrentStep() == preview, ("\"next\" number %d: not the step the preview showed"):format(k))
    end
    T.eq(marks(), before, "browsing marked steps")
    T.ok(not E.hold, "still held on the guide's step")
    -- On the guide's step, "next" keeps its meaning: done by hand, on to the next.
    E:Next(); H.flush()
    T.eq(E:StepMark(current), "manual")
    T.ok(E.index > current)
end)

T.test("browsing back saves the guide's step, not the one on screen", function()
    local current = play()
    back(3)
    T.eq(Ding.char.step, current)
    T.eq(Ding.char.lastStep[GUIDE], current)
end)

T.test("\"go to step\" on a step behind: shown like with previous, then next one at a time", function()
    local current = play()
    local shown = back(3)
    for _ = 1, 3 do E:Next(); H.flush() end
    T.eq(E.index, current)
    local q
    for _, key in ipairs({ "turnin", "accept", "complete" }) do q = q or (E.guide.steps[shown[3]][key] or {})[1] end
    P.findOffer = { guide = GUIDE, index = shown[3], action = "turnin", quest = q, from = { guide = GUIDE, index = current } }
    P:Jump(); H.flush()
    T.eq(E.index, shown[3])
    T.ok(E:IsBrowsing(), "the guide moved to the step found behind")
    E:Next(); H.flush()
    T.eq(E.index, shown[2])
end)

T.test("focus mode: LB and RB browse one step at a time", function()
    local current = play()
    P:StartFocus()
    H.press("PADLSHOULDER"); H.press("PADLSHOULDER")
    local there = E.index
    T.ok(there < current, "LB did not go back")
    H.press("PADRSHOULDER")
    T.ok(E.index > there and E.index < current, "RB jumped back to the guide's step")
    H.press("PADRSHOULDER")
    T.eq(E.index, current)
    P:StopFocus()
end)

T.test("\"mark as done\" from the step menu still marks a step shown with previous", function()
    local current = play()
    back(1)
    local shown = E.index
    E:MarkDone(); H.flush()
    T.eq(E:StepMark(shown), "manual")
    T.ok(not E.hold)
    T.ok(E.index >= current or not E:IsStepDone(E:CurrentStep(), E.index))
end)

T.run()
