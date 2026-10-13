-- Drafted by tools/draft_guide.lua from tools/routes/human.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Human/01_Northshire.lua.
-- Simulated: level 1 (0%) -> 5 (82%), 18 quests turned in, about 54 min (7 948 XP per hour).
Ding.RegisterGuide({
    id       = "human-01-northshire",
    pack     = "ding-zones",
    title    = "Northshire (1-5)",
    faction  = "Alliance",
    races    = { "Human" },
    minLevel = 1, maxLevel = 5,
    next     = "human-02-elwynn",
    steps    = {
        { accept = 783, -- level 1
          note = "Everything happens around Northshire Abbey: follow the arrow from NPC to NPC." },
        { turnin = 783, accept = { 7, 33 } }, -- level 1
        { complete = 7 }, -- level 1
        { accept = 91741 }, -- level 2
        { complete = 33 }, -- level 2
        { accept = 18 }, -- level 2
        { turnin = 7, accept = 15 }, -- level 3
        { turnin = 91741, accept = 92124 }, -- level 3
        { turnin = 92124, accept = 91743 }, -- level 3
        { complete = 18 }, -- level 3
        { turnin = 18, accept = { 6, 3903, 5261 } }, -- level 4
        { turnin = { 5261, 33 } }, -- level 4
        { complete = { 15, 91743 } }, -- level 4
        { turnin = 3903, accept = 3904 }, -- level 4
        { complete = { 6, 3904 } }, -- level 4
        { turnin = 15, accept = 21 }, -- level 4
        { turnin = 91743, accept = 91745 }, -- level 4
        { turnin = 91745 }, -- level 4
        { complete = 21 }, -- level 4
        { turnin = 3904, accept = 3905 }, -- level 5
        { turnin = { 3905, 21 }, accept = { 96627, 54 } }, -- level 5
        { turnin = 6 }, -- level 5
        { accept = 2158 }, -- level 5
        { turnin = { 96627, 2158 } }, -- level 5
        { turnin = 54 }, -- level 5
    },
})
