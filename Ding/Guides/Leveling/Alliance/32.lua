-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/32.lua.
-- Simulated (warrior): Human 49 (100%) -> 50 (13%) in 1 h 02, 8 quests turned in; Dwarf 49 (100%) -> 50 (13%) in 1 h 02, 8 quests turned in; NightElf 49 (100%) -> 50 (13%) in 1 h 02, 8 quests turned in; Gnome 49 (100%) -> 50 (13%) in 1 h 02, 8 quests turned in; Skyborne 49 (100%) -> 50 (13%) in 1 h 02, 8 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a32-stranglethorn-vale",
    title    = "Stranglethorn Vale (50-50)",
    faction  = "Alliance",
    minLevel = 50, maxLevel = 50,
    next     = "leveling-a33-searing-gorge",
    steps    = {
        { go = { 1434, 27.17, 77.01 }, text = "Travel to Booty Bay", -- level 49
          note = "Stranglethorn Vale: Booty Bay, at the southern tip." },
        { accept = 608, -- level 49
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = 2874, -- level 49
          note = "The NPC is indoors." },
        { turnin = 580, elite = true }, -- level 49
        { turnin = 1122, when = { log = 1122 }, -- level 50
          note = "The NPC is indoors at street level." },
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
        { complete = 197, elite = true, -- level 50
          note = "Hunt down an elite raptor of level 43 whose scales look azure. This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { turnin = 197, elite = true }, -- level 50
        { accept = 208, elite = true }, -- level 50
        { complete = 208, elite = true, -- level 50
          note = "The quarry is a pale tiger, an elite at 43. It calls 2 small adds of a lesser level; neither one is elite. When it drops to about 50% health." },
        { turnin = 208, elite = true }, -- level 50
        { turnin = 624, accept = 625, why = { back = true, chain = 2, kind = "detour", quest = 624, seconds = 840, short = true, xp = 10000 }, -- level 50
          note = "Look underneath the bridge. Your targets sit below the water's surface." },
        { turnin = 93176 }, -- level 50
        { turnin = 608, -- level 50
          note = "The NPC is upstairs, out on the balcony." },
        { sethearth = "Booty Bay", talk = 6807, -- level 50
          note = "The NPC is indoors at street level." },
        { turnin = 625, accept = 626, -- level 50
          note = "Your objective lies in a little cavern." },
        { talk = 2625, collect = { { 6287, 1 }, { 4306, 15 } }, spots = { { 1434, 26.6, 76.53 } } }, -- level 50
        { sethearth = "Stormwind City", talk = 6740, -- level 50
          note = "The NPC is indoors." },
        { turnin = 1469, why = { kind = "detour", quest = 1469, seconds = 300, short = true, xp = 1600 }, -- level 50
          note = "The NPC is indoors." },
        { go = { 1453, 69.09, 30.83 }, text = "Head down into the Deeprun Tram station", -- level 50
          note = "Pass through the portal to teleport." },
    },
})
