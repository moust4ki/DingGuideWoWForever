-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/47_Feralas.lua.
-- Simulated: level 47 (12%) -> 48 (9%), 28 quests turned in, about 3 h 27 (34 893 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-47-feralas",
    pack     = "ding-zones",
    title    = "Feralas (47-48)",
    faction  = "Alliance",
    minLevel = 47, maxLevel = 48,
    next     = "alliance-49-hinterlands",
    steps    = {
        { accept = 2866, -- level 47
          note = "The Alliance stronghold of Feralas is on an island west of the zone." },
        { turnin = 2866, accept = 2867 }, -- level 47
        { accept = 2821 }, -- level 47
        { sethearth = "Feathermoon Stronghold" }, -- level 47
        { turnin = 2867, accept = 3130 }, -- level 47
        { turnin = 3130, accept = { 4124, 2869 } }, -- level 47
        { accept = 2982 }, -- level 47
        { turnin = 4124, accept = 4125 }, -- level 47
        { accept = { 7003, 7721 } }, -- level 47
        { complete = 2821 }, -- level 47
        { accept = 2766, optional = true, -- level 47
          note = "If the starting item dropped: use it from your bags." },
        { turnin = 4125, accept = 4127 }, -- level 47
        { complete = 2869 }, -- level 47
        { hearth = true }, -- level 47
        { turnin = 2821, accept = 7733 }, -- level 47
        { turnin = 4127, accept = 4129 }, -- level 47
        { turnin = 4129, accept = 4130 }, -- level 47
        { turnin = 4130, accept = 4131 }, -- level 47
        { complete = { 7003, 7721 } }, -- level 47
        { accept = 2844 }, -- level 47
        { turnin = 2844, accept = 2845 }, -- level 47
        { complete = 2845 }, -- level 47
        { turnin = 2845 }, -- level 47
        { complete = 7733 }, -- level 47
        { accept = 2969 }, -- level 47
        { complete = 2969 }, -- level 47
        { turnin = 2969, accept = 2970 }, -- level 47
        { complete = 2970 }, -- level 47
        { turnin = 2970, accept = 2972 }, -- level 47
        { turnin = 4131, accept = 4135 }, -- level 47
        { turnin = 4135, accept = 4265 }, -- level 47
        { complete = 4265 }, -- level 47
        { complete = 2982 }, -- level 47
        { turnin = 2766, optional = true }, -- level 47
        { turnin = { 7721, 7003 } }, -- level 47
        { turnin = 4265, accept = 4266 }, -- level 47
        { turnin = 2982 }, -- level 47
        { turnin = 2869, accept = 2870 }, -- level 47
        { complete = 2870 }, -- level 47
        { hearth = true }, -- level 47
        { turnin = 2870, accept = 2871 }, -- level 47
        { turnin = 4266, accept = 4267 }, -- level 47
        { turnin = 2871 }, -- level 47
        { turnin = 7733 }, -- level 47
        { turnin = { 2972, 4267, 162 } }, -- level 48
    },
})
