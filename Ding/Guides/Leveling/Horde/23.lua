-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/23.lua.
-- Simulated (warrior): Orc 42 (18%) -> 42 (60%) in 1 h 28, 8 quests turned in; Scourge 42 (18%) -> 42 (60%) in 1 h 28, 8 quests turned in; Tauren 42 (18%) -> 42 (60%) in 1 h 28, 8 quests turned in; Troll 42 (18%) -> 42 (60%) in 1 h 28, 8 quests turned in; Skyborne 42 (18%) -> 42 (60%) in 1 h 30, 8 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h23-dustwallow-marsh",
    title    = "Dustwallow Marsh (42-42)",
    faction  = "Horde",
    minLevel = 42, maxLevel = 42,
    next     = "leveling-h24-tanaris",
    steps    = {
        { go = { 1445, 36.29, 31.41 }, text = "Travel to Brackenwall Village", -- level 42
          note = "Dustwallow Marsh: Brackenwall Village, in the north-west of the zone." },
        { accept = 1166 }, -- level 42
        { accept = 1169, -- level 42
          note = "Your objective lies in a little cavern." },
        { accept = 1168 }, -- level 42
        { complete = 1205, patrol = { { 1445, 47.13, 51.39 }, { 1445, 47.64, 52.5 }, { 1445, 47.57, 53.23 }, { 1445, 47.09, 54.26 }, { 1445, 46.35, 54.14 }, { 1445, 45.7, 52.93 }, { 1445, 46.45, 54.25 }, { 1445, 47.61, 54.83 }, { 1445, 47.78, 55.87 }, { 1445, 45.87, 61.62 }, { 1445, 44.69, 62.3 }, { 1445, 45.86, 61.64 }, { 1445, 47.67, 56.09 }, { 1445, 48.08, 55.75 }, { 1445, 48.87, 57.15 }, { 1445, 49.53, 56.84 }, { 1445, 51, 54.19 }, { 1445, 51, 53.34 }, { 1445, 49.89, 52.61 } }, -- level 42
          note = "The target is a crocodile with white scales. The target roams a wide loop through the water." },
        { complete = 1187 }, -- level 42
        { complete = 1261, sticky = { 1168, 1169 }, -- level 42
          note = "The item drops rarely." },
        { go = { 1445, 55.6, 65.36 }, text = "Climb the trail" }, -- level 42
        { complete = 1166 }, -- level 42
        { complete = 1166, sticky = 1168 }, -- level 42
        { go = { 1445, 38.44, 66.08 }, text = "Go into the cavern" }, -- level 42
        { complete = 1166, -- level 42
          note = "Your targets are within the cavern." },
        { complete = 1168, sticky = 1169, -- level 42
          note = "Your targets are within the cavern." },
        { go = { 1445, 38.41, 66.02 }, text = "Head out of the cave" }, -- level 42
        { complete = 1168 }, -- level 42
        { complete = 1169, -- level 42
          note = "The targets are little winged dragons." },
        { turnin = 1169, -- level 42
          note = "Your objective lies in a little cavern." },
        { accept = 1170, -- level 42
          note = "Let the conversation play out. Your objective lies in a little cavern." },
        { turnin = 1168 }, -- level 42
        { turnin = { 1166, 1170 }, accept = 1171 }, -- level 42
        { turnin = 1171, -- level 42
          note = "Your objective lies in a little cavern." },
        { turnin = 1261, accept = 1262 }, -- level 42
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 42
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 42
          note = "The NPC is indoors." },
        { turnin = 1262, accept = 7541, -- level 42
          note = "The NPC is indoors." },
        { turnin = 7541 }, -- level 42
        { complete = 97242, races = { "Skyborne" } }, -- level 42
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 42
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 42
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 42
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 42
          note = "The NPC is indoors." },
        { accept = 2981, why = { kind = "carry", once = true, quest = 2981, seconds = 9360, xp = 900 } }, -- level 42
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 42
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 42
          note = "The NPC stands on the highest level of this structure." },
    },
})
