-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/50_UnGoro.lua.
-- Simulated: level 50 (5%) -> 51 (29%), 15 quests turned in, about 2 h 28 (37 830 XP per hour), plus up to 6 h 26 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-50-ungoro",
    pack     = "ding-zones",
    title    = "Un'Goro Crater (50-51)",
    faction  = "Horde",
    minLevel = 50, maxLevel = 51,
    next     = "horde-53-azshara",
    steps    = {
        { accept = { 3883, 3882 }, -- level 50
          note = "Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan." },
        { accept = 4503 }, -- level 50
        { complete = 4503 }, -- level 50
        { accept = 3884, optional = true, -- level 50
          note = "If the starting item dropped: use it from your bags." },
        { accept = 3844 }, -- level 50
        { turnin = 3844 }, -- level 50
        { complete = 3883 }, -- level 50
        { complete = 3882 }, -- level 50
        { turnin = 4503 }, -- level 50
        { turnin = { 3882, 3883 } }, -- level 50
        { turnin = 3884, optional = true }, -- level 50
        { level = 51,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 3881 }, -- level 51
        { accept = 4284 }, -- level 51
        { accept = 4145 }, -- level 51
        { accept = 4243 }, -- level 51
        { complete = 4284 }, -- level 51
        { turnin = 4284, accept = { 4287, 4288, 4285 } }, -- level 51
        { complete = 4145 }, -- level 51
        { complete = 3881 }, -- level 51
        { complete = 4288 }, -- level 51
        { accept = 4290 }, -- level 51
        { complete = 4290 }, -- level 51
        { turnin = 4290, accept = 4291 }, -- level 51
        { complete = 4291 }, -- level 51
        { turnin = 4291 }, -- level 51
        { complete = 4287 }, -- level 51
        { turnin = 4243 }, -- level 51
        { complete = 4285 }, -- level 51
        { turnin = { 4145, 3881 } }, -- level 51
        { turnin = { 4287, 4288, 4285 }, accept = 4321 }, -- level 51
        { turnin = 4321 }, -- level 51
    },
})
