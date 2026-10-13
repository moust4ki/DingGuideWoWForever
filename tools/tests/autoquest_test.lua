-- Automatic accept and turn-in of the guide's quests when talking to an NPC.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E = Ding.Engine
local G = "nightelf-01-shadowglen"

-- Synthetic guide: the window of wanted quests stops after a step that leaves the place.
local A, B, C = 900501, 900502, 900503
Ding.RegisterGuide({ id = "t-auto", title = "Auto", races = { "NightElf" }, steps = {
    { accept = A },
    { go = { 1438, 40, 40 } },
    { accept = B },
    { turnin = { A, B }, accept = C },
} })

local function start(states, guide, level)
    H.closeDialog()
    T.reset({ level = level or 2 })
    Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = true, true
    H.setModifier("shift", false)
    H.tick(3)    -- past the delay before the same quest can be selected again
    T.quests(states or {})
    E:SetGuide(guide or G, 1, true)
    H.flush()
    H.clearDialogCalls()
end

local function calls() return table.concat(H.dialogCalls(), ", ") end

local function talk(npc)
    H.talk(npc)
    H.flush()
end

T.test("accepts the step's quests, one per conversation", function()
    start()
    T.eq(E.index, 1)
    local npc = { gives = { 456, 458 } }
    talk(npc)
    T.eq(calls(), "select-available 456, accept 456")
    talk(npc)
    T.eq(calls(), "select-available 456, accept 456, select-available 458, accept 458")
    T.eq(E.index, 2, "the step was not validated")
end)

T.test("never accepts a quest the guide does not ask for right now", function()
    start()
    talk({ gives = { 920, 3519 } })
    T.eq(calls(), "")
    T.eq(H.dialogKind(), "gossip", "the NPC window was closed")
    T.ok(not H.log()[920] and not H.log()[3519], "quest accepted")
end)

T.test("turns in a ready quest then accepts the next one", function()
    start({ [456] = "ready", [458] = "log" }, nil, 3)    -- 457 is a level 3 quest
    T.eq(E.index, 3)
    local npc = { ends = { 456 }, gives = { 457 } }
    talk(npc)
    T.eq(calls(), "select-active 456, complete 456, reward 456 0")
    talk(npc)
    T.eq(calls(), "select-active 456, complete 456, reward 456 0, select-available 457, accept 457")
    T.eq(E.index, 4)
end)

T.test("does not turn in a quest whose objectives are not met", function()
    start({ [456] = "log", [458] = "log" })
    -- At step 2, 456 is in the window (turned in at step 3) but its objectives are not done.
    talk({ ends = { 456 } })
    T.eq(calls(), "", "quest not ready selected")
    T.ok(H.log()[456], "456 left the log")
end)

T.test("progress window of a quest not ready: nothing, the window stays", function()
    start({ [456] = "log", [458] = "log" })
    H.showQuest({ ends = { 456 } }, "progress", 456)
    H.flush()
    T.eq(calls(), "")
    T.eq(H.dialogKind(), "progress")
end)

T.test("reward to choose: Ding leaves the window open", function()
    start({ [456] = "ready", [458] = "log" })
    talk({ ends = { 456 }, choices = { [456] = 2 } })
    T.eq(calls(), "select-active 456, complete 456")
    T.eq(H.dialogKind(), "complete", "reward window closed")
    T.ok(not H.completed()[456], "quest turned in without choosing a reward")
end)

T.test("a single reward: it is taken", function()
    start({ [456] = "ready", [458] = "log" })
    talk({ ends = { 456 }, choices = { [456] = 1 } })
    T.eq(calls(), "select-active 456, complete 456, reward 456 1")
end)

T.test("\"accept\" setting off: nothing is accepted, turn-ins go on", function()
    start({ [456] = "ready", [458] = "log" })
    Ding.db.ui.autoAccept = false
    local npc = { ends = { 456 }, gives = { 457 } }
    talk(npc)
    talk(npc)
    T.eq(calls(), "select-active 456, complete 456, reward 456 0")
    T.ok(not H.log()[457], "457 accepted despite the setting")
end)

T.test("\"turn in\" setting off: nothing is turned in, accepts go on", function()
    start({ [456] = "ready", [458] = "log" }, nil, 3)
    Ding.db.ui.autoTurnin = false
    talk({ ends = { 456 }, gives = { 457 } })
    T.eq(calls(), "select-available 457, accept 457")
    T.ok(H.log()[456], "456 turned in despite the setting")
end)

T.test("holding Shift (LT on the gamepad) suspends everything", function()
    start({ [456] = "ready", [458] = "log" })
    H.setModifier("shift", true)
    talk({ ends = { 456 }, gives = { 457 } })
    H.setModifier("shift", false)
    T.eq(calls(), "")
end)

T.test("greeting window (several quests, no gossip): by title", function()
    start({ [456] = "ready", [458] = "log" }, nil, 3)
    local npc = { greeting = true, ends = { 456 }, gives = { 457 } }
    talk(npc)
    T.eq(calls(), "select-active 456, complete 456, reward 456 0")
    talk(npc)
    T.eq(calls(), "select-active 456, complete 456, reward 456 0, select-available 457, accept 457")
end)

T.test("direct quest window: accepts the wanted quest, ignores the others", function()
    start()
    H.showQuest({}, "detail", 920)
    H.flush()
    T.eq(calls(), "")
    T.eq(H.dialogKind(), "detail", "window closed for a quest outside the guide")
    H.showQuest({}, "detail", 456)
    H.flush()
    T.eq(calls(), "accept 456")
end)

T.test("direct progress window: turns in the wanted quest", function()
    start({ [456] = "ready", [458] = "log" })
    H.showQuest({ ends = { 456 } }, "progress", 456)
    H.flush()
    T.eq(calls(), "complete 456, reward 456 0")
end)

T.test("quest to do missing from the log (abandoned): accepted again from the giver", function()
    start({ [458] = "log" })
    -- Step 1 needs 456 too: with 458 only, the engine waits on step 1, then step 2 asks to
    -- complete 456, which is not in the log.
    talk({ gives = { 456 } })
    T.eq(calls(), "select-available 456, accept 456")
end)

T.test("a quest already turned in is not accepted again", function()
    start({ [456] = "turnedin", [458] = "log" })
    talk({ gives = { 456 } })
    T.eq(calls(), "")
end)

T.test("no active guide: nothing", function()
    H.closeDialog()
    T.reset()
    H.clearDialogCalls()
    talk({ gives = { 456 } })
    T.eq(calls(), "")
end)

T.test("finished guide: nothing", function()
    start({}, "t-auto")
    E.finished = true
    talk({ gives = { A } })
    T.eq(calls(), "")
end)

T.test("a guide quest planned after a travel step is picked up along the way; the trip goes when nothing is left there", function()
    start({}, "t-auto")
    T.eq(E.index, 1)
    local npc = { gives = { A, B } }
    talk(npc)
    T.eq(calls(), "select-available " .. A .. ", accept " .. A)
    T.eq(E.index, 2, "the travel step was skipped while B is still to take there")
    talk(npc)
    T.eq(calls(), "select-available " .. A .. ", accept " .. A .. ", select-available " .. B .. ", accept " .. B,
        "B not picked up along the way")
    T.ok(Ding.char.early[B], "B not marked as accepted early")
    T.eq(E.index, 4, "the trip to B's giver stays though B is already in the log")
end)

T.test("quests of a step for another race are not accepted", function()
    Ding.RegisterGuide({ id = "t-auto-race", title = "Auto race", steps = {
        { accept = B },
        { accept = A, races = { "Dwarf" } },
    } })
    start({}, "t-auto-race")
    T.eq(E.index, 1)
    talk({ gives = { A } })
    T.eq(calls(), "")
end)

T.test("a selection with no effect is not repeated in a loop", function()
    start()
    -- The server refuses to open the quest: GOSSIP_SHOW comes back at once.
    local select = C_GossipInfo.SelectAvailableQuest
    local count = 0
    C_GossipInfo.SelectAvailableQuest = function() count = count + 1 end
    talk({ gives = { 456 } })
    H.fire("GOSSIP_SHOW"); H.fire("GOSSIP_SHOW")
    T.eq(count, 1, "repeated selections")
    H.tick(3)
    H.fire("GOSSIP_SHOW")
    T.eq(count, 2, "no new attempt after the delay")
    C_GossipInfo.SelectAvailableQuest = select
end)

T.test("default settings enable both automations", function()
    T.eq(Ding.DEFAULTS.ui.autoAccept, true)
    T.eq(Ding.DEFAULTS.ui.autoTurnin, true)
end)

T.run()
