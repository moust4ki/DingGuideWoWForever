-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/33_Desolace.lua.
-- Simulated: level 32 (78%) -> 34 (51%), 12 quests turned in, about 3 h 05 (18 476 XP per hour), plus up to 4 h 18 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-33-desolace",
    pack     = "ding-zones",
    title    = "Desolace (32-34)",
    faction  = "Horde",
    minLevel = 32, maxLevel = 34,
    next     = "horde-35-stv",
    steps    = {
        { level = 33,
          note = "Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast. Finish the level on nearby monsters before moving on." },
        { accept = 1365 }, -- level 33
        { accept = 5561 }, -- level 33
        { complete = 5561 }, -- level 33
        { accept = 5741 }, -- level 33
        { complete = 5741 }, -- level 33
        { accept = 1480 }, -- level 33
        { turnin = 1480, accept = 1481 }, -- level 33
        { accept = 5821 }, -- level 33
        { complete = 1481 }, -- level 33
        { complete = 5821 }, -- level 33
        { turnin = { 5821, 5561 } }, -- level 33
        { turnin = 1481, accept = 1482 }, -- level 33
        { accept = 5763 }, -- level 33
        { accept = 6142 }, -- level 33
        { sethearth = "Shadowprey Village" }, -- level 33
        { complete = 6142 }, -- level 33
        { complete = 1482 }, -- level 33
        { turnin = 5741 }, -- level 33
        { turnin = 1482, accept = 1484 }, -- level 33
        { turnin = 1484 }, -- level 33
        { hearth = true }, -- level 33
        { turnin = 6142 }, -- level 33
        { level = 34,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 6143 }, -- level 34
        { accept = 6161 }, -- level 34
        { complete = { 6161, 6143 } }, -- level 34
        { turnin = 6161 }, -- level 34
        { complete = 1365 }, -- level 34
        { turnin = 1365, accept = 1366 }, -- level 34
        { complete = 1366 }, -- level 34
        { turnin = 1366 }, -- level 34
        { hearth = true }, -- level 34
        { turnin = 6143 }, -- level 34
    },
})
