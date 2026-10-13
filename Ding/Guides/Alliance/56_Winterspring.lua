-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/56_Winterspring.lua.
-- Simulated: level 54 (39%) -> 54 (56%), 8 quests turned in, about 53 min (42 790 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-56-winterspring",
    pack     = "ding-zones",
    title    = "Winterspring (54)",
    faction  = "Alliance",
    minLevel = 54, maxLevel = 54,
    next     = "alliance-57-wpl",
    steps    = {
        { accept = { 5601, 6028, 6030, 3783 }, -- level 54
          note = "Winterspring is northeast of Felwood: Everlook is your base." },
        { turnin = 5249, accept = 5244 }, -- level 54
        { turnin = 5244, accept = 5245 }, -- level 54
        { accept = 5082 }, -- level 54
        { turnin = 8465 }, -- level 54
        { complete = 5082 }, -- level 54
        { accept = 5083, optional = true, -- level 54
          note = "If the starting item dropped: use it from your bags." },
        { complete = 3783 }, -- level 54
        { turnin = { 4808, 3783 }, accept = 6603 }, -- level 54
        { complete = 5245 }, -- level 54
        { turnin = 6603 }, -- level 54
        { turnin = 5083, optional = true }, -- level 54
        { turnin = 5082 }, -- level 54
    },
})
