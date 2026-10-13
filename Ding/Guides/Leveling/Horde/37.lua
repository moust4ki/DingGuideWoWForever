-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/37.lua.
-- Simulated (warrior): Orc 54 (13%) -> 54 (38%) in 1 h 17, 6 quests turned in; Scourge 54 (13%) -> 54 (38%) in 1 h 17, 6 quests turned in; Tauren 54 (13%) -> 54 (38%) in 1 h 17, 6 quests turned in; Troll 54 (13%) -> 54 (38%) in 1 h 17, 6 quests turned in; Skyborne 54 (17%) -> 54 (43%) in 1 h 17, 6 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h37-azshara",
    title    = "Azshara (54-54)",
    faction  = "Horde",
    minLevel = 54, maxLevel = 54,
    next     = "leveling-h38-felwood-and-winterspring",
    steps    = {
        { go = { 1447, 22.26, 51.48 }, text = "Travel to Valormok", -- level 54
          note = "Azshara: Valormok, in the west of the zone." },
        { accept = 3505 }, -- level 54
        { turnin = { 3562, 3563 }, accept = 3542, why = { continent = true, kind = "carry", quest = 3542, seconds = 50940, xp = 2600 } }, -- level 54
        { accept = 3601, sticky = 3601, -- level 54
          note = "The quest giver waits on the hilltop." },
        { complete = 3505 }, -- level 54
        { complete = 3505 }, -- level 54
        { turnin = 3505, accept = 3506, object = 151286 }, -- level 54
        { complete = 3506, -- level 54
          note = "Be ready for a fight right away. More than one crystal might be required. The target shouts for Magus Rimtori once badly hurt." },
        { turnin = 3601, when = { ready = 3601 }, -- level 54
          note = "The quest giver waits on the hilltop." },
        { accept = 5534, when = { done = 3601 } }, -- level 54
        { complete = 5534, when = { log = 5534 }, -- level 54
          note = "The targets are Myrmidons and Sirens. Hunt naga." },
        { go = { 1447, 45.92, 38.66 }, text = "Climb the trail" }, -- level 54
        { turnin = 5534, when = { log = 5534 }, -- level 54
          note = "The quest giver waits on the hilltop." },
        { turnin = 3506, accept = 3507, why = { kind = "carry", once = true, quest = 3507, seconds = 46200, xp = 7300 } }, -- level 54
    },
})
