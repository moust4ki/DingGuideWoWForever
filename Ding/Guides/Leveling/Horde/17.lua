-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/17.lua.
-- Simulated (warrior): Orc 38 (4%) -> 38 (75%) in 2 h 42, 16 quests turned in; Scourge 38 (4%) -> 38 (75%) in 2 h 42, 16 quests turned in; Tauren 38 (4%) -> 38 (75%) in 2 h 42, 16 quests turned in; Troll 38 (4%) -> 38 (75%) in 2 h 42, 16 quests turned in; Skyborne 38 (4%) -> 38 (75%) in 2 h 42, 16 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h17-dustwallow-marsh",
    title    = "Dustwallow Marsh (37-38)",
    faction  = "Horde",
    minLevel = 37, maxLevel = 38,
    next     = "leveling-h18-alterac-mountains-and-arathi-highlands",
    steps    = {
        { talk = 8673, collect = { { 3853, 1 } }, when = { maxlevel = 40 }, -- level 38
          note = "Orgrimmar first, then Dustwallow Marsh: Brackenwall Village. Hold on to it, an upcoming quest uses it." },
        { talk = 3309, bank = 4306, -- level 38
          note = "The NPC is indoors. You need it later for \"Caught!\": keep it in the bank to free a bag slot." },
        { bank = 2725, when = { item = 2725 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2728, when = { item = 2728 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2730, when = { item = 2730 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2732, when = { item = 2732 }, -- level 38
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2734, when = { item = 2734 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2735, when = { item = 2735 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2738, when = { item = 2738 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2740, when = { item = 2740 }, -- level 38
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2742, when = { item = 2742 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2744, when = { item = 2744 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2745, when = { item = 2745 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2748, when = { item = 2748 }, -- level 38
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2749, when = { item = 2749 }, -- level 38
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2750, when = { item = 2750 }, -- level 38
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2751, when = { item = 2751 }, -- level 38
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { go = { 1454, 56.41, 56.95 }, text = "Climb the steps" }, -- level 38
        { talk = 3400, buy = { { 3713, 3, 3400 } }, -- level 38
          note = "The NPC is indoors." },
        { vendor = true, talk = 3313, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 38
          note = "A lengthy stretch of quests is coming up. You won't find an ammunition seller. The NPC is indoors." },
        { accept = 1201 }, -- level 38
        { accept = 1268, object = 21015 }, -- level 38
        { accept = 1269, -- level 38
          note = "The quest starts from a small piece of metal." },
        { accept = 1251 }, -- level 38
        { accept = 1177 }, -- level 38
        { turnin = { 1268, 1269, 1251 }, accept = 1321 }, -- level 38
        { turnin = 1321, accept = 1322, sticky = 1322 }, -- level 38
        { complete = 1201, -- level 38
          note = "These foes hide in stealth." },
        { accept = 1270, noauto = 1270, -- level 38
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Clear the raptors around before you begin." },
        { complete = 1270, -- level 38
          note = "Let the conversation play out. Guard \"Stinky\" Ignatz as you escort him." },
        { accept = 1218, when = { item = 3713 } }, -- level 38
        { turnin = 1218, when = { item = 3713 } }, -- level 38
        { accept = 1238 }, -- level 38
        { complete = 1177, -- level 38
          note = "Fight the murlocs." },
        { accept = 1206, when = { done = 1218 } }, -- level 38
        { complete = 1322, -- level 38
          note = "Hunt the orange spiders. Watch out: Darkfang Lurkers hide in stealth." },
        { complete = 1206, when = { log = 1206 }, -- level 38
          note = "Hunt spiders for it. The targets roam the mine and the area around it." },
        { go = { 1445, 33.17, 22.82 }, text = "Exit the mine shaft" }, -- level 38
        { turnin = { 1201, 1238 }, accept = 1202 }, -- level 38
        { turnin = 1322, accept = 1323 }, -- level 38
        { turnin = 1323 }, -- level 38
        { accept = 1273, noauto = 1273, -- level 38
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { complete = 1273, -- level 38
          note = "Let the conversation play out. Escort Ogron, guarding him from attackers. Fight off the foes that come at you" },
        { turnin = 1177 }, -- level 38
        { turnin = 1273, accept = 1276 }, -- level 38
        { turnin = 1206, when = { log = 1206 } }, -- level 38
        { accept = 1203, when = { item = 3853 } }, -- level 38
        { turnin = 1203, when = { item = 3853 } }, -- level 38
        { destroy = 5884 }, -- level 38
        { accept = 1239 }, -- level 38
        { complete = 1202, -- level 38
          note = "Keep out of Theramore Isle. Your targets sit below the water's surface." },
        { go = { 1445, 71.57, 51.12 }, deathskip = true, text = "Die on purpose at this spot", -- level 38
          note = "Let yourself drown for a quick trip." },
        { deathskip = true, revive = { 1445, 39.66, 30.81 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 38
        { talk = 6491 }, -- level 38
        { turnin = { 1202, 1239 }, accept = 1240 }, -- level 38
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 38
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 38
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 38
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 38
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 38
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 38
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 38
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 38
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 38
          note = "The NPC is indoors." },
        { go = { 1458, 52.16, 64.26 }, dungeon = "Scarlet Monastery", text = "Take the trail downhill" }, -- level 38
        { accept = 1048, dungeon = "Scarlet Monastery" }, -- level 38
        { complete = 1048, dungeon = "Scarlet Monastery", -- level 38
          note = "Head into the Library wing. The target is the dungeon's opening boss." },
        { complete = 1048, dungeon = "Scarlet Monastery", -- level 38
          note = "This is in the Armory wing. The target is the dungeon's last boss." },
        { complete = 1048, dungeon = "Scarlet Monastery", -- level 38
          note = "Found in the Cathedral wing. The target is the dungeon's last boss." },
        { go = { 1458, 52.16, 64.26 }, dungeon = "Scarlet Monastery", text = "Take the trail downhill" }, -- level 38
        { turnin = 1048, dungeon = "Scarlet Monastery" }, -- level 38
        { go = { 1458, 52.8, 77.62 }, text = "Take the trail downhill" }, -- level 38
        { accept = 232 }, -- level 38
        { go = { 1458, 47.94, 76.55 }, text = "Climb the trail" }, -- level 38
        { turnin = 232, accept = 238 }, -- level 38
        { go = { 1458, 52.8, 77.62 }, text = "Take the trail downhill" }, -- level 38
        { turnin = 238, accept = 243 }, -- level 38
        { talk = 15683, collect = { { 4480, 8 }, { 4479, 8 }, { 4481, 8 }, { 6052, 2 } }, classes = { "WARRIOR" }, -- level 38
          note = "Save it: the warrior's Whirlwind weapon questline asks for it." },
        { talk = 8720, collect = { { 4611, 9 }, { 3829, 1 }, { 4389, 1 }, { 929, 1 }, { 3823, 1 } }, when = { maxlevel = 45 }, -- level 38
          note = "Get these for simple Badlands turn-ins ahead. The NPC is indoors." },
        { talk = 2458, collect = { { 5827, 1 } }, spots = { { 1458, 65.87, 43.4 } } }, -- level 38
        { talk = 2458, bank = { 5919, 8523 }, -- level 38
          note = "You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots." },
        { collect = { { 4481, 8 } }, classes = { "WARRIOR" } }, -- level 38
        { collect = { { 4480, 8 } }, classes = { "WARRIOR" } }, -- level 38
        { collect = { { 4479, 8 } }, classes = { "WARRIOR" }, -- level 38
          note = "Stay clear of Refuge Point." },
    },
})
