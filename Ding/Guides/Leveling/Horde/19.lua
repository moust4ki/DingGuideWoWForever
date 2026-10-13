-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/19.lua.
-- Simulated (warrior): Orc 39 (73%) -> 40 (67%) in 4 h 03, 11 quests turned in; Scourge 39 (73%) -> 40 (67%) in 4 h 03, 11 quests turned in; Tauren 39 (73%) -> 40 (67%) in 4 h 03, 11 quests turned in; Troll 39 (73%) -> 40 (67%) in 4 h 03, 11 quests turned in; Skyborne 39 (73%) -> 40 (67%) in 4 h 03, 11 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h19-badlands",
    title    = "Badlands (39-40)",
    faction  = "Horde",
    minLevel = 39, maxLevel = 40,
    next     = "leveling-h20-stranglethorn-vale-and-swamp-of-sorrows",
    steps    = {
        { go = { 1418, 42.39, 52.93 }, text = "Travel to the Badlands", -- level 39
          note = "Badlands: Kargath, at the western edge, is the Horde hub." },
        { accept = 705, when = { item = { 4611, 9 } } }, -- level 39
        { accept = 703 }, -- level 39
        { turnin = 705, when = { log = 705, ready = 705 } }, -- level 39
        { turnin = 1106, accept = 1108 }, -- level 39
        { accept = 710, -- level 39
          note = "This one roams, so scan the surrounding area." },
        { accept = 713, when = { item = 3829 } }, -- level 39
        { turnin = 713, when = { log = 713, ready = 713 }, -- level 39
          note = "This one roams, so scan the surrounding area." },
        { accept = 714, when = { item = 4389 } }, -- level 39
        { accept = 714, when = { item = 4389 } }, -- level 39
        { turnin = 714, when = { item = 4389, log = 714 }, -- level 39
          note = "This one roams, so scan the surrounding area." },
        { accept = 715, when = { item = { { 929, 1 }, { 3823, 1 } } } }, -- level 39
        { turnin = 715, sticky = 710, when = { item = 929, log = 715 } }, -- level 39
        { accept = 1419, -- level 39
          note = "The NPC waits on the tower's highest floor." },
        { go = { 1418, 4.05, 44.73 }, fly = true, talk = 2861, text = "Fly to Kargath" }, -- level 39
        { accept = 2258, sticky = { 2258, 1419 }, -- level 39
          note = "The NPC is indoors, one floor up." },
        { complete = 703, keep = 3404, sticky = 2258, -- level 39
          note = "A cluster of them gathers here. More of them dot the surroundings." },
        { complete = 710 }, -- level 39
        { turnin = 710, accept = 711, -- level 39
          note = "This one roams, so scan the surrounding area." },
        { complete = 711 }, -- level 40
        { complete = 2258 }, -- level 40
        { turnin = 711, sticky = { 2258, 1419 }, -- level 40
          note = "This one roams, so scan the surrounding area." },
        { complete = 2258, -- level 40
          note = "A cluster of them gathers here. More of them dot the surroundings." },
        { complete = { 2258, 1419 } }, -- level 40
        { level = 40, patrol = { { 1418, 20.83, 56.75 }, { 1418, 20.46, 50.75 }, { 1418, 16.86, 45.84 }, { 1418, 15.03, 54.25 }, { 1418, 10.43, 59.45 }, { 1418, 4.64, 57.16 }, { 1418, 6.45, 64.37 }, { 1418, 12.26, 66.16 }, { 1418, 17.75, 68.65 }, { 1418, 21.25, 73.76 }, { 1418, 27.46, 74.63 }, { 1418, 26.37, 68.46 }, { 1418, 32.64, 69.83 }, { 1418, 35.97, 64.86 }, { 1418, 41.76, 62.66 }, { 1418, 39.14, 70.25 }, { 1418, 44.83, 73.37 }, { 1418, 35.25, 75.77 }, { 1418, 22.45, 81.94 }, { 1418, 16.76, 78.84 }, { 1418, 13.26, 83.74 }, { 1418, 10.14, 78.34 }, { 1418, 13.65, 73.36 }, { 1418, 7.46, 70.97 }, { 1418, 16.17, 61.57 }, { 1418, 24.74, 62.23 }, { 1418, 30.75, 61.37 }, { 1418, 27.45, 56.34 }, { 1418, 32.45, 51.96 }, { 1418, 35.55, 57.44 }, { 1418, 40.97, 53.17 }, { 1418, 30.75, 45.15 }, { 1418, 26.44, 49.36 }, { 1418, 25.15, 42.46 } } }, -- level 40
        { turnin = 703 }, -- level 40
        { destroy = 3404 }, -- level 40
        { complete = 1108, -- level 40
          note = "The targets are troggs." },
        { turnin = 1108 }, -- level 40
        { accept = 1137, -- level 40
          note = "Wait for the talking to finish" },
        { turnin = 1419, accept = 1420, -- level 40
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 2258, -- level 40
          note = "The NPC is indoors, one floor up." },
        { destroy = 7846 }, -- level 40
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 40
        { talk = 5958, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 40
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 40
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 40
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 40
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 3631, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 40
          note = "The NPC is indoors. This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 40
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 40
          note = "The NPC stands on the highest level of this structure." },
        { talk = 8356, collect = { { 5919, 1 }, { 5838, 1 } }, spots = { { 1456, 47.19, 57.86 } }, -- level 40
          note = "The NPC is indoors." },
        { turnin = 1276, -- level 40
          note = "The quest giver waits in the tent." },
        { turnin = 1136, accept = 1205 }, -- level 40
        { destroy = 5838 }, -- level 40
    },
})
