-- Razorfen Kraul, Horde, "Ding! - Dungeon quests": Master Apothecary Faranell's guano in
-- Undercity, Auld Stonespire in Thunder Bluff, the shamans' Elemental Aid at Freewind Post, Mebok
-- Mizzyrix's tubers in Ratchet, the kraul, then the turn-ins; Charlga's scroll, which leads to
-- Razorfen Downs, only when it dropped. The warriors' Brutal Armor, a long armor chain, stays out
-- (Ding! - Class quests leaves it out too). Drafted with tools/draft_dungeon.lua, finished by
-- hand; quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/08_RazorfenKraul.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-kraul",
    pack     = "ding-dungeons",
    title    = "Razorfen Kraul (29-38)",
    faction  = "Horde",
    minLevel = 29, maxLevel = 38,
    steps    = {
        { accept = 1109,
          why = { text = "It opens Hearts of Zeal, a quest of the Scarlet Monastery.", short = true },
          note = "Master Apothecary Faranell, in the Apothecarium of Undercity." },
        { accept = 1102,
          why = { text = "Reward: cloth shoulders, a mail belt or a shield, and about 4,050 XP.", short = true },
          note = "Auld Stonespire, in Thunder Bluff." },
        { accept = 79360, classes = { "SHAMAN" },
          why = { text = "Shamans: Charlga Razorflank carries the note this quest asks for.", short = true },
          note = "Rau Cliffrunner, at Freewind Post, in Thousand Needles." },
        { accept = 1221,
          why = { text = "Reward: a small container of gems.", short = true },
          note = "Mebok Mizzyrix, in Ratchet." },
        { collect = { { 5880, 1 }, { 5897, 1 } },
          note = "Take the crate with holes and the owner's manual beside Mebok, and read the manual." },

        { go = { 1413, 42.90, 90.20 }, radius = 30, text = "Enter Razorfen Kraul",
          note = "The kraul's thorny mound rises in the far south of the Barrens." },
        { complete = 1109,
          note = "The kraul bats of the cave west of the bridges drop the guano." },
        { complete = 1221,
          note = "Past Overlord Ramtusk, open the crate to call the gopher and use the stick on it: it digs up the tubers." },
        { complete = 1102,
          note = "Charlga Razorflank, the last boss, holds the top of the kraul." },
        { complete = 79360, classes = { "SHAMAN" },
          note = "Charlga Razorflank, the last boss, holds the top of the kraul." },
        { accept = 6522, use = 17008, when = { item = 17008 },
          note = "Charlga may drop a small scroll: read it." },
        { accept = 1144,
          why = { text = "Reward: a ring of your choice.", short = true },
          note = "Willix the Importer waits in a tent below Charlga's platform." },
        { complete = 1144,
          note = "Lead Willix back to the entrance; quilboar attack on the way." },
        { turnin = 1144 },

        { turnin = 1221,
          note = "Mebok Mizzyrix, in Ratchet." },
        { turnin = 79360, classes = { "SHAMAN" },
          note = "Rau Cliffrunner, at Freewind Post." },
        { turnin = 1102,
          note = "Auld Stonespire, in Thunder Bluff." },
        { turnin = 1109,
          note = "Master Apothecary Faranell, in Undercity." },
        { turnin = 6522, when = { log = 6522 },
          why = { text = "It opens An Unholy Alliance, a quest of Razorfen Downs.", short = true },
          note = "Varimathras, in the Royal Quarter of Undercity." },
    },
})
