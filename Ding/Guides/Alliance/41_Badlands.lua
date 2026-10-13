-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/41_Badlands.lua.
-- Simulated: level 40 (58%) -> 41 (12%), 10 quests turned in, about 1 h 42 (29 325 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-41-badlands",
    pack     = "ding-zones",
    title    = "Badlands (40-41)",
    faction  = "Alliance",
    minLevel = 40, maxLevel = 41,
    next     = "alliance-42-swamp",
    steps    = {
        { accept = 710, -- level 40
          note = "The Badlands are southeast of Loch Modan." },
        { complete = 710 }, -- level 40
        { turnin = 710, accept = 711 }, -- level 40
        { accept = 718 }, -- level 40
        { accept = 720 }, -- level 40
        { complete = 718 }, -- level 40
        { turnin = 718, accept = 733 }, -- level 40
        { turnin = 720, accept = { 719, 721 } }, -- level 40
        { accept = 709 }, -- level 40
        { complete = 711 }, -- level 40
        { complete = 733 }, -- level 40
        { turnin = 711 }, -- level 40
        { turnin = 721 }, -- level 40
        { complete = { 709, 719 } }, -- level 40
        { turnin = { 719, 733 } }, -- level 40
        { accept = 732 }, -- level 41
        { accept = 703 }, -- level 41
        { complete = 732 }, -- level 41
        { complete = 703 }, -- level 41
        { turnin = 703 }, -- level 41
        { turnin = 732 }, -- level 41
        { turnin = 709 }, -- level 41
    },
})
