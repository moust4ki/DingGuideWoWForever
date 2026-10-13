-- Time and XP model of the route optimizer (tools/route_model.lua).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local M = dofile(tools .. "/route_model.lua")
local P = M.PARAMS

local function near(actual, expected, msg)
    T.ok(math.abs(actual - expected) < 1e-6, ("%sexpected %s, got %s"):format(msg and (msg .. ": ") or "",
        tostring(expected), tostring(actual)))
end

T.test("levels: addXP and xpTo agree", function()
    local level, xp = M.addXP(1, 0, 400)
    T.eq(level, 2)
    T.eq(xp, 0)
    level, xp = M.addXP(1, 300, 1100)
    T.eq(level, 3, "400 then 900 XP")
    T.eq(xp, 100)
    T.eq(M.xpTo(1, 0, 3), 1300)
    T.eq(M.xpTo(2, 500, 3), 400)
    T.eq(M.xpTo(5, 0, 5), 0, "already at the level")
    level = M.addXP(59, 0, 10 ^ 7)
    T.eq(level, 60, "not beyond the maximum level")
end)

T.test("grey level: same formula as the engine (Compat.IsQuestGrey)", function()
    T.eq(M.greyLevel(5), 0)
    T.eq(M.greyLevel(10), 4)
    T.eq(M.greyLevel(20), 13)
    T.eq(M.greyLevel(39), 31)
    T.eq(M.greyLevel(40), 31)
    T.eq(M.greyLevel(60), 47)
    T.ok(M.isQuestGrey(4, 10))
    T.ok(not M.isQuestGrey(5, 10))
    T.ok(not M.isQuestGrey(0, 60), "unknown level: never grey")
end)

T.test("monster XP: base, higher, lower, grey", function()
    near(M.mobXP(10, 10), 95)
    near(M.mobXP(12, 10), 95 * 1.1)
    near(M.mobXP(20, 10), 95 * 1.2, "bonus capped at 4 levels")
    near(M.mobXP(8, 10), 95 * (1 - 2 / 7))
    T.eq(M.mobXP(4, 10), 0, "grey monster")
end)

T.test("quest XP: drops beyond a 5-level gap", function()
    T.eq(M.questXP(1000, 10, 15), 1000)
    T.eq(M.questXP(1000, 10, 16), 800)
    T.eq(M.questXP(1000, 10, 19), 200)
    T.eq(M.questXP(1000, 10, 20), 100)
    T.eq(M.questXP(1000, 0, 60), 1000, "unknown level")
    T.ok(M.defaultQuestXP(10) > M.defaultQuestXP(5))
    T.ok(M.grindRate(20) > M.grindRate(10), "grinding is faster at a high level")
end)

T.test("trips: distance, mount, flight, island, unknown map", function()
    local a = { x = 0, y = 0, region = "0:main", continent = 0 }
    local b = { x = 700, y = 0, region = "0:main", continent = 0 }
    local t, d = M.travel(a, b, 10)
    near(d, 700)
    near(t, 700 * P.detour / P.runSpeed)
    T.ok(M.travel(a, b, 40) < t, "faster with the mount")
    local far = { x = 7000, y = 0, region = "0:main", continent = 0 }
    T.eq(M.travel(a, far, 10), 7000 * P.detour / P.runSpeed, "on foot before flight paths")
    near(M.travel(a, far, 20), P.flightOverhead + 7000 / P.flightSpeed)
    local island = { x = 700, y = 0, region = "0:teldrassil", continent = 0 }
    t = M.travel(a, island, 10)
    near(t, 700 * P.detour / P.runSpeed + P.boatTime, "boat between two land masses")
    T.eq(M.distance(a, island), nil)
    local unknown = { x = 1, y = 1, region = "map:9999" }
    T.eq(M.travel(a, unknown, 10), P.otherMapTime)
    T.eq(M.travel(nil, b, 10), 0, "no position: no trip")
end)

T.test("objectives: time per target and waiting for respawns", function()
    local per = M.targetTime(10, 20, false)
    near(per, P.fightBase + 10 * P.fightPerLevel + 20 * P.detour / P.runSpeed)
    T.ok(M.targetTime(10, 20, true) < per, "an object is looted faster than a monster is killed")
    near(M.workTime(10, 8, 20, 20, false), 8 * per, "enough spawns")
    local camped = M.workTime(10, 8, 2, 20, false)
    near(camped, 8 * per + 6 * (P.respawnTime / 2 - per), "6 targets wait for their respawn")
end)

T.run()
