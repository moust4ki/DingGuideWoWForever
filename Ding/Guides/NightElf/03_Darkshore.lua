-- Drafted by tools/draft_guide.lua from tools/routes/nightelf.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/NightElf/03_Darkshore.lua.
-- Simulated: level 11 (74%) -> 19 (74%), 56 quests turned in, about 6 h 58 (13 441 XP per hour), plus up to 3 h 43 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "nightelf-03-darkshore",
    pack     = "ding-zones",
    title    = "Darkshore (11-19)",
    faction  = "Alliance",
    races    = { "NightElf" },
    minLevel = 11, maxLevel = 19,
    next     = "nightelf-04-lochmodan",
    steps    = {
        { accept = { 958, 954 }, -- level 11
          note = "Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore." },
        { accept = { 983, 3524 } }, -- level 11
        { complete = { 983, 3524 } }, -- level 11
        { turnin = 983, accept = 1001 }, -- level 12
        { turnin = 3524, accept = 4681 }, -- level 12
        { complete = 4681 }, -- level 12
        { turnin = { 4681, 6342 }, accept = { 6343, 98025 } }, -- level 12
        { accept = { 4811, 2118 } }, -- level 12
        { accept = 984 }, -- level 12
        { complete = 984 }, -- level 12
        { accept = 953 }, -- level 12
        { complete = 953 }, -- level 12
        { accept = 4728 }, -- level 12
        { complete = 1001 }, -- level 12
        { accept = 4722 }, -- level 12
        { turnin = 953 }, -- level 12
        { complete = { 958, 98025 } }, -- level 12
        { complete = 4811 }, -- level 12
        { turnin = { 4722, 4728 } }, -- level 12
        { turnin = { 4811, 98025 }, accept = 4812 }, -- level 12
        { complete = 4812 }, -- level 12
        { turnin = 984, accept = { 985, 4761 } }, -- level 13
        { turnin = 4761, accept = 4762 }, -- level 13
        { turnin = 1001, accept = 1002 }, -- level 13
        { accept = 4723 }, -- level 13
        { complete = 954 }, -- level 13
        { turnin = 954, accept = 955 }, -- level 13
        { complete = 955 }, -- level 13
        { turnin = 955, accept = 956 }, -- level 13
        { complete = 956 }, -- level 13
        { turnin = 956, accept = 957 }, -- level 13
        { turnin = 4812, accept = 4813 }, -- level 13
        { complete = { 985, 2118 } }, -- level 13
        { complete = 957 }, -- level 13
        { complete = 1002 }, -- level 13
        { hearth = true }, -- level 13
        { turnin = 6343 }, -- level 13
        { turnin = 4723 }, -- level 14
        { turnin = { 4813, 2118 }, accept = 2138 }, -- level 14
        { accept = 4727 }, -- level 14
        { turnin = 1002 }, -- level 14
        { complete = 4762 }, -- level 14
        { complete = 2138 }, -- level 14
        { turnin = { 985, 2138 } }, -- level 14
        { level = 16,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 2139 }, -- level 16
        { accept = 947 }, -- level 16
        { sethearth = "Auberdine" }, -- level 16
        { accept = { 1138, 963 } }, -- level 16
        { accept = 982 }, -- level 16
        { turnin = { 4762, 958 }, accept = 4763 }, -- level 16
        { complete = 982 }, -- level 16
        { complete = 1138 }, -- level 16
        { accept = 1003 }, -- level 16
        { complete = 947 }, -- level 16
        { hearth = true }, -- level 16
        { accept = 4740 }, -- level 16
        { turnin = 947, accept = 948 }, -- level 16
        { turnin = 982 }, -- level 16
        { turnin = 957 }, -- level 16
        { complete = 963 }, -- level 16
        { turnin = 948, accept = 944 }, -- level 16
        { complete = 944 }, -- level 16
        { turnin = 944, accept = 949 }, -- level 16
        { turnin = 949, accept = { 98042, 950 } }, -- level 16
        { complete = 1003 }, -- level 16
        { turnin = 950 }, -- level 16
        { turnin = 1003 }, -- level 16
        { turnin = { 1138, 963 } }, -- level 16
        { accept = 965 }, -- level 16
        { turnin = 965, accept = 966 }, -- level 17
        { complete = { 4763, 2139, 98042 } }, -- level 17
        { complete = 966 }, -- level 17
        { turnin = 966 }, -- level 17
        { accept = 4725 }, -- level 17
        { turnin = { 4763, 98042 } }, -- level 17
        { turnin = 2139 }, -- level 17
        { accept = 4730 }, -- level 17
        { accept = { 4731, 4732 } }, -- level 17
        { accept = 4733 }, -- level 17
        { hearth = true }, -- level 17
        { turnin = { 4730, 4727, 4731, 4732, 4733, 4725 } }, -- level 17
        { level = 18,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 87760 }, -- level 18
        { accept = 729 }, -- level 18
        { accept = 986 }, -- level 18
        { complete = 4740 }, -- level 18
        { turnin = 729, accept = 731 }, -- level 18
        { complete = 731 }, -- level 18
        { complete = 986 }, -- level 18
        { accept = { 98013, 951 } }, -- level 18
        { hearth = true }, -- level 18
        { turnin = 4740 }, -- level 18
        { turnin = 986, accept = 993 }, -- level 18
        { accept = 2098 }, -- level 18
        { complete = 2098 }, -- level 18
        { turnin = 993, accept = 995 }, -- level 19
        { complete = 995 }, -- level 19
        { hearth = true }, -- level 19
        { turnin = 731 }, -- level 19
        { turnin = 995 }, -- level 19
        { complete = 87760 }, -- level 19
        { turnin = 2098 }, -- level 19
        { complete = { 98013, 951 } }, -- level 19
        { turnin = { 98013, 951 } }, -- level 19
        { turnin = 87760 }, -- level 19
    },
})
