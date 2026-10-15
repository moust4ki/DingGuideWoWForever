-- Scarlet Monastery, Alliance, "Ding! - Dungeon quests": Brother Crowley's lead in Stormwind
-- (optional), Brother Anton's Down the Scarlet Path in Desolace and Raleigh the Devout in
-- Southshore (it opens In the Name of the Light), Librarian Mae Paledust in Ironforge, Magus
-- Olvek's book in the Alterac Mountains, the monastery's four wings, then the turn-ins. The mages'
-- Rituals of Power stays with Ding! - Class quests. Drafted with tools/draft_dungeon.lua,
-- finished by hand; quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/11_ScarletMonastery.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-scarlet",
    pack     = "ding-dungeons",
    title    = "Scarlet Monastery (34-45)",
    faction  = "Alliance",
    minLevel = 34, maxLevel = 45,
    steps    = {
        { accept = 6141, optional = true,
          why = { text = "Optional: a lead to Brother Anton in Desolace.", short = true },
          note = "Brother Crowley, in the Cathedral of Light of Stormwind." },
        { accept = 1050,
          why = { text = "Reward: a necklace, and about 3,550 XP.", short = true },
          note = "Librarian Mae Paledust, in the Hall of Explorers of Ironforge." },
        { turnin = 6141, optional = true,
          note = "Brother Anton, at Nijel's Point, in Desolace." },
        { accept = 261,
          why = { text = "Down the Scarlet Path, in Desolace then Southshore, opens In the Name of the Light: a weapon or an off-hand orb, and about 4,700 XP.", short = true },
          note = "Brother Anton, at Nijel's Point." },
        { complete = 261,
          note = "The undead ravagers roam the south-east of Desolace." },
        { turnin = 261, accept = 1052,
          note = "Brother Anton, at Nijel's Point." },
        { turnin = 1052, accept = 1053,
          note = "Raleigh the Devout, in the inn of Southshore, in Hillsbrad Foothills." },
        { accept = 96800,
          why = { text = "About 3,200 XP.", short = true },
          note = "Magus Olvek, in the west of the Alterac Mountains." },

        { go = { 1420, 82.60, 33.80 }, radius = 30, text = "Enter the Scarlet Monastery",
          note = "The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door." },
        { complete = 96800,
          note = "Magus Olvek's book lies somewhere in the monastery." },
        { complete = 1050,
          note = "Library: the book lies on the floor under a window, on the left of the room after the Gallery of Treasures." },
        { complete = 1053,
          note = "Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral." },

        { turnin = 96800,
          note = "Magus Olvek, in the Alterac Mountains." },
        { turnin = 1053,
          note = "Raleigh the Devout, in Southshore." },
        { turnin = 1050,
          note = "Librarian Mae Paledust, in Ironforge." },
    },
})
