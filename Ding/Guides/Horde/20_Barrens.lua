-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/20_Barrens.lua.
-- Simulated: level 19 (0%) -> 20 (65%), 16 quests turned in, about 2 h 24 (15 349 XP per hour).
Ding.RegisterGuide({
    id       = "horde-20-barrens",
    pack     = "ding-zones",
    title    = "The Barrens and Stonetalon (19-20)",
    faction  = "Horde",
    minLevel = 19, maxLevel = 20,
    next     = "horde-23-ashenvale",
    steps    = {
        { accept = { 4921, 95774, 899 }, -- level 19
          note = "The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens." },
        { accept = 878 }, -- level 19
        { complete = 878 }, -- level 19
        { complete = { 4921, 95774, 899 } }, -- level 19
        { turnin = 878, accept = 5052 }, -- level 19
        { complete = 5052 }, -- level 19
        { turnin = 5052 }, -- level 19
        { accept = 891 }, -- level 19
        { sethearth = "Ratchet" }, -- level 19
        { accept = 898 }, -- level 19
        { complete = 891 }, -- level 19
        { hearth = true }, -- level 19
        { accept = 92706 }, -- level 19
        { complete = { 92706, 898 } }, -- level 19
        { turnin = { 898, 891 } }, -- level 19
        { accept = 1483 }, -- level 19
        { turnin = 92706, accept = 1069 }, -- level 19
        { turnin = { 4921, 899 } }, -- level 19
        { accept = 868 }, -- level 20
        { complete = 868 }, -- level 20
        { sethearth = "Sun Rock Retreat" }, -- level 20
        { accept = 6562 }, -- level 20
        { complete = 1069 }, -- level 20
        { accept = 1093 }, -- level 20
        { complete = 1093 }, -- level 20
        { turnin = { 1093, 1483 }, accept = 1094 }, -- level 20
        { accept = 1090 }, -- level 20
        { complete = 1090 }, -- level 20
        { turnin = 1090, accept = 1092 }, -- level 20
        { turnin = 868 }, -- level 20
        { turnin = 95774 }, -- level 20
        { accept = 97003 }, -- level 20
        { complete = 97003 }, -- level 20
        { turnin = 97003 }, -- level 20
        { turnin = { 1094, 1069 } }, -- level 20
        { hearth = true }, -- level 20
        { turnin = 1092 }, -- level 20
    },
})
