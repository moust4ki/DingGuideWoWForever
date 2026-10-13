-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/53_Azshara.lua.
-- Simulated: level 51 (23%) -> 51 (46%), 4 quests turned in, about 1 h 10 (31 728 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-53-azshara",
    pack     = "ding-zones",
    title    = "Azshara (51)",
    faction  = "Alliance",
    minLevel = 51, maxLevel = 51,
    next     = "alliance-54-felwood",
    steps    = {
        { accept = 3601, -- level 51
          note = "Azshara is east of Ashenvale." },
        { complete = 3601 }, -- level 51
        { turnin = 3601, accept = 5534 }, -- level 51
        { complete = 5534 }, -- level 51
        { turnin = 5534 }, -- level 51
        { accept = { 5535, 5536 } }, -- level 51
        { complete = 5535 }, -- level 51
        { complete = 5536 }, -- level 51
        { turnin = { 5535, 5536 } }, -- level 51
    },
})
