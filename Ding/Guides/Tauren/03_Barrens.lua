-- Drafted by tools/draft_guide.lua from tools/routes/tauren.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Tauren/03_Barrens.lua.
-- Simulated: level 12 (38%) -> 19 (15%), 56 quests turned in, about 7 h 49 (12 955 XP per hour).
Ding.RegisterGuide({
    id       = "tauren-03-barrens",
    pack     = "ding-zones",
    title    = "The Barrens (12-19)",
    faction  = "Horde",
    races    = { "Tauren" },
    minLevel = 12, maxLevel = 19,
    next     = "horde-20-barrens",
    steps    = {
        { accept = 869, -- level 12
          note = "Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base." },
        { sethearth = "The Crossroads" }, -- level 12
        { accept = { 844, 870, 871 } }, -- level 12
        { accept = 6361 }, -- level 12
        { accept = 855 }, -- level 12
        { complete = 870 }, -- level 12
        { complete = 844 }, -- level 12
        { complete = 871 }, -- level 12
        { complete = 869 }, -- level 13
        { hearth = true }, -- level 13
        { turnin = { 869, 844 }, accept = 845 }, -- level 13
        { complete = 845 }, -- level 13
        { complete = 855 }, -- level 13
        { turnin = 845, accept = 903 }, -- level 14
        { turnin = 870, accept = { 877, 867 } }, -- level 14
        { turnin = 6361, accept = 6362 }, -- level 14
        { turnin = 871, accept = { 5041, 872, 1492 } }, -- level 14
        { accept = { 97253, 887 } }, -- level 14
        { complete = 877 }, -- level 14
        { complete = { 97253, 887 } }, -- level 14
        { turnin = 887, accept = 890 }, -- level 14
        { turnin = 97253 }, -- level 14
        { turnin = { 890, 1492 }, accept = { 892, 894 } }, -- level 14
        { turnin = 892, accept = 888 }, -- level 14
        { complete = { 872, 5041 } }, -- level 14
        { hearth = true }, -- level 14
        { accept = 848 }, -- level 14
        { accept = 850 }, -- level 14
        { complete = 848 }, -- level 14
        { complete = { 867, 903 } }, -- level 14
        { complete = 850 }, -- level 15
        { turnin = { 850, 855 } }, -- level 15
        { turnin = 848, accept = 853 }, -- level 15
        { turnin = 877, accept = 880 }, -- level 15
        { complete = 880 }, -- level 15
        { hearth = true }, -- level 15
        { turnin = { 872, 5041, 867 }, accept = 875 }, -- level 15
        { turnin = 880, accept = 1489 }, -- level 15
        { turnin = 903, accept = 881 }, -- level 15
        { complete = 881 }, -- level 15
        { turnin = 894, accept = 900 }, -- level 15
        { complete = 900 }, -- level 15
        { turnin = 900, accept = 901 }, -- level 16
        { complete = 901 }, -- level 16
        { turnin = 901, accept = 902 }, -- level 16
        { accept = { 95495, 95507, 95494 } }, -- level 16
        { accept = { 95621, 95508 } }, -- level 16
        { turnin = { 95508, 95495 } }, -- level 16
        { complete = 875 }, -- level 16
        { complete = 95621 }, -- level 16
        { turnin = 902, accept = { 3921, 865 } }, -- level 16
        { complete = 865 }, -- level 16
        { complete = 888 }, -- level 16
        { accept = 896 }, -- level 16
        { turnin = { 865, 888 } }, -- level 16
        { complete = 95494 }, -- level 16
        { hearth = true }, -- level 16
        { turnin = { 881, 875 } }, -- level 16
        { accept = 851 }, -- level 17
        { accept = { 1062, 6548 } }, -- level 17
        { complete = 6548 }, -- level 17
        { turnin = 6548, accept = 6629 }, -- level 17
        { accept = 6461 }, -- level 17
        { complete = 6629 }, -- level 17
        { accept = 6523 }, -- level 17
        { complete = 1062 }, -- level 17
        { complete = 6461 }, -- level 17
        { turnin = 6461 }, -- level 17
        { complete = 6523 }, -- level 17
        { turnin = { 6629, 6523 }, accept = 6401 }, -- level 17
        { turnin = 1062, accept = 1063 }, -- level 17
        { turnin = { 1489, 1063 } }, -- level 17
        { turnin = 853 }, -- level 17
        { turnin = 6362 }, -- level 17
        { turnin = 6401 }, -- level 17
        { accept = 6421 }, -- level 17
        { complete = 6421 }, -- level 17
        { turnin = 6421 }, -- level 17
        { hearth = true }, -- level 18
        { accept = { 3281, 905 } }, -- level 18
        { complete = 3281 }, -- level 18
        { complete = 905 }, -- level 18
        { complete = 851 }, -- level 18
        { turnin = 905, accept = 3261 }, -- level 18
        { turnin = 3281 }, -- level 18
        { accept = 91901 }, -- level 18
        { turnin = 91901 }, -- level 18
        { turnin = 851 }, -- level 18
        { complete = 95507 }, -- level 18
        { turnin = 95621 }, -- level 18
        { turnin = { 95507, 95494 } }, -- level 18
        { turnin = 3921, accept = 3922 }, -- level 18
        { accept = 858 }, -- level 18
        { complete = 896 }, -- level 18
        { complete = { 858, 3922 } }, -- level 18
        { turnin = 858, accept = 863 }, -- level 18
        { complete = 863 }, -- level 18
        { turnin = 3922 }, -- level 18
        { sethearth = "Camp Taurajo" }, -- level 18
        { turnin = 3261, accept = 882 }, -- level 18
        { turnin = { 896, 863 } }, -- level 18
        { complete = 882 }, -- level 18
        { hearth = true }, -- level 18
        { turnin = 882, accept = 907 }, -- level 18
        { complete = 907 }, -- level 18
        { turnin = 907 }, -- level 19
    },
})
