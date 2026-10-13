-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/02.lua.
-- Simulated (warrior): Tauren 1 (0%) -> 14 (22%) in 10 h 24, 78 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h02-tauren-starter",
    title    = "Tauren start (1-13)",
    faction  = "Horde",
    races    = { "Tauren" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-h04-silverpine-forest",
    leftOut  = {
        [744] = { kind = "away" },
        [759] = { kind = "log" },
        [764] = { kind = "prereq" },
        [765] = { kind = "prereq" },
        [776] = { kind = "prereq" },
        [860] = { kind = "prereq" },
        [861] = { kind = "exclusive" },
        [2440] = { kind = "prereq" },
        [2965] = { kind = "prereq" },
        [2968] = { kind = "prereq" },
        [76160] = { kind = "version" },
        [95350] = { kind = "away" },
        [96241] = { kind = "far" },
        [96259] = { kind = "far" },
        [96260] = { kind = "far" },
        [96605] = { kind = "away" },
        [96661] = { kind = "prereq" },
        [96774] = { kind = "away" },
        [97249] = { kind = "detour", seconds = 60, xp = 800 },
        [97275] = { kind = "detour", seconds = 60, xp = 800 },
        [97326] = { kind = "detour", seconds = 120, xp = 800 },
        [97538] = { kind = "far" },
        [98427] = { kind = "away" },
        [98823] = { kind = "log" },
        [99196] = { kind = "log" },
    },
    steps    = {
        { destroy = 6948, -- level 1
          note = "Mulgore: Camp Narache, where tauren start. This frees room in your bags. You receive one further along the route." },
        { go = { 1412, 44.95, 80.98 }, classes = { "WARRIOR", "SHAMAN" }, text = "Loot the beasts you kill on the way here", -- level 1
          note = "Pick up anything that sells for 10 copper or more. You'll level faster with this." },
        { vendor = true, talk = 3072, classes = { "WARRIOR", "SHAMAN" }, -- level 1
          note = "The NPC is indoors." },
        { accept = 747 }, -- level 1
        { train = true, talk = 3062, classes = { "SHAMAN" }, -- level 1
          note = "The NPC is indoors." },
        { accept = 752, -- level 1
          note = "The NPC is indoors." },
        { train = true, talk = 3059, classes = { "WARRIOR" } }, -- level 1
        { turnin = 752, accept = 753 }, -- level 1
        { complete = 753 }, -- level 1
        { complete = 747 }, -- level 1
        { turnin = 747, accept = 750 }, -- level 2
        { accept = 3091, classes = { "WARRIOR" } }, -- level 2
        { accept = 3093, classes = { "SHAMAN" } }, -- level 2
        { accept = 3092, classes = { "HUNTER" } }, -- level 2
        { accept = 3094, classes = { "DRUID" } }, -- level 2
        { turnin = 3093, classes = { "SHAMAN" }, -- level 2
          note = "The NPC is indoors." },
        { turnin = 3094, classes = { "DRUID" }, -- level 2
          note = "The NPC is indoors." },
        { train = true, talk = 3060, classes = { "DRUID" }, -- level 2
          note = "The NPC is indoors." },
        { turnin = 753, accept = 755, -- level 2
          note = "The NPC is indoors." },
        { turnin = 3091, classes = { "WARRIOR" }, -- level 2
          note = "The NPC is indoors." },
        { accept = 95805, races = { "Tauren" } }, -- level 2
        { turnin = 3092, classes = { "HUNTER" }, -- level 2
          note = "The NPC is indoors." },
        { train = true, talk = 3061, classes = { "HUNTER" } }, -- level 2
        { turnin = 755, accept = 757 }, -- level 2
        { complete = 750 }, -- level 3
        { level = 3, xp = 1150, patrol = { { 1412, 46.2, 86.92 }, { 1412, 48.55, 88.51 }, { 1412, 50.61, 86.57 }, { 1412, 53.22, 86.59 }, { 1412, 53.21, 89.41 }, { 1412, 50.71, 90.18 }, { 1412, 46.55, 90.42 }, { 1412, 44.29, 89.17 }, { 1412, 43.01, 91.42 }, { 1412, 41.01, 88 }, { 1412, 43.46, 86.59 } }, why = { kind = "level", levels = { 4, 6 } }, -- level 3
          note = "With the coming hand-ins, this brings you to level 4." },
        { turnin = 750, accept = 780 }, -- level 3
        { accept = 3376 }, -- level 4
        { train = true, talk = 3062, classes = { "SHAMAN" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 3059, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 3060, classes = { "DRUID" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 3061, classes = { "HUNTER" }, -- level 4
          note = "The NPC is indoors." },
        { complete = 780, sticky = 757 }, -- level 4
        { go = { 1412, 55.61, 84.19 }, text = "Traverse the passageway" }, -- level 4
        { turnin = 95805, races = { "Tauren" } }, -- level 4
        { complete = 3376, -- level 4
          note = "The target is indoors." },
        { accept = 781, collect = { { 4851, 1 } }, useitem = 4851, -- level 4
          note = "Your objective lies in a little cavern." },
        { complete = 757, -- level 4
          note = "Fight quilboars." },
        { level = 5, xp = 595, classes = { "SHAMAN" }, -- level 4
          note = "With the coming hand-ins, this gets you to level 6." },
        { level = 5, xp = 865, patrol = { { 1412, 58.4, 78.58 }, { 1412, 60.9, 78.08 }, { 1412, 60.13, 80.84 }, { 1412, 57.13, 81.25 }, { 1412, 55.8, 83.65 }, { 1412, 55.53, 78.57 }, { 1412, 57.04, 76.14 } }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, why = { kind = "level", levels = { 5, 8 } } }, -- level 5
        { go = { 1412, 58.4, 78.58 }, deathskip = true, text = "Die on purpose at this spot", -- level 5
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1412, 42.57, 78.32 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 5
        { talk = 6491 }, -- level 5
        { turnin = 780 }, -- level 5
        { turnin = 3376 }, -- level 5
        { accept = 96659, races = { "Tauren" } }, -- level 5
        { turnin = { 781, 757 }, accept = 763, -- level 5
          note = "The NPC is indoors." },
        { train = true, talk = 3059, classes = { "WARRIOR" }, -- level 5
          note = "The NPC is indoors." },
        { train = true, talk = 3061, classes = { "HUNTER" }, -- level 5
          note = "The NPC is indoors." },
        { train = true, talk = 3060, classes = { "DRUID" }, -- level 5
          note = "The NPC is indoors." },
        { turnin = 1519, when = { ready = 1519 }, classes = { "SHAMAN" } }, -- level 5
        { train = true, talk = 3062, classes = { "SHAMAN" }, -- level 5
          note = "The NPC is indoors." },
        { useitem = 6635, classes = { "SHAMAN" } }, -- level 5
        { accept = 1656, -- level 5
          note = "Keep to the road the whole way." },
        { go = { 1412, 36.06, 78.99 }, deathskip = true, text = "Die on purpose at this spot", -- level 5
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1412, 45.72, 59.52 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 5
        { talk = 6491 }, -- level 5
        { accept = 766 }, -- level 5
        { accept = 761, -- level 5
          note = "The NPC is indoors." },
        { accept = 748 }, -- level 5
        { accept = 743 }, -- level 5
        { turnin = 763, accept = { 745, 767, 746 } }, -- level 5
        { turnin = 1656, -- level 6
          note = "The NPC is indoors." },
        { sethearth = "Bloodhoof Village", talk = 6747, -- level 6
          note = "The NPC is indoors." },
        { turnin = 767, accept = 771, sticky = { 766, 748, 761 } }, -- level 6
        { complete = 771, -- level 6
          note = "Look for little brown pinecones. Search close to the trunks." },
        { turnin = 96659, races = { "Tauren" } }, -- level 6
        { complete = { 766, 748 } }, -- level 6
        { complete = { 766, 748 }, -- level 7
          note = "Big birds that roam on foot." },
        { complete = { 766, 761 }, -- level 7
          note = "Hunt the black-feathered birds. They are rare and scattered widely." },
        { accept = 96130, races = { "Tauren" }, classes = { "HUNTER" } }, -- level 7
        { turnin = 748, accept = 754 }, -- level 8
        { turnin = 761, -- level 8
          note = "The NPC is indoors." },
        { accept = 99108, races = { "Tauren" }, classes = { "WARRIOR" } }, -- level 8
        { turnin = 99108, races = { "Tauren" }, classes = { "WARRIOR" } }, -- level 8
        { complete = 771, -- level 8
          note = "Look for gray slabs of stone lying flat." },
        { complete = 754, useitem = 5411, sticky = 745 }, -- level 8
        { accept = 98430, races = { "Tauren" }, why = { kind = "carry", quest = 98430, seconds = 9060, xp = 300 } }, -- level 8
        { complete = 98430, races = { "Tauren" } }, -- level 8
        { complete = 745 }, -- level 8
        { complete = 96130, races = { "Tauren" }, classes = { "HUNTER" } }, -- level 8
        { complete = 745 }, -- level 8
        { level = 7, xp = 2775, patrol = { { 1412, 51.36, 73.15 }, { 1412, 53.2, 72.46 }, { 1412, 53.54, 74.14 }, { 1412, 51.78, 75.4 }, { 1412, 47.18, 74.99 }, { 1412, 47.11, 72.66 } }, -- level 8
          note = "Together with the next turn-ins, this brings you to level 8." },
        { turnin = 754, accept = 756 }, -- level 8
        { accept = 99082, races = { "Tauren" }, why = { kind = "carry", quest = 99082, seconds = 8040, xp = 400 } }, -- level 8
        { turnin = 745 }, -- level 8
        { turnin = 771, accept = 772, -- level 8
          note = "Do not trail after the wolf." },
        { train = true, talk = 3065, classes = { "HUNTER" } }, -- level 8
        { train = true, talk = 3063, classes = { "WARRIOR" } }, -- level 8
        { train = true, talk = 3064, classes = { "DRUID" }, -- level 8
          note = "The NPC is indoors." },
        { train = true, talk = 3066, classes = { "SHAMAN" }, -- level 8
          note = "The NPC is indoors." },
        { accept = 749, sticky = { 766, 756 }, patrol = { { 1412, 50.32, 62.97 }, { 1412, 51.36, 63.45 }, { 1412, 52.74, 63.73 }, { 1412, 53.88, 64.1 }, { 1412, 54.95, 64.23 }, { 1412, 56.92, 65.24 } }, -- level 8
          note = "The NPC patrols the road; look along it." },
        { accept = 99081, races = { "Tauren" } }, -- level 8
        { turnin = 749, accept = 751 }, -- level 8
        { complete = { 766, 756 } }, -- level 8
        { turnin = 96130, races = { "Tauren" }, classes = { "HUNTER" } }, -- level 8
        { complete = 756, -- level 9
          note = "The targets are wolves." },
        { level = 8, xp = 4075, patrol = { { 1412, 49.62, 47.16 }, { 1412, 46.87, 47.45 }, { 1412, 44.69, 49.09 }, { 1412, 43.95, 46.32 }, { 1412, 46.27, 44.67 }, { 1412, 47.85, 42.75 }, { 1412, 50.45, 42.6 }, { 1412, 51.88, 45.01 }, { 1412, 54.46, 45.41 }, { 1412, 55.81, 48.6 }, { 1412, 54.89, 51 }, { 1412, 57.48, 52.29 }, { 1412, 59.04, 55.68 }, { 1412, 56.89, 58.47 }, { 1412, 59.57, 59.18 }, { 1412, 57.15, 61.53 }, { 1412, 54.82, 60.35 }, { 1412, 52.28, 60.78 }, { 1412, 52.37, 63.97 }, { 1412, 55.65, 63.7 }, { 1412, 56.48, 66.36 }, { 1412, 53.62, 66.89 }, { 1412, 55.65, 69.46 }, { 1412, 55.97, 71.96 }, { 1412, 53.22, 71.72 }, { 1412, 54.55, 74.55 }, { 1412, 58.48, 72.91 }, { 1412, 58.07, 70.22 }, { 1412, 59.46, 66.97 }, { 1412, 58.49, 64.29 }, { 1412, 53.23, 57.61 }, { 1412, 53.04, 54.94 }, { 1412, 55.63, 55.79 }, { 1412, 48.79, 53.1 }, { 1412, 46.95, 51.2 }, { 1412, 45.01, 53.34 }, { 1412, 43.95, 55.71 }, { 1412, 42.35, 58.13 }, { 1412, 40.34, 56.27 }, { 1412, 41.61, 53.79 }, { 1412, 43.02, 51.6 }, { 1412, 40.54, 51.01 }, { 1412, 38.02, 49.94 }, { 1412, 35.62, 49.5 }, { 1412, 36.6, 52.43 }, { 1412, 38.11, 54.46 }, { 1412, 35.62, 54.68 }, { 1412, 37.44, 57.1 }, { 1412, 41.02, 48.19 }, { 1412, 46.85, 55.37 }, { 1412, 50.52, 50.28 }, { 1412, 52.55, 48.61 } }, -- level 9
          note = "With the coming hand-ins, this gets you to level 9." },
        { go = { 1412, 49.62, 47.16 }, deathskip = true, text = "Die on purpose at this spot", -- level 9
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1412, 45.72, 59.58 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 9
        { talk = 6491 }, -- level 9
        { turnin = 766 }, -- level 9
        { turnin = 756, accept = 758 }, -- level 9
        { accept = 99079, races = { "Tauren" } }, -- level 9
        { turnin = 99081, races = { "Tauren" } }, -- level 9
        { accept = 99101, races = { "Tauren" } }, -- level 9
        { go = { 1412, 46.11, 63.9 }, classes = { "WARRIOR" }, text = "Learn First Aid from the trainer" }, -- level 9
        { talk = 5939, classes = { "WARRIOR" }, -- level 9
          note = "The NPC is indoors." },
        { complete = 758, useitem = 5415 }, -- level 9
        { collect = { { 4702, 5 } }, spots = { { 1412, 35.75, 52.53 }, { 1412, 32.92, 54.27 }, { 1412, 33.67, 52.7 }, { 1412, 34.94, 54.6 } }, -- level 9
          note = "Fight the dwarves." },
        { complete = 743, -- level 9
          note = "Kill harpies." },
        { turnin = 772, accept = 773, -- level 9
          note = "Your objective lies in a little cavern. Circle the mountain on foot." },
        { destroy = 4823 }, -- level 9
        { go = { 1456, 32.04, 67.19 }, text = "Take the lift to the top of Thunder Bluff" }, -- level 9
        { complete = 746, useitem = 4702, -- level 9
          note = "Beside the forge." },
        { destroy = 6948, classes = { "DRUID" }, -- level 9
          note = "This frees room in your bags. You receive one further along the route." },
        { go = { 1456, 51.26, 31.46 }, text = "Take a lift down out of Thunder Bluff" }, -- level 9
        { accept = 833, sticky = 833 }, -- level 9
        { turnin = 773, accept = 775 }, -- level 9
        { complete = 833 }, -- level 10
        { turnin = 833 }, -- level 10
        { accept = 99080, races = { "Tauren" } }, -- level 10
        { complete = 99080, races = { "Tauren" } }, -- level 10
        { level = 9, xp = 4400, patrol = { { 1412, 57.4, 31.47 }, { 1412, 58.46, 32.82 }, { 1412, 59.33, 31.06 }, { 1412, 57.13, 29.81 } }, -- level 10
          note = "With the coming turn-ins, this gets you to level 10." },
        { turnin = 743 }, -- level 10
        { turnin = 746 }, -- level 10
        { turnin = 99080, races = { "Tauren" } }, -- level 10
        { turnin = 99101, races = { "Tauren" } }, -- level 10
        { turnin = 758 }, -- level 10
        { accept = 98435 }, -- level 10
        { accept = 6061, classes = { "HUNTER" } }, -- level 10
        { train = true, talk = 3065, classes = { "HUNTER" } }, -- level 10
        { complete = 6061, useitem = 15914, classes = { "HUNTER" }, -- level 10
          note = "Aim the item at one Adult Plainstrider. Big birds that roam on foot." },
        { turnin = 6061, when = { ready = 6061 }, classes = { "HUNTER" } }, -- level 10
        { accept = 6087, when = { done = 6061 }, classes = { "HUNTER" } }, -- level 10
        { complete = 6087, useitem = 15915, when = { log = 6087 }, classes = { "HUNTER" }, -- level 10
          note = "Target a Prairie Stalker with it. The targets are wolves." },
        { turnin = 6087, when = { ready = 6087 }, classes = { "HUNTER" } }, -- level 10
        { accept = 6088, when = { done = 6087 }, classes = { "HUNTER" } }, -- level 10
        { complete = 6088, useitem = 15916, when = { log = 6088 }, classes = { "HUNTER" }, -- level 10
          note = "Use the item on any Swoop. Hunt the black-feathered birds." },
        { turnin = 6088, when = { ready = 6088 }, classes = { "HUNTER" } }, -- level 10
        { accept = 6089, when = { done = 6088 }, classes = { "HUNTER" } }, -- level 10
        { train = true, talk = 3063, classes = { "WARRIOR" } }, -- level 10
        { accept = 2984, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 3066, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 5928, classes = { "DRUID" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 3064, classes = { "DRUID" }, -- level 10
          note = "The NPC is indoors." },
        { turnin = 751, patrol = { { 1412, 50.32, 62.97 }, { 1412, 51.36, 63.45 }, { 1412, 52.74, 63.73 }, { 1412, 53.88, 64.1 }, { 1412, 54.95, 64.23 }, { 1412, 56.92, 65.24 } }, -- level 10
          note = "The NPC patrols the road; look along it." },
        { turnin = 99079, races = { "Tauren" } }, -- level 10
        { go = { 1412, 57.06, 62.37 }, classes = { "HUNTER" }, text = "Tame a pet here", -- level 10
          note = "Choose an animal of level 9-10 and make it your pet with the Tame Beast spell. This pet is temporary; a lasting one comes shortly." },
        { go = { 1413, 44.51, 59.1 }, fly = true, talk = 10378, text = "Flight master at Camp Taurajo" }, -- level 11
        { go = { 1413, 44.51, 59.1 }, fly = true, talk = 10378, text = "Fly to Thunder Bluff" }, -- level 11
        { accept = 854 }, -- level 11
        { turnin = 854, -- level 11
          note = "Stick to the road and stay alert. Foes in this area outlevel you." },
        { go = { 1413, 51.45, 30.29 }, fly = true, talk = 3615, text = "Flight master at the Crossroads" }, -- level 11
        { accept = 6361 }, -- level 11
        { turnin = 6361, accept = 6362 }, -- level 11
        { turnin = 6362, accept = 6363, -- level 11
          note = "The NPC is indoors." },
        { go = { 1456, 39.41, 55.12 }, classes = { "WARRIOR" }, text = "Learn Blacksmithing from the trainer" }, -- level 11
        { talk = 2998, classes = { "WARRIOR" } }, -- level 11
        { go = { 1456, 34.31, 57.84 }, classes = { "WARRIOR" }, text = "Learn Mining from the trainer" }, -- level 11
        { accept = 76156, races = { "Tauren" }, classes = { "WARRIOR", "SHAMAN", "DRUID" } }, -- level 11
        { talk = 3001, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { talk = 3002, buy = { { 2901, 1, 3002 } }, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1456, 40.99, 62.69 }, classes = { "WARRIOR", "HUNTER" }, text = "Learn Staves at the weapon master" }, -- level 11
        { go = { 1456, 40.99, 62.69 }, classes = { "DRUID" }, text = "Learn Two-Handed Maces at the weapon master" }, -- level 11
        { talk = 11869, classes = { "WARRIOR", "HUNTER", "DRUID" } }, -- level 11
        { sethearth = "Thunder Bluff", talk = 6746, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 6089, when = { log = 6089 }, classes = { "HUNTER" }, -- level 11
          note = "The NPC is indoors." },
        { train = true, talk = 10086, classes = { "HUNTER" }, -- level 11
          note = "The NPC is indoors." },
        { talk = 3025, buy = { { 117, 1, 3025 } }, classes = { "HUNTER" }, -- level 11
          note = "This is food for your pet." },
        { vendor = true, talk = 3025, classes = { "HUNTER" } }, -- level 11
        { turnin = 775, -- level 11
          note = "The NPC is indoors." },
        { turnin = 98430, races = { "Tauren" } }, -- level 11
        { turnin = 99082, races = { "Tauren" } }, -- level 11
        { turnin = 5928, accept = 5922, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 886, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 5922, accept = 5930, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { complete = 5930, talk = 11956, classes = { "DRUID" } }, -- level 11
        { turnin = 5930, when = { ready = 5930 }, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { accept = 5932, when = { done = 5930 }, classes = { "DRUID" } }, -- level 11
        { turnin = 5932, when = { log = 5932 }, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 6002, when = { done = 5932 }, classes = { "DRUID" } }, -- level 11
        { turnin = 6363, accept = 6364, -- level 11
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 98435 }, -- level 11
        { complete = 6002, talk = 12144, useitem = 15710, when = { log = 6002 }, classes = { "DRUID" }, -- level 11
          note = "A spirit shows up after this." },
        { turnin = 6002, when = { ready = 6002 }, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 886, classes = { "DRUID" } }, -- level 11
        { turnin = 6364, why = { kind = "detour", quest = 6364, seconds = 60, xp = 1100 } }, -- level 11
        { go = { 1411, 35.37, 47.36 }, classes = { "HUNTER" }, text = "Tame a pet here", -- level 11
          note = "Find one Venomtail Scorpid and use Tame Beast on it. Release your current pet before this. Here you tame a pet to keep." },
        { turnin = 2984, accept = 1524, classes = { "SHAMAN" } }, -- level 11
        { go = { 1411, 36.64, 57.03 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 11
        { turnin = 1524, accept = 1525, classes = { "SHAMAN" }, -- level 11
          note = "The NPC waits at the mountain's summit." },
        { complete = 1525, classes = { "SHAMAN" }, -- level 11
          note = "Kill Water Seekers and Thornweavers." },
        { accept = 791, -- level 11
          note = "The NPC waits on the tower's highest floor." },
        { accept = 96825, races = { "Tauren" } }, -- level 11
        { accept = 815, -- level 11
          note = "This one roams, so scan the surrounding area." },
        { accept = { 784, 837 }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { accept = 99048, races = { "Tauren" } }, -- level 11
        { go = { 1411, 54.59, 38.82 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 11
        { complete = 1525, sticky = { 791, 784 }, classes = { "SHAMAN" }, -- level 11
          note = "Your targets are within the cavern. The objective is at the far end." },
        { go = { 1411, 52.85, 28.64 }, text = "Head out of the cave" }, -- level 11
        { accept = 96604, races = { "Tauren" } }, -- level 11
        { complete = 96604, races = { "Tauren" } }, -- level 11
        { turnin = 96604, races = { "Tauren" } }, -- level 11
        { accept = 96822, races = { "Tauren" } }, -- level 11
        { complete = 96822, races = { "Tauren" } }, -- level 11
        { turnin = 96822, races = { "Tauren" } }, -- level 11
        { turnin = 99048, races = { "Tauren" } }, -- level 11
        { accept = 96655, races = { "Tauren" } }, -- level 11
        { accept = 99049, races = { "Tauren" } }, -- level 11
        { complete = 99049, races = { "Tauren" } }, -- level 11
        { go = { 1411, 58.96, 58.33 }, text = "Head indoors" }, -- level 11
        { complete = 784, collect = { { 4882, 1 } }, -- level 11
          note = "The target is indoors, one floor up. Consider bringing a group for this one." },
        { go = { 1411, 59.86, 57.81 }, text = "Stay on the trail and keep climbing the steps" }, -- level 11
        { collect = { { 4881, 1 } }, -- level 11
          note = "The object is on the highest level of this structure." },
        { accept = 830, useitem = 4881 }, -- level 11
        { complete = 791 }, -- level 11
        { complete = 784 }, -- level 11
        { accept = 2161 }, -- level 11
        { accept = 96821, races = { "Tauren" } }, -- level 11
        { accept = 817, -- level 11
          note = "The NPC is indoors." },
        { accept = 97225, races = { "Tauren" } }, -- level 11
        { accept = 818 }, -- level 11
        { accept = { 808, 826, 823 }, sticky = { 815, 817, 826, 818 } }, -- level 11
        { accept = 97223, races = { "Tauren" } }, -- level 11
        { complete = 826, -- level 11
          note = "The target is a troll in crimson robes. This one roams, so scan the surrounding area." },
        { complete = 808, -- level 11
          note = "Look for the skull-shaped objects." },
        { complete = 97225, races = { "Tauren" } }, -- level 11
        { complete = 826 }, -- level 11
        { complete = 826 }, -- level 11
        { complete = 815, -- level 11
          note = "The targets are clumps of purple eggs. Search close to the trunks." },
        { complete = 817 }, -- level 11
        { complete = 97223, races = { "Tauren" } }, -- level 11
        { complete = 818, -- level 11
          note = "The targets are lobsters." },
        { complete = 818, -- level 11
          note = "Hunt the crabs." },
        { turnin = { 808, 826 } }, -- level 11
        { turnin = 97223, races = { "Tauren" } }, -- level 12
        { turnin = 97225, races = { "Tauren" } }, -- level 12
        { turnin = 818 }, -- level 12
        { turnin = 817, -- level 12
          note = "The NPC is indoors." },
        { complete = 96821, races = { "Tauren" } }, -- level 12
        { accept = 99123, races = { "Tauren" } }, -- level 12
        { complete = 99123, races = { "Tauren" } }, -- level 12
        { turnin = 99123, races = { "Tauren" } }, -- level 12
        { complete = 837 }, -- level 12
        { complete = 96825, races = { "Tauren" } }, -- level 12
        { complete = 837 }, -- level 12
        { accept = 816, -- level 12
          note = "The NPC is indoors." },
        { complete = 816 }, -- level 12
        { go = { 1411, 36.64, 57.03 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 12
        { turnin = 1525, when = { ready = 1525 }, classes = { "SHAMAN" }, -- level 12
          note = "The NPC is up on the summit." },
        { accept = 1526, when = { done = 1525 }, classes = { "SHAMAN" } }, -- level 12
        { useitem = 6636, classes = { "SHAMAN" }, -- level 12
          note = "The NPC is up on the summit." },
        { go = { 1411, 38.22, 58.5 }, classes = { "SHAMAN" }, text = "Receive Sapta Sight" }, -- level 12
        { complete = 1526, when = { log = 1526 }, classes = { "SHAMAN" }, -- level 12
          note = "The target is up on the summit." },
        { turnin = 1526, when = { ready = 1526 }, classes = { "SHAMAN" }, -- level 12
          note = "The object is up on the summit." },
        { accept = 1527, when = { done = 1526 }, classes = { "SHAMAN" } }, -- level 12
        { turnin = 1527, when = { log = 1527 }, classes = { "SHAMAN" } }, -- level 12
        { turnin = 816, -- level 12
          note = "The NPC is indoors." },
        { level = 12, patrol = { { 1411, 42.46, 40.56 }, { 1411, 41.16, 37.84 }, { 1411, 44.46, 35.95 } } }, -- level 12
        { turnin = 791, -- level 12
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 815, -- level 12
          note = "This one roams, so scan the surrounding area." },
        { turnin = 96825, races = { "Tauren" } }, -- level 13
        { complete = 96655, races = { "Tauren" } }, -- level 13
        { turnin = 96655, races = { "Tauren" } }, -- level 13
        { turnin = 2161, -- level 13
          note = "The NPC is indoors." },
        { sethearth = "Razor Hill", talk = 6928, -- level 13
          note = "The NPC is indoors." },
        { train = true, talk = 12042, classes = { "DRUID" } }, -- level 13
        { train = true, talk = 3171, classes = { "HUNTER" }, -- level 13
          note = "The NPC is indoors." },
        { train = true, talk = 3620, classes = { "HUNTER" }, -- level 13
          note = "The NPC is indoors." },
        { turnin = { 784, 837, 830 }, accept = 831, -- level 13
          note = "The NPC is indoors, one floor up." },
        { turnin = 96821, races = { "Tauren" } }, -- level 13
        { turnin = 823 }, -- level 13
        { accept = 97282, races = { "Tauren" } }, -- level 13
        { turnin = 99049, races = { "Tauren" } }, -- level 13
        { train = true, talk = 3169, classes = { "WARRIOR" }, -- level 13
          note = "The NPC is indoors." },
        { train = true, talk = 3173, classes = { "SHAMAN" }, -- level 13
          note = "The NPC is indoors." },
        { accept = 834 }, -- level 13
        { complete = 834, -- level 13
          note = "Look for beige sacks." },
        { turnin = 834, accept = 835 }, -- level 13
        { go = { 1411, 51.9, 27.41 }, text = "Stay on the trail, then cross the tunnel" }, -- level 13
        { complete = 835 }, -- level 13
        { go = { 1411, 53.23, 24.54 }, deathskip = true, text = "Die on purpose at this spot", -- level 13
          note = "Die to the monsters here on purpose. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 46.99, 17.63 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 13
        { talk = 6491 }, -- level 13
        { go = { 1411, 53.47, 27.83 }, text = "Traverse the passageway" }, -- level 13
        { turnin = 835 }, -- level 13
        { complete = 97282, races = { "Tauren" } }, -- level 13
        { turnin = 97282, races = { "Tauren" } }, -- level 13
        { accept = 812, -- level 13
          note = "The quest giver stands among the boulders. Move fast: the clock is ticking on this one." },
        { go = { 1454, 45.1, 63.84 }, fly = true, talk = 3310, text = "Fly to Orgrimmar", -- level 13
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 831, -- level 13
          note = "The NPC is indoors." },
        { accept = 813, when = { log = 812 }, -- level 13
          note = "This NPC is found down in the Cleft of Shadow." },
        { abandon = 812, -- level 13
          note = "This clears the quest's time limit." },
        { go = { 1454, 81.59, 19.59 }, classes = { "WARRIOR" }, text = "Learn Staves at the weapon master" }, -- level 13
        { go = { 1454, 81.59, 19.59 }, classes = { "HUNTER" }, text = "Learn Bows at the weapon master" }, -- level 13
        { talk = 2704, classes = { "WARRIOR", "HUNTER" }, -- level 13
          note = "The NPC is indoors." },
        { complete = 813, -- level 13
          note = "The foes here are scorpions." },
        { accept = 97246, why = { back = true, kind = "detour", quest = 97246, quests = 2, seconds = 240, short = true, total = 1000, xp = 700 } }, -- level 13
        { turnin = 97246 }, -- level 13
        { turnin = 813, -- level 13
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 812, why = { kind = "detour", quest = 812, seconds = 120, xp = 1000 }, -- level 13
          note = "The quest giver stands among the boulders." },
        { turnin = 812, when = { ready = 812 }, -- level 13
          note = "The quest giver stands among the boulders." },
        { level = 13, patrol = { { 1411, 43.46, 16.63 }, { 1411, 41.35, 19.36 }, { 1411, 44.36, 20.97 }, { 1411, 38.26, 22.46 }, { 1411, 38.04, 19.17 }, { 1411, 39.25, 16.44 }, { 1411, 49.85, 17.35 }, { 1411, 52.76, 12.83 }, { 1411, 55.84, 12.17 }, { 1411, 55.46, 15.23 } } }, -- level 13
        { accept = 1818, classes = { "WARRIOR" }, -- level 13
          note = "The NPC is indoors." },
        { accept = 95314, races = { "Tauren" } }, -- level 13
        { turnin = 1818, accept = 1819, classes = { "WARRIOR" } }, -- level 13
        { complete = 1819, classes = { "WARRIOR" }, -- level 13
          note = "Look for an iron slab marked with a skull. Wait for the talking to finish" },
        { turnin = 1819, when = { ready = 1819 }, classes = { "WARRIOR" } }, -- level 13
        { accept = 1820, when = { done = 1819 }, classes = { "WARRIOR" } }, -- level 14
        { turnin = 1820, when = { log = 1820 }, classes = { "WARRIOR" }, -- level 14
          note = "The NPC is indoors." },
        { accept = 445, -- level 14
          note = "The NPC is indoors." },
        { accept = 96895, races = { "Tauren" } }, -- level 14
        { turnin = 96895, races = { "Tauren" } }, -- level 14
        { accept = 96897, races = { "Tauren" } }, -- level 14
        { complete = 96897, races = { "Tauren" } }, -- level 14
        { turnin = 96897, races = { "Tauren" } }, -- level 14
        { go = { 1458, 63.25, 48.55 }, fly = true, talk = 4551, text = "Fly to Undercity" }, -- level 14
    },
})
