-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/35.lua.
-- Simulated (warrior): Orc 52 (21%) -> 53 (39%) in 9 h 17, 13 quests turned in; Scourge 52 (21%) -> 53 (39%) in 9 h 17, 13 quests turned in; Tauren 52 (21%) -> 53 (39%) in 9 h 17, 13 quests turned in; Troll 52 (21%) -> 53 (39%) in 9 h 17, 13 quests turned in; Skyborne 52 (21%) -> 53 (39%) in 9 h 17, 13 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h35-felwood-and-winterspring",
    title    = "Felwood and Winterspring (52-53)",
    faction  = "Horde",
    minLevel = 52, maxLevel = 53,
    next     = "leveling-h36-ungoro-crater",
    leftOut  = {
        [4810] = { kind = "far", turnin = true },
        [4907] = { kind = "prereq" },
        [5055] = { kind = "prereq" },
        [5057] = { kind = "prereq" },
        [5128] = { kind = "prereq" },
        [5204] = { kind = "prereq" },
        [5242] = { kind = "far" },
        [5385] = { kind = "prereq" },
        [6603] = { kind = "away" },
        [6605] = { kind = "away" },
    },
    steps    = {
        { go = { 1448, 51.21, 82.11 }, text = "Travel to Emerald Sanctuary", -- level 52
          note = "Felwood: Emerald Sanctuary, in the south of the zone." },
        { accept = 5155 }, -- level 52
        { accept = 5156, -- level 52
          note = "The NPC is indoors." },
        { accept = 8460 }, -- level 52
        { complete = 8460 }, -- level 52
        { turnin = 8460, accept = 8462 }, -- level 52
        { collect = { { 21377, 5 } } }, -- level 52
        { collect = { { 21377, 1 } }, keep = 21377, -- level 52
          note = "Hand these in afterwards for experience and reputation." },
        { go = { 1448, 48.45, 89.23 }, text = "Raise Timbermaw Hold standing to Unfriendly" }, -- level 52
        { accept = 4102 }, -- level 52
        { complete = 5155, -- level 52
          note = "Extra targets wait in the caves." },
        { go = { 1448, 38.71, 57.36 }, text = "Stay on the trail" }, -- level 52
        { go = { 1448, 37.6, 49.22 }, text = "Walk west beside the river" }, -- level 52
        { accept = 4505 }, -- level 52
        { accept = 6162 }, -- level 52
        { vendor = true, talk = 3313, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 52
          note = "The NPC is indoors. A lengthy grinding stretch is coming up." },
        { go = { 1448, 34.48, 54.02 }, fly = true, talk = 11900, text = "Fly to Bloodvenom Post" }, -- level 52
        { go = { 1448, 36.7, 66.81 }, text = "Circle the mountain, then stay on the trail" }, -- level 52
        { complete = 4505, useitem = 12566, -- level 52
          note = "Beware of foes lurking in stealth." },
        { complete = 6162 }, -- level 52
        { level = 52, xp = 155500, collect = { { 21377, 1 } }, keep = 21377, patrol = { { 1448, 48.45, 89.23 }, { 1448, 46.17, 89.24 }, { 1448, 46.76, 91.83 }, { 1448, 47.97, 93.45 }, { 1448, 49.46, 91.57 } }, why = { kind = "level", levels = { 52, 56 } }, -- level 52
          note = "Together with the next turn-ins, this brings you to level 53. Tougher foes are coming up next. Dungeon runs are a fine choice here too, as you like." },
        { turnin = 5155, accept = 5157 }, -- level 52
        { go = { 1448, 38.49, 59.73 }, text = "Stay on the trail to reach Jaedenar" }, -- level 53
        { complete = 5157, useitem = 12922, sticky = 5156 }, -- level 53
        { complete = 5156 }, -- level 53
        { complete = 5156 }, -- level 53
        { complete = 4102, -- level 53
          note = "Fight the elementals of the swamp. Targets are in the cavern and around its entrance too." },
        { go = { 1448, 55.93, 17.12 }, text = "Head out of the cave" }, -- level 53
        { complete = 4120, -- level 53
          note = "Hunt bears. The targets are wolves." },
        { turnin = 8462, -- level 53
          note = "Keep to the road the whole way." },
        { turnin = 3908, accept = 5082, sticky = 5082 }, -- level 53
        { accept = 5083, collect = { { 12771, 1 } }, useitem = 12771, -- level 53
          note = "The targets are furbolgs." },
        { complete = 5082, -- level 53
          note = "Other creatures use these spawn points too." },
        { turnin = { 5082, 5083 }, accept = { 5084, 3909 }, why = { action = "accept", back = true, chain = 8, kind = "detour", quest = 3909, quests = 15, seconds = 480, short = true, total = 66000, xp = 38000 } }, -- level 53
        { talk = 11119, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 53
        { talk = 11119, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 53
          note = "You will tame a short-term pet shortly. You pick up Claw (Rank 7) here." },
        { talk = 13917, collect = { { 12438, 1 } }, spots = { { 1452, 61.51, 36.91 } }, -- level 53
          note = "The NPC is indoors." },
        { talk = 13917, bank = { 10538, 10691, 10692, 10693, 10694 }, -- level 53
          note = "The NPC is indoors. You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots." },
        { turnin = 4808 }, -- level 53
        { go = { 1452, 60.51, 36.24 }, fly = true, talk = 11139, text = "Flight master at Everlook" }, -- level 53
        { turnin = 6162 }, -- level 53
        { turnin = 4505 }, -- level 53
        { go = { 1448, 39.04, 50.44 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 53
          note = "Tame an Angerclaw Mauler with your Tame Beast spell. Track down a plague-ridden bear with a chestnut coat." },
        { turnin = 4102 }, -- level 53
        { talk = 9529, collect = { { 11511, 1 } } }, -- level 53
        { turnin = 5157, accept = 5158, why = { kind = "carry", quest = 5158, seconds = 12300, xp = 2600 } }, -- level 53
        { turnin = 5156, -- level 53
          note = "The NPC is indoors." },
        { turnin = 3541, accept = 3563, why = { kind = "carry", once = true, quest = 3563, seconds = 12600, xp = 3800 }, -- level 53
          note = "The NPC is upstairs, out on the balcony." },
        { talk = 8673, collect = { { 10561, 1 } }, -- level 53
          note = "The NPC is indoors. Hold on to it for a task in Un'Goro Crater later." },
        { talk = 3309, collect = { { 11568, 1 }, { 11018, 25 } }, spots = { { 1454, 49.62, 69.06 } }, -- level 53
          note = "The NPC is indoors." },
        { talk = 3309, bank = 10680, -- level 53
          note = "The NPC is indoors. You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot." },
        { talk = 9983, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 53
        { talk = 9983, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 53
          note = "Release the short-term pet you tamed." },
        { sethearth = "Camp Taurajo", talk = 7714, -- level 53
          note = "The NPC is indoors." },
    },
})
