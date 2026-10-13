-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/23.lua.
-- Simulated (warrior): Human 40 (79%) -> 41 (24%) in 2 h 19, 9 quests turned in; Dwarf 40 (79%) -> 41 (24%) in 2 h 19, 9 quests turned in; NightElf 40 (79%) -> 41 (24%) in 2 h 19, 9 quests turned in; Gnome 40 (79%) -> 41 (24%) in 2 h 19, 9 quests turned in; Skyborne 40 (79%) -> 41 (24%) in 2 h 19, 9 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a23-desolace",
    title    = "Desolace (40-41)",
    faction  = "Alliance",
    minLevel = 40, maxLevel = 41,
    next     = "leveling-a24-badlands",
    steps    = {
        { go = { 1443, 66.27, 6.55 }, text = "Travel to Nijel's Point", -- level 40
          note = "Desolace: Nijel's Point, in the north-east corner." },
        { sethearth = "Nijel's Point", talk = 11103, -- level 40
          note = "The NPC is indoors." },
        { accept = 261, -- level 40
          note = "The NPC is indoors." },
        { accept = 1466 }, -- level 40
        { accept = 93224 }, -- level 40
        { accept = 6134, -- level 40
          note = "Stay away from Ghost Walker Post." },
        { turnin = 1373, accept = 1374 }, -- level 40
        { complete = 1466, -- level 40
          note = "Hunt the felguards. This is the sole spot; wait for them to reappear." },
        { complete = 1466, -- level 40
          note = "The targets are felhounds." },
        { complete = 1466, sticky = 261, -- level 40
          note = "The targets are succubi." },
        { complete = 6134, useitem = 15848, -- level 40
          note = "The spot is beside a giant skeleton. Clear out the foes around here before you start. Target the spectral centaurs." },
        { complete = 261, -- level 40
          note = "The targets are brown-colored skeletons." },
        { accept = 92743 }, -- level 40
        { turnin = 92743 }, -- level 40
        { level = 40, xp = 85600, patrol = { { 1443, 64.63, 91.17 }, { 1443, 61.43, 90.86 }, { 1443, 58.26, 89.44 }, { 1443, 64.06, 88.05 }, { 1443, 64.14, 84.45 }, { 1443, 63.96, 80.34 } }, -- level 40
          note = "Together with the next turn-ins, this brings you to level 41." },
        { complete = 1374, -- level 40
          note = "This one roams, so scan the surrounding area. The target wanders inside the tent and around it." },
        { turnin = 6134 }, -- level 40
        { complete = 93224 }, -- level 41
        { turnin = 1374 }, -- level 41
        { go = { 1444, 47.53, 37.75 }, text = "Take the road, then descend the trail", -- level 41
          note = "Watch out: the foes here are above your level. On the road, Rexxar leaves you alone." },
        { go = { 1444, 43.42, 42.69 }, text = "Cross by boat or by swimming" }, -- level 41
        { go = { 1444, 30.3, 43.22 }, fly = true, talk = 8019, text = "Flight master at Feathermoon" }, -- level 41
        { talk = 7799, collect = { { 5804, 1 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 41
          note = "The NPC is indoors." },
        { talk = 9985, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 41
        { talk = 9985, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 41
          note = "You will tame a short-term pet shortly. Your pet picks up Claw (Rank 6) here." },
        { go = { 1446, 50.06, 30.96 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 41
          note = "Tame a Scorpid Hunter with Tame Beast. The foes here are scorpions." },
        { talk = 9985, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 41
        { talk = 9985, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 41
          note = "Release the short-term pet you tamed." },
        { turnin = 1117 }, -- level 41
        { accept = 1118, -- level 41
          note = "Wait for the talking to finish" },
        { accept = 1106 }, -- level 41
        { turnin = 1187, accept = 1188 }, -- level 41
        { turnin = 261, -- level 41
          note = "The NPC is indoors." },
        { accept = 1052, dungeon = "Scarlet Monastery" }, -- level 41
        { turnin = 1466, accept = 1467 }, -- level 41
        { turnin = 93224 }, -- level 41
        { turnin = 1052, accept = 1053, dungeon = "Scarlet Monastery", -- level 41
          note = "The NPC is indoors, one floor up." },
        { complete = 1053, dungeon = "Scarlet Monastery", -- level 41
          note = "Head into the Library wing. The target is the dungeon's opening boss." },
        { complete = 1050, dungeon = "Scarlet Monastery", -- level 41
          note = "Head into the Library wing. Head across the hall called Gallery of Treasures. Keep an eye on the minimap until its area name reads Scarlet Monastery again." },
        { complete = 1053, dungeon = "Scarlet Monastery", -- level 41
          note = "This is in the Armory wing. The target is the dungeon's last boss." },
        { complete = 1053, dungeon = "Scarlet Monastery", -- level 41
          note = "Found in the Cathedral wing. The target is the dungeon's last boss." },
        { turnin = 1053, dungeon = "Scarlet Monastery", -- level 41
          note = "The NPC is indoors, one floor up." },
        { turnin = 1050, dungeon = "Scarlet Monastery", -- level 41
          note = "The NPC is indoors." },
    },
})
