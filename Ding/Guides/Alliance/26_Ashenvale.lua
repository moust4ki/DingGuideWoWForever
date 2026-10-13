-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/26_Ashenvale.lua.
-- Simulated: level 26 (18%) -> 27 (22%), 23 quests turned in, about 2 h 17 (17 144 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-26-ashenvale",
    pack     = "ding-zones",
    title    = "Ashenvale (26-27)",
    faction  = "Alliance",
    minLevel = 26, maxLevel = 27,
    next     = "alliance-28-stonetalon",
    steps    = {
        { accept = 78133, -- level 26
          note = "Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base." },
        { turnin = 78133, accept = 78132 }, -- level 26
        { turnin = 78132, accept = 78134 }, -- level 26
        { turnin = 78134 }, -- level 26
        { accept = 991 }, -- level 26
        { accept = 1010 }, -- level 26
        { turnin = 991, accept = 1023 }, -- level 26
        { complete = 1023 }, -- level 26
        { accept = 1007 }, -- level 26
        { complete = 1007 }, -- level 26
        { turnin = 1007, accept = 1009 }, -- level 26
        { complete = 1009 }, -- level 26
        { turnin = 1009 }, -- level 26
        { complete = 1010 }, -- level 26
        { turnin = 1010, accept = 1020 }, -- level 26
        { turnin = 1023, accept = { 1024, 1025, 1054 } }, -- level 26
        { turnin = 1020, accept = 1033 }, -- level 26
        { complete = 1033 }, -- level 26
        { turnin = 1024, accept = 1026 }, -- level 26
        { complete = 1026 }, -- level 26
        { turnin = 1026, accept = 1027 }, -- level 26
        { complete = 1025 }, -- level 26
        { complete = 1027 }, -- level 26
        { turnin = 1027, accept = 1028 }, -- level 26
        { turnin = 1028, accept = 1055 }, -- level 26
        { turnin = 1055, accept = 1029 }, -- level 26
        { complete = 1054 }, -- level 26
        { sethearth = "Astranaar" }, -- level 26
        { turnin = 1033, accept = 1034 }, -- level 26
        { turnin = { 1029, 1054, 1025 }, accept = 1030 }, -- level 27
        { accept = { 4581, 1070 } }, -- level 27
        { complete = 1034 }, -- level 27
        { turnin = 1030 }, -- level 27
        { accept = 98027 }, -- level 27
        { turnin = 4581, accept = 1011 }, -- level 27
        { complete = 1011 }, -- level 27
        { turnin = 1011 }, -- level 27
        { hearth = true }, -- level 27
        { turnin = { 98027, 1034 } }, -- level 27
    },
})
