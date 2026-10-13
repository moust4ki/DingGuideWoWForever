-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/01.lua.
-- Simulated (warrior): Scourge 1 (0%) -> 14 (3%) in 8 h 55, 71 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h01-undead-starter",
    title    = "Undead start (1-13)",
    faction  = "Horde",
    races    = { "Scourge" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-h04-silverpine-forest",
    steps    = {
        { destroy = 6948, -- level 1
          note = "Tirisfal Glades: Deathknell, where the undead rise. This frees room in your bags. You receive one further along the route." },
        { accept = 363, -- level 1
          note = "The NPC stands outdoors, next to the crypt." },
        { go = { 1420, 29.46, 69.54 }, classes = { "WARRIOR", "WARLOCK" }, text = "Loot the beasts you kill on the way here", -- level 1
          note = "Pick up anything that sells for 10 copper or more. You'll level faster with this." },
        { vendor = true, talk = 2116, classes = { "WARRIOR", "WARLOCK" }, -- level 1
          note = "The NPC is indoors." },
        { turnin = 363, accept = 364, -- level 1
          note = "The NPC is indoors." },
        { accept = 1470, classes = { "WARLOCK" }, -- level 1
          note = "The NPC is indoors." },
        { train = true, classes = { "WARLOCK" } }, -- level 1
        { talk = 2126, sticky = 364, classes = { "WARLOCK" }, -- level 1
          note = "The NPC is indoors." },
        { complete = 1470, classes = { "WARLOCK" } }, -- level 1
        { turnin = 1470, when = { ready = 1470 }, classes = { "WARLOCK" }, -- level 1
          note = "The NPC is indoors." },
        { train = true, talk = 2119, classes = { "WARRIOR" }, -- level 1
          note = "The NPC is indoors." },
        { complete = 364 }, -- level 1
        { turnin = 364, accept = 3901, -- level 2
          note = "The NPC is indoors." },
        { accept = 3095, classes = { "WARRIOR" } }, -- level 2
        { accept = 3099, classes = { "WARLOCK" } }, -- level 2
        { accept = 3096, classes = { "ROGUE" } }, -- level 2
        { accept = 3097, classes = { "PRIEST" } }, -- level 2
        { accept = 3098, classes = { "MAGE" } }, -- level 2
        { accept = 376, -- level 2
          note = "The NPC is indoors." },
        { turnin = 3098, classes = { "MAGE" }, -- level 2
          note = "The NPC is indoors." },
        { train = true, talk = 2124, classes = { "MAGE" }, -- level 2
          note = "The NPC is indoors." },
        { turnin = 3099, classes = { "WARLOCK" }, -- level 2
          note = "The NPC is indoors." },
        { turnin = 3097, classes = { "PRIEST" }, -- level 2
          note = "The NPC is indoors." },
        { train = true, talk = 2123, classes = { "PRIEST" } }, -- level 2
        { complete = 3901 }, -- level 2
        { complete = 376, -- level 3
          note = "The targets are wolves." },
        { complete = 376, -- level 3
          note = "The targets are bats." },
        { level = 3, xp = 1000, patrol = { { 1420, 31.35, 58.35 }, { 1420, 29.46, 58.77 }, { 1420, 30.23, 62.14 }, { 1420, 29.26, 64.45 }, { 1420, 28.96, 67.76 }, { 1420, 32.43, 67.03 }, { 1420, 34.43, 66.35 }, { 1420, 34.45, 58.23 }, { 1420, 31.03, 55.46 } }, -- level 3
          note = "With the coming hand-ins, this brings you to level 4." },
        { turnin = 376, accept = 6395, -- level 3
          note = "The NPC is indoors." },
        { turnin = 3901, -- level 3
          note = "The NPC is indoors." },
        { train = true, talk = 2124, classes = { "MAGE" }, -- level 3
          note = "The NPC is indoors." },
        { train = true, classes = { "WARLOCK" } }, -- level 3
        { talk = 2126, classes = { "WARLOCK" }, -- level 3
          note = "The NPC is indoors." },
        { train = true, talk = 2123, classes = { "PRIEST" }, -- level 3
          note = "The NPC is indoors." },
        { accept = 380 }, -- level 4
        { accept = 96656, races = { "Scourge" } }, -- level 4
        { turnin = 3095, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 2119, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3096, classes = { "ROGUE" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 2122, classes = { "ROGUE" }, -- level 4
          note = "The NPC is indoors." },
        { accept = 3902, -- level 4
          note = "This one roams, so scan the surrounding area." },
        { complete = 3902, -- level 4
          note = "Search stacks of brown crates. Check in and around the structures." },
        { complete = 380, -- level 4
          note = "Just out of the mine." },
        { complete = 380, -- level 4
          note = "The objective is underground, in the mine shaft." },
        { level = 4, xp = 1500, patrol = { { 1420, 26.87, 59.44 }, { 1420, 25.46, 59.66 }, { 1420, 23.37, 60.16 }, { 1420, 23.44, 58.17 }, { 1420, 27.23, 56.75 }, { 1420, 29.44, 57.45 }, { 1420, 29.25, 59.54 } }, -- level 4
          note = "With the coming hand-ins, this gets you to level 5. The targets roam the mine and the area around it." },
        { go = { 1420, 26.87, 59.44 }, deathskip = true, text = "Die on purpose at this spot", -- level 4
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1420, 31.28, 64.93 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 4
        { talk = 6491 }, -- level 4
        { go = { 1420, 26.86, 59.46 }, text = "Exit the mine shaft" }, -- level 4
        { turnin = 3902, -- level 4
          note = "This one roams, so scan the surrounding area." },
        { turnin = 380, accept = 381 }, -- level 4
        { complete = 381 }, -- level 5
        { collect = { { 16333, 1 } }, spots = { { 1420, 36.74, 61.61 } }, -- level 5
          note = "The target is a shambling zombie. This one roams, so scan the surrounding area." },
        { go = { 1420, 37.55, 61.41 }, deathskip = true, text = "Die on purpose at this spot", -- level 5
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1420, 31.18, 64.93 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 5
        { talk = 6491 }, -- level 5
        { complete = 6395 }, -- level 5
        { turnin = 6395, -- level 5
          note = "The NPC is indoors." },
        { accept = 5651, classes = { "PRIEST" }, -- level 5
          note = "The NPC is indoors." },
        { turnin = 381, accept = 382 }, -- level 5
        { complete = 382 }, -- level 5
        { level = 5, xp = 2150, patrol = { { 1420, 35.43, 65.86 }, { 1420, 37.04, 64.34 }, { 1420, 37.75, 66.65 }, { 1420, 38.66, 69.43 }, { 1420, 37.03, 70.84 }, { 1420, 35.45, 68.55 } }, -- level 5
          note = "With the coming hand-ins, this gets you to level 6." },
        { turnin = 382, accept = 383 }, -- level 5
        { train = true, talk = 2124, classes = { "MAGE" }, -- level 5
          note = "The NPC is indoors." },
        { train = true, classes = { "WARLOCK" } }, -- level 5
        { talk = 2126, classes = { "WARLOCK" }, -- level 5
          note = "The NPC is indoors." },
        { vendor = true, talk = 5749, classes = { "WARLOCK" }, -- level 5
          note = "The NPC is indoors." },
        { train = true, talk = 2123, classes = { "PRIEST" }, -- level 5
          note = "The NPC is indoors." },
        { train = true, talk = 2119, classes = { "WARRIOR" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 2122, classes = { "ROGUE" }, -- level 6
          note = "The NPC is indoors." },
        { accept = 8, -- level 6
          note = "Wait for the talking to finish" },
        { accept = 365 }, -- level 6
        { accept = 5481, patrol = { { 1420, 40.74, 54.45 }, { 1420, 41.14, 54.87 }, { 1420, 41.39, 54.98 }, { 1420, 42.42, 54.99 }, { 1420, 42.74, 54.99 }, { 1420, 43.34, 54.41 }, { 1420, 43.73, 54.44 }, { 1420, 44.41, 55.28 }, { 1420, 45.1, 56.3 }, { 1420, 45.3, 56.52 }, { 1420, 46.02, 56.64 }, { 1420, 46.53, 56.94 }, { 1420, 47.18, 57.38 }, { 1420, 48.64, 57.8 }, { 1420, 49.11, 57.88 }, { 1420, 50.07, 57.84 }, { 1420, 50.45, 57.69 }, { 1420, 51.24, 56.52 }, { 1420, 51.63, 55.78 }, { 1420, 51.74, 55.4 }, { 1420, 51.98, 55.13 }, { 1420, 53.6, 53.17 }, { 1420, 53.88, 52.96 }, { 1420, 54.15, 52.73 }, { 1420, 54.63, 52.6 }, { 1420, 54.99, 52.38 }, { 1420, 55.33, 52.35 }, { 1420, 55.76, 52.51 }, { 1420, 56.15, 52.54 } }, -- level 6
          note = "The quest giver is an abomination. The NPC patrols the road; look along it. He may step off the road now and then to pick plants." },
        { accept = 404 }, -- level 6
        { accept = 367, -- level 6
          note = "The NPC is indoors." },
        { accept = 99134, races = { "Scourge" } }, -- level 6
        { turnin = 383, accept = 427 }, -- level 6
        { turnin = 8, -- level 6
          note = "The NPC is indoors." },
        { sethearth = "Gallows' End Tavern", talk = 5688, -- level 6
          note = "The NPC is indoors." },
        { turnin = 5651, accept = 5650, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { complete = 5650, classes = { "PRIEST" }, -- level 6
          note = "Heal Deathguard Kel with Lesser Heal (Rank 2). Buff Deathguard Kel with Power Word: Fortitude." },
        { turnin = 5650, when = { ready = 5650 }, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { complete = 367, -- level 6
          note = "The targets are gray, demon-like hounds." },
        { turnin = 367, accept = 368, sticky = 5481, -- level 6
          note = "The NPC is indoors." },
        { complete = 404, -- level 6
          note = "The targets are zombies." },
        { level = 7, patrol = { { 1420, 49.96, 56.45 }, { 1420, 48.04, 57.87 }, { 1420, 48.94, 60.15 }, { 1420, 50.86, 58.94 }, { 1420, 53.44, 57.35 }, { 1420, 55.35, 57.95 }, { 1420, 56.05, 53.74 }, { 1420, 53.63, 52.66 }, { 1420, 52.67, 54.66 }, { 1420, 50.24, 53.93 }, { 1420, 48.26, 53.67 }, { 1420, 46.55, 52.43 }, { 1420, 45.74, 50.46 }, { 1420, 43.87, 51.84 }, { 1420, 44.44, 54.14 }, { 1420, 42.35, 54.24 }, { 1420, 41.37, 52.03 }, { 1420, 39.56, 50.66 }, { 1420, 39.73, 54.14 }, { 1420, 40.46, 57.45 }, { 1420, 41.57, 59.07 }, { 1420, 43.57, 59.76 }, { 1420, 45.47, 59.05 }, { 1420, 43.35, 57.44 }, { 1420, 45.25, 56.24 }, { 1420, 47.04, 61.45 }, { 1420, 51.35, 51.97 }, { 1420, 52.16, 49.85 } }, -- level 6
          note = "Progress westward as you go." },
        { complete = 5481, -- level 7
          note = "Look for wilted violet weeds. Progress westward as you go." },
        { complete = 365 }, -- level 7
        { complete = 427 }, -- level 7
        { accept = 86784, races = { "Scourge" } }, -- level 7
        { complete = 86784, races = { "Scourge" } }, -- level 7
        { level = 7, xp = 2535, patrol = { { 1420, 32.84, 50.37 }, { 1420, 29.76, 49.37 }, { 1420, 30.74, 46.37 }, { 1420, 33.55, 45.26 }, { 1420, 36.75, 47.94 } }, -- level 7
          note = "Together with the next turn-ins, this brings you to level 8." },
        { turnin = 427, accept = 370 }, -- level 7
        { turnin = 365, accept = 407, -- level 7
          note = "The NPC is indoors." },
        { turnin = 404, accept = 426 }, -- level 7
        { turnin = 5481, accept = 5482, patrol = { { 1420, 59.31, 46.68 }, { 1420, 59.06, 47.14 }, { 1420, 58.76, 47.39 }, { 1420, 58.47, 47.66 }, { 1420, 58.21, 47.92 }, { 1420, 57.91, 48.07 }, { 1420, 57.64, 48.47 }, { 1420, 57.62, 48.75 }, { 1420, 57.63, 48.93 }, { 1420, 57.71, 49.4 }, { 1420, 57.79, 49.57 }, { 1420, 58.07, 49.79 }, { 1420, 58.24, 49.95 }, { 1420, 58.25, 50.46 }, { 1420, 58.23, 49.81 }, { 1420, 57.89, 49.59 }, { 1420, 57.57, 49.25 }, { 1420, 57.44, 49.37 }, { 1420, 57.33, 49.18 }, { 1420, 57.4, 49 }, { 1420, 57.55, 48.67 } }, -- level 7
          note = "The NPC patrols a long route; look along it." },
        { train = true, talk = 2131, classes = { "WARRIOR" }, -- level 7
          note = "The NPC is indoors." },
        { turnin = 407, -- level 7
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 2128, classes = { "MAGE" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 2127, classes = { "WARLOCK" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { vendor = true, talk = 5750, classes = { "WARLOCK" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 2129, classes = { "PRIEST" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 2130, classes = { "ROGUE" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { go = { 1411, 51.87, 40.83 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn Mining from the trainer" }, -- level 8
        { talk = 3175, classes = { "WARRIOR", "ROGUE" } }, -- level 8
        { go = { 1411, 52.09, 40.69 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn Blacksmithing from the trainer" }, -- level 8
        { accept = 96822, races = { "Scourge" } }, -- level 8
        { talk = 3174, classes = { "WARRIOR", "ROGUE" } }, -- level 8
        { talk = 3168, buy = { { 2901, 1, 3168 } }, classes = { "WARRIOR", "ROGUE" } }, -- level 8
        { accept = 784, -- level 8
          note = "The NPC is indoors, one floor up." },
        { accept = 96825, races = { "Scourge" } }, -- level 8
        { go = { 1411, 50.14, 42.95 }, text = "Climb the trail" }, -- level 8
        { accept = 791, -- level 8
          note = "The NPC waits on the tower's highest floor." },
        { complete = 96825, races = { "Scourge" } }, -- level 8
        { accept = 2161 }, -- level 8
        { accept = 786, -- level 8
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { accept = 96821, races = { "Scourge" } }, -- level 8
        { accept = 817, -- level 8
          note = "The NPC is indoors." },
        { accept = 818 }, -- level 8
        { accept = { 808, 826, 823 }, sticky = 818 }, -- level 8
        { complete = 818, -- level 8
          note = "The targets are lobsters. Walk the shoreline toward the southwest. If the beach ends first, move on without it." },
        { complete = 818, -- level 8
          note = "Hunt the crabs." },
        { go = { 1411, 50.79, 79.17 }, text = "Stay on the trail" }, -- level 8
        { complete = 786, -- level 8
          note = "The NPC is indoors." },
        { accept = 97223, races = { "Scourge" } }, -- level 8
        { complete = 786 }, -- level 8
        { complete = 786, -- level 8
          note = "Keep to the trail as it curves." },
        { go = { 1411, 46.46, 79.15 }, deathskip = true, text = "Die on purpose at this spot", -- level 8
          note = "Step into the flames. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 57.45, 73.32 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 8
        { talk = 6491 }, -- level 8
        { turnin = 818, when = { ready = 818 } }, -- level 8
        { turnin = 786, sticky = { 791, 784 }, -- level 8
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { go = { 1411, 58.96, 58.33 }, text = "Head indoors" }, -- level 8
        { complete = 784, collect = { { 4882, 1 } }, -- level 8
          note = "The NPC is indoors, one floor up. Consider bringing a group for this one." },
        { complete = 96822, races = { "Scourge" } }, -- level 8
        { go = { 1411, 59.86, 57.81 }, text = "Stay on the trail and keep climbing the steps" }, -- level 8
        { collect = { { 4881, 1 } }, -- level 8
          note = "The NPC stands on the highest level of this structure." },
        { accept = 830, useitem = 4881 }, -- level 8
        { complete = 791 }, -- level 8
        { complete = 784 }, -- level 8
        { turnin = 823 }, -- level 8
        { turnin = { 784, 830 }, accept = { 825, 831, 837 }, -- level 9
          note = "The NPC is indoors, one floor up." },
        { accept = 815, -- level 9
          note = "This one roams, so scan the surrounding area." },
        { go = { 1411, 50.14, 42.95 }, text = "Climb the trail" }, -- level 9
        { turnin = 791, -- level 9
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 2161, -- level 9
          note = "The NPC is indoors." },
        { turnin = 96822, races = { "Scourge" } }, -- level 9
        { go = { 1411, 54.11, 41.87 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn First Aid from the trainer" }, -- level 9
        { talk = 5943, classes = { "WARRIOR", "ROGUE" }, -- level 9
          note = "The NPC is indoors." },
        { complete = 825, sticky = { 815, 817, 826 }, -- level 9
          note = "Loot the gray chests built from metal. Search in and around the sunken wrecks. Your targets sit below the water's surface." },
        { complete = 826, -- level 9
          note = "The target is a troll in crimson robes. This one roams, so scan the surrounding area." },
        { complete = 808, -- level 9
          note = "Look for the skull-shaped objects." },
        { complete = 826 }, -- level 9
        { complete = 826 }, -- level 9
        { complete = 815, -- level 9
          note = "The targets are clumps of purple eggs. Search close to the trunks." },
        { complete = 97223, races = { "Scourge" } }, -- level 9
        { complete = 817 }, -- level 9
        { level = 9, xp = 3550, patrol = { { 1411, 61.25, 89.55 }, { 1411, 64.76, 85.03 }, { 1411, 64.54, 81.14 }, { 1411, 68.45, 80.36 }, { 1411, 68.97, 85.23 }, { 1411, 60.14, 82.46 }, { 1411, 67.44, 74.54 }, { 1411, 70.16, 73.24 }, { 1411, 69.64, 69.85 }, { 1411, 67.04, 71.43 }, { 1411, 62.84, 96.43 } }, classes = { "MAGE" }, -- level 9
          note = "With the coming turn-ins, this gets you to level 10." },
        { go = { 1411, 61.25, 89.55 }, deathskip = true, text = "Die on purpose at this spot", -- level 9
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 57.54, 73.3 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 9
        { talk = 6491, sticky = 818 }, -- level 9
        { turnin = { 808, 826 } }, -- level 9
        { turnin = 97223, races = { "Scourge" } }, -- level 9
        { turnin = 817, -- level 9
          note = "The NPC is indoors." },
        { accept = 96604, races = { "Scourge" } }, -- level 10
        { complete = 96604, races = { "Scourge" } }, -- level 10
        { turnin = 96604, races = { "Scourge" } }, -- level 10
        { complete = 96821, races = { "Scourge" } }, -- level 10
        { train = true, talk = 5880, classes = { "MAGE" }, -- level 10
          note = "The NPC is indoors." },
        { turnin = 825, -- level 10
          note = "The NPC is indoors, one floor up." },
        { accept = 96655, races = { "Scourge" } }, -- level 10
        { turnin = 815, -- level 10
          note = "This one roams, so scan the surrounding area." },
        { turnin = 96825, races = { "Scourge" } }, -- level 10
        { complete = 96655, races = { "Scourge" } }, -- level 10
        { turnin = 96655, races = { "Scourge" } }, -- level 10
        { train = true, talk = 3706, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 5660, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 3170, classes = { "ROGUE" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 3172, classes = { "WARLOCK" }, -- level 10
          note = "The NPC is out back, at the rear of the structure." },
        { vendor = true, talk = 6027, classes = { "WARLOCK" }, -- level 10
          note = "The NPC is out back, at the rear of the structure." },
        { train = true, talk = 3169, classes = { "WARRIOR" }, -- level 10
          note = "The NPC is indoors." },
        { complete = 837 }, -- level 10
        { complete = 837 }, -- level 10
        { turnin = 837, -- level 10
          note = "The NPC is indoors, one floor up." },
        { turnin = 96821, races = { "Scourge" } }, -- level 10
        { sethearth = "Razor Hill", talk = 6928, -- level 10
          note = "The NPC is indoors." },
        { accept = 97282, races = { "Scourge" } }, -- level 10
        { complete = 97282, races = { "Scourge" } }, -- level 10
        { accept = 834 }, -- level 10
        { complete = 834, -- level 10
          note = "Look for beige sacks." },
        { turnin = 834, accept = 835 }, -- level 10
        { go = { 1411, 51.9, 27.41 }, text = "Stay on the trail, then cross the tunnel" }, -- level 10
        { complete = 835 }, -- level 10
        { go = { 1411, 53.23, 24.54 }, deathskip = true, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. This is the quickest way over." },
        { deathskip = true, revive = { 1411, 46.99, 17.63 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491 }, -- level 11
        { go = { 1411, 53.47, 27.83 }, text = "Traverse the passageway" }, -- level 11
        { turnin = 835 }, -- level 11
        { turnin = 97282, races = { "Scourge" } }, -- level 11
        { go = { 1454, 45.1, 63.84 }, fly = true, talk = 3310, text = "Fly to Orgrimmar", -- level 11
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 831, -- level 11
          note = "The NPC is indoors." },
        { go = { 1454, 81.59, 19.59 }, classes = { "WARRIOR" }, text = "Learn Staves at the weapon master" }, -- level 11
        { talk = 2704, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 1818, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { accept = { 354, 362 }, -- level 11
          note = "The NPC is indoors." },
        { accept = 1881, classes = { "MAGE" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { accept = 375, -- level 11
          note = "The NPC is indoors, one floor up." },
        { accept = 1478, classes = { "WARLOCK" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { accept = 1885, classes = { "ROGUE" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { accept = 374 }, -- level 11
        { accept = 358, -- level 11
          note = "The NPC is indoors." },
        { accept = 398, -- level 11
          note = "The quest comes from a bounty sign." },
        { turnin = 1818, accept = 1819, classes = { "WARRIOR" } }, -- level 11
        { complete = 1819, classes = { "WARRIOR" }, -- level 11
          note = "Look for an iron slab marked with a skull. Wait for the talking to finish" },
        { turnin = 1819, when = { ready = 1819 }, classes = { "WARRIOR" } }, -- level 11
        { accept = 1820, when = { done = 1819 }, classes = { "WARRIOR" } }, -- level 11
        { accept = 95314, races = { "Scourge" } }, -- level 11
        { turnin = 1820, when = { log = 1820 }, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 97558, races = { "Scourge" } }, -- level 11
        { turnin = 1478, accept = 1473, classes = { "WARLOCK" } }, -- level 11
        { turnin = 1885, accept = 1886, classes = { "ROGUE" } }, -- level 11
        { go = { 1458, 57.26, 32.71 }, classes = { "ROGUE" }, text = "Learn Swords at the weapon master" }, -- level 11
        { talk = 11870, classes = { "ROGUE" } }, -- level 11
        { turnin = 5660, classes = { "PRIEST" } }, -- level 11
        { turnin = 1881, accept = 1882, sticky = { 374, 370 }, classes = { "MAGE" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { complete = 370, -- level 11
          note = "The NPC is indoors." },
        { complete = 1473, classes = { "WARLOCK" }, -- level 11
          note = "The NPC is indoors." },
        { complete = 374 }, -- level 11
        { complete = 370 }, -- level 11
        { turnin = 1473, when = { ready = 1473 }, classes = { "WARLOCK" } }, -- level 11
        { accept = 1471, when = { done = 1473 }, classes = { "WARLOCK" } }, -- level 11
        { complete = 1471, useitem = 6284, when = { log = 1471 }, classes = { "WARLOCK" }, -- level 11
          note = "Use the item at the pink marking." },
        { turnin = 1471, when = { ready = 1471 }, classes = { "WARLOCK" } }, -- level 11
        { complete = 375, sticky = 426, -- level 11
          note = "Move gradually northwest toward Agamand Mills." },
        { complete = 362, -- level 11
          note = "The target is a skeletal caster in armor. This one roams, so scan the surrounding area." },
        { complete = 354, -- level 11
          note = "The target is a banshee. This one roams, so scan the surrounding area. Check each of the two floors indoors." },
        { complete = 354, -- level 11
          note = "Your target is a ghoul. This one roams, so scan the surrounding area." },
        { complete = 354, -- level 11
          note = "The target is a shambling zombie. This one roams, so scan the surrounding area." },
        { complete = 426, -- level 11
          note = "The targets are skeletons in armor." },
        { complete = 426, -- level 11
          note = "The targets are skeletal mages." },
        { accept = 361, useitem = 2839, sticky = 358, when = { item = 2839 } }, -- level 11
        { go = { 1420, 54.24, 31.72 }, text = "Drop down with care" }, -- level 11
        { complete = 398, -- level 11
          note = "The NPC is indoors." },
        { complete = 368, sticky = 358, -- level 11
          note = "Fight the murlocs." },
        { complete = 97558, races = { "Scourge" } }, -- level 12
        { complete = 358, sticky = 5482 }, -- level 12
        { complete = 358 }, -- level 12
        { complete = 5482, -- level 12
          note = "Look for wilted violet weeds." },
        { accept = 99142, races = { "Scourge" } }, -- level 12
        { complete = 358, -- level 12
          note = "Your targets here are gnolls." },
        { turnin = 5482, patrol = { { 1420, 59.31, 46.68 }, { 1420, 59.06, 47.14 }, { 1420, 58.76, 47.39 }, { 1420, 58.47, 47.66 }, { 1420, 58.21, 47.92 }, { 1420, 57.91, 48.07 }, { 1420, 57.64, 48.47 }, { 1420, 57.62, 48.75 }, { 1420, 57.63, 48.93 }, { 1420, 57.71, 49.4 }, { 1420, 57.79, 49.57 }, { 1420, 58.07, 49.79 }, { 1420, 58.24, 49.95 }, { 1420, 58.25, 50.46 }, { 1420, 58.23, 49.81 }, { 1420, 57.89, 49.59 }, { 1420, 57.57, 49.25 }, { 1420, 57.44, 49.37 }, { 1420, 57.33, 49.18 }, { 1420, 57.4, 49 }, { 1420, 57.55, 48.67 } }, -- level 12
          note = "The NPC patrols a long route; look along it." },
        { turnin = 426 }, -- level 12
        { turnin = 368, accept = 369, -- level 12
          note = "The NPC is indoors." },
        { turnin = { 370, 398 }, accept = 371 }, -- level 12
        { turnin = 358, accept = 359, -- level 12
          note = "The NPC is indoors." },
        { turnin = 374 }, -- level 12
        { talk = 2118, buy = { { 2320, 1, 2118 } } }, -- level 12
        { turnin = 361, when = { log = 361 }, -- level 12
          note = "The NPC is indoors." },
        { turnin = { 354, 362 }, accept = 355, -- level 12
          note = "The NPC is indoors." },
        { turnin = 375, when = { item = 2320 }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { accept = 96895, races = { "Scourge" } }, -- level 12
        { accept = 99156, races = { "Scourge" } }, -- level 12
        { train = true, talk = 2131, classes = { "WARRIOR" }, -- level 12
          note = "The NPC is indoors." },
        { train = true, talk = 2128, classes = { "MAGE" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 2127, classes = { "WARLOCK" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { vendor = true, talk = 5750, classes = { "WARLOCK" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 2129, classes = { "PRIEST" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 2130, classes = { "ROGUE" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { turnin = 359, accept = { 360, 356 }, sticky = 356 }, -- level 12
        { complete = 99142, races = { "Scourge" } }, -- level 13
        { turnin = 96895, races = { "Scourge" } }, -- level 13
        { accept = 96897, races = { "Scourge" } }, -- level 13
        { accept = 96898, races = { "Scourge" } }, -- level 13
        { complete = 96898, races = { "Scourge" } }, -- level 13
        { turnin = 96898, races = { "Scourge" } }, -- level 13
        { complete = 1882, classes = { "MAGE" } }, -- level 13
        { complete = 356, sticky = 371 }, -- level 13
        { complete = 371, -- level 13
          note = "The NPC is indoors." },
        { complete = 99156, races = { "Scourge" } }, -- level 13
        { complete = 371 }, -- level 13
        { complete = 369 }, -- level 13
        { complete = 96897, races = { "Scourge" } }, -- level 13
        { turnin = 96897, races = { "Scourge" } }, -- level 13
        { level = 12, xp = 7030, patrol = { { 1420, 83.35, 51.36 }, { 1420, 82.03, 54.25 }, { 1420, 85.03, 54.56 }, { 1420, 85.46, 58.05 }, { 1420, 87.23, 51.55 }, { 1420, 90.23, 49.36 }, { 1420, 85.26, 48.45 }, { 1420, 84.15, 45.36 } }, -- level 13
          note = "Together with the next turn-ins, this brings you to level 13." },
        { turnin = 356 }, -- level 13
        { turnin = 97558, races = { "Scourge" } }, -- level 13
        { turnin = 99156, races = { "Scourge" } }, -- level 13
        { turnin = { 355, 360 }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 371 }, -- level 13
        { turnin = 99134, races = { "Scourge" } }, -- level 13
        { turnin = 369, accept = { 492, 445 }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 492, -- level 13
          note = "The NPC waits on the lower level, indoors." },
        { turnin = 96656, races = { "Scourge" } }, -- level 13
        { turnin = 86784, races = { "Scourge" } }, -- level 13
        { turnin = 99142, races = { "Scourge" } }, -- level 13
        { turnin = 1882, when = { ready = 1882 }, classes = { "MAGE" }, -- level 13
          note = "The NPC is indoors, one floor up." },
        { complete = 1886, talk = 6497, patrol = { { 1420, 61.52, 53.08 }, { 1420, 61.63, 53.32 }, { 1420, 61.59, 53.51 }, { 1420, 61.54, 53.89 }, { 1420, 61.77, 54.57 }, { 1420, 62, 55.21 }, { 1420, 62.19, 55.49 }, { 1420, 62.46, 55.62 }, { 1420, 62.65, 55.56 }, { 1420, 62.97, 55.59 }, { 1420, 63.14, 55.76 }, { 1420, 63.34, 56.37 }, { 1420, 63.57, 57.1 }, { 1420, 63.67, 57.71 }, { 1420, 63.78, 58.43 }, { 1420, 63.66, 58.83 }, { 1420, 63.45, 59.56 }, { 1420, 63.4, 59.95 }, { 1420, 63.14, 60.33 }, { 1420, 62.34, 60.95 }, { 1420, 61.68, 61.73 }, { 1420, 61.23, 62.11 }, { 1420, 60.72, 62.66 }, { 1420, 59.86, 63.18 }, { 1420, 59.26, 63.83 }, { 1420, 58.81, 64.14 }, { 1420, 58.43, 64.25 }, { 1420, 57.41, 64.6 }, { 1420, 56.92, 65.07 }, { 1420, 56.43, 65.46 }, { 1420, 56.09, 66.08 }, { 1420, 55.87, 66.51 }, { 1420, 55.59, 68.19 }, { 1420, 55.4, 69.31 }, { 1420, 55.24, 69.87 }, { 1420, 55.08, 70.73 }, { 1420, 54.88, 72.49 }, { 1420, 54.61, 73.96 }, { 1420, 54.31, 75.09 }, { 1421, 67.78, 4.88 }, { 1421, 67.32, 5.86 }, { 1421, 66.47, 7.02 }, { 1421, 65.74, 8 }, { 1421, 64.57, 8.86 }, { 1421, 63.36, 9.69 }, { 1421, 63.03, 10.03 }, { 1421, 61.77, 10.71 }, { 1421, 60.85, 11.24 }, { 1421, 59.05, 11.72 }, { 1421, 58.08, 12.17 }, { 1421, 57.25, 12.8 }, { 1421, 56.7, 13.49 }, { 1421, 55.46, 15.28 }, { 1421, 54.88, 16.53 }, { 1421, 53.88, 18.73 }, { 1421, 53.11, 20.58 }, { 1421, 51.98, 22.21 }, { 1421, 51.28, 23.76 }, { 1421, 50.69, 25.36 }, { 1421, 50.28, 26.24 }, { 1421, 50.04, 26.9 }, { 1421, 49.8, 28.72 }, { 1421, 49.8, 30.19 }, { 1421, 49.62, 32.34 }, { 1421, 49.79, 32.99 }, { 1421, 49.93, 33.89 }, { 1421, 50.28, 34.46 }, { 1421, 50.73, 35.02 }, { 1421, 51.03, 35.74 }, { 1421, 51.07, 36.39 }, { 1421, 50.99, 36.64 }, { 1421, 50.61, 37.14 }, { 1421, 49.79, 37.79 }, { 1421, 49.04, 38.33 }, { 1421, 48.32, 38.83 }, { 1421, 47.98, 39.17 }, { 1421, 47.46, 39.75 } }, classes = { "ROGUE" }, -- level 13
          note = "Fight undead foes. The target patrols the road from Brill to The Sepulcher. The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest." },
    },
})
