-- Night Elf track after Shadowglen (hand-written), levels 6-18: Teldrassil, Darkshore, then
-- Loch Modan by the boat to Menethil (Darkshore's last quests are worth less than the
-- trunk's: the track moves on at 16 instead of grinding there).
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
return {
    file = "nightelf.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    races = { "NightElf" },
    guideRaces = { "NightElf" },
    prior = { "Ding/Guides/NightElf/01_Shadowglen.lua" },
    next = "alliance-20-redridge",
    guides = {
        { id = "nightelf-02-dolanaar", file = "NightElf/02_Teldrassil.lua", title = "Teldrassil",
          areas = { 141, 188 }, extraAreas = { 1657 }, minLevel = 6, maxLevel = 11,
          start = { 141, 55.6, 59.8 },
          intro = "Dolanaar is your base for Teldrassil: inn, class trainers and most quests." },
        { id = "nightelf-03-darkshore", file = "NightElf/03_Darkshore.lua", title = "Darkshore",
          areas = { 148 }, extraAreas = { 1657, 141 }, minLevel = 11, maxLevel = 19,
          intro = "Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore." },
        { id = "nightelf-04-lochmodan", file = "NightElf/04_LochModan.lua", title = "Loch Modan",
          areas = { 38 }, extraAreas = { 1537 }, minLevel = 19, maxLevel = 21,
          intro = "Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base." },
    },
}
