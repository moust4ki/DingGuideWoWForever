-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/24.lua.
-- Simulated (warrior): Human 41 (24%) -> 42 (25%) in 4 h 17, 17 quests turned in; Dwarf 41 (24%) -> 42 (25%) in 4 h 17, 17 quests turned in; NightElf 41 (24%) -> 42 (25%) in 4 h 17, 17 quests turned in; Gnome 41 (24%) -> 42 (25%) in 4 h 17, 17 quests turned in; Skyborne 41 (24%) -> 42 (25%) in 4 h 17, 17 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a24-badlands",
    title    = "Badlands (41-42)",
    faction  = "Alliance",
    minLevel = 41, maxLevel = 42,
    next     = "leveling-a25-stranglethorn-vale",
    steps    = {
        { vendor = true, talk = 5101, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 41
          note = "Ironforge first, then the Badlands. The NPC waits on the lower level, indoors. A lengthy stretch of quests is coming up. This vendor sells no arrows or bullets." },
        { talk = 2461, bank = { 5826, 5862 }, -- level 41
          note = "The NPC is indoors." },
        { talk = 8720, collect = { { 4611, 9 }, { 3829, 1 }, { 4389, 1 }, { 929, 1 }, { 3823, 1 }, { 2868, 1 } }, when = { maxlevel = 45 }, -- level 41
          note = "Get these for simple Badlands turn-ins ahead. The NPC is indoors." },
        { turnin = 1467, -- level 41
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { accept = 707, -- level 41
          note = "The NPC is indoors." },
        { accept = 2500, -- level 41
          note = "The NPC is indoors." },
        { turnin = 707, accept = 738, sticky = 2500 }, -- level 41
        { accept = 719 }, -- level 41
        { accept = 718, sticky = 719 }, -- level 41
        { accept = 720, -- level 41
          note = "The object sits on the rocky shelf above." },
        { complete = 719, -- level 41
          note = "Fight the dwarves." },
        { complete = 718, -- level 41
          note = "Look for a timber box. The targets are spread over several spots." },
        { turnin = { 719, 720 } }, -- level 41
        { turnin = 718, accept = 733 }, -- level 41
        { accept = 705, when = { item = { 4611, 9 } } }, -- level 41
        { accept = 703 }, -- level 41
        { turnin = 705, when = { ready = 705 } }, -- level 41
        { turnin = 1106, accept = 1108 }, -- level 41
        { turnin = 738, accept = 739, sticky = { 1108, 739 } }, -- level 41
        { complete = 739, -- level 41
          note = "This one roams, so scan the surrounding area." },
        { complete = 1108, -- level 41
          note = "The targets are troggs." },
        { complete = 739 }, -- level 41
        { turnin = 703, when = { ready = 703 } }, -- level 41
        { turnin = 1108 }, -- level 41
        { accept = 1137, -- level 41
          note = "Wait for the talking to finish" },
        { accept = 710 }, -- level 41
        { accept = 713, when = { item = 3829 } }, -- level 41
        { turnin = 713, when = { log = 713, ready = 713 } }, -- level 41
        { accept = 714, when = { item = 4389 } }, -- level 41
        { accept = 714, when = { item = 4389 } }, -- level 41
        { turnin = 714, when = { item = 4389, ready = 714 } }, -- level 41
        { accept = 715, when = { item = { { 929, 1 }, { 3823, 1 } } } }, -- level 41
        { turnin = 715, sticky = 2500, when = { item = 929, log = 715 } }, -- level 41
        { complete = 710 }, -- level 41
        { turnin = 710, accept = 711 }, -- level 41
        { complete = 711 }, -- level 41
        { turnin = 711, accept = 712, sticky = { 733, 2500 } }, -- level 41
        { complete = 712 }, -- level 41
        { complete = 2500 }, -- level 41
        { complete = 733, -- level 42
          note = "The targets are ogres." },
        { complete = 2500, collect = { { 3404, 4 } }, keep = { 7847, 3404 }, -- level 42
          note = "A cluster of them gathers here. More of them dot the surroundings." },
        { complete = 2500 }, -- level 42
        { turnin = 703, when = { ready = 703 } }, -- level 42
        { destroy = 3404 }, -- level 42
        { turnin = 733 }, -- level 42
        { turnin = 712 }, -- level 42
        { accept = 734, when = { done = { 713, 714 } } }, -- level 42
        { turnin = 734, when = { done = { 713, 714 }, log = 734 } }, -- level 42
        { accept = 777, when = { done = { 713, 714 } } }, -- level 42
        { accept = 716, when = { item = 2868 } }, -- level 42
        { turnin = 716, when = { item = 2868, log = 716 } }, -- level 42
        { turnin = 777, when = { done = { 713, 714 }, log = 777 } }, -- level 42
        { accept = 778, when = { done = { 713, 714 } } }, -- level 42
        { complete = 778, when = { done = { 713, 714 }, log = 778 }, -- level 42
          note = "Wait for the talking to finish" },
        { turnin = 778, when = { done = { 713, 714 }, log = 778 } }, -- level 42
        { level = 41, xp = 89350, patrol = { { 1418, 20.83, 56.75 }, { 1418, 20.46, 50.75 }, { 1418, 16.86, 45.84 }, { 1418, 15.03, 54.25 }, { 1418, 10.43, 59.45 }, { 1418, 4.64, 57.16 }, { 1418, 6.45, 64.37 }, { 1418, 12.26, 66.16 }, { 1418, 17.75, 68.65 }, { 1418, 21.25, 73.76 }, { 1418, 27.46, 74.63 }, { 1418, 26.37, 68.46 }, { 1418, 32.64, 69.83 }, { 1418, 35.97, 64.86 }, { 1418, 41.76, 62.66 }, { 1418, 39.14, 70.25 }, { 1418, 44.83, 73.37 }, { 1418, 35.25, 75.77 }, { 1418, 22.45, 81.94 }, { 1418, 16.76, 78.84 }, { 1418, 13.26, 83.74 }, { 1418, 10.14, 78.34 }, { 1418, 13.65, 73.36 }, { 1418, 7.46, 70.97 }, { 1418, 16.17, 61.57 }, { 1418, 24.74, 62.23 }, { 1418, 30.75, 61.37 }, { 1418, 27.45, 56.34 }, { 1418, 32.45, 51.96 }, { 1418, 35.55, 57.44 }, { 1418, 40.97, 53.17 }, { 1418, 30.75, 45.15 }, { 1418, 26.44, 49.36 }, { 1418, 25.15, 42.46 } }, -- level 42
          note = "With the coming hand-ins, this brings you to level 42." },
        { go = { 1427, 67.77, 51.4 }, deathskip = true, text = "Die on purpose at this spot", -- level 42
          note = "Die to the monsters here on purpose. You need to stand close to this spot. Unlocks the flight point at Thorium Point." },
        { deathskip = true, revive = { 1427, 35.54, 22.83 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 42
        { talk = 6491 }, -- level 42
        { go = { 1427, 37.91, 30.91 }, fly = true, talk = 2941, text = "Flight master at Thorium Point" }, -- level 42
        { sethearth = "Stoutlager Inn", talk = 6734, -- level 42
          note = "The NPC is indoors." },
        { turnin = 2500, -- level 42
          note = "The NPC is indoors." },
        { destroy = 7846 }, -- level 42
        { turnin = 739 }, -- level 42
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 42
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 10090, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 42
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 42
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 42
          note = "The NPC is indoors." },
    },
})
