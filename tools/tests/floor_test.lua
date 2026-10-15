-- Floors (step key `floor`, docs/guide-packs.md): the game gives no height, so a target one
-- floor up used to read "You're here" downstairs. With `floor`, the arrow says the floor on
-- arrival and stays, and adds it to the detail line near the target; the import takes the
-- key, check_guides rejects a bad value, and tools/guide_floor.lua reads it from a note.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, A, L = Ding.Engine, Ding.Arrow, Ding.L
local Text, I = Ding.GuideText, Ding.Import
local Floor = dofile(tools .. "/guide_floor.lua")
local f = A.frame

Ding.RegisterGuide({ id = "t-floor", title = "Floors", races = { "NightElf" }, steps = {
    { accept = 456, floor = "up" },
    { level = 60 },
} })
Ding.RegisterGuide({ id = "t-floor-none", title = "No floor", races = { "NightElf" }, steps = {
    { accept = 456 },
    { level = 60 },
} })
Ding.RegisterGuide({ id = "t-floor-down", title = "Down", races = { "NightElf" }, steps = {
    { accept = 456, floor = "down" },
    { level = 60 },
} })

-- The player at `dx` map units east of the quest giver of 456 (1 % of map x: 51 yards).
local function at(guide, dx)
    A.forced = nil
    T.reset({ level = 1 })
    Ding.db.arrow.shown = true
    local npc = Ding.Data:StartPoints(456)[1]
    T.ok(npc, "no quest giver for 456")
    H.player.map, H.player.x, H.player.y = npc.map, npc.x + (dx or 0), npc.y
    E:SetGuide(guide, 1, true)
    H.tick(0.5)
    return npc
end

T.test("arrived on a step with floor = \"up\": the floor instead of \"You're here\", and the arrow stays", function()
    at("t-floor")
    T.eq(A.state, "arrived")
    T.eq(f.distance:GetText(), L.FLOOR_NPC_UP)
    T.ok(f:IsShown(), "arrow hidden right away")
    H.tick(3.5)
    T.ok(f:IsShown(), "the arrow faded after 3 s: the player still has to find the stairs")
    T.eq(f.distance:GetText(), L.FLOOR_NPC_UP)
end)

T.test("without floor: \"You're here\" as before, and the arrow fades after 3 s", function()
    at("t-floor-none")
    T.eq(A.state, "arrived")
    T.eq(f.distance:GetText(), L.ARRIVED)
    H.tick(3.5)
    T.ok(not f:IsShown(), "no fade after 3 s")
end)

T.test("near the target (under 30 yards) the detail line says the floor; farther, it does not", function()
    at("t-floor", 0.4)      -- about 20 yards
    T.ok(A.state ~= "arrived", "arrived at 20 yards")
    T.ok(f.detail:IsShown(), "no detail line near the target")
    T.ok(tostring(f.detail:GetText()):find(L.FLOOR_NEAR_UP, 1, true), "detail: " .. tostring(f.detail:GetText()))
    at("t-floor", 1.0)      -- about 51 yards
    T.ok(not (f.detail:IsShown() and tostring(f.detail:GetText()):find(L.FLOOR_NEAR_UP, 1, true)),
        "the floor shown 51 yards away")
    at("t-floor-none", 0.4)
    T.ok(not (f.detail:IsShown() and tostring(f.detail:GetText()):find(L.FLOOR_NEAR_UP, 1, true)),
        "a floor without the key")
end)

T.test("an object or a place: \"It's one floor down\"", function()
    local npc = at("t-floor-down")
    T.eq(f.distance:GetText(), L.FLOOR_NPC_DOWN)
    A:Focus({ { map = npc.map, x = npc.x, y = npc.y, label = "Chest" } })
    H.tick(0.2)
    T.eq(A.state, "arrived")
    T.eq(f.distance:GetText(), L.FLOOR_IT_DOWN)
    A:Unfocus()
end)

T.test("the arrow faded on the step before at the same place: a floor brings it back", function()
    at("t-floor-none")
    H.tick(3.5)
    T.ok(not f:IsShown(), "no fade after 3 s")
    E:SetGuide("t-floor", 1, true)
    H.tick(0.5)
    T.ok(f:IsShown(), "the floor is not shown")
    T.eq(f.distance:GetText(), L.FLOOR_NPC_UP)
end)

T.test("the texts exist in every language, plain words", function()
    for _, k in ipairs({ "FLOOR_NPC_UP", "FLOOR_NPC_TOP", "FLOOR_NPC_DOWN", "FLOOR_IT_UP", "FLOOR_IT_TOP",
        "FLOOR_IT_DOWN", "FLOOR_NEAR_UP", "FLOOR_NEAR_TOP", "FLOOR_NEAR_DOWN" }) do
        T.ok(type(L[k]) == "string" and L[k] ~= "" and L[k] ~= k, k)
    end
end)

---------------------------------------------------------------------------
-- The key in guides
---------------------------------------------------------------------------
local function check(text)
    return I:Check(assert(Text.Parse(text)))
end

T.test("the import takes floor = \"up\" and refuses another value", function()
    local plan, report = check('{ title = "Floors", steps = { { accept = 456, floor = "up" } } }')
    T.ok(plan, table.concat(report.errors, "\n"))
    T.eq(#report.errors, 0)
    plan, report = check('{ title = "Floors", steps = { { accept = 456, floor = "left" } } }')
    T.eq(plan, nil, "a floor \"left\" imported")
    local wanted = L.IMPORT_STEP:format(1, L.IMPORT_EXPECTS:format("floor", '"up" / "top" / "down"'))
    local found = false
    for _, e in ipairs(report.errors) do found = found or e == wanted end
    T.ok(found, "missing: " .. wanted .. "\n" .. table.concat(report.errors, "\n"))
    T.ok(I.STEP_KEYS.floor, "floor missing from Import.STEP_KEYS")
end)

T.test("check_guides: a bad value is an error, a note that names a floor without the key a warning", function()
    local windows = package.config:sub(1, 1) == "\\"
    local function quote(s)
        if windows then return '"' .. s .. '"' end
        return "'" .. s:gsub("'", "'\\''") .. "'"
    end
    local lua = "lua5.1"
    local i = -1
    while arg[i] do lua = arg[i]; i = i - 1 end
    local temp = (os.getenv("TMPDIR") or os.getenv("TEMP") or os.getenv("TMP") or "/tmp"):gsub("\\", "/")
    local file = ("%s/ding_floor_test_%d.lua"):format(temp, os.time())
    local out = assert(io.open(file, "w"))
    out:write(table.concat({
        'Ding.RegisterGuide({ id = "t-floors", title = "Floors", faction = "Alliance", races = { "NightElf" },',
        '    minLevel = 1, maxLevel = 6, steps = {',
        '        { accept = 456, floor = "left" },',
        '        { accept = 458, note = "The NPC is indoors, one floor up." },',
        '        { turnin = 456, floor = "up", note = "The NPC is indoors, one floor up." },',
        '        { turnin = 458, note = "Check each of the two floors indoors." },',
        '} })',
    }, "\n"))
    out:close()
    local command = table.concat({ quote(lua), quote(tools .. "/check_guides.lua"), quote(T.combined), quote(file) }, " ")
    local pipe = io.popen((windows and ('"' .. command .. '"') or command) .. " 2>&1")
    local report = pipe:read("*a")
    pipe:close()
    os.remove(file)
    T.ok(report:find('[ERROR] t-floors, step 1: floor expects "up", "top" or "down"', 1, true), report)
    T.ok(report:find('[WARNING] t-floors, step 2: the note names a floor: floor = "up"', 1, true), report)
    for _, step in ipairs({ 3, 4 }) do       -- the key the note names; a note with two floors
        for _, what in ipairs({ "floor expects", "the note names a floor" }) do
            T.ok(not report:find(("t-floors, step %d: %s"):format(step, what), 1, true), report)
        end
    end
    T.ok(not report:find("unknown step key", 1, true), report)
end)

T.test("guide_floor: the note's floor, none when it names two", function()
    T.eq(Floor.of("The NPC is indoors, one floor up."), "up")
    T.eq(Floor.of("The NPC is upstairs, out on the balcony."), "up")
    T.eq(Floor.of("Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."), "up")
    T.eq(Floor.of("The NPC waits on the tower's highest floor."), "top")
    T.eq(Floor.of("Climb to the highest floor of the building."), "top")
    T.eq(Floor.of("Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."), "down")
    T.eq(Floor.of("This is below ground, on the crypt's lower floor."), "down")
    T.eq(Floor.of("The target is deep in the cave, on its lowest floor."), "down")
    T.eq(Floor.of("The NPC waits on the lower level, indoors."), "down")
    T.eq(Floor.of("Check each of the two floors indoors."), nil)
    T.eq(Floor.of("Search the upper and lower floors of the cavern."), nil)
    T.eq(Floor.of("The NPC stands one level over the crypt. The NPC waits on the lower level, indoors."), nil)
    T.eq(Floor.of("In the Engineering Labs, on the lowest floor. Keep to Launch Bay's top floor."), nil)
    T.eq(Floor.of("The targets are on the cave floor."), nil)
    T.eq(Floor.of(nil), nil)
end)

-- The guide files of Ding - Leveling (written by tools/write_leveling.lua) and of the class
-- quests (by hand), read without the addon.
local function guideFiles()
    local files = {}
    for line in io.lines(tools .. "/../Ding/Ding.toc") do
        local path = line:match("^(Guides\\[^\r]+%.lua)")
        if path and (path:find("^Guides\\Leveling\\") or path:find("^Guides\\Class\\")) then
            files[#files + 1] = (path:gsub("\\", "/"))
        end
    end
    return files
end

T.test("Leveling and class quests: a step whose note names a floor carries it, never a go step", function()
    local counts = {}
    local files = guideFiles()
    T.ok(#files > 80, "guide files: " .. #files)
    for _, file in ipairs(files) do
        local def
        local saved = _G.Ding
        _G.Ding = { RegisterGuide = function(d) def = d end }
        dofile(tools .. "/../Ding/" .. file)
        _G.Ding = saved
        for i, step in ipairs(def.steps) do
            local named = not step.go and Floor.of(step.note)
            T.eq(step.floor, named or nil, ("%s, step %d"):format(def.id, i))
            if step.floor then counts[step.floor] = (counts[step.floor] or 0) + 1 end
        end
    end
    T.ok((counts.up or 0) > 200 and (counts.top or 0) > 50 and (counts.down or 0) > 50,
        ("floors: up %d, top %d, down %d"):format(counts.up or 0, counts.top or 0, counts.down or 0))
end)

T.run()
