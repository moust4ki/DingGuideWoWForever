-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/18.lua.
-- Simulated (warrior): Orc 38 (75%) -> 39 (73%) in 3 h 37, 22 quests turned in; Scourge 38 (75%) -> 39 (73%) in 3 h 37, 22 quests turned in; Tauren 38 (75%) -> 39 (73%) in 3 h 37, 22 quests turned in; Troll 38 (75%) -> 39 (73%) in 3 h 37, 22 quests turned in; Skyborne 38 (75%) -> 39 (73%) in 3 h 37, 22 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h18-alterac-mountains-and-arathi-highlands",
    title    = "Alterac and Arathi (38-39)",
    faction  = "Horde",
    minLevel = 38, maxLevel = 39,
    next     = "leveling-h19-badlands",
    steps    = {
        { go = { 1424, 61.6, 20.85 }, text = "Travel to Tarren Mill", -- level 38
          note = "Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands." },
        { accept = 545, -- level 38
          note = "The NPC is indoors." },
        { elite = true, useitem = 6052, when = { item = 6052 }, classes = { "WARRIOR" }, -- level 38
          note = "Get ready to take down an elite of level 40 shortly. Drink a second Nature Protection Potion mid-fight. Quaff one potion right away so it is ready again later." },
        { accept = 557, -- level 38
          note = "The NPC is indoors." },
        { accept = 566, -- level 38
          note = "The quest comes from a bounty sign." },
        { accept = 503, -- level 38
          note = "The NPC is indoors." },
        { complete = 1712, classes = { "WARRIOR" }, -- level 38
          note = "Head north, keeping to the riverbank. Get Essence of the Exile done as well." },
        { turnin = 1712, noauto = 1713, when = { item = 3357 }, classes = { "WARRIOR" }, -- level 38
          note = "The NPC is indoors. Be sure the cooldown on the Nature Protection Potion has ended." },
        { accept = 79364, classes = { "SHAMAN" } }, -- level 38
        { turnin = 79364, classes = { "SHAMAN" } }, -- level 38
        { accept = 1713, elite = true, when = { done = 1712 }, classes = { "WARRIOR" } }, -- level 38
        { complete = 1713, elite = true, when = { item = 6052, log = 1713 }, classes = { "WARRIOR" }, -- level 38
          note = "Let the conversation play out. Stay behind Bath'rah the Windwatcher as he walks. This calls up Cyclonian." },
        { turnin = 1713, elite = true, when = { ready = 1713 }, classes = { "WARRIOR" } }, -- level 38
        { accept = 1792, elite = true, when = { done = 1713 }, classes = { "WARRIOR" } }, -- level 38
        { turnin = 1792, elite = true, when = { log = 1792 }, classes = { "WARRIOR" } }, -- level 38
        { destroy = 6929, classes = { "WARRIOR" } }, -- level 38
        { collect = { { 5810, 1 } }, spots = { { 1416, 48.36, 74.97 }, { 1416, 42.17, 76.75 }, { 1416, 42.45, 80.36 }, { 1416, 44.35, 76.44 }, { 1416, 44.63, 79.06 }, { 1416, 46.65, 76.55 } } }, -- level 38
        { complete = 1136, useitem = 5810, -- level 38
          note = "Your objective lies in a little cavern. It wanders to the mouth of the cave." },
        { complete = 503, -- level 38
          note = "The targets are spread over several spots. The NPC is indoors. Look on the upper floor as well." },
        { complete = 503, -- level 38
          note = "The NPC is indoors, one floor up." },
        { turnin = 503, accept = 506, -- level 38
          note = "The NPC is indoors, one floor up." },
        { complete = 566, -- level 38
          note = "The target is on the lower level, indoors. If it is not around, move on without it. No rush; you may complete this afterwards." },
        { turnin = 506, accept = 507, -- level 38
          note = "The NPC is indoors." },
        { turnin = 566, sticky = 545, when = { ready = 566 } }, -- level 38
        { go = { 1416, 38.86, 39.49 }, text = "Climb the slope, then leap the wall" }, -- level 38
        { complete = 557 }, -- level 38
        { complete = 545 }, -- level 38
        { complete = 507, -- level 39
          note = "The target is indoors, one floor up. Beware of foes lurking in stealth." },
        { turnin = 507, accept = 508, -- level 39
          note = "The NPC is indoors, one floor up." },
        { turnin = 545, -- level 39
          note = "The NPC is indoors." },
        { turnin = 557, -- level 39
          note = "The NPC is indoors." },
        { turnin = 508, -- level 39
          note = "The NPC is indoors." },
        { turnin = 638 }, -- level 39
        { accept = 678 }, -- level 39
        { accept = 701 }, -- level 39
        { complete = 642, -- level 39
          note = "The targets are kobolds. Additional ones are in the cavern up the trail. The following step takes place in the cave." },
        { go = { 1417, 80.95, 40.02 }, text = "Climb the trail to the cavern" }, -- level 39
        { go = { 1417, 82.62, 36.1 }, text = "Go into the cavern" }, -- level 39
        { turnin = 642, accept = 651, -- level 39
          note = "Climb to the cave's upper level." },
        { go = { 1417, 82.75, 36.26 }, text = "Head out of the cave" }, -- level 39
        { accept = 79976 }, -- level 39
        { turnin = 79976 }, -- level 39
        { accept = 79358, classes = { "SHAMAN" } }, -- level 39
        { complete = 651 }, -- level 39
        { complete = 651, sticky = 701 }, -- level 39
        { complete = 678 }, -- level 39
        { complete = 701, -- level 39
          note = "The targets are raptors." },
        { turnin = 701, accept = 702 }, -- level 39
        { turnin = 702, -- level 39
          note = "This one roams, so scan the surrounding area." },
        { accept = 847, -- level 39
          note = "Let the conversation play out. This one roams, so scan the surrounding area." },
        { turnin = 678 }, -- level 39
        { turnin = 847 }, -- level 39
        { complete = 651 }, -- level 39
        { turnin = 651 }, -- level 39
        { go = { 1417, 31.28, 65.32 }, text = "Take the trail across the peaks" }, -- level 39
        { go = { 1417, 21.63, 75.58 }, text = "Take the passage to Faldir's Cove" }, -- level 39
        { accept = 663 }, -- level 39
        { turnin = 663 }, -- level 39
        { accept = 662 }, -- level 39
        { accept = 664 }, -- level 39
        { accept = 665, noauto = 665, -- level 39
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { complete = 665, -- level 39
          note = "Let the conversation play out. Escort Professor Phizzlethorpe and keep him alive." },
        { turnin = 665, accept = 666, sticky = { 666, 664 } }, -- level 39
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { complete = 662, -- level 39
          note = "The tome is bound in brown and rests in a metal kettle. The objective is on the central deck of the submerged wreck." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { complete = 662, -- level 39
          note = "Look for a flat beige parchment. The objective is on the central deck of the submerged wreck." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { complete = 662, -- level 39
          note = "Look for a flat beige parchment. The objective is on the central deck of the submerged wreck." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { complete = 662, -- level 39
          note = "Search for a book lying open. The target is in the ship's lowest hold." },
        { complete = 666, equip = 4491, -- level 39
          note = "Look for big gray rocks. They show up as dots on the minimap." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE" } }, -- level 39
        { complete = 664, -- level 39
          note = "Your targets sit below the water's surface." },
        { turnin = 662 }, -- level 39
        { turnin = 664 }, -- level 39
        { turnin = 666, accept = 668 }, -- level 39
        { turnin = 668, accept = 669 }, -- level 39
    },
})
