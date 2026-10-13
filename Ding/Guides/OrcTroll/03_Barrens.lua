-- Drafted by tools/draft_guide.lua from tools/routes/orc_troll.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/OrcTroll/03_Barrens.lua.
-- Simulated: level 11 (77%) -> 19 (10%), 61 quests turned in, about 8 h 45 (12 082 XP per hour).
Ding.RegisterGuide({
    id       = "orc-03-barrens",
    pack     = "ding-zones",
    title    = "The Barrens (11-19)",
    faction  = "Horde",
    races    = { "Orc", "Troll" },
    minLevel = 11, maxLevel = 19,
    next     = "horde-20-barrens",
    steps    = {
        { accept = 871, -- level 11
          note = "Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base." },
        { accept = { 870, 844 } }, -- level 11
        { complete = 871 }, -- level 11
        { complete = 844 }, -- level 12
        { accept = 6365 }, -- level 12
        { sethearth = "The Crossroads" }, -- level 12
        { accept = 855 }, -- level 12
        { complete = 870 }, -- level 12
        { complete = 855 }, -- level 12
        { turnin = 855 }, -- level 12
        { hearth = true }, -- level 12
        { accept = 869 }, -- level 12
        { turnin = 6365, accept = 6384 }, -- level 13
        { complete = 869 }, -- level 13
        { turnin = 844, accept = { 845, 1492, 848 } }, -- level 13
        { turnin = 871 }, -- level 13
        { complete = 845 }, -- level 13
        { complete = 848 }, -- level 13
        { accept = 91901 }, -- level 13
        { turnin = 91901 }, -- level 13
        { turnin = { 869, 848 }, accept = 853 }, -- level 13
        { turnin = 845, accept = 903 }, -- level 13
        { turnin = 870 }, -- level 13
        { turnin = 840, accept = 842 }, -- level 13
        { complete = 903 }, -- level 13
        { hearth = true }, -- level 14
        { turnin = { 842, 903 }, accept = { 881, 877, 867, 872, 5041 } }, -- level 14
        { accept = { 887, 895 } }, -- level 14
        { complete = 887 }, -- level 14
        { complete = 877 }, -- level 14
        { turnin = 887, accept = 890 }, -- level 14
        { turnin = { 1492, 890 }, accept = { 892, 894 } }, -- level 14
        { turnin = 892, accept = 888 }, -- level 14
        { complete = { 872, 5041 } }, -- level 14
        { accept = 850 }, -- level 14
        { complete = 867 }, -- level 14
        { complete = 850 }, -- level 15
        { hearth = true }, -- level 15
        { turnin = 867, accept = 875 }, -- level 15
        { turnin = 877, accept = 880 }, -- level 15
        { turnin = 872 }, -- level 15
        { complete = { 888, 895 } }, -- level 15
        { complete = 880 }, -- level 15
        { turnin = 880, accept = 1489 }, -- level 15
        { complete = 881 }, -- level 15
        { turnin = 894, accept = 900 }, -- level 15
        { complete = 900 }, -- level 15
        { turnin = 900, accept = 901 }, -- level 15
        { complete = 901 }, -- level 15
        { turnin = 901, accept = 902 }, -- level 15
        { hearth = true }, -- level 15
        { turnin = 881, accept = 905 }, -- level 15
        { turnin = 902, accept = 3921 }, -- level 15
        { turnin = { 888, 895 }, accept = 865 }, -- level 16
        { accept = 896 }, -- level 16
        { complete = 865 }, -- level 16
        { complete = 905 }, -- level 16
        { turnin = 865 }, -- level 16
        { accept = 3281 }, -- level 16
        { turnin = 905, accept = 3261 }, -- level 16
        { turnin = 5041 }, -- level 16
        { turnin = 850, accept = 851 }, -- level 16
        { accept = 6548 }, -- level 16
        { complete = 6548 }, -- level 16
        { accept = 6523 }, -- level 16
        { complete = 6523 }, -- level 16
        { turnin = { 6523, 6548 }, accept = { 6401, 6629 } }, -- level 16
        { complete = 875 }, -- level 16
        { accept = { 95621, 95508 } }, -- level 16
        { turnin = 95508 }, -- level 16
        { complete = 95621 }, -- level 16
        { accept = 1062 }, -- level 17
        { accept = 6461 }, -- level 17
        { complete = 6629 }, -- level 17
        { complete = 6461 }, -- level 17
        { accept = 6421 }, -- level 17
        { sethearth = "Sun Rock Retreat" }, -- level 17
        { turnin = 6401 }, -- level 17
        { accept = 78270 }, -- level 17
        { turnin = 78270 }, -- level 17
        { complete = 1062 }, -- level 17
        { complete = 6421 }, -- level 17
        { turnin = 6461 }, -- level 17
        { turnin = { 6629, 1062 }, accept = 1063 }, -- level 17
        { hearth = true }, -- level 17
        { turnin = 6421 }, -- level 17
        { turnin = { 1063, 1489 } }, -- level 17
        { turnin = 853 }, -- level 17
        { turnin = 3261, accept = 882 }, -- level 17
        { complete = 3281 }, -- level 17
        { complete = 851 }, -- level 17
        { turnin = { 875, 3281 } }, -- level 17
        { turnin = 851, accept = 852 }, -- level 17
        { accept = { 95495, 95494, 95507 } }, -- level 17
        { turnin = 3921, accept = 3922 }, -- level 18
        { accept = 858 }, -- level 18
        { complete = { 3922, 858 } }, -- level 18
        { turnin = 858, accept = 863 }, -- level 18
        { complete = 863 }, -- level 18
        { complete = 896 }, -- level 18
        { turnin = 6384 }, -- level 18
        { sethearth = "Orgrimmar" }, -- level 18
        { complete = 95494 }, -- level 18
        { complete = 882 }, -- level 18
        { turnin = { 863, 896 } }, -- level 18
        { turnin = 882, accept = 907 }, -- level 18
        { complete = 907 }, -- level 18
        { turnin = 907 }, -- level 18
        { complete = 852 }, -- level 18
        { turnin = 852 }, -- level 18
        { complete = 95507 }, -- level 18
        { turnin = { 95495, 95621 } }, -- level 18
        { turnin = { 95494, 95507 } }, -- level 18
        { turnin = 3922, accept = 3923 }, -- level 19
        { hearth = true }, -- level 19
        { turnin = 3923 }, -- level 19
    },
})
