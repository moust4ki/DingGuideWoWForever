-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/31.lua.
-- Simulated (warrior): Orc 50 (21%) -> 50 (47%) in 52 min, 12 quests turned in; Scourge 50 (21%) -> 50 (47%) in 52 min, 12 quests turned in; Tauren 50 (21%) -> 50 (47%) in 52 min, 12 quests turned in; Troll 50 (21%) -> 50 (47%) in 52 min, 12 quests turned in; Skyborne 50 (21%) -> 50 (47%) in 52 min, 12 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h31-stranglethorn-vale-and-swamp-of-sorrows",
    title    = "Stranglethorn and Swamp of Sorrows (50-50)",
    faction  = "Horde",
    minLevel = 50, maxLevel = 50,
    next     = "leveling-h32-blasted-lands",
    steps    = {
        { go = { 1434, 27.78, 77.07 }, text = "Travel to Booty Bay", -- level 50
          note = "Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows." },
        { turnin = 2874, -- level 50
          note = "The NPC is indoors." },
        { turnin = 580, -- level 50
          note = "The NPC is indoors at street level." },
        { turnin = 1122, when = { log = 1122 }, -- level 50
          note = "The NPC is indoors at street level." },
        { complete = 197, elite = true, -- level 50
          note = "Hunt down an elite raptor of level 43 whose scales look azure. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { turnin = 197, elite = true }, -- level 50
        { accept = 208, elite = true }, -- level 50
        { complete = 208, elite = true, -- level 50
          note = "The quarry is a pale tiger, an elite at 43. It calls 2 small adds of a lesser level; neither one is elite. When it drops to about 50% health." },
        { turnin = 208, elite = true }, -- level 50
        { accept = 608, floor = "up", -- level 50
          note = "The NPC is upstairs, out on the balcony." },
        { go = { 1434, 27.94, 73.5 }, text = "Take the passage out of Booty Bay" }, -- level 50
        { accept = 594, collect = { { 4098, 1 } }, useitem = 4098, -- level 50
          note = "Small green flasks. Search the shoreline, right by the waves." },
        { complete = 608, -- level 50
          note = "The objective is on the ship's center deck." },
        { collect = { { 4056, 1 } }, when = { notdone = 624, notlog = 624 }, -- level 50
          note = "Search for a parchment roll, white in color. Search the ship's middle or lowest deck. The targets are spread over several spots." },
        { accept = 624, useitem = 4056, when = { item = 4056 } }, -- level 50
        { complete = 608, -- level 50
          note = "The objective is on the ship's center deck." },
        { collect = { { 4056, 1 } }, when = { notdone = 624, notlog = 624 }, -- level 50
          note = "Search for a parchment roll, white in color. Search the ship's middle or lowest deck. The targets are spread over several spots." },
        { accept = 624, useitem = 4056, when = { item = 4056 } }, -- level 50
        { complete = 608, -- level 50
          note = "The objective is on the ship's center deck." },
        { collect = { { 4056, 1 } }, when = { notdone = 624, notlog = 624 }, -- level 50
          note = "Search for a parchment roll, white in color. Search the ship's middle or lowest deck. The targets are spread over several spots." },
        { accept = 624, useitem = 4056, when = { item = 4056 } }, -- level 50
        { turnin = 594, -- level 50
          note = "If she is absent, wait for her to come back. Beware of foes lurking in stealth." },
        { go = { 1434, 29.51, 72.47 }, text = "Take the tunnel into Booty Bay" }, -- level 50
        { turnin = 608, floor = "up", -- level 50
          note = "The NPC is upstairs, out on the balcony." },
        { accept = 2623, -- level 50
          note = "The NPC is indoors." },
        { turnin = 1444, floor = "up", -- level 50
          note = "The NPC is indoors, one floor up." },
        { go = { 1435, 66.33, 76.49 }, text = "Go into the cavern" }, -- level 50
        { go = { 1435, 64.03, 87.88 }, text = "Climb the trail" }, -- level 50
        { complete = 2623, floor = "up", -- level 50
          note = "The target is a gray murloc. This one roams, so scan the surrounding area. Climb to the cave's upper level." },
        { go = { 1435, 66.33, 76.49 }, text = "Head out of the cave" }, -- level 50
        { turnin = 93176 }, -- level 50
        { turnin = 624, accept = 625, -- level 50
          note = "Look underneath the bridge. Your targets sit below the water's surface." },
        { accept = 1173, -- level 50
          note = "The NPC turns hostile and fights you. Consider bringing a group for this one." },
        { complete = 1173, -- level 50
          note = "Let the conversation play out. The target yields at roughly 30% health." },
        { turnin = 1173, -- level 50
          note = "Your objective lies in a little cavern." },
        { turnin = 625, accept = 626, why = { continent = true, kind = "carry", once = true, quest = 626, seconds = 138720, short = true, xp = 6100 }, -- level 50
          note = "Your objective lies in a little cavern." },
        { talk = 3496, collect = { { 4306, 15 } } }, -- level 50
        { turnin = 2623, accept = 2801, why = { kind = "detour", quest = 2623, quests = 2, seconds = 60, total = 6300, xp = 5700 } }, -- level 50
        { complete = 2801, talk = 7572 }, -- level 50
        { turnin = 2801 }, -- level 50
    },
})
