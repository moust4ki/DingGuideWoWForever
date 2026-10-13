-- Drafted by tools/draft_guide.lua from tools/routes/dwarf_gnome.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/DwarfGnome/04_Westfall.lua.
-- Simulated: level 14 (62%) -> 18 (30%), 28 quests turned in, about 4 h 28 (12 956 XP per hour).
Ding.RegisterGuide({
    id       = "dwarf-04-westfall",
    pack     = "ding-zones",
    title    = "Westfall (14-18)",
    faction  = "Alliance",
    races    = { "Dwarf", "Gnome" },
    minLevel = 14, maxLevel = 18,
    next     = "alliance-20-redridge",
    steps    = {
        { accept = 153, -- level 14
          note = "Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill." },
        { accept = { 102, 12 } }, -- level 14
        { accept = { 92745, 92744, 92747 } }, -- level 14
        { complete = 12 }, -- level 14
        { complete = { 153, 92747 } }, -- level 14
        { accept = 103 }, -- level 15
        { complete = 102 }, -- level 15
        { complete = 92744 }, -- level 15
        { accept = 136 }, -- level 15
        { turnin = 136, accept = 138 }, -- level 15
        { complete = 92745 }, -- level 15
        { complete = 103 }, -- level 15
        { accept = 92910, optional = true, -- level 15
          note = "If the starting item dropped: use it from your bags." },
        { accept = { 36, 151, 64 } }, -- level 15
        { complete = 151 }, -- level 15
        { turnin = 36, accept = { 22, 38, 109, 9 } }, -- level 15
        { turnin = 92910, optional = true }, -- level 15
        { accept = { 92909, 92911 } }, -- level 15
        { complete = { 92909, 92911 } }, -- level 15
        { turnin = { 92909, 92911 } }, -- level 16
        { turnin = { 92744, 92745 }, accept = { 92748, 92753 } }, -- level 16
        { sethearth = "Sentinel Hill" }, -- level 16
        { turnin = 153 }, -- level 16
        { turnin = { 102, 109, 12 }, accept = 13 }, -- level 16
        { turnin = 138, accept = 139 }, -- level 16
        { complete = 22 }, -- level 16
        { complete = { 9, 13 } }, -- level 16
        { accept = 92819 }, -- level 16
        { turnin = { 92819, 92753 } }, -- level 16
        { accept = 152 }, -- level 17
        { hearth = true }, -- level 17
        { turnin = 13, accept = 14 }, -- level 17
        { complete = 64 }, -- level 17
        { turnin = 139, accept = 140 }, -- level 17
        { turnin = 140 }, -- level 17
        { complete = 152 }, -- level 17
        { turnin = { 152, 103 } }, -- level 17
        { complete = 14 }, -- level 17
        { complete = 38 }, -- level 17
        { turnin = { 9, 38, 22 } }, -- level 17
        { turnin = { 64, 151 } }, -- level 17
        { hearth = true }, -- level 18
        { turnin = 92747 }, -- level 18
        { turnin = 14 }, -- level 18
        { turnin = { 1338, 92748 } }, -- level 18
    },
})
