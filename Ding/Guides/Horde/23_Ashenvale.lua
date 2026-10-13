-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/23_Ashenvale.lua.
-- Simulated: level 20 (65%) -> 23 (28%), 16 quests turned in, about 1 h 44 (20 923 XP per hour), plus up to 9 h 42 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-23-ashenvale",
    pack     = "ding-zones",
    title    = "Ashenvale (20-25)",
    faction  = "Horde",
    minLevel = 20, maxLevel = 25,
    next     = "horde-25-hillsbrad",
    steps    = {
        { accept = { 98252, 98251 }, -- level 20
          note = "Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base." },
        { turnin = 98252 }, -- level 20
        { level = 22,
          note = "Finish the level on nearby monsters before moving on." },
        { hearth = true }, -- level 22
        { accept = { 6462, 6442 } }, -- level 22
        { turnin = 6562, accept = { 6563, 216, 6641 } }, -- level 22
        { complete = 6462 }, -- level 22
        { accept = 6482 }, -- level 22
        { complete = { 6482, 216 } }, -- level 22
        { complete = 6563 }, -- level 22
        { complete = { 6641, 6442 } }, -- level 22
        { turnin = { 6563, 6462, 6442, 216, 6641 } }, -- level 22
        { complete = 98251 }, -- level 22
        { turnin = 98251 }, -- level 22
        { accept = 6544 }, -- level 22
        { complete = 6544 }, -- level 22
        { accept = 6503 }, -- level 22
        { complete = 6503 }, -- level 22
        { turnin = 6503 }, -- level 22
        { turnin = 6544, accept = 6383 }, -- level 22
        { turnin = { 6383, 6482 } }, -- level 22
        { sethearth = "Splintertree Post" }, -- level 23
        { accept = 25 }, -- level 23
        { complete = 25 }, -- level 23
        { accept = 78132 }, -- level 23
        { turnin = 78132, accept = { 78133, 78134 } }, -- level 23
        { turnin = { 78133, 78134 } }, -- level 23
        { hearth = true }, -- level 23
        { turnin = 25 }, -- level 23
        { level = 25,
          note = "Finish the level on nearby monsters before moving on." },
    },
})
