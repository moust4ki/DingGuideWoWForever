-- Drafted by tools/draft_guide.lua from tools/routes/undead.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Undead/02_Tirisfal.lua.
-- Simulated: level 6 (0%) -> 12 (63%), 47 quests turned in, about 4 h 12 (10 335 XP per hour), plus up to 35 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "undead-02-tirisfal",
    pack     = "ding-zones",
    title    = "Tirisfal Glades (6-13)",
    faction  = "Horde",
    races    = { "Scourge" },
    minLevel = 6, maxLevel = 13,
    next     = "undead-03-silverpine",
    steps    = {
        { accept = 404, -- level 6
          note = "Leave Deathknell by the road east to Brill: your base for Tirisfal Glades." },
        { accept = 96607 }, -- level 6
        { complete = 96607 }, -- level 6
        { turnin = 96607, accept = { 97955, 97956, 97960, 97951, 97961, 96658, 97953, 97958, 97957 } }, -- level 6
        { accept = { 367, 427, 99134 } }, -- level 6
        { turnin = 99134 }, -- level 6
        { complete = 96658 }, -- level 6
        { turnin = 96658 }, -- level 6
        { complete = 367 }, -- level 6
        { complete = 404 }, -- level 6
        { turnin = { 404, 367 }, accept = 368 }, -- level 7
        { accept = { 375, 358 } }, -- level 7
        { complete = 358 }, -- level 7
        { complete = 375 }, -- level 7
        { turnin = 358, accept = 359 }, -- level 8
        { complete = 97953 }, -- level 8
        { turnin = 97953 }, -- level 8
        { sethearth = "Brill" }, -- level 8
        { accept = 362 }, -- level 8
        { complete = 97957 }, -- level 8
        { turnin = 97957 }, -- level 8
        { complete = 97951 }, -- level 8
        { turnin = 97951, accept = { 95314, 426 } }, -- level 8
        { complete = 426 }, -- level 8
        { accept = 361, optional = true, -- level 8
          note = "If the starting item dropped: use it from your bags." },
        { complete = 362 }, -- level 8
        { accept = { 5481, 365 } }, -- level 8
        { complete = { 5481, 365 } }, -- level 8
        { complete = 427 }, -- level 8
        { accept = 99153 }, -- level 8
        { complete = { 99153, 95314 } }, -- level 8
        { complete = 368 }, -- level 8
        { turnin = 99153 }, -- level 8
        { hearth = true }, -- level 9
        { accept = 398 }, -- level 9
        { turnin = { 368, 365 }, accept = { 407, 369 } }, -- level 9
        { turnin = 95314, accept = 86784 }, -- level 9
        { turnin = 5481, accept = { 99142, 5482 } }, -- level 9
        { turnin = 427, accept = { 370, 374 } }, -- level 9
        { turnin = 361, optional = true }, -- level 9
        { complete = 97955 }, -- level 9
        { turnin = 97955 }, -- level 9
        { complete = 97958 }, -- level 9
        { turnin = 97958, accept = 97558 }, -- level 9
        { turnin = 359, accept = { 360, 356 } }, -- level 9
        { complete = 356 }, -- level 9
        { complete = 369 }, -- level 9
        { complete = 97558 }, -- level 9
        { complete = 398 }, -- level 10
        { complete = 97961 }, -- level 10
        { turnin = 97961 }, -- level 10
        { complete = { 370, 374 } }, -- level 10
        { hearth = true }, -- level 10
        { turnin = 370, accept = 371 }, -- level 10
        { turnin = { 374, 360 }, accept = 405 }, -- level 10
        { turnin = { 362, 375 } }, -- level 10
        { turnin = 97558 }, -- level 10
        { complete = 97960 }, -- level 10
        { turnin = 97960, accept = 96898 }, -- level 11
        { complete = 96898 }, -- level 11
        { accept = { 96899, 96897 } }, -- level 11
        { turnin = 356, accept = 99156 }, -- level 11
        { complete = 96897 }, -- level 11
        { turnin = { 96898, 96897 } }, -- level 11
        { turnin = 369, accept = { 492, 445 } }, -- level 11
        { turnin = 426 }, -- level 11
        { complete = 86784 }, -- level 11
        { turnin = 86784 }, -- level 11
        { turnin = { 398, 492, 407 } }, -- level 11
        { complete = 97956 }, -- level 11
        { turnin = 97956 }, -- level 11
        { complete = 99142 }, -- level 12
        { complete = { 99156, 371 } }, -- level 12
        { accept = 96895 }, -- level 12
        { turnin = 371, accept = 372 }, -- level 12
        { complete = 372 }, -- level 12
        { complete = 5482 }, -- level 12
        { accept = { 98545, 96896 } }, -- level 12
        { turnin = { 96896, 96899 } }, -- level 12
        { hearth = true }, -- level 12
        { turnin = 372 }, -- level 12
        { turnin = { 99142, 5482 } }, -- level 12
        { turnin = { 99156, 96895 } }, -- level 12
        { turnin = 405 }, -- level 12
        { turnin = 98545 }, -- level 12
        { level = 13,
          note = "Finish the level on nearby monsters before moving on." },
    },
})
