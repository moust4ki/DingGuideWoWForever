-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/37.lua.
-- Simulated (warrior): Human 52 (84%) -> 53 (19%) in 2 h 11, 9 quests turned in; Dwarf 52 (84%) -> 53 (19%) in 2 h 11, 9 quests turned in; NightElf 52 (84%) -> 53 (19%) in 2 h 11, 9 quests turned in; Gnome 52 (84%) -> 53 (19%) in 2 h 11, 9 quests turned in; Skyborne 52 (84%) -> 53 (19%) in 2 h 11, 9 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a37-feralas-and-azshara",
    title    = "Feralas and Azshara (52-53)",
    faction  = "Alliance",
    minLevel = 52, maxLevel = 53,
    next     = "leveling-a38-ungoro-crater",
    steps    = {
        { go = { 1444, 30.63, 42.71 }, text = "Travel to Feathermoon Stronghold", -- level 52
          note = "Feralas: Feathermoon Stronghold, on the island off the west coast." },
        { accept = 7733 }, -- level 52
        { turnin = 2943, elite = true }, -- level 52
        { accept = 2879, elite = true }, -- level 52
        { accept = 7721, sticky = 7721 }, -- level 52
        { accept = 7003, elite = true }, -- level 52
        { complete = 7003, elite = true, useitem = 18904, -- level 52
          note = "Aim the item at the Strider foes. The targets are towering green giants. The item strips their elite status." },
        { complete = 7721, -- level 52
          note = "Hunt down the elementals formed of water." },
        { turnin = 7003, elite = true }, -- level 52
        { turnin = 7721 }, -- level 52
        { destroy = 18904 }, -- level 52
        { go = { 1444, 59.09, 44.57 }, elite = true, text = "Reveal Dire Maul on your map" }, -- level 52
        { complete = 7733, -- level 52
          note = "The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { go = { 1444, 53.38, 31.88 }, text = "Head out of the cave" }, -- level 52
        { accept = 2844 }, -- level 52
        { go = { 1444, 44.56, 9.85 }, text = "Stand on the neighboring ledge, then hop into this crack in the wall" }, -- level 52
        { collect = { { 11242, 1 } }, object = 164798, spots = { { 1444, 44.6, 10.18 } }, -- level 52
          note = "The object is indoors." },
        { go = { 1444, 40.38, 11.01 }, text = "Hop onto the ledge" }, -- level 52
        { go = { 1444, 40.55, 11.48 }, text = "Leap over at this spot" }, -- level 52
        { go = { 1444, 40.94, 11.81 }, text = "Leap up at this spot" }, -- level 52
        { collect = { { 9257, 1 } }, spots = { { 1444, 40.6, 12.7 } }, -- level 52
          note = "The object sits on the rocky shelf above." },
        { collect = { { 9256, 1 } }, object = 142187, spots = { { 1444, 39.89, 9.41 } } }, -- level 52
        { collect = { { 9255, 1 } }, object = 142186, spots = { { 1444, 37.72, 12.14 } } }, -- level 52
        { collect = { { 9258, 1 } }, object = 142185, spots = { { 1444, 38.55, 15.85 } } }, -- level 52
        { useitem = 9263 }, -- level 52
        { complete = 2879, elite = true }, -- level 52
        { turnin = 2879, elite = true }, -- level 52
        { object = 144063 }, -- level 52
        { accept = 2942, elite = true }, -- level 52
        { turnin = 2844, accept = 2845 }, -- level 52
        { complete = 2845 }, -- level 52
        { complete = 2845, useitem = 9189, -- level 52
          note = "Let the conversation play out. Shay Leafrunner trails behind you; keep her alive. Keep near her, as she tends to stray." },
        { turnin = 2845 }, -- level 52
        { turnin = 4142, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 52
        { turnin = 4142, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 52
        { complete = 3909, talk = 7775, -- level 52
          note = "Finish the quest named The Videre Elixir. Keep the elixir in your bags; never consume it. You will die from it." },
        { turnin = 2942, elite = true, when = { item = 9307 } }, -- level 52
        { turnin = 7733 }, -- level 52
        { turnin = 7735, when = { log = 7735 } }, -- level 52
        { turnin = 5158 }, -- level 53
        { sethearth = "Ratchet", talk = 6791, -- level 53
          note = "The NPC is indoors." },
        { complete = 3444 }, -- level 53
        { accept = 4502, elite = true }, -- level 53
        { talk = 3496, collect = { { 10445, 1 }, { 10444, 1 } }, spots = { { 1413, 62.58, 37.39 } } }, -- level 53
        { talk = 3496, bank = { 10556, 11682, 11947, 11949, 12383, 11243, 11511 }, -- level 53
          note = "Put these items in your bank vault." },
        { accept = 3601, -- level 53
          note = "The quest giver waits on the hilltop." },
        { turnin = 3601, when = { ready = 3601 }, -- level 53
          note = "The quest giver waits on the hilltop." },
        { accept = 5534, when = { done = 3601 } }, -- level 53
        { complete = 3449 }, -- level 53
        { complete = 3449 }, -- level 53
        { complete = 3449 }, -- level 53
        { complete = 3449 }, -- level 53
        { complete = 5534, when = { log = 5534 }, -- level 53
          note = "The targets are Myrmidons and Sirens. Hunt naga." },
        { go = { 1447, 45.92, 38.66 }, text = "Climb the trail" }, -- level 53
        { turnin = 5534, when = { log = 5534 }, -- level 53
          note = "The quest giver waits on the hilltop." },
        { go = { 1447, 62.41, 82.04 }, text = "Skirt the Ruins of Eldarath, then take the bridge across" }, -- level 53
        { go = { 1447, 65.03, 82.27 }, text = "Walk over the span" }, -- level 53
        { go = { 1447, 74.01, 87.34 }, text = "Drop down with care" }, -- level 53
        { turnin = 3449, accept = 3461, useitem = 10444, -- level 53
          note = "The spot is the middle of the timber deck. It shows up close by after a while. At times it takes several minutes." },
        { destroy = 10444 }, -- level 53
    },
})
