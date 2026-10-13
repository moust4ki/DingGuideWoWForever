-- Step language, part 2: conditions (`when`), quests taken by hand (`noauto`), the death
-- skip's spirit healer (`revive`), patrols, one choice per dungeon, and level targets inside
-- a level (`level` + `xp`, or a fraction).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L

local function start(steps, level)
    H.closeDialog()
    T.reset({ level = level or 5 })
    Ding.RegisterGuide({ id = "t-steps2", title = "Steps", races = { "NightElf" }, steps = steps })
    H.player.map, H.player.x, H.player.y = 1438, 58.7, 44
    E:SetGuide("t-steps2", 1, true); H.flush()
    H.tick(1)
end

---------------------------------------------------------------------------
-- Conditions
---------------------------------------------------------------------------
T.test("when: quest states; a step whose conditions fail is passed like another race's", function()
    start({
        { when = { log = 456 }, text = "Only with 456 in the log" },     -- 1
        { when = { notlog = 456 }, text = "Only without 456" },            -- 2
        { text = "End" },
    })
    T.eq(E.index, 2, "a step for a quest not in the log")
    T.ok(not Ding:StepApplies(E.guide.steps[1]))
    T.quests({ [456] = "log" })
    T.ok(Ding:StepApplies(E.guide.steps[1]))
    T.ok(not Ding:StepApplies(E.guide.steps[2]))
    T.quests({ [456] = "ready" })
    T.ok(E:ConditionsHold({ ready = 456, log = { 456 } }))
    T.ok(not E:ConditionsHold({ done = 456 }))
    T.ok(E:ConditionsHold({ notdone = 456 }))
    H.setQuest(456, nil); E.turnedIn[456] = true
    T.ok(E:ConditionsHold({ done = 456 }))
    T.ok(not E:ConditionsHold({ notdone = 456 }))
end)

T.test("when.item: an id, a pair, a list of ids (all held), a list of pairs", function()
    start({ { text = "End" } })
    H.setItem(4338, 60); H.setItem(2725, 1)
    T.ok(E:ConditionsHold({ item = 4338 }))
    T.ok(E:ConditionsHold({ item = { 4338, 60 } }), "a pair")
    T.ok(not E:ConditionsHold({ item = { 4338, 61 } }), "a pair asking for more")
    T.ok(not E:ConditionsHold({ item = { 2725, 2734 } }), "a list with an item missing")
    H.setItem(2734, 1)
    T.ok(E:ConditionsHold({ item = { 2725, 2734 } }), "a list of ids, all held")
    T.ok(E:ConditionsHold({ item = { { 4338, 60 }, { 2725, 1 }, 2734 } }), "a list of pairs")
    T.ok(not E:ConditionsHold({ item = { { 4338, 60 }, { 2725, 2 } } }))
    T.eq(#E.HeldItems({ 2725, 2734, 2740 }), 3)
end)

T.test("when: items in the bags and the level, re-read when the bags change", function()
    start({ { text = "Before" }, { when = { item = { 960010, 2 } }, text = "With two tokens" }, { text = "End" } }, 10)
    T.ok(not E:ConditionsHold({ minlevel = 11 }))
    T.ok(E:ConditionsHold({ minlevel = 10, maxlevel = 10 }))
    T.ok(not E:ConditionsHold({ maxlevel = 9 }))
    T.ok(E:ConditionsHold({ noitem = 960010 }))
    H.setItem(960010, 1)
    T.ok(not E:ConditionsHold({ item = { 960010, 2 } }))
    T.ok(E:ConditionsHold({ item = 960010 }))
    E:Next(); H.flush()
    T.eq(E.index, 3, "the step without its two tokens stays")
    E:Prev(); H.flush(); E:Prev(); H.flush()
    H.setItem(960010, 2); H.fire("BAG_UPDATE", 0); H.tick(1)
    E.hold = false
    E:Next(); H.flush()
    T.eq(E.index, 2, "the step with two tokens is passed")
end)

---------------------------------------------------------------------------
-- Quests taken by hand
---------------------------------------------------------------------------
T.test("noauto: never accepted by AutoQuest; the other quests still are", function()
    start({ { accept = { 456, 458 }, noauto = 456 }, { text = "End" } })
    H.clearDialogCalls()
    H.talk({ gives = { 456, 458 } }); H.flush()
    local calls = table.concat(H.dialogCalls(), ", ")
    T.ok(not calls:find("accept 456", 1, true), "456 accepted: " .. calls)
    T.ok(calls:find("accept 458", 1, true), "458 not accepted: " .. calls)
    T.ok(E:NoAuto(456) and not E:NoAuto(458))
end)

---------------------------------------------------------------------------
-- Death skip: the spirit healer
---------------------------------------------------------------------------
T.test("revive: as a ghost, the arrow goes to the step's spirit healer, not the corpse", function()
    Ding.db.ui.deathSkip = true
    start({ { deathskip = true, revive = { 1438, 55, 50 }, text = "Die, revive at the healer" }, { text = "End" } })
    Ding.db.ui.deathSkip = true
    E:SetGuide("t-steps2", 1, true); H.flush()
    H.setGhost({ map = 1438, x = 30, y = 30 })
    A.point = nil; A:Tick()
    T.eq(A.point and A.point.label, L.SPIRIT_HEALER)
    T.eq(A.point.x, 55)
    -- Without `revive`: the corpse.
    start({ { deathskip = true, text = "Die" }, { text = "End" } })
    Ding.db.ui.deathSkip = true
    E:SetGuide("t-steps2", 1, true); H.flush()
    H.setGhost({ map = 1438, x = 30, y = 30 })
    A.point = nil; A:Tick()
    T.eq(A.point and A.point.label, L.CORPSE)
    H.setGhost(nil)
    Ding.db.ui.deathSkip = false
end)

---------------------------------------------------------------------------
-- Patrol
---------------------------------------------------------------------------
T.test("patrol: the arrow goes round the points, alone until Next, with a kill goal until done", function()
    start({ { patrol = { { 1438, 50, 50 }, { 1438, 52, 50 }, { 1438, 54, 50 } }, text = "Look for the cat" },
        { patrol = { { 1438, 60, 60 }, { 1438, 62, 60 } }, kill = { { 2031, 1 } } },
        { text = "End" } })
    T.eq(#E.candidates, 1)
    T.eq(E.candidates[1].x, 50)
    T.ok(E.candidates[1].label:find(L.PATROL_POINT:format(1, 3), 1, true), E.candidates[1].label)
    for _, x in ipairs({ 52, 54, 50 }) do
        local p = E.candidates[1]
        H.player.map, H.player.x, H.player.y = p.map, p.x, p.y
        A.point = nil; A:Tick(); H.flush()
        T.eq(E.candidates[1].x, x)
    end
    T.eq(E.index, 1, "a patrol alone ends by itself")
    T.ok(E:IsManual(E:CurrentStep()), "a patrol alone is not manual")
    E:Next(); H.flush()
    T.eq(E.candidates[1].x, 60)
    H.killXP(Ding.Data:NpcName(2031), 40); H.tick(1)
    T.eq(E.index, 3, "the kill does not end the patrol")
end)

---------------------------------------------------------------------------
-- One choice per dungeon
---------------------------------------------------------------------------
T.test("dungeons: one choice each, the global option by default; their page in the Route tab", function()
    start({ { dungeon = "The Deadmines", text = "Deadmines" }, { dungeon = "Wailing Caverns", text = "Wailing" },
        { text = "End" } })
    T.eq(E.index, 3, "dungeon steps with the option off")
    local names = table.concat(E:DungeonNames(), ",")
    T.ok(names:find("The Deadmines,Wailing Caverns", 1, true), names)
    Ding.db.ui.dungeonChoice = { ["Wailing Caverns"] = true }
    T.ok(not Ding:StepApplies(E.guide.steps[1]))
    T.ok(Ding:StepApplies(E.guide.steps[2]))
    Ding.db.ui.dungeons = true
    T.ok(Ding:StepApplies(E.guide.steps[1]), "the global option is not the default")
    Ding.db.ui.dungeonChoice = { ["The Deadmines"] = false }
    T.ok(not Ding:StepApplies(E.guide.steps[1]), "a dungeon turned off still applies")
    Ding.db.ui.dungeons, Ding.db.ui.dungeonChoice = false, nil
    local C = Ding.Config
    C:Open("route")
    local link
    for _, r in ipairs(C.TABS[C.TAB.route].rows) do
        if r.opts and r.opts.label == L.OPT_DUNGEONS then link = r end
    end
    T.ok(link and link.kind == "page", "no dungeons row")
    T.eq(link.value:GetText(), L.DUNGEONS_OFF)
    link:Activate()
    local row
    for _, r in ipairs(C.page.rows) do
        if r.opts and r.opts.label and H.plain(r.opts.label):find("Wailing Caverns", 1, true) then row = r end
    end
    T.ok(row, "no row for Wailing Caverns")
    row:Activate()
    T.eq(Ding.db.ui.dungeonChoice["Wailing Caverns"], true)
    C:ClosePage()
    T.eq(link.value:GetText(), L.DUNGEONS_SOME:format(1, 2))
    C:Close()
end)

---------------------------------------------------------------------------
-- Level targets inside a level
---------------------------------------------------------------------------
T.test("level + xp, and a fraction of the level; the window says it", function()
    start({ { level = 6, xp = 500 }, { level = 6.5 }, { text = "End" } }, 6)
    H.player.xp = 400
    E:Update(); H.flush()
    T.eq(E.index, 1)
    local line = E:Describe(E:CurrentStep())[1]
    T.eq(line.text, L.REACH_LEVEL_XP:format(6, Ding.Compat.Number(500)))
    local status = Ding.Grind:Status(Ding.Grind:Into(E:CurrentStep(), UnitXPMax("player")))
    T.eq(status and status.missing, 100)
    H.player.xp = 500
    H.fire("PLAYER_XP_UPDATE", "player"); H.tick(1)
    T.eq(E.index, 2)
    T.eq(E:Describe(E:CurrentStep())[1].text, L.REACH_LEVEL_PART:format(6, 50))
    local max = UnitXPMax("player")
    H.player.xp = math.floor(max / 2) + 1
    H.fire("PLAYER_XP_UPDATE", "player"); H.tick(1)
    T.eq(E.index, 3)
    -- Below the level: the whole way to it, plus what is asked into it.
    start({ { level = 7, xp = 300 }, { text = "End" } }, 6)
    H.player.xp = 0
    status = Ding.Grind:Status(Ding.Grind:Into(E:CurrentStep(), UnitXPMax("player")))
    T.eq(status and status.missing, UnitXPMax("player") + 300)
end)

T.run()
