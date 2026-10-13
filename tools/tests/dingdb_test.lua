-- LibDingDB: DingDB for other addons (Ding/Core/DingDB.lua, docs/dingdb.md). French client.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding = T.Ding

local DB = _G.LibDingDB

T.test("the global is there once Ding is loaded, with its source and version", function()
    T.ok(DB, "LibDingDB")
    T.eq(DB.version, 1)
    T.eq(DB.source, Ding.DB.source)
end)

T.test("a quest by id: its fields by name, the client's name and the English one", function()
    local q = DB.Get("quest", 783)
    T.eq(q.id, 783)
    T.eq(q.englishName, "A Threat Within")
    T.eq(q.name, "Menace intérieure")
    T.eq(q.startedBy[1][1], 823)
    T.eq(q.finishedBy[1][1], 197)
    T.eq(DB.Name("quest", 783), "Menace intérieure")
end)

T.test("an NPC: levels, side, spawns by UiMapID", function()
    local npc = DB.Get("npc", 823)
    T.eq(npc.englishName, "Deputy Willem")
    T.ok(npc.minLevel > 0 and npc.maxLevel >= npc.minLevel, "levels")
    local coords = npc.spawns[1429]
    T.ok(coords and #coords >= 2 and coords[1] > 0 and coords[1] < 100, "a spawn on Elwynn Forest")
end)

T.test("objects and items too; unknown kinds and ids give nil", function()
    T.ok(DB.Get("item", 159) and DB.Get("item", 159).englishName, "Refreshing Spring Water")
    T.ok(DB.Get("object", 31), "an object")
    T.eq(DB.Get("quest", 99999999), nil)
    T.eq(DB.Get("spell", 1), nil)
    T.eq(DB.Name("npc", 99999999), nil)
end)

T.test("answers are copies: changing them changes nothing in Ding", function()
    local q = DB.Get("quest", 783)
    q.name, q.startedBy[1][1] = "changed", 1
    T.eq(DB.Get("quest", 783).startedBy[1][1], 823)
    T.eq(Ding.Data:QuestName(783), "Menace intérieure")
    local list = DB.Entrances(2257)
    list[1][1] = 0
    T.ok(DB.Entrances(2257)[1][1] ~= 0, "entrances copied")
end)

T.test("ids sorted, zones, entrances by side", function()
    local ids = DB.Ids("quest")
    T.eq(#ids, (function() local n = 0 for _ in pairs(Ding.DB.quests) do n = n + 1 end return n end)())
    for i = 2, #ids do T.ok(ids[i - 1] < ids[i], "sorted") end
    T.eq(#DB.Ids("spell"), 0)
    T.eq(DB.UiMap(12), 1429)
    T.ok(#DB.Entrances(2257) == 2, "the tram's two ends")
    T.ok(DB.Entrances(3277, "Horde")[1][1] ~= DB.Entrances(3277)[1][1], "Warsong Gulch: the Horde's own entrance")
end)

T.run()
