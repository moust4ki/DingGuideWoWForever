-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/55_BurningSteppes.lua.
-- Simulated: level 54 (6%) -> 54 (39%), 6 quests turned in, about 1 h 40 (35 714 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-55-burningsteppes",
    pack     = "ding-zones",
    title    = "Burning Steppes (54)",
    faction  = "Alliance",
    minLevel = 54, maxLevel = 54,
    next     = "alliance-56-winterspring",
    steps    = {
        { accept = { 4283, 3823 }, -- level 54
          note = "The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone." },
        { accept = { 4726, 4296 } }, -- level 54
        { complete = 4726 }, -- level 54
        { complete = 3823 }, -- level 54
        { turnin = 3823, accept = 3824 }, -- level 54
        { complete = { 3824, 4283 } }, -- level 54
        { complete = 4296 }, -- level 54
        { turnin = { 4296, 4726 }, accept = 4808 }, -- level 54
        { turnin = 3824, accept = 3825 }, -- level 54
        { complete = 3825 }, -- level 54
        { turnin = { 3825, 4283 } }, -- level 54
    },
})
