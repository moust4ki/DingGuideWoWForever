-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/24_Wetlands.lua.
-- Simulated: level 20 (35%) -> 26 (18%), 25 quests turned in, about 3 h 12 (19 372 XP per hour), plus up to 12 h 27 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-24-wetlands",
    pack     = "ding-zones",
    title    = "Wetlands (20-26)",
    faction  = "Alliance",
    minLevel = 20, maxLevel = 26,
    next     = "alliance-26-ashenvale",
    steps    = {
        { accept = { 463, 98282 }, -- level 20
          note = "The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base." },
        { sethearth = "Menethil Harbor" }, -- level 20
        { accept = { 279, 484 } }, -- level 20
        { level = 21,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 279 }, -- level 21
        { complete = 484 }, -- level 21
        { accept = 469 }, -- level 21
        { turnin = 463, accept = 276 }, -- level 21
        { complete = 276 }, -- level 21
        { complete = 98282 }, -- level 21
        { turnin = 276, accept = 277 }, -- level 21
        { hearth = true }, -- level 21
        { turnin = { 484, 279 } }, -- level 21
        { level = 23,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 281, 98189 } }, -- level 23
        { accept = 470 }, -- level 23
        { complete = 277 }, -- level 23
        { complete = 470 }, -- level 23
        { turnin = 277 }, -- level 23
        { hearth = true }, -- level 23
        { accept = 305 }, -- level 23
        { turnin = 281, accept = 284 }, -- level 23
        { accept = 294 }, -- level 23
        { turnin = 305, accept = 306 }, -- level 23
        { level = 25,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 299 }, -- level 25
        { accept = 275 }, -- level 25
        { hearth = true }, -- level 25
        { turnin = 98189, accept = { 471, 98072, 472 } }, -- level 25
        { turnin = 306 }, -- level 25
        { turnin = 284, accept = 285 }, -- level 25
        { turnin = 285, accept = 286 }, -- level 25
        { complete = { 471, 275 } }, -- level 25
        { complete = 294 }, -- level 25
        { turnin = 294, accept = 295 }, -- level 25
        { complete = { 295, 299 } }, -- level 25
        { turnin = { 295, 299 } }, -- level 25
        { turnin = 275 }, -- level 25
        { complete = 98072 }, -- level 25
        { turnin = 472 }, -- level 25
        { hearth = true }, -- level 25
        { turnin = { 98282, 470 }, accept = 288 }, -- level 25
        { complete = 288 }, -- level 25
        { turnin = 288 }, -- level 25
        { turnin = { 286, 98072, 471, 469 }, accept = { 98221, 464 } }, -- level 26
        { complete = 464 }, -- level 26
        { turnin = { 464, 98221 } }, -- level 26
    },
})
