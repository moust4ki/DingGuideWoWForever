-- Minimal unit test framework for tools/tests/*_test.lua. Each test file runs in its own
-- process (see run_tests.lua): it loads Ding once with the mocked API, then every test
-- starts from a clean character (T.reset).
-- usage, in a test file:
--   local T = dofile(<tools dir> .. "/testlib.lua")(arg[1] [, { guides = { shipped ids },
--                                                                 locale = "enUS",
--                                                                 addons = { pack addon dirs } }])
--   bare = true: tests of the offline tools, without Ding nor the mocked API.
--   T.test("what it checks", function() T.eq(actual, expected) end)
--   T.run()
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."

return function(combined, opts)
    if not combined then
        io.stderr:write("usage: lua5.1 <test>.lua <combined dir>\n")
        os.exit(2)
    end
    opts = opts or {}
    local T = { combined = combined }
    local tests = {}
    local H, Ding
    if not opts.bare then
        -- Only the shipped guides a test relies on are loaded (opts.guides, Shadowglen by
        -- default): adding guides to Ding never changes what the unit tests see.
        H = dofile(here .. "/wow_mock.lua")({ combined = combined, quiet = true,
            guides = opts.guides or { "nightelf-01-shadowglen" }, locale = opts.locale,
            addons = opts.addons })
        Ding = H.Ding
        T.H, T.Ding = H, Ding

        -- Boot like the game: saved variables, login, the quest log a moment later, then
        -- close the first-launch window.
        _G.DingDB, _G.DingCharDB = nil, nil
        H.fire("ADDON_LOADED", "Ding")
        H.fire("PLAYER_LOGIN")
        H.fire("QUEST_LOG_UPDATE")
        H.tick(2.5)
        if Ding.Config.frame then Ding.Config:Close() end
    end

    function T.test(name, fn) tests[#tests + 1] = { name = name, fn = fn } end

    local function show(v)
        if type(v) == "string" then return ("%q"):format(v) end
        return tostring(v)
    end
    function T.eq(actual, expected, msg)
        if actual ~= expected then
            error(("%sexpected %s, got %s"):format(msg and (msg .. ": ") or "", show(expected), show(actual)), 2)
        end
    end
    function T.ok(value, msg)
        if not value then error(msg or "condition is false", 2) end
    end
    -- fn must raise an error whose message contains `pattern` (plain text).
    function T.fails(fn, pattern, msg)
        local ok, err = pcall(fn)
        if ok then error((msg or "error expected") .. ": no error raised", 2) end
        if pattern and not tostring(err):find(pattern, 1, true) then
            error(("%s: unexpected message: %s"):format(msg or "error expected", tostring(err)), 2)
        end
    end

    -- Fresh character: empty log and bags, level, race and class; no guide, no manual flags.
    function T.reset(p)
        p = p or {}
        H.resetQuests()
        H.clearItems()
        local player = H.player
        player.level, player.xp, player.rested = p.level or 1, 0, p.rested or 0
        player.race, player.class = p.race or "NightElf", p.class or "WARRIOR"
        player.faction = p.faction or "Alliance"
        player.map, player.x, player.y = 1438, 50, 50
        H.setCombat(false)
        local E = Ding.Engine
        E.guide, E.index, E.finished, E.hold = nil, 1, false, false
        E.turnedIn = {}
        Ding.char.guide, Ding.char.step, Ding.char.manual, Ding.char.pack = nil, nil, {}, nil
        Ding.char.hearthInn, Ding.char.lastStep = nil, nil
        player.bind = nil
        H.setGhost(nil)
        H.setDead(false)
        -- Steps behind an option: their defaults.
        local ui = Ding.db.ui
        ui.hearth, ui.deathSkip, ui.dungeons, ui.elites = true, false, false, false
        ui.dungeonChoice, E.patrol = nil, nil
        ui.chooseReward = false
        ui.sellGrey, ui.repair, ui.markTarget, ui.serviceSteps = true, true, true, true
        ui.trainerSteps, ui.flightSteps = true, true
        H.clearEquipment()
        H.resetBags()
        H.setTarget(nil)
        H.setGroup(false)
        H.clearRaidMarks()
        H.setMoney(0)
        H.setNpcName(nil)
        H.setTrainerServices({})
        -- A class trainer already visited, nothing waiting (a test of the reminder sets nil).
        Ding.char.training, Ding.char.gearDeclined = { now = 0, future = {}, level = 1 }, nil
        Ding.char.trainingReminded = nil
        Ding.Gear.upgrade = nil
        if Ding.GearHint then Ding.GearHint:Hide() end
        if Ding.Finder then
            Ding.Finder.trip = nil
            Ding.Finder:Close()
        end
        ui.autoEquip = false
        H.forgetSpells()
        H.setSkillLines({})
        if Ding.Directory then Ding.Directory:Forget() end
        Ding.db.flightTimes = nil
        H.resetTalents()
        Ding.char.talentBuild, Ding.Talents.armed = nil, nil
        if Ding.RewardHint then Ding.RewardHint:Hide() end
        Ding.char.deathskip = nil
        -- Travel: flight paths and inn known, flight map, flight in progress.
        Ding.char.flights, Ding.char.bind = nil, nil
        local taxi = H.taxi()
        taxi.open, taxi.onTaxi, taxi.nodes, taxi.taken = false, false, {}, nil
        -- Flight maps already opened on both continents (a test of the prompt sets nil);
        -- automatic flights off, on foot.
        Ding.char.taxiSeen = { [0] = true, [1] = true }
        ui.autoFly = false
        H.setMounted(false)
        H.setModifier("shift", false)
        -- Zones and the world map mark: the client's waypoint API, none set.
        H.setWaypointApi(true)
        H.setUserWaypoint(nil)
        Ding.db.arrow.worldMap = true
        Ding.Arrow.worldKey, Ding.Arrow.worldMark, Ding.char.worldMark = nil, nil, nil
        Ding.Engine.playerZoneAt = nil
        Ding.Panel.ResetWhere()
        -- The settings: nothing unfolded.
        Ding.Config.unfolded = {}
        Ding.Panel.findOffer = nil
        -- Goals without a quest: their progress, the items to keep, an open dialogue.
        Ding.char.goals, Ding.char.keep, Ding.Goals.gossipOpen = nil, nil, nil
        Ding.Goals:HideGossip()
        Ding.Travel:Reset()
        if Ding.TaxiMap then Ding.TaxiMap:Hide() end
        -- Kills measured, grinding spot and objectives along the way of the last test.
        Ding.char.killXP = nil
        Ding.Grind:Reset()
        -- Farming loop and the arrow's cycle through the step's targets.
        Ding.db.arrow.loop = true
        Ding.Arrow.farm, Ding.Arrow.forced, Ding.Panel.cycle = nil, nil, nil
        Ding.Along.entries, Ding.Along.shown = {}, {}
        H.flush()
    end

    -- Sets quest states, then lets the engine react like after QUEST_LOG_UPDATE.
    function T.quests(states)
        for q, state in pairs(states) do H.setQuest(q, state ~= false and state or nil) end
        H.fire("QUEST_LOG_UPDATE")
        H.flush()
    end

    function T.run()
        local failed = 0
        local name = arg[0]:match("([^/\\]+)$") or arg[0]
        for _, t in ipairs(tests) do
            local before = H and H.problems() or 0
            local ok, err = pcall(t.fn)
            if ok and H and H.problems() > before then
                ok, err = false, "Lua error reported by the engine (see above)"
            end
            if ok then
                print(("  ok    %s"):format(t.name))
            else
                failed = failed + 1
                print(("  FAIL  %s\n        %s"):format(t.name, tostring(err)))
            end
        end
        print(("%s: %d test(s), %d failure(s)"):format(name, #tests, failed))
        os.exit(failed > 0 and 1 or 0)
    end

    return T
end
