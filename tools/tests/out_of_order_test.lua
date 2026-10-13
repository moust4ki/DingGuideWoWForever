-- In game (13/10/2026, a Dwarf hunter in "Duskwood and Redridge"): the character had done
-- Redridge before Duskwood. Taken up again in the middle of Duskwood (back from the Items
-- pack), the guide believed it was at the end of Redridge, step 132: it kept passing the
-- steps still to do between the quests of the log (the hunter trainer, the next quests of the
-- chains, the trips) and ran from Elwynn to step 99 in Duskwood; "next" passed several steps
-- at a time; and "The Night Watch" (57), made sticky at step 102, listed its monsters in red
-- under every step, going back to the finished "The Night Watch" (56) too.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local GUIDE = "leveling-a11-duskwood-and-redridge-mountains"
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { GUIDE }, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P = Ding.Engine, Ding.Panel

-- Redridge quests the character turned in before Duskwood (steps 86-97 and 117-132).
local REDRIDGE = { 20, 127, 150, 34, 128, 91, 180 }
local NIGHT_WATCH, NIGHT_WATCH_2 = 56, 57

-- The steps of the story, found by what they do (the route gains steps over time).
local function stepOf(match)
    for i, step in ipairs(Ding:GetGuide(GUIDE).steps) do
        if match(step) then return i end
    end
    error("no such step in " .. GUIDE)
end
local function has(v, id)
    if type(v) == "table" then for _, x in ipairs(v) do if x == id then return true end end return false end
    return v == id
end
local function classOnly(step, class)
    return step.classes and #step.classes == 1 and step.classes[1] == class
end
local FARLEY = stepOf(function(s) return has(s.turnin, 69) end)                -- Innkeeper Farley, Goldshire
local CHEST = stepOf(function(s) return has(s.complete, 70) end)                -- the storage chest
local TRAINER = stepOf(function(s) return s.train and classOnly(s, "HUNTER") end) -- the hunter trainer, Stormwind
local FOLSOM = stepOf(function(s) return has(s.turnin, 70) end)                 -- Caretaker Folsom
local CRATE = stepOf(function(s) return has(s.turnin, 72) end)                  -- the sealed crate
local NIGHT = stepOf(function(s) return has(s.complete, NIGHT_WATCH) end)       -- complete "The Night Watch" (56)
local STICKY = stepOf(function(s) return has(s.sticky, NIGHT_WATCH_2) end)      -- makes 57 sticky
local BOUNTY = stepOf(function(s) return has(s.turnin, 128) end)                -- end of Redridge

-- Plays the guide like the player (quests, then "next" on the steps only the player can
-- validate) up to step `upto`, in Elwynn Forest; Redridge is done.
local function playTo(upto)
    T.reset({ level = 25, race = "Dwarf", class = "HUNTER" })
    Ding.db.panel.shown = true
    Ding.char.sticky = nil
    E:SetGuide(GUIDE, 1, true); H.flush()
    H.tick(11)
    for _ = 1, 200 do
        if E.index >= upto then break end
        local before = E.index
        H.play(E:CurrentStep()); H.flush()
        if E.index == before then E:Next(); H.flush() end
    end
    T.eq(E.index, upto, "the guide played up to its step")
    for _, q in ipairs(REDRIDGE) do H.setQuest(q, "turnedin") end
    H.player.map, H.player.x, H.player.y = 1429, 44, 66      -- Goldshire
    H.fire("QUEST_LOG_UPDATE"); H.flush()
    H.tick(2)    -- past the finished step kept on screen
end

local function rowsOf(q)
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do
        if row.quest == q and not row.preview then out[#out + 1] = row end
    end
    return out
end

T.test("a section done earlier: the guide is taken up where the player is, not past it", function()
    playTo(FARLEY)
    T.ok(E:ProgressStep(E.guide) > 100, "premise: the quests alone put the character at the end of Redridge")
    E:Resume(GUIDE, true); H.flush()
    T.eq(E.index, FARLEY)
    T.eq(E.resumeTo, nil, "a resume still runs towards the end of Redridge")
    T.eq(Ding.char.lastStep[GUIDE], FARLEY)
    -- Innkeeper Farley, the storage chest: then the hunter trainer of Stormwind, Caretaker
    -- Folsom, the sealed crate and the trip indoors, one after the other.
    H.tick(11)
    H.turnin(69); H.accept(70); H.flush()
    T.eq(E.index, CHEST)
    H.complete(70); H.flush()
    T.eq(E.index, TRAINER, "the hunter trainer passed")
    H.tick(2)
    E:Next(); H.flush()
    T.eq(E.index, FOLSOM)
    H.turnin(70); H.accept(72); H.flush()
    T.eq(E.index, CRATE)
    H.turnin(72); H.accept(74); H.flush()
    T.eq(E.index, CRATE + 1, "sent from Stormwind to Duskwood")
end)

T.test("login with the resume the game saved towards the end of Redridge: dropped", function()
    playTo(FARLEY)
    H.turnin(69); H.accept(70); H.flush()
    T.eq(E.index, CHEST)
    -- The character's saved variables after the jump: step 59, resuming to step 132.
    Ding.char.step, Ding.char.resumeTo = CHEST, { guide = GUIDE, step = BOUNTY }
    Ding.char.lastStep[GUIDE] = BOUNTY
    E.guide, E.resumeTo = nil, nil
    E:Start(); H.flush()
    T.eq(E.guide and E.guide.id, GUIDE)
    T.eq(E.index, CHEST)
    T.eq(E.resumeTo, nil, "still resuming towards step 132")
    T.eq(Ding.char.resumeTo, nil)
    T.eq(Ding.char.lastStep[GUIDE], CHEST, "the section's place still points to the end of Redridge")
    -- Right after login too: a turn-in at step 132 is no proof the trainer was visited.
    T.ok(E:IsResuming(), "premise: the seconds after login")
    H.complete(70); H.flush()
    T.eq(E.index, TRAINER, "the hunter trainer passed")
end)

T.test("\"next\" goes to the step the preview shows first, never past a step still to do", function()
    playTo(FARLEY)
    E:Resume(GUIDE, true); H.flush()
    for _ = 1, 12 do
        local from, shown = E.index, E:NextSteps(1)[1]
        E:Next(); H.flush()
        T.ok(E:CurrentStep() == shown, ("from step %d, \"next\" went to step %d, not the preview's"):format(from, E.index))
        for i = from + 1, E.index - 1 do
            T.ok(E:IsStepDone(E.guide.steps[i], i), ("from step %d, step %d passed while still to do"):format(from, i))
        end
    end
end)

T.test("going back: no \"Still to do\" for a quest the guide makes sticky further on", function()
    playTo(FARLEY)
    T.ok(H.log()[NIGHT_WATCH_2] ~= nil and H.completed()[NIGHT_WATCH], "premise: 56 turned in, 57 in the log")
    -- The jump went as far as step 102, which makes 57 sticky; the guide then came back.
    E:SetGuide(GUIDE, STICKY, true); H.flush()
    T.eq(Ding.char.sticky[NIGHT_WATCH_2], true)
    E:Reset(); H.flush()
    T.eq(E.index, FARLEY)
    T.eq(#rowsOf(NIGHT_WATCH_2), 0, "57 listed before its step")
    T.eq(Ding.char.sticky[NIGHT_WATCH_2], nil)
    while E.index > NIGHT do E:Prev(); H.flush() end
    T.eq(E.index, NIGHT, "step 16: complete \"The Night Watch\" (56)")
    T.ok(#rowsOf(NIGHT_WATCH) > 0, "the step's rows are missing")
    for _, row in ipairs(rowsOf(NIGHT_WATCH)) do T.eq(row.state, "done", H.plain(row.text)) end
    T.eq(#rowsOf(NIGHT_WATCH_2), 0, "the monsters of 57 listed in red under the finished 56")
    -- From step 102 on, they are listed again.
    E.hold = false
    E:SetGuide(GUIDE, STICKY + 1, true); H.flush()
    T.eq(Ding.char.sticky[NIGHT_WATCH_2], true)
    local sticky = 0
    for _, row in ipairs(rowsOf(NIGHT_WATCH_2)) do if row.sticky then sticky = sticky + 1 end end
    T.ok(sticky > 0, "57 no longer listed past its step")
end)

T.run()
