-- Undead track, levels 1-20: Deathknell, Tirisfal Glades, Silverpine Forest, the Barrens.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
-- Silverpine, the Barrens and Stonetalon stop at level 19 quests: the Horde trunk
-- (horde.lua) takes these zones from level 20 quests on.
-- The client calls the race "Scourge" (UnitRace, second value).
local UNDERCITY, TIRISFAL, ORGRIMMAR, THUNDER_BLUFF = 1497, 85, 1637, 1638

return {
    file = "undead.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    faction = "Horde",
    races = { "Scourge" },
    guideRaces = { "Scourge" },
    next = "horde-20-barrens",
    guides = {
        { id = "undead-01-deathknell", file = "Undead/01_Deathknell.lua", title = "Deathknell",
          areas = { 85, 154 }, box = { 1420, 26, 56, 39, 75 }, minLevel = 1, maxLevel = 6,
          intro = "Everything starts in Deathknell: follow the arrow from NPC to NPC." },
        { id = "undead-02-tirisfal", file = "Undead/02_Tirisfal.lua", title = "Tirisfal Glades",
          areas = { 85 }, extraAreas = { UNDERCITY }, minLevel = 6, maxLevel = 13,
          intro = "Leave Deathknell by the road east to Brill: your base for Tirisfal Glades." },
        { id = "undead-03-silverpine", file = "Undead/03_Silverpine.lua", title = "Silverpine Forest",
          areas = { 130 }, extraAreas = { UNDERCITY, TIRISFAL }, minLevel = 13, maxLevel = 15, maxQuestLevel = 19,
          intro = "From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base." },
        { id = "undead-04-barrens", file = "Undead/04_Barrens.lua", title = "The Barrens",
          areas = { 17, 406 }, extraAreas = { ORGRIMMAR, THUNDER_BLUFF }, minLevel = 15, maxLevel = 20, maxQuestLevel = 19,
          intro = "Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens." },
    },
}
