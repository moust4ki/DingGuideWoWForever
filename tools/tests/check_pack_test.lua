-- tools/check_guides.lua --addon, the validator offered to guide pack authors
-- (docs/guide-packs.md): the example pack passes clean, a broken pack gets one clear error
-- per mistake.
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
local base = ("%s/ding_pack_test_%d_%d"):format(temp, os.time(), math.floor(os.clock() * 1000))

local function check(addonDir)
    local command = table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        "--addon", quote(addonDir) }, " ")
    local pipe = io.popen(shell(command .. " 2>&1"))
    local output = pipe:read("*a")
    pipe:close()
    return output
end

local function write(path, text)
    local f = assert(io.open(path, "w"))
    f:write(text)
    f:close()
end

local function remove(dir)
    if windows then
        os.execute(shell("rmdir /s /q " .. quote(dir:gsub("/", "\\"))) .. " 2>nul")
    else
        os.execute("rm -rf " .. quote(dir))
    end
end

T.test("the example pack passes with no error or warning", function()
    local report = check(tools .. "/../examples/DingExamplePack")
    T.ok(report:find("2 guide(s) loaded from 4 file(s)", 1, true), report)
    T.ok(report:find("Chain: example-01-aldrassil -> example-02-cave", 1, true), report)
    T.ok(report:find("Result: 0 error(s), 0 warning(s)", 1, true), report)
end)

T.test("a broken pack: one clear error per mistake", function()
    local dir = base .. "/BrokenPack"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    write(dir .. "/BrokenPack.toc", table.concat({
        "## Interface: 16001", "## Dependencies: Ding", "",
        "Pack.lua", "Guides.lua", "Locales.lua", "",
    }, "\n"))
    write(dir .. "/Pack.lua", table.concat({
        'Ding.RegisterGuidePack({ id = "broken", title = "Broken", colour = "red", category = "pets" })',
        'Ding.RegisterGuidePack({ id = "ding", title = "Mine" })',
    }, "\n"))
    write(dir .. "/Guides.lua", table.concat({
        'Ding.RegisterGuide({ id = "broken-nopack", steps = { { accept = 783 } } })',
        'Ding.RegisterGuide({ pack = "elsewhere", id = "broken-lost", steps = { { accept = 783 } } })',
        'Ding.RegisterGuide({ pack = "broken", id = "nightelf-01-shadowglen", steps = { { accept = 456 } } })',
        'Ding.RegisterGuide({ pack = "broken", id = "broken-elf", races = { "NightElf" }, next = "nightelf-02-dolanaar",',
        '    steps = { { accept = 456, races = { "Elf" } }, { turnin = 457 }, { go = { 1438, 120, 50 } } } })',
    }, "\n"))
    write(dir .. "/Locales.lua", table.concat({
        'Ding.RegisterGuideTranslation("frFR", "broken-elf", { ["Old text"] = "Vieux texte" })',
        'Ding.RegisterGuideTranslation("frFR", "broken-unknown", { ["A"] = "B" })',
    }, "\n"))
    local report = check(dir)
    remove(base)
    local expected = {
        "[WARNING] pack broken: unknown pack key: colour",
        "[WARNING] pack broken: unknown category pets: the pack is listed under leveling",
        "[ERROR] pack ding: this id is one of Ding's own packs: choose another one",
        "[ERROR] broken-nopack: no pack: the guide would be added to Ding's own guide",
        "[ERROR] broken-lost: unknown pack elsewhere: call Ding.RegisterGuidePack first",
        "[ERROR] nightelf-01-shadowglen: id already used by one of Ding's guides",
        "[ERROR] broken-elf, step 1: unknown race: Elf",
        "[ERROR] broken-elf, step 3: go coordinates outside 0-100",
        "[info] broken-elf: continues into Ding's guide nightelf-02-dolanaar",
        "[ERROR] broken-elf, step 2: turns in 457 ",
        "[WARNING] broken-elf: frFR translation without its English text: \"Old text\"",
        "[ERROR] " .. dir .. "/Locales.lua: frFR translation of an unknown guide: broken-unknown",
    }
    for _, line in ipairs(expected) do
        T.ok(report:find(line, 1, true), "missing: " .. line .. "\n" .. report)
    end
    T.ok(not report:find("Result: 0 error", 1, true), report)
end)

-- Steps tagged for Ding's options (off by default): shortcuts and extras the guide never
-- depends on.
T.test("tagged steps: hearthstone, death skip, dungeon and elite extras", function()
    local dir = base .. "/Tagged"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    local file = dir .. "/Tagged.lua"
    write(file, table.concat({
        'Ding.RegisterGuide({ id = "t-tagged", title = "Tagged", faction = "Alliance", races = { "NightElf" },',
        '    minLevel = 1, maxLevel = 6, steps = {',
        '        { sethearth = "Dolanaar" }, { hearth = true },',
        '        { deathskip = true, text = "Die." },',
        '        { deathskip = true },',
        '        { accept = 456, dungeon = "The Deadmines" }, { complete = 456, dungeon = "The Deadmines" },',
        '        { turnin = 456, dungeon = "The Deadmines" },',
        '        { accept = 457 },',
        '        { accept = 3116, elite = "yes" }, { turnin = 3116 },',
        '        { dungeon = 5, text = "x" }, { sethearth = 3 },',
        '        { deathskip = true, text = "Die.", go = { 1438, 50, 50 } }, { deathskip = true, text = "Die.", level = 5 },',
        '} })',
    }, "\n"))
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(file) }, " ") .. " 2>&1"))
    local report = pipe:read("*a")
    pipe:close()
    for _, line in ipairs({
        "[ERROR] t-tagged, step 4: deathskip needs a text",
        "[ERROR] t-tagged, step 8: 457 \"The Balance of Nature\" depends on a quest done only in a dungeon or elite step",
        "[ERROR] t-tagged, step 9: elite expects true",
        "[ERROR] t-tagged, step 10: turns in 3116 ",
        "[ERROR] t-tagged, step 11: dungeon expects the dungeon's name",
        "[ERROR] t-tagged, step 12: sethearth expects the inn's name",
        "[WARNING] t-tagged, step 14: deathskip needs a step of its own, without level",
    }) do
        T.ok(report:find(line, 1, true), "missing: " .. line .. "\n" .. report)
    end
    for _, step in ipairs({ 1, 2, 3, 5, 6, 7, 13 }) do
        T.ok(not report:find(("t-tagged, step %d:"):format(step), 1, true), "step " .. step .. " is fine\n" .. report)
    end
    T.ok(not report:find("unknown step key", 1, true), report)
    remove(dir)
end)

-- The engine's later keys: vendor and repair steps, objectives kept in view (sticky), and a
-- next guide per faction for a race that picks its side on the way.
T.test("vendor, repair, sticky, next per faction, a quest tagged on some steps only", function()
    local dir = base .. "/Contract"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    local file = dir .. "/Contract.lua"
    write(file, table.concat({
        'Ding.RegisterGuide({ id = "t-start", title = "Start", races = { "NightElf" }, minLevel = 1, maxLevel = 6,',
        '    next = { Alliance = "t-ally", Horde = "t-horde" }, steps = {',
        '        { accept = 456, sticky = 456 },',
        '        { sticky = 916 },',
        '        { vendor = true }, { repair = "Repairs at the smith." },',
        '        { vendor = 5 },',
        '        { accept = 2159, sticky = 2159 },',
        '        { accept = 916 }, { complete = 916, elite = true },',
        '} })',
        'Ding.RegisterGuide({ id = "t-ally", title = "Ally", minLevel = 6, maxLevel = 8, steps = { { level = 8 } } })',
        'Ding.RegisterGuide({ id = "t-horde", title = "Horde", minLevel = 6, maxLevel = 8, steps = { { level = 8 } } })',
        'Ding.RegisterGuide({ id = "t-lost", title = "Lost", races = { "NightElf" },',
        '    next = { Pandaren = "t-ally" }, steps = { { level = 2 } } })',
    }, "\n"))
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(file) }, " ") .. " 2>&1"))
    local report = pipe:read("*a")
    pipe:close()
    for _, line in ipairs({
        "[ERROR] t-start, step 2: sticky 916 \"Webwood Venom\": not accepted by this step",
        "[ERROR] t-start, step 5: vendor expects true or a text",
        "[ERROR] t-start, step 6: sticky 2159 \"Dolanaar Delivery\": the quest has no objectives",
        "[WARNING] t-start, step 7: 916 \"Webwood Venom\" has dungeon or elite steps: tag this one too",
        "[ERROR] t-lost: next: unknown faction Pandaren",
        "Chain: t-start -> t-ally (Alliance)",
        "Chain: t-start -> t-horde (Horde)",
    }) do
        T.ok(report:find(line, 1, true), "missing: " .. line .. "\n" .. report)
    end
    for _, step in ipairs({ 1, 3, 4 }) do
        T.ok(not report:find(("t-start, step %d:"):format(step), 1, true), "step " .. step .. " is fine\n" .. report)
    end
    T.ok(not report:find("next guide not found", 1, true), report)
    remove(dir)
end)

-- Phase 9 keys: goals without a quest, conditions, travel, progression.
T.test("goals, conditions and progression keys: shapes and replay", function()
    local dir = base .. "/Goals"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    local file = dir .. "/Goals.lua"
    write(file, table.concat({
        'Ding.RegisterGuide({ id = "t-goals", title = "Goals", races = { "NightElf" }, minLevel = 1, maxLevel = 6, steps = {',
        '    { accept = 456, noauto = 456 },',                                       -- 1 fine
        '    { kill = { { 2031, 6 } }, spots = { { 1438, 58, 40 } } },',            -- 2 fine
        '    { collect = { { 5168, 4 } }, patrol = { { 1438, 58, 40 }, { 1438, 60, 42 } } }, -- 3 fine',
        '    { talk = 3514, gossip = 1 },',                                          -- 4 fine
        '    { level = 4, xp = 400 }, { level = 4.5 },',                             -- 5, 6 fine
        '    { complete = 456, when = { log = 456 } },',                             -- 7 fine
        -- (8: the condition is unknown to the replay; playable, its turn-in opens 457.)
        '    { turnin = 456, accept = 457, when = { notdone = 457, minlevel = 3 } },',
        '    { complete = 457 },',                                                   -- 9 fine: 457 in the log
        '    { accept = 916, when = { done = 999999 } },',                           -- 10 never applies
        '    { abandon = 457 },',                                                    -- 11 fine
        '    { kill = 2031 , gossip = 0 },',                                         -- 12: gossip 0
        '    { level = 4.5, xp = 10 },',                                             -- 13: xp with a fraction
        '    { revive = { 1438, 50, 50 } },',                                        -- 14: revive without deathskip
        '    { patrol = { { 1438, 50, 50 } } },',                                    -- 15: one point
        '    { when = { cooldown = 1, minlevel = 9, maxlevel = 5 }, text = "x" },', -- 16: unknown key, min > max
        '    { buy = { { 159, 5, 9999999 } } },',                                    -- 17: unknown vendor
        '    { gossip = 2 },',                                                       -- 18: whom to talk to?
        -- (19: the condition holds but 456 is turned in: the branch is passed, as in the game.)
        '    { accept = 456, when = { notlog = 456 } },',
        '} })',
    }, "\n"))
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(file) }, " ") .. " 2>&1"))
    local report = pipe:read("*a")
    pipe:close()
    for _, line in ipairs({
        "[ERROR] t-goals, step 12: gossip expects the option's position, 1 or more",
        "[ERROR] t-goals, step 13: xp goes with a whole level",
        "[ERROR] t-goals, step 14: revive belongs on a deathskip step",
        "[ERROR] t-goals, step 15: patrol = { { uiMapId, x, y }, ... }, two points or more, x and y 0-100",
        "[ERROR] t-goals, step 16: when: unknown condition cooldown",
        "[ERROR] t-goals, step 16: when: minlevel above maxlevel",
        "[WARNING] t-goals, step 17: npc 9999999 is not in QuestieDB",
        "[WARNING] t-goals, step 18: gossip without talk nor quest NPC: whom to talk to?",
    }) do
        T.ok(report:find(line, 1, true), "missing: " .. line .. "\n" .. report)
    end
    for _, step in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 19 }) do
        T.ok(not report:find(("t-goals, step %d:"):format(step), 1, true), "step " .. step .. " is fine\n" .. report)
    end
    T.ok(not report:find("unknown step key", 1, true), report)
    remove(dir)
end)

-- A trip without a text only shows coordinates (a warning); the same trip twice in a row for
-- a character shows the same line twice (an error). Trips for different classes, or with
-- something to do there, are fine.
T.test("trips: a text, and never the same trip twice in a row", function()
    local dir = base .. "/Trips"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    local file = dir .. "/Trips.lua"
    write(file, table.concat({
        'Ding.RegisterGuide({ id = "t-trips", title = "Trips", faction = "Alliance", races = { "NightElf" },',
        '    minLevel = 1, maxLevel = 6, steps = {',
        '    { go = { 1438, 50, 50 }, text = "Walk to the tree" },',                             -- 1 fine
        '    { accept = 456 },',                                                                 -- 2 fine
        '    { go = { 1438, 55, 50 }, classes = { "WARRIOR" }, text = "Learn Staves" },',       -- 3 fine
        '    { go = { 1438, 55, 50 }, classes = { "HUNTER" }, text = "Learn Bows" },',          -- 4 fine: other class
        '    { go = { 1438, 55, 50.05 }, text = "Wait here" },',                                 -- 5: after 3, after 4
        '    { go = { 1438, 55, 50 } },',                                                         -- 6: after 5, no text
        '    { go = { 1438, 55, 50 }, talk = 3514, text = "Talk to him" },',                     -- 7 fine: a goal there
        '    { go = { 1438, 50, 50 }, when = { done = 999999 }, text = "Back to the tree" },', -- 8 never applies
        '    { go = { 1438, 50, 50 }, text = "Back to the tree" },',                             -- 9 fine: after 7
        '} })',
    }, "\n"))
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(file) }, " ") .. " 2>&1"))
    local report = pipe:read("*a")
    pipe:close()
    for _, line in ipairs({
        "[ERROR] t-trips, step 5: the same go as step 3, right before it: merge the two steps",
        "[ERROR] t-trips, step 5: the same go as step 4, right before it: merge the two steps",
        "[ERROR] t-trips, step 6: the same go as step 5, right before it: merge the two steps",
        "[WARNING] t-trips, step 6: go without text: say where the player goes, or what for",
    }) do
        T.ok(report:find(line, 1, true), "missing: " .. line .. "\n" .. report)
    end
    for _, step in ipairs({ 1, 2, 3, 4, 7, 8, 9 }) do
        T.ok(not report:find(("t-trips, step %d:"):format(step), 1, true), "step " .. step .. " is fine\n" .. report)
    end
    remove(dir)
end)

-- 174 Look To The Stars needs a Bronze Tube (4371), sold by vendors: bought first, or the
-- turn-in applies only with the item, or the player is stuck.
T.test("a turn-in that needs a carried item: bought first, or under when.item, else an error", function()
    local dir = base .. "/Carried"
    os.execute(shell((windows and "mkdir " or "mkdir -p ") .. quote(windows and dir:gsub("/", "\\") or dir)))
    local file = dir .. "/Carried.lua"
    local function guide(id, steps)
        return ('Ding.RegisterGuide({ id = "%s", title = "%s", faction = "Alliance", races = { "Human" }, '
            .. 'minLevel = 20, maxLevel = 26, steps = { %s } })'):format(id, id, steps)
    end
    write(file, table.concat({
        guide("t-stuck", '{ accept = 174 }, { turnin = 174 }'),
        guide("t-bought", '{ talk = 1448, buy = { { 4371, 1, 1448 } } }, { accept = 174 }, { turnin = 174 }'),
        guide("t-held", '{ accept = 174 }, { turnin = 174, when = { item = 4371 } }'),
        guide("t-list", '{ accept = 174, when = { item = { { 4371, 1 }, { 2589, 2 } } } }'),
        guide("t-bad", '{ accept = 174, when = { item = { "tube" } } }'),
        -- (916 Webwood Venom, done along the way: turned in once ready, no complete step needed.)
        'Ding.RegisterGuide({ id = "t-ready", title = "t-ready", faction = "Alliance", races = { "NightElf" }, '
            .. 'minLevel = 3, maxLevel = 6, steps = { { accept = 916 }, { turnin = 916, when = { ready = 916 } } } })',
    }, "\n"))
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined),
        quote(file) }, " ") .. " 2>&1"))
    local report = pipe:read("*a")
    pipe:close()
    T.ok(report:find('[ERROR] t-stuck, step 2: turns in 174 "Look To The Stars", which needs Bronze Tube (4371)', 1, true),
        report)
    T.ok(not report:find("[ERROR] t-bought", 1, true), report)
    T.ok(not report:find("[ERROR] t-held", 1, true), report)
    -- (The engine reads an id, a pair, a list of ids or a list of pairs; nothing else.)
    T.ok(not report:find("[ERROR] t-list", 1, true), report)
    T.ok(report:find("[ERROR] t-bad, step 1: when.item expects an item id, { itemId, count }, a list of ids or a list of pairs",
        1, true), report)
    T.ok(not report:find("[WARNING] t-ready, step", 1, true) and not report:find("[ERROR] t-ready", 1, true), report)
    -- (Under when.item, the turn-in needs no complete step either.)
    T.ok(not report:find("t-held, step 2: turns in 174 \"Look To The Stars\" without a complete step", 1, true), report)
    remove(dir)
end)

T.run()
