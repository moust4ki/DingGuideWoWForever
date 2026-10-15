-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/35.lua.
-- Simulated (warrior): Human 51 (66%) -> 52 (7%) in 3 h 05, 7 quests turned in; Dwarf 51 (66%) -> 52 (7%) in 3 h 05, 7 quests turned in; NightElf 51 (63%) -> 52 (7%) in 3 h 21, 7 quests turned in; Gnome 51 (66%) -> 52 (7%) in 3 h 05, 7 quests turned in; Skyborne 51 (66%) -> 52 (7%) in 3 h 05, 7 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a35-western-plaguelands",
    title    = "Western Plaguelands (51-52)",
    faction  = "Alliance",
    minLevel = 51, maxLevel = 52,
    next     = "leveling-a36-azshara-and-felwood",
    leftOut  = {
        [211] = { kind = "prereq" },
        [5164] = { kind = "prereq" },
        [5166] = { kind = "prereq" },
        [5167] = { kind = "prereq" },
        [5344] = { kind = "prereq" },
        [5384] = { kind = "prereq" },
        [5461] = { kind = "prereq" },
        [5462] = { kind = "prereq" },
        [5466] = { kind = "prereq" },
        [5505] = { kind = "prereq" },
        [5515] = { kind = "prereq" },
        [5538] = { kind = "prereq" },
        [5721] = { kind = "prereq" },
        [5803] = { kind = "prereq" },
        [5848] = { kind = "prereq" },
    },
    steps    = {
        { go = { 1422, 42.7, 84.03 }, text = "Travel to Chillwind Camp", -- level 51
          note = "Western Plaguelands: Chillwind Camp, in the south of the zone." },
        { turnin = 5090, accept = 5092 }, -- level 51
        { accept = 5401 }, -- level 51
        { turnin = 5401 }, -- level 51
        { equip = 12846, -- level 51
          note = "Undead foes drop these in both Plaguelands zones, Western and Eastern. Keep your Argent Dawn Commission aura up." },
        { complete = 5092 }, -- level 51
        { level = 51, xp = 148800, patrol = { { 1422, 50.76, 79.35 }, { 1422, 49.37, 76.17 }, { 1422, 46.43, 80.35 }, { 1422, 49.45, 82.74 }, { 1422, 54.25, 80.34 } }, why = { kind = "level", levels = { 52, 55 } }, -- level 51
          note = "Together with the next turn-ins, this brings you to level 52." },
        { turnin = 5092, accept = 5215 }, -- level 51
        { turnin = 5215, accept = 5216 }, -- level 52
        { complete = 5216 }, -- level 52
        { turnin = 5216, accept = 5217 }, -- level 52
        { accept = 5021, floor = "up", -- level 52
          note = "The NPC is indoors, one floor up." },
        { turnin = 5021, accept = 5022, why = { kind = "carry", quest = 5022, seconds = 102900, xp = 2600 }, -- level 52
          note = "The object is indoors." },
        { turnin = 5217 }, -- level 52
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 52
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 52
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 52
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 52
          note = "The NPC is indoors." },
    },
})
