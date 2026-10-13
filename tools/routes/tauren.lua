-- Tauren track, levels 1-20: Camp Narache, Mulgore, the Barrens.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
-- The Barrens and Stonetalon stop at level 19 quests: the Horde trunk
-- (horde.lua) takes these zones from level 20 quests on.
local ORGRIMMAR, THUNDER_BLUFF = 1637, 1638

return {
    file = "tauren.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    faction = "Horde",
    races = { "Tauren" },
    guideRaces = { "Tauren" },
    next = "horde-20-barrens",
    guides = {
        { id = "tauren-01-narache", file = "Tauren/01_CampNarache.lua", title = "Camp Narache",
          areas = { 215, 220 }, box = { 1412, 30, 70, 62, 95 }, minLevel = 1, maxLevel = 5,
          intro = "Everything starts at Camp Narache: follow the arrow from NPC to NPC." },
        { id = "tauren-02-mulgore", file = "Tauren/02_Mulgore.lua", title = "Mulgore",
          areas = { 215 }, extraAreas = { THUNDER_BLUFF }, minLevel = 5, maxLevel = 12,
          intro = "Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore." },
        { id = "tauren-03-barrens", file = "Tauren/03_Barrens.lua", title = "The Barrens",
          areas = { 17, 406 }, extraAreas = { THUNDER_BLUFF, ORGRIMMAR }, minLevel = 12, maxLevel = 19, maxQuestLevel = 19,
          intro = "Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base." },
    },
}
