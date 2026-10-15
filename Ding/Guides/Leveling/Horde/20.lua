-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/20.lua.
-- Simulated (warrior): Orc 40 (67%) -> 41 (69%) in 4 h 06, 18 quests turned in; Scourge 40 (67%) -> 41 (69%) in 4 h 06, 18 quests turned in; Tauren 40 (67%) -> 41 (69%) in 4 h 06, 18 quests turned in; Troll 40 (67%) -> 41 (69%) in 4 h 06, 18 quests turned in; Skyborne 40 (67%) -> 41 (69%) in 4 h 06, 18 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h20-stranglethorn-vale-and-swamp-of-sorrows",
    title    = "Stranglethorn and Swamp of Sorrows (40-41)",
    faction  = "Horde",
    minLevel = 40, maxLevel = 41,
    next     = "leveling-h21-desolace",
    leftOut  = {
        [1418] = { kind = "away" },
        [1430] = { kind = "far" },
        [2681] = { kind = "away" },
        [2701] = { kind = "prereq" },
        [2702] = { kind = "prereq" },
        [3512] = { kind = "prereq" },
        [3627] = { kind = "prereq" },
        [3628] = { kind = "prereq" },
    },
    steps    = {
        { go = { 1413, 62.37, 37.62 }, text = "Travel to Ratchet", -- level 40
          note = "The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard." },
        { turnin = 3631, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" } }, -- level 40
        { accept = 4490, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" } }, -- level 40
        { turnin = 4490, races = { "Orc", "Scourge", "Skyborne" }, classes = { "WARLOCK" } }, -- level 40
        { turnin = 1270 }, -- level 40
        { accept = 577, -- level 40
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
        { accept = 600, -- level 40
          note = "The NPC is indoors at street level." },
        { accept = 209, floor = "top", -- level 40
          note = "Climb to the highest floor of the building." },
        { turnin = 669, floor = "up", -- level 40
          note = "The NPC is upstairs, out on the balcony." },
        { accept = 572 }, -- level 40
        { accept = 584 }, -- level 40
        { turnin = 1240 }, -- level 40
        { accept = 598, elite = true }, -- level 40
        { go = { 1434, 21.46, 10.07 }, text = "Go along the shore, then climb the trail" }, -- level 40
        { complete = 584, -- level 40
          note = "This one roams, so scan the surrounding area." },
        { complete = 584 }, -- level 40
        { turnin = 584, accept = 585, sticky = 196 }, -- level 40
        { complete = 572 }, -- level 40
        { complete = 196 }, -- level 40
        { complete = 600, sticky = { 209, 598 }, -- level 40
          note = "The targets are goblins." },
        { complete = 585 }, -- level 41
        { complete = 585 }, -- level 41
        { complete = 585 }, -- level 41
        { complete = 209, -- level 41
          note = "The targets are trolls." },
        { complete = 598, elite = true }, -- level 41
        { level = 41, patrol = { { 1434, 42.26, 36.15 }, { 1434, 42.46, 33.45 }, { 1434, 44.94, 32.54 }, { 1434, 46.37, 30.26 }, { 1434, 47.04, 34.64 }, { 1434, 46.03, 37.97 }, { 1434, 46.45, 40.64 }, { 1434, 43.37, 39.43 } } }, -- level 41
        { complete = 577, -- level 41
          note = "The targets are in the water and along its edges." },
        { turnin = 572 }, -- level 41
        { talk = 2625 }, -- level 41
        { bank = 2725, when = { item = 2725 }, -- level 41
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2728, when = { item = 2728 }, -- level 41
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2730, when = { item = 2730 }, -- level 41
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2732, when = { item = 2732 }, -- level 41
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2734, when = { item = 2734 }, -- level 41
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2735, when = { item = 2735 }, -- level 41
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2738, when = { item = 2738 }, -- level 41
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2740, when = { item = 2740 }, -- level 41
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2742, when = { item = 2742 }, -- level 41
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2744, when = { item = 2744 }, -- level 41
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2745, when = { item = 2745 }, -- level 41
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2748, when = { item = 2748 }, -- level 41
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2749, when = { item = 2749 }, -- level 41
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2750, when = { item = 2750 }, -- level 41
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2751, when = { item = 2751 }, -- level 41
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { turnin = 577, -- level 41
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
        { accept = 628, elite = true }, -- level 41
        { turnin = 600, -- level 41
          note = "The NPC is indoors at street level." },
        { sethearth = "Booty Bay", talk = 6807, -- level 41
          note = "The NPC is indoors at street level." },
        { accept = 1116, floor = "top", -- level 41
          note = "Climb to the highest floor of the building." },
        { turnin = 209, floor = "top", -- level 41
          note = "Climb to the highest floor of the building." },
        { turnin = 598, elite = true }, -- level 41
        { turnin = 585, accept = 1261, why = { continent = true, kind = "carry", quest = 1261, seconds = 16080, xp = 3200 } }, -- level 41
        { turnin = 196 }, -- level 41
        { accept = 197, elite = true }, -- level 41
        { accept = 1372, why = { kind = "detour", quest = 1372, seconds = 60, xp = 300 }, -- level 41
          note = "Keep clear of Darkshire." },
        { turnin = 1372 }, -- level 41
        { complete = 1116, -- level 41
          note = "Hunt the little winged dragonkin. When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { accept = 93176 }, -- level 41
        { accept = 698, -- level 41
          note = "The NPC is indoors." },
        { go = { 1435, 46.02, 54.87 }, fly = true, talk = 6026, text = "Flight master at Stonard" }, -- level 41
        { turnin = 1420, floor = "up", -- level 41
          note = "The NPC is indoors, one floor up." },
        { accept = 1424, floor = "up", sticky = 698, -- level 41
          note = "The NPC is indoors, one floor up." },
        { accept = 1392, collect = { { 6196, 1 } }, useitem = 6196, patrol = { { 1435, 32.23, 36.35 }, { 1435, 33.3, 40.48 }, { 1435, 33.55, 43.94 }, { 1435, 36.72, 46.24 }, { 1435, 37.96, 43.15 }, { 1435, 38.93, 35.49 }, { 1435, 40.17, 34.59 }, { 1435, 40.92, 32.28 }, { 1435, 42.33, 32.31 }, { 1435, 45.65, 36.53 }, { 1435, 46.33, 38.63 }, { 1435, 47.61, 38.16 }, { 1435, 53.06, 39.13 }, { 1435, 55.45, 37.4 }, { 1435, 55.84, 35.66 }, { 1435, 55.57, 34.03 } }, -- level 41
          note = "The target is a humanoid escorted by 2 guards. The target patrols a long route; look along it." },
        { turnin = 1392, accept = 1389, sticky = { 1389, 698 } }, -- level 41
        { complete = 1373, -- level 41
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { accept = 1393, noauto = 1393, -- level 41
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Clear the monsters just south before you start." },
        { complete = 1393, -- level 41
          note = "Let the conversation play out. Escort Galen Goodward and keep him alive." },
        { complete = 1389, -- level 41
          note = "Look for big blue crystals." },
        { turnin = 1393 }, -- level 41
        { complete = 698 }, -- level 41
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 41
        { complete = 1424, -- level 41
          note = "Look for assorted little brown items. Your targets sit below the water's surface. Drop the Ground Clutter option down to 1." },
        { turnin = 698 }, -- level 41
        { turnin = 1424, floor = "up", -- level 41
          note = "The NPC is indoors, one floor up." },
        { turnin = 1389 }, -- level 41
        { complete = 1116, -- level 41
          note = "Hunt the little winged dragonkin." },
        { turnin = 1116, floor = "top", -- level 41
          note = "Climb to the highest floor of the building." },
        { accept = { 1117, 2864 }, floor = "top", why = { continent = true, kind = "carry", quest = 1117, seconds = 6420, xp = 2800 }, -- level 41
          note = "Let the conversation play out. Climb to the highest floor of the building." },
        { accept = 1183, floor = "up", why = { continent = true, kind = "carry", quest = 1183, seconds = 6540, xp = 700 }, -- level 41
          note = "The NPC is upstairs, out on the balcony." },
        { accept = 2872, why = { continent = true, kind = "carry", once = true, quest = 2872, seconds = 5160, short = true, xp = 400 }, -- level 41
          note = "The NPC is indoors." },
        { sethearth = "Camp Taurajo", talk = 7714, -- level 41
          note = "The NPC is indoors." },
    },
})
