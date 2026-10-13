-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/08.lua.
-- Simulated (warrior): Orc 24 (96%) -> 25 (99%) in 1 h 58, 13 quests turned in; Scourge 24 (96%) -> 25 (99%) in 1 h 58, 13 quests turned in; Tauren 24 (91%) -> 25 (95%) in 1 h 58, 13 quests turned in; Troll 24 (96%) -> 25 (99%) in 1 h 58, 13 quests turned in; Skyborne 24 (97%) -> 26 (0%) in 1 h 58, 13 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h08-the-barrens",
    title    = "The Barrens (24-25)",
    faction  = "Horde",
    minLevel = 24, maxLevel = 25,
    next     = "leveling-h09-stonetalon-mountains",
    steps    = {
        { talk = 8356, collect = { { 5059, 1 } }, spots = { { 1456, 47.19, 57.86 } }, -- level 24
          note = "Thunder Bluff first, then the Barrens. The NPC is indoors." },
        { talk = 8356, bank = { 3692, 3564 }, -- level 24
          note = "The NPC is indoors." },
        { go = { 1456, 29.77, 29.79 }, text = "Go into the cavern" }, -- level 24
        { turnin = 1067, -- level 24
          note = "Your targets are within the cavern." },
        { accept = 1086, -- level 24
          note = "Let the conversation play out. Your targets are within the cavern." },
        { train = true, talk = 3045, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 24
          note = "Your targets are within the cavern." },
        { train = true, talk = 3047, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 24
          note = "Your targets are within the cavern." },
        { go = { 1456, 29.77, 29.79 }, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, text = "Head out of the cave", -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 3030, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" } }, -- level 24
        { go = { 1456, 29.77, 29.79 }, text = "Head out of the cave" }, -- level 24
        { accept = 1195 }, -- level 24
        { train = true, talk = 3040, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 10086, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 3043, classes = { "WARRIOR" }, -- level 24
          note = "The NPC is indoors." },
        { turnin = 31, when = { log = 31 }, races = { "Tauren" }, classes = { "DRUID" }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 24
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 24
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 24
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 879, when = { done = 5052 } }, -- level 24
        { go = { 1413, 44.5, 59.27 }, when = { item = { 5075, 4 } }, text = "Visit the caged quilboar" }, -- level 24
        { talk = 3430, when = { item = { 5075, 4 } }, -- level 24
          note = "Trade your Blood Shards to gain buffs. Trade any spare Blood Shards to him during your Barrens questing. Ask him for the Spirit of the Wind buff" },
        { accept = 893 }, -- level 24
        { sethearth = "Camp Taurajo", talk = 7714, -- level 24
          note = "The NPC is indoors." },
        { accept = 884, collect = { { 5102, 1 } }, useitem = 5102, -- level 24
          note = "The target is a dinosaur with blue hide. The targets are spread over several spots." },
        { complete = 868, -- level 24
          note = "Look for big boulders oozing green fluid. Expect a possible ambush while you gather it." },
        { accept = 897, useitem = 5138, when = { item = 5138 } }, -- level 24
        { turnin = 1536, when = { ready = 1536 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 24
          note = "The quest giver waits on the hilltop." },
        { accept = 1534, when = { done = 1536 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 24
        { accept = 843, sticky = 893, -- level 24
          note = "The NPC patrols the road; look along it." },
        { complete = 879, when = { log = 879 }, -- level 24
          note = "The target is a quilboar robed in red. This one roams, so scan the surrounding area. The target appears at this spot." },
        { complete = 879, when = { log = 879 }, -- level 24
          note = "This one roams, so scan the surrounding area. Beware of foes lurking in stealth." },
        { complete = 879, when = { log = 879 }, -- level 24
          note = "Beware of foes lurking in stealth. The NPC is indoors." },
        { complete = 893, keep = 5093, -- level 24
          note = "Kill Stalkers and Pathfinders. Beware of foes lurking in stealth." },
        { complete = 893, keep = 5092, -- level 25
          note = "Beware of foes lurking in stealth." },
        { complete = 893, keep = 5094, -- level 25
          note = "Beware of foes lurking in stealth." },
        { collect = { { 5103, 1 } }, useitem = 5103, sticky = 843, -- level 25
          note = "The target is a red winged serpent. The target roams; check the area." },
        { accept = 885, races = { "Orc", "Tauren", "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" } }, -- level 25
        { accept = 885, races = { "Scourge", "Skyborne" } }, -- level 25
        { complete = 843, -- level 25
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 843 }, -- level 25
        { go = { 1413, 46.79, 84.83 }, text = "Climb the trail" }, -- level 25
        { turnin = 843, accept = 846, -- level 25
          note = "The NPC patrols the road; look along it." },
        { complete = 846, -- level 25
          note = "The NPC can be indoors or out." },
        { turnin = 846, accept = 849, -- level 25
          note = "The NPC patrols the road; look along it." },
        { complete = 849, -- level 25
          note = "The objective sits up on the raised deck. Keep some range when you use the item." },
        { turnin = 849, -- level 25
          note = "The NPC patrols the road; look along it." },
        { level = 24, xp = 25300, patrol = { { 1413, 42.16, 82.54 }, { 1413, 40.43, 80.83 }, { 1413, 41.37, 78.34 } }, -- level 25
          note = "With the coming hand-ins, this gets you to level 25." },
        { go = { 1445, 35.62, 31.94 }, fly = true, talk = 11899, text = "Fly to Brackenwall Village", -- level 25
          note = "Watch out: the foes here are above your level." },
        { turnin = 893 }, -- level 25
        { turnin = 897, when = { log = 897 } }, -- level 25
        { turnin = 884, accept = 6382 }, -- level 25
        { turnin = 885, races = { "Orc", "Tauren", "Troll" }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "DRUID" } }, -- level 25
        { turnin = 885, races = { "Scourge", "Skyborne" } }, -- level 25
        { turnin = 879, when = { log = 879 } }, -- level 25
        { accept = 906, when = { done = 879 } }, -- level 25
        { turnin = 906, when = { log = 906 } }, -- level 25
        { turnin = 868 }, -- level 25
        { accept = 97003 }, -- level 25
        { destroy = 5058 }, -- level 25
        { turnin = 874, accept = 873 }, -- level 25
        { complete = 873, -- level 25
          note = "The target is an aquatic dinosaur. The target roams through the water. The targets are spread over several spots." },
        { turnin = 873 }, -- level 25
        { complete = 97003 }, -- level 25
    },
})
