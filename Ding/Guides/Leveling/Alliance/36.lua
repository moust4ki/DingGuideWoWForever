-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/36.lua.
-- Simulated (warrior): Human 52 (7%) -> 52 (84%) in 4 h 13, 15 quests turned in; Dwarf 52 (7%) -> 52 (84%) in 4 h 13, 15 quests turned in; NightElf 52 (7%) -> 52 (84%) in 4 h 13, 15 quests turned in; Gnome 52 (7%) -> 52 (84%) in 4 h 13, 15 quests turned in; Skyborne 52 (7%) -> 52 (84%) in 4 h 13, 15 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a36-azshara-and-felwood",
    title    = "Azshara and Felwood (52-52)",
    faction  = "Alliance",
    minLevel = 52, maxLevel = 52,
    next     = "leveling-a37-feralas-and-azshara",
    steps    = {
        { go = { 1438, 55.5, 92.05 }, text = "Travel to Rut'theran Village", -- level 52
          note = "Teldrassil: Rut'theran Village first, then Azshara and Felwood." },
        { turnin = 3661, accept = 978, -- level 52
          note = "The NPC is indoors." },
        { turnin = 2944, elite = true }, -- level 52
        { accept = 2943, elite = true }, -- level 52
        { talk = 4209, collect = { { 8594, 1 }, { 11133, 1 }, { 11316, 1 }, { 11018, 25 } }, spots = { { 1457, 39.54, 41.92 } }, -- level 52
          note = "The NPC is indoors." },
        { talk = 4209, bank = { 12724, 10444, 8526 }, -- level 52
          note = "The NPC is indoors. You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots." },
        { turnin = 3790, accept = 3764, -- level 52
          note = "Climb to the highest floor of the building." },
        { turnin = 3764, when = { ready = 3764 }, -- level 52
          note = "The quest giver stands outdoors, not indoors." },
        { turnin = 162, elite = true, when = { log = 162 } }, -- level 52
        { accept = 4493, elite = true, when = { done = 162 } }, -- level 52
        { sethearth = "Auberdine", talk = 6737, -- level 52
          note = "The NPC is indoors." },
        { accept = { 5535, 5536 } }, -- level 52
        { complete = 5535 }, -- level 52
        { complete = 5536 }, -- level 52
        { turnin = { 5535, 5536 } }, -- level 52
        { vendor = true, talk = 14301, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 52
          note = "A lengthy stretch of questing lies ahead. This vendor sells no arrows or bullets." },
        { accept = 4101 }, -- level 52
        { accept = 5155 }, -- level 52
        { accept = 4421, -- level 52
          note = "The NPC is indoors." },
        { accept = 8460 }, -- level 52
        { complete = 8460 }, -- level 52
        { turnin = 8460, accept = 8462 }, -- level 52
        { collect = { { 21377, 5 } } }, -- level 52
        { collect = { { 21377, 1 } }, keep = 21377, -- level 52
          note = "Hand these in afterwards for experience and reputation." },
        { go = { 1448, 48.45, 89.23 }, text = "Raise Timbermaw Hold standing to Unfriendly" }, -- level 52
        { collect = { { 11914, 6 }, { 11948, 6 } }, useitem = 11912, when = { item = 11912 } }, -- level 52
        { complete = 4512, useitem = 11914, sticky = 4421, -- level 52
          note = "Slay them, then apply the item to their remains." },
        { go = { 1448, 36.91, 66.95 }, text = "Stay on the trail" }, -- level 52
        { complete = 4421 }, -- level 52
        { complete = 4421, -- level 52
          note = "These foes hide in stealth." },
        { complete = 4512, useitem = 11948, -- level 52
          note = "Slay them, then apply the item to their remains." },
        { complete = 5155, -- level 52
          note = "Extra targets wait in the caves." },
        { turnin = 5155, accept = 5157 }, -- level 52
        { turnin = 4421, accept = 4906, -- level 52
          note = "The NPC is indoors." },
        { accept = 5156, -- level 52
          note = "The NPC is indoors." },
        { go = { 1448, 38.32, 59.8 }, text = "Stay on the trail to reach Jaedenar" }, -- level 52
        { complete = 5157, useitem = 12922, sticky = 5156 }, -- level 52
        { complete = 5156 }, -- level 52
        { complete = 5156, sticky = 4906 }, -- level 52
        { go = { 1448, 43.01, 21.28 }, text = "Climb the trail into Jadefire Run" }, -- level 52
        { complete = 4906, collect = { { 11668, 1 } }, -- level 52
          note = "This one roams, so scan the surrounding area." },
        { accept = 939, useitem = 11668 }, -- level 52
        { complete = 939 }, -- level 52
        { complete = 4906 }, -- level 52
        { complete = 4101, -- level 52
          note = "Fight the elementals of the swamp. Targets are in the cavern and around its entrance too." },
        { go = { 1448, 55.93, 17.12 }, text = "Head out of the cave", -- level 52
          note = "Keep to the road the whole way." },
        { go = { 1448, 62.55, 24.19 }, fly = true, talk = 12578, text = "Flight master at Talonbranch Glade" }, -- level 52
        { turnin = 8462, -- level 52
          note = "Keep to the road the whole way." },
        { turnin = 3908, accept = 3909 }, -- level 52
        { complete = 978, -- level 52
          note = "Big blue plumes. Head eastward as you go." },
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 52
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 52
          note = "You will tame a short-term pet shortly. You pick up Claw (Rank 7) here." },
        { go = { 1452, 62.36, 36.55 }, fly = true, talk = 11138, text = "Flight master at Everlook", -- level 52
          note = "The flight master stands past the walls, outdoors." },
        { go = { 1448, 47.45, 15.37 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 52
          note = "Tame an Angerclaw Mauler with your Tame Beast spell. Track down a plague-ridden bear with a chestnut coat." },
        { turnin = 5156, -- level 52
          note = "The NPC is indoors." },
        { turnin = { 939, 4906 }, accept = 4441, -- level 52
          note = "The NPC is indoors." },
        { turnin = 5157, accept = 5158 }, -- level 52
        { turnin = 4101 }, -- level 52
        { talk = 9528, collect = { { 11511, 1 } } }, -- level 52
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 52
        { talk = 10085, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 52
          note = "Release the short-term pet you tamed." },
    },
})
