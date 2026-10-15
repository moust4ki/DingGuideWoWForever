-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/40.lua.
-- Simulated (warrior): Human 56 (6%) -> 57 (0%) in 7 h 55, 19 quests turned in; Dwarf 56 (6%) -> 57 (0%) in 7 h 55, 19 quests turned in; NightElf 56 (6%) -> 57 (0%) in 7 h 55, 19 quests turned in; Gnome 56 (6%) -> 57 (0%) in 7 h 55, 19 quests turned in; Skyborne 56 (6%) -> 57 (0%) in 7 h 55, 19 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a40-burning-steppes",
    title    = "Burning Steppes (56-57)",
    faction  = "Alliance",
    minLevel = 56, maxLevel = 57,
    next     = "leveling-a41-western-and-eastern-plaguelands",
    steps    = {
        { go = { 1455, 44.45, 49.53 }, text = "Stay on the trail", -- level 56
          note = "Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east." },
        { accept = 3702 }, -- level 56
        { complete = 3702, talk = 8879 }, -- level 56
        { turnin = 3702, accept = 3701 }, -- level 56
        { sethearth = "Ironforge", talk = 5111, -- level 56
          note = "The NPC is indoors." },
        { turnin = 94817, races = { "Gnome" }, classes = { "PRIEST" } }, -- level 56
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 3461, -- level 56
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 56
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 4512, -- level 56
          note = "The NPC is indoors." },
        { accept = { 3824, 4283 } }, -- level 56
        { accept = 4182 }, -- level 56
        { accept = 4726 }, -- level 56
        { accept = 4296 }, -- level 56
        { accept = 4022, elite = true }, -- level 56
        { complete = 4022, elite = true, talk = 9459, -- level 56
          note = "Your objective lies in a little cavern. This foe is elite. Consider bringing a group for this one." },
        { talk = 9459, -- level 56
          note = "Your objective lies in a little cavern." },
        { complete = 4022, elite = true }, -- level 56
        { turnin = 4022, elite = true }, -- level 56
        { complete = 4726, useitem = 12284, -- level 56
          note = "Target Black Broodlings with the item. The targets are little winged dragons. A red crystal hovers over each body." },
        { complete = 4182, -- level 56
          note = "Hunt the huge red dragons." },
        { complete = 4182 }, -- level 56
        { complete = 4182, sticky = 3701, -- level 56
          note = "The targets are little winged dragons." },
        { complete = 4296 }, -- level 56
        { complete = 3701, sticky = 4283, -- level 56
          note = "Look for gray standing stones." },
        { complete = 3824, -- level 56
          note = "The target is an ogre. Watch out, its blows are strong. Consider bringing a group for this one." },
        { complete = 4283, -- level 56
          note = "The targets are wolves and orcs." },
        { go = { 1428, 82.79, 63.27 }, text = "Climb the trail to Morgan's Vigil" }, -- level 56
        { turnin = { 3824, 4283 }, accept = 3825 }, -- level 56
        { destroy = 11467 }, -- level 56
        { turnin = 4182, accept = 4183, when = { log = 4182 } }, -- level 56
        { turnin = 4182, accept = 4183, when = { done = 4182 } }, -- level 56
        { turnin = 4183, accept = 4184, when = { log = 4182 }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 4183, accept = 4184, when = { done = 4182 }, why = { chain = 5, kind = "detour", quest = 4183, seconds = 120, xp = 15000 }, -- level 56
          note = "The NPC is indoors." },
        { go = { 1453, 73.17, 46.7 }, text = "Head into Stormwind Keep" }, -- level 56
        { turnin = 4184, when = { log = 4182 } }, -- level 56
        { turnin = 4184, when = { done = 4182 } }, -- level 56
        { accept = 4185, when = { log = 4182 } }, -- level 56
        { accept = 4185, when = { done = 4182 } }, -- level 56
        { accept = 6182, -- level 56
          note = "The NPC is indoors." },
        { complete = 4185, talk = 1749, when = { log = 4182 }, -- level 56
          note = "The NPC is indoors." },
        { complete = 4185, talk = 1749, when = { done = 4182 }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 4185, accept = 4186, when = { log = 4182 }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 4185, accept = 4186, when = { done = 4182 }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 6182, accept = 6183, floor = "up", -- level 56
          note = "The NPC is indoors, one floor up." },
        { turnin = 6183, accept = 6184, floor = "up", why = { kind = "carry", quest = 6184, seconds = 19020, xp = 5000 }, -- level 56
          note = "The NPC is indoors, one floor up." },
        { turnin = 5022, accept = 5048, floor = "up", -- level 56
          note = "The NPC is indoors, one floor up." },
        { turnin = 5048, accept = 5050, patrol = { { 1453, 60.22, 56.88 }, { 1453, 57.07, 62.4 }, { 1453, 58.52, 64.27 }, { 1453, 62.3, 61.28 }, { 1453, 64.33, 61.4 }, { 1453, 65.94, 64.29 }, { 1453, 64.26, 67.18 }, { 1453, 66.62, 71.15 }, { 1453, 63.94, 66.53 }, { 1453, 63.88, 66.47 }, { 1453, 62.71, 65.77 }, { 1453, 60.45, 67.07 }, { 1453, 59.08, 64.32 }, { 1453, 58.15, 64.39 }, { 1453, 57, 61.88 } }, why = { kind = "carry", once = true, quest = 5050, seconds = 19920, xp = 2600 }, -- level 56
          note = "The NPC is an elderly human lady. The NPC patrols a long route; look along it. If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City." },
        { turnin = 4186, accept = 4223, why = { chain = 2, kind = "detour", quest = 4186, seconds = 120, xp = 6500 }, -- level 56
          note = "The NPC is indoors." },
        { turnin = 4223, accept = 4224 }, -- level 56
        { turnin = 4726, accept = 4808, why = { continent = true, kind = "carry", quest = 4808, seconds = 53820, xp = 2700 } }, -- level 56
        { turnin = 4296 }, -- level 56
        { complete = 4224, talk = 9563 }, -- level 56
        { go = { 1428, 76.09, 38.01 }, text = "Walk over the rope bridge, then climb the trail" }, -- level 56
        { complete = 3825, -- level 56
          note = "The object is up on the summit." },
        { go = { 1428, 82.79, 63.27 }, text = "Climb the trail to Morgan's Vigil" }, -- level 56
        { turnin = 3825 }, -- level 56
        { turnin = 4224 }, -- level 56
        { level = 57, patrol = { { 1428, 75.55, 49.95 }, { 1428, 74.34, 47.05 }, { 1428, 77.17, 45.35 }, { 1428, 79.76, 47.14 }, { 1428, 83.26, 47.26 }, { 1428, 86.35, 46.95 }, { 1428, 84.83, 44.17 }, { 1428, 81.34, 43.97 }, { 1428, 77.97, 41.75 }, { 1428, 77.77, 38.24 }, { 1428, 74.64, 38.05 }, { 1428, 76.37, 34.77 }, { 1428, 82.44, 36.45 }, { 1428, 85.57, 36.44 }, { 1428, 83.56, 39.94 }, { 1428, 82.44, 32.86 }, { 1428, 74.45, 43.26 }, { 1428, 84.06, 50.46 }, { 1428, 82.55, 53.45 }, { 1428, 79.65, 56.15 }, { 1428, 76.56, 55.95 } }, why = { kind = "level", levels = { 54, 60 } }, -- level 56
          note = "Dungeon runs are a fine choice here too, as you like." },
    },
})
