-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/11.lua.
-- Simulated (warrior): Orc 28 (25%) -> 30 (34%) in 7 h 00, 23 quests turned in; Scourge 28 (25%) -> 30 (34%) in 7 h 00, 23 quests turned in; Tauren 28 (25%) -> 30 (34%) in 7 h 00, 23 quests turned in; Troll 28 (25%) -> 30 (34%) in 7 h 00, 23 quests turned in; Skyborne 28 (25%) -> 30 (34%) in 7 h 00, 23 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h11-thousand-needles",
    title    = "Thousand Needles (28-30)",
    faction  = "Horde",
    minLevel = 28, maxLevel = 30,
    next     = "leveling-h12-hillsbrad-foothills",
    steps    = {
        { go = { 1413, 45.1, 57.68 }, text = "Travel to Camp Taurajo", -- level 28
          note = "The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post." },
        { accept = 1153 }, -- level 28
        { turnin = 1534, when = { ready = 1534 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 28
          note = "The quest giver waits on the hilltop." },
        { accept = 220, when = { done = 1534 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 28
        { turnin = 5881, -- level 28
          note = "If the NPC is absent, stay until he reappears." },
        { accept = 4542, -- level 28
          note = "If the NPC is absent, stay until he reappears." },
        { go = { 1441, 46.96, 48.28 }, text = "Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up" }, -- level 28
        { go = { 1441, 45.09, 49.14 }, fly = true, talk = 4317, text = "Fly to Freewind Post" }, -- level 28
        { accept = 4767, -- level 28
          note = "This one roams, so scan the surrounding area." },
        { accept = 4821 }, -- level 28
        { turnin = 4542, accept = 4841, -- level 28
          note = "This one roams, so scan the surrounding area." },
        { turnin = 1196, accept = 1197, sticky = 4841, -- level 28
          note = "The NPC is indoors." },
        { go = { 1441, 44.08, 37.31 }, text = "Go into the cavern" }, -- level 28
        { go = { 1441, 42, 34.72 }, text = "Stay on the trail" }, -- level 28
        { complete = 1197, -- level 28
          note = "A pair of level 30 foes stand guard over it. Your targets are within the cavern." },
        { go = { 1441, 44.08, 37.31 }, text = "Head out of the cave" }, -- level 28
        { complete = 4841, sticky = 1153 }, -- level 28
        { go = { 1441, 44.08, 37.31 }, text = "Head out of the cave" }, -- level 28
        { go = { 1441, 54.74, 44.75 }, text = "Climb the trail" }, -- level 28
        { accept = 1149, -- level 28
          note = "Your objective lies in a little cavern." },
        { go = { 1441, 26.39, 31.24 }, text = "Use the teleporter to reach the Plateau", -- level 28
          note = "Wait for the talking to finish" },
        { go = { 1441, 26.37, 32.47 }, text = "Go back to Dorn Plainstalker", -- level 28
          note = "Leap down from the ledge. This won't kill you." },
        { turnin = 1149, sticky = 1153, when = { ready = 1149 }, -- level 28
          note = "Your objective lies in a little cavern." },
        { complete = 4821, -- level 28
          note = "Look for a big, pale egg. The targets are spread over several spots." },
        { complete = 1153, -- level 28
          note = "Kill Surveyors and Diggers. The targets are kobolds. They are rare and scattered widely." },
        { level = 28, xp = 34950, patrol = { { 1441, 44.46, 40.15 }, { 1441, 41.96, 37.96 }, { 1441, 39.03, 37.54 }, { 1441, 41.06, 41.24 }, { 1441, 45.45, 44.05 }, { 1441, 47.54, 40.95 }, { 1441, 43.35, 35.23 }, { 1441, 38.96, 32.23 } }, -- level 28
          note = "With the coming hand-ins, this brings you to level 29." },
        { go = { 1441, 46.96, 48.28 }, text = "Take the lift upward" }, -- level 28
        { turnin = 4821, accept = 4865 }, -- level 28
        { turnin = 4841, -- level 28
          note = "This one roams, so scan the surrounding area." },
        { turnin = 1197, -- level 28
          note = "The NPC is indoors." },
        { go = { 1441, 14.81, 32.87 }, text = "Climb the trail" }, -- level 29
        { complete = 4767, -- level 29
          note = "Look for big eggs." },
        { go = { 1441, 13.22, 39.56 }, elite = true, text = "Climb the trail" }, -- level 29
        { accept = 4770, elite = true, noauto = 4770, -- level 29
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Keep away from Heartrazor." },
        { complete = 4770, elite = true }, -- level 29
        { complete = 1131, patrol = { { 1441, 18.27, 26.69 }, { 1441, 17.23, 29.56 }, { 1441, 14.7, 30.71 }, { 1441, 11.04, 22.54 }, { 1441, 13.33, 19.77 }, { 1441, 14.88, 19.55 }, { 1441, 17.23, 18.86 }, { 1441, 18.77, 24.75 } }, -- level 29
          note = "Steelsnap is a brown hyena with 2 hyena escorts. The NPC patrols a long route; look along it. The target appears near 17.3, 22.2 in Thousand Needles." },
        { turnin = 4770, elite = true, when = { log = 4770 } }, -- level 29
        { turnin = 4865, accept = 5062, -- level 29
          note = "This one roams, so scan the surrounding area." },
        { accept = 4881, collect = { { 12564, 1 } }, useitem = 12564, patrol = { { 1441, 18.35, 22.18 }, { 1441, 18.62, 25.88 }, { 1441, 20.06, 27.65 }, { 1441, 21.93, 30.25 }, { 1441, 23.21, 31.53 }, { 1441, 25.25, 34.28 }, { 1441, 26.3, 34.26 }, { 1441, 29.27, 34.05 }, { 1441, 31.36, 30.84 }, { 1441, 32.96, 30.77 }, { 1441, 35.13, 28.2 }, { 1441, 37.01, 29.49 }, { 1441, 38.75, 31.7 }, { 1441, 39.3, 33.13 } }, -- level 29
          note = "The target is a centaur, black in color. It roams a wide route. Leave it out if you'd rather not hunt for it." },
        { collect = { { 12564, 1 } }, useitem = 12564, -- level 29
          note = "The target is a centaur, black in color. It roams a wide route. His patrol crosses this spot two times." },
        { turnin = 4881, accept = 4966, -- level 29
          note = "Expect three foes to strike." },
        { complete = 4966, -- level 29
          note = "Fight off the foes that come at you" },
        { turnin = 4966 }, -- level 29
        { complete = 5062, -- level 29
          note = "Look for thorny plants. The targets are under the water and along the shore." },
        { turnin = 1131, accept = 1136 }, -- level 29
        { turnin = 5062, -- level 29
          note = "The quest giver waits in the tent." },
        { accept = 5088, elite = true }, -- level 29
        { talk = 8356, bank = 5838, -- level 29
          note = "The NPC is indoors." },
        { turnin = 1153 }, -- level 29
        { turnin = 4767, -- level 29
          note = "This one roams, so scan the surrounding area." },
        { accept = 5064, -- level 29
          note = "This one roams, so scan the surrounding area." },
        { accept = 5147 }, -- level 29
        { accept = 98070 }, -- level 29
        { complete = 98070 }, -- level 29
        { level = 30, patrol = { { 1441, 44.46, 40.15 }, { 1441, 41.96, 37.96 }, { 1441, 39.03, 37.54 }, { 1441, 41.06, 41.24 }, { 1441, 45.45, 44.05 }, { 1441, 47.54, 40.95 }, { 1441, 43.35, 35.23 }, { 1441, 38.96, 32.23 } }, -- level 29
          note = "Hard quests are coming up. This spreads out the grinding so less is left later." },
        { go = { 1441, 31.29, 36.91 }, text = "Climb the trail and cross the rope bridges" }, -- level 30
        { go = { 1441, 35.05, 31.46 }, text = "Walk over the rope bridge" }, -- level 30
        { complete = 5064, -- level 30
          note = "The objective lies atop the mesa. The NPC is indoors." },
        { complete = 5064, -- level 30
          note = "The objective lies atop the mesa. The NPC is indoors." },
        { complete = 5064, -- level 30
          note = "The objective lies atop the mesa." },
        { go = { 1441, 35.73, 30.97 }, elite = true, text = "Walk over the rope bridge" }, -- level 30
        { complete = 5088, elite = true, -- level 30
          note = "The objective lies atop the mesa. Be ready for a fight right away. The target is a level 28 elite." },
        { complete = 5088, elite = true, -- level 30
          note = "The target is a level 28 elite. You can defeat it alone without much trouble. Consider bringing a group for this one." },
        { complete = 5147, -- level 30
          note = "The objective lies atop the mesa. This one roams, so scan the surrounding area." },
        { accept = 4904, noauto = 4904, -- level 30
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear." },
        { complete = 4904, -- level 30
          note = "Let the conversation play out. Escort Lakota Windsong safely to the end. On every plateau, a pair of foes spawns." },
        { turnin = 5088, elite = true }, -- level 30
        { accept = 5151, elite = true }, -- level 30
        { complete = 5151, elite = true, -- level 30
          note = "Be ready: this opponent is an elite at level 30. Consider bringing a group for this one. Leave it if it proves too hard." },
        { turnin = 5151, elite = true, when = { log = 5151 } }, -- level 30
        { abandon = 5151, when = { log = 5151, notdone = 5151 } }, -- level 30
        { go = { 1441, 7.63, 10.58 }, text = "Climb the road into Feralas", -- level 30
          note = "Watch out: the foes here are above your level. Should you die, come back to life at Camp Mojache." },
        { go = { 1444, 75.42, 44.32 }, fly = true, talk = 8020, text = "Fly to Camp Mojache" }, -- level 30
        { turnin = { 5064, 5147 }, -- level 30
          note = "This one roams, so scan the surrounding area." },
        { sethearth = "Freewind Post", talk = 11116, -- level 30
          note = "The NPC is indoors." },
        { turnin = 4904, -- level 30
          note = "The NPC is indoors." },
        { turnin = 98070 }, -- level 30
        { accept = 1111 }, -- level 30
        { go = { 1446, 51.65, 25.41 }, fly = true, talk = 7824, text = "Fly to Gadgetzan", -- level 30
          note = "Watch out: the foes here are above your level." },
        { train = true, talk = 3043, classes = { "WARRIOR" }, -- level 30
          note = "The NPC is indoors." },
        { accept = 1718, classes = { "WARRIOR" }, -- level 30
          note = "The NPC is indoors." },
        { go = { 1456, 29.77, 29.79 }, races = { "Scourge", "Troll" }, classes = { "MAGE" }, text = "Go into the cavern", -- level 30
          note = "Your targets are within the cavern." },
        { train = true, talk = 3049, races = { "Scourge", "Troll" }, classes = { "MAGE" } }, -- level 30
        { talk = 5957, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 30
          note = "Your targets are within the cavern." },
        { go = { 1456, 29.77, 29.79 }, text = "Head out of the cave" }, -- level 30
        { accept = 1145 }, -- level 30
        { turnin = 1111, accept = 1112 }, -- level 30
        { turnin = 220, when = { log = 220 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 30
        { accept = 63, when = { done = 220 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 30
        { talk = 5901, collect = { { 6637, 1 } }, spots = { { 1413, 65.86, 43.84 } }, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 30
          note = "Get Water Sapta done as well." },
        { turnin = 1718, accept = 1719, classes = { "WARRIOR" } }, -- level 30
        { complete = 1719, classes = { "WARRIOR" }, -- level 30
          note = "Stand on the metal grating to begin the battle. Shows up once you defeat six challengers." },
        { turnin = 1719, when = { ready = 1719 }, classes = { "WARRIOR" } }, -- level 30
        { accept = 1791, when = { done = 1719 }, classes = { "WARRIOR" } }, -- level 30
        { talk = 8119, bank = 5800 }, -- level 30
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 30
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 1431, -- level 30
          note = "This one roams, so scan the surrounding area. This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 30
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 30
          note = "This NPC is found down in the Cleft of Shadow." },
        { accept = 1531, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" }, -- level 30
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 30
          note = "The NPC is indoors." },
        { turnin = 1145, accept = 1146 }, -- level 30
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 30
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 30
          note = "The NPC stands on the highest level of this structure." },
        { go = { 1454, 81.5, 19.65 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Learn Two-Handed Axes at the weapon master" }, -- level 30
        { talk = 2704, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 30
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 30
          note = "The NPC is indoors." },
        { turnin = 1431, accept = 1432, -- level 30
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
    },
})
