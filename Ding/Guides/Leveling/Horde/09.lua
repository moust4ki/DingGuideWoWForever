-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/09.lua.
-- Simulated (warrior): Orc 25 (89%) -> 26 (65%) in 2 h 26, 5 quests turned in; Scourge 25 (89%) -> 26 (65%) in 2 h 26, 5 quests turned in; Tauren 25 (86%) -> 26 (62%) in 2 h 26, 5 quests turned in; Troll 25 (89%) -> 26 (65%) in 2 h 26, 5 quests turned in; Skyborne 25 (90%) -> 26 (76%) in 2 h 34, 7 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h09-stonetalon-mountains",
    title    = "Stonetalon Mountains (25-26)",
    faction  = "Horde",
    minLevel = 25, maxLevel = 26,
    next     = "leveling-h10-ashenvale",
    steps    = {
        { go = { 1442, 45.94, 60.42 }, text = "Travel to Sun Rock Retreat", -- level 25
          note = "Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone." },
        { accept = 1087, elite = true }, -- level 25
        { accept = 6301, elite = true }, -- level 25
        { accept = { 5881, 6282 } }, -- level 25
        { accept = 86576 }, -- level 25
        { go = { 1442, 49.25, 61.94 }, text = "Climb the trail" }, -- level 25
        { accept = 6393, races = { "Orc", "Tauren", "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { accept = 6393, races = { "Scourge", "Skyborne" } }, -- level 25
        { accept = 1096, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 25
          note = "The NPC is indoors." },
        { complete = 1086, useitem = 5638, -- level 25
          note = "The target is beneath the platform." },
        { go = { 1442, 68.91, 39.61 }, text = "Climb the trail" }, -- level 25
        { complete = 1096, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 25
          note = "The target stands atop the timber platform. The targets are spread over several spots." },
        { turnin = 1096, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 25
          note = "The NPC is indoors." },
        { go = { 1442, 60.52, 70.16 }, text = "Exit Windshear Crag" }, -- level 25
        { complete = 6393, races = { "Orc", "Tauren", "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 25
          note = "The targets are flame elementals. When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { complete = 6393, races = { "Scourge", "Skyborne" } }, -- level 25
        { accept = 79980, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" } }, -- level 26
        { turnin = 79980, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" } }, -- level 26
        { complete = 1058, sticky = 1058, -- level 25
          note = "The targets are deer." },
        { complete = 1058, -- level 26
          note = "The targets are tiny blue dragons. They are rare and scattered widely." },
        { complete = 1058, sticky = 1087, -- level 26
          note = "Hunt the green slimes. Corrosive Sap Beasts use the same spawn points." },
        { complete = 1058, -- level 26
          note = "The beasts are leopards with blue fur." },
        { complete = 1087, elite = true, -- level 26
          note = "Do not engage Sentinel Amarassan. The quarry is a kaldorei elite, level 27." },
        { go = { 1442, 41.57, 16.04 }, elite = true, text = "Exit Stonetalon Peak" }, -- level 26
        { complete = 6301, elite = true, sticky = 6282, -- level 26
          note = "Look for brown pinecones on the ground. Steer clear of the elite windstrider." },
        { complete = 6393, races = { "Orc", "Tauren", "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 26
          note = "The targets are flame elementals. Basilisks and moving tree creatures share these spawn points." },
        { complete = 6393, races = { "Scourge", "Skyborne" } }, -- level 26
        { complete = 6282 }, -- level 26
        { complete = 86576 }, -- level 26
        { complete = 6282 }, -- level 26
        { complete = 6282 }, -- level 26
        { complete = 6282 }, -- level 26
        { level = 26, patrol = { { 1442, 32.63, 67.36 }, { 1442, 35.65, 65.63 }, { 1442, 36.25, 70.34 }, { 1442, 35.34, 73.46 }, { 1442, 32.46, 73.56 }, { 1442, 29.45, 72.45 }, { 1442, 27.96, 66.16 }, { 1442, 28.43, 63.17 }, { 1442, 34.43, 59.95 } }, -- level 26
          note = "Monsters are found throughout the Charred Vale." },
        { go = { 1442, 37.98, 68 }, text = "Take the trail toward Sun Rock Retreat" }, -- level 26
        { turnin = 6393, races = { "Orc", "Tauren", "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" }, -- level 26
          note = "This one roams, so scan the surrounding area." },
        { turnin = 6393, races = { "Scourge", "Skyborne" } }, -- level 26
        { turnin = 86576 }, -- level 26
        { turnin = 6282 }, -- level 26
        { turnin = 6301, elite = true }, -- level 26
        { accept = 6381, elite = true }, -- level 26
        { turnin = 1087, elite = true }, -- level 26
        { go = { 1442, 44.68, 61.78 }, text = "Stay on the trail until the Charred Vale" }, -- level 26
        { complete = 6381, elite = true }, -- level 26
        { go = { 1442, 37.98, 68 }, text = "Take the trail toward Sun Rock Retreat" }, -- level 26
        { turnin = 6381, elite = true }, -- level 26
        { turnin = 1058, -- level 26
          note = "Your objective lies in a little cavern." },
        { go = { 1442, 72.96, 93.68 }, text = "Climb the trail across the mountains" }, -- level 26
        { turnin = 1068 }, -- level 26
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 26
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 26
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 26
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 26
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 26
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 26
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 26
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 26
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 26
          note = "The NPC stands on the highest level of this structure." },
    },
})
