-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/16.lua.
-- Simulated (warrior): Orc 36 (32%) -> 38 (4%) in 6 h 22, 24 quests turned in; Scourge 36 (32%) -> 38 (4%) in 6 h 22, 24 quests turned in; Tauren 36 (32%) -> 38 (4%) in 6 h 22, 24 quests turned in; Troll 36 (32%) -> 38 (4%) in 6 h 22, 24 quests turned in; Skyborne 36 (32%) -> 38 (4%) in 6 h 22, 24 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h16-stranglethorn-vale",
    title    = "Stranglethorn Vale (36-37)",
    faction  = "Horde",
    minLevel = 36, maxLevel = 37,
    next     = "leveling-h17-dustwallow-marsh",
    leftOut  = {
        [348] = { kind = "far" },
        [592] = { kind = "prereq" },
        [670] = { kind = "far", turnin = true },
        [3626] = { kind = "prereq" },
        [3721] = { kind = "prereq" },
        [8553] = { kind = "prereq" },
        [8554] = { kind = "prereq" },
    },
    steps    = {
        { go = { 1434, 32.17, 28.9 }, text = "Travel to Grom'gol Base Camp", -- level 36
          note = "Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there." },
        { accept = 568 }, -- level 36
        { go = { 1434, 32.48, 29.38 }, fly = true, talk = 1387, text = "Flight master at Grom'gol" }, -- level 36
        { accept = 581 }, -- level 36
        { accept = 596 }, -- level 36
        { vendor = true, talk = 1149, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 36
          note = "A lengthy stretch of quests is coming up." },
        { complete = 201 }, -- level 36
        { turnin = { 5762, 5763 } }, -- level 36
        { accept = 583 }, -- level 36
        { turnin = 583, accept = 194 }, -- level 36
        { accept = 185 }, -- level 36
        { accept = 190 }, -- level 36
        { complete = 185 }, -- level 36
        { turnin = 185, accept = 186 }, -- level 36
        { complete = 190 }, -- level 36
        { complete = 1712, keep = 3357, classes = { "WARRIOR" }, -- level 36
          note = "They compete for spawn points with the other Kurzen foes. A key class quest coming up requires this." },
        { complete = 605, -- level 36
          note = "When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { complete = 186 }, -- level 36
        { complete = 575, -- level 36
          note = "Search the riverbanks." },
        { turnin = 186, accept = 187 }, -- level 36
        { turnin = 190, accept = 191, sticky = { 581, 189, 596 } }, -- level 36
        { complete = 187, sticky = 194 }, -- level 36
        { complete = 191 }, -- level 36
        { complete = 194 }, -- level 36
        { complete = 605 }, -- level 36
        { complete = { 581, 189, 596 }, collect = { { 4306, 15 } }, keep = { 3901, 1519, 3915, 4306 }, -- level 36
          note = "The targets are trolls. Hang on to it; an upcoming quest uses it." },
        { turnin = 194, accept = 195 }, -- level 37
        { turnin = 187, accept = 188 }, -- level 37
        { turnin = 191, accept = 192 }, -- level 37
        { complete = 188, -- level 37
          note = "Look for an orange tiger. Mostly found atop the hill. This one roams, so scan the surrounding area." },
        { complete = { 195, 568 } }, -- level 37
        { turnin = 581, accept = 582 }, -- level 37
        { turnin = 596 }, -- level 37
        { accept = 629, elite = true }, -- level 37
        { turnin = 568, accept = 569 }, -- level 37
        { complete = 629, elite = true, -- level 37
          note = "Steer clear of elite murlocs. Your targets sit below the water's surface." },
        { complete = 582 }, -- level 37
        { complete = 1712, classes = { "WARRIOR" } }, -- level 37
        { turnin = 582 }, -- level 37
        { destroy = 1532 }, -- level 37
        { turnin = 629, elite = true }, -- level 37
        { accept = 570 }, -- level 37
        { complete = 569, sticky = { 570, 192 } }, -- level 37
        { complete = 570, -- level 37
          note = "They appear in the same spots as the panthers. Watch for Shadowmaw Panthers; they are hidden by stealth." },
        { complete = 570, -- level 37
          note = "These foes hide in stealth. Tigers compete for the same spawn points." },
        { complete = 192, sticky = 213, -- level 37
          note = "These foes hide in stealth." },
        { floor = "up", collect = { { 5851, 1 } }, spots = { { 1434, 42.62, 18.29 } }, -- level 37
          note = "The objective sits up on the raised deck. The target is indoors." },
        { complete = 1182, -- level 37
          note = "The object is indoors." },
        { complete = 213 }, -- level 37
        { turnin = 195, accept = 196 }, -- level 37
        { turnin = 188 }, -- level 37
        { turnin = 192 }, -- level 37
        { accept = 193, elite = true }, -- level 37
        { accept = 638, why = { kind = "carry", quest = 638, seconds = 16080, xp = 700 } }, -- level 37
        { turnin = 569 }, -- level 37
        { turnin = 570 }, -- level 37
        { turnin = 1182, floor = "up", -- level 37
          note = "The NPC is upstairs, out on the balcony." },
        { turnin = { 189, 213 }, floor = "top", -- level 37
          note = "Climb to the highest floor of the building." },
        { turnin = 201, floor = "top", -- level 37
          note = "Climb to the highest floor of the building." },
        { turnin = 605, floor = "down", -- level 37
          note = "The NPC is on the building's lowest floor" },
        { turnin = 575, -- level 38
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
    },
})
