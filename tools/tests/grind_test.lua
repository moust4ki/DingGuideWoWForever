-- Guided grinding on level steps (Core/Grind.lua): experience and kills left, kills measured
-- on the player's own (rested bonus and quest experience left out), the monster to farm and
-- the arrow towards it; and the step timings it feeds (Core/Timing.lua).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L, Grind = Ding.Engine, Ding.Panel, Ding.L, Ding.Grind

-- Shadowglen monsters (QuestieDB): 456 kills Young Nightsabers (2031, level 1) and Young
-- Thistle Boars (1984, 1-2); 457 Mangy Nightsabers (2032, 2) and Thistle Boars (1985, 2-3);
-- 916 loots Webwood Venom Sacs on Webwood Spiders (1986, 3-4), in the cave to the north.
Ding.RegisterGuide({ id = "t-grind", title = "Grind", races = { "NightElf" }, steps = {
    { level = 4, note = "Finish the level on nearby monsters." },
    { accept = 457 },
    { complete = 457 },
} })
Ding.RegisterGuide({ id = "t-grind-cave", title = "Grind cave", races = { "NightElf" }, steps = {
    { level = 12 },
    { complete = 916 },
} })
Ding.RegisterGuide({ id = "t-grind-none", title = "Grind nothing", races = { "NightElf" }, steps = {
    { level = 12 },
    { go = { 1438, 40, 40 }, text = "Somewhere" },
} })
Ding.RegisterGuide({ id = "t-grind-quest", title = "Grind quest", races = { "NightElf" }, steps = {
    { level = 3 },
    { turnin = 456 },
} })

local function start(guide, level, xp)
    T.reset({ level = level })
    H.player.xp = xp or 0
    Grind:Reset()
    H.player.map, H.player.x, H.player.y = 1438, 58.7, 43.3   -- among the young boars
    E:SetGuide(guide, 1, true)
    H.flush()
    H.tick(2)
end

local function levelRow()
    for _, row in ipairs(P.rowsShown or {}) do
        if row.action == "level" then return row end
    end
end
local function grindRow()
    for _, row in ipairs(P.rowsShown or {}) do
        if row.action == "grind" then return row end
    end
end

---------------------------------------------------------------------------
-- Experience and kills left
---------------------------------------------------------------------------
T.test("level step: experience left, percent of the level, kills from the formula without measures", function()
    start("t-grind", 2, 450)
    local s = Grind:Status(4)
    -- 900 - 450 at level 2, plus the 1,400 of level 3; a monster of level 2: 5 * 2 + 45.
    T.eq(s.missing, 450 + 1400)
    T.eq(s.percent, 50)
    T.eq(s.kills, math.ceil(1850 / 55))
    T.eq(s.measured, 0)
    local row = levelRow()
    T.ok(row, "no level row")
    T.eq(H.plain(row.text), L.REACH_LEVEL:format(4))
    T.eq(row.counter, "50%")
    T.ok(H.plain(row.sub):find("1,850 XP to go", 1, true), "experience left: " .. H.plain(row.sub or ""))
    T.ok(H.plain(row.sub):find(L.LEVEL_LEFT:format("1,850", 34), 1, true), "kills left: " .. H.plain(row.sub or ""))
    T.ok(H.plain(row.sub):find("Finish the level", 1, true), "the guide note goes under the level row")
end)

T.test("kills measured: the median of the player's own kills replaces the formula", function()
    start("t-grind", 2, 0)
    for _ = 1, 3 do H.kill(40); H.tick(2) end
    H.kill(150); H.tick(2)    -- an elite: the median barely moves
    H.kill(600); H.tick(2)    -- far more than a kill (a discovery): left out
    local perKill, measured = Grind:KillXP(2)
    T.eq(measured, 4)
    T.ok(perKill >= 40 and perKill <= 60, "experience per kill: " .. perKill)
    -- Measured as a share of a monster of the player's level: still valid a level later.
    T.ok(Grind:KillXP(3) > perKill, "a kill is worth more one level up")
    T.eq(Grind:Status(4).measured, 4)
end)

T.test("rested: the bonus is left out of the measure, and halves the kills left", function()
    start("t-grind", 2, 0)
    H.player.rested = 5000
    H.kill(40); H.tick(2)        -- 80 experience: 40 for the kill, 40 of rested bonus
    T.eq(H.player.xp, 80)
    T.eq(Grind:KillXP(2), 40)
    local s = Grind:Status(4)
    T.ok(s.rested, "rested not reported")
    T.eq(s.kills, math.ceil((s.missing / 2) / 40))
    T.ok(H.plain(levelRow().sub):find(L.LEVEL_LEFT_RESTED:format(Ding.Compat.Number(s.missing), s.kills), 1, true), "rested kills not shown")
    -- Not enough rest for the whole way: the rested part counts twice, the rest once.
    H.player.rested = 400
    s = Grind:Status(4)
    T.eq(s.kills, math.ceil((s.missing - 400) / 40))
end)

T.test("quest experience is never taken for a kill, whatever the order of the events", function()
    start("t-grind-quest", 20, 0)
    -- 300 experience at level 20 (a monster of the level gives 145) would pass for a kill.
    H.turnin(456); H.tick(2)
    T.eq(select(2, Grind:KillXP(20)), 0, "turn-in after its experience")
    H.fire("QUEST_TURNED_IN", 458, 300, 0)
    H.kill(300); H.tick(2)
    T.eq(select(2, Grind:KillXP(20)), 0, "turn-in before its experience")
    H.tick(2)
    H.kill(140); H.tick(2)
    T.eq(select(2, Grind:KillXP(20)), 1, "a kill after the turn-in")
end)

T.test("level reached: the level step passes by itself", function()
    start("t-grind", 3, 1300)
    T.eq(E.index, 1)
    H.kill(200); H.flush(); H.tick(1)
    T.eq(H.player.level, 4)
    T.eq(E.index, 2, "the level step did not pass")
end)

T.test("the window updates on each kill during a level step", function()
    start("t-grind", 2, 0)
    local before = H.plain(levelRow().sub)
    H.kill(50); H.tick(1)
    T.ok(H.plain(levelRow().sub) ~= before, "experience left not updated after a kill")
end)

---------------------------------------------------------------------------
-- Where to grind
---------------------------------------------------------------------------
T.test("spot: the monsters of a quest of the log first, and the arrow towards them", function()
    start("t-grind", 2, 0)
    H.accept(456); H.flush(); H.tick(1)
    local spot = Grind.spot
    T.ok(spot, "no grinding spot")
    T.ok(spot.npc == 1984 or spot.npc == 2031, "not a monster of the quest in the log: " .. tostring(spot.npc))
    T.eq(spot.quest, 456)
    T.ok(#E.candidates > 0 and E.candidates[1].area, "the arrow does not aim at the spawns as an area")
    local point = E:NearestPoint()
    T.eq(point.label, spot.name)
    local row = grindRow()
    T.ok(row, "no grind row")
    T.eq(row.kind, "kill")
    T.ok(H.plain(row.text):find(L.ROW_KILL:format(spot.name), 1, true), "row: " .. H.plain(row.text))
    T.ok(H.plain(row.text):find(L.NPC_LEVEL:format(1), 1, true) or H.plain(row.text):find(L.NPC_LEVELS:format(1, 2), 1, true),
        "levels missing: " .. H.plain(row.text))
    T.ok(H.plain(row.sub or ""):find(Ding.Data:QuestName(456), 1, true), "its quest is not named")
    T.eq(P:PointsOf(row), spot.points, "a click on the row does not aim at the spot")
end)

T.test("spot: without a quest in the log, the monsters of the coming steps", function()
    start("t-grind", 2, 0)
    local spot = Grind.spot
    T.ok(spot, "no grinding spot")
    T.ok(spot.npc == 2032 or spot.npc == 1985, "not a monster of the next quest (457): " .. tostring(spot.npc))
    T.eq(spot.quest, nil)
    -- Hovering the row (X in focus mode): the monster's card, with its levels.
    local row = grindRow()
    P:ShowQuest(row, P.frame)
    T.eq(GameTooltip.text, spot.name)
    -- First what the row's look means ("to do"), then the levels.
    T.eq(GameTooltip.lines[1], L.STATE_TODO)
    T.ok(GameTooltip.lines[2] and H.plain(GameTooltip.lines[2]):find(tostring(spot.maxLevel), 1, true),
        "no levels in the card")
end)

T.test("spot: never grey, elite or more than 2 levels above the player", function()
    for _, level in ipairs({ 1, 2, 3, 5, 7, 9 }) do
        start("t-grind-cave", level, 0)
        local spot = Grind.spot
        if spot then
            T.ok(spot.minLevel <= level + 2, ("level %d: %s is too high"):format(level, spot.name))
            T.ok(spot.maxLevel > Ding.Compat.GreyLevel(level), ("level %d: %s is grey"):format(level, spot.name))
        end
    end
    -- Level 9: Webwood Spiders (3-4) are grey: no spot, the arrow aims at the next place.
    start("t-grind-cave", 9, 0)
    T.eq(Grind.spot, nil)
end)

T.test("nothing to farm: the arrow aims at the next place, without validating the level step there", function()
    start("t-grind-none", 10, 0)
    T.eq(Grind.spot, nil)
    T.eq(#E.candidates, 1)
    T.ok(not E.candidates[1].isGo, "a go point would validate the level step on arrival")
    H.player.x, H.player.y = 40, 40
    Ding.Arrow.point = nil
    Ding.Arrow:Tick()
    H.flush()
    T.eq(E.index, 1, "the level step passed by reaching the next place")
end)

---------------------------------------------------------------------------
-- Step timings
---------------------------------------------------------------------------
T.test("timings: zone, deaths, kills and level step recorded with each sample", function()
    Ding.db.timings = {}
    start("t-grind", 3, 1250)
    H.tick(11)    -- past the resume window
    Ding.Timing:Start("t-grind", 1)
    H.kill(100); H.tick(2)
    H.fire("PLAYER_DEAD")
    H.kill(150); H.flush(); H.tick(2)
    T.eq(E.index, 2, "level 4 not reached")
    local samples = Ding.db.timings["t-grind"] and Ding.db.timings["t-grind"][1]
    T.ok(samples and #samples == 1, "no sample for the level step")
    local s = samples[1]
    T.eq(s[2], 3); T.eq(s[4], 4)
    T.eq(type(s[6]), "string")
    T.eq(s.map, 1438)
    T.eq(s.deaths, 1)
    T.eq(s.kills, 2)
    T.eq(s.killXP, 250)
    T.eq(s.levelStep, true)
    T.eq(s.step, "l4")
end)

T.test("timings: a step's signature names its quests, old samples still count", function()
    T.eq(Ding.Timing.Describe({ accept = { 456, 458 }, complete = { 456 }, turnin = { 457 } }), "a456,458 c456 t457")
    T.eq(Ding.Timing.Describe({ go = { 1438, 1, 1 }, text = "x" }), "g")
    Ding.db.timings = { old = { [3] = { { 120, 2, 100, 2, 400, "2026-10-01" } } } }
    Ding.Config.unfolded.appearance = true    -- under "Advanced"
    Ding.Config:Open("appearance")
    local found
    for _, row in ipairs(Ding.Config.TABS[Ding.Config.TAB.appearance].rows) do
        if row.opts and row.opts.label == L.TIMING then found = row end
    end
    T.ok(found, "timing row missing")
    T.eq(found.opts.desc(), L.TIMING_DESC:format(1, 1))
    Ding.Config:Close()
end)

T.run()
