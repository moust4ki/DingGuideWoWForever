-- Drafted by tools/draft_guide.lua from tools/routes/skyborne_alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Skyborne/01.lua.
-- Simulated: level 1 (0%) -> 13 (66%), 96 quests turned in, about 5 h 10 (11 015 XP per hour), plus up to 1 h 05 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "leveling-s01-skyborne-alliance",
    title    = "Skyborne start (1-13)",
    faction  = "Alliance",
    races    = { "Skyborne" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-a04-westfall",
    steps    = {
        { accept = 92460, -- level 1
          note = "Everything starts on Zephras Isle: follow the arrow from NPC to NPC." },
        { turnin = 92460, accept = { 92461, 92462 } }, -- level 1
        { complete = { 92462, 92461 } }, -- level 1
        { accept = 92474 }, -- level 2
        { turnin = 92461 }, -- level 2
        { complete = 92474 }, -- level 2
        { turnin = 92474, accept = { 92464, 93552 } }, -- level 2
        { turnin = 92462, accept = { 92463, 92597 } }, -- level 2
        { complete = { 93552, 92463 } }, -- level 2
        { turnin = 92464, accept = 92465 }, -- level 2
        { complete = { 92597, 92465 } }, -- level 2
        { turnin = 92465, accept = 92469 }, -- level 3
        { accept = 94414 }, -- level 3
        { complete = 94414 }, -- level 3
        { turnin = { 94414, 92463, 92597, 93552, 92469 }, accept = 92471 }, -- level 4
        { turnin = 92471, accept = { 92470, 92473 } }, -- level 4
        { complete = 92473 }, -- level 4
        { accept = 92544 }, -- level 4
        { complete = { 92544, 92470 } }, -- level 4
        { turnin = 92470, accept = { 96638, 92472 } }, -- level 5
        { turnin = 92473 }, -- level 5
        { turnin = 92544 }, -- level 5
        { turnin = 96638, accept = 96101 }, -- level 5
        { complete = 96101 }, -- level 5
        { turnin = 96101, accept = { 97969, 98286, 97963, 97964, 97967, 97971, 97973, 97970, 97968, 96646, 97965 } }, -- level 5
        { sethearth = "Coriella Calmbreeze" }, -- level 5
        { accept = 98285 }, -- level 5
        { complete = 98285 }, -- level 5
        { turnin = 98285 }, -- level 5
        { complete = 97965 }, -- level 5
        { turnin = 97965 }, -- level 5
        { turnin = 92472, accept = 93461 }, -- level 5
        { level = 7,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 92679 }, -- level 7
        { hearth = true }, -- level 7
        { complete = 97971 }, -- level 7
        { turnin = 97971 }, -- level 7
        { complete = 98286 }, -- level 7
        { turnin = 98286 }, -- level 7
        { complete = 97963 }, -- level 7
        { turnin = 97963 }, -- level 7
        { complete = 96646 }, -- level 7
        { turnin = 96646 }, -- level 7
        { complete = 97969 }, -- level 7
        { turnin = 97969 }, -- level 7
        { complete = 97970 }, -- level 7
        { turnin = 97970 }, -- level 7
        { complete = 97964 }, -- level 7
        { turnin = 97964 }, -- level 7
        { complete = 97973 }, -- level 7
        { turnin = 97973, accept = 92596 }, -- level 7
        { complete = 92596 }, -- level 7
        { turnin = 92596, accept = 94413 }, -- level 7
        { complete = 94413 }, -- level 7
        { turnin = 94413 }, -- level 7
        { accept = 93317 }, -- level 7
        { complete = 93317 }, -- level 7
        { complete = 92679 }, -- level 7
        { turnin = 93317 }, -- level 7
        { turnin = 92679, accept = { 92684, 92682, 92683 } }, -- level 7
        { accept = 92698 }, -- level 7
        { complete = { 92684, 92683, 92682 } }, -- level 7
        { turnin = { 92682, 92684, 92683 }, accept = 92685 }, -- level 8
        { complete = 92685 }, -- level 8
        { turnin = { 92698, 92685 }, accept = 92693 }, -- level 8
        { complete = 92693 }, -- level 8
        { turnin = 92693, accept = 92703 }, -- level 8
        { complete = 97968 }, -- level 8
        { turnin = 97968 }, -- level 8
        { turnin = 92703 }, -- level 8
        { complete = 97967 }, -- level 8
        { turnin = 97967 }, -- level 8
        { complete = 93461 }, -- level 9
        { turnin = 93461, accept = { 92517, 92516, 93319, 92553, 92515, 93951 } }, -- level 9
        { complete = { 92517, 93319 } }, -- level 9
        { turnin = 92517, accept = 93036 }, -- level 9
        { turnin = 93036, accept = 92529 }, -- level 9
        { turnin = 92529, accept = 92528 }, -- level 9
        { complete = 92528 }, -- level 9
        { turnin = 92528, accept = { 92550, 93926, 92551 } }, -- level 9
        { complete = 93926 }, -- level 9
        { turnin = 93926, accept = 93927 }, -- level 9
        { complete = 93927 }, -- level 9
        { complete = { 92516, 93951, 92553, 92515 } }, -- level 9
        { complete = { 92550, 92551 } }, -- level 9
        { turnin = { 92516, 93319, 92553, 92515, 93951, 92551, 93927, 92550 }, accept = { 93948, 92701 } }, -- level 10
        { accept = 94007, classes = { "HUNTER" } }, -- level 10
        { turnin = 94007, classes = { "HUNTER" } }, -- level 10
        { accept = 98512 }, -- level 10
        { complete = 98512 }, -- level 10
        { turnin = 98512 }, -- level 10
        { accept = 94896 }, -- level 10
        { accept = 93791, classes = { "MAGE" } }, -- level 10
        { turnin = 93791, classes = { "MAGE" } }, -- level 10
        { accept = 93797, classes = { "MAGE" } }, -- level 10
        { complete = 93797, classes = { "MAGE" } }, -- level 10
        { turnin = 93797, classes = { "MAGE" } }, -- level 10
        { accept = 94006, classes = { "DRUID" } }, -- level 10
        { turnin = 94006, classes = { "DRUID" } }, -- level 10
        { turnin = { 93948, 92701 }, accept = { 92699, 93949 } }, -- level 10
        { turnin = 92699, accept = 92709 }, -- level 10
        { complete = 92709 }, -- level 10
        { turnin = 92709, accept = 92727 }, -- level 10
        { turnin = 92727, accept = 92849 }, -- level 10
        { complete = 92849 }, -- level 10
        { turnin = 92849, accept = 92850 }, -- level 10
        { complete = 92850 }, -- level 10
        { complete = 93949 }, -- level 10
        { accept = 94003, classes = { "WARRIOR" } }, -- level 10
        { complete = 94003, classes = { "WARRIOR" } }, -- level 10
        { turnin = 94003, classes = { "WARRIOR" } }, -- level 10
        { accept = 94978, classes = { "HUNTER" } }, -- level 10
        { complete = 94978, classes = { "HUNTER" } }, -- level 10
        { turnin = 94978, classes = { "HUNTER" } }, -- level 10
        { accept = 94979, classes = { "HUNTER" } }, -- level 10
        { complete = 94979, classes = { "HUNTER" } }, -- level 10
        { turnin = 94979, classes = { "HUNTER" } }, -- level 10
        { turnin = 92850, accept = 99260 }, -- level 11
        { turnin = 99260, accept = 92840 }, -- level 11
        { hearth = true }, -- level 11
        { accept = 93159 }, -- level 11
        { complete = 93159 }, -- level 11
        { turnin = 93159, accept = { 93160, 93172 } }, -- level 11
        { complete = 93160 }, -- level 11
        { accept = 94493 }, -- level 11
        { turnin = 94493, accept = { 94485, 94486, 94487 } }, -- level 11
        { complete = { 94487, 94486, 94485 } }, -- level 11
        { turnin = { 94487, 94485, 94486 }, accept = { 94489, 94488 } }, -- level 11
        { complete = 94488 }, -- level 11
        { accept = 94490, optional = true, -- level 11
          note = "If the starting item dropped: use it from your bags." },
        { complete = 94489 }, -- level 11
        { accept = 93165 }, -- level 11
        { turnin = 94488 }, -- level 11
        { turnin = 94490, optional = true }, -- level 11
        { accept = 94491, classes = { "DRUID" } }, -- level 11
        { turnin = 94491, classes = { "DRUID" } }, -- level 11
        { turnin = 94489 }, -- level 12
        { complete = { 94896, 93172 } }, -- level 12
        { complete = 92840 }, -- level 12
        { sethearth = "Donaal Downbreeze" }, -- level 12
        { accept = 92741 }, -- level 12
        { turnin = 92840, accept = { 92834, 92860 } }, -- level 12
        { turnin = { 93949, 92860 }, accept = 93320 }, -- level 12
        { turnin = 93320, accept = { 92645, 92642 } }, -- level 12
        { accept = 94638, classes = { "DRUID" } }, -- level 12
        { complete = 94638, classes = { "DRUID" } }, -- level 12
        { turnin = 94638, classes = { "DRUID" } }, -- level 12
        { complete = { 92642, 93165, 92834, 92645 } }, -- level 12
        { turnin = { 92642, 92645 }, accept = 92880 }, -- level 12
        { turnin = 92880, accept = 92881 }, -- level 12
        { turnin = 92881, accept = 92643 }, -- level 12
        { turnin = 94896 }, -- level 12
        { complete = 92643 }, -- level 12
        { turnin = 92643, accept = 92644 }, -- level 12
        { turnin = { 93160, 93172 } }, -- level 12
        { complete = 92741 }, -- level 12
        { turnin = 93165 }, -- level 13
        { hearth = true }, -- level 13
        { turnin = 92644, accept = 94568 }, -- level 13
        { complete = 94568 }, -- level 13
        { turnin = 94568, accept = 92640 }, -- level 13
        { complete = 92640 }, -- level 13
        { turnin = 92640, accept = 93065 }, -- level 13
        { complete = 93065 }, -- level 13
        { accept = 94013, classes = { "HUNTER" } }, -- level 13
        { complete = 94013, classes = { "HUNTER" } }, -- level 13
        { turnin = 94013, classes = { "HUNTER" } }, -- level 13
        { accept = 94050, classes = { "HUNTER" } }, -- level 13
        { turnin = 94050, classes = { "HUNTER" } }, -- level 13
        { turnin = 93065, accept = 92947 }, -- level 13
        { complete = 92947 }, -- level 13
        { turnin = 92947, accept = 93958 }, -- level 13
        { turnin = 93958, accept = 93835 }, -- level 13
        { complete = 93835 }, -- level 13
        { turnin = { 93835, 92834 }, accept = 94369 }, -- level 13
        { turnin = 92741 }, -- level 13
        { complete = 94369 }, -- level 13
        { turnin = 94369, accept = 93089 }, -- level 13
        { turnin = 93089 }, -- level 13
        { accept = 94946 }, -- level 13
        { turnin = 94946, -- level 13
          note = "Dalaran is reached through the Skyborne portal." },
        { go = { 1416, 12.04, 56.21 }, text = "Take the Skyborne portal to Stormwind" }, -- level 13
    },
})
