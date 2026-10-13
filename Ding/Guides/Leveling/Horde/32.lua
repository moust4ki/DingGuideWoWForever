-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/32.lua.
-- Simulated (warrior): Orc 50 (47%) -> 50 (72%) in 4 min, 7 quests turned in; Scourge 50 (47%) -> 50 (72%) in 4 min, 7 quests turned in; Tauren 50 (47%) -> 50 (72%) in 4 min, 7 quests turned in; Troll 50 (47%) -> 50 (72%) in 4 min, 7 quests turned in; Skyborne 50 (47%) -> 50 (72%) in 4 min, 7 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h32-blasted-lands",
    title    = "Blasted Lands (50-51)",
    faction  = "Horde",
    minLevel = 50, maxLevel = 51,
    next     = "leveling-h33-searing-gorge",
    steps    = {
        { go = { 1419, 50.55, 14.2 }, text = "Travel to the Blasted Lands", -- level 50
          note = "Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows." },
        { accept = { 2581, 2583, 2585 } }, -- level 50
        { accept = { 2601, 2603 } }, -- level 50
        { collect = { { 8396, 14 } }, spots = { { 1419, 56.54, 35.37 }, { 1419, 46.17, 18.75 }, { 1419, 46.17, 22.63 }, { 1419, 49.97, 17.55 }, { 1419, 54.43, 36.24 }, { 1419, 54.74, 44.45 }, { 1419, 56.14, 29.56 }, { 1419, 48.85, 19.57 }, { 1419, 57.86, 44.54 }, { 1419, 59.83, 39.65 }, { 1419, 61.34, 26.77 } }, -- level 50
          note = "Hunt the vultures. Prioritize these targets." },
        { collect = { { 8394, 11 } }, spots = { { 1419, 54.37, 29.86 }, { 1419, 44.36, 31.24 }, { 1419, 45.45, 42.66 }, { 1419, 45.46, 46.37 }, { 1419, 45.35, 52.37 }, { 1419, 46.54, 35.96 }, { 1419, 47.44, 49.36 }, { 1419, 49.34, 53.45 }, { 1419, 51.45, 36.63 }, { 1419, 51.37, 40.77 }, { 1419, 52.44, 57.55 }, { 1419, 54.46, 43.45 }, { 1419, 57.34, 35.86 }, { 1419, 57.64, 31.04 }, { 1419, 58.34, 27.46 }, { 1419, 62.43, 28.24 } }, -- level 50
          note = "Hunt basilisks. They appear in the same spots as the boars." },
        { collect = { { 8392, 6 } }, spots = { { 1419, 57.26, 27.23 }, { 1419, 44.37, 31.45 }, { 1419, 44.45, 36.35 }, { 1419, 45.25, 41.65 }, { 1419, 45.45, 45.14 }, { 1419, 45.34, 52.56 }, { 1419, 47.34, 37.23 }, { 1419, 47.66, 49.16 }, { 1419, 51.15, 37.35 }, { 1419, 51.15, 57.55 }, { 1419, 52.74, 52.34 }, { 1419, 53.85, 34.44 }, { 1419, 54.45, 30.86 }, { 1419, 54.44, 43.54 }, { 1419, 57.17, 35.63 }, { 1419, 61.84, 30.83 }, { 1419, 62.57, 26.17 } }, -- level 50
          note = "Kill boars for these. Basilisks compete for the same spawn points." },
        { collect = { { 8391, 5 } }, spots = { { 1419, 58.17, 31.74 }, { 1419, 43.45, 26.35 }, { 1419, 44.25, 29.57 }, { 1419, 44.35, 19.37 }, { 1419, 46.16, 15.35 }, { 1419, 48.34, 23.54 }, { 1419, 50.65, 17.35 }, { 1419, 54.97, 38.04 }, { 1419, 55.14, 41.14 }, { 1419, 56.43, 45.74 }, { 1419, 58.37, 36.66 }, { 1419, 59.24, 40.37 }, { 1419, 59.94, 43.44 }, { 1419, 61.46, 48.44 }, { 1419, 61.63, 34.46 }, { 1419, 62.15, 38.95 }, { 1419, 62.96, 44.66 } }, -- level 50
          note = "Hunt hyenas for these. Scorpions spawn in the same spots." },
        { collect = { { 8393, 6 } }, spots = { { 1419, 47.57, 18.75 }, { 1419, 43.45, 26.35 }, { 1419, 44.35, 19.37 }, { 1419, 44.46, 22.44 }, { 1419, 44.37, 29.83 }, { 1419, 46.43, 15.45 }, { 1419, 47.34, 22.66 }, { 1419, 49.34, 16.44 }, { 1419, 49.55, 24.75 }, { 1419, 50.36, 29.04 }, { 1419, 58.46, 41.96 }, { 1419, 60.16, 35.86 }, { 1419, 61.55, 45.75 } }, -- level 50
          note = "The foes here are scorpions. Hyenas also use these spawn spots." },
        { accept = 3501, when = { item = 10593 } }, -- level 50
        { accept = 2521, when = { item = 8244 } }, -- level 50
        { turnin = 3501, when = { log = 3501, ready = 3501 } }, -- level 50
        { turnin = 2521, when = { log = 2521, ready = 2521 } }, -- level 50
        { turnin = 2601, when = { ready = 2601 } }, -- level 50
        { turnin = 2603, when = { ready = 2603 } }, -- level 50
        { turnin = 2581, when = { ready = 2581 } }, -- level 50
        { turnin = 2583, when = { ready = 2583 } }, -- level 50
        { turnin = 2585, when = { ready = 2585 } }, -- level 50
        { destroy = { 8396, 8394, 8392, 8391, 8393 } }, -- level 50
    },
})
