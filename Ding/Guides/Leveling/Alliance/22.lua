-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/22.lua.
-- Simulated (warrior): Human 40 (27%) -> 40 (79%) in 2 h 10, 7 quests turned in; Dwarf 40 (27%) -> 40 (79%) in 2 h 10, 7 quests turned in; NightElf 40 (27%) -> 40 (79%) in 2 h 10, 7 quests turned in; Gnome 40 (27%) -> 40 (79%) in 2 h 10, 7 quests turned in; Skyborne 40 (27%) -> 40 (79%) in 2 h 10, 7 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a22-dustwallow-marsh",
    title    = "Dustwallow Marsh (40-40)",
    faction  = "Alliance",
    minLevel = 40, maxLevel = 40,
    next     = "leveling-a23-desolace",
    steps    = {
        { talk = 8720, collect = { { 3853, 1 } }, when = { maxlevel = 41 }, -- level 40
          note = "Stormwind first, then Dustwallow Marsh: Theramore Isle. Hold on to it, an upcoming quest uses it." },
        { collect = { { 6190, 1 } }, spots = { { 1455, 35.9, 60.17 } }, when = { log = 1373 } }, -- level 40
        { collect = { { 6190, 1 } }, spots = { { 1455, 35.9, 60.17 } }, when = { done = 1373 } }, -- level 40
        { talk = 2461, -- level 40
          note = "The NPC is indoors." },
        { talk = 2461, bank = 4502, -- level 40
          note = "The NPC is indoors. You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors" }, -- level 40
        { accept = 1661, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 40
          note = "The NPC is indoors." },
        { turnin = 1661, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 40
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 40
          note = "The NPC is indoors." },
        { go = { 1455, 44.51, 49.54 }, text = "Stay on the trail" }, -- level 40
        { accept = 1050, dungeon = "Scarlet Monastery", -- level 40
          note = "The NPC is indoors." },
        { turnin = 4487, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" } }, -- level 40
        { accept = 4490, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" } }, -- level 40
        { turnin = 4490, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" } }, -- level 40
        { accept = 1286, floor = "up", -- level 40
          note = "The NPC is indoors, one floor up." },
        { turnin = 1260, accept = 1204, -- level 40
          note = "The NPC is indoors." },
        { complete = 1204, -- level 40
          note = "The targets are turtles." },
        { complete = 1177, -- level 40
          note = "Fight the murlocs." },
        { accept = 1206, when = { done = 1218 } }, -- level 40
        { accept = 1222, -- level 40
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Clear the raptors around before you begin." },
        { complete = 1222, -- level 40
          note = "Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive." },
        { complete = 1206, when = { log = 1206 }, -- level 40
          note = "Hunt spiders for it. The targets roam the mine and the area around it." },
        { go = { 1445, 33.26, 22.81 }, text = "Exit the mine shaft" }, -- level 40
        { turnin = 1206, when = { log = 1206 } }, -- level 40
        { accept = 1203, when = { item = 3853 } }, -- level 40
        { turnin = 1203, when = { item = 3853 } }, -- level 40
        { destroy = 5884 }, -- level 40
        { turnin = 1177, -- level 40
          note = "Steer clear of Brackenwall Village." },
        { turnin = 1286, accept = 1287, floor = "up", -- level 40
          note = "Speak with him once he gives up. The NPC is indoors, one floor up." },
        { complete = 1187 }, -- level 40
        { turnin = { 1204, 1222 }, accept = 1258, -- level 40
          note = "The NPC is indoors." },
        { turnin = 1287, floor = "up", -- level 40
          note = "The NPC is indoors, one floor up." },
    },
})
