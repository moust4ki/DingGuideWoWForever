-- Guide tab, second dropdown: every section of the active pack (here Ding's Zones pack, the
-- one of Shadowglen, where the test guides go), chosen with the gamepad or the mouse. The
-- packs: guide_packs_test.lua.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, C = Ding.Engine, Ding.Config
local G = "nightelf-01-shadowglen"
local press = H.press

-- Test guides: one for another faction, then enough to need scrolling.
Ding.RegisterGuide({ id = "t-orc", pack = Ding.ZONES_PACK, title = "Valley of Trials", faction = "Horde",
    races = { "Orc" }, minLevel = 1, maxLevel = 6, steps = { { accept = 4641 } } })
local EXTRA = 14
for i = 1, EXTRA do
    Ding.RegisterGuide({ id = ("t-%02d"):format(i), pack = Ding.ZONES_PACK, title = ("Guide %02d"):format(i),
        minLevel = i, maxLevel = i + 1, steps = { { level = 60 } } })
end
local function guideCount()
    local n = 0
    for _ in Ding:IterateGuides() do n = n + 1 end
    return n
end
local TOTAL = guideCount()

-- Opens the settings on the Guide tab, focus on the section dropdown (after the packs).
local function open()
    C:Open("guide", 2)
    H.flush()
    T.ok(C.frame:IsShown(), "settings window closed")
    T.ok(C.focus and C.focus.box and C.focus.opts.label == Ding.L.GUIDE_SECTION,
        "the focus is not on the section dropdown")
    return C.focus
end

local function close()
    if C.frame and C.frame:IsShown() then C:Close() end
    H.flush()
end

local function start(guide)
    close()
    T.reset({ level = 2 })
    if guide then E:SetGuide(guide, 1, true) end
    H.flush()
end

local function indexOf(id)
    for n, entry in ipairs(C.dropdown.entries) do
        if entry.value == id then return n end
    end
end

T.test("the section dropdown comes right after the guide dropdown", function()
    start(G)
    local row = open()
    T.eq(row.opts.label, Ding.L.GUIDE_SECTION)
    T.eq(C:BuildTab(1).focusable[1].opts.label, Ding.L.ACTIVE_GUIDE, "the guide dropdown is not the first one")
    T.eq(row.box.text:GetText(), "Sombrevallée (1-6)", "guide shown")
    T.eq(row.box.detail:GetText(), Ding.L.GUIDE_RANGE:format(1, 6), "level range")
    close()
end)

T.test("without an active guide, the row shows \"None\"", function()
    start(nil)
    local row = open()
    T.eq(row.box.text:GetText(), Ding.L.GUIDE_NONE)
    close()
end)

T.test("A opens the list of all guides, active guide selected", function()
    start(G)
    open()
    press("PAD1")
    T.ok(C.dropdown and C.dropdown:IsShown(), "list closed")
    T.eq(guideCount(), TOTAL, "registered guides")
    T.eq(#C.dropdown.entries, TOTAL, "listed guides")
    local entry = C.dropdown.entries[C.dropdown.index]
    T.eq(entry.value, G, "starting selection")
    T.ok(entry.current, "active guide not marked")
    close()
end)

T.test("guides of another race are listed but greyed out", function()
    start(G)
    open()
    press("PAD1")
    local orc = C.dropdown.entries[indexOf("t-orc")]
    T.ok(orc.dim, "orc guide not greyed out")
    T.ok(orc.detail:find(Ding.L.GUIDE_OTHER_CHAR, 1, true), "\"other race\" mention missing")
    T.ok(not C.dropdown.entries[indexOf(G)].dim, "night elf guide greyed out")
    close()
end)

T.test("the D-pad chooses, A loads the guide and closes the list", function()
    start(G)
    open()
    press("PAD1")
    local target = indexOf("t-orc")
    while C.dropdown.index ~= target do press("PADDDOWN") end
    press("PAD1")
    T.eq(E.guide.id, "t-orc")
    T.ok(not C.dropdown, "list still open")
    T.ok(C.frame:IsShown(), "the window closed")
    T.ok(C.focus and C.focus.box, "focus lost after the guide change")
    T.eq(C.focus.box.text:GetText(), "Valley of Trials", "new guide not shown")
    T.eq(Ding.char.guide, "t-orc", "guide not saved for the character")
    close()
end)

T.test("B closes the list without changing the guide or closing the window", function()
    start(G)
    open()
    press("PAD1")
    press("PADDDOWN")
    press("PAD2")
    T.ok(not C.dropdown, "list still open")
    T.ok(C.frame:IsShown(), "B closed the window")
    T.eq(E.guide.id, G)
    press("PAD2")
    T.ok(not C.frame:IsShown(), "the second B does not close the window")
end)

T.test("choosing the already active guide does not reload it (\"previous\" kept)", function()
    start(G)
    T.quests({ [456] = "log", [458] = "log" })
    T.eq(E.index, 2)
    E:Prev(); H.flush()
    T.eq(E.index, 1)
    open()
    press("PAD1")
    press("PAD1")
    T.eq(E.guide.id, G)
    T.eq(E.index, 1, "the guide was reloaded and left the kept step")
    close()
end)

T.test("after a change, the dropdown shows the chosen guide", function()
    start(G)
    local row = open()
    press("PAD1")
    local target = indexOf("t-orc")
    while C.dropdown.index ~= target do press("PADDDOWN") end
    press("PAD1")
    row = C.focus
    T.ok(row.box, "the focus left the dropdown")
    T.eq(row.box.text:GetText(), "Valley of Trials")
    close()
end)

T.test("going back to a guide resumes where we were", function()
    start(G)
    T.quests({ [456] = "ready", [458] = "log" })
    T.eq(E.index, 3)
    E:SetGuide("t-orc", 1, true); H.flush()
    open()
    press("PAD1")
    local target = indexOf(G)
    while C.dropdown.index ~= target do press("PADDUP") end
    press("PAD1")
    T.eq(E.guide.id, G)
    T.eq(E.index, 3, "done steps not skipped")
    close()
end)

T.test("the selection wraps around and scrolls with the D-pad", function()
    start(G)
    open()
    press("PAD1")
    local list = C.dropdown
    local visible = Ding.UI.DROPDOWN.visible
    T.eq(#list.items, visible, "number of rows shown")
    while list.index ~= 1 do press("PADDUP") end
    press("PADDUP")
    T.eq(list.index, TOTAL, "↑ on the first does not go to the last")
    T.eq(list.offset, TOTAL - visible, "the last one is not visible")
    press("PADDDOWN")
    T.eq(list.index, 1, "↓ on the last does not go back to the first")
    T.eq(list.offset, 0)
    press("PADDRIGHT")
    T.eq(list.index, 1 + visible, "→ does not jump one page")
    T.ok(list.index > list.offset and list.index <= list.offset + visible, "selection out of view")
    press("PADDLEFT")
    T.eq(list.index, 1, "← does not go back one page")
    close()
end)

T.test("the selected row is the only highlighted one", function()
    start(G)
    open()
    press("PAD1")
    press("PADDDOWN")
    local list, lit = C.dropdown, 0
    for i, item in ipairs(list.items) do
        if item.fill:IsShown() then
            lit = lit + 1
            T.eq(list.offset + i, list.index, "wrong row highlighted")
        end
    end
    T.eq(lit, 1)
    close()
end)

T.test("with the mouse: hover then click loads the guide", function()
    start(G)
    local row = open()
    row.box.scripts.OnClick(row.box)
    local list = C.dropdown
    T.ok(list, "the click does not open the list")
    while indexOf("t-01") > list.offset + Ding.UI.DROPDOWN.visible do list.scripts.OnMouseWheel(list, -1) end
    local n = indexOf("t-01") - list.offset
    local item = list.items[n]
    item.scripts.OnEnter(item)
    T.eq(list.index, list.offset + n, "hovering does not select")
    item.scripts.OnClick(item)
    T.eq(E.guide.id, "t-01")
    close()
end)

T.test("the mouse wheel scrolls without going out of bounds", function()
    start(G)
    open()
    press("PAD1")
    local list = C.dropdown
    list.scripts.OnMouseWheel(list, 1)
    T.eq(list.offset, 0)
    for _ = 1, 50 do list.scripts.OnMouseWheel(list, -1) end
    T.eq(list.offset, TOTAL - Ding.UI.DROPDOWN.visible)
    close()
end)

T.test("Guide tab: both dropdowns with their label and \"restart\", the automation next to them", function()
    start(G)
    local rows = C:BuildTab(C.TAB.guide).rows
    -- The quest log cleanup comes after, under its own label (the window block before it).
    local guideRows = 0
    for _, row in ipairs(rows) do
        if row.label and row.label:GetText() == Ding.L.CLEANUP then break end
        guideRows = guideRows + 1
    end
    T.ok(guideRows <= 9, ("%d rows in the Guide tab"):format(guideRows))
    T.ok(not rows[1].focusable and rows[1].label:GetText() == Ding.L.ACTIVE_GUIDE, "\"Active guide\" label missing")
    T.ok(not rows[3].focusable and rows[3].label:GetText() == Ding.L.GUIDE_SECTION, "\"Section\" label missing")
    open()
    press("PADRSHOULDER"); press("PADRSHOULDER")
    T.eq(C.tab, 3, "two RB presses do not lead to Automation")
    local presses = 0
    while not (C.focus.opts and C.focus.opts.label == Ding.L.SKIP_GREY) do
        presses = presses + 1
        T.ok(presses <= 4, "grey quests more than 4 presses away")
        press("PADDDOWN")
    end
    close()
end)

T.test("a guide above the character's level is greyed out, \"lvl N+\"", function()
    start(G)
    open()
    press("PAD1")
    local entry = C.dropdown.entries[indexOf("t-10")]
    T.ok(entry.dim, "level 10 guide not greyed out at level 2")
    T.eq(entry.detail, Ding.L.GUIDE_RANGE:format(10, 11) .. " · " .. Ding.L.GUIDE_LEVEL_MIN:format(10))
    local current = C.dropdown.entries[indexOf(G)]
    T.ok(current.current and not current.dim, "active guide marked wrongly")
    press("PAD2")
    close()
end)

T.test("the help bar and the chips follow the list opening", function()
    start(G)
    open()
    local function labels()
        local out = {}
        for _, item in ipairs(C.frame.help.items) do
            if item.label:IsShown() then out[#out + 1] = item.label:GetText() end
        end
        return table.concat(out, ",")
    end
    local f = C.frame
    T.ok(labels():find(Ding.L.HINT_SELECT, 1, true), "\"Select\" missing: " .. labels())
    T.ok(f.lb:IsShown() and f.rb:IsShown() and f.back:IsShown(), "LB, RB or B chip missing")
    press("PAD1")
    T.ok(labels():find(Ding.L.HINT_BACK, 1, true), "\"Back\" missing: " .. labels())
    T.ok(not f.lb:IsShown() and not f.rb:IsShown(), "LB / RB shown with the list open")
    T.ok(not f.back:IsShown(), "B on the close cross with the list open")
    press("PAD2")
    T.ok(f.lb:IsShown() and f.back:IsShown(), "chips not restored")
    T.ok(not labels():find(Ding.L.HINT_BACK, 1, true), "help not restored: " .. labels())
    close()
end)

T.test("list open: LB and RB do not change tabs, Start closes everything", function()
    start(G)
    open()
    press("PAD1")
    press("PADRSHOULDER")
    T.eq(C.tab, 1, "RB changed tabs")
    T.ok(C.dropdown, "RB closed the list")
    press("PADFORWARD")
    T.ok(not C.frame:IsShown(), "Start does not close the window")
    T.ok(not C.dropdown, "list still open after closing")
    T.ok(next(H.overrides) == nil, "temporary bindings still active")
end)

T.test("combat closes the list and the window without changing the guide", function()
    start(G)
    open()
    press("PAD1")
    press("PADDDOWN")
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    T.ok(not C.frame:IsShown(), "window open in combat")
    T.ok(not C.dropdown, "list still open in combat")
    T.ok(next(H.overrides) == nil, "temporary bindings in combat")
    T.eq(E.guide.id, G)
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
end)

T.test("changing tabs with the mouse closes the list", function()
    start(G)
    open()
    press("PAD1")
    C:SelectTab(C.TAB.arrow)
    T.ok(not C.dropdown, "list still open on another tab")
    close()
end)

T.test("hovering another row closes the list", function()
    start(G)
    local row = open()
    press("PADDDOWN")
    local other = C.focus
    T.ok(other ~= row, "no other row in the tab")
    press("PADDUP")
    T.eq(C.focus, row)
    press("PAD1")
    T.ok(C.dropdown, "list closed")
    other.scripts.OnEnter(other)
    T.ok(not C.dropdown, "list still open")
    T.eq(C.focus, other)
    T.eq(E.guide.id, G)
    close()
end)

T.run()
