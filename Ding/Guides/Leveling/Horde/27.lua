-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/27.lua.
-- Simulated (warrior): Orc 45 (65%) -> 46 (9%) in 2 h 23, 9 quests turned in; Scourge 45 (65%) -> 46 (9%) in 2 h 23, 9 quests turned in; Tauren 45 (65%) -> 46 (9%) in 2 h 23, 9 quests turned in; Troll 45 (65%) -> 46 (9%) in 2 h 23, 9 quests turned in; Skyborne 45 (65%) -> 46 (9%) in 2 h 23, 9 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h27-swamp-of-sorrows",
    title    = "Swamp of Sorrows (45-46)",
    faction  = "Horde",
    minLevel = 45, maxLevel = 46,
    next     = "leveling-h28-tanaris-and-dustwallow-marsh",
    steps    = {
        { go = { 1435, 34.29, 66.14 }, text = "Travel to the Swamp of Sorrows", -- level 45
          note = "Swamp of Sorrows: Stonard is the hub, in the middle of the zone." },
        { accept = 2784 }, -- level 45
        { complete = 2784, talk = 7572 }, -- level 45
        { turnin = 2784, accept = 2621 }, -- level 45
        { turnin = 2621, accept = 2622, -- level 45
          note = "The NPC is indoors, one floor up." },
        { accept = 1429, -- level 45
          note = "The NPC is indoors, one floor up." },
        { turnin = 2622, -- level 45
          note = "The NPC is indoors." },
        { accept = 699 }, -- level 45
        { complete = 699, -- level 45
          note = "Kill the crocodiles. Beware of foes lurking in stealth." },
        { turnin = 699, accept = 1422 }, -- level 45
        { turnin = 1422, accept = 1426, sticky = 1426 }, -- level 45
        { complete = 1426 }, -- level 45
        { complete = 1426 }, -- level 45
        { complete = 1426 }, -- level 45
        { turnin = 1426, accept = 1427 }, -- level 45
        { turnin = 1427 }, -- level 45
        { level = 46, patrol = { { 1435, 85.16, 82.24 }, { 1435, 86.35, 79.46 }, { 1435, 89.17, 81.25 }, { 1435, 87.76, 84.75 }, { 1435, 86.26, 88.05 }, { 1435, 83.14, 87.25 }, { 1435, 81.46, 90.45 }, { 1435, 84.56, 90.83 }, { 1435, 82.94, 94.66 }, { 1435, 79.45, 93.34 } } }, -- level 45
        { accept = 1428 }, -- level 46
        { complete = 1428, -- level 46
          note = "Your targets are within the cavern. Stay out of Swamp Talker's way. Hunt down the gray murloc; it is level 50." },
        { go = { 1435, 66.33, 76.49 }, text = "Head out of the cave" }, -- level 46
        { turnin = 1428 }, -- level 46
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 46
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 46
          note = "The NPC is indoors." },
        { accept = 1119, when = { done = 621 }, -- level 46
          note = "The NPC is indoors at street level." },
        { talk = 2625, collect = { { 9628, 1 }, { 5862, 1 }, { 10699, 1 }, { 8564, 1 } }, spots = { { 1434, 26.6, 76.53 } } }, -- level 46
        { talk = 2625, bank = 6193, -- level 46
          note = "You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 46
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 46
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 46
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 46
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 46
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 46
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 46
          note = "The NPC stands on the highest level of this structure." },
        { turnin = 3122 }, -- level 46
        { accept = { 3123, 3380 }, -- level 46
          note = "Wait for the talking to finish" },
    },
})
