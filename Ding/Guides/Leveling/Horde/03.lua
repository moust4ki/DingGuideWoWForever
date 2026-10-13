-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/03.lua.
-- Simulated (warrior): Orc 1 (0%) -> 13 (85%) in 9 h 02, 68 quests turned in; Troll 1 (0%) -> 13 (85%) in 9 h 02, 68 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h03-orc-and-troll-starter",
    title    = "Orc and Troll start (1-13)",
    faction  = "Horde",
    races    = { "Orc", "Troll" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-h04-silverpine-forest",
    steps    = {
        { accept = 4641, -- level 1
          note = "Durotar: the Valley of Trials, where orcs and trolls start." },
        { go = { 1411, 43.76, 70.46 }, classes = { "WARRIOR", "SHAMAN", "WARLOCK" }, text = "Loot the beasts you kill on the way here", -- level 1
          note = "Pick up anything that sells for 10 copper or more. You'll level faster with this." },
        { accept = 97279, races = { "Orc", "Troll" } }, -- level 1
        { vendor = true, talk = 3158, classes = { "WARRIOR", "SHAMAN", "WARLOCK" } }, -- level 1
        { train = true, talk = 3153, classes = { "WARRIOR" } }, -- level 1
        { train = true, talk = 3157, classes = { "SHAMAN" } }, -- level 1
        { accept = 1485, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 1
        { turnin = 4641, accept = 788, -- level 1
          note = "Your targets are within the cavern." },
        { complete = 97279, races = { "Orc", "Troll" } }, -- level 1
        { train = true, talk = 3156, races = { "Orc" }, classes = { "WARLOCK" }, -- level 1
          note = "Your targets are within the cavern." },
        { complete = 788 }, -- level 1
        { level = 2, xp = 450, patrol = { { 1411, 44.43, 63.24 }, { 1411, 47.04, 64.77 }, { 1411, 46.36, 68.17 }, { 1411, 43.83, 66.23 }, { 1411, 40.96, 64.17 }, { 1411, 42.16, 60.97 } } }, -- level 2
        { complete = 1485, races = { "Orc" }, classes = { "WARLOCK" }, -- level 2
          note = "Stay out of the cave when you can. The following step is out of the cave." },
        { accept = 790 }, -- level 2
        { complete = 790, -- level 2
          note = "Look for a dark-shelled scorpion. This one roams, so scan the surrounding area." },
        { turnin = 790, accept = 804 }, -- level 2
        { turnin = 97279, races = { "Orc", "Troll" } }, -- level 3
        { level = 3, xp = 1080, patrol = { { 1411, 44.43, 63.24 }, { 1411, 47.04, 64.77 }, { 1411, 46.36, 68.17 }, { 1411, 43.83, 66.23 }, { 1411, 40.96, 64.17 }, { 1411, 42.16, 60.97 } }, -- level 3
          note = "With the coming hand-ins, this brings you to level 4." },
        { turnin = 1485, when = { ready = 1485 }, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 3
        { accept = 1499, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 3
        { turnin = 1499, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 3
        { turnin = { 788, 804 }, accept = 789, -- level 3
          note = "Your targets are within the cavern." },
        { accept = 98575, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 3
        { accept = 98576, races = { "Orc" }, classes = { "MAGE" } }, -- level 3
        { accept = 2383, races = { "Orc" }, classes = { "WARRIOR" } }, -- level 3
        { accept = 3089, races = { "Orc" }, classes = { "SHAMAN" } }, -- level 3
        { accept = 3088, races = { "Orc" }, classes = { "ROGUE" } }, -- level 3
        { accept = 3087, races = { "Orc" }, classes = { "HUNTER" } }, -- level 3
        { accept = 3090, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 3
        { accept = 3065, races = { "Troll" }, classes = { "WARRIOR" } }, -- level 3
        { accept = 3082, races = { "Troll" }, classes = { "HUNTER" } }, -- level 3
        { accept = 3083, races = { "Troll" }, classes = { "ROGUE" } }, -- level 3
        { accept = 3085, races = { "Troll" }, classes = { "PRIEST" } }, -- level 3
        { accept = 3084, races = { "Troll" }, classes = { "SHAMAN" } }, -- level 3
        { accept = 3086, races = { "Troll" }, classes = { "MAGE" } }, -- level 3
        { turnin = 3088, races = { "Orc" }, classes = { "ROGUE" }, -- level 3
          note = "Your targets are within the cavern." },
        { turnin = 3083, races = { "Troll" }, classes = { "ROGUE" } }, -- level 3
        { train = true, talk = 3155, classes = { "ROGUE" }, -- level 3
          note = "Your targets are within the cavern." },
        { turnin = 3090, races = { "Orc" }, classes = { "WARLOCK" }, -- level 3
          note = "Your targets are within the cavern." },
        { train = true, talk = 3156, races = { "Orc" }, classes = { "WARLOCK" }, -- level 3
          note = "Your targets are within the cavern." },
        { vendor = true, talk = 12776, races = { "Orc" }, classes = { "WARLOCK" }, -- level 3
          note = "Your targets are within the cavern." },
        { accept = 4402 }, -- level 3
        { turnin = 3085, races = { "Troll" }, classes = { "PRIEST" } }, -- level 3
        { train = true, talk = 3707, races = { "Troll" }, classes = { "PRIEST" } }, -- level 3
        { turnin = 3089, races = { "Orc" }, classes = { "SHAMAN" } }, -- level 3
        { turnin = 3084, races = { "Troll" }, classes = { "SHAMAN" } }, -- level 3
        { train = true, talk = 3157, classes = { "SHAMAN" } }, -- level 3
        { turnin = 3086, races = { "Troll" }, classes = { "MAGE" } }, -- level 3
        { train = true, talk = 5884, races = { "Troll" }, classes = { "MAGE" } }, -- level 3
        { accept = 792, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 3
        { turnin = 2383, races = { "Orc" }, classes = { "WARRIOR" } }, -- level 3
        { turnin = 3065, races = { "Troll" }, classes = { "WARRIOR" } }, -- level 3
        { train = true, talk = 3153, classes = { "WARRIOR" } }, -- level 4
        { turnin = 3087, races = { "Orc" }, classes = { "HUNTER" } }, -- level 4
        { turnin = 3082, races = { "Troll" }, classes = { "HUNTER" } }, -- level 4
        { train = true, talk = 3154, classes = { "HUNTER" } }, -- level 4
        { accept = 5441, sticky = { 789, 5441, 4402 } }, -- level 4
        { complete = 792, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" }, -- level 4
          note = "Stay out of the cave when you can. The following step is out of the cave." },
        { complete = 789, -- level 4
          note = "The foes here are scorpions." },
        { complete = 5441, useitem = 16114, -- level 4
          note = "Target Lazy Peons with the item. The targets are dozing orcs. Search close to the trunks." },
        { complete = 4402, -- level 4
          note = "Look for cacti bearing red fruit." },
        { turnin = 4402 }, -- level 4
        { turnin = 789, -- level 5
          note = "Your targets are within the cavern." },
        { turnin = 98576, races = { "Orc" }, classes = { "MAGE" } }, -- level 5
        { turnin = 792, when = { ready = 792 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 5
        { accept = 1485, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 5
        { complete = 1485, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 5
        { turnin = 1485, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 5
        { accept = 1499, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 5
        { turnin = 1499, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 5
        { accept = 794 }, -- level 5
        { turnin = 5441, accept = 6394 }, -- level 5
        { go = { 1411, 45.37, 56.4 }, text = "Go into the cavern" }, -- level 5
        { complete = 6394, -- level 5
          note = "Your targets are within the cavern." },
        { go = { 1411, 44.73, 54.57 }, text = "Stay on the trail" }, -- level 5
        { complete = 794, -- level 5
          note = "Your targets are within the cavern." },
        { turnin = 98575, races = { "Troll" }, classes = { "WARLOCK" } }, -- level 5
        { level = 6, patrol = { { 1411, 45.37, 56.4 }, { 1411, 43.23, 55.37 }, { 1411, 42.44, 53.43 }, { 1411, 44.77, 52.44 } }, -- level 5
          note = "Your targets are within the cavern." },
        { train = true, talk = 3153, classes = { "WARRIOR" } }, -- level 6
        { train = true, talk = 3154, classes = { "HUNTER" } }, -- level 6
        { turnin = 794, accept = 805 }, -- level 6
        { accept = 96652, races = { "Orc", "Troll" } }, -- level 6
        { accept = 5649, races = { "Troll" }, classes = { "PRIEST" } }, -- level 6
        { train = true, talk = 3707, races = { "Troll" }, classes = { "PRIEST" } }, -- level 6
        { turnin = 1516, when = { ready = 1516 }, classes = { "SHAMAN" } }, -- level 6
        { train = true, talk = 3157, classes = { "SHAMAN" } }, -- level 6
        { go = { 1411, 41.5, 73.22 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 6
        { useitem = 6635, classes = { "SHAMAN" }, -- level 6
          note = "The NPC is up on the summit." },
        { train = true, talk = 5884, races = { "Troll" }, classes = { "MAGE" } }, -- level 6
        { go = { 1411, 42.23, 68.39 }, races = { "Orc" }, classes = { "WARLOCK" }, text = "Go into the cavern", -- level 6
          note = "Your targets are within the cavern." },
        { train = true, talk = 3156, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 6
        { vendor = true, talk = 12776, races = { "Orc" }, classes = { "WARLOCK" }, -- level 6
          note = "Your targets are within the cavern." },
        { go = { 1411, 42.23, 68.39 }, classes = { "ROGUE" }, text = "Go into the cavern", -- level 6
          note = "Your targets are within the cavern." },
        { train = true, talk = 3155, classes = { "ROGUE" } }, -- level 6
        { turnin = 6394 }, -- level 6
        { accept = 2161 }, -- level 6
        { accept = 786, -- level 6
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { accept = 96821, races = { "Orc", "Troll" } }, -- level 6
        { accept = 817, -- level 6
          note = "The NPC is indoors." },
        { accept = 818 }, -- level 6
        { turnin = 805, when = { log = 805 } }, -- level 6
        { accept = { 808, 826, 823 }, sticky = 818 }, -- level 6
        { complete = 818, -- level 6
          note = "The targets are lobsters. Walk the shoreline toward the southwest. If the beach ends first, move on without it." },
        { complete = 818, -- level 6
          note = "Hunt the crabs." },
        { go = { 1411, 50.79, 79.17 }, text = "Stay on the trail" }, -- level 6
        { complete = 786, -- level 6
          note = "The NPC is indoors." },
        { accept = 99123, races = { "Orc", "Troll" } }, -- level 6
        { complete = 99123, races = { "Orc", "Troll" } }, -- level 6
        { complete = 786 }, -- level 6
        { complete = 786, -- level 6
          note = "Keep to the trail as it curves." },
        { go = { 1411, 46.46, 79.15 }, deathskip = true, text = "Die on purpose at this spot", -- level 6
          note = "Step into the flames. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 57.45, 73.32 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 6
        { talk = 6491 }, -- level 6
        { turnin = 818, when = { ready = 818 } }, -- level 6
        { turnin = 99123, races = { "Orc", "Troll" } }, -- level 6
        { turnin = 786, -- level 7
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 96821, races = { "Orc", "Troll" } }, -- level 7
        { turnin = 823 }, -- level 7
        { accept = { 784, 837 }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { accept = 96825, races = { "Orc", "Troll" } }, -- level 7
        { accept = 815, -- level 7
          note = "This one roams, so scan the surrounding area." },
        { go = { 1411, 50.14, 42.95 }, text = "Climb the trail" }, -- level 7
        { accept = 791, -- level 7
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 2161, -- level 7
          note = "The NPC is indoors." },
        { go = { 1411, 51.87, 40.83 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn Mining from the trainer" }, -- level 7
        { talk = 3175, classes = { "WARRIOR", "ROGUE" } }, -- level 7
        { go = { 1411, 52.09, 40.69 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn Blacksmithing from the trainer" }, -- level 7
        { accept = 96822, races = { "Orc", "Troll" } }, -- level 7
        { talk = 3174, classes = { "WARRIOR", "ROGUE" } }, -- level 7
        { talk = 3168, buy = { { 2901, 1, 3168 } }, classes = { "WARRIOR", "ROGUE" } }, -- level 7
        { turnin = 5649, accept = 5648, races = { "Troll" }, classes = { "PRIEST" }, -- level 7
          note = "The NPC is indoors." },
        { complete = 5648, races = { "Troll" }, classes = { "PRIEST" }, -- level 7
          note = "Heal Grunt Kor'ja with the second rank of Lesser Heal. Buff Grunt Kor'ja with Power Word: Fortitude." },
        { turnin = 5648, sticky = { 791, 784 }, when = { ready = 5648 }, races = { "Troll" }, classes = { "PRIEST" }, -- level 7
          note = "The NPC is indoors." },
        { go = { 1411, 58.96, 58.33 }, text = "Head indoors" }, -- level 7
        { complete = 784, collect = { { 4882, 1 } }, -- level 7
          note = "The NPC is indoors, one floor up. Consider bringing a group for this one." },
        { complete = 96822, races = { "Orc", "Troll" } }, -- level 7
        { go = { 1411, 59.86, 57.81 }, text = "Stay on the trail and keep climbing the steps" }, -- level 7
        { collect = { { 4881, 1 } }, -- level 7
          note = "The NPC stands on the highest level of this structure." },
        { accept = 830, useitem = 4881 }, -- level 7
        { complete = 791 }, -- level 7
        { complete = 784 }, -- level 8
        { level = 8, patrol = { { 1411, 55.86, 53.35 }, { 1411, 57.65, 52.46 }, { 1411, 55.44, 51.16 }, { 1411, 58.63, 55.16 }, { 1411, 56.17, 56.86 }, { 1411, 58.43, 58.15 } } }, -- level 8
        { go = { 1411, 55.86, 53.35 }, deathskip = true, text = "Die on purpose at this spot", -- level 8
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 53.55, 44.48 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 8
        { talk = 6491 }, -- level 8
        { train = true, talk = 3171, classes = { "HUNTER" }, -- level 8
          note = "The NPC is indoors." },
        { train = true, talk = 3170, classes = { "ROGUE" }, -- level 8
          note = "The NPC is indoors, one floor up." },
        { turnin = { 784, 830 }, accept = { 825, 831 }, -- level 8
          note = "The NPC is indoors, one floor up." },
        { go = { 1411, 50.14, 42.95 }, text = "Climb the trail" }, -- level 8
        { turnin = 791, -- level 8
          note = "The NPC waits on the tower's highest floor." },
        { sethearth = "Razor Hill", talk = 6928, -- level 8
          note = "The NPC is indoors." },
        { turnin = 96822, races = { "Orc", "Troll" } }, -- level 8
        { train = true, talk = 3172, races = { "Orc" }, classes = { "WARLOCK" }, -- level 8
          note = "The NPC is out back, at the rear of the structure." },
        { vendor = true, talk = 6027, races = { "Orc" }, classes = { "WARLOCK" }, -- level 8
          note = "The NPC is out back, at the rear of the structure." },
        { train = true, talk = 3706, races = { "Troll" }, classes = { "PRIEST" }, -- level 8
          note = "The NPC is indoors." },
        { train = true, talk = 3169, classes = { "WARRIOR" }, -- level 8
          note = "The NPC is indoors." },
        { train = true, talk = 3173, classes = { "SHAMAN" }, -- level 8
          note = "The NPC is indoors." },
        { go = { 1411, 54.11, 41.87 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn First Aid from the trainer" }, -- level 8
        { talk = 5943, classes = { "WARRIOR", "ROGUE" }, -- level 8
          note = "The NPC is indoors." },
        { complete = 825, sticky = { 815, 817, 826 }, -- level 8
          note = "Loot the gray chests built from metal. Search in and around the sunken wrecks. Your targets sit below the water's surface." },
        { accept = 97225, races = { "Orc", "Troll" } }, -- level 8
        { complete = 97225, races = { "Orc", "Troll" } }, -- level 8
        { complete = 826, -- level 8
          note = "The target is a troll in crimson robes. This one roams, so scan the surrounding area." },
        { complete = 808, -- level 8
          note = "Look for the skull-shaped objects." },
        { complete = 826 }, -- level 8
        { complete = 826 }, -- level 8
        { complete = 815, -- level 8
          note = "The targets are clumps of purple eggs. Search close to the trunks." },
        { complete = 817 }, -- level 8
        { accept = 97223, races = { "Orc", "Troll" } }, -- level 8
        { complete = 97223, races = { "Orc", "Troll" } }, -- level 8
        { go = { 1411, 61.25, 89.55 }, deathskip = true, text = "Die on purpose at this spot", -- level 8
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 57.54, 73.3 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 8
        { talk = 6491 }, -- level 8
        { train = true, talk = 5880, races = { "Troll" }, classes = { "MAGE" } }, -- level 8
        { turnin = { 808, 826 } }, -- level 8
        { turnin = 97223, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 97225, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 817, -- level 9
          note = "The NPC is indoors." },
        { accept = 96604, races = { "Orc", "Troll" } }, -- level 9
        { complete = 96604, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 96604, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 96652, races = { "Orc", "Troll" } }, -- level 9
        { accept = 99048, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 99048, races = { "Orc", "Troll" } }, -- level 9
        { accept = 97900, races = { "Orc", "Troll" } }, -- level 9
        { accept = 97902, races = { "Orc", "Troll" } }, -- level 9
        { accept = 97903, races = { "Orc", "Troll" } }, -- level 9
        { accept = 97904, races = { "Orc", "Troll" } }, -- level 9
        { complete = 97904, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 97904, races = { "Orc", "Troll" } }, -- level 9
        { accept = 97907, races = { "Orc", "Troll" } }, -- level 9
        { accept = 99049, races = { "Orc", "Troll" } }, -- level 9
        { complete = 99049, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 825, -- level 9
          note = "The NPC is indoors, one floor up." },
        { accept = 96655, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 815, -- level 9
          note = "This one roams, so scan the surrounding area." },
        { complete = 96825, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 96825, races = { "Orc", "Troll" } }, -- level 9
        { complete = 96655, races = { "Orc", "Troll" } }, -- level 9
        { turnin = 96655, races = { "Orc", "Troll" } }, -- level 9
        { complete = 837 }, -- level 9
        { complete = 837 }, -- level 9
        { level = 9, xp = 5875, patrol = { { 1411, 42.46, 40.56 }, { 1411, 41.16, 37.84 }, { 1411, 44.46, 35.95 } }, -- level 9
          note = "With the coming turn-ins, this gets you to level 10." },
        { go = { 1411, 42.46, 40.56 }, deathskip = true, text = "Die on purpose at this spot", -- level 9
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 53.55, 44.48 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 9
        { talk = 6491 }, -- level 9
        { turnin = 837, -- level 9
          note = "The NPC is indoors, one floor up." },
        { turnin = 96821, races = { "Orc", "Troll" } }, -- level 10
        { complete = 97900, races = { "Orc", "Troll" } }, -- level 10
        { turnin = 97900, races = { "Orc", "Troll" } }, -- level 10
        { complete = 97902, races = { "Orc", "Troll" } }, -- level 10
        { turnin = 97902, races = { "Orc", "Troll" } }, -- level 10
        { complete = 97903, races = { "Orc", "Troll" } }, -- level 10
        { turnin = 97903, races = { "Orc", "Troll" } }, -- level 10
        { complete = 97907, races = { "Orc", "Troll" } }, -- level 10
        { turnin = 97907, races = { "Orc", "Troll" } }, -- level 10
        { turnin = 99049, races = { "Orc", "Troll" } }, -- level 10
        { train = true, talk = 3706, races = { "Troll" }, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 5654, races = { "Troll" }, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 3170, classes = { "ROGUE" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 3172, races = { "Orc" }, classes = { "WARLOCK" }, -- level 10
          note = "The NPC is out back, at the rear of the structure." },
        { vendor = true, talk = 6027, races = { "Orc" }, classes = { "WARLOCK" }, -- level 10
          note = "The NPC is out back, at the rear of the structure." },
        { train = true, talk = 3169, classes = { "WARRIOR" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 3171, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 6062, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { complete = 6062, useitem = 15917, classes = { "HUNTER" }, -- level 10
          note = "Aim the item at one Dire Mottled Boar." },
        { turnin = 6062, when = { ready = 6062 }, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 6083, when = { done = 6062 }, classes = { "HUNTER" } }, -- level 10
        { complete = 6083, useitem = 15919, when = { log = 6083 }, classes = { "HUNTER" }, -- level 10
          note = "Use it on any Surf Crawler. Hunt the crabs." },
        { turnin = 6083, when = { ready = 6083 }, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 6082, when = { done = 6083 }, classes = { "HUNTER" } }, -- level 10
        { complete = 6082, useitem = 15920, when = { log = 6082 }, classes = { "HUNTER" }, -- level 10
          note = "Use it on any Armored Scorpid." },
        { turnin = 6082, when = { ready = 6082 }, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 6081, when = { done = 6082 }, classes = { "HUNTER" } }, -- level 10
        { talk = 3881, buy = { { 117, 1, 3881 } }, classes = { "HUNTER" }, -- level 10
          note = "Keep it as pet food for later." },
        { vendor = true, talk = 3881, classes = { "HUNTER" } }, -- level 10
        { accept = 812, classes = { "HUNTER" }, -- level 10
          note = "The quest giver stands among the boulders. Move fast: the clock is ticking on this one." },
        { go = { 1454, 45.1, 63.84 }, fly = true, talk = 3310, classes = { "HUNTER" }, text = "Fly to Orgrimmar", -- level 10
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 831, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 813, when = { log = 812 }, classes = { "HUNTER" }, -- level 10
          note = "This NPC is found down in the Cleft of Shadow." },
        { abandon = 812, classes = { "HUNTER" }, -- level 10
          note = "This clears the quest's time limit." },
        { turnin = 6081, when = { log = 6081 }, classes = { "HUNTER" }, -- level 10
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, classes = { "HUNTER" }, -- level 10
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1411, 49.85, 17.35 }, classes = { "HUNTER" }, text = "Tame a pet here", -- level 10
          note = "Find one Venomtail Scorpid and use Tame Beast on it. The foes here are scorpions. Here you tame a pet to keep." },
        { train = true, talk = 3173, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 2983, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is indoors." },
        { turnin = 2983, accept = 1524, classes = { "SHAMAN" }, -- level 10
          note = "This one roams, so scan the surrounding area." },
        { go = { 1411, 36.64, 57.03 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 10
        { turnin = 1524, accept = 1525, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is up on the summit." },
        { complete = 1525, classes = { "SHAMAN" }, -- level 10
          note = "Kill Water Seekers and Thornweavers." },
        { go = { 1413, 54.57, 38.82 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 10
        { complete = 1525, classes = { "SHAMAN" }, -- level 10
          note = "Your targets are within the cavern. The objective is at the far end." },
        { go = { 1411, 52.85, 28.64 }, text = "Head out of the cave" }, -- level 10
        { accept = 97282, races = { "Orc", "Troll" } }, -- level 10
        { accept = 834 }, -- level 10
        { complete = 834, -- level 10
          note = "Look for beige sacks." },
        { turnin = 834, accept = 835 }, -- level 10
        { go = { 1411, 51.9, 27.41 }, text = "Stay on the trail, then cross the tunnel" }, -- level 10
        { complete = 835 }, -- level 10
        { go = { 1411, 53.23, 24.54 }, deathskip = true, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 46.99, 17.63 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491 }, -- level 10
        { go = { 1411, 53.47, 27.83 }, text = "Traverse the passageway" }, -- level 10
        { turnin = 835 }, -- level 10
        { complete = 97282, races = { "Orc", "Troll" } }, -- level 10
        { turnin = 97282, races = { "Orc", "Troll" } }, -- level 10
        { accept = 816, -- level 10
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { complete = 816 }, -- level 10
        { go = { 1411, 36.64, 57.03 }, classes = { "SHAMAN" }, text = "Climb the trail" }, -- level 10
        { turnin = 1525, when = { ready = 1525 }, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is up on the summit." },
        { accept = 1526, when = { done = 1525 }, classes = { "SHAMAN" } }, -- level 10
        { useitem = 6636, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is up on the summit." },
        { go = { 1411, 38.22, 58.5 }, classes = { "SHAMAN" }, text = "Receive Sapta Sight" }, -- level 10
        { complete = 1526, when = { log = 1526 }, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is up on the summit." },
        { turnin = 1526, when = { ready = 1526 }, classes = { "SHAMAN" }, -- level 10
          note = "The NPC is up on the summit." },
        { accept = 1527, when = { done = 1526 }, classes = { "SHAMAN" } }, -- level 10
        { turnin = 1527, when = { log = 1527 }, classes = { "SHAMAN" }, -- level 10
          note = "This one roams, so scan the surrounding area." },
        { level = 11, xp = 4400, patrol = { { 1411, 42.46, 40.56 }, { 1411, 41.16, 37.84 }, { 1411, 44.46, 35.95 } } }, -- level 11
        { turnin = 816, -- level 11
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { accept = 812, classes = { "WARRIOR", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }, -- level 11
          note = "The quest giver stands among the boulders. Move fast: the clock is ticking on this one." },
        { go = { 1454, 45.1, 63.84 }, fly = true, talk = 3310, text = "Fly to Orgrimmar", -- level 11
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 5654, races = { "Troll" }, classes = { "PRIEST" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 831, classes = { "WARRIOR", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 813, when = { log = 812 }, -- level 11
          note = "This NPC is found down in the Cleft of Shadow." },
        { abandon = 812, -- level 11
          note = "This clears the quest's time limit." },
        { go = { 1411, 55.06, 9.82 }, text = "Head out of the cave" }, -- level 11
        { complete = 813, -- level 11
          note = "The foes here are scorpions." },
        { turnin = 813, -- level 11
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 812, -- level 11
          note = "The quest giver stands among the boulders." },
        { turnin = 812, when = { ready = 812 }, -- level 11
          note = "The quest giver stands among the boulders." },
        { level = 12, patrol = { { 1411, 43.46, 16.63 }, { 1411, 41.35, 19.36 }, { 1411, 44.36, 20.97 }, { 1411, 38.26, 22.46 }, { 1411, 38.04, 19.17 }, { 1411, 39.25, 16.44 }, { 1411, 49.85, 17.35 }, { 1411, 52.76, 12.83 }, { 1411, 55.84, 12.17 }, { 1411, 55.46, 15.23 } } }, -- level 11
        { train = true, talk = 5883, races = { "Troll" }, classes = { "MAGE" }, -- level 11
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Troll" }, classes = { "PRIEST" }, -- level 11
          note = "The NPC is indoors." },
        { train = true, talk = 3344, classes = { "SHAMAN" }, -- level 11
          note = "The NPC is indoors." },
        { train = true, talk = 3328, classes = { "ROGUE" }, -- level 11
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc" }, classes = { "WARLOCK" }, -- level 11
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc" }, classes = { "WARLOCK" }, -- level 11
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 12
          note = "The NPC is indoors." },
        { go = { 1454, 81.59, 19.59 }, classes = { "WARRIOR" }, text = "Learn Staves at the weapon master" }, -- level 12
        { talk = 2704, classes = { "WARRIOR" }, -- level 12
          note = "The NPC is indoors." },
        { train = true, talk = 3352, classes = { "HUNTER" }, -- level 12
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, classes = { "HUNTER" }, -- level 12
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1458, 63.25, 48.55 }, fly = true, talk = 4551, classes = { "WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "MAGE", "DRUID" }, text = "Fly to Undercity" }, -- level 12
        { accept = 1818, classes = { "WARRIOR" }, -- level 12
          note = "The NPC is indoors." },
        { accept = { 354, 362 }, -- level 12
          note = "The NPC is indoors." },
        { accept = 1881, races = { "Troll" }, classes = { "MAGE" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { accept = 375, -- level 12
          note = "The NPC is indoors, one floor up." },
        { accept = 1478, races = { "Orc" }, classes = { "WARLOCK" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { accept = 358, -- level 12
          note = "The NPC is indoors." },
        { accept = 398, -- level 12
          note = "The quest comes from a bounty sign." },
        { accept = 367, -- level 12
          note = "The NPC is indoors." },
        { turnin = 1818, accept = 1819, classes = { "WARRIOR" } }, -- level 12
        { complete = 1819, classes = { "WARRIOR" }, -- level 12
          note = "Look for an iron slab marked with a skull. Wait for the talking to finish" },
        { turnin = 1819, when = { ready = 1819 }, classes = { "WARRIOR" } }, -- level 12
        { accept = 1820, when = { done = 1819 }, classes = { "WARRIOR" } }, -- level 12
        { accept = 86784, races = { "Orc", "Troll" } }, -- level 12
        { turnin = 1820, when = { log = 1820 }, classes = { "WARRIOR" }, -- level 12
          note = "The NPC is indoors." },
        { accept = 97558, races = { "Orc", "Troll" } }, -- level 12
        { go = { 1458, 63.25, 48.55 }, fly = true, talk = 4551, classes = { "ROGUE", "MAGE", "WARLOCK" }, text = "Fly to Undercity" }, -- level 12
        { go = { 1458, 57.26, 32.71 }, classes = { "ROGUE" }, text = "Learn Swords at the weapon master" }, -- level 12
        { talk = 11870, classes = { "ROGUE" } }, -- level 12
        { turnin = 1478, races = { "Orc" }, classes = { "WARLOCK" } }, -- level 12
        { useitem = 6284, when = { log = 1471 }, races = { "Orc" }, classes = { "WARLOCK" }, -- level 12
          note = "Use the item at the pink marking." },
        { turnin = 1881, accept = 1882, sticky = 367, races = { "Troll" }, classes = { "MAGE" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { complete = 375 }, -- level 12
        { complete = 97558, races = { "Orc", "Troll" } }, -- level 12
        { complete = 367, -- level 12
          note = "The targets are gray, demon-like hounds. This leads to a quest for later levels." },
        { accept = 95314, races = { "Orc", "Troll" } }, -- level 12
        { turnin = 367, accept = 368, -- level 12
          note = "The NPC is indoors." },
        { talk = 2118, buy = { { 2320, 1, 2118 } } }, -- level 12
        { turnin = 375, when = { item = 2320 }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { complete = 86784, races = { "Orc", "Troll" } }, -- level 12
        { turnin = 86784, races = { "Orc", "Troll" } }, -- level 12
        { accept = 99142, races = { "Orc", "Troll" } }, -- level 12
        { complete = 362, -- level 12
          note = "The target is a skeletal caster in armor. This one roams, so scan the surrounding area." },
        { complete = 354, -- level 12
          note = "The target is a banshee. This one roams, so scan the surrounding area. Check each of the two floors indoors." },
        { complete = 354, -- level 12
          note = "Your target is a ghoul. This one roams, so scan the surrounding area." },
        { complete = 354, -- level 12
          note = "The target is a shambling zombie. This one roams, so scan the surrounding area." },
        { accept = 361, useitem = 2839, sticky = 358, when = { item = 2839 } }, -- level 12
        { go = { 1420, 54.24, 31.72 }, text = "Drop down with care" }, -- level 12
        { complete = 398, -- level 12
          note = "The NPC is indoors." },
        { complete = 368, sticky = 358, -- level 12
          note = "Fight the murlocs." },
        { complete = 358 }, -- level 12
        { complete = 358 }, -- level 12
        { complete = 358, -- level 12
          note = "Your targets here are gnolls." },
        { turnin = 361, when = { log = 361 }, -- level 12
          note = "The NPC is indoors." },
        { turnin = { 354, 362 }, accept = 355, -- level 12
          note = "The NPC is indoors." },
        { turnin = { 355, 358 }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 398 }, -- level 13
        { turnin = 368, accept = 445, -- level 13
          note = "The NPC is indoors." },
        { turnin = 97558, races = { "Orc", "Troll" } }, -- level 13
        { accept = 96895, races = { "Orc", "Troll" } }, -- level 13
        { accept = 356, sticky = 356 }, -- level 13
        { accept = 96897, races = { "Orc", "Troll" } }, -- level 13
        { accept = 96898, races = { "Orc", "Troll" } }, -- level 13
        { complete = 1882, races = { "Troll" }, classes = { "MAGE" } }, -- level 13
        { complete = 356 }, -- level 13
        { complete = 99142, races = { "Orc", "Troll" } }, -- level 13
        { turnin = 96895, races = { "Orc", "Troll" } }, -- level 13
        { complete = 96897, races = { "Orc", "Troll" } }, -- level 13
        { turnin = 96897, races = { "Orc", "Troll" } }, -- level 13
        { complete = 96898, races = { "Orc", "Troll" } }, -- level 13
        { turnin = 96898, races = { "Orc", "Troll" } }, -- level 13
        { level = 12, xp = 9450, patrol = { { 1420, 75.48, 60.8 }, { 1420, 76.45, 62.64 }, { 1420, 73.46, 61.23 }, { 1420, 75.14, 58.36 }, { 1420, 78.66, 58.96 } }, -- level 13
          note = "Together with the next turn-ins, this brings you to level 13." },
        { turnin = 356 }, -- level 13
        { turnin = 99142, races = { "Orc", "Troll" } }, -- level 13
        { turnin = 1882, when = { ready = 1882 }, races = { "Troll" }, classes = { "MAGE" }, -- level 13
          note = "The NPC is indoors, one floor up." },
    },
})
