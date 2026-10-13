-- Free quests (tools/route_free.lua): quests a Leveling route leaves out although they cost almost
-- nothing on its way; tools/write_leveling.lua warns about them, tools/audit_free_quests.lua adds
-- them to the route. 9415 Report to Marshal Bluewall (Silithus, level 60, 7150 XP): from Rifleman
-- Torrig at Cenarion Hold to Marshal Bluewall at the Alliance camp, nothing to do in between.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local X = dofile(tools .. "/questiedb_export.lua")
local RouteData = dofile(tools .. "/route_data.lua")
local Work = dofile(tools .. "/route_work.lua")
local Model = dofile(tools .. "/route_model.lua")
local Free = dofile(tools .. "/route_free.lua")
local QK = X.QUEST

local db = X.load(T.combined)
local D = RouteData.new(db, T.combined)
local Jobs = Work.new(D)

local TORRIG = D.point(1451, 50.68, 34.71)
local BLUEWALL = D.point(1451, 33.29, 51.06)

-- A route of two steps in Silithus: Cenarion Hold, then the Alliance camp.
local function audit(opts)
    opts = opts or {}
    local hold, camp = { go = true }, { go = true }
    local level = opts.level or 58
    local nodes = {
        { p = TORRIG, level = level, log = 5, time = 0, step = hold, section = "s", work = nil },
        { p = BLUEWALL, level = level, log = 5, time = 300, step = camp, section = "s", work = nil },
    }
    local result = Free.audit({
        db = db, D = D, Jobs = Jobs, faction = "Alliance", races = { "Human" }, raceBit = { Human = 1 },
        logLimit = 20, known = opts.known or {}, exclude = opts.exclude,
        paths = { Human = { nodes = nodes, accepted = {}, turned = {}, trips = { s = Model.travel } } },
        rate = function() return opts.rate or 3 end,
        anchor = function() return true end,
    })
    local found
    for _, f in ipairs(result.findings) do
        if f.q == 9415 then found = f end
    end
    return found, result, hold, camp
end

T.test("total XP of a fractional level", function()
    T.eq(Free.totalXP(1), 0)
    T.eq(Free.totalXP(2.5), 400 + 450)
end)

T.test("what can never be free: class, repeatable, escort, profession, left out, another version", function()
    local quest = db.Quest[9415]
    T.eq(Free.screen(9415, quest, D), nil)
    T.eq(Free.screen(9415, quest, D, { [9415] = "test" }), "left out by the route")
    T.eq(Free.screen(5821, db.Quest[5821], D), "escort or event", "Bodyguard for Hire: an escort")
    local function with(field, value)
        local copy = {}
        for k, v in pairs(quest) do copy[k] = v end
        copy[field] = value
        return copy
    end
    T.eq(Free.screen(9415, with(QK.specialFlags, 1), D), "repeatable")
    T.eq(Free.screen(9415, with(QK.requiredClasses, 4), D), "class quest")
    T.eq(Free.screen(9415, with(QK.requiredSkill, { 164, 100 }), D), "profession")
    T.eq(Free.screen(9415, with(QK.requiredMinRep, { 609, 3000 }), D), "reputation")
    T.eq(Free.screen(9415, quest, D, nil, { [Free.signature(quest)] = 1 }), "another version of a route quest")
end)

T.test("a delivery from one step's place to the next one's is free", function()
    local f, _, hold, camp = audit()
    T.ok(f, "found")
    T.eq(f.kind, "free")
    T.ok(f.accept == hold and f.turnin == camp and f.work == nil, "accepted at the first step, turned in at the next")
    T.eq(f.xp, 7150)
    T.ok(f.added >= 2 * Free.PARAMS.talkTime and f.added < 10, f.added)
    T.ok(f.ratio >= Free.PARAMS.ratio, f.ratio)
end)

T.test("not free: left out on purpose, on the route already, above the player, or not worth it", function()
    T.eq(audit({ exclude = { [9415] = "test" } }), nil, "exclude")
    T.eq(audit({ known = { [9415] = true } }), nil, "the route's own")
    T.eq(audit({ level = 50 }), nil, "quest more than 2 levels above")
    local f = audit({ rate = 7150 / 6 / 6 })
    T.ok(f and f.kind == "borderline" and f.why == "pace", f and f.kind)
    T.eq(audit({ rate = 7150 }), nil, "far below the section's pace")
end)

---------------------------------------------------------------------------
-- tools/write_leveling.lua warns; tools/audit_free_quests.lua adds the steps
---------------------------------------------------------------------------
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
local temp = ((windows and (os.getenv("TEMP") or os.getenv("TMP")) or os.getenv("TMPDIR")) or "/tmp"):gsub("\\", "/")
local base = ("%s/ding_free_test_%d_%d"):format(temp, os.time(), math.floor(os.clock() * 1000))
local function run(command)
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
local function write(path, text)
    local f = assert(io.open(path, "w"))
    f:write(text)
    f:close()
end

local ROUTE = [=[
return {
    faction = "Alliance",
    sections = {
        { id = "leveling-a01-test-silithus", title = "Silithus test", races = { "Human" }, minLevel = 58, maxLevel = 60,
          areas = { 1377 }, uiMaps = { 1451 },
          steps = {
              { level = 58 },
              { go = { 1451, 50.68, 34.71 }, text = "Walk to Cenarion Hold" },
              { go = { 1451, 33.29, 51.06 }, text = "Walk to the Alliance camp" },
          } },
    },
}
]=]
local WARNING = "warning: free quest left out: 9415 Report to Marshal Bluewall in leveling-a01-test-silithus, after route step 2"

T.test("write_leveling warns about a free quest the route leaves out, and writes it for the audit", function()
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and base:gsub("/", "\\") or base)))
    write(base .. "/route.lua", ROUTE)
    local output = run(table.concat({ quote(lua), quote(tools .. "/write_leveling.lua"), quote(T.combined),
        quote(base .. "/route.lua"), "--dry-run", "--no-additions", "--free-quests", quote(base .. "/free.lua") }, " "))
    T.ok(output:find(WARNING, 1, true), output)
    T.ok(output:find("Free quests left out: ", 1, true), output)
    local chunk = loadfile(base .. "/free.lua")
    T.ok(chunk, "the findings load")
    local found
    for _, f in ipairs(chunk and chunk().findings or {}) do
        if f.q == 9415 then found = f end
    end
    T.ok(found and found.kind == "free", "9415 free")
    T.eq(found and #found.steps, 2)
    T.eq(found and found.steps[1].after, 2, "accepted after the step at Cenarion Hold")
    T.eq(found and found.steps[2].after, 3, "turned in after the step at the camp")
end)

T.test("a quest in the route's exclude list is no warning", function()
    write(base .. "/excluded.lua", (ROUTE:gsub('faction = "Alliance",', 'faction = "Alliance",\n    exclude = { [9415] = "test" },')))
    local output = run(table.concat({ quote(lua), quote(tools .. "/write_leveling.lua"), quote(T.combined),
        quote(base .. "/excluded.lua"), "--dry-run", "--no-additions" }, " "))
    T.ok(output:find("Free quests left out: ", 1, true), output)
    T.ok(not output:find("free quest left out: 9415", 1, true), output)
end)

T.test("audit_free_quests --apply puts its steps in the route, right after the steps the audit names", function()
    local output = run(table.concat({ quote(lua), quote(tools .. "/audit_free_quests.lua"), quote(T.combined),
        quote(base .. "/route.lua"), "--apply", "--passes", "2" }, " "))
    T.ok(output:find("9415 Report to Marshal Bluewall", 1, true), output)
    local text = read(base .. "/route.lua") or ""
    local hold = text:find("Walk to Cenarion Hold", 1, true)
    local accept = text:find("{ accept = 9415 },", 1, true)
    local camp = text:find("Walk to the Alliance camp", 1, true)
    local turnin = text:find("{ turnin = 9415 },", 1, true)
    T.ok(hold and accept and camp and turnin and hold < accept and accept < camp and camp < turnin, text)
    T.ok(loadstring(text), "the route still loads")
    local again = run(table.concat({ quote(lua), quote(tools .. "/write_leveling.lua"), quote(T.combined),
        quote(base .. "/route.lua"), "--dry-run", "--no-additions" }, " "))
    T.ok(not again:find("free quest left out: 9415", 1, true), again)
end)

-- Tests run in order: this one last.
T.test("temporary files cleaned up", function()
    if windows then
        os.execute(shell("rmdir /s /q " .. quote(base:gsub("/", "\\"))) .. " 2>nul")
    else
        os.execute("rm -rf " .. quote(base))
    end
    T.eq(read(base .. "/route.lua"), nil)
end)

T.run()
