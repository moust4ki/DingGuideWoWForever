-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/25.lua.
-- Simulated (warrior): Orc 43 (0%) -> 44 (73%) in 8 h 27, 21 quests turned in; Scourge 43 (0%) -> 44 (73%) in 8 h 27, 21 quests turned in; Tauren 43 (0%) -> 44 (73%) in 8 h 27, 21 quests turned in; Troll 43 (0%) -> 44 (73%) in 8 h 27, 21 quests turned in; Skyborne 43 (0%) -> 44 (73%) in 8 h 27, 21 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h25-feralas",
    title    = "Feralas (43-44)",
    faction  = "Horde",
    minLevel = 43, maxLevel = 44,
    next     = "leveling-h26-stranglethorn-vale",
    steps    = {
        { go = { 1444, 75.7, 44.31 }, text = "Travel to Camp Mojache", -- level 43
          note = "Feralas: Camp Mojache, in the east of the zone." },
        { accept = 2987 }, -- level 43
        { accept = 2973 }, -- level 43
        { accept = 2862 }, -- level 43
        { accept = 2822, -- level 43
          note = "The NPC is indoors." },
        { turnin = 2981, accept = 2975, -- level 43
          note = "Look for the NPC dressed in red armor. This one roams, so scan the surrounding area." },
        { complete = 2862, sticky = { 2987, 2975 }, -- level 43
          note = "Your targets here are gnolls." },
        { go = { 1444, 75.06, 35.11 }, text = "Climb the trail to Gordunni Outpost" }, -- level 43
        { go = { 1444, 76.33, 32.87 }, text = "Stay on the trail" }, -- level 43
        { accept = 2978, collect = { { 9370, 1 } }, useitem = 9370, -- level 43
          note = "Look for a flat, white scroll lying open. The targets are spread over several spots." },
        { complete = 2987, useitem = 9466, -- level 43
          note = "Beside the shining blue rings on the ground. Look for earth mounds that pop up. Ones holding the quest item shine blue." },
        { complete = 2975 }, -- level 43
        { turnin = 2862, accept = 2863 }, -- level 43
        { turnin = 2987 }, -- level 43
        { turnin = { 2975, 2978 }, accept = { 2980, 2979 }, -- level 43
          note = "Look for the NPC dressed in red armor. This one roams, so scan the surrounding area." },
        { complete = 2973 }, -- level 43
        { complete = 2863 }, -- level 43
        { turnin = 2863, accept = 2902 }, -- level 43
        { turnin = 2973, accept = 2974 }, -- level 43
        { destroy = 9369 }, -- level 43
        { turnin = 2902, accept = 2903 }, -- level 43
        { complete = 2974, -- level 43
          note = "Fight the tauren." },
        { turnin = 2903, accept = { 7730, 7731 } }, -- level 43
        { turnin = 2974, accept = 2976 }, -- level 43
        { destroy = 9460 }, -- level 43
        { sethearth = "Camp Mojache", talk = 7737 }, -- level 43
        { vendor = true, talk = 9548, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 43
          note = "A lengthy grinding stretch is coming up. The NPC is upstairs, out on the balcony." },
        { complete = 7731, -- level 43
          note = "The target is a winged green bug, level 47. You can likely beat it at your current level. The target circles in the air, so search around." },
        { complete = 7730, -- level 43
          note = "Kill bugs. Extra targets lurk in the bug caverns." },
        { go = { 1444, 67.5, 49.88 }, text = "Stay on the road" }, -- level 43
        { complete = 3520, talk = 8612, useitem = 10699, sticky = 2980, -- level 43
          note = "Hunt the crimson winged serpents. Slay them, then apply the item to their remains. The targets are ghosts that materialize." },
        { complete = 2980 }, -- level 43
        { unbank = 4589, keep = 4589, -- level 43
          note = "No drops come from Stagwings and Skystormers. Hang on to it; an upcoming quest uses it." },
        { level = 44, xp = 35000, patrol = { { 1444, 56.96, 64.42 }, { 1444, 55.43, 63.45 }, { 1444, 56.64, 61.36 }, { 1444, 54.76, 60.17 }, { 1444, 55.76, 65.95 }, { 1444, 53.85, 66.15 } }, -- level 43
          note = "Tougher foes are coming up next. Saves you some monster farming afterward. Dungeon runs are a fine choice here too, as you like." },
        { go = { 1444, 54.13, 68.28 }, text = "Climb the trail" }, -- level 44
        { unbank = 8564, keep = 8564, sticky = 2980, -- level 44
          note = "Look for a big, pale egg. The targets are spread over several spots. Hang on to it; an upcoming quest uses it." },
        { complete = 2979 }, -- level 44
        { complete = 2980 }, -- level 44
        { complete = 2980 }, -- level 44
        { complete = 2822, -- level 44
          note = "The quest wants yetis; seek them out. Others lie past the tunnel." },
        { accept = 2766, useitem = 8705, when = { item = 8705 } }, -- level 44
        { go = { 1444, 55.19, 56.33 }, when = { log = 2766 }, text = "Traverse the passageway" }, -- level 44
        { turnin = 2766, when = { log = 2766 }, -- level 44
          note = "The robot sits in the open ground linking the cave and the tunnel." },
        { go = { 1444, 55.19, 56.33 }, when = { done = 2766 }, text = "Traverse the passageway" }, -- level 44
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 44
        { accept = 3121 }, -- level 44
        { turnin = 2822, -- level 44
          note = "The NPC is indoors." },
        { turnin = { 7730, 7731 }, accept = 7732 }, -- level 44
        { turnin = { 2980, 2979 }, accept = 3002, -- level 44
          note = "Look for the NPC dressed in red armor. This one roams, so scan the surrounding area." },
        { talk = 8356, collect = { { 5945, 1 } }, spots = { { 1456, 47.19, 57.86 } }, -- level 44
          note = "The NPC is indoors." },
        { talk = 8356, bank = { 4589, 10699, 8564 }, -- level 44
          note = "The NPC is indoors." },
        { turnin = 1205 }, -- level 44
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 44
          note = "The NPC is indoors." },
        { turnin = 3002, -- level 44
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 44
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 44
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 44
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 44
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 44
          note = "This NPC is found down in the Cleft of Shadow." },
        { turnin = 3121, accept = 3122, -- level 44
          note = "The quest giver waits in the tent. This NPC is found down in the Cleft of Shadow." },
        { turnin = 2976 }, -- level 44
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 44
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 44
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1454, 56.3, 56.99 }, text = "Climb the steps" }, -- level 44
        { turnin = 7732, -- level 44
          note = "The NPC is indoors, one floor up." },
        { talk = 3309, collect = { { 2725, 1 }, { 2728, 1 }, { 2730, 1 }, { 2732, 1 }, { 2734, 1 }, { 2735, 1 }, { 2738, 1 }, { 2740, 1 }, { 2742, 1 }, { 2744, 1 }, { 2745, 1 }, { 2748, 1 }, { 2749, 1 }, { 2750, 1 }, { 2751, 1 } }, -- level 44
          note = "If some pages are unavailable, go on without them. The NPC is indoors." },
        { talk = 3309, bank = 9628, -- level 44
          note = "The NPC is indoors." },
        { talk = 8673, collect = { { 2725, 1 }, { 2728, 1 }, { 2730, 1 }, { 2732, 1 }, { 2734, 1 }, { 2735, 1 }, { 2738, 1 }, { 2740, 1 }, { 2742, 1 }, { 2744, 1 }, { 2745, 1 }, { 2748, 1 }, { 2749, 1 }, { 2750, 1 }, { 2751, 1 } }, -- level 44
          note = "The NPC is indoors. You need Chapter I as well as Chapter II." },
    },
})
