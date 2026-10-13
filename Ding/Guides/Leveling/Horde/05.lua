-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/05.lua.
-- Simulated (warrior): Orc 15 (25%) -> 22 (11%) in 12 h 42, 69 quests turned in; Scourge 15 (61%) -> 22 (11%) in 12 h 22, 65 quests turned in; Tauren 15 (47%) -> 22 (7%) in 12 h 27, 66 quests turned in; Troll 15 (25%) -> 22 (11%) in 12 h 42, 69 quests turned in; Skyborne 15 (7%) -> 22 (18%) in 13 h 10, 70 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h05-the-barrens-and-stonetalon-mountains",
    title    = "The Barrens and Stonetalon (15-21)",
    faction  = "Horde",
    minLevel = 15, maxLevel = 21,
    next     = "leveling-h06-ashenvale",
    steps    = {
        { go = { 1411, 50.84, 43.59 }, text = "Travel to Razor Hill", -- level 15
          note = "Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains." },
        { accept = 1859, races = { "Orc" }, classes = { "ROGUE" }, -- level 15
          note = "The NPC is indoors, one floor up." },
        { accept = 840 }, -- level 15
        { complete = 96874, races = { "Scourge" } }, -- level 15
        { complete = 96874, races = { "Tauren" } }, -- level 15
        { complete = 96874, races = { "Orc", "Troll" } }, -- level 15
        { accept = 97282, races = { "Skyborne" } }, -- level 15
        { complete = 97282, races = { "Skyborne" } }, -- level 15
        { turnin = 97282, races = { "Skyborne" } }, -- level 15
        { accept = 99048, races = { "Skyborne" } }, -- level 15
        { turnin = 99048, races = { "Skyborne" } }, -- level 15
        { accept = 99049, races = { "Skyborne" } }, -- level 15
        { complete = 99049, races = { "Skyborne" } }, -- level 15
        { turnin = 99049, races = { "Skyborne" } }, -- level 15
        { turnin = 840, accept = 842 }, -- level 15
        { accept = 6365, races = { "Orc", "Troll" } }, -- level 15
        { accept = 869 }, -- level 15
        { turnin = 842, accept = 844 }, -- level 15
        { accept = 870 }, -- level 15
        { accept = 871 }, -- level 15
        { go = { 1413, 51.45, 30.4 }, fly = true, talk = 3615, text = "Flight master at the Crossroads" }, -- level 15
        { turnin = 6365, accept = 6384, races = { "Orc", "Troll" } }, -- level 15
        { turnin = 6384, accept = 6385, races = { "Orc", "Troll" }, -- level 15
          note = "The NPC is indoors." },
        { turnin = 6385, accept = 6386, races = { "Orc", "Troll" }, -- level 15
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 1859, races = { "Orc" }, classes = { "ROGUE" } }, -- level 15
        { accept = 1963, races = { "Orc", "Troll" }, classes = { "ROGUE" }, -- level 15
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { turnin = 1358, accept = { 848, 1492 } }, -- level 15
        { turnin = 6386, races = { "Orc", "Troll" } }, -- level 15
        { collect = { { 4926, 1 } }, -- level 15
          note = "Move on if it is absent. You may come back for it another time." },
        { accept = 819, useitem = 4926, when = { item = 4926 } }, -- level 15
        { complete = 871, sticky = { 869, 844 } }, -- level 15
        { collect = { { 4926, 1 } }, -- level 15
          note = "If it isn't there, hold on until it shows up." },
        { useitem = 4926 }, -- level 15
        { complete = 844 }, -- level 15
        { turnin = 871, accept = { 872, 5041 } }, -- level 15
        { accept = 867, -- level 15
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 844, accept = 845, sticky = { 5041, 872, 845, 869 } }, -- level 15
        { complete = 872, -- level 15
          note = "Circle the mountain by its northern flank. This one roams, so scan the surrounding area." },
        { complete = 5041, -- level 15
          note = "Search stacks of brown crates. The targets are spread over several spots." },
        { complete = 872, sticky = { 845, 869 } }, -- level 15
        { accept = 887, -- level 15
          note = "The NPC is indoors, one floor up." },
        { accept = 97253 }, -- level 15
        { go = { 1413, 63.03, 37.19 }, fly = true, talk = 16227, text = "Flight master in Ratchet" }, -- level 15
        { accept = 894 }, -- level 15
        { destroy = 5088 }, -- level 15
        { talk = 3496, bank = { 5063, 12708 } }, -- level 15
        { accept = 895 }, -- level 15
        { turnin = 819, accept = 821, sticky = 887 }, -- level 15
        { complete = 97253 }, -- level 15
        { complete = 1963, races = { "Orc", "Troll" }, classes = { "ROGUE" }, -- level 15
          note = "The target is a troll. This one roams, so scan the surrounding area." },
        { complete = 895, -- level 15
          note = "The target is a human in a crimson long coat. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 887 }, -- level 16
        { sethearth = "Ratchet", talk = 6791, -- level 16
          note = "The NPC is indoors." },
        { talk = 3496, collect = { { 5063, 1 }, { 12708, 1 } }, spots = { { 1413, 62.58, 37.39 } } }, -- level 16
        { turnin = { 887, 895 }, accept = 890, -- level 16
          note = "The NPC is indoors, one floor up." },
        { turnin = { 1492, 890 }, accept = { 892, 896 } }, -- level 16
        { turnin = 97253 }, -- level 16
        { turnin = 892, accept = 888, -- level 16
          note = "The NPC is indoors, one floor up." },
        { turnin = { 872, 5041 }, sticky = { 821, 869 } }, -- level 16
        { complete = 845, -- level 16
          note = "The targets are the striped zhevras." },
        { turnin = 845, accept = 903 }, -- level 16
        { accept = { 855, 850 }, sticky = { 848, 855 }, -- level 16
          note = "The NPC is indoors, one floor up." },
        { complete = 870, -- level 16
          note = "Go into the water beside the rock that bubbles. Your targets sit below the water's surface." },
        { complete = 848, -- level 16
          note = "Look for big blue fungi." },
        { complete = 850, -- level 16
          note = "This one roams, so scan the surrounding area." },
        { turnin = 855, when = { ready = 855 } }, -- level 16
        { turnin = 850, accept = 851, -- level 16
          note = "The NPC is indoors, one floor up." },
        { complete = { 821, 903 } }, -- level 16
        { complete = 867, -- level 17
          note = "Kill harpies." },
        { accept = 95494, races = { "Orc", "Scourge", "Troll" } }, -- level 17
        { accept = 95507 }, -- level 17
        { complete = 95507 }, -- level 17
        { turnin = 95507 }, -- level 17
        { level = 17, sticky = { 869, 821 }, patrol = { { 1413, 40.92, 18.5 }, { 1413, 40.44, 19.35 }, { 1413, 40.15, 16.66 }, { 1413, 40.44, 14.46 } } }, -- level 17
        { turnin = 894, accept = 900 }, -- level 17
        { complete = 900, -- level 17
          note = "Up to two foes might jump you." },
        { complete = 900, -- level 17
          note = "Up to two foes might jump you." },
        { complete = 900, -- level 17
          note = "Up to two foes might jump you." },
        { turnin = 900, accept = 901 }, -- level 17
        { complete = 901, -- level 17
          note = "The NPC is indoors." },
        { turnin = 901, accept = 902 }, -- level 17
        { complete = 869, -- level 17
          note = "Kill the purple raptors. Targets are found across the entire Barrens. Slay any you come across along the way." },
        { go = { 1413, 61.58, 6.72 }, text = "Climb the trail" }, -- level 17
        { complete = 896 }, -- level 17
        { level = 17, xp = 10125, patrol = { { 1413, 61.25, 5.05 }, { 1413, 60.87, 3.86 }, { 1413, 61.84, 3.83 }, { 1413, 60.05, 3.26 } }, -- level 18
          note = "With the coming hand-ins, this gets you to level 18." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 18
        { turnin = 896 }, -- level 18
        { talk = 3496, bank = 4893 }, -- level 18
        { turnin = 902, accept = 3921 }, -- level 18
        { turnin = 848 }, -- level 18
        { turnin = 867, -- level 18
          note = "The NPC waits on the tower's highest floor." },
        { accept = 875, elite = true }, -- level 18
        { turnin = 870, accept = 877 }, -- level 18
        { turnin = 903, accept = 881 }, -- level 18
        { turnin = 869, accept = 3281 }, -- level 18
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 18
          note = "The NPC is indoors." },
        { accept = 1061, -- level 18
          note = "The NPC is indoors." },
        { accept = 97242, races = { "Skyborne" } }, -- level 18
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 18
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 18
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 18
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 18
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1454, 81.59, 19.59 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" } }, -- level 18
        { talk = 2704, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 18
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 2379, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 18
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { turnin = 1963, when = { ready = 1963 }, races = { "Orc", "Troll" }, classes = { "ROGUE" }, -- level 18
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { accept = 1858, when = { done = 1963 }, races = { "Orc", "Troll" }, classes = { "ROGUE" } }, -- level 18
        { turnin = 2379, accept = 2382, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 18
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { collect = { { 7208, 1 } }, spots = { { 1454, 53.95, 67.98 } }, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 18
          note = "Steal from Gamon using Pick Pocket. The NPC is indoors." },
        { useitem = 7208, when = { log = 1858 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 18
          note = "Use it on Tazan's Satchel. The item is already in your inventory." },
        { complete = 1858, when = { log = 1858 }, races = { "Orc", "Troll" }, classes = { "ROGUE" } }, -- level 18
        { turnin = 1858, when = { ready = 1858 }, races = { "Orc", "Troll" }, classes = { "ROGUE" }, -- level 18
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { sethearth = "The Crossroads", talk = 3934 }, -- level 18
        { turnin = 3921, accept = 3922, sticky = 3922 }, -- level 18
        { accept = 858, -- level 18
          note = "For this quest you guard an NPC on the move. If the NPC is gone, hold on until it reappears." },
        { complete = 858, -- level 18
          note = "This one roams, so scan the surrounding area. Check the upper and lower tiers of the structure." },
        { turnin = 858, accept = 863, noauto = 863, -- level 18
          note = "For this quest you guard an NPC on the move. If the NPC is gone, hold on until it reappears." },
        { complete = 863, -- level 18
          note = "Let the conversation play out. Escort Wizzlecrank's Shredder and keep it intact." },
        { complete = 3922, sticky = 821, -- level 18
          note = "Look for gray steel pails." },
        { complete = 881, useitem = 10327, -- level 18
          note = "Circle the mountain on foot. The target is a pale lion. It turns up in the area." },
        { turnin = 3922 }, -- level 18
        { destroy = 11143 }, -- level 18
        { complete = 821, -- level 18
          note = "Big birds that roam on foot." },
        { complete = 875, elite = true, -- level 18
          note = "Keep away from Sister Rathtalon. The target is a harpy with emerald plumage; beware, it is elite. The target circles in the air, so search around." },
        { turnin = 881, accept = 905 }, -- level 18
        { accept = 95774, races = { "Skyborne" } }, -- level 18
        { destroy = 10327 }, -- level 18
        { accept = 4921 }, -- level 18
        { turnin = 875, elite = true }, -- level 18
        { accept = 876, elite = true }, -- level 18
        { turnin = 2382, accept = 2381, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 18
        { talk = 7166, collect = { { 5060, 1 } }, spots = { { 1413, 63.06, 36.28 } }, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 18
        { talk = 7166, collect = { { 7970, 1 } }, spots = { { 1413, 63.06, 36.28 } }, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 18
        { turnin = 863, accept = 1483 }, -- level 18
        { talk = 3496, bank = 4894 }, -- level 18
        { accept = { 865, 1069 } }, -- level 18
        { complete = 2381, object = 123462, useitem = 7970, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 18
          note = "A small chest made of wood. The objective is on the ship's center deck. Polly is the target for the item." },
        { complete = 888 }, -- level 18
        { complete = 888, sticky = 865 }, -- level 18
        { go = { 1413, 57.32, 52.3 }, text = "Circle the mountain, then stay on the trail" }, -- level 18
        { complete = 3281 }, -- level 18
        { complete = 865, collect = { { 5165, 3 } }, spots = { { 1413, 57.24, 52.94 } }, keep = { 5165, 5055 }, sticky = 855, -- level 18
          note = "Kill the purple raptors." },
        { complete = 877, -- level 18
          note = "Your targets sit below the water's surface." },
        { complete = 851, -- level 18
          note = "Defeat Kolkar foes around Stagnant Oasis. Sooner or later a yell shows up in the chat window. Watch for his yell: I am summoned! Verog arrives after a shout dares intruders to his tent to die." },
        { complete = 905 }, -- level 18
        { complete = 905 }, -- level 18
        { complete = 905 }, -- level 18
        { destroy = 5165 }, -- level 18
        { complete = 4921, talk = 10668 }, -- level 18
        { sethearth = "Camp Taurajo", talk = 7714, -- level 18
          note = "The NPC is indoors." },
        { go = { 1413, 44.51, 59.1 }, fly = true, talk = 10378, text = "Flight master at Camp Taurajo" }, -- level 18
        { turnin = 4921, accept = 899 }, -- level 18
        { turnin = 877, accept = 880 }, -- level 18
        { destroy = 5068 }, -- level 19
        { turnin = 905, accept = 3261 }, -- level 19
        { turnin = 3281 }, -- level 19
        { turnin = 851, accept = 852, -- level 19
          note = "The NPC is indoors, one floor up." },
        { complete = 876, elite = true }, -- level 19
        { turnin = 1061, accept = 1062, -- level 19
          note = "Circle the mountain on foot." },
        { accept = 6548 }, -- level 19
        { complete = 6548 }, -- level 19
        { turnin = 6548, accept = 6629, sticky = 6629, -- level 19
          note = "Keep to the road the whole way." },
        { go = { 1442, 71.55, 88.65 }, text = "Stay on the trail" }, -- level 19
        { complete = 6629 }, -- level 19
        { complete = 6629 }, -- level 19
        { accept = 6523, noauto = 6523, -- level 19
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. The NPC is indoors." },
        { complete = 6523, -- level 19
          note = "Let the conversation play out. Escort Kaya Flathoof and keep her safe. Close to the finish, 3 foes ambush you together." },
        { accept = 6461, -- level 19
          note = "The NPC is indoors." },
        { complete = 6461, sticky = 6461, -- level 19
          note = "The targets are spiders with green bodies." },
        { go = { 1442, 45.17, 59.87 }, fly = true, talk = 4312, text = "Fly to Sun Rock Retreat" }, -- level 19
        { turnin = 1483, accept = 1093, -- level 19
          note = "The NPC is indoors." },
        { complete = 1069, -- level 19
          note = "Gather the big, white eggs. Monsters might jump you here. Hatchling spiders may bring a level 22 spider." },
        { complete = 6461, sticky = 1062, -- level 19
          note = "The targets are spiders with green bodies." },
        { complete = 1093 }, -- level 19
        { complete = 1062 }, -- level 19
        { level = 19, xp = 19650, patrol = { { 1442, 66.54, 54.95 }, { 1442, 64.83, 52.35 }, { 1442, 67.37, 50.23 }, { 1442, 64.26, 49.05 }, { 1442, 63.35, 46.04 }, { 1442, 66.74, 46.46 }, { 1442, 71.94, 50.96 }, { 1442, 69.55, 53.24 }, { 1442, 70.24, 56.36 }, { 1442, 72.95, 54.16 }, { 1442, 64.14, 57.34 }, { 1442, 61.46, 54.95 }, { 1442, 59.43, 52.36 } }, -- level 19
          note = "Together with the next turn-ins, this brings you to level 20." },
        { turnin = 1093, accept = 1094, -- level 19
          note = "The NPC is indoors." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 19
        { turnin = 3261, accept = 882 }, -- level 20
        { accept = 878, races = { "Orc", "Scourge", "Troll" }, classes = { "WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } }, -- level 20
        { accept = 878, races = { "Tauren", "Skyborne" } }, -- level 20
        { complete = 95774, races = { "Skyborne" } }, -- level 20
        { collect = { { 5099, 1 } }, -- level 20
          note = "Look for a kodo with grey hide. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { useitem = 5099 }, -- level 20
        { accept = 883, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } }, -- level 20
        { accept = 883, races = { "Tauren" }, classes = { "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK" } }, -- level 20
        { complete = 821, -- level 20
          note = "The targets are big pink lizards." },
        { complete = 899, collect = { { 5075, 1 } }, keep = { 5075, 5085 } }, -- level 20
        { complete = 878, races = { "Orc", "Scourge", "Troll" }, classes = { "WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } }, -- level 20
        { complete = 878, races = { "Tauren", "Skyborne" } }, -- level 20
        { complete = 880, -- level 20
          note = "The targets are turtles. The targets are under the water and along the shore." },
        { collect = { { 10338, 1 } }, spots = { { 1413, 60.66, 35.66 }, { 1413, 60.96, 31.84 }, { 1413, 62.63, 33.37 } } }, -- level 20
        { complete = 882, useitem = 10338, -- level 20
          note = "The target is a raptor. It shows up a short way off." },
        { complete = 95494, races = { "Orc", "Scourge", "Troll" } }, -- level 20
        { turnin = 2381, when = { ready = 2381 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 20
        { turnin = 888, -- level 20
          note = "The NPC is indoors, one floor up." },
        { turnin = 1094, accept = 1095 }, -- level 20
        { accept = 92706, races = { "Tauren" } }, -- level 20
        { talk = 3496, collect = { { 4894, 5 }, { 4893, 5 } }, spots = { { 1413, 62.58, 37.39 } } }, -- level 20
        { turnin = { 865, 1069 } }, -- level 20
        { destroy = 5570 }, -- level 20
        { turnin = 821 }, -- level 20
        { turnin = 876, elite = true }, -- level 20
        { accept = 1060, elite = true }, -- level 20
        { turnin = 899 }, -- level 20
        { turnin = 95774, races = { "Skyborne" } }, -- level 20
        { destroy = 5085 }, -- level 20
        { turnin = 880, accept = { 1489, 3301 } }, -- level 20
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 20
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 20
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 20
          note = "The NPC stands on the highest level of this structure." },
        { accept = 1528, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 20
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 20
          note = "The NPC is indoors." },
        { turnin = 1528, accept = 1530, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 20
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 20
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 1507, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 20
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 20
          note = "This NPC is found down in the Cleft of Shadow." },
        { turnin = 1507, accept = 1508, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 20
          note = "This NPC is found down in the Cleft of Shadow." },
        { turnin = 1508, accept = 1509, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" }, -- level 20
          note = "The NPC is indoors." },
        { turnin = 1509, accept = 1510, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" } }, -- level 20
        { turnin = 878, races = { "Orc", "Scourge", "Troll" }, classes = { "WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } }, -- level 20
        { turnin = 878, races = { "Tauren", "Skyborne" } }, -- level 20
        { accept = 878, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 20
        { complete = 878, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 20
        { turnin = 878, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 20
        { accept = 5052 }, -- level 20
        { turnin = 5052, when = { ready = 5052 } }, -- level 20
        { go = { 1413, 44.5, 59.27 } }, -- level 20
        { talk = 3430, -- level 20
          note = "Trade your Blood Shards to gain buffs. Trade any spare Blood Shards to him during your Barrens questing. Ask him for the Spirit of the Wind buff" },
        { turnin = 882, accept = 907 }, -- level 20
        { turnin = 883, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } }, -- level 21
        { turnin = 883, races = { "Tauren" }, classes = { "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK" } }, -- level 21
        { complete = 907, -- level 21
          note = "The targets are big pink lizards." },
        { turnin = 907, accept = 913, sticky = 913 }, -- level 21
        { turnin = 1530, accept = 1535, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 21
          note = "The quest giver waits on the hilltop." },
        { complete = 1535, useitem = 7766, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 21
        { turnin = 1535, when = { ready = 1535 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 21
          note = "The quest giver waits on the hilltop." },
        { accept = 1536, when = { done = 1535 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 21
        { complete = 913, -- level 21
          note = "Hunt the winged serpents." },
        { turnin = 913, accept = 874 }, -- level 21
        { accept = 853 }, -- level 21
        { go = { 1456, 31.81, 66.07 }, text = "Take the lift up into Thunder Bluff" }, -- level 21
        { turnin = 76156, races = { "Tauren" }, classes = { "WARRIOR", "SHAMAN", "DRUID" } }, -- level 21
        { go = { 1456, 40.99, 62.69 } }, -- level 21
        { go = { 1456, 40.99, 62.69 } }, -- level 21
        { go = { 1456, 40.99, 62.69 } }, -- level 21
        { go = { 1456, 40.99, 62.69 } }, -- level 21
        { talk = 11869 }, -- level 21
        { sethearth = "Thunder Bluff", talk = 6746, -- level 21
          note = "The NPC is indoors." },
        { go = { 1456, 46.92, 49.89 }, fly = true, talk = 2995, text = "Fly to Thunder Bluff", -- level 21
          note = "The NPC waits on the tower's highest floor." },
        { go = { 1456, 29.79, 29.85 }, text = "Go into the cavern" }, -- level 21
        { accept = 264, -- level 21
          note = "This one roams, so scan the surrounding area. Your targets are within the cavern." },
        { turnin = 853, -- level 21
          note = "Your targets are within the cavern." },
        { accept = 962, dungeon = "Wailing Caverns", -- level 21
          note = "Your targets are within the cavern." },
        { accept = 5642, races = { "Troll" }, classes = { "PRIEST" }, -- level 21
          note = "Your targets are within the cavern." },
        { accept = 5644, races = { "Scourge" }, classes = { "PRIEST" } }, -- level 21
        { go = { 1456, 29.77, 29.79 }, text = "Head out of the cave" }, -- level 21
        { turnin = 1489, accept = 1490, -- level 21
          note = "The NPC is indoors." },
        { turnin = 1490, -- level 21
          note = "The NPC is indoors." },
        { accept = 914, dungeon = "Wailing Caverns" }, -- level 21
        { accept = 27, races = { "Tauren" }, classes = { "DRUID" }, -- level 21
          note = "The NPC is indoors." },
        { turnin = 27, accept = 28, races = { "Tauren" }, classes = { "DRUID" }, -- level 21
          note = "The NPC is indoors, one floor up." },
        { complete = 28, races = { "Tauren" }, classes = { "DRUID" }, -- level 21
          note = "The object is a vase woven from wicker. Your targets sit below the water's surface. They appear in scattered spots." },
        { useitem = 15877, races = { "Tauren", "Skyborne" }, classes = { "DRUID" } }, -- level 21
        { complete = 28, races = { "Tauren" }, classes = { "DRUID" } }, -- level 21
        { turnin = 28, when = { ready = 28 }, races = { "Tauren" }, classes = { "DRUID" } }, -- level 21
        { accept = 30, when = { done = 28 }, races = { "Tauren" }, classes = { "DRUID" } }, -- level 21
        { accept = 959, dungeon = "Wailing Caverns" }, -- level 21
        { accept = 1491, dungeon = "Wailing Caverns" }, -- level 21
        { go = { 1413, 50.25, 34.44 }, dungeon = "Wailing Caverns", text = "Climb the mountainside" }, -- level 21
        { go = { 1413, 48.37, 32.96 }, dungeon = "Wailing Caverns", text = "Stay on the trail" }, -- level 21
        { go = { 1413, 47.25, 33.51 }, dungeon = "Wailing Caverns", text = "Descend the slope" }, -- level 21
        { go = { 1413, 45.94, 36.02 }, dungeon = "Wailing Caverns", text = "Drop with care onto the rock, then go into the cave" }, -- level 21
        { accept = 1487, dungeon = "Wailing Caverns", races = { "Orc" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "DRUID" } }, -- level 21
        { accept = 1487, dungeon = "Wailing Caverns", races = { "Scourge" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "MAGE", "DRUID" } }, -- level 21
        { accept = 1487, dungeon = "Wailing Caverns", races = { "Skyborne" }, -- level 21
          note = "Your targets are within the cavern." },
        { accept = 1487, dungeon = "Wailing Caverns", races = { "Tauren" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK" } }, -- level 21
        { accept = 1487, dungeon = "Wailing Caverns", races = { "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 21
        { accept = 1486, dungeon = "Wailing Caverns", races = { "Skyborne" }, -- level 21
          note = "Your targets are within the cavern." },
        { go = { 1413, 46.01, 36.27 }, dungeon = "Wailing Caverns", text = "Go into the cavern" }, -- level 21
        { complete = 959, dungeon = "Wailing Caverns", -- level 21
          note = "These foes hide in stealth. The targets are spread over several spots. Your targets are within the cavern." },
        { complete = 914, dungeon = "Wailing Caverns", -- level 21
          note = "The target is the dungeon's opening boss." },
        { complete = 914, dungeon = "Wailing Caverns", -- level 21
          note = "The target is the dungeon's second boss." },
        { complete = 914, dungeon = "Wailing Caverns", -- level 21
          note = "The target is the third boss you meet." },
        { complete = 914, dungeon = "Wailing Caverns", -- level 21
          note = "The target is the dungeon's last boss." },
        { complete = 1491, dungeon = "Wailing Caverns", -- level 21
          note = "The targets are oozes." },
        { complete = 962, dungeon = "Wailing Caverns", -- level 21
          note = "Look for little green shrubs bearing violet blooms." },
        { complete = 1486, dungeon = "Wailing Caverns", races = { "Skyborne" } }, -- level 21
        { complete = 1487, dungeon = "Wailing Caverns", races = { "Orc" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "DRUID" } }, -- level 21
        { complete = 1487, dungeon = "Wailing Caverns", races = { "Scourge" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "MAGE", "DRUID" } }, -- level 21
        { complete = 1487, dungeon = "Wailing Caverns", races = { "Skyborne" } }, -- level 21
        { complete = 1487, dungeon = "Wailing Caverns", races = { "Tauren" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK" } }, -- level 21
        { complete = 1487, dungeon = "Wailing Caverns", races = { "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 21
        { dungeon = "Wailing Caverns", useitem = 10441, when = { item = 10441 } }, -- level 21
        { accept = 6981, dungeon = "Wailing Caverns", when = { item = 10441 }, races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "DRUID" } }, -- level 21
        { go = { 1413, 50.31, 35.39 }, dungeon = "Wailing Caverns", text = "Climb the mountainside" }, -- level 21
        { go = { 1413, 47.25, 33.51 }, dungeon = "Wailing Caverns", text = "Descend the slope" }, -- level 21
        { go = { 1413, 45.94, 36.02 }, dungeon = "Wailing Caverns", text = "Drop with care onto the rock, then go into the cave" }, -- level 21
        { turnin = 1487, dungeon = "Wailing Caverns", races = { "Orc" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "DRUID" } }, -- level 21
        { turnin = 1487, dungeon = "Wailing Caverns", races = { "Scourge" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "MAGE", "DRUID" } }, -- level 21
        { turnin = 1487, dungeon = "Wailing Caverns", races = { "Skyborne" }, -- level 21
          note = "Your targets are within the cavern." },
        { turnin = 1487, dungeon = "Wailing Caverns", races = { "Tauren" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK" } }, -- level 21
        { turnin = 1487, dungeon = "Wailing Caverns", races = { "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 21
        { turnin = 1486, dungeon = "Wailing Caverns", races = { "Skyborne" }, -- level 21
          note = "Your targets are within the cavern." },
        { complete = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { dungeon = "Wailing Caverns", talk = 3442, when = { log = 6981 } }, -- level 21
        { complete = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { dungeon = "Wailing Caverns", talk = 3442, when = { done = 6981 } }, -- level 21
        { complete = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { dungeon = "Wailing Caverns", talk = 3442, when = { log = 3366 } }, -- level 21
        { complete = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { dungeon = "Wailing Caverns", talk = 3442, when = { done = 3366 } }, -- level 21
        { turnin = 959, dungeon = "Wailing Caverns" }, -- level 21
        { turnin = 1491, dungeon = "Wailing Caverns" }, -- level 21
        { go = { 1413, 50.27, 34.35 }, dungeon = "Wailing Caverns", when = { log = 6981 }, text = "Climb the mountainside" }, -- level 21
        { turnin = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { accept = 3369, dungeon = "Wailing Caverns", when = { log = 6981 }, -- level 21
          note = "The NPC is indoors. The NPC is up on the summit." },
        { go = { 1413, 50.27, 34.35 }, dungeon = "Wailing Caverns", when = { done = 6981 }, text = "Climb the mountainside" }, -- level 21
        { turnin = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { accept = 3369, dungeon = "Wailing Caverns", when = { done = 6981 }, -- level 21
          note = "The NPC is indoors. The NPC is up on the summit." },
        { go = { 1413, 50.27, 34.35 }, dungeon = "Wailing Caverns", when = { log = 3366 }, text = "Climb the mountainside" }, -- level 21
        { turnin = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { accept = 3369, dungeon = "Wailing Caverns", when = { log = 3366 }, -- level 21
          note = "The NPC is indoors. The NPC is up on the summit." },
        { go = { 1413, 50.27, 34.35 }, dungeon = "Wailing Caverns", when = { done = 3366 }, text = "Climb the mountainside" }, -- level 21
        { turnin = 6981, dungeon = "Wailing Caverns", when = { log = 6981 } }, -- level 21
        { accept = 3369, dungeon = "Wailing Caverns", when = { done = 3366 }, -- level 21
          note = "The NPC is indoors. The NPC is up on the summit." },
        { turnin = 914, dungeon = "Wailing Caverns", -- level 21
          note = "The NPC is indoors." },
        { turnin = 3369, dungeon = "Wailing Caverns", races = { "Skyborne" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "DRUID" }, -- level 21
          note = "The NPC is indoors." },
        { go = { 1456, 29.92, 29.78 }, dungeon = "Wailing Caverns", text = "Go into the cavern" }, -- level 21
        { turnin = 962, dungeon = "Wailing Caverns", -- level 21
          note = "Your targets are within the cavern." },
        { go = { 1456, 29.92, 29.78 }, text = "Head out of the cave" }, -- level 21
        { accept = 868 }, -- level 21
        { complete = 852, -- level 21
          note = "A centaur flanked by two bodyguards. This one roams, so scan the surrounding area." },
        { turnin = 852, -- level 21
          note = "The NPC is indoors, one floor up." },
        { turnin = 1062 }, -- level 21
        { accept = { 1063, 1068 }, -- level 21
          note = "Wait for the talking to finish" },
        { turnin = { 6523, 6629 }, accept = 6401 }, -- level 21
        { go = { 1442, 82.03, 98.62 }, text = "Climb the trail and cross the peaks" }, -- level 21
        { turnin = 1060, elite = true }, -- level 21
        { accept = 1058, -- level 21
          note = "Your objective lies in a little cavern." },
        { turnin = 1510, accept = 1511, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" } }, -- level 21
        { turnin = 6461, -- level 21
          note = "The NPC is indoors." },
        { turnin = 6401 }, -- level 21
        { go = { 1442, 49.25, 61.94 }, text = "Climb the trail" }, -- level 22
        { accept = 6562, -- level 22
          note = "This one roams, so scan the surrounding area." },
        { turnin = 1095, -- level 22
          note = "The NPC is indoors." },
        { complete = 1068, -- level 22
          note = "Look for a robot shaped like a person. This one roams, so scan the surrounding area. The target appears right here." },
        { complete = 1068, -- level 22
          note = "Look for a robot shaped like a person. This one roams, so scan the surrounding area. The target appears right here." },
    },
})
