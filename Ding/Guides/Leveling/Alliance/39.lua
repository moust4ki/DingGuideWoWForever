-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/39.lua.
-- Simulated (warrior): Human 54 (4%) -> 56 (6%) in 15 h 21, 32 quests turned in; Dwarf 54 (4%) -> 56 (6%) in 15 h 21, 32 quests turned in; NightElf 54 (4%) -> 56 (6%) in 15 h 23, 33 quests turned in; Gnome 54 (4%) -> 56 (6%) in 15 h 21, 32 quests turned in; Skyborne 54 (4%) -> 56 (6%) in 15 h 21, 32 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a39-winterspring-and-felwood",
    title    = "Winterspring and Felwood (54-56)",
    faction  = "Alliance",
    minLevel = 54, maxLevel = 56,
    next     = "leveling-a40-burning-steppes",
    leftOut  = {
        [5128] = { kind = "prereq" },
        [5252] = { kind = "prereq" },
        [5253] = { kind = "prereq" },
        [5601] = { kind = "exclusive" },
        [6603] = { kind = "away" },
        [6604] = { kind = "away" },
    },
    steps    = {
        { go = { 1448, 51.21, 82.11 }, text = "Travel to Emerald Sanctuary", -- level 54
          note = "Felwood: Emerald Sanctuary, in the south of the zone." },
        { collect = { { 21377, 1 }, { 11515, 6 } }, keep = { 21377, 11515 }, -- level 54
          note = "Hand these in afterwards for experience and reputation." },
        { turnin = 5159, accept = 5165 }, -- level 54
        { turnin = 4441, -- level 54
          note = "The NPC is indoors." },
        { accept = 4442, -- level 54
          note = "Let the conversation play out. The NPC is indoors." },
        { turnin = 4442, -- level 54
          note = "The NPC is indoors." },
        { accept = 5882 }, -- level 54
        { turnin = 5882, when = { ready = 5882 } }, -- level 54
        { destroy = { 11445, 11511, 11516, 11515 } }, -- level 54
        { go = { 1448, 38.43, 59.8 }, text = "Go into Jaedenar" }, -- level 54
        { go = { 1448, 35.38, 58.65 }, text = "Go into the cavern" }, -- level 54
        { complete = 5165, floor = "up", -- level 54
          note = "Go to the upper floor of the cavern." },
        { complete = 5165, floor = "up", -- level 54
          note = "Go to the upper floor of the cavern." },
        { go = { 1448, 38.2, 54.11 }, text = "Circle the gap in the ground, then take the trail downward" }, -- level 54
        { complete = 5165, floor = "down", -- level 54
          note = "The target is deep in the cave, on its lowest floor." },
        { complete = 5165, floor = "down", -- level 54
          note = "The target is deep in the cave, on its lowest floor." },
        { accept = 5202, collect = { { 13140, 1 } }, useitem = 13140, -- level 54
          note = "Search the upper and lower floors of the cavern." },
        { turnin = 5202, -- level 54
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. The prisoner is held in a cage of yellow wood." },
        { go = { 1448, 35.48, 58.84 }, text = "Climb the trail and exit the cavern" }, -- level 54
        { accept = 8461, -- level 54
          note = "Keep to the road the whole way." },
        { complete = 8461 }, -- level 54
        { turnin = 8461, accept = 8465, -- level 54
          note = "Keep to the road the whole way." },
        { turnin = 8465 }, -- level 54
        { turnin = { 3909, 980 }, accept = { 3912, 5082 }, sticky = 5082, why = { kind = "carry", quest = 3912, seconds = 25440, xp = 5100 } }, -- level 54
        { accept = 5083, collect = { { 12771, 1 } }, useitem = 12771, -- level 54
          note = "The targets are furbolgs." },
        { complete = 5082, -- level 54
          note = "Other creatures use these spawn points too." },
        { level = 54, xp = 165200, patrol = { { 1452, 29.95, 35.44 }, { 1452, 33.66, 36.95 }, { 1452, 40.45, 42.45 }, { 1452, 42.56, 43.16 } }, why = { kind = "level", levels = { 52, 56 } }, -- level 54
          note = "With the coming hand-ins, this brings you to level 55. A tough quest lies just ahead." },
        { turnin = { 5082, 5083 }, accept = 5084 }, -- level 54
        { turnin = 5084, accept = 5085, object = 176091, why = { back = true, chain = 3, kind = "detour", quest = 5084, seconds = 180, xp = 19000 }, -- level 55
          note = "Flee if things go badly." },
        { turnin = 5085, accept = 5086 }, -- level 55
        { turnin = 3912, accept = 3913, -- level 55
          note = "The NPC is a human spirit." },
        { turnin = 3913, accept = 3914 }, -- level 55
        { destroy = 11243 }, -- level 55
        { turnin = 3914, accept = 3941, why = { chain = 4, kind = "detour", quest = 3941, quests = 6, seconds = 120, total = 26000, xp = 21000 } }, -- level 55
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 55
        { turnin = 3941, -- level 55
          note = "Your targets are within the cavern." },
        { accept = 3942, -- level 55
          note = "Let the conversation play out. Your targets are within the cavern." },
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 55
        { turnin = 5165 }, -- level 55
        { turnin = 3942, accept = 4084, sticky = { 5086, 4084 }, -- level 55
          note = "The NPC is indoors." },
        { complete = 4084, -- level 55
          note = "The targets are leafless trees that walk." },
        { complete = 5086, -- level 55
          note = "Slay the greenish beings of living water." },
        { complete = 4084, -- level 55
          note = "The targets are wolves and bears." },
        { turnin = 5086, accept = { 5087, 4842 } }, -- level 55
        { complete = 5087, patrol = { { 1452, 28.03, 35 }, { 1452, 27.98, 36.49 }, { 1452, 28.34, 37.4 }, { 1452, 28.5, 39.26 }, { 1452, 29.34, 40.72 }, { 1452, 29.75, 41.97 }, { 1452, 30.38, 42.62 }, { 1452, 31.69, 42.37 }, { 1452, 33.51, 41.96 }, { 1452, 34.28, 41.89 }, { 1452, 35.44, 42.1 }, { 1452, 36.1, 42.22 }, { 1452, 38.2, 41.94 }, { 1452, 40.06, 40.81 }, { 1452, 42.04, 39.99 }, { 1452, 44.29, 39.96 }, { 1452, 45.81, 39.75 }, { 1452, 47.21, 39.35 }, { 1452, 48.97, 38.45 }, { 1452, 50.4, 36.76 }, { 1452, 51.6, 36.23 }, { 1452, 52.6, 35.51 }, { 1452, 53.38, 34.42 } }, -- level 55
          note = "The targets are 3 white furbolgs moving as one pack. The target patrols a long route beside the road. Move on if you have not seen it once the trail ends." },
        { turnin = 5250, accept = 5244, -- level 55
          note = "The NPC is indoors." },
        { turnin = 5244, accept = { 5245, 4861 }, why = { continent = true, kind = "carry", quest = 5245, seconds = 71280, xp = 5800 }, -- level 55
          note = "The NPC is indoors." },
        { complete = 5245, -- level 55
          note = "Be ready for a fight right away." },
        { complete = 5245, -- level 55
          note = "Be ready for a fight right away." },
        { complete = 5245, -- level 55
          note = "Be ready for a fight right away." },
        { complete = 5245, -- level 55
          note = "Be ready for a fight right away." },
        { sethearth = "Everlook", talk = 11118, -- level 55
          note = "The NPC is indoors." },
        { accept = { 6028, 6030 }, why = { continent = true, kind = "carry", quest = 6028, seconds = 42960, xp = 2600 }, -- level 55
          note = "The NPC is indoors." },
        { talk = 13917, bank = { 11173, 11172, 15788, 15790, 12891, 12896, 12897, 12898, 12899 }, -- level 55
          note = "The NPC is indoors. You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots." },
        { turnin = 4861, accept = 4863 }, -- level 55
        { turnin = 4863, accept = 4864 }, -- level 55
        { complete = 4864 }, -- level 55
        { turnin = 979, accept = 4901, sticky = 4864, noauto = 4901, why = { kind = "carry", quest = 4901, seconds = 12840, xp = 4800 }, -- level 55
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear." },
        { complete = 4901, -- level 55
          note = "Let the conversation play out. Escort Ranshalla and guard her. Wait until the foes hit her before you strike." },
        { complete = 4864 }, -- level 55
        { complete = 4842, -- level 55
          note = "Keep to the road the whole way." },
        { turnin = 4864, -- level 55
          note = "The NPC is indoors." },
        { complete = 5087, patrol = { { 1452, 28.03, 35 }, { 1452, 27.98, 36.49 }, { 1452, 28.34, 37.4 }, { 1452, 28.5, 39.26 }, { 1452, 29.34, 40.72 }, { 1452, 29.75, 41.97 }, { 1452, 30.38, 42.62 }, { 1452, 31.69, 42.37 }, { 1452, 33.51, 41.96 }, { 1452, 34.28, 41.89 }, { 1452, 35.44, 42.1 }, { 1452, 36.1, 42.22 }, { 1452, 38.2, 41.94 }, { 1452, 40.06, 40.81 }, { 1452, 42.04, 39.99 }, { 1452, 44.29, 39.96 }, { 1452, 45.81, 39.75 }, { 1452, 47.21, 39.35 }, { 1452, 48.97, 38.45 }, { 1452, 50.4, 36.76 }, { 1452, 51.6, 36.23 }, { 1452, 52.6, 35.51 }, { 1452, 53.38, 34.42 } }, -- level 55
          note = "The targets are 3 white furbolgs moving as one pack. The target patrols a long route beside the road. They appear near 28.1, 35.0 in Winterspring." },
        { turnin = { 4842, 5087 } }, -- level 55
        { accept = 8464 }, -- level 55
        { collect = { { 21377, 1 } }, when = { maxlevel = 56 }, -- level 55
          note = "You can also do dungeons until you hit level 56. Give Nafien the items in sets of 5. Every full set you hand over earns 50 reputation." },
        { go = { 1448, 63.56, 9.55 }, when = { maxlevel = 56 }, text = "Raise Timbermaw Hold standing to Neutral" }, -- level 55
        { accept = 8470, collect = { { 20741, 1 } }, useitem = 20741, when = { maxlevel = 56 } }, -- level 55
        { accept = 8467, when = { item = { 21377, 5 } } }, -- level 55
        { turnin = 8467, when = { item = { 21377, 5 }, ready = 8467 } }, -- level 55
        { accept = 8471, useitem = 20742, when = { item = 20742, maxlevel = 56 } }, -- level 55
        { turnin = 8470, when = { maxlevel = 56, ready = 8470 }, -- level 55
          note = "The NPC stands within the passage." },
        { turnin = 8471, when = { log = 8471, ready = 8471 } }, -- level 55
        { level = 56, patrol = { { 1448, 62.37, 12.64 }, { 1448, 61.45, 10.77 }, { 1448, 60.46, 8.57 }, { 1448, 59.95, 6.64 }, { 1448, 62.46, 7.63 }, { 1448, 63.54, 5.95 }, { 1448, 63.56, 9.55 } }, why = { kind = "level", levels = { 53, 57 } } }, -- level 55
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 55
        { turnin = 4901, accept = 4902, -- level 56
          note = "The NPC is indoors." },
        { turnin = 96606, races = { "NightElf" } }, -- level 56
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 56
          note = "The NPC is indoors." },
        { talk = 4209, collect = { { 10575, 1 }, { 12724, 1 }, { 10445, 1 }, { 11947, 6 }, { 11949, 6 } }, spots = { { 1457, 39.63, 41.95 } } }, -- level 56
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 56
        { train = true, floor = "up", talk = 4146, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 56
          note = "The NPC is indoors, one floor up." },
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 56
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 56
        { turnin = 4902, floor = "top", -- level 56
          note = "The NPC waits on the tower's highest floor." },
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 56
          note = "The NPC is indoors." },
    },
})
