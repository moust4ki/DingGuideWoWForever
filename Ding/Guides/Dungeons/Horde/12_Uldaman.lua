-- Uldaman, Horde, "Ding! - Dungeon quests": Patrick Garrett in Undercity, Dran Droffers's
-- necklace in Orgrimmar, Jarkal Mossmeld at Kargath and the Badlands' camps, the gates of Uldaman,
-- a first short visit to find the paladin's journal, Jarkal's translation, the dungeon, then the
-- turn-ins; the Platinum Discs optional. Theldurin's Yagyin's Digest follow-up (it needs three far
-- zones) is left out, so are the professions' and repeatable quests, and the mages' Power in
-- Uldaman, with Ding! - Class quests. Drafted with tools/draft_dungeon.lua, finished by hand; quest
-- ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/12_Uldaman.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-uldaman",
    pack     = "ding-dungeons",
    title    = "Uldaman (41-51)",
    faction  = "Horde",
    minLevel = 41, maxLevel = 51,
    steps    = {
        -- Undercity, Orgrimmar.
        { accept = 2342,
          why = { text = "About 3,600 XP for a chest at Uldaman's gates.", short = true },
          note = "Patrick Garrett, in Undercity." },
        { accept = 2283,
          why = { text = "Dran Droffers's chain goes back and forth between Orgrimmar, Kargath and Uldaman: it ends with a necklace and about 5,600 XP.", short = true },
          note = "Dran Droffers, in the Drag of Orgrimmar." },

        -- The Badlands.
        { accept = 2258,
          why = { text = "It opens Uldaman Reagent Run: restorative potions and about 3,450 XP.", short = true },
          note = "Jarkal Mossmeld, at Kargath, in the west of the Badlands." },
        { accept = 2418,
          why = { text = "Reward: leather or mail bracers, cloth boots or a shield.", short = true },
          note = "Rigglefuzz, in the middle of the Badlands." },
        { accept = 709,
          why = { text = "Reward: a cloth robe.", short = true },
          note = "Theldurin the Lost, in the south of the Badlands." },
        { complete = 2258,
          note = "The buzzards and crag coyotes of the Badlands drop the gizzards and fangs." },
        { complete = 709,
          note = "The tablet lies in an ancient chest by the gates of Uldaman, in the north of the Badlands." },
        { complete = { 2418, 2283 },
          note = "The Shadowforge dwarves around the gates drop the power stones and the shattered necklace." },
        { complete = 2342,
          note = "The Garrett family chest stands in the dig west of Uldaman's gates." },
        { turnin = 709,
          note = "Theldurin the Lost." },
        { turnin = 2258, accept = 2202,
          note = "Jarkal Mossmeld, at Kargath." },
        { turnin = 2283, accept = 2284,
          note = "Dran Droffers, in Orgrimmar." },
        { complete = 2202,
          note = "Magenta cap clusters grow on the cave walls, south-west of Uldaman's gates and inside." },

        -- Uldaman, a first time: the paladin's journal.
        { go = { 1418, 44.60, 12.10 }, radius = 30, text = "Enter Uldaman",
          note = "The dungeon's door is at the back of the cave by the dig at Uldaman's gates." },
        { turnin = 2284, accept = 2318,
          note = "A dead paladin rests just off the first great hall, down its second right-hand passage; then head out for Kargath." },
        { turnin = 2318, accept = 2338,
          note = "Jarkal Mossmeld, at Kargath." },
        { turnin = 2338, accept = 2339 },

        -- Uldaman again.
        { go = { 1418, 44.60, 12.10 }, radius = 30, text = "Enter Uldaman again" },
        { complete = 2339,
          note = "The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault; Archaedas, the last boss, in the Hall of the Crafters, drops the power source." },
        { accept = 2278, optional = true,
          why = { text = "Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Thunder Bluff with potions or a bag.", short = true },
          note = "The Discs of Norgannon, in the room behind Archaedas." },
        { complete = 2278, optional = true,
          note = "The Discs of Norgannon, in the room behind Archaedas." },
        { turnin = 2278, accept = 2280, optional = true },

        -- Turn-ins: Kargath, the Badlands, Orgrimmar, Undercity, Thunder Bluff.
        { turnin = { 2339, 2202 }, accept = 2340,
          note = "Jarkal Mossmeld, at Kargath." },
        { turnin = 2418,
          note = "Rigglefuzz, in the middle of the Badlands." },
        { turnin = 2340, accept = 2341,
          note = "Dran Droffers, in Orgrimmar." },
        { turnin = 2341,
          note = "Jarkal Mossmeld, at Kargath." },
        { turnin = 2342,
          note = "Patrick Garrett, in Undercity." },
        { turnin = 2280, accept = 2440, optional = true,
          note = "Sage Truthseeker, in Thunder Bluff." },
        { turnin = 2440, optional = true,
          note = "Bena Winterhoof, in Thunder Bluff." },
    },
})
