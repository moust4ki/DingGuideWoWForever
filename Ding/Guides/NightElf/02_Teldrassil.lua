-- Drafted by tools/draft_guide.lua from tools/routes/nightelf.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/NightElf/02_Teldrassil.lua.
-- Simulated: level 6 (38%) -> 11 (74%), 43 quests turned in, about 2 h 55 (11 252 XP per hour).
Ding.RegisterGuide({
    id       = "nightelf-02-dolanaar",
    pack     = "ding-zones",
    title    = "Teldrassil (6-11)",
    faction  = "Alliance",
    races    = { "NightElf" },
    minLevel = 6, maxLevel = 11,
    next     = "nightelf-03-darkshore",
    steps    = {
        { accept = { 87288, 932, 2438, 475 }, -- level 6
          note = "Dolanaar is your base for Teldrassil: inn, class trainers and most quests." },
        { accept = 96606 }, -- level 6
        { complete = 96606 }, -- level 6
        { turnin = 96606, accept = { 97940, 97944, 96634, 97946, 97938, 97942, 97949, 997 } }, -- level 6
        { turnin = 2159 }, -- level 6
        { sethearth = "Dolanaar" }, -- level 6
        { turnin = 928, accept = 929 }, -- level 6
        { complete = 96634 }, -- level 6
        { turnin = 96634 }, -- level 6
        { complete = 97944 }, -- level 6
        { turnin = 97944 }, -- level 6
        { accept = 488 }, -- level 6
        { complete = 929 }, -- level 6
        { turnin = 475, accept = 476 }, -- level 6
        { complete = { 2438, 488 } }, -- level 6
        { turnin = 488 }, -- level 7
        { turnin = 997, accept = { 919, 918 } }, -- level 7
        { turnin = 929, accept = 933 }, -- level 7
        { accept = { 487, 489 } }, -- level 7
        { complete = 87288 }, -- level 7
        { complete = { 919, 918 } }, -- level 7
        { turnin = { 919, 918 }, accept = 922 }, -- level 8
        { complete = 97938 }, -- level 8
        { turnin = 97938, accept = 99046 }, -- level 8
        { turnin = 476, accept = 483 }, -- level 8
        { turnin = 2438 }, -- level 8
        { complete = 487 }, -- level 8
        { accept = 490 }, -- level 8
        { complete = 483 }, -- level 8
        { accept = 2541 }, -- level 8
        { complete = 2541 }, -- level 8
        { turnin = 2541, accept = 2561 }, -- level 8
        { complete = 933 }, -- level 8
        { accept = 930 }, -- level 8
        { hearth = true }, -- level 8
        { turnin = 933, accept = 7383 }, -- level 9
        { turnin = 487 }, -- level 9
        { complete = 489 }, -- level 9
        { complete = 2561 }, -- level 9
        { turnin = 2561 }, -- level 9
        { complete = 490 }, -- level 9
        { accept = 99053 }, -- level 9
        { turnin = 490 }, -- level 9
        { complete = 97949 }, -- level 9
        { turnin = 97949 }, -- level 9
        { complete = 97946 }, -- level 9
        { turnin = 97946 }, -- level 9
        { accept = 937 }, -- level 9
        { turnin = 99046, accept = 99047 }, -- level 9
        { complete = 937 }, -- level 9
        { turnin = 937 }, -- level 9
        { complete = 7383 }, -- level 10
        { accept = 931 }, -- level 10
        { accept = 938 }, -- level 10
        { complete = 97940 }, -- level 10
        { turnin = 97940 }, -- level 10
        { complete = 938 }, -- level 10
        { turnin = 938 }, -- level 10
        { complete = 932 }, -- level 10
        { turnin = 99047 }, -- level 10
        { complete = 97942 }, -- level 10
        { turnin = 97942, accept = 99050 }, -- level 10
        { turnin = 932, accept = 98403 }, -- level 10
        { turnin = 489 }, -- level 10
        { turnin = { 931, 930 }, accept = 2399 }, -- level 10
        { turnin = 2399 }, -- level 10
        { complete = 99050 }, -- level 10
        { turnin = { 87288, 483 }, accept = 486 }, -- level 10
        { turnin = 7383, accept = 935 }, -- level 11
        { complete = 486 }, -- level 11
        { accept = 6341 }, -- level 11
        { turnin = 6341, accept = 6342 }, -- level 11
        { hearth = true }, -- level 11
        { turnin = 99050, accept = 99073 }, -- level 11
        { complete = 98403 }, -- level 11
        { turnin = 99073 }, -- level 11
        { turnin = { 935, 922 } }, -- level 11
        { complete = 99053 }, -- level 11
        { turnin = { 98403, 486, 99053 } }, -- level 11
    },
})
