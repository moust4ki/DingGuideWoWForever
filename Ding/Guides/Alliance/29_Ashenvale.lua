-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/29_Ashenvale.lua.
-- Simulated: level 27 (65%) -> 30 (31%), 6 quests turned in, about 1 h 35 (14 817 XP per hour), plus up to 12 h 13 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-29-ashenvale",
    pack     = "ding-zones",
    title    = "Ashenvale (27-31)",
    faction  = "Alliance",
    minLevel = 27, maxLevel = 31,
    next     = "alliance-31-duskwood",
    steps    = {
        { level = 28,
          note = "Back to Astranaar for the last Ashenvale quests. Finish the level on nearby monsters before moving on." },
        { accept = 1045 }, -- level 28
        { level = 29,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 1045 }, -- level 29
        { turnin = 1045 }, -- level 29
        { accept = 98418 }, -- level 29
        { complete = 98418 }, -- level 29
        { turnin = 98418 }, -- level 29
        { hearth = true }, -- level 29
        { accept = 1022 }, -- level 29
        { level = 30,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 1021 }, -- level 30
        { accept = 1035 }, -- level 30
        { accept = 86757 }, -- level 30
        { complete = 1035 }, -- level 30
        { complete = 86757 }, -- level 30
        { turnin = 1021 }, -- level 30
        { complete = 1022 }, -- level 30
        { turnin = 86757 }, -- level 30
        { turnin = 1035 }, -- level 30
        { turnin = 1022 }, -- level 30
        { hearth = true }, -- level 30
        { sethearth = "Auberdine" }, -- level 30
        { level = 31,
          note = "Finish the level on nearby monsters before moving on." },
    },
})
