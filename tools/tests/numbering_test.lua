-- In game (13/10/2026, a Dwarf hunter): the window numbered the guide file's steps ("30 / 106"),
-- those of other races, classes and options included, and the steps Ding passed by itself
-- went by without a word: 30 -> 32 in the Wetlands (the trail climbed already), 111 -> 114 ->
-- 118 in Duskwood. Read as "the guide jumps several steps".
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local A11, A12 = "leveling-a11-duskwood-and-redridge-mountains", "leveling-a12-wetlands"
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { A11, A12 }, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L = Ding.Engine, Ding.Panel, Ding.L

local function stepOf(id, match)
    for i, step in ipairs(Ding:GetGuide(id).steps) do
        if match(step) then return i end
    end
    error("no such step in " .. id)
end
local function has(v, q)
    if type(v) == "table" then for _, x in ipairs(v) do if x == q then return true end end return false end
    return v == q
end

-- Plays a guide like the player up to step `upto` (quests, then "next" on the steps only the
-- player can validate).
local function playTo(id, upto)
    T.reset({ level = 25, race = "Dwarf", class = "HUNTER" })
    Ding.db.panel.shown = true
    E:SetGuide(id, 1, true); H.flush()
    H.tick(11)
    for _ = 1, 300 do
        if E.index >= upto then break end
        local before = E.index
        H.play(E:CurrentStep()); H.flush()
        if E.index == before then E:Next(); H.flush() end
    end
    T.eq(E.index, upto, "the guide played up to its step")
    H.tick(2)    -- past the finished step kept on screen
end

local function notices()
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do
        if row.action == "notice" then out[#out + 1] = H.plain(row.text) end
    end
    return out
end

T.test("the counter numbers the character's steps: the trainer comes right after the chest", function()
    local CHEST = stepOf(A11, function(s) return has(s.complete, 70) end)
    local TRAINER = stepOf(A11, function(s) return s.train and s.classes and #s.classes == 1 and s.classes[1] == "HUNTER" end)
    T.ok(TRAINER > CHEST + 1, "premise: steps of other races and classes between them")
    playTo(A11, CHEST)
    local n, total = E:StepNumber(CHEST)
    T.ok(n < CHEST and total < #E.guide.steps, "the other classes' steps are numbered")
    T.eq(H.plain(P.frame.stepText.text), L.STEP_LABEL:format(n))
    T.eq(H.plain(P.frame.stepTotal.text), L.STEP_TOTAL:format(total))
    E:Next(); H.flush()
    T.eq(E.index, TRAINER)
    T.eq(H.plain(P.frame.stepText.text), L.STEP_LABEL:format(n + 1), "the number jumped over other classes' steps")
    -- Minimized, the same numbers.
    P:SetCompact(true)
    T.eq(H.plain(P.frame.mini.count.text), L.COMPACT_COUNT:format(n + 1, total))
    P:SetCompact(false)
end)

T.test("\"go to step\" names the step by the character's number", function()
    local CHEST = stepOf(A11, function(s) return has(s.complete, 70) end)
    playTo(A11, CHEST)
    local FOLSOM = stepOf(A11, function(s) return has(s.turnin, 70) end)
    P.findOffer = { guide = A11, index = FOLSOM, action = "turnin", quest = 70, from = { guide = A11, index = E.index } }
    P:Update()
    local row
    for _, r in ipairs(P.rowsShown) do if r.action == "jump" then row = r end end
    T.ok(row, "no offer row")
    T.eq(H.plain(row.text), L.FIND_JUMP:format((E:StepNumber(FOLSOM)), E.guide.title))
    T.ok(E:StepNumber(FOLSOM) < FOLSOM, "the file's index in the offer")
end)

T.test("a step passed by itself is said: the trail climbed already (30 -> 32)", function()
    -- The last of the fragments' steps, then the trail (already up there), then the turn-in.
    local steps = Ding:GetGuide(A12).steps
    local last = stepOf(A12, function(s) return has(s.complete, 299) end)
    while steps[last + 1] and has(steps[last + 1].complete, 299) do last = last + 1 end
    local TRAIL, TURNIN = last + 1, last + 2
    T.ok(steps[TRAIL].go and steps[TRAIL].text == "Climb the trail", "premise: the trail right after the fragments")
    T.ok(has(steps[TURNIN].turnin, 296), "premise: the turn-in after the trail")
    -- The fragments' steps one after the other (the mock completes the quest at once).
    playTo(A12, stepOf(A12, function(s) return has(s.complete, 299) end))
    E:SetGuide(A12, last, true); H.flush()
    H.tick(11)
    T.eq(E.index, last)
    H.player.map, H.player.x, H.player.y = 1437, 37.07, 43.02     -- up the trail already
    H.complete(299); H.flush()
    H.tick(3)
    T.eq(E.index, TURNIN, "the trail is not passed once there")
    local n = E:StepNumber(TURNIN)
    T.eq(n, E:StepNumber(last) + 2, "premise: the trail is numbered")
    local text = L.PASSED_STEP:format(L.QUOTE:format("Climb the trail"), L.PASSED_THERE)
    local found = false
    for _, t in ipairs(notices()) do if t == text then found = true end end
    T.ok(found, "the trail passed without a word: " .. table.concat(notices(), " | "))
    -- The next move takes it away.
    E:Next(); H.flush()
    for _, t in ipairs(notices()) do T.ok(t ~= text, "still said under the next step") end
end)

T.test("a step passed at once after \"next\" is said too", function()
    local CHEST = stepOf(A11, function(s) return has(s.complete, 70) end)
    playTo(A11, CHEST)
    local after
    for i = CHEST + 1, #E.guide.steps do
        if Ding:StepForCharacter(E.guide.steps[i]) then after = i break end
    end
    -- The trainer visited before the chest: "next" on the chest passes it at once.
    Ding.char.manual[A11] = Ding.char.manual[A11] or {}
    Ding.char.manual[A11][after] = true
    E:Next(); H.flush()
    T.ok(E.index > after)
    local text = L.PASSED_STEP:format(L.QUOTE:format(H.plain(E:Summary(E.guide.steps[after]))), L.PASSED_MARKED)
    local found = false
    for _, t in ipairs(notices()) do if t == text then found = true end end
    T.ok(found, "passed at once without a word: " .. table.concat(notices(), " | "))
end)

T.run()
