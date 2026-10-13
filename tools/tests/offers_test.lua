-- Quests an NPC offers: beside the game's window, what the guide does with each one (now,
-- later in this section, in another section, not in the guide and why). The game's windows are
-- only read: the mock's GossipFrame and QuestFrame fail on anything else.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, O, L = Ding.Engine, Ding.Offers, Ding.L

-- Duskwood's quests (real data: names, levels, monsters) in a pack of two sections.
local SUPPLIES, ZOMBIE, TRANSLATION, HERMIT, THREAD = 148, 158, 252, 165, 157
local EFFIGY, OGRES, MORLADIM, DAUGHTER, MORBENT, NIGHT_WATCH = 133, 134, 228, 229, 55, 56
local FOREVER = 86574       -- "Stonetalon Supply Run", one of WoW Forever's own quests, level 24
Ding.RegisterGuidePack({ id = "t-offers", title = "Offers" })
Ding.RegisterGuide({ id = "t-offers-1", pack = "t-offers", title = "Duskwood (25-27)", minLevel = 25,
    maxLevel = 27, faction = "Alliance", steps = {
        { accept = SUPPLIES },                              -- 1: at the NPC
        { go = { 1431, 70, 70 } },                          -- 2: leaves the place
        { accept = ZOMBIE },                                -- 3
        { accept = TRANSLATION, elite = true },             -- 4
        { accept = HERMIT, classes = { "MAGE" } },          -- 5
        { accept = THREAD, dungeon = "The Deadmines" },     -- 6
        { go = { 1431, 20, 20 } },                          -- 7
        { turnin = SUPPLIES },                              -- 8
    } })
Ding.RegisterGuide({ id = "t-offers-2", pack = "t-offers", title = "Stranglethorn", minLevel = 30,
    maxLevel = 32, faction = "Alliance", steps = {
        { accept = EFFIGY },
    } })

local function start(index, p)
    H.closeDialog()
    p = p or {}
    T.reset({ level = p.level or 25, race = "Human" })
    Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = p.autoAccept or false, false
    Ding.db.ui.offers = true
    H.tick(3)
    E:SetGuide("t-offers-1", index or 1, true)
    H.flush()
end

-- Opens an NPC's window, waits for the panel, returns its rows.
local function talk(npc)
    H.talk(npc)
    H.flush()
    return O.frame and O.frame:IsShown() and O.entries or nil
end
local function offer(q) return talk({ gives = { q } })[1] end

T.test("now: the steps at the player's place take it", function()
    start(1)
    local e = offer(SUPPLIES)
    T.eq(e.quest, SUPPLIES)
    T.eq(e.result.kind, "now")
    T.eq(e.text, L.OFFER_NOW)
    T.eq(e.name, "[24] Fournitures en provenance de Darkshire", "the quest's name in the client's language")
end)

T.test("later in this guide: the step that takes it", function()
    start(1)
    local e = offer(ZOMBIE)
    T.eq(e.result.kind, "later")
    T.eq(e.result.step, 3)
    T.eq(e.text, "Plus tard dans ce guide (étape 3)")
end)

T.test("in another section of the pack, with its levels", function()
    start(1)
    local e = offer(EFFIGY)
    T.eq(e.result.kind, "other")
    T.eq(e.result.guide.id, "t-offers-2")
    T.eq(e.text, "Dans Stranglethorn (niveaux 30-32)")
    T.ok(e.above, "a quest above the player's level is written in orange")
    -- A Leveling section's title already ends with its levels.
    T.eq((O:Describe({ kind = "other", guide = Ding:GetGuide("t-offers-1") })), "Dans Duskwood (25-27)")
end)

T.test("a step already passed, and a later step that needs the quest", function()
    -- (At step 3 the engine catches SUPPLIES up first: an earlier quest of ZOMBIE's chain.)
    start(4)
    T.ok(E.index > 3 and E.index < 8, "past the steps that take it")
    local e = offer(SUPPLIES)
    T.eq(e.result.kind, "needed")
    T.eq(e.result.step, 8)
    T.eq(e.text, "À prendre : l'étape 8 de ce guide en a besoin")
    start(8)
    T.eq(offer(ZOMBIE).result.kind, "earlier")
    T.eq(offer(ZOMBIE).text, "Plus tôt dans ce guide (étape 3, passée)")
end)

T.test("not in the guide: elite and dungeon options off, then on", function()
    start(1)
    local e = offer(TRANSLATION)
    T.eq(e.result.kind, "none")
    T.eq(e.result.reason, "elitesOff")
    T.eq(e.text, "Pas dans le guide : quêtes élites désactivées")
    T.eq(offer(THREAD).result.reason, "dungeonsOff")
    Ding.db.ui.elites, Ding.db.ui.dungeons = true, true
    T.eq(offer(TRANSLATION).result.step, 4)
    T.eq(offer(THREAD).result.step, 6)
end)

T.test("not in the guide: another class or race", function()
    start(1)
    local e = offer(HERMIT)
    T.eq(e.result.reason, "class")
    T.eq(e.text, "Pas dans le guide : pour une autre classe ou race")
end)

T.test("not in the guide: an elite quest, its follow-up, above the player's level", function()
    start(1)
    T.eq(offer(MORLADIM).result.reason, "elite", "Mor'Ladim")
    T.eq(offer(MORBENT).result.reason, "elite", "Morbent Fel")
    T.eq(offer(DAUGHTER).result.reason, "elite", "The Daughter Who Lived: after Mor'Ladim")
    local e = offer(OGRES)
    T.eq(e.result.reason, "above")
    T.eq(e.text, "Pas dans le guide : niveau 30, au-dessus du tien")
end)

T.test("not in the guide: a WoW Forever quest, else no reason", function()
    start(1)
    T.eq(offer(FOREVER).result.reason, "forever")
    local e = offer(NIGHT_WATCH)
    T.eq(e.result.kind, "none")
    T.eq(e.result.reason, nil)
    T.eq(e.text, "Pas dans le guide")
end)

T.test("a gray quest the guide skips", function()
    start(1, { level = 40 })
    Ding.db.ui.skipGrey = true
    local e = offer(ZOMBIE)
    T.eq(e.result.kind, "none")
    T.eq(e.result.reason, "grey")
    Ding.db.ui.skipGrey = false
end)

T.test("several quests: one row each, in the window's order, beside the gossip window", function()
    start(1)
    local rows = talk({ gives = { SUPPLIES, ZOMBIE, EFFIGY, OGRES, MORLADIM } })
    T.eq(#rows, 5)
    local kinds = {}
    for i, e in ipairs(rows) do kinds[i] = e.result.kind end
    T.eq(table.concat(kinds, " "), "now later other none none")
    local f = O.frame
    T.eq(f.rows[5].status:GetText(), "Pas dans le guide : élite, laissée hors du parcours")
    T.ok(f:GetHeight() > 5 * 30, "the frame fits its rows")
    local point, rel, relPoint, x, y = f:GetPoint()
    T.eq(point, "TOPLEFT")
    T.eq(rel, UIParent)
    T.eq(relPoint, "BOTTOMLEFT")
    T.eq(x, 16 + 338 + 8, "on the right of the gossip window")
    T.eq(y, 652, "level with its top")
    T.ok(not f:IsMouseEnabled(), "information only: the mouse goes through")
end)

T.test("on the left of the game's window when the screen has no room on its right", function()
    start(1)
    local getLeft, getRight = GossipFrame.GetLeft, GossipFrame.GetRight
    rawset(GossipFrame, "GetLeft", function() return 700 end)
    rawset(GossipFrame, "GetRight", function() return 1038 end)
    UIParent:SetWidth(1100)
    talk({ gives = { ZOMBIE } })
    local _, _, _, x = O.frame:GetPoint()
    rawset(GossipFrame, "GetLeft", getLeft)
    rawset(GossipFrame, "GetRight", getRight)
    H.closeDialog()
    UIParent:SetWidth(0)
    T.eq(x, 700 - 8 - 260)
end)

T.test("quest greeting: titles matched to the NPC's quests", function()
    start(1)
    local rows = talk({ id = 289, greeting = true, gives = { SUPPLIES, EFFIGY } })
    T.eq(#rows, 2)
    T.eq(rows[1].quest, SUPPLIES)
    T.eq(rows[2].quest, EFFIGY)
    T.eq(rows[2].result.kind, "other")
    -- An NPC Ding cannot name: the pack's quests by title.
    rows = talk({ greeting = true, gives = { ZOMBIE } })
    T.eq(rows[1].quest, ZOMBIE)
    T.eq(rows[1].result.step, 3)
end)

T.test("quest details: the one quest shown", function()
    start(1)
    H.showQuest({ gives = { OGRES } }, "detail", OGRES)
    H.flush()
    T.ok(O.frame:IsShown())
    T.eq(#O.entries, 1)
    T.eq(O.entries[1].result.reason, "above")
end)

T.test("closes with the game's window", function()
    start(1)
    talk({ gives = { ZOMBIE } })
    T.ok(O.frame:IsShown())
    H.closeDialog()
    T.ok(not O.frame:IsShown(), "gossip closed")
    talk({ greeting = true, gives = { ZOMBIE } })
    T.ok(O.frame:IsShown())
    H.closeDialog()
    T.ok(not O.frame:IsShown(), "greeting closed")
    H.showQuest({}, "detail", ZOMBIE)
    H.flush()
    T.ok(O.frame:IsShown())
    H.closeDialog()
    T.ok(not O.frame:IsShown(), "quest details closed")
    -- A window gone without its event: hidden at the next look.
    talk({ gives = { ZOMBIE } })
    local isVisible = GossipFrame.IsVisible
    rawset(GossipFrame, "IsVisible", function() return false end)
    H.tick(0.5)
    rawset(GossipFrame, "IsVisible", isVisible)
    T.ok(not O.frame:IsShown(), "window gone")
    H.closeDialog()
end)

T.test("a quest window opening over the gossip keeps the panel; a quest closing during a gossip too", function()
    start(1)
    talk({ gives = { ZOMBIE } })
    -- The gossip's close comes after the quest details opened.
    H.showQuest({}, "detail", ZOMBIE)
    H.flush()
    O:Closed("GOSSIP_CLOSED")
    T.ok(O.frame:IsShown())
    T.eq(O.kind, "detail")
    H.closeDialog()
    talk({ gives = { ZOMBIE } })
    O:Closed("QUEST_FINISHED")
    T.ok(O.frame:IsShown())
    H.closeDialog()
end)

T.test("a quest AutoQuest takes: nothing shown for the window it closed", function()
    start(1, { autoAccept = true })
    talk({ gives = { SUPPLIES } })
    T.ok(H.log()[SUPPLIES], "taken")
    T.ok(not (O.frame and O.frame:IsShown()))
end)

T.test("option off: nothing shown; turned off while shown: hidden; on by default", function()
    start(1)
    Ding.db.ui.offers = false
    T.eq(talk({ gives = { ZOMBIE } }), nil)
    H.closeDialog()
    Ding.db.ui.offers = true
    talk({ gives = { ZOMBIE } })
    T.ok(O.frame:IsShown())
    Ding.db.ui.offers = false
    O:Apply()
    T.ok(not O.frame:IsShown())
    H.closeDialog()
    Ding.Config:TabDefaults("automation")
    T.eq(Ding.db.ui.offers, true)
    T.eq(Ding.DEFAULTS.ui.offers, true)
end)

T.test("without a guide, or without quests offered: nothing shown", function()
    start(1)
    T.eq(talk({ gives = {} }), nil)
    H.closeDialog()
    E.guide = nil
    T.eq(talk({ gives = { ZOMBIE } }), nil)
    H.closeDialog()
end)

T.run()
