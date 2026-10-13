-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/42.lua.
-- Simulated (warrior): Human 58 (67%) -> 59 (4%) in 3 h 12, 10 quests turned in; Dwarf 58 (67%) -> 59 (4%) in 3 h 12, 10 quests turned in; NightElf 58 (67%) -> 59 (4%) in 3 h 12, 10 quests turned in; Gnome 58 (67%) -> 59 (4%) in 3 h 12, 10 quests turned in; Skyborne 58 (67%) -> 59 (4%) in 3 h 12, 10 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a42-winterspring",
    title    = "Winterspring (58-59)",
    faction  = "Alliance",
    minLevel = 58, maxLevel = 59,
    next     = "leveling-a43-silithus",
    steps    = {
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master.", -- level 58
          note = "Winterspring: Everlook, in the middle of the zone." },
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 58
          note = "You will tame a short-term pet shortly. Pick up Claw (Rank 8) for your pet." },
        { go = { 1452, 57.86, 26.45 }, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 58
          note = "Tame a Winterspring Screecher with the Tame Beast spell. Hunt the white owls." },
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 58
        { talk = 11119, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 58
          note = "Release the short-term pet you tamed." },
        { talk = 13917, collect = { { 12438, 1 } }, spots = { { 1452, 61.51, 36.91 } }, -- level 58
          note = "The NPC is indoors." },
        { talk = 13917, bank = 12663, -- level 58
          note = "The NPC is indoors. You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot." },
        { turnin = 4808, accept = 4809 }, -- level 58
        { sethearth = "Everlook", talk = 11118, -- level 58
          note = "The NPC is indoors." },
        { accept = 3783, sticky = 4809 }, -- level 58
        { complete = 3783, -- level 58
          note = "The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { go = { 1452, 67.61, 41.78 }, text = "Head out of the cave" }, -- level 58
        { turnin = 3783, accept = 977 }, -- level 58
        { complete = 977, -- level 58
          note = "Either the patriarch or the matriarch yetis work. The quest wants yetis; seek them out. Targets are in the cavern and around its entrance too." },
        { go = { 1452, 67.61, 41.78 }, text = "Head out of the cave" }, -- level 58
        { go = { 1452, 65.89, 38.41 }, text = "Climb across the mountain to the far side" }, -- level 58
        { complete = 8464 }, -- level 58
        { complete = 4809, -- level 58
          note = "Hunt the chimaeras." },
        { turnin = 977, accept = 5163 }, -- level 58
        { complete = 5163, useitem = 12928, -- level 58
          note = "Target Legacki with the item." },
        { turnin = 4809 }, -- level 58
        { talk = 13917, collect = { { 12663, 1 }, { 11173, 1 }, { 11172, 11 } }, spots = { { 1452, 61.51, 36.91 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 8464 }, -- level 58
        { go = { 1450, 48.06, 67.4 }, fly = true, talk = 10897, text = "Fly to Moonglade" }, -- level 58
        { turnin = 6762, accept = 1124, -- level 58
          note = "The NPC is indoors." },
        { go = { 1450, 51.74, 45.12 }, text = "Head indoors" }, -- level 58
        { talk = 11801, -- level 58
          note = "The NPC is indoors. Wait for the talking to finish" },
        { accept = 5527, -- level 58
          note = "The NPC is indoors." },
        { turnin = 4084, accept = 4005, -- level 58
          note = "The NPC is indoors." },
        { turnin = 4986, -- level 58
          note = "The NPC is indoors, on the central storey." },
        { complete = 5163, useitem = 12928, -- level 59
          note = "Target Sprinkle with it." },
        { collect = { { 11173, 1 }, { 11172, 11 }, { 11169, 1 } }, useitem = 11617 }, -- level 59
        { go = { 1446, 68.56, 41.43 }, text = "Head down the passage that opens on Lost Rigger Cove" }, -- level 59
        { complete = 4005, useitem = 11169, -- level 59
          note = "Wait for the talking to finish" },
        { go = { 1446, 69.69, 42.33 }, text = "Take the passage out of Lost Rigger Cove" }, -- level 59
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 59
        { turnin = 4005, accept = 3961, -- level 59
          note = "Your targets are within the cavern." },
        { destroy = { 11173, 11172, 11169 } }, -- level 59
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 59
        { turnin = 3961 }, -- level 59
        { complete = 5163, useitem = 12928, -- level 59
          note = "Target Quixxil with it." },
    },
})
