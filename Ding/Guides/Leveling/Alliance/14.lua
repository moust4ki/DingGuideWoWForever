-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/14.lua.
-- Simulated (warrior): Human 31 (26%) -> 33 (0%) in 4 h 20, 52 quests turned in; Dwarf 31 (31%) -> 33 (16%) in 4 h 31, 54 quests turned in; NightElf 31 (36%) -> 33 (20%) in 4 h 31, 54 quests turned in; Gnome 31 (41%) -> 33 (24%) in 4 h 31, 54 quests turned in; Skyborne 31 (36%) -> 33 (17%) in 4 h 32, 52 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a14-duskwood-and-stranglethorn-vale",
    title    = "Duskwood and Stranglethorn (30-32)",
    faction  = "Alliance",
    minLevel = 30, maxLevel = 32,
    next     = "leveling-a15-hillsbrad-foothills-and-arathi-highlands",
    leftOut  = {
        [206] = { kind = "prereq" },
        [343] = { kind = "detour", seconds = 60, xp = 100 },
        [348] = { kind = "far" },
        [3626] = { kind = "prereq" },
        [3721] = { kind = "prereq" },
        [8553] = { kind = "prereq" },
        [8554] = { kind = "prereq" },
    },
    steps    = {
        { go = { 1453, 52.93, 51.05 }, text = "Head indoors", -- level 31
          note = "Stormwind first, then Duskwood and Stranglethorn Vale." },
        { turnin = 78089, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 31
        { accept = 78090, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 31
        { accept = 98219, races = { "Human", "Dwarf", "NightElf", "Gnome" }, classes = { "PALADIN" } }, -- level 31
        { turnin = 293, when = { log = 293 }, -- level 31
          note = "The NPC is indoors." },
        { accept = 1274, -- level 31
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { turnin = 94773, races = { "Human" }, classes = { "PRIEST" } }, -- level 31
        { turnin = 5678, races = { "Human" }, classes = { "PRIEST" } }, -- level 31
        { turnin = 322, elite = true }, -- level 31
        { accept = 325, elite = true }, -- level 31
        { accept = 337, useitem = 2794, when = { item = 2794 } }, -- level 31
        { go = { 1453, 73.06, 46.64 }, text = "Head into Stormwind Keep" }, -- level 31
        { turnin = 1274, accept = 1241, -- level 31
          note = "The NPC is indoors." },
        { go = { 1453, 75.98, 42.23 }, when = { log = 337 }, text = "Stay on the trail" }, -- level 31
        { turnin = 337, accept = 538, when = { log = 337 }, why = { kind = "carry", quest = 538, seconds = 16260, xp = 700 }, -- level 31
          note = "The NPC is indoors." },
        { go = { 1453, 75.98, 42.23 }, when = { done = 337 }, text = "Stay on the trail" }, -- level 31
        { turnin = 337, accept = 538, when = { done = 337 }, -- level 31
          note = "The NPC is indoors." },
        { turnin = 1241, accept = 1242, -- level 31
          note = "The NPC stands by the water's edge." },
        { turnin = 1242, accept = 1243, -- level 31
          note = "The NPC is indoors, one floor up." },
        { talk = 2455, bank = 3712, -- level 31
          note = "The NPC is indoors. You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot." },
        { bank = 5849, when = { log = 1179 }, -- level 31
          note = "You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot." },
        { bank = 5849, when = { done = 1179 }, -- level 31
          note = "You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot." },
        { bank = 2784, when = { log = 335 }, -- level 31
          note = "You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot." },
        { bank = 2784, when = { done = 335 }, -- level 31
          note = "You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot." },
        { collect = { { 916, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { log = 74 } }, -- level 31
        { collect = { { 916, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { done = 74 } }, -- level 31
        { collect = { { 1451, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { log = 159 } }, -- level 31
        { collect = { { 1451, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { done = 159 } }, -- level 31
        { talk = 2455, -- level 31
          note = "The NPC is indoors." },
        { accept = 181, when = { done = 177 }, -- level 31
          note = "The NPC is indoors." },
        { accept = 173, -- level 31
          note = "This one roams, so scan the surrounding area." },
        { accept = 58 }, -- level 31
        { sethearth = "Darkshire", talk = 6790, -- level 31
          note = "The NPC is indoors." },
        { turnin = 1243, accept = 1244, patrol = { { 1431, 74.85, 44.22 }, { 1431, 74.57, 41.17 }, { 1431, 73.91, 39.65 }, { 1431, 72.79, 38.29 }, { 1431, 72.34, 37.25 }, { 1431, 72.28, 35.14 }, { 1431, 72.64, 33.47 }, { 1431, 73.37, 32.57 } }, -- level 31
          note = "The NPC patrols the road; look along it." },
        { turnin = 95161 }, -- level 31
        { complete = 173 }, -- level 31
        { turnin = 173, accept = 221, sticky = 221, -- level 31
          note = "This one roams, so scan the surrounding area." },
        { collect = { { 2794, 1 } }, useitem = 2794, -- level 31
          note = "The targets are worgen." },
        { complete = 221 }, -- level 31
        { turnin = 74, accept = 75, why = { back = true, chain = 5, kind = "detour", quest = 75, quests = 8, seconds = 360, short = true, total = 7700, xp = 6500 } }, -- level 31
        { complete = 75, -- level 31
          note = "Be ready for a fight right away. The object is indoors, one floor up." },
        { turnin = 75, accept = 78, why = { kind = "carry", quest = 78, seconds = 4440, xp = 600 } }, -- level 31
        { turnin = 91732, races = { "Human" } }, -- level 31
        { turnin = 91732, races = { "Dwarf", "Gnome" } }, -- level 31
        { turnin = 159, accept = 133, sticky = 58, -- level 31
          note = "The NPC is indoors." },
        { complete = 133, -- level 31
          note = "The targets are ghouls. Targets are both in the tomb and around it." },
        { complete = 58, -- level 31
          note = "Other ghouls occupy the same spawn points. Targets are both in the tomb and around it." },
        { go = { 1431, 23.69, 34.89 }, text = "Exit the tomb" }, -- level 31
        { turnin = 133, accept = 134, -- level 31
          note = "The NPC is indoors." },
        { complete = 1244, -- level 31
          note = "The object is indoors." },
        { complete = 134 }, -- level 31
        { go = { 1431, 34.12, 76.99 }, text = "Go into the cavern" }, -- level 31
        { complete = 181, when = { log = 181 }, -- level 31
          note = "Your targets are within the cavern. The targets are spread over several spots." },
        { go = { 1431, 34.12, 76.99 }, text = "Head out of the cave" }, -- level 31
        { turnin = 134, accept = 160, -- level 31
          note = "The NPC is indoors." },
        { accept = 225 }, -- level 31
        { turnin = 325, elite = true }, -- level 31
        { turnin = 78, accept = 79, -- level 31
          note = "The NPC is indoors." },
        { turnin = { 58, 79 }, accept = 80 }, -- level 31
        { turnin = 80, accept = 97, -- level 31
          note = "The NPC is indoors." },
        { turnin = 225, accept = 227, -- level 31
          note = "The NPC is indoors." },
        { turnin = 160, accept = 251, -- level 31
          note = "The NPC is indoors." },
        { turnin = 251, accept = 401, -- level 31
          note = "The NPC is indoors." },
        { turnin = 401, accept = 252, -- level 31
          note = "The NPC is indoors." },
        { turnin = 96139 }, -- level 31
        { turnin = 252, -- level 31
          note = "The NPC is indoors." },
        { destroy = 3248 }, -- level 31
        { turnin = { 227, 97 }, accept = 98 }, -- level 31
        { turnin = 221, accept = 222, -- level 31
          note = "This one roams, so scan the surrounding area." },
        { destroy = 2154 }, -- level 31
        { turnin = 181, when = { log = 181 }, -- level 31
          note = "The NPC is indoors." },
        { turnin = 1244, accept = 1245, sticky = 98, patrol = { { 1431, 74.85, 44.22 }, { 1431, 74.57, 41.17 }, { 1431, 73.91, 39.65 }, { 1431, 72.79, 38.29 }, { 1431, 72.34, 37.25 }, { 1431, 72.28, 35.14 }, { 1431, 72.64, 33.47 }, { 1431, 73.37, 32.57 } }, -- level 31
          note = "The NPC patrols the road; look along it." },
        { complete = 335, races = { "Dwarf", "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { complete = 335, races = { "Human", "Gnome", "Skyborne" } }, -- level 32
        { complete = 98, -- level 32
          note = "The target can be in the house or around it." },
        { turnin = 98, -- level 32
          note = "The NPC is indoors." },
        { complete = 222, -- level 32
          note = "The objective is underground, in the mine shaft. Just out of the mine." },
        { level = 32, patrol = { { 1431, 40.57, 69.75 }, { 1431, 39.05, 72.36 }, { 1431, 36.65, 70.55 }, { 1431, 34.05, 69.04 }, { 1431, 31.44, 70.75 }, { 1431, 33.85, 73.35 }, { 1431, 36.54, 74.54 }, { 1431, 37.57, 77.64 }, { 1431, 40.15, 75.74 }, { 1431, 42.96, 74.55 }, { 1431, 34.26, 77.45 }, { 1431, 30.86, 74.86 }, { 1431, 31.35, 66.96 }, { 1431, 34.54, 65.74 } } }, -- level 32
        { accept = 215, -- level 32
          note = "The NPC patrols the southern route once every 20-30 minutes. A pair of foes go after him. Saving his life unlocks a new task." },
        { accept = 583 }, -- level 32
        { turnin = 583 }, -- level 32
        { accept = 185 }, -- level 32
        { accept = 190, sticky = 190 }, -- level 32
        { complete = 185 }, -- level 32
        { complete = 190 }, -- level 32
        { turnin = 185 }, -- level 32
        { turnin = 190 }, -- level 32
        { turnin = 215 }, -- level 32
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 32
        { turnin = 222, accept = 223, why = { kind = "detour", quest = 223, quests = 2, seconds = 60, total = 5100, xp = 3200 }, -- level 32
          note = "This one roams, so scan the surrounding area." },
        { turnin = 223, -- level 32
          note = "The NPC is indoors." },
        { train = true, talk = 5498, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 32
          note = "The NPC waits on the tower's highest floor." },
        { accept = 690, races = { "Human", "Gnome", "Skyborne" }, classes = { "MAGE" } }, -- level 32
        { go = { 1453, 50.56, 90.35 }, races = { "Human", "Gnome" }, classes = { "MAGE" }, text = "Head indoors" }, -- level 32
        { accept = 1301, races = { "Human", "Gnome", "Skyborne" }, classes = { "MAGE" }, -- level 32
          note = "The NPC is indoors." },
        { go = { 1453, 42.29, 81.76 }, races = { "Human", "Gnome" }, classes = { "MAGE" }, text = "Head indoors" }, -- level 32
        { turnin = 335, accept = 336, races = { "Human", "Gnome", "Skyborne" }, classes = { "MAGE" }, -- level 32
          note = "The NPC waits on the lower level, indoors." },
        { collect = { { 5849, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { log = 1179 }, races = { "Human", "Gnome" }, classes = { "MAGE" } }, -- level 32
        { collect = { { 5849, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { done = 1179 }, races = { "Human", "Gnome" }, classes = { "MAGE" } }, -- level 32
        { collect = { { 2784, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { log = 335 }, races = { "Human", "Gnome" }, classes = { "MAGE" } }, -- level 32
        { collect = { { 2784, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { done = 335 }, races = { "Human", "Gnome" }, classes = { "MAGE" } }, -- level 32
        { talk = 2455, collect = { { 3712, 10 } }, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 32
          note = "The NPC is indoors." },
        { talk = 15659, buy = { { 3719, 1, 15659 }, { 2997, 1, 15659 } }, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 32
          note = "Hang on to it; an upcoming quest uses it. The NPC is indoors." },
        { turnin = 1245, accept = 1246, -- level 32
          note = "The NPC is indoors, one floor up." },
        { talk = 15659, buy = { { 3719, 1, 15659 }, { 2997, 1, 15659 } }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, -- level 32
          note = "Hang on to it; an upcoming quest uses it. The NPC is indoors." },
        { collect = { { 5849, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { log = 1179 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { collect = { { 5849, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { done = 1179 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { collect = { { 2784, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { log = 335 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { collect = { { 2784, 1 } }, spots = { { 1453, 64.24, 80.81 } }, when = { done = 335 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { talk = 2455, collect = { { 3712, 10 } }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, -- level 32
          note = "The NPC is indoors." },
        { accept = 690, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, why = { kind = "carry", quest = 690, seconds = 13860, xp = 2000 } }, -- level 32
        { go = { 1453, 50.56, 90.35 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, text = "Head indoors" }, -- level 32
        { accept = 1301, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, -- level 32
          note = "The NPC is indoors." },
        { go = { 1453, 42.29, 81.76 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, text = "Head indoors" }, -- level 32
        { turnin = 78090, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 32
        { turnin = 335, accept = 336, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" }, -- level 32
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 42.29, 81.76 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 32
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Human", "Gnome" }, classes = { "WARLOCK" } }, -- level 32
        { vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 32
          note = "The NPC waits on the lower level, indoors." },
        { accept = 1798, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 32
          note = "The NPC is indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors", -- level 32
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 32
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 32
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" } }, -- level 32
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 32
          note = "The NPC is indoors, one floor up." },
        { accept = 1718, classes = { "WARRIOR" }, why = { continent = true, kind = "carry", quest = 1718, seconds = 28380, xp = 600 }, -- level 32
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 32
        { train = true, talk = 5515, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 32
          note = "The NPC is indoors." },
        { turnin = 1246, accept = 1447, -- level 32
          note = "Be ready for a fight right away. The NPC stands in the narrow lane between houses." },
        { complete = 1447, -- level 32
          note = "Wait for the talking to finish" },
        { turnin = 1447, accept = 1247 }, -- level 32
        { turnin = 97220, races = { "NightElf" } }, -- level 32
        { turnin = 1247, accept = 1248, -- level 32
          note = "The NPC is indoors, one floor up." },
        { go = { 1453, 73.19, 46.69 }, text = "Head indoors" }, -- level 32
        { turnin = 336, races = { "Dwarf", "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { turnin = 336, races = { "Human", "Gnome", "Skyborne" }, -- level 32
          note = "The NPC is indoors." },
        { accept = 1302, why = { continent = true, kind = "carry", quest = 1302, seconds = 15720, xp = 700 }, -- level 32
          note = "The NPC is indoors." },
        { turnin = 1301, races = { "Dwarf", "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 32
        { turnin = 1301, races = { "Human", "Gnome", "Skyborne" } }, -- level 32
        { turnin = 1248, accept = 1249, -- level 32
          note = "The NPC is indoors." },
        { complete = 1249, -- level 32
          note = "Wait for the talking to finish" },
        { turnin = 1249, -- level 32
          note = "The NPC is indoors." },
        { accept = 1250, -- level 32
          note = "The NPC is indoors." },
        { turnin = 1250, accept = 1264, why = { continent = true, kind = "carry", quest = 1264, seconds = 15720, xp = 1300 }, -- level 32
          note = "The NPC is indoors." },
        { accept = 98216 }, -- level 32
        { complete = 98216 }, -- level 32
        { accept = 98310 }, -- level 32
        { accept = 98313, why = { kind = "carry", quest = 98313, seconds = 14460, xp = 2200 } }, -- level 32
        { accept = 98291, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { turnin = 98216 }, -- level 32
        { accept = 87491, races = { "Human", "Skyborne" } }, -- level 32
        { turnin = 87491, races = { "Human", "Skyborne" } }, -- level 32
        { complete = 98310 }, -- level 32
        { turnin = 98310 }, -- level 32
        { accept = 87318, races = { "Human", "Skyborne" } }, -- level 32
        { turnin = 87318, races = { "Human", "Skyborne" } }, -- level 32
        { accept = 88758, races = { "Human", "Skyborne" } }, -- level 32
        { turnin = 88758, races = { "Human", "Skyborne" } }, -- level 32
        { accept = 98297, races = { "Human" } }, -- level 32
        { complete = 98297, races = { "Human" } }, -- level 32
        { turnin = 98297, races = { "Human" } }, -- level 32
        { accept = 98297, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { accept = 647, races = { "Human", "Skyborne" }, why = { action = "accept", kind = "detour", quest = 647, seconds = 60, xp = 3100 } }, -- level 33
        { accept = 98300, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" }, why = { kind = "carry", quest = 98300, seconds = 11280, xp = 2400 } }, -- level 32
        { turnin = 98245, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { complete = 98291, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { turnin = 98291, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { accept = 98291, races = { "Skyborne" } }, -- level 33
        { complete = 98291, races = { "Skyborne" } }, -- level 33
        { turnin = 98291, races = { "Skyborne" } }, -- level 33
        { accept = 87491, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { turnin = 87491, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 32
        { accept = 87318, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 33
        { turnin = 87318, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 33
        { accept = 88758, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 33
        { turnin = 88758, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 33
        { complete = 98297, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 33
        { turnin = 98297, races = { "Dwarf", "NightElf", "Gnome" } }, -- level 33
        { accept = 98297, races = { "Skyborne" } }, -- level 33
        { complete = 98297, races = { "Skyborne" } }, -- level 33
        { turnin = 98297, races = { "Skyborne" } }, -- level 33
    },
})
