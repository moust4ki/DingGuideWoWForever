-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/25_Hillsbrad.lua.
-- Simulated: level 25 (0%) -> 27 (18%), 22 quests turned in, about 5 h 02 (15 430 XP per hour).
Ding.RegisterGuide({
    id       = "horde-25-hillsbrad",
    pack     = "ding-zones",
    title    = "Hillsbrad Foothills (25-27)",
    faction  = "Horde",
    minLevel = 25, maxLevel = 27,
    next     = "horde-27-barrens",
    steps    = {
        { accept = { 527, 98094, 549, 498 }, -- level 25
          note = "Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base." },
        { sethearth = "Tarren Mill" }, -- level 25
        { accept = 501 }, -- level 25
        { complete = 501 }, -- level 25
        { complete = { 498, 549 } }, -- level 25
        { hearth = true }, -- level 25
        { turnin = 501, accept = { 502, 496 } }, -- level 25
        { accept = { 98299, 95981, 516, 493 } }, -- level 25
        { complete = 98299 }, -- level 25
        { complete = 95981 }, -- level 25
        { turnin = 502 }, -- level 25
        { complete = 527 }, -- level 25
        { accept = 494 }, -- level 25
        { complete = 516 }, -- level 25
        { accept = 95884, optional = true, -- level 25
          note = "If the starting item dropped: use it from your bags." },
        { accept = { 95883, 95885 } }, -- level 25
        { complete = { 95885, 95883 } }, -- level 25
        { complete = 95884, optional = true }, -- level 25
        { turnin = 95883 }, -- level 25
        { turnin = 95884, optional = true }, -- level 25
        { turnin = 95885 }, -- level 25
        { turnin = { 95981, 516, 98299 } }, -- level 25
        { hearth = true }, -- level 25
        { turnin = { 527, 494 }, accept = { 528, 546 } }, -- level 25
        { turnin = 493 }, -- level 25
        { complete = 528 }, -- level 25
        { complete = 496 }, -- level 25
        { hearth = true }, -- level 26
        { turnin = 496, accept = { 499, 509 } }, -- level 26
        { turnin = { 528, 549 }, accept = 529 }, -- level 26
        { turnin = 498 }, -- level 26
        { accept = 98095 }, -- level 26
        { turnin = { 98095, 98094 } }, -- level 26
        { complete = 509 }, -- level 26
        { complete = { 529, 546 } }, -- level 26
        { turnin = 509, accept = 513 }, -- level 26
        { turnin = { 499, 546, 529 } }, -- level 26
        { turnin = 513 }, -- level 27
    },
})
