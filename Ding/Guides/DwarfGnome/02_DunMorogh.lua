-- Drafted by tools/draft_guide.lua from tools/routes/dwarf_gnome.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/DwarfGnome/02_DunMorogh.lua.
-- Simulated: level 5 (68%) -> 11 (32%), 41 quests turned in, about 3 h 05 (10 164 XP per hour), plus up to 6 min of grinding at the level steps.
Ding.RegisterGuide({
    id       = "dwarf-02-dunmorogh",
    pack     = "ding-zones",
    title    = "Dun Morogh (5-11)",
    faction  = "Alliance",
    races    = { "Dwarf", "Gnome" },
    minLevel = 5, maxLevel = 11,
    next     = "dwarf-03-lochmodan",
    steps    = {
        { accept = 96608, -- level 5
          note = "Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh." },
        { complete = 96608 }, -- level 5
        { turnin = 96608, accept = { 96629, 96044, 96050, 96047, 96058, 96046 } }, -- level 5
        { complete = 96046 }, -- level 5
        { turnin = 96046 }, -- level 5
        { complete = 96058 }, -- level 5
        { turnin = 96058, accept = { 5541, 313, 317 } }, -- level 5
        { complete = 317 }, -- level 5
        { accept = 98322 }, -- level 6
        { complete = 5541 }, -- level 6
        { turnin = 98322, accept = 98319 }, -- level 6
        { complete = 98319 }, -- level 6
        { turnin = 317, accept = 318 }, -- level 6
        { complete = 96629 }, -- level 6
        { turnin = 96629 }, -- level 6
        { sethearth = "Kharanos" }, -- level 6
        { complete = 96047 }, -- level 6
        { turnin = 96047, accept = 287 }, -- level 7
        { turnin = 98319, accept = 98323 }, -- level 7
        { accept = 310 }, -- level 7
        { turnin = 318, accept = { 319, 315 } }, -- level 7
        { complete = 287 }, -- level 7
        { complete = 319 }, -- level 7
        { hearth = true }, -- level 7
        { accept = 98321 }, -- level 7
        { complete = 96044 }, -- level 7
        { turnin = 96044 }, -- level 7
        { complete = { 313, 315 } }, -- level 7
        { accept = 412 }, -- level 8
        { turnin = { 98323, 287 }, accept = 291 }, -- level 8
        { turnin = 310, accept = 311 }, -- level 8
        { turnin = 313 }, -- level 8
        { accept = 99159 }, -- level 8
        { complete = 99159 }, -- level 8
        { turnin = 99159, accept = { 99160, 99162 } }, -- level 8
        { complete = 99160 }, -- level 8
        { turnin = 99160, accept = 99161 }, -- level 8
        { complete = 99161 }, -- level 8
        { accept = 95212 }, -- level 8
        { accept = { 95217, 432 } }, -- level 8
        { complete = 432 }, -- level 8
        { turnin = 432 }, -- level 8
        { complete = { 95212, 95217 } }, -- level 8
        { turnin = 95217, accept = 433 }, -- level 9
        { complete = 433 }, -- level 9
        { turnin = 433 }, -- level 9
        { turnin = 95212 }, -- level 9
        { complete = 99162 }, -- level 9
        { complete = 412 }, -- level 9
        { turnin = { 311, 315, 319 }, accept = { 413, 98326 } }, -- level 9
        { complete = { 98326, 98321 } }, -- level 9
        { turnin = 412, accept = { 415, 400 } }, -- level 10
        { turnin = 98321 }, -- level 10
        { turnin = 5541 }, -- level 10
        { accept = 312 }, -- level 10
        { complete = 312 }, -- level 10
        { turnin = 312 }, -- level 10
        { turnin = 415, accept = 320 }, -- level 10
        { turnin = 98326 }, -- level 10
        { complete = 96050 }, -- level 10
        { turnin = 96050 }, -- level 10
        { turnin = 291 }, -- level 10
        { accept = 419 }, -- level 10
        { turnin = 419, accept = 417 }, -- level 10
        { complete = 417 }, -- level 10
        { turnin = 417 }, -- level 10
        { turnin = 413, accept = 414 }, -- level 10
        { hearth = true }, -- level 10
        { turnin = 320 }, -- level 10
        { turnin = { 99162, 99161 } }, -- level 10
        { turnin = 400 }, -- level 10
        { level = 11,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 96408 }, -- level 11
        { accept = 96392 }, -- level 11
        { complete = 96392 }, -- level 11
        { turnin = { 96392, 96408 }, accept = 96390 }, -- level 11
        { complete = 96390 }, -- level 11
        { turnin = 96390 }, -- level 11
    },
})
