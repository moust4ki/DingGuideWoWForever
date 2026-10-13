-- Quests an NPC offers: beside the game's window, whether to take each one now and why (take it,
-- you can take it, not now, optional, not needed by the guide), shown only when one quest at
-- least is not for right now. The game's windows are only read: the mock's GossipFrame and
-- QuestFrame fail on anything else.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, O, L = Ding.Engine, Ding.Offers, Ding.L

-- Duskwood's quests (real data: names, levels, monsters) in a pack of three sections.
local SUPPLIES, ZOMBIE, TRANSLATION, HERMIT, THREAD = 148, 158, 252, 165, 157
local EFFIGY, OGRES, MORLADIM, DAUGHTER, MORBENT, NIGHT_WATCH = 133, 134, 228, 229, 55, 56
local GHOST_HAIR = 149
local FOREVER = 86574       -- "Stonetalon Supply Run", one of WoW Forever's own quests, level 24
Ding.RegisterGuidePack({ id = "t-offers", title = "Offers" })
Ding.RegisterGuide({ id = "t-offers-0", pack = "t-offers", title = "Elwynn (10-12)", minLevel = 10,
    maxLevel = 12, faction = "Alliance", steps = {
        { accept = GHOST_HAIR },
    } })
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

-- The verdict on quest q and its line, colors removed.
local function verdict(q)
    local ctx = O:Context()
    local r = O:Classify(q, ctx)
    local v, text = O:Verdict(r, q, ctx)
    return v, H.plain(text), r
end

-- Opens an NPC's window, waits for the panel, returns its rows (nil when not shown).
local function talk(npc)
    H.talk(npc)
    H.flush()
    return O.frame and O.frame:IsShown() and O.entries or nil
end

T.test("take it: the current step, or a step at the player's place", function()
    start(1)
    local v, text, r = verdict(SUPPLIES)
    T.eq(r.kind, "now")
    T.eq(v, "take")
    T.eq(text, "Prends-la : c'est l'étape en cours.")
    local _, line = O:Verdict(r, SUPPLIES, O:Context())
    T.ok(line:find("|cff4cc38aPrends-la|r", 1, true) == 1, "the verdict first, in green")
    -- Past the steps that take it, a later step still needs it (and at step 3 the engine catches
    -- it up first: an earlier quest of ZOMBIE's chain).
    start(4)
    T.eq(select(2, verdict(SUPPLIES)), "Prends-la : l'étape 8 en a besoin et tu ne l'as pas.")
end)

T.test("you can take it: a later step takes it and AutoQuest would on the way", function()
    start(1)
    local v, text, r = verdict(ZOMBIE)
    T.eq(r.kind, "later")
    T.eq(r.step, 3)
    T.eq(v, "can")
    T.eq(text, "Tu peux la prendre : le guide la prend à l'étape 3, ça t'évite de revenir.")
end)

T.test("not now: a later step, too high or the log full; a later section", function()
    start(1, { level = 22 })
    local v, text = verdict(ZOMBIE)
    T.eq(v, "notNow")
    T.eq(text, "Pas maintenant : le guide la prend à l'étape 3. Elle est niveau 24, tu es niveau 22.")
    start(1)
    local states = {}
    for i = 1, Ding.AutoQuest.AHEAD_LOG_LIMIT do states[900600 + i] = "log" end
    T.quests(states)
    v, text = verdict(ZOMBIE)
    T.eq(v, "notNow")
    T.eq(text, "Pas maintenant : le guide la prend à l'étape 3 (ton journal de quêtes est presque plein).")
    start(1)
    v, text = verdict(EFFIGY)
    T.eq(v, "notNow")
    T.eq(text, "Pas maintenant : le guide la prend plus tard, dans « Stranglethorn » (niveaux 30-32), "
        .. "quand tu reviendras. Elle est niveau 27, tu es niveau 25.")
end)

T.test("optional: the guide took it earlier, in this section or a section before", function()
    start(8)
    local v, text = verdict(ZOMBIE)
    T.eq(v, "optional")
    T.eq(text, "Facultative : le guide la prenait à l'étape 3, déjà passée.")
    start(1)
    v, text = verdict(GHOST_HAIR)
    T.eq(v, "optional")
    T.eq(text, "Facultative : le guide la prenait plus tôt, dans « Elwynn » (niveaux 10-12).",
        "the section's levels once, not in its title too")
end)

T.test("not needed by the guide: options off, then on", function()
    start(1)
    local v, text = verdict(TRANSLATION)
    T.eq(v, "useless")
    T.eq(text, "Inutile pour le guide : quête élite (option désactivée). Elle est niveau 30, tu es niveau 25.")
    T.eq(select(2, verdict(THREAD)), "Inutile pour le guide : quête de donjon (option désactivée).")
    Ding.db.ui.elites, Ding.db.ui.dungeons = true, true
    T.eq(select(3, verdict(TRANSLATION)).step, 4)
    T.eq(select(3, verdict(THREAD)).step, 6)
end)

T.test("not needed by the guide: race or class, elite, too high, WoW Forever, nothing known", function()
    start(1)
    T.eq(select(2, verdict(HERMIT)), "Inutile pour le guide : pour une autre race ou classe.")
    T.eq(select(2, verdict(MORLADIM)), "Inutile pour le guide : quête élite, à faire en groupe. Elle est niveau 35, tu es niveau 25.")
    T.eq(select(3, verdict(MORBENT)).reason, "elite", "Morbent Fel")
    T.eq(select(3, verdict(DAUGHTER)).reason, "elite", "The Daughter Who Lived: after Mor'Ladim")
    T.eq(select(2, verdict(OGRES)), "Inutile pour le guide : trop haute pour toi. Elle est niveau 30, tu es niveau 25.")
    T.eq(select(2, verdict(FOREVER)), "Inutile pour le guide : quête propre à WoW Forever, hors du parcours.")
    T.eq(select(2, verdict(NIGHT_WATCH)), "Inutile pour le guide : le parcours ne la prend pas.")
end)

T.test("a gray quest the guide skips", function()
    start(1, { level = 40 })
    Ding.db.ui.skipGrey = true
    local v, text = verdict(ZOMBIE)
    T.eq(v, "useless")
    T.eq(text, "Inutile pour le guide : quête grise, trop basse pour toi.")
    Ding.db.ui.skipGrey = false
end)

T.test("shown only when one quest at least is not for right now", function()
    start(1)
    T.eq(talk({ gives = { SUPPLIES } }), nil, "the current step's quest alone: nothing to say")
    H.closeDialog()
    local rows = talk({ gives = { SUPPLIES, NIGHT_WATCH } })
    T.ok(rows, "a quest the guide does not take: shown")
    T.eq(#rows, 2, "with every quest of the window")
    T.eq(rows[1].verdict, "take")
    T.eq(rows[2].verdict, "useless")
    H.closeDialog()
    T.eq(talk({ gives = {} }), nil, "no quest offered")
    H.closeDialog()
    E.guide = nil
    T.eq(talk({ gives = { NIGHT_WATCH } }), nil, "no guide")
    H.closeDialog()
end)

T.test("several quests: one row each, in the window's order, beside the gossip window", function()
    start(1)
    local rows = talk({ gives = { SUPPLIES, ZOMBIE, EFFIGY, OGRES, MORLADIM } })
    T.eq(#rows, 5)
    local verdicts = {}
    for i, e in ipairs(rows) do verdicts[i] = e.verdict end
    T.eq(table.concat(verdicts, " "), "take can notNow useless useless")
    local f = O.frame
    T.eq(H.plain(f.title:GetText()), "Ding! · Ces quêtes et ton guide")
    T.eq(rows[1].name, "[24] Fournitures en provenance de Darkshire", "the quest's name in the client's language")
    local point, rel, relPoint, x, y = f:GetPoint()
    T.eq(point, "TOPLEFT")
    T.eq(rel, UIParent)
    T.eq(relPoint, "BOTTOMLEFT")
    T.eq(x, 16 + 338 + 8, "on the right of the gossip window")
    T.eq(y, 652, "level with its top")
    T.ok(not f:IsMouseEnabled(), "information only: the mouse goes through")
end)

T.test("texts are never cut: names and lines wrap, the frame grows with them", function()
    start(1)
    talk({ gives = { EFFIGY, MORLADIM } })
    local f, needed = O.frame, 30
    for i = 1, 2 do
        local r = f.rows[i]
        T.eq(r.status:GetWidth(), r.name:GetWidth())
        needed = needed + r.name:GetStringHeight() + r.status:GetStringHeight()
    end
    T.ok(f.rows[1].status:GetStringHeight() >= 3 * 11, "a long line takes the lines it needs")
    T.ok(f:GetHeight() >= needed, "the frame holds every line")
    -- The next row starts under the whole text of the one before.
    local _, _, _, _, y1 = f.rows[1].status:GetPoint()
    local _, _, _, _, y2 = f.rows[2].name:GetPoint()
    T.ok(-y2 >= -y1 + f.rows[1].status:GetStringHeight(), "rows do not overlap")
    H.closeDialog()
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
    T.eq(x, 700 - 8 - 280)
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
    H.closeDialog()
    -- The current step's quest alone in its details: nothing to say.
    H.showQuest({ gives = { SUPPLIES } }, "detail", SUPPLIES)
    H.flush()
    T.ok(not O.frame:IsShown())
    H.closeDialog()
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

T.run()
