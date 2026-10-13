-- Guide registry: validation of guide files, matching a character, first guide choice.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { "leveling-a03-night-elf-starter", "nightelf-01-shadowglen",
    "leveling-s01-skyborne-alliance", "leveling-s02-skyborne-horde" } })
local Ding = T.Ding

local function guide(def)
    def.steps = def.steps or { { accept = 456 } }
    return Ding.RegisterGuide(def)
end

T.test("a single value becomes a list", function()
    local g = guide({ id = "t-list", races = "Gnome", steps = { { accept = 1, races = "Troll" } } })
    T.eq(type(g.races), "table")
    T.eq(g.races[1], "Gnome")
    T.eq(g.steps[1].accept[1], 1)
    T.eq(g.steps[1].races[1], "Troll")
end)

T.test("default values: title, levels", function()
    local g = guide({ id = "t-defaults" })
    T.eq(g.title, "t-defaults")
    T.eq(g.minLevel, 1)
    T.eq(g.maxLevel, 60)
end)

T.test("a malformed guide is rejected with a clear message", function()
    T.fails(function() Ding.RegisterGuide("x") end, "expects a table")
    T.fails(function() Ding.RegisterGuide({ steps = { {} } }) end, "id is required")
    T.fails(function() Ding.RegisterGuide({ id = "t-empty", steps = {} }) end, "steps are required")
    T.fails(function() guide({ id = "t-bad-quest", steps = { { accept = "456" } } }) end, "expects quest ids")
    T.fails(function() guide({ id = "t-bad-go", steps = { { go = { 1438, 50 } } } }) end, "go = { uiMapId, x, y }")
end)

T.test("a rejected guide does not appear in the list", function()
    for id in Ding:IterateGuides() do
        T.ok(id ~= "t-bad-quest" and id ~= "t-empty", "rejected guide registered: " .. id)
    end
end)

T.test("re-registering a guide replaces it without a duplicate in the list", function()
    guide({ id = "t-twice", title = "A" })
    guide({ id = "t-twice", title = "B" })
    local count = 0
    for id in Ding:IterateGuides() do if id == "t-twice" then count = count + 1 end end
    T.eq(count, 1)
    T.eq(Ding:GetGuide("t-twice").title, "B")
end)

T.test("matching: faction, race and class", function()
    T.reset({ race = "NightElf", class = "HUNTER", faction = "Alliance" })
    T.ok(Ding:GuideMatchesPlayer({ faction = "Alliance", races = { "NightElf" } }), "Night Elf rejected")
    T.ok(not Ding:GuideMatchesPlayer({ faction = "Horde" }), "faction ignored")
    T.ok(not Ding:GuideMatchesPlayer({ races = { "Human" } }), "race ignored")
    T.ok(not Ding:GuideMatchesPlayer({ classes = { "MAGE" } }), "class ignored")
    T.ok(Ding:GuideMatchesPlayer({ classes = { "HUNTER", "MAGE" } }), "class in the list rejected")
    T.ok(Ding:GuideMatchesPlayer({}), "guide without restrictions rejected")
end)

T.test("steps restricted to a race or a class", function()
    T.reset({ race = "NightElf", class = "HUNTER" })
    T.ok(Ding:StepMatchesPlayer({ classes = { "HUNTER" } }))
    T.ok(not Ding:StepMatchesPlayer({ races = { "Dwarf" } }))
end)

T.test("first guide: the race's guide at the right level", function()
    T.reset({ race = "NightElf", level = 3 })
    -- Ding - Leveling by default; Ding - Zones when that pack is asked for.
    T.eq(Ding:SuggestGuide().id, "leveling-a03-night-elf-starter")
    T.eq(Ding:SuggestGuide(Ding.ZONES_PACK).id, "nightelf-01-shadowglen")
end)

T.test("first guide: a Skyborne gets the Skyborne start of its side", function()
    local START = { Alliance = "leveling-s01-skyborne-alliance", Horde = "leveling-s02-skyborne-horde" }
    for _, faction in ipairs({ "Alliance", "Horde" }) do
        T.reset({ race = "Skyborne", faction = faction, level = 1 })
        T.eq(Ding:SuggestGuide().id, START[faction], faction)
    end
end)

T.test("first guide: none for a race without a guide", function()
    T.reset({ race = "Orc", faction = "Horde" })
    -- Test guides without a race match everyone: only race-specific guides matter here.
    local g = Ding:SuggestGuide()
    T.ok(g == nil or g.races == nil, "guide for another race suggested: " .. tostring(g and g.id))
end)

T.run()
