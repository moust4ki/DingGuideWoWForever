-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/13.lua.
-- Simulated (warrior): Orc 32 (2%) -> 33 (7%) in 3 h 29, 11 quests turned in; Scourge 32 (2%) -> 33 (7%) in 3 h 29, 11 quests turned in; Tauren 32 (2%) -> 33 (7%) in 3 h 29, 11 quests turned in; Troll 32 (2%) -> 33 (7%) in 3 h 29, 11 quests turned in; Skyborne 32 (2%) -> 33 (7%) in 3 h 29, 11 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h13-arathi-highlands",
    title    = "Arathi Highlands (32-33)",
    faction  = "Horde",
    minLevel = 32, maxLevel = 33,
    next     = "leveling-h14-thousand-needles",
    steps    = {
        { complete = 676, -- level 32
          note = "Arathi Highlands: Hammerfall, in the east of the zone. Your targets are within the cavern." },
        { go = { 1417, 34.77, 44.18 }, text = "Head out of the cave" }, -- level 32
        { complete = 676, -- level 32
          note = "The targets are out in front of the cavern." },
        { go = { 1417, 34.77, 44.18 }, text = "Head out of the cave" }, -- level 32
        { complete = 1164, -- level 32
          note = "The target is indoors." },
        { complete = 1164, -- level 32
          note = "The targets are spread over several spots." },
        { complete = 1164, -- level 32
          note = "The target is indoors." },
        { accept = 642 }, -- level 32
        { go = { 1417, 73, 32.65 }, fly = true, talk = 2851, text = "Flight master at Hammerfall" }, -- level 32
        { turnin = 676, accept = 677 }, -- level 32
        { accept = 655, -- level 32
          note = "This one roams, so scan the surrounding area." },
        { turnin = 655, accept = { 672, 671 }, sticky = 672 }, -- level 32
        { complete = 671, -- level 32
          note = "Stay clear of Refuge Point. Beware of foes lurking in stealth. Further hidden ones lurk on the high ridgelines." },
        { complete = 672, -- level 32
          note = "The targets are raptors. Stay away from Refuge Pointe." },
        { complete = 677 }, -- level 32
        { level = 32, xp = 43760, patrol = { { 1417, 65.74, 67.95 }, { 1417, 62.85, 67.63 }, { 1417, 65.36, 71.37 }, { 1417, 64.95, 73.64 }, { 1417, 66.94, 73.55 }, { 1417, 68.64, 71.84 }, { 1417, 70.43, 70.36 }, { 1417, 69.16, 68.36 }, { 1417, 69.84, 66.45 }, { 1417, 72.44, 65.74 }, { 1417, 71.35, 63.05 }, { 1417, 68.96, 61.34 }, { 1417, 66.44, 63.36 }, { 1417, 60.83, 72.25 } }, -- level 32
          note = "Together with the next turn-ins, this brings you to level 33." },
        { turnin = { 671, 672 }, accept = 674 }, -- level 32
        { turnin = 674, accept = 675, -- level 32
          note = "This one roams, so scan the surrounding area." },
        { turnin = 675 }, -- level 32
        { turnin = 677 }, -- level 32
        { turnin = 509, accept = 513, -- level 32
          note = "The NPC is indoors." },
        { train = true, talk = 4568, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 32
          note = "The NPC is indoors, one floor up." },
        { turnin = 1164 }, -- level 33
        { talk = 4549, collect = { { 5800, 1 }, { 5850, 1 } }, spots = { { 1458, 65.94, 44.78 } } }, -- level 33
        { go = { 1458, 52.87, 77.66 }, text = "Take the trail downhill" }, -- level 33
        { turnin = 513 }, -- level 33
        { turnin = 97891, races = { "Scourge" } }, -- level 33
        { turnin = 97891, races = { "Orc", "Tauren", "Troll", "Skyborne" } }, -- level 33
        { go = { 1458, 47.9, 76.5 }, text = "Head out of the Apothecarium" }, -- level 33
        { go = { 1458, 52.15, 64.36 }, text = "Take the trail downhill" }, -- level 33
        { train = true, talk = 4608, races = { "Scourge", "Troll" }, classes = { "PRIEST" } }, -- level 33
        { train = true, talk = 4582, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" } }, -- level 33
        { train = true, talk = 4563, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 33
          note = "The NPC is indoors." },
        { vendor = true, talk = 5753, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 33
          note = "The NPC is indoors." },
        { train = true, talk = 4595, classes = { "WARRIOR" }, -- level 33
          note = "The NPC is indoors." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 33
    },
})
