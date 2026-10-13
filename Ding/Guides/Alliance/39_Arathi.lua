-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/39_Arathi.lua.
-- Simulated: level 39 (45%) -> 40 (0%), 12 quests turned in, about 2 h 07 (22 130 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-39-arathi",
    pack     = "ding-zones",
    title    = "Arathi Highlands (39-40)",
    faction  = "Alliance",
    minLevel = 39, maxLevel = 40,
    next     = "alliance-40-dustwallow",
    steps    = {
        { accept = 663, -- level 39
          note = "The Arathi Highlands are north of the Wetlands, across Thandol Span." },
        { turnin = 663, accept = { 662, 664, 665 } }, -- level 39
        { complete = 665 }, -- level 39
        { turnin = 665, accept = 666 }, -- level 39
        { complete = { 662, 666, 664 } }, -- level 39
        { accept = 635, optional = true, -- level 39
          note = "If the starting item dropped: use it from your bags." },
        { turnin = { 662, 664, 666 }, accept = 668 }, -- level 39
        { turnin = 668 }, -- level 39
        { accept = 691 }, -- level 39
        { turnin = 635, optional = true }, -- level 39
        { accept = 642 }, -- level 39
        { complete = 642 }, -- level 39
        { turnin = 642, accept = 651 }, -- level 39
        { complete = 691 }, -- level 39
        { turnin = 691, accept = { 693, 8260 } }, -- level 39
        { turnin = 8260 }, -- level 39
        { complete = 651 }, -- level 39
        { complete = 693 }, -- level 39
        { turnin = 651 }, -- level 39
        { turnin = 693 }, -- level 39
    },
})
