-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/33.lua.
-- Simulated (warrior): Orc 50 (72%) -> 51 (22%) in 3 h 14, 10 quests turned in; Scourge 50 (72%) -> 51 (22%) in 3 h 14, 10 quests turned in; Tauren 50 (72%) -> 51 (22%) in 3 h 14, 10 quests turned in; Troll 50 (72%) -> 51 (22%) in 3 h 14, 10 quests turned in; Skyborne 50 (72%) -> 51 (22%) in 3 h 14, 10 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h33-searing-gorge",
    title    = "Searing Gorge (51-51)",
    faction  = "Horde",
    minLevel = 51, maxLevel = 51,
    next     = "leveling-h34-burning-steppes-and-azshara",
    leftOut  = {
        [7848] = { kind = "away" },
    },
    steps    = {
        { go = { 1418, 3.36, 48.06 }, text = "Travel to Kargath", -- level 50
          note = "Badlands: Kargath first, at the western edge, then the Searing Gorge." },
        { accept = 3821, why = { kind = "carry", once = true, quest = 3821, seconds = 11700, xp = 5100 }, -- level 50
          note = "The NPC roams the trail close to Kargath. The NPC gives the quest only while at this spot. If the NPC is away, stay until he comes back." },
        { accept = 4449, sticky = 4449 }, -- level 50
        { complete = 4449, -- level 50
          note = "The targets are spread over several spots." },
        { complete = 4449, -- level 50
          note = "The targets are spread over several spots." },
        { turnin = 4449 }, -- level 50
        { go = { 1427, 66.74, 34.52 }, text = "Stay on the trail" }, -- level 50
        { accept = 3441 }, -- level 50
        { complete = 3441, talk = 8479 }, -- level 50
        { turnin = 3441, accept = 3442 }, -- level 50
        { go = { 1427, 31.55, 33.57 }, text = "Climb the trail into Thorium Point", -- level 50
          note = "Look for it high on the clifftop." },
        { go = { 1427, 34.9, 30.91 }, fly = true, talk = 3305, text = "Flight master at Thorium Point" }, -- level 50
        { accept = { 7728, 7729 } }, -- level 50
        { accept = { 7723, 7724, 7727 }, sticky = { 3442, 7724, 7723, 7728, 7729 } }, -- level 50
        { complete = 7728 }, -- level 50
        { complete = 3442, -- level 50
          note = "Hunt flame and stone elementals." },
        { complete = 3442, -- level 50
          note = "Fight elementals and golems." },
        { turnin = 3442, accept = 3443, sticky = 3443 }, -- level 50
        { go = { 1427, 49.27, 43.68 }, text = "Drop onto the metal catwalk at this spot" }, -- level 50
        { go = { 1427, 49.61, 45.45 }, text = "Go into the cavern" }, -- level 50
        { go = { 1427, 47.79, 41.88 }, text = "Drop off the cavern's bridge at this spot" }, -- level 50
        { complete = 7727, sticky = { 3443, 7729 }, -- level 50
          note = "Your targets are within the cavern." },
        { go = { 1427, 47.49, 46.49 }, text = "Head out of the cave" }, -- level 50
        { go = { 1427, 49.64, 45.44 }, text = "Go in through the second cave opening" }, -- level 50
        { collect = { { 11818, 1 } }, -- level 50
          note = "Targets are spread across the whole cavern." },
        { accept = 4451, useitem = 11818 }, -- level 50
        { complete = 3443, -- level 50
          note = "Slave Workers can drop them too. Targets are spread across the whole cavern." },
        { complete = 7729, sticky = { 7724, 7723 }, -- level 50
          note = "Targets are spread across the whole cavern." },
        { go = { 1427, 49.64, 45.44 }, text = "Head out of the cave" }, -- level 50
        { go = { 1427, 58.24, 40.56 }, text = "Climb the trail out of the Cauldron" }, -- level 50
        { turnin = 3443 }, -- level 50
        { accept = 3452, elite = true }, -- level 50
        { complete = 3452, elite = true, -- level 50
          note = "The foes here are elite. Consider bringing a group for this one. Do not leave this quest undone; it matters." },
        { go = { 1427, 21.2, 35.97 }, text = "Head out of the cave" }, -- level 50
        { turnin = 3452, elite = true }, -- level 50
        { accept = 3453, elite = true }, -- level 50
        { complete = 3453, elite = true }, -- level 50
        { turnin = 3453, elite = true }, -- level 50
        { accept = 3454, elite = true }, -- level 50
        { turnin = 3454, elite = true }, -- level 50
        { accept = 3462, elite = true }, -- level 50
        { turnin = 3462, elite = true }, -- level 50
        { accept = 3463, elite = true }, -- level 50
        { complete = 3463, elite = true, floor = "up", equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { complete = 3463, elite = true, floor = "up", equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { complete = 3463, elite = true, floor = "up", equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { go = { 1427, 52.52, 58.01 }, elite = true, text = "Walk over the rope bridge" }, -- level 50
        { complete = 3463, elite = true, floor = "up", equip = 10515, -- level 50
          note = "The spot is at the tower's upper level. Beware, this foe is elite." },
        { turnin = 4451, sticky = 7724 }, -- level 50
        { go = { 1427, 66.74, 34.52 }, text = "Stay on the trail" }, -- level 51
        { turnin = 3463, elite = true }, -- level 51
        { destroy = 10515 }, -- level 51
        { accept = 3481, elite = true }, -- level 51
        { turnin = 3481, elite = true }, -- level 51
        { collect = { { 10575, 1 } }, useitem = 10569, -- level 51
          note = "Keep it; a later quest calls for it." },
        { complete = 7728, -- level 51
          note = "Look by the lookout towers ringing the Cauldron." },
        { complete = 7724 }, -- level 51
        { complete = 7723 }, -- level 51
        { go = { 1427, 31.55, 33.57 }, text = "Climb the trail into Thorium Point" }, -- level 51
        { turnin = { 7723, 7724, 7727 } }, -- level 51
        { turnin = { 7728, 7729 } }, -- level 51
    },
})
