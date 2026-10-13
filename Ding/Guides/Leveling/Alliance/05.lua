-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/05.lua.
-- Simulated (warrior): Human 16 (1%) -> 18 (19%) in 3 h 00, 30 quests turned in; Dwarf 16 (21%) -> 18 (37%) in 3 h 09, 30 quests turned in; NightElf 16 (19%) -> 18 (13%) in 2 h 50, 21 quests turned in; Gnome 16 (16%) -> 18 (33%) in 3 h 09, 30 quests turned in; Skyborne 15 (40%) -> 18 (13%) in 3 h 48, 30 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a05-darkshore",
    title    = "Darkshore (15-18)",
    faction  = "Alliance",
    minLevel = 15, maxLevel = 18,
    next     = "leveling-a06-loch-modan",
    steps    = {
        { go = { 1439, 36.1, 44.93 }, text = "Travel to Auberdine", -- level 15
          note = "Darkshore: Auberdine, the port on the west coast." },
        { accept = 983, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 15
          note = "The NPC is indoors, one floor up." },
        { accept = 2118, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 984, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 15
          note = "The NPC is indoors." },
        { talk = 10085, races = { "Dwarf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 15
        { talk = 10085, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 15
          note = "You will tame a short-term pet shortly. Here your pet picks up Claw (Rank 2)." },
        { accept = 3524, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { go = { 1439, 36.39, 45.54 }, fly = true, talk = 3841, text = "Flight master in Auberdine" }, -- level 15
        { accept = 1141, when = { item = { 12238, 6 } } }, -- level 15
        { turnin = 1141, when = { item = 12238, ready = 1141 } }, -- level 15
        { go = { 1439, 38.46, 46.23 }, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 15
          note = "You will let it go shortly. Send your pet against a Thistle Bear." },
        { talk = 10085, races = { "Dwarf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 15
        { talk = 10085, races = { "Dwarf" }, classes = { "HUNTER" }, -- level 15
          note = "Release the short-term pet you tamed." },
        { complete = 3524, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { complete = 983, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 15
          note = "Hunt the crabs. You'll find extra ones swimming nearby as well." },
        { complete = 984, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { talk = 3701, collect = { { 7586, 1 } }, spots = { { 1439, 38.79, 43.37 } } }, -- level 15
        { useitem = 7586, -- level 15
          note = "Use the item on any Rabid Thistle Bear. The targets are bears with grey fur. Keep from damaging the creature." },
        { complete = 2118, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { turnin = 983, when = { ready = 983 } }, -- level 15
        { accept = 1001 }, -- level 15
        { turnin = 3524, accept = 4681, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 963, sticky = 1001, -- level 15
          note = "The NPC stands on the pier." },
        { complete = 4681, races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 15
          note = "Your targets sit below the water's surface." },
        { complete = 1001, -- level 15
          note = "The targets are sea creatures with long necks. Your targets sit below the water's surface." },
        { turnin = 4681, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 2138, races = { "NightElf" } }, -- level 16
        { turnin = 2118, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 2138, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 985, races = { "NightElf" }, -- level 16
          note = "The NPC is indoors." },
        { turnin = 984, accept = 4761, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 985, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 958, -- level 15
          note = "The NPC is indoors." },
        { accept = 4762, races = { "NightElf" } }, -- level 16
        { turnin = 4761, accept = 954, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 4762, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 15
        { accept = 4811, -- level 15
          note = "This one roams, so scan the surrounding area." },
        { sethearth = "Auberdine", talk = 6737, -- level 15
          note = "The NPC is indoors." },
        { complete = 4811, -- level 15
          note = "Head to the hilltop." },
        { turnin = 954, when = { ready = 954 } }, -- level 15
        { accept = 955, when = { done = 954 } }, -- level 15
        { complete = 955, when = { log = 955 }, -- level 15
          note = "The targets are imps. Avoid slaying the satyrs if you can. You'll need this for the following quest." },
        { turnin = 955, when = { log = 955 } }, -- level 15
        { accept = 956, when = { done = 955 } }, -- level 16
        { complete = 956, when = { log = 956 }, -- level 16
          note = "Hunt down satyrs." },
        { turnin = 956, when = { log = 956 } }, -- level 16
        { accept = 957, when = { done = 956 } }, -- level 16
        { accept = 4723, object = 175233 }, -- level 16
        { turnin = 1001, accept = 1002, object = 17183, sticky = { 1002, 2138 } }, -- level 16
        { accept = 4725, object = 176197 }, -- level 16
        { collect = { { 5469, 5 } }, keep = 5469, -- level 16
          note = "Big birds that roam on foot." },
        { complete = 1002, -- level 16
          note = "Kill black-furred tigers." },
        { complete = 2138 }, -- level 16
        { turnin = 1002 }, -- level 16
        { complete = 4762, useitem = 12350, -- level 16
          note = "Wade in to use it. The spot is at the foot of the falls." },
        { accept = 4727, object = 176196 }, -- level 16
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 16
        { accept = 6121, races = { "NightElf", "Skyborne" }, classes = { "DRUID" }, -- level 16
          note = "The NPC is indoors, on the central storey." },
        { accept = 26, races = { "NightElf" }, classes = { "DRUID" } }, -- level 16
        { turnin = 6121, accept = 6122, races = { "NightElf", "Skyborne" }, classes = { "DRUID" }, -- level 16
          note = "The NPC is indoors, one floor up." },
        { turnin = 26, accept = 29, races = { "NightElf" }, classes = { "DRUID" } }, -- level 16
        { collect = { { 15877, 1 } }, spots = { { 1450, 54.73, 46.56 }, { 1450, 47.97, 47.15 }, { 1450, 50.05, 50.57 }, { 1450, 52.13, 53.34 }, { 1450, 52.86, 48.45 }, { 1450, 54.06, 49.97 }, { 1450, 54.14, 55.55 }, { 1450, 56.15, 53.57 }, { 1450, 58.35, 50.87 }, { 1450, 60.54, 58.33 } }, races = { "NightElf" }, classes = { "DRUID" }, -- level 16
          note = "Look for an urn of woven wicker. Your targets sit below the water's surface. The targets are spread over several spots." },
        { useitem = 15877, races = { "NightElf", "Skyborne" }, classes = { "DRUID" } }, -- level 16
        { complete = 29, races = { "NightElf" }, classes = { "DRUID" } }, -- level 16
        { turnin = 29, when = { ready = 29 }, races = { "NightElf" }, classes = { "DRUID" } }, -- level 16
        { accept = 272, when = { done = 29 }, races = { "NightElf", "Skyborne" }, classes = { "DRUID" } }, -- level 16
        { turnin = { 4723, 4725, 4727 } }, -- level 16
        { accept = 98025, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 16
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 16
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 16
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 16
        { train = true, talk = 4146, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 16
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 16
          note = "The NPC is indoors." },
        { turnin = 4811, accept = 4812, -- level 16
          note = "This one roams, so scan the surrounding area." },
        { complete = 4812, useitem = 14338 }, -- level 16
        { turnin = 4762, -- level 16
          note = "The NPC is indoors." },
        { turnin = 2138 }, -- level 16
        { turnin = 4812, accept = 4813, object = 175524, -- level 16
          note = "Head to the hilltop." },
        { accept = 953, sticky = { 963, 958 } }, -- level 16
        { complete = 953 }, -- level 16
        { complete = 98025, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 16
        { complete = 957, when = { log = 957 } }, -- level 16
        { complete = 953 }, -- level 16
        { complete = 963, -- level 16
          note = "The target is a non-hostile ghost of a night elf woman. Look for a figure in yellow and green garb. This one roams, so scan the surrounding area." },
        { complete = 958 }, -- level 16
        { turnin = 953 }, -- level 16
        { accept = 4728, object = 175226 }, -- level 17
        { accept = 4722 }, -- level 17
        { complete = 985 }, -- level 17
        { turnin = { 4728, 4722 } }, -- level 17
        { accept = 1138 }, -- level 17
        { turnin = 963, -- level 17
          note = "The NPC stands on the pier." },
        { turnin = 4813, -- level 17
          note = "This one roams, so scan the surrounding area." },
        { turnin = 985, -- level 17
          note = "The NPC is indoors." },
        { accept = 965, -- level 17
          note = "The NPC is indoors, one floor up." },
        { accept = 982 }, -- level 17
        { turnin = 958, -- level 17
          note = "The NPC is indoors." },
        { turnin = 957, when = { log = 957 } }, -- level 17
        { complete = 982, -- level 17
          note = "Go to the lowest deck of the wreck. Swim in by way of a porthole." },
        { complete = 982, sticky = 1138, -- level 17
          note = "Go to the lowest deck of the wreck. Swim in by way of a porthole." },
        { collect = { { 15883, 1 } }, spots = { { 1439, 48.83, 11.35 } }, races = { "NightElf" }, classes = { "DRUID" }, -- level 17
          note = "Your targets sit below the water's surface." },
        { complete = 1138, -- level 17
          note = "Hunt the crabs." },
        { turnin = 965, accept = 966 }, -- level 17
        { complete = 966 }, -- level 17
        { turnin = 966, accept = 967 }, -- level 17
        { level = 18, patrol = { { 1439, 52.37, 32.37 }, { 1439, 52.46, 34.63 }, { 1439, 50.16, 34.36 } } }, -- level 17
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 17
        { turnin = 1138 }, -- level 18
        { turnin = 982 }, -- level 18
        { talk = 1448, buy = { { 4371, 1, 1448 } }, when = { noitem = 4371 }, -- level 18
          note = "This one roams, so scan the surrounding area. The NPC is indoors. Do it only if you can." },
        { vendor = true, talk = 1448, when = { noitem = 4371 } }, -- level 18
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 10090, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 18
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 18
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 18
          note = "The NPC is indoors." },
    },
})
