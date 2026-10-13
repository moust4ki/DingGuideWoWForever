-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/48_Hinterlands.lua.
-- Simulated: level 48 (18%) -> 49 (5%), 16 quests turned in, about 3 h 21 (35 386 XP per hour).
Ding.RegisterGuide({
    id       = "horde-48-hinterlands",
    pack     = "ding-zones",
    title    = "The Hinterlands (48-49)",
    faction  = "Horde",
    minLevel = 48, maxLevel = 49,
    next     = "horde-49-searinggorge",
    steps    = {
        { accept = { 7849, 7828, 7829, 7830, 7841, 7844 }, -- level 48
          note = "The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast." },
        { complete = 7829 }, -- level 48
        { accept = 485, optional = true, -- level 48
          note = "If the starting item dropped: use it from your bags." },
        { turnin = 485, optional = true }, -- level 48
        { complete = 7841 }, -- level 48
        { accept = 2742 }, -- level 48
        { complete = 2742 }, -- level 48
        { complete = 7828 }, -- level 48
        { complete = 7849 }, -- level 48
        { accept = 7839 }, -- level 48
        { sethearth = "Revantusk Village" }, -- level 48
        { accept = { 7840, 7850, 7815 } }, -- level 48
        { turnin = 7841, accept = 7842 }, -- level 48
        { complete = 7850 }, -- level 48
        { complete = { 7842, 7830 } }, -- level 48
        { hearth = true }, -- level 48
        { turnin = { 7850, 7829, 7828, 7849, 7830, 7842 }, accept = 7843 }, -- level 48
        { turnin = 2742, accept = 2782 }, -- level 48
        { complete = { 7840, 7815 } }, -- level 48
        { complete = { 7839, 7844 } }, -- level 48
        { complete = 7843 }, -- level 48
        { turnin = 2782 }, -- level 48
        { hearth = true }, -- level 48
        { turnin = { 7840, 7839, 7844, 7843, 7815 }, accept = 7845 }, -- level 49
        { turnin = 7845 }, -- level 49
    },
})
