-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/46_Tanaris.lua.
-- Simulated: level 44 (17%) -> 48 (18%), 20 quests turned in, about 3 h 39 (32 909 XP per hour), plus up to 26 h 51 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-46-tanaris",
    pack     = "ding-zones",
    title    = "Tanaris (44-48)",
    faction  = "Horde",
    minLevel = 44, maxLevel = 48,
    next     = "horde-48-hinterlands",
    steps    = {
        { accept = { 1690, 1707 }, -- level 44
          note = "Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet." },
        { accept = 992 }, -- level 44
        { complete = 992 }, -- level 44
        { turnin = 992 }, -- level 44
        { sethearth = "Gadgetzan" }, -- level 44
        { accept = { 8365, 2875, 2781, 8366, 2873 } }, -- level 44
        { complete = { 8366, 2875, 2873 } }, -- level 44
        { complete = 1707 }, -- level 44
        { complete = 8365 }, -- level 44
        { complete = 1690 }, -- level 44
        { turnin = { 2873, 2875, 8366, 8365 } }, -- level 44
        { hearth = true }, -- level 44
        { turnin = { 1707, 1690 }, accept = 1691 }, -- level 44
        { complete = 1691 }, -- level 44
        { level = 45,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 2781 }, -- level 45
        { turnin = { 2781, 1691 } }, -- level 45
        { level = 47,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 2605 }, -- level 47
        { accept = 82 }, -- level 47
        { complete = 82 }, -- level 47
        { accept = 351, optional = true, -- level 47
          note = "If the starting item dropped: use it from your bags." },
        { complete = 2605 }, -- level 47
        { hearth = true }, -- level 47
        { accept = 5863 }, -- level 47
        { turnin = 2605, accept = 2606 }, -- level 47
        { turnin = 82, accept = 10 }, -- level 47
        { accept = 3161 }, -- level 47
        { turnin = 351, optional = true }, -- level 47
        { complete = 10 }, -- level 47
        { complete = 3161 }, -- level 47
        { turnin = 3161 }, -- level 47
        { turnin = 10, accept = 110 }, -- level 47
        { turnin = 110, accept = 113 }, -- level 47
        { turnin = { 113, 2606 } }, -- level 47
        { level = 48,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 3362 }, -- level 48
        { complete = 5863 }, -- level 48
        { complete = 3362 }, -- level 48
        { accept = 1560 }, -- level 48
        { hearth = true }, -- level 48
        { complete = 1560 }, -- level 48
        { turnin = 1560 }, -- level 48
        { turnin = { 5863, 3362 } }, -- level 48
    },
})
