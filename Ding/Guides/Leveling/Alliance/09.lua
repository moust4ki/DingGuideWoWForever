-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/09.lua.
-- Simulated (warrior): Human 22 (49%) -> 24 (71%) in 4 h 12, 35 quests turned in; Dwarf 22 (48%) -> 24 (71%) in 4 h 12, 36 quests turned in; NightElf 22 (52%) -> 24 (67%) in 3 h 59, 35 quests turned in; Gnome 22 (48%) -> 24 (71%) in 4 h 12, 36 quests turned in; Skyborne 22 (49%) -> 24 (71%) in 4 h 12, 36 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a09-ashenvale-and-stonetalon-mountains",
    title    = "Ashenvale and Stonetalon (21-24)",
    faction  = "Alliance",
    minLevel = 21, maxLevel = 24,
    next     = "leveling-a10-wetlands",
    leftOut  = {
        [1012] = { kind = "far" },
        [1017] = { kind = "far" },
        [1081] = { kind = "prereq" },
        [1082] = { kind = "prereq" },
        [1083] = { kind = "prereq" },
        [1084] = { kind = "prereq" },
        [1091] = { kind = "prereq" },
        [1092] = { kind = "prereq" },
        [1094] = { kind = "log" },
        [1096] = { kind = "prereq" },
        [1167] = { kind = "far", turnin = true },
        [2931] = { kind = "away" },
        [79974] = { kind = "log" },
        [95737] = { kind = "log" },
    },
    steps    = {
        { turnin = 967, accept = 970, -- level 22
          note = "Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone." },
        { accept = 1010 }, -- level 22
        { complete = 970, -- level 22
          note = "The item drops rarely." },
        { complete = 1010, -- level 22
          note = "Look for little gray sheaves of straw. Lower the Ground Clutter option to 1. Find it in the game options, under System, then Graphics." },
        { turnin = 1010, accept = 1020 }, -- level 22
        { turnin = 970, accept = 973 }, -- level 22
        { turnin = 945 }, -- level 22
        { go = { 1440, 34.35, 47.96 }, fly = true, talk = 4267, text = "Fly to Astranaar", -- level 22
          note = "Keep to the road the whole way." },
        { accept = 1008 }, -- level 22
        { accept = 1070, why = { kind = "carry", quest = 1070, seconds = 6420, xp = 800 } }, -- level 22
        { accept = 1056, why = { kind = "carry", quest = 1056, seconds = 10020, xp = 500 } }, -- level 22
        { accept = 1054, races = { "Dwarf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "MAGE", "WARLOCK", "DRUID" } }, -- level 22
        { accept = 1054, races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 22
        { accept = 991, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 22
        { accept = 1054, races = { "Human" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "MAGE", "DRUID" } }, -- level 22
        { accept = 991, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 22
        { accept = 1054, races = { "Skyborne" }, -- level 22
          note = "The NPC is indoors." },
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 22
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 22
          note = "You will tame a short-term pet shortly. Pick up Claw (Rank 3) for your pet." },
        { turnin = 1020, -- level 22
          note = "The NPC is indoors." },
        { accept = 1033, -- level 22
          note = "Let the conversation play out. The NPC is indoors." },
        { go = { 1440, 36.37, 59.75 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 22
          note = "Tame an Ashenvale Bear with Tame Beast. Track down a chestnut-furred bear." },
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 22
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 22
          note = "Release the short-term pet you tamed." },
        { go = { 1413, 49.03, 5.42 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Keep to the road until you reach the Barrens" }, -- level 22
        { turnin = 1716, accept = 1738, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 22
          note = "Keep your distance from the Crossroads." },
        { go = { 1413, 63.03, 37.19 }, fly = true, talk = 16227, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Flight master in Ratchet" }, -- level 22
        { complete = 1033, -- level 22
          note = "Look for white spheres." },
        { complete = 1054, races = { "Dwarf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "MAGE", "WARLOCK", "DRUID" } }, -- level 22
        { complete = 1054, races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 22
        { complete = 1054, races = { "Human" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "MAGE", "DRUID" } }, -- level 22
        { complete = 1054, races = { "Skyborne" }, -- level 22
          note = "The target is a gray furbolg. This one roams, so scan the surrounding area." },
        { turnin = 1054, races = { "Dwarf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "MAGE", "WARLOCK", "DRUID" } }, -- level 22
        { turnin = 1054, races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 22
        { turnin = 1054, races = { "Human" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "MAGE", "DRUID" } }, -- level 22
        { turnin = 1054, races = { "Skyborne" }, -- level 22
          note = "The NPC is indoors." },
        { sethearth = "Astranaar", talk = 6738, -- level 22
          note = "The NPC is indoors." },
        { turnin = 1033, -- level 22
          note = "The NPC is indoors." },
        { accept = 1034, -- level 22
          note = "Let the conversation play out. The NPC is indoors." },
        { complete = 1034, -- level 22
          note = "Shrubs that glitter white." },
        { go = { 1440, 36.06, 61.76 }, text = "Exit Ruins of Stardust" }, -- level 22
        { go = { 1440, 28.34, 60.85 }, text = "Go into Fire Scar Shrine and climb the trail" }, -- level 22
        { complete = 973, -- level 22
          note = "The target summons protectors with Ilkrud's Guardians. Cut off the target's spells when you can." },
        { go = { 1440, 28.34, 60.85 }, text = "Exit Fire Scar Shrine" }, -- level 22
        { turnin = 973, -- level 22
          note = "Keep to the road the whole way." },
        { complete = 1738, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" } }, -- level 22
        { turnin = 991, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 23
        { turnin = 991, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 22
        { accept = 991, races = { "NightElf" }, classes = { "ROGUE", "DRUID" } }, -- level 22
        { turnin = 991, races = { "NightElf" }, classes = { "ROGUE", "DRUID" } }, -- level 22
        { accept = 1023 }, -- level 23
        { complete = 1023, -- level 23
          note = "Fight the murlocs." },
        { accept = 1007, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 23
          note = "Circle the mountain on foot." },
        { accept = 1007, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { complete = 1007, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 23
        { complete = 1007, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { turnin = 1007, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 23
        { turnin = 1007, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { accept = 1009, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 23
          note = "Wait for the talking to finish" },
        { accept = 1009, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { complete = 1009, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 23
          note = "A yellowish naga; her fins look pinkish. The target is rare and seldom up. If it is not around, move on without it." },
        { complete = 1009, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { complete = 1009, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 23
          note = "A yellowish naga; her fins look pinkish. The target is rare and seldom up. If it is not around, move on without it." },
        { complete = 1009, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { complete = 1009, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 23
          note = "The target is a naga with jade skin and rose-colored fins. It circles the island clockwise, close to the shore. She travels with a pair of guards." },
        { complete = 1009, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { turnin = 1009, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 23
        { turnin = 1009, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 23
        { complete = 1008, -- level 23
          note = "Hunt naga." },
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 23
        { turnin = 1023, -- level 23
          note = "The NPC is indoors." },
        { destroy = 5505 }, -- level 23
        { turnin = 1034, -- level 23
          note = "The NPC is indoors." },
        { turnin = 1008, accept = 1134 }, -- level 23
        { turnin = { 4730, 4731, 4732, 4733 } }, -- level 23
        { turnin = 4740 }, -- level 23
        { turnin = 98025, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 23
        { accept = 98461, why = { continent = true, kind = "carry", quest = 98461, seconds = 10320, xp = 1100 } }, -- level 23
        { turnin = 731, accept = 741, when = { log = 731 } }, -- level 23
        { turnin = 731, accept = 741, when = { done = 731 } }, -- level 23
        { turnin = 994, -- level 23
          note = "The NPC is indoors." },
        { accept = 990, why = { kind = "carry", once = true, quest = 990, seconds = 9180, xp = 400 } }, -- level 23
        { turnin = 741, accept = 942, when = { log = 741 }, -- level 23
          note = "The quest giver stands outdoors, not indoors." },
        { accept = 5678, races = { "Human" }, classes = { "PRIEST" } }, -- level 23
        { turnin = 741, accept = 942, when = { done = 741 }, -- level 23
          note = "The quest giver stands outdoors, not indoors." },
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 23
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 23
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 23
        { train = true, talk = 4146, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 23
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 23
          note = "The NPC is indoors." },
        { accept = 1199, dungeon = "Blackfathom Deeps", -- level 23
          note = "The NPC is indoors, one floor up." },
        { accept = 1198, dungeon = "Blackfathom Deeps", -- level 23
          note = "The NPC is indoors, one floor up." },
        { accept = 1275, dungeon = "Blackfathom Deeps" }, -- level 23
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 23
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 23
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 23
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 23
          note = "The NPC is indoors." },
        { go = { 1440, 42.33, 71.03 }, text = "Take the passage into Stonetalon Mountains" }, -- level 23
        { accept = 78132 }, -- level 23
        { turnin = 78132 }, -- level 23
        { accept = 78133 }, -- level 23
        { turnin = 78133 }, -- level 23
        { accept = 78134 }, -- level 23
        { turnin = 78134 }, -- level 23
        { turnin = 1070, accept = 1085, -- level 23
          note = "Look for it high on the clifftop." },
        { turnin = 1085, accept = 1071 }, -- level 23
        { accept = 1093, sticky = 1071, -- level 23
          note = "The NPC is indoors." },
        { complete = 1093 }, -- level 23
        { complete = 1071 }, -- level 23
        { turnin = 1093, -- level 23
          note = "The NPC is indoors." },
        { turnin = 1071, accept = { 1072, 1075 }, why = { continent = true, kind = "carry", quest = 1072, seconds = 16200, xp = 800 }, -- level 24
          note = "Look for it high on the clifftop." },
        { complete = 1134, -- level 24
          note = "The targets are wyverns." },
        { accept = 86574 }, -- level 24
        { complete = 86574 }, -- level 24
        { turnin = 1056 }, -- level 24
        { go = { 1442, 36.38, 7.24 }, fly = true, talk = 4407, text = "Fly to Stonetalon Peak" }, -- level 24
        { turnin = 86574 }, -- level 24
        { turnin = 1134 }, -- level 24
        { accept = 1025, -- level 24
          note = "The NPC is indoors." },
        { accept = 1016, -- level 24
          note = "The NPC is indoors." },
        { complete = 1016, collect = { { 12220, 5 } }, useitem = 5456, -- level 24
          note = "Watch out and keep away from Tideress. Your prey is a green-hued creature of living water, level 27." },
        { turnin = 1016, when = { item = 5455 }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 3963, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 4320, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 24
          note = "The NPC is indoors." },
        { complete = 1025 }, -- level 24
        { complete = 971, dungeon = "Blackfathom Deeps", -- level 24
          note = "Your targets sit below the water's surface. This is in the Pool of Ask'ar part of the dungeon. Look on Ghamoo-ra's north side." },
        { turnin = 1198, accept = 1200, dungeon = "Blackfathom Deeps", -- level 24
          note = "Dive down into the submerged cave. This is in the Pool of Ask'ar part of the dungeon. Find the NPC to the southwest of Ghamoo-ra." },
        { complete = 1200, dungeon = "Blackfathom Deeps", -- level 24
          note = "It is the dungeon's 4th boss." },
        { complete = 1199, dungeon = "Blackfathom Deeps", -- level 24
          note = "You'll find them all over the instance." },
        { complete = 1275, dungeon = "Blackfathom Deeps", -- level 24
          note = "Kill Fallenroot and Blackfathom foes. You'll find them all over the instance." },
        { turnin = 1275, dungeon = "Blackfathom Deeps" }, -- level 24
        { turnin = 1199, dungeon = "Blackfathom Deeps", -- level 24
          note = "The NPC is indoors, one floor up." },
        { turnin = 1200, dungeon = "Blackfathom Deeps", -- level 24
          note = "The NPC is indoors, one floor up." },
        { go = { 1447, 11.95, 77.54 }, fly = true, talk = 12577, text = "Fly to Talrendis Point", -- level 24
          note = "This trip is dangerous; move with great caution. Stay on the road and keep away from Horde NPCs. The Warsong Outriders riding along the road stay peaceful." },
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 24
        { turnin = 1025, -- level 24
          note = "The NPC is indoors." },
        { turnin = 990 }, -- level 24
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 24
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 24
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 24
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 24
          note = "The NPC is indoors." },
    },
})
