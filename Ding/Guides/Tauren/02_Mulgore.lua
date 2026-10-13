-- Drafted by tools/draft_guide.lua from tools/routes/tauren.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Tauren/02_Mulgore.lua.
-- Simulated: level 5 (80%) -> 12 (38%), 37 quests turned in, about 4 h 29 (9 117 XP per hour).
Ding.RegisterGuide({
    id       = "tauren-02-mulgore",
    pack     = "ding-zones",
    title    = "Mulgore (5-12)",
    faction  = "Horde",
    races    = { "Tauren" },
    minLevel = 5, maxLevel = 12,
    next     = "tauren-03-barrens",
    steps    = {
        { accept = 748, -- level 5
          note = "Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore." },
        { sethearth = "Bloodhoof Village" }, -- level 5
        { complete = 748 }, -- level 5
        { accept = 96605 }, -- level 6
        { complete = 96605 }, -- level 6
        { turnin = 96605, accept = { 97934, 97936, 96661, 97931, 97932, 743 } }, -- level 6
        { accept = { 767, 745 } }, -- level 6
        { turnin = 748, accept = 761 }, -- level 6
        { turnin = 767, accept = { 771, 766 } }, -- level 6
        { complete = 97932 }, -- level 6
        { turnin = 97932 }, -- level 6
        { complete = 745 }, -- level 6
        { accept = 98430 }, -- level 7
        { complete = 98430 }, -- level 7
        { complete = 743 }, -- level 7
        { hearth = true }, -- level 7
        { accept = { 99079, 99101 } }, -- level 7
        { turnin = 99101, accept = { 99080, 754 } }, -- level 7
        { complete = { 771, 754 } }, -- level 7
        { complete = 766 }, -- level 7
        { accept = 99411 }, -- level 8
        { complete = 97931 }, -- level 8
        { turnin = { 97931, 754 }, accept = { 98435, 756 } }, -- level 8
        { complete = { 761, 756 } }, -- level 8
        { hearth = true }, -- level 9
        { turnin = { 743, 756 }, accept = 758 }, -- level 9
        { turnin = { 761, 771 }, accept = 772 }, -- level 9
        { complete = 758 }, -- level 9
        { turnin = 766 }, -- level 9
        { turnin = 758, accept = 759 }, -- level 10
        { accept = { 749, 98427 } }, -- level 10
        { turnin = 99079, accept = 99081 }, -- level 10
        { complete = { 99080, 759 } }, -- level 10
        { turnin = 772, accept = 773 }, -- level 10
        { complete = 97936 }, -- level 10
        { turnin = 97936 }, -- level 10
        { complete = 97934 }, -- level 10
        { turnin = 97934 }, -- level 10
        { complete = 96661 }, -- level 10
        { turnin = 96661, accept = 861 }, -- level 10
        { turnin = { 99080, 745 }, accept = 99082 }, -- level 10
        { turnin = 759, accept = 760 }, -- level 11
        { turnin = 749, accept = 751 }, -- level 11
        { complete = 98427 }, -- level 11
        { accept = 97930 }, -- level 11
        { complete = 97930 }, -- level 11
        { turnin = 97930 }, -- level 11
        { accept = 833 }, -- level 11
        { turnin = 773, accept = 775 }, -- level 11
        { complete = 833 }, -- level 11
        { turnin = 833 }, -- level 11
        { complete = 861 }, -- level 11
        { turnin = 98435 }, -- level 11
        { turnin = 861 }, -- level 11
        { turnin = { 98430, 775, 99082 } }, -- level 11
        { complete = 760 }, -- level 11
        { hearth = true }, -- level 11
        { turnin = 99081 }, -- level 11
        { complete = 99411 }, -- level 11
        { turnin = 760 }, -- level 11
        { turnin = 99411 }, -- level 11
        { turnin = { 751, 98427 }, accept = { 764, 765 } }, -- level 12
        { complete = { 764, 765 } }, -- level 12
        { turnin = { 765, 764 } }, -- level 12
    },
})
