-- Drafted by tools/draft_guide.lua from tools/routes/dwarf_gnome.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/DwarfGnome/01_Coldridge.lua.
-- Simulated: level 1 (0%) -> 5 (68%), 15 quests turned in, about 50 min (8 029 XP per hour).
Ding.RegisterGuide({
    id       = "dwarf-01-coldridge",
    pack     = "ding-zones",
    title    = "Coldridge Valley (1-5)",
    faction  = "Alliance",
    races    = { "Dwarf", "Gnome" },
    minLevel = 1, maxLevel = 5,
    next     = "dwarf-02-dunmorogh",
    steps    = {
        { accept = 179, -- level 1
          note = "Everything starts in Coldridge: follow the arrow from NPC to NPC." },
        { complete = 179 }, -- level 1
        { turnin = 179, accept = { 233, 170 } }, -- level 2
        { accept = 182 }, -- level 2
        { complete = 170 }, -- level 2
        { turnin = 233, accept = { 183, 234 } }, -- level 3
        { complete = 182 }, -- level 3
        { turnin = { 182, 234 }, accept = { 218, 3364 } }, -- level 4
        { complete = 218 }, -- level 4
        { turnin = 170 }, -- level 4
        { turnin = 3364, accept = { 3365, 97277, 3361 } }, -- level 4
        { complete = 183 }, -- level 4
        { turnin = 183 }, -- level 4
        { complete = 3361 }, -- level 4
        { turnin = { 3365, 218 }, accept = 282 }, -- level 5
        { complete = 97277 }, -- level 5
        { turnin = { 3361, 97277 } }, -- level 5
        { turnin = 282, accept = { 420, 96628, 2160 } }, -- level 5
        { turnin = { 96628, 2160, 420 } }, -- level 5
    },
})
