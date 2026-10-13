-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/33.lua.
-- Simulated (warrior): Human 50 (13%) -> 51 (15%) in 7 h 37, 11 quests turned in; Dwarf 50 (13%) -> 51 (15%) in 7 h 37, 11 quests turned in; NightElf 50 (13%) -> 51 (15%) in 7 h 46, 8 quests turned in; Gnome 50 (13%) -> 51 (15%) in 7 h 37, 11 quests turned in; Skyborne 50 (13%) -> 51 (15%) in 7 h 37, 11 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a33-searing-gorge",
    title    = "Searing Gorge (50-51)",
    faction  = "Alliance",
    minLevel = 50, maxLevel = 51,
    next     = "leveling-a34-blasted-lands-and-burning-steppes",
    steps    = {
        { go = { 1427, 38.58, 27.81 }, text = "Travel to Thorium Point", -- level 50
          note = "Searing Gorge: Thorium Point, in the north-west of the zone." },
        { accept = { 7723, 7724, 7727 } }, -- level 50
        { accept = { 7728, 7729 } }, -- level 50
        { accept = 3441 }, -- level 50
        { complete = 3441, talk = 8479 }, -- level 50
        { turnin = 3441, accept = 3442, sticky = { 3442, 7724, 7723, 7728, 7729 } }, -- level 50
        { complete = 7728 }, -- level 50
        { complete = 3442, -- level 50
          note = "Hunt flame and stone elementals." },
        { complete = 3442, -- level 50
          note = "Fight elementals and golems." },
        { turnin = 3442, accept = 3443, sticky = 3443 }, -- level 50
        { go = { 1427, 49.27, 43.68 }, text = "Drop onto the metal catwalk at this spot" }, -- level 50
        { go = { 1427, 49.61, 45.45 }, text = "Go into the cavern" }, -- level 50
        { go = { 1427, 47.79, 41.88 }, text = "Drop off the cavern's bridge at this spot" }, -- level 50
        { complete = 7727, sticky = { 3443, 7729 }, -- level 50
          note = "Your targets are within the cavern." },
        { go = { 1427, 47.49, 46.49 }, text = "Head out of the cave" }, -- level 50
        { go = { 1427, 49.64, 45.44 }, text = "Go in through the second cave opening" }, -- level 50
        { collect = { { 11818, 1 } }, -- level 50
          note = "Targets are spread across the whole cavern." },
        { useitem = 11818 }, -- level 50
        { accept = 4451, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { accept = 4451, races = { "Human", "Dwarf" } }, -- level 50
        { complete = 3443, -- level 50
          note = "Slave Workers can drop them too. Targets are spread across the whole cavern." },
        { complete = 7729, sticky = { 7724, 7723 }, -- level 50
          note = "Targets are spread across the whole cavern." },
        { go = { 1427, 49.64, 45.44 }, text = "Head out of the cave" }, -- level 50
        { go = { 1427, 58.24, 40.56 }, text = "Climb the trail out of the Cauldron" }, -- level 50
        { turnin = 3443 }, -- level 50
        { accept = 3452, elite = true }, -- level 50
        { complete = 3452, elite = true, -- level 50
          note = "The foes here are elite. Consider bringing a group for this one. Do not leave this quest undone; it matters." },
        { go = { 1427, 21.2, 35.97 }, text = "Head out of the cave" }, -- level 50
        { turnin = 3452, elite = true }, -- level 50
        { accept = 3453, elite = true }, -- level 50
        { complete = 3453, elite = true }, -- level 50
        { turnin = 3453, elite = true }, -- level 50
        { accept = 3454, elite = true }, -- level 50
        { turnin = 3454, elite = true }, -- level 50
        { accept = 3462, elite = true }, -- level 50
        { turnin = 3462, elite = true }, -- level 50
        { accept = 3463, elite = true }, -- level 50
        { complete = 3463, elite = true, equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { complete = 3463, elite = true, equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { complete = 3463, elite = true, equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { go = { 1427, 52.52, 58.01 }, elite = true, text = "Walk over the rope bridge" }, -- level 50
        { complete = 3463, elite = true, equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { turnin = 4451, accept = 4449, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { turnin = 4451, accept = 4449, races = { "Human", "Dwarf" } }, -- level 50
        { complete = 4449, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { complete = 4449, races = { "Human", "Dwarf" }, -- level 50
          note = "When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { elite = true, collect = { { 10000, 1 } }, patrol = { { 1427, 69.94, 76.41 }, { 1427, 70.58, 74.73 }, { 1427, 70.48, 73.22 }, { 1427, 68.74, 71.72 }, { 1427, 73.43, 74 }, { 1427, 73.22, 76.31 }, { 1427, 72.76, 78.36 }, { 1427, 72.91, 80.35 }, { 1427, 73.54, 82.37 } }, -- level 50
          note = "Hunt the elite azure saurian; it stands at level 48. The target wanders the trail. Consider bringing a group for this one." },
        { useitem = 10000 }, -- level 50
        { complete = 4449, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { complete = 4449, races = { "Human", "Dwarf" } }, -- level 50
        { complete = 4449, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { complete = 4449, races = { "Human", "Dwarf" } }, -- level 50
        { turnin = 4449, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { turnin = 4449, races = { "Human", "Dwarf" } }, -- level 50
        { accept = 3367, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { accept = 3367, races = { "Human", "Dwarf" }, -- level 50
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Defeat every foe close by before you begin." },
        { complete = 3367, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { complete = 3367, races = { "Human", "Dwarf" }, -- level 50
          note = "Let the conversation play out. Escort Dorius Stonetender and keep him safe." },
        { turnin = 3367, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { turnin = 3367, races = { "Human", "Dwarf" } }, -- level 50
        { accept = 3368, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 50
        { accept = 3368, races = { "Human", "Dwarf" } }, -- level 50
        { turnin = 3463, elite = true }, -- level 50
        { destroy = 10515 }, -- level 50
        { accept = 3481, elite = true }, -- level 50
        { turnin = 3481, elite = true }, -- level 50
        { useitem = 10569, unbank = 10575, -- level 50
          note = "Keep it; a later quest calls for it." },
        { complete = 7728, -- level 50
          note = "Look by the lookout towers ringing the Cauldron." },
        { complete = 7724 }, -- level 50
        { complete = 7723 }, -- level 50
        { level = 51, patrol = { { 1427, 32.54, 42.55 }, { 1427, 31.26, 38.76 }, { 1427, 27.26, 37.76 }, { 1427, 27.34, 42.45 }, { 1427, 27.44, 46.95 }, { 1427, 26.26, 51.26 }, { 1427, 27.35, 55.77 }, { 1427, 31.66, 55.35 }, { 1427, 30.06, 60.94 }, { 1427, 28.14, 65.03 }, { 1427, 26.54, 69.66 }, { 1427, 29.96, 70.74 }, { 1427, 28.94, 75.24 }, { 1427, 29.45, 79.15 }, { 1427, 23.64, 78.55 }, { 1427, 22.56, 74.04 }, { 1427, 36.97, 34.17 } } }, -- level 50
        { go = { 1427, 31.55, 33.57 }, text = "Climb the trail into Thorium Point" }, -- level 51
        { turnin = { 7723, 7724, 7727 } }, -- level 51
        { turnin = { 7728, 7729 } }, -- level 51
        { talk = 15659, collect = { { 2592, 60 }, { 4306, 60 }, { 4338, 60 }, { 14047, 60 } }, -- level 51
          note = "The NPC is indoors." },
        { talk = 2455, bank = 10575, -- level 51
          note = "The NPC is indoors." },
        { accept = 7791, when = { item = { 2592, 60 } }, -- level 51
          note = "The NPC is indoors, one floor up." },
        { turnin = 7791, when = { item = { 2592, 60 }, ready = 7791 } }, -- level 51
        { accept = 7793, when = { item = { 4306, 60 } }, -- level 51
          note = "The NPC is indoors, one floor up." },
        { turnin = 7793, when = { item = { 4306, 60 }, ready = 7793 } }, -- level 51
        { accept = 7794, when = { item = { 4338, 60 } }, -- level 51
          note = "The NPC is indoors, one floor up." },
        { turnin = 7794, when = { item = { 4338, 60 }, ready = 7794 } }, -- level 51
        { accept = 7795, when = { done = { 7791, 7793, 7794 }, item = { 14047, 60 } }, -- level 51
          note = "The NPC is indoors, one floor up." },
        { turnin = 7795, when = { done = { 7791, 7793, 7794 }, item = { 14047, 60 }, ready = 7795 } }, -- level 51
    },
})
