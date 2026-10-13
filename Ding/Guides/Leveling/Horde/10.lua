-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/10.lua.
-- Simulated (warrior): Orc 26 (65%) -> 28 (25%) in 2 h 38, 24 quests turned in; Scourge 26 (65%) -> 28 (25%) in 2 h 31, 25 quests turned in; Tauren 26 (62%) -> 28 (25%) in 2 h 37, 25 quests turned in; Troll 26 (65%) -> 28 (25%) in 2 h 38, 24 quests turned in; Skyborne 26 (76%) -> 28 (25%) in 2 h 10, 24 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h10-ashenvale",
    title    = "Ashenvale (26-28)",
    faction  = "Horde",
    minLevel = 26, maxLevel = 28,
    next     = "leveling-h11-thousand-needles",
    steps    = {
        { go = { 1454, 55.9, 62.71 }, text = "Travel to the Crossroads", -- level 26
          note = "The Barrens: the Crossroads first, then Ashenvale: Splintertree Post." },
        { talk = 8673, collect = { { 16645, 1 }, { 16646, 1 }, { 16647, 1 }, { 16648, 1 }, { 16649, 1 }, { 16650, 1 }, { 16651, 1 }, { 16652, 1 }, { 16653, 1 }, { 16654, 1 }, { 16655, 1 }, { 16656, 1 } }, -- level 26
          note = "The NPC is indoors." },
        { vendor = true, talk = 3313, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 26
          note = "The NPC is indoors. A lengthy stretch of quests is coming up." },
        { accept = 6541 }, -- level 26
        { turnin = 95494, races = { "Orc", "Scourge", "Tauren", "Troll" } }, -- level 26
        { turnin = 6541, -- level 26
          note = "The NPC is on the tower's middle floor." },
        { accept = 6504, when = { item = { { 16645, 1 }, { 16646, 1 }, { 16647, 1 }, { 16648, 1 }, { 16649, 1 }, { 16650, 1 }, { 16651, 1 }, { 16652, 1 }, { 16653, 1 }, { 16654, 1 }, { 16655, 1 }, { 16656, 1 } } } }, -- level 26
        { complete = 6504, useitem = 16645, when = { log = 6504 } }, -- level 26
        { complete = 6504, useitem = 16649, when = { log = 6504 } }, -- level 26
        { complete = 6504, useitem = 16653, when = { log = 6504 } }, -- level 26
        { turnin = 6504, when = { item = 16642, log = 6504 } }, -- level 26
        { accept = 6503 }, -- level 26
        { turnin = 6382, accept = 6383 }, -- level 26
        { turnin = 6383 }, -- level 26
        { accept = 25 }, -- level 26
        { talk = 15131, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 26
        { talk = 15131, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 26
          note = "You will tame a short-term pet shortly. You pick up Claw (Rank 4) here." },
        { accept = 6441 }, -- level 26
        { go = { 1440, 73.14, 61.65 }, fly = true, talk = 12616, text = "Flight master at Splintertree Post" }, -- level 26
        { go = { 1440, 62.17, 68.03 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 26
          note = "Tame any Elder Ashenvale Bear with Tame Beast." },
        { talk = 15131, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 26
        { talk = 15131, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 26
          note = "Release the short-term pet you tamed." },
        { complete = 6503, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "HUNTER" }, -- level 26
          note = "The targets are night elves hiding in stealth. Mostly found beside tree trunks. Track Hidden makes them simpler to spot." },
        { accept = 6544, noauto = 6544, -- level 26
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { complete = 6544, -- level 26
          note = "Let the conversation play out. Escort Torek and guard him. Don't let him die." },
        { go = { 1440, 72.38, 49.87 }, text = "Take the riverside trail, then climb this trail" }, -- level 26
        { complete = 6441, -- level 26
          note = "Hunt down satyrs. Beware of foes lurking in stealth." },
        { level = 27, patrol = { { 1440, 68.65, 53.46 }, { 1440, 67.65, 54.56 }, { 1440, 66.24, 54.14 }, { 1440, 66.35, 51.75 }, { 1440, 66.63, 56.64 } }, -- level 26
          note = "Beware of foes lurking in stealth." },
        { accept = 24, collect = { { 16304, 1 } }, useitem = 16304, patrol = { { 1440, 62.56, 49.85 }, { 1440, 62.15, 49.84 }, { 1440, 61.39, 50.03 }, { 1440, 60.99, 50.3 }, { 1440, 61.06, 50.88 }, { 1440, 60.91, 51.52 }, { 1440, 60.56, 52.44 }, { 1440, 59.89, 53.35 }, { 1440, 59.62, 53.73 }, { 1440, 59.26, 54.17 }, { 1440, 59.04, 54.81 }, { 1440, 58.83, 55.25 }, { 1440, 57.76, 56.01 }, { 1440, 57.42, 56.01 }, { 1440, 56.97, 56.01 }, { 1440, 56.36, 55.88 }, { 1440, 56.15, 55.42 }, { 1440, 55.75, 55.46 }, { 1440, 54.1, 54.98 }, { 1440, 52.2, 54.4 } }, when = { done = 6383 }, -- level 27
          note = "The target is a panther with black fur. The target roams a wide route. The target appears close to 62.4, 50.0 in Ashenvale." },
        { collect = { { 5867, 1 } }, spots = { { 1440, 59.17, 54.43 }, { 1440, 57.46, 55.96 }, { 1440, 58.45, 58.25 }, { 1440, 59.55, 56.63 }, { 1440, 60.43, 52.37 }, { 1440, 60.83, 49.05 }, { 1440, 62.64, 50.16 } }, sticky = 216 }, -- level 27
        { go = { 1440, 44.22, 56.3 }, text = "Take the trail north into Thistlefur Hold" }, -- level 27
        { go = { 1440, 37.45, 32.29 }, text = "Climb the trail" }, -- level 27
        { go = { 1440, 38.47, 30.63 }, text = "Go into the cavern" }, -- level 27
        { complete = 6462, -- level 27
          note = "Search the brown crates built of timber. Mostly on the cavern's upper level." },
        { accept = 6482, noauto = 6482, -- level 27
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. The NPC is on the cave's lowest level." },
        { complete = 6482, -- level 27
          note = "Escort Ruul Snowhoof and keep him alive." },
        { complete = 216 }, -- level 27
        { accept = 98251 }, -- level 27
        { complete = 98251 }, -- level 27
        { turnin = 98251 }, -- level 27
        { accept = 78132 }, -- level 27
        { turnin = 78132 }, -- level 27
        { accept = 78133 }, -- level 27
        { turnin = 78133 }, -- level 27
        { accept = 78134, races = { "Scourge", "Tauren", "Skyborne" } }, -- level 27
        { turnin = 78134, races = { "Scourge", "Tauren", "Skyborne" } }, -- level 27
        { complete = 1534, useitem = 7767, when = { log = 1534 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 27
          note = "Stay clear of Astranaar." },
        { accept = 23, collect = { { 16303, 1 } }, useitem = 16303, patrol = { { 1440, 42.63, 63.18 }, { 1440, 43.04, 63.13 }, { 1440, 43.21, 63.8 }, { 1440, 43.77, 63.82 }, { 1440, 43.19, 63.85 }, { 1440, 43.17, 63.12 }, { 1440, 42.65, 63.2 }, { 1440, 42.61, 64.02 }, { 1440, 42.3, 64.76 }, { 1440, 41.81, 65.32 }, { 1440, 40.88, 66.41 }, { 1440, 40.28, 66.32 }, { 1440, 39.74, 65.38 }, { 1440, 39.72, 63.86 }, { 1440, 39.86, 62.96 }, { 1440, 39.7, 63.82 }, { 1440, 39.83, 65.45 }, { 1440, 41.45, 66.65 }, { 1440, 41.44, 67.49 }, { 1440, 41.71, 68.31 }, { 1440, 41.99, 68.69 }, { 1440, 42.37, 68.39 }, { 1440, 42.88, 68.48 }, { 1440, 43.26, 68.13 }, { 1440, 43.83, 68.82 }, { 1440, 43.33, 68.18 }, { 1440, 42.5, 68.43 }, { 1440, 41.99, 68.69 }, { 1440, 41.76, 68.21 }, { 1440, 41.5, 67.45 }, { 1440, 41.46, 66.47 }, { 1440, 40.26, 66.29 }, { 1440, 39.71, 65.48 }, { 1440, 39.64, 64.32 }, { 1440, 39.61, 63.85 }, { 1440, 39.78, 62.84 }, { 1440, 39.6, 63.74 }, { 1440, 39.72, 65.5 }, { 1440, 40.16, 66.27 }, { 1440, 40.57, 66.01 }, { 1440, 41.61, 65.7 }, { 1440, 42.24, 64.94 }, { 1440, 42.56, 64.08 } }, when = { done = 6383 }, -- level 27
          note = "Look for a gray druid-style bear. The target roams a wide route. Stay clear of Astranaar." },
        { complete = 25 }, -- level 27
        { accept = 1918, collect = { { 16408, 1 } }, useitem = 16408, -- level 27
          note = "The target is a watery being tinted a deeper green. The target roams; check the area." },
        { complete = 25 }, -- level 27
        { level = 27, xp = 14950, patrol = { { 1440, 52.44, 62.83 }, { 1440, 53.44, 60.75 }, { 1440, 55.04, 62.15 }, { 1440, 57.63, 63.96 }, { 1440, 50.35, 61.23 } }, -- level 27
          note = "Together with the next turn-ins, this brings you to level 28. Steer away from Silverwind Refuge." },
        { complete = 1195, useitem = 5867 }, -- level 27
        { go = { 1440, 59.55, 68.19 }, text = "Climb the trail, then return by road to Splintertree Post" }, -- level 27
        { turnin = 6503, when = { ready = 6503 } }, -- level 27
        { turnin = 6544 }, -- level 27
        { turnin = { 24, 23 } }, -- level 27
        { turnin = 6482, -- level 27
          note = "The NPC is indoors." },
        { turnin = { 25, 1918 }, accept = 824 }, -- level 27
        { turnin = 6441 }, -- level 27
        { turnin = 824, -- level 27
          note = "The NPC is indoors." },
        { turnin = 6462, -- level 27
          note = "The NPC is indoors." },
        { turnin = 216 }, -- level 27
        { accept = 6641, -- level 27
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { complete = 6641, -- level 27
          note = "Let the conversation play out. Escort Muglash and keep him safe. If the item isn't usable yet, hold on a moment." },
        { turnin = 6641 }, -- level 27
        { accept = { 6921, 6563 }, dungeon = "Blackfathom Deeps", -- level 27
          note = "The NPC is indoors." },
        { go = { 1440, 14.11, 14.87 }, dungeon = "Blackfathom Deeps", text = "Go into the Blackfathom Deeps instance" }, -- level 27
        { accept = 6564, dungeon = "Blackfathom Deeps", collect = { { 16790, 1 } }, useitem = 16790, -- level 27
          note = "In Blackfathom Deeps, naga enemies drop it. The targets are all over the tunnels." },
        { complete = 6563, dungeon = "Blackfathom Deeps", -- level 27
          note = "Collect the azure shards along the cavern sides in Blackfathom Deeps. The targets are all over the tunnels." },
        { accept = 6561, dungeon = "Blackfathom Deeps", -- level 27
          note = "Dive down into the submerged cave. This is in the Pool of Ask'ar part of the dungeon. Find the NPC to the southwest of Ghamoo-ra." },
        { complete = 6921, dungeon = "Blackfathom Deeps", -- level 27
          note = "Your targets sit below the water's surface. Head to the Moonshrine Ruins for this. Be ready for a fight right away." },
        { accept = 6922, dungeon = "Blackfathom Deeps", collect = { { 16782, 1 } }, useitem = 16782 }, -- level 27
        { complete = 6561, dungeon = "Blackfathom Deeps", -- level 27
          note = "The target is the third boss you meet." },
        { turnin = { 6921, 6563, 6922, 6564 }, dungeon = "Blackfathom Deeps", -- level 27
          note = "The NPC is indoors." },
        { go = { 1440, 73.28, 61.51 }, text = "Head back to Splintertree Post" }, -- level 28
        { accept = 2, collect = { { 16305, 1 } }, useitem = 16305, patrol = { { 1440, 71.53, 70.15 }, { 1440, 72, 70.42 }, { 1440, 72.51, 70.58 }, { 1440, 73.35, 70.53 }, { 1440, 74.41, 70.13 }, { 1440, 75.03, 70.05 }, { 1440, 75.88, 69.74 }, { 1440, 76.13, 69.04 }, { 1440, 76.81, 68.17 }, { 1440, 77.51, 66.46 }, { 1440, 77.92, 66.02 }, { 1440, 78.35, 65.61 }, { 1440, 77.92, 66.02 }, { 1440, 77.51, 66.46 }, { 1440, 76.81, 68.17 }, { 1440, 76.13, 69.04 }, { 1440, 75.88, 69.74 }, { 1440, 75.03, 70.05 }, { 1440, 74.41, 70.13 }, { 1440, 73.35, 70.53 }, { 1440, 72.51, 70.58 }, { 1440, 72, 70.42 } }, when = { done = 6383 }, -- level 28
          note = "Your quarry is a huge azure bird of level 31. The target circles over a wide area. It appears near 78.0, 66.0 in Ashenvale." },
        { turnin = 2, accept = 247 }, -- level 28
        { turnin = 247 }, -- level 28
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 28
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 28
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 28
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 28
          note = "This NPC is found down in the Cleft of Shadow." },
        { go = { 1456, 29.92, 29.78 }, text = "Go into the cavern" }, -- level 28
        { turnin = 1086, -- level 28
          note = "Your targets are within the cavern." },
        { train = true, talk = 3045, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 28
          note = "Your targets are within the cavern." },
        { train = true, talk = 3047, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 28
          note = "Your targets are within the cavern." },
        { go = { 1456, 29.77, 29.79 }, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, text = "Head out of the cave", -- level 28
          note = "The NPC is indoors." },
        { train = true, talk = 3030, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" } }, -- level 28
        { go = { 1456, 29.92, 29.78 }, text = "Head out of the cave" }, -- level 28
        { turnin = 1195, accept = 1196 }, -- level 28
        { turnin = 6561, dungeon = "Blackfathom Deeps", -- level 28
          note = "The NPC is indoors." },
        { accept = 1131 }, -- level 28
        { train = true, talk = 3040, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 28
          note = "The NPC is indoors." },
        { train = true, talk = 3043, classes = { "WARRIOR" }, -- level 28
          note = "The NPC is indoors." },
        { sethearth = "Thunder Bluff", talk = 6746, -- level 28
          note = "The NPC is indoors." },
    },
})
