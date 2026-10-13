-- Quest rewards (Core/Rewards.lua, UI/Rewards.lua): the best upgrade for the class, else what
-- sells for the most; pointed out with a banner and a ring, taken only with the option. And
-- the quest log cleanup: quests the guide never uses, listed for the player to abandon
-- from the game's quest log (Ding never selects nor abandons a quest there: taint).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L, Cfg, R = Ding.Engine, Ding.Panel, Ding.L, Ding.Config, Ding.Rewards

Ding.RegisterGuide({ id = "t-rew", title = "Rewards", races = { "NightElf" }, steps = {
    { turnin = 456 },
    { level = 60 },
} })

-- Rewards of quest 456 in these tests.
local STR_CHEST, INT_CHEST, RED_CHEST, PRICEY_RING = 900001, 900002, 900003, 900004
local function items()
    H.setItemInfo(STR_CHEST, { name = "Strong Chest", equipLoc = "INVTYPE_CHEST", sellPrice = 50,
        stats = { ITEM_MOD_STRENGTH_SHORT = 5, ITEM_MOD_STAMINA_SHORT = 2, RESISTANCE0_NAME = 150 } })
    H.setItemInfo(INT_CHEST, { name = "Wise Robe", equipLoc = "INVTYPE_ROBE", sellPrice = 80,
        stats = { ITEM_MOD_INTELLECT_SHORT = 6, ITEM_MOD_SPIRIT_SHORT = 3, RESISTANCE0_NAME = 40 } })
    H.setItemInfo(RED_CHEST, { name = "Plate Chest", equipLoc = "INVTYPE_CHEST", sellPrice = 70, usable = false,
        stats = { ITEM_MOD_STRENGTH_SHORT = 12, RESISTANCE0_NAME = 400 } })
    H.setItemInfo(PRICEY_RING, { name = "Pricey Ring", equipLoc = "INVTYPE_FINGER", sellPrice = 500,
        stats = { ITEM_MOD_SPIRIT_SHORT = 1 } })
    H.setItemInfo(900010, { name = "Worn Shirt", equipLoc = "INVTYPE_CHEST", stats = { ITEM_MOD_STRENGTH_SHORT = 1 } })
    H.setItemInfo(900011, { name = "Old Ring", equipLoc = "INVTYPE_FINGER", stats = { ITEM_MOD_SPIRIT_SHORT = 4 } })
end

local function start(class, rewards, opts)
    opts = opts or {}
    H.closeDialog()
    T.reset({ level = 10, class = class or "WARRIOR" })
    items()
    H.equip(5, 900010)
    H.equip(11, 900011); H.equip(12, 900011)
    Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = true, true
    Ding.db.ui.chooseReward = opts.choose or false
    H.setModifier("shift", opts.shift or false)
    H.tick(3)
    T.quests({ [456] = "ready" })
    E:SetGuide("t-rew", 1, true); H.flush()
    H.clearDialogCalls()
    H.talk({ ends = { 456 }, rewards = { [456] = rewards } })
    H.flush()
end

local function calls() return table.concat(H.dialogCalls(), ", ") end

---------------------------------------------------------------------------
-- Choosing
---------------------------------------------------------------------------
T.test("option off: the best upgrade is pointed out, never taken", function()
    start("WARRIOR", { INT_CHEST, STR_CHEST, PRICEY_RING })
    T.eq(calls(), "select-active 456, complete 456", "a reward was taken with the option off")
    T.eq(R.best.index, 2)
    T.eq(R.best.reason, "upgrade")
    local RH = Ding.RewardHint
    T.ok(RH.banner:IsShown(), "no banner")
    T.ok(H.plain(RH.banner.text:GetText()):find("Strong Chest", 1, true), H.plain(RH.banner.text:GetText()))
    T.ok(RH.marker:IsShown(), "no ring on the reward")
    T.eq(RH.marker.points[1][4], 500 + 40 * 2, "the ring is not on the second reward")
    H.closeDialog()
    T.ok(not RH.banner:IsShown() and not RH.marker:IsShown(), "banner or ring left after the window closed")
end)

T.test("option on: Ding takes the best upgrade", function()
    start("WARRIOR", { INT_CHEST, STR_CHEST, PRICEY_RING }, { choose = true })
    T.eq(calls(), "select-active 456, complete 456, reward 456 2")
end)

T.test("the class decides: a mage takes the intellect robe", function()
    start("MAGE", { STR_CHEST, INT_CHEST }, { choose = true })
    T.eq(calls(), "select-active 456, complete 456, reward 456 2")
end)

T.test("no upgrade: what sells for the most", function()
    start("WARRIOR", { INT_CHEST, PRICEY_RING }, { choose = true })
    T.eq(R.last.reason, "price")
    T.eq(calls(), "select-active 456, complete 456, reward 456 2")
    T.ok(Ding.RewardHint.banner.text:GetText():find("Pricey Ring", 1, true), "the banner does not name the reward")
end)

T.test("an item the class cannot use is never an upgrade", function()
    start("WARRIOR", { RED_CHEST, INT_CHEST }, { choose = true })
    T.eq(R.last.reason, "price", "the red plate chest counted as an upgrade")
    T.eq(calls(), "select-active 456, complete 456, reward 456 2")
end)

T.test("Shift (LT) held: nothing chosen", function()
    start("WARRIOR", { INT_CHEST, STR_CHEST }, { choose = true, shift = true })
    T.eq(calls(), "")
end)

T.test("items the client has not loaded: nothing taken, looked at again", function()
    start("WARRIOR", { 900099, STR_CHEST }, { choose = true })
    T.eq(calls(), "select-active 456, complete 456", "a reward taken without knowing every item")
    H.setItemInfo(900099, { name = "Late Item", equipLoc = "INVTYPE_CHEST", sellPrice = 1 })
    H.tick(1)
    T.eq(calls(), "select-active 456, complete 456, reward 456 2", "not looked at again")
end)

T.test("a two-hander replaces both hands", function()
    T.reset({ level = 10, class = "WARRIOR" })
    H.setItemInfo(900020, { name = "Sword", equipLoc = "INVTYPE_WEAPON", stats = { ITEM_MOD_DAMAGE_PER_SECOND_SHORT = 6 } })
    H.setItemInfo(900021, { name = "Shield", equipLoc = "INVTYPE_SHIELD", stats = { RESISTANCE0_NAME = 300 } })
    H.setItemInfo(900022, { name = "Greatsword", equipLoc = "INVTYPE_2HWEAPON", stats = { ITEM_MOD_DAMAGE_PER_SECOND_SHORT = 7 } })
    H.equip(16, 900020); H.equip(17, 900021)
    -- 7 DPS against 6 DPS and a shield: not an upgrade.
    local before = R:Score(Ding.Compat.EquippedLink(16), 16) + R:Score(Ding.Compat.EquippedLink(17), 17)
    T.ok(R:Score("item:900022", 16) < before, "the two-hander beats sword and shield")
end)

T.test("Automation tab: \"Choose quest rewards\", off by default", function()
    T.eq(Ding.DEFAULTS.ui.chooseReward, false)
    T.reset()
    Cfg:Open("automation"); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.CHOOSE_REWARD end, "rewards")
    T.eq(Cfg.focus.opts.desc, L.CHOOSE_REWARD_DESC)
    H.press("PAD1")
    T.eq(Ding.db.ui.chooseReward, true)
    Cfg.focus.scripts.OnClick(Cfg.focus, "LeftButton"); H.flush()
    T.eq(Ding.db.ui.chooseReward, false, "a click does not toggle it")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Quest log cleanup
---------------------------------------------------------------------------
-- The guide and the next one use 456, 458 and 457 (whose chain starts with 456); 916 and
-- 4495 are never used.
Ding.RegisterGuide({ id = "t-clean", title = "Clean", races = { "NightElf" }, next = "t-clean-2", steps = {
    { accept = 458 },
    { accept = 457 },
} })
Ding.RegisterGuide({ id = "t-clean-2", title = "Clean 2", races = { "NightElf" }, steps = {
    { turnin = 459 },
} })

local function startClean(extra)
    H.closeDialog()
    T.reset({ level = 5 })
    local states = { [456] = "log", [458] = "log", [459] = "log", [916] = "log", [4495] = "log" }
    for _, q in ipairs(extra or {}) do states[q] = "log" end
    T.quests(states)
    E:SetGuide("t-clean", 1, true); H.flush()
end

local function sorted(list)
    local copy = {}
    for i, v in ipairs(list) do copy[i] = v end
    table.sort(copy)
    return table.concat(copy, ",")
end

T.test("cleanup: only quests neither this guide nor the next ones use, chains included", function()
    startClean()
    T.eq(sorted(E:UnusedLogQuests()), "916,4495")
end)

-- The Guide tab's row of the quests the guide never uses, and its page.
local function openCleanup()
    Cfg:Open("guide"); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.CLEANUP_ROW end, "cleanup row")
    H.press("PAD1")
    T.ok(Cfg.page and Cfg.page.key == "cleanup", "no cleanup page")
end

T.test("cleanup: a row in the Guide tab, the quests on a page; A shows a card, never abandons", function()
    startClean()
    openCleanup()
    local name = Ding.Data:QuestName(916)
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == name end, "Webwood Venom")
    T.eq(Cfg.focus.opts.button, L.CLEANUP_CARD)
    local row = Cfg.focus
    H.press("PAD1")
    T.eq(GameTooltip.text, name, "no quest card")
    T.ok(GameTooltip:GetOwner() == row, "the card is not next to the row")
    T.ok(H.log()[916], "the quest left the log")
    H.press("PADDDOWN")
    T.ok(not GameTooltip:IsShown(), "card kept after moving the focus")
    H.press("PAD2")
    T.eq(Cfg.page, nil, "B does not go back to the tab")
    T.eq(Cfg.focus.opts.label, L.CLEANUP_ROW, "the focus is not back on the row")
    Cfg:Close(); H.flush()
end)

T.test("cleanup: with the mouse, a click shows the card; abandoned from the game's log, the row goes", function()
    startClean()
    Cfg:Open("guide"); H.flush()
    local link
    for _, r in ipairs(Cfg.TABS[Cfg.TAB.guide].rows) do
        if r.opts and r.opts.label == L.CLEANUP_ROW then link = r end
    end
    T.ok(link, "no cleanup row")
    link.scripts.OnClick(link, "LeftButton"); H.flush()
    local name = Ding.Data:QuestName(4495)
    local row
    for _, r in ipairs(Cfg.page.rows) do
        if r.opts and r.opts.label == name then row = r end
    end
    T.ok(row, "no row for 4495")
    row.scripts.OnClick(row, "LeftButton"); H.flush()
    T.eq(GameTooltip.text, name)
    -- The player abandons it in the game's quest log: the page follows.
    T.quests({ [4495] = false })
    H.tick(1)
    T.ok(Cfg.page, "the page closed with quests left")
    for _, r in ipairs(Cfg.page.rows) do
        T.ok(not (r.opts and r.opts.label == name), "the abandoned quest is still listed")
    end
    Cfg:Close(); H.flush()
end)

T.test("cleanup: nothing to clean, the tab says so", function()
    T.reset({ level = 5 })
    T.quests({ [458] = "log" })
    E:SetGuide("t-clean", 1, true); H.flush()
    Cfg:Open("guide"); H.flush()
    local found = false
    for _, row in ipairs(Cfg.TABS[Cfg.TAB.guide].rows) do
        if row.text and H.plain(row.text:GetText() or "") == L.CLEANUP_NONE then found = true end
    end
    T.ok(found, "no \"nothing to clean\" line")
    Cfg:Close(); H.flush()
end)

T.test("cleanup: a log almost full points out the quests that can go, A or a click lists them", function()
    local extra = {}
    for i = 1, 12 do extra[#extra + 1] = 900800 + i end
    startClean(extra)
    T.ok(#H.logOrder() >= 16)
    local found
    for i, row in ipairs(P.rowsShown or {}) do
        if row.action == "notice" and row.notice == "cleanup" then found = i end
        T.ok(not (row.sub and H.plain(row.sub):find(L.CLEANUP_HINT:format(14), 1, true)), "the notice under a row")
    end
    T.ok(found, "no notice about the quests that can go")
    local row = P.rowsShown[found]
    T.eq(row.text, L.CLEANUP_HINT:format(14))
    T.ok(row.sub and row.sub:find(L.NOTICE_OPEN_PAD:format(Ding.Gamepad:ButtonName("PAD1")), 1, true), tostring(row.sub))
    -- A click (A in focus mode): the settings, on the cleanup page.
    local r = P.frame.rows[found]
    r.scripts.OnClick(r, "LeftButton"); H.flush()
    T.ok(Cfg.frame:IsShown(), "the settings do not open")
    T.eq(Cfg.page and Cfg.page.key, "cleanup", "not on the cleanup page")
    Cfg:Close(); H.flush()
    -- Without a gamepad, the notice speaks of the mouse.
    local getCVar = _G.GetCVar
    _G.GetCVar = function(name) if name == "GamePadEnable" then return "0" end return getCVar(name) end
    E:Refresh()
    for _, r2 in ipairs(P.rowsShown) do
        if r2.notice == "cleanup" then T.ok(r2.sub:find(L.NOTICE_OPEN_MOUSE, 1, true), r2.sub) end
    end
    _G.GetCVar = getCVar
    E:Refresh()
end)

T.run()
