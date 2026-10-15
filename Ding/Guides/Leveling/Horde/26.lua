-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/26.lua.
-- Simulated (warrior): Orc 44 (73%) -> 45 (65%) in 4 h 31, 21 quests turned in; Scourge 44 (73%) -> 45 (65%) in 4 h 31, 21 quests turned in; Tauren 44 (73%) -> 45 (65%) in 4 h 31, 21 quests turned in; Troll 44 (73%) -> 45 (65%) in 4 h 31, 21 quests turned in; Skyborne 44 (73%) -> 45 (65%) in 4 h 31, 21 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h26-stranglethorn-vale",
    title    = "Stranglethorn Vale (44-45)",
    faction  = "Horde",
    minLevel = 44, maxLevel = 45,
    next     = "leveling-h27-swamp-of-sorrows",
    steps    = {
        { go = { 1434, 32.22, 27.6 }, text = "Travel to Grom'gol Base Camp", -- level 44
          note = "Stranglethorn Vale: Grom'gol Base Camp, on the west coast." },
        { accept = 586 }, -- level 44
        { complete = 628, elite = true, sticky = 586, -- level 44
          note = "Be ready: these opponents are elites at level 38. Saltwater Crocolisks spawn in the same places." },
        { complete = 586, -- level 44
          note = "It doesn't show up often." },
        { complete = 586 }, -- level 44
        { complete = 193, elite = true, -- level 44
          note = "A dark panther, elite at 40, visible rather than hidden. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { turnin = 193, elite = true }, -- level 44
        { accept = 338 }, -- level 44
        { accept = 339, when = { item = { { 2725, 1 }, { 2728, 1 }, { 2730, 1 }, { 2732, 1 } } } }, -- level 44
        { turnin = 339, when = { log = 339, ready = 339 } }, -- level 44
        { accept = 340, when = { item = { { 2734, 1 }, { 2735, 1 }, { 2738, 1 }, { 2740, 1 } } } }, -- level 44
        { turnin = 340, when = { log = 339, ready = 340 } }, -- level 44
        { turnin = 340, when = { done = 339, ready = 340 } }, -- level 44
        { accept = 341, when = { item = { { 2742, 1 }, { 2744, 1 }, { 2745, 1 }, { 2748, 1 } } } }, -- level 44
        { turnin = 341, when = { log = 339, ready = 341 } }, -- level 44
        { turnin = 341, when = { done = 339, ready = 341 } }, -- level 44
        { accept = 342, when = { item = { { 2749, 1 }, { 2750, 1 }, { 2751, 1 } } } }, -- level 44
        { turnin = 342, when = { log = 339, ready = 342 } }, -- level 44
        { turnin = 342, when = { done = 339, ready = 342 } }, -- level 44
        { turnin = 338, when = { item = 2756, ready = 338 } }, -- level 44
        { abandon = 338 }, -- level 44
        { turnin = 586, accept = 588 }, -- level 44
        { turnin = 588, accept = 589 }, -- level 44
        { accept = 571 }, -- level 44
        { talk = 2625, collect = { { 5826, 1 } }, spots = { { 1434, 26.6, 76.53 } } }, -- level 44
        { turnin = 1118, -- level 44
          note = "The NPC is indoors at street level." },
        { accept = 621, -- level 44
          note = "Let the conversation play out. The NPC is indoors at street level." },
        { accept = 606, -- level 44
          note = "The NPC is indoors." },
        { accept = 595 }, -- level 44
        { turnin = 628, elite = true }, -- level 44
        { go = { 1434, 27.94, 73.5 }, text = "Take the passage out of Booty Bay" }, -- level 44
        { complete = { 571, 606 } }, -- level 44
        { turnin = 595, accept = 597 }, -- level 44
        { go = { 1434, 29.51, 72.47 }, text = "Take the tunnel into Booty Bay" }, -- level 45
        { turnin = 606, accept = 607 }, -- level 45
        { turnin = 597, accept = 599 }, -- level 45
        { turnin = 607, accept = 609, -- level 45
          note = "The NPC is indoors." },
        { accept = 587, floor = "top", -- level 45
          note = "Climb to the highest floor of the building." },
        { turnin = 599, accept = 604, floor = "up", -- level 45
          note = "The NPC waits on the house's upper-floor terrace." },
        { accept = 576, sticky = { 604, 576, 587 }, -- level 45
          note = "The NPC stands on the top tier of the pier." },
        { go = { 1434, 27.94, 73.5 }, text = "Take the passage out of Booty Bay" }, -- level 45
        { go = { 1434, 32.83, 73.7 }, text = "Follow the shoreline" }, -- level 45
        { complete = 604, -- level 45
          note = "The item is a brownish sheet of parchment. The targets are spread over several spots." },
        { complete = 604, -- level 45
          note = "Look for a flat, white scroll lying open. The targets are spread over several spots." },
        { complete = { 576, 587 } }, -- level 45
        { complete = 604 }, -- level 45
        { go = { 1434, 29.51, 72.47 }, text = "Take the tunnel into Booty Bay" }, -- level 45
        { turnin = 576, -- level 45
          note = "The NPC stands on the top tier of the pier." },
        { accept = 617 }, -- level 45
        { turnin = 587, floor = "top", -- level 45
          note = "Climb to the highest floor of the building." },
        { turnin = 604, floor = "up", -- level 45
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = 571, accept = 573 }, -- level 45
        { go = { 1434, 39.08, 47.06 }, text = "Take the road until the trail starts" }, -- level 45
        { complete = 589, sticky = 621, -- level 45
          note = "Your targets are within the cavern." },
        { go = { 1434, 42.05, 50.08 }, text = "Head out of the cave" }, -- level 45
        { complete = 609 }, -- level 45
        { complete = 609 }, -- level 45
        { go = { 1434, 34.04, 54.09 }, text = "Stay on the trail" }, -- level 45
        { complete = 609 }, -- level 45
        { go = { 1434, 27.08, 59.45 }, text = "Circle the mountain on the trail, then climb it" }, -- level 45
        { go = { 1434, 27.3, 62.95 }, text = "Stay on the trail" }, -- level 45
        { complete = 573 }, -- level 45
        { complete = 617 }, -- level 45
        { complete = 573 }, -- level 45
        { go = { 1434, 29.51, 72.47 }, text = "Take the tunnel into Booty Bay" }, -- level 45
        { turnin = 609, -- level 45
          note = "The NPC is indoors." },
        { turnin = 617 }, -- level 45
        { accept = 580, -- level 45
          note = "The NPC is indoors at street level." },
        { turnin = 621, when = { ready = 621 }, -- level 45
          note = "The NPC is indoors at street level." },
        { sethearth = "Booty Bay", talk = 6807, -- level 45
          note = "The NPC is indoors at street level." },
        { turnin = 573 }, -- level 45
        { turnin = 589 }, -- level 45
    },
})
