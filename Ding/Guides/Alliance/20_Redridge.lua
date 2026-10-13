-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/20_Redridge.lua.
-- Simulated: level 18 (0%) -> 19 (77%), 13 quests turned in, about 2 h 06 (16 172 XP per hour), plus up to 15 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-20-redridge",
    pack     = "ding-zones",
    title    = "Redridge Mountains (18-19)",
    faction  = "Alliance",
    minLevel = 18, maxLevel = 19,
    next     = "alliance-22-duskwood",
    steps    = {
        { accept = 125, -- level 18
          note = "Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind." },
        { sethearth = "Lakeshire" }, -- level 18
        { accept = { 129, 92 } }, -- level 18
        { turnin = 129, accept = { 244, 130 } }, -- level 18
        { complete = 92 }, -- level 18
        { complete = 125 }, -- level 18
        { turnin = 244, accept = { 98407, 246 } }, -- level 18
        { turnin = 125, accept = 89 }, -- level 18
        { complete = 89 }, -- level 18
        { turnin = { 92, 130 }, accept = 131 }, -- level 18
        { complete = 98407 }, -- level 18
        { complete = 246 }, -- level 18
        { hearth = true }, -- level 18
        { turnin = 131 }, -- level 18
        { turnin = 89 }, -- level 18
        { turnin = { 246, 98407 }, accept = 3741 }, -- level 18
        { complete = 3741 }, -- level 18
        { turnin = 3741 }, -- level 18
        { level = 19,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 127, 98386 } }, -- level 19
        { accept = 20 }, -- level 19
        { complete = 127 }, -- level 19
        { complete = { 98386, 20 } }, -- level 19
        { hearth = true }, -- level 19
        { turnin = { 127, 98386 } }, -- level 19
        { turnin = 20 }, -- level 19
    },
})
