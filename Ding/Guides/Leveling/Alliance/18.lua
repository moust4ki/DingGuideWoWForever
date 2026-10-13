-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/18.lua.
-- Simulated (warrior): Human 35 (95%) -> 37 (21%) in 4 h 42, 24 quests turned in; Dwarf 35 (99%) -> 37 (21%) in 4 h 38, 24 quests turned in; NightElf 36 (8%) -> 37 (23%) in 4 h 16, 24 quests turned in; Gnome 35 (99%) -> 37 (21%) in 4 h 38, 24 quests turned in; Skyborne 36 (1%) -> 37 (21%) in 4 h 32, 24 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a18-desolace",
    title    = "Desolace (35-37)",
    faction  = "Alliance",
    minLevel = 35, maxLevel = 37,
    next     = "leveling-a19-stranglethorn-vale",
    steps    = {
        { talk = 11104, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master.", -- level 35
          note = "Desolace: Nijel's Point, in the north-east corner, is the Alliance hub." },
        { talk = 11104, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 35
          note = "You will tame a short-term pet shortly. Here your pet picks up Claw (Rank 5)." },
        { go = { 1443, 61.85, 44.37 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 35
          note = "Tame a Scorpashi Lasher with Tame Beast." },
        { go = { 1443, 67.44, 15.7 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Head uphill into Nijel's Point" }, -- level 35
        { talk = 11104, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 35
        { talk = 11104, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 35
          note = "Release the short-term pet you tamed." },
        { sethearth = "Nijel's Point", talk = 11103, -- level 35
          note = "The NPC is indoors." },
        { turnin = 1453, accept = { 1454, 1458 } }, -- level 35
        { accept = 1387 }, -- level 35
        { accept = 1382 }, -- level 35
        { accept = 1437 }, -- level 35
        { complete = 1458, -- level 35
          note = "Hunt down satyrs. Beware of foes lurking in stealth." },
        { level = 35, xp = 64450, patrol = { { 1443, 69.36, 15.83 }, { 1443, 72.37, 13.34 }, { 1443, 73.43, 16.43 }, { 1443, 76.34, 14.95 }, { 1443, 77.34, 18.15 }, { 1443, 74.65, 19.76 }, { 1443, 75.96, 22.56 }, { 1443, 72.34, 24.24 }, { 1443, 74.35, 26.63 }, { 1443, 77.34, 26.65 }, { 1443, 76.34, 29.85 }, { 1443, 71.26, 19.34 }, { 1443, 80.43, 16.44 }, { 1443, 73.36, 9.23 } }, -- level 36
          note = "With the coming hand-ins, this brings you to level 36." },
        { go = { 1443, 67.44, 15.7 }, text = "Head uphill into Nijel's Point" }, -- level 36
        { turnin = 1458, accept = 1459, sticky = 1459 }, -- level 36
        { turnin = 1437, accept = 1465, object = 50961 }, -- level 36
        { accept = 5741, -- level 36
          note = "Look for it high on the clifftop." },
        { turnin = 1454, accept = 1455, object = 35251 }, -- level 36
        { accept = 6161, object = 177787, -- level 36
          note = "The quest starts from a little book." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 36
        { complete = 6161, -- level 36
          note = "The targets are lobsters. Your targets sit below the water's surface." },
        { turnin = 1455, accept = 1456 }, -- level 36
        { turnin = 1465, accept = 1438, sticky = 1459 }, -- level 36
        { complete = 5741, -- level 36
          note = "The target is on the tower's highest floor." },
        { turnin = 1438, accept = 1439, -- level 36
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. The NPC is indoors." },
        { complete = 1439, -- level 36
          note = "Draw him to the doorway so other foes stay out of it. The target is indoors." },
        { turnin = 1439, accept = 1440, noauto = 1440, -- level 36
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. The NPC is indoors." },
        { complete = 1440, sticky = 1459, -- level 36
          note = "Let the conversation play out. Escort Dalinda Malem and keep her alive." },
        { accept = 5501 }, -- level 36
        { complete = { 1387, 1382 }, -- level 36
          note = "The targets here are centaurs. Magram Pack Runners patrol with 2 hyena escorts; steer clear." },
        { accept = 5561, sticky = 5501, -- level 36
          note = "Stay away from Ghost Walker Post." },
        { complete = 5561, useitem = 13892, -- level 36
          note = "Target kodos with the item. The kodos trail behind you. Lead them to Smeed Scrabblescrew, then speak with them there." },
        { turnin = 5561 }, -- level 36
        { complete = 1459 }, -- level 36
        { complete = 5501, -- level 36
          note = "Look for pale skulls of horned beasts. Expect a possible ambush while you gather it." },
        { turnin = 1382, accept = 1384, -- level 36
          note = "Keep to the road the whole way." },
        { vendor = true, talk = 12960, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 36
          note = "The NPC is indoors. A lengthy grinding stretch is coming up." },
        { turnin = 1387 }, -- level 36
        { turnin = 1440, sticky = 1459 }, -- level 36
        { complete = 1384, -- level 36
          note = "The targets here are centaurs." },
        { turnin = 5501 }, -- level 36
        { turnin = 5741, accept = 6027, sticky = { 1456, 6161 }, -- level 36
          note = "Look for it high on the clifftop." },
        { complete = 6027 }, -- level 36
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 36
        { complete = 1456, -- level 36
          note = "The targets are Sea Witches and Tidehunters. Hunt naga. Other naga compete for the same spawn points." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 36
        { complete = 6161, -- level 36
          note = "Hunt naga. The targets are on islands and beneath the surface." },
        { turnin = 6161, object = 177786 }, -- level 36
        { level = 37, patrol = { { 1443, 28.35, 12.24 }, { 1443, 30.44, 9.54 }, { 1443, 27.36, 9.05 }, { 1443, 29.97, 6.37 }, { 1443, 33.69, 10.39 }, { 1443, 29.15, 15.44 } }, -- level 36
          note = "This spreads out the grinding so less is left later." },
        { go = { 1443, 40.69, 28.9 }, text = "Climb the trail" }, -- level 37
        { turnin = 6027, -- level 37
          note = "Look for it high on the clifftop." },
        { turnin = 1384, accept = 1370, -- level 37
          note = "Take the mountain trail to get there. Stay clear of Valley of Spears." },
        { complete = 1370, -- level 37
          note = "Look for tan sacks by the houses. Some of them are not usable. Magram Pack Runners patrol with 2 hyena escorts; steer clear." },
        { turnin = 1370, accept = 1373 }, -- level 37
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 37
        { turnin = 1456, accept = 1457 }, -- level 37
        { complete = 1459, -- level 37
          note = "The foes here are scorpions. Basilisks compete for the same spawn points." },
        { go = { 1443, 67.44, 15.7 }, text = "Head uphill into Nijel's Point" }, -- level 37
        { turnin = 1459 }, -- level 37
        { talk = 7799, bank = 6245, -- level 37
          note = "The NPC is indoors." },
        { talk = 7799, collect = { { 5800, 1 }, { 5852, 1 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 37
          note = "The NPC is indoors." },
        { turnin = 1112 }, -- level 37
        { accept = 1114, -- level 37
          note = "Wait for the talking to finish" },
        { turnin = 1114 }, -- level 37
        { accept = 1115 }, -- level 37
        { turnin = 1183, accept = 1186 }, -- level 37
        { turnin = 1186, accept = 1187 }, -- level 37
    },
})
