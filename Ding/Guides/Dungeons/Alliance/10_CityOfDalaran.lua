-- City of Dalaran, Alliance, "Ding! - Dungeon quests": a dungeon of WoW Forever inside the dome
-- of Dalaran. Emissary Jacques's request in Hillsbrad, Archmage Modera's image by the city's walls,
-- Shylamiir and High Sorcerer Andromath in Stormwind, the city, then the turn-ins. DingDB does not
-- place the city's monsters yet: the notes only say what the quests ask. Levels from its quests.
-- Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against
-- DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/10_CityOfDalaran.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-dalaran",
    pack     = "ding-dungeons",
    title    = "City of Dalaran (31-35)",
    faction  = "Alliance",
    minLevel = 31, maxLevel = 35,
    steps    = {
        { accept = { 92456, 92489 },
          why = { text = "Two quests of the city from Stormwind: the blossom brings a cloak or a mail belt.", short = true },
          note = "Shylamiir, the herbalism trainer of Stormwind, and High Sorcerer Andromath, in the Mage Quarter." },
        { accept = 92432,
          note = "Emissary Jacques, in Hillsbrad Foothills." },
        { turnin = 92432,
          note = "The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest." },
        { accept = { 92457, 92458, 92459 },
          why = { text = "Archmage Modera's quests: a pendant or an off-hand rod, and an introduction to the Kirin Tor.", short = true },
          note = "The Image of Archmage Modera." },

        { go = { 1416, 8.46, 59.21 }, radius = 30, text = "Enter the City of Dalaran",
          note = "The city lies under its dome, in the west of the Alterac Mountains." },
        { complete = 92457,
          note = "Eight seeking remnants, eight saturated remnants and eight mana echoes, inside the city." },
        { complete = 92458,
          note = "The arcane mote, inside the city." },
        { complete = 92456,
          note = "A fel infused blossom, inside the city." },
        { complete = 92489,
          note = "The mana elemental, inside the city." },
        { turnin = 92459,
          note = "Archmage Celindra, in the City of Dalaran." },

        { turnin = { 92457, 92458 },
          note = "The Image of Archmage Modera, by the walls of Dalaran." },
        { turnin = { 92456, 92489 },
          note = "Shylamiir and High Sorcerer Andromath, in Stormwind." },
    },
})
