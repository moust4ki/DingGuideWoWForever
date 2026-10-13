-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/30.lua.
-- Simulated (warrior): Human 49 (0%) -> 49 (50%) in 2 h 58, 9 quests turned in; Dwarf 49 (0%) -> 49 (50%) in 2 h 58, 9 quests turned in; NightElf 49 (0%) -> 49 (47%) in 2 h 57, 8 quests turned in; Gnome 49 (0%) -> 49 (50%) in 2 h 58, 9 quests turned in; Skyborne 49 (0%) -> 49 (50%) in 2 h 58, 9 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a30-tanaris",
    title    = "Tanaris (49-49)",
    faction  = "Alliance",
    minLevel = 49, maxLevel = 49,
    next     = "leveling-a31-ungoro-crater",
    steps    = {
        { go = { 1446, 52.3, 28.91 }, text = "Travel to Gadgetzan", -- level 49
          note = "Tanaris: Gadgetzan, in the north of the zone." },
        { talk = 7799, collect = { { 10699, 1 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 49
          note = "The NPC is indoors." },
        { accept = 1691 }, -- level 49
        { accept = { 2781, 2875 } }, -- level 49
        { accept = 10, elite = true, when = { done = 82 } }, -- level 49
        { turnin = 3445, accept = 3161, sticky = 1691 }, -- level 49
        { complete = 2781, patrol = { { 1446, 63.89, 31.92 }, { 1446, 63.33, 37.26 }, { 1446, 62.25, 37.8 }, { 1446, 59.56, 41.25 }, { 1446, 58.76, 38.2 }, { 1446, 61.91, 33.36 } }, -- level 49
          note = "The target patrols a wide loop, turning counterclockwise. Watch for a pair of guards hiding in stealth. The target's spawn point is 58.9, 39.3 in Tanaris." },
        { complete = 1691, -- level 49
          note = "These foes hide in stealth." },
        { vendor = true, talk = 8139, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" } }, -- level 49
        { go = { 1446, 68.56, 41.43 }, text = "Head down the passage that opens on Lost Rigger Cove" }, -- level 49
        { complete = 2873, -- level 49
          note = "The NPC is indoors, one floor up." },
        { complete = 2875 }, -- level 49
        { collect = { { 9276, 1 }, { 9250, 1 } }, useitem = { 9276, 9250 }, when = { maxlevel = 49 }, -- level 49
          note = "Few kills yield this item." },
        { accept = 2876, when = { maxlevel = 49 }, races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 49
        { accept = 2876, when = { maxlevel = 49 }, races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 49
        { collect = { { 8623, 1 } }, useitem = 8623, when = { maxlevel = 49 }, -- level 49
          note = "Few kills yield this item." },
        { accept = 351, when = { maxlevel = 49 }, races = { "Gnome" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK", "DRUID" } }, -- level 49
        { accept = 351, when = { maxlevel = 49 }, races = { "Human", "Dwarf", "Skyborne" } }, -- level 49
        { complete = 8365 }, -- level 49
        { complete = 8366 }, -- level 49
        { complete = 8366, -- level 49
          note = "Others can be found on raised wood platforms close by." },
        { complete = 8366, -- level 49
          note = "Others are indoors too." },
        { go = { 1446, 69.69, 42.33 }, text = "Take the passage out of Lost Rigger Cove" }, -- level 49
        { turnin = { 2875, 8366 }, -- level 49
          note = "The NPC is indoors." },
        { turnin = 2876, when = { log = 2876 } }, -- level 49
        { turnin = 2873, accept = 2874, -- level 49
          note = "The NPC is indoors." },
        { turnin = 8365 }, -- level 49
        { turnin = 351, when = { log = 351 }, -- level 49
          note = "For this quest you guard an NPC on the move. If the NPC is gone, hold on until it reappears." },
        { go = { 1446, 55.74, 68.86 }, text = "Go into the cavern" }, -- level 49
        { go = { 1446, 57.67, 70.72 }, text = "Take the trail downhill" }, -- level 49
        { complete = 10, elite = true, when = { log = 10 } }, -- level 49
        { turnin = { 2781, 1691 } }, -- level 49
        { talk = 7799, collect = { { 11186, 7 }, { 11188, 7 }, { 11185, 7 }, { 11184, 7 } }, -- level 49
          note = "The NPC is indoors." },
        { talk = 7799, bank = 9245, -- level 49
          note = "The NPC is indoors." },
        { accept = 2605 }, -- level 49
        { turnin = 10, elite = true, when = { log = 10 } }, -- level 49
        { accept = 110, elite = true, when = { done = 10 } }, -- level 49
        { turnin = 110, elite = true, when = { log = 110 } }, -- level 49
        { accept = 113, elite = true, when = { done = 110 } }, -- level 49
        { accept = 3362 }, -- level 49
        { accept = 5863 }, -- level 49
        { turnin = 113, elite = true, when = { log = 113 } }, -- level 49
        { complete = 5863, -- level 49
          note = "Your objective lies in a little cavern." },
        { complete = 5863 }, -- level 49
        { complete = 3161, sticky = 3362, -- level 49
          note = "Search the sand mounds." },
        { complete = 2605, -- level 49
          note = "It competes for spawn points." },
        { complete = 3362 }, -- level 49
    },
})
