-- Blackfathom Deeps, Horde, "Ding! - Dungeon quests": Tsunaman's lead in Stonetalon
-- (optional), the Earthen Ring's Je'neu Sancrea at Zoram'gar Outpost, the cave before the deeps,
-- the deeps, then the turn-ins; the drops that start a quest only when they dropped. The
-- warlocks' Orb of Soran'ruk, which also needs Shadowfang Keep, stays with Ding! - Class quests.
-- Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against
-- DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/05_BlackfathomDeeps.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-blackfathom",
    pack     = "ding-dungeons",
    title    = "Blackfathom Deeps (24-32)",
    faction  = "Horde",
    minLevel = 24, maxLevel = 32,
    steps    = {
        { accept = 6562, optional = true,
          why = { text = "Optional: a lead from Stonetalon to Zoram'gar Outpost.", short = true },
          note = "Tsunaman, at Sun Rock Retreat, in Stonetalon Mountains." },
        { turnin = 6562, optional = true,
          note = "Je'neu Sancrea, at Zoram'gar Outpost, on Ashenvale's coast." },
        { accept = { 6563, 6921 },
          why = { text = "The Earthen Ring's quests: Amongst the Ruins wakes Baron Aquanis, whose drop starts a quest with a sword among its rewards.", short = true },
          note = "Je'neu Sancrea, at Zoram'gar Outpost." },

        { go = { 1440, 14.50, 14.20 }, radius = 30, text = "Enter Blackfathom Deeps",
          note = "The deeps open in ruins half under water, on the coast of Zoram Strand." },
        { complete = 6563,
          note = "The Sapphires of Aku'Mai grow on the walls of the cave before the dungeon's door." },
        { accept = 6564, use = 16790, when = { item = 16790 },
          note = "The Blackfathom tide priestesses of that cave may drop a damp note: read it." },
        { turnin = 6564, when = { log = 6564 },
          note = "Back to Je'neu Sancrea, at Zoram'gar Outpost, before the dungeon." },
        { accept = 6565, when = { done = 6564 } },
        { accept = 6561,
          why = { text = "Reward: a wand, a shield or leather armor.", short = true },
          note = "Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar." },
        { complete = 6565, when = { log = 6565 },
          note = "Lorgus Jett walks the nooks on the west side, south of the Pool of Ask'ar." },
        { complete = 6921,
          note = "The Fathom Stone lies under the water in the middle of the Moonshrine Ruins, under the walkway before Kelris; taking its core wakes Baron Aquanis." },
        { accept = 6922, use = 16782, when = { item = 16782 },
          note = "Baron Aquanis may drop a Strange Water Globe: use it." },
        { complete = 6561,
          note = "Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum." },

        { turnin = { 6563, 6921 },
          note = "Je'neu Sancrea, at Zoram'gar Outpost." },
        { turnin = 6565, when = { log = 6565 } },
        { turnin = 6922, when = { log = 6922 } },
        { turnin = 6561,
          note = "Bashana Runetotem, on the Elder Rise of Thunder Bluff." },
    },
})
