-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/02.lua.
-- Simulated (warrior): Dwarf 1 (0%) -> 13 (88%) in 8 h 07, 78 quests turned in; Gnome 1 (0%) -> 13 (88%) in 8 h 07, 78 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a02-dwarf-and-gnome-starter",
    title    = "Dwarf and Gnome start (1-13)",
    faction  = "Alliance",
    races    = { "Dwarf", "Gnome" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-a04-westfall",
    leftOut  = {
        [17] = { kind = "far" },
        [161] = { kind = "away" },
        [217] = { kind = "prereq" },
        [237] = { kind = "prereq" },
        [256] = { kind = "away" },
        [258] = { kind = "prereq" },
        [263] = { kind = "prereq" },
        [271] = { kind = "prereq" },
        [278] = { kind = "prereq" },
        [280] = { kind = "prereq" },
        [283] = { kind = "prereq" },
        [454] = { kind = "prereq" },
        [467] = { kind = "far", turnin = true },
        [468] = { kind = "log" },
        [531] = { kind = "prereq" },
        [704] = { kind = "far" },
        [79975] = { kind = "away" },
        [86585] = { kind = "away" },
        [86667] = { kind = "away" },
        [86776] = { kind = "away" },
        [98319] = { kind = "detour", seconds = 60, xp = 300 },
        [98323] = { kind = "prereq", quest = 98319 },
    },
    steps    = {
        { destroy = 6948, -- level 1
          note = "Dun Morogh: Coldridge Valley, where dwarves and gnomes start. This frees room in your bags. You receive one further along the route." },
        { go = { 1426, 30.63, 74.46 }, classes = { "WARRIOR", "WARLOCK" }, text = "Loot the beasts you kill on the way here", -- level 1
          note = "Pick up anything that sells for 10 copper or more." },
        { vendor = true, talk = 829, classes = { "WARRIOR", "WARLOCK" } }, -- level 1
        { go = { 1426, 28.84, 69.11 }, classes = { "WARRIOR" }, text = "Head indoors", -- level 1
          note = "The NPC is indoors." },
        { train = true, talk = 912, classes = { "WARRIOR" } }, -- level 1
        { go = { 1426, 28.84, 69.11 }, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 1
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 460, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 1
        { go = { 1426, 28.82, 69.03 }, text = "Step back outside" }, -- level 1
        { accept = 179 }, -- level 1
        { complete = 179, -- level 1
          note = "The targets are wolves." },
        { level = 2, patrol = { { 1426, 30.63, 74.46 }, { 1426, 30.74, 72.43 }, { 1426, 28.43, 73.43 }, { 1426, 26.34, 74.15 }, { 1426, 28.15, 75.56 }, { 1426, 29.45, 77.25 }, { 1426, 27.46, 71.16 }, { 1426, 25.94, 69.34 }, { 1426, 30.86, 69.45 } } }, -- level 2
        { turnin = 179, accept = 233 }, -- level 2
        { accept = 98574, races = { "Gnome" }, classes = { "PRIEST" } }, -- level 2
        { accept = 3106, races = { "Dwarf" }, classes = { "WARRIOR" } }, -- level 2
        { accept = 3109, races = { "Dwarf" }, classes = { "ROGUE" } }, -- level 2
        { accept = 3110, races = { "Dwarf" }, classes = { "PRIEST" } }, -- level 2
        { accept = 3107, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 2
        { accept = 3108, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 2
        { accept = 3114, races = { "Gnome" }, classes = { "MAGE" } }, -- level 2
        { accept = 3112, races = { "Gnome" }, classes = { "WARRIOR" } }, -- level 2
        { accept = 3115, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 2
        { accept = 3113, races = { "Gnome" }, classes = { "ROGUE" } }, -- level 2
        { accept = 170 }, -- level 2
        { complete = 170 }, -- level 2
        { turnin = 233, accept = { 234, 183 } }, -- level 2
        { complete = 183 }, -- level 3
        { turnin = 183 }, -- level 3
        { level = 4, patrol = { { 1426, 22.16, 71.15 }, { 1426, 24.17, 71.25 }, { 1426, 26.17, 71.16 }, { 1426, 25.37, 68.46 }, { 1426, 23.43, 68.45 }, { 1426, 21.23, 69.36 }, { 1426, 19.94, 71.37 } }, why = { kind = "level", levels = { 3, 5 } } }, -- level 3
        { turnin = 234 }, -- level 4
        { accept = 3364 }, -- level 4
        { go = { 1426, 28.84, 69.11 }, text = "Head indoors" }, -- level 4
        { accept = 3361, -- level 4
          note = "The NPC is indoors." },
        { turnin = 98574, races = { "Gnome" }, classes = { "PRIEST" } }, -- level 4
        { turnin = 3364, accept = 3365, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3106, races = { "Dwarf" }, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 912, races = { "Dwarf" }, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3109, races = { "Dwarf" }, classes = { "ROGUE" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 916, races = { "Dwarf" }, classes = { "ROGUE" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3110, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 837, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3107, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 926, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3108, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 895, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3112, races = { "Gnome" }, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 912, races = { "Gnome" }, classes = { "WARRIOR" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3113, races = { "Gnome" }, classes = { "ROGUE" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 916, races = { "Gnome" }, classes = { "ROGUE" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3114, races = { "Gnome" }, classes = { "MAGE" }, -- level 4
          note = "The NPC is indoors." },
        { train = true, talk = 944, races = { "Gnome" }, classes = { "MAGE" }, -- level 4
          note = "The NPC is indoors." },
        { turnin = 3115, accept = 1599, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 4
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 460, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 4
          note = "The NPC is indoors, one floor up." },
        { go = { 1426, 28.82, 69.03 }, text = "Step back outside" }, -- level 4
        { turnin = 170 }, -- level 4
        { accept = 182 }, -- level 4
        { turnin = 3365, sticky = 182 }, -- level 4
        { complete = 1599, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 4
          note = "They are rare and scattered widely. Your targets are within the cavern." },
        { go = { 1426, 26.84, 79.8 }, deathskip = true, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Die on purpose at this spot", -- level 4
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1426, 29.61, 69.86 }, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 4
        { talk = 6491, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 4
        { go = { 1426, 26.84, 79.8 }, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Head out of the cave" }, -- level 4
        { go = { 1426, 28.84, 69.11 }, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors" }, -- level 4
        { turnin = 1599, when = { ready = 1599 }, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 4
          note = "The NPC is indoors, one floor up." },
        { vendor = true, talk = 6376, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 4
        { go = { 1426, 28.82, 69.03 }, text = "Step back outside" }, -- level 4
        { complete = 3361 }, -- level 4
        { complete = 3361 }, -- level 4
        { complete = 3361 }, -- level 4
        { complete = 182, -- level 4
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1426, 26.84, 79.8 }, text = "Head out of the cave" }, -- level 4
        { turnin = 182, accept = 218 }, -- level 4
        { go = { 1426, 26.86, 79.92 }, text = "Go into the cavern" }, -- level 5
        { complete = 218, -- level 5
          note = "Your targets are within the cavern." },
        { go = { 1426, 26.84, 79.8 }, text = "Head out of the cave" }, -- level 5
        { turnin = 218, accept = 282 }, -- level 5
        { level = 5, xp = 2600, patrol = { { 1426, 26.84, 79.8 }, { 1426, 25.15, 79.15 }, { 1426, 22.85, 79.37 }, { 1426, 20.23, 75.86 }, { 1426, 29.43, 79.04 }, { 1426, 30.37, 81.96 }, { 1426, 28.34, 82.65 } }, why = { kind = "level", levels = { 5, 8 } }, -- level 5
          note = "With the coming hand-ins, this gets you to level 6. Targets are in the cavern and around its entrance too." },
        { go = { 1426, 26.84, 79.8 }, deathskip = true, text = "Die on purpose at this spot", -- level 5
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1426, 29.61, 69.86 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 5
        { talk = 6491 }, -- level 5
        { go = { 1426, 28.84, 69.11 }, text = "Head indoors" }, -- level 5
        { accept = 97277, races = { "Dwarf", "Gnome" } }, -- level 5
        { turnin = 3361, -- level 5
          note = "The NPC is indoors." },
        { complete = 97277, races = { "Dwarf", "Gnome" } }, -- level 6
        { turnin = 97277, races = { "Dwarf", "Gnome" } }, -- level 6
        { train = true, talk = 912, classes = { "WARRIOR" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 916, classes = { "ROGUE" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 837, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 926, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 895, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 944, races = { "Gnome" }, classes = { "MAGE" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 460, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { go = { 1426, 28.84, 69.11 }, text = "Step back outside" }, -- level 6
        { turnin = 282, accept = 420 }, -- level 6
        { accept = 96628, races = { "Dwarf", "Gnome" } }, -- level 6
        { accept = 2160 }, -- level 6
        { go = { 1426, 34.08, 71.46 }, text = "Pass through the tunnel, then stay on the road" }, -- level 6
        { accept = 98322, races = { "Dwarf", "Gnome" } }, -- level 6
        { turnin = 98322, races = { "Dwarf", "Gnome" } }, -- level 6
        { turnin = 420 }, -- level 6
        { accept = 384, when = { item = 2894 } }, -- level 6
        { turnin = 2160, -- level 6
          note = "The NPC is indoors." },
        { accept = 5625, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors." },
        { complete = 5625, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 6
          note = "Heal Mountaineer Dolf with Lesser Heal (Rank 2). Buff Mountaineer Dolf with Power Word: Fortitude." },
        { turnin = 5625, when = { ready = 5625 }, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors." },
        { accept = 400 }, -- level 6
        { go = { 1426, 45.38, 51.97 }, classes = { "WARRIOR", "PALADIN", "ROGUE" }, text = "Learn Blacksmithing from the trainer" }, -- level 6
        { accept = 98321, races = { "Dwarf", "Gnome" } }, -- level 6
        { talk = 1241, classes = { "WARRIOR", "PALADIN", "ROGUE" }, -- level 6
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { talk = 1690, buy = { { 2901, 1, 1690 } }, classes = { "WARRIOR", "PALADIN", "ROGUE" }, -- level 6
          note = "The NPC is indoors." },
        { accept = 317 }, -- level 6
        { accept = 313 }, -- level 6
        { turnin = 400 }, -- level 6
        { accept = 5541 }, -- level 6
        { go = { 1426, 49.97, 50.25 }, classes = { "WARRIOR", "PALADIN", "ROGUE" }, text = "Learn Mining from the trainer" }, -- level 6
        { turnin = 96628, races = { "Dwarf", "Gnome" } }, -- level 6
        { talk = 5392, sticky = 317, classes = { "WARRIOR", "PALADIN", "ROGUE" }, -- level 6
          note = "The NPC waits on the lower level, indoors." },
        { complete = 5541 }, -- level 6
        { complete = 313, -- level 6
          note = "The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { level = 7, patrol = { { 1426, 42.27, 53.97 }, { 1426, 41.43, 51.17 }, { 1426, 41.57, 48.94 }, { 1426, 39.64, 48.75 }, { 1426, 39.45, 46.16 }, { 1426, 41.57, 45.34 } }, why = { kind = "level", levels = { 6, 10 } }, -- level 6
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1426, 42.26, 54.1 }, text = "Head out of the cave" }, -- level 7
        { turnin = 5541 }, -- level 7
        { complete = 317 }, -- level 7
        { collect = { { 769, 4 }, { 2886, 6 } }, keep = { 769, 2886 } }, -- level 7
        { accept = 287 }, -- level 7
        { talk = 1247, buy = { { 2894, 1, 1247 } }, -- level 7
          note = "The NPC is indoors." },
        { turnin = 384, when = { item = 2894 } }, -- level 7
        { turnin = 317, accept = 318 }, -- level 7
        { turnin = 313 }, -- level 7
        { accept = 99158, races = { "Dwarf", "Gnome" }, classes = { "PRIEST" } }, -- level 7
        { level = 8, patrol = { { 1426, 44.14, 48.65 }, { 1426, 43.24, 45.43 }, { 1426, 47.46, 50.35 }, { 1426, 50.15, 52.54 }, { 1426, 44.44, 55.16 }, { 1426, 43.85, 51.94 }, { 1426, 45.43, 58.63 }, { 1426, 41.34, 59.16 } }, why = { kind = "level", levels = { 6, 10 } } }, -- level 7
        { train = true, talk = 1231, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 7
        { train = true, talk = 5612, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 7
        { vendor = true, talk = 6328, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 7
        { train = true, talk = 1228, races = { "Gnome" }, classes = { "MAGE" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 1232, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 7
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 1226, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 7
          note = "The NPC is indoors." },
        { train = true, talk = 1234, classes = { "ROGUE" }, -- level 7
          note = "The NPC is indoors." },
        { train = true, talk = 1229, classes = { "WARRIOR" }, -- level 8
          note = "The NPC is indoors." },
        { go = { 1426, 47.13, 52.58 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn First Aid from the trainer" }, -- level 8
        { talk = 2326, classes = { "WARRIOR", "ROGUE" }, -- level 8
          note = "The NPC is indoors. Do it only if you can." },
        { accept = 412, -- level 8
          note = "The NPC is indoors." },
        { complete = 98321, races = { "Dwarf", "Gnome" } }, -- level 8
        { go = { 1426, 39.55, 47.95 }, elite = true, text = "Stay on the trail" }, -- level 8
        { accept = 312, elite = true, -- level 8
          note = "Steer clear of the elite yeti patrolling close by. The NPC is up on the summit." },
        { complete = 312, elite = true, -- level 8
          note = "Let the elite yeti stroll off before you go near. Your objective lies in a little cavern. Go quickly, time is short." },
        { turnin = 312, elite = true, -- level 8
          note = "Steer clear of the elite yeti patrolling close by. The NPC is up on the summit." },
        { turnin = 318, accept = { 319, 315 } }, -- level 8
        { accept = 310 }, -- level 8
        { complete = 315, -- level 8
          note = "Look for the timber baskets." },
        { complete = 319 }, -- level 8
        { turnin = 98321, races = { "Dwarf", "Gnome" } }, -- level 8
        { accept = 98326, races = { "Dwarf", "Gnome" } }, -- level 8
        { complete = 98326, races = { "Dwarf", "Gnome" } }, -- level 8
        { turnin = 98326, races = { "Dwarf", "Gnome" } }, -- level 8
        { go = { 1426, 30.44, 42.25 }, deathskip = true, text = "Die on purpose at this spot", -- level 8
          note = "Die to the monsters here on purpose. Any spot around Brewnall Village works. Dying costs you nothing this early." },
        { deathskip = true, revive = { 1426, 47.02, 55.13 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 8
        { talk = 6491 }, -- level 8
        { sethearth = "Thunderbrew Distillery", talk = 1247, -- level 8
          note = "The NPC is indoors." },
        { talk = 1247, buy = { { 2686, 1, 1247 } }, -- level 8
          note = "The NPC is indoors." },
        { turnin = 310, accept = 311, -- level 8
          note = "Give it a few seconds. The object is on the lower level, indoors." },
        { go = { 1426, 41.95, 47.28 }, text = "Stay on the trail" }, -- level 8
        { turnin = 311 }, -- level 8
        { turnin = { 319, 315 }, accept = { 320, 413 } }, -- level 8
        { level = 9, sticky = 287, patrol = { { 1426, 30.44, 42.25 }, { 1426, 28.05, 42.14 }, { 1426, 25.75, 46.37 }, { 1426, 28.65, 47.45 }, { 1426, 32.57, 47.84 }, { 1426, 35.43, 46.46 }, { 1426, 37.84, 42.37 }, { 1426, 31.56, 38.05 }, { 1426, 30.86, 35.37 }, { 1426, 34.54, 35.37 }, { 1426, 37.77, 34.44 }, { 1426, 34.54, 31.54 }, { 1426, 28.44, 52.65 }, { 1426, 26.35, 55.36 } } }, -- level 9
        { go = { 1426, 24.9, 50.94 }, text = "Go into the cavern" }, -- level 9
        { complete = 287, -- level 9
          note = "Head to the lower level of the cavern." },
        { complete = 287, -- level 9
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1426, 25.1, 50.95 }, text = "Head out of the cave" }, -- level 9
        { complete = 412 }, -- level 9
        { level = 9, xp = 4300, patrol = { { 1426, 24.34, 42.96 }, { 1426, 25.94, 41.83 }, { 1426, 24.44, 39.77 }, { 1426, 27.05, 36.46 }, { 1426, 25.43, 45.57 } }, why = { kind = "level", levels = { 8, 11 } }, -- level 9
          note = "With the coming turn-ins, this gets you to level 10." },
        { go = { 1426, 31.03, 32.59 }, text = "Climb the trail", -- level 9
          note = "Once in the Wetlands, head north. Leap down from the ledge. This makes Menethil Harbor quicker to get to." },
        { go = { 1426, 31.48, 32.3 }, text = "Keep climbing the trail" }, -- level 9
        { go = { 1426, 31.1, 30.54 }, text = "Keep climbing the trail" }, -- level 9
        { go = { 1426, 32.37, 28.67 }, text = "Take the trail downhill" }, -- level 9
        { go = { 1426, 32.69, 27.08 }, text = "Stay on the trail" }, -- level 9
        { go = { 1437, 11.75, 43.24 }, deathskip = true, text = "Die on purpose at this spot" }, -- level 9
        { deathskip = true, revive = { 1437, 11.75, 43.24 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 9
        { talk = 6491 }, -- level 9
        { go = { 1437, 10.19, 56.4 }, text = "Step back outside" }, -- level 9
        { go = { 1437, 9.53, 59.72 }, fly = true, talk = 1571, text = "Fly to Menethil Harbor" }, -- level 9
        { turnin = 287, accept = 291, why = { kind = "carry", quest = 291, seconds = 4080, xp = 400 } }, -- level 9
        { turnin = 412, -- level 9
          note = "The NPC is indoors." },
        { turnin = 320 }, -- level 9
        { turnin = 99158, races = { "Dwarf", "Gnome" }, classes = { "PRIEST" } }, -- level 9
        { accept = 99159, races = { "Dwarf", "Gnome" } }, -- level 10
        { complete = 99159, races = { "Dwarf", "Gnome" } }, -- level 10
        { turnin = 99159, races = { "Dwarf", "Gnome" } }, -- level 10
        { accept = 95212, races = { "Dwarf", "Gnome" } }, -- level 10
        { complete = 95212, races = { "Dwarf", "Gnome" } }, -- level 10
        { turnin = 95212, races = { "Dwarf", "Gnome" } }, -- level 10
        { accept = 99160, races = { "Dwarf", "Gnome" } }, -- level 10
        { complete = 99160, races = { "Dwarf", "Gnome" } }, -- level 10
        { turnin = 99160, races = { "Dwarf", "Gnome" } }, -- level 10
        { accept = 99162, races = { "Dwarf", "Gnome" } }, -- level 10
        { complete = 99162, races = { "Dwarf", "Gnome" } }, -- level 10
        { turnin = 99162, races = { "Dwarf", "Gnome" } }, -- level 10
        { train = true, talk = 5612, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 10
        { vendor = true, talk = 6328, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 10
        { train = true, talk = 1228, races = { "Gnome" }, classes = { "MAGE" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 1232, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 1226, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 5637, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 1234, classes = { "ROGUE" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 1229, classes = { "WARRIOR" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 1231, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { accept = 6064, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { complete = 6064, useitem = 15911, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 10
          note = "Target one Large Crag Boar with it." },
        { turnin = 6064, when = { ready = 6064 }, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { accept = 6084, when = { done = 6064 }, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { complete = 6084, useitem = 15913, when = { log = 6084 }, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 10
          note = "Use it on any Snow Leopard." },
        { turnin = 6084, when = { ready = 6084 }, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { accept = 6085, when = { done = 6084 }, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { complete = 6085, useitem = 15908, when = { log = 6085 }, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 10
          note = "Target any Ice Claw Bear with the item." },
        { turnin = 6085, when = { ready = 6085 }, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { accept = 6086, when = { done = 6085 }, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { turnin = 6086, when = { log = 6086 }, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { train = true, talk = 10090, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors." },
        { talk = 5124, buy = { { 117, 1, 5124 } }, patrol = { { 1455, 64.2, 79.07 }, { 1455, 60.47, 83.8 }, { 1455, 57.46, 83.92 }, { 1455, 56.71, 82.22 }, { 1455, 57.68, 78.33 }, { 1455, 61.27, 73.29 }, { 1455, 64.45, 69.68 }, { 1455, 66.55, 69.45 }, { 1455, 68, 70.97 }, { 1455, 67.33, 74.11 }, { 1455, 65.78, 76.95 } }, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 10
          note = "This one roams, so scan the surrounding area. Keep it as pet food for later." },
        { vendor = true, talk = 5124, races = { "Dwarf" }, classes = { "HUNTER" } }, -- level 10
        { go = { 1426, 51.83, 44.46 }, races = { "Dwarf" }, classes = { "HUNTER" }, text = "Tame a pet here", -- level 10
          note = "Find one Ice Claw Bear and use Tame Beast on it. Push eastward if you still need more." },
        { accept = 433 }, -- level 10
        { accept = 432, sticky = 432 }, -- level 10
        { complete = 433, -- level 10
          note = "Your targets are within the cavern." },
        { complete = 432, -- level 10
          note = "Targets are in the cavern and around its entrance too." },
        { collect = { { 2589, 10 } }, keep = 2589, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 10
          note = "Targets are in the cavern and around its entrance too. Hold on to it: a Paladin task coming up uses it." },
        { go = { 1426, 70.67, 56.43 }, text = "Head out of the cave" }, -- level 10
        { turnin = 433 }, -- level 10
        { turnin = 432 }, -- level 10
        { go = { 1426, 68.34, 54.54 }, text = "Learn Cooking from the trainer" }, -- level 10
        { talk = 1355, -- level 10
          note = "This one roams, so scan the surrounding area. Without this, one quest can't be picked up." },
        { accept = 419, -- level 10
          note = "The NPC is past the tunnel; stay on the road." },
        { turnin = 419, accept = 417 }, -- level 10
        { complete = 417, -- level 10
          note = "The target is a pale bear. This one roams, so scan the surrounding area." },
        { turnin = 417 }, -- level 10
        { turnin = 413, accept = 414, -- level 10
          note = "Keep to the road as it crosses the underground passages." },
        { accept = 224 }, -- level 10
        { accept = 267, -- level 10
          note = "The NPC is indoors, one floor up." },
        { go = { 1432, 33.9, 50.98 }, fly = true, talk = 1572, text = "Fly to Thelsamar" }, -- level 10
        { turnin = 414, accept = 1339, patrol = { { 1432, 32.7, 49.76 }, { 1432, 33.3, 49.22 }, { 1432, 33.91, 48.42 }, { 1432, 34.36, 47.6 }, { 1432, 34.87, 47 }, { 1432, 35.6, 46.71 }, { 1432, 36.12, 46.32 }, { 1432, 37.14, 45.96 }, { 1432, 37.26, 45.56 }, { 1432, 37.33, 44.48 }, { 1432, 37.23, 43.29 }, { 1432, 36.68, 42.04 } }, -- level 10
          note = "The NPC patrols a long route; look along it." },
        { turnin = 1339, accept = 1338, -- level 10
          note = "The NPC is indoors, one floor up." },
        { go = { 1432, 29.79, 16.03 }, deathskip = true, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. This is the quickest way over." },
        { deathskip = true, revive = { 1432, 32.48, 47 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491 }, -- level 11
        { sethearth = "Stoutlager Inn", talk = 6734, -- level 11
          note = "The NPC is indoors." },
        { accept = 6387, -- level 11
          note = "The NPC can be indoors or out." },
        { turnin = 6387, accept = 6391 }, -- level 11
        { go = { 1455, 61.12, 89.58 }, races = { "Gnome" }, classes = { "WARRIOR" }, text = "Learn Two-Handed Axes and Two-Handed Maces at the weapon master" }, -- level 11
        { go = { 1455, 61.12, 89.58 }, races = { "Dwarf" }, classes = { "WARRIOR" }, text = "Learn Two-Handed Maces at the weapon master" }, -- level 11
        { talk = 11865, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1455, 62.27, 89.56 }, classes = { "WARRIOR" }, text = "Learn Thrown at the weapon master" }, -- level 11
        { talk = 13084, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1455, 44.51, 49.54 }, text = "Stay on the trail" }, -- level 11
        { turnin = 291 }, -- level 11
        { accept = 94817, races = { "Gnome" }, classes = { "PRIEST" } }, -- level 11
        { turnin = 6391, accept = 6388, -- level 11
          note = "The NPC waits on the lower level, indoors." },
        { accept = 1715, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 11
        { turnin = 6388, accept = 6392, why = { kind = "carry", quest = 6392, seconds = 6600, xp = 1100 } }, -- level 11
        { go = { 1455, 76.62, 51.1 }, text = "Head down into the Deeprun Tram station", -- level 11
          note = "Pass through the portal to teleport." },
        { accept = 6661, -- level 11
          note = "The NPC stands by the wall on the central platform. Head to the Deeprun Tram's Ironforge platform." },
        { complete = 6661, useitem = 17117, -- level 11
          note = "Target the Deeprun Rats with the item. Look for little gray rodents. Head to the Deeprun Tram's Ironforge platform." },
        { turnin = 6661, accept = 6662, -- level 11
          note = "The NPC stands by the wall on the central platform. Head to the Deeprun Tram's Ironforge platform." },
        { turnin = 6662, -- level 11
          note = "Take the Deeprun Tram over to Stormwind City. The NPC stands by the wall on the central platform." },
        { accept = 353, why = { kind = "carry", quest = 353, seconds = 7320, xp = 1100 }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 1338 }, -- level 11
        { accept = 1638, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { turnin = 1638, accept = 1639, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 1639, accept = 1640, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors. Be ready for a fight right away." },
        { complete = 1640, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { turnin = 1640, when = { ready = 1640 }, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { accept = 1665, when = { done = 1640 }, classes = { "WARRIOR" } }, -- level 11
        { turnin = 1665, when = { log = 1665 }, classes = { "WARRIOR" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Dwarf" }, classes = { "PRIEST" }, text = "Head indoors" }, -- level 11
        { turnin = 5637, races = { "Dwarf" }, classes = { "PRIEST" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 42.28, 81.85 }, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors" }, -- level 11
        { turnin = 1715, accept = 1688, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 11
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 63.92, 69.12 }, classes = { "WARRIOR" }, text = "Learn Two-Handed Swords and Staves at the weapon master" }, -- level 11
        { go = { 1453, 63.92, 69.12 }, classes = { "PALADIN" }, text = "Learn Two-Handed Swords at the weapon master" }, -- level 11
        { go = { 1453, 63.92, 69.12 }, classes = { "ROGUE" }, text = "Learn Swords at the weapon master" }, -- level 11
        { go = { 1453, 63.92, 69.12 }, classes = { "PRIEST" }, text = "Learn Staves at the weapon master" }, -- level 11
        { go = { 1453, 63.92, 69.12 }, classes = { "MAGE" }, text = "Learn Swords and Daggers at the weapon master" }, -- level 11
        { go = { 1453, 63.92, 69.12 }, classes = { "WARLOCK" }, text = "Learn Swords and Staves at the weapon master" }, -- level 11
        { talk = 11867, classes = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "MAGE", "WARLOCK" }, -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 68.01, 72.6 }, text = "Head up the incline", -- level 11
          note = "The NPC is indoors." },
        { go = { 1453, 70.92, 72.47 }, fly = true, talk = 352, text = "Flight master in Stormwind" }, -- level 11
        { accept = 40, why = { chain = 5, kind = "detour", quest = 40, quests = 8, seconds = 300, short = true, total = 2900, xp = 2400 } }, -- level 11
        { accept = 94792, races = { "Dwarf", "Gnome" }, classes = { "HUNTER" } }, -- level 11
        { turnin = 40, accept = 35 }, -- level 11
        { accept = 95998, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 95998, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 95998, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 99127, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 99127, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 99127, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 99143, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 99143, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 99143, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 91723, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 91723, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 91723, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 91725, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 96626, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 96626, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 96626, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 99128, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 99128, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 99128, races = { "Dwarf", "Gnome" } }, -- level 11
        { accept = 99129, races = { "Dwarf", "Gnome" } }, -- level 11
        { turnin = 35, accept = { 37, 52 }, sticky = 52 }, -- level 11
        { turnin = 37, accept = 45 }, -- level 11
        { accept = 5545, sticky = 5545 }, -- level 11
        { turnin = 45, accept = 71 }, -- level 11
        { complete = 5545, -- level 11
          note = "Look for little stacks of brown wood. Look around tree trunks at ground level." },
        { accept = 91732, races = { "Dwarf", "Gnome" } }, -- level 11
        { complete = 52 }, -- level 11
        { complete = 52, -- level 12
          note = "The targets are wolves." },
        { turnin = 5545 }, -- level 12
        { accept = 83 }, -- level 12
        { turnin = { 52, 71 }, accept = { 39, 109 }, sticky = 83, why = { kind = "carry", quest = 109, seconds = 6780, xp = 600 } }, -- level 12
        { complete = 1688, talk = 881, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 12
          note = "The NPC is indoors." },
        { complete = 83 }, -- level 12
        { accept = 91733, races = { "Dwarf", "Gnome" } }, -- level 12
        { complete = 91733, races = { "Dwarf", "Gnome" } }, -- level 12
        { turnin = 91733, races = { "Dwarf", "Gnome" } }, -- level 12
        { complete = 94792, races = { "Dwarf", "Gnome" }, classes = { "HUNTER" } }, -- level 12
        { accept = 184, useitem = 1972, when = { item = 1972 }, why = { kind = "carry", quest = 184, seconds = 5580, xp = 600 } }, -- level 12
        { turnin = 83, -- level 12
          note = "The NPC waits outside, at the building's front." },
        { level = 12, patrol = { { 1429, 78.34, 75.65 }, { 1429, 75.43, 76.45 }, { 1429, 75.36, 73.35 }, { 1429, 77.35, 78.86 }, { 1429, 80.44, 78.95 }, { 1429, 81.55, 76.17 }, { 1429, 85.57, 78.97 }, { 1429, 88.06, 80.76 }, { 1429, 85.26, 82.46 }, { 1429, 85.76, 85.83 }, { 1429, 81.03, 84.03 }, { 1429, 78.04, 82.46 }, { 1429, 87.37, 75.36 }, { 1429, 87.65, 72.23 }, { 1429, 87.14, 68.97 }, { 1429, 85.34, 66.23 }, { 1429, 87.64, 63.17 }, { 1429, 84.43, 62.66 }, { 1429, 83.37, 59.24 }, { 1429, 86.54, 59.84 }, { 1429, 79.96, 59.23 }, { 1429, 78.95, 62.56 }, { 1429, 76.45, 60.75 }, { 1429, 76.06, 64.76 }, { 1429, 72.37, 65.23 }, { 1429, 84.37, 71.16 }, { 1429, 89.74, 77.97 } } }, -- level 12
        { accept = 244, -- level 12
          note = "This one roams, so scan the surrounding area." },
        { turnin = 244, -- level 12
          note = "Stay on the road and watch for danger. Foes in this area outlevel you." },
        { go = { 1433, 25.46, 59.37 }, fly = true, talk = 931, text = "Fly to Lakeshire" }, -- level 12
        { go = { 1453, 42.28, 81.85 }, races = { "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 12
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 12
        { turnin = 1688, when = { ready = 1688 }, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 12
          note = "The NPC waits on the lower level, indoors." },
        { accept = 1689, when = { done = 1688 }, races = { "Gnome" }, classes = { "WARLOCK" } }, -- level 12
        { complete = 1689, useitem = 6928, when = { log = 1689 }, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 12
          note = "Step onto the pink rune. Look within the tomb. The target is on the lower level, indoors." },
        { turnin = 1689, when = { ready = 1689 }, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 12
          note = "The NPC stands one level over the crypt. The NPC waits on the lower level, indoors." },
        { vendor = true, talk = 5520, races = { "Gnome" }, classes = { "WARLOCK" }, -- level 12
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 5498, races = { "Gnome" }, classes = { "MAGE" }, -- level 12
          note = "The NPC waits on the tower's highest floor." },
        { train = true, talk = 5515, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 12
          note = "The NPC is indoors." },
        { train = true, talk = 2879, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 12
          note = "The NPC is indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors", -- level 12
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 12
        { go = { 1453, 52.93, 51.05 }, races = { "Dwarf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 12
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Dwarf" }, classes = { "PRIEST" } }, -- level 12
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 12
        { accept = 2999, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC is indoors." },
        { turnin = 2999, accept = 1645, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { turnin = 1645, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 12
        { accept = 1646, useitem = 6916, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 12
        { turnin = 1646, accept = 1647, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { turnin = 1647, accept = 1648, patrol = { { 1455, 21.81, 51.72 }, { 1455, 21.94, 54.69 }, { 1455, 22.76, 58.43 }, { 1455, 23.36, 61.85 }, { 1455, 23.69, 63.83 }, { 1455, 25.75, 67.94 }, { 1455, 27.51, 71.36 }, { 1455, 31.78, 78.22 }, { 1455, 36.28, 81.27 }, { 1455, 39.78, 83.19 }, { 1455, 42.89, 84.04 } }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC roams a wide loop; look along it." },
        { turnin = 1648, patrol = { { 1455, 21.81, 51.72 }, { 1455, 21.94, 54.69 }, { 1455, 22.76, 58.43 }, { 1455, 23.36, 61.85 }, { 1455, 23.69, 63.83 }, { 1455, 25.75, 67.94 }, { 1455, 27.51, 71.36 }, { 1455, 31.78, 78.22 }, { 1455, 36.28, 81.27 }, { 1455, 39.78, 83.19 }, { 1455, 42.89, 84.04 } }, when = { ready = 1648 }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC roams a wide loop; look along it. You likely gathered 10 Linen Cloth already." },
        { accept = 1778, when = { done = 1648 }, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 12
        { turnin = 1778, when = { log = 1778 }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { accept = 1779, when = { done = 1778 }, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 12
        { turnin = 1779, when = { log = 1779 }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { accept = 1783, when = { done = 1779 }, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 12
        { accept = 418, -- level 12
          note = "The NPC is indoors." },
        { accept = 416, patrol = { { 1432, 32.7, 49.76 }, { 1432, 33.3, 49.22 }, { 1432, 33.91, 48.42 }, { 1432, 34.36, 47.6 }, { 1432, 34.87, 47 }, { 1432, 35.6, 46.71 }, { 1432, 36.12, 46.32 }, { 1432, 37.14, 45.96 }, { 1432, 37.26, 45.56 }, { 1432, 37.33, 44.48 }, { 1432, 37.23, 43.29 }, { 1432, 36.68, 42.04 } }, -- level 12
          note = "The NPC patrols a long route; look along it." },
        { turnin = 6392, -- level 12
          note = "The NPC can be indoors or out." },
        { complete = 416, -- level 12
          note = "The targets are rat-like humanoids." },
        { turnin = 353, -- level 12
          note = "The NPC is indoors, one floor up." },
        { collect = { { 3172, 3 } }, keep = 3172 }, -- level 12
        { collect = { { 3174, 3 } }, keep = 3174, -- level 12
          note = "Hunt spiders for it." },
        { collect = { { 3173, 3 } }, keep = 3173 }, -- level 12
        { turnin = 416, patrol = { { 1432, 32.7, 49.76 }, { 1432, 33.3, 49.22 }, { 1432, 33.91, 48.42 }, { 1432, 34.36, 47.6 }, { 1432, 34.87, 47 }, { 1432, 35.6, 46.71 }, { 1432, 36.12, 46.32 }, { 1432, 37.14, 45.96 }, { 1432, 37.26, 45.56 }, { 1432, 37.33, 44.48 }, { 1432, 37.23, 43.29 }, { 1432, 36.68, 42.04 } }, -- level 12
          note = "The NPC patrols a long route; look along it." },
        { turnin = 418, sticky = 224, when = { ready = 418 }, -- level 12
          note = "The NPC is indoors." },
        { go = { 1432, 29.26, 66.68 }, text = "Take the road to where the trail starts" }, -- level 13
        { complete = 267 }, -- level 13
        { complete = 224 }, -- level 13
        { go = { 1432, 30.62, 69.75 }, text = "Exit Stonesplinter Valley, then stay on the road" }, -- level 13
        { turnin = 224 }, -- level 13
        { turnin = 267, -- level 13
          note = "The NPC is indoors, one floor up." },
        { turnin = 1783, useitem = 6866, when = { ready = 1783 }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 13
          note = "Narm Faulk lies dead; use the item on his body. Wait for the talking to finish" },
        { accept = 1784, when = { done = 1783 }, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 13
        { complete = 1784, when = { log = 1784 }, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 13
        { turnin = 1784, when = { ready = 1784 }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 13
          note = "The NPC is indoors, one floor up." },
        { accept = 1785, when = { done = 1784 }, races = { "Dwarf" }, classes = { "PALADIN" } }, -- level 13
        { turnin = 1785, when = { log = 1785 }, races = { "Dwarf" }, classes = { "PALADIN" }, -- level 13
          note = "The NPC is indoors, one floor up." },
        { turnin = 39, why = { kind = "detour", quest = 39, quests = 2, seconds = 120, total = 1300, xp = 1100 } }, -- level 13
        { turnin = 94792, races = { "Dwarf", "Gnome" }, classes = { "HUNTER" } }, -- level 13
        { turnin = 99129, races = { "Dwarf", "Gnome" } }, -- level 13
    },
})
