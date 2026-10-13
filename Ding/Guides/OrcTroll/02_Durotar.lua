-- Drafted by tools/draft_guide.lua from tools/routes/orc_troll.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/OrcTroll/02_Durotar.lua.
-- Simulated: level 5 (58%) -> 11 (77%), 34 quests turned in, about 3 h 40 (9 846 XP per hour).
Ding.RegisterGuide({
    id       = "orc-02-durotar",
    pack     = "ding-zones",
    title    = "Durotar (5-11)",
    faction  = "Horde",
    races    = { "Orc", "Troll" },
    minLevel = 5, maxLevel = 11,
    next     = "orc-03-barrens",
    steps    = {
        { accept = 791, -- level 5
          note = "Leave the valley by the road east, then north to Razor Hill: your base for Durotar." },
        { sethearth = "Razor Hill" }, -- level 5
        { accept = 96822 }, -- level 5
        { accept = 96604 }, -- level 5
        { complete = 96604 }, -- level 5
        { turnin = 96604, accept = { 97904, 96655, 97900, 97907, 97903, 97902 } }, -- level 5
        { complete = { 791, 96822 } }, -- level 5
        { turnin = 96822 }, -- level 6
        { complete = 97902 }, -- level 6
        { turnin = 97902 }, -- level 6
        { complete = 97900 }, -- level 6
        { turnin = 97900 }, -- level 6
        { complete = 97907 }, -- level 6
        { turnin = 97907 }, -- level 6
        { turnin = 791 }, -- level 6
        { complete = 96655 }, -- level 6
        { turnin = 96655, accept = { 815, 784 } }, -- level 6
        { accept = 786 }, -- level 6
        { complete = 97904 }, -- level 6
        { turnin = 97904 }, -- level 6
        { complete = 786 }, -- level 6
        { accept = 99123 }, -- level 6
        { complete = 99123 }, -- level 6
        { turnin = 786, accept = 817 }, -- level 7
        { turnin = 99123, accept = { 818, 97225, 808 } }, -- level 7
        { complete = { 808, 97225 } }, -- level 7
        { complete = 818 }, -- level 7
        { complete = { 815, 817 } }, -- level 7
        { turnin = { 808, 97225 }, accept = 823 }, -- level 7
        { turnin = { 818, 817 }, accept = 96821 }, -- level 8
        { complete = 96821 }, -- level 8
        { complete = 784 }, -- level 8
        { hearth = true }, -- level 8
        { turnin = { 815, 823, 784, 96821 }, accept = { 837, 825 } }, -- level 8
        { complete = 837 }, -- level 8
        { accept = { 834, 97282 } }, -- level 9
        { complete = 834 }, -- level 9
        { turnin = 834, accept = 835 }, -- level 9
        { complete = 97282 }, -- level 9
        { accept = 816 }, -- level 9
        { complete = 816 }, -- level 9
        { hearth = true }, -- level 10
        { accept = { 840, 99048 } }, -- level 10
        { turnin = 99048, accept = 99049 }, -- level 10
        { complete = { 99049, 825 } }, -- level 10
        { turnin = { 837, 825, 99049 }, accept = { 806, 99051 } }, -- level 10
        { complete = 97903 }, -- level 10
        { turnin = 97903 }, -- level 10
        { complete = 99051 }, -- level 10
        { complete = 835 }, -- level 10
        { accept = 97281, optional = true, -- level 10
          note = "If the starting item dropped: use it from your bags." },
        { turnin = 835 }, -- level 10
        { turnin = 97281, optional = true }, -- level 10
        { turnin = 97282 }, -- level 10
        { turnin = 816 }, -- level 10
        { complete = 806 }, -- level 11
        { turnin = { 99051, 806 }, accept = { 99052, 828 } }, -- level 11
        { turnin = 828, accept = 827 }, -- level 11
        { complete = 827 }, -- level 11
        { turnin = 827, accept = 829 }, -- level 11
        { complete = 99052 }, -- level 11
        { turnin = 829 }, -- level 11
        { hearth = true }, -- level 11
        { turnin = 99052 }, -- level 11
    },
})
