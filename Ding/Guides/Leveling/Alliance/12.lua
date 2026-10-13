-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/12.lua.
-- Simulated (warrior): Human 28 (41%) -> 30 (4%) in 3 h 58, 28 quests turned in; Dwarf 28 (41%) -> 30 (4%) in 3 h 58, 28 quests turned in; NightElf 28 (42%) -> 30 (8%) in 3 h 58, 29 quests turned in; Gnome 28 (41%) -> 30 (4%) in 3 h 58, 28 quests turned in; Skyborne 28 (41%) -> 30 (1%) in 3 h 38, 29 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a12-wetlands",
    title    = "Wetlands (27-29)",
    faction  = "Alliance",
    minLevel = 27, maxLevel = 29,
    next     = "leveling-a13-stonetalon-mountains-and-ashenvale",
    steps    = {
        { go = { 1437, 8.32, 58.57 }, text = "Travel to Menethil Harbor", -- level 28
          note = "Wetlands: Menethil Harbor, on the west coast." },
        { accept = 281 }, -- level 28
        { accept = 98240, races = { "Skyborne" } }, -- level 28
        { accept = 471 }, -- level 28
        { accept = 289, when = { done = 288 } }, -- level 28
        { turnin = 270, elite = true }, -- level 28
        { sethearth = "Deepwater Tavern", talk = 1464, -- level 28
          note = "The NPC is indoors." },
        { accept = 472 }, -- level 28
        { turnin = 98197 }, -- level 28
        { accept = 98221 }, -- level 28
        { accept = 98230, races = { "Skyborne" } }, -- level 28
        { accept = 464, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "The NPC is indoors, one floor up." },
        { accept = 464, races = { "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 28
        { turnin = 281, accept = 284 }, -- level 28
        { turnin = 284, accept = 285 }, -- level 28
        { turnin = 285, accept = 286, sticky = 289 }, -- level 28
        { complete = 289, when = { log = 289 }, -- level 28
          note = "Your targets sit below the water's surface. Targets are within the wrecked vessel underwater." },
        { complete = 289, when = { log = 289 } }, -- level 28
        { complete = 471 }, -- level 28
        { complete = 277, -- level 28
          note = "Your targets here are gnolls." },
        { go = { 1437, 34.23, 41.15 }, text = "Go into Whelgar's Excavation Site" }, -- level 28
        { go = { 1437, 37.07, 43.02 }, text = "Climb the trail" }, -- level 28
        { accept = 295, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 28
        { accept = 299, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "Your objective lies in a little cavern." },
        { complete = 295, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 28
        { go = { 1437, 37.07, 43.02 }, races = { "Human", "Dwarf", "NightElf", "Gnome" }, text = "Climb the trail" }, -- level 28
        { turnin = 295, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 28
        { accept = 296, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 28
        { go = { 1437, 31.93, 48.57 }, text = "Climb the trail" }, -- level 28
        { complete = 296, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "The target is a blue raptor. Look for it high on the clifftop. This one roams, so scan the surrounding area." },
        { complete = 299, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "Look for a big mound of dirt. The targets are spread over several spots. The item may also spawn on the high ledge by Sarltooth." },
        { complete = 299, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "Look for a big, broad yellow urn. The targets are spread over several spots. The item may also spawn on the high ledge by Sarltooth." },
        { complete = 299, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "Look for a big, tall crimson urn. The targets are spread over several spots. The item may also spawn on the high ledge by Sarltooth." },
        { complete = 299, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "The target is a big stone container. The targets are spread over several spots. The item may also spawn on the high ledge by Sarltooth." },
        { go = { 1437, 37.07, 43.02 }, text = "Climb the trail" }, -- level 28
        { turnin = 296, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 28
        { turnin = 299, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "Your objective lies in a little cavern." },
        { go = { 1437, 34.07, 40.91 }, text = "Head out of Whelgar's Excavation Site" }, -- level 28
        { complete = 464, races = { "Human", "Dwarf", "NightElf", "Gnome" }, -- level 28
          note = "The targets are orcs." },
        { complete = 464, races = { "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 28
        { turnin = 98230, races = { "Skyborne" } }, -- level 28
        { turnin = 98240, races = { "Skyborne" } }, -- level 28
        { accept = 98245 }, -- level 28
        { complete = 98245 }, -- level 28
        { turnin = 98245 }, -- level 28
        { accept = 98283 }, -- level 28
        { turnin = 277, accept = 275 }, -- level 28
        { complete = 98072, races = { "Skyborne" } }, -- level 28
        { complete = 98283 }, -- level 28
        { complete = 335, races = { "Dwarf", "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 29
        { complete = 335, races = { "Human", "Gnome", "Skyborne" } }, -- level 29
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 29
        { turnin = 289, when = { log = 289 } }, -- level 29
        { accept = 290, when = { done = 289 } }, -- level 29
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 29
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 29
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 29
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 29
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 29
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 29
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 29
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 29
          note = "The NPC is indoors." },
        { turnin = 286 }, -- level 29
        { turnin = 471 }, -- level 29
        { turnin = 98072, races = { "Skyborne" } }, -- level 29
        { turnin = 464, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 29
        { turnin = 464, races = { "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 29
        { accept = 464, races = { "Skyborne" }, classes = { "PRIEST" } }, -- level 29
        { complete = 464, races = { "Skyborne" }, classes = { "PRIEST" } }, -- level 29
        { turnin = 464, races = { "Skyborne" }, classes = { "PRIEST" } }, -- level 29
        { accept = 465, -- level 29
          note = "The NPC is indoors, one floor up." },
        { turnin = 98189, races = { "NightElf", "Skyborne" } }, -- level 29
        { turnin = 98221 }, -- level 29
        { complete = 290, when = { log = 290 }, -- level 29
          note = "The target is up on the boat's top deck. Climb the incline at the rear." },
        { turnin = 290, when = { log = 290 }, -- level 29
          note = "Go to the lowest deck of the ship. Your targets sit below the water's surface. Swim in via the gap at the base." },
        { accept = 292, when = { done = 290 } }, -- level 29
        { complete = 275, -- level 29
          note = "These foes hide in stealth. Most often found in or beside water. Grab every one you spot on the way here." },
        { turnin = 465 }, -- level 29
        { level = 28, xp = 38750, patrol = { { 1437, 41.05, 39.65 }, { 1437, 42.66, 43.63 }, { 1437, 41.54, 45.55 }, { 1437, 39.35, 46.84 }, { 1437, 44.84, 44.34 }, { 1437, 46.76, 44.17 }, { 1437, 44.66, 42.26 }, { 1437, 48.43, 47.04 }, { 1437, 46.83, 48.26 }, { 1437, 51.03, 47.46 }, { 1437, 52.04, 45.05 } }, -- level 29
          note = "With the coming hand-ins, this brings you to level 29." },
        { complete = 275, -- level 29
          note = "These foes hide in stealth. Most often found in or beside water." },
        { turnin = 275 }, -- level 29
        { turnin = 98283 }, -- level 29
        { accept = 631 }, -- level 29
        { turnin = 472 }, -- level 29
        { go = { 1437, 51.31, 8.08 }, text = "Take the door on the bridge, then descend the steps" }, -- level 29
        { turnin = 631, accept = 632, -- level 29
          note = "Be ready for a fight right away. The object is on the lower level within the bridge." },
        { turnin = 632, accept = 633 }, -- level 29
        { go = { 1437, 50.6, 8.48 }, text = "Leap from the span and splash down below" }, -- level 29
        { collect = { { 4433, 1 } }, -- level 29
          note = "Look for a pale, rolled scroll. A dwarf corpse grips it. Your targets sit below the water's surface." },
        { accept = 637, useitem = 4433 }, -- level 29
        { complete = 633 }, -- level 29
        { turnin = 633, accept = 634 }, -- level 29
        { accept = 98291 }, -- level 29
        { complete = 98291 }, -- level 29
        { turnin = 98291 }, -- level 29
        { accept = 95646 }, -- level 29
        { complete = 95646 }, -- level 29
        { turnin = 95646 }, -- level 29
        { turnin = 634 }, -- level 29
        { go = { 1417, 45.81, 46.15 }, fly = true, talk = 2835, text = "Fly to Refuge Pointe" }, -- level 29
        { go = { 1424, 49.4, 52.21 }, fly = true, talk = 2432, text = "Flight master at Southshore" }, -- level 29
        { accept = 98059 }, -- level 29
        { turnin = 98059 }, -- level 29
        { collect = { { 3712, 10 } }, keep = 3712, -- level 29
          note = "The targets are turtles. Head north, keeping to the riverbank." },
        { go = { 1422, 42.98, 85.09 }, fly = true, talk = 12596, text = "Flight master at Chillwind Camp", -- level 29
          note = "Keep to the road the whole way." },
        { turnin = 292, when = { log = 292 }, -- level 29
          note = "The NPC is indoors." },
        { accept = 293, when = { done = 292 } }, -- level 29
        { accept = 98216 }, -- level 29
        { complete = 98216 }, -- level 29
        { turnin = 98216 }, -- level 29
        { accept = 321, elite = true }, -- level 29
        { turnin = 321, elite = true }, -- level 29
        { accept = 324, elite = true }, -- level 29
        { complete = 324, elite = true }, -- level 29
        { turnin = 324, elite = true }, -- level 29
        { accept = 322, elite = true }, -- level 29
    },
})
