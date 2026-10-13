-- Fluidity of the guide: a trip is passed when nothing is left where it leads, the arrow
-- takes the nearest of all the step's targets, and the objectives of other quests right
-- around the player are listed "along the way" (Core/Along.lua).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L, Data, Along = Ding.Engine, Ding.Panel, Ding.L, Ding.Data, Ding.Along

-- Shadowglen (QuestieDB): 456 and 458 start at Aldrassil; 456 kills young nightsabers and
-- boars around it; 916 loots venom sacs on the Webwood Spiders of the cave to the north
-- (around 56.8, 28.8); 457 kills mangy nightsabers and thistle boars (around 60, 36).
Ding.RegisterGuide({ id = "t-trip", title = "Trip", races = { "NightElf" }, steps = {
    { accept = 456 },                         -- 1
    { go = { 1438, 40, 40 }, text = "A" },    -- 2
    { accept = 458 },                         -- 3
    { turnin = 456 },                         -- 4
} })
Ding.RegisterGuide({ id = "t-trips", title = "Trips", races = { "NightElf" }, steps = {
    { accept = 456 },                         -- 1
    { go = { 1438, 40, 40 }, text = "A" },    -- 2
    { fly = true },                           -- 3
    { go = { 1438, 30, 30 }, text = "B" },    -- 4
    { accept = 458 },                         -- 5
    { turnin = 456 },                         -- 6
} })
Ding.RegisterGuide({ id = "t-trip-trainer", title = "Trip to the trainer", races = { "NightElf" }, steps = {
    { accept = 456 },                         -- 1
    { go = { 1438, 40, 40 }, text = "A" },    -- 2
    { train = true },                         -- 3
    { accept = 458 },                         -- 4
} })
Ding.RegisterGuide({ id = "t-mixed", title = "Mixed", races = { "NightElf" }, steps = {
    { turnin = 456, complete = 916 },
} })
Ding.RegisterGuide({ id = "t-along", title = "Along", races = { "NightElf" }, steps = {
    { complete = 457 },
    { complete = 916 },
    { turnin = { 457, 916 } },
} })

local function start(guide, states, level)
    T.reset({ level = level or 4 })
    H.player.map, H.player.x, H.player.y = 1438, 58.7, 44
    T.quests(states or {})
    E:SetGuide(guide, 1, true)
    H.flush()
end

---------------------------------------------------------------------------
-- Trips
---------------------------------------------------------------------------
T.test("trip: kept while the step after it is still to do", function()
    start("t-trip", { [456] = "log" })
    T.eq(E.index, 2)
end)

T.test("trip: passed when the step after it is already done", function()
    start("t-trip", { [456] = "log", [458] = "log" })
    T.eq(E.index, 4, "the trip to an NPC whose quest is already taken stays")
    start("t-trip", { [456] = "log", [458] = "turnedin" })
    T.eq(E.index, 4)
end)

T.test("trip: passed while playing, as soon as the step after it gets done", function()
    start("t-trip", { [456] = "log" })
    H.tick(11)
    T.eq(E.index, 2)
    T.quests({ [458] = "log" })
    T.eq(E.index, 4)
end)

T.test("trips one after the other: all passed when nothing is left at the end", function()
    start("t-trips", { [456] = "log" })
    T.eq(E.index, 2)
    T.quests({ [458] = "log" })
    T.eq(E.index, 6)
end)

T.test("trip to a class trainer: kept, the trainer cannot be checked", function()
    Ding.char.early = { [458] = true }    -- taken on the way: says nothing of the player's place
    start("t-trip-trainer", { [456] = "log", [458] = "log" })
    H.tick(11)
    Ding.char.early = {}
    T.eq(E.index, 2, "a quest taken ahead passed the trip to the trainer")
end)

---------------------------------------------------------------------------
-- Nearest target
---------------------------------------------------------------------------
T.test("the arrow takes the nearest of all the step's targets, turn-in or objectives", function()
    start("t-mixed", { [456] = "ready" }, 4)
    H.accept(916); H.flush()
    local turnin = Data:EndPoints(456)
    T.ok(#turnin > 0 and #E.candidates > #turnin, "turn-in and objectives are not offered together")
    -- At the cave: the spiders first.
    H.player.x, H.player.y = 56.8, 28.8
    local point = E:NearestPoint()
    T.ok(point.area, "at the cave, the arrow does not aim at the spiders")
    -- Back at Aldrassil: the turn-in first.
    H.player.x, H.player.y = turnin[1].x, turnin[1].y
    point = E:NearestPoint()
    T.ok(not point.area and point.x == turnin[1].x and point.y == turnin[1].y, "next to the NPC, the arrow aims elsewhere")
end)

---------------------------------------------------------------------------
-- Along the way
---------------------------------------------------------------------------
local function alongRows()
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do
        if row.along then out[#out + 1] = row end
    end
    return out
end

T.test("along the way: the objective of another quest whose monsters are right here", function()
    start("t-along", {}, 4)
    H.accept(457); H.accept(916); H.flush()
    T.eq(E.index, 1)
    T.eq(#alongRows(), 0, "far from the spiders, nothing along the way")
    H.player.x, H.player.y = 56.8, 28.8    -- the cave
    H.tick(2.5)
    local rows = alongRows()
    T.eq(#rows, 1, "the spiders' objective is not listed")
    T.eq(rows[1].quest, 916)
    -- Not the red of the step's work: under a header that names the other quest and says why.
    T.eq(rows[1].state, "other")
    T.eq(rows[1].kind, "collect")
    local header
    for _, row in ipairs(P.rowsShown) do
        if row.action == "header" and row.other == "along" and row.quest == 916 then header = row end
    end
    T.ok(header, "no header for the other quest")
    local prefix = L.OTHER_ALONG:match("^(.-)%%s")
    T.ok(H.plain(header.text):find(prefix, 1, true), "no \"another quest\" mention: " .. H.plain(header.text))
    T.ok(H.plain(header.text):find(Data:QuestName(916), 1, true), "its quest is not named")
    -- The step's own rows come first.
    T.eq(P.rowsShown[1].quest, 457)
    -- A click (or A in focus mode) sends the arrow there.
    local points = P:PointsOf(rows[1])
    T.ok(#points > 0 and points[1].area, "the row does not aim at the spiders")
end)

-- Distance in yards from (x, y) to the nearest spider, with the mock's map scale (one
-- percent of x is 51 yards, one percent of y 34).
local function spiderDistance(x, y)
    local best
    for _, target in ipairs(Data:ObjectiveTargets(916)) do
        for _, p in ipairs(target.points) do
            local d = math.sqrt(((p.x - x) * 51) ^ 2 + ((p.y - y) * 34) ^ 2)
            if not best or d < best then best = d end
        end
    end
    return best
end

T.test("along the way: kept a little farther than where it appeared, then gone", function()
    start("t-along", {}, 4)
    H.accept(457); H.accept(916); H.flush()
    -- A place between 110 and 150 yards from the nearest spider, south of the cave.
    local x, y = 56.8, 28.8
    while spiderDistance(x, y) < 110 do y = y + 0.1 end
    T.ok(spiderDistance(x, y) <= 150, "no place in the band")
    H.player.x, H.player.y = x, y
    H.tick(2.5)
    T.eq(#alongRows(), 0, "listed from too far")
    H.player.x, H.player.y = 56.8, 28.8
    H.tick(2.5)
    T.eq(#alongRows(), 1, "not listed among the spiders")
    H.player.x, H.player.y = x, y
    H.tick(2.5)
    T.eq(#alongRows(), 1, "the objective left as soon as the player stepped back")
    H.player.x, H.player.y = 58.7, 44
    H.tick(2.5)
    T.eq(#alongRows(), 0, "the objective stays far from its monsters")
end)

T.test("along the way: the current step's quests and finished objectives are not repeated", function()
    start("t-along", {}, 4)
    H.accept(457); H.accept(916); H.flush()
    H.player.x, H.player.y = 59.2, 36.2      -- among the thistle boars of 457, the step's quest
    H.tick(2.5)
    for _, row in ipairs(alongRows()) do T.ok(row.quest ~= 457, "the step's quest is listed again") end
    H.player.x, H.player.y = 56.8, 28.8
    H.complete(916); H.flush()
    H.tick(2.5)
    T.eq(#alongRows(), 0, "a finished objective is listed")
end)

T.test("along the way: a client that cannot list its quest log still has the guide's quests", function()
    local getInfo = C_QuestLog.GetInfo
    C_QuestLog.GetInfo = nil    -- and the legacy GetQuestLogTitle fails, like on Forever
    local ok, err = pcall(function()
        T.eq(#Ding.Compat.LogQuests(), 0)
        start("t-along", {}, 4)
        H.accept(457); H.accept(916); H.flush()
        H.player.x, H.player.y = 56.8, 28.8
        H.tick(2.5)
        T.eq(#alongRows(), 1, "the guide's quest in the log is not listed")
    end)
    C_QuestLog.GetInfo = getInfo
    assert(ok, err)
end)

T.test("along the way: the minimized window keeps the step's own objective", function()
    start("t-along", {}, 4)
    H.accept(457); H.accept(916); H.flush()
    H.player.x, H.player.y = 56.8, 28.8
    H.tick(2.5)
    T.eq(#alongRows(), 1)
    P:SetCompact(true)
    local first
    for _, row in ipairs(P:Rows()) do
        if row.state == "todo" then first = first or row end
    end
    T.eq(first.quest, 457)
    T.eq(H.plain(P.frame.mini.text.text), H.plain(first.text))
    P:SetCompact(false)
end)

T.run()
