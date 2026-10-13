-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/10.lua.
-- Simulated (warrior): Human 24 (71%) -> 25 (96%) in 2 h 59, 17 quests turned in; Dwarf 24 (71%) -> 25 (96%) in 2 h 58, 17 quests turned in; NightElf 24 (67%) -> 25 (92%) in 2 h 58, 17 quests turned in; Gnome 24 (71%) -> 25 (96%) in 2 h 58, 17 quests turned in; Skyborne 24 (71%) -> 25 (96%) in 2 h 58, 17 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a10-wetlands",
    title    = "Wetlands (24-25)",
    faction  = "Alliance",
    minLevel = 24, maxLevel = 25,
    next     = "leveling-a11-duskwood-and-redridge-mountains",
    steps    = {
        { go = { 1437, 8.55, 55.74 }, text = "Travel to Menethil Harbor", -- level 24
          note = "Wetlands: Menethil Harbor, on the west coast." },
        { accept = 484, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { accept = 98189, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 24
        { accept = 279, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 24
          note = "The NPC is indoors." },
        { talk = 2489, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 24
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 24
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 24
          note = "The NPC is indoors." },
        { turnin = 968, when = { log = 968 }, -- level 24
          note = "The NPC waits on the lower level, indoors." },
        { turnin = 971, dungeon = "Blackfathom Deeps", -- level 24
          note = "The NPC waits on the lower level, indoors." },
        { accept = 463, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { accept = 288, when = { item = 2594 } }, -- level 24
        { sethearth = "Deepwater Tavern", talk = 1464, -- level 24
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { talk = 1464, buy = { { 2594, 1, 1464 } }, -- level 24
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { turnin = 942, accept = 943, when = { log = 942 }, -- level 24
          note = "The NPC is indoors, one floor up." },
        { turnin = 942, accept = 943, when = { done = 942 }, -- level 24
          note = "The NPC is indoors, one floor up." },
        { turnin = 288, when = { item = 2594 }, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { accept = 98282 }, -- level 24
        { accept = 470 }, -- level 24
        { accept = 98197 }, -- level 24
        { turnin = 98461 }, -- level 24
        { talk = 1448, buy = { { 4371, 1, 1448 } }, when = { noitem = 4371 }, -- level 24
          note = "This one roams, so scan the surrounding area. The NPC is indoors. Do it only if you can." },
        { vendor = true, talk = 1448, when = { noitem = 4371 } }, -- level 24
        { accept = 305, sticky = { 279, 484 }, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { complete = 98197 }, -- level 24
        { complete = 279, -- level 24
          note = "The target is a gray murloc. This one roams, so scan the surrounding area. The target appears at this spot." },
        { complete = 279 }, -- level 24
        { go = { 1437, 34.23, 41.15 }, text = "Go into Whelgar's Excavation Site" }, -- level 24
        { go = { 1437, 37.07, 43.02 }, text = "Climb the trail" }, -- level 24
        { accept = 294, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { turnin = 305, accept = 306, -- level 24
          note = "Your objective lies in a little cavern." },
        { complete = 943, sticky = 943, when = { log = 943 }, -- level 24
          note = "Your objective lies in a little cavern." },
        { go = { 1437, 34.07, 40.91 }, text = "Head out of Whelgar's Excavation Site" }, -- level 25
        { complete = 294 }, -- level 25
        { complete = 943, when = { log = 943 }, -- level 25
          note = "The targets are raptors." },
        { go = { 1437, 34.23, 41.15 }, text = "Go into Whelgar's Excavation Site" }, -- level 25
        { go = { 1437, 37.07, 43.02 }, text = "Climb the trail" }, -- level 25
        { turnin = 294, sticky = 484, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { go = { 1437, 34.07, 40.91 }, text = "Head out of Whelgar's Excavation Site" }, -- level 25
        { accept = 469 }, -- level 25
        { turnin = 463, accept = 276, sticky = { 276, 484 }, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { complete = 98282 }, -- level 25
        { complete = 276 }, -- level 25
        { complete = 276 }, -- level 25
        { complete = 484 }, -- level 25
        { turnin = 276, accept = 277, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { complete = 470, -- level 25
          note = "Targets are both in the tomb and around it." },
        { turnin = 943, when = { log = 943 }, -- level 25
          note = "The NPC is indoors, one floor up." },
        { turnin = 98282 }, -- level 25
        { turnin = 470 }, -- level 25
        { turnin = 306, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { accept = 98072, races = { "Dwarf", "NightElf", "Gnome", "Skyborne" } }, -- level 25
        { talk = 1448, buy = { { 4371, 1, 1448 } }, when = { noitem = 4371 }, -- level 25
          note = "This one roams, so scan the surrounding area. The NPC is indoors. Do it only if you can." },
        { vendor = true, talk = 1448, when = { noitem = 4371 } }, -- level 25
        { turnin = { 484, 469 }, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { turnin = 279, -- level 25
          note = "This one roams, so scan the surrounding area." },
        { talk = 8720, collect = { { 2458, 2 }, { 2455, 4 } }, -- level 25
          note = "Keep it; an upcoming task asks for it. The NPC is indoors." },
        { go = { 1455, 61.12, 89.58 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Learn Guns at the weapon master" }, -- level 25
        { talk = 11865, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 25
          note = "The NPC is indoors." },
        { turnin = 1072 }, -- level 25
        { accept = 1073, when = { done = 1072, item = { { 2458, 2 }, { 2455, 4 } } } }, -- level 25
        { turnin = 1073, when = { item = 2455, log = 1073 } }, -- level 25
        { go = { 1455, 76.81, 51.13 }, text = "Head down into the Deeprun Tram station", -- level 25
          note = "Pass through the portal to teleport." },
        { talk = 5519, buy = { { 4371, 1, 5519 } }, when = { noitem = 4371 }, -- level 25
          note = "Do it only if you can. The vendor stocks only a few. A quest in Duskwood will require it afterward." },
        { vendor = true, talk = 5519, when = { noitem = 4371 } }, -- level 25
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors" }, -- level 25
        { accept = 1650, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 25
          note = "The NPC is indoors." },
        { talk = 15659, buy = { { 4371, 1, 15659 } }, -- level 25
          note = "The NPC is indoors. Buy it now; a task in Duskwood needs it before long." },
        { turnin = 1075 }, -- level 25
        { accept = 78148, races = { "Human" } }, -- level 25
        { talk = 2485, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 25
          note = "The NPC is on an upper floor of the tower." },
        { go = { 1453, 42.28, 81.85 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors" }, -- level 25
        { turnin = 1738, when = { ready = 1738 }, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 25
          note = "The NPC waits on the lower level, indoors." },
        { accept = 1739, when = { done = 1738 }, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" } }, -- level 25
        { complete = 1739, useitem = 6913, when = { log = 1739 }, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 25
          note = "Step onto the pink rune. The spot is in the crypt under the building." },
        { turnin = 1739, when = { ready = 1739 }, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 25
          note = "The NPC waits on the lower level, indoors. The NPC stands one level over the crypt." },
        { vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 25
          note = "The NPC waits on the lower level, indoors." },
    },
})
