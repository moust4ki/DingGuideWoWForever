-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/29.lua.
-- Simulated (warrior): Human 48 (57%) -> 49 (0%) in 3 h 09, 4 quests turned in; Dwarf 48 (57%) -> 49 (0%) in 3 h 09, 4 quests turned in; NightElf 48 (57%) -> 49 (0%) in 3 h 09, 4 quests turned in; Gnome 48 (57%) -> 49 (0%) in 3 h 09, 4 quests turned in; Skyborne 48 (57%) -> 49 (0%) in 3 h 09, 4 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a29-the-hinterlands",
    title    = "The Hinterlands (48-49)",
    faction  = "Alliance",
    minLevel = 48, maxLevel = 49,
    next     = "leveling-a30-tanaris",
    steps    = {
        { go = { 1425, 9.75, 44.47 }, text = "Travel to Aerie Peak", -- level 48
          note = "The Hinterlands: Aerie Peak, in the west of the zone." },
        { accept = 2988, sticky = 3661, -- level 48
          note = "The NPC is indoors. The NPC is at the summit of the trail." },
        { go = { 1425, 20.76, 47.85 }, text = "Climb the trail" }, -- level 48
        { turnin = 1452 }, -- level 48
        { accept = 1469, sticky = 3661, -- level 48
          note = "Wait for the talking to finish" },
        { complete = 2988 }, -- level 48
        { complete = 2988 }, -- level 48
        { complete = 2988 }, -- level 48
        { collect = { { 9259, 5 } }, keep = 9259, -- level 48
          note = "The targets are trolls." },
        { accept = 2880, -- level 48
          note = "The NPC is indoors." },
        { turnin = 2880, when = { ready = 2880 }, -- level 48
          note = "The NPC is indoors." },
        { accept = 2877 }, -- level 48
        { turnin = 2988, accept = 2989, -- level 48
          note = "The NPC is indoors. The NPC is at the summit of the trail." },
        { complete = 3661, -- level 48
          note = "Gather the big plumes colored brown and ivory. Drop the Ground Clutter option down to 1. Find it in the game options, under System, then Graphics." },
        { go = { 1425, 49.18, 66.5 }, text = "Hop onto the ledge", -- level 48
          note = "Hop onto the ledge here. Monsters are unable to reach you from this spot. Hold off until you have left combat." },
        { complete = 2877, -- level 48
          note = "Other creatures use these spawn points too." },
        { accept = 485, collect = { { 8704, 1 } }, useitem = 8704, -- level 48
          note = "If it hasn't turned up by level 49, move on." },
        { turnin = 485, when = { log = 485 } }, -- level 48
        { level = 49, sticky = 580, patrol = { { 1425, 57.37, 50.44 }, { 1425, 54.44, 50.36 }, { 1425, 51.43, 49.36 }, { 1425, 51.37, 45.56 }, { 1425, 54.37, 44.25 }, { 1425, 53.94, 41.23 }, { 1425, 56.14, 46.86 }, { 1425, 60.34, 47.44 }, { 1425, 62.25, 50.65 }, { 1425, 65.14, 52.26 }, { 1425, 62.05, 54.14 }, { 1425, 63.64, 57.04 }, { 1425, 60.56, 57.83 }, { 1425, 58.36, 54.54 }, { 1425, 55.46, 53.55 }, { 1425, 51.36, 54.14 }, { 1425, 51.35, 58.37 }, { 1425, 51.46, 61.35 }, { 1425, 63.65, 44.46 }, { 1425, 61.14, 41.45 } } }, -- level 48
        { go = { 1425, 71.44, 65.03 }, elite = true, text = "Stay on the road, then take the trail downhill" }, -- level 48
        { complete = 2944, elite = true, useitem = 9328, -- level 48
          note = "Point it at Gammerita. The quarry: a tough elite tortoise, azure-shelled. This one roams, so scan the surrounding area." },
        { complete = 580, elite = true, -- level 48
          note = "Look for little blue flasks. Steer around Revantusk Village. Stay away from Gammerita." },
        { go = { 1425, 78.17, 68.15 }, elite = true, text = "Kill mobs until your hearthstone is off cooldown", -- level 48
          note = "Stay away from Gammerita. The quarry: a tough elite tortoise, azure-shelled. This one roams, so scan the surrounding area." },
        { talk = 7799, bank = { 6287, 9328, 9330, 3900, 10819 }, -- level 49
          note = "The NPC is indoors." },
    },
})
