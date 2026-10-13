-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/27.lua.
-- Simulated (warrior): Human 43 (71%) -> 44 (14%) in 2 h 22, 11 quests turned in; Dwarf 43 (71%) -> 44 (14%) in 2 h 22, 11 quests turned in; NightElf 43 (71%) -> 44 (14%) in 2 h 23, 11 quests turned in; Gnome 43 (71%) -> 44 (14%) in 2 h 22, 11 quests turned in; Skyborne 43 (71%) -> 44 (14%) in 2 h 22, 11 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a27-tanaris",
    title    = "Tanaris (43-44)",
    faction  = "Alliance",
    minLevel = 43, maxLevel = 44,
    next     = "leveling-a28-feralas-and-tanaris",
    steps    = {
        { go = { 1446, 52.3, 28.91 }, text = "Travel to Gadgetzan", -- level 43
          note = "Tanaris: Gadgetzan, in the north of the zone." },
        { talk = 7799, collect = { { 5862, 1 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 43
          note = "The NPC is indoors." },
        { turnin = 2864 }, -- level 43
        { turnin = 1188, accept = 1189 }, -- level 43
        { turnin = 1119, when = { log = 1119 } }, -- level 43
        { accept = 1120, when = { done = 1119 }, -- level 43
          note = "Wait for the talking to finish" },
        { turnin = 1120, when = { log = 1120 } }, -- level 43
        { accept = 1122, when = { done = 1120 } }, -- level 43
        { turnin = 1137 }, -- level 43
        { accept = 1190 }, -- level 43
        { turnin = 1189 }, -- level 43
        { turnin = 1190, accept = 1194, -- level 43
          note = "Hold on until Rizzle has fled. The object is indoors." },
        { turnin = 1194 }, -- level 43
        { destroy = 5866 }, -- level 43
        { accept = 1707 }, -- level 43
        { accept = 1690, sticky = { 1707, 1690 } }, -- level 43
        { accept = 8365 }, -- level 43
        { accept = 3520, dungeon = "Zul'Farrak" }, -- level 43
        { accept = 8366, -- level 43
          note = "The NPC is indoors." },
        { turnin = 2872, accept = 2873, sticky = 1690, -- level 43
          note = "The NPC is indoors." },
        { complete = 1707, keep = 8483, -- level 43
          note = "Targets here are human." },
        { complete = 1690 }, -- level 43
        { turnin = 1690 }, -- level 43
        { turnin = 1707 }, -- level 43
        { level = 44, collect = { { 8483, 1 }, { 8483, 1 } }, patrol = { { 1446, 62.75, 30.36 }, { 1446, 63.17, 32.36 }, { 1446, 65.25, 32.76 }, { 1446, 63.25, 34.57 }, { 1446, 64.03, 28.35 }, { 1446, 59.84, 24.03 } }, -- level 43
          note = "Targets here are human. Dungeon runs are a fine choice here too, as you like. Each set of 5 handed in at Gadgetzan gives 380 xp." },
        { complete = 1452, -- level 44
          note = "Hunt the red-feathered birds. Hyenas also use these spawn spots." },
        { talk = 7799, bank = { 5807, 6257 }, -- level 44
          note = "The NPC is indoors." },
    },
})
