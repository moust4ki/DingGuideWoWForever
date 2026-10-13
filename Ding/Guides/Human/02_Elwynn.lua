-- Drafted by tools/draft_guide.lua from tools/routes/human.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Human/02_Elwynn.lua.
-- Simulated: level 5 (82%) -> 11 (71%), 53 quests turned in, about 2 h 56 (11 928 XP per hour), plus up to 25 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "human-02-elwynn",
    pack     = "ding-zones",
    title    = "Elwynn Forest (5-12)",
    faction  = "Alliance",
    races    = { "Human" },
    minLevel = 5, maxLevel = 12,
    next     = "human-03-westfall",
    steps    = {
        { accept = { 95998, 60 }, -- level 5
          note = "Goldshire is your base for the whole forest: inn, class trainers and quests." },
        { complete = 95998 }, -- level 5
        { turnin = 95998, accept = { 97925, 96626, 97919, 97915, 97924, 97920, 97916, 97922, 97921 } }, -- level 5
        { complete = 97924 }, -- level 5
        { turnin = 97924, accept = 91751 }, -- level 5
        { complete = 97922 }, -- level 5
        { turnin = 97922, accept = 99127 }, -- level 6
        { complete = 97920 }, -- level 6
        { turnin = 97920, accept = 99143 }, -- level 6
        { complete = 99127 }, -- level 6
        { turnin = 99127, accept = 99128 }, -- level 6
        { complete = { 99128, 99143 } }, -- level 6
        { complete = 91751 }, -- level 6
        { turnin = 99128, accept = 99129 }, -- level 6
        { turnin = 91751 }, -- level 6
        { accept = 62 }, -- level 6
        { turnin = 99129, accept = { 47, 99130 } }, -- level 6
        { accept = 106 }, -- level 6
        { turnin = 106, accept = 111 }, -- level 7
        { accept = 85 }, -- level 7
        { complete = 99130 }, -- level 7
        { turnin = 85, accept = 86 }, -- level 7
        { complete = 86 }, -- level 7
        { accept = 88 }, -- level 7
        { turnin = 86, accept = 84 }, -- level 7
        { turnin = 111, accept = 107 }, -- level 7
        { turnin = 84, accept = 87 }, -- level 7
        { complete = { 62, 47, 60 } }, -- level 7
        { turnin = { 47, 99130 }, accept = { 99131, 40 } }, -- level 8
        { turnin = { 62, 40 }, accept = { 35, 76 } }, -- level 8
        { turnin = { 107, 60 }, accept = 112 }, -- level 8
        { sethearth = "Goldshire" }, -- level 8
        { complete = 96626 }, -- level 8
        { turnin = 96626 }, -- level 8
        { accept = { 91725, 91723 } }, -- level 8
        { complete = 88 }, -- level 8
        { turnin = 35, accept = { 52, 37 } }, -- level 8
        { turnin = 37, accept = 45 }, -- level 8
        { turnin = 45, accept = 71 }, -- level 8
        { accept = { 91732, 5545 } }, -- level 8
        { accept = 83 }, -- level 8
        { turnin = 71, accept = 39 }, -- level 8
        { complete = 91725 }, -- level 8
        { complete = { 91732, 76, 91723 } }, -- level 8
        { complete = 112 }, -- level 8
        { turnin = { 99143, 99131 } }, -- level 8
        { turnin = { 76, 39 }, accept = { 59, 239 } }, -- level 9
        { turnin = 112, accept = { 114, 61 } }, -- level 9
        { complete = 97919 }, -- level 9
        { turnin = 97919 }, -- level 9
        { complete = 97921 }, -- level 9
        { turnin = 97921 }, -- level 9
        { complete = 97915 }, -- level 9
        { turnin = 97915 }, -- level 9
        { turnin = 61 }, -- level 9
        { hearth = true }, -- level 9
        { complete = 97916 }, -- level 9
        { turnin = 97916 }, -- level 9
        { turnin = 239, accept = 11 }, -- level 9
        { complete = 11 }, -- level 9
        { accept = 123 }, -- level 9
        { accept = 109 }, -- level 9
        { turnin = 11 }, -- level 9
        { turnin = 123, accept = 147 }, -- level 10
        { turnin = { 91725, 91723 }, accept = 91724 }, -- level 10
        { complete = 147 }, -- level 10
        { accept = { 46, 91733 } }, -- level 10
        { complete = 52 }, -- level 10
        { complete = 46 }, -- level 10
        { accept = 91740, optional = true, -- level 10
          note = "If the starting item dropped: use it from your bags." },
        { complete = { 83, 91724 } }, -- level 10
        { complete = 5545 }, -- level 10
        { turnin = { 91732, 5545 } }, -- level 10
        { turnin = { 59, 83 } }, -- level 10
        { complete = 97925 }, -- level 10
        { turnin = 97925 }, -- level 10
        { turnin = 91740, optional = true }, -- level 11
        { complete = 91733 }, -- level 11
        { turnin = { 91733, 52, 46 } }, -- level 11
        { turnin = 91724 }, -- level 11
        { hearth = true }, -- level 11
        { turnin = 147 }, -- level 11
        { complete = 87 }, -- level 11
        { turnin = 114 }, -- level 11
        { turnin = { 88, 87 } }, -- level 11
        { level = 12,
          note = "Finish the level on nearby monsters before moving on." },
    },
})
