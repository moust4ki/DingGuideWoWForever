-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/57_WesternPlaguelands.lua.
-- Simulated: level 54 (56%) -> 55 (30%), 22 quests turned in, about 2 h 40 (44 860 XP per hour), plus up to 26 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-57-wpl",
    pack     = "ding-zones",
    title    = "Western Plaguelands (54-55)",
    faction  = "Alliance",
    minLevel = 54, maxLevel = 55,
    next     = "alliance-58-epl",
    steps    = {
        { accept = 5092, -- level 54
          note = "The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone." },
        { accept = 4984 }, -- level 54
        { complete = 4984 }, -- level 54
        { accept = 5021 }, -- level 54
        { turnin = 5021, accept = 5022 }, -- level 54
        { complete = 5092 }, -- level 54
        { turnin = 5092, accept = { 5215, 5097 } }, -- level 54
        { turnin = 5215, accept = 5216 }, -- level 54
        { complete = 5216 }, -- level 54
        { turnin = 5216, accept = 5217 }, -- level 54
        { accept = 4971 }, -- level 54
        { sethearth = "Ironforge" }, -- level 54
        { turnin = 5022 }, -- level 54
        { hearth = true }, -- level 54
        { turnin = 5217, accept = { 5219, 5401 } }, -- level 54
        { turnin = { 5401, 6028 } }, -- level 54
        { complete = 5097 }, -- level 54
        { turnin = 4984, accept = 4985 }, -- level 54
        { complete = 5219 }, -- level 54
        { turnin = 5219, accept = { 5220, 5058 } }, -- level 54
        { turnin = 5058, accept = 5060 }, -- level 54
        { accept = 6004 }, -- level 54
        { complete = 6004 }, -- level 54
        { turnin = 6004 }, -- level 54
        { complete = 4985 }, -- level 54
        { turnin = 4985 }, -- level 54
        { turnin = 5220, accept = 5222 }, -- level 54
        { turnin = 5097 }, -- level 54
        { level = 55,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 5533 }, -- level 55
        { turnin = 5533, accept = 5537 }, -- level 55
        { complete = 4971 }, -- level 55
        { complete = 5060 }, -- level 55
        { turnin = 5060 }, -- level 55
        { complete = 5537 }, -- level 55
        { complete = 5222 }, -- level 55
        { turnin = 5222, accept = 5223 }, -- level 55
        { turnin = { 5223, 5537 } }, -- level 55
        { turnin = 4971, accept = 4972 }, -- level 55
        { complete = 4972 }, -- level 55
        { turnin = 4972 }, -- level 55
    },
})
