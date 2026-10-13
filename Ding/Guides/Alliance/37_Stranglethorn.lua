-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/37_Stranglethorn.lua.
-- Simulated: level 37 (27%) -> 39 (45%), 40 quests turned in, about 6 h 53 (22 358 XP per hour), plus up to 1 h 44 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-37-stv",
    pack     = "ding-zones",
    title    = "Stranglethorn Vale (37-39)",
    faction  = "Alliance",
    minLevel = 37, maxLevel = 39,
    next     = "alliance-39-arathi",
    steps    = {
        { accept = { 575, 605 }, -- level 37
          note = "Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south." },
        { sethearth = "Booty Bay" }, -- level 37
        { accept = { 201, 198, 616, 213, 189 } }, -- level 37
        { turnin = 616, accept = 578 }, -- level 37
        { complete = 578 }, -- level 37
        { complete = 605 }, -- level 37
        { accept = 583 }, -- level 37
        { turnin = 583, accept = { 194, 185, 190 } }, -- level 37
        { complete = 185 }, -- level 37
        { turnin = 185, accept = 186 }, -- level 37
        { complete = 201 }, -- level 37
        { turnin = 198, accept = 215 }, -- level 37
        { turnin = 215, accept = { 200, 203, 204 } }, -- level 37
        { complete = { 575, 190 } }, -- level 37
        { complete = { 213, 186 } }, -- level 37
        { complete = 203 }, -- level 37
        { turnin = 200, accept = 328 }, -- level 37
        { turnin = 328, accept = 329 }, -- level 37
        { complete = 204 }, -- level 37
        { turnin = 329, accept = 330 }, -- level 37
        { turnin = { 203, 204 }, accept = { 574, 207 } }, -- level 37
        { turnin = 190, accept = 191 }, -- level 37
        { turnin = 186, accept = 187 }, -- level 37
        { complete = 187 }, -- level 37
        { complete = 207 }, -- level 37
        { complete = { 189, 194 } }, -- level 37
        { complete = 191 }, -- level 37
        { turnin = 187, accept = 188 }, -- level 37
        { turnin = { 194, 5762 }, accept = 195 }, -- level 37
        { turnin = 191, accept = 192 }, -- level 37
        { turnin = 207, accept = 205 }, -- level 38
        { turnin = 330, accept = { 331, 210 } }, -- level 38
        { complete = 574 }, -- level 38
        { complete = 192 }, -- level 38
        { complete = 205 }, -- level 38
        { hearth = true }, -- level 38
        { turnin = 578, accept = 601 }, -- level 38
        { turnin = 575, accept = 577 }, -- level 38
        { complete = 601 }, -- level 38
        { complete = 195 }, -- level 38
        { complete = 188 }, -- level 38
        { turnin = { 195, 188, 192 } }, -- level 38
        { turnin = { 205, 331, 574 } }, -- level 38
        { complete = 577 }, -- level 38
        { hearth = true }, -- level 38
        { turnin = { 213, 189, 210, 201, 601, 577, 605 } }, -- level 38
        { level = 39,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 600, 606, 595 } }, -- level 39
        { turnin = 595, accept = 597 }, -- level 39
        { turnin = 597, accept = 599 }, -- level 39
        { turnin = 599, accept = 587 }, -- level 39
        { complete = 587 }, -- level 39
        { complete = 606 }, -- level 39
        { complete = 600 }, -- level 39
        { hearth = true }, -- level 39
        { turnin = { 587, 600 } }, -- level 39
        { turnin = 606, accept = 607 }, -- level 39
        { turnin = 607 }, -- level 39
    },
})
