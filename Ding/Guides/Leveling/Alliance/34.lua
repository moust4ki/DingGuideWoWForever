-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/34.lua.
-- Simulated (warrior): Human 51 (15%) -> 51 (66%) in 1 h 10, 16 quests turned in; Dwarf 51 (15%) -> 51 (66%) in 1 h 10, 16 quests turned in; NightElf 51 (15%) -> 51 (63%) in 1 h 10, 16 quests turned in; Gnome 51 (15%) -> 51 (66%) in 1 h 10, 16 quests turned in; Skyborne 51 (15%) -> 51 (66%) in 1 h 10, 16 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a34-blasted-lands-and-burning-steppes",
    title    = "Blasted Lands and Burning Steppes (51-51)",
    faction  = "Alliance",
    minLevel = 51, maxLevel = 51,
    next     = "leveling-a35-western-plaguelands",
    steps    = {
        { go = { 1419, 67.57, 19.29 }, text = "Travel to Nethergarde Keep", -- level 51
          note = "Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes." },
        { accept = 2783, -- level 51
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 2783, accept = 2801 }, -- level 51
        { complete = 2801, talk = 7572 }, -- level 51
        { turnin = 2801 }, -- level 51
        { accept = { 2581, 2583, 2585 } }, -- level 51
        { accept = { 2601, 2603 } }, -- level 51
        { collect = { { 8396, 14 } }, spots = { { 1419, 56.54, 35.37 }, { 1419, 46.17, 18.75 }, { 1419, 46.17, 22.63 }, { 1419, 49.97, 17.55 }, { 1419, 54.43, 36.24 }, { 1419, 54.74, 44.45 }, { 1419, 56.14, 29.56 }, { 1419, 48.85, 19.57 }, { 1419, 57.86, 44.54 }, { 1419, 59.83, 39.65 }, { 1419, 61.34, 26.77 } }, -- level 51
          note = "Hunt the vultures. Prioritize these targets." },
        { collect = { { 8394, 11 } }, spots = { { 1419, 54.37, 29.86 }, { 1419, 44.36, 31.24 }, { 1419, 45.45, 42.66 }, { 1419, 45.46, 46.37 }, { 1419, 45.35, 52.37 }, { 1419, 46.54, 35.96 }, { 1419, 47.44, 49.36 }, { 1419, 49.34, 53.45 }, { 1419, 51.45, 36.63 }, { 1419, 51.37, 40.77 }, { 1419, 52.44, 57.55 }, { 1419, 54.46, 43.45 }, { 1419, 57.34, 35.86 }, { 1419, 57.64, 31.04 }, { 1419, 58.34, 27.46 }, { 1419, 62.43, 28.24 } }, -- level 51
          note = "Hunt basilisks. They appear in the same spots as the boars." },
        { collect = { { 8392, 6 } }, spots = { { 1419, 57.26, 27.23 }, { 1419, 44.37, 31.45 }, { 1419, 44.45, 36.35 }, { 1419, 45.25, 41.65 }, { 1419, 45.45, 45.14 }, { 1419, 45.34, 52.56 }, { 1419, 47.34, 37.23 }, { 1419, 47.66, 49.16 }, { 1419, 51.15, 37.35 }, { 1419, 51.15, 57.55 }, { 1419, 52.74, 52.34 }, { 1419, 53.85, 34.44 }, { 1419, 54.45, 30.86 }, { 1419, 54.44, 43.54 }, { 1419, 57.17, 35.63 }, { 1419, 61.84, 30.83 }, { 1419, 62.57, 26.17 } }, -- level 51
          note = "Kill boars for these. Basilisks compete for the same spawn points." },
        { collect = { { 8391, 5 } }, spots = { { 1419, 58.17, 31.74 }, { 1419, 43.45, 26.35 }, { 1419, 44.25, 29.57 }, { 1419, 44.35, 19.37 }, { 1419, 46.16, 15.35 }, { 1419, 48.34, 23.54 }, { 1419, 50.65, 17.35 }, { 1419, 54.97, 38.04 }, { 1419, 55.14, 41.14 }, { 1419, 56.43, 45.74 }, { 1419, 58.37, 36.66 }, { 1419, 59.24, 40.37 }, { 1419, 59.94, 43.44 }, { 1419, 61.46, 48.44 }, { 1419, 61.63, 34.46 }, { 1419, 62.15, 38.95 }, { 1419, 62.96, 44.66 } }, -- level 51
          note = "Hunt hyenas for these. Scorpions spawn in the same spots." },
        { collect = { { 8393, 6 } }, spots = { { 1419, 47.57, 18.75 }, { 1419, 43.45, 26.35 }, { 1419, 44.35, 19.37 }, { 1419, 44.46, 22.44 }, { 1419, 44.37, 29.83 }, { 1419, 46.43, 15.45 }, { 1419, 47.34, 22.66 }, { 1419, 49.34, 16.44 }, { 1419, 49.55, 24.75 }, { 1419, 50.36, 29.04 }, { 1419, 58.46, 41.96 }, { 1419, 60.16, 35.86 }, { 1419, 61.55, 45.75 } }, -- level 51
          note = "The foes here are scorpions. Hyenas also use these spawn spots." },
        { accept = 3501, when = { item = 10593 }, -- level 51
          note = "This one roams, so scan the surrounding area." },
        { turnin = 3501, when = { log = 3501, ready = 3501 }, -- level 51
          note = "This one roams, so scan the surrounding area." },
        { turnin = 2521, when = { log = 2521, ready = 2521 } }, -- level 51
        { turnin = 2601, when = { ready = 2601 } }, -- level 51
        { turnin = 2603, when = { ready = 2603 } }, -- level 51
        { turnin = 2581, when = { ready = 2581 } }, -- level 51
        { turnin = 2583, when = { ready = 2583 } }, -- level 51
        { turnin = 2585, when = { ready = 2585 } }, -- level 51
        { destroy = { 8396, 8394, 8392, 8391, 8393 } }, -- level 51
        { go = { 1428, 82.79, 63.27 }, text = "Climb the trail to Morgan's Vigil" }, -- level 51
        { go = { 1428, 84.39, 68.36 }, fly = true, talk = 2299, text = "Flight master at Morgan's Vigil" }, -- level 51
        { accept = 3823 }, -- level 51
        { complete = 3823 }, -- level 51
        { go = { 1428, 82.79, 63.27 }, text = "Climb the trail to Morgan's Vigil" }, -- level 51
        { turnin = 3823 }, -- level 51
        { accept = 4512, -- level 51
          note = "The NPC is indoors." },
        { turnin = 3368, races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" }, -- level 51
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { turnin = 3368, races = { "Human", "Dwarf", "Skyborne" } }, -- level 51
        { accept = 3448 }, -- level 51
        { turnin = 3448, -- level 51
          note = "The NPC is indoors." },
        { accept = 3449, when = { notdone = 3451 } }, -- level 51
        { accept = 3790, -- level 51
          note = "The NPC is indoors." },
        { sethearth = "Ironforge", talk = 5111, -- level 51
          note = "The NPC is indoors." },
        { talk = 8720, unbank = 10561, -- level 51
          note = "The NPC is indoors. Hold on to it; a task in Un'Goro Crater calls for it later." },
        { talk = 2461, collect = { { 9328, 1 }, { 9330, 1 }, { 10819, 15 } }, spots = { { 1455, 35.87, 60.19 } }, -- level 51
          note = "The NPC is indoors." },
        { talk = 2461, bank = { 10561, 10445 }, -- level 51
          note = "The NPC is indoors." },
        { talk = 8720, collect = { { 2592, 120 }, { 4306, 120 }, { 4338, 120 }, { 14047, 120 } }, -- level 51
          note = "8 different quests will ask for it. You hand in 60 pieces of cloth for every quest. The NPC is indoors." },
        { accept = 7802, when = { item = { 2592, 60 } } }, -- level 51
        { turnin = 7802, when = { item = { 2592, 60 }, ready = 7802 } }, -- level 51
        { accept = 7803, when = { item = { 4306, 60 } } }, -- level 51
        { turnin = 7803, when = { item = { 4306, 60 }, ready = 7803 } }, -- level 51
        { accept = 7804, when = { item = { 4338, 60 } } }, -- level 51
        { turnin = 95041, races = { "NightElf" } }, -- level 51
        { turnin = 7804, when = { item = { 4338, 60 }, ready = 7804 } }, -- level 51
        { accept = 7805, when = { done = { 7802, 7803, 7804 }, item = { 14047, 60 } } }, -- level 51
        { turnin = 7805, when = { done = { 7802, 7803, 7804 }, item = { 14047, 60 }, ready = 7805 } }, -- level 51
        { accept = 7807, when = { item = { 2592, 60 } } }, -- level 51
        { turnin = 7807, when = { item = { 2592, 60 }, ready = 7807 } }, -- level 51
        { accept = 7808, when = { item = { 4306, 60 } } }, -- level 51
        { turnin = 7808, when = { item = { 4306, 60 }, ready = 7808 } }, -- level 51
        { accept = 7809, when = { item = { 4338, 60 } } }, -- level 51
        { turnin = 7809, when = { item = { 4338, 60 }, ready = 7809 } }, -- level 51
        { accept = 7811, when = { done = { 7807, 7808, 7809 }, item = { 14047, 60 } } }, -- level 51
        { turnin = 7811, when = { done = { 7807, 7808, 7809 }, item = { 14047, 60 }, ready = 7811 } }, -- level 51
        { accept = 3450 }, -- level 51
        { turnin = 3450 }, -- level 51
        { accept = 3451, -- level 51
          note = "The NPC is indoors." },
        { turnin = 3451, -- level 51
          note = "The NPC is indoors." },
        { accept = 5090, patrol = { { 1455, 57.37, 78.89 }, { 1455, 50.1, 81.12 }, { 1455, 39.64, 79.21 }, { 1455, 34.31, 74.41 }, { 1455, 24.63, 55.29 }, { 1455, 24.41, 38.39 }, { 1455, 27.76, 25.17 }, { 1455, 32.19, 22.87 }, { 1455, 34.69, 33.9 }, { 1455, 40.34, 37.63 }, { 1455, 48.19, 31.04 }, { 1455, 55.96, 35.06 }, { 1455, 57.37, 48.53 }, { 1455, 48.25, 57.91 }, { 1455, 46.27, 47.72 }, { 1455, 39.89, 44.36 }, { 1455, 38.47, 38.27 }, { 1455, 34.54, 32.8 }, { 1455, 33.36, 21.21 }, { 1455, 39.41, 12.37 }, { 1455, 44.36, 10.82 }, { 1455, 52.98, 10.51 }, { 1455, 59.03, 13.8 }, { 1455, 70.44, 33.91 }, { 1455, 71.22, 44.74 }, { 1455, 70.07, 55.04 }, { 1455, 67.35, 65.11 } }, -- level 51
          note = "The NPC patrols a long route; look along it." },
        { turnin = 2989, when = { log = 2989, ready = 2989 }, -- level 51
          note = "The NPC is indoors. The NPC is at the summit of the trail." },
        { turnin = 2877, -- level 51
          note = "The NPC is indoors." },
        { complete = 2641, -- level 51
          note = "Look for the brown fungi. Your targets sit below the water's surface." },
        { turnin = 626, -- level 51
          note = "The spot is at the foot of the falls. Your targets sit below the water's surface." },
    },
})
