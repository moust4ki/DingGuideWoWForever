-- Guidance: the NPC directory's binding (the directory itself: directory_test.lua), the class
-- training reminder (Core/Training.lua) and the gear upgrades of the bags (Core/Gear.lua).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, F, B, Gear = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Finder, Ding.ItemButton, Ding.Gear

Ding.RegisterGuide({ id = "t-guidance", title = "Guidance", races = { "NightElf" }, steps = {
    { accept = 456 },
    { level = 60 },
} })

local function start(opts)
    opts = opts or {}
    H.closeDialog()
    T.reset({ level = opts.level or 5, class = opts.class or "WARRIOR", race = opts.race, faction = opts.faction })
    H.player.map, H.player.x, H.player.y = opts.map or 1438, opts.x or 58.7, opts.y or 44
    E:SetGuide(opts.guide or "t-guidance", 1, true); H.flush()
    H.tick(11)
end

local function rowOf(action)
    for _, row in ipairs(P.rowsShown or {}) do
        if row.action == action then return row end
    end
end

---------------------------------------------------------------------------
-- NPC directory
---------------------------------------------------------------------------
T.test("directory: a binding in the Keybinds tab", function()
    start()
    T.eq(_G.BINDING_NAME_DING_FINDER, L.BIND_FINDER)
    Ding.Config:Open("bindings"); H.flush()
    local found = false
    for _, row in ipairs(Ding.Config.TABS[Ding.Config.TAB.bindings].rows) do
        if row.opts and row.opts.action == "DING_FINDER" then found = true end
    end
    T.ok(found)
    Ding.Config:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Class training
---------------------------------------------------------------------------
local SERVICES = {
    { name = "Battle Shout", category = "available", level = 4, cost = 100 },
    { name = "Rend", category = "unavailable", level = 6, cost = 200 },
    { name = "Charge", category = "unavailable", level = 8, cost = 300 },
}

T.test("training: what waits at the trainer is shown at its level, until the next visit", function()
    start()
    H.setTrainerServices(SERVICES)
    H.openTrainer(false)
    T.eq(Ding.char.training.now, 100)
    T.eq(Ding.char.training.future[6], 200)
    H.closeTrainer()
    local row = rowOf("service")
    T.ok(row, "no training row with a spell to learn now")
    T.ok(H.plain(row.text):find(L.TRAINING_DUE:format("1s"), 1, true), H.plain(row.text))
    -- Learned: nothing left now.
    H.setTrainerServices({ { name = "Battle Shout", category = "used", level = 4, cost = 100 }, SERVICES[2], SERVICES[3] })
    H.openTrainer(false); H.closeTrainer()
    T.eq(rowOf("service"), nil, "training row while nothing is left now")
    -- Level 6: Rend.
    H.player.level = 6
    H.fire("PLAYER_LEVEL_UP", 6); H.flush()
    row = rowOf("service")
    T.ok(row and H.plain(row.text):find(L.TRAINING_DUE:format("2s"), 1, true), "no reminder at level 6")
    -- A click on it: the arrow to the class trainer.
    P:Aim(row)
    T.ok(F.trip and F.trip.kind == "trainer", "the row does not lead to the trainer")
end)

T.test("training: a profession trainer is not noted", function()
    start()
    Ding.char.training = nil
    H.setTrainerServices(SERVICES)
    H.openTrainer(true); H.closeTrainer()
    T.eq(Ding.char.training, nil)
end)

T.test("training: before the first visit, even levels", function()
    start({ level = 4 })
    Ding.char.training = nil
    P:Update()
    local row = rowOf("service")
    T.ok(row, "no reminder at level 4 without data")
    T.eq(H.plain(row.text), L.TRAINING_DUE_GUESS:format(4))
    H.player.level = 5
    H.fire("PLAYER_LEVEL_UP", 5); H.flush()
    T.eq(rowOf("service"), nil, "a reminder at an odd level")
    -- Once the trainer has been seen, its own list counts.
    H.setTrainerServices({ SERVICES[3] })
    H.player.level = 6
    H.openTrainer(false); H.closeTrainer()
    T.eq(rowOf("service"), nil, "a guess after a visit")
end)

T.test("training: one chat line near a class trainer, once per level", function()
    start({ level = 4 })
    Ding.char.training = nil
    local trainer = Ding.Services:Nearest("trainer", 1)[1]
    T.ok(trainer, "no class trainer")
    local p = trainer.point
    local function chatAt(map, x, y)
        local lines, print = {}, Ding.Print
        Ding.Print = function(_, msg) lines[#lines + 1] = H.plain(msg) end
        H.player.map, H.player.x, H.player.y = map, x, y
        local ok, err = pcall(H.tick, 4)
        Ding.Print = print
        assert(ok, err)
        return lines
    end
    local lines = chatAt(p.map, p.x, p.y)
    T.eq(lines[1], L.TRAINING_NEAR:format(trainer.name))
    T.eq(#chatAt(p.map, p.x, p.y), 0, "reminded twice at the same level")
    H.player.level = 6
    H.fire("PLAYER_LEVEL_UP", 6); H.flush()
    T.eq(#chatAt(p.map, p.x, p.y), 1, "no reminder at the next level")
    H.player.level = 7
    H.fire("PLAYER_LEVEL_UP", 7); H.flush()
    T.eq(#chatAt(p.map, p.x, p.y), 0, "a reminder with nothing waiting")
end)

---------------------------------------------------------------------------
-- Gear upgrades
---------------------------------------------------------------------------
local OLD_CHEST, MAIL_CHEST, PLATE_CHEST, QUEST_HELM = 940001, 940002, 940003, 5166
local function gear()
    H.setItemInfo(OLD_CHEST, { name = "Old Vest", equipLoc = "INVTYPE_CHEST", classID = 4, subclassID = 1,
        stats = { ITEM_MOD_STRENGTH_SHORT = 1 } })
    H.setItemInfo(MAIL_CHEST, { name = "Mail Hauberk", equipLoc = "INVTYPE_CHEST", classID = 4, subclassID = 3,
        stats = { ITEM_MOD_STRENGTH_SHORT = 4, ITEM_MOD_STAMINA_SHORT = 3, RESISTANCE0_NAME = 120 } })
    H.setItemInfo(PLATE_CHEST, { name = "Plate Breastplate", equipLoc = "INVTYPE_CHEST", classID = 4, subclassID = 4,
        stats = { ITEM_MOD_STRENGTH_SHORT = 8, RESISTANCE0_NAME = 300 } })
    H.equip(5, OLD_CHEST)
end

local function bagsChanged()
    H.fire("BAG_UPDATE", 0)
    H.tick(1.5)
end

T.test("gear: a clear upgrade in the bags: banner, row, and the item button equips it", function()
    start()
    gear()
    H.putInBag(0, 1, MAIL_CHEST)
    bagsChanged()
    T.ok(Gear.upgrade and Gear.upgrade.id == MAIL_CHEST, "upgrade not found")
    T.ok(Ding.GearHint.banner:IsShown(), "no banner")
    local row = rowOf("gear")
    T.ok(row, "no gear row")
    T.eq(row.kind, "use")
    -- How much better, in words (no bare "+4" counter, read as a quest's): clearly better than
    -- the old vest, and how to equip it or say no.
    T.eq(row.counter, nil, "a bare number on the row")
    T.ok(H.plain(row.sub):find(H.plain(L.GEAR_CLEARLY:format(Ding.Compat.EquippedLink(5) or "")), 1, true),
        "not said in words: " .. H.plain(row.sub))
    local how = Ding.Gamepad:Active() and L.GEAR_ROW_PAD or L.GEAR_ROW_MOUSE
    T.ok(H.plain(row.sub):find(how, 1, true), "how to equip it or say no is missing: " .. H.plain(row.sub))
    T.eq(B:Wanted(), MAIL_CHEST, "the item button does not offer it")
    T.eq(B.button:GetAttribute("item"), "item:" .. MAIL_CHEST)
    T.ok(H.plain(B.button.name:GetText()):find(L.EQUIP_ITEM:format(""), 1, true), "no \"Equip\" on the button")
    H.tick(7)
    T.ok(not Ding.GearHint.banner:IsShown(), "the banner stays")
end)

T.test("gear: declined (right click, or Left in focus mode), never offered again", function()
    start()
    gear()
    H.putInBag(0, 1, MAIL_CHEST)
    bagsChanged()
    local index
    for i, row in ipairs(P.rowsShown) do if row.action == "gear" then index = i end end
    local frameRow = P.frame.rows[index]
    frameRow.scripts.OnClick(frameRow, "RightButton"); H.flush()
    T.eq(Gear.upgrade, nil)
    T.ok(Ding.char.gearDeclined[MAIL_CHEST], "not remembered")
    bagsChanged()
    T.eq(Gear.upgrade, nil, "offered again")
    -- The gamepad way.
    Ding.char.gearDeclined = {}
    bagsChanged()
    P:StartFocus()
    for i, row in ipairs(P.rowsShown) do if row.action == "gear" then P.focusIndex = i end end
    H.press("PADDLEFT")
    T.eq(Gear.upgrade, nil, "Left does not decline in focus mode")
    P:StopFocus()
end)

T.test("gear: only what the class wears at its level", function()
    start({ class = "MAGE" })
    gear()
    H.putInBag(0, 1, MAIL_CHEST)
    bagsChanged()
    T.eq(Gear.upgrade, nil, "mail for a mage")
    start({ level = 30 })
    gear()
    H.putInBag(0, 1, PLATE_CHEST)
    bagsChanged()
    T.eq(Gear.upgrade, nil, "plate at 30")
    start({ level = 40 })
    gear()
    H.putInBag(0, 1, PLATE_CHEST)
    bagsChanged()
    T.ok(Gear.upgrade and Gear.upgrade.id == PLATE_CHEST, "plate at 40")
end)

T.test("gear: never an item a quest of the log needs", function()
    start({ level = 5 })
    gear()
    H.setItemInfo(QUEST_HELM, { name = "Venom Sac Helm", equipLoc = "INVTYPE_HEAD", classID = 4, subclassID = 1,
        stats = { ITEM_MOD_STAMINA_SHORT = 9 } })
    H.putInBag(0, 1, QUEST_HELM)    -- 5166, an objective of quest 916
    H.accept(916); H.flush()
    bagsChanged()
    T.eq(Gear.upgrade, nil, "a quest item offered as gear")
end)

T.test("gear: auto-equip, only an item already bound, out of combat", function()
    start()
    gear()
    Ding.db.ui.autoEquip = true
    H.putInBag(0, 1, MAIL_CHEST)
    bagsChanged()
    T.eq(H.equipped(5), OLD_CHEST, "an item that binds when worn was equipped")
    H.setItemInfo(MAIL_CHEST, { name = "Mail Hauberk", equipLoc = "INVTYPE_CHEST", classID = 4, subclassID = 3, bound = true,
        stats = { ITEM_MOD_STRENGTH_SHORT = 4, ITEM_MOD_STAMINA_SHORT = 3, RESISTANCE0_NAME = 120 } })
    Gear.upgrade = nil
    H.setCombat(true)
    bagsChanged()
    T.eq(H.equipped(5), OLD_CHEST, "equipped in combat")
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED"); H.flush()
    T.eq(H.equipped(5), MAIL_CHEST, "not equipped after combat")
end)

T.test("gear: \"Suggest better gear\" off: no row, no banner, nothing on the item button; auto-equip apart", function()
    start()
    gear()
    Ding.db.ui.suggestGear = false
    H.putInBag(0, 1, MAIL_CHEST)
    bagsChanged()
    T.ok(Gear.upgrade and Gear.upgrade.id == MAIL_CHEST, "the bags are still looked at")
    T.ok(not (Ding.GearHint.banner and Ding.GearHint.banner:IsShown()), "a banner with the option off")
    T.eq(rowOf("gear"), nil, "a row with the option off")
    T.ok(B:Wanted() ~= MAIL_CHEST, "the item button offers it with the option off")
    -- Auto-equip is its own option: it still wears an item already bound.
    Ding.db.ui.autoEquip = true
    H.setItemInfo(MAIL_CHEST, { name = "Mail Hauberk", equipLoc = "INVTYPE_CHEST", classID = 4, subclassID = 3, bound = true,
        stats = { ITEM_MOD_STRENGTH_SHORT = 4, ITEM_MOD_STAMINA_SHORT = 3, RESISTANCE0_NAME = 120 } })
    Gear.upgrade = nil
    bagsChanged()
    T.eq(H.equipped(5), MAIL_CHEST, "auto-equip follows the option to suggest")
    -- The option, in the Automation tab, on by default; back on, the row comes back.
    T.eq(Ding.DEFAULTS.ui.suggestGear, true)
    Ding.Config:Open("automation"); H.flush()
    local found
    for _, r in ipairs(Ding.Config.TABS[Ding.Config.TAB.automation].rows) do
        if r.opts and r.opts.label == L.SUGGEST_GEAR then found = r end
    end
    T.ok(found, "no option in the Automation tab")
    Ding.Config:Close(); H.flush()
end)

T.test("gear: the step's own item comes first on the button", function()
    start()
    gear()
    H.putInBag(0, 1, MAIL_CHEST)
    bagsChanged()
    Ding.RegisterGuide({ id = "t-guidance-use", title = "Use", races = { "NightElf" }, steps = {
        { complete = 456, use = 940009 },
    } })
    H.setItem(940009, 1, { use = true })
    E:SetGuide("t-guidance-use", 1, true); H.flush()
    T.eq(B:Wanted(), 940009)
end)

T.run()
