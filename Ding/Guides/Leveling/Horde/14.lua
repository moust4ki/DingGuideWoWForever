-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/14.lua.
-- Simulated (warrior): Orc 33 (7%) -> 34 (9%) in 3 h 52, 16 quests turned in; Scourge 33 (7%) -> 34 (9%) in 3 h 52, 16 quests turned in; Tauren 33 (7%) -> 34 (10%) in 3 h 52, 17 quests turned in; Troll 33 (7%) -> 34 (9%) in 3 h 52, 16 quests turned in; Skyborne 33 (7%) -> 34 (9%) in 3 h 52, 16 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h14-thousand-needles",
    title    = "Thousand Needles (33-34)",
    faction  = "Horde",
    minLevel = 33, maxLevel = 34,
    next     = "leveling-h15-desolace",
    steps    = {
        { go = { 1441, 54.64, 44.81 }, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, text = "Climb the trail", -- level 33
          note = "Thousand Needles: Freewind Post, on the mesas in the middle of the zone." },
        { turnin = 1531, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 33
        { turnin = 1146, accept = 1147 }, -- level 33
        { turnin = 1112 }, -- level 33
        { accept = { 1110, 1114 }, -- level 33
          note = "Wait for the talking to finish" },
        { turnin = 1114, accept = 1104 }, -- level 33
        { accept = 1115 }, -- level 33
        { accept = 1105 }, -- level 33
        { accept = 1176 }, -- level 33
        { accept = 1175 }, -- level 33
        { complete = 1147, -- level 33
          note = "Hive Drones compete for these spawn points. Your targets are within the cavern." },
        { go = { 1441, 66.29, 86.12 }, text = "Head out of the cave" }, -- level 33
        { complete = 1147, -- level 33
          note = "The targets are out in front of the cavern." },
        { accept = 1148, collect = { { 5877, 1 } }, useitem = 5877, sticky = 1148, when = { log = 1147 }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { accept = 1148, collect = { { 5877, 1 } }, useitem = 5877, when = { done = 1147 }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { accept = 1148, collect = { { 5877, 1 } }, useitem = 5877, when = { log = 1148 }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { accept = 1148, collect = { { 5877, 1 } }, useitem = 5877, when = { done = 1148 }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { complete = 1147, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1441, 66.29, 86.12 }, when = { log = 1148 }, text = "Head out of the cave" }, -- level 33
        { complete = 1148, sticky = { 1105, 1104, 1175, 1110 }, when = { log = 1148 }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1441, 66.29, 86.12 }, text = "Head out of the cave" }, -- level 33
        { complete = 1175 }, -- level 33
        { complete = 1176, -- level 33
          note = "Hunt the vultures. This spot has most of them; elsewhere they are rare. Return here as you do your other quests." },
        { complete = 1105, -- level 33
          note = "The targets are turtles." },
        { complete = 1104, -- level 33
          note = "The foes here are scorpions." },
        { complete = 1175 }, -- level 33
        { complete = 1175 }, -- level 33
        { complete = 1110, -- level 33
          note = "Look for assorted mechanical pieces. Parts lie all across the Shimmering Flats." },
        { turnin = 1147 }, -- level 33
        { turnin = 1110, accept = 5762 }, -- level 33
        { turnin = 1104 }, -- level 33
        { turnin = 1105 }, -- level 33
        { accept = 1106 }, -- level 33
        { turnin = 1176, accept = 1178 }, -- level 33
        { turnin = 1175 }, -- level 33
        { level = 34, patrol = { { 1441, 82.85, 55.16 }, { 1441, 83.64, 58.16 }, { 1441, 82.45, 61.03 }, { 1441, 85.37, 62.45 }, { 1441, 82.74, 66.46 }, { 1441, 82.46, 70.17 }, { 1441, 79.45, 70.16 }, { 1441, 76.24, 71.74 }, { 1441, 75.97, 67.84 }, { 1441, 74.76, 64.86 }, { 1441, 72.44, 61.44 }, { 1441, 69.14, 59.83 }, { 1441, 72.26, 57.35 }, { 1441, 75.26, 57.64 }, { 1441, 77.24, 54.45 }, { 1441, 78.16, 52.17 }, { 1441, 81.14, 52.34 }, { 1441, 79.03, 56.54 }, { 1441, 74.16, 53.43 }, { 1441, 71.26, 54.37 }, { 1441, 69.44, 64.45 }, { 1441, 69.76, 67.43 }, { 1441, 72.06, 69.37 }, { 1441, 86.74, 70.05 }, { 1441, 86.57, 57.46 } } }, -- level 33
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 33
        { accept = 5361, -- level 34
          note = "This one roams, so scan the surrounding area." },
        { turnin = 1148, accept = 1184 }, -- level 34
        { turnin = 97003 }, -- level 34
        { destroy = 5877 }, -- level 34
        { turnin = 1178, accept = 1180, -- level 34
          note = "The NPC is indoors, one floor up." },
        { turnin = 92706, races = { "Tauren" } }, -- level 34
        { turnin = 96, when = { log = 96 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 34
        { turnin = 1180, accept = 1181 }, -- level 34
        { accept = 575, -- level 34
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
        { accept = 605, -- level 34
          note = "The NPC is on the building's ground level." },
        { turnin = 1115, accept = 201, -- level 34
          note = "Climb to the highest floor of the building." },
        { accept = { 189, 213 }, -- level 34
          note = "Climb to the highest floor of the building." },
        { turnin = 1181, accept = 1182, -- level 34
          note = "The NPC is upstairs, out on the balcony." },
        { go = { 1434, 26.84, 77.15 }, fly = true, talk = 2858, text = "Fly to Booty Bay", -- level 34
          note = "The NPC is upstairs, out on the balcony." },
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 34
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 34
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 34
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 34
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 34
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 34
          note = "The NPC is indoors." },
        { turnin = 1184 }, -- level 34
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 34
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 34
          note = "The NPC stands on the highest level of this structure." },
        { talk = 3309, bank = { 5827, 14542 }, -- level 34
          note = "The NPC is indoors." },
        { sethearth = "Orgrimmar", talk = 6929, -- level 34
          note = "The NPC is indoors." },
        { accept = 2841, dungeon = "Gnomeregan", -- level 34
          note = "The NPC is indoors." },
        { accept = 2842, dungeon = "Gnomeregan", talk = 3413, -- level 34
          note = "The NPC is indoors." },
        { turnin = 2842, accept = 2843, dungeon = "Gnomeregan" }, -- level 34
        { complete = 2843, dungeon = "Gnomeregan", -- level 34
          note = "Wait for the talking to finish" },
        { turnin = 2843, dungeon = "Gnomeregan" }, -- level 34
        { accept = 2904, dungeon = "Gnomeregan", -- level 34
          note = "The quest giver is in the Dormitory." },
        { complete = 2904, dungeon = "Gnomeregan", -- level 34
          note = "Escort Kernobee to the portal at the dungeon's mouth." },
        { complete = 2841, dungeon = "Gnomeregan", -- level 34
          note = "The target is the dungeon's last boss." },
        { complete = 2841, dungeon = "Gnomeregan", -- level 34
          note = "Open the gray chest built of metal. Close to the north wall. It shares a chamber with Mekgineer Thermaplugg." },
        { accept = 2945, dungeon = "Gnomeregan", useitem = 9326, when = { item = 9326 } }, -- level 34
        { turnin = 2945, accept = { 2949, 2952 }, dungeon = "Gnomeregan", object = 142487, when = { log = 2945 }, -- level 34
          note = "The machine you need is in the Dormitory. It can take more than one to get it." },
        { turnin = 2952, dungeon = "Gnomeregan", when = { log = 2945 } }, -- level 34
        { turnin = 2945, accept = { 2949, 2952 }, dungeon = "Gnomeregan", object = 142487, when = { done = 2945 }, -- level 34
          note = "The machine you need is in the Dormitory. It can take more than one to get it." },
        { turnin = 2952, dungeon = "Gnomeregan", when = { done = 2945 } }, -- level 34
        { turnin = 2904, dungeon = "Gnomeregan" }, -- level 34
        { turnin = 2841, dungeon = "Gnomeregan", -- level 34
          note = "The NPC is indoors." },
        { turnin = 2949, dungeon = "Gnomeregan", when = { log = 2949 } }, -- level 34
    },
})
