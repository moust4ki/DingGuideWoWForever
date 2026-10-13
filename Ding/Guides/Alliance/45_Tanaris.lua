-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/45_Tanaris.lua.
-- Simulated: level 41 (84%) -> 47 (12%), 17 quests turned in, about 3 h 00 (34 397 XP per hour), plus up to 37 h 02 of grinding at the level steps.
Ding.RegisterGuide({
    id       = "alliance-45-tanaris",
    pack     = "ding-zones",
    title    = "Tanaris (41-47)",
    faction  = "Alliance",
    minLevel = 41, maxLevel = 47,
    next     = "alliance-47-feralas",
    steps    = {
        { accept = 1690, -- level 41
          note = "Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore." },
        { sethearth = "Gadgetzan" }, -- level 41
        { complete = 1690 }, -- level 41
        { level = 43,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = { 8365, 2875, 8366, 2873 } }, -- level 43
        { complete = 8366 }, -- level 43
        { hearth = true }, -- level 43
        { accept = 1707 }, -- level 43
        { turnin = 1690, accept = 1691 }, -- level 43
        { complete = 1691 }, -- level 43
        { complete = 1707 }, -- level 43
        { complete = { 2873, 8365 } }, -- level 43
        { level = 44,
          note = "Finish the level on nearby monsters before moving on." },
        { complete = 2875 }, -- level 44
        { turnin = { 2873, 8366, 2875 }, accept = 2781 }, -- level 44
        { turnin = 8365 }, -- level 44
        { hearth = true }, -- level 44
        { turnin = { 1707, 1691 } }, -- level 44
        { accept = 992 }, -- level 44
        { complete = 992 }, -- level 44
        { level = 46,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 3161 }, -- level 46
        { complete = 3161 }, -- level 46
        { turnin = 3161 }, -- level 46
        { complete = 2781 }, -- level 46
        { accept = 351, optional = true, -- level 46
          note = "If the starting item dropped: use it from your bags." },
        { turnin = 351, optional = true }, -- level 46
        { hearth = true }, -- level 46
        { turnin = 2781 }, -- level 46
        { turnin = 992, accept = 82 }, -- level 46
        { level = 47,
          note = "Finish the level on nearby monsters before moving on." },
        { accept = 2605 }, -- level 47
        { complete = 82 }, -- level 47
        { complete = 2605 }, -- level 47
        { hearth = true }, -- level 47
        { turnin = 2605, accept = 2606 }, -- level 47
        { turnin = { 2606, 82 }, accept = 10 }, -- level 47
        { complete = 10 }, -- level 47
        { turnin = 10, accept = 110 }, -- level 47
        { turnin = 110, accept = 113 }, -- level 47
        { turnin = 113, accept = 162 }, -- level 47
    },
})
