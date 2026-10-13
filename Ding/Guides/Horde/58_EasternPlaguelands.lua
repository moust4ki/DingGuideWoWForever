-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/58_EasternPlaguelands.lua.
-- Simulated: level 56 (11%) -> 56 (65%), 12 quests turned in, about 3 h 14 (30 194 XP per hour).
Ding.RegisterGuide({
    id       = "horde-58-epl",
    pack     = "ding-zones",
    title    = "Eastern Plaguelands (56)",
    faction  = "Horde",
    minLevel = 56, maxLevel = 56,
    next     = "horde-59-silithus",
    steps    = {
        { accept = { 5543, 5542, 5544 }, -- level 56
          note = "The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east." },
        { accept = 6164 }, -- level 56
        { complete = 6164 }, -- level 56
        { complete = 5544 }, -- level 56
        { complete = 5542 }, -- level 56
        { complete = 5543 }, -- level 56
        { turnin = { 5542, 5543, 5544 }, accept = 5742 }, -- level 56
        { complete = 5742 }, -- level 56
        { turnin = 5742, accept = 5781 }, -- level 56
        { accept = 6042 }, -- level 56
        { complete = 5781 }, -- level 56
        { turnin = 5781, accept = 5845 }, -- level 56
        { complete = 6042 }, -- level 56
        { complete = 5845 }, -- level 56
        { sethearth = "Light's Hope Chapel" }, -- level 56
        { accept = 5211 }, -- level 56
        { accept = 6021 }, -- level 56
        { turnin = 5142 }, -- level 56
        { complete = 6021 }, -- level 56
        { turnin = 6042 }, -- level 56
        { turnin = 5845 }, -- level 56
        { turnin = 6164 }, -- level 56
        { complete = 5211 }, -- level 56
        { hearth = true }, -- level 56
        { turnin = { 5211, 6030 } }, -- level 56
        { turnin = 6021 }, -- level 56
    },
})
