-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/04.lua.
-- Simulated (warrior): Orc 13 (85%) -> 15 (25%) in 1 h 20, 20 quests turned in; Scourge 14 (3%) -> 15 (52%) in 1 h 27, 24 quests turned in; Tauren 14 (22%) -> 15 (55%) in 1 h 20, 20 quests turned in; Troll 13 (85%) -> 15 (25%) in 1 h 20, 20 quests turned in; Skyborne 13 (0%) -> 15 (7%) in 2 h 15, 19 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h04-silverpine-forest",
    title    = "Silverpine Forest (13-15)",
    faction  = "Horde",
    minLevel = 13, maxLevel = 15,
    next     = "leveling-h05-the-barrens-and-stonetalon-mountains",
    steps    = {
        { go = { 1421, 56.18, 9.18 }, text = "Travel to Silverpine Forest", -- level 13
          note = "Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north." },
        { accept = 435, noauto = 435, -- level 13
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. The NPC is indoors." },
        { complete = 435, -- level 13
          note = "Let the conversation play out. Escort Deathstalker Erland and keep him alive." },
        { turnin = 435, accept = { 449, 429 } }, -- level 13
        { collect = { { 3164, 6 } }, keep = 3164, -- level 13
          note = "Hunt the wolves whose fur is jet black." },
        { go = { 1421, 51.23, 21.65 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a pet here", -- level 13
          note = "Pick one Ferocious Grizzled Bear and tame it with Tame Beast. Release your current pet before this. Here you tame a pet to keep." },
        { go = { 1421, 45.59, 42.55 }, fly = true, talk = 2226, text = "Fly to The Sepulcher" }, -- level 13
        { go = { 1421, 45.59, 42.55 }, fly = true, talk = 2226, races = { "Scourge" }, text = "Fly to Undercity" }, -- level 14
        { accept = 421 }, -- level 13
        { accept = 477 }, -- level 13
        { accept = 6321, races = { "Scourge" } }, -- level 14
        { go = { 1421, 43.04, 41.43 }, text = "Go down into the tomb" }, -- level 13
        { turnin = 449, accept = { 3221, 437 }, -- level 13
          note = "This is below ground, on the crypt's lower floor." },
        { accept = 91921 }, -- level 13
        { turnin = 3221, accept = { 1359, 447 }, -- level 13
          note = "The NPC stands outdoors, next to the crypt." },
        { turnin = 445, races = { "Orc", "Scourge", "Tauren", "Troll" } }, -- level 13
        { turnin = 429, when = { ready = 429 } }, -- level 13
        { accept = 430, when = { done = 429 } }, -- level 13
        { destroy = 3164 }, -- level 13
        { turnin = 6321, accept = 6323, races = { "Scourge" } }, -- level 14
        { complete = 421, -- level 13
          note = "The targets are worgen." },
        { turnin = 421, accept = 422 }, -- level 13
        { go = { 1421, 49.8, 30.02 }, text = "Walk over the span" }, -- level 13
        { complete = 422, -- level 13
          note = "Be ready for a fight right away. The object is indoors, one floor up." },
        { turnin = 430, when = { log = 430 }, -- level 13
          note = "The NPC is indoors, one floor up." },
        { turnin = 91921 }, -- level 13
        { accept = 425, when = { done = 430 }, -- level 13
          note = "The quest giver stands outdoors, not indoors." },
        { complete = 425, when = { log = 425 }, -- level 13
          note = "He has three ghouls at his side. Hold off until one steps out, then slay it. The target is indoors." },
        { turnin = 425, when = { log = 425 } }, -- level 13
        { complete = 437 }, -- level 13
        { complete = 437, sticky = 447, -- level 13
          note = "Your targets here are gnolls. The target shows up here sooner or later." },
        { complete = 447 }, -- level 13
        { complete = 447, -- level 13
          note = "Hunt spiders for it. The targets roam the mine and the area around it." },
        { go = { 1421, 35.6, 13.52 }, deathskip = true, text = "Die on purpose at this spot", -- level 13
          note = "Die to the monsters here on purpose. This is the quickest way over." },
        { deathskip = true, revive = { 1421, 44.34, 41.55 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 13
        { talk = 6491 }, -- level 13
        { turnin = 422, accept = 423 }, -- level 13
        { go = { 1421, 43.04, 41.43 }, text = "Go down into the tomb" }, -- level 13
        { turnin = 437, accept = 438, -- level 13
          note = "This is below ground, on the crypt's lower floor." },
        { turnin = 438, accept = 439, object = 1593, sticky = 423 }, -- level 13
        { complete = 423, -- level 14
          note = "The targets roam the mine and the area around it." },
        { complete = 423, -- level 14
          note = "The targets roam the mine and the area around it." },
        { go = { 1421, 56.5, 46.08 }, text = "Exit the mine shaft" }, -- level 14
        { turnin = 477, accept = 478, object = 1627 }, -- level 14
        { level = 14, xp = 10685, patrol = { { 1421, 54.36, 45.14 }, { 1421, 50.75, 47.46 }, { 1421, 51.23, 42.17 }, { 1421, 52.46, 38.17 }, { 1421, 55.26, 39.97 }, { 1421, 48.96, 36.84 }, { 1421, 47.46, 33.74 } }, -- level 14
          note = "With the coming turn-ins, this gets you to level 15." },
        { turnin = 478, accept = 481 }, -- level 14
        { accept = 98298 }, -- level 14
        { turnin = { 423, 481 }, accept = 482 }, -- level 14
        { turnin = 482 }, -- level 14
        { go = { 1421, 43.04, 41.43 }, text = "Go down into the tomb" }, -- level 14
        { turnin = 439, -- level 14
          note = "This is below ground, on the crypt's lower floor." },
        { turnin = 6323, accept = 6322, races = { "Scourge" }, -- level 15
          note = "The NPC is on Undercity's upper level." },
        { turnin = 6322, accept = 6324, races = { "Scourge" }, -- level 15
          note = "The NPC is on Undercity's upper level." },
        { accept = 97891, races = { "Scourge" } }, -- level 15
        { turnin = 6324, races = { "Scourge" } }, -- level 15
        { go = { 1458, 52.78, 77.59 }, text = "Take the trail downhill" }, -- level 14
        { turnin = 447 }, -- level 14
        { turnin = 1359, accept = 1358 }, -- level 15
        { accept = 97891, races = { "Orc", "Tauren", "Troll", "Skyborne" } }, -- level 15
        { train = true, talk = 4608, races = { "Scourge", "Troll" }, classes = { "PRIEST" } }, -- level 15
        { train = true, talk = 4582, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 15
        { train = true, talk = 4568, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 15
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 4563, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 15
          note = "The NPC is indoors." },
        { vendor = true, talk = 5753, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 4595, classes = { "WARRIOR" }, -- level 15
          note = "The NPC is indoors." },
        { turnin = 1886, when = { ready = 1886 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { accept = 1898, when = { done = 1886 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { turnin = 1898, when = { log = 1898 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { accept = 1899, when = { done = 1898 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { complete = 1899, when = { log = 1899 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { turnin = 1899, when = { ready = 1899 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { accept = 1978, when = { done = 1899 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { turnin = 1978, when = { log = 1978 }, races = { "Scourge" }, classes = { "ROGUE" } }, -- level 15
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 15
        { accept = { 5723, 5722 }, dungeon = "Ragefire Chasm", races = { "Tauren", "Skyborne" } }, -- level 15
        { accept = 5726, dungeon = "Ragefire Chasm", -- level 15
          note = "The NPC is indoors." },
        { complete = 5726, dungeon = "Ragefire Chasm", -- level 15
          note = "Your targets are within the cavern." },
        { turnin = 5726, accept = 5727, dungeon = "Ragefire Chasm", -- level 15
          note = "The NPC is indoors." },
        { complete = 5727, dungeon = "Ragefire Chasm", talk = 3216, -- level 15
          note = "The NPC is indoors. This NPC is found down in the Cleft of Shadow." },
        { turnin = 5727, accept = 5728, dungeon = "Ragefire Chasm", -- level 15
          note = "The NPC is indoors." },
        { accept = 5761, dungeon = "Ragefire Chasm", -- level 15
          note = "The NPC is indoors. This NPC is found down in the Cleft of Shadow." },
        { turnin = 5722, dungeon = "Ragefire Chasm", talk = 11834, races = { "Tauren", "Skyborne" }, -- level 15
          note = "The NPC is in a little cave. The NPC is past the big trogg chamber, on its right side." },
        { complete = 5761, dungeon = "Ragefire Chasm", -- level 15
          note = "The target is the dungeon's second boss." },
        { complete = 5728, dungeon = "Ragefire Chasm", -- level 15
          note = "The target is the third boss you meet." },
        { complete = 5728, dungeon = "Ragefire Chasm", -- level 15
          note = "The target is the dungeon's last boss." },
        { complete = 5723, dungeon = "Ragefire Chasm", races = { "Tauren", "Skyborne" } }, -- level 15
        { turnin = 5761, dungeon = "Ragefire Chasm", -- level 15
          note = "The NPC is indoors. This NPC is found down in the Cleft of Shadow." },
        { turnin = 5728, dungeon = "Ragefire Chasm", -- level 15
          note = "The NPC is indoors." },
        { turnin = 5723, dungeon = "Ragefire Chasm", when = { ready = 5723 }, races = { "Tauren", "Skyborne" } }, -- level 15
        { train = true, talk = 3173, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 3171, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 15
          note = "The NPC is indoors." },
    },
})
