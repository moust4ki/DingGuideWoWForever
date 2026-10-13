-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/49_SearingGorge.lua.
-- Simulated: level 49 (5%) -> 50 (5%), 13 quests turned in, about 3 h 06 (29 283 XP per hour), plus up to 3 h 31 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-49-searinggorge",
    pack     = "ding-zones",
    title    = "Searing Gorge (49-50)",
    faction  = "Horde",
    minLevel = 49, maxLevel = 50,
    next     = "horde-50-ungoro",
    steps    = {
        { accept = 3441, -- level 49
          note = "Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge." },
        { accept = { 7728, 7729, 7723, 7724, 7727, 7722 } }, -- level 49
        { complete = 3441 }, -- level 49
        { turnin = 3441, accept = 3442 }, -- level 49
        { complete = { 7722, 7729 } }, -- level 49
        { accept = 4451, optional = true, -- level 49
          note = "If the starting item dropped: use it from your bags." },
        { complete = 7727 }, -- level 49
        { complete = 3442 }, -- level 49
        { turnin = 4451, optional = true }, -- level 49
        { accept = 4449 }, -- level 49
        { complete = 7728 }, -- level 49
        { complete = { 7723, 7724 } }, -- level 49
        { turnin = { 7723, 7724, 7727, 7728, 7729, 7722 } }, -- level 49
        { turnin = 3442, accept = 3443 }, -- level 49
        { complete = 3443 }, -- level 49
        { turnin = 3443 }, -- level 49
        { complete = 4449 }, -- level 49
        { turnin = 4449 }, -- level 49
        { level = 50,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 4296, 4726 } }, -- level 50
        { complete = 4726 }, -- level 50
        { complete = 4296 }, -- level 50
        { turnin = { 4296, 4726 } }, -- level 50
    },
})
