-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/15.lua.
-- Simulated (warrior): Human 33 (0%) -> 34 (5%) in 2 h 40, 20 quests turned in; Dwarf 33 (16%) -> 34 (18%) in 2 h 42, 20 quests turned in; NightElf 33 (20%) -> 34 (23%) in 2 h 42, 20 quests turned in; Gnome 33 (24%) -> 34 (26%) in 2 h 42, 20 quests turned in; Skyborne 33 (17%) -> 34 (25%) in 2 h 42, 21 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a15-hillsbrad-foothills-and-arathi-highlands",
    title    = "Hillsbrad and Arathi (32-33)",
    faction  = "Alliance",
    minLevel = 32, maxLevel = 33,
    next     = "leveling-a16-dustwallow-marsh-and-thousand-needles",
    steps    = {
        { go = { 1424, 49.43, 55.53 }, text = "Travel to Southshore", -- level 33
          note = "Hillsbrad Foothills: Southshore, on the coast in the south." },
        { accept = 565, when = { item = { { 3719, 1 }, { 2997, 1 } } } }, -- level 33
        { talk = 2381, buy = { { 3713, 1, 2381 } }, -- level 33
          note = "The NPC is indoors." },
        { accept = 564 }, -- level 33
        { turnin = 538 }, -- level 33
        { sethearth = "Southshore", talk = 2352, -- level 33
          note = "The NPC is indoors." },
        { accept = 536, -- level 33
          note = "The NPC is indoors." },
        { accept = 555, when = { item = 3713 }, -- level 33
          note = "The NPC is indoors." },
        { turnin = 555, when = { item = 3713 }, -- level 33
          note = "The NPC is indoors." },
        { complete = 536, -- level 33
          note = "You'll find extra ones swimming nearby as well." },
        { turnin = 536, accept = 559, -- level 33
          note = "The NPC is indoors." },
        { complete = 559, -- level 33
          note = "You'll find extra ones swimming nearby as well." },
        { turnin = 559, accept = 560, -- level 33
          note = "The NPC is indoors." },
        { turnin = 560, accept = 561 }, -- level 33
        { turnin = 561, accept = 562, -- level 33
          note = "The NPC is indoors." },
        { complete = 562, -- level 33
          note = "You'll find extra ones swimming nearby as well." },
        { turnin = 562, -- level 33
          note = "The NPC is indoors." },
        { accept = 659 }, -- level 33
        { accept = 505, sticky = 565, -- level 33
          note = "The NPC is indoors." },
        { complete = 689, -- level 33
          note = "Search for gray rocks standing up beside the walls. Your targets are within the cavern." },
        { complete = 565, when = { log = 565 }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { level = 33, sticky = { 505, 564 }, patrol = { { 1424, 46.23, 31.88 }, { 1424, 46.17, 31.84 }, { 1424, 45.44, 33.45 }, { 1424, 44.25, 31.25 }, { 1424, 43.36, 29.45 }, { 1424, 45.04, 28.64 }, { 1424, 43.46, 27.44 }, { 1424, 45.05, 26.36 }, { 1424, 43.36, 25.35 }, { 1424, 47.55, 30.34 }, { 1424, 42.77, 33.54 }, { 1424, 41.85, 31.96 } }, -- level 33
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1424, 46.23, 31.88 }, text = "Head out of the cave" }, -- level 33
        { accept = { 510, 511 }, -- level 33
          note = "The targets are spread over several spots." },
        { complete = 505 }, -- level 33
        { complete = 564 }, -- level 33
        { accept = 563, -- level 33
          note = "The NPC is indoors." },
        { turnin = 98219, races = { "Human", "Dwarf", "NightElf", "Gnome" }, classes = { "PALADIN" } }, -- level 33
        { turnin = { 510, 505 }, -- level 33
          note = "The NPC is indoors." },
        { turnin = 511, accept = 514 }, -- level 33
        { turnin = 564 }, -- level 33
        { turnin = 647, races = { "Human", "Skyborne" } }, -- level 33
        { talk = 2381, buy = { { 2321, 1, 2381 } }, when = { log = 565 }, -- level 33
          note = "The NPC is indoors." },
        { talk = 2381, buy = { { 2321, 1, 2381 } }, when = { done = 565 }, -- level 33
          note = "The NPC is indoors." },
        { turnin = 565, when = { item = 2997, log = 565 } }, -- level 33
        { accept = 681, -- level 33
          note = "This one roams, so scan the surrounding area." },
        { turnin = 690, races = { "Dwarf", "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 33
        { turnin = 690, races = { "Human", "Gnome", "Skyborne" } }, -- level 33
        { turnin = 659, accept = 658 }, -- level 33
        { complete = 681, -- level 33
          note = "Beware of foes lurking in stealth. Further hidden ones lurk on the high ridgelines. Some are indoors as well." },
        { go = { 1425, 11.1, 46.2 }, fly = true, talk = 8018, text = "Fly to Aerie Peak", -- level 33
          note = "The NPC is at the summit of the trail. This spares you time further on." },
        { turnin = 681, -- level 33
          note = "This one roams, so scan the surrounding area." },
        { turnin = 514, -- level 33
          note = "The NPC is indoors." },
        { turnin = 98313 }, -- level 33
        { turnin = 689, -- level 33
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { accept = 700, -- level 34
          note = "Let the conversation play out. The NPC is indoors. This one roams, so scan the surrounding area." },
        { talk = 2461, bank = 3721, -- level 34
          note = "The NPC is indoors." },
        { go = { 1455, 44.51, 49.54 }, text = "Stay on the trail" }, -- level 34
        { turnin = 700 }, -- level 34
        { turnin = 98300, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 34
    },
})
