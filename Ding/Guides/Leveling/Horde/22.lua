-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/22.lua.
-- Simulated (warrior): Orc 41 (92%) -> 42 (18%) in 33 min, 12 quests turned in; Scourge 41 (92%) -> 42 (18%) in 33 min, 12 quests turned in; Tauren 41 (92%) -> 42 (18%) in 33 min, 12 quests turned in; Troll 41 (92%) -> 42 (18%) in 33 min, 12 quests turned in; Skyborne 41 (92%) -> 42 (18%) in 33 min, 12 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h22-tanaris",
    title    = "Tanaris (41-42)",
    faction  = "Horde",
    minLevel = 41, maxLevel = 42,
    next     = "leveling-h23-dustwallow-marsh",
    steps    = {
        { go = { 1446, 51.57, 26.76 }, text = "Travel to Gadgetzan", -- level 41
          note = "Tanaris: Gadgetzan, in the north of the zone." },
        { turnin = 2864 }, -- level 41
        { accept = 1707 }, -- level 41
        { turnin = 243, accept = { 379, 1690 } }, -- level 41
        { talk = 9985, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 41
        { talk = 9985, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 41
          note = "You will tame a short-term pet shortly. Your pet picks up Claw (Rank 6) here." },
        { go = { 1446, 50.06, 30.96 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 41
          note = "Tame a Scorpid Hunter with Tame Beast. The foes here are scorpions." },
        { talk = 9985, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 41
        { talk = 9985, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 41
          note = "Release the short-term pet you tamed." },
        { accept = 3520 }, -- level 41
        { turnin = 2872, sticky = 1690, -- level 41
          note = "The NPC is indoors." },
        { collect = { { 8483, 10 } }, spots = { { 1446, 62.75, 30.36 }, { 1446, 59.84, 24.03 }, { 1446, 63.17, 32.36 }, { 1446, 63.25, 34.57 }, { 1446, 64.03, 28.35 }, { 1446, 65.25, 32.76 } }, keep = 8483, -- level 41
          note = "Targets here are human." },
        { complete = 1690 }, -- level 41
        { level = 42, patrol = { { 1446, 62.75, 30.36 }, { 1446, 63.17, 32.36 }, { 1446, 65.25, 32.76 }, { 1446, 63.25, 34.57 }, { 1446, 64.03, 28.35 }, { 1446, 59.84, 24.03 } }, -- level 41
          note = "A tougher foe is coming up." },
        { turnin = 1690 }, -- level 42
        { turnin = 379, when = { ready = 379 } }, -- level 42
        { turnin = 1707, when = { ready = 1707 } }, -- level 42
        { destroy = 8484, -- level 42
          note = "Grab the loot." },
        { sethearth = "Gadgetzan", talk = 7733, -- level 42
          note = "The NPC is indoors." },
        { talk = 7799, bank = { 8524, 10699 }, -- level 42
          note = "The NPC is indoors." },
        { turnin = 1117 }, -- level 42
        { accept = 1118, -- level 42
          note = "Wait for the talking to finish" },
        { turnin = 1137 }, -- level 42
        { turnin = 1183, accept = { 1186, 1190 } }, -- level 42
        { turnin = 1186, accept = 1187 }, -- level 42
        { turnin = 1190, accept = 1194, -- level 42
          note = "Hold on until Rizzle has fled. The NPC is indoors." },
        { turnin = 1194 }, -- level 42
        { turnin = 79358, classes = { "SHAMAN" } }, -- level 42
        { accept = 79366, classes = { "SHAMAN" } }, -- level 42
        { turnin = 79366, classes = { "SHAMAN" } }, -- level 42
        { destroy = 5866 }, -- level 42
        { talk = 7799, bank = 5826, -- level 42
          note = "The NPC is indoors." },
    },
})
