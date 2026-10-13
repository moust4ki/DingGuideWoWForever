-- Drafted by tools/draft_guide.lua from tools/routes/undead.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Undead/01_Deathknell.lua.
-- Simulated: level 1 (0%) -> 5 (94%), 11 quests turned in, about 1 h 01 (7 290 XP per hour), plus up to 2 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "undead-01-deathknell",
    pack     = "ding-zones",
    title    = "Deathknell (1-6)",
    faction  = "Horde",
    races    = { "Scourge" },
    minLevel = 1, maxLevel = 6,
    next     = "undead-02-tirisfal",
    steps    = {
        { accept = 364, -- level 1
          note = "Everything starts in Deathknell: follow the arrow from NPC to NPC." },
        { complete = 364 }, -- level 1
        { accept = 376 }, -- level 2
        { turnin = 364, accept = 3901 }, -- level 2
        { complete = 376 }, -- level 2
        { turnin = 376, accept = 6395 }, -- level 3
        { complete = 6395 }, -- level 3
        { accept = { 3902, 380 } }, -- level 3
        { complete = { 3902, 3901 } }, -- level 3
        { complete = 380 }, -- level 3
        { turnin = { 3901, 6395, 3902, 380 }, accept = { 96656, 381 } }, -- level 5
        { complete = 381 }, -- level 5
        { turnin = 381, accept = 382 }, -- level 5
        { complete = 382 }, -- level 5
        { turnin = 382, accept = 383 }, -- level 5
        { accept = 8 }, -- level 5
        { turnin = 96656 }, -- level 5
        { turnin = { 8, 383 } }, -- level 5
        { level = 6,
          note = "Finish the level on nearby monsters before moving on." },
    },
})
