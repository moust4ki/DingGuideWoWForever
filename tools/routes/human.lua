-- Human track, levels 1-20: Northshire, Elwynn Forest, Westfall, Loch Modan.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
return {
    file = "human.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    races = { "Human" },
    guideRaces = { "Human" },
    next = "alliance-20-redridge",
    guides = {
        { id = "human-01-northshire", file = "Human/01_Northshire.lua", title = "Northshire",
          areas = { 9, 12 }, box = { 1429, 40, 25, 60, 48 }, minLevel = 1, maxLevel = 5,
          intro = "Everything happens around Northshire Abbey: follow the arrow from NPC to NPC." },
        { id = "human-02-elwynn", file = "Human/02_Elwynn.lua", title = "Elwynn Forest",
          areas = { 12 }, extraAreas = { 1519 }, minLevel = 5, maxLevel = 12,
          intro = "Goldshire is your base for the whole forest: inn, class trainers and quests." },
        { id = "human-03-westfall", file = "Human/03_Westfall.lua", title = "Westfall",
          areas = { 40 }, extraAreas = { 1519, 12 }, minLevel = 12, maxLevel = 16,
          intro = "Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall." },
        { id = "human-04-lochmodan", file = "Human/04_LochModan.lua", title = "Loch Modan",
          areas = { 38 }, extraAreas = { 1537 }, minLevel = 16, maxLevel = 18,
          intro = "Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar." },
    },
}
