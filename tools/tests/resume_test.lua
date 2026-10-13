-- Smart resume: a character already on its way picks up the guide where it really is,
-- and a new character gets the right guide.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E = Ding.Engine

-- Quest ids above 900000 are not in QuestieDB: no required level, no names.
local A, B, C, D = 900001, 900002, 900003, 900004

-- A manual step followed by more than the usual lookahead of steps without accepts or
-- turn-ins, then the turn-in of A.
Ding.RegisterGuide({ id = "t-resume", title = "Resume", races = { "NightElf" }, minLevel = 1, maxLevel = 10, steps = {
    { accept = { A, B } },              -- 1
    { train = true },                   -- 2 manual
    { complete = A },                   -- 3
    { go = { 1438, 40, 40 } },          -- 4 manual
    { complete = B },                   -- 5
    { go = { 1438, 41, 41 } },          -- 6 manual
    { go = { 1438, 42, 42 } },          -- 7 manual
    { level = 2 },                      -- 8
    { turnin = A },                     -- 9
    { turnin = B, accept = C },         -- 10
    { complete = C },                   -- 11
    { train = true },                   -- 12 manual
    { turnin = C },                     -- 13
} })

local function load(states, level, id)
    T.reset({ level = level or 2 })
    T.quests(states or {})
    E:SetGuide(id or "t-resume", 1, true)
    H.flush()
end

local function afterResumeWindow()
    H.tick(11)
end

T.test("resume: skips the manual steps up to the first step not done", function()
    load({ [A] = "turnedin", [B] = "ready" })
    T.eq(E.index, 10, "the guide did not realign")
end)

T.test("resume: a quest only accepted further on does not skip a manual step", function()
    -- C is accepted out of order: no turn-in past step 2, which stays.
    load({ [A] = "log", [B] = "log", [C] = "log" })
    T.eq(E.index, 2)
end)

T.test("resume: quest data arriving after loading still realigns the guide", function()
    load({})
    T.eq(E.index, 1)
    H.tick(2)
    T.quests({ [A] = "turnedin", [B] = "turnedin", [C] = "log" })
    T.eq(E.index, 11, "the guide did not realign after the quests arrived")
end)

T.test("in game (after the resume), a manual step still waits for \"next\"", function()
    load({ [A] = "log", [B] = "log" })
    T.eq(E.index, 2)
    afterResumeWindow()
    -- Turning in a quest far ahead must not skip the class trainer.
    T.quests({ [C] = "turnedin" })
    T.eq(E.index, 2, "the manual step was skipped during play")
    E:Next(); H.flush()
    T.eq(E.index, 3)
end)

T.test("resume: the resume window reopens when the guide is reloaded", function()
    load({ [A] = "log", [B] = "log" })
    afterResumeWindow()
    T.quests({ [A] = "turnedin", [B] = "turnedin" })
    T.eq(E.index, 2)
    E:SetGuide("t-resume", 1, true); H.flush()
    T.eq(E.index, 10, "reloading the guide did not realign it")
end)

T.test("resume: \"previous\" stays held even during the resume", function()
    load({ [A] = "turnedin", [B] = "ready" })
    T.eq(E.index, 10)
    E:Prev(); H.flush()
    T.quests({ [D] = "log" })
    T.eq(E.index, 9, "\"previous\" not honored")
end)

T.test("login: the saved guide resumes at its step then realigns", function()
    T.reset({ level = 2 })
    T.quests({ [A] = "turnedin", [B] = "turnedin" })
    Ding.char.guide, Ding.char.step = "t-resume", 2
    E.guide = nil
    E:Start(); H.flush()
    T.eq(E.guide.id, "t-resume")
    T.eq(E.index, 10)
end)

T.test("login: a saved guide that no longer exists lets Ding pick another one", function()
    T.reset({ level = 3, race = "NightElf" })
    Ding.char.guide, Ding.char.step = "no-longer-exists", 4
    E:Start(); H.flush()
    T.ok(E.guide ~= nil, "no guide chosen")
    T.ok(E.guide.id ~= "no-longer-exists")
end)

---------------------------------------------------------------------------
-- Guide progress and first guide
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-gnome-1", title = "Gnome 1", races = { "Gnome" }, minLevel = 1, maxLevel = 5,
    steps = { { accept = 900101 }, { turnin = 900101, accept = 900102 }, { turnin = 900102 } } })
Ding.RegisterGuide({ id = "t-gnome-2", title = "Gnome 2", races = { "Gnome" }, minLevel = 5, maxLevel = 10,
    steps = { { accept = 900201 }, { turnin = 900201 }, { train = true }, { accept = 900202 }, { turnin = 900202 } } })
Ding.RegisterGuide({ id = "t-gnome-3", title = "Gnome 3", races = { "Gnome" }, minLevel = 10, maxLevel = 20,
    steps = { { accept = 900301 }, { turnin = 900301 } } })
-- A guide whose only quest needs level 3 (Shadowglen's 916).
Ding.RegisterGuide({ id = "t-gnome-high", title = "High-level gnome", races = { "Gnome" }, classes = { "MAGE" },
    minLevel = 3, maxLevel = 6, steps = { { accept = 916 }, { turnin = 916 } } })

local function gnome(level, states, class)
    T.reset({ race = "Gnome", level = level, class = class })
    T.quests(states or {})
    return Ding:SuggestGuide()
end

T.test("progress: steps done and left, without the manual ones", function()
    gnome(6, { [900201] = "turnedin" })
    local worked, left = E:GuideProgress(Ding:GetGuide("t-gnome-2"))
    T.eq(worked, 2, "steps done")
    T.eq(left, 2, "steps left")
end)

T.test("progress: a quest out of reach does not count as started", function()
    T.reset({ race = "Gnome", level = 1, class = "MAGE" })
    local worked, left = E:GuideProgress(Ding:GetGuide("t-gnome-high"))
    T.eq(worked, 0, "guide counted as started")
    T.eq(left, 1)
end)

T.test("first guide: new character, guide for its level", function()
    T.eq(gnome(1).id, "t-gnome-1")
    T.eq(gnome(7).id, "t-gnome-2")
    T.eq(gnome(15).id, "t-gnome-3")
end)

T.test("first guide: the started guide wins over the level", function()
    T.eq(gnome(5, { [900201] = "turnedin" }).id, "t-gnome-2")
    -- Level 4 but already working on guide 2.
    T.eq(gnome(4, { [900201] = "log" }).id, "t-gnome-2")
end)

T.test("first guide: a finished guide is skipped", function()
    T.eq(gnome(5, { [900101] = "turnedin", [900102] = "turnedin" }).id, "t-gnome-2")
end)

T.test("first guide: a started guide the character has outleveled is skipped", function()
    T.eq(gnome(12, { [900101] = "turnedin" }).id, "t-gnome-3")
end)

T.test("first guide: beyond all guides, the last guide of a lower level", function()
    T.eq(gnome(40).id, "t-gnome-3")
end)

T.test("first guide: a class guide out of reach is not \"started\"", function()
    -- A level 1 mage: t-gnome-high has only a level 3 quest; t-gnome-1 must win.
    T.eq(gnome(1, nil, "MAGE").id, "t-gnome-1")
end)

T.test("first guide: everything finished, the last compatible guide", function()
    T.eq(gnome(15, { [900101] = "turnedin", [900102] = "turnedin", [900201] = "turnedin",
        [900202] = "turnedin", [900301] = "turnedin" }).id, "t-gnome-3")
end)

T.test("first guide: no compatible guide", function()
    T.reset({ race = "Tauren", faction = "Horde" })
    local g = Ding:SuggestGuide()
    T.ok(g == nil or g.races == nil, "guide of another race: " .. tostring(g and g.id))
end)

---------------------------------------------------------------------------
-- "Take this guide up where I am" (Engine:Reset), the dropdown, /ding guide
---------------------------------------------------------------------------
local P1, P2, P3, P4, P5 = 900011, 900012, 900013, 900014, 900015
Ding.RegisterGuide({ id = "t-where", title = "Where I am", races = { "NightElf" }, steps = {
    { accept = P1 },                    -- 1
    { complete = P1 },                  -- 2
    { turnin = P1 },                    -- 3
    { accept = P2 },                    -- 4 skipped by the player, never taken
    { train = true },                   -- 5 manual
    { accept = P3 },                    -- 6
    { turnin = P3, accept = P4 },       -- 7
    { complete = P4 },                  -- 8 where the player is
    { turnin = P4, accept = P5 },       -- 9
} })

T.test("restart: picks up where we are, not at step 1 nor at the skipped quest", function()
    load({ [P1] = "turnedin", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E.index, E.hold = 1, true             -- the player went back to the start
    E:Reset(); H.flush()
    T.eq(E.index, 8, "not realigned on the progress")
    T.ok(E:BackToIncomplete(), "the skipped step is no longer reachable")
    T.eq(E.index, 4, "back to the skipped step")
end)

T.test("restart: a quest done ahead of time does not send us far into the guide", function()
    load({ [P4] = "turnedin" }, 3, "t-where")
    E:Reset(); H.flush()
    T.eq(E.index, 1)
end)

T.test("restart: forgets the steps validated by hand, keeps the quests", function()
    load({ [P1] = "turnedin", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    Ding.char.manual["t-where"] = { [8] = true, [9] = true }
    E:Reset(); H.flush()
    T.eq(Ding.char.manual["t-where"], nil)
    T.eq(E.index, 8)
end)

T.test("resume: an old guide quest still in the log is finished first", function()
    -- P1 taken long ago, never finished; the player went on (P3 turned in, P4 in the log).
    load({ [P1] = "log", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E:Reset(); H.flush()
    T.eq(E.index, 2, "not led to the past quest to finish")
    T.quests({ [P1] = "ready" })
    T.eq(E.index, 3, "not led to the turn-in of the past quest")
    T.quests({ [P1] = "turnedin" })
    -- Then everything done or left behind is passed: back to the player's place.
    T.eq(E.index, 8, "no return to the player's place")
    T.eq(E.resumeTo, nil, "resume not over")
    T.eq(Ding.char.resumeTo, nil)
end)

T.test("resume: the next steps shown are the ones \"next\" goes to", function()
    load({ [P1] = "log", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E:Reset(); H.flush()
    T.eq(E.index, 2)
    T.ok(E:NextSteps(1)[1] == E.guide.steps[3], "the turn-in of the past quest is not shown next")
    T.quests({ [P1] = "ready" })
    T.eq(E.index, 3)
    -- Steps 4 and 5 are left behind: the step after the turn-in is the player's place.
    T.ok(E:NextSteps(1)[1] == E.guide.steps[8], "a step the resume passes is shown next")
    E:Next(); H.flush()
    T.eq(E.index, 8)
end)

T.test("resume: kept after a reload, over if the quest is abandoned", function()
    load({ [P1] = "log", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E:Reset(); H.flush()
    T.eq(E.index, 2)
    T.ok(Ding.char.resumeTo and Ding.char.resumeTo.step == 7, "resume not saved")
    E.resumeTo = nil                     -- /reload: the engine starts again from the saved state
    E:Start(); H.flush()
    T.eq(E.resumeTo, 7, "resume lost on reload")
    T.eq(E.index, 2)
    T.quests({ [P1] = false })           -- abandoned: nothing left to finish
    T.eq(E.index, 8)
end)

T.test("resume: \"back to a past step\" ends it", function()
    load({ [P1] = "log", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E:Reset(); H.flush()
    E:Skip(); H.flush()
    T.eq(E.index, 3, "\"skip\" on the past quest")
    T.ok(E:BackToIncomplete())
    T.eq(E.resumeTo, nil, "the resume goes on after a deliberate step back")
end)

-- Loch Modan in game (11/10/2026): "Filthy Paws" ready in the log, never turned in, while
-- the player is further on; another quest of the same step was taken, one never was.
local R1, R2, R3, R4 = 900021, 900022, 900023, 900024
Ding.RegisterGuide({ id = "t-backlog", title = "Backlog", races = { "NightElf" }, steps = {
    { accept = { R1, R2 } },            -- 1 R1 taken, R2 never
    { complete = R2 },                  -- 2 left behind
    { turnin = R2 },                    -- 3 left behind
    { complete = R1 },                  -- 4 R1 ready
    { turnin = R1 },                    -- 5 still to turn in
    { accept = R3 },                    -- 6
    { turnin = R3 },                    -- 7 where the player is
    { accept = R4 },                    -- 8
} })

T.test("resume: a past quest ready in the log is turned in first", function()
    load({ [R1] = "ready", [R3] = "turnedin" }, 3, "t-backlog")
    E:Reset(); H.flush()
    T.eq(E.index, 5, "the turn-in of the past quest is skipped")
    T.quests({ [R1] = "turnedin" })
    T.eq(E.index, 8, "no return to the player's place")
end)

T.test("resume: a past step whose quest is only accepted does not stop it", function()
    -- Step 1 has R1 in the log (taken: done) and R2 never taken: nothing to finish there.
    load({ [R1] = "log", [R3] = "turnedin" }, 3, "t-backlog")
    E:Reset(); H.flush()
    T.eq(E.index, 4, "stopped on a step with nothing to finish or turn in")
end)

T.test("login: the resume waits for the quest log before skipping steps", function()
    load({ [P1] = "log", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E:Reset(); H.flush()
    T.eq(E.index, 2)
    -- Log in again: nothing known until the client sends the quest log.
    E.guide, E.index, E.resumeTo, E.logReady = nil, 1, nil, false
    H.resetQuests()
    E:Start(); H.flush()
    T.ok(E.startPending, "the guide is placed without a log")
    H.setQuest(P1, "log"); H.setQuest(P3, "turnedin"); H.setQuest(P4, "log")
    H.fire("QUEST_LOG_UPDATE"); H.flush()
    T.eq(E.guide and E.guide.id, "t-where")
    T.eq(E.index, 2, "the past quest is skipped at login")
    T.eq(E.resumeTo, 7, "resume lost")
end)

T.test("login: with no log received, the guide still starts after a few seconds", function()
    load({}, 3, "t-where")
    E.guide, E.index, E.logReady = nil, 1, false
    H.resetQuests()
    E:Start(); H.flush()
    T.eq(E.guide, nil)
    H.tick(6)
    T.eq(E.guide and E.guide.id, "t-where", "the guide never starts")
    T.ok(not E.startPending)
end)

T.test("login: a guide changed by an update realigns the player's place", function()
    load({ [P1] = "turnedin", [P3] = "turnedin", [P4] = "log" }, 3, "t-where")
    E:Reset(); H.flush()
    T.eq(E.index, 8)
    T.eq(Ding.char.guideSig, E.Signature(E.guide))
    -- Same guide: the saved step is kept.
    Ding.char.step = 3
    E:Start(); H.flush()
    T.eq(E.index, 4, "saved step not kept")
    -- The guide was regenerated: the saved step number means something else now.
    Ding.char.step, Ding.char.guideSig = 3, Ding.char.guideSig + 1
    E:Start(); H.flush()
    T.eq(E.index, 8, "place not recomputed after the update")
end)

T.test("choosing a guide already started, or /ding guide: we resume where we are", function()
    load({ [P1] = "turnedin", [P3] = "turnedin", [P4] = "log" }, 3, "t-resume")
    E:Resume("t-where", true); H.flush()
    T.eq(E.guide.id, "t-where")
    T.eq(E.index, 8)
    E:SetGuide("t-resume", 1, true); H.flush()
    SlashCmdList.DING("guide t-where"); H.flush()
    T.eq(E.index, 8, "/ding guide")
    E:Resume("t-unknown", true)
    T.eq(E.guide.id, "t-where", "an unknown guide changes the active guide")
end)

---------------------------------------------------------------------------
-- Steps the game cannot check later: picking the section again keeps them passed
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-inn", title = "Inn", races = { "NightElf" }, steps = {
    { accept = A },                     -- 1
    { sethearth = "Dolanaar" },         -- 2
    { accept = B },                     -- 3
    { text = "End" },                   -- 4
} })

T.test("sethearth: bound there during the step, it stays done when the guide is taken up again", function()
    load({}, 2, "t-inn")
    T.quests({ [A] = "log" })
    T.eq(E.index, 2)
    H.player.bind = "Dolanaar"
    H.fire("HEARTHSTONE_BOUND"); H.flush(); H.tick(1)
    T.eq(E.index, 3)
    -- "Take this guide up where I am" forgets the marks: the inn still holds.
    E:Reset(); H.flush()
    T.eq(E.index, 3, "Ding asks to bind the hearthstone again")
    -- Bound elsewhere since: the step is to do again.
    H.player.bind = "Darnassus"
    E:Reset(); H.flush()
    T.eq(E.index, 2, "a hearthstone bound elsewhere still counts")
    H.player.bind = nil
end)

T.test("a step passed while its option was off stays passed when the section is picked again", function()
    T.reset({ level = 2 })
    Ding.db.ui.hearth = false
    T.quests({ [A] = "log" })
    E:SetGuide("t-inn", 1, true); H.flush()
    T.eq(E.index, 3)
    Ding.db.ui.hearth = true
    -- Another section, then this one again (the Guide tab's list resumes it).
    E:Resume("t-resume", true); H.flush()
    E:Resume("t-inn", true); H.flush()
    T.eq(E.index, 3, "back on a step the guide went past")
    -- "Take this guide up where I am": what is not really done is to do again.
    E:Reset(); H.flush()
    T.eq(E.index, 2)
end)

T.test("goals passed stay passed once their items are spent", function()
    Ding.RegisterGuide({ id = "t-spent", title = "Spent", races = { "NightElf" }, steps = {
        { collect = { { 960020, 2 } } }, { accept = B }, { text = "End" },
    } })
    load({}, 2, "t-spent")
    H.setItem(960020, 2); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 2)
    H.setItem(960020, 0); H.fire("BAG_UPDATE", 0); H.tick(1)
    E:Resume("t-resume", true); H.flush()
    E:Resume("t-spent", true); H.flush()
    T.eq(E.index, 2, "the collect step is to do again")
end)

T.run()
