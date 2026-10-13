-- Drafted by tools/draft_guide.lua from tools/routes/skyborne_horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Skyborne/02.lua.
-- Simulated: level 1 (0%) -> 13 (66%), 96 quests turned in, about 5 h 19 (10 703 XP per hour), plus up to 56 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "leveling-s02-skyborne-horde",
    title    = "Skyborne start (1-13)",
    faction  = "Horde",
    races    = { "Skyborne" },
    minLevel = 1, maxLevel = 13,
    next     = "leveling-h04-silverpine-forest",
    steps    = {
        { accept = 92460, -- level 1
          note = "Everything starts on Zephras Isle: follow the arrow from NPC to NPC." },
        { turnin = 92460, accept = { 92461, 92462 } }, -- level 1
        { complete = { 92462, 92461 } }, -- level 1
        { accept = 94414 }, -- level 2
        { complete = 94414 }, -- level 2
        { turnin = 94414, accept = 92474 }, -- level 2
        { turnin = 92462 }, -- level 2
        { complete = 92474 }, -- level 2
        { accept = { 92463, 92598 } }, -- level 2
        { turnin = { 92461, 92474 }, accept = { 92464, 93552 } }, -- level 2
        { complete = { 93552, 92463 } }, -- level 2
        { accept = 92465 }, -- level 2
        { complete = { 92598, 92465 } }, -- level 2
        { turnin = { 92464, 92465 }, accept = 92469 }, -- level 3
        { turnin = { 93552, 92463, 92598, 92469 }, accept = 92471 }, -- level 4
        { turnin = 92471, accept = { 92470, 92473 } }, -- level 4
        { complete = 92473 }, -- level 4
        { accept = 92544 }, -- level 4
        { complete = { 92544, 92470 } }, -- level 4
        { turnin = 92470, accept = { 92472, 96638 } }, -- level 5
        { turnin = 92473 }, -- level 5
        { turnin = 92544 }, -- level 5
        { turnin = 96638, accept = 96101 }, -- level 5
        { complete = 96101 }, -- level 5
        { turnin = 96101, accept = { 97963, 97971, 96646, 97967, 97964, 97972, 97970, 97965, 97968, 92595 } }, -- level 5
        { complete = 92595 }, -- level 5
        { turnin = 92595, accept = { 94411, 98284, 97969 } }, -- level 5
        { sethearth = "Coriella Calmbreeze" }, -- level 5
        { complete = 97971 }, -- level 5
        { turnin = 97971 }, -- level 5
        { complete = 98284 }, -- level 5
        { turnin = 98284 }, -- level 5
        { complete = 97963 }, -- level 5
        { turnin = 97963 }, -- level 5
        { complete = 94411 }, -- level 5
        { complete = 97967 }, -- level 5
        { turnin = 97967 }, -- level 5
        { complete = 97965 }, -- level 5
        { turnin = { 97965, 94411 } }, -- level 5
        { complete = 96646 }, -- level 6
        { turnin = 96646 }, -- level 6
        { complete = 97964 }, -- level 6
        { turnin = 97964 }, -- level 6
        { complete = 97972 }, -- level 6
        { turnin = 97972 }, -- level 6
        { complete = 97970 }, -- level 6
        { turnin = { 97970, 92472 }, accept = 92514 }, -- level 6
        { complete = 97969 }, -- level 6
        { turnin = 97969 }, -- level 6
        { accept = 98285 }, -- level 6
        { complete = 98285 }, -- level 6
        { turnin = 98285 }, -- level 6
        { level = 7,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 92679, 93317 } }, -- level 7
        { complete = 93317 }, -- level 7
        { complete = 92679 }, -- level 7
        { turnin = 93317 }, -- level 7
        { turnin = 92679, accept = { 92683, 92682, 92684 } }, -- level 7
        { complete = { 92683, 92684 } }, -- level 7
        { accept = 92698 }, -- level 7
        { complete = 92682 }, -- level 7
        { turnin = { 92682, 92683, 92684 }, accept = 92685 }, -- level 7
        { complete = 92685 }, -- level 7
        { turnin = 92685, accept = 92693 }, -- level 8
        { complete = 92693 }, -- level 8
        { turnin = 92693, accept = 92703 }, -- level 8
        { turnin = 92698 }, -- level 8
        { complete = 97968 }, -- level 8
        { turnin = 97968 }, -- level 8
        { turnin = 92703 }, -- level 8
        { level = 9,
          note = "Finish the level on nearby monsters before moving on." },
        { hearth = true }, -- level 9
        { complete = 92514 }, -- level 9
        { turnin = 92514, accept = { 92517, 93951, 92515, 92516, 93319, 93318, 92553 } }, -- level 9
        { complete = { 92517, 93319 } }, -- level 9
        { turnin = 92517, accept = 93036 }, -- level 9
        { turnin = 93036, accept = 92529 }, -- level 9
        { turnin = 92529, accept = 92528 }, -- level 9
        { complete = 92528 }, -- level 9
        { turnin = 92528, accept = { 92550, 93926 } }, -- level 9
        { complete = { 93318, 92515, 92516 } }, -- level 9
        { complete = { 93951, 92553 } }, -- level 9
        { complete = 93926 }, -- level 9
        { turnin = 93926, accept = 93927 }, -- level 9
        { complete = 93927 }, -- level 9
        { complete = 92550 }, -- level 9
        { turnin = { 93319, 92516, 92553, 92515, 93951, 93927, 92550 }, accept = { 93948, 92579 } }, -- level 10
        { accept = 94007, classes = { "HUNTER" } }, -- level 10
        { turnin = 94007, classes = { "HUNTER" } }, -- level 10
        { accept = 97243, classes = { "SHAMAN" } }, -- level 10
        { turnin = 97243, classes = { "SHAMAN" } }, -- level 10
        { turnin = 93318, accept = 92551 }, -- level 10
        { complete = 92551 }, -- level 10
        { accept = 98512 }, -- level 10
        { complete = 98512 }, -- level 10
        { turnin = 98512 }, -- level 10
        { sethearth = "Donaal Downbreeze" }, -- level 10
        { accept = 94896 }, -- level 10
        { accept = 94006, classes = { "DRUID" } }, -- level 10
        { turnin = 94006, classes = { "DRUID" } }, -- level 10
        { turnin = { 93948, 92579 }, accept = { 93949, 92700 } }, -- level 10
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
        { turnin = 92700, accept = { 93735, 92708 } }, -- level 10
        { accept = 94013, classes = { "HUNTER" } }, -- level 10
        { complete = 94013, classes = { "HUNTER" } }, -- level 10
        { turnin = 94013, classes = { "HUNTER" } }, -- level 10
        { accept = 94050, classes = { "HUNTER" } }, -- level 10
        { turnin = 94050, classes = { "HUNTER" } }, -- level 10
        { complete = 92708 }, -- level 10
        { turnin = 92708, accept = 93736 }, -- level 10
        { turnin = 93735, accept = 93737 }, -- level 10
        { complete = 93737 }, -- level 10
        { complete = 93736 }, -- level 10
        { accept = 93159 }, -- level 11
        { complete = 93159 }, -- level 11
        { turnin = 93159, accept = { 93172, 93160 } }, -- level 11
        { complete = 93160 }, -- level 11
        { accept = 94493 }, -- level 11
        { turnin = 94493, accept = { 94487, 94485, 94486 } }, -- level 11
        { complete = { 94487, 94486, 94485 } }, -- level 11
        { turnin = { 94486, 94487, 94485 }, accept = { 94489, 94488 } }, -- level 11
        { complete = { 94896, 93172 } }, -- level 11
        { turnin = { 93172, 93160 } }, -- level 11
        { turnin = 92551 }, -- level 12
        { hearth = true }, -- level 12
        { turnin = 93737, accept = 93738 }, -- level 12
        { turnin = 93738, accept = 93746 }, -- level 12
        { complete = 93746 }, -- level 12
        { turnin = { 93736, 93746 }, accept = { 92871, 93740 } }, -- level 12
        { turnin = 92871, accept = 93320 }, -- level 12
        { turnin = 93320, accept = { 92645, 92642 } }, -- level 12
        { accept = 94638, classes = { "DRUID" } }, -- level 12
        { complete = 94638, classes = { "DRUID" } }, -- level 12
        { turnin = 94638, classes = { "DRUID" } }, -- level 12
        { complete = { 92642, 92645 } }, -- level 12
        { turnin = { 92642, 92645 }, accept = 92880 }, -- level 12
        { turnin = 92880, accept = 92881 }, -- level 12
        { turnin = 92881, accept = 92643 }, -- level 12
        { complete = 92643 }, -- level 12
        { turnin = 92643, accept = 92644 }, -- level 12
        { complete = 94488 }, -- level 12
        { accept = 94490, optional = true, -- level 12
          note = "If the starting item dropped: use it from your bags." },
        { complete = 94489 }, -- level 12
        { accept = 93165 }, -- level 12
        { complete = { 93740, 93165 } }, -- level 12
        { turnin = 93165 }, -- level 12
        { turnin = { 94489, 94488 } }, -- level 12
        { turnin = 94490, optional = true }, -- level 12
        { accept = 94491, classes = { "DRUID" } }, -- level 12
        { turnin = 94491, classes = { "DRUID" } }, -- level 12
        { turnin = { 94896, 92644 }, accept = 94568 }, -- level 13
        { complete = 94568 }, -- level 13
        { turnin = 94568, accept = 92640 }, -- level 13
        { complete = 92640 }, -- level 13
        { turnin = 93740 }, -- level 13
        { turnin = { 92640, 93949 }, accept = 93065 }, -- level 13
        { complete = 93065 }, -- level 13
        { turnin = 93065, accept = 92947 }, -- level 13
        { complete = 92947 }, -- level 13
        { turnin = 92947, accept = 93958 }, -- level 13
        { turnin = 93958, accept = 92646 }, -- level 13
        { complete = 92646 }, -- level 13
        { hearth = true }, -- level 13
        { turnin = 92646, accept = 93836 }, -- level 13
        { complete = 93836 }, -- level 13
        { turnin = 93836, accept = 93090 }, -- level 13
        { turnin = 93090 }, -- level 13
        { accept = 95349 }, -- level 13
        { turnin = 95349 }, -- level 13
    },
})
