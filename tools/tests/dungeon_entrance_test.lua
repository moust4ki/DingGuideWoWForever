-- A target only found inside a dungeon (Ding/DB's `dungeon`): Ding points at the dungeon's
-- entrances, named "<target>, in <dungeon>", and never tries to target it from outside.
-- 1048 Into The Scarlet Monastery: kill its leaders, all inside the dungeon (AreaID 796).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding = T.Ding
local D = Ding.Data
local L = Ding.L

T.test("an NPC only inside a dungeon: the entrances, named after it and the dungeon", function()
    local name = D:NpcName(3977)
    local points = D:NpcPoints(3977)
    T.ok(#points > 0, "the entrances")
    local entrances = D:DungeonEntrances(796)
    T.eq(#points, #entrances)
    for i, p in ipairs(points) do
        T.eq(p.map, entrances[i].map)
        T.eq(p.npc, nil, "not targetable from outside")
        T.eq(p.dungeon, 796)
        T.eq(p.label, L.IN_DUNGEON:format(name, D:DungeonName(796)))
    end
end)

T.test("a quest's objectives inside a dungeon lead to its entrance", function()
    local targets = D:ObjectiveTargets(1048)
    T.ok(#targets > 0, "objectives")
    for _, t in ipairs(targets) do
        T.ok(#t.points > 0, (t.name or "?") .. ": a place")
        T.eq(t.points[1].dungeon, 796)
    end
end)

T.test("an NPC with places outside keeps its own spawns", function()
    local points = D:NpcPoints(823)
    T.ok(#points > 0 and points[1].npc == 823 and points[1].dungeon == nil, "Deputy Willem in Northshire")
end)

T.test("the dungeon's name: the client's when it has a map, else the English one", function()
    T.ok(type(D:DungeonName(796)) == "string" and D:DungeonName(796) ~= "", "a name")
    T.eq(Ding.DB.zones.dungeonNames[796], "Scarlet Monastery")
end)

T.test("LibDingDB shows the dungeon of a record", function()
    T.eq(LibDingDB.Get("npc", 3977).dungeon, 796)
    T.eq(LibDingDB.Get("npc", 823).dungeon, nil)
end)

T.run()
