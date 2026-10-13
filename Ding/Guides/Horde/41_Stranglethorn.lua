-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/41_Stranglethorn.lua.
-- Simulated: level 38 (82%) -> 42 (23%), 21 quests turned in, about 7 h 13 (23 293 XP per hour), plus up to 11 h 28 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-41-stv",
    pack     = "ding-zones",
    title    = "Stranglethorn Vale (38-42)",
    faction  = "Horde",
    minLevel = 38, maxLevel = 42,
    next     = "horde-43-swamp",
    steps    = {
        { level = 40,
          note = "Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay. Finish the level on nearby monsters before moving on." },
        { accept = { 598, 584 } }, -- level 40
        { sethearth = "Grom'gol" }, -- level 40
        { accept = { 209, 600, 606 } }, -- level 40
        { hearth = true }, -- level 40
        { accept = 572 }, -- level 40
        { complete = 572 }, -- level 40
        { complete = 600 }, -- level 40
        { complete = 598 }, -- level 40
        { accept = 196 }, -- level 40
        { complete = 584 }, -- level 40
        { hearth = true }, -- level 40
        { turnin = 572, accept = 571 }, -- level 40
        { turnin = { 598, 584 }, accept = 585 }, -- level 40
        { complete = 196 }, -- level 40
        { accept = 595 }, -- level 40
        { turnin = 595, accept = 597 }, -- level 40
        { complete = 571 }, -- level 40
        { hearth = true }, -- level 40
        { turnin = 196 }, -- level 40
        { complete = 585 }, -- level 40
        { complete = 209 }, -- level 40
        { complete = 606 }, -- level 40
        { turnin = 606, accept = 607 }, -- level 40
        { turnin = 597, accept = { 599, 576 } }, -- level 40
        { turnin = { 600, 209, 599 }, accept = { 604, 617, 587 } }, -- level 41
        { complete = 587 }, -- level 41
        { hearth = true }, -- level 41
        { complete = 617 }, -- level 41
        { turnin = { 585, 571 } }, -- level 41
        { turnin = 587 }, -- level 41
        { complete = { 576, 604 } }, -- level 41
        { turnin = { 669, 604, 617 } }, -- level 41
        { turnin = { 576, 607 } }, -- level 41
        { level = 42,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 609, 621 } }, -- level 42
        { hearth = true }, -- level 42
        { accept = 573 }, -- level 42
        { complete = { 621, 609 } }, -- level 42
        { complete = 573 }, -- level 42
        { turnin = { 609, 621 } }, -- level 42
        { turnin = 573 }, -- level 42
    },
})
