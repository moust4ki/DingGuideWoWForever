-- Comfort: the target binding on the secure item button (the arrow's NPC or monster by
-- name, a skull when solo), service steps that complete themselves (class trainer, flight
-- master, vendor, repair), and the merchant (grey items sold, repairs, one chat line, bags
-- almost full).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, B, Cfg = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.ItemButton, Ding.Config

local TARGET_KEY = "SHIFT-PAD2"

Ding.RegisterGuide({ id = "t-comfort", title = "Comfort", races = { "NightElf" }, steps = {
    { accept = 456 },        -- 1: Conservator Ilthalaine, an NPC
    { complete = 456 },      -- 2: young nightsabers and boars
    { train = true },        -- 3
    { fly = true },          -- 4
    { vendor = true },       -- 5
    { repair = true },       -- 6
    { level = 60 },          -- 7
} })

local function start(index, level)
    H.closeDialog()
    T.reset({ level = level or 5 })
    H.player.map, H.player.x, H.player.y = 1438, 58.7, 44
    E:SetGuide("t-comfort", 1, true); H.flush()
    H.tick(11)
    if index and index > 1 then
        E.index = index
        Ding.char.step = index
        E:Refresh()
    end
    A.point = nil; A:Tick()
end

-- Captures Ding's chat lines while fn runs.
local function chat(fn)
    local lines, print = {}, Ding.Print
    Ding.Print = function(_, msg) lines[#lines + 1] = H.plain(msg) end
    local ok, err = pcall(fn)
    Ding.Print = print
    assert(ok, err)
    return lines
end

---------------------------------------------------------------------------
-- Target binding
---------------------------------------------------------------------------
T.test("target binding: the arrow's NPC by name, through the secure item button", function()
    start()
    H.bindings[TARGET_KEY] = B.TARGET_BINDING
    A.point = nil; A:Tick()
    local name = A.point.label
    T.ok(A.point.npc, "the quest giver is not an NPC point")
    T.eq(B.button:GetAttribute("type-Target"), "macro")
    T.eq(B.button:GetAttribute("macrotext-Target"), "/targetexact " .. name)
    T.eq(H.pressBinding(TARGET_KEY), "/targetexact " .. name)
    T.eq(Ding.Compat.TargetName(), name)
    T.eq(H.raidMark(name), 8, "no skull on the target, solo")
    H.bindings[TARGET_KEY] = nil
end)

T.test("target binding: the objective's monster; no skull in a group or with the option off", function()
    start()
    H.bindings[TARGET_KEY] = B.TARGET_BINDING
    T.quests({ [456] = "log" })
    A.point = nil; A:Tick()
    local name = A.point.label
    T.ok(name == Ding.Data:NpcName(2031) or name == Ding.Data:NpcName(1984), "not a monster of the quest: " .. tostring(name))
    H.setGroup(true)
    H.pressBinding(TARGET_KEY)
    T.eq(H.raidMark(name), nil, "a skull in a group")
    H.setGroup(false)
    Ding.db.ui.markTarget = false
    H.setTarget(nil)
    H.pressBinding(TARGET_KEY)
    T.eq(H.raidMark(name), nil, "a skull with the option off")
    H.bindings[TARGET_KEY] = nil
end)

T.test("target binding: the step's other monsters too, the nearest one last in the macro", function()
    start()
    H.bindings[TARGET_KEY] = B.TARGET_BINDING
    T.quests({ [456] = "log" })
    A.point = nil; A:Tick()
    local text = B.button:GetAttribute("macrotext-Target")
    local lines = {}
    for line in text:gmatch("[^\n]+") do lines[#lines + 1] = line end
    T.eq(#lines, 2, "both monsters of the quest: " .. text)
    T.eq(lines[2], "/targetexact " .. A.point.label, "the arrow's monster is not the last line")
    T.ok(text:find(Ding.Data:NpcName(2031), 1, true) and text:find(Ding.Data:NpcName(1984), 1, true), text)
    H.pressBinding(TARGET_KEY)
    T.eq(Ding.Compat.TargetName(), A.point.label)
    T.eq(H.raidMark(A.point.label), 8, "no skull on the target")
    H.bindings[TARGET_KEY] = nil
end)

T.test("target binding: the names follow the player, nearest first", function()
    start()
    T.quests({ [456] = "log" })
    local far = {}
    for _, p in ipairs(E.candidates) do
        if p.npc == 2031 then far = p end
    end
    T.ok(far.x, "no spawn of the nightsabers")
    H.player.map, H.player.x, H.player.y = far.map, far.x, far.y
    A.point = nil; A:Tick()
    T.eq(E:TargetNames(3)[1], Ding.Data:NpcName(2031))
    T.eq(B.wantedTargets[1], A.point.label)
end)

T.test("target binding: the macro never changes in combat, it follows right after", function()
    start()
    local before = B.button:GetAttribute("macrotext-Target")
    H.setCombat(true)
    T.quests({ [456] = "log" })
    A.point = nil; A:Tick()
    T.eq(B.button:GetAttribute("macrotext-Target"), before, "secure attribute changed in combat")
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED"); H.flush()
    T.ok(B.button:GetAttribute("macrotext-Target") ~= before, "not updated after combat")
end)

T.test("target binding: \"Target: name\" with its glyph under the arrow, only when bound", function()
    start()
    local f = A.frame
    T.ok(not f.target:IsShown(), "target line without a binding")
    H.bindings[TARGET_KEY] = B.TARGET_BINDING
    A.point = nil; A:Tick()
    T.ok(f.target:IsShown(), "no target line")
    T.eq(H.plain(f.target.text:GetText()), L.TARGET_LINE:format(A.point.label))
    T.ok(f.target.glyph:IsShown(), "no glyph")
    H.bindings[TARGET_KEY] = nil
end)

T.test("target binding: a row in the Keybinds tab", function()
    start()
    Cfg:Open("bindings"); H.flush()
    local found
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.bindings].rows) do
        if row.opts and row.opts.action == B.TARGET_BINDING then found = row end
    end
    T.ok(found, "no Keybinds row for the target binding")
    T.eq(found.opts.label, L.BIND_TARGET)
    T.eq(_G["BINDING_NAME_CLICK DingItemButton:Target"], L.BIND_TARGET)
    -- The tip: the game's own "Interact with Target" key next to it.
    local tip = false
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.bindings].rows) do
        if row.text and row.text.GetText and H.plain(row.text:GetText() or "") == L.BIND_INTERACT_TIP then tip = true end
    end
    T.ok(tip, "no tip about the game's interact key")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Service steps
---------------------------------------------------------------------------
T.test("train: the arrow to the nearest trainer of the class; done when its window closes", function()
    start(3)
    T.ok(#E.candidates > 0, "no class trainer to go to")
    local npc = E.candidates[1].npc
    local sub = NpcDB.GetRaw(npc, "subName")
    T.ok(sub and sub:find("Warrior", 1, true), "not a warrior trainer: " .. tostring(sub))
    H.openTrainer(true); H.closeTrainer()
    T.eq(E.index, 3, "a profession trainer validated the step")
    H.openTrainer(false)
    T.eq(E.index, 3, "done before the window closed")
    H.closeTrainer()
    T.eq(E.index, 4)
end)

T.test("train: also done when a spell is learned during the step, not at a profession trainer", function()
    start(3)
    H.openTrainer(true)
    H.fire("LEARNED_SPELL_IN_TAB", 2018, 1); H.flush()
    T.eq(E.index, 3, "a profession spell validated the step")
    H.closeTrainer()
    start(2)
    H.fire("LEARNED_SPELL_IN_TAB", 6673, 1); H.flush()
    T.eq(E.index, 2, "a spell learned during another step counts")
    start(3)
    H.fire("LEARNED_SPELL_IN_TAB", 6673, 1); H.flush()
    T.eq(E.index, 4)
end)

T.test("trainer and flight path steps: hidden by their own options", function()
    start(3)
    Ding.db.ui.trainerSteps = false
    E:Update(); H.flush()
    T.eq(E.index, 4, "train step not passed with its option off")
    Ding.db.ui.flightSteps = false
    E:Update(); H.flush()
    T.eq(E.index, 5, "fly step not passed with its option off")
    Cfg:Open("route"); H.flush()
    local labels = {}
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.route].rows) do
        if row.opts and row.opts.label then labels[row.opts.label] = true end
    end
    T.ok(labels[L.OPT_TRAINER] and labels[L.OPT_FLIGHT], "options missing from the Route tab")
    Cfg:Close(); H.flush()
end)

T.test("train: a window opened during another step does not count; Next still works", function()
    start(2)
    H.openTrainer(false)
    E.index = 3; E:Refresh()
    H.closeTrainer()
    T.eq(E.index, 3)
    E:Next(); H.flush()
    T.eq(E.index, 4)
end)

T.test("fly: done when the flight map opens, or a new flight path is found", function()
    start(4)
    T.ok(#E.candidates > 0 and E.candidates[1].npc, "no flight master to go to")
    H.fire("UI_INFO_MESSAGE", 0, ERR_NEWTAXIPATH); H.flush()
    T.eq(E.index, 5)
    start(4)
    H.openTaxi({}); H.closeTaxi()
    T.eq(E.index, 5)
end)

T.test("vendor and repair: done when the merchant's window closes; hidden by their option", function()
    start(5)
    T.ok(#E.candidates > 0, "no vendor to go to")
    H.openMerchant(); H.closeMerchant()
    T.eq(E.index, 6)
    H.openMerchant({ canRepair = true }); H.closeMerchant()
    T.eq(E.index, 7)
    start(5)
    Ding.db.ui.serviceSteps = false
    E:Update(); H.flush()
    T.eq(E.index, 7, "vendor and repair steps not passed with their option off")
end)

T.test("service steps: the window says how they end", function()
    start(5)
    local last = P.rowsShown[#P.rowsShown]
    T.ok(last.sub and last.sub:find(L.SERVICE_HINT:format(".+")), tostring(last.sub))
    start(4)
    last = P.rowsShown[#P.rowsShown]
    T.ok(last.sub and last.sub:find(L.SERVICE_FLY_HINT:format(".+")), tostring(last.sub))
end)

---------------------------------------------------------------------------
-- Merchant
---------------------------------------------------------------------------
local GREY, GREY2, WHITE = 920001, 920002, 920003
local function bag()
    H.setItemInfo(GREY, { name = "Broken Fang", quality = 0, sellPrice = 12 })
    H.setItemInfo(GREY2, { name = "Torn Hide", quality = 0, sellPrice = 30 })
    H.setItemInfo(WHITE, { name = "Linen Cloth", quality = 1, sellPrice = 5 })
    H.putInBag(0, 1, GREY, 3)
    H.putInBag(0, 2, WHITE, 2)
    H.putInBag(0, 3, GREY2, 1)
end

T.test("merchant: grey items sold, repairs paid, one chat line", function()
    start(7)
    bag()
    H.setMoney(1000)
    local lines = chat(function() H.openMerchant({ canRepair = true, repairCost = 250 }) end)
    T.eq(table.concat(H.sold(), ","), GREY .. "," .. GREY2)
    T.eq(H.bagItem(0, 2).id, WHITE, "a white item was sold")
    T.eq(H.money(), 1000 + 3 * 12 + 30 - 250)
    T.eq(#lines, 1, "not one chat line")
    T.ok(lines[1]:find(L.MERCHANT_SOLD:format(4, "66c"), 1, true), lines[1])
    T.ok(lines[1]:find(L.MERCHANT_REPAIRED:format("2s 50c"), 1, true), lines[1])
    T.ok(lines[1]:find(L.BAG_FREE:format(15), 1, true), lines[1])
    H.closeMerchant()
end)

T.test("merchant: Shift (LT) held, or the options off: nothing sold nor repaired", function()
    start(7)
    bag()
    H.setMoney(1000)
    H.setModifier("shift", true)
    local lines = chat(function() H.openMerchant({ canRepair = true, repairCost = 250 }) end)
    H.setModifier("shift", false)
    T.eq(#H.sold(), 0)
    T.eq(#lines, 0)
    H.closeMerchant()
    Ding.db.ui.sellGrey, Ding.db.ui.repair = false, false
    H.openMerchant({ canRepair = true, repairCost = 250 })
    T.eq(#H.sold(), 0)
    T.eq(H.money(), 1000)
    H.closeMerchant()
end)

T.test("merchant: no repair without the money", function()
    start(7)
    H.setMoney(100)
    local m = H.openMerchant({ canRepair = true, repairCost = 250 })
    T.eq(m.repaired, nil)
    H.closeMerchant()
end)

T.test("bags almost full: a warning under the step", function()
    start(7)
    T.ok(not P.rowsShown[#P.rowsShown].sub or not P.rowsShown[#P.rowsShown].sub:find(L.BAGS_ALMOST_FULL:format(4), 1, true))
    for slot = 1, 12 do H.putInBag(0, slot, WHITE, 1) end
    H.fire("BAG_UPDATE", 0); H.tick(1)
    local sub = P.rowsShown[#P.rowsShown].sub or ""
    T.ok(sub:find(L.BAGS_ALMOST_FULL:format(4), 1, true), "no warning: " .. sub)
end)

T.run()
