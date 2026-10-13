-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/31_Hillsbrad.lua.
-- Simulated: level 30 (27%) -> 32 (78%), 17 quests turned in, about 4 h 08 (20 832 XP per hour), plus up to 4 h 00 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-31-hillsbrad",
    pack     = "ding-zones",
    title    = "Hillsbrad, Alterac and Arathi (30-32)",
    faction  = "Horde",
    minLevel = 30, maxLevel = 32,
    next     = "horde-33-desolace",
    steps    = {
        { accept = { 532, 567 }, -- level 30
          note = "Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands." },
        { sethearth = "Tarren Mill" }, -- level 30
        { complete = { 532, 567 } }, -- level 30
        { hearth = true }, -- level 30
        { turnin = { 532, 567 }, accept = 539 }, -- level 30
        { level = 31,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 671 }, -- level 31
        { hearth = true }, -- level 31
        { accept = { 552, 97287, 556 } }, -- level 31
        { complete = 552 }, -- level 31
        { complete = 539 }, -- level 31
        { complete = 556 }, -- level 31
        { turnin = 97287 }, -- level 31
        { hearth = true }, -- level 31
        { turnin = 552, accept = 553 }, -- level 31
        { turnin = { 539, 556 } }, -- level 31
        { complete = 553 }, -- level 31
        { turnin = 553 }, -- level 31
        { accept = 79976 }, -- level 31
        { turnin = 79976 }, -- level 31
        { complete = 671 }, -- level 31
        { turnin = 671 }, -- level 31
        { sethearth = "Hammerfall" }, -- level 31
        { level = 32,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 8263 }, -- level 32
        { turnin = 8263 }, -- level 32
        { accept = { 676, 533, 557 } }, -- level 32
        { complete = 533 }, -- level 32
        { complete = 557 }, -- level 32
        { hearth = true }, -- level 32
        { accept = 655 }, -- level 32
        { turnin = 655, accept = 672 }, -- level 32
        { turnin = { 557, 533 } }, -- level 32
        { complete = 676 }, -- level 32
        { complete = 672 }, -- level 32
        { hearth = true }, -- level 32
        { turnin = { 676, 672 }, accept = 674 }, -- level 32
        { turnin = 674, accept = 675 }, -- level 32
        { turnin = 675 }, -- level 32
    },
})
