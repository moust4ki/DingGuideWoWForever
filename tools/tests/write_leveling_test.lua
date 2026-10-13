-- tools/write_leveling.lua on a small Leveling route: the route's order is the plan, Forever changes
-- it as little as possible. Two race starts (Human, Night Elf) join a shared section.
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
local base = ("%s/ding_base_test_%d_%d"):format(temp, os.time(), math.floor(os.clock() * 1000))
local function remove(dir)
    if windows then
        os.execute(shell("rmdir /s /q " .. quote(dir:gsub("/", "\\"))) .. " 2>nul")
    else
        os.execute("rm -rf " .. quote(dir))
    end
end
local function read(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local text = f:read("*a")
    f:close()
    return text
end
local function run(command)
    local pipe = io.popen(shell(command .. " 2>&1"))
    local output = pipe:read("*a")
    pipe:close()
    return output
end

-- 456 The Balance of Nature -> 457; 916 Webwood Venom; 2159 Dolanaar Delivery; 4495 A Good
-- Friend (Teldrassil, open to every Alliance race). 2031 Young Nightsaber; 5168 Timberling Seed.
local ROUTE = [=[
return {
    faction = "Alliance",
    sections = {
        { id = "leveling-a01-test-human", title = "Human test", races = { "Human" }, minLevel = 1, maxLevel = 3,
          areas = { 188, 141 }, uiMaps = { 1438 }, next = "leveling-a03-test-shared",
          steps = {
              { accept = 456 }, { complete = 456 }, { turnin = 456 },
              { accept = 916 }, { complete = 916 }, { turnin = 916 },
          } },
        { id = "leveling-a02-test-elf", title = "Night Elf test", races = { "NightElf" }, minLevel = 1, maxLevel = 3,
          areas = { 188, 141 }, uiMaps = { 1438 }, next = "leveling-a03-test-shared",
          steps = {
              { go = { 1438, 58, 40 }, text = "Die on purpose at this spot" },
              { deathskip = true, revive = { 1438, 56, 59 }, text = "Get yourself killed, then resurrect with the spirit healer" },
              { go = { 1438, 56, 59 }, fly = "Dolanaar flight path" },
          } },
        { id = "leveling-a03-test-shared", title = "Shared test", minLevel = 3, maxLevel = 6,
          areas = { 188, 141 }, uiMaps = { 1438 },
          steps = {
              { accept = 457 }, { complete = 457, sticky = { 457, 2159 } }, { turnin = 457 },
              { accept = 916 }, { complete = 916, elite = true }, { turnin = 916 },
              { accept = 2159 },
              { turnin = 4495, accept = 4495 },
              { kill = { { 2031, 6 } }, keep = 5168, patrol = { { 1438, 58, 40 }, { 1438, 60, 42 } } },
              { accept = 457, when = { notdone = 457 } },
              { go = { 1438, 55, 50 }, text = "Walk to the well" },
              { talk = 3514, races = { "Human" } },
              { go = { 1438, 55, 50 }, text = "Walk to the well" },
              { go = { 1438, 55, 50 }, text = "Walk to the well" },
          } },
    },
}
]=]

local human, elf, shared
T.test("the Leveling route is written into guides", function()
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and base:gsub("/", "\\") or base)))
    local route = base .. "/route.lua"
    local f = assert(io.open(route, "w"))
    f:write(ROUTE)
    f:close()
    local output = run(table.concat({ quote(lua), quote(tools .. "/write_leveling.lua"), quote(T.combined), quote(route),
        "--out", quote(base .. "/out"), "--no-additions" }, " "))
    T.ok(output:find("residual problems: 0", 1, true), output)
    human = read(base .. "/out/Leveling/Alliance/01.lua")
    elf = read(base .. "/out/Leveling/Alliance/02.lua")
    shared = read(base .. "/out/Leveling/Alliance/03.lua")
    T.ok(human and elf and shared, output)
end)

T.test("a missing prerequisite is done first, for the race that lacks it", function()
    local a = shared:find("{ accept = 456, races = { \"NightElf\" } }", 1, true)
    local b = shared:find("{ accept = 457 }", 1, true)
    T.ok(a and b and a < b, shared)
    -- (`repair` is a step key of its own: an inserted step does not send to a vendor.)
    T.ok(not shared:find("repair =", 1, true), shared)
end)

T.test("an elite quest is tagged on every step; a race that did it skips it", function()
    T.ok(shared:find("{ accept = 916, elite = true, races = { \"NightElf\" } }", 1, true), shared)
    T.ok(shared:find("{ turnin = 916, elite = true, races = { \"NightElf\" } }", 1, true), shared)
    T.ok(human:find("{ accept = 916, elite = true }", 1, true), human)
end)

T.test("a quest the route never turns in is not taken; one done on the spot is accepted first", function()
    T.ok(not shared:find("2159", 1, true), shared)
    local a = shared:find("{ accept = 4495 }", 1, true)
    local b = shared:find("{ turnin = 4495 }", 1, true)
    T.ok(a and b and a < b, shared)
end)

T.test("the way to a death skip is part of it, then the revive point; a flight label becomes the step text", function()
    T.ok(elf:find("{ go = { 1438, 58, 40 }, deathskip = true, text = \"Die on purpose at this spot\" }", 1, true), elf)
    T.ok(elf:find("{ deathskip = true, revive = { 1438, 56, 59 }, text = \"Get yourself killed, then resurrect with the spirit healer\" }",
        1, true), elf)
    T.ok(elf:find("fly = true, text = \"Dolanaar flight path\"", 1, true), elf)
end)

T.test("goals are written as they are; sticky keeps the quests taken by then; a branch stays", function()
    T.ok(shared:find("{ kill = { { 2031, 6 } }, keep = 5168, patrol = { { 1438, 58, 40 }, { 1438, 60, 42 } } }", 1, true),
        shared)
    -- (2159 is never turned in: not taken, so not kept in view.)
    T.ok(shared:find("{ complete = 457, sticky = { 457 } }", 1, true), shared)
    -- (457 is turned in by then: the branch never applies, and is not "repaired" away.)
    T.ok(shared:find("{ accept = 457, when = { notdone = 457 } }", 1, true), shared)
end)

-- The night elves never talk to that NPC: they are at the well already when the route walks
-- there again; then the same trip right after itself is left out for everyone.
T.test("a trip right after the same trip: kept for those who need it, else left out", function()
    T.ok(shared:find('{ go = { 1438, 55, 50 }, text = "Walk to the well" }, -- level', 1, true), shared)
    T.ok(shared:find('{ talk = 3514, races = { "Human" } }', 1, true), shared)
    T.ok(shared:find('{ go = { 1438, 55, 50 }, races = { "Human" }, text = "Walk to the well" }', 1, true), shared)
    local _, trips = shared:gsub("go = { 1438, 55, 50 }", "")
    T.eq(trips, 2, shared)
end)

T.test("the guides pass check_guides", function()
    local out = base .. "/out/Leveling/Alliance/"
    local report = run(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(out .. "01.lua"), quote(out .. "02.lua"), quote(out .. "03.lua") }, " "))
    T.ok(report:find("Result: 0 error(s)", 1, true), report)
end)

-- Duskwood: 174 Look To The Stars needs a Bronze Tube (4371) the player brings (vendors sell
-- it), then 175 and 177 follow; no step works on 177 (its looking glass found along the way).
-- The route's accept carries the seed's list form of `when.item`.
-- travel.lua next to the route opens the section with its intro and a go step.
local ROUTE2 = [=[
return {
    faction = "Alliance",
    sections = {
        { id = "leveling-a01-test-duskwood", title = "Duskwood test", races = { "Human" }, minLevel = 20, maxLevel = 26,
          areas = { 10 }, uiMaps = { 1431 },
          steps = {
              { accept = 174, when = { item = { { 4371, 1 } } } },
              { turnin = 174, accept = 175 },
              { turnin = 175, accept = 177 }, { turnin = 177 },
          } },
    },
}
]=]
local TRAVEL2 = [=[
return { ["leveling-a01-test-duskwood"] = { intro = "Duskwood: Darkshire.", travel = "Travel to Darkshire" } }
]=]
local duskwood
T.test("a quest that needs a carried item applies with the item; its follow-ups once it is done", function()
    local dir = base .. "/duskwood"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    for name, text in pairs({ ["route.lua"] = ROUTE2, ["travel.lua"] = TRAVEL2 }) do
        local f = assert(io.open(dir .. "/" .. name, "w"))
        f:write(text)
        f:close()
    end
    local output = run(table.concat({ quote(lua), quote(tools .. "/write_leveling.lua"), quote(T.combined),
        quote(dir .. "/route.lua"), "--out", quote(dir .. "/out"), "--no-additions" }, " "))
    duskwood = read(dir .. "/out/Leveling/Alliance/01.lua") or ""
    T.ok(output:find("residual problems: 0", 1, true), output)
    -- (The seed's list of pairs becomes one item, as the engine reads it.)
    T.ok(duskwood:find("{ accept = 174, when = { item = 4371 } }", 1, true), duskwood)
    T.ok(duskwood:find("{ turnin = 174, when = { item = 4371 } }", 1, true), duskwood)
    T.ok(duskwood:find("{ accept = 175, when = { done = 174 } }", 1, true), duskwood)
    T.ok(duskwood:find("{ turnin = 175, when = { log = 175 } }", 1, true), duskwood)
    T.ok(duskwood:find("{ accept = 177, when = { done = 175 } }", 1, true), duskwood)
    -- (Done along the way: turned in once ready, passed otherwise.)
    T.ok(duskwood:find("{ turnin = 177, when = { ready = 177 } }", 1, true), duskwood)
end)

T.test("a section opens with its intro and, from elsewhere, a go step to its first quest giver", function()
    local go = duskwood:find('{ go = { 1431, ', 1, true)
    local accept = duskwood:find("{ accept = 174", 1, true)
    T.ok(go and accept and go < accept, duskwood)
    T.ok(duskwood:find('text = "Travel to Darkshire"', 1, true), duskwood)
    T.ok(duskwood:find('note = "Duskwood: Darkshire."', 1, true), duskwood)
    local report = run(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(base .. "/duskwood/out/Leveling/Alliance/01.lua") }, " "))
    T.ok(report:find("Result: 0 error(s)", 1, true), report)
    T.ok(not report:find("without a complete step", 1, true), report)
end)

-- Tests run in order: this one last.
T.test("temporary files cleaned up", function()
    remove(base)
    T.eq(read(base .. "/route.lua"), nil)
end)

T.run()
