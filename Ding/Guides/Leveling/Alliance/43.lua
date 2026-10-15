-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/43.lua.
-- Simulated (warrior): Human 59 (4%) -> 60 (0%) in 6 h 53, 16 quests turned in; Dwarf 59 (4%) -> 60 (0%) in 6 h 53, 16 quests turned in; NightElf 59 (4%) -> 60 (0%) in 6 h 53, 16 quests turned in; Gnome 59 (4%) -> 60 (0%) in 6 h 53, 16 quests turned in; Skyborne 59 (4%) -> 60 (0%) in 6 h 53, 16 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a43-silithus",
    title    = "Silithus (59-60)",
    faction  = "Alliance",
    minLevel = 59, maxLevel = 60,
    leftOut  = {
        [6844] = { kind = "prereq" },
        [8282] = { kind = "far" },
        [8309] = { kind = "away" },
        [8310] = { kind = "away" },
        [8323] = { kind = "log" },
        [8800] = { kind = "away" },
        [9023] = { kind = "away" },
    },
    steps    = {
        { go = { 1451, 81.87, 18.93 }, text = "Travel to Silithus", -- level 59
          note = "Silithus: Valor's Rest, in the north-east, then Cenarion Hold." },
        { turnin = 1124, accept = 1125, -- level 59
          note = "The NPC is indoors." },
        { accept = 8277, floor = "up", -- level 59
          note = "This one roams, so scan the surrounding area. The NPC is indoors, one floor up." },
        { turnin = 8275, accept = 8280 }, -- level 59
        { go = { 1451, 50.52, 34.51 }, fly = true, talk = 15177, text = "Flight master at Cenarion Hold", -- level 59
          note = "The NPC is at the summit of the trail." },
        { accept = 8284 }, -- level 59
        { accept = 8318 }, -- level 59
        { accept = 8304, sticky = 1125, -- level 59
          note = "The NPC is on the house's raised terrace." },
        { complete = 5527, -- level 59
          note = "The object is indoors." },
        { complete = 1125, -- level 59
          note = "Watch out: killing them can summon more foes." },
        { useitem = 20461, sticky = { 8277, 8280 }, when = { item = 20461 } }, -- level 59
        { turnin = 1125, -- level 59
          note = "The NPC is indoors." },
        { complete = 8277, -- level 59
          note = "The foes here are scorpions." },
        { complete = 8277, -- level 59
          note = "Hunt spiders for it." },
        { complete = 8280 }, -- level 59
        { turnin = 8277, accept = 8278, floor = "up", -- level 59
          note = "This one roams, so scan the surrounding area. The NPC is indoors, one floor up." },
        { turnin = 8280, accept = 8281 }, -- level 59
        { complete = 8284, -- level 59
          note = "Look for fragments of rock that glow blue." },
        { turnin = 8284, accept = 8285, sticky = { 8278, 8281 } }, -- level 59
        { accept = 9415 }, -- level 59
        { turnin = 8285, accept = 8279, -- level 59
          note = "Your objective lies in a little cavern." },
        { complete = 8304, talk = 15170, -- level 59
          note = "Roam the area where the insects swarm." },
        { complete = 8304, talk = 15171, sticky = 8318 }, -- level 59
        { complete = 8279, -- level 59
          note = "This one roams, so scan the surrounding area." },
        { turnin = 9415 }, -- level 59
        { complete = 8278, -- level 59
          note = "Hunt the gray scorpids." },
        { complete = 8278, sticky = 8318, -- level 59
          note = "Hunt spiders for it." },
        { complete = 8279, -- level 59
          note = "The target is an orc wearing violet robes. This one roams, so scan the surrounding area. It shows up around here." },
        { complete = 8279, -- level 59
          note = "This one roams, so scan the surrounding area." },
        { complete = 8318 }, -- level 59
        { turnin = 8279, accept = 8287, -- level 59
          note = "Your objective lies in a little cavern." },
        { destroy = { 20394, 20395, 20396 } }, -- level 59
        { complete = 8278, -- level 59
          note = "Hunt the yellow scorpids." },
        { complete = 8281, -- level 59
          note = "Target the burrowing worms." },
        { turnin = 8281 }, -- level 59
        { turnin = 8278, floor = "up", -- level 59
          note = "This one roams, so scan the surrounding area. The NPC is indoors, one floor up." },
        { turnin = { 8287, 8304 }, -- level 59
          note = "The NPC is on the house's raised terrace." },
        { turnin = 8318 }, -- level 59
        { turnin = 5163 }, -- level 59
        { turnin = 5527, -- level 59
          note = "The NPC is indoors." },
        { level = 60, collect = { { 21377, 1 } }, patrol = { { 1448, 62.37, 12.64 }, { 1448, 61.45, 10.77 }, { 1448, 60.46, 8.57 }, { 1448, 59.95, 6.64 }, { 1448, 62.46, 7.63 }, { 1448, 63.54, 5.95 }, { 1448, 63.56, 9.55 } }, -- level 59
          note = "Dungeon runs are a fine choice here too, as you like. This number shrinks while you kill monsters. Bring any feathers you collect to the NPC at 64.8, 8.1." },
    },
})
