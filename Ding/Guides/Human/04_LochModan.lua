-- Drafted by tools/draft_guide.lua from tools/routes/human.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Human/04_LochModan.lua.
-- Simulated: level 16 (46%) -> 18 (61%), 21 quests turned in, about 2 h 51 (13 445 XP per hour).
Ding.RegisterGuide({
    id       = "human-04-lochmodan",
    pack     = "ding-zones",
    title    = "Loch Modan (16-18)",
    faction  = "Alliance",
    races    = { "Human" },
    minLevel = 16, maxLevel = 18,
    next     = "alliance-20-redridge",
    steps    = {
        { accept = { 418, 1339, 416 }, -- level 16
          note = "Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar." },
        { sethearth = "Thelsamar" }, -- level 16
        { turnin = 1339, accept = 307 }, -- level 16
        { complete = { 416, 307 } }, -- level 16
        { turnin = 307 }, -- level 16
        { turnin = 416 }, -- level 16
        { accept = 224 }, -- level 16
        { complete = 224 }, -- level 16
        { accept = 267 }, -- level 16
        { turnin = 224, accept = 237 }, -- level 16
        { complete = 237 }, -- level 16
        { turnin = 237, accept = 263 }, -- level 17
        { accept = 86585 }, -- level 17
        { complete = { 267, 263 } }, -- level 17
        { turnin = { 263, 267 }, accept = 217 }, -- level 17
        { complete = { 86585, 217 } }, -- level 17
        { turnin = { 86585, 217 } }, -- level 17
        { accept = { 297, 298 } }, -- level 17
        { accept = 257 }, -- level 17
        { complete = 257 }, -- level 17
        { turnin = 257, accept = { 258, 86758, 385 } }, -- level 17
        { complete = 418 }, -- level 17
        { complete = 258 }, -- level 17
        { accept = 2038 }, -- level 17
        { hearth = true }, -- level 17
        { turnin = { 418, 298 }, accept = 436 }, -- level 18
        { accept = 86614 }, -- level 18
        { turnin = 86614 }, -- level 18
        { complete = 2038 }, -- level 18
        { accept = 250 }, -- level 18
        { turnin = 250, accept = 199 }, -- level 18
        { turnin = 199 }, -- level 18
        { complete = { 86758, 385 } }, -- level 18
        { turnin = 2038 }, -- level 18
        { complete = 297 }, -- level 18
        { turnin = { 436, 297 } }, -- level 18
        { turnin = { 86758, 385, 258 } }, -- level 18
    },
})
