-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/41.lua.
-- Simulated (warrior): Human 57 (0%) -> 58 (67%) in 10 h 00, 41 quests turned in; Dwarf 57 (0%) -> 58 (67%) in 10 h 00, 41 quests turned in; NightElf 57 (0%) -> 58 (67%) in 10 h 00, 41 quests turned in; Gnome 57 (0%) -> 58 (67%) in 10 h 00, 41 quests turned in; Skyborne 57 (0%) -> 58 (67%) in 10 h 00, 41 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a41-western-and-eastern-plaguelands",
    title    = "The Plaguelands (57-58)",
    faction  = "Alliance",
    minLevel = 57, maxLevel = 58,
    next     = "leveling-a42-winterspring",
    steps    = {
        { go = { 1455, 32.21, 63.26 }, text = "Travel to Ironforge", -- level 57
          note = "Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel." },
        { accept = 7261 }, -- level 57
        { talk = 2461, collect = { { 15788, 1 }, { 15790, 1 }, { 12891, 1 }, { 12896, 1 }, { 12897, 1 }, { 12898, 1 }, { 12899, 1 } }, spots = { { 1455, 35.87, 60.19 } }, -- level 57
          note = "The NPC is indoors." },
        { talk = 2461, bank = 12438, -- level 57
          note = "The NPC is indoors. You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot." },
        { go = { 1455, 44.45, 49.53 }, text = "Stay on the trail" }, -- level 57
        { turnin = 3701 }, -- level 57
        { sethearth = "Southshore", talk = 2352, -- level 57
          note = "The NPC is indoors." },
        { turnin = 7261 }, -- level 57
        { accept = 5219 }, -- level 57
        { accept = 5097, elite = true }, -- level 57
        { turnin = 6028 }, -- level 57
        { turnin = 6184 }, -- level 57
        { accept = 5142, -- level 57
          note = "Check each of the two floors indoors." },
        { complete = 5097, elite = true, useitem = 12815, -- level 57
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { accept = 4984, sticky = 4984, -- level 57
          note = "The NPC is indoors." },
        { complete = 5097, elite = true, useitem = 12815, -- level 57
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { complete = 4984, -- level 57
          note = "Spiders also appear at these spawn spots." },
        { accept = 5058, -- level 57
          note = "The object is indoors." },
        { turnin = 5058 }, -- level 57
        { collect = { { 12738, 1 } }, -- level 57
          note = "Look for a white set of bones. This one roams, so scan the surrounding area. The targets appear in several places." },
        { collect = { { 12739, 1 } }, -- level 57
          note = "Finish Locked Away to obtain this." },
        { accept = 5060, -- level 57
          note = "The object is indoors, one floor up." },
        { turnin = 5060, when = { ready = 5060 } }, -- level 57
        { complete = 5219 }, -- level 57
        { turnin = 5219, accept = 5220 }, -- level 57
        { turnin = 5050, accept = 5051, -- level 57
          note = "The NPC is indoors, one floor up." },
        { complete = 5051, collect = { { 12722, 1 } }, useitem = 12722, -- level 57
          note = "The target is a ghoul armed with a pitchfork. This one roams, so scan the surrounding area. The targets appear in several places." },
        { turnin = 5051, when = { item = 12723 }, -- level 57
          note = "The NPC is indoors, one floor up." },
        { complete = 5097, elite = true, useitem = 12815, -- level 57
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { complete = 5097, elite = true, useitem = 12815, -- level 57
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { turnin = 5097, elite = true }, -- level 57
        { accept = 5533, elite = true }, -- level 57
        { destroy = 12815 }, -- level 57
        { turnin = 5533, elite = true }, -- level 57
        { turnin = 5220, accept = 5222 }, -- level 57
        { accept = 5903 }, -- level 57
        { accept = 6185, elite = true }, -- level 57
        { complete = 5222 }, -- level 57
        { turnin = 5222, accept = 5223 }, -- level 57
        { turnin = 4984, accept = 4985, sticky = 4985, -- level 57
          note = "The NPC is indoors." },
        { accept = { 5542, 5543, 5544 }, sticky = { 5544, 5542, 5543 } }, -- level 57
        { complete = 6185, elite = true }, -- level 57
        { complete = 6185, elite = true, -- level 57
          note = "Elites roam close by; keep your distance." },
        { complete = 6185, elite = true, -- level 57
          note = "Search the bones of a fallen person. Elites roam close by; keep your distance." },
        { complete = 6185, elite = true }, -- level 57
        { turnin = 5142, accept = 5149, -- level 57
          note = "The NPC is within the ruined home." },
        { collect = { { 12886, 1 } }, object = 176116, spots = { { 1423, 32.57, 79.29 }, { 1423, 33.94, 77.32 }, { 1423, 33.93, 79.55 } }, -- level 57
          note = "Search within the houses here. Be ready for a fight right away." },
        { collect = { { 12887, 1 } }, object = 176142, spots = { { 1423, 32.57, 79.29 }, { 1423, 33.94, 77.32 }, { 1423, 33.93, 79.55 } }, -- level 57
          note = "Search within the houses here. Be ready for a fight right away." },
        { collect = { { 12888, 1 } }, object = 176143, spots = { { 1423, 32.57, 79.29 }, { 1423, 33.94, 77.32 }, { 1423, 33.93, 79.55 } }, -- level 57
          note = "Search within the houses here. Be ready for a fight right away." },
        { complete = 5149, useitem = 12886 }, -- level 57
        { turnin = 5149, sticky = { 5542, 5543 }, when = { item = 12885 }, -- level 57
          note = "The NPC is within the ruined home." },
        { accept = { 5152, 5241 }, when = { done = 5149 } }, -- level 57
        { complete = 5544, -- level 57
          note = "Look for big yellow grubs." },
        { complete = { 5542, 5543 } }, -- level 57
        { level = 57, xp = 189550, patrol = { { 1423, 34.58, 71.45 }, { 1423, 31.85, 69.49 }, { 1423, 29.64, 71.46 }, { 1423, 26.38, 72.7 }, { 1423, 26.49, 66.21 }, { 1423, 28.83, 63.24 }, { 1423, 27.56, 58.92 }, { 1423, 24.85, 59.13 }, { 1423, 22.97, 56.78 }, { 1423, 24.3, 54.25 }, { 1423, 26.94, 54.15 }, { 1423, 21.72, 52.89 }, { 1423, 19.38, 54.34 }, { 1423, 16.74, 55.05 }, { 1423, 14.5, 57.77 }, { 1423, 16.76, 59.83 }, { 1423, 17.64, 62.46 }, { 1423, 13.5, 63.71 }, { 1423, 14.04, 67.13 }, { 1423, 17.94, 68.29 }, { 1423, 21.35, 59.28 }, { 1423, 13.15, 54.17 }, { 1423, 31.24, 58.22 }, { 1423, 35.1, 58.39 }, { 1423, 35.11, 55.52 }, { 1423, 38.78, 55.6 }, { 1423, 38.54, 61.27 }, { 1423, 40.95, 62.25 }, { 1423, 42.85, 66.13 }, { 1423, 39.69, 68.29 }, { 1423, 35.81, 67.41 }, { 1423, 36.55, 63.62 } }, -- level 57
          note = "With the coming hand-ins, this gets you to level 58." },
        { complete = 5542 }, -- level 57
        { accept = { 6021, 5281 }, -- level 57
          note = "This one roams, so scan the surrounding area." },
        { turnin = 6030 }, -- level 57
        { turnin = 5241, when = { log = 5241 } }, -- level 57
        { accept = 5211 }, -- level 58
        { go = { 1423, 71.83, 49.54 }, fly = true, talk = 12617, text = "Flight master at Light's Hope Chapel" }, -- level 58
        { turnin = 5245 }, -- level 58
        { destroy = 12891 }, -- level 58
        { complete = 5903, -- level 58
          note = "Look for big rocks seeping green slime. Progress westward as you go." },
        { turnin = 5281, -- level 58
          note = "The NPC is indoors." },
        { accept = 6164, -- level 58
          note = "The NPC is indoors." },
        { complete = 6164, -- level 58
          note = "The object is indoors, one floor up." },
        { turnin = 6164, -- level 58
          note = "The NPC is indoors." },
        { complete = 5542 }, -- level 58
        { complete = 5211, talk = 11064, -- level 58
          note = "The targets are ghouls. Other undead compete for the same spawn points. The spirits rise where those foes die." },
        { go = { 1423, 23.38, 73.25 }, text = "Go down into the tomb" }, -- level 58
        { complete = 6021, -- level 58
          note = "This is below ground, on the crypt's lower floor." },
        { turnin = { 5542, 5543, 5544 }, accept = 5742 }, -- level 58
        { complete = 5742, talk = 1855, -- level 58
          note = "Your character must be seated first." },
        { turnin = 5742 }, -- level 58
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 58
        { turnin = 5223, accept = 5225 }, -- level 58
        { accept = 5537, elite = true }, -- level 58
        { turnin = 6185, elite = true }, -- level 58
        { accept = 6186, elite = true }, -- level 58
        { turnin = 5903, accept = 5904 }, -- level 58
        { destroy = 15043, sticky = 5537 }, -- level 58
        { turnin = 5152, when = { log = 5152 }, -- level 58
          note = "Check each of the two floors indoors." },
        { accept = 5153, when = { done = 5152 } }, -- level 58
        { complete = 5153, when = { log = 5153 } }, -- level 58
        { complete = 5537, elite = true }, -- level 58
        { turnin = 5153, when = { log = 5153 }, -- level 58
          note = "The NPC is indoors, one floor up." },
        { accept = 4971 }, -- level 58
        { accept = 5154, when = { done = 5153 } }, -- level 58
        { complete = 5154, when = { log = 5154 }, -- level 58
          note = "Move the camera close and check which book is genuine. Some books are traps that summon foes. The genuine book can look two ways:" },
        { complete = 4971, useitem = 12627, -- level 58
          note = "Close to the big buildings lit in blue. A new one may appear when one is killed." },
        { turnin = 4971, accept = 4972, -- level 58
          note = "The NPC is indoors, one floor up." },
        { turnin = 5154, when = { log = 5154 } }, -- level 58
        { accept = 5210, when = { done = 5154 } }, -- level 58
        { destroy = 15696 }, -- level 58
        { complete = 4972, -- level 58
          note = "Look for little gray coffers of metal. The targets are in the ruined houses." },
        { turnin = 4972, -- level 58
          note = "The NPC is indoors, one floor up." },
        { turnin = 5537, elite = true }, -- level 58
        { turnin = 5211 }, -- level 58
        { turnin = 5210, when = { log = 5210 } }, -- level 58
        { accept = 5181, when = { done = 5210 } }, -- level 58
        { sethearth = "Light's Hope Chapel", talk = 16256, -- level 58
          note = "The NPC is indoors." },
        { turnin = 6021, -- level 58
          note = "This one roams, so scan the surrounding area." },
        { complete = 5181, when = { log = 5181 }, -- level 58
          note = "Your targets sit below the water's surface." },
        { complete = 5181, sticky = 4985, when = { log = 5181 } }, -- level 58
        { complete = 5225, -- level 58
          note = "This one roams, so scan the surrounding area." },
        { turnin = 5225, accept = 5226 }, -- level 58
        { complete = 4985, -- level 58
          note = "Spiders also appear at these spawn spots." },
        { turnin = 4985, accept = 4986, -- level 58
          note = "The NPC is indoors." },
        { turnin = 5904, accept = 6389, -- level 58
          note = "The object is indoors. It shows up on top of the box." },
        { accept = 6004 }, -- level 58
        { complete = 6004 }, -- level 58
        { complete = 6004 }, -- level 58
        { turnin = 6004 }, -- level 58
        { accept = 6023, elite = true }, -- level 58
        { complete = 6023, elite = true }, -- level 58
        { complete = 6023, elite = true, -- level 58
          note = "This one roams, so scan the surrounding area. Targets are in the tower and around its base. If an elite stands on the tower's roof, hold back outside." },
        { turnin = 6023, elite = true }, -- level 58
        { turnin = 5181, when = { log = 5181 } }, -- level 58
        { turnin = 6389 }, -- level 58
        { turnin = 5226 }, -- level 58
        { accept = 5237 }, -- level 58
        { turnin = 5237 }, -- level 58
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 58
          note = "The NPC is indoors." },
        { accept = 8275 }, -- level 58
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 58
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 58
          note = "The NPC is indoors." },
        { go = { 1455, 76.81, 51.13 }, text = "Head down into the Deeprun Tram station", -- level 58
          note = "Pass through the portal to teleport." },
        { go = { 1453, 73.16, 46.66 }, text = "Head into Stormwind Keep" }, -- level 58
        { accept = 84396, classes = { "MAGE" } }, -- level 58
        { turnin = 84396, classes = { "MAGE" } }, -- level 58
        { turnin = 6186, elite = true }, -- level 58
    },
})
