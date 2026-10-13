-- Drafted by tools/draft_guide.lua from tools/routes/undead.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Undead/03_Silverpine.lua.
-- Simulated: level 13 (0%) -> 15 (37%), 28 quests turned in, about 2 h 07 (13 716 XP per hour).
Ding.RegisterGuide({
    id       = "undead-03-silverpine",
    pack     = "ding-zones",
    title    = "Silverpine Forest (13-15)",
    faction  = "Horde",
    races    = { "Scourge" },
    minLevel = 13, maxLevel = 15,
    next     = "undead-04-barrens",
    steps    = {
        { accept = 435, -- level 13
          note = "From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base." },
        { complete = 435 }, -- level 13
        { accept = 91920 }, -- level 13
        { turnin = 435, accept = { 449, 429 } }, -- level 13
        { complete = 91920 }, -- level 13
        { accept = 6321 }, -- level 13
        { sethearth = "The Sepulcher" }, -- level 13
        { turnin = 449, accept = { 3221, 437 } }, -- level 13
        { turnin = { 91920, 445, 3221 }, accept = { 91921, 447, 421 } }, -- level 13
        { complete = 421 }, -- level 13
        { complete = { 429, 437 } }, -- level 13
        { complete = 447 }, -- level 13
        { hearth = true }, -- level 13
        { turnin = 429, accept = { 430, 1359 } }, -- level 13
        { turnin = 437, accept = 428 }, -- level 13
        { turnin = 421, accept = { 422, 98298, 438, 477 } }, -- level 14
        { complete = 422 }, -- level 14
        { turnin = 438, accept = 439 }, -- level 14
        { complete = 98298 }, -- level 14
        { turnin = 477, accept = 478 }, -- level 14
        { turnin = 478, accept = 481 }, -- level 14
        { turnin = { 481, 422 }, accept = { 423, 482 } }, -- level 14
        { turnin = { 430, 91921, 428 }, accept = 425 }, -- level 14
        { complete = 425 }, -- level 14
        { turnin = 425 }, -- level 14
        { complete = 423 }, -- level 14
        { turnin = { 423, 98298 }, accept = 424 }, -- level 14
        { turnin = 482, accept = 479 }, -- level 14
        { complete = 424 }, -- level 14
        { complete = 479 }, -- level 14
        { hearth = true }, -- level 15
        { turnin = 439, accept = 440 }, -- level 15
        { turnin = { 479, 424, 6321 }, accept = 6323 }, -- level 15
        { turnin = { 1359, 447 } }, -- level 15
        { turnin = 6323 }, -- level 15
        { turnin = 440 }, -- level 15
    },
})
