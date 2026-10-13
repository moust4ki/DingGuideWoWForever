-- Dwarf and Gnome track, levels 1-20: Coldridge Valley, Dun Morogh, Loch Modan, Westfall.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
return {
    file = "dwarf_gnome.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    races = { "Dwarf", "Gnome" },
    guideRaces = { "Dwarf", "Gnome" },
    next = "alliance-20-redridge",
    guides = {
        { id = "dwarf-01-coldridge", file = "DwarfGnome/01_Coldridge.lua", title = "Coldridge Valley",
          areas = { 132, 1 }, box = { 1426, 15, 58, 38, 82 }, minLevel = 1, maxLevel = 5,
          intro = "Everything starts in Coldridge: follow the arrow from NPC to NPC." },
        { id = "dwarf-02-dunmorogh", file = "DwarfGnome/02_DunMorogh.lua", title = "Dun Morogh",
          areas = { 1 }, extraAreas = { 1537 }, minLevel = 5, maxLevel = 11,
          intro = "Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh." },
        { id = "dwarf-03-lochmodan", file = "DwarfGnome/03_LochModan.lua", title = "Loch Modan",
          areas = { 38 }, extraAreas = { 1537 }, minLevel = 11, maxLevel = 14,
          intro = "Take the road east through the South Gate tunnel to Thelsamar." },
        { id = "dwarf-04-westfall", file = "DwarfGnome/04_Westfall.lua", title = "Westfall",
          areas = { 40 }, extraAreas = { 1519 }, minLevel = 14, maxLevel = 18,
          intro = "Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill." },
    },
}
