-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/19.lua.
-- Simulated (warrior): Human 37 (21%) -> 38 (14%) in 3 h 56, 13 quests turned in; Dwarf 37 (27%) -> 38 (14%) in 3 h 41, 13 quests turned in; NightElf 37 (31%) -> 38 (14%) in 3 h 28, 13 quests turned in; Gnome 37 (34%) -> 38 (14%) in 3 h 17, 13 quests turned in; Skyborne 37 (33%) -> 38 (14%) in 3 h 20, 13 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a19-stranglethorn-vale",
    title    = "Stranglethorn Vale (37-38)",
    faction  = "Alliance",
    minLevel = 37, maxLevel = 38,
    next     = "leveling-a20-swamp-of-sorrows",
    steps    = {
        { go = { 1434, 26.6, 76.53 }, text = "Travel to Booty Bay", -- level 37
          note = "Stranglethorn Vale: Booty Bay, at the southern tip." },
        { collect = { { 2719, 1 } }, spots = { { 1434, 26.6, 76.53 } }, when = { log = 1112 } }, -- level 37
        { collect = { { 2719, 1 } }, spots = { { 1434, 26.6, 76.53 } }, when = { done = 1112 } }, -- level 37
        { talk = 2625 }, -- level 37
        { sethearth = "Booty Bay", talk = 6807, -- level 37
          note = "The NPC is indoors at street level." },
        { turnin = 1115, -- level 37
          note = "Climb to the highest floor of the building." },
        { accept = 189, -- level 37
          note = "Climb to the highest floor of the building." },
        { accept = 601, -- level 37
          note = "The NPC is upstairs, out on the balcony." },
        { accept = 577, -- level 37
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
        { train = true, talk = 5498, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 37
          note = "The NPC waits on the tower's highest floor." },
        { go = { 1453, 42.29, 81.76 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 37
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Human", "Gnome" }, classes = { "WARLOCK" } }, -- level 37
        { vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 37
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors", -- level 37
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 37
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 37
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" } }, -- level 37
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 37
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 37
        { train = true, talk = 5515, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 37
          note = "The NPC is indoors." },
        { train = true, talk = 2879, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 37
          note = "The NPC is indoors." },
        { talk = 15659, collect = { { 4278, 4 } }, -- level 37
          note = "The NPC is indoors." },
        { accept = 627, when = { item = { 4278, 4 } }, -- level 37
          note = "Climb to the highest floor of the building." },
        { turnin = 627, when = { log = 627, ready = 627 }, -- level 37
          note = "Climb to the highest floor of the building." },
        { accept = 622, when = { done = 627, log = 627 } }, -- level 37
        { turnin = 627, when = { done = 627, ready = 627 }, -- level 37
          note = "Climb to the highest floor of the building." },
        { accept = 622, when = { done = 627 } }, -- level 37
        { accept = 207, elite = true }, -- level 37
        { accept = 574 }, -- level 37
        { turnin = 622, when = { log = 622 } }, -- level 37
        { accept = 195 }, -- level 37
        { accept = 188 }, -- level 37
        { accept = 192, elite = true }, -- level 37
        { complete = 1712, keep = 3357, classes = { "WARRIOR" }, -- level 37
          note = "They compete for spawn points with the other Kurzen foes. A key class quest coming up requires this." },
        { go = { 1434, 45.88, 8.15 }, text = "Go into the cavern" }, -- level 37
        { turnin = 328, accept = 329, -- level 37
          note = "Head to the lower level of the cavern." },
        { complete = 574, -- level 37
          note = "The targets are on the cave floor." },
        { complete = 574, -- level 37
          note = "These foes hide in stealth. The targets are on the cave floor." },
        { collect = { { 4306, 15 } }, keep = 4306, -- level 37
          note = "Targets are spread across the whole cavern. Hold on to it for a Searing Gorge task later." },
        { go = { 1434, 45.88, 8.15 }, elite = true, text = "Head out of the cave" }, -- level 37
        { complete = 192, elite = true, sticky = 195, -- level 37
          note = "These foes hide in stealth. Stay away from Bhag'thera. The big cat you need roams in plain sight: a level 40 elite black panther." },
        { complete = 577, -- level 37
          note = "The targets are in the water and along its edges." },
        { complete = 195 }, -- level 37
        { complete = 188, sticky = 189, -- level 37
          note = "Look for an orange tiger. Mostly found atop the hill. This one roams, so scan the surrounding area." },
        { complete = 207, elite = true }, -- level 37
        { complete = 207, elite = true, -- level 37
          note = "Steer clear of elite murlocs. Your targets sit below the water's surface." },
        { complete = 601, sticky = 189 }, -- level 37
        { go = { 1434, 23.89, 10.59 }, text = "Climb the trail" }, -- level 37
        { complete = 207, elite = true }, -- level 37
        { go = { 1434, 24.46, 11.66 }, text = "Stay on the trail" }, -- level 37
        { complete = 207, elite = true }, -- level 37
        { complete = 189, -- level 37
          note = "The targets are trolls." },
        { complete = 1712, classes = { "WARRIOR" } }, -- level 37
        { level = 37, xp = 69700, patrol = { { 1434, 24.56, 11.34 }, { 1434, 22.76, 10.35 }, { 1434, 22.37, 13.17 }, { 1434, 25.43, 13.65 }, { 1434, 27.25, 11.15 }, { 1434, 29.43, 12.17 }, { 1434, 25.44, 9.14 } }, why = { kind = "level", levels = { 36, 41 } }, -- level 37
          note = "With the coming hand-ins, this gets you to level 38." },
        { turnin = 195, accept = 196 }, -- level 37
        { turnin = 188 }, -- level 37
        { turnin = 192, elite = true }, -- level 37
        { accept = 193, elite = true }, -- level 37
        { turnin = 207, elite = true }, -- level 37
        { accept = 205, elite = true }, -- level 37
        { turnin = { 574, 329 }, accept = 330 }, -- level 37
        { turnin = 330, accept = 331 }, -- level 38
        { turnin = 331 }, -- level 38
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 38
        { accept = 1116, -- level 38
          note = "Climb to the highest floor of the building." },
        { turnin = 189, -- level 38
          note = "Climb to the highest floor of the building." },
        { turnin = 601, accept = 602, why = { kind = "carry", quest = 602, seconds = 23940, xp = 1400 }, -- level 38
          note = "The NPC is upstairs, out on the balcony." },
        { talk = 2625, bank = { 3960, 4306 }, -- level 38
          note = "You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots." },
        { bank = 2725, when = { item = 2725 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2728, when = { item = 2728 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2730, when = { item = 2730 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2732, when = { item = 2732 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2734, when = { item = 2734 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2735, when = { item = 2735 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2738, when = { item = 2738 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2740, when = { item = 2740 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2742, when = { item = 2742 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2744, when = { item = 2744 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2745, when = { item = 2745 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2748, when = { item = 2748 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2749, when = { item = 2749 }, -- level 38
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2750, when = { item = 2750 }, -- level 38
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2751, when = { item = 2751 }, -- level 38
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { turnin = 577, -- level 38
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
    },
})
