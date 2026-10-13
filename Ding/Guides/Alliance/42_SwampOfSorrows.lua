-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/42_SwampOfSorrows.lua.
-- Simulated: level 41 (12%) -> 41 (33%), 6 quests turned in, about 39 min (29 807 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-42-swamp",
    pack     = "ding-zones",
    title    = "Swamp of Sorrows (41)",
    faction  = "Alliance",
    minLevel = 41, maxLevel = 41,
    next     = "alliance-43-stv",
    steps    = {
        { accept = 1396, -- level 41
          note = "The Swamp of Sorrows is east of Deadwind Pass, south of Redridge." },
        { complete = 1396 }, -- level 41
        { turnin = 1396, accept = { 1421, 93176 } }, -- level 41
        { turnin = 93176 }, -- level 41
        { accept = 1389 }, -- level 41
        { complete = 1421 }, -- level 41
        { accept = 1393 }, -- level 41
        { complete = { 1389, 1393 } }, -- level 41
        { turnin = 1393 }, -- level 41
        { turnin = 1421, accept = 1398 }, -- level 41
        { complete = 1398 }, -- level 41
        { turnin = 1398 }, -- level 41
        { turnin = 1389 }, -- level 41
    },
})
