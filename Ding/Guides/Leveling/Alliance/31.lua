-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/31.lua.
-- Simulated (warrior): Human 49 (50%) -> 49 (100%) in 2 h 06, 10 quests turned in; Dwarf 49 (50%) -> 49 (100%) in 2 h 06, 10 quests turned in; NightElf 49 (47%) -> 49 (100%) in 2 h 23, 10 quests turned in; Gnome 49 (50%) -> 49 (100%) in 2 h 06, 10 quests turned in; Skyborne 49 (50%) -> 49 (100%) in 2 h 06, 10 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a31-ungoro-crater",
    title    = "Un'Goro Crater (49-50)",
    faction  = "Alliance",
    minLevel = 49, maxLevel = 50,
    next     = "leveling-a32-stranglethorn-vale",
    steps    = {
        { go = { 1449, 71.64, 75.96 }, text = "Travel to Un'Goro Crater", -- level 49
          note = "Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east." },
        { accept = 4289 }, -- level 49
        { accept = 4290, elite = true }, -- level 49
        { accept = 3844 }, -- level 49
        { turnin = 3844, accept = 3845, -- level 49
          note = "Your targets sit below the water's surface." },
        { complete = 4290, elite = true, -- level 49
          note = "Stay clear of the elite tyrannosaur." },
        { turnin = 4290, elite = true }, -- level 49
        { accept = 4291, elite = true }, -- level 49
        { complete = 4291, elite = true }, -- level 49
        { turnin = 4291, elite = true }, -- level 49
        { accept = 4292, elite = true }, -- level 49
        { collect = { { 11116, 1 } }, useitem = 11116, -- level 49
          note = "Every creature in Un'Goro Crater can drop it." },
        { accept = 3884, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 49
        { accept = 3884, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { collect = { { 11186, 7 }, { 11188, 7 }, { 11185, 7 }, { 11184, 7 } }, -- level 49
          note = "Gather from clumps of multicolored crystals. Spawn points are shared, so pick up every one you find. Gathering it causes other hues to show up." },
        { complete = 3845, useitem = 11107 }, -- level 49
        { destroy = { 11108, 3108 } }, -- level 49
        { turnin = 3845, accept = 3908 }, -- level 49
        { turnin = 3884, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 49
        { turnin = 3884, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 49
        { accept = 4284, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 49
          note = "Your targets are within the cavern." },
        { accept = 4284, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { turnin = 4284, when = { ready = 4284 }, -- level 49
          note = "Your targets are within the cavern." },
        { destroy = { 11186, 11188, 11185, 11184 } }, -- level 49
        { go = { 1449, 43.53, 6.78 }, text = "Head out of the cave" }, -- level 49
        { accept = 4141, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 49
        { accept = 4141, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { complete = 4141, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 49
          note = "The targets are mobile plant monsters." },
        { complete = 4141, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { collect = { { 11018, 25 } }, keep = 11018 }, -- level 49
        { level = 49, xp = 117440, patrol = { { 1449, 69.24, 35.25 }, { 1449, 71.94, 36.34 }, { 1449, 74.65, 38.14 }, { 1449, 72.16, 41.64 }, { 1449, 74.46, 43.86 }, { 1449, 75.37, 47.56 }, { 1449, 69.43, 38.97 }, { 1449, 66.35, 39.54 }, { 1449, 64.37, 37.17 }, { 1449, 66.35, 33.15 }, { 1449, 63.05, 32.56 }, { 1449, 64.06, 29.34 }, { 1449, 67.35, 29.55 }, { 1449, 70.26, 31.34 }, { 1449, 73.34, 32.45 }, { 1449, 70.44, 27.45 }, { 1449, 69.34, 24.45 }, { 1449, 66.37, 25.95 }, { 1449, 68.46, 20.37 }, { 1449, 71.44, 21.37 } }, -- level 49
          note = "Together with the next turn-ins, this brings you to level 50." },
        { turnin = 4141, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 49
        { turnin = 4141, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { accept = 4142, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 49
        { accept = 4142, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { go = { 1449, 45.2, 5.8 }, fly = true, talk = 10583, text = "Flight master at Marshal's Refuge" }, -- level 49
        { turnin = 2605, accept = 2606 }, -- level 49
        { talk = 7799, collect = { { 9245, 1 }, { 5807, 1 }, { 3900, 12 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 49
          note = "The NPC is indoors." },
        { talk = 7799, bank = { 9507, 11568, 11018, 11316, 11133 }, -- level 49
          note = "The NPC is indoors. You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots." },
        { turnin = 5863 }, -- level 49
        { turnin = 3362 }, -- level 49
        { turnin = 2606, accept = 2641 }, -- level 49
        { accept = 162, elite = true, when = { done = 113 } }, -- level 49
        { turnin = 3161, accept = 3444 }, -- level 49
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 49
        { talk = 7799, bank = 8594, -- level 49
          note = "The NPC is indoors. You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot." },
        { accept = 7065, dungeon = "Maraudon", -- level 49
          note = "The NPC is on the house's raised terrace." },
        { accept = 7041, dungeon = "Maraudon", races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 49
        { accept = 7041, dungeon = "Maraudon", races = { "Human", "Dwarf", "Skyborne" } }, -- level 49
        { accept = 7028, dungeon = "Maraudon", races = { "Dwarf", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 49
        { accept = 7028, dungeon = "Maraudon", races = { "Human" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 49
          note = "The NPC is indoors." },
        { dungeon = "Maraudon", collect = { { 17757, 1 } }, -- level 49
          note = "In the Maraudon Tunnels, the target is a centaur in violet armor. The targets are spread over several spots." },
        { dungeon = "Maraudon", collect = { { 17762, 1 } }, useitem = 17757, -- level 49
          note = "Head into the purple wing of the Maraudon Tunnels. Use it on the Spirit of Gelk." },
        { dungeon = "Maraudon", collect = { { 17761, 1 } }, useitem = 17757, -- level 49
          note = "In the Maraudon Tunnels, find the chamber joining the purple and orange areas. Target the Spirit of Kolk with the item." },
        { dungeon = "Maraudon", useitem = 17693, -- level 49
          note = "Found in the Maraudon Tunnels, along the orange wing. The target is beside the big pool holding orange crystals." },
        { complete = 7041, dungeon = "Maraudon", races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 49
        { complete = 7041, dungeon = "Maraudon", races = { "Human", "Dwarf", "Skyborne" } }, -- level 49
        { dungeon = "Maraudon", collect = { { 17763, 1 } }, useitem = 17757, -- level 49
          note = "Found in the Maraudon Tunnels, along the orange wing. Target the Spirit of Magra with it." },
        { dungeon = "Maraudon", collect = { { 17765, 1 } }, useitem = 17757, -- level 49
          note = "Target Spirit of Veng with it. This one roams, so scan the surrounding area. In the orange area." },
        { dungeon = "Maraudon", useitem = 17696, -- level 49
          note = "Use it beside the Vylestem Vines. Look for stumps topped with big leaves. The spot is in Foulspore Cavern." },
        { complete = 7041, dungeon = "Maraudon", races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 49
        { complete = 7041, dungeon = "Maraudon", races = { "Human", "Dwarf", "Skyborne" } }, -- level 49
        { dungeon = "Maraudon", collect = { { 17764, 1 } }, useitem = 17757, -- level 49
          note = "This happens in Maraudon's violet wing. Aim the item at the Spirit of Maraudos. The target is a spectral centaur holding a spear." },
        { dungeon = "Maraudon", useitem = 17765 }, -- level 49
        { complete = 7065, dungeon = "Maraudon", -- level 49
          note = "This happens in Maraudon's violet wing. The target is the dungeon's last boss." },
        { turnin = 7067, dungeon = "Maraudon", when = { item = 17758 }, -- level 49
          note = "This one roams, so scan the surrounding area." },
        { turnin = 7028, dungeon = "Maraudon", when = { ready = 7028 }, -- level 49
          note = "The NPC is indoors." },
        { turnin = 7041, dungeon = "Maraudon", races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 49
        { turnin = 7041, dungeon = "Maraudon", races = { "Human", "Dwarf", "Skyborne" } }, -- level 49
        { turnin = 7065, dungeon = "Maraudon", -- level 49
          note = "The NPC is on the house's raised terrace." },
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 10090, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 49
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 49
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 49
          note = "The NPC is indoors." },
    },
})
