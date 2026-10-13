-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/58_EasternPlaguelands.lua.
-- Simulated: level 55 (30%) -> 56 (25%), 13 quests turned in, about 2 h 54 (31 170 XP per hour), plus up to 4 h 58 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-58-epl",
    pack     = "ding-zones",
    title    = "Eastern Plaguelands (55-56)",
    faction  = "Alliance",
    minLevel = 55, maxLevel = 56,
    next     = "alliance-59-silithus",
    steps    = {
        { accept = { 5544, 5543 }, -- level 55
          note = "The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east." },
        { accept = 6164 }, -- level 55
        { complete = 6164 }, -- level 55
        { turnin = 6164 }, -- level 55
        { turnin = 5245 }, -- level 55
        { complete = 5544 }, -- level 55
        { sethearth = "Light's Hope Chapel" }, -- level 55
        { accept = 5211 }, -- level 55
        { turnin = 6030 }, -- level 55
        { accept = 6021 }, -- level 55
        { complete = 5543 }, -- level 55
        { turnin = 5601 }, -- level 55
        { complete = 6021 }, -- level 55
        { turnin = { 5544, 5543 }, accept = 5542 }, -- level 55
        { hearth = true }, -- level 55
        { turnin = 6021 }, -- level 55
        { level = 56,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 5211 }, -- level 56
        { complete = 5542 }, -- level 56
        { turnin = 5542, accept = 5742 }, -- level 56
        { complete = 5742 }, -- level 56
        { turnin = 5742, accept = 5781 }, -- level 56
        { complete = 5781 }, -- level 56
        { turnin = 5781, accept = 5845 }, -- level 56
        { hearth = true }, -- level 56
        { turnin = 5211 }, -- level 56
        { complete = 5845 }, -- level 56
        { turnin = 5845 }, -- level 56
        { accept = 6023 }, -- level 56
        { complete = 6023 }, -- level 56
        { turnin = 6023 }, -- level 56
    },
})
