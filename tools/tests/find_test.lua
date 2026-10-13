-- "Find this quest in the guide" (Engine:FindQuest, Panel:FindQuest): from a quest of a row
-- of the window, the section and step that deal with it, offered as a row under the step;
-- going there with A (focus mode, Right to look) or a click (step menu, right click).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L = Ding.Engine, Ding.Panel, Ding.L

-- 456 is persistent from the first section on; the second one completes and turns it in.
Ding.RegisterGuidePack({ id = "tfind", title = "Find" })
Ding.RegisterGuide({ id = "tfind-1", pack = "tfind", title = "First", races = { "NightElf" }, steps = {
    { accept = 456, sticky = 456 },     -- 1
    { text = "Wander" },                -- 2
} })
Ding.RegisterGuide({ id = "tfind-2", pack = "tfind", title = "Second", races = { "NightElf" }, steps = {
    { text = "Arrive" },                -- 1
    { complete = 456 },                 -- 2
    { turnin = 456 },                   -- 3
    { accept = 458 },                   -- 4
} })

local function start()
    H.closeDialog()
    T.reset({ level = 5 })
    H.player.map, H.player.x, H.player.y = 1438, 40, 80
    E:SetGuide("tfind-1", 1, true); H.flush()
    H.tick(2)
    H.accept(456); H.flush(); H.tick(2)
    T.eq(E.index, 2)
end

local function rowWith(test)
    for i, row in ipairs(P.rowsShown or {}) do
        if test(row) then return row, i end
    end
end

local function chat(fn)
    local lines, print = {}, Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = H.plain(msg) end
    local ok, err = pcall(fn)
    Ding.Print = print
    assert(ok, err)
    return lines
end

T.test("engine: the step that deals with the quest, in the log or not", function()
    start()
    local found = E:FindQuest(456)
    T.ok(found, "456 not found")
    T.eq(found.guide, "tfind-2")
    T.eq(found.index, 2)
    T.eq(found.action, "complete")
    T.quests({ [456] = "ready" })
    found = E:FindQuest(456)
    T.eq(found.index, 3, "a ready quest: its turn-in")
    found = E:FindQuest(458)
    T.eq(found and found.index, 4, "a quest not in the log: where it is taken")
    T.eq(E:FindQuest(999999), nil)
end)

T.test("gamepad: Right on the quest's row offers the step, A goes there", function()
    start()
    P:StartFocus()
    local _, index = rowWith(function(r) return r.quest == 456 end)
    T.ok(index, "no row for 456")
    P.focusIndex = index
    H.press("PADDRIGHT")
    local offer, at = rowWith(function(r) return r.action == "jump" end)
    T.ok(offer, "no offer")
    T.eq(P.focusIndex, at, "the focus does not go to the offer")
    T.eq(H.plain(offer.text), L.FIND_JUMP:format(2, "Second"))
    T.ok(H.plain(offer.sub):find(L.FIND_COMPLETE:format(Ding.Data:QuestName(456)), 1, true), H.plain(offer.sub))
    local lines = chat(function() H.press("PAD1") end)
    T.eq(E.guide.id, "tfind-2")
    T.eq(E.index, 2)
    T.eq(lines[1], L.FIND_JUMPED:format(2, "Second"))
    T.eq(rowWith(function(r) return r.action == "jump" end), nil, "the offer stays")
    P:StopFocus()
end)

T.test("gamepad: Left drops the offer", function()
    start()
    P:StartFocus()
    local _, index = rowWith(function(r) return r.quest == 456 end)
    P.focusIndex = index
    H.press("PADDRIGHT")
    H.press("PADDLEFT")
    T.eq(P.findOffer, nil)
    T.eq(E.guide.id, "tfind-1")
    P:StopFocus()
end)

T.test("mouse: the step menu on a quest's row, then a click on the offer; right click drops it", function()
    start()
    H.setGamepadConnected(false)
    local _, index = rowWith(function(r) return r.quest == 456 end)
    local frameRow = P.frame.rows[index]
    frameRow.scripts.OnClick(frameRow, "RightButton"); H.flush()
    local menu = P.stepMenu
    T.ok(menu and menu:IsShown() and menu.find:IsShown(), "no \"find\" item in the step menu")
    T.eq(H.plain(menu.find.text:GetText()), L.STEP_MENU_FIND)
    menu.find.scripts.OnClick(menu.find, "LeftButton"); H.flush()
    local offer, at = rowWith(function(r) return r.action == "jump" end)
    T.ok(offer, "no offer")
    T.ok(H.plain(offer.sub):find(L.FIND_JUMP_MOUSE, 1, true), "no mouse help")
    local offerRow = P.frame.rows[at]
    offerRow.scripts.OnClick(offerRow, "RightButton"); H.flush()
    T.eq(P.findOffer, nil, "right click does not drop the offer")
    -- Again, and a click goes there.
    frameRow = P.frame.rows[index]
    frameRow.scripts.OnClick(frameRow, "RightButton"); H.flush()
    menu.find.scripts.OnClick(menu.find, "LeftButton"); H.flush()
    _, at = rowWith(function(r) return r.action == "jump" end)
    offerRow = P.frame.rows[at]
    offerRow.scripts.OnClick(offerRow, "LeftButton"); H.flush()
    T.eq(E.guide.id, "tfind-2")
    -- A row without a quest: no "find" item.
    P:OpenStepMenu(nil)
    T.ok(not menu.find:IsShown(), "\"find\" without a quest")
    P:CloseStepMenu()
    H.setGamepadConnected(true)
end)

T.test("nothing found, or the current step: a chat line; the offer goes when the step changes", function()
    start()
    local lines = chat(function() P:FindQuest(999999) end)
    T.eq(lines[1], L.FIND_NONE:format(Ding.Data:QuestName(999999) or "999999"))
    E:SetGuide("tfind-2", 2, true); H.flush()
    lines = chat(function() P:FindQuest(456) end)
    T.eq(lines[1], L.FIND_HERE:format(Ding.Data:QuestName(456)))
    E:SetGuide("tfind-1", 2, true); H.flush()
    P:FindQuest(456)
    T.ok(P.findOffer, "no offer")
    E:Next(); H.flush()
    P:Update()
    T.eq(rowWith(function(r) return r.action == "jump" end), nil, "an offer from another step")
end)

T.run()
