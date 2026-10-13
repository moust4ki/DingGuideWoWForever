-- Drafted by tools/draft_guide.lua from tools/routes/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Horde/35_Stranglethorn.lua.
-- Simulated: level 34 (51%) -> 36 (50%), 24 quests turned in, about 6 h 11 (21 526 XP per hour).
Ding.RegisterGuide({
    id       = "horde-35-stv",
    pack     = "ding-zones",
    title    = "Stranglethorn Vale (34-36)",
    faction  = "Horde",
    minLevel = 34, maxLevel = 36,
    next     = "horde-37-dustwallow",
    steps    = {
        { accept = 583, -- level 34
          note = "Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn." },
        { turnin = { 583, 5763 }, accept = { 194, 185 } }, -- level 34
        { complete = 194 }, -- level 34
        { complete = 185 }, -- level 34
        { accept = 190 }, -- level 34
        { turnin = 185, accept = 186 }, -- level 34
        { complete = 186 }, -- level 34
        { turnin = 194, accept = 195 }, -- level 34
        { turnin = 186, accept = 187 }, -- level 34
        { complete = 190 }, -- level 34
        { accept = 568 }, -- level 34
        { sethearth = "Grom'gol" }, -- level 34
        { accept = 581 }, -- level 34
        { complete = { 195, 568, 187 } }, -- level 34
        { turnin = { 187, 190 }, accept = 191 }, -- level 34
        { complete = 191 }, -- level 34
        { complete = 581 }, -- level 34
        { hearth = true }, -- level 35
        { turnin = 568, accept = { 569, 596, 629 } }, -- level 35
        { turnin = 581, accept = { 638, 582 } }, -- level 35
        { complete = 629 }, -- level 35
        { complete = { 596, 582 } }, -- level 35
        { hearth = true }, -- level 35
        { complete = 569 }, -- level 35
        { accept = { 213, 189, 605, 575 } }, -- level 35
        { sethearth = "Booty Bay" }, -- level 35
        { accept = 201 }, -- level 35
        { turnin = { 569, 629, 596, 582 } }, -- level 35
        { complete = 605 }, -- level 35
        { complete = 189 }, -- level 35
        { complete = 575 }, -- level 35
        { accept = 188 }, -- level 35
        { turnin = { 195, 191 }, accept = 192 }, -- level 36
        { hearth = true }, -- level 36
        { turnin = 575, accept = 577 }, -- level 36
        { accept = 570 }, -- level 36
        { complete = { 570, 192 } }, -- level 36
        { turnin = 570 }, -- level 36
        { complete = 188 }, -- level 36
        { turnin = { 192, 188 } }, -- level 36
        { complete = 201 }, -- level 36
        { complete = { 577, 213 } }, -- level 36
        { hearth = true }, -- level 36
        { turnin = { 201, 189, 213, 605, 577 } }, -- level 36
    },
})
