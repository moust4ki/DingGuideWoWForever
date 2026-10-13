-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/37_Dustwallow.lua.
-- Simulated: level 36 (50%) -> 37 (40%), 16 quests turned in, about 2 h 55 (23 086 XP per hour).
Ding.RegisterGuide({
    id       = "horde-37-dustwallow",
    pack     = "ding-zones",
    title    = "Dustwallow and Thousand Needles (36-37)",
    faction  = "Horde",
    minLevel = 36, maxLevel = 37,
    next     = "horde-39-arathi",
    steps    = {
        { accept = 1106, -- level 36
          note = "Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles." },
        { accept = 1175 }, -- level 36
        { complete = 1175 }, -- level 36
        { turnin = 1175 }, -- level 36
        { accept = { 1251, 1269, 1268 } }, -- level 36
        { accept = 1177 }, -- level 36
        { turnin = { 1269, 1268, 1251 }, accept = { 1321, 1201 } }, -- level 36
        { complete = 1201 }, -- level 36
        { turnin = 1201, accept = 1202 }, -- level 36
        { turnin = 1321, accept = 1322 }, -- level 36
        { accept = 1218 }, -- level 36
        { complete = 1218 }, -- level 36
        { complete = 1202 }, -- level 36
        { complete = 1177 }, -- level 36
        { turnin = 1218, accept = { 1206, 1238 } }, -- level 36
        { complete = 1206 }, -- level 36
        { turnin = { 1202, 1238 } }, -- level 37
        { turnin = 1177 }, -- level 37
        { accept = 1273 }, -- level 37
        { complete = { 1273, 1322 } }, -- level 37
        { turnin = 1206, accept = 1239 }, -- level 37
        { turnin = 1322, accept = 1323 }, -- level 37
        { turnin = { 1273, 1323 }, accept = 1276 }, -- level 37
        { turnin = 1239 }, -- level 37
        { turnin = 1276 }, -- level 37
    },
})
