-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/27_Barrens.lua.
-- Simulated: level 27 (18%) -> 28 (77%), 20 quests turned in, about 4 h 47 (13 614 XP per hour).
Ding.RegisterGuide({
    id       = "horde-27-barrens",
    pack     = "ding-zones",
    title    = "The Barrens and Stonetalon (27-28)",
    faction  = "Horde",
    minLevel = 27, maxLevel = 28,
    next     = "horde-29-needles",
    steps    = {
        { accept = { 879, 97250 }, -- level 27
          note = "Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains." },
        { accept = 1095 }, -- level 27
        { accept = 1087 }, -- level 27
        { sethearth = "Sun Rock Retreat" }, -- level 27
        { accept = 6393 }, -- level 27
        { turnin = 1095, accept = 1096 }, -- level 27
        { accept = 1058 }, -- level 27
        { hearth = true }, -- level 27
        { accept = 6301 }, -- level 27
        { complete = 6301 }, -- level 27
        { complete = 1096 }, -- level 27
        { complete = 1058 }, -- level 27
        { complete = 1087 }, -- level 27
        { hearth = true }, -- level 27
        { accept = { 5881, 86576, 6282 } }, -- level 27
        { turnin = 6301, accept = 6381 }, -- level 27
        { complete = { 86576, 6282 } }, -- level 27
        { complete = { 6381, 6393 } }, -- level 27
        { hearth = true }, -- level 27
        { turnin = { 6393, 86576 } }, -- level 27
        { turnin = { 6282, 1087 } }, -- level 27
        { accept = 893 }, -- level 27
        { sethearth = "Camp Taurajo" }, -- level 27
        { accept = 79192 }, -- level 27
        { complete = 97250 }, -- level 27
        { accept = 843 }, -- level 27
        { complete = 879 }, -- level 27
        { complete = 893 }, -- level 27
        { complete = 843 }, -- level 27
        { accept = 857 }, -- level 28
        { hearth = true }, -- level 28
        { turnin = 893 }, -- level 28
        { accept = 1130 }, -- level 28
        { turnin = { 97250, 879 }, accept = 906 }, -- level 28
        { turnin = 1130 }, -- level 28
        { turnin = 1058 }, -- level 28
        { turnin = 1096 }, -- level 28
        { turnin = 6381 }, -- level 28
        { turnin = 79192, accept = 79980 }, -- level 28
        { turnin = 79980 }, -- level 28
        { turnin = 906 }, -- level 28
        { turnin = 843, accept = 846 }, -- level 28
        { complete = 846 }, -- level 28
        { turnin = 846, accept = 849 }, -- level 28
        { complete = 849 }, -- level 28
        { turnin = 849 }, -- level 28
        { complete = 857 }, -- level 28
        { turnin = 857 }, -- level 28
    },
})
