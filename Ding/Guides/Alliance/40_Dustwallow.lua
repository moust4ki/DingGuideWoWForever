-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/40_Dustwallow.lua.
-- Simulated: level 40 (0%) -> 40 (58%), 17 quests turned in, about 2 h 06 (25 281 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-40-dustwallow",
    pack     = "ding-zones",
    title    = "Dustwallow Marsh (40)",
    faction  = "Alliance",
    minLevel = 40, maxLevel = 40,
    next     = "alliance-41-badlands",
    steps    = {
        { accept = 1282, -- level 40
          note = "Boat from Menethil to Theramore, the Alliance base on the edge of the marsh." },
        { turnin = 1282 }, -- level 40
        { sethearth = "Theramore" }, -- level 40
        { accept = 1204 }, -- level 40
        { accept = 1218 }, -- level 40
        { accept = 1177 }, -- level 40
        { accept = { 1284, 1252, 1253 } }, -- level 40
        { hearth = true }, -- level 40
        { turnin = { 1284, 1253, 1252 }, accept = { 1319, 1259 } }, -- level 40
        { complete = 1218 }, -- level 40
        { turnin = 1319, accept = 1320 }, -- level 40
        { turnin = 1259, accept = 1285 }, -- level 40
        { turnin = { 1320, 1285 }, accept = 1286 }, -- level 40
        { complete = { 1177, 1204 } }, -- level 40
        { turnin = 1218, accept = { 1206, 1219 } }, -- level 40
        { accept = 1222 }, -- level 40
        { complete = 1206 }, -- level 40
        { turnin = 1177 }, -- level 40
        { turnin = 1286, accept = 1287 }, -- level 40
        { complete = 1222 }, -- level 40
        { turnin = 1206 }, -- level 40
        { hearth = true }, -- level 40
        { turnin = { 1204, 1222 } }, -- level 40
        { turnin = { 1287, 1219 }, accept = 1220 }, -- level 40
        { turnin = 1220 }, -- level 40
    },
})
