-- Drafted by tools/draft_guide.lua from tools/routes/human.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Human/03_Westfall.lua.
-- Simulated: level 12 (0%) -> 16 (46%), 28 quests turned in, about 4 h 20 (12 841 XP per hour).
Ding.RegisterGuide({
    id       = "human-03-westfall",
    pack     = "ding-zones",
    title    = "Westfall (12-16)",
    faction  = "Alliance",
    races    = { "Human" },
    minLevel = 12, maxLevel = 16,
    next     = "human-04-lochmodan",
    steps    = {
        { accept = { 64, 36, 151 }, -- level 12
          note = "Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall." },
        { accept = 22 }, -- level 12
        { accept = { 6181, 12, 102 } }, -- level 12
        { turnin = 6181, accept = 6281 }, -- level 12
        { complete = 12 }, -- level 12
        { turnin = 12, accept = 13 }, -- level 12
        { complete = 22 }, -- level 12
        { turnin = { 36, 22 }, accept = 38 }, -- level 12
        { complete = { 102, 151 } }, -- level 12
        { accept = 9 }, -- level 13
        { complete = 38 }, -- level 13
        { accept = 92910, optional = true, -- level 13
          note = "If the starting item dropped: use it from your bags." },
        { complete = 9 }, -- level 13
        { turnin = 92910, optional = true }, -- level 13
        { accept = { 92911, 92909 } }, -- level 13
        { complete = 92909 }, -- level 13
        { turnin = { 9, 38 } }, -- level 13
        { complete = 92911 }, -- level 13
        { accept = 136 }, -- level 14
        { turnin = { 92911, 92909 } }, -- level 14
        { accept = 153 }, -- level 14
        { sethearth = "Sentinel Hill" }, -- level 14
        { accept = { 92747, 92744, 92745, 92748 } }, -- level 14
        { complete = { 153, 92747 } }, -- level 14
        { accept = 103 }, -- level 14
        { turnin = 136, accept = 138 }, -- level 14
        { complete = 13 }, -- level 14
        { hearth = true }, -- level 14
        { turnin = { 102, 109, 13 }, accept = 14 }, -- level 15
        { turnin = 138, accept = 139 }, -- level 15
        { complete = 103 }, -- level 15
        { turnin = 103 }, -- level 15
        { complete = 92745 }, -- level 15
        { turnin = 139, accept = 140 }, -- level 15
        { turnin = 140 }, -- level 15
        { complete = 92744 }, -- level 15
        { complete = 64 }, -- level 15
        { turnin = { 151, 64 } }, -- level 15
        { turnin = 6281 }, -- level 15
        { turnin = { 153, 92747, 92744, 92745 }, accept = 92753 }, -- level 16
        { accept = 92819 }, -- level 16
        { turnin = { 92819, 92753 } }, -- level 16
        { complete = 14 }, -- level 16
        { hearth = true }, -- level 16
        { turnin = 14 }, -- level 16
        { turnin = 92748 }, -- level 16
    },
})
