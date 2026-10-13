-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/29_ThousandNeedles.lua.
-- Simulated: level 28 (77%) -> 30 (27%), 18 quests turned in, about 2 h 40 (19 364 XP per hour), plus up to 1 h 22 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-29-needles",
    pack     = "ding-zones",
    title    = "Thousand Needles (28-30)",
    faction  = "Horde",
    minLevel = 28, maxLevel = 30,
    next     = "horde-31-hillsbrad",
    steps    = {
        { accept = { 4841, 5147, 4821, 4767 }, -- level 28
          note = "Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base." },
        { accept = 1149 }, -- level 28
        { complete = 4841 }, -- level 28
        { complete = 5147 }, -- level 28
        { accept = 4904 }, -- level 28
        { accept = 4542 }, -- level 28
        { turnin = 5881 }, -- level 28
        { complete = 1149 }, -- level 28
        { complete = 4821 }, -- level 28
        { turnin = 4821, accept = 4865 }, -- level 28
        { turnin = { 4542, 4841 }, accept = { 5064, 98070 } }, -- level 29
        { sethearth = "Freewind Post" }, -- level 29
        { complete = 98070 }, -- level 29
        { accept = 4770 }, -- level 29
        { complete = { 4767, 4770 } }, -- level 29
        { turnin = { 4770, 4865 }, accept = 5062 }, -- level 29
        { complete = { 4904, 5062, 5064 } }, -- level 29
        { turnin = 4767 }, -- level 29
        { turnin = 5062 }, -- level 29
        { hearth = true }, -- level 29
        { turnin = { 98070, 4904, 5064, 5147 } }, -- level 29
        { turnin = 1149, accept = 1150 }, -- level 29
        { accept = { 1110, 1104, 1105 } }, -- level 29
        { accept = 1176 }, -- level 29
        { complete = 1110 }, -- level 29
        { complete = 1105 }, -- level 29
        { turnin = { 1105, 1110 } }, -- level 29
        { level = 30,
          note = "Finish the level on nearby monsters before moving on." },
        { hearth = true }, -- level 30
        { complete = 1150 }, -- level 30
        { turnin = 1150 }, -- level 30
        { complete = 1104 }, -- level 30
        { complete = 1176 }, -- level 30
        { turnin = 1176 }, -- level 30
        { turnin = 1104 }, -- level 30
    },
})
