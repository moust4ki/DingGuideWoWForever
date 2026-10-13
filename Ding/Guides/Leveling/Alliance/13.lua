-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/13.lua.
-- Simulated (warrior): Human 30 (4%) -> 31 (20%) in 4 h 04, 24 quests turned in; Dwarf 30 (4%) -> 31 (25%) in 4 h 05, 26 quests turned in; NightElf 30 (8%) -> 31 (39%) in 4 h 20, 27 quests turned in; Gnome 30 (4%) -> 31 (25%) in 4 h 05, 26 quests turned in; Skyborne 30 (1%) -> 31 (33%) in 4 h 23, 27 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a13-stonetalon-mountains-and-ashenvale",
    title    = "Stonetalon and Ashenvale (29-30)",
    faction  = "Alliance",
    minLevel = 29, maxLevel = 30,
    next     = "leveling-a14-duskwood-and-stranglethorn-vale",
    steps    = {
        { go = { 1442, 37.1, 8.1 }, text = "Travel to Stonetalon Peak", -- level 30
          note = "Stonetalon Mountains: Stonetalon Peak, in the far north of the zone." },
        { accept = 1057, sticky = 1057 }, -- level 30
        { turnin = 79192, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 30
        { accept = 79980 }, -- level 30
        { turnin = 79980 }, -- level 30
        { complete = 1057 }, -- level 30
        { complete = 1057 }, -- level 30
        { complete = 1057 }, -- level 30
        { complete = 1057 }, -- level 30
        { go = { 1443, 67.44, 15.7 }, text = "Take the road, then climb the trail into Nijel's Point" }, -- level 30
        { go = { 1443, 64.62, 10.6 }, fly = true, talk = 6706, text = "Fly to Nijel's Point" }, -- level 30
        { turnin = 1057, accept = 1059 }, -- level 30
        { accept = 1140 }, -- level 30
        { accept = 1022 }, -- level 30
        { accept = 1021 }, -- level 30
        { accept = 4581 }, -- level 30
        { accept = 1024, -- level 30
          note = "The NPC is indoors. The quest is gray, yet the later ones in the chain award plenty of XP." },
        { accept = 1035, -- level 30
          note = "The NPC is indoors." },
        { go = { 1440, 50.28, 56.29 }, text = "Take the road until this trail" }, -- level 30
        { go = { 1440, 51.76, 45.67 }, text = "Keep on the trail" }, -- level 30
        { turnin = 1024, accept = 1026 }, -- level 30
        { collect = { { 5475, 1 } }, spots = { { 1440, 62.54, 46.77 }, { 1440, 54.57, 34.03 }, { 1440, 55.06, 40.56 }, { 1440, 56.85, 29.86 }, { 1440, 58.36, 36.45 }, { 1440, 59.84, 39.45 }, { 1440, 61.45, 43.24 } }, -- level 30
          note = "Fight the treants. Circle the mountain on foot." },
        { complete = 1026 }, -- level 30
        { go = { 1440, 54.14, 32.39 }, text = "Head uphill on the trail and across the passage" }, -- level 30
        { complete = 1022 }, -- level 30
        { go = { 1440, 51.27, 38.15 }, text = "Exit the Howling Vale by the tunnel" }, -- level 30
        { go = { 1440, 63.61, 43.84 }, text = "Climb the trail" }, -- level 30
        { turnin = 1021, accept = 1031 }, -- level 30
        { accept = 98418, races = { "NightElf", "Skyborne" } }, -- level 30
        { complete = 98418, races = { "NightElf", "Skyborne" } }, -- level 30
        { turnin = 4581, accept = 1011, -- level 30
          note = "This one roams, so scan the surrounding area." },
        { turnin = 1022, accept = 1037 }, -- level 30
        { turnin = 1031, when = { ready = 1031 } }, -- level 30
        { accept = 1032, when = { done = 1031 } }, -- level 30
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 30
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 30
          note = "You will tame a short-term pet shortly. You pick up Claw (Rank 4) here." },
        { go = { 1440, 61.64, 63.55 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 30
          note = "Tame any Elder Ashenvale Bear with Tame Beast." },
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 30
        { talk = 10052, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 30
          note = "Release the short-term pet you tamed." },
        { go = { 1440, 50.28, 56.29 }, text = "Take the road until this trail" }, -- level 30
        { go = { 1440, 51.76, 45.67 }, text = "Keep on the trail" }, -- level 30
        { turnin = 1026, accept = 1027 }, -- level 30
        { accept = 98027, races = { "Dwarf", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 30
        { accept = 98027, races = { "NightElf" } }, -- level 30
        { complete = 1035 }, -- level 30
        { complete = 1027, -- level 30
          note = "They show up lying on the ground." },
        { complete = 1011, -- level 30
          note = "Beware of foes lurking in stealth." },
        { turnin = 98418, races = { "NightElf", "Skyborne" } }, -- level 30
        { turnin = 1011, sticky = 1032, -- level 30
          note = "This one roams, so scan the surrounding area." },
        { complete = 1140, -- level 30
          note = "Beware of foes lurking in stealth." },
        { go = { 1440, 71.33, 49.58 }, text = "Climb the trail" }, -- level 30
        { complete = 1140, -- level 30
          note = "Beware of foes lurking in stealth." },
        { complete = 1032, when = { log = 1032 }, -- level 30
          note = "Hunt down satyrs. Beware of foes lurking in stealth." },
        { go = { 1440, 50.28, 56.29 }, text = "Take the road until this trail" }, -- level 30
        { go = { 1440, 51.76, 45.67 }, text = "Keep on the trail" }, -- level 30
        { turnin = 1027 }, -- level 30
        { accept = 1028, -- level 30
          note = "Let the conversation play out." },
        { go = { 1440, 56.1, 51.31 }, text = "Circle the peak, then climb the twisting dirt trail to the shrine" }, -- level 30
        { turnin = 1028, accept = 1055, object = 19024, -- level 30
          note = "The object is up on the summit." },
        { go = { 1440, 51.76, 45.67 }, text = "Circle the mountain, then stay on the trail" }, -- level 30
        { turnin = 1055, accept = 1029 }, -- level 30
        { turnin = 1035, -- level 30
          note = "The NPC is indoors." },
        { turnin = 98027, races = { "Dwarf", "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 30
        { turnin = 98027, races = { "NightElf" } }, -- level 30
        { turnin = 1029, accept = 1030, -- level 30
          note = "The NPC is indoors." },
        { train = true, talk = 3963, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 30
          note = "The NPC is indoors." },
        { train = true, talk = 4320, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 30
          note = "The NPC is indoors." },
        { useitem = 5462, -- level 30
          note = "Stand on the marked point, then apply the item." },
        { go = { 1440, 53.72, 73.91 }, text = "Obtain Furbolg Form" }, -- level 30
        { turnin = 1030, accept = 1045, sticky = 1045 }, -- level 30
        { go = { 1440, 55.38, 75.8 }, text = "Climb the trail" }, -- level 30
        { complete = 1045, collect = { { 5388, 1 } } }, -- level 30
        { complete = 1045 }, -- level 30
        { useitem = 5462, -- level 30
          note = "Stand on the marked point, then apply the item." },
        { go = { 1440, 53.72, 73.91 }, text = "Obtain Furbolg Form" }, -- level 30
        { turnin = 1045, accept = 1046 }, -- level 30
        { accept = 86757 }, -- level 30
        { complete = 86757 }, -- level 30
        { turnin = 86757 }, -- level 30
        { turnin = 1046, when = { item = 5462, log = 1046 }, -- level 30
          note = "The NPC is indoors." },
        { turnin = 1032, when = { log = 1032 } }, -- level 30
        { turnin = 1140 }, -- level 31
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 31
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 31
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 31
        { turnin = 1037, accept = 1038 }, -- level 31
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 31
        { go = { 1457, 56.08, 79.12 }, text = "Head up the incline" }, -- level 31
        { go = { 1457, 57.66, 77.28 }, text = "Walk over the span" }, -- level 31
        { complete = 1038, -- level 31
          note = "The object is indoors, one floor up." },
        { talk = 4165, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 31
          note = "The NPC is indoors." },
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 31
          note = "The NPC is indoors." },
        { turnin = 1038, accept = 1039 }, -- level 31
        { accept = 2928, dungeon = "Gnomeregan" }, -- level 31
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 31
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 31
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 31
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 31
          note = "The NPC is indoors." },
        { turnin = 637 }, -- level 31
        { accept = 683, -- level 31
          note = "Wait for the talking to finish" },
        { go = { 1455, 44.51, 49.54 }, text = "Stay on the trail" }, -- level 31
        { turnin = 683, accept = 686 }, -- level 31
        { turnin = 686, accept = 689, -- level 31
          note = "The NPC is indoors." },
        { accept = 1179, -- level 31
          note = "The NPC is indoors." },
        { accept = 2924, dungeon = "Gnomeregan" }, -- level 31
        { turnin = 2923, dungeon = "Gnomeregan", when = { log = 2923 } }, -- level 31
        { accept = 2922, dungeon = "Gnomeregan" }, -- level 31
        { accept = 2927, dungeon = "Gnomeregan" }, -- level 31
        { accept = 2930, dungeon = "Gnomeregan", races = { "Human", "Dwarf", "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 31
        { accept = 2930, dungeon = "Gnomeregan", races = { "NightElf", "Skyborne" } }, -- level 31
        { accept = 2929, dungeon = "Gnomeregan", races = { "Dwarf" }, classes = { "MAGE" } }, -- level 31
        { accept = 2929, dungeon = "Gnomeregan", races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 31
        { accept = 2929, dungeon = "Gnomeregan", races = { "Human" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "WARLOCK", "DRUID" } }, -- level 31
        { accept = 2929, dungeon = "Gnomeregan", races = { "NightElf" } }, -- level 31
        { turnin = 2927, accept = 2926, dungeon = "Gnomeregan", -- level 31
          note = "The NPC is indoors." },
        { dungeon = "Gnomeregan", collect = { { 9279, 1 } }, -- level 31
          note = "The foes are gnomes. In Gnomeregan's outer halls, not in the instance itself." },
        { complete = 2922, dungeon = "Gnomeregan", -- level 31
          note = "Take the lift down, then head north. In Gnomeregan's outer halls, not in the instance itself." },
        { dungeon = "Gnomeregan", collect = { { 9280, 1 } }, -- level 31
          note = "The NPC is atop the raised platform. It sits a short distance southward from Techbot. In Gnomeregan's outer halls, not in the instance itself." },
        { complete = 2926, dungeon = "Gnomeregan", useitem = 9283, sticky = { 2928, 2924 }, -- level 31
          note = "Use it on foes that are Irradiated. The targets are troggs with a green glow. In Gnomeregan's outer halls, not in the instance itself." },
        { dungeon = "Gnomeregan", collect = { { 9282, 1 } }, -- level 31
          note = "Inside The Hall of Gears, stick to the top tiers. Take the trail southwest into The Dormitory. By the wall on The Dormitory's lower floor." },
        { dungeon = "Gnomeregan", collect = { { 6893, 1 } }, -- level 31
          note = "The target is the third boss you meet." },
        { dungeon = "Gnomeregan", collect = { { 9281, 1 } }, -- level 31
          note = "The target sits on the raised deck beside Electrocutioner 6000." },
        { complete = 2930, dungeon = "Gnomeregan", races = { "Human", "Dwarf", "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 31
        { complete = 2930, dungeon = "Gnomeregan", races = { "NightElf", "Skyborne" }, -- level 31
          note = "In the Engineering Labs, on the lowest floor. The objective is next to Crowd Pummeler 9-60. Keep to Launch Bay's top floor." },
        { complete = 2928, dungeon = "Gnomeregan", -- level 31
          note = "You'll find them all over the instance." },
        { complete = 2924, dungeon = "Gnomeregan", -- level 31
          note = "Look for boxy, standing devices. You'll find them all over the instance." },
        { complete = 2929, dungeon = "Gnomeregan", races = { "Dwarf" }, classes = { "MAGE" } }, -- level 31
        { complete = 2929, dungeon = "Gnomeregan", races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 31
        { complete = 2929, dungeon = "Gnomeregan", races = { "Human" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "WARLOCK", "DRUID" } }, -- level 31
        { complete = 2929, dungeon = "Gnomeregan", races = { "NightElf" }, -- level 31
          note = "The target is the dungeon's last boss." },
        { dungeon = "Gnomeregan", useitem = 9326, when = { item = 9326 } }, -- level 31
        { accept = 2945, dungeon = "Gnomeregan", when = { item = 9326 }, races = { "NightElf" }, classes = { "MAGE" } }, -- level 31
        { turnin = 2945, accept = { 2947, 2952 }, dungeon = "Gnomeregan", object = 142487, when = { log = 2945 }, -- level 31
          note = "The machine you need is in the Dormitory. It can take more than one to get it." },
        { turnin = 2952, dungeon = "Gnomeregan", when = { log = 2945 } }, -- level 31
        { turnin = 2945, accept = { 2947, 2952 }, dungeon = "Gnomeregan", object = 142487, when = { done = 2945 }, -- level 31
          note = "The machine you need is in the Dormitory. It can take more than one to get it." },
        { turnin = 2952, dungeon = "Gnomeregan", when = { done = 2945 } }, -- level 31
        { turnin = 2926, dungeon = "Gnomeregan", -- level 31
          note = "The NPC is indoors." },
        { talk = 8720, collect = { { 2842, 1 }, { 1206, 1 } }, -- level 31
          note = "The NPC is indoors." },
        { turnin = 2947, dungeon = "Gnomeregan", when = { log = 2947 } }, -- level 31
        { accept = 2948, dungeon = "Gnomeregan", when = { item = { { 2842, 1 }, { 1206, 1 } } } }, -- level 31
        { accept = 2948, dungeon = "Gnomeregan", when = { item = { { 2842, 1 }, { 1206, 1 } } } }, -- level 31
        { turnin = 2948, dungeon = "Gnomeregan", when = { log = 2948, ready = 2948 } }, -- level 31
        { turnin = 2924, dungeon = "Gnomeregan" }, -- level 31
        { turnin = 2922, dungeon = "Gnomeregan" }, -- level 31
        { turnin = 2930, dungeon = "Gnomeregan", races = { "Human", "Dwarf", "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 31
        { turnin = 2930, dungeon = "Gnomeregan", races = { "NightElf", "Skyborne" } }, -- level 31
        { turnin = 2929, dungeon = "Gnomeregan", races = { "Dwarf" }, classes = { "MAGE" } }, -- level 31
        { turnin = 2929, dungeon = "Gnomeregan", races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 31
        { turnin = 2929, dungeon = "Gnomeregan", races = { "Human" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "WARLOCK", "DRUID" } }, -- level 31
        { turnin = 2929, dungeon = "Gnomeregan", races = { "NightElf" } }, -- level 31
        { turnin = 2928, dungeon = "Gnomeregan" }, -- level 31
    },
})
