-- Travel network of the route optimizer (tools/route_travel.lua): walks, flight paths of the
-- faction, boats, zeppelins and the tram, on the Forever map geometry of QuestieDB.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local X = dofile(tools .. "/questiedb_export.lua")
local RouteData = dofile(tools .. "/route_data.lua")
local Model = dofile(tools .. "/route_model.lua")
local Travel = dofile(tools .. "/route_travel.lua")
local P = Model.PARAMS
local db = X.load(T.combined)
local D = RouteData.new(db, T.combined)

local alliance = Travel.new(D, "Alliance")
local horde = Travel.new(D, "Horde")
local function p(map, x, y) return D.point(map, x, y) end
local DARKSHIRE, LAKESHIRE = p(1431, 73.9, 44.4), p(1433, 26.9, 44.8)
local MENETHIL, ASTRANAAR = p(1437, 10.7, 61.0), p(1440, 37.0, 49.2)
local ORGRIMMAR, BRILL = p(1454, 54.1, 68.4), p(1420, 61.7, 52.1)

T.test("flight masters and transports of the faction only", function()
    local fm, links = 0, {}
    for _, node in ipairs(alliance.nodes) do
        if node.fm then fm = fm + 1 else links[node.name] = true end
    end
    T.ok(fm >= 25, "Alliance flight masters: " .. fm)
    T.ok(links["Menethil Harbor - Auberdine"], "boat to Darkshore")
    T.ok(links["Booty Bay - Ratchet"], "neutral boat")
    T.ok(not links["Orgrimmar - Undercity"], "no zeppelin for the Alliance")
    local zeppelin = false
    for _, node in ipairs(horde.nodes) do
        if node.name == "Orgrimmar - Undercity" then zeppelin = true end
        T.ok(node.name ~= "Menethil Harbor - Auberdine", "no Alliance boat for the Horde")
    end
    T.ok(zeppelin, "zeppelin for the Horde")
end)

T.test("a short trip is a walk; the same trip is served from the cache", function()
    T.eq(alliance:travel(DARKSHIRE, DARKSHIRE, 20), 0)
    local near = p(1431, 75.0, 45.0)
    local t, d = alliance:travel(DARKSHIRE, near, 20)
    T.ok(math.abs(t - d * P.detour / P.runSpeed) < 1e-6, "walk: " .. t)
    local again = alliance:travel(DARKSHIRE, near, 20)
    T.eq(again, t)
end)

T.test("flight paths from level 14, the mount from level 40", function()
    local onFoot = alliance:travel(DARKSHIRE, LAKESHIRE, 12)
    local flying = alliance:travel(DARKSHIRE, LAKESHIRE, 20)
    local mounted = alliance:travel(DARKSHIRE, LAKESHIRE, 45)
    T.ok(flying < onFoot, ("flight %d s < walk %d s"):format(flying, onFoot))
    T.ok(mounted <= flying, "the mount is never slower")
    local walk = Model.distance(DARKSHIRE, LAKESHIRE) * P.detour / P.runSpeed
    T.ok(onFoot <= walk + 1e-6, "level 12: at most the straight walk")
end)

T.test("between continents: the boat, with its wait", function()
    local t = alliance:travel(MENETHIL, ASTRANAAR, 20)
    T.ok(t > 330 and t < 1800, "Menethil -> Astranaar: " .. t)
    local zeppelin = horde:travel(ORGRIMMAR, BRILL, 20)
    T.ok(zeppelin > 330 and zeppelin < 1500, "Orgrimmar -> Brill by zeppelin: " .. zeppelin)
    local noZeppelin = alliance:travel(ORGRIMMAR, BRILL, 20)
    T.ok(noZeppelin > zeppelin, "the Alliance has no zeppelin")
end)

T.test("known zones: only their flight masters", function()
    local few = Travel.new(D, "Alliance", { areas = { [10] = true } })
    local fm = 0
    for _, node in ipairs(few.nodes) do if node.fm then fm = fm + 1 end end
    T.eq(fm, 1, "Duskwood's flight master only")
    T.ok(few:travel(DARKSHIRE, LAKESHIRE, 20) >= alliance:travel(DARKSHIRE, LAKESHIRE, 20))
end)

T.test("innkeepers and spirit healers from QuestieDB", function()
    local inns = D.innkeepers("Alliance")
    local named = 0
    for _, inn in ipairs(inns) do if Travel.INNS[inn.id] then named = named + 1 end end
    T.ok(#inns >= 20 and named >= 20, ("%d inns, %d named"):format(#inns, named))
    T.ok(#D.spiritHealers() >= 60, "graveyards")
end)

T.run()
