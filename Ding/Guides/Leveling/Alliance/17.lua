-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/17.lua.
-- Simulated (warrior): Human 35 (10%) -> 36 (7%) in 2 h 59, 25 quests turned in; Dwarf 35 (22%) -> 36 (17%) in 2 h 59, 25 quests turned in; NightElf 35 (26%) -> 36 (21%) in 2 h 59, 25 quests turned in; Gnome 35 (29%) -> 36 (24%) in 2 h 59, 25 quests turned in; Skyborne 35 (28%) -> 36 (23%) in 2 h 59, 25 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a17-stranglethorn-vale",
    title    = "Stranglethorn Vale (34-35)",
    faction  = "Alliance",
    minLevel = 34, maxLevel = 35,
    next     = "leveling-a18-desolace",
    steps    = {
        { go = { 1434, 26.35, 73.56 }, text = "Travel to Booty Bay", -- level 35
          note = "Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there." },
        { turnin = 1180, accept = 1181 }, -- level 35
        { turnin = 1040, accept = 1041, why = { kind = "carry", quest = 1041, seconds = 8820, xp = 1000 } }, -- level 35
        { sethearth = "Booty Bay", talk = 6807, -- level 35
          note = "The NPC is indoors at street level." },
        { accept = 605, -- level 35
          note = "The NPC is indoors at street level." },
        { accept = { 201, 198, 616 }, -- level 35
          note = "Climb to the highest floor of the building." },
        { accept = 213, -- level 35
          note = "Climb to the highest floor of the building." },
        { turnin = { 1181, 616 }, accept = { 1182, 578 }, -- level 35
          note = "The NPC is upstairs, out on the balcony." },
        { talk = 2625 }, -- level 35
        { bank = 5800, when = { log = 1112 }, -- level 35
          note = "You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot." },
        { bank = 5800, when = { done = 1112 }, -- level 35
          note = "You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot." },
        { destroy = 3898 }, -- level 35
        { accept = 575, -- level 35
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
        { go = { 1434, 27.5, 77.84 }, fly = true, talk = 2859, text = "Fly to Booty Bay", -- level 35
          note = "The NPC stands on the top tier of the pier. The NPC is upstairs, out on the balcony." },
        { train = true, talk = 5498, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 35
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 198, -- level 35
          note = "If he is absent, move on without him. You may come back for it another time." },
        { accept = { 203, 204 } }, -- level 35
        { accept = 200 }, -- level 35
        { complete = 201 }, -- level 35
        { turnin = 5762 }, -- level 35
        { accept = 186 }, -- level 35
        { accept = 191, sticky = { 204, 203 } }, -- level 35
        { complete = 204 }, -- level 35
        { turnin = 200, accept = 328, -- level 35
          note = "The object is indoors, one floor up." },
        { complete = 204, keep = 2633, -- level 35
          note = "These foes heal both their allies and themselves." },
        { complete = 203 }, -- level 35
        { complete = 605, -- level 35
          note = "When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { complete = 186 }, -- level 35
        { level = 35, sticky = 213, patrol = { { 1434, 46.35, 12.74 }, { 1434, 45.94, 15.25 }, { 1434, 46.43, 17.64 }, { 1434, 42.85, 14.97 }, { 1434, 44.03, 13.46 } } }, -- level 35
        { collect = { { 5851, 1 } }, spots = { { 1434, 42.62, 18.29 } }, -- level 35
          note = "The objective sits up on the raised deck. The target is indoors." },
        { complete = 1182, -- level 35
          note = "The object is indoors." },
        { complete = 213 }, -- level 35
        { turnin = { 203, 204 } }, -- level 35
        { accept = 210 }, -- level 35
        { complete = 575, -- level 35
          note = "Search the riverbanks." },
        { turnin = 186, accept = 187 }, -- level 35
        { accept = 194 }, -- level 35
        { complete = 187, sticky = 194 }, -- level 35
        { complete = 191 }, -- level 35
        { complete = 194 }, -- level 35
        { complete = 605 }, -- level 35
        { complete = 578 }, -- level 35
        { go = { 1434, 21.37, 21.98 }, deathskip = true, text = "Die on purpose at this spot", -- level 35
          note = "Die to the monsters here on purpose. Dying costs you nothing this early. This is the quickest way over." },
        { deathskip = true, revive = { 1434, 38.41, 9.01 }, text = "Get yourself killed, then resurrect with the spirit healer" }, -- level 35
        { talk = 6491 }, -- level 35
        { turnin = 194 }, -- level 35
        { turnin = 187 }, -- level 35
        { turnin = 191 }, -- level 35
        { turnin = 605, -- level 35
          note = "The NPC is indoors at street level." },
        { turnin = { 201, 210 }, -- level 35
          note = "Climb to the highest floor of the building." },
        { turnin = 213, -- level 35
          note = "Climb to the highest floor of the building." },
        { turnin = { 578, 1182 }, accept = 1183, why = { continent = true, kind = "carry", quest = 1183, seconds = 16860, xp = 700 }, -- level 35
          note = "The NPC is upstairs, out on the balcony." },
        { talk = 2625, bank = { 5852, 2719 }, -- level 35
          note = "You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots." },
        { bank = 2725, when = { item = 2725 }, -- level 35
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2728, when = { item = 2728 }, -- level 35
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2730, when = { item = 2730 }, -- level 35
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2732, when = { item = 2732 }, -- level 35
          note = "You need it later for \"Chapter I\": keep it in the bank to free a bag slot." },
        { bank = 2734, when = { item = 2734 }, -- level 35
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2735, when = { item = 2735 }, -- level 35
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2738, when = { item = 2738 }, -- level 35
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2740, when = { item = 2740 }, -- level 35
          note = "You need it later for \"Chapter II\": keep it in the bank to free a bag slot." },
        { bank = 2742, when = { item = 2742 }, -- level 35
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2744, when = { item = 2744 }, -- level 35
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2745, when = { item = 2745 }, -- level 35
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2748, when = { item = 2748 }, -- level 35
          note = "You need it later for \"Chapter III\": keep it in the bank to free a bag slot." },
        { bank = 2749, when = { item = 2749 }, -- level 35
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2750, when = { item = 2750 }, -- level 35
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { bank = 2751, when = { item = 2751 }, -- level 35
          note = "You need it later for \"Chapter IV\": keep it in the bank to free a bag slot." },
        { turnin = 575, -- level 35
          note = "The NPC stands on the top tier of the pier. The NPC is indoors." },
        { turnin = 1041, accept = 1042, -- level 35
          note = "The NPC is indoors." },
        { turnin = 1042, accept = 1043, -- level 35
          note = "The NPC is indoors." },
        { go = { 1431, 73.01, 75.09 }, text = "Go into the mine" }, -- level 35
        { complete = 1043, -- level 35
          note = "The objective is underground, in the mine shaft." },
        { go = { 1431, 73.01, 75.09 }, text = "Exit the mine shaft" }, -- level 35
        { turnin = 1043, -- level 35
          note = "The NPC is indoors." },
        { talk = 15659, collect = { { 5996, 2 } }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "MAGE" }, -- level 36
          note = "The NPC is indoors." },
        { talk = 2455, collect = { { 3721, 1 } }, spots = { { 1453, 64.24, 80.81 } }, -- level 36
          note = "The NPC is indoors." },
        { go = { 1453, 42.29, 81.76 }, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, text = "Head indoors", -- level 36
          note = "The NPC waits on the lower level, indoors." },
        { train = true, talk = 461, races = { "Human", "Gnome" }, classes = { "WARLOCK" } }, -- level 36
        { vendor = true, talk = 5520, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 36
          note = "The NPC waits on the lower level, indoors." },
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, text = "Head indoors", -- level 36
          note = "The NPC is indoors." },
        { train = true, talk = 5492, races = { "Human", "Dwarf" }, classes = { "PALADIN" } }, -- level 36
        { go = { 1453, 52.93, 51.05 }, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, text = "Head indoors", -- level 36
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 5484, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" } }, -- level 36
        { train = true, talk = 5479, classes = { "WARRIOR" }, -- level 36
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 918, classes = { "ROGUE" } }, -- level 36
        { train = true, talk = 5515, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 36
          note = "The NPC is indoors." },
        { go = { 1453, 73.19, 46.69 }, text = "Head into Stormwind Keep", why = { kind = "detour", quest = 563, seconds = 60, xp = 3200 } }, -- level 36
        { turnin = 563, -- level 36
          note = "The NPC is indoors." },
        { accept = 1453, why = { action = "accept", chain = 8, kind = "detour", quest = 1453, seconds = 120, xp = 22000 }, -- level 36
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { turnin = 1758, races = { "Human", "Gnome", "Skyborne" }, classes = { "WARLOCK" }, -- level 36
          note = "The NPC is indoors." },
        { turnin = 1791, when = { log = 1791 }, classes = { "WARRIOR" }, why = { chain = 1, kind = "detour", quest = 1791, seconds = 780, short = true, xp = 2500 }, -- level 36
          note = "The NPC is indoors." },
        { accept = 1712, classes = { "WARRIOR" } }, -- level 36
    },
})
