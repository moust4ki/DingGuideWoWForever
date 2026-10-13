-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/56_WesternPlaguelands.lua.
-- Simulated: level 53 (37%) -> 55 (12%), 11 quests turned in, about 56 min (61 756 XP per hour), plus up to 16 h 19 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-56-wpl",
    pack     = "ding-zones",
    title    = "Western Plaguelands (53-55)",
    faction  = "Horde",
    minLevel = 53, maxLevel = 55,
    next     = "horde-57-winterspring",
    steps    = {
        { accept = 5401, -- level 53
          note = "The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill." },
        { turnin = 5401 }, -- level 53
        { accept = 5142 }, -- level 53
        { accept = 4984 }, -- level 53
        { complete = 4984 }, -- level 53
        { accept = 5021 }, -- level 53
        { turnin = 5021, accept = 5023 }, -- level 53
        { turnin = 5023 }, -- level 53
        { turnin = 3542 }, -- level 53
        { level = 54,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 4971 }, -- level 54
        { turnin = 4984, accept = 4985 }, -- level 54
        { complete = 4985 }, -- level 54
        { turnin = 4985 }, -- level 54
        { accept = 6004 }, -- level 54
        { complete = 6004 }, -- level 54
        { turnin = 6004 }, -- level 54
        { accept = { 5060, 5058 } }, -- level 54
        { turnin = 5058 }, -- level 54
        { level = 55,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 5060 }, -- level 55
        { turnin = 5060 }, -- level 55
        { complete = 4971 }, -- level 55
        { turnin = 4971, accept = 4972 }, -- level 55
        { complete = 4972 }, -- level 55
        { turnin = 4972 }, -- level 55
    },
})
