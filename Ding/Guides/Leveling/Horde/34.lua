-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/34.lua.
-- Simulated (warrior): Orc 51 (22%) -> 52 (21%) in 7 h 58, 9 quests turned in; Scourge 51 (22%) -> 52 (21%) in 7 h 58, 9 quests turned in; Tauren 51 (22%) -> 52 (21%) in 7 h 58, 9 quests turned in; Troll 51 (22%) -> 52 (21%) in 7 h 58, 9 quests turned in; Skyborne 51 (22%) -> 52 (21%) in 7 h 57, 9 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h34-burning-steppes-and-azshara",
    title    = "Burning Steppes and Azshara (51-52)",
    faction  = "Horde",
    minLevel = 51, maxLevel = 52,
    next     = "leveling-h35-felwood-and-winterspring",
    steps    = {
        { go = { 1427, 34.84, 83.93 }, when = { notdone = 4726, notlog = 4726 }, text = "Pass through Blackrock Mountain into Burning Steppes", -- level 51
          note = "Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain." },
        { go = { 1428, 65.62, 24.17 }, fly = true, talk = 13177, text = "Fly to Flame Crest" }, -- level 51
        { accept = 4726 }, -- level 51
        { accept = 4296 }, -- level 51
        { complete = 4296 }, -- level 51
        { go = { 1428, 75.36, 38.24 }, text = "Climb the trail" }, -- level 51
        { turnin = 3821, -- level 51
          note = "It lies atop a stone slab. The NPC is up on the summit. It shows up a short way off." },
        { level = 52, sticky = 4726, patrol = { { 1428, 75.55, 49.95 }, { 1428, 74.34, 47.05 }, { 1428, 77.17, 45.35 }, { 1428, 79.76, 47.14 }, { 1428, 83.26, 47.26 }, { 1428, 86.35, 46.95 }, { 1428, 84.83, 44.17 }, { 1428, 81.34, 43.97 }, { 1428, 77.97, 41.75 }, { 1428, 77.77, 38.24 }, { 1428, 74.64, 38.05 }, { 1428, 76.37, 34.77 }, { 1428, 82.44, 36.45 }, { 1428, 85.57, 36.44 }, { 1428, 83.56, 39.94 }, { 1428, 82.44, 32.86 }, { 1428, 74.45, 43.26 }, { 1428, 84.06, 50.46 }, { 1428, 82.55, 53.45 }, { 1428, 79.65, 56.15 }, { 1428, 76.56, 55.95 } }, -- level 51
          note = "The following quest needs you at level 52." },
        { accept = 4022, elite = true, when = { item = 10575 } }, -- level 51
        { accept = 4022, elite = true, when = { log = 4022 } }, -- level 51
        { accept = 4022, elite = true, when = { done = 4022 } }, -- level 51
        { talk = 9459, when = { log = 4022 }, -- level 51
          note = "Your objective lies in a little cavern." },
        { complete = 4022, elite = true, when = { log = 4022 } }, -- level 51
        { talk = 9459, when = { done = 4022 }, -- level 51
          note = "Your objective lies in a little cavern." },
        { complete = 4022, elite = true, when = { done = 4022 } }, -- level 51
        { turnin = 4022, elite = true, when = { log = 4022 } }, -- level 51
        { complete = 4726, useitem = 12284, -- level 52
          note = "Target Black Broodlings with the item. The targets are little winged dragons. A red crystal hovers over each body." },
        { turnin = 4726, accept = 4808 }, -- level 52
        { turnin = 4296 }, -- level 52
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 52
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 52
          note = "The NPC is indoors." },
        { talk = 3309, collect = { { 10695, 1 }, { 11133, 1 } }, spots = { { 1454, 49.62, 69.06 } }, -- level 52
          note = "The NPC is indoors." },
        { talk = 3309, bank = 12438, -- level 52
          note = "The NPC is indoors. You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 52
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 52
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 52
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 3504 }, -- level 52
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 52
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1454, 56.45, 56.87 }, text = "Climb the steps" }, -- level 52
        { accept = 4494, -- level 52
          note = "The NPC is indoors." },
        { vendor = true, talk = 3313, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 52
          note = "The NPC is indoors. A lengthy stretch of quests is coming up. Ammunition can't be bought here." },
        { accept = { 5535, 5536 } }, -- level 52
        { complete = 5535 }, -- level 52
        { complete = 5536 }, -- level 52
        { turnin = { 5535, 5536 } }, -- level 52
        { go = { 1447, 22.02, 49.67 }, fly = true, talk = 8610, text = "Flight master at Valormok" }, -- level 52
        { turnin = 3504 }, -- level 52
        { accept = 3517, sticky = 3517 }, -- level 52
        { complete = 3517, -- level 52
          note = "Look for a rectangular slab etched with green glyphs. The targets are spread over several spots." },
        { complete = 3517, -- level 52
          note = "Look for an oblong slab carved with pink glyphs. The targets are spread over several spots." },
        { complete = 3517, -- level 52
          note = "A rectangular slab carved with blue glyphs. The targets are spread over several spots." },
        { complete = 3517, -- level 52
          note = "Seek a carved slab of rock bearing golden glyphs. The targets are spread over several spots." },
        { collect = { { 10687, 1 }, { 10688, 1 }, { 10689, 1 }, { 10690, 1 } }, useitem = 10695, when = { item = 10695 } }, -- level 52
        { complete = 3568, useitem = 10687, -- level 52
          note = "Wade in to use it." },
        { complete = 3568, useitem = 10688, -- level 52
          note = "Wade in to use it." },
        { complete = 3568, useitem = 10689, -- level 52
          note = "Wade in to use it." },
        { complete = 3568, useitem = 10690, -- level 52
          note = "Wade in to use it." },
        { go = { 1447, 46.04, 38.68 }, text = "Climb the trail" }, -- level 52
        { turnin = 3517, accept = { 3518, 3541, 3561 } }, -- level 52
        { turnin = 3561, accept = 3565, -- level 52
          note = "This one roams, so scan the surrounding area. The NPC is in the tower, which has several floors." },
        { turnin = 3565 }, -- level 52
    },
})
