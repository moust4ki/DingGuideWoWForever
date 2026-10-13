-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/54_Felwood.lua.
-- Simulated: level 51 (62%) -> 53 (37%), 15 quests turned in, about 2 h 50 (39 259 XP per hour), plus up to 11 h 34 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-54-felwood",
    pack     = "ding-zones",
    title    = "Felwood (51-53)",
    faction  = "Horde",
    minLevel = 51, maxLevel = 53,
    next     = "horde-56-wpl",
    steps    = {
        { accept = 5155, -- level 51
          note = "Felwood is north of Ashenvale: the Horde post is in the west of the zone." },
        { complete = 5155 }, -- level 51
        { accept = 6162 }, -- level 51
        { turnin = 5155, accept = 5157 }, -- level 51
        { accept = 8460 }, -- level 51
        { complete = { 8460, 6162 } }, -- level 51
        { turnin = 8460 }, -- level 51
        { level = 52,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 5156 }, -- level 52
        { turnin = 6162, accept = 4505 }, -- level 52
        { complete = 4505 }, -- level 52
        { complete = 5157 }, -- level 52
        { turnin = 4505, accept = 4506 }, -- level 52
        { complete = 4506 }, -- level 52
        { turnin = 4506 }, -- level 52
        { complete = 5156 }, -- level 52
        { turnin = { 5156, 5157 } }, -- level 52
        { level = 53,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 8462 }, -- level 53
        { accept = 4102 }, -- level 53
        { turnin = 8462, accept = 8461 }, -- level 53
        { complete = 8461 }, -- level 53
        { turnin = 8461, accept = 8465 }, -- level 53
        { complete = 4102 }, -- level 53
        { turnin = 4102, accept = { 5887, 5889, 5888 } }, -- level 53
        { complete = 5888 }, -- level 53
        { complete = 5887 }, -- level 53
        { accept = 5202 }, -- level 53
        { turnin = 5202, accept = 5203 }, -- level 53
        { complete = { 5203, 5889 } }, -- level 53
        { turnin = { 5887, 5889, 5888 } }, -- level 53
        { turnin = 5203 }, -- level 53
    },
})
