-- Headless smoke test: loads Ding (files in .toc order) with a mocked WoW API and a
-- QuestieDB built from the Forever export, plays every guide chain as a player would and
-- prints what the panel shows after each step. It catches Lua errors, steps that never
-- advance and panel layout problems; it cannot replace a test in game.
-- usage: lua5.1 tools/smoke_test.lua <combined dir> [--quiet] [--skip-optional] [--locale enUS] [--tomtom]
--   --quiet          only problems and the summary
--   --skip-optional  optional quests never start (item that never drops...)
--   --locale X       client language (default frFR)
--   --tomtom         a simulated TomTom is installed while the guides are played: its
--                    arrow replaces Ding's at every step
-- Exit code: 0 when everything ran, 1 on a Lua error or a stuck step, 2 on bad usage.
local here = arg[0]:match("^(.*)[/\\]") or "."

local COMBINED, QUIET, SKIP_OPTIONAL, LOCALE, WITH_TOMTOM
local i = 1
while arg[i] do
    if arg[i] == "--quiet" then QUIET = true
    elseif arg[i] == "--skip-optional" then SKIP_OPTIONAL = true
    elseif arg[i] == "--locale" then i = i + 1; LOCALE = arg[i]
    elseif arg[i] == "--tomtom" then WITH_TOMTOM = true
    else COMBINED = arg[i] end
    i = i + 1
end
if not COMBINED then
    io.stderr:write("usage: lua5.1 tools/smoke_test.lua <combined dir> [--quiet] [--skip-optional] [--locale enUS] [--tomtom]\n")
    os.exit(2)
end

local H = dofile(here .. "/wow_mock.lua")({ combined = COMBINED, quiet = QUIET, skipOptional = SKIP_OPTIONAL,
    locale = LOCALE })
local X, Ding, player = H.X, H.Ding, H.player
local bindings, overrides, registered = H.bindings, H.overrides, H.registered
local problem, expect, plain, checkPanel = H.problem, H.expect, H.plain, H.checkPanel
local fire, flush, tick, press, hold, release = H.fire, H.flush, H.tick, H.press, H.hold, H.release
local padDown, focusOn, selectTab, play = H.padDown, H.focusOn, H.selectTab, H.play

local function firstLaunch()
    local C = Ding.Config
    expect(C.frame and C.frame:IsShown(), "first launch: the settings window does not open")
    if not (C.frame and C.frame:IsShown()) then return end
    expect(C.tab == C.TAB.bindings and C.focus and C.focus.opts.action == "DING_CONFIG",
        'first launch: focus expected on "Open Ding settings"')
    expect(Ding.db.ui.welcomed, "first launch not remembered")
    expect(#registered == 1, "AddOns > Ding category not registered")
    expect(UISpecialFrames[1] == "DingConfigFrame", "Escape would not close the window")
    press("PAD1")
    expect(C.capturing, "A does not start waiting for a button")
    padDown("PADLTRIGGER", { shift = true })
    expect(C.capturing, "LT alone (a modifier) must not end the wait")
    padDown("PADFORWARD", { shift = true })
    expect(bindings["SHIFT-PADFORWARD"] == "DING_CONFIG", "binding LT+Start failed")
    expect(C.focus.chip.key == "LT+Start", "name shown: " .. tostring(C.focus.chip.key))
    press("PAD2")
    expect(not C.frame:IsShown(), "B does not close the window")
    expect(next(overrides) == nil, "temporary bindings still active after closing")
end

---------------------------------------------------------------------------
-- Run every chain root
---------------------------------------------------------------------------
local referenced = {}
for _, g in Ding:IterateGuides() do
    -- `next` may name one guide, or one per faction (a race that picks its side later).
    if type(g.next) == "table" then
        for _, id in pairs(g.next) do referenced[id] = true end
    elseif g.next then
        referenced[g.next] = true
    end
end

_G.DingDB, _G.DingCharDB = nil, nil
fire("ADDON_LOADED", "Ding")
local E, P = Ding.Engine, Ding.Panel

local roots = {}
for id, g in Ding:IterateGuides() do if not referenced[id] then roots[#roots + 1] = g end end

-- Shadowglen's Crystal Phial (quest 921) has a "Use:" effect: the item button must offer it.
local PHIAL, ITEM_KEY = 5185, "SHIFT-PAD4"
H.setUsable(PHIAL, true)
bindings[ITEM_KEY] = Ding.ItemButton.BINDING

-- --tomtom: a strict TomTom stand-in (method calls, 0-1 coordinates, temporary waypoints
-- that TomTom never clears by itself). It can be made to fail.
local waypoints, tomtomFail = {}, false
local function waypointCount()
    local n = 0
    for _ in pairs(waypoints) do n = n + 1 end
    return n
end
local function installTomTom()
    local tt = {}
    function tt:AddWaypoint(map, x, y, opts)
        assert(self == tt, "TomTom:AddWaypoint must be a method call")
        if tomtomFail then error("TomTom broken") end
        assert(type(map) == "number" and x >= 0 and x <= 1 and y >= 0 and y <= 1, "bad TomTom coordinates")
        assert(type(opts) == "table" and opts.persistent == false and opts.cleardistance == 0 and opts.title,
            "bad TomTom options")
        local uid = { map = map, x = x, y = y, title = opts.title }
        waypoints[uid] = true
        return uid
    end
    function tt:RemoveWaypoint(uid)
        assert(self == tt, "TomTom:RemoveWaypoint must be a method call")
        assert(waypoints[uid], "removing an unknown waypoint")
        waypoints[uid] = nil
    end
    _G.TomTom = tt
end
-- One waypoint exactly when the arrow has a target, and Ding's own arrow out of the way.
local function checkTomTom(where)
    local A = Ding.Arrow
    A.point = nil; A:Tick()
    local hasTarget = A.point ~= nil
    if waypointCount() ~= (hasTarget and 1 or 0) then
        problem(("%s: %d TomTom waypoint(s) for %s"):format(where, waypointCount(), hasTarget and "one target" or "no target"))
    end
    if hasTarget and (A.frame.label:IsShown() or A.frame.arrow:IsShown()) then
        problem(where .. ": Ding's arrow stays shown with TomTom")
    end
end
if WITH_TOMTOM then
    installTomTom()
    Ding.db.arrow.tomtom = true      -- an opt-in: Ding's own arrow by default
end

local loggedIn = false
for _, guide in ipairs(roots) do
    player.race = guide.races and guide.races[1] or X.FACTION_RACES[guide.faction or "Alliance"][1]
    player.faction = guide.faction or "Alliance"
    player.class = guide.classes and guide.classes[1] or "WARRIOR"
    player.level, player.xp, player.map = guide.minLevel, 0, 1438
    H.resetQuests()
    -- A new character: forget what the engine remembers of the previous chain.
    E.turnedIn = {}
    Ding.char.manual = {}
    print(("# %s (%s, %s)"):format(guide.id, player.race, player.class))

    if not loggedIn then
        fire("PLAYER_LOGIN")
        fire("QUEST_LOG_UPDATE")    -- the quest log comes a moment after login
        loggedIn = true
        tick(2.5)
        local ok, err = pcall(firstLaunch)
        if not ok then problem("first launch: " .. tostring(err)) end
    end
    E:SetGuide(guide.id, 1, true)
    flush()
    checkPanel("start")

    local guard = 0
    while not E.finished do
        guard = guard + 1
        if guard > 5000 then problem("the guide never ends") break end
        local id, index, step = E.guide.id, E.index, E:CurrentStep()
        -- Players kill monsters on the way: each guide starts at its own minimum level.
        if index == 1 and player.level < E.guide.minLevel then
            H.grindTo(E.guide.minLevel)
            flush()
            id, index, step = E.guide.id, E.index, E:CurrentStep()
        end
        local button = _G.DingItemButton
        if button and button:IsShown() then
            local item = H.pressBinding(ITEM_KEY)
            expect(item ~= nil, ("%s, step %d: item button shown without an item"):format(id, index))
            H.say("    item used: " .. tostring(item))
        end
        local automatic = play(step)
        flush()
        if not E.finished and E.guide.id == id and E.index == index then
            if automatic and not step.optional then
                problem(("%s, step %d: did not complete by itself"):format(id, index))
            end
            E:Next()
            flush()
        end
        checkPanel(("%s, step %d done (level %d, log %d)"):format(id, index, player.level, #H.logOrder()))
        if WITH_TOMTOM then checkTomTom(("%s, step %d"):format(id, index)) end
        if not E.finished and not QUIET then
            local point = E:NearestPoint()
            print("    arrow -> " .. (point and ("%s (%.1f, %.1f)"):format(plain(point.label), point.x, point.y) or "none"))
        end
    end
    print(("   end: level %d, log: %s"):format(player.level, #H.logOrder() > 0 and table.concat(H.logOrder(), ", ") or "empty"))
    if WITH_TOMTOM then expect(waypointCount() == 0, guide.id .. ": TomTom waypoint left behind at the end of the chain") end
    local usesPhial = false
    for _, s in ipairs(guide.steps) do
        for _, q in ipairs(s.complete or {}) do if q == 921 then usesPhial = true end end
    end
    if usesPhial then
        local used = false
        for _, item in ipairs(H.itemUses()) do if item == "item:" .. PHIAL then used = true end end
        expect(used, guide.id .. ": the item button never offered the Crystal Phial")
    end
end

-- The scenarios below play Shadowglen as a night elf, whatever other guides Ding ships.
-- A guide is done when the engine finished it or chained to its next guide.
local SCENARIO = Ding:GetGuide("nightelf-01-shadowglen")
local function scenarioCharacter()
    player.race, player.faction, player.class = "NightElf", "Alliance", "WARRIOR"
end
local function guideDone(guide)
    return E.finished or E.guide.id ~= guide.id
end

-- --tomtom: the setting, the arrow toggle and a broken TomTom, then TomTom is removed so
-- the scenarios below run as without it.
if WITH_TOMTOM then
    local ok, err = pcall(function()
        local A, TT = Ding.Arrow, Ding.TomTom
        scenarioCharacter()
        H.resetQuests()
        E.turnedIn, Ding.char.manual = {}, {}
        player.level = SCENARIO.minLevel
        E:SetGuide(SCENARIO.id, 1, true); flush()
        checkTomTom("TomTom, start")
        A:SetTomTom(false)
        expect(waypointCount() == 0 and A.frame.label:IsShown(), "TomTom turned off: no return to Ding's arrow")
        A:SetTomTom(true)
        checkTomTom("TomTom turned on again")
        A:Toggle()
        expect(waypointCount() == 0, "arrow hidden: the TomTom waypoint stays")
        A:Toggle()
        checkTomTom("arrow shown again")
        TT:Clear()
        tomtomFail = true
        A.point = nil; A:Tick()
        tomtomFail = false
        expect(A.frame.label:IsShown() and waypointCount() == 0, "TomTom broken: no return to Ding's arrow")
    end)
    if not ok then problem("TomTom: " .. tostring(err)) end
    _G.TomTom = nil
    Ding.TomTom:Clear()
    Ding.TomTom.failed = nil
    Ding.db.arrow.tomtom = false
end

-- The same guide played only by talking to NPCs: Ding accepts and turns in by itself.
local ok, err = pcall(function()
    local guide = SCENARIO
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn = {}
    player.level = guide.minLevel
    Ding.char.manual = {}
    E:SetGuide(guide.id, 1, true)
    tick(11)    -- past the resume window: play as a live session
    local guard = 0
    while not E.finished and E.guide.id == guide.id do
        guard = guard + 1
        if guard > 300 then problem("automatic: the guide never ends") break end
        local index, step = E.index, E:CurrentStep()
        if step.optional and SKIP_OPTIONAL then
            E:Next(); flush()
        else
            for _ = 1, #(step.turnin or {}) do
                for _, q in ipairs(step.turnin) do
                    if H.log()[q] and not H.log()[q].done then H.complete(q) end
                    if not H.log()[q] and not H.completed()[q] then H.talk({ gives = { q } }); flush() end
                    if H.log()[q] then H.complete(q) end
                end
                H.talk({ ends = step.turnin }); flush(); tick(3)
            end
            local need = 1
            for _, q in ipairs(step.accept or {}) do need = math.max(need, QuestDB.requiredLevel(q)) end
            H.grindTo(need)
            for _ = 1, #(step.accept or {}) do
                H.talk({ gives = step.accept }); flush(); tick(3)
            end
            for _, q in ipairs(step.complete or {}) do
                if not H.log()[q] and not H.completed()[q] then H.talk({ gives = { q } }); flush() end
                H.complete(q)
            end
            if step.level then H.grindTo(step.level) end
            flush()
            if E.index == index and E.guide.id == guide.id and not E.finished then
                local manual = step.go or step.train or step.hearth or step.fly or step.sethearth
                    or not (step.turnin or step.accept or step.complete or step.level)
                if not manual and not step.optional then
                    problem(("automatic, step %d: not completed by the dialogs"):format(index))
                end
                E:Next(); flush()
            end
        end
    end
    H.closeDialog()
    expect(guideDone(guide), "automatic: guide not finished")
end)
if not ok then problem("automatic: " .. tostring(err)) end

-- TomTom installed: Ding's target goes to TomTom's arrow, Ding's own arrow steps aside,
-- and walking to a "go" point still validates the step.
ok, err = pcall(function()
    local added, removed = {}, 0
    _G.TomTom = {
        AddWaypoint = function(_, map, x, y, opts)
            added[#added + 1] = { map = map, x = x, y = y, title = opts.title }
            return #added
        end,
        RemoveWaypoint = function() removed = removed + 1 end,
    }
    local tomtomSetting = Ding.db.arrow.tomtom
    Ding.db.arrow.tomtom = true
    local guide = SCENARIO
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    local goIndex
    for i, step in ipairs(guide.steps) do
        if step.go and not goIndex then goIndex = i end
    end
    -- Start away from the "go" point: an earlier scenario may have left the player on it,
    -- which would validate the step (and move on to the next guide) before TomTom gets it.
    local go = guide.steps[goIndex].go
    player.map, player.x, player.y = go[1], go[2], go[3] - 20
    E:SetGuide(guide.id, 1, true)
    tick(11)
    while E.index < goIndex do E:Skip(); flush() end
    tick(1)
    expect(E.guide.id == guide.id and E.index == goIndex, 'TomTom: the "go" step is skipped')
    local wp = added[#added]
    expect(wp ~= nil, "TomTom: no waypoint received")
    expect(not Ding.Arrow.frame.label:IsShown(), "TomTom: Ding's target name stays shown")
    expect(wp and wp.map == go[1] and math.abs(wp.x - go[2] / 100) < 1e-9, "TomTom: wrong waypoint")
    player.map, player.x, player.y = go[1], go[2], go[3]
    tick(2); flush(); tick(1)
    expect(E.index ~= goIndex, 'TomTom: the "go" step does not complete')
    expect(removed >= 1, "TomTom: the old waypoint is not removed")
    _G.TomTom = nil
    Ding.TomTom:Clear()
    Ding.db.arrow.tomtom = tomtomSetting
    tick(1)
    expect(Ding.Arrow.frame.label:IsShown() or not Ding.Arrow.frame:IsShown(), "TomTom removed: Ding's arrow does not come back")
end)
if not ok then problem("TomTom: " .. tostring(err)) end

-- A character already halfway through its first guide, new to Ding: Ding picks the guide
-- and resumes past the manual steps without any input.
ok, err = pcall(function()
    local guide = SCENARIO
    scenarioCharacter()
    local half = math.floor(#guide.steps / 2)
    H.resetQuests()
    for i = 1, half do
        local step = guide.steps[i]
        for _, q in ipairs(step.accept or {}) do H.setQuest(q, "log") end
        for _, q in ipairs(step.complete or {}) do H.setQuest(q, "ready") end
    end
    for i = 1, half do
        for _, q in ipairs(guide.steps[i].turnin or {}) do H.setQuest(q, "turnedin") end
    end
    -- Halfway through the guide, whatever level the previous scenario left.
    player.level = guide.maxLevel - 1
    Ding.char.guide, Ding.char.step, Ding.char.manual = nil, nil, {}
    E.guide, E.turnedIn = nil, {}    -- a new session
    E:Start()
    flush()
    expect(E.guide and E.guide.id == guide.id, "resume: wrong guide picked (" .. tostring(E.guide and E.guide.id) .. ")")
    -- The first step past the half with a quest action left is where the guide resumes.
    local expected = half + 1
    while not (guide.steps[expected].turnin or guide.steps[expected].complete or guide.steps[expected].accept) do
        expected = expected + 1
    end
    expect(E.index == expected, ("resume: step %d instead of %d"):format(E.index, expected))
    checkPanel("resume of a character halfway through")
    -- Back to the end of the chain for the next checks.
    H.resetQuests()
    for _, step in ipairs(guide.steps) do
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            for _, q in ipairs(step[key] or {}) do H.setQuest(q, "turnedin") end
        end
    end
    E:SetGuide(guide.id, 1, true)
    E:Next()
    flush()
end)
if not ok then problem("resume: " .. tostring(err)) end

-- Skip a step to do it later, play the next one, come back to it, then finish the guide.
ok, err = pcall(function()
    local guide = SCENARIO
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level = guide.minLevel
    E:SetGuide(guide.id, 1, true)
    tick(11)
    local function quests(step)
        local set = {}
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            for _, q in ipairs(step[key] or {}) do set[q] = true end
        end
        return set
    end
    local function shares(a, b)
        for q in pairs(quests(a)) do if quests(b)[q] then return true end end
        return false
    end
    local skipped, back = nil, false
    local guard = 0
    while not E.finished and E.guide.id == guide.id do
        guard = guard + 1
        if guard > 300 then problem("skip: the guide never ends") break end
        local index, step = E.index, E:CurrentStep()
        local nextStep = guide.steps[index + 1]
        if not skipped and step.complete and not step.optional and nextStep
            and (nextStep.accept or nextStep.complete or nextStep.turnin) and not shares(step, nextStep) then
            skipped = index
            E:Skip(); flush()
            expect(E.index == index + 1, ("skip: step %d instead of %d"):format(E.index, index + 1))
            checkPanel(("step %d skipped"):format(index))
        else
            play(step); flush()
            if E.index == index and E.guide.id == guide.id and not E.finished then E:Next(); flush() end
            if skipped and not back then
                back = true
                expect(E:BackToIncomplete(), "skip: cannot go back to the skipped step")
                expect(E.index == skipped, ("skip: back to step %d instead of %d"):format(E.index, skipped))
                checkPanel(("back to skipped step %d"):format(skipped))
            end
        end
    end
    expect(back, "skip: no step skipped then taken up again")
    expect(guideDone(guide), "skip: guide not finished")
end)
if not ok then problem("skip: " .. tostring(err)) end

-- Panel and commands
ok, err = pcall(function()
    P:Toggle(); assert(not P.frame:IsShown(), "Toggle should hide")
    P:Toggle(); assert(P.frame:IsShown(), "Toggle should show")
    assert(P:SetScale("1.5") == 1.5 and P:SetScale(9) == 1.5 and P:SetScale(0.1) == 0.5 and P:SetScale("x") == nil,
        "SetScale")
    assert(P:SetWidth(500) == 420 and P:SetWidth(100) == 240 and P:SetWidth(300) == 300, "SetWidth")
    P:SetScale(1)
    P.frame.scripts.OnDragStop(P.frame)
    E:Prev(); flush(); checkPanel('after "previous"')
    if E.finished then problem('"previous" did not leave the end screen') end
    E:Next(); flush()
    for _, cmd in ipairs({ "", "", "list", "scale 1", "arrow", "arrow", "help", "next", "prev", "skip", "back" }) do
        SlashCmdList.DING(cmd)
        flush()
    end
end)
if not ok then problem("panel or commands: " .. tostring(err)) end

-- Settings window, driven with the gamepad only
local C = Ding.Config
local L = Ding.L
local db = Ding.db
ok, err = pcall(function()
    SlashCmdList.DING("config")
    expect(C.frame:IsShown(), "/ding config does not open the window")

    -- Binding conflict: B cancels, A replaces, Y clears.
    selectTab(C, C.TAB.bindings)
    focusOn(C, function(r) return r.opts.action == "DING_COMPACT" end, "Minimize/expand the guide")
    press("PAD1")
    padDown("PAD2")
    expect(not C.capturing, "B alone does not cancel the wait")
    press("PAD1")
    padDown("PADDRIGHT", { shift = true })
    expect(C.conflictRow ~= nil, "conflict not detected")
    press("PAD2")
    expect(bindings["SHIFT-PADDRIGHT"] == "DING_NEXT", "B did not cancel the replacement")
    press("PAD1")
    padDown("PADDRIGHT", { shift = true })
    press("PAD1")
    expect(bindings["SHIFT-PADDRIGHT"] == "DING_COMPACT", "A did not replace the binding")
    press("PAD4")
    expect(bindings["SHIFT-PADDRIGHT"] == nil, "Y did not clear the binding")
    SetBinding("SHIFT-PADDRIGHT", "DING_NEXT")

    -- Every row of every tab: adjust, toggle twice, confirm then cancel.
    for t = 1, 5 do
        selectTab(C, t)
        local first, seen = C.focus, 0
        repeat
            local row = C.focus
            if not row then break end
            seen = seen + 1
            if row.kind == "slider" or row.kind == "selector" then
                press("PADDRIGHT"); press("PADDLEFT"); press("PAD4")
            elseif row.kind == "check" then
                local before = row.checked
                press("PAD1"); press("PAD1")
                expect(row.checked == before, "checkbox toggled twice: state changed (" .. row.opts.label .. ")")
            elseif row.kind == "button" and row.opts.confirm then
                press("PAD1")
                expect(row.confirming, "no confirmation asked: " .. row.opts.label)
                press("PAD2")
                expect(not row.confirming and C.frame:IsShown(), "B does not cancel the confirmation: " .. row.opts.label)
            end
            -- The footer lists what no chip on screen says (each action once): all of it fits,
            -- and a row with an empty footer carries its A (check box corner, button).
            local help = C.frame.help
            expect((help.shown or 0) == #(help.list or {}), "help bar cut")
            if #(help.list or {}) == 0 then
                local chip = row.aGlyph or (row.button and row.button.keyGlyphs and row.button.keyGlyphs[1])
                expect(chip and chip:IsShown(), "empty help bar and no A on the row: " .. tostring(row.opts.label))
            end
            press("PADDDOWN")
        until C.focus == first or seen > 40
        expect(seen > 1, "tab " .. t .. ": the d-pad does not go through the elements")
    end
    -- A confirmation expires after 4 s.
    selectTab(C, C.TAB.appearance)
    focusOn(C, function(r) return r.opts.label == L.RESET_ALL end, "Restore all defaults")
    press("PAD1")
    tick(4.5)
    expect(not C.focus.confirming, "the confirmation does not expire after 4 s")
    expect(db.panel.scale == 1 and db.panel.bgAlpha == 0.85 and db.arrow.size == 56, "appearance settings changed")
    expect(db.arrow.mode == 0 and db.ui.buttonStyle == "xbox", "arrow or gamepad settings changed")

    -- Move mode: the guide window, with key repeat, LB fine step, Y default, B cancel, A save.
    selectTab(C, C.TAB.appearance)
    focusOn(C, function(r) return r.opts.label == L.MOVE_PANEL end, "Move guide window")
    press("PAD1")
    expect(not C.frame:IsShown() and _G.DingMoveFrame:IsShown(), "move mode does not start")
    local x0, y0 = db.panel.x, db.panel.y
    hold("PADDRIGHT"); tick(0.6); release("PADDRIGHT")
    expect(db.panel.x >= x0 + 15, "the d-pad held down does not repeat (x " .. x0 .. " -> " .. db.panel.x .. ")")
    hold("PADLSHOULDER"); press("PADDUP"); release("PADLSHOULDER")
    expect(db.panel.y == y0 + 1, "LB does not give a step of 1")
    press("PAD4")
    expect(db.panel.point == "TOPLEFT", "original position not normalized")
    press("PAD2")
    expect(db.panel.x == x0 and db.panel.y == y0, "B does not restore the previous position")
    expect(C.frame:IsShown() and C.tab == C.TAB.appearance and C.focus.opts.label == L.MOVE_PANEL, "back to the window after moving")
    press("PAD1"); press("PADDRIGHT"); press("PAD1")
    expect(db.panel.x == x0 + 5, "A does not save the position")

    -- Move mode: the arrow.
    selectTab(C, C.TAB.arrow)
    focusOn(C, function(r) return r.opts.label == L.MOVE_ARROW end, "Move arrow")
    local ay = db.arrow.y
    press("PAD1"); press("PADDUP"); press("PAD1")
    expect(db.arrow.y == ay + 5, "the arrow does not move")

    -- Combat: the window closes before the lockdown, the panel collapses.
    fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    expect(not C.frame:IsShown() and next(overrides) == nil, "window or bindings still there in combat")
    expect(P.compact and P.frame.h == 28, "the panel does not minimize in combat")
    checkPanel("in combat (minimized)")
    SlashCmdList.DING("config")
    expect(not C.frame:IsShown(), "the settings open in combat")
    H.setCombat(false); fire("PLAYER_REGEN_ENABLED")
    expect(not P.compact, "the panel does not come back after combat")

    -- Combat during the move mode cancels it without reopening the window.
    C:Open("appearance")
    focusOn(C, function(r) return r.opts.label == L.MOVE_PANEL end, "Move guide window")
    press("PAD1")
    fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    expect(not _G.DingMoveFrame:IsShown() and not C.frame:IsShown() and next(overrides) == nil,
        "combat does not cancel the move mode")
    H.setCombat(false); fire("PLAYER_REGEN_ENABLED")

    -- Minimized by hand, hidden in dungeons.
    P:ToggleCompact()
    expect(P.frame.h == 28 and plain(P.frame.mini.text.text) ~= "", "minimized version empty")
    checkPanel("minimized")
    P:ToggleCompact()
    db.panel.hideInInstance = true
    H.setInstance(true)
    fire("PLAYER_ENTERING_WORLD")
    expect(not P.frame:IsShown(), "the panel stays shown in a dungeon")
    H.setInstance(false)
    fire("PLAYER_ENTERING_WORLD")
    expect(P.frame:IsShown(), "the panel does not come back outside the dungeon")
    db.panel.hideInInstance = false

    -- Guide dropdowns: a section for another race, then back where we were; then a guide
    -- pack (first list), then Ding's guide again; an item guide (under its own header), then
    -- Ding's guide again, on the same section and step (the scenario's pack: Ding - Zones).
    Ding.RegisterGuide({ id = "smoke-other", pack = SCENARIO.pack, title = "Other guide", faction = "Horde",
        races = { "Orc" }, steps = { { level = 60 } } })
    Ding.RegisterGuidePack({ id = "smoke-pack", title = "Test pack", author = "Ding" })
    Ding.RegisterGuide({ pack = "smoke-pack", id = "smoke-pack-1", title = "Test section",
        steps = { { level = 60 } } })
    Ding.RegisterGuidePack({ id = "smoke-items", title = "Test items", category = "items" })
    Ding.RegisterGuide({ pack = "smoke-items", id = "smoke-items-1", title = "Test bag",
        steps = { { text = "Bag one" }, { text = "Bag two" } } })
    local before, beforeIndex = E.guide.id, E.index
    C:Open("guide", 2)
    expect(C.focus and C.focus.box and C.focus.opts.label == L.GUIDE_SECTION,
        "Guide tab: the section list is not the second one")
    local count = 0
    for _ in Ding:IterateGuides(E.guide.pack) do count = count + 1 end
    -- Opens the focused list and moves down to `id` with the d-pad, then A.
    local function pick(id)
        press("PAD1")
        for _ = 1, #C.dropdown.entries do
            if C.dropdown.entries[C.dropdown.index].value == id then break end
            press("PADDDOWN")
        end
        press("PAD1")
    end
    press("PAD1")
    expect(C.dropdown and #C.dropdown.entries == count, "section list: every section of the pack expected")
    press("PAD2")
    pick("smoke-other")
    expect(E.guide.id == "smoke-other" and not C.dropdown, "section list: section not loaded")
    pick(before)
    expect(E.guide.id == before and E.index == beforeIndex, "section list: going back to the previous section failed")
    press("PADDUP")
    expect(C.focus.opts.label == L.ACTIVE_GUIDE, "Guide tab: the guide list is not above")
    pick("smoke-pack")
    expect(E.guide.id == "smoke-pack-1" and Ding.char.pack == "smoke-pack", "guide list: pack not loaded")
    pick(SCENARIO.pack)
    expect(E.guide.pack == SCENARIO.pack, "guide list: going back to Ding's guide failed")
    press("PADDDOWN")
    pick(before)
    expect(E.guide.id == before and E.index == beforeIndex, "section list: going back to the previous section failed")
    press("PADDUP")
    press("PAD1")
    local headers = {}
    for _, e in ipairs(C.dropdown.entries) do
        if e.header then headers[#headers + 1] = e.text end
    end
    expect(table.concat(headers, ",") == L.CATEGORY_LEVELING .. "," .. L.CATEGORY_ITEMS,
        "guide list: the category headers are " .. table.concat(headers, ","))
    press("PAD2")
    pick("smoke-items")
    expect(E.guide.id == "smoke-items-1", "guide list: item guide not loaded")
    expect(E:KeepsGrey(E.guide) and not E:KeepsGrey(Ding:GetGuide(before)),
        "grey quests: an item guide must keep them, a leveling guide not")
    E:Next(); H.flush()
    pick(Ding:GetGuide(before).pack)
    expect(E.guide.id == before and E.index == beforeIndex, "guide list: back from the item guide, not where we were")
    press("PADDDOWN")
    press("PAD1"); press("PAD2")
    expect(C.frame:IsShown() and not C.dropdown, "dropdown: B does not close only the list")
    C:Close()

    -- A guide as text: /ding import, pasted, A; chosen in the guide list, two steps played;
    -- deleted from the Guide tab's page (A twice): back on the same section and step.
    local W, IM = Ding.ImportWindow, Ding.Import
    local map = player.map
    SlashCmdList.DING("import")
    expect(W.frame and W.frame:IsShown(), "/ding import: no window")
    H.type(W.frame.text.edit, ([[
```lua
{ id = "smoke-import", title = "Smoke import", category = "items", steps = {
    { text = "First imported step" },
    { go = { %d, 41.5, 42.5 }, text = "Second imported step" },
    { text = "Third imported step" },
} }
```]]):format(map))
    press("PAD1")
    expect(Ding:GetGuide("smoke-import"), "import: not imported (" .. tostring(W.frame.report.edit:GetText()) .. ")")
    press("PAD2")
    expect(not W.frame:IsShown(), "import: B does not close the window")
    C:Open("guide", 1)
    pick("smoke-import")
    expect(E.guide.id == "smoke-import" and E.index == 1, "import: the imported guide is not chosen")
    E:Next(); flush()
    expect(E.index == 2, "import: the first step does not pass")
    player.map, player.x, player.y = map, 41.5, 42.5
    Ding.Arrow.point = nil
    Ding.Arrow:Tick(); flush()
    expect(E.index == 3, "import: the go step is not validated on arrival")
    focusOn(C, function(r) return r.opts and r.opts.label == L.IMPORTED_ROW end, "Guides as text")
    press("PAD1")
    focusOn(C, function(r) return r.opts and r.opts.label == "Smoke import" end, "the imported guide")
    press("PAD1"); press("PAD1")
    expect(not Ding:GetGuide("smoke-import") and #IM:List() == 0, "import: not deleted")
    expect(E.guide.id == before and E.index == beforeIndex, "import: deleted, not back on the section and step")
    C:Close()

    -- The menu button opens the settings; "restore all defaults" with confirmation.
    P.frame.menu.scripts.OnClick(P.frame.menu)
    expect(C.frame:IsShown(), "the window's menu button does not open the settings")
    db.panel.scale, db.ui.buttonStyle = 1.5, "ps"
    selectTab(C, C.TAB.appearance)
    focusOn(C, function(r) return r.opts.label == L.RESET_ALL end, "Restore all defaults")
    press("PAD1"); press("PAD1")
    expect(db.panel.scale == 1 and db.ui.buttonStyle == "xbox" and db.ui.welcomed, "defaults not restored")
    press("PADFORWARD")
    expect(not C.frame:IsShown(), "Start does not close the window")
end)
if not ok then problem("settings: " .. tostring(err)) end

-- A guide that starts in the middle of a chain (Crown of the Earth, 921): Ding catches up
-- on the missing earlier quests (916 -> 917 -> 920) by talking to NPCs only.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-catchup", title = "Catch-up", races = { "NightElf" },
        steps = { { accept = 921 } } })
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.race, player.level = "NightElf", 2
    db.ui.autoAccept, db.ui.autoTurnin = true, true
    E:SetGuide("smoke-catchup", 1, true)
    tick(11)
    local worked = {}
    for _ = 1, 20 do
        if E.finished then break end
        local p = E:CatchUp(921, E:CurrentStep()) or 921
        worked[#worked + 1] = p
        expect(#E.candidates > 0 or QuestDB.requiredLevel(p) > player.level,
            ("catch-up: no destination for %d"):format(p))
        checkPanel(("catch-up, quest %d"):format(p))
        if not H.log()[p] then
            H.grindTo(QuestDB.requiredLevel(p))
            flush()
            H.talk({ gives = { p } })
        elseif not H.log()[p].done then
            H.complete(p)
        else
            H.talk({ ends = { p } })
        end
        flush(); tick(3)
    end
    H.closeDialog()
    expect(E.finished, "catch-up: the target quest was never accepted")
    expect(worked[1] == 916, "catch-up: does not start with the first link (" .. tostring(worked[1]) .. ")")
    expect(H.completed()[920] and H.log()[921], "catch-up: chain not followed")
end)
if not ok then problem("catch-up: " .. tostring(err)) end

-- Guided grinding: the level step shows the experience and kills left and a monster of the
-- player's level, the objective of another quest shows along the way near its monsters,
-- the level step passes by itself, and a trip with nothing left at its end is passed.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-grind", title = "Grind", races = { "NightElf" }, steps = {
        { accept = { 456, 916 } },
        { level = 6, note = "Finish the level on nearby monsters." },
        { complete = 456 },
        { go = { 1438, 40, 40 }, text = "Nowhere" },
        { accept = 458 },
        { turnin = 456 },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual, Ding.char.early = {}, {}, {}
    player.level, player.xp, player.rested = 5, 0, 1000
    player.map, player.x, player.y = 1438, 58.7, 43.3
    E:SetGuide("smoke-grind", 1, true)
    tick(11)
    H.accept(456); H.accept(916); flush()
    tick(2)    -- the finished step stays 1.5 s on screen
    expect(E.index == 2, "grind: not on the level step (" .. E.index .. ")")
    checkPanel("grind: level step")
    local rows = P.rowsShown or {}
    expect(rows[1] and rows[1].action == "level" and rows[1].counter and rows[1].sub,
        "grind: no experience left on the level row")
    local grindRow
    for _, r in ipairs(rows) do if r.action == "grind" then grindRow = r end end
    expect(grindRow ~= nil, "grind: no monster to farm")
    expect(#E.candidates > 0 and E.candidates[1].area, "grind: the arrow has no hunting area")
    -- Level 5: the spiders of Webwood Venom (3-4) are worth more than the young beasts
    -- (1-2) around; those are listed along the way, the spiders are not listed twice.
    expect(grindRow and grindRow.npc == 1986, "grind: the young beasts around beat the spiders")
    local along = {}
    for _, r in ipairs(P.rowsShown or {}) do if r.along then along[r.quest] = true end end
    expect(along[456] and not along[916], "grind: wrong objectives along the way")
    player.x, player.y = 56.8, 28.8
    tick(2.5)
    checkPanel("grind: in the cave")
    P:SetCompact(true); checkPanel("grind: minimized"); P:SetCompact(false)
    local guard = 0
    while player.level < 6 and guard < 500 do
        H.kill(60); tick(0.3)
        guard = guard + 1
    end
    tick(2)
    expect(E.index == 3, "grind: the level step did not pass (" .. E.index .. ")")
    H.complete(456); flush()
    expect(E.index == 4, "grind: not on the trip")
    H.accept(458); flush()
    expect(E.index == 6, "grind: the trip stays though nothing is left at its end (" .. E.index .. ")")
    checkPanel("grind: trip passed")
    player.rested = 0
end)
if not ok then problem("grind: " .. tostring(err)) end

-- Quest monsters: the marks on the enemy nameplates follow the first quests of Shadowglen
-- (the step's monsters, the counter of each kill, in combat too, no mark once an objective is
-- done), the tooltip line, and the plates go away without leaving a mark behind.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-mobs", title = "Quest monsters", races = { "NightElf" }, steps = {
        { accept = { 456, 916 } },
        { complete = 456 },
        { complete = 916 },
        { turnin = { 456, 916 } },
    } })
    local QM, D = Ding.QuestMobs, Ding.Data
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual, Ding.char.early = {}, {}, {}
    player.level, player.map, player.x, player.y = 5, 1438, 58.7, 43.3
    E:SetGuide("smoke-mobs", 1, true)
    tick(2)
    H.accept(456); H.accept(916); flush()
    tick(2)
    expect(E.index == 2, "quest monsters: not on the first quest (" .. E.index .. ")")
    -- Young nightsaber, young thistle boar, Webwood Spider, and a monster no quest needs.
    local units = { nameplate1 = 2031, nameplate2 = 1984, nameplate3 = 1986, nameplate4 = 1988 }
    for unit, npc in pairs(units) do H.addPlate(unit, { npc = npc, name = D:NpcName(npc) }) end
    local function shown(unit)
        local info = QM.plates[unit]
        return info and info.badge and info.badge:IsShown() and info.badge or nil
    end
    expect(shown("nameplate1") and shown("nameplate2") and shown("nameplate3") and not shown("nameplate4"),
        "quest monsters: wrong marks")
    local spider = shown("nameplate3")
    expect(spider and spider:GetAlpha() < 1, "quest monsters: another quest's monster stands out")
    -- The nightsabers, one at a time, in combat.
    H.setCombat(true); fire("PLAYER_REGEN_DISABLED"); flush()
    for have = 1, 7 do
        H.setObjective(456, 1, have, 7)
        fire("QUEST_LOG_UPDATE")
        tick(0.3)
        local b = shown("nameplate1")
        expect(have == 7 and not b or b and b.counter:GetText() == ("%d/7"):format(have),
            "quest monsters: the counter after kill " .. have)
    end
    expect(shown("nameplate2"), "quest monsters: the boars lost their mark")
    local lines = H.mouseover("nameplate2")
    expect(#lines == 2 and plain(lines[2]):find(D:QuestName(456), 1, true),
        "quest monsters: no tooltip line in combat")
    H.setCombat(false); fire("PLAYER_REGEN_ENABLED"); flush()
    H.complete(456); flush()
    tick(2)
    expect(E.index == 3, "quest monsters: not on the venom (" .. E.index .. ")")
    expect(not shown("nameplate2"), "quest monsters: a mark for a quest ready to turn in")
    spider = shown("nameplate3")
    expect(spider and spider:GetAlpha() == 1, "quest monsters: the step's spiders do not stand out")
    for unit in pairs(units) do H.removePlate(unit) end
    expect(next(QM.plates) == nil and not spider:IsShown(), "quest monsters: a mark left after the plates")
    H.complete(916); flush()
    tick(2)
end)
if not ok then problem("quest monsters: " .. tostring(err)) end

-- Steps behind options, then a `next` by faction: options off, their steps are passed;
-- on, they are played (inn, hearthstone cast, death and back to life, dungeon and elite
-- quests), and the guide chains to the one of the character's side.
ok, err = pcall(function()
    local steps = {
        { accept = 456 },
        { sethearth = "Aldrassil" },
        { hearth = true },
        { deathskip = true, text = "Die and revive" },
        { accept = 458, dungeon = "Somewhere deep" },
        { accept = 916, elite = true },
        { turnin = 456 },
    }
    Ding.RegisterGuide({ id = "smoke-options", title = "Options", races = { "NightElf" }, steps = steps,
        next = { Alliance = "smoke-options-a", Horde = "smoke-options-h" } })
    Ding.RegisterGuide({ id = "smoke-options-a", title = "Alliance side", faction = "Alliance",
        steps = { { text = "Alliance" } } })
    Ding.RegisterGuide({ id = "smoke-options-h", title = "Horde side", faction = "Horde",
        steps = { { text = "Horde" } } })
    local ui = Ding.db.ui
    for _, on in ipairs({ false, true }) do
        scenarioCharacter()
        H.resetQuests()
        E.turnedIn, Ding.char.manual = {}, {}
        player.level = 4
        ui.hearth, ui.deathSkip, ui.dungeons, ui.elites = on, on, on, on
        E:SetGuide("smoke-options", 1, true)
        tick(11)
        local guard = 0
        while E.guide.id == "smoke-options" and not E.finished and guard < 30 do
            guard = guard + 1
            local index, step = E.index, E:CurrentStep()
            expect(on or not (step.sethearth or step.hearth or step.deathskip or step.dungeon or step.elite),
                ("options off: step %d shown"):format(index))
            checkPanel(("options %s, step %d"):format(on and "on" or "off", index))
            if step.sethearth then
                fire("HEARTHSTONE_BOUND")
            elseif step.hearth then
                fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 8690)
            elseif step.deathskip then
                H.setDead(true); fire("PLAYER_DEAD")
                H.setGhost({ map = 1438, x = 50, y = 50 }); fire("PLAYER_ALIVE")
                H.setGhost(nil); fire("PLAYER_UNGHOST")
            else
                play(step)
            end
            flush()
            expect(E.index ~= index or E.guide.id ~= "smoke-options",
                ("options %s: step %d did not pass by itself"):format(on and "on" or "off", index))
            if E.index == index and E.guide.id == "smoke-options" then E:Next(); flush() end
        end
        expect(E.guide.id == "smoke-options-a", "options: not chained to the Alliance guide (" .. E.guide.id .. ")")
    end
    ui.hearth, ui.deathSkip, ui.dungeons, ui.elites = true, false, false, false
end)
if not ok then problem("options: " .. tostring(err)) end

-- Travel: a flight path learned on the flight map, the arrow to the flight master with
-- "Fly to ...", the banner and ring on the flight map, the flight and its landing at the
-- step's place; then the boat to the other continent, from its dock to the far side.
ok, err = pcall(function()
    local thor, ariena = Ding.Data:NpcPoints(523)[1], Ding.Data:NpcPoints(931)[1]
    Ding.RegisterGuide({ id = "smoke-travel", title = "Travel", races = { "Human" }, steps = {
        { go = { ariena.map, ariena.x + 1, ariena.y }, text = "Lakeshire" },
        { go = { 1439, 36, 46 }, text = "Auberdine" },
        { text = "End" },
    } })
    H.resetQuests()
    E.turnedIn, Ding.char.manual, Ding.char.flights = {}, {}, nil
    player.race, player.faction, player.class, player.level = "Human", "Alliance", "WARRIOR", 20
    player.map, player.x, player.y = thor.map, thor.x, thor.y
    local function nodes()
        return {
            { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
            { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
        }
    end
    H.openTaxi(nodes()); H.closeTaxi()
    E:SetGuide("smoke-travel", 1, true)
    tick(2)
    local A = Ding.Arrow
    expect(A.hint == L.TRAVEL_FLY:format("Lakeshire, Redridge"), "travel: no flight offered (" .. tostring(A.hint) .. ")")
    checkPanel("travel: fly")
    H.openTaxi(nodes())
    expect(Ding.TaxiMap.banner:IsShown() and Ding.TaxiMap.marker:IsShown(), "travel: nothing on the flight map")
    TakeTaxiNode(2)
    H.closeTaxi()
    tick(2)
    H.land(ariena.map, ariena.x + 1, ariena.y)
    tick(2)
    expect(E.index == 2, "travel: the landing does not validate the step (" .. E.index .. ")")
    -- To the other continent: back by air to the coast (the mock's Westfall lies next to the
    -- Wetlands), then the boat.
    local kinds = {}
    for _, l in ipairs(Ding.Travel:PlanFor(E.candidates[1]).legs) do kinds[#kinds + 1] = l.kind end
    expect(table.concat(kinds, " "):find("fly walk boat", 1, true), "travel: route " .. table.concat(kinds, " "))
    expect(A.hint == L.TRAVEL_FLY:format("Sentinel Hill, Westfall"), "travel: no flight back (" .. tostring(A.hint) .. ")")
    H.openTaxi({
        { name = "Lakeshire, Redridge", state = 0, map = ariena.map, x = ariena.x, y = ariena.y },
        { name = "Sentinel Hill, Westfall", state = 1, map = thor.map, x = thor.x, y = thor.y },
    })
    TakeTaxiNode(2)
    H.closeTaxi()
    H.land(thor.map, thor.x, thor.y)
    tick(2)
    expect(A.hint == L.TRAVEL_BOAT:format("Darkshore"), "travel: no boat to the other continent (" .. tostring(A.hint) .. ")")
    checkPanel("travel: boat")
    local leg = Ding.Travel.leg
    player.map, player.x, player.y = leg.point.map, leg.point.x, leg.point.y
    tick(2)
    player.x = player.x - 5
    tick(2)
    expect(Ding.Travel.boarding ~= nil and A.hint == L.TRAVEL_BOAT:format("Darkshore"), "travel: the boat is forgotten on board")
    player.map, player.x, player.y = 1439, 36, 46
    tick(2)
    expect(E.index == 3, "travel: Auberdine not reached (" .. E.index .. ")")
    Ding.char.flights = nil
end)
if not ok then problem("travel: " .. tostring(err)) end

-- Rewards and quest log: the best upgrade pointed out (option off), then taken (option on);
-- a quest the guide never uses listed in the Guide tab (gamepad), gone once abandoned.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-rewards", title = "Rewards", races = { "NightElf" }, steps = {
        { turnin = 456 }, { turnin = 458 }, { text = "End" },
    } })
    H.setItemInfo(910001, { name = "Cloth Gloves", equipLoc = "INVTYPE_HAND", sellPrice = 10,
        stats = { ITEM_MOD_INTELLECT_SHORT = 2 } })
    H.setItemInfo(910002, { name = "Mail Gloves", equipLoc = "INVTYPE_HAND", sellPrice = 12,
        stats = { ITEM_MOD_STRENGTH_SHORT = 3, RESISTANCE0_NAME = 60 } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    db.ui.autoAccept, db.ui.autoTurnin = true, true
    for _, q in ipairs({ 456, 458 }) do H.setQuest(q, "ready") end
    H.setQuest(916, "log")
    E:SetGuide("smoke-rewards", 1, true)
    tick(3)
    for i, choose in ipairs({ false, true }) do
        db.ui.chooseReward = choose
        local q = i == 1 and 456 or 458
        H.clearDialogCalls()
        H.talk({ ends = { q }, rewards = { [q] = { 910001, 910002 } } })
        flush()
        expect(Ding.RewardHint.banner:IsShown() or choose, "rewards: the best one is not pointed out")
        local taken = table.concat(H.dialogCalls(), ", "):find("reward " .. q .. " 2", 1, true) ~= nil
        expect(taken == choose, ("rewards: option %s, reward %s"):format(tostring(choose), taken and "taken" or "not taken"))
        if not choose then GetQuestReward(2) end
        H.closeDialog(); tick(3)
    end
    db.ui.chooseReward = false
    -- 916 is not in the guide: on the Guide tab's cleanup page (A opens it), A shows its
    -- card; once the player abandoned it in the game's log, it leaves the list.
    C:Open("guide")
    focusOn(C, function(r) return r.opts and r.opts.label == L.CLEANUP_ROW end, "cleanup row")
    press("PAD1")
    expect(C.page and C.page.key == "cleanup", "cleanup: no page")
    focusOn(C, function(r) return r.opts and r.opts.label == Ding.Data:QuestName(916) end, "cleanup quest")
    press("PAD1")
    expect(GameTooltip.text == Ding.Data:QuestName(916) and H.log()[916], "cleanup: no card, or the quest left")
    checkPanel("cleanup page")
    H.setQuest(916, nil); fire("QUEST_LOG_UPDATE"); tick(1)
    local listed = false
    for _, r in ipairs(C.page and C.page.rows or C.TABS[C.TAB.guide].rows) do
        if r.opts and r.opts.label == Ding.Data:QuestName(916) then listed = true end
    end
    expect(not listed, "cleanup: an abandoned quest stays listed")
    -- Its only quest gone, the page closes by itself: back on the tab.
    expect(C.frame:IsShown() and not C.page, "cleanup: the empty page stays")
    C:Close()
end)
if not ok then problem("rewards: " .. tostring(err)) end

-- Quests an NPC offers: beside its window, a quest of a later step ("step N") and one that is not
-- for the character (a Horde quest); gone with the window, and never shown with the option off.
ok, err = pcall(function()
    local O = Ding.Offers
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level = SCENARIO.minLevel
    db.ui.autoAccept, db.ui.autoTurnin = false, false
    E:SetGuide(SCENARIO.id, 1, true)
    tick(3)
    local later, step, horde = nil, nil, 96874
    for i = #SCENARIO.steps, 2, -1 do
        local accept = SCENARIO.steps[i].accept
        if accept and Ding:StepApplies(SCENARIO.steps[i]) then
            later, step = accept[1], i
            break
        end
    end
    H.talk({ gives = { later, horde } })
    flush()
    expect(O.frame and O.frame:IsShown() and #O.entries == 2, "offered quests: no panel beside the NPC window")
    local rows = O.entries or {}
    expect(rows[1] and rows[1].result.kind == "later" and rows[1].result.step == step,
        "offered quests: a later step's quest not placed at its step")
    expect(rows[2] and rows[2].result.kind == "none" and rows[2].result.reason == "class" and rows[2].text ~= "",
        "offered quests: a quest for the other side not said so")
    H.closeDialog()
    expect(not O.frame:IsShown(), "offered quests: the panel stays once the window closed")
    db.ui.offers = false
    H.talk({ gives = { later } })
    flush()
    expect(not O.frame:IsShown(), "offered quests: shown with the option off")
    H.closeDialog()
    db.ui.offers = true
    db.ui.autoAccept, db.ui.autoTurnin = true, true
end)
if not ok then problem("offered quests: " .. tostring(err)) end

-- Targets and service options: every monster of the objective in the target macro (the
-- arrow's last), a `train` step done by a spell learned, a `fly` step gone with its option.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-targets", title = "Targets", races = { "NightElf" }, steps = {
        { complete = 456 }, { train = true }, { fly = true }, { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level, player.map, player.x, player.y = 5, 1438, 58.7, 44
    H.setQuest(456, "log")
    E:SetGuide("smoke-targets", 1, true)
    tick(3)
    Ding.Arrow.point = nil; Ding.Arrow:Tick()
    local text = Ding.ItemButton.button:GetAttribute("macrotext-Target") or ""
    local last
    for line in text:gmatch("[^\n]+") do last = line end
    expect(select(2, text:gsub("/targetexact", "")) == 2, "targets: not both monsters in the macro: " .. text)
    expect(last == "/targetexact " .. tostring(Ding.Arrow.point.label), "targets: the arrow's monster is not last")
    H.complete(456); fire("QUEST_LOG_UPDATE"); tick(2)
    expect(E.index == 2, "targets: the objective step did not end (" .. E.index .. ")")
    fire("LEARNED_SPELL_IN_TAB", 6673, 1); tick(2)
    expect(E.index == 3, "targets: the train step did not end with a spell learned")
    checkPanel("targets: fly step")
    db.ui.flightSteps = false
    E:Update(); tick(1)
    expect(E.index == 4, "targets: the fly step stays with its option off")
    db.ui.flightSteps = true
end)
if not ok then problem("targets: " .. tostring(err)) end

-- Comfort: the target binding (secure item button, skull when solo), service steps that end
-- by themselves (class trainer, flight master, vendor, repair), the merchant selling grey
-- items and repairing.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-comfort", title = "Comfort", races = { "NightElf" }, steps = {
        { accept = 456 }, { train = true }, { fly = true }, { vendor = true }, { repair = true }, { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level, player.map, player.x, player.y = 5, 1438, 58.7, 44
    E:SetGuide("smoke-comfort", 1, true)
    tick(11)
    local key = "SHIFT-PAD2"
    bindings[key] = Ding.ItemButton.TARGET_BINDING
    Ding.Arrow.point = nil; Ding.Arrow:Tick()
    local name = Ding.Arrow.point and Ding.Arrow.point.label
    expect(H.pressBinding(key) == "/targetexact " .. tostring(name), "comfort: the target binding does not target the NPC")
    expect(H.raidMark(name) == 8, "comfort: no skull on the target")
    bindings[key] = nil
    H.accept(456); flush(); tick(2)
    expect(E.index == 2 and #E.candidates > 0, "comfort: no class trainer to go to")
    checkPanel("comfort: trainer")
    H.openTrainer(false); H.closeTrainer(); tick(2)
    expect(E.index == 3, "comfort: the trainer step did not end with its window")
    fire("UI_INFO_MESSAGE", 0, ERR_NEWTAXIPATH); flush(); tick(2)
    expect(E.index == 4, "comfort: the flight master step did not end with the new path")
    H.setItemInfo(930001, { name = "Grey Thing", quality = 0, sellPrice = 7 })
    H.putInBag(0, 1, 930001, 2)
    H.openMerchant({ canRepair = true, repairCost = 0 }); H.closeMerchant(); tick(2)
    expect(#H.sold() == 1 and E.index == 5, "comfort: vendor step or grey items")
    H.openMerchant({ canRepair = true }); H.closeMerchant(); tick(2)
    expect(E.index == 6, "comfort: the repair step did not end with the window")
    checkPanel("comfort: end")
end)
if not ok then problem("comfort: " .. tostring(err)) end

-- Training reminder before the first visit: a guess at even levels, and one chat line once
-- at a class trainer.
ok, err = pcall(function()
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    Ding.char.training, Ding.char.trainingReminded = nil, nil
    player.level = 4
    local trainer = Ding.Services:Nearest("trainer", 1)[1]
    expect(trainer ~= nil, "training: no class trainer")
    player.map, player.x, player.y = trainer.point.map, trainer.point.x, trainer.point.y
    E:SetGuide("smoke-comfort", 1, true)
    local lines, print = {}, Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = msg end
    local okTick, errTick = pcall(tick, 4)
    Ding.Print = print
    assert(okTick, errTick)
    local said = false
    for _, line in ipairs(lines) do
        if line == L.TRAINING_NEAR:format(trainer.name) then said = true end
    end
    expect(said, "training: no reminder at the class trainer")
    local row = false
    for _, r in ipairs(P.rowsShown or {}) do if r.action == "service" then row = true end end
    expect(row, "training: no guess at level 4")
    checkPanel("training: guess")
    Ding.char.training = { now = 0, future = {}, level = 4 }
end)
if not ok then problem("training: " .. tostring(err)) end

-- Guidance: the nearby services list with the gamepad (a trip to the vendor, ended at its
-- window), the training reminder, a gear upgrade offered on the item button and declined.
ok, err = pcall(function()
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level, player.map, player.x, player.y = 5, 1438, 58.7, 44
    E:SetGuide("smoke-comfort", 1, true)
    tick(11)
    local F = Ding.Finder
    F:Toggle(); flush()
    expect(F.frame:IsShown() and overrides[F.frame], "guidance: the services list does not open")
    checkPanel("guidance: list open")
    press("PAD1")
    local trip = F.trip
    expect(trip and trip.kind == "vendor", "guidance: no trip to a vendor")
    Ding.Arrow.point = nil; Ding.Arrow:Tick()
    expect(Ding.Arrow.point and Ding.Arrow.point.npc == trip.npc, "guidance: the arrow does not go to the vendor")
    checkPanel("guidance: trip")
    H.setNpcName(trip.name); H.openMerchant(); H.closeMerchant(); H.setNpcName(nil)
    expect(F.trip == nil, "guidance: the trip does not end at the vendor")
    H.setTrainerServices({ { name = "Battle Shout", category = "available", level = 4, cost = 100 } })
    H.openTrainer(false); H.closeTrainer()
    local reminder = false
    for _, r in ipairs(P.rowsShown or {}) do if r.action == "service" then reminder = true end end
    expect(reminder, "guidance: no training reminder")
    H.setItemInfo(950001, { name = "Better Boots", equipLoc = "INVTYPE_FEET", classID = 4, subclassID = 2,
        stats = { ITEM_MOD_STAMINA_SHORT = 5 } })
    H.putInBag(0, 2, 950001)
    fire("BAG_UPDATE", 0); tick(1.5)
    expect(Ding.Gear.upgrade and Ding.ItemButton:Wanted() == 950001, "guidance: the boots are not offered")
    checkPanel("guidance: gear upgrade")
    Ding.Gear:Decline()
    expect(Ding.Gear.upgrade == nil, "guidance: the boots stay offered once declined")
    H.setTrainerServices({})
end)
if not ok then problem("guidance: " .. tostring(err)) end

-- The arrow's cycle through the step's targets (binding), then a farming loop among the
-- spawns of an objective, with its stops on the minimap.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-loop", title = "Loop", races = { "NightElf" }, steps = {
        { accept = 458, turnin = 456 }, { complete = 916 }, { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level, player.map, player.x, player.y = 5, 1438, 40, 80
    H.setQuest(456, "ready")
    E:SetGuide("smoke-loop", 1, true)
    tick(3)
    bindings["SHIFT-PADDUP"] = "DING_CYCLE"
    Ding.Panel:CycleTarget()
    expect(Ding.Arrow.forced ~= nil, "loop: the cycle binding does not move the arrow")
    Ding.Panel:CycleTarget(); Ding.Panel:CycleTarget()
    expect(Ding.Arrow.forced == nil, "loop: the cycle does not come back to the nearest")
    bindings["SHIFT-PADDUP"] = nil
    checkPanel("loop: cycle")
    H.resetQuests()
    H.setQuest(916, "log")
    E.index = 2; E:Refresh(); tick(1)
    local spawn
    for _, p in ipairs(E.candidates) do
        if p.area and not spawn then spawn = p end
    end
    expect(spawn ~= nil, "loop: no spawn for the objective")
    if spawn then
        player.map, player.x, player.y = spawn.map, spawn.x, spawn.y
        Ding.Arrow.point = nil; Ding.Arrow:Tick()
        local farm = Ding.Arrow.farm
        expect(farm ~= nil, "loop: no farming loop among the spawns")
        if farm then
            local first = farm.at
            local stop = farm.points[first]
            player.map, player.x, player.y = stop.map, stop.x, stop.y
            Ding.Arrow.point = nil; Ding.Arrow:Tick()
            expect(farm.at ~= first, "loop: the next stop does not follow")
            Ding.MinimapPins:Update()
        end
    end
end)
if not ok then problem("loop: " .. tostring(err)) end

-- Guide flow: a persistent objective shown under the next steps, the preview of the next
-- steps, the minimap pins, then the section wrap-up ("Turn in first" with the gamepad).
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-flow", title = "Flow", races = { "NightElf" }, minLevel = 1, maxLevel = 5,
        next = "smoke-flow-2", steps = {
            { accept = 456, sticky = 456 }, { accept = 458 }, { turnin = 458 }, { turnin = 456 },
        } })
    Ding.RegisterGuide({ id = "smoke-flow-2", title = "Flow 2", races = { "NightElf" }, minLevel = 5, maxLevel = 10,
        steps = { { text = "Next section" } } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual, Ding.char.sticky = {}, {}, {}
    player.level, player.map, player.x, player.y = 4, 1438, 40, 80
    db.panel.preview = 2
    E:SetGuide("smoke-flow", 1, true)
    tick(11)
    H.accept(456); flush(); tick(2)
    local sticky, preview = false, 0
    for _, r in ipairs(P.rowsShown or {}) do
        if r.sticky then sticky = true end
        if r.preview then preview = preview + 1 end
    end
    expect(sticky, "flow: the persistent objective is not listed")
    expect(preview == 2, "flow: " .. preview .. " preview rows instead of 2")
    checkPanel("flow: sticky and preview")
    Ding.Arrow.point = nil; Ding.Arrow:Tick()
    Ding.MinimapPins:Update()
    expect(Ding.MinimapPins.target:IsShown() or Ding.MinimapPins.edge:IsShown(), "flow: no minimap pin")
    db.panel.preview = 0
    player.level = 7
    fire("PLAYER_LEVEL_UP", 7); flush(); tick(2)
    P:StartFocus()
    local found
    for i, r in ipairs(P.rowsShown or {}) do
        if r.action == "wrapup" and r.wrap == "turnin" then found = i end
    end
    expect(found ~= nil, "flow: no \"turn in first\" choice past the section's levels")
    checkPanel("flow: wrap-up")
    if found then
        P.focusIndex = found
        press("PAD1")
    end
    P:StopFocus()
    H.complete(456); flush()
    H.talk({ ends = { 456 } }); flush(); tick(3)
    H.closeDialog()
    expect(E.guide.id == "smoke-flow-2", "flow: not in the next section after turning in (" .. E.guide.id .. ")")
end)
if not ok then problem("flow: " .. tostring(err)) end

-- Travel additions: a flight master never seen ("Try to fly to …") with the itinerary under
-- the step, the flight measured on landing, then a mage's teleport to a capital.
ok, err = pcall(function()
    local thor, ariena = Ding.Data:NpcPoints(523)[1], Ding.Data:NpcPoints(931)[1]
    Ding.RegisterGuide({ id = "smoke-travel2", title = "Travel 2", races = { "Human" }, steps = {
        { go = { ariena.map, ariena.x + 1, ariena.y }, text = "Lakeshire" },
        { go = { 1453, 70, 72 }, text = "Stormwind" },
        { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    Ding.char.flights, db.flightTimes = { [931] = "Lakeshire, Redridge" }, nil
    player.race, player.faction, player.class, player.level = "Human", "Alliance", "MAGE", 20
    player.map, player.x, player.y = thor.map, thor.x + 2, thor.y
    Ding.Travel:Reset()
    E:SetGuide("smoke-travel2", 1, true)
    tick(2)
    local A = Ding.Arrow
    expect(A.hint == L.TRAVEL_TRY_FLY:format("Lakeshire, Redridge"), "travel2: no \"try to fly\" (" .. tostring(A.hint) .. ")")
    local route = Ding.Travel:Itinerary(Ding.Travel.plan)
    local listed = false
    for _, r in ipairs(P.rowsShown or {}) do
        if route and r.sub and H.plain(r.sub):find(route, 1, true) then listed = true end
    end
    expect(listed, "travel2: no itinerary under the step")
    checkPanel("travel2: try to fly")
    player.x = thor.x
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    TakeTaxiNode(2)
    H.closeTaxi()
    tick(150)
    H.land(ariena.map, ariena.x + 1, ariena.y)
    tick(2)
    expect(E.index == 2, "travel2: the landing does not validate the step (" .. E.index .. ")")
    expect(db.flightTimes and db.flightTimes["523:931"], "travel2: the flight is not measured")
    H.learnSpell(3561)
    H.setItem(Ding.Travel.RUNE_OF_TELEPORTATION, 5)
    Ding.Travel.cache = nil
    tick(2)
    expect(A.hint == L.TRAVEL_TELEPORT:format("Stormwind City"), "travel2: no teleport (" .. tostring(A.hint) .. ")")
    checkPanel("travel2: teleport")
    H.forgetSpells()
    Ding.char.flights = nil
end)
if not ok then problem("travel2: " .. tostring(err)) end

-- Talents: with a free point, the build's next talent under the step, learned with A twice
-- in focus mode.
ok, err = pcall(function()
    Ding.RegisterTalentBuild({ id = "smoke-warrior", class = "WARRIOR", title = "Smoke",
        picks = { { 1, 1, 1 }, { 1, 1, 1 } } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.level = 12
    Ding.char.talentBuild = "smoke-warrior"
    E:SetGuide("smoke-flow-2", 1, true)
    tick(2)
    H.setTalentPoints(2); flush()
    P:StartFocus()
    local index
    for i, r in ipairs(P.rowsShown or {}) do
        if r.action == "talent" then index = i end
    end
    expect(index ~= nil, "talents: no talent row with a free point")
    checkPanel("talents: suggestion")
    if index then
        P.focusIndex = index
        press("PAD1")
        expect(H.talentRank(1, 1) == 0, "talents: learned without confirming")
        press("PAD1")
        expect(H.talentRank(1, 1) == 1, "talents: not learned on the second press")
    end
    checkPanel("talents: learned")
    P:StopFocus()
    H.resetTalents()
    Ding.char.talentBuild = nil
end)
if not ok then problem("talents: " .. tostring(err)) end

-- Flights and the guide: the prompt on a continent never seen, the planned flight taken
-- automatically (option on), and a quest of a row found in another section (gamepad).
ok, err = pcall(function()
    local thor, ariena = Ding.Data:NpcPoints(523)[1], Ding.Data:NpcPoints(931)[1]
    Ding.RegisterGuide({ id = "smoke-fly", title = "Fly", races = { "Human" }, steps = {
        { go = { ariena.map, ariena.x + 1, ariena.y }, text = "Lakeshire" }, { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    player.race, player.faction, player.class, player.level = "Human", "Alliance", "WARRIOR", 20
    player.map, player.x, player.y = thor.map, thor.x, thor.y
    Ding.char.flights, Ding.char.taxiSeen = nil, nil
    Ding.Travel:Reset()
    E:SetGuide("smoke-fly", 1, true)
    tick(2)
    local prompt = false
    for _, r in ipairs(P.rowsShown or {}) do
        if r.service == "flight" then prompt = true end
    end
    expect(prompt, "fly: no prompt on a continent never seen")
    checkPanel("fly: new continent")
    -- Lakeshire known: the flight is planned, and taken as the map opens.
    Ding.char.flights = { [931] = "Lakeshire, Redridge" }
    Ding.Travel.cache = nil
    Ding.Arrow.point = nil; Ding.Arrow:Tick()
    db.ui.autoFly = true
    H.openTaxi({
        { name = "Sentinel Hill, Westfall", state = 0, map = thor.map, x = thor.x, y = thor.y },
        { name = "Lakeshire, Redridge", state = 1, map = ariena.map, x = ariena.x, y = ariena.y },
    })
    expect(H.taxi().taken == 2, "fly: the planned flight is not taken")
    H.closeTaxi()
    H.land(ariena.map, ariena.x + 1, ariena.y)
    tick(2)
    expect(E.index == 2, "fly: the landing does not validate the step")
    db.ui.autoFly = false
    Ding.char.flights = nil
    -- A quest of a row, found in another section and gone to with the gamepad.
    Ding.RegisterGuide({ id = "smoke-find-1", title = "Find 1", races = { "NightElf" }, steps = {
        { accept = 456, sticky = 456 }, { text = "Wander" },
    } })
    Ding.RegisterGuide({ id = "smoke-find-2", title = "Find 2", races = { "NightElf" }, steps = {
        { complete = 456 }, { turnin = 456 },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual, Ding.char.sticky = {}, {}, {}
    player.level, player.map, player.x, player.y = 5, 1438, 40, 80
    E:SetGuide("smoke-find-1", 1, true)
    tick(2)
    H.accept(456); flush(); tick(2)
    P:StartFocus()
    for i, r in ipairs(P.rowsShown or {}) do
        if r.quest == 456 then P.focusIndex = i end
    end
    press("PADDRIGHT")
    expect(P.findOffer ~= nil, "find: no offer for the quest")
    checkPanel("find: offer")
    press("PAD1")
    expect(E.guide.id ~= "smoke-find-1", "find: A does not go to the other section (" .. E.guide.id .. ")")
    P:StopFocus()
end)
if not ok then problem("fly and find: " .. tostring(err)) end

-- Goals without a quest: monsters to kill (experience messages), an NPC and its dialogue
-- line, an item to use from the item button (gamepad binding), an object, a chore.
ok, err = pcall(function()
    local camp = Ding.Data:ObjectPoints(1986)[1]
    Ding.RegisterGuide({ id = "smoke-goals", title = "Goals", races = { "NightElf" }, steps = {
        { kill = { { 2031, 2 } } },
        { talk = 2079, gossip = 1 },
        { useitem = 960001 },
        { object = 1986 },
        { destroy = 960002 },
        { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual, Ding.char.goals = {}, {}, nil
    player.level, player.map, player.x, player.y = 5, 1438, 58.7, 44
    H.setItem(960001, 1, { use = true })
    H.setItem(960002, 2)
    E:SetGuide("smoke-goals", 1, true)
    tick(2)
    checkPanel("goals: kill")
    H.killXP(Ding.Data:NpcName(2031), 40); H.killXP(Ding.Data:NpcName(2031), 40); tick(1)
    expect(E.index == 2, "goals: the kills do not end the step (" .. E.index .. ")")
    H.talk({ id = 2079, gives = {}, options = { "Tell me about the Shadowglen" } }); flush()
    expect(Ding.Goals.banner and Ding.Goals.banner:IsShown(), "goals: no banner for the dialogue line")
    H.closeDialog(); tick(1)
    expect(E.index == 3, "goals: talking and the dialogue do not end the step")
    bindings["PAD5"] = "CLICK DingItemButton:LeftButton"
    expect(H.pressBinding("PAD5") == "item:960001", "goals: the item button does not use the item")
    fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 1000 + 960001); tick(1)
    bindings["PAD5"] = nil
    expect(E.index == 4, "goals: the use does not end the step")
    player.map, player.x, player.y = camp.map, camp.x, camp.y
    fire("LOOT_OPENED"); tick(1)
    expect(E.index == 5, "goals: the object does not end the step")
    checkPanel("goals: destroy")
    H.setItem(960002, 0); fire("BAG_UPDATE", 0); tick(1)
    expect(E.index == 6, "goals: the chore does not end the step")
end)
if not ok then problem("goals: " .. tostring(err)) end

-- Step language 2: a step behind a condition, a quest taken by hand, a patrol, a dungeon
-- chosen alone, a level target inside a level, the spirit healer of a death skip.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-steps2", title = "Steps 2", races = { "NightElf" }, steps = {
        { when = { log = 916 }, text = "Only with 916" },
        { accept = { 456, 458 }, noauto = 456 },
        { patrol = { { 1438, 50, 50 }, { 1438, 52, 50 } }, text = "Round" },
        { dungeon = "The Deadmines", text = "Dungeon" },
        { level = 6, xp = 200 },
        { deathskip = true, revive = { 1438, 55, 50 }, text = "Die" },
        { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    db.ui.dungeonChoice, db.ui.deathSkip = { ["The Deadmines"] = true }, true
    player.level, player.xp, player.map, player.x, player.y = 6, 0, 1438, 58.7, 44
    E:SetGuide("smoke-steps2", 1, true)
    tick(2)
    expect(E.index == 2, "steps2: the step behind a condition stays (" .. E.index .. ")")
    H.clearDialogCalls()
    H.talk({ gives = { 456, 458 } }); flush()
    local calls = table.concat(H.dialogCalls(), ", ")
    expect(not calls:find("accept 456", 1, true), "steps2: a noauto quest accepted")
    H.closeDialog()
    H.accept(456); flush(); tick(2)
    expect(E.index == 3, "steps2: the accept step does not end (" .. E.index .. ")")
    checkPanel("steps2: patrol")
    local p = E.candidates[1]
    player.map, player.x, player.y = p.map, p.x, p.y
    Ding.Arrow.point = nil; Ding.Arrow:Tick(); flush()
    expect(E.candidates[1].x == 52, "steps2: the patrol does not move on")
    E:Next(); flush()
    expect(E.index == 4, "steps2: the chosen dungeon's step is passed")
    E:Next(); flush(); tick(1)
    expect(E.index == 5, "steps2: not on the level step")
    player.xp = 200
    fire("PLAYER_XP_UPDATE", "player"); tick(1)
    expect(E.index == 6, "steps2: level 6 + 200 XP does not end the step")
    H.setGhost({ map = 1438, x = 30, y = 30 })
    Ding.Arrow.point = nil; Ding.Arrow:Tick()
    expect(Ding.Arrow.point and Ding.Arrow.point.label == L.SPIRIT_HEALER, "steps2: the arrow is not on the spirit healer")
    checkPanel("steps2: ghost")
    H.setGhost(nil)
    db.ui.dungeonChoice, db.ui.deathSkip = nil, false
end)
if not ok then problem("steps2: " .. tostring(err)) end

-- Zones and the world map: a quest giver in another zone named on the step's line and under
-- the arrow, and the arrow's target as the client's map waypoint.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-zones", title = "Zones", races = { "NightElf" }, steps = {
        { accept = 456 }, { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    H.setUserWaypoint(nil)
    db.arrow.worldMap = true
    Ding.Arrow.worldKey, Ding.Arrow.worldMark, Ding.char.worldMark = nil, nil, nil
    player.level, player.map, player.x, player.y = 5, 1439, 50, 50    -- Darkshore
    E.playerZoneAt = nil
    P.ResetWhere()
    E:SetGuide("smoke-zones", 1, true)
    tick(2)
    local row
    for _, r in ipairs(P.rowsShown or {}) do
        if r.action == "accept" then row = r end
    end
    expect(row and plain(row.text):find(" — ", 1, true) and plain(row.text):find("Teldrassil", 1, true),
        "zones: no zone on the quest giver's line")
    checkPanel("zones: another zone")
    local w = H.userWaypoint()
    expect(w and w.tracked, "zones: no map waypoint on the arrow's target")
    E:Next(); flush(); tick(1)
    expect(H.userWaypoint() == nil, "zones: the map waypoint stays with no target")
end)
if not ok then problem("zones: " .. tostring(err)) end

-- Settings by intent, with the gamepad: the six tabs with RB, the dungeons' page from the
-- Route tab (A opens it, A toggles a dungeon, B comes back), "More options" unfolded with A,
-- "Defaults for this tab" confirmed with A twice.
ok, err = pcall(function()
    Ding.RegisterGuide({ id = "smoke-settings", title = "Settings", races = { "NightElf" }, steps = {
        { accept = 916, dungeon = "Alpha" }, { accept = 456, dungeon = "Beta" }, { text = "End" },
    } })
    scenarioCharacter()
    H.resetQuests()
    E.turnedIn, Ding.char.manual = {}, {}
    db.ui.dungeons, db.ui.dungeonChoice = false, nil
    player.level, player.map, player.x, player.y = 5, 1438, 58.7, 44
    E:SetGuide("smoke-settings", 1, true)
    tick(2)
    C:Open("guide"); flush()
    for i = 2, #C.TABS do
        press("PADRSHOULDER")
        expect(C.tab == i, "settings: RB does not reach tab " .. i)
    end
    press("PADRSHOULDER")
    expect(C.tab == 1, "settings: RB does not come back to the Guide tab")
    selectTab(C, C.TAB.route)
    focusOn(C, function(r) return r.opts and r.opts.label == L.OPT_DUNGEONS end, "dungeons")
    expect(C.focus.kind == "page" and C.focus.value:GetText() == L.DUNGEONS_OFF, "settings: no dungeons row")
    press("PAD1")
    expect(C.page and C.page.key == "dungeons", "settings: A does not open the dungeons' page")
    focusOn(C, function(r) return r.kind == "check" end, "a dungeon")
    press("PAD1")
    press("PAD2")
    expect(not C.page and C.focus.value:GetText() == L.DUNGEONS_SOME:format(1, #E:DungeonInfo()),
        "settings: one dungeon on, the row does not say so")
    selectTab(C, C.TAB.arrow)
    focusOn(C, function(r) return r.opts and r.opts.label == L.ORIENTATION end, "orientation (More options)")
    selectTab(C, C.TAB.automation)
    db.ui.autoAccept = false
    focusOn(C, function(r) return r.opts and r.opts.label == L.TAB_DEFAULTS end, "Defaults for this tab")
    press("PAD1"); press("PAD1")
    expect(db.ui.autoAccept == true, "settings: the tab's defaults are not back")
    C:Close()
    db.ui.dungeonChoice = nil
end)
if not ok then problem("settings: " .. tostring(err)) end

print(("Result: %d problem(s)"):format(H.problems()))
os.exit(H.problems() > 0 and 1 or 0)
