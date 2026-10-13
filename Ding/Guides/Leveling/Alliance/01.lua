-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/01.lua.
-- Simulated (warrior): Human 1 (0%) -> 13 (91%) in 7 h 13, 77 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a01-human-starter",
    title    = "Human start (1-13)",
    faction  = "Alliance",
    races    = { "Human" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-a04-westfall",
    leftOut  = {
        [46] = { kind = "prereq" },
        [59] = { kind = "prereq" },
        [88] = { kind = "away" },
        [147] = { kind = "prereq" },
        [212] = { kind = "log" },
        [249] = { kind = "prereq" },
        [314] = { kind = "away" },
        [332] = { kind = "away" },
        [333] = { kind = "away" },
        [334] = { kind = "away" },
        [344] = { kind = "prereq" },
        [345] = { kind = "prereq" },
        [346] = { kind = "prereq" },
        [350] = { kind = "prereq" },
        [392] = { kind = "prereq" },
        [393] = { kind = "prereq" },
        [394] = { kind = "prereq" },
        [395] = { kind = "prereq" },
        [396] = { kind = "prereq" },
        [415] = { kind = "prereq" },
        [466] = { kind = "away" },
        [1015] = { kind = "exclusive" },
        [1076] = { kind = "far" },
        [1077] = { kind = "prereq" },
        [1078] = { kind = "log" },
        [1475] = { kind = "log" },
        [2745] = { kind = "prereq" },
        [2746] = { kind = "prereq" },
        [2962] = { kind = "prereq" },
        [3787] = { kind = "far", turnin = true },
        [4126] = { kind = "away" },
        [4766] = { kind = "log" },
        [6141] = { kind = "log" },
        [6187] = { kind = "prereq" },
        [7494] = { kind = "log" },
        [7496] = { kind = "prereq" },
        [7782] = { kind = "prereq" },
        [8394] = { kind = "away" },
        [8396] = { kind = "away" },
        [8401] = { kind = "away" },
        [8403] = { kind = "away" },
        [91724] = { kind = "version" },
        [91743] = { kind = "prereq" },
        [91745] = { kind = "prereq" },
        [91752] = { kind = "prereq" },
        [91775] = { kind = "prereq" },
        [91777] = { kind = "prereq" },
        [92124] = { kind = "prereq" },
        [92456] = { kind = "away" },
        [95065] = { kind = "away" },
        [95214] = { kind = "prereq" },
        [96393] = { kind = "prereq" },
        [96608] = { kind = "away" },
        [96629] = { kind = "prereq" },
        [98021] = { kind = "prereq" },
        [99130] = { kind = "prereq" },
        [99131] = { kind = "prereq" },
        [99161] = { kind = "version" },
    },
    steps    = {
        { destroy = 6948, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE", "DRUID" }, -- level 1
          note = "Elwynn Forest: Northshire Abbey, where every human starts. This frees room in your bags. You receive one further along the route." },
        { go = { 1429, 45.24, 42.43 }, classes = { "WARRIOR", "WARLOCK" }, text = "Loot the beasts you kill on the way here", -- level 1
          note = "Pick up anything that sells for 10 copper or more. You'll level faster with this." },
        { vendor = true, talk = 152, classes = { "WARRIOR", "WARLOCK" } }, -- level 1
        { train = true, talk = 459, classes = { "WARLOCK" }, -- level 1
          note = "The NPC is outdoors, right beside the structure." },
        { accept = 1598, classes = { "WARLOCK" }, -- level 1
          note = "The NPC is outdoors, right beside the structure." },
        { complete = 1598, classes = { "WARLOCK" }, -- level 1
          note = "Skip the foes and dash into the tent. Foes cannot strike you from there. Widen the camera view." },
        { hearth = true, classes = { "WARLOCK" }, text = "Recall to your bind point in Northshire Valley" }, -- level 1
        { destroy = 6948, classes = { "WARLOCK" }, -- level 1
          note = "This frees room in your bags. You receive one further along the route." },
        { turnin = 1598, when = { ready = 1598 }, classes = { "WARLOCK" }, -- level 1
          note = "The NPC is outdoors, right beside the structure." },
        { accept = 783 }, -- level 1
        { turnin = 783, accept = 7, -- level 1
          note = "The NPC is indoors." },
        { train = true, talk = 911, classes = { "WARRIOR" }, -- level 1
          note = "The NPC is indoors at street level." },
        { accept = 5261 }, -- level 1
        { turnin = 5261, accept = 33, -- level 1
          note = "The quest giver stands outdoors, not indoors." },
        { complete = 33 }, -- level 1
        { complete = 7 }, -- level 2
        { turnin = 33 }, -- level 2
        { turnin = 7, accept = 15, -- level 3
          note = "The NPC is indoors." },
        { accept = 92479, races = { "Human" }, classes = { "HUNTER" } }, -- level 3
        { complete = 15 }, -- level 3
        { level = 3, xp = 1110, patrol = { { 1429, 47.45, 36.95 }, { 1429, 47.14, 34.96 }, { 1429, 49.23, 35.26 }, { 1429, 48.77, 33.05 }, { 1429, 46.37, 32.35 }, { 1429, 50.45, 37.26 } }, why = { kind = "level", levels = { 1, 5 } }, -- level 3
          note = "With the coming hand-ins, this brings you to level 4." },
        { turnin = 15, accept = 21, -- level 3
          note = "The NPC is indoors." },
        { accept = 3104, classes = { "MAGE" } }, -- level 3
        { accept = 3100, classes = { "WARRIOR" } }, -- level 3
        { accept = 3105, classes = { "WARLOCK" } }, -- level 3
        { accept = 3102, classes = { "ROGUE" } }, -- level 3
        { accept = 3103, classes = { "PRIEST" } }, -- level 3
        { accept = 3101, classes = { "PALADIN" } }, -- level 3
        { turnin = 3100, classes = { "WARRIOR" }, -- level 3
          note = "The NPC is indoors at street level." },
        { train = true, talk = 911, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors at street level." },
        { turnin = 3101, classes = { "PALADIN" }, -- level 4
          note = "The NPC is indoors at street level." },
        { train = true, talk = 925, classes = { "PALADIN" }, -- level 4
          note = "The NPC is indoors at street level." },
        { turnin = 3103, classes = { "PRIEST" }, -- level 4
          note = "The NPC is indoors at street level." },
        { train = true, talk = 375, classes = { "PRIEST" }, -- level 4
          note = "The NPC is indoors at street level." },
        { turnin = 3104, classes = { "MAGE" }, -- level 4
          note = "The NPC is indoors, on the central storey." },
        { train = true, talk = 198, classes = { "MAGE" }, -- level 4
          note = "The NPC is indoors, on the central storey." },
        { accept = 18 }, -- level 4
        { turnin = 3105, classes = { "WARLOCK" }, -- level 4
          note = "The NPC is outdoors, right beside the structure." },
        { train = true, talk = 459, classes = { "WARLOCK" }, -- level 4
          note = "The NPC is outdoors, right beside the structure." },
        { complete = 18 }, -- level 4
        { turnin = 18, accept = { 3903, 6 }, -- level 4
          note = "The quest giver stands outdoors, not indoors." },
        { complete = 21, -- level 4
          note = "The objective is underground, in the mine shaft." },
        { level = 5, patrol = { { 1429, 47.63, 31.8 }, { 1429, 46.37, 32.35 }, { 1429, 47.34, 30.23 }, { 1429, 48.97, 29.03 }, { 1429, 48.43, 26.66 }, { 1429, 48.77, 33.05 }, { 1429, 49.23, 35.26 }, { 1429, 47.14, 34.96 }, { 1429, 47.45, 36.95 }, { 1429, 50.45, 37.26 } }, why = { kind = "level", levels = { 4, 7 } }, -- level 4
          note = "The targets roam the mine and the area around it." },
        { go = { 1429, 47.61, 31.83 }, text = "Exit the mine shaft" }, -- level 5
        { turnin = 3903, accept = 3904, -- level 5
          note = "The quest giver stands outdoors at the back of the building." },
        { turnin = 92479, races = { "Human" }, classes = { "HUNTER" } }, -- level 5
        { turnin = 3102, classes = { "ROGUE" }, -- level 5
          note = "The NPC is out back, at the rear of the structure. The NPC stands by the horse stalls." },
        { train = true, talk = 915, classes = { "ROGUE" }, -- level 5
          note = "The NPC is out back, at the rear of the structure. The NPC stands by the horse stalls." },
        { complete = 6 }, -- level 5
        { complete = 3904, -- level 5
          note = "Look for wooden pails. Leave it out if other players crowd the area." },
        { level = 5, xp = 1700, patrol = { { 1429, 51.46, 46.96 }, { 1429, 54.16, 48.64 }, { 1429, 57.37, 48.17 }, { 1429, 53.94, 52.05 }, { 1429, 51.34, 50.35 }, { 1429, 53.76, 44.44 }, { 1429, 56.94, 42.46 }, { 1429, 54.16, 40.45 } }, why = { kind = "level", levels = { 5, 7 } }, -- level 5
          note = "With the coming hand-ins, this gets you to level 6." },
        { abandon = 3904 }, -- level 5
        { turnin = 3904, accept = 3905, when = { log = 3904 }, -- level 5
          note = "The quest giver stands outdoors at the back of the building." },
        { turnin = 3904, accept = 3905, when = { done = 3904 }, -- level 5
          note = "The quest giver stands outdoors at the back of the building." },
        { turnin = 6 }, -- level 5
        { turnin = 21, accept = 54, -- level 5
          note = "The NPC is indoors." },
        { accept = 96627, races = { "Human" } }, -- level 5
        { accept = 5623, classes = { "PRIEST" }, -- level 5
          note = "The NPC is indoors at street level." },
        { turnin = 3905, when = { log = 3905 }, -- level 5
          note = "Climb to the highest floor of the building." },
        { accept = 2158 }, -- level 5
        { turnin = 96627, races = { "Human" } }, -- level 5
        { turnin = 54, accept = 62 }, -- level 5
        { accept = 95998, races = { "Human" } }, -- level 6
        { accept = 60, -- level 6
          note = "The NPC is indoors." },
        { turnin = 2158, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 906, classes = { "WARLOCK" }, -- level 6
          note = "The NPC waits on the lower level, indoors." },
        { vendor = true, talk = 6374, classes = { "WARLOCK" }, -- level 6
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 328, classes = { "MAGE" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { turnin = 5623, accept = 5624, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 377, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { complete = 5624, classes = { "PRIEST" }, -- level 6
          note = "Heal Guard Roberts using Lesser Heal (Rank 2). Buff Guard Roberts with Power Word: Fortitude." },
        { turnin = 5624, when = { ready = 5624 }, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 917, classes = { "ROGUE" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { go = { 1429, 43.36, 65.49 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn First Aid from the trainer" }, -- level 6
        { talk = 2329, classes = { "WARRIOR", "ROGUE" }, -- level 6
          note = "The NPC is indoors, one floor up. Do it only if you can." },
        { train = true, talk = 927, classes = { "PALADIN" } }, -- level 6
        { train = true, talk = 913, classes = { "WARRIOR" } }, -- level 6
        { accept = 47 }, -- level 6
        { accept = 85 }, -- level 6
        { turnin = 85, accept = 86 }, -- level 6
        { accept = 106, -- level 6
          note = "The NPC is indoors." },
        { collect = { { 769, 4 } }, keep = 769 }, -- level 6
        { turnin = 106, accept = 111 }, -- level 6
        { turnin = 86, when = { ready = 86 } }, -- level 6
        { accept = 84, when = { done = 86 } }, -- level 6
        { turnin = 111, accept = 107, -- level 6
          note = "The NPC is indoors." },
        { turnin = 84, sticky = { 60, 47 }, when = { log = 84 } }, -- level 6
        { accept = 87, when = { done = 84 } }, -- level 6
        { go = { 1429, 38.93, 82.29 }, text = "Go into the mine" }, -- level 6
        { complete = 62, -- level 6
          note = "The objective is underground, in the mine shaft." },
        { go = { 1429, 39.73, 79.17 }, text = "Stay on the trail through the mine" }, -- level 6
        { complete = 87, when = { log = 87 }, -- level 6
          note = "This one roams, so scan the surrounding area. The objective is underground, in the mine shaft." },
        { complete = { 60, 47 }, -- level 6
          note = "The targets roam the mine and the area around it." },
        { level = 7, xp = 1815, patrol = { { 1429, 39.55, 80.16 }, { 1429, 41.55, 80.06 }, { 1429, 40.37, 82.17 }, { 1429, 38.86, 83.54 }, { 1429, 38.97, 85.66 }, { 1429, 37.46, 86.77 }, { 1429, 36.36, 84.64 }, { 1429, 36.03, 82.37 }, { 1429, 37.95, 81.55 }, { 1429, 36.15, 79.06 }, { 1429, 38.35, 77.84 }, { 1429, 40.86, 77.35 } }, -- level 7
          note = "Together with the next turn-ins, this brings you to level 8. The targets roam the mine and the area around it." },
        { turnin = 87, when = { log = 87 } }, -- level 7
        { go = { 1429, 39.55, 80.16 }, deathskip = true, text = "Die on purpose at this spot", -- level 7
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1429, 39.42, 60.58 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 7
        { talk = 6491 }, -- level 7
        { turnin = 47, accept = 40 }, -- level 7
        { turnin = { 40, 62 }, accept = { 35, 76 } }, -- level 7
        { turnin = { 60, 107 }, accept = { 61, 112 }, why = { kind = "carry", quest = 61, seconds = 6000, xp = 800 }, -- level 7
          note = "The NPC is indoors." },
        { sethearth = "Goldshire", talk = 295, -- level 8
          note = "The NPC is indoors." },
        { accept = 99127, races = { "Human" } }, -- level 8
        { complete = 99127, races = { "Human" } }, -- level 8
        { turnin = 99127, races = { "Human" } }, -- level 8
        { accept = 99143, races = { "Human" } }, -- level 8
        { complete = 99143, races = { "Human" } }, -- level 8
        { turnin = 99143, races = { "Human" } }, -- level 8
        { accept = 99128, races = { "Human" } }, -- level 8
        { complete = 99128, races = { "Human" } }, -- level 8
        { turnin = 99128, races = { "Human" } }, -- level 8
        { accept = 99129, races = { "Human" } }, -- level 8
        { train = true, talk = 906, classes = { "WARLOCK" }, -- level 8
          note = "The NPC waits on the lower level, indoors." },
        { vendor = true, talk = 6374, classes = { "WARLOCK" }, -- level 8
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 328, classes = { "MAGE" }, -- level 8
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 377, classes = { "PRIEST" }, -- level 8
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 917, classes = { "ROGUE" }, -- level 8
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 927, classes = { "PALADIN" } }, -- level 8
        { train = true, talk = 913, classes = { "WARRIOR" } }, -- level 8
        { complete = 112 }, -- level 8
        { go = { 1429, 61.68, 53.82 }, text = "Go into the mine" }, -- level 8
        { complete = 76, -- level 8
          note = "The objective is underground, in the mine shaft." },
        { go = { 1429, 61.79, 53.93 }, text = "Exit the mine shaft" }, -- level 8
        { accept = 91723, races = { "Human" } }, -- level 8
        { complete = 91723, races = { "Human" } }, -- level 8
        { accept = 91725, races = { "Human" } }, -- level 8
        { turnin = 35, accept = { 37, 52 }, sticky = 52 }, -- level 8
        { turnin = 37, accept = 45 }, -- level 8
        { accept = 5545 }, -- level 8
        { complete = 5545, -- level 8
          note = "Look for little stacks of brown wood. Look around tree trunks at ground level." },
        { accept = 91732, races = { "Human" } }, -- level 8
        { complete = 52 }, -- level 8
        { complete = 52, -- level 8
          note = "The targets are wolves." },
        { level = 9, patrol = { { 1429, 79.96, 59.23 }, { 1429, 83.37, 59.24 }, { 1429, 86.54, 59.84 }, { 1429, 87.64, 63.17 }, { 1429, 84.43, 62.66 }, { 1429, 85.34, 66.23 }, { 1429, 87.14, 68.97 }, { 1429, 87.65, 72.23 }, { 1429, 87.37, 75.36 }, { 1429, 89.74, 77.97 }, { 1429, 88.06, 80.76 }, { 1429, 85.57, 78.97 }, { 1429, 85.26, 82.46 }, { 1429, 85.76, 85.83 }, { 1429, 81.03, 84.03 }, { 1429, 78.04, 82.46 }, { 1429, 77.35, 78.86 }, { 1429, 80.44, 78.95 }, { 1429, 81.55, 76.17 }, { 1429, 78.34, 75.65 }, { 1429, 75.43, 76.45 }, { 1429, 75.36, 73.35 }, { 1429, 76.06, 64.76 }, { 1429, 72.37, 65.23 }, { 1429, 76.45, 60.75 }, { 1429, 78.95, 62.56 }, { 1429, 84.37, 71.16 } }, why = { kind = "level", levels = { 9, 10 } }, -- level 8
          note = "The following step may be hard. One extra level makes it easier." },
        { turnin = 45, accept = 71 }, -- level 9
        { turnin = 5545 }, -- level 9
        { accept = 83 }, -- level 9
        { turnin = { 52, 71 }, accept = { 39, 109 } }, -- level 9
        { complete = 83 }, -- level 9
        { accept = 91733, races = { "Human" } }, -- level 9
        { complete = 91733, races = { "Human" } }, -- level 9
        { turnin = 91733, races = { "Human" } }, -- level 9
        { level = 9, xp = 3505, patrol = { { 1429, 70.25, 76.35 }, { 1429, 68.37, 75.46 }, { 1429, 68.23, 77.76 }, { 1429, 66.94, 80.17 }, { 1429, 68.44, 82.64 }, { 1429, 70.55, 80.55 }, { 1429, 72.06, 77.45 } }, -- level 9
          note = "With the coming turn-ins, this gets you to level 10." },
        { accept = 184, useitem = 1972, when = { item = 1972 } }, -- level 9
        { turnin = 83, -- level 9
          note = "The NPC waits outside, at the building's front." },
        { go = { 1433, 25.46, 59.37 }, fly = true, talk = 931, text = "Fly to Lakeshire", -- level 9
          note = "Stay on the road and watch for danger. Foes in this area outlevel you." },
        { turnin = 112, -- level 9
          note = "The NPC is indoors." },
        { accept = 114, -- level 9
          note = "Let the conversation play out. The NPC is indoors." },
        { turnin = { 39, 76 }, accept = 239 }, -- level 9
        { accept = 1097, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 906, classes = { "WARLOCK" }, -- level 10
          note = "The NPC waits on the lower level, indoors." },
        { accept = 1685, classes = { "WARLOCK" }, -- level 10
          note = "The NPC waits on the lower level, indoors." },
        { vendor = true, talk = 6374, classes = { "WARLOCK" }, -- level 10
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 328, classes = { "MAGE" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 377, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { accept = 5635, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 917, classes = { "ROGUE" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { accept = 2205, classes = { "ROGUE" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 927, classes = { "PALADIN" } }, -- level 10
        { train = true, talk = 913, classes = { "WARRIOR" } }, -- level 10
        { accept = 1638, classes = { "WARRIOR" } }, -- level 10
        { accept = 94792, races = { "Human" }, classes = { "HUNTER" } }, -- level 10
        { complete = 94792, races = { "Human" }, classes = { "HUNTER" } }, -- level 10
        { turnin = 94792, races = { "Human" }, classes = { "HUNTER" } }, -- level 10
        { turnin = 99129, races = { "Human" } }, -- level 10
        { turnin = 114, -- level 10
          note = "The NPC is indoors." },
        { turnin = 239, accept = 11 }, -- level 10
        { complete = 11, -- level 10
          note = "Your targets here are gnolls." },
        { turnin = 11 }, -- level 10
        { turnin = 184, when = { log = 184 } }, -- level 10
        { accept = 64 }, -- level 10
        { accept = { 36, 151 } }, -- level 10
        { accept = 9 }, -- level 10
        { turnin = 36, accept = { 38, 22 }, -- level 10
          note = "The NPC is indoors." },
        { turnin = 109, accept = 12 }, -- level 10
        { accept = 102 }, -- level 10
        { accept = 6181, -- level 10
          note = "The NPC is indoors." },
        { go = { 1436, 56.5, 52.61 }, fly = true, talk = 523, text = "Fly to Sentinel Hill" }, -- level 10
        { turnin = 6181, accept = 6281 }, -- level 10
        { go = { 1436, 56.5, 52.61 }, fly = true, talk = 523, text = "Fly to Stormwind City" }, -- level 10
        { turnin = 61, -- level 10
          note = "The NPC is indoors." },
        { go = { 1453, 63.92, 69.12 }, classes = { "WARRIOR", "PALADIN" }, text = "Learn Two-Handed Swords at the weapon master" }, -- level 10
        { go = { 1453, 63.92, 69.12 }, classes = { "ROGUE" }, text = "Learn Swords at the weapon master" }, -- level 10
        { go = { 1453, 63.92, 69.12 }, classes = { "PRIEST" }, text = "Learn Staves at the weapon master" }, -- level 10
        { go = { 1453, 63.92, 69.12 }, classes = { "MAGE" }, text = "Learn Swords and Daggers at the weapon master" }, -- level 10
        { go = { 1453, 63.92, 69.12 }, classes = { "WARLOCK" }, text = "Learn Swords and Staves at the weapon master" }, -- level 10
        { talk = 11867, classes = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "MAGE", "WARLOCK" }, -- level 10
          note = "The NPC is indoors." },
        { go = { 1453, 42.28, 81.85 }, classes = { "WARLOCK" }, text = "Head indoors" }, -- level 10
        { turnin = 1685, accept = 1688, classes = { "WARLOCK" }, -- level 10
          note = "The NPC waits on the lower level, indoors." },
        { level = 11, patrol = { { 1429, 70.25, 76.35 }, { 1429, 68.37, 75.46 }, { 1429, 68.23, 77.76 }, { 1429, 66.94, 80.17 }, { 1429, 68.44, 82.64 }, { 1429, 70.55, 80.55 }, { 1429, 72.06, 77.45 } }, why = { kind = "level", levels = { 10, 15 } } }, -- level 10
        { complete = 1688, classes = { "WARLOCK" }, -- level 10
          note = "The target is indoors." },
        { go = { 1453, 42.28, 81.85 }, classes = { "WARLOCK" }, text = "Head indoors" }, -- level 10
        { turnin = 1688, when = { ready = 1688 }, classes = { "WARLOCK" }, -- level 10
          note = "The NPC waits on the lower level, indoors." },
        { accept = 1689, when = { done = 1688 }, classes = { "WARLOCK" } }, -- level 10
        { complete = 1689, useitem = 6928, when = { log = 1689 }, classes = { "WARLOCK" }, -- level 10
          note = "Step onto the pink rune. Look within the tomb. The target is on the lower level, indoors." },
        { turnin = 1689, when = { ready = 1689 }, classes = { "WARLOCK" }, -- level 10
          note = "The NPC stands one level over the crypt. The NPC waits on the lower level, indoors." },
        { sethearth = "Stormwind City", talk = 6740, -- level 11
          note = "The NPC is indoors." },
        { turnin = 2205, classes = { "ROGUE" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { turnin = 6281, accept = 6261, -- level 11
          note = "The NPC is indoors." },
        { turnin = 1638, accept = 1639, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 1639, accept = 1640, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors. Be ready for a fight right away." },
        { complete = 1640, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 1640, when = { ready = 1640 }, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 1665, when = { done = 1640 }, classes = { "WARRIOR" } }, -- level 11
        { turnin = 1665, when = { log = 1665 }, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 52.81, 50.86 }, classes = { "PRIEST" }, text = "Head indoors" }, -- level 11
        { turnin = 5635, classes = { "PRIEST" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 63.6, 36.97 }, classes = { "WARRIOR", "PALADIN", "ROGUE" }, text = "Learn Blacksmithing from the trainer" }, -- level 11
        { talk = 5511, classes = { "WARRIOR", "PALADIN", "ROGUE" } }, -- level 11
        { talk = 5514, buy = { { 2901, 1, 5514 } }, classes = { "WARRIOR", "PALADIN", "ROGUE" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 59.3, 37.8 }, classes = { "WARRIOR", "PALADIN", "ROGUE" }, text = "Learn Mining from the trainer" }, -- level 11
        { talk = 5513, classes = { "WARRIOR", "PALADIN", "ROGUE" }, -- level 11
          note = "The NPC waits indoors, a floor above the entrance." },
        { turnin = 1097, accept = 353, why = { kind = "carry", quest = 353, seconds = 6360, xp = 1100 }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 69.09, 30.83 }, text = "Head down into the Deeprun Tram station", -- level 11
          note = "Pass through the portal to teleport." },
        { accept = 6661, -- level 11
          note = "Take the Deeprun Tram over to Ironforge. The NPC stands by the wall on the central platform." },
        { complete = 6661, useitem = 17117, -- level 11
          note = "Target the Deeprun Rats with the item. Look for little gray rodents. Head to the Deeprun Tram's Ironforge platform." },
        { turnin = 6661, -- level 11
          note = "The NPC stands by the wall on the central platform. Head to the Deeprun Tram's Ironforge platform." },
        { go = { 1455, 62.27, 89.56 }, classes = { "WARRIOR" }, text = "Learn Thrown at the weapon master" }, -- level 11
        { talk = 13084, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1455, 61.12, 89.58 }, classes = { "WARRIOR" }, text = "Learn Two-Handed Maces at the weapon master" }, -- level 11
        { accept = 95041, races = { "Human" } }, -- level 11
        { talk = 11865, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1455, 55.53, 47.78 }, fly = true, talk = 1573, text = "Fly to Ironforge" }, -- level 11
        { accept = 287 }, -- level 11
        { accept = 98321, races = { "Human" } }, -- level 11
        { accept = 98322, races = { "Human" } }, -- level 11
        { accept = 99158, races = { "Human" }, classes = { "PRIEST" } }, -- level 11
        { accept = 412, -- level 11
          note = "The NPC is indoors." },
        { accept = 97277, races = { "Human" } }, -- level 11
        { complete = 97277, races = { "Human" } }, -- level 11
        { turnin = 97277, races = { "Human" } }, -- level 11
        { complete = 98321, races = { "Human" } }, -- level 11
        { turnin = 98322, races = { "Human" } }, -- level 11
        { accept = 98326, races = { "Human" } }, -- level 11
        { complete = 98326, races = { "Human" } }, -- level 11
        { turnin = 98326, races = { "Human" } }, -- level 11
        { go = { 1426, 39.55, 47.95 }, elite = true, text = "Stay on the trail" }, -- level 11
        { accept = 312, elite = true, -- level 11
          note = "Steer clear of the elite yeti patrolling close by. The NPC is up on the summit." },
        { complete = 312, elite = true, -- level 11
          note = "Let the elite yeti stroll off before you go near. Your objective lies in a little cavern. Go quickly, time is short." },
        { turnin = 312, elite = true, sticky = 287, -- level 11
          note = "Steer clear of the elite yeti patrolling close by. The NPC is up on the summit." },
        { go = { 1426, 24.9, 50.94 }, text = "Go into the cavern" }, -- level 11
        { complete = 287, -- level 11
          note = "Head to the lower level of the cavern." },
        { complete = 287, -- level 11
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1426, 25.1, 50.95 }, text = "Head out of the cave" }, -- level 11
        { complete = 412 }, -- level 11
        { complete = 95041, races = { "Human" } }, -- level 11
        { go = { 1426, 31.03, 32.59 }, text = "Climb the trail", -- level 11
          note = "Once in the Wetlands, head north. Leap down from the ledge. This makes Menethil Harbor quicker to get to." },
        { go = { 1426, 31.48, 32.3 }, text = "Keep climbing the trail" }, -- level 11
        { go = { 1426, 31.1, 30.54 }, text = "Keep climbing the trail" }, -- level 11
        { go = { 1426, 32.37, 28.67 }, text = "Take the trail downhill" }, -- level 11
        { go = { 1426, 32.69, 27.08 }, text = "Stay on the trail" }, -- level 11
        { go = { 1415, 44.88, 52.01 }, deathskip = true, text = "Die on purpose at this spot" }, -- level 11
        { deathskip = true, revive = { 1437, 11.75, 43.24 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 11
        { talk = 6491 }, -- level 11
        { go = { 1437, 9.53, 59.72 }, fly = true, talk = 1571, text = "Fly to Menethil Harbor" }, -- level 11
        { turnin = 412, -- level 11
          note = "The NPC is indoors." },
        { complete = 95998, races = { "Human" } }, -- level 11
        { turnin = 98321, races = { "Human" } }, -- level 11
        { turnin = 287 }, -- level 11
        { turnin = 99158, races = { "Human" }, classes = { "PRIEST" } }, -- level 11
        { accept = 99159, races = { "Human" } }, -- level 11
        { complete = 99159, races = { "Human" } }, -- level 11
        { turnin = 99159, races = { "Human" } }, -- level 11
        { accept = 95212, races = { "Human" } }, -- level 11
        { complete = 95212, races = { "Human" } }, -- level 11
        { turnin = 95212, races = { "Human" } }, -- level 11
        { accept = 96392, races = { "Human" } }, -- level 11
        { complete = 96392, races = { "Human" } }, -- level 11
        { turnin = 96392, races = { "Human" } }, -- level 11
        { accept = 96408, races = { "Human" } }, -- level 11
        { turnin = 96408, races = { "Human" } }, -- level 11
        { accept = 433 }, -- level 12
        { accept = 432, sticky = 432 }, -- level 12
        { go = { 1426, 70.67, 56.43 }, text = "Go into the cavern" }, -- level 12
        { complete = 433, -- level 12
          note = "Your targets are within the cavern." },
        { complete = 432, -- level 12
          note = "Targets are in the cavern and around its entrance too." },
        { level = 12, patrol = { { 1426, 70.67, 56.43 }, { 1426, 69.16, 56.45 }, { 1426, 70.77, 54.77 }, { 1426, 70.44, 52.36 }, { 1426, 72.57, 52.15 }, { 1426, 71.36, 50.36 }, { 1426, 70.65, 59.23 }, { 1426, 68.03, 60.66 }, { 1426, 67.26, 58.64 } }, -- level 12
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1426, 70.67, 56.43 }, text = "Head out of the cave" }, -- level 12
        { turnin = 433 }, -- level 12
        { turnin = 432 }, -- level 12
        { go = { 1426, 68.34, 54.54 }, text = "Learn Cooking from the trainer" }, -- level 12
        { talk = 1355, -- level 12
          note = "This one roams, so scan the surrounding area. Without this, one quest can't be picked up." },
        { accept = 419, -- level 12
          note = "The NPC is past the tunnel; stay on the road." },
        { turnin = 419, accept = 417 }, -- level 12
        { complete = 417, -- level 12
          note = "The target is a pale bear. This one roams, so scan the surrounding area." },
        { turnin = 417 }, -- level 12
        { turnin = 353, -- level 12
          note = "Cross the tunnel to reach the NPC. The NPC is indoors, one floor up." },
        { go = { 1432, 33.9, 50.98 }, fly = true, talk = 1572, text = "Fly to Thelsamar" }, -- level 12
        { accept = 418, -- level 12
          note = "The NPC is indoors." },
        { accept = { 416, 1339 }, patrol = { { 1432, 32.7, 49.76 }, { 1432, 33.3, 49.22 }, { 1432, 33.91, 48.42 }, { 1432, 34.36, 47.6 }, { 1432, 34.87, 47 }, { 1432, 35.6, 46.71 }, { 1432, 36.12, 46.32 }, { 1432, 37.14, 45.96 }, { 1432, 37.26, 45.56 }, { 1432, 37.33, 44.48 }, { 1432, 37.23, 43.29 }, { 1432, 36.68, 42.04 } }, -- level 12
          note = "The NPC patrols a long route; look along it." },
        { complete = 416, -- level 12
          note = "The targets are rat-like humanoids." },
        { turnin = 1339, accept = 1338, -- level 12
          note = "The NPC is indoors, one floor up." },
        { collect = { { 3172, 3 } }, keep = 3172 }, -- level 12
        { collect = { { 3174, 3 } }, keep = 3174, -- level 12
          note = "Hunt spiders for it." },
        { collect = { { 3173, 3 } }, keep = 3173 }, -- level 12
        { turnin = 416, patrol = { { 1432, 32.7, 49.76 }, { 1432, 33.3, 49.22 }, { 1432, 33.91, 48.42 }, { 1432, 34.36, 47.6 }, { 1432, 34.87, 47 }, { 1432, 35.6, 46.71 }, { 1432, 36.12, 46.32 }, { 1432, 37.14, 45.96 }, { 1432, 37.26, 45.56 }, { 1432, 37.33, 44.48 }, { 1432, 37.23, 43.29 }, { 1432, 36.68, 42.04 } }, -- level 12
          note = "The NPC patrols a long route; look along it." },
        { turnin = 418, when = { ready = 418 }, -- level 12
          note = "The NPC is indoors." },
        { accept = 224 }, -- level 12
        { accept = 267, sticky = 224, -- level 12
          note = "The NPC is indoors, one floor up." },
        { go = { 1432, 29.26, 66.68 }, text = "Take the road to where the trail starts" }, -- level 12
        { complete = 267 }, -- level 12
        { complete = 224 }, -- level 13
        { collect = { { 2589, 10 } }, keep = 2589, classes = { "PALADIN" }, -- level 13
          note = "A class quest coming up requires this." },
        { go = { 1432, 30.62, 69.75 }, text = "Exit Stonesplinter Valley, then stay on the road" }, -- level 13
        { turnin = 224 }, -- level 13
        { turnin = 267, -- level 13
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 5498, classes = { "MAGE" }, -- level 13
          note = "The NPC waits on the tower's highest floor." },
        { go = { 1453, 42.29, 81.76 }, classes = { "WARLOCK" }, text = "Head indoors", -- level 13
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, classes = { "WARLOCK" } }, -- level 13
        { vendor = true, talk = 5520, classes = { "WARLOCK" }, -- level 13
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 52.93, 51.05 }, classes = { "PRIEST" }, text = "Head indoors", -- level 13
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, classes = { "PRIEST" } }, -- level 13
        { go = { 1453, 52.93, 51.05 }, classes = { "PALADIN" }, text = "Head indoors" }, -- level 13
        { accept = 1641, classes = { "PALADIN" }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 1641, classes = { "PALADIN" }, -- level 13
          note = "The NPC is indoors." },
        { accept = 1642, useitem = 6775, classes = { "PALADIN" } }, -- level 13
        { turnin = 1642, accept = 1643, classes = { "PALADIN" }, -- level 13
          note = "The NPC is indoors." },
        { train = true, talk = 5492, classes = { "PALADIN" }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 1338 }, -- level 13
        { accept = 94773, races = { "Human" }, classes = { "PRIEST" } }, -- level 13
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 13
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 13
        { turnin = 1643, accept = 1644, classes = { "PALADIN" } }, -- level 13
        { turnin = 1644, when = { ready = 1644 }, classes = { "PALADIN" } }, -- level 13
        { go = { 1453, 67.91, 72.69 }, text = "Head up the incline" }, -- level 13
        { turnin = 6261, accept = 6285, -- level 13
          note = "The NPC is indoors." },
        { turnin = 6285, -- level 13
          note = "The NPC is indoors." },
    },
})
