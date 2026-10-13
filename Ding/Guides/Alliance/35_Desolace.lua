-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/35_Desolace.lua.
-- Simulated: level 34 (39%) -> 37 (27%), 15 quests turned in, about 2 h 56 (22 714 XP per hour), plus up to 11 h 35 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-35-desolace",
    pack     = "ding-zones",
    title    = "Desolace (34-37)",
    faction  = "Alliance",
    minLevel = 34, maxLevel = 37,
    next     = "alliance-37-stv",
    steps    = {
        { accept = 1387, -- level 34
          note = "Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone." },
        { sethearth = "Nijel's Point" }, -- level 34
        { accept = 1437 }, -- level 34
        { accept = 5821 }, -- level 34
        { complete = 5821 }, -- level 34
        { accept = 5561 }, -- level 34
        { hearth = true }, -- level 34
        { turnin = 1437, accept = 1465 }, -- level 34
        { accept = 5741 }, -- level 34
        { accept = 6161 }, -- level 34
        { complete = 6161 }, -- level 34
        { complete = 1387 }, -- level 34
        { complete = 5561 }, -- level 34
        { turnin = { 5561, 5821 } }, -- level 34
        { complete = 5741 }, -- level 34
        { turnin = 5741 }, -- level 34
        { turnin = 6161 }, -- level 34
        { hearth = true }, -- level 34
        { turnin = { 1387, 1465 }, accept = 1438 }, -- level 34
        { turnin = 1438, accept = 1439 }, -- level 35
        { complete = 1439 }, -- level 35
        { turnin = 1439, accept = 1440 }, -- level 35
        { complete = 1440 }, -- level 35
        { turnin = 1440 }, -- level 35
        { level = 37,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 261 }, -- level 37
        { accept = 5501 }, -- level 37
        { accept = 6027 }, -- level 37
        { complete = 6027 }, -- level 37
        { turnin = 6027 }, -- level 37
        { accept = 6132 }, -- level 37
        { complete = 6132 }, -- level 37
        { turnin = 6132 }, -- level 37
        { complete = 5501 }, -- level 37
        { accept = 5943 }, -- level 37
        { complete = 261 }, -- level 37
        { complete = 5943 }, -- level 37
        { turnin = 5943 }, -- level 37
        { turnin = 5501 }, -- level 37
        { hearth = true }, -- level 37
        { turnin = 261 }, -- level 37
    },
})
