-- Steps behind an option of the Automation tab (Ding:StepApplies): hearthstone (on by
-- default), death skips, dungeon and elite quests (off). A step whose option is off does not
-- apply, like a step for another race. And `next` keyed by faction (Skyborne).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L, Cfg = Ding.Engine, Ding.Panel, Ding.L, Ding.Config

Ding.RegisterGuide({ id = "t-opt", title = "Options", races = { "NightElf" }, steps = {
    { accept = 456 },                                         -- 1
    { sethearth = "Dolanaar" },                               -- 2
    { hearth = true },                                        -- 3
    { deathskip = true, text = "Die at the cave, revive at Dolanaar" },  -- 4
    { accept = 458, dungeon = "The Deadmines" },              -- 5
    { accept = 916, elite = true },                           -- 6
    { turnin = 456 },                                         -- 7
} })

local function start(level)
    H.closeDialog()
    T.reset({ level = level or 3 })
    Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = true, true
    T.quests({ [456] = "log" })
    E:SetGuide("t-opt", 1, true)
    H.flush()
    H.tick(11)
end

local function texts()
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do out[#out + 1] = H.plain(row.text) .. " / " .. H.plain(row.sub or "") end
    return table.concat(out, " | ")
end

T.test("defaults: hearthstone steps on, death skips, dungeons and elites off", function()
    local d = Ding.DEFAULTS.ui
    T.eq(d.hearth, true)
    T.eq(d.deathSkip, false)
    T.eq(d.dungeons, false)
    T.eq(d.elites, false)
end)

T.test("options off: their steps are passed like steps for another race", function()
    start()
    Ding.db.ui.hearth = false
    E:Update(); H.flush()
    T.eq(E.index, 7, "a step behind an option that is off was not passed")
    T.ok(not Ding:StepApplies(Ding:GetGuide("t-opt").steps[2]))
    T.ok(Ding:StepApplies(Ding:GetGuide("t-opt").steps[7]))
end)

T.test("hearthstone: bind at the inn, then use it; one button for it", function()
    start()
    T.eq(E.index, 2)
    T.ok(texts():find(L.SETHEARTH:format("Dolanaar"), 1, true), texts())
    H.fire("HEARTHSTONE_BOUND"); H.flush()
    T.eq(E.index, 3)
    H.player.bind = "Dolanaar"
    H.tick(2)    -- the finished step stays 1.5 s on screen
    E:Refresh()
    T.ok(texts():find(L.HEARTH_TO:format("Dolanaar"), 1, true), "where the hearthstone goes: " .. texts())
    -- The item button offers the hearthstone (a secure click, as for quest items).
    H.setItem(Ding.ItemButton.HEARTHSTONE, 1, { use = true })
    T.eq(Ding.ItemButton:Wanted(), Ding.ItemButton.HEARTHSTONE)
    -- Casting it validates the step.
    H.fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 8690); H.flush()
    T.ok(E.index > 3, "casting the hearthstone does not validate the step")
end)

T.test("hearthstone: another spell, or another unit, does not validate the step", function()
    start()
    H.fire("HEARTHSTONE_BOUND"); H.flush()
    T.eq(E.index, 3)
    H.fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 133); H.flush()
    H.fire("UNIT_SPELLCAST_SUCCEEDED", "target", "cast", 8690); H.flush()
    T.eq(E.index, 3)
end)

T.test("death skip: off by default; on, done once dead and alive again", function()
    start()
    H.fire("HEARTHSTONE_BOUND"); H.flush()
    E:Next(); H.flush()
    T.eq(E.index, 7, "death skip, dungeon and elite steps not passed when off")
    Ding.db.ui.deathSkip = true
    T.ok(E:BackToIncomplete(), "the death skip step does not come back once on")
    T.eq(E.index, 4)
    T.ok(texts():find("Die at the cave", 1, true) and texts():find(L.DEATHSKIP_HINT, 1, true), texts())
    T.ok(not E:IsManual(E:CurrentStep()), "a death skip is validated by Ding, not by \"next\"")
    H.setDead(true); H.fire("PLAYER_DEAD"); H.flush()
    T.eq(E.index, 4)
    H.setGhost({ map = 1438, x = 56, y = 28 }); H.fire("PLAYER_ALIVE"); H.flush()
    T.eq(E.index, 4, "released, still a ghost: not done yet")
    T.ok(Ding.char.deathskip, "the death is not remembered for a reload")
    H.setGhost(nil); H.fire("PLAYER_UNGHOST"); H.flush()
    T.eq(E.index, 7, "alive again: the death skip is not done")
    T.eq(Ding.char.deathskip, nil)
end)

T.test("death skip: a death during another step does not count", function()
    start()
    Ding.db.ui.deathSkip = true
    T.eq(E.index, 2)
    H.setDead(true); H.fire("PLAYER_DEAD"); H.setDead(false); H.fire("PLAYER_ALIVE"); H.flush()
    H.fire("HEARTHSTONE_BOUND"); H.flush()
    E:Next(); H.flush()
    T.eq(E.index, 4)
    H.fire("PLAYER_UNGHOST"); H.flush()
    T.eq(E.index, 4, "an old death validated the death skip")
end)

T.test("dungeon and elite quests: passed and never accepted when off; shown with their tag when on", function()
    start()
    Ding.db.ui.hearth = false
    E:Update(); H.flush()
    T.eq(E.index, 7)
    H.clearDialogCalls()
    H.talk({ gives = { 458, 916 } }); H.flush()
    T.eq(table.concat(H.dialogCalls(), ", "), "", "a dungeon or elite quest was accepted with its option off")
    H.closeDialog()
    Ding.db.ui.dungeons, Ding.db.ui.elites = true, true
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 6)
    T.ok(texts():find(L.ELITE_STEP, 1, true), texts())
    T.ok(E:BackToIncomplete())
    T.eq(E.index, 5)
    T.ok(texts():find(L.DUNGEON_STEP:format("The Deadmines"), 1, true), texts())
end)

T.test("Route tab: the options with the gamepad and with the mouse", function()
    start()
    Cfg:Open("route"); H.flush()
    local rows = {}
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.route].rows) do
        if row.opts and row.opts.label then rows[row.opts.label] = row end
    end
    for _, label in ipairs({ L.OPT_HEARTH, L.OPT_DEATHSKIP, L.OPT_DUNGEONS, L.OPT_ELITES }) do
        T.ok(rows[label], "no row for " .. label)
    end
    T.eq(rows[L.OPT_DEATHSKIP].opts.desc, L.OPT_DEATHSKIP_DESC)
    -- Gamepad: A on the row.
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.OPT_HEARTH end, "hearthstone")
    H.press("PAD1")
    T.eq(Ding.db.ui.hearth, false)
    T.eq(E.index, 7, "the engine did not pass the hearthstone steps at once")
    -- Mouse: the guide's dungeons on their page, a click on "All", then "None".
    local dungeons = rows[L.OPT_DUNGEONS]
    T.eq(dungeons.kind, "page", "the dungeons are not on a page of their own")
    dungeons.scripts.OnClick(dungeons, "LeftButton"); H.flush()
    T.ok(Cfg.page and Cfg.page.key == "dungeons", "no dungeons page")
    local function button(label)
        for _, r in ipairs(Cfg.page.rows) do
            if r.opts and r.opts.label == label then return r end
        end
    end
    local all = button(L.DUNGEONS_EVERY)
    all.scripts.OnClick(all, "LeftButton"); H.flush()
    T.eq(Ding.db.ui.dungeons, true)
    local none = button(L.DUNGEONS_NO)
    none.scripts.OnClick(none, "LeftButton"); H.flush()
    T.eq(Ding.db.ui.dungeons, false)
    none.scripts.OnClick(none, "RightButton"); H.flush()
    T.eq(Cfg.page, nil, "a right click does not go back")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- next by faction
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-sky", title = "Skyborne start", steps = { { accept = 456 } },
    next = { Alliance = "t-sky-a", Horde = "t-sky-h" } })
Ding.RegisterGuide({ id = "t-sky-a", title = "Alliance", faction = "Alliance", steps = { { level = 60 } } })
Ding.RegisterGuide({ id = "t-sky-h", title = "Horde", faction = "Horde", steps = { { level = 60 } } })

T.test("next by faction: the guide of the side the character picked", function()
    for _, side in ipairs({ "Alliance", "Horde" }) do
        T.reset({ level = 12, faction = side })
        E:SetGuide("t-sky", 1, true); H.flush()
        T.quests({ [456] = "log" })
        T.eq(E.guide.id, side == "Alliance" and "t-sky-a" or "t-sky-h", side)
        T.eq(Ding.char.guide, E.guide.id)
    end
end)

T.test("next by faction: a character with no side yet finishes the guide", function()
    T.reset({ level = 12, faction = "Neutral" })
    E:SetGuide("t-sky", 1, true); H.flush()
    T.quests({ [456] = "log" })
    T.eq(E.guide.id, "t-sky")
    T.ok(E.finished, "the guide is not finished")
end)

T.run()
