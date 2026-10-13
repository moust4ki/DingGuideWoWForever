-- tools/draft_guide.lua from end to end on the human route: two runs write the same files,
-- and the guides read back with every quest taken before it is worked and turned in. Then a
-- small Horde route: a quest open to every class but one keeps its chain, for those classes;
-- level windows cut by the simulation; zone intros in a guide over several zones.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })

local windows = package.config:sub(1, 1) == "\\"
local function quote(s)
    if windows then return '"' .. s .. '"' end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end
local function shell(command)
    return windows and ('"' .. command .. '"') or command
end
local lua = "lua5.1"
local i = -1
while arg[i] do lua = arg[i]; i = i - 1 end

local temp = (os.getenv("TMPDIR") or os.getenv("TEMP") or os.getenv("TMP") or "/tmp"):gsub("\\", "/")
local base = ("%s/ding_draft_test_%d_%d"):format(temp, os.time(), math.floor(os.clock() * 1000))
local FILES = { "Human/01_Northshire.lua", "Human/02_Elwynn.lua", "Human/03_Westfall.lua", "Human/04_LochModan.lua" }

local function run(out, route)
    local command = table.concat({ quote(lua), quote(tools .. "/draft_guide.lua"), quote(T.combined),
        quote(route or (tools .. "/routes/human.lua")), "--out", quote(out), "--iterations", "300" }, " ")
    local pipe = io.popen(shell(command .. " 2>&1"))
    local output = pipe:read("*a")
    pipe:close()
    return output
end

local function read(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local text = f:read("*a")
    f:close()
    return text
end

local function remove(dir)
    if windows then
        os.execute(shell("rmdir /s /q " .. quote(dir:gsub("/", "\\"))) .. " 2>nul")
    else
        os.execute("rm -rf " .. quote(dir))
    end
end

local first, second = base .. "/a", base .. "/b"
local output = run(first)
run(second)

T.test("the human route is drafted", function()
    T.ok(output:find("human%-04%-lochmodan"), "output: " .. output)
    for _, file in ipairs(FILES) do
        T.ok(read(first .. "/" .. file), "guide written: " .. file)
        T.ok(read(first .. "/Locales/frFR/" .. file), "translation written: " .. file)
        T.ok(read(first .. "/Locales/deDE/" .. file), "German translation written: " .. file)
    end
end)

-- 95998 The Great Outdoors, then the Camping 101 quests (Elwynn Forest, level 6): QuestieDB
-- sorts them as CAMPING (zoneOrSort -666), ordinary quests of the zone for a route.
T.test("Forever's camping quests are not left out as a category", function()
    local elwynn = read(first .. "/Human/02_Elwynn.lua") or ""
    T.ok(elwynn:find("%f[%d]95998%f[%D]"), "The Great Outdoors in Elwynn Forest\n" .. elwynn)
end)

T.test("two runs write the same files", function()
    for _, file in ipairs(FILES) do
        T.eq(read(second .. "/" .. file), read(first .. "/" .. file), file)
        T.eq(read(second .. "/Locales/frFR/" .. file), read(first .. "/Locales/frFR/" .. file), "translation " .. file)
    end
end)

T.test("every quest is accepted before it is worked and turned in", function()
    -- The four guides follow each other: a quest may be taken in one and turned in later.
    local accepted, turnedIn = {}, {}
    local function each(v, fn)
        if type(v) == "number" then fn(v) elseif type(v) == "table" then for _, q in ipairs(v) do fn(q) end end
    end
    for _, file in ipairs(FILES) do
        local def
        local saved = _G.Ding
        _G.Ding = { RegisterGuide = function(d) def = d end }
        dofile(first .. "/" .. file)
        _G.Ding = saved
        T.ok(def and #def.steps > 5, file)
        for n, step in ipairs(def.steps) do
            local at = ("%s, step %d: quest "):format(file, n)
            each(step.turnin, function(q)
                T.ok(accepted[q], at .. q .. " turned in without being accepted")
                T.ok(not turnedIn[q], at .. q .. " turned in twice")
                turnedIn[q] = true
            end)
            each(step.accept, function(q)
                T.ok(not accepted[q], at .. q .. " accepted twice")
                accepted[q] = true
            end)
            each(step.complete, function(q)
                T.ok(accepted[q] and not turnedIn[q], at .. q .. " worked while not in the log")
            end)
        end
    end
end)

-- Valley of Trials: Vile Familiars (792) is for every class but warlocks, who have their own
-- (1485, 1499); Burning Blade Medallion (794) and Report to Sen'jin Village (805) follow it.
local VALLEY = [[
return {
    file = "valley.lua", faction = "Horde", races = { "Orc", "Troll" }, guideRaces = { "Orc", "Troll" },
    guides = {
        { id = "test-valley", file = "Test/01_Valley.lua", title = "Valley of Trials (1-6)",
          areas = { 363, 14 }, box = { 1411, 37, 58, 50, 82 }, minLevel = 1, maxLevel = 6,
          intro = "Test." },
    },
}
]]

local function valleySteps()
    local route = base .. "/valley.lua"
    local f = assert(io.open(route, "w"))
    f:write(VALLEY)
    f:close()
    run(base .. "/valley", route)
    local def
    local saved = _G.Ding
    _G.Ding = { RegisterGuide = function(d) def = d end }
    dofile(base .. "/valley/Test/01_Valley.lua")
    _G.Ding = saved
    return def
end

T.test("quest open to every class but one: kept, with its follow-ups, for those classes", function()
    local def = valleySteps()
    T.ok(def, "valley guide written")
    local classesOf = {}
    for _, step in ipairs(def.steps) do
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            local list = type(step[key]) == "number" and { step[key] } or step[key] or {}
            for _, q in ipairs(list) do
                classesOf[q] = classesOf[q] or (step.classes and table.concat(step.classes, " ") or "all")
            end
        end
    end
    T.ok(classesOf[792], "Vile Familiars (792) in the guide")
    T.ok(classesOf[792] ~= "all" and not classesOf[792]:find("WARLOCK"), "792 for: " .. tostring(classesOf[792]))
    T.ok(classesOf[792]:find("WARRIOR") and classesOf[792]:find("SHAMAN"), "792 for: " .. classesOf[792])
    for _, q in ipairs({ 794, 805 }) do
        if classesOf[q] then T.eq(classesOf[q], classesOf[792], "follow-up " .. q) end
    end
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(base .. "/valley/Test/01_Valley.lua") }, " ") .. " 2>&1"))
    local report = pipe:read("*a")
    pipe:close()
    T.ok(report:find("0 error%(s%)"), "check_guides : " .. report)
end)

-- Valley of Trials then Durotar, the second window cut too high: tools/fit_windows.lua
-- starts Durotar where the valley ends, and the valley no longer ends with a level step.
local CHAIN = [=[
return {
    file = "chain.lua", faction = "Horde", races = { "Orc", "Troll" }, guideRaces = { "Orc", "Troll" },
    pack = "ding-zones",
    guides = {
        { id = "test-valley", file = "Test/01_Valley.lua", title = "Valley of Trials",
          areas = { 363, 14 }, box = { 1411, 37, 58, 50, 82 }, minLevel = 1, maxLevel = 9,
          intro = "Valley." },
        { id = "test-durotar", file = "Test/02_Durotar.lua", title = "Durotar",
          areas = { 14 }, minLevel = 9, maxLevel = 12, intro = "Durotar." },
    },
}
]=]

T.test("level windows cut by the simulation (fit_windows.lua)", function()
    local route = base .. "/chain.lua"
    local f = assert(io.open(route, "w"))
    f:write(CHAIN)
    f:close()
    local function fit()
        local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/fit_windows.lua"), quote(T.combined),
            quote(route), "--iterations", "200" }, " ") .. " 2>&1"))
        local output = pipe:read("*a")
        pipe:close()
        return output
    end
    local output = fit()
    local chain = dofile(route)
    local valley, durotar = chain.guides[1], chain.guides[2]
    T.eq(valley.minLevel, 1, "the route still starts at level 1")
    T.ok(durotar.minLevel < 9, "Durotar starts where the valley ends: " .. durotar.minLevel .. "\n" .. output)
    T.eq(valley.maxLevel, durotar.minLevel, "the valley ends where Durotar starts")
    T.eq(durotar.maxLevel, 12, "the last window of a route without next guide stays")
    T.eq(valley.title, "Valley of Trials", "titles untouched")
    T.ok(fit():find("windows unchanged"), "a second run changes nothing")
    run(base .. "/chain", route)
    local text = read(base .. "/chain/Test/01_Valley.lua")
    T.ok(text and not text:find("{ level = "), "no level step at the end of the valley")
    T.ok(text and text:find(('title    = "Valley of Trials (1-%d)"'):format(durotar.minLevel), 1, true),
        "the title carries the window")
    T.ok(text and text:find('pack     = "ding-zones"', 1, true), "the route's pack is written")
end)

-- One guide over the valley and Durotar, the zone intros taken from the route above: the
-- valley's (a guide with a box) on the first step, Durotar's once the player leaves the box.
local MULTI = [=[
return {
    file = "multi.lua", faction = "Horde", races = { "Orc", "Troll" }, guideRaces = { "Orc", "Troll" },
    zoneIntrosFrom = { "chain.lua" }, multiZone = true,
    guides = {
        { id = "test-multi", file = "Test/Multi.lua", title = "Orc and Troll",
          areas = { 363, 14 }, minLevel = 1, maxLevel = 8 },
    },
}
]=]

T.test("a guide over several zones: each zone's intro on its first step there", function()
    local route = base .. "/multi.lua"
    local f = assert(io.open(route, "w"))
    f:write(MULTI)
    f:close()
    run(base .. "/multi", route)
    local text = read(base .. "/multi/Test/Multi.lua") or ""
    local valley, durotar = text:find('note = "Valley."', 1, true), text:find('note = "Durotar."', 1, true)
    local _, stepsBefore = text:sub(1, valley or 0):gsub("\n        { ", "")
    T.ok(valley and stepsBefore == 1, "the valley's intro on the first step\n" .. text)
    T.ok(durotar and valley and durotar > valley, "Durotar's intro once out of the valley\n" .. text)
    T.ok(not text:find('note = "Valley."', (valley or 0) + 1, true), "each intro once")
end)

-- Tests run in order: this one last.
T.test("temporary files cleaned up", function()
    remove(base)
    T.eq(read(first .. "/" .. FILES[1]), nil)
end)

T.run()
