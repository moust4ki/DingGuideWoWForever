-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/24.lua.
-- Simulated (warrior): Orc 42 (60%) -> 43 (0%) in 2 h 31, 1 quests turned in; Scourge 42 (60%) -> 43 (0%) in 2 h 31, 1 quests turned in; Tauren 42 (60%) -> 43 (0%) in 2 h 31, 1 quests turned in; Troll 42 (60%) -> 43 (0%) in 2 h 31, 1 quests turned in; Skyborne 42 (60%) -> 43 (0%) in 2 h 31, 1 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h24-tanaris",
    title    = "Tanaris (42-43)",
    faction  = "Horde",
    minLevel = 42, maxLevel = 43,
    next     = "leveling-h25-feralas",
    steps    = {
        { go = { 1446, 52.3, 28.91 }, text = "Travel to Gadgetzan", -- level 42
          note = "Tanaris: Gadgetzan, in the north of the zone." },
        { talk = 7799, collect = { { 8523, 1 }, { 8524, 1 } }, -- level 42
          note = "The NPC is indoors." },
        { talk = 7799, bank = { 5945, 5862 }, -- level 42
          note = "The NPC is indoors. You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots." },
        { accept = 992, elite = true }, -- level 42
        { accept = 654, useitem = 8524, sticky = 654, -- level 42
          note = "Accepting this starts a 2 hour countdown. The timer keeps running while you're offline. Take this quest only when you have time to spare." },
        { complete = 992, elite = true, useitem = 8584, -- level 42
          note = "Stay clear of the elite foes. Be ready for a fight right away. Watch out for a pair of stronger monsters here." },
        { complete = 654, collect = { { 9442, 1 } }, useitem = 9442, -- level 42
          note = "The foes here are scorpions." },
        { complete = 654, collect = { { 9439, 1 } }, useitem = 9439, -- level 42
          note = "Hunt hyenas for these." },
        { complete = 654, collect = { { 9437, 1 } }, useitem = 9437 }, -- level 42
        { turnin = 654, when = { item = 9440 } }, -- level 42
        { destroy = { 8524, 9437, 9439, 9442 } }, -- level 42
        { turnin = 992, elite = true }, -- level 42
        { level = 43, collect = { { 8483, 1 }, { 8483, 1 } }, patrol = { { 1446, 62.75, 30.36 }, { 1446, 63.17, 32.36 }, { 1446, 65.25, 32.76 }, { 1446, 63.25, 34.57 }, { 1446, 64.03, 28.35 }, { 1446, 59.84, 24.03 } }, why = { kind = "level", levels = { 42, 46 } }, -- level 42
          note = "Targets here are human. Each set of 5 handed in at Gadgetzan gives 380 xp. This number shrinks while you kill monsters." },
        { talk = 7799, collect = { { 10699, 1 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 43
          note = "The NPC is indoors." },
    },
})
