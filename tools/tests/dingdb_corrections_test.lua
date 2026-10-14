-- DingDB's corrections and additions (tools/dingdb_corrections.lua): checked, then applied by
-- tools/build_data.lua on top of Questie's data; tools/check_data.lua reports the mistakes.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local C = dofile(tools .. "/dingdb_corrections.lua")

local windows = package.config:sub(1, 1) == "\\"
local function quote(s)
    if windows then return '"' .. s .. '"' end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end
local function shell(command) return windows and ('"' .. command .. '"') or command end
local lua = "lua5.1"
local i = -1
while arg[i] do lua = arg[i]; i = i - 1 end
local temp = (os.getenv("TMPDIR") or os.getenv("TEMP") or os.getenv("TMP") or "/tmp"):gsub("\\", "/")
local base = ("%s/dingdb_test_%d_%d"):format(temp, os.time(), math.floor(os.clock() * 1000))
local function mkdir(dir)
    os.execute(windows and shell("mkdir " .. quote(dir:gsub("/", "\\"))) .. " 2>nul" or "mkdir -p " .. quote(dir))
end
local function remove(dir)
    if windows then os.execute(shell("rmdir /s /q " .. quote(dir:gsub("/", "\\"))) .. " 2>nul")
    else os.execute("rm -rf " .. quote(dir)) end
end
local function writeFile(path, text)
    local f = assert(io.open(path, "wb"))
    f:write(text)
    f:close()
end
local function run(command)
    local pipe = io.popen(shell(command .. " 2>&1"))
    local output = pipe:read("*a")
    local ok, _, code = pipe:close()
    return output, code
end

T.test("a valid correction passes the check", function()
    T.eq(#C.check({
        quests = { [783] = { name = "A Threat Within", requiredLevel = 1, startedBy = { { 823 } },
            objectives = { { { 6, "Kobold Vermin" } } }, triggerEnd = { "The camp", { [1429] = { 40, 50 } } } },
            [990001] = false },
        npcs = { [823] = { spawns = { [1429] = { 48.17, 42.94, 48.2, 43 } }, friendlyToFaction = "A", subName = false } },
        items = { [159] = { vendors = { 1250 } } },
        names = { frFR = { quests = { [783] = "Menace intérieure" } } },
    }, "ok.lua"), 0)
end)

T.test("each mistake gets its own error", function()
    local errors = C.check({
        spells = {},
        quests = { [0] = {}, [5] = { colour = 1, requiredLevel = "high", startedBy = { { -3 } } } },
        npcs = { [6] = { spawns = { [1429] = { 40 } }, friendlyToFaction = "Alliance" } },
        names = { itIT = {}, frFR = { npcs = { [6] = 7 } } },
    }, "bad.lua")
    local text = table.concat(errors, "\n")
    for _, part in ipairs({ "unknown section spells", "0 is not an id", "unknown field colour",
        "requiredLevel: not a valid level", "startedBy: not a valid givers", "spawns: not a valid spawns",
        "friendlyToFaction: not a valid faction", "unknown language itIT", "names.frFR.npcs[6]" }) do
        T.ok(text:find(part, 1, true), "missing: " .. part .. "\n" .. text)
    end
end)

T.test("a correction file is data only: no globals, no code to run", function()
    mkdir(base .. "/code")
    writeFile(base .. "/code/a.lua", "os.exit(3)")
    local files, errors = C.load(base .. "/code")
    T.eq(#files, 0)
    T.ok(errors[1] and errors[1]:find("a.lua", 1, true), "refused")
end)

T.test("build_data applies them on top of Questie's data; check_data reports mistakes", function()
    local dir, out = base .. "/corrections", base .. "/out"
    mkdir(dir); mkdir(out)
    writeFile(dir .. "/10_fix.lua", [[
return {
    quests = { [783] = { name = "A Threat Within (fixed)", requiredLevel = 2 },
               [990001] = { name = "A Forever quest", questLevel = 10, startedBy = { { 823 } } } },
    npcs = { [823] = { spawns = { [1429] = { 50, 50 } } } },
    items = { [159] = false },
    names = { frFR = { quests = { [990001] = "Une quête de Forever" } } },
}]])
    local output = run(table.concat({ quote(lua), quote(tools .. "/build_data.lua"), quote(T.combined),
        "--out", quote(out), "--source", quote("QuestieDB test"), "--corrections", quote(dir) }, " "))
    T.ok(output:find("4 corrections from 1 files", 1, true), output)
    local ns = {}
    _G.GetLocale = function() return "frFR" end
    for _, f in ipairs({ "DB.lua", "Quests.lua", "Npcs.lua", "Items.lua", "Locales/frFR.lua" }) do
        assert(loadfile(out .. "/" .. f))("Ding", ns)
    end
    local DB = ns.DB
    local L = DB.LAYOUT
    T.eq(DB.quests[783][L.Quest.name], "A Threat Within (fixed)")
    T.eq(DB.quests[783][L.Quest.requiredLevel], 2)
    T.eq(DB.quests[783][L.Quest.startedBy][1][1], 823, "the other fields stay")
    T.eq(DB.quests[990001][L.Quest.questLevel], 10)
    T.eq(DB.names.quests[990001], "Une quête de Forever")
    T.eq(DB.npcs[823][L.Npc.spawns][1429][1], 50)
    T.eq(DB.items[159], nil, "removed")
    T.eq(table.concat(DB.corrected.quests, ","), "783,990001")

    writeFile(dir .. "/20_bad.lua", "return { quests = { [5] = { colour = 1 } } }")
    local report, code = run(table.concat({ quote(lua), quote(tools .. "/check_data.lua"), quote(dir) }, " "))
    T.ok(report:find("[ERROR] 20_bad.lua: quests[5]: unknown field colour", 1, true), report)
    T.ok(code ~= 0 or report:find("1 error", 1, true), "an error is reported")
    local refused = run(table.concat({ quote(lua), quote(tools .. "/build_data.lua"), quote(T.combined),
        "--out", quote(out), "--corrections", quote(dir) }, " "))
    T.ok(refused:find("corrections refused", 1, true), refused)
end)

-- write_leveling.lua, check_guides.lua and the route tests read the export through
-- questiedb_export.lua loadCorrected: the guides are written and checked with the data the game has.
T.test("the tools that write and check guides read the export with the corrections on top", function()
    local X = dofile(tools .. "/questiedb_export.lua")
    local QK = X.QUEST
    local dir = base .. "/offline"
    mkdir(dir)
    writeFile(dir .. "/10_fix.lua", [[
return {
    quests = { [783] = { requiredLevel = 2, preQuestSingle = { 7 } },
               [990001] = { name = "A Forever quest", questLevel = 10, startedBy = { { 823 } } } },
    npcs = { [823] = { rank = 1, spawns = { [1429] = { 50, 50, 51.5, 52 } } },
             [11867] = { weaponSkills = { 43 } } },
    items = { [159] = false },
    names = { frFR = { quests = { [990001] = "Une quête de Forever" } } },
}]])
    local raw = X.load(T.combined)
    local db, corrected = X.loadCorrected(T.combined, dir)
    T.eq(db.Quest[783][QK.requiredLevel], 2)
    T.eq(db.Quest[783][QK.preQuestSingle][1], 7)
    T.eq(db.Quest[783][QK.name], raw.Quest[783][QK.name], "the other fields stay")
    T.eq(db.Quest[990001][QK.questLevel], 10)
    T.eq(db.Quest[990001][QK.startedBy][1][1], 823)
    T.eq(db.Npc[823][6], 1, "rank")
    -- Spawns by UiMapID become the export's, by an AreaID of that map, with the same coordinates.
    local area, points = next(db.Npc[823][X.NPC.spawns])
    T.eq(X.areaToMap(T.combined)[area], 1429)
    T.eq(next(db.Npc[823][X.NPC.spawns], area), nil, "one map")
    T.eq(#points, 2)
    T.eq(points[2][1], 51.5)
    T.eq(points[2][2], 52)
    for k in pairs(db.Npc[11867]) do T.eq(type(k), "number", "a field of DingDB's own stays out") end
    T.eq(db.Npc[11867][X.NPC.name], raw.Npc[11867][X.NPC.name])
    T.eq(db.Item[159], nil, "removed")
    T.ok(corrected.quests[783] and corrected.quests[990001] and corrected.npcs[823] and corrected.items[159])
    -- The shipped corrections, by default: Carnage needs Blisters on the Land.
    local shipped = X.loadCorrected(T.combined)
    T.eq(shipped.Quest[98283][QK.preQuestSingle][1], 275)
    T.eq(raw.Quest[98283][QK.preQuestSingle], nil, "(the export does not know it)")
end)

T.test("the corrections shipped with Ding are valid", function()
    local report = run(table.concat({ quote(lua), quote(tools .. "/check_data.lua") }, " "))
    T.ok(report:find("0 error(s)", 1, true), report)
end)

T.test("the temporary files are removed", function() remove(base) end)

T.run()
