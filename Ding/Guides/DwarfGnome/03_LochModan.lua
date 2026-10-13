-- Drafted by tools/draft_guide.lua from tools/routes/dwarf_gnome.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/DwarfGnome/03_LochModan.lua.
-- Simulated: level 11 (32%) -> 14 (62%), 17 quests turned in, about 2 h 38 (12 723 XP per hour), plus up to 22 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "dwarf-03-lochmodan",
    pack     = "ding-zones",
    title    = "Loch Modan (11-14)",
    faction  = "Alliance",
    races    = { "Dwarf", "Gnome" },
    minLevel = 11, maxLevel = 14,
    next     = "dwarf-04-westfall",
    steps    = {
        { accept = { 267, 224 }, -- level 11
          note = "Take the road east through the South Gate tunnel to Thelsamar." },
        { turnin = 414, accept = { 416, 418 } }, -- level 11
        { sethearth = "Thelsamar" }, -- level 11
        { accept = 6387 }, -- level 11
        { complete = 418 }, -- level 11
        { complete = { 416, 267 } }, -- level 11
        { turnin = { 416, 418, 6387 }, accept = 6391 }, -- level 12
        { complete = 224 }, -- level 12
        { turnin = { 267, 224 }, accept = 237 }, -- level 13
        { complete = 237 }, -- level 13
        { turnin = 237, accept = 263 }, -- level 13
        { accept = 1339 }, -- level 13
        { turnin = 1339, accept = { 307, 1338 } }, -- level 13
        { complete = 307 }, -- level 13
        { turnin = 307 }, -- level 13
        { accept = 2038 }, -- level 13
        { accept = 298 }, -- level 13
        { accept = 385 }, -- level 13
        { hearth = true }, -- level 13
        { turnin = 298, accept = 301 }, -- level 13
        { complete = 2038 }, -- level 13
        { complete = 385 }, -- level 13
        { turnin = 2038 }, -- level 13
        { turnin = 385 }, -- level 13
        { level = 14,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 86758, 257 } }, -- level 14
        { complete = 257 }, -- level 14
        { complete = { 263, 86758 } }, -- level 14
        { turnin = { 86758, 257 } }, -- level 14
        { hearth = true }, -- level 14
        { turnin = 263 }, -- level 14
        { turnin = 6391 }, -- level 14
        { turnin = 301 }, -- level 14
    },
})
