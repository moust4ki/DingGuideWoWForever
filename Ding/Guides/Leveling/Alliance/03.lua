-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/03.lua.
-- Simulated (warrior): NightElf 1 (0%) -> 14 (5%) in 8 h 05, 85 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a03-night-elf-starter",
    title    = "Night Elf start (1-13)",
    faction  = "Alliance",
    races    = { "NightElf" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-a04-westfall",
    leftOut  = {
        [483] = { kind = "detour", seconds = 60, xp = 800 },
        [486] = { kind = "prereq" },
        [730] = { kind = "away" },
        [941] = { kind = "prereq" },
        [951] = { kind = "log" },
        [981] = { kind = "version" },
        [1143] = { kind = "version" },
        [2399] = { kind = "detour", seconds = 120, xp = 90 },
        [2498] = { kind = "prereq" },
        [2499] = { kind = "prereq" },
        [2519] = { kind = "detour", seconds = 60, xp = 90 },
        [2541] = { kind = "detour", seconds = 360, xp = 700 },
        [4510] = { kind = "prereq" },
        [7792] = { kind = "log" },
        [7798] = { kind = "log" },
        [96634] = { kind = "prereq" },
        [98067] = { kind = "away" },
        [98403] = { kind = "version" },
    },
    steps    = {
        { destroy = 6948, -- level 1
          note = "Teldrassil: Shadowglen, where night elves start. This frees room in your bags. You receive one further along the route." },
        { go = { 1438, 58.24, 45.44 }, classes = { "WARRIOR" }, text = "Loot the beasts you kill on the way here", -- level 1
          note = "Pick up anything that sells for 10 copper or more." },
        { vendor = true, talk = 6091, classes = { "WARRIOR" }, -- level 1
          note = "The NPC is indoors at street level." },
        { train = true, talk = 3593, classes = { "WARRIOR" }, -- level 1
          note = "The NPC is indoors at street level." },
        { accept = 456 }, -- level 1
        { complete = 456 }, -- level 1
        { accept = 4495 }, -- level 2
        { accept = 458 }, -- level 2
        { turnin = 456, accept = 457 }, -- level 2
        { accept = 3116, classes = { "WARRIOR" } }, -- level 2
        { accept = 3118, classes = { "ROGUE" } }, -- level 2
        { accept = 3119, classes = { "PRIEST" } }, -- level 2
        { accept = 3117, classes = { "HUNTER" } }, -- level 2
        { accept = 3120, classes = { "DRUID" } }, -- level 2
        { turnin = 3116, classes = { "WARRIOR" }, -- level 2
          note = "The NPC is indoors." },
        { train = true, talk = 3593, classes = { "WARRIOR" }, -- level 2
          note = "The NPC is indoors at street level." },
        { turnin = 3118, classes = { "ROGUE" }, -- level 2
          note = "The NPC is indoors at street level." },
        { train = true, talk = 3594, classes = { "ROGUE" }, -- level 2
          note = "The NPC is indoors at street level." },
        { turnin = 3119, floor = "up", classes = { "PRIEST" }, -- level 2
          note = "The NPC is indoors, one floor up." },
        { train = true, floor = "up", talk = 3595, classes = { "PRIEST" }, -- level 2
          note = "The NPC is indoors, one floor up." },
        { go = { 1438, 57.58, 41.68 }, classes = { "HUNTER" }, text = "Climb the big ramp" }, -- level 2
        { turnin = 3117, classes = { "HUNTER" }, -- level 2
          note = "The NPC stands high in the great tree. The NPC stands in an adjoining chamber." },
        { train = true, talk = 3596, classes = { "HUNTER" }, -- level 2
          note = "The NPC stands high in the great tree. The NPC stands in an adjoining chamber." },
        { go = { 1438, 57.58, 41.68 }, classes = { "DRUID" }, text = "Climb the big ramp" }, -- level 2
        { turnin = 3120, classes = { "DRUID" }, -- level 2
          note = "The NPC stands high in the great tree. The NPC stands in an adjoining chamber." },
        { train = true, talk = 3597, classes = { "DRUID" }, -- level 2
          note = "The NPC stands high in the great tree. The NPC stands in an adjoining chamber." },
        { turnin = 458, accept = 459 }, -- level 2
        { accept = 97977, races = { "NightElf" } }, -- level 2
        { complete = 97977, races = { "NightElf" } }, -- level 2
        { complete = 459, -- level 2
          note = "The targets are imps." },
        { level = 3, patrol = { { 1438, 56.11, 45.88 }, { 1438, 54.81, 43.98 }, { 1438, 56.37, 41.43 } } }, -- level 3
        { accept = 916 }, -- level 3
        { complete = 457, sticky = 916 }, -- level 3
        { turnin = 4495, accept = 3519 }, -- level 3
        { complete = 916, -- level 3
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1438, 56.83, 31.55 }, deathskip = true, text = "Die on purpose at this spot", -- level 3
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1438, 58.66, 42.39 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 3
        { talk = 6491 }, -- level 4
        { go = { 1438, 56.72, 31.49 }, text = "Head out of the cave" }, -- level 4
        { turnin = 916, accept = 917 }, -- level 4
        { turnin = 457 }, -- level 4
        { turnin = 459 }, -- level 4
        { turnin = 97977, races = { "NightElf" } }, -- level 5
        { turnin = 3519, accept = 3521 }, -- level 5
        { train = true, talk = 3593, classes = { "WARRIOR" }, -- level 5
          note = "The NPC is indoors at street level." },
        { train = true, talk = 3594, classes = { "ROGUE" }, -- level 5
          note = "The NPC is indoors at street level." },
        { train = true, floor = "up", talk = 3595, classes = { "PRIEST" }, -- level 5
          note = "The NPC is indoors, one floor up." },
        { go = { 1438, 57.58, 41.68 }, classes = { "HUNTER" }, text = "Climb the big ramp", -- level 5
          note = "The NPC stands high in the great tree. The NPC stands in an adjoining chamber." },
        { train = true, talk = 3596, classes = { "HUNTER" } }, -- level 5
        { go = { 1438, 57.58, 41.68 }, classes = { "DRUID" }, text = "Climb the big ramp", -- level 5
          note = "The NPC stands high in the great tree. The NPC stands in an adjoining chamber." },
        { train = true, talk = 3597, classes = { "DRUID" } }, -- level 5
        { complete = 3521, -- level 5
          note = "Look for groups of pink fungi. Mostly found beside tree trunks." },
        { complete = 3521, -- level 5
          note = "Look for big orange blossoms." },
        { level = 5, sticky = 3521, patrol = { { 1438, 59.36, 37.66 }, { 1438, 60.57, 35.56 }, { 1438, 62.15, 34.44 }, { 1438, 60.35, 33.43 }, { 1438, 58.37, 35.16 }, { 1438, 62.44, 37.37 }, { 1438, 61.16, 39.25 }, { 1438, 63.57, 39.44 } } }, -- level 5
        { go = { 1438, 56.75, 31.36 }, text = "Go into the cavern" }, -- level 5
        { go = { 1438, 56.8, 28.9 }, text = "Take the trail downhill" }, -- level 5
        { go = { 1438, 55.71, 25.55 }, text = "Climb the trail" }, -- level 5
        { complete = 917, floor = "up", -- level 5
          note = "Climb to the cave's upper level." },
        { complete = 3521, -- level 5
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1438, 56.83, 31.55 }, deathskip = true, text = "Die on purpose at this spot", -- level 5
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1438, 58.72, 42.48 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 5
        { talk = 6491 }, -- level 5
        { go = { 1438, 56.72, 31.49 }, text = "Head out of the cave" }, -- level 5
        { turnin = 917, accept = 920 }, -- level 5
        { go = { 1438, 57.48, 41.68 }, text = "Climb the big ramp" }, -- level 5
        { turnin = 920, accept = 921, -- level 5
          note = "The NPC stands at the summit of the great tree. The NPC stands in an adjoining chamber." },
        { turnin = 3521, accept = 3522 }, -- level 6
        { complete = 921, useitem = 5185 }, -- level 6
        { turnin = 3522 }, -- level 6
        { level = 6, patrol = { { 1438, 56.83, 31.55 }, { 1438, 55.34, 32.85 }, { 1438, 56.34, 34.63 }, { 1438, 58.04, 34.66 }, { 1438, 57.66, 27.76 }, { 1438, 55.35, 27.95 }, { 1438, 56.25, 24.83 } }, -- level 6
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1438, 56.83, 31.55 }, deathskip = true, text = "Die on purpose at this spot", -- level 6
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1438, 58.72, 42.48 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 6
        { talk = 6491 }, -- level 6
        { go = { 1438, 56.72, 31.49 }, classes = { "PRIEST" }, text = "Head out of the cave" }, -- level 6
        { accept = 5622, floor = "up", classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors, one floor up." },
        { go = { 1438, 56.72, 31.49 }, text = "Head out of the cave" }, -- level 6
        { go = { 1438, 57.48, 41.68 }, text = "Climb the big ramp" }, -- level 6
        { turnin = 921, accept = 928, -- level 6
          note = "The NPC stands at the summit of the great tree. The NPC stands in an adjoining chamber." },
        { accept = 96630, races = { "NightElf" } }, -- level 6
        { accept = 2159 }, -- level 6
        { accept = 488, sticky = 488 }, -- level 6
        { accept = 96606, races = { "NightElf" } }, -- level 6
        { accept = 997 }, -- level 6
        { accept = 475 }, -- level 6
        { turnin = 5622, accept = 5621, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors at street level." },
        { train = true, talk = 3600, classes = { "PRIEST" }, -- level 6
          note = "The NPC is indoors at street level." },
        { go = { 1438, 55.25, 56.78 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn First Aid from the trainer" }, -- level 6
        { talk = 6094, classes = { "WARRIOR", "ROGUE" }, -- level 6
          note = "The NPC is indoors at street level. Do it only if you can." },
        { accept = { 932, 2438 }, floor = "top", -- level 6
          note = "The NPC waits on the tower's highest floor." },
        { accept = 87288, races = { "NightElf" } }, -- level 6
        { train = true, talk = 3598, classes = { "WARRIOR" }, -- level 6
          note = "The NPC is indoors." },
        { turnin = 2159, floor = "up", -- level 6
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 3599, classes = { "ROGUE" }, -- level 6
          note = "The NPC is indoors." },
        { train = true, talk = 3601, classes = { "HUNTER" } }, -- level 6
        { train = true, talk = 3602, classes = { "DRUID" } }, -- level 6
        { turnin = 928, accept = 929 }, -- level 6
        { complete = 5621, classes = { "PRIEST" }, -- level 6
          note = "Heal Sentinel Shaya with Lesser Heal (Rank 2). Buff Sentinel Shaya with Power Word: Fortitude." },
        { go = { 1438, 57.68, 60.67 }, classes = { "DRUID" }, text = "Learn Herbalism from the trainer" }, -- level 6
        { talk = 3604, classes = { "DRUID" }, -- level 6
          note = "The NPC is indoors. Pick up 5 Earthroot while questing. A class quest further on requires this." },
        { turnin = 997 }, -- level 6
        { accept = { 918, 919 }, sticky = 918, -- level 6
          note = "Let the conversation play out." },
        { complete = 919, -- level 6
          note = "Look for brown clumps of roots." },
        { complete = 918 }, -- level 6
        { turnin = { 918, 919 }, accept = 922, sticky = 488, why = { kind = "carry", quest = 922, seconds = 6840, xp = 300 } }, -- level 6
        { complete = 929, useitem = 5619 }, -- level 7
        { turnin = 475, accept = 476, floor = "up", -- level 7
          note = "The NPC is indoors, one floor up." },
        { complete = 2438, -- level 7
          note = "The object is indoors." },
        { complete = 488 }, -- level 7
        { complete = 87288, races = { "NightElf" } }, -- level 7
        { complete = 488, -- level 7
          note = "Kill black-furred tigers." },
        { complete = 488, collect = { { 5465, 7 } }, keep = { 3412, 5465 }, -- level 7
          note = "The targets are spiders with green bodies." },
        { level = 7, xp = 3100, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" }, -- level 7
          note = "Together with the next turn-ins, this brings you to level 8." },
        { level = 7, xp = 3170, patrol = { { 1438, 59.43, 59.17 }, { 1438, 57.46, 56.45 }, { 1438, 60.36, 53.94 }, { 1438, 63.06, 56.63 }, { 1438, 63.14, 60.64 }, { 1438, 62.86, 63.64 }, { 1438, 66.83, 65.17 }, { 1438, 67.06, 61.66 } }, classes = { "PRIEST" } }, -- level 7
        { turnin = 488 }, -- level 7
        { turnin = 96630, races = { "NightElf" } }, -- level 8
        { accept = 489 }, -- level 8
        { turnin = 476 }, -- level 8
        { turnin = 5621, when = { ready = 5621 }, classes = { "PRIEST" }, -- level 8
          note = "The NPC is indoors at street level." },
        { train = true, talk = 3600, classes = { "PRIEST" }, -- level 8
          note = "The NPC is indoors at street level." },
        { turnin = 2438, accept = 2459, floor = "top", -- level 8
          note = "The NPC waits on the tower's highest floor." },
        { accept = 99046, races = { "NightElf" } }, -- level 8
        { train = true, talk = 3598, classes = { "WARRIOR" }, -- level 8
          note = "The NPC is indoors." },
        { train = true, talk = 3599, classes = { "ROGUE" }, -- level 8
          note = "The NPC is indoors." },
        { train = true, talk = 3601, classes = { "HUNTER" } }, -- level 8
        { train = true, talk = 3602, classes = { "DRUID" } }, -- level 8
        { turnin = 929, accept = 933 }, -- level 8
        { go = { 1438, 57.09, 61.36 }, text = "Learn Cooking from the trainer" }, -- level 8
        { talk = 6286, -- level 8
          note = "Without this, one quest can't be picked up." },
        { accept = 4161 }, -- level 8
        { turnin = 4161, sticky = { 489, 2459 }, when = { ready = 4161 } }, -- level 8
        { collect = { { 8049, 1 } }, spots = { { 1438, 69.41, 53.43 } } }, -- level 8
        { complete = 2459, useitem = 8049 }, -- level 8
        { complete = 2459 }, -- level 8
        { complete = 489, -- level 8
          note = "Look for little brown pinecones giving off green smoke. Mostly found beside tree trunks." },
        { turnin = 489 }, -- level 8
        { go = { 1438, 54.61, 52.48 }, text = "Go into the cavern" }, -- level 8
        { complete = 932, -- level 8
          note = "The target is a satyr. The targets are spread over several spots. Your targets are within the cavern." },
        { level = 8, xp = 3890, patrol = { { 1438, 54.61, 52.48 }, { 1438, 52.95, 50.43 }, { 1438, 53.37, 48.36 } }, why = { kind = "level", levels = { 8, 11 } }, -- level 8
          note = "With the coming hand-ins, this gets you to level 9. Your targets are within the cavern." },
        { go = { 1438, 54.61, 52.48 }, text = "Head out of the cave" }, -- level 8
        { accept = 98391, races = { "NightElf" }, classes = { "PRIEST" } }, -- level 8
        { turnin = { 932, 2459 }, floor = "top", -- level 8
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 87288, races = { "NightElf" } }, -- level 9
        { accept = 930 }, -- level 9
        { complete = 933, useitem = 5621 }, -- level 9
        { accept = 99053, races = { "NightElf" } }, -- level 9
        { go = { 1438, 46.9, 71.61 }, deathskip = true, text = "Die on purpose at this spot", -- level 9
          note = "Die to the monsters here on purpose. At this spot or a bit to the east. Dying costs you nothing this early." },
        { deathskip = true, revive = { 1438, 56.26, 63.3 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 9
        { talk = 6491 }, -- level 9
        { turnin = 933, accept = 7383 }, -- level 9
        { sethearth = "Dolanaar", floor = "up", talk = 6736, -- level 9
          note = "The NPC is indoors, one floor up." },
        { accept = 487, patrol = { { 1438, 55.86, 58.25 }, { 1438, 55.53, 58.39 }, { 1438, 54.58, 58.54 }, { 1438, 53.92, 58.25 }, { 1438, 53.63, 57.55 }, { 1438, 52.97, 57.39 }, { 1438, 52.63, 56.69 }, { 1438, 52.3, 56.39 }, { 1438, 51.94, 56.35 }, { 1438, 51.66, 56.52 }, { 1438, 51.34, 56.61 }, { 1438, 50.97, 56.55 }, { 1438, 50.59, 56.14 }, { 1438, 50.37, 55.61 }, { 1438, 50.56, 54.48 }, { 1438, 50.4, 54.25 }, { 1438, 50.24, 53.83 } }, -- level 9
          note = "The NPC patrols the road; look along it." },
        { complete = 487 }, -- level 9
        { accept = 490, races = { "NightElf" } }, -- level 9
        { complete = 99053, races = { "NightElf" } }, -- level 9
        { accept = 937 }, -- level 9
        { complete = 7383, useitem = 18152, sticky = 937 }, -- level 9
        { accept = 931 }, -- level 9
        { accept = 938, noauto = 938, -- level 9
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear." },
        { complete = 938, -- level 9
          note = "Move fast: the clock is ticking on this one." },
        { turnin = 938, -- level 9
          note = "Wait for the talking to finish" },
        { complete = 937, -- level 9
          note = "Kill harpies." },
        { turnin = 937 }, -- level 9
        { accept = 98392, races = { "NightElf" } }, -- level 9
        { accept = 99047, races = { "NightElf" } }, -- level 9
        { complete = 98392, races = { "NightElf" } }, -- level 9
        { turnin = 99046, races = { "NightElf" } }, -- level 9
        { turnin = 98392, races = { "NightElf" } }, -- level 9
        { accept = 98398, races = { "NightElf" } }, -- level 9
        { turnin = 98398, races = { "NightElf" } }, -- level 9
        { accept = 940 }, -- level 9
        { level = 10, patrol = { { 1438, 35.35, 36.34 }, { 1438, 33.35, 35.63 }, { 1438, 34.25, 33.34 }, { 1438, 35.17, 38.75 }, { 1438, 37.66, 37.84 }, { 1438, 38.24, 40.43 }, { 1438, 36.34, 41.65 }, { 1438, 37.15, 43.54 } }, why = { kind = "level", levels = { 9, 17 } } }, -- level 9
        { go = { 1438, 35.35, 36.34 }, deathskip = true, text = "Die on purpose at this spot", -- level 9
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1457, 76.94, 27.23 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 9
        { talk = 6491 }, -- level 10
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 10
        { turnin = 922, accept = 923 }, -- level 10
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 10
          note = "The spot is on the lower floor of the hollow tree. Don't forget to train Pick Pocket. Keep it; an upcoming task asks for it." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 10
        { accept = 6071, floor = "up", classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, floor = "up", talk = 4146, classes = { "HUNTER" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 4218, classes = { "DRUID" }, -- level 10
          note = "The NPC is indoors at street level." },
        { accept = 5921, classes = { "DRUID" }, -- level 10
          note = "The NPC is indoors, on the central storey." },
        { turnin = 940, accept = 952, floor = "top", why = { kind = "carry", quest = 952, seconds = 63660, xp = 900 }, -- level 10
          note = "The NPC waits on the tower's highest floor." },
        { train = true, talk = 4091, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 2518, floor = "up", -- level 10
          note = "The NPC is indoors, one floor up." },
        { turnin = 5921, accept = 5929, floor = "up", classes = { "DRUID" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { complete = 5929, talk = 11956, classes = { "DRUID" } }, -- level 10
        { turnin = 5929, floor = "up", when = { ready = 5929 }, classes = { "DRUID" }, -- level 10
          note = "The NPC is indoors, one floor up." },
        { accept = 5931, when = { done = 5929 }, classes = { "DRUID" } }, -- level 10
        { go = { 1450, 48.06, 67.4 }, fly = true, talk = 10897, classes = { "DRUID" }, text = "Fly to Moonglade" }, -- level 10
        { accept = 1684, classes = { "WARRIOR" }, -- level 10
          note = "The NPC is indoors." },
        { turnin = 6071, accept = 6063, classes = { "HUNTER" } }, -- level 10
        { complete = 6063, useitem = 15921, classes = { "HUNTER" }, -- level 10
          note = "Target a Webwood Lurker with it. The targets are spiders with green bodies." },
        { turnin = 6063, when = { ready = 6063 }, classes = { "HUNTER" } }, -- level 10
        { accept = 6101, when = { done = 6063 }, classes = { "HUNTER" } }, -- level 10
        { turnin = 7383, accept = 935 }, -- level 10
        { turnin = { 931, 930 } }, -- level 10
        { turnin = 99047, races = { "NightElf" } }, -- level 10
        { turnin = 99053, races = { "NightElf" } }, -- level 10
        { accept = 99050, races = { "NightElf" } }, -- level 10
        { complete = 99050, races = { "NightElf" } }, -- level 10
        { turnin = 99050, races = { "NightElf" } }, -- level 10
        { accept = 99073, races = { "NightElf" } }, -- level 10
        { complete = 6101, useitem = 15922, when = { log = 6101 }, classes = { "HUNTER" }, -- level 10
          note = "Aim the item at any Nightsaber Stalker. The beasts are leopards with blue fur." },
        { go = { 1438, 61.86, 73.05 }, deathskip = true, classes = { "HUNTER" }, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1438, 56.26, 63.3 }, classes = { "HUNTER" }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491, classes = { "HUNTER" } }, -- level 10
        { turnin = 6101, when = { ready = 6101 }, classes = { "HUNTER" } }, -- level 10
        { accept = 6102, when = { done = 6101 }, classes = { "HUNTER" } }, -- level 10
        { complete = 6102, useitem = 15923, when = { log = 6102 }, classes = { "HUNTER" }, -- level 10
          note = "Aim the item at one Strigid Screecher. Target the owls here." },
        { go = { 1438, 64.03, 66.23 }, deathskip = true, classes = { "HUNTER" }, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1438, 56.26, 63.3 }, classes = { "HUNTER" }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491, classes = { "HUNTER" } }, -- level 10
        { turnin = 6102, when = { ready = 6102 }, classes = { "HUNTER" } }, -- level 10
        { accept = 6103, when = { done = 6102 }, classes = { "HUNTER" } }, -- level 10
        { accept = 5629, classes = { "PRIEST" }, -- level 10
          note = "The NPC is indoors." },
        { accept = 2241, classes = { "ROGUE" }, -- level 10
          note = "The NPC is indoors." },
        { turnin = 487, patrol = { { 1438, 55.86, 58.25 }, { 1438, 55.53, 58.39 }, { 1438, 54.58, 58.54 }, { 1438, 53.92, 58.25 }, { 1438, 53.63, 57.55 }, { 1438, 52.97, 57.39 }, { 1438, 52.63, 56.69 }, { 1438, 52.3, 56.39 }, { 1438, 51.94, 56.35 }, { 1438, 51.66, 56.52 }, { 1438, 51.34, 56.61 }, { 1438, 50.97, 56.55 }, { 1438, 50.59, 56.14 }, { 1438, 50.37, 55.61 }, { 1438, 50.56, 54.48 }, { 1438, 50.4, 54.25 }, { 1438, 50.24, 53.83 } }, -- level 10
          note = "The NPC patrols the road; look along it." },
        { go = { 1438, 42.71, 52.51 }, deathskip = true, classes = { "ROGUE" }, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. You need to stand close to this spot. Dying costs you nothing this early." },
        { deathskip = true, revive = { 1457, 77.02, 27.14 }, classes = { "ROGUE" }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491, classes = { "ROGUE" } }, -- level 10
        { go = { 1457, 32.08, 16.49 }, classes = { "ROGUE" }, text = "Go into the hollow tree's cavern" }, -- level 10
        { turnin = 2241, accept = 2242, classes = { "ROGUE" }, -- level 10
          note = "Your targets are within the cavern." },
        { go = { 1438, 40.83, 44.86 }, classes = { "HUNTER" }, text = "Tame a pet here" }, -- level 10
        { complete = 2518, -- level 10
          note = "The target is a big gray spider. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 2242, classes = { "ROGUE" }, -- level 10
          note = "Target Sethir the Ancient and use Pickpocket. The target is a violet satyr. The target waits here, then strolls out onto the big branch close by." },
        { complete = 923, -- level 10
          note = "Fight the elementals of the swamp." },
        { turnin = 99073, races = { "NightElf" } }, -- level 10
        { collect = { { 2449, 5 } }, keep = 2449, classes = { "DRUID" }, -- level 10
          note = "Use Herbalism's Track Herbs to spot them. Pick these up while questing around Teldrassil. Get your Herbalism skill to 15." },
        { level = 10, xp = 3500, patrol = { { 1438, 42.84, 29.16 }, { 1438, 43.24, 31.74 }, { 1438, 41.37, 33.34 }, { 1438, 43.15, 35.76 }, { 1438, 42.06, 37.36 }, { 1438, 43.46, 40.16 }, { 1438, 41.35, 41.36 }, { 1438, 42.06, 43.66 }, { 1438, 43.97, 43.64 }, { 1438, 44.17, 26.64 }, { 1438, 42.14, 25.46 }, { 1438, 52.44, 73.75 } }, -- level 10
          note = "Together with the next turn-ins, this brings you to level 11." },
        { go = { 1438, 35.35, 36.34 }, deathskip = true, text = "Die on purpose at this spot", -- level 10
          note = "Die to the monsters here on purpose. You need to stand close to this spot. Dying costs you nothing this early." },
        { deathskip = true, revive = { 1457, 77.07, 27.13 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 10
        { talk = 6491 }, -- level 10
        { accept = 6344, why = { action = "accept", back = true, chain = 2, kind = "detour", quest = 1683, quests = 5, seconds = 180, total = 1800, xp = 1500 } }, -- level 10
        { turnin = 1684, accept = 1683, classes = { "WARRIOR" } }, -- level 10
        { go = { 1438, 48.72, 62.79 }, classes = { "WARRIOR" }, text = "Circle the mountain, then climb the trail" }, -- level 10
        { complete = 1683, classes = { "WARRIOR" } }, -- level 10
        { complete = 490, races = { "NightElf" } }, -- level 10
        { turnin = 490, races = { "NightElf" } }, -- level 11
        { go = { 1438, 42.71, 52.51 }, deathskip = true, classes = { "WARRIOR" }, text = "Die on purpose at this spot", -- level 11
          note = "Die to the monsters here on purpose. You need to stand close to this spot. Dying costs you nothing this early." },
        { deathskip = true, revive = { 1457, 77.02, 27.14 }, classes = { "WARRIOR" }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 11
        { talk = 6491, classes = { "WARRIOR" } }, -- level 11
        { turnin = 1683, when = { ready = 1683 }, classes = { "WARRIOR" } }, -- level 11
        { go = { 1457, 57.59, 46.69 }, classes = { "WARRIOR", "HUNTER", "PRIEST" }, text = "Learn Staves at the weapon master" }, -- level 11
        { talk = 11866, classes = { "WARRIOR", "HUNTER", "PRIEST" } }, -- level 11
        { turnin = 923 }, -- level 11
        { go = { 1457, 32.08, 16.49 }, classes = { "ROGUE" }, text = "Go into the hollow tree's cavern" }, -- level 11
        { turnin = 2242, when = { ready = 2242 }, classes = { "ROGUE" }, -- level 11
          note = "Your targets are within the cavern." },
        { turnin = 6103, when = { log = 6103 }, classes = { "HUNTER" }, -- level 11
          note = "The NPC is indoors." },
        { train = true, talk = 10089, classes = { "HUNTER" }, -- level 11
          note = "The NPC stands on the highest level of this structure." },
        { turnin = 5931, when = { log = 5931 }, classes = { "DRUID" }, -- level 11
          note = "The NPC is indoors, on the central storey." },
        { accept = 6001, when = { done = 5931 }, classes = { "DRUID" } }, -- level 11
        { turnin = 935, floor = "top", -- level 11
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 98391, races = { "NightElf" }, classes = { "PRIEST" } }, -- level 11
        { accept = 98046, races = { "NightElf" }, classes = { "PRIEST" } }, -- level 11
        { turnin = 2518, accept = 2520, floor = "up", -- level 11
          note = "The NPC is indoors, one floor up." },
        { turnin = 5629, floor = "up", classes = { "PRIEST" }, -- level 11
          note = "The NPC is indoors, one floor up." },
        { complete = 2520, useitem = 8155, -- level 11
          note = "The object is indoors." },
        { turnin = 2520, floor = "up", -- level 11
          note = "The NPC is indoors, one floor up." },
        { turnin = 98046, races = { "NightElf" }, classes = { "PRIEST" } }, -- level 11
        { turnin = 6344, accept = 6341 }, -- level 11
        { turnin = 6341, accept = 6342 }, -- level 11
        { go = { 1438, 58.35, 94.04 }, fly = true, talk = 3838, text = "Flight master in Auberdine" }, -- level 11
        { accept = 3524 }, -- level 11
        { turnin = 6342, -- level 11
          note = "The NPC is indoors." },
        { talk = 4200, buy = { { 4592, 1, 4200 } }, classes = { "HUNTER" }, -- level 11
          note = "Your pet will need this food shortly." },
        { vendor = true, talk = 4200, classes = { "HUNTER" } }, -- level 11
        { accept = 983, floor = "up", -- level 11
          note = "The NPC is indoors, one floor up." },
        { go = { 1439, 38.13, 40.98 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn Blacksmithing from the trainer" }, -- level 11
        { talk = 6299, classes = { "WARRIOR", "ROGUE" } }, -- level 11
        { go = { 1439, 38.3, 41.05 }, classes = { "WARRIOR", "ROGUE" }, text = "Learn Mining from the trainer" }, -- level 11
        { talk = 6297, classes = { "WARRIOR", "ROGUE" } }, -- level 11
        { talk = 6298, buy = { { 2901, 1, 6298 } }, classes = { "WARRIOR", "ROGUE" } }, -- level 11
        { accept = 2118 }, -- level 11
        { accept = 984, -- level 11
          note = "The NPC is indoors." },
        { go = { 1439, 38.46, 46.23 }, classes = { "HUNTER" }, text = "Tame a pet here" }, -- level 11
        { complete = 3524 }, -- level 11
        { complete = 983, -- level 11
          note = "Hunt the crabs. You'll find extra ones swimming nearby as well." },
        { complete = 984 }, -- level 11
        { talk = 3701, collect = { { 7586, 1 } }, spots = { { 1439, 38.79, 43.37 } } }, -- level 11
        { complete = 2118, useitem = 7586, -- level 11
          note = "Use the item on any Rabid Thistle Bear. The targets are bears with grey fur. Keep from damaging the creature." },
        { turnin = 983 }, -- level 11
        { turnin = 3524, accept = 4681 }, -- level 12
        { complete = 4681, -- level 12
          note = "Your targets sit below the water's surface." },
        { turnin = 4681 }, -- level 12
        { level = 12, patrol = { { 1439, 38.46, 46.23 }, { 1439, 41.76, 45.45 }, { 1439, 40.35, 42.54 }, { 1439, 43.75, 42.44 }, { 1439, 41.25, 48.83 }, { 1439, 39.86, 51.56 }, { 1439, 37.26, 49.63 } } }, -- level 12
        { complete = 6001, useitem = 15208, when = { log = 6001 }, classes = { "DRUID" }, -- level 12
          note = "Your objective lies in a little cavern." },
        { sethearth = "Auberdine", talk = 6737, -- level 12
          note = "The NPC is indoors." },
        { accept = 6343, -- level 12
          note = "The NPC is indoors." },
        { turnin = 6343 }, -- level 12
        { train = true, talk = 4218, classes = { "DRUID" }, -- level 12
          note = "The NPC is indoors at street level." },
        { turnin = 6001, when = { ready = 6001 }, classes = { "DRUID" }, -- level 12
          note = "The NPC is indoors, on the central storey." },
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 12
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 12
        { train = true, floor = "up", talk = 4146, classes = { "HUNTER" }, -- level 12
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 10089, classes = { "HUNTER" }, -- level 12
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 12
        { go = { 1457, 57.59, 46.69 }, classes = { "WARRIOR" }, text = "Learn Thrown at the weapon master" }, -- level 12
        { talk = 11866, classes = { "WARRIOR" } }, -- level 12
        { train = true, talk = 4091, classes = { "PRIEST" }, -- level 12
          note = "The NPC is indoors." },
        { turnin = 2118 }, -- level 12
        { turnin = 984, accept = 4761, -- level 12
          note = "The NPC is indoors." },
        { turnin = 4761, accept = 954, -- level 12
          note = "The NPC is indoors." },
        { turnin = 954, when = { ready = 954 } }, -- level 12
        { accept = 955, when = { done = 954 } }, -- level 12
        { complete = 955, when = { log = 955 }, -- level 12
          note = "The targets are imps. Avoid slaying the satyrs if you can. You'll need this for the following quest." },
        { turnin = 955, when = { log = 955 } }, -- level 12
        { accept = 956, when = { done = 955 } }, -- level 12
        { complete = 956, when = { log = 956 }, -- level 12
          note = "Hunt down satyrs." },
        { turnin = 956, when = { log = 956 } }, -- level 12
        { accept = 957, when = { done = 956 } }, -- level 12
        { collect = { { 5469, 5 } }, keep = 5469, -- level 12
          note = "Big birds that roam on foot." },
        { level = 13, patrol = { { 1439, 46.06, 32.96 }, { 1439, 43.36, 31.46 }, { 1439, 41.46, 34.84 }, { 1439, 38.45, 33.16 }, { 1439, 38.34, 36.44 }, { 1439, 39.84, 39.66 }, { 1439, 42.94, 40.56 }, { 1439, 45.86, 42.35 }, { 1439, 47.34, 39.77 }, { 1439, 43.34, 44.43 }, { 1439, 40.36, 43.04 }, { 1439, 42.03, 26.97 }, { 1439, 44.94, 27.46 }, { 1439, 42.96, 23.34 }, { 1439, 45.77, 21.94 }, { 1439, 49.06, 22.64 } } }, -- level 12
        { go = { 1437, 9.53, 59.72 }, fly = true, talk = 1571, text = "Fly to Menethil Harbor" }, -- level 13
        { go = { 1437, 3.26, 75.95 }, text = "Make your way to the Gates of Ironforge", -- level 13
          note = "Swim to precisely this point, then from the game menu pick Support and ask to be unstuck." },
        { go = { 1455, 55.53, 47.78 }, fly = true, talk = 1573, text = "Fly to Ironforge" }, -- level 13
        { accept = 95041, races = { "NightElf" } }, -- level 13
        { accept = 433 }, -- level 13
        { accept = 432, sticky = 432 }, -- level 13
        { go = { 1426, 70.67, 56.43 }, text = "Go into the cavern" }, -- level 13
        { complete = 433, -- level 13
          note = "Your targets are within the cavern." },
        { complete = 432, -- level 13
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1426, 70.67, 56.43 }, text = "Head out of the cave" }, -- level 13
        { accept = 96392, races = { "NightElf" } }, -- level 13
        { complete = 96392, races = { "NightElf" } }, -- level 13
        { turnin = 96392, races = { "NightElf" } }, -- level 13
        { accept = 96390, races = { "NightElf" } }, -- level 13
        { turnin = 433 }, -- level 13
        { turnin = 432 }, -- level 13
        { accept = 98322, races = { "NightElf" } }, -- level 13
        { turnin = 98322, races = { "NightElf" } }, -- level 13
        { accept = 99158, races = { "NightElf" }, classes = { "PRIEST" } }, -- level 13
        { turnin = 99158, races = { "NightElf" }, classes = { "PRIEST" } }, -- level 13
        { accept = 99159, races = { "NightElf" } }, -- level 13
        { complete = 99159, races = { "NightElf" } }, -- level 13
        { turnin = 99159, races = { "NightElf" } }, -- level 13
        { accept = 98326, races = { "NightElf" } }, -- level 13
        { complete = 98326, races = { "NightElf" } }, -- level 13
        { turnin = 98326, races = { "NightElf" } }, -- level 13
        { complete = 95041, races = { "NightElf" } }, -- level 13
        { accept = 95212, races = { "NightElf" } }, -- level 13
        { complete = 95212, races = { "NightElf" } }, -- level 13
        { turnin = 95212, races = { "NightElf" } }, -- level 13
        { accept = 96408, races = { "NightElf" } }, -- level 13
        { turnin = 96408, races = { "NightElf" } }, -- level 13
        { accept = 99160, races = { "NightElf" } }, -- level 13
        { complete = 99160, races = { "NightElf" } }, -- level 13
        { turnin = 99160, races = { "NightElf" } }, -- level 13
        { accept = 99162, races = { "NightElf" } }, -- level 13
        { complete = 99162, races = { "NightElf" } }, -- level 13
        { turnin = 99162, races = { "NightElf" } }, -- level 13
        { complete = 96390, races = { "NightElf" } }, -- level 13
        { turnin = 96390, races = { "NightElf" } }, -- level 13
        { accept = 419, -- level 13
          note = "The NPC is past the tunnel; stay on the road." },
        { turnin = 419, accept = 417 }, -- level 13
        { complete = 417, -- level 13
          note = "The target is a pale bear. This one roams, so scan the surrounding area." },
        { turnin = 417 }, -- level 13
        { go = { 1432, 33.9, 50.98 }, fly = true, talk = 1572, text = "Fly to Thelsamar" }, -- level 13
        { accept = 1339, patrol = { { 1432, 32.7, 49.76 }, { 1432, 33.3, 49.22 }, { 1432, 33.91, 48.42 }, { 1432, 34.36, 47.6 }, { 1432, 34.87, 47 }, { 1432, 35.6, 46.71 }, { 1432, 36.12, 46.32 }, { 1432, 37.14, 45.96 }, { 1432, 37.26, 45.56 }, { 1432, 37.33, 44.48 }, { 1432, 37.23, 43.29 }, { 1432, 36.68, 42.04 } }, -- level 13
          note = "The NPC patrols a long route; look along it." },
        { turnin = 1339, accept = 1338, floor = "up", -- level 13
          note = "The NPC is indoors, one floor up." },
        { go = { 1455, 61.12, 89.58 }, classes = { "WARRIOR" }, text = "Learn Two-Handed Axes and Two-Handed Maces at the weapon master" }, -- level 13
        { talk = 11865, classes = { "WARRIOR" }, -- level 13
          note = "The NPC is indoors." },
        { go = { 1455, 76.62, 51.1 }, text = "Head down into the Deeprun Tram station", -- level 13
          note = "Pass through the portal to teleport." },
        { accept = 6661, -- level 13
          note = "The NPC stands by the wall on the central platform. Head to the Deeprun Tram's Ironforge platform." },
        { complete = 6661, useitem = 17117, -- level 13
          note = "Target the Deeprun Rats with the item. Look for little gray rodents. Head to the Deeprun Tram's Ironforge platform." },
        { turnin = 6661, accept = 6662, -- level 13
          note = "The NPC stands by the wall on the central platform. Head to the Deeprun Tram's Ironforge platform." },
        { turnin = 6662, -- level 13
          note = "Take the Deeprun Tram over to Stormwind City. The NPC stands by the wall on the central platform." },
        { accept = 353, why = { kind = "carry", quest = 353, seconds = 21300, xp = 1100 }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 1338 }, -- level 13
        { accept = 1640, classes = { "WARRIOR" }, -- level 14
          note = "The NPC is indoors. Be ready for a fight right away." },
        { complete = 1640, classes = { "WARRIOR" }, -- level 14
          note = "The NPC is indoors." },
        { turnin = 1640, when = { ready = 1640 }, classes = { "WARRIOR" }, -- level 14
          note = "The NPC is indoors." },
        { accept = 1665, when = { done = 1640 }, classes = { "WARRIOR" } }, -- level 14
        { turnin = 1665, when = { log = 1665 }, classes = { "WARRIOR" }, -- level 14
          note = "The NPC is indoors." },
        { go = { 1453, 63.92, 69.12 }, classes = { "WARRIOR", "HUNTER" }, text = "Learn Two-Handed Swords at the weapon master" }, -- level 14
        { go = { 1453, 63.92, 69.12 }, classes = { "ROGUE" }, text = "Learn Swords at the weapon master" }, -- level 14
        { go = { 1453, 63.92, 69.12 }, classes = { "PRIEST" }, text = "Learn Staves at the weapon master" }, -- level 14
        { talk = 11867, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST" }, -- level 14
          note = "The NPC is indoors." },
        { go = { 1453, 68.01, 72.6 }, text = "Head up the incline", -- level 14
          note = "The NPC is indoors." },
        { go = { 1453, 70.92, 72.47 }, fly = true, talk = 352, text = "Flight master in Stormwind" }, -- level 14
    },
})
