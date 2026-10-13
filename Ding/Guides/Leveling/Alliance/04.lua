-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/04.lua.
-- Simulated (warrior): Human 13 (94%) -> 16 (1%) in 2 h 54, 11 quests turned in; Dwarf 14 (9%) -> 16 (21%) in 3 h 01, 14 quests turned in; NightElf 14 (11%) -> 16 (19%) in 2 h 44, 13 quests turned in; Gnome 14 (3%) -> 16 (16%) in 3 h 01, 14 quests turned in; Skyborne 13 (0%) -> 15 (40%) in 2 h 57, 13 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a04-westfall",
    title    = "Westfall (13-15)",
    faction  = "Alliance",
    minLevel = 13, maxLevel = 15,
    next     = "leveling-a05-darkshore",
    steps    = {
        { go = { 1436, 53.98, 52.98 }, text = "Travel to Westfall", -- level 14
          note = "Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north." },
        { turnin = 184, when = { log = 184 }, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 14
        { accept = 64, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 13
        { accept = 109, races = { "NightElf", "Skyborne" } }, -- level 13
        { accept = { 36, 151 }, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 13
        { accept = 9, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 13
        { turnin = 36, accept = { 38, 22 }, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" }, -- level 13
          note = "The NPC is indoors." },
        { turnin = 109, accept = 12, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 13
        { accept = 102, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 13
        { go = { 1436, 56.5, 52.61 }, fly = true, talk = 523, races = { "Dwarf", "NightElf", "Gnome" }, text = "Fly to Sentinel Hill" }, -- level 14
        { accept = 153, sticky = { 12, 38, 22, 151 } }, -- level 13
        { accept = 92745 }, -- level 13
        { accept = 92747 }, -- level 13
        { complete = 92747 }, -- level 13
        { turnin = 92747 }, -- level 13
        { complete = 153 }, -- level 13
        { complete = 12 }, -- level 13
        { accept = 92909, races = { "Skyborne" } }, -- level 13
        { complete = 92909, races = { "Skyborne" } }, -- level 13
        { turnin = 92909, races = { "Skyborne" } }, -- level 14
        { level = 14, patrol = { { 1436, 48.43, 45.37 }, { 1436, 51.54, 46.46 }, { 1436, 47.76, 48.83 }, { 1436, 46.55, 52.86 }, { 1436, 41.46, 41.04 }, { 1436, 45.75, 39.63 }, { 1436, 46.45, 36.34 }, { 1436, 50.63, 39.65 } } }, -- level 14
        { complete = 64, -- level 14
          note = "Stay outdoors by this building. Pull the camera back for a wider view. Turn the view so Furlbrow's Wardrobe is visible." },
        { complete = 102, -- level 14
          note = "Your targets here are gnolls." },
        { complete = 38, keep = 730, sticky = { 38, 22 } }, -- level 14
        { complete = 151, -- level 14
          note = "Look for beige sacks. Look beside objects and structures." },
        { turnin = 64 }, -- level 14
        { turnin = 151 }, -- level 14
        { turnin = 22, sticky = { 9, 38, 22 }, when = { ready = 22 }, -- level 14
          note = "The NPC is indoors." },
        { complete = 38, keep = 732, -- level 14
          note = "The targets are spread over several spots." },
        { complete = 9, -- level 14
          note = "The targets are spread over several spots." },
        { accept = 92909, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 15
        { complete = 92909, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 15
        { turnin = 92909, races = { "Human", "Dwarf", "NightElf", "Gnome" } }, -- level 15
        { complete = 38, keep = 729, -- level 14
          note = "Hunt the vultures. Many of them gather in this area. The rest lie dotted across the zone." },
        { complete = 38, keep = { 731, 723 }, -- level 14
          note = "Kill boars for these." },
        { level = 14, xp = 7125, patrol = { { 1436, 56.03, 31.16 }, { 1436, 52.46, 30.26 }, { 1436, 53.37, 34.63 }, { 1436, 47.64, 34.35 }, { 1436, 44.34, 32.44 }, { 1436, 42.96, 36.66 }, { 1436, 37.44, 47.46 }, { 1436, 40.06, 50.55 }, { 1436, 36.45, 52.96 }, { 1436, 51.36, 23.63 }, { 1436, 52.56, 20.45 }, { 1436, 49.15, 20.46 } }, -- level 14
          note = "With the coming turn-ins, this gets you to level 15." },
        { turnin = 9 }, -- level 14
        { turnin = 38, -- level 15
          note = "The NPC is indoors." },
        { turnin = 12, accept = 65 }, -- level 15
        { turnin = 102 }, -- level 15
        { turnin = 153 }, -- level 15
        { accept = 92744 }, -- level 15
        { complete = 92745 }, -- level 15
        { turnin = 92745 }, -- level 15
        { accept = 93928, races = { "Dwarf", "Skyborne" } }, -- level 15
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 15
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 15
          note = "The NPC is indoors." },
        { talk = 8720, collect = { { 12238, 6 } }, -- level 15
          note = "The NPC is indoors." },
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 15
        { go = { 1450, 48.06, 67.4 }, fly = true, talk = 10897, races = { "NightElf" }, classes = { "DRUID" }, text = "Fly to Moonglade" }, -- level 15
        { go = { 1438, 58.43, 94.06 }, fly = true, talk = 3838, text = "Flight master at Rut'theran Village" }, -- level 15
        { accept = 98391, races = { "Dwarf", "Gnome", "Skyborne" }, classes = { "PRIEST" } }, -- level 15
        { go = { 1457, 57.59, 46.69 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Learn Bows and Staves at the weapon master" }, -- level 15
        { talk = 11866, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" } }, -- level 15
    },
})
