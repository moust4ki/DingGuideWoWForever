-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/29.lua.
-- Simulated (warrior): Orc 48 (4%) -> 48 (92%) in 3 h 32, 20 quests turned in; Scourge 48 (4%) -> 48 (92%) in 3 h 32, 20 quests turned in; Tauren 48 (4%) -> 48 (92%) in 3 h 32, 20 quests turned in; Troll 48 (4%) -> 48 (92%) in 3 h 32, 20 quests turned in; Skyborne 48 (4%) -> 48 (92%) in 3 h 32, 20 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h29-the-hinterlands",
    title    = "The Hinterlands (48-49)",
    faction  = "Horde",
    minLevel = 48, maxLevel = 49,
    next     = "leveling-h30-feralas-and-ungoro-crater",
    steps    = {
        { go = { 1454, 55.9, 62.71 }, text = "Travel to the Undercity", -- level 48
          note = "Undercity first, then the Hinterlands: Revantusk Village." },
        { talk = 8673, collect = { { 11186, 7 }, { 11188, 7 }, { 11185, 7 }, { 11184, 7 } }, -- level 48
          note = "Getting it here speeds up Un'Goro Crater. The NPC is indoors." },
        { talk = 3309, collect = { { 4589, 10 }, { 8527, 1 }, { 6193, 1 }, { 9618, 1 } }, spots = { { 1454, 49.62, 69.06 } }, -- level 48
          note = "The NPC is indoors." },
        { talk = 3309, bank = { 10556, 11186, 11188, 11185, 11184 }, -- level 48
          note = "The NPC is indoors." },
        { accept = 2995 }, -- level 48
        { go = { 1458, 52.8, 77.62 }, text = "Take the trail downhill" }, -- level 48
        { turnin = 864, when = { log = 864 } }, -- level 48
        { vendor = true, talk = 2401, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 48
          note = "Buy plenty of arrows or bullets. Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40." },
        { accept = 2933 }, -- level 48
        { go = { 1425, 20.77, 47.97 }, text = "Climb the trail" }, -- level 48
        { turnin = 650, accept = 77 }, -- level 48
        { complete = 2641, -- level 48
          note = "Look for the brown fungi. Your targets sit below the water's surface." },
        { go = { 1425, 72.45, 66.04 }, text = "Take the road that circles the peak, then descend the trail" }, -- level 48
        { accept = 7839, -- level 48
          note = "This one roams, so scan the surrounding area." },
        { accept = 7840, -- level 48
          note = "The NPC is indoors." },
        { accept = 7815 }, -- level 48
        { go = { 1425, 81.76, 81.79 }, fly = true, talk = 4314, text = "Flight master at Revantusk Village" }, -- level 48
        { complete = 7840, -- level 48
          note = "A trio of enemies attacks." },
        { complete = 580, -- level 48
          note = "Look for little blue flasks. Drop the Ground Clutter option down to 1. Find it in the game options, under System, then Graphics." },
        { complete = 7815 }, -- level 48
        { turnin = 7840, -- level 48
          note = "The NPC is indoors." },
        { turnin = 7815 }, -- level 48
        { accept = { 7828, 7829, 7830 } }, -- level 48
        { accept = 7841, -- level 48
          note = "The NPC is indoors." },
        { go = { 1425, 76.1, 61.11 }, text = "Climb the trail" }, -- level 48
        { complete = 7839, -- level 48
          note = "Look for a little silver pail holding tools. The targets are spread over several spots." },
        { complete = 7830, -- level 48
          note = "The targets are big eagle-like beasts. Wolves and owlbeasts use these spawn spots as well." },
        { complete = 77, sticky = { 3123 }, -- level 48
          note = "Look for crates made of wood. Your targets are within the cavern." },
        { go = { 1425, 57.52, 38.92 }, text = "Head out of the cave" }, -- level 48
        { complete = 7828, -- level 48
          note = "The targets are wolves." },
        { complete = 7828, -- level 48
          note = "The targets are wolves hidden in stealth." },
        { complete = 3123, useitem = 9618, -- level 48
          note = "Slay them, then apply the item to their remains." },
        { complete = 7829, sticky = 7841 }, -- level 48
        { complete = 2995, -- level 48
          note = "The NPC is indoors." },
        { complete = 2995 }, -- level 48
        { complete = 2995 }, -- level 48
        { complete = 7841 }, -- level 48
        { complete = 7841 }, -- level 48
        { complete = 7841 }, -- level 48
        { complete = 7841 }, -- level 48
        { useitem = 8704, when = { item = 8704 } }, -- level 48
        { turnin = 485, when = { log = 485 } }, -- level 48
        { turnin = 7839, -- level 48
          note = "This one roams, so scan the surrounding area." },
        { turnin = 7841, accept = 7842, -- level 48
          note = "The NPC is indoors." },
        { turnin = 7842, when = { ready = 7842 }, -- level 48
          note = "The NPC is indoors." },
        { accept = 7843, when = { done = 7842 } }, -- level 48
        { destroy = 4589 }, -- level 48
        { turnin = { 7828, 7829, 7830 } }, -- level 48
        { turnin = 2933, accept = 2934, -- level 48
          note = "The NPC is indoors." },
        { complete = 7843, useitem = 19036, when = { log = 7843 }, -- level 48
          note = "Steer clear of hostile Alliance NPCs. Warning: this turns on your PvP flag." },
        { go = { 1425, 20.49, 48.14 }, text = "Climb the trail" }, -- level 48
        { turnin = 77, accept = 81 }, -- level 48
        { destroy = 8684, sticky = 2934 }, -- level 48
        { go = { 1425, 35.87, 63.94 }, text = "Head into Shadra'Alor" }, -- level 48
        { turnin = 1429, accept = 1444, -- level 48
          note = "The NPC or item sits on the rocky shelf above." },
        { complete = 2934, -- level 48
          note = "Hunt spiders for it." },
        { accept = 485, useitem = 8704, when = { item = 8704 } }, -- level 48
        { go = { 1425, 35.86, 64.24 }, when = { log = 485 }, text = "Get out of Shadra'Alor" }, -- level 48
        { turnin = 485, when = { log = 485 } }, -- level 48
        { go = { 1425, 35.86, 64.24 }, when = { done = 485 }, text = "Get out of Shadra'Alor" }, -- level 48
        { go = { 1425, 35.86, 64.24 }, text = "Get out of Shadra'Alor" }, -- level 48
        { go = { 1425, 72.45, 66.04 }, text = "Take the road that circles the peak, then descend the trail" }, -- level 48
        { turnin = 7843, when = { log = 7843 }, -- level 48
          note = "The NPC is indoors." },
        { go = { 1425, 35.86, 64.24 }, text = "Get out of Shadra'Alor" }, -- level 48
        { go = { 1425, 72.45, 66.04 }, text = "Take the road that circles the peak, then descend the trail" }, -- level 48
        { turnin = 2934, -- level 48
          note = "The NPC is indoors." },
        { turnin = 2995 }, -- level 48
        { go = { 1458, 52.8, 77.62 }, text = "Take the trail downhill" }, -- level 48
        { accept = 3568 }, -- level 48
        { turnin = 2641 }, -- level 48
        { accept = 2661, -- level 48
          note = "Wait for the talking to finish" },
        { turnin = 2661, accept = 2662 }, -- level 48
        { turnin = 2662, -- level 48
          note = "Wait for the talking to finish" },
        { talk = 7799, bank = { 8685, 3900, 10695 }, -- level 48
          note = "The NPC is indoors." },
    },
})
