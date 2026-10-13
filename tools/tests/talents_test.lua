-- Talent advisor (Core/Talents.lua): builds registered per class, the next talent of the
-- build when a point is free, learned on a confirmed press (gamepad and mouse), out of
-- combat; the build picked in the Automation tab.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L, TA = Ding.Engine, Ding.Panel, Ding.L, Ding.Talents

Ding.RegisterGuide({ id = "t-talents", title = "Talents", races = { "NightElf" }, steps = {
    { level = 60 },
} })

-- On the mock's tree: Sharp Edge (1,1,1) x3, Thick Skin (1,1,2) x2, then Quick Hands (1,2,1).
Ding.RegisterTalentBuild({ id = "t-warrior", class = "WARRIOR", title = "Test build", picks = {
    { 1, 1, 1 }, { 1, 1, 1 }, { 1, 1, 1 }, { 1, 1, 2 }, { 1, 1, 2 }, { 1, 2, 1 }, { 1, 2, 1 },
} })
Ding.RegisterTalentBuild({ id = "t-warrior-2", class = "WARRIOR", title = "Other build", picks = {
    { 2, 1, 1 },
} })
Ding.RegisterTalentBuild({ id = "t-mage", class = "MAGE", title = "Mage build", picks = {
    { 3, 1, 2 },
} })

local function start(opts)
    opts = opts or {}
    T.reset({ level = opts.level or 12, class = opts.class or "WARRIOR" })
    E:SetGuide("t-talents", 1, true); H.flush()
    H.tick(2)
end

local function talentRow()
    for i, row in ipairs(P.rowsShown or {}) do
        if row.action == "talent" then return row, i end
    end
end

local function messages(fn)
    local lines = {}
    local print = Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = msg end
    local ok, err = pcall(fn)
    Ding.Print = print
    assert(ok, err)
    return lines
end

T.test("register: a build needs an id, a class and { tab, tier, column } picks", function()
    T.fails(function() Ding.RegisterTalentBuild({ class = "WARRIOR", picks = { { 1, 1, 1 } } }) end, "id is required")
    T.fails(function() Ding.RegisterTalentBuild({ id = "x", picks = { { 1, 1, 1 } } }) end, "class is required")
    T.fails(function() Ding.RegisterTalentBuild({ id = "x", class = "WARRIOR", picks = {} }) end, "picks are required")
    T.fails(function() Ding.RegisterTalentBuild({ id = "x", class = "WARRIOR", picks = { { 1, 1 } } }) end,
        "pick 1: { tab, tier, column } expected")
    T.fails(function() Ding.RegisterTalentBuild({ id = "off", class = "WARRIOR", picks = { { 1, 1, 1 } } }) end,
        "not a valid id")
end)

T.test("no free point, no suggestion; a free point: the build's next talent, rank after rank", function()
    start()
    T.eq(TA:Suggestion(), nil)
    T.eq(talentRow(), nil)
    H.setTalentPoints(1); H.flush()
    local s = TA:Suggestion()
    T.eq(s and s.name, "Sharp Edge")
    local row = talentRow()
    T.ok(row, "no talent row")
    T.eq(row.text, L.TALENT_ROW:format("Sharp Edge"))
    T.eq(row.counter, "1/3")
    H.setTalentRank(1, 1, 3)
    T.eq(TA:Suggestion().name, "Thick Skin", "the talent at its build's rank is not passed")
    H.setTalentRank(1, 2, 2)
    T.eq(TA:Suggestion().name, "Quick Hands")
    H.setTalentRank(1, 3, 2)
    T.eq(TA:Suggestion(), nil, "a suggestion past the end of the build")
end)

T.test("points spent elsewhere: a pick out of reach waits, the next one comes", function()
    start()
    H.setTalentPoints(1)
    -- Sharp Edge and Thick Skin done, but only 4 points in the tree: tier 2 stays closed.
    H.setTalentRank(1, 1, 2); H.setTalentRank(1, 2, 2)
    local s = TA:Suggestion()
    T.eq(s and s.name, "Sharp Edge", "the missing rank first")
    H.setTalentRank(1, 1, 3)
    T.eq(TA:Suggestion().name, "Quick Hands", "tier 2 opens with 5 points")
    H.setTalentRank(1, 1, 2)
    Ding.RegisterTalentBuild({ id = "t-locked", class = "WARRIOR",
        picks = { { 1, 2, 1 }, { 1, 1, 1 }, { 1, 1, 1 }, { 1, 1, 1 } } })
    Ding.char.talentBuild = "t-locked"
    T.eq(TA:Suggestion().name, "Sharp Edge", "a closed tier blocks the rest of the build")
end)

T.test("gamepad: A on the row asks to confirm, A again learns it", function()
    start()
    H.setTalentPoints(2); H.flush()
    P:StartFocus()
    local _, index = talentRow()
    P.focusIndex = index
    local pad = Ding.Gamepad:ButtonName("PAD1")
    T.eq(talentRow().sub, L.TALENT_ROW_PAD:format(pad))
    H.press("PAD1")
    T.eq(#H.talentCalls(), 0, "learned on the first press")
    T.eq(talentRow().sub, L.TALENT_CONFIRM_PAD:format(pad))
    local lines = messages(function() H.press("PAD1") end)
    T.eq(table.concat(H.talentCalls(), ","), "1:1")
    T.eq(H.talentRank(1, 1), 1)
    T.eq(lines[1], L.TALENT_LEARNED:format("Sharp Edge"))
    -- The next point: armed again from scratch.
    local row = talentRow()
    T.eq(row and row.counter, "2/3")
    T.eq(row.sub, L.TALENT_ROW_PAD:format(pad))
    P:StopFocus()
end)

T.test("mouse: click, then click again; the confirmation expires", function()
    start()
    H.setGamepadConnected(false)
    H.setTalentPoints(1); H.flush()
    local _, index = talentRow()
    local frameRow = P.frame.rows[index]
    frameRow.scripts.OnClick(frameRow, "LeftButton"); H.flush()
    T.eq(talentRow().sub, L.TALENT_CONFIRM_MOUSE)
    H.tick(TA.CONFIRM_WINDOW + 1)
    T.eq(talentRow().sub, L.TALENT_ROW_MOUSE, "the confirmation stays")
    frameRow.scripts.OnClick(frameRow, "LeftButton"); H.flush()
    T.eq(#H.talentCalls(), 0, "learned after the confirmation expired")
    frameRow.scripts.OnClick(frameRow, "LeftButton"); H.flush()
    T.eq(H.talentRank(1, 1), 1)
    T.eq(talentRow(), nil, "the row stays without a free point")
    H.setGamepadConnected(true)
end)

T.test("in combat: never learned", function()
    start()
    H.setTalentPoints(1); H.flush()
    local s = TA:Suggestion()
    TA:Press(s)
    H.setCombat(true)
    local lines = messages(function() TA:Press(s) end)
    T.eq(#H.talentCalls(), 0)
    T.eq(lines[1], L.TALENT_COMBAT)
    H.setCombat(false)
end)

T.test("settings: the class's builds and None; another class's build is never used", function()
    start()
    H.setTalentPoints(1); H.flush()
    T.eq(TA:Active().id, "t-warrior", "the class's first build by default")
    local ids = {}
    for _, b in ipairs(TA:ForClass()) do ids[#ids + 1] = b.id end
    T.ok(table.concat(ids, ","):find("t-warrior,t-warrior-2", 1, true), "builds: " .. table.concat(ids, ","))
    Ding.char.talentBuild = "t-warrior-2"
    T.eq(TA:Suggestion().name, "Iron Will")
    Ding.char.talentBuild = "t-mage"
    T.eq(TA:Active().id, "t-warrior", "a mage build for a warrior")
    Ding.char.talentBuild = "off"
    P:Update()
    T.eq(TA:Suggestion(), nil)
    T.eq(talentRow(), nil)
    -- The selector of the Automation tab.
    Ding.char.talentBuild = nil
    local C = Ding.Config
    C:Open("automation")
    local found
    for _, r in ipairs(C.TABS[C.TAB.automation].rows or {}) do
        if r.opts and r.opts.label == L.TALENT_BUILD then found = r end
    end
    T.ok(found, "no talent build row in the Automation tab")
    local values = {}
    for _, v in ipairs(found.opts.values) do values[#values + 1] = v[1] end
    T.eq(values[#values], "off")
    found.opts.set("off")
    T.eq(Ding.char.talentBuild, "off")
    C:Close()
end)

T.test("a class without builds: nothing shows, no row in the settings either", function()
    start({ class = "ROGUE" })
    H.setTalentPoints(1); H.flush()
    T.eq(TA:Active(), nil)
    T.eq(talentRow(), nil)
    local C = Ding.Config
    C:Open("automation")
    for _, r in ipairs(C.TABS[C.TAB.automation].rows or {}) do
        T.ok(not (r.opts and r.opts.label == L.TALENT_BUILD), "a talent build row without a build")
    end
    C:Close()
end)

T.run()
