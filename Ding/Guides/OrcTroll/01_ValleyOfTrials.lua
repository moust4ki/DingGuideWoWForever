-- Drafted by tools/draft_guide.lua from tools/routes/orc_troll.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/OrcTroll/01_ValleyOfTrials.lua.
-- Simulated: level 1 (0%) -> 5 (58%), 13 quests turned in, about 51 min (7 571 XP per hour).
Ding.RegisterGuide({
    id       = "orc-01-valley",
    pack     = "ding-zones",
    title    = "Valley of Trials (1-5)",
    faction  = "Horde",
    races    = { "Orc", "Troll" },
    minLevel = 1, maxLevel = 5,
    next     = "orc-02-durotar",
    steps    = {
        { accept = 788, -- level 1
          note = "Everything happens in the Valley of Trials: follow the arrow from NPC to NPC." },
        { complete = 788 }, -- level 1
        { turnin = 788, accept = 789 }, -- level 2
        { complete = 789 }, -- level 2
        { accept = 790 }, -- level 3
        { accept = 4402 }, -- level 3
        { accept = 792, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 3
        { accept = { 4641, 5441 } }, -- level 3
        { complete = 5441 }, -- level 3
        { complete = 792, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 3
        { complete = 4402 }, -- level 3
        { turnin = 5441, accept = 6394 }, -- level 4
        { turnin = 792, accept = 794, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 4
        { complete = 790 }, -- level 4
        { turnin = 790, accept = 804 }, -- level 4
        { complete = 794, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 4
        { complete = 6394 }, -- level 4
        { turnin = { 4402, 4641, 804, 789 } }, -- level 4
        { turnin = 794, accept = { 805, 96652 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 5
        { turnin = 6394 }, -- level 5
        { turnin = 805, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 5
        { accept = 2161 }, -- level 5
        { turnin = 96652, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } }, -- level 5
        { turnin = 2161 }, -- level 5
    },
})
