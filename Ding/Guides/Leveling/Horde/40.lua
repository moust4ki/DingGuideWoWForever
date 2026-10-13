-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/40.lua.
-- Simulated (warrior): Orc 58 (13%) -> 59 (15%) in 9 h 46, 13 quests turned in; Scourge 58 (13%) -> 59 (15%) in 9 h 46, 13 quests turned in; Tauren 58 (13%) -> 59 (15%) in 9 h 46, 13 quests turned in; Troll 58 (13%) -> 59 (15%) in 9 h 46, 13 quests turned in; Skyborne 58 (13%) -> 59 (15%) in 9 h 46, 13 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h40-winterspring",
    title    = "Winterspring (58-59)",
    faction  = "Horde",
    minLevel = 58, maxLevel = 59,
    next     = "leveling-h41-silithus",
    leftOut  = {
        [6606] = { kind = "detour", seconds = 60, xp = 700 },
    },
    steps    = {
        { talk = 11119, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master.", -- level 58
          note = "Winterspring: Everlook, in the middle of the zone." },
        { talk = 11119, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 58
          note = "You will tame a short-term pet shortly. Pick up Claw (Rank 8) for your pet." },
        { go = { 1452, 57.86, 26.45 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 58
          note = "Tame a Winterspring Screecher with the Tame Beast spell. Hunt the white owls." },
        { talk = 11119, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 58
        { talk = 11119, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 58
          note = "Release the short-term pet you tamed." },
        { accept = 977 }, -- level 58
        { accept = 4809 }, -- level 58
        { complete = 977, sticky = 8464, -- level 58
          note = "Either the patriarch or the matriarch yetis work. The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { go = { 1452, 67.61, 41.78 }, text = "Head out of the cave" }, -- level 58
        { go = { 1452, 65.89, 38.41 }, text = "Climb across the mountain to the far side" }, -- level 58
        { accept = 8471, collect = { { 20742, 1 } }, useitem = 20742, why = { kind = "carry", quest = 8471, seconds = 4980, xp = 5800 } }, -- level 58
        { complete = 8464, sticky = 4809 }, -- level 58
        { complete = 4741 }, -- level 58
        { turnin = 977 }, -- level 58
        { turnin = 4809, when = { ready = 4809 } }, -- level 58
        { turnin = 4741, accept = 4721, sticky = { 4721, 4809 }, why = { back = true, chain = 3, kind = "detour", quest = 4741, seconds = 480, short = true, xp = 22000 } }, -- level 58
        { accept = 4882, collect = { { 12558, 1 } }, useitem = 12558 }, -- level 58
        { complete = 4721, why = { action = "accept", kind = "detour", quest = 5163, seconds = 180, xp = 11000 } }, -- level 58
        { accept = 5163 }, -- level 58
        { complete = 5163, useitem = 12928, -- level 58
          note = "Target Legacki with the item." },
        { sethearth = "Everlook", talk = 11118, -- level 58
          note = "The NPC is indoors." },
        { turnin = 8464 }, -- level 58
        { turnin = 8471, when = { ready = 8471 }, why = { kind = "detour", quest = 8471, seconds = 60, xp = 5800 }, -- level 58
          note = "The NPC stands within the passage." },
        { go = { 1450, 32.05, 66.54 }, fly = true, talk = 12740, text = "Fly to Moonglade" }, -- level 58
        { turnin = 1123, accept = 1124, why = { kind = "carry", quest = 1124, seconds = 29160, xp = 2800 }, -- level 58
          note = "The NPC is indoors." },
        { go = { 1450, 51.74, 45.12 }, text = "Head indoors" }, -- level 58
        { talk = 11801, -- level 58
          note = "The NPC is indoors. Wait for the talking to finish" },
        { accept = 5527, -- level 58
          note = "The NPC is indoors." },
        { level = 59, collect = { { 21377, 1 } }, patrol = { { 1448, 63.56, 9.55 }, { 1448, 62.46, 7.63 }, { 1448, 63.54, 5.95 }, { 1448, 59.95, 6.64 }, { 1448, 60.46, 8.57 }, { 1448, 61.45, 10.77 }, { 1448, 62.37, 12.64 } }, why = { kind = "level", levels = { 55, 60 } }, -- level 58
          note = "One last lengthy stretch of monster farming. Dungeon runs are a fine choice here too, as you like. This number shrinks while you kill monsters." },
        { accept = 8467, when = { item = { 21377, 5 } } }, -- level 59
        { turnin = 8467, when = { item = { 21377, 5 }, ready = 8467 } }, -- level 59
        { turnin = 8470, when = { maxlevel = 56, ready = 8470 }, -- level 59
          note = "The NPC stands within the passage." },
        { collect = { { 14047, 30 } }, when = { maxlevel = 59 } }, -- level 59
        { accept = 6031, when = { item = { 14047, 30 }, maxlevel = 59 }, -- level 59
          note = "The NPC stands within the passage." },
        { turnin = 6031, when = { item = { 14047, 30 }, maxlevel = 59, ready = 6031 }, -- level 59
          note = "The NPC stands within the passage." },
        { turnin = { 4721, 4882 }, accept = 4883 }, -- level 59
        { talk = 8674, collect = { { 2592, 60 }, { 4306, 60 }, { 4338, 60 }, { 14047, 60 } }, -- level 59
          note = "You can also take it out of your bank." },
        { talk = 8356, collect = { { 11617, 1 }, { 12663, 1 } }, spots = { { 1456, 47.19, 57.86 } }, -- level 59
          note = "The NPC is indoors." },
        { accept = 7820, when = { item = { 2592, 60 } }, -- level 59
          note = "The NPC is indoors." },
        { turnin = 7820, when = { item = { 2592, 60 }, ready = 7820 } }, -- level 59
        { accept = 7821, when = { item = { 4306, 60 } }, -- level 59
          note = "The NPC is indoors." },
        { turnin = 7821, when = { item = { 4306, 60 }, ready = 7821 } }, -- level 59
        { accept = 7822, when = { item = { 4338, 60 } }, -- level 59
          note = "The NPC is indoors." },
        { turnin = 7822, when = { item = { 4338, 60 }, ready = 7822 } }, -- level 59
        { accept = 7823, when = { done = 7820, item = { 14047, 60 } }, -- level 59
          note = "The NPC is indoors." },
        { turnin = 7823, when = { item = { 14047, 60 }, ready = 7823 } }, -- level 59
        { turnin = { 4883, 4987 }, -- level 59
          note = "The NPC is indoors." },
        { accept = 7492, patrol = { { 1456, 42.63, 59.47 }, { 1456, 39.28, 63.15 }, { 1456, 37.18, 59.82 }, { 1456, 36.35, 54.02 }, { 1456, 37.84, 51.05 }, { 1456, 42.82, 56.46 }, { 1456, 44.33, 68.45 }, { 1456, 46.23, 69.19 }, { 1456, 49.01, 66.7 }, { 1456, 49.79, 61.98 }, { 1456, 56.74, 61.7 }, { 1456, 56.22, 54.54 }, { 1456, 59, 52.27 }, { 1456, 57.7, 48.52 }, { 1456, 54.28, 48.48 }, { 1456, 52.54, 51.27 }, { 1456, 55.25, 54.57 } }, -- level 59
          note = "The NPC patrols a long route; look along it." },
        { turnin = 7492, why = { kind = "detour", quest = 7492, seconds = 120, xp = 1500 }, -- level 59
          note = "The NPC is indoors." },
        { complete = 5163, useitem = 12928, -- level 59
          note = "Target Sprinkle with it." },
        { collect = { { 11173, 1 }, { 11172, 11 }, { 11169, 1 } }, useitem = 11617 }, -- level 59
        { go = { 1446, 68.56, 41.43 }, text = "Head down the passage that opens on Lost Rigger Cove" }, -- level 59
        { complete = 4005, useitem = 11169, -- level 59
          note = "Wait for the talking to finish" },
        { go = { 1446, 69.69, 42.33 }, text = "Take the passage out of Lost Rigger Cove" }, -- level 59
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern", why = { kind = "detour", quest = 4005, quests = 2, seconds = 60, total = 8200, xp = 5500 } }, -- level 59
        { turnin = 4005, accept = 3961, -- level 59
          note = "Your targets are within the cavern." },
        { destroy = { 11173, 11172, 11169 } }, -- level 59
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 59
        { turnin = 3961 }, -- level 59
        { complete = 5163, useitem = 12928, -- level 59
          note = "Target Quixxil with it." },
    },
})
