-- Guide flow: persistent objectives (`sticky`), the section wrap-up past its levels, the
-- preview of the next steps, and the minimap pins (UI/MinimapPins.lua).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L

---------------------------------------------------------------------------
-- Persistent objectives
---------------------------------------------------------------------------
-- 456 kills young nightsabers and boars around Aldrassil; 916 loots spiders in the cave.
Ding.RegisterGuide({ id = "t-sticky", title = "Sticky", races = { "NightElf" }, steps = {
    { accept = 456, sticky = 456 },     -- 1
    { accept = 458 },                   -- 2
    { go = { 1438, 40, 40 } },          -- 3
    { complete = 456 },                 -- 4
    { turnin = 456 },                   -- 5
} })

local function start(guide, level)
    H.closeDialog()
    T.reset({ level = level or 5 })
    H.player.map, H.player.x, H.player.y = 1438, 40, 80    -- far from Aldrassil
    E:SetGuide(guide, 1, true); H.flush()
    H.tick(11)
end

local function rows(filter)
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do
        if filter(row) then out[#out + 1] = row end
    end
    return out
end

T.test("sticky: the quest's objectives under every following step, wherever the player is", function()
    start("t-sticky")
    H.accept(456); H.flush(); H.tick(2)
    T.eq(E.index, 2)
    T.eq(Ding.char.sticky[456], true)
    local sticky = rows(function(r) return r.sticky end)
    T.ok(#sticky >= 1, "the sticky objectives are not listed far from their monsters")
    T.eq(sticky[1].quest, 456)
    T.ok(H.plain(sticky[1].sub):find(L.STICKY_WAY, 1, true), "no \"Still to do\": " .. H.plain(sticky[1].sub or ""))
    -- Its own step does not repeat them.
    E.index = 4; E:Refresh()
    T.eq(#rows(function(r) return r.along and r.quest == 456 end), 0, "repeated under its own step")
end)

T.test("sticky: no duplicate with the along-the-way rows near the monsters", function()
    start("t-sticky")
    H.accept(456); H.flush()
    H.player.x, H.player.y = 58.7, 43.3     -- among the young boars
    H.tick(2.5)
    local seen = {}
    for _, row in ipairs(rows(function(r) return r.along end)) do
        local key = row.quest .. ":" .. row.index
        T.ok(not seen[key], "objective listed twice: " .. key)
        seen[key] = true
    end
end)

T.test("sticky: gone once ready, forgotten once turned in", function()
    start("t-sticky")
    H.accept(456); H.flush(); H.tick(2)
    T.quests({ [456] = "ready" })
    T.eq(#rows(function(r) return r.sticky end), 0, "still listed once ready")
    T.quests({ [456] = "turnedin" })
    E:Refresh()
    T.eq(Ding.char.sticky[456], nil, "still remembered once turned in")
end)

T.test("sticky: low-priority arrow targets, only on steps with quests", function()
    start("t-sticky")
    H.accept(456); H.flush(); H.tick(2)
    local low = 0
    for _, p in ipairs(E.candidates) do if p.low then low = low + 1 end end
    T.ok(low > 0, "no low-priority target on a quest step")
    E.index = 3; E:Refresh()
    for _, p in ipairs(E.candidates) do T.ok(not p.low, "a sticky target on a go step") end
    -- Twice as far plus 300 yards: chosen only when right there.
    H.player.x, H.player.y = 50, 50
    local near = { map = 1438, x = 50, y = 51, low = true }      -- 34 yards
    local far = { map = 1438, x = 50, y = 62 }                   -- 408 yards
    T.eq(E:NearestPoint({ near, far }), near)
    local closer = { map = 1438, x = 50, y = 55 }                -- 170 yards
    T.eq(E:NearestPoint({ near, closer }), closer)
end)

---------------------------------------------------------------------------
-- Section wrap-up
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-wrap", title = "Wrap", races = { "NightElf" }, minLevel = 1, maxLevel = 5,
    next = "t-wrap-2", steps = {
        { accept = 456 },     -- 1
        { turnin = 456 },     -- 2
        { accept = 458 },     -- 3
        { turnin = 458 },     -- 4
    } })
Ding.RegisterGuide({ id = "t-wrap-2", title = "Wrap next", races = { "NightElf" }, minLevel = 5, maxLevel = 10,
    steps = { { accept = 916 } } })

local function wrapRows()
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do
        if row.action == "wrapup" then out[row.wrap] = row end
    end
    return out
end

local function startWrap(level)
    start("t-wrap", level)
    T.quests({ [456] = "ready" })
    H.tick(2)
end

T.test("wrap-up: past the section's levels, three choices under the step", function()
    startWrap(5)
    T.eq(next(wrapRows()), nil, "offered at the section's own level")
    startWrap(7)
    local w = wrapRows()
    T.ok(w.next and w.turnin and w.stay, "missing choices")
    T.eq(H.plain(w.next.text), L.WRAP_NEXT:format("Wrap next"))
    T.eq(H.plain(w.turnin.text), L.WRAP_TURNIN:format(1))
end)

T.test("wrap-up: \"Next section\" goes on to it", function()
    startWrap(7)
    P:Aim(wrapRows().next)
    T.eq(E.guide.id, "t-wrap-2")
end)

T.test("wrap-up: \"Turn in first\": only the turn-ins of quests in the log, then the next section", function()
    startWrap(7)
    P:Aim(wrapRows().turnin)
    T.eq(E.index, 2, "not on the turn-in")
    T.eq(next(wrapRows()), nil, "the choices stay")
    T.quests({ [456] = "turnedin" })
    T.eq(E.guide.id, "t-wrap-2", "the accept of 458 was not passed, or no next section")
    T.eq(Ding.char.wrapUp, nil)
end)

T.test("wrap-up: \"Stay\" is remembered for the section", function()
    startWrap(7)
    P:Aim(wrapRows().stay)
    T.eq(next(wrapRows()), nil)
    T.eq(E.guide.id, "t-wrap")
    T.ok(Ding.char.stay["t-wrap"])
    Ding.char.stay = nil
end)

T.test("wrap-up: with the gamepad, A on the row in focus mode", function()
    startWrap(7)
    P:StartFocus()
    for i, row in ipairs(P.rowsShown) do
        if row.action == "wrapup" and row.wrap == "next" then P.focusIndex = i end
    end
    H.press("PAD1")
    T.eq(E.guide.id, "t-wrap-2")
    P:StopFocus()
end)

---------------------------------------------------------------------------
-- Next steps preview
---------------------------------------------------------------------------
T.test("preview: one to three dimmed lines of the next steps, off by default", function()
    start("t-sticky")
    T.eq(Ding.DEFAULTS.panel.preview, 0)
    T.eq(#rows(function(r) return r.preview end), 0)
    Ding.db.panel.preview = 2
    E:Refresh()
    local preview = rows(function(r) return r.preview end)
    T.eq(#preview, 2)
    T.eq(preview[1].state, "preview")
    T.eq(H.plain(preview[1].text), H.plain(P:Rows({ E:Describe(Ding:GetGuide("t-sticky").steps[2], true)[1] })[1].text))
    T.ok(P.rowsShown[#P.rowsShown].preview, "the preview is not last")
    Ding.db.panel.preview = 0
end)

T.test("preview and pins: settings rows in the Guide and the Arrow and maps tabs", function()
    start("t-sticky")
    local C = Ding.Config
    local function labels(key)
        C:Open(key); H.flush()
        local found = {}
        for _, row in ipairs(C.TABS[C.TAB[key]].rows) do
            if row.opts then found[row.opts.label] = row end
        end
        return found
    end
    T.ok(labels("guide")[L.PREVIEW], "no preview row in the Guide tab")
    T.ok(labels("arrow")[L.MINIMAP_PINS], "no pins row in the Arrow and maps tab")
    C:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Minimap pins
---------------------------------------------------------------------------
local MP = Ding.MinimapPins
local function magnitude(f)
    local p = f.points[1]
    return math.sqrt(p[4] ^ 2 + p[5] ^ 2)
end

Ding.RegisterGuide({ id = "t-pins", title = "Pins", races = { "NightElf" }, steps = {
    { go = { 1438, 50, 53 }, text = "Near" },
    { go = { 1438, 50, 90 }, text = "Far" },
} })

T.test("pins: the target on the minimap, at its distance", function()
    start("t-pins")
    H.player.x, H.player.y = 50, 50
    A.point = nil; A:Tick()
    MP:Update()
    T.ok(MP.target:IsShown() and not MP.edge:IsShown(), "no target pin")
    -- 3 percent of y = 102 yards; the minimap shows 233 yards around (radius 70 units).
    T.ok(math.abs(magnitude(MP.target) - 102 * 70 / (466 + 2 / 3) * 2) < 1, "wrong distance on the minimap")
end)

T.test("pins: an arrow on the edge when the target is farther", function()
    start("t-pins")
    H.player.x, H.player.y = 50, 50
    E.index = 2; E:Refresh()
    A.point = nil; A:Tick()
    MP:Update()
    T.ok(MP.edge:IsShown() and not MP.target:IsShown(), "no edge arrow")
    T.ok(math.abs(magnitude(MP.edge) - 64) < 0.01, "the edge arrow is not on the rim")
end)

T.test("pins: hidden in instances, with the option off, with the guide window closed", function()
    start("t-pins")
    H.player.x, H.player.y = 50, 50
    A.point = nil; A:Tick()
    H.setInstance(true)
    MP:Update()
    T.ok(not MP.target:IsShown(), "pins in an instance")
    H.setInstance(false)
    Ding.db.minimap.pins = false
    MP:Update()
    T.ok(not MP.target:IsShown(), "pins with the option off")
    Ding.db.minimap.pins = true
    P:SetShown(false)
    MP:Update()
    T.ok(not MP.target:IsShown(), "pins with the window closed")
    P:SetShown(true)
end)

T.test("pins: the step's nearest spots as dots", function()
    start("t-sticky")
    H.accept(456); H.flush()
    E.index = 4; E:Refresh()
    H.player.x, H.player.y = 58.7, 43.3
    A.point = nil; A:Tick()
    MP:Update()
    local dots = 0
    for _, d in ipairs(MP.dots) do if d:IsShown() then dots = dots + 1 end end
    T.ok(dots > 0, "no dots among the young boars")
end)

---------------------------------------------------------------------------
-- Cycling the arrow through the step's targets
---------------------------------------------------------------------------
Ding.RegisterGuide({ id = "t-cycle", title = "Cycle", races = { "NightElf" }, steps = {
    { accept = 458, turnin = 456 },
} })

T.test("cycle: the binding moves the arrow row after row, then back to the nearest", function()
    start("t-cycle")
    T.quests({ [456] = "ready" })
    T.eq(_G.BINDING_NAME_DING_CYCLE, L.BIND_CYCLE)
    local stops = {}
    for i, row in ipairs(P.rowsShown) do
        if #P:PointsOf(row) > 0 then stops[#stops + 1] = i end
    end
    T.eq(#stops, 2, "two rows with a target")
    P:CycleTarget()
    T.eq(A.forced and A.forced.points[1].label, P:PointsOf(P.rowsShown[stops[1]])[1].label)
    P:StartFocus()
    P:CycleTarget()
    T.eq(P.focusIndex, stops[2], "the focus does not follow")
    T.eq(A.forced.points[1].label, P:PointsOf(P.rowsShown[stops[2]])[1].label)
    P:CycleTarget()
    T.eq(A.forced, nil, "not back to the nearest after the last row")
    P:StopFocus()
end)

---------------------------------------------------------------------------
-- Farming loop
---------------------------------------------------------------------------
local function atSpawn(npc)
    local best
    for _, p in ipairs(E.candidates) do
        if p.npc == npc and not best then best = p end
    end
    return best
end

T.test("loop: among the spawns, the arrow goes from stop to stop and around", function()
    start("t-sticky")
    H.accept(456); H.flush()
    E.index = 4; E:Refresh()
    local spawn = atSpawn(2031)
    T.ok(spawn, "no spawn of the young nightsabers")
    H.player.map, H.player.x, H.player.y = spawn.map, spawn.x, spawn.y
    A.point = nil; A:Tick()
    local farm = A.farm
    T.ok(farm and #farm.points >= 3, "no loop among the spawns")
    T.eq(H.plain(A.frame.label:GetText()), L.FARM_LOOP:format(spawn.label, farm.at, #farm.points))
    T.ok(A.state ~= "arrived", "the loop arrives")
    -- Each stop reached: the next one, then the first again.
    local seen = {}
    for _ = 1, #farm.points + 1 do
        local stop = farm.points[farm.at]
        seen[#seen + 1] = farm.at
        H.player.map, H.player.x, H.player.y = stop.map, stop.x, stop.y
        A.point = nil; A:Tick()
    end
    T.eq(seen[#seen], seen[1], "the loop does not come back: " .. table.concat(seen, ","))
    -- The minimap shows the loop's stops.
    MP:Update()
    local dots = 0
    for _, d in ipairs(MP.dots) do if d:IsShown() then dots = dots + 1 end end
    T.ok(dots >= math.min(#farm.points - 1, 2), "the stops are not on the minimap")
end)

T.test("loop: off by its option, and gone out of the area", function()
    start("t-sticky")
    H.accept(456); H.flush()
    E.index = 4; E:Refresh()
    local spawn = atSpawn(2031)
    Ding.db.arrow.loop = false
    H.player.map, H.player.x, H.player.y = spawn.map, spawn.x, spawn.y
    A.point = nil; A:Tick()
    T.eq(A.farm, nil, "a loop with the option off")
    Ding.db.arrow.loop = true
    A.point = nil; A:Tick()
    T.ok(A.farm, "no loop")
    H.player.map, H.player.x, H.player.y = 1438, 40, 80
    A.point = nil; A:Tick()
    T.eq(A.farm, nil, "the loop stays far from the area")
end)

T.run()
