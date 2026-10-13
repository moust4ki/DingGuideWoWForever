-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/22_Duskwood.lua.
-- Simulated: level 19 (77%) -> 20 (35%), 7 quests turned in, about 1 h 02 (12 518 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-22-duskwood",
    pack     = "ding-zones",
    title    = "Duskwood (19-20)",
    faction  = "Alliance",
    minLevel = 19, maxLevel = 20,
    next     = "alliance-24-wetlands",
    steps    = {
        { accept = 163, -- level 19
          note = "Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base." },
        { sethearth = "Darkshire" }, -- level 19
        { accept = 245 }, -- level 19
        { turnin = 163, accept = 5 }, -- level 19
        { accept = 226 }, -- level 19
        { complete = 226 }, -- level 19
        { turnin = 226 }, -- level 19
        { turnin = 5, accept = 93 }, -- level 19
        { complete = { 245, 93 } }, -- level 19
        { turnin = 93, accept = { 240, 96139 } }, -- level 20
        { turnin = 245 }, -- level 20
        { complete = 96139 }, -- level 20
        { turnin = 240 }, -- level 20
        { hearth = true }, -- level 20
        { turnin = 96139 }, -- level 20
    },
})
