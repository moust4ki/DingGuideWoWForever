-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/40_Badlands.lua.
-- Simulated: level 38 (21%) -> 38 (82%), 7 quests turned in, about 2 h 17 (21 872 XP per hour).
Ding.RegisterGuide({
    id       = "horde-40-badlands",
    pack     = "ding-zones",
    title    = "Badlands (38)",
    faction  = "Horde",
    minLevel = 38, maxLevel = 38,
    next     = "horde-41-stv",
    steps    = {
        { accept = 703, -- level 38
          note = "Fly from Hammerfall to Kargath, in the west of the Badlands." },
        { turnin = 1106, accept = 1108 }, -- level 38
        { accept = 709 }, -- level 38
        { complete = { 1108, 703 } }, -- level 38
        { turnin = { 703, 1108 } }, -- level 38
        { accept = 710 }, -- level 38
        { complete = 710 }, -- level 38
        { turnin = 710, accept = 711 }, -- level 38
        { complete = 711 }, -- level 38
        { sethearth = "Kargath" }, -- level 38
        { accept = { 1420, 1419 } }, -- level 38
        { turnin = 711 }, -- level 38
        { complete = 709 }, -- level 38
        { complete = 1419 }, -- level 38
        { turnin = 709 }, -- level 38
        { hearth = true }, -- level 38
        { turnin = 1419 }, -- level 38
    },
})
