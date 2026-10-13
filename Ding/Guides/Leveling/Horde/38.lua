-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/38.lua.
-- Simulated (warrior): Orc 54 (38%) -> 56 (16%) in 13 h 20, 30 quests turned in; Scourge 54 (38%) -> 56 (16%) in 13 h 20, 30 quests turned in; Tauren 54 (38%) -> 56 (16%) in 13 h 20, 30 quests turned in; Troll 54 (38%) -> 56 (16%) in 13 h 20, 30 quests turned in; Skyborne 54 (43%) -> 56 (16%) in 12 h 50, 30 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h38-felwood-and-winterspring",
    title    = "Felwood and Winterspring (54-56)",
    faction  = "Horde",
    minLevel = 54, maxLevel = 56,
    next     = "leveling-h39-western-and-eastern-plaguelands",
    steps    = {
        { go = { 1448, 34.21, 52.34 }, text = "Travel to Bloodvenom Post", -- level 54
          note = "Felwood: Bloodvenom Post, in the west of the zone." },
        { accept = 4506 }, -- level 54
        { turnin = 5159, accept = 5165, -- level 54
          note = "This one roams, so scan the surrounding area." },
        { collect = { { 21377, 1 }, { 11515, 6 } }, keep = { 21377, 11515 }, -- level 54
          note = "Hand these in afterwards for experience and reputation." },
        { accept = 5887, -- level 54
          note = "This one roams, so scan the surrounding area." },
        { turnin = 5887, when = { ready = 5887 } }, -- level 54
        { destroy = { 11516, 11511, 11515 } }, -- level 54
        { go = { 1448, 38.43, 59.8 }, text = "Go into Jaedenar" }, -- level 54
        { go = { 1448, 35.38, 58.65 }, text = "Go into the cavern" }, -- level 54
        { complete = 5165, -- level 54
          note = "Go to the upper floor of the cavern." },
        { complete = 5165, -- level 54
          note = "Go to the upper floor of the cavern." },
        { go = { 1448, 38.2, 54.11 }, text = "Circle the gap in the ground, then take the trail downward" }, -- level 54
        { complete = 5165, -- level 54
          note = "The target is deep in the cave, on its lowest floor." },
        { complete = 5165, -- level 54
          note = "The target is deep in the cave, on its lowest floor." },
        { accept = 5202, collect = { { 13140, 1 } }, useitem = 13140, -- level 54
          note = "Search the upper and lower floors of the cavern." },
        { turnin = 5202, -- level 54
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. The prisoner is held in a cage of yellow wood." },
        { go = { 1448, 35.48, 58.84 }, text = "Climb the trail and exit the cavern" }, -- level 54
        { go = { 1448, 36.7, 66.81 }, text = "Circle the mountain, then stay on the trail" }, -- level 54
        { useitem = 12565, -- level 54
          note = "A green cat, a Corrupted Saber, appears when you use it. Hold on until it begins to trail you. Beware of foes lurking in stealth." },
        { go = { 1448, 32.44, 66.55 } }, -- level 54
        { go = { 1448, 37.6, 49.22 }, text = "Walk west beside the river" }, -- level 54
        { complete = 4506, talk = 9937, -- level 54
          note = "The kitten is the green cat beside you. Look beside Winna Hazzard." },
        { turnin = 4506 }, -- level 54
        { accept = 4521 }, -- level 54
        { accept = 8461, -- level 54
          note = "Keep to the road the whole way." },
        { complete = 8461 }, -- level 54
        { level = 55, patrol = { { 1448, 63.56, 9.55 }, { 1448, 62.46, 7.63 }, { 1448, 63.54, 5.95 }, { 1448, 59.95, 6.64 }, { 1448, 60.46, 8.57 }, { 1448, 61.45, 10.77 }, { 1448, 62.37, 12.64 } } }, -- level 54
        { turnin = 5084, accept = 5085, object = 176091, -- level 55
          note = "Flee if things go badly." },
        { turnin = 8461, accept = 8465, -- level 55
          note = "Keep to the road the whole way." },
        { accept = 8467, when = { item = { 21377, 5 } } }, -- level 55
        { turnin = 8467, when = { item = { 21377, 5 }, ready = 8467 } }, -- level 55
        { turnin = 8465 }, -- level 55
        { turnin = { 980, 3909, 5085 }, accept = { 4842, 3912, 5086 } }, -- level 55
        { complete = 4521 }, -- level 55
        { accept = 3783 }, -- level 55
        { talk = 13917, bank = { 10540, 11136, 10597 }, sticky = 3783, -- level 55
          note = "The NPC is indoors." },
        { complete = 4521 }, -- level 55
        { complete = 3783, -- level 55
          note = "The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { turnin = 3783 }, -- level 55
        { turnin = 4809, when = { ready = 4809 } }, -- level 55
        { sethearth = "Everlook", talk = 11118, -- level 55
          note = "The NPC is indoors." },
        { turnin = 4521, accept = 4741 }, -- level 55
        { talk = 7799, collect = { { 11243, 3 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 55
          note = "The NPC is indoors." },
        { turnin = 3912, accept = 3913, -- level 55
          note = "The NPC is a human spirit. This one roams, so scan the surrounding area." },
        { turnin = 3913, accept = 3914 }, -- level 55
        { destroy = 11243 }, -- level 55
        { accept = 4504 }, -- level 55
        { turnin = 3914, accept = 3941 }, -- level 55
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 55
        { turnin = 3941, -- level 55
          note = "Your targets are within the cavern." },
        { accept = 3942, -- level 55
          note = "Let the conversation play out. Your targets are within the cavern." },
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 55
        { complete = 4504, -- level 55
          note = "Fight the elementals of the swamp." },
        { turnin = 4504 }, -- level 55
        { accept = { 6029, 6030 }, -- level 55
          note = "The NPC is indoors." },
        { accept = 5601, -- level 55
          note = "The NPC is indoors." },
        { talk = 13917, bank = { 15788, 15790 }, -- level 55
          note = "The NPC is indoors." },
        { complete = 4842, -- level 55
          note = "Keep to the road the whole way." },
        { turnin = 5165, -- level 55
          note = "This one roams, so scan the surrounding area." },
        { turnin = 3942, accept = 4084, sticky = { 5086, 4084 }, -- level 55
          note = "The NPC is indoors." },
        { complete = 4084, -- level 55
          note = "The targets are leafless trees that walk." },
        { complete = 5086, -- level 55
          note = "Slay the greenish beings of living water." },
        { complete = 4084, -- level 55
          note = "The targets are wolves and bears." },
        { collect = { { 21377, 1 } }, when = { maxlevel = 56 }, -- level 55
          note = "Give Nafien the items in sets of 5. Every full set you hand over earns 50 reputation. Bring any feathers you collect to the NPC at 64.8, 8.1." },
        { go = { 1448, 63.56, 9.55 }, when = { maxlevel = 56 }, text = "Raise Timbermaw Hold standing to Neutral" }, -- level 55
        { accept = 8470, collect = { { 20741, 1 } }, useitem = 20741, when = { maxlevel = 56 } }, -- level 55
        { accept = 8467, when = { item = { 21377, 5 } } }, -- level 55
        { turnin = 8467, when = { item = { 21377, 5 }, ready = 8467 } }, -- level 55
        { turnin = 8470, when = { maxlevel = 56, ready = 8470 }, -- level 55
          note = "This one roams, so scan the surrounding area. The NPC stands within the passage." },
        { turnin = { 4842, 5086 }, accept = 5087 }, -- level 55
        { complete = 5087, patrol = { { 1452, 28.03, 35 }, { 1452, 27.98, 36.49 }, { 1452, 28.34, 37.4 }, { 1452, 28.5, 39.26 }, { 1452, 29.34, 40.72 }, { 1452, 29.75, 41.97 }, { 1452, 30.38, 42.62 }, { 1452, 31.69, 42.37 }, { 1452, 33.51, 41.96 }, { 1452, 34.28, 41.89 }, { 1452, 35.44, 42.1 }, { 1452, 36.1, 42.22 }, { 1452, 38.2, 41.94 }, { 1452, 40.06, 40.81 }, { 1452, 42.04, 39.99 }, { 1452, 44.29, 39.96 }, { 1452, 45.81, 39.75 }, { 1452, 47.21, 39.35 }, { 1452, 48.97, 38.45 }, { 1452, 50.4, 36.76 }, { 1452, 51.6, 36.23 }, { 1452, 52.6, 35.51 }, { 1452, 53.38, 34.42 } }, -- level 55
          note = "The targets are 3 white furbolgs moving as one pack. The target patrols a long route beside the road. They appear near 28.1, 35.0 in Winterspring." },
        { turnin = 5087 }, -- level 55
        { accept = 8464 }, -- level 55
        { level = 56, collect = { { 21377, 1 } }, patrol = { { 1448, 63.56, 9.55 }, { 1448, 62.46, 7.63 }, { 1448, 63.54, 5.95 }, { 1448, 59.95, 6.64 }, { 1448, 60.46, 8.57 }, { 1448, 61.45, 10.77 }, { 1448, 62.37, 12.64 } }, -- level 55
          note = "This number shrinks while you kill monsters. Bring any feathers you collect to the NPC at 64.8, 8.1." },
        { turnin = 4084, accept = 4005, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 56
        { talk = 13917, collect = { { 10597, 1 } }, spots = { { 1452, 61.51, 36.91 } }, -- level 56
          note = "The NPC is indoors." },
        { talk = 13917, bank = 11617, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 56
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 56
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 56
          note = "This NPC is found down in the Cleft of Shadow." },
        { turnin = 3507 }, -- level 56
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 56
          note = "The NPC stands on the highest level of this structure." },
        { sethearth = "Orgrimmar", talk = 6929, -- level 56
          note = "The NPC is indoors." },
        { talk = 4549, collect = { { 10691, 1 }, { 10692, 1 }, { 10693, 1 }, { 10694, 1 }, { 10540, 1 }, { 15788, 1 }, { 15790, 1 } }, spots = { { 1458, 65.94, 44.78 } } }, -- level 56
        { turnin = 3542, accept = 3564 }, -- level 56
        { go = { 1458, 52.8, 77.62 }, text = "Take the trail downhill" }, -- level 56
        { turnin = 3568 }, -- level 56
        { accept = 3569, -- level 56
          note = "Wait for the talking to finish" },
        { turnin = 3569 }, -- level 56
        { accept = 3570 }, -- level 56
        { turnin = 3570 }, -- level 56
        { talk = 4549, unbank = 10679 }, -- level 56
        { accept = 7816, elite = true }, -- level 56
        { turnin = 626, -- level 56
          note = "The spot is at the foot of the falls. Your targets sit below the water's surface." },
        { complete = 7816, elite = true, -- level 56
          note = "Hunt down an elite turtle of level 48 whose shell looks azure. This one roams, so scan the surrounding area." },
        { turnin = 7816, elite = true }, -- level 56
    },
})
