-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/44_Feralas.lua.
-- Simulated: level 42 (65%) -> 44 (17%), 12 quests turned in, about 2 h 55 (29 675 XP per hour), plus up to 5 h 36 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-44-feralas",
    pack     = "ding-zones",
    title    = "Feralas (42-44)",
    faction  = "Horde",
    minLevel = 42, maxLevel = 44,
    next     = "horde-46-tanaris",
    steps    = {
        { accept = { 2987, 2975 }, -- level 42
          note = "Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base." },
        { accept = 2862 }, -- level 42
        { complete = { 2975, 2987 } }, -- level 42
        { complete = 2862 }, -- level 42
        { turnin = 2862, accept = 2863 }, -- level 42
        { turnin = { 2987, 2975 }, accept = 2980 }, -- level 42
        { level = 43,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 2973 }, -- level 43
        { sethearth = "Camp Mojache" }, -- level 43
        { complete = 2973 }, -- level 43
        { accept = 2766, optional = true, -- level 43
          note = "If the starting item dropped: use it from your bags." },
        { complete = 2863 }, -- level 43
        { complete = 2980 }, -- level 43
        { turnin = 2766, optional = true }, -- level 43
        { hearth = true }, -- level 43
        { turnin = 2973, accept = 2974 }, -- level 43
        { turnin = 2863, accept = 2902 }, -- level 43
        { complete = 2974 }, -- level 43
        { turnin = 2902, accept = 2903 }, -- level 43
        { turnin = { 2980, 2974, 2903 }, accept = 7730 }, -- level 43
        { level = 44,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 2822 }, -- level 44
        { complete = 7730 }, -- level 44
        { complete = 2822 }, -- level 44
        { hearth = true }, -- level 44
        { turnin = { 2822, 7730 } }, -- level 44
    },
})
