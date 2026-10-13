-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/21.lua.
-- Simulated (warrior): Orc 41 (69%) -> 41 (92%) in 1 h 09, 6 quests turned in; Scourge 41 (69%) -> 41 (92%) in 1 h 09, 6 quests turned in; Tauren 41 (69%) -> 41 (92%) in 1 h 09, 6 quests turned in; Troll 41 (69%) -> 41 (92%) in 1 h 09, 6 quests turned in; Skyborne 41 (69%) -> 41 (92%) in 1 h 09, 6 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h21-desolace",
    title    = "Desolace (41-41)",
    faction  = "Horde",
    minLevel = 41, maxLevel = 41,
    next     = "leveling-h22-tanaris",
    steps    = {
        { go = { 1443, 25.82, 68.21 }, text = "Travel to Shadowprey Village", -- level 41
          note = "Desolace: Shadowprey Village, on the west coast." },
        { accept = 5581 }, -- level 41
        { turnin = 1373, accept = 1374 }, -- level 41
        { accept = 6134 }, -- level 41
        { go = { 1443, 55.41, 58.02 }, text = "Climb the trail" }, -- level 41
        { accept = 1488, elite = true }, -- level 41
        { complete = 5581, -- level 41
          note = "Look for purple rings made of rock. A guardian shows up." },
        { complete = 1488, elite = true, -- level 41
          note = "Stay clear of Lord Azrethoc. An elite winged fiend of level 40 with brown hide. The target wanders close by; look around." },
        { complete = 1488, elite = true, -- level 41
          note = "An elite winged fiend of level 40 with brown hide. You can handle this alone without much trouble. This one roams, so scan the surrounding area." },
        { complete = 6134, useitem = 15848, -- level 41
          note = "The spot is beside a giant skeleton. Clear out the foes around here before you start. Target the spectral centaurs." },
        { accept = 92743 }, -- level 41
        { turnin = 92743 }, -- level 41
        { complete = 1374, -- level 41
          note = "This one roams, so scan the surrounding area. The target wanders inside the tent and around it." },
        { go = { 1443, 57.38, 56.39 }, text = "Climb the trail" }, -- level 41
        { accept = 93225 }, -- level 41
        { complete = 93225 }, -- level 41
        { turnin = 93225 }, -- level 41
        { turnin = 1488, elite = true }, -- level 41
        { turnin = 6134 }, -- level 41
        { turnin = 1374 }, -- level 41
        { go = { 1443, 26.31, 74.88 }, text = "Take the trail toward Shadowprey Village" }, -- level 41
        { turnin = 5581 }, -- level 41
        { complete = 79358, classes = { "SHAMAN" } }, -- level 41
    },
})
