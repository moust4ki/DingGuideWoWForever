-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/54_Felwood.lua.
-- Simulated: level 51 (46%) -> 54 (6%), 15 quests turned in, about 4 h 13 (32 722 XP per hour), plus up to 19 h 29 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-54-felwood",
    pack     = "ding-zones",
    title    = "Felwood (51-54)",
    faction  = "Alliance",
    minLevel = 51, maxLevel = 54,
    next     = "alliance-55-burningsteppes",
    steps    = {
        { accept = 5155, -- level 51
          note = "Felwood is north of Ashenvale: the Alliance base is in the south of the zone." },
        { complete = 5155 }, -- level 51
        { turnin = 5155, accept = 5157 }, -- level 51
        { accept = 8460 }, -- level 51
        { complete = 8460 }, -- level 51
        { turnin = 8460 }, -- level 51
        { level = 53,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 8462 }, -- level 53
        { accept = 4101 }, -- level 53
        { accept = 8461 }, -- level 53
        { complete = 8461 }, -- level 53
        { turnin = { 8462, 8461 }, accept = 8465 }, -- level 53
        { complete = 4101 }, -- level 53
        { turnin = 4101, accept = { 5884, 5882, 5883 } }, -- level 53
        { accept = { 4421, 5156 } }, -- level 53
        { complete = 4421 }, -- level 53
        { complete = 5884 }, -- level 53
        { complete = 5156 }, -- level 53
        { complete = 5882 }, -- level 53
        { accept = 939, optional = true, -- level 53
          note = "If the starting item dropped: use it from your bags." },
        { accept = 5202 }, -- level 53
        { complete = 5883 }, -- level 53
        { complete = 939, optional = true }, -- level 53
        { turnin = 5202, accept = 5203 }, -- level 53
        { complete = { 5203, 5157 } }, -- level 53
        { turnin = 4421 }, -- level 53
        { turnin = 939, optional = true }, -- level 53
        { accept = 4906 }, -- level 53
        { turnin = 5203 }, -- level 53
        { turnin = { 5884, 5883, 5882 } }, -- level 53
        { turnin = { 5157, 5156 } }, -- level 53
        { level = 54,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 5249 }, -- level 54
        { complete = 4906 }, -- level 54
        { turnin = 4906 }, -- level 54
    },
})
