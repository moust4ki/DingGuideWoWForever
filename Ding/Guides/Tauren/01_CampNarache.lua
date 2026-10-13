-- Drafted by tools/draft_guide.lua from tools/routes/tauren.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Tauren/01_CampNarache.lua.
-- Simulated: level 1 (0%) -> 5 (80%), 12 quests turned in, about 58 min (7 231 XP per hour).
Ding.RegisterGuide({
    id       = "tauren-01-narache",
    pack     = "ding-zones",
    title    = "Camp Narache (1-5)",
    faction  = "Horde",
    races    = { "Tauren" },
    minLevel = 1, maxLevel = 5,
    next     = "tauren-02-mulgore",
    steps    = {
        { accept = { 747, 752 }, -- level 1
          note = "Everything starts at Camp Narache: follow the arrow from NPC to NPC." },
        { complete = 747 }, -- level 1
        { turnin = 752, accept = 753 }, -- level 2
        { complete = 753 }, -- level 2
        { turnin = 747, accept = 750 }, -- level 2
        { turnin = 753, accept = 755 }, -- level 2
        { complete = 750 }, -- level 2
        { turnin = 755, accept = { 757, 95805 } }, -- level 3
        { accept = 1656 }, -- level 3
        { accept = 3376 }, -- level 3
        { turnin = 750, accept = 780 }, -- level 3
        { complete = 757 }, -- level 3
        { complete = 3376 }, -- level 4
        { turnin = 95805 }, -- level 4
        { complete = 780 }, -- level 4
        { turnin = { 780, 3376, 757 }, accept = { 763, 96659 } }, -- level 5
        { turnin = 96659 }, -- level 5
        { turnin = { 1656, 763 } }, -- level 5
    },
})
