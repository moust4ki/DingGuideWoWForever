-- Orc and Troll track, levels 1-20: Valley of Trials, Durotar, the Barrens.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
-- The Barrens and Stonetalon stop at level 19 quests: the Horde trunk
-- (horde.lua) takes these zones from level 20 quests on.
local ORGRIMMAR, THUNDER_BLUFF = 1637, 1638

return {
    file = "orc_troll.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    faction = "Horde",
    races = { "Orc", "Troll" },
    guideRaces = { "Orc", "Troll" },
    next = "horde-20-barrens",
    guides = {
        { id = "orc-01-valley", file = "OrcTroll/01_ValleyOfTrials.lua", title = "Valley of Trials",
          areas = { 14, 363 }, box = { 1411, 36, 56, 53, 80 }, minLevel = 1, maxLevel = 5,
          intro = "Everything happens in the Valley of Trials: follow the arrow from NPC to NPC." },
        { id = "orc-02-durotar", file = "OrcTroll/02_Durotar.lua", title = "Durotar",
          areas = { 14 }, extraAreas = { ORGRIMMAR }, minLevel = 5, maxLevel = 11,
          intro = "Leave the valley by the road east, then north to Razor Hill: your base for Durotar." },
        { id = "orc-03-barrens", file = "OrcTroll/03_Barrens.lua", title = "The Barrens",
          areas = { 17, 406 }, extraAreas = { ORGRIMMAR, THUNDER_BLUFF }, minLevel = 11, maxLevel = 19, maxQuestLevel = 19,
          intro = "Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base." },
    },
}
