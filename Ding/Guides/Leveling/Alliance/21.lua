-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/21.lua.
-- Simulated (warrior): Human 39 (6%) -> 40 (27%) in 4 h 59, 26 quests turned in; Dwarf 39 (6%) -> 40 (27%) in 4 h 59, 26 quests turned in; NightElf 39 (6%) -> 40 (27%) in 4 h 59, 26 quests turned in; Gnome 39 (6%) -> 40 (27%) in 4 h 59, 26 quests turned in; Skyborne 39 (6%) -> 40 (27%) in 4 h 59, 26 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a21-arathi-highlands-and-alterac-mountains",
    title    = "Arathi and Alterac (39-40)",
    faction  = "Alliance",
    minLevel = 39, maxLevel = 40,
    next     = "leveling-a22-dustwallow-marsh",
    leftOut  = {
        [7081] = { kind = "away" },
        [7102] = { kind = "away" },
        [7122] = { kind = "away" },
        [8271] = { kind = "prereq" },
        [92432] = { kind = "detour", seconds = 60, xp = 2000 },
        [92459] = { kind = "detour", seconds = 60, xp = 2000 },
        [94947] = { kind = "away" },
        [96137] = { kind = "away" },
    },
    steps    = {
        { go = { 1417, 60.18, 53.85 }, text = "Travel to Refuge Pointe", -- level 39
          note = "Arathi Highlands: Refuge Pointe, in the middle of the zone." },
        { complete = 658, patrol = { { 1424, 55.59, 19.61 }, { 1424, 55.64, 24.9 }, { 1424, 55.91, 28.98 }, { 1424, 57.7, 36.66 }, { 1424, 62.4, 41.4 }, { 1424, 65.69, 42.62 }, { 1424, 68.14, 45.61 }, { 1424, 72.55, 48.19 }, { 1424, 77.24, 53.15 }, { 1424, 80.42, 55.38 }, { 1424, 82.02, 56.86 }, { 1417, 20.27, 29.68 }, { 1417, 21.57, 31.79 }, { 1417, 22.53, 33.99 }, { 1417, 22.7, 38.62 }, { 1417, 23.78, 43.27 }, { 1417, 25.5, 46.59 }, { 1417, 26.6, 49.23 }, { 1417, 31.12, 51.89 }, { 1417, 34.77, 52.21 }, { 1417, 38.24, 53.46 }, { 1417, 39.56, 54.73 }, { 1417, 43.05, 55.09 }, { 1417, 45.32, 58.89 }, { 1417, 46.76, 59.75 }, { 1417, 48.73, 59.28 }, { 1417, 50.78, 59.94 }, { 1417, 52.14, 61.4 }, { 1417, 55.3, 62.3 }, { 1417, 56.55, 62.92 }, { 1417, 57.69, 62.67 }, { 1417, 59.24, 63 }, { 1417, 60.59, 61.27 }, { 1417, 61.17, 59.46 }, { 1417, 60.3, 59.07 } }, -- level 39
          note = "The target travels the road in one direction, escorted by 4 guards. If she makes it to Tarren Mill, she spawns again. She starts her route over in Arathi Highlands." },
        { accept = 691 }, -- level 39
        { accept = 642, object = 138492 }, -- level 39
        { complete = 642, -- level 39
          note = "The targets are kobolds. Additional ones are in the cavern up the trail. Keep away from Hammerfall." },
        { go = { 1417, 80.95, 40.02 }, text = "Climb the trail to the cavern" }, -- level 39
        { go = { 1417, 82.62, 36.1 }, text = "Go into the cavern" }, -- level 39
        { turnin = 642, accept = 651, floor = "up", -- level 39
          note = "Climb to the cave's upper level." },
        { go = { 1417, 82.75, 36.26 }, text = "Head out of the cave" }, -- level 39
        { accept = 79976 }, -- level 39
        { turnin = 79976 }, -- level 39
        { complete = 651, -- level 39
          note = "Keep away from Hammerfall." },
        { collect = { { 4481, 8 } }, sticky = 691, classes = { "WARRIOR" } }, -- level 39
        { complete = 691, keep = 5040, -- level 39
          note = "Your targets are within the cavern." },
        { go = { 1417, 68.26, 75.15 }, text = "Head out of the cave" }, -- level 39
        { complete = 691 }, -- level 39
        { go = { 1417, 68.26, 75.15 }, text = "Head out of the cave" }, -- level 39
        { complete = 691 }, -- level 39
        { turnin = 658, accept = 657, -- level 39
          note = "The NPC stands atop the ridge." },
        { turnin = 657, accept = 660, noauto = 660, -- level 39
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear." },
        { complete = 660, -- level 39
          note = "Let the conversation play out. Escort Kinelory and keep her alive." },
        { turnin = 660, accept = 661 }, -- level 39
        { complete = 651 }, -- level 39
        { collect = { { 4480, 8 } }, classes = { "WARRIOR" } }, -- level 39
        { turnin = 691 }, -- level 39
        { turnin = 661 }, -- level 39
        { sethearth = "Southshore", talk = 2352, -- level 39
          note = "The NPC is indoors." },
        { accept = 500 }, -- level 39
        { turnin = 525, accept = { 537, 512 }, -- level 39
          note = "The NPC is indoors." },
        { turnin = 602 }, -- level 39
        { accept = 603, sticky = 512, why = { kind = "carry", quest = 603, seconds = 43680, xp = 1400 }, -- level 39
          note = "Wait for the talking to finish" },
        { complete = 537, -- level 39
          note = "Beware of foes lurking in stealth. The target is indoors." },
        { accept = 551, collect = { { 3706, 1 } }, useitem = 3706, -- level 39
          note = "The target is indoors." },
        { complete = 512, -- level 39
          note = "Beware of foes lurking in stealth." },
        { complete = 500, -- level 39
          note = "The targets are ogres." },
        { turnin = 500 }, -- level 39
        { turnin = { 537, 512 }, -- level 39
          note = "The NPC is indoors." },
        { turnin = 551 }, -- level 39
        { turnin = 1449, accept = 1450, why = { chain = 2, kind = "detour", quest = 1451, quests = 5, seconds = 360, short = true, total = 9700, xp = 7000 } }, -- level 39
        { turnin = 1450, accept = 1451, -- level 39
          note = "The NPC is indoors. The NPC is at the summit of the trail." },
        { go = { 1425, 20.76, 47.85 }, text = "Climb the trail" }, -- level 39
        { turnin = 1451, accept = 1452 }, -- level 39
        { accept = 693 }, -- level 39
        { go = { 1417, 53.78, 77.43 }, text = "Go into the cavern" }, -- level 39
        { complete = 693, -- level 39
          note = "Your targets are within the cavern." },
        { level = 39, xp = 82700, patrol = { { 1417, 54.8, 81.93 }, { 1417, 51.56, 77.55 }, { 1417, 49.44, 75.34 }, { 1417, 51.25, 72.46 }, { 1417, 53.85, 74.55 } }, why = { kind = "level", levels = { 35, 40 } }, -- level 39
          note = "Together with the next turn-ins, this brings you to level 40. Targets are in the cavern and around its entrance too." },
        { go = { 1417, 53.65, 77.19 }, text = "Head out of the cave" }, -- level 39
        { turnin = 693 }, -- level 39
        { complete = 651 }, -- level 40
        { collect = { { 4479, 8 } }, classes = { "WARRIOR" }, -- level 40
          note = "Stay clear of Refuge Point." },
        { elite = true, useitem = 6052, when = { item = 6052 }, classes = { "WARRIOR" }, -- level 40
          note = "A level 40 elite foe shows up shortly. Drink a second Nature Protection Potion mid-fight. Consume one ahead of time, so it has recharged once combat begins." },
        { complete = 1712, classes = { "WARRIOR" }, -- level 40
          note = "Head north, keeping to the riverbank. Get Essence of the Exile done as well." },
        { turnin = 1712, noauto = 1713, when = { item = 3357 }, classes = { "WARRIOR" }, why = { back = true, kind = "detour", quest = 1712, seconds = 360, short = true, xp = 2400 }, -- level 40
          note = "The NPC is indoors. Be sure the cooldown on the Nature Protection Potion has ended." },
        { accept = 1713, elite = true, when = { done = 1712 }, classes = { "WARRIOR" } }, -- level 40
        { complete = 1713, elite = true, when = { item = 6052, log = 1713 }, classes = { "WARRIOR" }, -- level 40
          note = "Let the conversation play out. Stay behind Bath'rah the Windwatcher as he walks. This calls up Cyclonian." },
        { turnin = 1713, elite = true, when = { ready = 1713 }, classes = { "WARRIOR" } }, -- level 40
        { accept = 1792, elite = true, when = { done = 1713 }, classes = { "WARRIOR" } }, -- level 40
        { turnin = 1792, elite = true, when = { log = 1792 }, classes = { "WARRIOR" } }, -- level 40
        { destroy = 6929, classes = { "WARRIOR" } }, -- level 40
        { turnin = 651 }, -- level 40
        { go = { 1417, 31.28, 65.32 }, text = "Take the trail across the peaks" }, -- level 40
        { go = { 1417, 21.63, 75.58 }, text = "Take the passage to Faldir's Cove" }, -- level 40
        { accept = 663 }, -- level 40
        { turnin = 663 }, -- level 40
        { accept = 662 }, -- level 40
        { accept = 664 }, -- level 40
        { accept = 665, noauto = 665, -- level 40
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { complete = 665, -- level 40
          note = "Let the conversation play out. Escort Professor Phizzlethorpe and keep him alive." },
        { turnin = 665, accept = 666, sticky = { 666, 664 } }, -- level 40
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 40
        { complete = 662, -- level 40
          note = "The tome is bound in brown and rests in a metal kettle. The objective is on the central deck of the submerged wreck." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 40
        { complete = 662, -- level 40
          note = "Look for a flat beige parchment. The objective is on the central deck of the submerged wreck." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 40
        { complete = 662, -- level 40
          note = "Look for a flat beige parchment. The objective is on the central deck of the submerged wreck." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 40
        { complete = 662, -- level 40
          note = "Search for a book lying open. The target is in the ship's lowest hold." },
        { complete = 666, equip = 4491, -- level 40
          note = "Look for big gray rocks. They show up as dots on the minimap." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 40
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 40
        { complete = 664, -- level 40
          note = "Your targets sit below the water's surface." },
        { turnin = 662 }, -- level 40
        { turnin = 664 }, -- level 40
        { turnin = 666, accept = 668 }, -- level 40
        { turnin = 668, accept = 669, why = { kind = "carry", once = true, quest = 669, seconds = 33180, xp = 3200 } }, -- level 40
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 40
        { accept = 554, why = { action = "accept", kind = "detour", quest = 554, seconds = 60, xp = 1600 } }, -- level 40
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 40
          note = "The NPC is indoors." },
        { turnin = 554, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 10090, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 40
          note = "The NPC is indoors." },
        { accept = 4487, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 40
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 40
          note = "The NPC is indoors." },
    },
})
