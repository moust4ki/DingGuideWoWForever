-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/38.lua.
-- Simulated (warrior): Human 53 (19%) -> 54 (4%) in 3 h 58, 25 quests turned in; Dwarf 53 (19%) -> 54 (4%) in 3 h 58, 25 quests turned in; NightElf 53 (19%) -> 54 (4%) in 3 h 58, 25 quests turned in; Gnome 53 (19%) -> 54 (4%) in 3 h 58, 25 quests turned in; Skyborne 53 (19%) -> 54 (4%) in 3 h 58, 25 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a38-ungoro-crater",
    title    = "Un'Goro Crater (53-54)",
    faction  = "Alliance",
    minLevel = 53, maxLevel = 54,
    next     = "leveling-a39-winterspring-and-felwood",
    steps    = {
        { go = { 1413, 62.64, 37.42 }, text = "Travel to Gadgetzan", -- level 53
          note = "Tanaris: Gadgetzan first, then Un'Goro Crater." },
        { talk = 3496, collect = { { 10556, 1 }, { 8526, 1 }, { 11568, 1 }, { 10561, 1 } }, spots = { { 1413, 62.58, 37.39 } } }, -- level 53
        { talk = 3496, bank = 10445 }, -- level 53
        { accept = 4504 }, -- level 53
        { turnin = 2641 }, -- level 53
        { accept = 2661, -- level 53
          note = "Wait for the talking to finish" },
        { turnin = 4493, elite = true, when = { log = 4493 } }, -- level 53
        { accept = 4496, elite = true, when = { done = 4493 } }, -- level 53
        { turnin = 2661, accept = 2662 }, -- level 53
        { turnin = 2662, -- level 53
          note = "Wait for the talking to finish" },
        { turnin = 3444 }, -- level 53
        { accept = 3881 }, -- level 53
        { accept = 3883 }, -- level 53
        { accept = 3882 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, when = { done = 4284 }, text = "Go into the cavern" }, -- level 53
        { accept = { 4285, 4287, 4288 }, when = { done = 4284 }, -- level 53
          note = "Your targets are within the cavern." },
        { go = { 1449, 43.41, 6.84 }, when = { done = 4284 }, text = "Head out of the cave" }, -- level 53
        { accept = 4501 }, -- level 53
        { accept = 4492, races = { "Gnome", "Skyborne" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 53
        { accept = 4492, races = { "Human", "Dwarf", "NightElf" } }, -- level 53
        { complete = 4285, when = { log = 4285 }, -- level 53
          note = "Look for it high on the clifftop." },
        { complete = 4501, sticky = 4289, -- level 53
          note = "When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { complete = 4289, -- level 53
          note = "Targets are in the cavern and around its entrance too." },
        { complete = 4289, -- level 53
          note = "Targets are in the cavern and around its entrance too." },
        { complete = 4289, sticky = { 3882 }, -- level 53
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1449, 64.17, 16.32 }, text = "Head out of the cave" }, -- level 53
        { complete = 3881 }, -- level 53
        { complete = 4287, when = { log = 4287 }, -- level 53
          note = "Look for it high on the clifftop." },
        { collect = { { 11569, 1 }, { 11570, 1 } }, useitem = 11568 }, -- level 53
        { useitem = { 11569, 11570 } }, -- level 53
        { complete = 4292, elite = true }, -- level 53
        { turnin = 4292, elite = true }, -- level 53
        { turnin = 4289, accept = 4301 }, -- level 53
        { complete = 4501, sticky = 4496 }, -- level 53
        { go = { 1449, 49.91, 81.65 }, text = "Go into the cavern" }, -- level 53
        { complete = 3883, useitem = 11132, -- level 53
          note = "Your targets are within the cavern." },
        { complete = 4496, elite = true, when = { log = 4496 } }, -- level 53
        { go = { 1449, 49.98, 81.71 }, text = "Head out of the cave" }, -- level 53
        { complete = 3881 }, -- level 53
        { complete = 4288, when = { log = 4288 }, -- level 53
          note = "Look for it high on the clifftop." },
        { accept = 974, sticky = 4502 }, -- level 53
        { go = { 1449, 46.26, 45.59 }, text = "Climb the trail" }, -- level 53
        { complete = 974, useitem = 12472, -- level 53
          note = "The NPC is up on the summit." },
        { turnin = 974, accept = 980 }, -- level 53
        { complete = 3882 }, -- level 53
        { complete = 4501 }, -- level 53
        { complete = 4496, elite = true, when = { log = 4496 } }, -- level 53
        { go = { 1449, 46.26, 45.59 }, elite = true, text = "Climb the trail" }, -- level 53
        { complete = 4502, elite = true, -- level 53
          note = "The targets are flame elementals. An elite foe waits on the summit; steer clear." },
        { turnin = 4492, noauto = 4491, when = { ready = 4492 }, -- level 53
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Your objective lies in a little cavern." },
        { accept = 4491, when = { done = 4492 } }, -- level 53
        { complete = 4491, useitem = 11804, when = { log = 4491 }, -- level 53
          note = "Let the conversation play out. Ringo trails behind you; keep him alive. Keep near him; he passes out." },
        { turnin = 4501, -- level 53
          note = "Wait for the talking to finish" },
        { turnin = 4491, when = { log = 4491 } }, -- level 53
        { destroy = 11804 }, -- level 53
        { turnin = 3882 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 53
        { turnin = 4285, when = { log = 4285 }, -- level 53
          note = "Your targets are within the cavern." },
        { turnin = 4287, when = { log = 4287 } }, -- level 53
        { turnin = 4288, when = { log = 4288 } }, -- level 53
        { accept = 4321, when = { done = 4285 } }, -- level 53
        { turnin = 4321, when = { log = 4321 }, -- level 53
          note = "Your targets are within the cavern." },
        { destroy = 11482 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 53
        { turnin = 3883 }, -- level 53
        { turnin = 3881 }, -- level 53
        { accept = 4243 }, -- level 53
        { go = { 1449, 63.82, 16.4 }, text = "Go into the cavern" }, -- level 53
        { go = { 1449, 69.02, 17.56 }, text = "Climb the trail" }, -- level 53
        { complete = 4301, -- level 53
          note = "This one roams, so scan the surrounding area. Climb to the cave's upper level." },
        { go = { 1449, 65.93, 16.72 }, text = "Take the trail through the cavern" }, -- level 53
        { turnin = 4243, -- level 53
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. Your targets are within the cavern." },
        { accept = 4244, when = { item = 10561 } }, -- level 53
        { accept = 4244, when = { log = 4244 } }, -- level 53
        { accept = 4244, when = { done = 4244 } }, -- level 53
        { turnin = 4244, noauto = 4245, when = { log = 4244, ready = 4244 }, -- level 53
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. Your targets are within the cavern." },
        { accept = 4245, when = { done = 4244, log = 4244 } }, -- level 53
        { turnin = 4244, noauto = 4245, when = { done = 4244, ready = 4244 }, -- level 53
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. Your targets are within the cavern." },
        { accept = 4245, when = { done = 4244 } }, -- level 53
        { complete = 4245, when = { log = 4245 }, -- level 53
          note = "Let the conversation play out. Escort A-Me 01 and keep it alive." },
        { turnin = 4245, sticky = 4504, when = { log = 4245 } }, -- level 53
        { go = { 1449, 64.17, 16.32 }, text = "Head out of the cave" }, -- level 53
        { turnin = 4301 }, -- level 53
        { complete = 4504, -- level 53
          note = "Fight the elementals of the swamp." },
        { turnin = 4496, elite = true, when = { log = 4496 } }, -- level 53
        { destroy = 11018, -- level 53
          note = "You no longer need these; vendor or discard them." },
        { turnin = 4504 }, -- level 53
        { talk = 7799, collect = { { 11511, 1 }, { 11682, 1 }, { 11243, 3 }, { 12383, 10 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 53
          note = "The NPC is indoors." },
        { accept = 5159 }, -- level 53
        { turnin = 4502, elite = true }, -- level 53
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 53
        { complete = 4441, useitem = 11682, -- level 53
          note = "The NPC is indoors." },
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 53
          note = "The NPC is indoors." },
        { talk = 8723, collect = { { 2592, 60 }, { 4306, 60 }, { 4338, 60 }, { 14047, 60 } }, -- level 53
          note = "The NPC is indoors." },
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 53
        { talk = 14725, when = { item = { 2592, 60 } }, -- level 53
          note = "The NPC is indoors." },
        { talk = 14725, when = { item = { 4306, 60 } }, -- level 53
          note = "The NPC is indoors." },
        { accept = 7799, when = { item = { 4338, 60 } }, -- level 53
          note = "The NPC is indoors." },
        { turnin = 7799, when = { item = { 4338, 60 }, ready = 7799 } }, -- level 53
        { accept = 7800, when = { done = { 7799, 10352, 10354 }, item = { 14047, 60 } }, -- level 53
          note = "The NPC is indoors." },
        { turnin = 7800, when = { done = { 7799, 10352, 10354 }, item = { 14047, 60 }, ready = 7800 } }, -- level 53
        { accept = 1047, patrol = { { 1457, 62.12, 40.42 }, { 1457, 61.83, 32.42 }, { 1457, 61.49, 26.42 }, { 1457, 60.4, 22.26 }, { 1457, 63.38, 18.74 }, { 1457, 65.27, 15.93 }, { 1457, 61.32, 10.37 }, { 1457, 57.12, 7.68 }, { 1457, 54.34, 10.01 }, { 1457, 53.69, 12.25 }, { 1457, 53.34, 15.52 }, { 1457, 51.44, 19.78 }, { 1457, 49.67, 18.8 }, { 1457, 45.03, 19.27 }, { 1457, 42.54, 18.4 }, { 1457, 38.54, 21.38 }, { 1457, 36.59, 13.47 }, { 1457, 35.25, 13.97 }, { 1457, 33.73, 16.03 }, { 1457, 35.22, 13.93 }, { 1457, 36.6, 13.48 }, { 1457, 37.52, 17.09 }, { 1457, 37.9, 20 }, { 1457, 40.84, 26.76 }, { 1457, 41.05, 31 }, { 1457, 39.54, 35.66 }, { 1457, 40.29, 38 }, { 1457, 43.27, 40.97 }, { 1457, 49.54, 41.14 }, { 1457, 56.82, 40.73 }, { 1457, 62.11, 40.72 }, { 1457, 62.11, 48.52 }, { 1457, 62.2, 54.73 }, { 1457, 63.92, 54.98 }, { 1457, 65.58, 55.54 }, { 1457, 67.49, 56.87 }, { 1457, 68, 58.87 }, { 1457, 67.59, 62.19 }, { 1457, 66.29, 65.08 }, { 1457, 65.21, 68.24 }, { 1457, 64.05, 71.27 }, { 1457, 62.6, 69.56 }, { 1457, 60.48, 66.34 }, { 1457, 59.5, 67.55 }, { 1457, 58.11, 68.45 }, { 1457, 56.85, 70.09 }, { 1457, 56.24, 72.12 }, { 1457, 53.62, 75.51 }, { 1457, 50.51, 75.84 }, { 1457, 50.09, 77.47 }, { 1457, 50.03, 80.44 }, { 1457, 49.64, 81.78 }, { 1457, 47.13, 81.95 }, { 1457, 45.86, 79.48 }, { 1457, 43.83, 76.48 }, { 1457, 41.93, 74.81 }, { 1457, 38.98, 73.92 }, { 1457, 38.93, 66.17 }, { 1457, 38.66, 57.48 }, { 1457, 38.68, 52.9 }, { 1457, 38.43, 46.94 }, { 1457, 37.21, 45.39 }, { 1457, 36.44, 43.38 }, { 1457, 35.96, 41.69 }, { 1457, 33.98, 41.55 }, { 1457, 31.27, 41.46 }, { 1457, 33.65, 41.28 }, { 1457, 36.03, 41 }, { 1457, 36.91, 39.31 }, { 1457, 39.36, 35.8 }, { 1457, 40.21, 37.86 }, { 1457, 41.49, 38.62 }, { 1457, 43.08, 40.73 }, { 1457, 46.25, 41.12 }, { 1457, 49.5, 41.07 }, { 1457, 53.93, 40.86 }, { 1457, 56.74, 40.73 }, { 1457, 62.09, 40.55 } }, -- level 53
          note = "The NPC patrols a long route; look along it." },
        { turnin = 98391, races = { "Dwarf", "Gnome", "Skyborne" }, classes = { "PRIEST" } }, -- level 53
        { train = true, talk = 4146, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 53
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 10089, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 53
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 53
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 53
        { turnin = 1047, accept = 6761, -- level 54
          note = "This one roams, so scan the surrounding area. Climb to the highest floor of the building." },
        { accept = 3781, when = { done = 3764 } }, -- level 54
        { turnin = 6761, accept = 6762, -- level 54
          note = "The NPC is indoors, on the central storey." },
        { turnin = 3781, when = { log = 3781 } }, -- level 54
        { turnin = 978, accept = 979, -- level 54
          note = "The NPC is indoors." },
        { accept = 5250, -- level 54
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 54
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 54
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 54
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 54
          note = "The NPC is indoors." },
    },
})
