-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/28_Stonetalon.lua.
-- Simulated: level 27 (22%) -> 27 (65%), 10 quests turned in, about 1 h 12 (13 923 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-28-stonetalon",
    pack     = "ding-zones",
    title    = "Stonetalon Mountains (27)",
    faction  = "Alliance",
    minLevel = 27, maxLevel = 27,
    next     = "alliance-29-ashenvale",
    steps    = {
        { turnin = 1070, accept = 1085, -- level 27
          note = "The Stonetalon Mountains are west of Ashenvale." },
        { turnin = 1085, accept = 1071 }, -- level 27
        { accept = 1093 }, -- level 27
        { complete = { 1093, 1071 } }, -- level 27
        { accept = 1090 }, -- level 27
        { complete = 1090 }, -- level 27
        { turnin = 1090, accept = 1092 }, -- level 27
        { turnin = 1071, accept = 1075 }, -- level 27
        { turnin = { 1092, 1093 } }, -- level 27
        { accept = 78270 }, -- level 27
        { turnin = 78270 }, -- level 27
        { accept = 86574 }, -- level 27
        { sethearth = "Stonetalon Peak" }, -- level 27
        { accept = 1057 }, -- level 27
        { complete = 86574 }, -- level 27
        { accept = 79980 }, -- level 27
        { turnin = 79980 }, -- level 27
        { complete = 1057 }, -- level 27
        { hearth = true }, -- level 27
        { turnin = { 86574, 1057 } }, -- level 27
    },
})
