-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/39_Arathi.lua.
-- Simulated: level 37 (40%) -> 38 (21%), 15 quests turned in, about 2 h 09 (27 189 XP per hour), plus up to 37 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-39-arathi",
    pack     = "ding-zones",
    title    = "Arathi Highlands (37-38)",
    faction  = "Horde",
    minLevel = 37, maxLevel = 38,
    next     = "horde-40-badlands",
    steps    = {
        { accept = 677, -- level 37
          note = "Back to the Arathi Highlands: Hammerfall is in the east of the zone." },
        { turnin = 638 }, -- level 37
        { sethearth = "Hammerfall" }, -- level 37
        { accept = 642 }, -- level 37
        { complete = 677 }, -- level 37
        { accept = 635, optional = true, -- level 37
          note = "If the starting item dropped: use it from your bags." },
        { hearth = true }, -- level 37
        { turnin = 677, accept = 678 }, -- level 37
        { complete = 642 }, -- level 37
        { turnin = 642, accept = 651 }, -- level 37
        { accept = 701 }, -- level 37
        { complete = { 701, 678 } }, -- level 37
        { hearth = true }, -- level 37
        { turnin = { 678, 701 }, accept = 702 }, -- level 37
        { turnin = 702, accept = 847 }, -- level 37
        { turnin = 847 }, -- level 37
        { complete = 651 }, -- level 37
        { turnin = 635, optional = true }, -- level 37
        { turnin = 651 }, -- level 37
        { accept = 663 }, -- level 37
        { turnin = 663 }, -- level 37
        { level = 38,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 662, 664, 665 } }, -- level 38
        { complete = 665 }, -- level 38
        { turnin = 665, accept = 666 }, -- level 38
        { complete = { 662, 666, 664 } }, -- level 38
        { turnin = { 662, 664, 666 }, accept = 668 }, -- level 38
        { turnin = 668, accept = 669 }, -- level 38
    },
})
