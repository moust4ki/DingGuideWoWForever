-- Drafted by tools/draft_guide.lua from tools/routes/undead.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Undead/04_Barrens.lua.
-- Simulated: level 15 (37%) -> 20 (33%), 55 quests turned in, about 7 h 20 (12 433 XP per hour).
Ding.RegisterGuide({
    id       = "undead-04-barrens",
    pack     = "ding-zones",
    title    = "The Barrens (15-20)",
    faction  = "Horde",
    races    = { "Scourge" },
    minLevel = 15, maxLevel = 20,
    next     = "horde-20-barrens",
    steps    = {
        { accept = 869, -- level 15
          note = "Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens." },
        { sethearth = "The Crossroads" }, -- level 15
        { accept = { 848, 1492 } }, -- level 15
        { accept = 91901 }, -- level 15
        { turnin = 91901 }, -- level 15
        { accept = { 850, 855 } }, -- level 15
        { accept = { 5041, 844 } }, -- level 15
        { complete = 844 }, -- level 15
        { accept = { 887, 97253 } }, -- level 15
        { complete = 869 }, -- level 15
        { complete = { 97253, 887 } }, -- level 15
        { accept = 894 }, -- level 15
        { turnin = 887, accept = 890 }, -- level 15
        { turnin = 97253 }, -- level 15
        { turnin = { 890, 1492 }, accept = { 892, 896 } }, -- level 16
        { accept = 865 }, -- level 16
        { complete = 5041 }, -- level 16
        { complete = 865 }, -- level 16
        { turnin = 892, accept = 888 }, -- level 16
        { turnin = 865 }, -- level 16
        { hearth = true }, -- level 16
        { turnin = 844, accept = 867 }, -- level 16
        { turnin = 5041, accept = 845 }, -- level 16
        { accept = 870 }, -- level 16
        { complete = 845 }, -- level 16
        { turnin = 845, accept = 903 }, -- level 16
        { turnin = 869 }, -- level 16
        { complete = { 870, 848 } }, -- level 16
        { complete = { 855, 850, 903 } }, -- level 16
        { hearth = true }, -- level 16
        { turnin = 903, accept = 881 }, -- level 16
        { turnin = 870, accept = 877 }, -- level 17
        { accept = 6541 }, -- level 17
        { turnin = 850, accept = 851 }, -- level 17
        { accept = { 1062, 6548 } }, -- level 17
        { complete = 6548 }, -- level 17
        { turnin = 6548, accept = 6629 }, -- level 17
        { complete = 1062 }, -- level 17
        { complete = 6629 }, -- level 17
        { accept = 6523 }, -- level 17
        { accept = { 6461, 6542 } }, -- level 17
        { complete = 6523 }, -- level 17
        { turnin = { 6523, 6629 }, accept = 6401 }, -- level 17
        { turnin = 1062, accept = 1063 }, -- level 17
        { complete = 867 }, -- level 17
        { accept = 95621 }, -- level 17
        { accept = { 95507, 95495, 95494 } }, -- level 17
        { turnin = { 6542, 6541 } }, -- level 17
        { turnin = 894, accept = 900 }, -- level 17
        { complete = 900 }, -- level 17
        { turnin = 900, accept = 901 }, -- level 17
        { complete = 901 }, -- level 17
        { turnin = 901, accept = 902 }, -- level 17
        { complete = 881 }, -- level 17
        { hearth = true }, -- level 17
        { accept = 3281 }, -- level 17
        { turnin = 881, accept = 905 }, -- level 18
        { turnin = 902, accept = 3921 }, -- level 18
        { complete = 95494 }, -- level 18
        { complete = 877 }, -- level 18
        { complete = 3281 }, -- level 18
        { complete = 905 }, -- level 18
        { complete = 851 }, -- level 18
        { turnin = 877, accept = 880 }, -- level 18
        { turnin = 905, accept = 3261 }, -- level 18
        { turnin = { 3281, 848 }, accept = 853 }, -- level 18
        { turnin = 851, accept = 852 }, -- level 18
        { complete = { 880, 852 } }, -- level 18
        { turnin = { 852, 855 } }, -- level 18
        { turnin = 867, accept = 875 }, -- level 18
        { turnin = 880, accept = 1489 }, -- level 18
        { turnin = 3261, accept = 882 }, -- level 18
        { turnin = { 1063, 1489 } }, -- level 18
        { turnin = 853 }, -- level 18
        { turnin = 6401 }, -- level 18
        { accept = 6421 }, -- level 18
        { complete = 6421 }, -- level 18
        { complete = 6461 }, -- level 18
        { turnin = 6421 }, -- level 19
        { turnin = 6461 }, -- level 19
        { complete = 875 }, -- level 19
        { complete = { 95621, 95507 } }, -- level 19
        { turnin = { 95495, 95621 }, accept = 95508 }, -- level 19
        { turnin = 95508 }, -- level 19
        { turnin = { 95507, 95494 } }, -- level 19
        { turnin = 3921, accept = 3922 }, -- level 19
        { accept = 858 }, -- level 19
        { complete = 896 }, -- level 19
        { complete = { 858, 3922 } }, -- level 19
        { turnin = 858, accept = 863 }, -- level 19
        { complete = 863 }, -- level 19
        { turnin = 3922 }, -- level 19
        { hearth = true }, -- level 19
        { turnin = 875 }, -- level 19
        { complete = 882 }, -- level 19
        { complete = 888 }, -- level 19
        { turnin = { 896, 863 } }, -- level 19
        { turnin = 888 }, -- level 19
        { turnin = 882, accept = 907 }, -- level 20
        { complete = 907 }, -- level 20
        { turnin = 907 }, -- level 20
    },
})
