-- Scarlet Monastery, Horde, "Ding! - Dungeon quests": Dorn Plainstalker's tests in Thousand
-- Needles and Braug Dimspirit's tests of lore in Stonetalon (optional, a long chain that ends with
-- the Library's book), Sage Truthseeker in Thunder Bluff, Varimathras and the apothecaries in
-- Undercity, the monastery's four wings, then the turn-ins and Vorrel Sengutz's ring. Hearts of
-- Zeal only once Faranell's guano from Razorfen Kraul is turned in. The mages' Rituals of Power
-- stays with Ding! - Class quests. Drafted with tools/draft_dungeon.lua, finished by hand; quest
-- ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/10_ScarletMonastery.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-scarlet",
    pack     = "ding-dungeons",
    title    = "Scarlet Monastery (34-45)",
    faction  = "Horde",
    minLevel = 34, maxLevel = 45,
    steps    = {
        -- The tests of Thousand Needles and Stonetalon (optional).
        { accept = 1149, optional = true,
          why = { text = "Optional: a chain of ten quests through Thousand Needles, Stonetalon, Ashenvale and Undercity, up to a book of the monastery; it ends with a mace or a wand and about 4,200 XP.", short = true },
          note = "Dorn Plainstalker, in Thousand Needles." },
        { complete = 1149, optional = true,
          note = "Leap from the wooden planks over the canyon, in the west of Thousand Needles." },
        { turnin = 1149, accept = 1150, optional = true },
        { complete = 1150, optional = true,
          note = "Grenka Bloodscreech, a harpy of the west of Thousand Needles." },
        { turnin = 1150, accept = 1151, optional = true },
        { complete = 1151, optional = true,
          note = "Rok'Alim the Pounder, an elemental of the north-west of Thousand Needles." },
        { turnin = 1151, accept = 1152, optional = true },
        { turnin = 1152, accept = 1154, optional = true,
          note = "Braug Dimspirit, in the east of Stonetalon Mountains." },
        { complete = 1154, optional = true,
          note = "The Legacy of the Aspects, a book in the south-east of Ashenvale." },
        { turnin = 1154, accept = 6627, optional = true,
          note = "Braug Dimspirit, in Stonetalon." },
        { complete = 6627, optional = true,
          note = "Braug Dimspirit asks a question: give him the right answer." },
        { turnin = 6627, accept = 1159, optional = true },

        -- Thunder Bluff, Undercity.
        { accept = 1049, races = { "Orc", "Tauren", "Troll" },
          why = { text = "Reward: a shield or an off-hand orb, and about 3,550 XP.", short = true },
          note = "Sage Truthseeker, in Thunder Bluff." },
        { turnin = 1159, accept = 1160, optional = true,
          note = "Parqual Fintallas, in Undercity." },
        { accept = 1048,
          why = { text = "Reward: a sword, an off-hand cane or a necklace, and about 5,150 XP.", short = true },
          note = "Varimathras, in the Royal Quarter of Undercity." },
        { accept = 1113, when = { done = 1109 },
          note = "Master Apothecary Faranell, in the Apothecarium." },

        -- The monastery.
        { go = { 1420, 82.60, 33.80 }, radius = 30, text = "Enter the Scarlet Monastery",
          note = "The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door." },
        { accept = 1051,
          why = { text = "Reward: a cloth cape or shoulders, or leather boots; the ring it asks for is in the Alterac Mountains.", short = true },
          note = "Graveyard: Vorrel Sengutz lies on a table on the right of the Chamber of Atonement, by Interrogator Vishas." },
        { complete = 1113, when = { log = 1113 },
          note = "Every Scarlet of the monastery may drop a heart." },
        { complete = 1160, optional = true,
          note = "Library: the book rests on a table, in the first side room on the left as you walk the Gallery of Treasures." },
        { complete = 1049, races = { "Orc", "Tauren", "Troll" },
          note = "Library: the Compendium stands on a bookcase on the left wall at the entrance of the Athenaeum." },
        { complete = 1048,
          note = "Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral." },

        -- Turn-ins.
        { turnin = 1160, accept = 6628, optional = true,
          note = "Parqual Fintallas, in Undercity." },
        { complete = 6628, optional = true,
          note = "Parqual Fintallas asks a question: give him the right answer." },
        { turnin = 6628, accept = 1394, optional = true },
        { turnin = 1048,
          note = "Varimathras, in the Royal Quarter." },
        { turnin = 1113, when = { log = 1113 },
          note = "Master Apothecary Faranell, in the Apothecarium." },
        { complete = 1051,
          note = "Nancy Vishas, an elite, keeps the ring in a house of the Alterac Mountains." },
        { turnin = 1051,
          note = "Monika Sengutz, in Tarren Mill, in Hillsbrad Foothills." },
        { turnin = 1049, races = { "Orc", "Tauren", "Troll" },
          note = "Sage Truthseeker, in Thunder Bluff." },
        { turnin = 1394, optional = true,
          note = "Dorn Plainstalker, in Thousand Needles." },
    },
})
