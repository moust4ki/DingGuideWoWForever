-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/11.lua.
-- Simulated (warrior): Human 25 (96%) -> 28 (44%) in 6 h 47, 43 quests turned in; Dwarf 25 (96%) -> 28 (43%) in 6 h 47, 42 quests turned in; NightElf 25 (92%) -> 28 (41%) in 6 h 47, 42 quests turned in; Gnome 25 (96%) -> 28 (43%) in 6 h 47, 42 quests turned in; Skyborne 25 (96%) -> 28 (44%) in 6 h 47, 42 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a11-duskwood-and-redridge-mountains",
    title    = "Duskwood and Redridge (25-27)",
    faction  = "Alliance",
    minLevel = 25, maxLevel = 27,
    next     = "leveling-a12-wetlands",
    leftOut  = {
        [55] = { kind = "prereq" },
        [116] = { kind = "far" },
        [143] = { kind = "log" },
        [145] = { kind = "prereq" },
        [146] = { kind = "prereq" },
        [229] = { kind = "prereq" },
        [231] = { kind = "prereq" },
        [245] = { kind = "log" },
        [347] = { kind = "prereq" },
        [1044] = { kind = "log" },
        [91899] = { kind = "away" },
        [91900] = { kind = "away" },
        [91904] = { kind = "away" },
        [91905] = { kind = "away" },
        [95999] = { kind = "detour", seconds = 180, xp = 1800 },
        [99267] = { kind = "away" },
    },
    steps    = {
        { go = { 1431, 75.79, 45.32 }, text = "Travel to Darkshire", -- level 25
          note = "Duskwood: Darkshire, in the east of the zone." },
        { accept = { 66, 101 }, -- level 25
          note = "The NPC is indoors." },
        { sethearth = "Darkshire", talk = 6790, -- level 25
          note = "The NPC is indoors." },
        { accept = 56 }, -- level 25
        { turnin = 66, accept = 67, why = { kind = "carry", quest = 67, seconds = 9960, xp = 1200 }, -- level 25
          note = "The NPC is indoors." },
        { accept = 96139 }, -- level 25
        { accept = { 163, 165, 164 }, -- level 25
          note = "The NPC is indoors." },
        { go = { 1431, 77.46, 44.25 }, fly = true, talk = 2409, text = "Flight master at Darkshire" }, -- level 25
        { accept = 174, when = { item = 4371 }, -- level 25
          note = "The NPC is indoors." },
        { turnin = 174, when = { item = 4371 }, -- level 25
          note = "The NPC is indoors." },
        { accept = 175, when = { done = 174 } }, -- level 25
        { turnin = 175, sticky = { 101, 56 }, when = { log = 175 }, -- level 25
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { accept = 177, when = { done = 175 } }, -- level 26
        { complete = 177, when = { log = 177 }, -- level 26
          note = "The target is a ghoul with red skin. This one roams, so scan the surrounding area. The target can be indoors or out." },
        { complete = 101 }, -- level 26
        { complete = 56 }, -- level 26
        { turnin = 163, accept = 5 }, -- level 26
        { turnin = 164, accept = 95 }, -- level 26
        { accept = 226 }, -- level 26
        { complete = 226 }, -- level 26
        { turnin = 165, accept = 148, -- level 26
          note = "The NPC is indoors." },
        { complete = 101, collect = { { 2251, 6 } }, keep = { 1130, 2251 }, -- level 26
          note = "Hunt spiders for it." },
        { complete = 101, -- level 26
          note = "The targets are ghouls. Targets are both in the tomb and around it." },
        { level = 26, patrol = { { 1431, 23.63, 34.93 }, { 1431, 25.15, 35.95 }, { 1431, 24.35, 33.06 }, { 1431, 21.35, 33.45 }, { 1431, 21.37, 36.36 }, { 1431, 23.25, 39.63 } } }, -- level 26
        { go = { 1431, 23.63, 34.93 }, text = "Exit the tomb" }, -- level 26
        { turnin = 226 }, -- level 26
        { turnin = 2360, accept = 2359, classes = { "ROGUE" } }, -- level 26
        { complete = 2359, classes = { "ROGUE" }, -- level 26
          note = "Rob one Malformed Defias Drone with Pickpocket. This one roams, so scan the surrounding area." },
        { complete = 2359, classes = { "ROGUE" }, -- level 26
          note = "Use Sap on Klaven Mortwake, then open the chest. Opening it puts a harmful effect on you. Climb to the highest floor of the building." },
        { turnin = 67, accept = 68, why = { back = true, chain = 11, kind = "detour", quest = 67, seconds = 300, short = true, xp = 13000 }, -- level 26
          note = "Be ready for a fight right away. The object is indoors." },
        { accept = 79192, why = { continent = true, kind = "carry", once = true, quest = 79192, seconds = 27000, short = true, xp = 1300 } }, -- level 26
        { go = { 1436, 52.69, 72.3 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Climb the trail across the mountains" }, -- level 26
        { go = { 1436, 38.79, 83.76 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Take the trail that circles the peak" }, -- level 26
        { turnin = 1650, accept = 1651, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 26
        { complete = 1651, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 26
          note = "Let the conversation play out. Defeat each wave of attackers." },
        { turnin = 1651, when = { ready = 1651 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 26
        { accept = 1652, when = { done = 1651 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 26
        { collect = { { 15882, 1 } }, spots = { { 1436, 17.91, 33.06 } }, races = { "NightElf" }, classes = { "DRUID" }, -- level 26
          note = "Your targets sit below the water's surface." },
        { complete = 272, useitem = 15883, when = { log = 272 }, races = { "NightElf", "Skyborne" }, classes = { "DRUID" } }, -- level 26
        { turnin = 272, when = { ready = 272 }, races = { "NightElf", "Skyborne" }, classes = { "DRUID" }, -- level 26
          note = "The NPC is indoors, one floor up." },
        { accept = 5061, when = { done = 272 }, races = { "NightElf" }, classes = { "DRUID" } }, -- level 26
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 26
        { turnin = 5061, when = { log = 5061 }, races = { "NightElf" }, classes = { "DRUID" }, -- level 26
          note = "Climb to the highest floor of the building." },
        { turnin = 5, accept = 93, -- level 26
          note = "The NPC is indoors." },
        { turnin = 93, when = { ready = 93 }, -- level 27
          note = "The NPC is indoors." },
        { accept = 240, when = { done = 93 } }, -- level 27
        { destroy = 2251 }, -- level 27
        { turnin = 56, accept = 57 }, -- level 27
        { turnin = 68, accept = 69, -- level 27
          note = "The NPC is indoors." },
        { turnin = { 101, 148 }, accept = 149, -- level 27
          note = "The NPC is indoors." },
        { turnin = 177, when = { log = 177 }, -- level 27
          note = "The NPC is indoors." },
        { turnin = 149, accept = 154, -- level 27
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { turnin = 154, accept = 157, -- level 27
          note = "The NPC is indoors." },
        { turnin = 95, accept = 230, -- level 27
          note = "Beware of foes lurking in stealth." },
        { turnin = 157, accept = 158, -- level 27
          note = "The NPC is indoors." },
        { turnin = 230, accept = 262 }, -- level 27
        { turnin = 69, accept = 70, -- level 27
          note = "The NPC is indoors." },
        { complete = 70, -- level 27
          note = "The object is indoors, one floor up." },
        { turnin = 95998, races = { "Human" } }, -- level 27
        { complete = 96606, races = { "NightElf" } }, -- level 27
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors" }, -- level 27
        { turnin = 1652, when = { log = 1652 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 27
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 27
          note = "The NPC is indoors." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 27
        { turnin = 2359, when = { ready = 2359 }, classes = { "ROGUE" }, -- level 27
          note = "The NPC is indoors, one floor up." },
        { accept = 2607, when = { done = 2359 }, classes = { "ROGUE" } }, -- level 27
        { turnin = 2607, when = { log = 2607 }, classes = { "ROGUE" }, -- level 27
          note = "The NPC waits on the lower level, indoors." },
        { accept = 2608, when = { done = 2607 }, classes = { "ROGUE" } }, -- level 27
        { complete = 2608, when = { log = 2608 }, classes = { "ROGUE" }, -- level 27
          note = "Let the conversation play out. Target Doc Mixilpixil, then take a seat." },
        { turnin = 2608, when = { ready = 2608 }, classes = { "ROGUE" }, -- level 27
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 5515, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 27
          note = "The NPC is indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 27
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" } }, -- level 27
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 27
          note = "The NPC is indoors, one floor up." },
        { turnin = 70, accept = 72, why = { chain = 7, kind = "detour", quest = 72, quests = 11, seconds = 60, total = 14000, xp = 7900 } }, -- level 27
        { turnin = 72, accept = 74, why = { kind = "carry", quest = 74, seconds = 41760, xp = 1200 }, -- level 27
          note = "Be ready for a fight right away." },
        { go = { 1453, 42.28, 81.85 }, text = "Head indoors" }, -- level 27
        { accept = 335, races = { "Dwarf", "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 27
        { accept = 335, races = { "Human", "Gnome", "Skyborne" }, -- level 27
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 42.29, 81.76 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 27
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Human", "Gnome" }, classes = { "WARLOCK" } }, -- level 27
        { vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 27
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 5498, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 27
          note = "The NPC waits on the tower's highest floor." },
        { accept = 20 }, -- level 27
        { accept = { 127, 150 } }, -- level 27
        { accept = 34 }, -- level 27
        { complete = 34, -- level 27
          note = "The target is a boar whose hide is a deeper shade of brown. This one roams, so scan the surrounding area." },
        { turnin = 34 }, -- level 27
        { complete = 20, -- level 27
          note = "The targets are orcs." },
        { complete = { 150, 127 }, keep = { 1468, 1467 }, -- level 27
          note = "You'll find extra ones swimming nearby as well." },
        { turnin = 20 }, -- level 27
        { turnin = { 127, 150 } }, -- level 27
        { destroy = 1468, -- level 27
          note = "You no longer need these; vendor or discard them." },
        { turnin = 262, accept = 265, -- level 27
          note = "The NPC is indoors." },
        { turnin = 265, accept = 266, -- level 27
          note = "The NPC is indoors." },
        { turnin = { 158, 266 }, accept = { 156, 453 }, -- level 27
          note = "The NPC is indoors." },
        { turnin = 453, accept = 268, sticky = 57 }, -- level 27
        { turnin = 240, when = { log = 240 } }, -- level 27
        { complete = 96139 }, -- level 27
        { complete = 156, -- level 27
          note = "The targets are Horrors and Fiends." },
        { complete = 57 }, -- level 27
        { level = 27, patrol = { { 1431, 17.57, 46.45 }, { 1431, 20.64, 46.45 }, { 1431, 21.45, 43.26 }, { 1431, 22.86, 40.44 }, { 1431, 24.17, 45.57 }, { 1431, 14.45, 46.45 }, { 1431, 14.36, 42.25 } } }, -- level 27
        { turnin = 268 }, -- level 27
        { accept = 323, elite = true }, -- level 27
        { complete = 323, elite = true, -- level 27
          note = "Targets are both in the tomb and around it. Don't engage Mor'Ladim, an elite undead foe at level 35. The target wanders near the crypt, outdoors." },
        { go = { 1431, 15.94, 38.68 }, text = "Climb the steps and exit the tomb" }, -- level 27
        { turnin = 323, elite = true }, -- level 27
        { accept = 269, elite = true }, -- level 27
        { turnin = 156, accept = 159, -- level 27
          note = "The NPC is indoors." },
        { turnin = 57 }, -- level 27
        { accept = 377, dungeon = "The Stockade", -- level 27
          note = "The NPC is indoors." },
        { accept = 128 }, -- level 27
        { accept = 124, races = { "NightElf" }, classes = { "ROGUE", "DRUID" } }, -- level 27
        { complete = 124, races = { "NightElf" }, classes = { "ROGUE", "DRUID" } }, -- level 27
        { turnin = 124, races = { "NightElf" }, classes = { "ROGUE", "DRUID" } }, -- level 27
        { accept = 126 }, -- level 27
        { accept = 91, -- level 27
          note = "The NPC is indoors." },
        { accept = 180 }, -- level 27
        { complete = 126, sticky = 91, -- level 27
          note = "The target is a sword-wielding gnoll. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 180, -- level 27
          note = "The target is a gnoll in a crimson robe, wielding a lengthy blade. This one roams, so scan the surrounding area. Beware: nearby foes join when you attack him." },
        { turnin = 94 }, -- level 28
        { complete = 91, -- level 28
          note = "Your targets here are gnolls." },
        { complete = 128, -- level 28
          note = "Targets are in the cavern and around its entrance too. Keep to the cave's interior when you can. The following step takes place in the cave." },
        { accept = 219, noauto = 219, -- level 28
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Your targets are within the cavern." },
        { complete = 219, -- level 28
          note = "Let the conversation play out. Keep Corporal Keeshan safe during the escort. At the cave's mouth, draw foes to him with care." },
        { turnin = 219 }, -- level 28
        { turnin = 126 }, -- level 28
        { turnin = 91, -- level 28
          note = "The NPC is indoors." },
        { turnin = 180, -- level 28
          note = "The NPC is indoors." },
        { turnin = 128 }, -- level 28
        { destroy = 1962 }, -- level 28
        { talk = 2455, -- level 28
          note = "The NPC is indoors." },
        { bank = 916, when = { log = 74 }, -- level 28
          note = "You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot." },
        { bank = 916, when = { done = 74 }, -- level 28
          note = "You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot." },
        { bank = 1451, when = { log = 159 }, -- level 28
          note = "You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot." },
        { bank = 1451, when = { done = 159 }, -- level 28
          note = "You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot." },
        { go = { 1453, 52.93, 51.05 }, text = "Head indoors", why = { action = "accept", kind = "detour", quest = 95161, seconds = 180, xp = 200 } }, -- level 28
        { accept = 95161, why = { kind = "carry", quest = 95161, seconds = 28680, xp = 200 } }, -- level 28
        { accept = 2923, dungeon = "Gnomeregan" }, -- level 28
        { turnin = 269, elite = true }, -- level 28
        { accept = 270, elite = true }, -- level 28
        { accept = 389, dungeon = "The Stockade", when = { done = 373 }, -- level 28
          note = "The NPC is indoors." },
        { accept = 388, dungeon = "The Stockade", patrol = { { 1453, 71.8, 60.23 }, { 1453, 70.68, 58.28 }, { 1453, 70.71, 57.2 }, { 1453, 72.7, 54.96 }, { 1453, 73.74, 55.27 }, { 1453, 75.39, 57.28 }, { 1453, 76.32, 59.32 }, { 1453, 76.14, 60.52 }, { 1453, 75.89, 62.52 }, { 1453, 75.2, 63.17 }, { 1453, 73.54, 62.54 }, { 1453, 72.77, 61.64 } }, -- level 28
          note = "The NPC patrols a long route; look along it." },
        { turnin = 389, dungeon = "The Stockade", when = { done = 373 } }, -- level 28
        { accept = 391, dungeon = "The Stockade", when = { done = 373 } }, -- level 28
        { accept = 387, dungeon = "The Stockade", -- level 28
          note = "The NPC is indoors." },
        { complete = 391, dungeon = "The Stockade", -- level 28
          note = "It is the dungeon's 4th boss." },
        { complete = 377, dungeon = "The Stockade", -- level 28
          note = "The target is the dungeon's fifth boss." },
        { complete = 388, dungeon = "The Stockade", -- level 28
          note = "You'll find them all over the instance." },
        { complete = 387, dungeon = "The Stockade" }, -- level 28
        { turnin = 387, dungeon = "The Stockade", -- level 28
          note = "The NPC is indoors." },
        { turnin = 391, dungeon = "The Stockade", when = { done = 373 } }, -- level 28
        { turnin = 388, dungeon = "The Stockade", patrol = { { 1453, 71.8, 60.23 }, { 1453, 70.68, 58.28 }, { 1453, 70.71, 57.2 }, { 1453, 72.7, 54.96 }, { 1453, 73.74, 55.27 }, { 1453, 75.39, 57.28 }, { 1453, 76.32, 59.32 }, { 1453, 76.14, 60.52 }, { 1453, 75.89, 62.52 }, { 1453, 75.2, 63.17 }, { 1453, 73.54, 62.54 }, { 1453, 72.77, 61.64 } }, -- level 28
          note = "This one roams, so scan the surrounding area." },
        { turnin = 377, dungeon = "The Stockade", -- level 28
          note = "The NPC is indoors." },
        { turnin = 2923, dungeon = "Gnomeregan" }, -- level 28
        { go = { 1455, 61.12, 89.58 }, classes = { "WARRIOR" }, text = "Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master" }, -- level 28
        { go = { 1455, 61.12, 89.58 }, classes = { "PALADIN" }, text = "Learn Two-Handed Axes at the weapon master" }, -- level 28
        { go = { 1455, 61.12, 89.58 }, classes = { "HUNTER" }, text = "Learn Guns and Two-Handed Axes at the weapon master" }, -- level 28
        { go = { 1455, 61.12, 89.58 }, classes = { "ROGUE" }, text = "Learn Guns and Maces at the weapon master" }, -- level 28
        { talk = 11865, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE" }, -- level 28
          note = "The NPC is indoors." },
    },
})
