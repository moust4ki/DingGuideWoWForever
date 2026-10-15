-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/20.lua.
-- Simulated (warrior): Human 38 (14%) -> 39 (6%) in 4 h 43, 9 quests turned in; Dwarf 38 (14%) -> 39 (6%) in 4 h 43, 9 quests turned in; NightElf 38 (14%) -> 39 (6%) in 4 h 43, 9 quests turned in; Gnome 38 (14%) -> 39 (6%) in 4 h 43, 9 quests turned in; Skyborne 38 (14%) -> 39 (6%) in 4 h 43, 9 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a20-swamp-of-sorrows",
    title    = "Swamp of Sorrows (38-39)",
    faction  = "Alliance",
    minLevel = 38, maxLevel = 39,
    next     = "leveling-a21-arathi-highlands-and-alterac-mountains",
    leftOut  = {
        [2681] = { kind = "away" },
        [2701] = { kind = "prereq" },
        [2702] = { kind = "prereq" },
        [3512] = { kind = "prereq" },
        [3627] = { kind = "prereq" },
        [3628] = { kind = "prereq" },
    },
    steps    = {
        { train = true, floor = "top", talk = 5498, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 38
          note = "Stormwind first, then the Swamp of Sorrows. The NPC waits on the tower's highest floor." },
        { go = { 1453, 50.55, 90.37 }, races = { "Human", "Gnome" }, classes = { "MAGE" }, text = "Head indoors" }, -- level 38
        { accept = 1260, races = { "Human", "Gnome", "Skyborne" }, classes = { "MAGE" }, -- level 38
          note = "The NPC is indoors." },
        { go = { 1453, 51.56, 73.67 }, races = { "Human", "Gnome" }, classes = { "MAGE" }, text = "Head indoors" }, -- level 38
        { accept = 1363, races = { "Human", "Gnome", "Skyborne" }, classes = { "MAGE" }, -- level 38
          note = "The NPC is indoors." },
        { turnin = 1363, accept = 1364, floor = "up", races = { "Human", "Gnome", "Skyborne" }, classes = { "MAGE" }, -- level 38
          note = "The NPC is indoors, one floor up." },
        { go = { 1453, 51.56, 73.67 }, text = "Head indoors" }, -- level 38
        { accept = 1363, races = { "Dwarf", "NightElf" }, -- level 38
          note = "The NPC is indoors." },
        { accept = 1363, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 38
        { turnin = 1363, floor = "up", races = { "Dwarf", "NightElf" }, -- level 38
          note = "The NPC is indoors, one floor up." },
        { turnin = 1363, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 38
        { go = { 1453, 50.55, 90.37 }, text = "Head indoors" }, -- level 38
        { accept = 1260, races = { "Dwarf", "NightElf" }, why = { continent = true, kind = "carry", quest = 1260, seconds = 35040, xp = 700 }, -- level 38
          note = "The NPC is indoors." },
        { accept = 1260, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, why = { continent = true, kind = "carry", quest = 1260, seconds = 35040, xp = 700 } }, -- level 38
        { go = { 1453, 42.29, 81.76 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 38
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Human", "Gnome" }, classes = { "WARLOCK" } }, -- level 38
        { floor = "down", vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 38
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors", -- level 38
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 38
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 38
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" } }, -- level 38
        { train = true, floor = "up", talk = 5479, classes = { "WARRIOR" }, -- level 38
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 38
        { accept = 1448, -- level 38
          note = "The NPC is indoors." },
        { train = true, talk = 5515, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 38
          note = "The NPC is indoors." },
        { complete = 1116, -- level 38
          note = "Hunt the little winged dragonkin. When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { accept = 1396, sticky = 1396 }, -- level 38
        { accept = 1392, collect = { { 6196, 1 } }, useitem = 6196, patrol = { { 1435, 32.23, 36.35 }, { 1435, 33.3, 40.48 }, { 1435, 33.55, 43.94 }, { 1435, 36.72, 46.24 }, { 1435, 37.96, 43.15 }, { 1435, 38.93, 35.49 }, { 1435, 40.17, 34.59 }, { 1435, 40.92, 32.28 }, { 1435, 42.33, 32.31 }, { 1435, 45.65, 36.53 }, { 1435, 46.33, 38.63 }, { 1435, 47.61, 38.16 }, { 1435, 53.06, 39.13 }, { 1435, 55.45, 37.4 }, { 1435, 55.84, 35.66 }, { 1435, 55.57, 34.03 } }, -- level 38
          note = "The target is a humanoid escorted by 2 guards. The target patrols a long route; look along it." },
        { turnin = 1392, accept = 1389 }, -- level 38
        { complete = 1116, -- level 38
          note = "Hunt the little winged dragonkin. When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { complete = 1396 }, -- level 38
        { complete = 1396, -- level 38
          note = "Hunt spiders for it." },
        { complete = 1396 }, -- level 38
        { turnin = 1396, accept = 1421, sticky = 1389 }, -- level 38
        { complete = 1373, -- level 38
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 1421 }, -- level 38
        { accept = 1393, noauto = 1393, -- level 38
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Clear the monsters just south before you start." },
        { complete = 1393, -- level 38
          note = "Let the conversation play out. Escort Galen Goodward and keep him alive." },
        { complete = 1389, -- level 38
          note = "Look for big blue crystals." },
        { complete = 1448, -- level 38
          note = "Keep to the water to skip foes above your level." },
        { turnin = 1393, object = 32569 }, -- level 38
        { turnin = 1389 }, -- level 38
        { turnin = 1421 }, -- level 38
        { complete = 1116, -- level 38
          note = "Hunt the little winged dragonkin." },
        { level = 38, xp = 77300, patrol = { { 1435, 25.37, 49.15 }, { 1435, 28.64, 48.04 }, { 1435, 28.24, 52.15 }, { 1435, 30.16, 54.56 }, { 1435, 32.04, 50.84 }, { 1435, 34.64, 54.56 }, { 1435, 28.84, 60.56 }, { 1435, 27.56, 63.66 }, { 1435, 25.03, 61.65 }, { 1435, 24.35, 58.24 }, { 1435, 21.43, 59.04 }, { 1435, 21.94, 63.66 }, { 1435, 16.64, 56.85 }, { 1435, 16.23, 53.36 }, { 1435, 19.26, 53.15 }, { 1435, 25.46, 45.14 }, { 1435, 27.86, 43.43 }, { 1435, 21.44, 43.03 }, { 1435, 22.43, 37.16 }, { 1435, 32.84, 28.86 }, { 1435, 35.43, 30.55 }, { 1435, 37.55, 28.37 }, { 1435, 40.43, 29.76 }, { 1435, 43.66, 28.95 }, { 1435, 37.96, 32.77 }, { 1435, 38.85, 37.35 }, { 1435, 43.24, 43.16 }, { 1435, 38.44, 45.74 }, { 1435, 47.34, 34.83 } }, why = { kind = "level", levels = { 34, 43 } }, -- level 38
          note = "Together with the next turn-ins, this brings you to level 39." },
        { turnin = 1116, floor = "top", -- level 38
          note = "Climb to the highest floor of the building." },
        { accept = 1117, floor = "top", why = { continent = true, kind = "carry", once = true, quest = 1117, seconds = 33300, short = true, xp = 3500 }, -- level 39
          note = "Let the conversation play out. Climb to the highest floor of the building." },
        { collect = { { 5996, 2 } }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { talk = 15659 }, -- level 39
        { talk = 2455, collect = { { 6245, 1 }, { 3960, 1 } }, spots = { { 1453, 64.24, 80.81 } }, -- level 39
          note = "The NPC is indoors." },
        { talk = 2455, bank = 5804, -- level 39
          note = "The NPC is indoors. You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot." },
        { bank = 6190, when = { log = 1373 }, -- level 39
          note = "You need it later for \"Ongeku\": keep it in the bank to free a bag slot." },
        { bank = 6190, when = { done = 1373 }, -- level 39
          note = "You need it later for \"Ongeku\": keep it in the bank to free a bag slot." },
        { turnin = 1448, accept = 1449, why = { chain = 5, kind = "detour", quest = 1448, seconds = 60, xp = 13000 }, -- level 39
          note = "The NPC is indoors." },
        { go = { 1453, 69.09, 30.83 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, text = "Head down into the Deeprun Tram station", -- level 39
          note = "Pass through the portal to teleport." },
        { turnin = 1457, why = { action = "accept", chain = 1, kind = "detour", quest = 525, quests = 3, seconds = 60, total = 6000, xp = 4500 }, -- level 39
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { accept = 525, why = { kind = "carry", once = true, quest = 525, seconds = 6840, xp = 1400 }, -- level 39
          note = "The NPC is indoors." },
        { elite = true, talk = 8720, collect = { { 3357, 8 }, { 4480, 8 }, { 4479, 8 }, { 4481, 8 }, { 6052, 2 } }, classes = { "WARRIOR" }, -- level 39
          note = "Hold on to it for the Whirlwind class chain. A major boost to your weapon. The NPC is indoors." },
    },
})
