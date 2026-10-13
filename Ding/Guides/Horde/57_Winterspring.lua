-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/57_Winterspring.lua.
-- Simulated: level 55 (12%) -> 56 (11%), 7 quests turned in, about 1 h 28 (33 351 XP per hour), plus up to 8 h 45 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-57-winterspring",
    pack     = "ding-zones",
    title    = "Winterspring (55-56)",
    faction  = "Horde",
    minLevel = 55, maxLevel = 56,
    next     = "horde-58-epl",
    steps    = {
        { accept = 6030, -- level 55
          note = "Winterspring is northeast of Felwood: Everlook is your base." },
        { sethearth = "Everlook" }, -- level 55
        { accept = { 3783, 6603 } }, -- level 55
        { accept = 5082 }, -- level 55
        { complete = 5082 }, -- level 55
        { accept = 5083, optional = true, -- level 55
          note = "If the starting item dropped: use it from your bags." },
        { complete = 3783 }, -- level 55
        { turnin = 3783 }, -- level 55
        { turnin = 5083, optional = true }, -- level 55
        { turnin = { 5082, 6603 } }, -- level 55
        { turnin = 8465 }, -- level 55
        { level = 56,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 8464 }, -- level 56
        { hearth = true }, -- level 56
        { accept = 977 }, -- level 56
        { complete = { 977, 8464 } }, -- level 56
        { turnin = 977 }, -- level 56
        { turnin = 8464 }, -- level 56
    },
})
