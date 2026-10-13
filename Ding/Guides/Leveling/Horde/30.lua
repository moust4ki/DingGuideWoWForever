-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/30.lua.
-- Simulated (warrior): Orc 48 (92%) -> 50 (21%) in 8 h 41, 15 quests turned in; Scourge 48 (92%) -> 50 (21%) in 8 h 41, 15 quests turned in; Tauren 48 (92%) -> 50 (21%) in 8 h 41, 15 quests turned in; Troll 48 (92%) -> 50 (21%) in 8 h 41, 15 quests turned in; Skyborne 48 (92%) -> 50 (21%) in 8 h 41, 16 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h30-feralas-and-ungoro-crater",
    title    = "Feralas and Un'Goro (49-50)",
    faction  = "Horde",
    minLevel = 49, maxLevel = 50,
    next     = "leveling-h31-stranglethorn-vale-and-swamp-of-sorrows",
    leftOut  = {
        [4148] = { kind = "prereq" },
    },
    steps    = {
        { go = { 1444, 76.18, 43.83 }, text = "Travel to Camp Mojache", -- level 48
          note = "Feralas: Camp Mojache first, then Un'Goro Crater." },
        { accept = 3063, -- level 48
          note = "The NPC is indoors." },
        { accept = 3062, elite = true }, -- level 48
        { accept = 7734, -- level 48
          note = "The NPC is indoors." },
        { turnin = 3123, accept = { 3124, 3128 } }, -- level 48
        { complete = { 3124, 3128 }, useitem = 9619, -- level 48
          note = "The targets are hippogryphs. Slay them, then apply the item to their remains." },
        { turnin = 3124, accept = 3125 }, -- level 49
        { complete = { 3125, 3128 }, useitem = 9620, -- level 49
          note = "Slay them, then apply the item to their remains." },
        { turnin = 3125, accept = 3126 }, -- level 49
        { complete = { 3126, 3128 }, useitem = 9606, patrol = { { 1444, 68.43, 46.43 }, { 1444, 69.16, 45.35 }, { 1444, 69.46, 43.06 }, { 1444, 70.65, 41.74 }, { 1444, 71.75, 41.97 }, { 1444, 72.36, 41.26 }, { 1444, 72.94, 40.16 }, { 1444, 73.75, 38.76 }, { 1444, 74.74, 38.46 }, { 1444, 75.94, 39.75 }, { 1444, 77.45, 40.64 }, { 1444, 78.26, 41.34 }, { 1444, 78.36, 42.65 }, { 1444, 78.75, 44.23 }, { 1444, 81.06, 45.06 }, { 1444, 81.86, 45.14 }, { 1444, 82.65, 45.63 }, { 1444, 83.25, 46.22 } }, -- level 49
          note = "Fight the treants. The target patrols a long route; look along it. Slay them, then apply the item to their remains." },
        { turnin = { 3126, 3128 } }, -- level 49
        { accept = 3127, elite = true }, -- level 49
        { accept = 7721, sticky = 7721 }, -- level 49
        { accept = 7003, elite = true }, -- level 49
        { complete = 7003, elite = true, useitem = 18904, -- level 49
          note = "Aim the item at the Strider foes. The targets are towering green giants. The item strips their elite status." },
        { complete = 7721, -- level 49
          note = "Hunt down the elementals formed of water." },
        { turnin = 7003, elite = true }, -- level 49
        { turnin = 7721 }, -- level 49
        { destroy = 18904 }, -- level 49
        { complete = 7734, -- level 49
          note = "The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { go = { 1444, 53.38, 31.88 }, elite = true, text = "Head out of the cave" }, -- level 49
        { complete = 3127, elite = true, useitem = { 18904, 9621 }, -- level 49
          note = "Use it on the stone giant foes. The item strips their elite status. You have 2 hours before it disappears." },
        { abandon = 7725, sticky = 3063 }, -- level 49
        { collect = { { 9530, 1 } }, spots = { { 1444, 39.95, 15.23 }, { 1444, 37.36, 12.34 }, { 1444, 37.43, 15.36 }, { 1444, 38.23, 10.24 }, { 1444, 39.97, 12.45 }, { 1444, 41.24, 10.36 }, { 1444, 41.74, 13.57 } }, -- level 49
          note = "Kill harpies." },
        { complete = 3062, elite = true, useitem = 9530, -- level 49
          note = "Watch out: this foe is a level 50 elite. You can likely do it alone. Consider bringing a group for this one." },
        { complete = 3063 }, -- level 49
        { accept = 7064, dungeon = "Maraudon" }, -- level 49
        { accept = 7029, dungeon = "Maraudon", -- level 49
          note = "The NPC stands on the highest level of this structure." },
        { accept = 7028, dungeon = "Maraudon", -- level 49
          note = "The NPC is indoors." },
        { accept = 7067, dungeon = "Maraudon", -- level 49
          note = "This one roams, so scan the surrounding area." },
        { dungeon = "Maraudon", collect = { { 17757, 1 } }, -- level 49
          note = "In the Maraudon Tunnels, the target is a centaur in violet armor. The targets are spread over several spots." },
        { dungeon = "Maraudon", collect = { { 17762, 1 } }, useitem = 17757, -- level 49
          note = "Head into the purple wing of the Maraudon Tunnels. Use it on the Spirit of Gelk." },
        { dungeon = "Maraudon", collect = { { 17761, 1 } }, useitem = 17757, -- level 49
          note = "In the Maraudon Tunnels, find the chamber joining the purple and orange areas. Target the Spirit of Kolk with the item." },
        { complete = 7029, dungeon = "Maraudon", useitem = 17693, -- level 49
          note = "Found in the Maraudon Tunnels, along the orange wing. The target is beside the big pool holding orange crystals." },
        { dungeon = "Maraudon", collect = { { 17763, 1 } }, useitem = 17757, -- level 49
          note = "Found in the Maraudon Tunnels, along the orange wing. Target the Spirit of Magra with it." },
        { dungeon = "Maraudon", collect = { { 17765, 1 } }, useitem = 17757, -- level 49
          note = "Target Spirit of Veng with it. This one roams, so scan the surrounding area. In the orange area." },
        { dungeon = "Maraudon", collect = { { 17764, 1 } }, useitem = 17757, -- level 49
          note = "This happens in Maraudon's violet wing. Aim the item at the Spirit of Maraudos. The target is a spectral centaur holding a spear." },
        { complete = 7067, dungeon = "Maraudon", useitem = 17765 }, -- level 49
        { complete = 7064, dungeon = "Maraudon", -- level 49
          note = "This happens in Maraudon's violet wing. The target is the dungeon's last boss." },
        { turnin = 7067, dungeon = "Maraudon", when = { item = 17758 }, -- level 49
          note = "This one roams, so scan the surrounding area." },
        { turnin = 7028, dungeon = "Maraudon", when = { ready = 7028 }, -- level 49
          note = "The NPC is indoors." },
        { turnin = 7064, dungeon = "Maraudon" }, -- level 49
        { turnin = 7029, dungeon = "Maraudon", -- level 49
          note = "The NPC stands on the highest level of this structure." },
        { talk = 7799, collect = { { 10556, 1 }, { 11186, 7 }, { 11188, 7 }, { 11185, 7 }, { 11184, 7 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 49
          note = "The NPC is indoors." },
        { turnin = 3444 }, -- level 49
        { accept = 4289, sticky = 4300 }, -- level 49
        { accept = 4290, elite = true }, -- level 49
        { accept = 3844 }, -- level 49
        { turnin = 3844, accept = 3845, -- level 49
          note = "Your targets sit below the water's surface." },
        { complete = 4290, elite = true, -- level 49
          note = "Stay clear of the elite tyrannosaur." },
        { turnin = 4290, elite = true }, -- level 49
        { accept = 4291, elite = true }, -- level 49
        { complete = 4291, elite = true }, -- level 49
        { complete = 4300, -- level 49
          note = "The targets are raptors." },
        { accept = 3884, collect = { { 11116, 1 } }, useitem = 11116, -- level 49
          note = "Every creature in Un'Goro Crater can drop it." },
        { level = 50, patrol = { { 1449, 64.96, 70.36 }, { 1449, 62.37, 72.05 }, { 1449, 59.35, 72.56 }, { 1449, 60.24, 75.57 }, { 1449, 63.14, 75.17 }, { 1449, 64.75, 78.14 }, { 1449, 61.74, 78.94 }, { 1449, 59.44, 80.95 }, { 1449, 62.04, 82.54 }, { 1449, 57.25, 77.35 }, { 1449, 60.34, 69.34 }, { 1449, 60.37, 66.35 }, { 1449, 63.74, 66.15 }, { 1449, 63.37, 62.84 }, { 1449, 62.23, 59.35 }, { 1449, 61.03, 56.54 }, { 1449, 63.66, 54.45 }, { 1449, 60.83, 52.35 }, { 1449, 60.66, 49.37 }, { 1449, 63.24, 47.77 }, { 1449, 65.25, 50.54 }, { 1449, 68.43, 49.76 }, { 1449, 69.95, 52.36 }, { 1449, 71.54, 54.97 }, { 1449, 68.84, 56.57 }, { 1449, 67.14, 53.95 }, { 1449, 65.44, 59.03 }, { 1449, 68.05, 61.63 }, { 1449, 70.43, 63.25 }, { 1449, 73.45, 62.86 }, { 1449, 70.65, 59.34 }, { 1449, 74.06, 57.25 }, { 1449, 75.43, 51.45 }, { 1449, 72.45, 49.75 }, { 1449, 70.25, 46.85 }, { 1449, 69.03, 43.56 }, { 1449, 71.96, 42.54 }, { 1449, 66.17, 41.95 }, { 1449, 63.44, 44.17 }, { 1449, 66.66, 46.14 }, { 1449, 67.37, 64.64 }, { 1449, 67.63, 68.34 }, { 1449, 67.03, 73.45 }, { 1449, 68.26, 77.96 } }, why = { kind = "level", levels = { 43, 53 } } }, -- level 49
        { turnin = 4291, elite = true }, -- level 49
        { accept = 4292, elite = true }, -- level 49
        { collect = { { 11186, 7 }, { 11188, 7 }, { 11185, 7 }, { 11184, 7 } }, -- level 50
          note = "Gather from clumps of multicolored crystals. Spawn points are shared, so pick up every one you find. Gathering it causes other hues to show up." },
        { complete = 3845, useitem = 11107 }, -- level 50
        { destroy = { 11108, 3108 } }, -- level 50
        { turnin = 3845, accept = 3908, why = { kind = "carry", quest = 3908, seconds = 74760, xp = 5100 } }, -- level 50
        { turnin = 3884 }, -- level 50
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 50
        { accept = 4284, -- level 50
          note = "Your targets are within the cavern." },
        { turnin = 4284, when = { ready = 4284 }, -- level 50
          note = "Your targets are within the cavern." },
        { destroy = { 11186, 11188, 11185, 11184 } }, -- level 50
        { go = { 1449, 43.53, 6.78 }, text = "Head out of the cave" }, -- level 50
        { go = { 1449, 45.2, 5.8 }, fly = true, talk = 10583, text = "Flight master at Marshal's Refuge" }, -- level 50
        { collect = { { 11018, 25 } }, keep = 11018 }, -- level 50
        { turnin = 3062, elite = true }, -- level 50
        { turnin = 3063, accept = 4120, -- level 50
          note = "The NPC is indoors." },
        { turnin = 7734, -- level 50
          note = "The NPC is indoors." },
        { turnin = 7738, when = { log = 7738 } }, -- level 50
        { turnin = 3127, elite = true }, -- level 50
        { accept = 3129, elite = true }, -- level 50
        { turnin = 3129, elite = true }, -- level 50
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 50
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 50
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 50
          note = "The NPC is indoors." },
        { talk = 3309, collect = { { 8685, 1 }, { 9245, 1 }, { 5807, 1 }, { 3900, 12 } }, spots = { { 1454, 49.62, 69.06 } }, -- level 50
          note = "The NPC is indoors." },
        { talk = 3309, bank = { 11018, 11568, 11133 }, -- level 50
          note = "The NPC is indoors. You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 50
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 50
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 50
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 50
          note = "This NPC is found down in the Cleft of Shadow." },
        { turnin = 81, -- level 50
          note = "The NPC is indoors." },
        { turnin = 97242, races = { "Skyborne" } }, -- level 50
        { turnin = 4300, -- level 50
          note = "The NPC is upstairs, out on the balcony." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 50
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 50
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 50
          note = "The NPC stands on the highest level of this structure." },
        { sethearth = "Orgrimmar", talk = 6929, -- level 50
          note = "The NPC is indoors." },
        { accept = 4502, elite = true }, -- level 50
    },
})
