-- The Hall of Thanes, Alliance, "Ding! - Dungeon quests": a dungeon of WoW Forever beneath Old
-- Ironforge. Afadra Dunwall's and Thom Filch's quests in Ironforge, the Dark Iron map's lead to
-- Earthseer Farsen in Dun Morogh (only when the map dropped), the hall, then the turn-ins. DingDB
-- does not place the hall's monsters yet: the notes only say what the quests ask. Levels from its
-- quests. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains checked
-- against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/01_HallOfThanes.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-thanes",
    pack     = "ding-dungeons",
    title    = "The Hall of Thanes (13-18)",
    faction  = "Alliance",
    minLevel = 13, maxLevel = 18,
    steps    = {
        { accept = { 96394, 96403 },
          why = { text = "Two quests of the hall: a leather belt or mail bracers, cloth gloves or an off-hand tome.", short = true },
          note = "Afadra Dunwall and Thom Filch, in the west of Ironforge." },
        { accept = 96391, use = 274268, when = { item = 274268 },
          why = { text = "The Dark Iron map opens Old Ironforge Incursion: a gun, a wand or a two-handed mace.", short = true },
          note = "The Dark Iron spies of the east of Dun Morogh may drop a Dark Iron map: read it." },
        { turnin = 96391, when = { log = 96391 },
          note = "Earthseer Farsen, in the east of Dun Morogh." },
        { accept = 96393, when = { done = 96391 } },

        { go = { 1455, 27.63, 47.83 }, radius = 30, text = "Enter the Hall of Thanes",
          note = "The hall lies beneath Old Ironforge, in the west of the city." },
        { complete = 96394,
          note = "Kill the enraged apparitions and the tormented souls of the hall, then put the spirit of Anvilmar to rest." },
        { complete = 96403,
          note = "The dwarven heirlooms lie around the hall." },
        { accept = 98423, use = 281030, when = { item = 281030 },
          note = "The Treaty of Understanding lies in the hall: take it, then read it." },
        { complete = 96393, when = { log = 96393 },
          note = "Durgen Dirgehammer carries the head the quest asks for." },

        { turnin = { 96394, 96403 },
          note = "Afadra Dunwall and Thom Filch, in Ironforge." },
        { turnin = 96393, when = { log = 96393 },
          note = "King Magni Bronzebeard, in the High Seat of Ironforge." },
        { turnin = 98423, when = { log = 98423 },
          note = "King Magni Bronzebeard." },
    },
})
