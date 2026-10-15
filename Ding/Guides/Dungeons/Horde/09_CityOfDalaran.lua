-- City of Dalaran, Horde, "Ding! - Dungeon quests": a dungeon of WoW Forever inside the dome of
-- Dalaran. Archmage Modera's image by the city's walls, Melisara and Magus Wordeen Voidglare in
-- Tarren Mill, Doctor Martin Felben in Undercity, the city, then the turn-ins. Opportunistic
-- Education is left out: DingDB does not know who gives it. DingDB does not place the city's
-- monsters yet: the notes only say what the quests ask. Levels from its quests. Drafted with
-- tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against DingDB
-- (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/09_CityOfDalaran.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-dalaran",
    pack     = "ding-dungeons",
    title    = "City of Dalaran (31-35)",
    faction  = "Horde",
    minLevel = 31, maxLevel = 35,
    steps    = {
        { accept = 96988,
          why = { text = "Reward: a wand or a cloak.", short = true },
          note = "Doctor Martin Felben, in the Apothecarium of Undercity." },
        { accept = { 96986, 97287 },
          why = { text = "Tarren Mill's quests: The Grave Knight brings leather boots or mail bracers.", short = true },
          note = "Melisara and Magus Wordeen Voidglare, in Tarren Mill, in Hillsbrad Foothills." },
        { accept = 96984,
          why = { text = "Reward: a staff or mail shoulders.", short = true },
          note = "The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest." },

        { go = { 1416, 8.46, 59.21 }, radius = 30, text = "Enter the City of Dalaran",
          note = "The city lies under its dome, in the west of the Alterac Mountains." },
        { complete = 96984,
          note = "The arcane mote, inside the city." },
        { complete = 96986,
          note = "Atrexis the Grave Knight, inside the city." },
        { complete = 96988,
          note = "Six cracked sentry cores, from the fragmented sentries of the city." },
        { turnin = 97287,
          note = "Archmage Celindra, in the City of Dalaran." },

        { turnin = { 96984, 96986 },
          note = "Magus Wordeen Voidglare and Melisara, in Tarren Mill." },
        { turnin = 96988,
          note = "Doctor Martin Felben, in Undercity." },
    },
})
