-- Step engine: when a step counts as done, navigation, resuming a character.
-- Plays the Shadowglen guide (Ding/Guides/NightElf/01_Shadowglen.lua) step by step.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding = T.Ding
local E = Ding.Engine
local G = "nightelf-01-shadowglen"

-- Quests of the first steps, in guide order.
local STEPS_1_TO_4 = { [456] = "turnedin", [458] = "turnedin", [457] = "log", [459] = "log", [97977] = "log" }

local function start(states, level)
    T.reset({ level = level })
    if states then T.quests(states) end
    E:SetGuide(G, 1, true)
    T.H.flush()
end

T.test("a new character starts at the first step", function()
    start()
    T.eq(E.guide.id, G)
    T.eq(E.index, 1)
    T.ok(not E.finished, "guide marked finished")
end)

T.test("accept: the step is done when all its quests are in the log", function()
    start()
    T.quests({ [456] = "log" })
    T.eq(E.index, 1, "only one quest of two accepted")
    T.quests({ [458] = "log" })
    T.eq(E.index, 2)
end)

T.test("complete: the step waits for the objectives to be met", function()
    start({ [456] = "log", [458] = "log" })
    T.eq(E.index, 2)
    T.quests({ [456] = "log" })
    T.eq(E.index, 2, "objectives not met yet")
    T.quests({ [456] = "ready" })
    T.eq(E.index, 3)
end)

T.test("turn in: the step waits for the turn-in, not just the objectives", function()
    start({ [456] = "ready", [458] = "log" })
    T.eq(E.index, 3)
    T.quests({ [457] = "log" })
    T.eq(E.index, 3, "456 not turned in yet")
    T.quests({ [456] = "turnedin" })
    T.eq(E.index, 4)
end)

T.test("a quest turned in during the session counts even if the server is slow", function()
    start({ [456] = "ready", [458] = "log", [457] = "log" })
    T.eq(E.index, 3)
    -- The event arrives before IsQuestFlaggedCompleted says so.
    T.H.setQuest(456, nil)
    T.H.fire("QUEST_TURNED_IN", 456, 0, 0)
    T.H.flush()
    T.eq(E.index, 4)
end)

-- Level 2: 4495 (level 2) can be taken, 916 (level 3) cannot yet.
T.test("a manual step (class trainer) waits for \"next\"", function()
    start(STEPS_1_TO_4, 2)
    T.eq(E.index, 5)
    T.H.fire("QUEST_LOG_UPDATE"); T.H.flush()
    T.eq(E.index, 5, "the manual step validated itself")
    E:Next(); T.H.flush()
    T.eq(E.index, 6)
end)

T.test("\"next\" is saved for the character", function()
    start(STEPS_1_TO_4, 2)
    E:Next(); T.H.flush()
    T.ok(Ding.char.manual[G] and Ding.char.manual[G][5], "step 5 not saved")
    E:SetGuide(G, 1, true); T.H.flush()
    T.eq(E.index, 6, "resuming goes back through the manual step")
end)

T.test("resume: a manual step is skipped if a later step has progressed", function()
    local states = {}
    for q, s in pairs(STEPS_1_TO_4) do states[q] = s end
    states[4495] = "log"
    start(states, 2)
    T.eq(E.index, 7, "the guide did not catch up after the manual step")
end)

T.test("a quest of too high a level does not block an \"accept\" step", function()
    local states = {}
    for q, s in pairs(STEPS_1_TO_4) do states[q] = s end
    states[4495] = "log"
    start(states, 2)
    T.eq(Ding.Data:QuestRequiredLevel(4495), 2, "required level of 4495")
    T.eq(Ding.Data:QuestRequiredLevel(916), 3, "required level of 916")
    T.eq(E.index, 7, "916 (required level) blocked step 6")
end)

T.test("\"previous\" stays on the shown step until \"next\"", function()
    start({ [456] = "log", [458] = "log" })
    T.eq(E.index, 2)
    E:Prev(); T.H.flush()
    T.eq(E.index, 1)
    T.quests({ [456] = "ready" })
    T.eq(E.index, 1, "the engine left the step after \"previous\"")
    E:Next(); T.H.flush()
    T.eq(E.index, 3, "\"next\" did not catch up on the completed steps")
end)

T.test("\"previous\" does not go below the first step", function()
    start()
    E:Prev(); T.H.flush()
    T.eq(E.index, 1)
end)

T.test("an optional step is skipped when a later step progresses", function()
    local guide = Ding:GetGuide(G)
    local optional
    for i, s in ipairs(guide.steps) do if s.optional then optional = i break end end
    T.ok(optional, "the guide no longer has an optional step")
    -- Everything before the optional step done, quest of the next step accepted.
    local states = {}
    for i = 1, optional - 1 do
        local s = guide.steps[i]
        for _, q in ipairs(s.turnin or {}) do states[q] = "turnedin" end
        for _, q in ipairs(s.accept or {}) do states[q] = states[q] or "ready" end
        for _, q in ipairs(s.complete or {}) do states[q] = states[q] or "ready" end
    end
    for _, q in ipairs(guide.steps[optional + 1].accept or {}) do states[q] = "log" end
    start(states, 5)
    for i = 1, optional - 1 do
        local s = guide.steps[i]
        if s.train then Ding.char.manual[G] = Ding.char.manual[G] or {}; Ding.char.manual[G][i] = true end
    end
    E:SetGuide(G, 1, true); T.H.flush()
    T.ok(E.index > optional, ("stuck on step %d (optional: %d)"):format(E.index, optional))
end)

T.test("all quests turned in: the guide is finished and no follow-up is loaded", function()
    local guide = Ding:GetGuide(G)
    local states = {}
    for _, s in ipairs(guide.steps) do
        for _, key in ipairs({ "accept", "turnin", "complete" }) do
            for _, q in ipairs(s[key] or {}) do states[q] = "turnedin" end
        end
    end
    start(states, 6)
    -- Only the final "go" step is left: it needs the player.
    T.eq(E.index, #guide.steps)
    E:Next(); T.H.flush()
    T.ok(E.finished, "guide not marked finished")
    T.eq(E.guide.id, G, "no next guide is registered")
end)

T.test("restarting clears the steps validated by hand", function()
    start(STEPS_1_TO_4, 2)
    E:Next(); T.H.flush()
    E:Reset(); T.H.flush()
    -- The mark goes; the step stays behind the player's place (no quest of the route to take
    -- there): "Take this guide up where I am" does not send the player back to it.
    T.eq(E.index, 6)
    T.ok(not (Ding.char.manual[G] and Ding.char.manual[G][5]), "manual flag kept")
end)

T.test("unknown guide: rejected without changing the current guide", function()
    start()
    T.eq(E:SetGuide("does-not-exist", 1, true), false)
    T.eq(E.guide.id, G)
end)

T.run()
