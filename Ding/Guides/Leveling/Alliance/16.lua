-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/16.lua.
-- Simulated (warrior): Human 33 (92%) -> 34 (98%) in 3 h 49, 32 quests turned in; Dwarf 33 (96%) -> 35 (2%) in 3 h 49, 32 quests turned in; NightElf 34 (7%) -> 35 (12%) in 3 h 49, 32 quests turned in; Gnome 33 (96%) -> 35 (2%) in 3 h 49, 32 quests turned in; Skyborne 33 (99%) -> 35 (4%) in 3 h 49, 32 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a16-dustwallow-marsh-and-thousand-needles",
    title    = "Dustwallow and Thousand Needles (33-34)",
    faction  = "Alliance",
    minLevel = 33, maxLevel = 34,
    next     = "leveling-a17-stranglethorn-vale",
    steps    = {
        { go = { 1445, 67.52, 51.25 }, fly = true, talk = 4321, text = "Flight master at Theramore", -- level 33
          note = "Dustwallow Marsh: Theramore Isle, off the east coast." },
        { talk = 4897, buy = { { 3713, 3, 4897 } }, -- level 33
          note = "The NPC is indoors." },
        { accept = 1135, -- level 33
          note = "The NPC is indoors." },
        { sethearth = "Theramore Isle", talk = 6272, -- level 33
          note = "The NPC is indoors." },
        { accept = 1282 }, -- level 33
        { turnin = 1302, -- level 33
          note = "The NPC is indoors, one floor up." },
        { turnin = 1264, accept = 1265, -- level 33
          note = "The NPC is indoors, one floor up." },
        { turnin = 1282, -- level 33
          note = "The NPC is indoors, one floor up." },
        { complete = 1265, -- level 33
          note = "The NPC is indoors." },
        { turnin = 1265, accept = 1266, -- level 33
          note = "The NPC is indoors. This quest is buggy and may not show up. If it is not around, move on without it." },
        { accept = 1218, when = { item = 3713 } }, -- level 33
        { turnin = 1218, when = { item = 3713 } }, -- level 33
        { accept = 1219 }, -- level 33
        { turnin = 1266 }, -- level 33
        { accept = 1324, noauto = 1324, -- level 33
          note = "Expect several foes at once. Make Private Hendel your main target." },
        { complete = 1324, -- level 33
          note = "Wait for the talking to finish" },
        { turnin = 1324 }, -- level 33
        { accept = 1267 }, -- level 34
        { turnin = 1267 }, -- level 34
        { accept = 1177, -- level 34
          note = "Steer clear of Brackenwall Village. Watch out: the foes here are above your level. Keep to the road the whole way." },
        { accept = 1284 }, -- level 34
        { accept = 1252, -- level 34
          note = "The quest starts from a small piece of metal." },
        { accept = 1253 }, -- level 34
        { go = { 1441, 32.18, 22.29 }, text = "Take the lift down" }, -- level 34
        { collect = { { 5791, 1 } }, -- level 34
          note = "Look for a little brown tome. The item is held by a dwarf corpse." },
        { accept = 1100, useitem = 5791 }, -- level 34
        { go = { 1444, 89.54, 45.79 }, fly = true, talk = 4319, text = "Flight master at Thalanaar" }, -- level 34
        { turnin = { 1100, 1059 } }, -- level 34
        { go = { 1441, 14.81, 32.87 }, text = "Climb the trail" }, -- level 34
        { complete = 1135, -- level 34
          note = "The targets are wyverns." },
        { accept = 1110, -- level 34
          note = "Keep clear of Freewind Post." },
        { accept = 1104 }, -- level 34
        { turnin = 1179, accept = 1105 }, -- level 34
        { accept = 1176 }, -- level 34
        { accept = 1175, sticky = { 1110, 1175 } }, -- level 34
        { complete = 1175, sticky = { 1105, 1104, 1175 } }, -- level 34
        { complete = 1176, -- level 34
          note = "Hunt the vultures. This spot has most of them; elsewhere they are rare. Return here as you do your other quests." },
        { complete = 1105, -- level 34
          note = "The targets are turtles." },
        { complete = 1104, -- level 34
          note = "The foes here are scorpions." },
        { complete = 1175 }, -- level 34
        { complete = 1175 }, -- level 34
        { complete = 1110, -- level 34
          note = "Look for assorted mechanical pieces. Parts lie all across the Shimmering Flats." },
        { turnin = 1110, accept = { 1111, 5762 } }, -- level 34
        { turnin = 1104 }, -- level 34
        { turnin = 1105 }, -- level 34
        { turnin = 1176, accept = 1178 }, -- level 34
        { turnin = 1175 }, -- level 34
        { go = { 1446, 51.06, 29.31 }, fly = true, talk = 7823, text = "Fly to Gadgetzan" }, -- level 34
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 34
        { turnin = 1135, -- level 34
          note = "The NPC is indoors." },
        { turnin = 1219, accept = 1220 }, -- level 34
        { turnin = { 1220, 1252, 1253, 1284 }, accept = { 1259, 1319 }, -- level 34
          note = "The NPC is indoors, one floor up." },
        { turnin = 1259, accept = 1285, -- level 34
          note = "The NPC is indoors, one floor up." },
        { turnin = 1285, -- level 34
          note = "The NPC is indoors, one floor up." },
        { turnin = 1319, accept = 1320, -- level 34
          note = "The NPC is indoors." },
        { turnin = 1320, -- level 34
          note = "The NPC is indoors, one floor up." },
        { go = { 1413, 63.03, 37.19 }, fly = true, talk = 16227, text = "Flight master in Ratchet" }, -- level 34
        { turnin = 1178, accept = 1180, -- level 34
          note = "The NPC is indoors, one floor up." },
        { turnin = 1798, accept = 1758, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" } }, -- level 34
        { turnin = 1718, accept = 1719, classes = { "WARRIOR" } }, -- level 34
        { complete = 1719, classes = { "WARRIOR" }, -- level 34
          note = "Stand on the metal grating to begin the battle. Shows up once you defeat six challengers." },
        { turnin = 1719, when = { ready = 1719 }, classes = { "WARRIOR" } }, -- level 34
        { accept = 1791, when = { done = 1719 }, classes = { "WARRIOR" } }, -- level 34
        { turnin = { 1111, 1039 }, accept = { 1112, 1040 } }, -- level 34
        { turnin = 79008 }, -- level 34
    },
})
