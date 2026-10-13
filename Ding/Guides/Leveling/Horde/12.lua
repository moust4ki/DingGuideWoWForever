-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/12.lua.
-- Simulated (warrior): Orc 30 (34%) -> 32 (4%) in 5 h 28, 12 quests turned in; Scourge 30 (34%) -> 32 (4%) in 5 h 28, 12 quests turned in; Tauren 30 (34%) -> 32 (4%) in 5 h 28, 12 quests turned in; Troll 30 (34%) -> 32 (4%) in 5 h 28, 12 quests turned in; Skyborne 30 (34%) -> 32 (4%) in 5 h 28, 12 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h12-hillsbrad-foothills",
    title    = "Hillsbrad Foothills (30-32)",
    faction  = "Horde",
    minLevel = 30, maxLevel = 32,
    next     = "leveling-h13-arathi-highlands",
    steps    = {
        { talk = 4549, bank = 5850, -- level 30
          note = "Undercity first, then Hillsbrad Foothills: Tarren Mill. You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot." },
        { talk = 4549, collect = { { 3564, 1 }, { 3692, 1 } }, spots = { { 1458, 65.94, 44.78 } } }, -- level 30
        { go = { 1458, 62.08, 44.86 }, text = "Learn Cooking from the trainer" }, -- level 30
        { talk = 4552, -- level 30
          note = "You'll need this to pick up an upcoming quest." },
        { go = { 1458, 57.26, 32.71 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Learn Crossbows and Two-Handed Swords at the weapon master" }, -- level 30
        { talk = 11870, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" } }, -- level 30
        { accept = 1164 }, -- level 30
        { go = { 1421, 42.08, 40.61 }, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, text = "Leap up and take the trail behind that tree" }, -- level 30
        { complete = 63, useitem = 6637, when = { log = 63 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 30
        { turnin = 63, when = { ready = 63 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 30
        { accept = 100, when = { done = 63 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 30
        { turnin = 100, when = { log = 100 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 30
          note = "Wait for the talking to finish" },
        { accept = 96, when = { done = 100 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 30
        { accept = 509, -- level 30
          note = "The NPC is indoors." },
        { turnin = 529, accept = 532 }, -- level 30
        { accept = 533, -- level 30
          note = "The NPC is indoors." },
        { accept = 552 }, -- level 30
        { turnin = 1791, when = { log = 1791 }, classes = { "WARRIOR" }, -- level 30
          note = "The NPC is indoors. Head north along the river to reach the NPC." },
        { accept = 1712, classes = { "WARRIOR" } }, -- level 30
        { talk = 2393, buy = { { 3713, 1, 2393 } }, -- level 30
          note = "The NPC is indoors." },
        { turnin = 7321, when = { item = 3713 }, -- level 30
          note = "The NPC is indoors." },
        { accept = 544, -- level 30
          note = "The NPC is indoors." },
        { accept = 556, -- level 30
          note = "The NPC is indoors." },
        { complete = 552, -- level 30
          note = "Targets are in the cavern and around its entrance too." },
        { level = 31, sticky = { 532, 546 }, patrol = { { 1424, 46.23, 31.88 }, { 1424, 46.17, 31.84 }, { 1424, 45.44, 33.45 }, { 1424, 44.25, 31.25 }, { 1424, 43.36, 29.45 }, { 1424, 45.04, 28.64 }, { 1424, 43.46, 27.44 }, { 1424, 45.05, 26.36 }, { 1424, 43.36, 25.35 }, { 1424, 47.55, 30.34 }, { 1424, 42.77, 33.54 }, { 1424, 41.85, 31.96 } }, -- level 30
          note = "A tough quest lies just ahead. Foes in this area outlevel you. Targets are in the cavern and around its entrance too." },
        { go = { 1424, 46.23, 31.88 }, text = "Head out of the cave" }, -- level 31
        { complete = 567, -- level 31
          note = "Draw foes one at a time if you can. Do not take on the whole group together. The target is indoors." },
        { complete = 532, -- level 31
          note = "The target is indoors." },
        { complete = 532, -- level 31
          note = "The target is indoors." },
        { complete = 532, -- level 31
          note = "The target is indoors." },
        { complete = 532, -- level 31
          note = "The target can be indoors or out." },
        { turnin = 532, accept = 539 }, -- level 31
        { turnin = 552 }, -- level 31
        { go = { 1424, 46.17, 31.8 }, text = "Go into the cavern" }, -- level 31
        { go = { 1424, 45.05, 28.12 }, text = "Descend the ramp, then stay on the trail" }, -- level 31
        { go = { 1424, 44.07, 28.6 }, text = "Climb the trail to the cave's highest level" }, -- level 31
        { go = { 1424, 46.32, 32 }, text = "Head out of the cave" }, -- level 31
        { go = { 1424, 26.54, 58.57 }, text = "Go into the mine" }, -- level 31
        { complete = 539, -- level 31
          note = "When nearly dead, it calls two guards. The objective is underground, in the mine shaft." },
        { complete = 567, -- level 31
          note = "The targets are spread over several spots. The objective is underground, in the mine shaft." },
        { complete = 539, -- level 31
          note = "The objective is underground, in the mine shaft." },
        { complete = 546, -- level 31
          note = "Targets here are human. The objective is underground, in the mine shaft." },
        { complete = 544, -- level 31
          note = "This one roams, so scan the surrounding area." },
        { complete = 544, -- level 31
          note = "This one roams, so scan the surrounding area. The target is indoors." },
        { complete = 544, -- level 31
          note = "This one roams, so scan the surrounding area. The target is indoors." },
        { complete = 544, -- level 31
          note = "Warden Belamoore stands guard over it. The target is a mage of level 36. Fight Kegan, breaking her line of sight with doors and stairways." },
        { complete = 556, -- level 31
          note = "While Shield Guards glow, stop your melee attacks on them. Expect heavy damage from it. Targets here are human." },
        { destroy = 3711 }, -- level 31
        { complete = 533 }, -- level 31
        { level = 31, xp = 35550, patrol = { { 1424, 46.23, 31.88 }, { 1424, 46.17, 31.84 }, { 1424, 45.44, 33.45 }, { 1424, 44.25, 31.25 }, { 1424, 43.36, 29.45 }, { 1424, 45.04, 28.64 }, { 1424, 43.46, 27.44 }, { 1424, 45.05, 26.36 }, { 1424, 43.36, 25.35 }, { 1424, 47.55, 30.34 }, { 1424, 42.77, 33.54 }, { 1424, 41.85, 31.96 } }, -- level 31
          note = "Together with the next turn-ins, this brings you to level 32. Targets are in the cavern and around its entrance too." },
        { turnin = 544, -- level 31
          note = "The NPC is indoors." },
        { turnin = 556, -- level 31
          note = "The NPC is indoors." },
        { accept = 676 }, -- level 31
        { turnin = 546 }, -- level 31
        { turnin = { 539, 567 } }, -- level 31
        { accept = 98094 }, -- level 31
        { turnin = 533, -- level 31
          note = "The NPC is indoors." },
        { accept = 98095 }, -- level 31
        { turnin = 98094 }, -- level 31
        { turnin = 98095 }, -- level 32
        { complete = 509, -- level 32
          note = "Gather the big fungi." },
    },
})
