-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/34_ThousandNeedles.lua.
-- Simulated: level 34 (0%) -> 34 (39%), 5 quests turned in, about 1 h 30 (17 295 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-34-needles",
    pack     = "ding-zones",
    title    = "Thousand Needles (34)",
    faction  = "Alliance",
    minLevel = 34, maxLevel = 34,
    next     = "alliance-35-desolace",
    steps    = {
        { accept = { 1104, 5762, 1110, 1105 }, -- level 34
          note = "Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base." },
        { accept = { 1176, 1175 } }, -- level 34
        { complete = { 1110, 1176 } }, -- level 34
        { complete = 1105 }, -- level 34
        { complete = { 1104, 1175 } }, -- level 34
        { turnin = { 1175, 1176 } }, -- level 34
        { turnin = { 1105, 1104, 1110 } }, -- level 34
    },
})
