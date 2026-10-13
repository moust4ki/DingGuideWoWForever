-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/06.lua.
-- Simulated (warrior): Human 18 (21%) -> 19 (23%) in 1 h 57, 10 quests turned in; Dwarf 18 (26%) -> 19 (23%) in 1 h 49, 10 quests turned in; NightElf 18 (13%) -> 19 (23%) in 2 h 00, 11 quests turned in; Gnome 18 (26%) -> 19 (23%) in 1 h 49, 10 quests turned in; Skyborne 18 (13%) -> 19 (23%) in 2 h 07, 10 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a06-loch-modan",
    title    = "Loch Modan (18-19)",
    faction  = "Alliance",
    minLevel = 18, maxLevel = 19,
    next     = "leveling-a07-redridge-and-westfall",
    steps    = {
        { go = { 1432, 37.24, 47.38 }, text = "Travel to Thelsamar", -- level 18
          note = "Loch Modan: Thelsamar, on the road in the west of the zone." },
        { accept = 436, -- level 18
          note = "The NPC waits on the lower level, indoors." },
        { turnin = 353, races = { "NightElf" } }, -- level 18
        { accept = 307, -- level 18
          note = "The NPC is indoors, one floor up." },
        { complete = 307, -- level 18
          note = "Search stacks of brown crates. The objective is underground, in the mine shaft." },
        { go = { 1432, 35.53, 18.8 }, text = "Exit the mine shaft" }, -- level 18
        { turnin = 307, -- level 18
          note = "The NPC is indoors, one floor up." },
        { go = { 1432, 40.58, 13.67 }, text = "Head up the incline" }, -- level 18
        { accept = 250, -- level 18
          note = "The NPC stands atop the dam." },
        { turnin = 250, accept = 199, object = 257, -- level 18
          note = "The object rests by the barrier." },
        { go = { 1432, 55.43, 14.89 }, text = "Head up the incline" }, -- level 18
        { turnin = 199, -- level 18
          note = "The NPC stands atop the dam." },
        { accept = 86758 }, -- level 18
        { accept = 385, -- level 18
          note = "The NPC is indoors." },
        { complete = 385, keep = { 2925, 2924 } }, -- level 18
        { complete = 86758 }, -- level 18
        { turnin = 385, -- level 18
          note = "The NPC is indoors." },
        { turnin = 86758 }, -- level 18
        { level = 18, xp = 19060, patrol = { { 1432, 75.57, 50.23 }, { 1432, 73.15, 48.23 }, { 1432, 74.44, 44.44 }, { 1432, 71.45, 43.55 }, { 1432, 68.35, 44.54 }, { 1432, 65.43, 43.63 }, { 1432, 62.85, 41.55 }, { 1432, 59.75, 41.85 }, { 1432, 59.14, 38.44 }, { 1432, 62.46, 38.36 }, { 1432, 63.65, 35.45 }, { 1432, 60.65, 35.43 }, { 1432, 61.46, 32.14 }, { 1432, 58.35, 32.35 }, { 1432, 66.17, 33.37 }, { 1432, 68.97, 36.45 }, { 1432, 70.94, 39.06 }, { 1432, 73.97, 40.44 }, { 1432, 76.26, 38.15 }, { 1432, 77.74, 43.03 }, { 1432, 77.37, 46.66 }, { 1432, 73.25, 52.36 }, { 1432, 68.06, 40.97 }, { 1432, 66.23, 38.44 }, { 1432, 62.16, 45.77 } }, -- level 18
          note = "Together with the next turn-ins, this brings you to level 19. This skips some tedious quests with a timer. The upcoming quest may prove hard." },
        { turnin = 436, accept = 297 }, -- level 18
        { accept = 298 }, -- level 19
        { complete = 297, -- level 19
          note = "The targets are troggs." },
        { turnin = 297 }, -- level 19
        { accept = 86614 }, -- level 19
        { turnin = 86614 }, -- level 19
        { turnin = 298, accept = 301, -- level 19
          note = "The NPC waits on the lower level, indoors." },
        { turnin = 301 }, -- level 19
    },
})
