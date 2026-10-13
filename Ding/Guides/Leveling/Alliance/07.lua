-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/07.lua.
-- Simulated (warrior): Human 19 (23%) -> 20 (85%) in 2 h 55, 28 quests turned in; Dwarf 19 (23%) -> 20 (84%) in 2 h 51, 26 quests turned in; NightElf 19 (23%) -> 20 (85%) in 2 h 50, 26 quests turned in; Gnome 19 (23%) -> 20 (84%) in 2 h 51, 26 quests turned in; Skyborne 19 (23%) -> 20 (85%) in 2 h 47, 26 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a07-redridge-and-westfall",
    title    = "Redridge and Westfall (19-20)",
    faction  = "Alliance",
    minLevel = 19, maxLevel = 20,
    next     = "leveling-a08-darkshore",
    leftOut  = {
        [152] = { kind = "detour", seconds = 900, xp = 1500 },
        [399] = { kind = "detour", seconds = 120, xp = 1100 },
        [97222] = { kind = "unsure" },
        [97234] = { kind = "detour", seconds = 240, xp = 1000 },
        [98386] = { kind = "detour", seconds = 420, xp = 1200 },
    },
    steps    = {
        { go = { 1433, 27.05, 48.64 }, text = "Travel to Redridge Mountains", -- level 19
          note = "Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest." },
        { accept = 244, races = { "NightElf", "Skyborne" }, -- level 19
          note = "This one roams, so scan the surrounding area." },
        { accept = 98407, races = { "NightElf", "Skyborne" } }, -- level 19
        { turnin = 244, races = { "NightElf", "Skyborne" } }, -- level 19
        { go = { 1433, 25.46, 59.37 }, fly = true, talk = 931, races = { "NightElf" }, text = "Fly to Lakeshire" }, -- level 19
        { accept = 125 }, -- level 19
        { accept = 118, why = { kind = "carry", quest = 118, seconds = 6060, xp = 300 } }, -- level 19
        { accept = 120, -- level 19
          note = "The NPC is indoors." },
        { accept = 129, -- level 19
          note = "The NPC is indoors." },
        { turnin = 65, accept = 132, -- level 19
          note = "The NPC is indoors, one floor up." },
        { accept = 92, -- level 19
          note = "The NPC is indoors." },
        { accept = 3741 }, -- level 19
        { complete = 3741, -- level 19
          note = "Look for a big mound of brown earth. Your targets sit below the water's surface." },
        { turnin = 3741 }, -- level 19
        { turnin = 132, accept = 135, why = { chain = 4, kind = "detour", quest = 132, seconds = 180, xp = 4800 } }, -- level 19
        { turnin = 120, accept = 121, why = { back = true, chain = 3, kind = "detour", quest = 135, quests = 9, seconds = 600, short = true, total = 7200, xp = 4100 } }, -- level 19
        { turnin = 135, accept = 141, -- level 19
          note = "The NPC is indoors, one floor up." },
        { accept = 97894, why = { continent = true, kind = "carry", quest = 97894, seconds = 9180, xp = 800 } }, -- level 19
        { accept = 97926, why = { continent = true, kind = "carry", quest = 97926, seconds = 19320, xp = 800 } }, -- level 19
        { turnin = 97914 }, -- level 19
        { accept = 97220, races = { "NightElf" } }, -- level 19
        { turnin = 141, accept = 142 }, -- level 19
        { collect = { { 814, 5 } }, keep = 814, -- level 19
          note = "The targets are spread over several spots." },
        { complete = 142, patrol = { { 1436, 44.5, 25 }, { 1436, 44.24, 27.92 }, { 1436, 42.92, 29.35 }, { 1436, 41.79, 30.86 }, { 1436, 41.15, 33.08 }, { 1436, 40.42, 34.46 }, { 1436, 39.55, 35.1 }, { 1436, 38.2, 36.37 }, { 1436, 37.71, 37.46 }, { 1436, 37, 40.54 }, { 1436, 36.85, 42.3 }, { 1436, 36.66, 43.32 }, { 1436, 36.34, 43.96 }, { 1436, 35.6, 43.94 }, { 1436, 33.03, 42.82 }, { 1436, 31.5, 44.49 }, { 1436, 32.62, 43.05 }, { 1436, 33.62, 42.98 }, { 1436, 35.32, 43.78 }, { 1436, 37.19, 44.7 }, { 1436, 37.87, 45.54 }, { 1436, 38.44, 45.28 }, { 1436, 40.53, 48.21 }, { 1436, 41.63, 50.3 }, { 1436, 42.02, 52.47 }, { 1436, 43.08, 54.27 }, { 1436, 43.42, 59.17 }, { 1436, 44.75, 64.01 }, { 1436, 45.56, 64.94 }, { 1436, 45.45, 66.44 }, { 1436, 45.84, 67.83 }, { 1436, 45.46, 68.88 }, { 1436, 44.46, 69.54 } }, -- level 19
          note = "The target patrols a long route by the road. The target's route also goes far into Jangolode Mine and Gold Coast Quarry. It takes roughly 5 minutes to reappear." },
        { accept = { 103, 104 } }, -- level 19
        { turnin = 103, when = { ready = 103 } }, -- level 19
        { complete = 104, -- level 19
          note = "The target is a murloc, grey and bigger than the others. It roams the shoreline." },
        { complete = 92744 }, -- level 19
        { turnin = 104 }, -- level 19
        { turnin = 142 }, -- level 19
        { accept = 155, -- level 19
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { turnin = 92744 }, -- level 19
        { complete = 155, -- level 19
          note = "Escort The Defias Traitor and keep him alive." },
        { turnin = 155 }, -- level 19
        { accept = 244, races = { "Human" } }, -- level 19
        { accept = 98407, races = { "Human" } }, -- level 19
        { turnin = 244, races = { "Human" } }, -- level 19
        { accept = 246 }, -- level 19
        { complete = 98407, races = { "NightElf", "Skyborne" } }, -- level 19
        { accept = 98407, races = { "Dwarf", "Gnome" } }, -- level 19
        { complete = 98407, races = { "Dwarf", "Gnome" } }, -- level 19
        { complete = 98407, races = { "Human" } }, -- level 19
        { turnin = 129, accept = 130, sticky = { 246, 92 }, -- level 19
          note = "This one roams, so scan the surrounding area." },
        { complete = 246 }, -- level 19
        { complete = 246 }, -- level 19
        { complete = 92, keep = 1081 }, -- level 19
        { level = 20, patrol = { { 1433, 16.97, 74.04 }, { 1433, 17.77, 70.57 }, { 1433, 14.66, 70.35 }, { 1433, 13.96, 67.43 }, { 1433, 14.34, 64.35 }, { 1433, 17.28, 67.35 }, { 1433, 11.37, 69.46 }, { 1433, 12.37, 72.46 }, { 1433, 9.28, 73.46 }, { 1433, 6.77, 71.76 }, { 1433, 5.76, 75.36 }, { 1433, 3.37, 73.34 }, { 1433, 3.34, 77.44 }, { 1433, 4.27, 80.35 }, { 1433, 6.76, 78.45 }, { 1433, 7.27, 81.43 }, { 1433, 5.66, 84.26 }, { 1433, 3.28, 86.24 }, { 1433, 9.77, 76.54 } } }, -- level 20
        { turnin = 246 }, -- level 20
        { turnin = 98407, races = { "NightElf", "Skyborne" } }, -- level 20
        { turnin = 98407, races = { "Dwarf", "Gnome" } }, -- level 20
        { turnin = 98407, races = { "Human" } }, -- level 20
        { train = true, talk = 5515, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 2879, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 20
        { accept = 2360, classes = { "ROGUE" }, -- level 20
          note = "The NPC is indoors, one floor up." },
        { accept = 2281, classes = { "ROGUE" }, -- level 20
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 20
          note = "The NPC is indoors, one floor up." },
        { accept = { 167, 168 }, dungeon = "The Deadmines", -- level 20
          note = "The NPC is indoors." },
        { accept = 2040, dungeon = "The Deadmines" }, -- level 20
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors" }, -- level 20
        { accept = 1793, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 20
          note = "The NPC is indoors." },
        { turnin = 1793, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 20
        { useitem = 6776, races = { "Human", "Dwarf", "Skyborne" }, classes = { "PALADIN" } }, -- level 20
        { accept = 1649, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 20
        { turnin = 1649, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 20
          note = "The NPC is indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 20
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" } }, -- level 20
        { go = { 1453, 42.28, 81.85 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors" }, -- level 20
        { accept = 1716, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 20
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 20
          note = "The NPC waits on the lower level, indoors." },
        { vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 20
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 5498, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 20
          note = "The NPC waits on the tower's highest floor." },
        { talk = 2485, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 20
          note = "The NPC is on an upper floor of the tower." },
        { train = true, talk = 5504, races = { "NightElf" }, classes = { "DRUID" } }, -- level 20
        { accept = 3765, why = { action = "accept", kind = "detour", quest = 3765, seconds = 180, xp = 1500 } }, -- level 20
        { turnin = 118, accept = 119, why = { chain = 4, kind = "detour", quest = 118, quests = 8, seconds = 540, short = true, total = 6700, xp = 5900 }, -- level 20
          note = "The NPC is indoors." },
        { turnin = 91723, races = { "Human" } }, -- level 20
        { complete = 91732, races = { "Human" } }, -- level 20
        { complete = 91732, races = { "Dwarf", "Gnome" } }, -- level 20
        { accept = 94, why = { kind = "carry", quest = 94, seconds = 63000, xp = 800 }, -- level 20
          note = "The NPC waits on the tower's highest floor." },
        { complete = 91725, races = { "Human" } }, -- level 20
        { turnin = 91725, races = { "Human" } }, -- level 20
        { complete = 91725, races = { "Dwarf", "Gnome" } }, -- level 20
        { turnin = 91725, races = { "Dwarf", "Gnome" } }, -- level 20
        { complete = 125, -- level 20
          note = "Your targets sit below the water's surface." },
        { turnin = 125, accept = 89 }, -- level 20
        { turnin = 119, accept = 122, sticky = { 122, 92 } }, -- level 20
        { accept = 124, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 20
        { accept = 124, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 20
        { complete = 92, keep = 1080, -- level 20
          note = "Hunt the red-feathered birds." },
        { complete = 122, -- level 20
          note = "The targets are little winged dragons." },
        { complete = 92, keep = 2296, -- level 20
          note = "Kill boars for these." },
        { turnin = 122 }, -- level 20
        { turnin = 121, -- level 20
          note = "The NPC is indoors." },
        { turnin = 92, -- level 20
          note = "The NPC is indoors." },
        { turnin = 130, accept = 131 }, -- level 20
        { turnin = 131, -- level 20
          note = "The NPC is indoors." },
        { complete = 89, -- level 20
          note = "Your targets here are gnolls. Skip Redridge Alphas; they don't carry them." },
        { complete = 124, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 20
        { complete = 124, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 20
        { turnin = 2281, accept = 2282, classes = { "ROGUE" } }, -- level 20
        { go = { 1433, 46.84, 45.28 }, classes = { "ROGUE" }, text = "Raise Lockpicking to 95", -- level 20
          note = "Look for little gray coffers of metal. The NPC is indoors." },
        { complete = 2282, classes = { "ROGUE" }, -- level 20
          note = "The object is indoors." },
        { turnin = 124, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 20
        { turnin = 124, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "PRIEST", "MAGE", "WARLOCK" } }, -- level 20
        { turnin = 89 }, -- level 20
        { turnin = 2282, when = { ready = 2282 }, classes = { "ROGUE" } }, -- level 20
        { destroy = 7907, classes = { "ROGUE" } }, -- level 20
        { accept = 166, dungeon = "The Deadmines" }, -- level 20
        { accept = 214, dungeon = "The Deadmines", -- level 20
          note = "The NPC waits on the tower's highest floor." },
        { go = { 1436, 42.62, 71.67 }, dungeon = "The Deadmines", text = "Go inside and stay on the trail" }, -- level 20
        { complete = 167, dungeon = "The Deadmines", -- level 20
          note = "Your target is a ghoul. This one roams, so scan the surrounding area." },
        { complete = 168, dungeon = "The Deadmines", -- level 20
          note = "Fight undead foes." },
        { complete = 2040, dungeon = "The Deadmines", -- level 20
          note = "The target is the dungeon's second boss." },
        { complete = 166, dungeon = "The Deadmines", collect = { { 2874, 1 } }, -- level 20
          note = "The target is the dungeon's last boss. The objective is aboard the vessel." },
        { complete = 214, dungeon = "The Deadmines", -- level 20
          note = "You'll find them all over the instance." },
        { turnin = 166, dungeon = "The Deadmines" }, -- level 20
        { turnin = 214, dungeon = "The Deadmines", -- level 20
          note = "The NPC waits on the tower's highest floor." },
        { accept = 373, dungeon = "The Deadmines", useitem = 2874 }, -- level 20
        { turnin = 373, dungeon = "The Deadmines", -- level 20
          note = "The NPC is indoors." },
        { turnin = 2040, dungeon = "The Deadmines" }, -- level 20
        { turnin = { 167, 168 }, dungeon = "The Deadmines", -- level 20
          note = "The NPC is indoors" },
        { accept = 971, dungeon = "Blackfathom Deeps", -- level 20
          note = "The NPC is indoors." },
    },
})
