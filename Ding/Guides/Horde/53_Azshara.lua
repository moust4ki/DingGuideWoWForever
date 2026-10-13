-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/53_Azshara.lua.
-- Simulated: level 51 (29%) -> 51 (62%), 8 quests turned in, about 1 h 21 (39 722 XP per hour).
Ding.RegisterGuide({
    id       = "horde-53-azshara",
    pack     = "ding-zones",
    title    = "Azshara (51)",
    faction  = "Horde",
    minLevel = 51, maxLevel = 51,
    next     = "horde-54-felwood",
    steps    = {
        { accept = 3517, -- level 51
          note = "Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base." },
        { complete = 3517 }, -- level 51
        { accept = 3601 }, -- level 51
        { complete = 3601 }, -- level 51
        { turnin = 3601, accept = 5534 }, -- level 51
        { complete = 5534 }, -- level 51
        { turnin = 5534 }, -- level 51
        { turnin = 3517, accept = { 3561, 3542 } }, -- level 51
        { turnin = 3561, accept = 3565 }, -- level 51
        { turnin = 3565, accept = 3541 }, -- level 51
        { turnin = 3541 }, -- level 51
        { accept = { 5536, 5535 } }, -- level 51
        { complete = 5535 }, -- level 51
        { complete = 5536 }, -- level 51
        { turnin = { 5536, 5535 } }, -- level 51
    },
})
