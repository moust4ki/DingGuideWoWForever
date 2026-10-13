-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/25.lua.
-- Simulated (warrior): Human 42 (25%) -> 43 (37%) in 4 h 23, 25 quests turned in; Dwarf 42 (25%) -> 43 (37%) in 4 h 23, 26 quests turned in; NightElf 42 (25%) -> 43 (37%) in 4 h 23, 24 quests turned in; Gnome 42 (25%) -> 43 (37%) in 4 h 23, 25 quests turned in; Skyborne 42 (25%) -> 43 (37%) in 4 h 23, 26 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a25-stranglethorn-vale",
    title    = "Stranglethorn Vale (42-43)",
    faction  = "Alliance",
    minLevel = 42, maxLevel = 43,
    next     = "leveling-a26-swamp-of-sorrows",
    steps    = {
        { go = { 1455, 35.92, 60.14 }, text = "Travel to Stormwind", -- level 42
          note = "Stormwind first, then Stranglethorn Vale." },
        { talk = 2461, collect = { { 4502, 1 }, { 5826, 1 } }, spots = { { 1455, 35.87, 60.19 } }, -- level 42
          note = "The NPC is indoors." },
        { accept = 1477, -- level 42
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 78148, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 42
        { turnin = 97286, races = { "Human" }, classes = { "MAGE" } }, -- level 42
        { accept = 79536 }, -- level 42
        { turnin = 79536 }, -- level 42
        { go = { 1453, 51.56, 73.67 }, text = "Head indoors" }, -- level 42
        { accept = 1364, races = { "Dwarf", "NightElf" }, -- level 42
          note = "The NPC is indoors, one floor up." },
        { accept = 1364, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 42
        { accept = 209, -- level 42
          note = "Climb to the highest floor of the building." },
        { turnin = 669, -- level 42
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = 603, accept = 610, -- level 42
          note = "The NPC is indoors, on the central storey." },
        { sethearth = "Booty Bay", talk = 6807, -- level 42
          note = "The NPC is indoors at street level. The NPC is indoors." },
        { turnin = 1118, -- level 42
          note = "The NPC is indoors at street level." },
        { accept = { 600, 621 }, -- level 42
          note = "Let the conversation play out. The NPC is indoors at street level." },
        { accept = 606, -- level 42
          note = "The NPC is indoors." },
        { accept = 595 }, -- level 42
        { accept = 628, elite = true }, -- level 42
        { go = { 1434, 27.94, 73.5 }, text = "Take the passage out of Booty Bay" }, -- level 42
        { complete = 606, sticky = 610 }, -- level 42
        { turnin = 595, accept = 597 }, -- level 42
        { complete = 610 }, -- level 42
        { go = { 1434, 29.51, 72.47 }, text = "Take the tunnel into Booty Bay" }, -- level 42
        { turnin = 606, accept = 607 }, -- level 42
        { turnin = 597, accept = 599 }, -- level 42
        { turnin = 607, accept = 609, -- level 42
          note = "The NPC is indoors." },
        { turnin = 610, accept = 611, -- level 42
          note = "The NPC is indoors, on the central storey." },
        { turnin = 599, -- level 42
          note = "The NPC is upstairs, out on the balcony." },
        { accept = 617 }, -- level 42
        { go = { 1434, 27.94, 73.5 }, text = "Take the passage out of Booty Bay" }, -- level 42
        { complete = 617, sticky = 621 }, -- level 42
        { complete = 609 }, -- level 42
        { complete = 609 }, -- level 42
        { go = { 1434, 33.78, 53.72 }, text = "Take the trail toward the Ruins of Aboraz" }, -- level 42
        { complete = 609 }, -- level 42
        { complete = 196, -- level 42
          note = "Gradually move toward the northeast." },
        { complete = 600, -- level 42
          note = "The targets are goblins." },
        { complete = 209, -- level 42
          note = "The targets are trolls. Kill the witch doctors and the mystics." },
        { complete = 205, elite = true }, -- level 42
        { complete = 193, elite = true, -- level 42
          note = "A dark panther, elite at 40, visible rather than hidden. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { turnin = 205, elite = true }, -- level 42
        { turnin = 193, elite = true }, -- level 42
        { turnin = 196 }, -- level 42
        { turnin = 93928, races = { "Dwarf", "Skyborne" } }, -- level 42
        { accept = 197, elite = true }, -- level 42
        { complete = 628, elite = true, -- level 42
          note = "Be ready: these opponents are elites at level 38. Saltwater Crocolisks spawn in the same places." },
        { complete = 611, -- level 42
          note = "The object is a table made of stone. Your targets sit below the water's surface. Drag him up until he breaks the surface." },
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 42
        { turnin = 600, -- level 42
          note = "The NPC is indoors at street level." },
        { turnin = 621, when = { ready = 621 } }, -- level 42
        { accept = 587, -- level 42
          note = "Climb to the highest floor of the building." },
        { turnin = 209, -- level 42
          note = "Climb to the highest floor of the building." },
        { accept = 604, -- level 42
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = 611, -- level 42
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = 617, accept = 623 }, -- level 42
        { bank = 2725, when = { item = 2725 } }, -- level 42
        { bank = 2728, when = { item = 2728 } }, -- level 42
        { bank = 2730, when = { item = 2730 } }, -- level 42
        { bank = 2732, when = { item = 2732 } }, -- level 42
        { bank = 2734, when = { item = 2734 } }, -- level 42
        { bank = 2735, when = { item = 2735 } }, -- level 42
        { bank = 2738, when = { item = 2738 } }, -- level 42
        { bank = 2740, when = { item = 2740 } }, -- level 42
        { bank = 2742, when = { item = 2742 } }, -- level 42
        { bank = 2744, when = { item = 2744 } }, -- level 42
        { bank = 2745, when = { item = 2745 } }, -- level 42
        { bank = 2748, when = { item = 2748 } }, -- level 42
        { bank = 2749, when = { item = 2749 } }, -- level 42
        { bank = 2750, when = { item = 2750 } }, -- level 42
        { bank = 2751, when = { item = 2751 } }, -- level 42
        { talk = 2625 }, -- level 42
        { turnin = 609, -- level 42
          note = "The NPC is indoors." },
        { turnin = 628, elite = true }, -- level 42
        { accept = 576, sticky = { 604, 576, 587 }, -- level 42
          note = "The NPC stands on the top tier of the pier." },
        { go = { 1434, 27.94, 73.5 }, text = "Take the passage out of Booty Bay" }, -- level 42
        { go = { 1434, 32.83, 73.7 }, text = "Follow the shoreline" }, -- level 42
        { complete = 604, -- level 42
          note = "The item is a brownish sheet of parchment. The targets are spread over several spots." },
        { complete = 604, -- level 43
          note = "Look for a flat, white scroll lying open. The targets are spread over several spots." },
        { complete = { 576, 587 } }, -- level 43
        { complete = 604 }, -- level 43
        { go = { 1434, 29.51, 72.47 }, text = "Take the tunnel into Booty Bay" }, -- level 43
        { turnin = 576, -- level 43
          note = "The NPC stands on the top tier of the pier." },
        { turnin = 604, -- level 43
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = 587, -- level 43
          note = "Climb to the highest floor of the building." },
        { talk = 2625, collect = { { 2725, 1 }, { 2728, 1 }, { 2730, 1 }, { 2732, 1 }, { 2734, 1 }, { 2735, 1 }, { 2738, 1 }, { 2740, 1 }, { 2742, 1 }, { 2744, 1 }, { 2745, 1 }, { 2748, 1 }, { 2749, 1 }, { 2750, 1 }, { 2751, 1 } }, -- level 43
          note = "If some pages are unavailable, go on without them." },
        { talk = 15681, collect = { { 2725, 1 }, { 2728, 1 }, { 2730, 1 }, { 2732, 1 }, { 2734, 1 }, { 2735, 1 }, { 2738, 1 }, { 2740, 1 }, { 2742, 1 }, { 2744, 1 }, { 2745, 1 }, { 2748, 1 }, { 2749, 1 }, { 2750, 1 }, { 2751, 1 } }, -- level 43
          note = "You want Chapters I, II and III." },
        { accept = 338 }, -- level 43
        { accept = 339, when = { item = { { 2725, 1 }, { 2728, 1 }, { 2730, 1 }, { 2732, 1 } } } }, -- level 43
        { turnin = 339, when = { log = 339, ready = 339 } }, -- level 43
        { accept = 340, when = { item = { { 2734, 1 }, { 2735, 1 }, { 2738, 1 }, { 2740, 1 } } } }, -- level 43
        { turnin = 340, when = { log = 339, ready = 340 } }, -- level 43
        { turnin = 340, when = { done = 339, ready = 340 } }, -- level 43
        { accept = 341, when = { item = { { 2742, 1 }, { 2744, 1 }, { 2745, 1 }, { 2748, 1 } } } }, -- level 43
        { turnin = 341, when = { log = 339, ready = 341 } }, -- level 43
        { turnin = 341, when = { done = 339, ready = 341 } }, -- level 43
        { accept = 342, when = { item = { { 2749, 1 }, { 2750, 1 }, { 2751, 1 } } } }, -- level 43
        { turnin = 342, when = { log = 339, ready = 342 } }, -- level 43
        { turnin = 342, when = { done = 339, ready = 342 } }, -- level 43
        { turnin = 338, when = { item = 2756, ready = 338 } }, -- level 43
        { abandon = 338 }, -- level 43
    },
})
