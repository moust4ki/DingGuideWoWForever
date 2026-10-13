-- Goals without a quest (Core/Goals.lua): kill and collect counts, buying, talking to an
-- NPC, the dialogue line to pick, items to use or to wear, objects, inventory chores and a
-- quest to abandon. Done by themselves, never by Ding's hand.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, GO, D = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Goals, Ding.Data

local NIGHTSABER, SPIDER, ILTHALAINE, TENARON = 2031, 1986, 2079, 3514
local VENOM_SAC = 5166
local CAMPFIRE = 1986
local TOKEN, BOOK, SHIRT = 960001, 960002, 960003

local function guide(steps)
    Ding.RegisterGuide({ id = "t-goals", title = "Goals", races = { "NightElf" }, steps = steps })
end

local function start(steps, at)
    H.closeDialog()
    T.reset({ level = 5 })
    guide(steps)
    H.player.map, H.player.x, H.player.y = 1438, (at or {})[1] or 58.7, (at or {})[2] or 44
    E:SetGuide("t-goals", 1, true); H.flush()
    H.tick(1)
end

local function lines()
    local out = {}
    for _, l in ipairs(E:Describe(E:CurrentStep())) do
        if l.action == "goal" then out[#out + 1] = l end
    end
    return out
end

---------------------------------------------------------------------------
-- Kill and collect
---------------------------------------------------------------------------
T.test("kill: counted from the experience message, the arrow on the spawns", function()
    start({ { kill = { { NIGHTSABER, 3 } } }, { text = "End" } })
    local l = lines()[1]
    T.eq(l.text, L.GOAL_KILL:format(D:NpcName(NIGHTSABER)))
    T.eq(l.counter, "0/3")
    T.ok(#E.candidates > 0 and E.candidates[1].area, "no area of nightsabers")
    T.eq(E.candidates[1].npc, NIGHTSABER)
    H.killXP(D:NpcName(NIGHTSABER), 40)
    H.killXP("Somebody Else", 40)
    H.killXP(D:NpcName(NIGHTSABER), 40)
    T.eq(lines()[1].counter, "2/3")
    T.eq(E.index, 1)
    H.killXP(D:NpcName(NIGHTSABER), 40); H.tick(1)
    T.eq(E.index, 2, "not done after 3 kills")
end)

T.test("kill: one pair alone or a bare id are read too; kills of another step do not count", function()
    start({ { text = "Before" }, { kill = { NIGHTSABER, 2 } }, { kill = NIGHTSABER } })
    H.killXP(D:NpcName(NIGHTSABER), 40)
    E:Next(); H.flush()
    T.eq(lines()[1].counter, "0/2", "a kill before the step counted")
    H.killXP(D:NpcName(NIGHTSABER), 40); H.killXP(D:NpcName(NIGHTSABER), 40); H.tick(1)
    T.eq(E.index, 3)
    T.eq(lines()[1].counter, nil, "a counter for a single kill")
end)

T.test("collect: the bag count, the item's sources on the arrow; already held is done", function()
    start({ { collect = { { VENOM_SAC, 2 } } }, { text = "End" } })
    T.eq(lines()[1].counter, "0/2")
    T.ok(#E.candidates > 0 and E.candidates[1].area, "no sources of the item")
    H.setItem(VENOM_SAC, 1); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(lines()[1].counter, "1/2")
    H.setItem(VENOM_SAC, 2); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 2)
    start({ { collect = { { VENOM_SAC, 1 } } }, { text = "End" } })
    T.eq(E.index, 1)
    H.setItem(VENOM_SAC, 3); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 2, "already held, not done")
end)

T.test("spots: the step's own places replace QuestieDB's spawns", function()
    start({ { kill = { { NIGHTSABER, 2 } }, spots = { { 1438, 30, 30 }, { 1438, 31, 31 } } } })
    T.eq(#E.candidates, 2)
    T.eq(E.candidates[1].x, 30)
    T.ok(E.candidates[1].area, "the spots are not an area")
end)

T.test("buy: the vendor given, else the nearest vendor; done by the bag count", function()
    local vendor = Ding.Services:Nearest("vendor", 1)[1]
    T.ok(vendor, "no vendor in Shadowglen")
    start({ { buy = { { 159, 5, vendor.npc } } }, { buy = { { 4540, 2 } } }, { text = "End" } })
    T.eq(E.candidates[1].npc, vendor.npc)
    T.eq(lines()[1].text, L.GOAL_BUY:format(Ding.Compat.ItemName(159) or D:ItemName(159)))
    H.setItem(159, 5); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 2)
    T.ok(#E.candidates > 0, "no vendor for an item QuestieDB knows no vendor of")
end)

---------------------------------------------------------------------------
-- NPCs, dialogue, objects
---------------------------------------------------------------------------
T.test("talk: done when that NPC's window opens, not another's", function()
    start({ { talk = ILTHALAINE }, { text = "End" } })
    T.eq(lines()[1].text, L.GOAL_TALK:format(D:NpcName(ILTHALAINE)))
    T.eq(E.candidates[1].npc, ILTHALAINE)
    H.talk({ id = TENARON, gives = {} }); H.flush()
    H.closeDialog(); H.tick(1)
    T.eq(E.index, 1, "another NPC counted")
    H.talk({ id = ILTHALAINE, gives = {} }); H.flush()
    H.closeDialog(); H.tick(1)
    T.eq(E.index, 2)
end)

T.test("gossip: the line named on a banner while the dialogue is open; done when it closes", function()
    start({ { talk = ILTHALAINE, gossip = 2 }, { text = "End" } })
    T.eq(lines()[2].text, L.GOAL_GOSSIP:format(2))
    H.talk({ id = ILTHALAINE, gives = {}, options = { "Tell me more", "Return me to life" } }); H.flush()
    T.ok(GO.banner and GO.banner:IsShown(), "no banner")
    T.ok(H.plain(GO.banner.text:GetText()):find("Return me to life", 1, true), H.plain(GO.banner.text:GetText()))
    T.eq(H.plain(lines()[2].text), L.GOAL_GOSSIP_PICK:format("Return me to life"))
    T.eq(E.index, 1, "done before the dialogue closed")
    H.closeDialog(); H.tick(1)
    T.ok(not GO.banner:IsShown(), "the banner stays")
    T.eq(E.index, 2)
end)

T.test("object: one QuestieDB has no spawn of counts on any window during the step", function()
    start({ { object = 9999990 }, { text = "End" } }, { 40, 80 })
    T.eq(#E.candidates, 0, "points for an object without spawns")
    H.fire("LOOT_OPENED"); H.tick(1)
    T.eq(E.index, 2)
end)

T.test("object: a window opened next to one of its spawns; far away it does not count", function()
    local camp = D:ObjectPoints(CAMPFIRE)[1]
    start({ { object = CAMPFIRE }, { text = "End" } })
    T.eq(lines()[1].text, L.GOAL_OBJECT:format(D:ObjectName(CAMPFIRE)))
    T.eq(E.candidates[1].x, camp.x)
    H.fire("LOOT_OPENED"); H.tick(1)
    T.eq(E.index, 1, "an object used far away")
    H.player.map, H.player.x, H.player.y = camp.map, camp.x, camp.y
    H.fire("LOOT_OPENED"); H.tick(1)
    T.eq(E.index, 2)
end)

---------------------------------------------------------------------------
-- Items: use, wear, chores
---------------------------------------------------------------------------
T.test("useitem: on the item button; done by its cast, or its count down", function()
    start({ { useitem = TOKEN }, { useitem = BOOK }, { text = "End" } })
    H.setItem(TOKEN, 1, { use = true }); H.setItem(BOOK, 2, { use = true })
    H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(Ding.ItemButton:Wanted(), TOKEN)
    T.eq(lines()[1].item, TOKEN)
    H.fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast", 1000 + TOKEN); H.tick(1)
    T.eq(E.index, 2)
    E:Refresh(); H.flush()
    H.setItem(BOOK, 1, { use = true }); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 3, "the count down does not count as a use")
end)

T.test("equip: on the item button; done when worn", function()
    start({ { equip = SHIRT }, { text = "End" } })
    H.setItemInfo(SHIRT, { name = "Plain Shirt", equipLoc = "INVTYPE_BODY" })
    H.setItem(SHIRT, 1); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(Ding.ItemButton:Wanted(), SHIRT)
    H.setItem(SHIRT, 0); H.equip(4, SHIRT)
    H.fire("PLAYER_EQUIPMENT_CHANGED", 4, false); H.tick(1)
    T.eq(E.index, 2)
end)

T.test("destroy, bank, take out: reminders done by the bag count; Ding never touches them", function()
    start({ { destroy = TOKEN }, { bank = BOOK }, { unbank = BOOK }, { text = "End" } })
    H.setItem(TOKEN, 3); H.setItem(BOOK, 1)
    E:SetGuide("t-goals", 1, true); H.flush()
    T.eq(E.index, 1)
    T.eq(lines()[1].counter, "3")
    T.eq(#H.itemUses(), 0, "Ding used an item")
    H.setItem(TOKEN, 0); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 2)
    H.setItem(BOOK, 0); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 3)
    H.setItem(BOOK, 1); H.fire("BAG_UPDATE", 0); H.tick(1)
    T.eq(E.index, 4)
end)

T.test("keep: never sold as a grey item from that step on", function()
    start({ { keep = TOKEN, text = "Keep the token" }, { text = "End" } })
    T.eq(lines()[1].text, L.GOAL_KEEP:format(Ding.Compat.ItemName(TOKEN) or D:ItemName(TOKEN) or ("#" .. TOKEN)))
    T.ok(E:IsManual(E:CurrentStep()), "a keep reminder alone is not manual")
    H.setItemInfo(TOKEN, { name = "Old Token", quality = 0, sellPrice = 5 })
    H.setItemInfo(930001, { name = "Grey Thing", quality = 0, sellPrice = 7 })
    H.putInBag(0, 1, TOKEN, 1)
    H.putInBag(0, 2, 930001, 1)
    H.openMerchant(); H.closeMerchant()
    local sold = table.concat(H.sold(), ",")
    T.ok(not sold:find(tostring(TOKEN), 1, true), "the kept item was sold: " .. sold)
    T.eq(#H.sold(), 1, "the other grey item stays")
end)

T.test("abandon: a reminder done when the quest leaves the log; Ding never abandons", function()
    start({ { abandon = 458 }, { text = "End" } })
    T.quests({ [458] = "log" })
    E:SetGuide("t-goals", 1, true); H.flush()
    T.eq(E.index, 1)
    T.eq(lines()[1].text, L.GOAL_ABANDON:format(D:QuestName(458)))
    T.eq(lines()[1].sub, L.GOAL_ABANDON_HINT)
    T.quests({ [458] = false }); H.tick(1)
    T.eq(E.index, 2)
end)

---------------------------------------------------------------------------
-- Together, and in the window
---------------------------------------------------------------------------
T.test("goals with a quest: the step waits for both; rows, glyphs and points in the window", function()
    start({ { accept = 456, kill = { { NIGHTSABER, 1 } } }, { text = "End" } })
    H.accept(456); H.flush(); H.tick(1)
    T.eq(E.index, 1, "done without the kill")
    local row
    for _, r in ipairs(P.rowsShown or {}) do
        if r.goal then row = r end
    end
    T.ok(row and row.kind == "kill", "no kill row")
    T.ok(#P:PointsOf(row) > 0, "no points for the row")
    P:Aim(row)
    T.eq(A.forced and A.forced.points[1].npc, NIGHTSABER)
    H.killXP(D:NpcName(NIGHTSABER), 40); H.tick(1)
    T.eq(E.index, 2)
end)

T.test("French client: the kill message in its own words", function()
    start({ { kill = { { NIGHTSABER, 1 } } }, { text = "End" } })
    local before = _G.COMBATLOG_XPGAIN_FIRSTPERSON
    _G.COMBATLOG_XPGAIN_FIRSTPERSON = "%1$s meurt, vous gagnez %2$d points d'expérience."
    GO.ResetPatterns()
    H.fire("CHAT_MSG_COMBAT_XP_GAIN", D:NpcName(NIGHTSABER) .. " meurt, vous gagnez 40 points d'expérience. (+20 exp Reposé)")
    H.tick(1)
    _G.COMBATLOG_XPGAIN_FIRSTPERSON = before
    GO.ResetPatterns()
    T.eq(E.index, 2)
end)

T.run()
