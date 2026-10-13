-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/06.lua.
-- Simulated (warrior): Orc 22 (11%) -> 22 (33%) in 44 min, 5 quests turned in; Scourge 22 (11%) -> 22 (33%) in 44 min, 5 quests turned in; Tauren 22 (7%) -> 22 (30%) in 44 min, 5 quests turned in; Troll 22 (11%) -> 22 (33%) in 44 min, 5 quests turned in; Skyborne 22 (18%) -> 22 (40%) in 44 min, 4 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h06-ashenvale",
    title    = "Ashenvale (21-22)",
    faction  = "Horde",
    minLevel = 21, maxLevel = 22,
    next     = "leveling-h07-hillsbrad-foothills",
    steps    = {
        { go = { 1442, 78.31, 42.46 }, text = "Take the passage and trace the lantern trail into Ashenvale", -- level 22
          note = "Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon. Stay clear of Astranaar." },
        { go = { 1442, 81.58, 30.07 }, text = "Exit the tunnel into Ashenvale" }, -- level 22
        { go = { 1440, 12.29, 33.86 }, fly = true, talk = 11901, text = "Flight master at Zoram'gar Outpost" }, -- level 22
        { turnin = 6562, -- level 22
          note = "The NPC is indoors." },
        { accept = 216 }, -- level 22
        { accept = 6442, -- level 22
          note = "The NPC is indoors." },
        { accept = 6462, -- level 22
          note = "The NPC is indoors." },
        { complete = 6442, -- level 22
          note = "Hunt naga." },
        { level = 22, patrol = { { 1440, 12.44, 29.23 }, { 1440, 14.06, 26.57 }, { 1440, 11.83, 25.86 }, { 1440, 13.05, 24.24 }, { 1440, 15.17, 22.37 }, { 1440, 14.17, 20.44 }, { 1440, 15.77, 16.24 }, { 1440, 12.75, 15.25 }, { 1440, 9.37, 27.84 } } }, -- level 22
        { turnin = 6442, -- level 22
          note = "The NPC is indoors." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 22
        { talk = 8356, bank = 5059, -- level 22
          note = "The NPC is indoors." },
        { train = true, talk = 3040, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 22
          note = "The NPC is indoors." },
        { train = true, talk = 3043, classes = { "WARRIOR" }, -- level 22
          note = "The NPC is indoors." },
        { go = { 1454, 81.5, 19.65 }, classes = { "WARRIOR" } }, -- level 22
        { turnin = 96874, races = { "Scourge" } }, -- level 22
        { turnin = 96874, races = { "Tauren" } }, -- level 22
        { turnin = 96874, races = { "Orc", "Troll" } }, -- level 22
        { talk = 2704, classes = { "WARRIOR" }, -- level 22
          note = "The NPC is indoors." },
        { turnin = 1063, -- level 22
          note = "The quest giver waits in the tent." },
        { accept = 1064, -- level 22
          note = "Let the conversation play out. The quest giver waits in the tent." },
        { go = { 1456, 29.77, 29.79 }, text = "Go into the cavern" }, -- level 22
        { turnin = 1064, accept = 1065, -- level 22
          note = "Your targets are within the cavern." },
        { train = true, talk = 3045, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 22
          note = "Your targets are within the cavern." },
        { go = { 1456, 29.77, 29.79 }, races = { "Troll" }, classes = { "PRIEST" }, text = "Head out of the cave" }, -- level 22
        { turnin = 5642, races = { "Troll" }, classes = { "PRIEST" }, -- level 22
          note = "The NPC is indoors." },
        { train = true, talk = 3047, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 22
          note = "Your targets are within the cavern." },
        { go = { 1456, 29.77, 29.79 }, races = { "Scourge", "Troll" }, classes = { "MAGE" }, text = "Head out of the cave" }, -- level 22
        { talk = 5958, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 22
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1456, 29.77, 29.79 }, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, text = "Head out of the cave", -- level 22
          note = "The NPC is indoors." },
        { train = true, talk = 3030, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" } }, -- level 22
        { go = { 1456, 29.77, 29.79 }, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, text = "Head out of the cave" }, -- level 22
        { turnin = 1511, accept = 1515, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" } }, -- level 22
        { turnin = 1515, accept = 1512, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 22
          note = "The NPC waits within the hut." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 22
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 22
          note = "This NPC is found down in the Cleft of Shadow." },
        { turnin = 1512, accept = 1513, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 22
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { complete = 1513, useitem = 6626, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 22
          note = "Step onto the pink rune. The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { turnin = 1513, when = { ready = 1513 }, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 22
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { go = { 1456, 29.77, 29.79 }, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, text = "Head out of the cave", -- level 22
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 22
        { accept = 2460, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { complete = 2460, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Let the conversation play out. The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { turnin = 2460, when = { ready = 2460 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { accept = 2458, when = { done = 2460 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 22
        { complete = 2458, useitem = 8051, when = { log = 2458 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Use it twice on Taskmaster Fizzule. A short way north of here. Target Taskmaster Fizzule and salute him." },
        { turnin = 2458, when = { log = 2458 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 22
        { accept = 2478, when = { done = 2458 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 22
        { complete = 2478, when = { log = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Rob Foreman Silixiz with Pick Pocket." },
        { complete = 2478, when = { log = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Open with Ambush for a bigger hit. The NPC is indoors at street level." },
        { complete = 2478, when = { log = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Lean on Rupture for bonus damage. The NPC is indoors, on the central storey." },
        { complete = 2478, when = { log = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Eviscerate adds a burst of damage here. The objective is on the terrace above. The NPC is indoors, on the central storey." },
        { complete = 2478, when = { log = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Open with Ambush for a bigger hit. Climb to the highest floor of the building." },
        { complete = 2478, when = { log = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Use Pick Lock to open it. Climb to the highest floor of the building." },
        { turnin = 2478, when = { ready = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { accept = 2479, when = { done = 2478 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 22
        { destroy = { 8051, 8066 }, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 22
        { vendor = true, talk = 3334, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 22
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow. Poison crafting needs these." },
        { go = { 1456, 29.77, 29.79 }, races = { "Tauren" }, classes = { "DRUID" }, text = "Head out of the cave" }, -- level 22
        { collect = { { 15883, 1 } }, spots = { { 1413, 56.64, 8.28 } }, races = { "Tauren" }, classes = { "DRUID" }, -- level 22
          note = "Your targets sit below the water's surface." },
    },
})
