-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/50_SearingGorge.lua.
-- Simulated: level 48 (31%) -> 48 (97%), 13 quests turned in, about 2 h 19 (38 695 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-50-searinggorge",
    pack     = "ding-zones",
    title    = "Searing Gorge (48)",
    faction  = "Alliance",
    minLevel = 48, maxLevel = 48,
    next     = "alliance-50-blastedlands",
    steps    = {
        { accept = 3441, -- level 48
          note = "Searing Gorge is south of Loch Modan, through the Badlands." },
        { complete = 3441 }, -- level 48
        { turnin = 3441, accept = 3442 }, -- level 48
        { accept = { 7728, 7729, 7727, 7723, 7724, 7722 } }, -- level 48
        { complete = 7729 }, -- level 48
        { accept = 4451, optional = true, -- level 48
          note = "If the starting item dropped: use it from your bags." },
        { complete = 3442 }, -- level 48
        { accept = 3367 }, -- level 48
        { turnin = 4451, optional = true }, -- level 48
        { complete = 3367 }, -- level 48
        { turnin = 3367, accept = 3368 }, -- level 48
        { complete = 7727 }, -- level 48
        { accept = 3377 }, -- level 48
        { complete = 3377 }, -- level 48
        { turnin = 3377 }, -- level 48
        { complete = { 7724, 7728, 7723 } }, -- level 48
        { turnin = 3442, accept = 3443 }, -- level 48
        { complete = 3443 }, -- level 48
        { turnin = 3443 }, -- level 48
        { complete = 7722 }, -- level 48
        { turnin = { 7722, 7729, 7728, 7724, 7723, 7727 } }, -- level 48
        { turnin = 3368 }, -- level 48
    },
})
