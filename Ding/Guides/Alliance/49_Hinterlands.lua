-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/49_Hinterlands.lua.
-- Simulated: level 48 (9%) -> 48 (31%), 5 quests turned in, about 38 min (48 643 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-49-hinterlands",
    pack     = "ding-zones",
    title    = "The Hinterlands (48)",
    faction  = "Alliance",
    minLevel = 48, maxLevel = 48,
    next     = "alliance-50-searinggorge",
    steps    = {
        { accept = 2988, -- level 48
          note = "The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west." },
        { complete = 2988 }, -- level 48
        { turnin = 2988, accept = 2989 }, -- level 48
        { accept = { 2877, 2880 } }, -- level 48
        { complete = 2877 }, -- level 48
        { accept = 485, optional = true, -- level 48
          note = "If the starting item dropped: use it from your bags." },
        { turnin = 485, optional = true }, -- level 48
        { complete = { 2880, 2989 } }, -- level 48
        { turnin = { 2877, 2880 } }, -- level 48
        { turnin = 2989, accept = 2990 }, -- level 48
    },
})
