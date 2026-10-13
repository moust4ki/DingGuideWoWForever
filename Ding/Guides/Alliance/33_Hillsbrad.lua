-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/33_Hillsbrad.lua.
-- Simulated: level 32 (13%) -> 32 (98%), 11 quests turned in, about 2 h 27 (19 062 XP per hour), plus up to 5 h 25 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-33-hillsbrad",
    pack     = "ding-zones",
    title    = "Hillsbrad Foothills (32-34)",
    faction  = "Alliance",
    minLevel = 32, maxLevel = 34,
    next     = "alliance-34-needles",
    steps    = {
        { accept = 536, -- level 32
          note = "From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base." },
        { accept = 505 }, -- level 32
        { complete = 536 }, -- level 32
        { sethearth = "Southshore" }, -- level 32
        { accept = { 555, 564 } }, -- level 32
        { complete = 505 }, -- level 32
        { complete = 555 }, -- level 32
        { accept = { 510, 511 } }, -- level 32
        { complete = 564 }, -- level 32
        { hearth = true }, -- level 32
        { turnin = 536, accept = 559 }, -- level 32
        { complete = 559 }, -- level 32
        { turnin = { 510, 505, 511 }, accept = 514 }, -- level 32
        { turnin = 559, accept = 560 }, -- level 32
        { turnin = 560, accept = 561 }, -- level 32
        { turnin = 561, accept = 562 }, -- level 32
        { complete = 562 }, -- level 32
        { turnin = { 555, 562, 564 } }, -- level 32
        { turnin = 514 }, -- level 32
        { level = 34,
          note = "Finish the level on nearby monsters before moving on." },
    },
})
