-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/59_Silithus.lua.
-- Simulated: level 56 (65%) -> 60, 19 quests turned in, about 4 h 43 (38 918 XP per hour), plus up to 32 h 39 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "horde-59-silithus",
    pack     = "ding-zones",
    title    = "Silithus (56-60)",
    faction  = "Horde",
    minLevel = 56, maxLevel = 60,
    steps    = {
        { accept = { 8284, 8280, 8277 }, -- level 56
          note = "Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone." },
        { sethearth = "Cenarion Hold" }, -- level 56
        { complete = { 8280, 8277 } }, -- level 56
        { turnin = 8280, accept = 8281 }, -- level 56
        { complete = 8281 }, -- level 56
        { complete = 8284 }, -- level 56
        { hearth = true }, -- level 56
        { turnin = 8277, accept = 8278 }, -- level 56
        { turnin = { 8281, 8284 } }, -- level 56
        { level = 58,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 8304, 9416, 8285 } }, -- level 58
        { complete = 8278 }, -- level 58
        { turnin = 9416, accept = 9422 }, -- level 58
        { complete = 9422 }, -- level 58
        { turnin = 9422 }, -- level 58
        { turnin = 8285, accept = 8279 }, -- level 58
        { hearth = true }, -- level 58
        { turnin = 8278, accept = 8282 }, -- level 58
        { accept = 8318 }, -- level 58
        { complete = 8318 }, -- level 58
        { level = 59,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 8279 }, -- level 59
        { complete = { 8304, 8282 } }, -- level 59
        { turnin = 8279, accept = { 8287, 8323 } }, -- level 59
        { complete = 8323 }, -- level 59
        { turnin = 8323 }, -- level 59
        { hearth = true }, -- level 59
        { turnin = 8282 }, -- level 59
        { turnin = { 8287, 8304, 8318 } }, -- level 59
        { level = 60,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 8331, 8320 } }, -- level 60
        { complete = 8320 }, -- level 60
        { turnin = 8320, accept = { 8343, 8321, 8800 } }, -- level 60
        { complete = 8321 }, -- level 60
        { hearth = true }, -- level 60
        { turnin = { 8343, 8331, 8800 } }, -- level 60
        { turnin = 8321 }, -- level 60
    },
})
