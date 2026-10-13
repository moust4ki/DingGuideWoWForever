-- Drafted by tools/draft_guide.lua from tools/routes/nightelf.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/NightElf/04_LochModan.lua.
-- Simulated: level 19 (74%) -> 20 (92%), 20 quests turned in, about 2 h 11 (12 291 XP per hour).
Ding.RegisterGuide({
    id       = "nightelf-04-lochmodan",
    pack     = "ding-zones",
    title    = "Loch Modan (19-21)",
    faction  = "Alliance",
    races    = { "NightElf" },
    minLevel = 19, maxLevel = 21,
    next     = "alliance-20-redridge",
    steps    = {
        { accept = 86614, -- level 19
          note = "Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base." },
        { sethearth = "Thelsamar" }, -- level 19
        { accept = { 1339, 468 } }, -- level 19
        { accept = 224 }, -- level 19
        { complete = 224 }, -- level 19
        { accept = 267 }, -- level 19
        { turnin = 224, accept = 237 }, -- level 19
        { accept = 86585 }, -- level 19
        { complete = { 267, 237 } }, -- level 19
        { turnin = { 267, 237 }, accept = 263 }, -- level 20
        { complete = { 86585, 263 } }, -- level 20
        { turnin = { 263, 86585 }, accept = 217 }, -- level 20
        { complete = 217 }, -- level 20
        { turnin = 217 }, -- level 20
        { turnin = 1339, accept = 307 }, -- level 20
        { complete = 307 }, -- level 20
        { turnin = 307 }, -- level 20
        { turnin = 468 }, -- level 20
        { accept = 250 }, -- level 20
        { turnin = 250, accept = 199 }, -- level 20
        { accept = 2038 }, -- level 20
        { accept = { 297, 298 } }, -- level 20
        { complete = 297 }, -- level 20
        { accept = { 257, 385, 86758 } }, -- level 20
        { complete = 257 }, -- level 20
        { turnin = 257, accept = 258 }, -- level 20
        { hearth = true }, -- level 20
        { turnin = 298, accept = 436 }, -- level 20
        { turnin = 86614 }, -- level 20
        { complete = 2038 }, -- level 20
        { turnin = 199 }, -- level 20
        { complete = { 86758, 258 } }, -- level 20
        { complete = 385 }, -- level 20
        { turnin = 2038 }, -- level 20
        { turnin = { 436, 297 } }, -- level 20
        { turnin = { 385, 86758, 258 } }, -- level 20
    },
})
