-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/36.lua.
-- Simulated (warrior): Orc 53 (39%) -> 54 (13%) in 3 h 19, 25 quests turned in; Scourge 53 (39%) -> 54 (13%) in 3 h 19, 25 quests turned in; Tauren 53 (39%) -> 54 (13%) in 3 h 19, 25 quests turned in; Troll 53 (39%) -> 54 (13%) in 3 h 19, 25 quests turned in; Skyborne 53 (39%) -> 54 (17%) in 3 h 20, 27 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h36-ungoro-crater",
    title    = "Un'Goro Crater (53-54)",
    faction  = "Horde",
    minLevel = 53, maxLevel = 54,
    next     = "leveling-h37-azshara",
    steps    = {
        { go = { 1446, 50.89, 26.96 }, text = "Travel to Gadgetzan", -- level 53
          note = "Tanaris: Gadgetzan first, then Un'Goro Crater." },
        { turnin = 4494, accept = 4496, -- level 53
          note = "The NPC is indoors." },
        { accept = 4145 }, -- level 53
        { accept = 3881 }, -- level 53
        { accept = 3883 }, -- level 53
        { accept = 3882 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 53
        { accept = 4288, when = { done = 4284 }, -- level 53
          note = "Your targets are within the cavern." },
        { go = { 1449, 43.53, 6.78 }, text = "Head out of the cave" }, -- level 53
        { accept = 4501 }, -- level 53
        { accept = 4492, races = { "Skyborne" } }, -- level 53
        { complete = 4501, -- level 53
          note = "When the targets run out, skip ahead. No rush; you may complete this afterwards." },
        { complete = 4145, sticky = 4289, -- level 53
          note = "The targets are mobile plant monsters." },
        { complete = 4289, -- level 53
          note = "Targets are in the cavern and around its entrance too." },
        { complete = 4289, -- level 53
          note = "Targets are in the cavern and around its entrance too." },
        { complete = 4289, sticky = { 4145, 3882 }, -- level 53
          note = "Targets are in the cavern and around its entrance too." },
        { go = { 1449, 64.17, 16.32 }, text = "Head out of the cave" }, -- level 53
        { complete = 3881 }, -- level 53
        { complete = 4145, -- level 53
          note = "The targets are mobile plant monsters." },
        { collect = { { 11569, 1 }, { 11570, 1 } }, useitem = 11568 }, -- level 53
        { useitem = { 11569, 11570 } }, -- level 53
        { complete = 4292, elite = true }, -- level 53
        { turnin = 4292, elite = true }, -- level 53
        { turnin = 4289, accept = 4301 }, -- level 53
        { complete = 4501, sticky = 4496 }, -- level 53
        { go = { 1449, 49.91, 81.65 }, text = "Go into the cavern" }, -- level 53
        { complete = 3883, useitem = 11132, -- level 53
          note = "Your targets are within the cavern." },
        { complete = 4496, sticky = { 4145, 3882, 4501 }, -- level 53
          note = "Kill bugs. Targets are in the cavern and around its entrance too." },
        { go = { 1449, 49.98, 81.71 }, text = "Head out of the cave" }, -- level 53
        { complete = 3881 }, -- level 53
        { complete = 4288, when = { log = 4288 }, -- level 53
          note = "Look for it high on the clifftop." },
        { accept = 974, sticky = 4502 }, -- level 53
        { go = { 1449, 46.26, 45.59 }, text = "Climb the trail" }, -- level 53
        { complete = 974, useitem = 12472, -- level 53
          note = "The object is up on the summit." },
        { turnin = 974, accept = 980, why = { kind = "carry", quest = 980, seconds = 29940, xp = 2800 } }, -- level 53
        { complete = 4145, -- level 53
          note = "The targets are mobile plant monsters." },
        { complete = 3882 }, -- level 53
        { complete = 4501 }, -- level 53
        { collect = { { 11018, 25 } }, keep = 11018 }, -- level 53
        { go = { 1449, 46.26, 45.59 }, elite = true, text = "Climb the trail" }, -- level 53
        { complete = 4502, elite = true, -- level 53
          note = "The targets are flame elementals. An elite foe waits on the summit; steer clear." },
        { turnin = 4492, noauto = 4491, when = { ready = 4492 }, -- level 53
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Your objective lies in a little cavern." },
        { accept = 4491, when = { done = 4492 } }, -- level 53
        { complete = 4491, useitem = 11804, when = { log = 4491 }, -- level 53
          note = "Let the conversation play out. Ringo trails behind you; keep him alive. Keep near him; he passes out." },
        { turnin = 4501, -- level 53
          note = "Wait for the talking to finish" },
        { turnin = 4491, when = { log = 4491 } }, -- level 53
        { destroy = 11804 }, -- level 53
        { turnin = 3882 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 53
        { turnin = 4288, when = { log = 4288 }, -- level 53
          note = "Your targets are within the cavern." },
        { accept = { 4285, 4287 }, when = { done = 4284 } }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 53
        { turnin = 3883 }, -- level 53
        { turnin = 3881 }, -- level 53
        { turnin = 4145, accept = 4147 }, -- level 53
        { accept = 4243 }, -- level 53
        { complete = 4285, when = { log = 4285 }, -- level 53
          note = "Look for it high on the clifftop." },
        { go = { 1449, 63.82, 16.4 }, text = "Go into the cavern" }, -- level 53
        { go = { 1449, 69.02, 17.56 }, text = "Climb the trail" }, -- level 53
        { complete = 4301, -- level 53
          note = "This one roams, so scan the surrounding area. Climb to the cave's upper level." },
        { go = { 1449, 65.93, 16.72 }, text = "Take the trail through the cavern" }, -- level 53
        { turnin = 4243, -- level 53
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. Your targets are within the cavern." },
        { accept = 4244, when = { item = 10561 } }, -- level 53
        { accept = 4244, when = { log = 4244 } }, -- level 53
        { accept = 4244, when = { done = 4244 } }, -- level 53
        { turnin = 4244, noauto = 4245, when = { log = 4244, ready = 4244 }, -- level 53
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. Your targets are within the cavern." },
        { accept = 4245, when = { done = 4244, log = 4244 } }, -- level 53
        { turnin = 4244, noauto = 4245, when = { done = 4244, ready = 4244 }, -- level 53
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear. Your targets are within the cavern." },
        { accept = 4245, when = { done = 4244 } }, -- level 53
        { complete = 4245, when = { log = 4245 }, -- level 53
          note = "Let the conversation play out. Escort A-Me 01 and keep it alive." },
        { turnin = 4245, when = { log = 4245 } }, -- level 53
        { go = { 1449, 64.17, 16.32 }, text = "Head out of the cave" }, -- level 53
        { complete = 4287, when = { log = 4287 }, -- level 53
          note = "Look for it high on the clifftop." },
        { turnin = 4301 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Go into the cavern" }, -- level 53
        { turnin = 4285, when = { log = 4285 }, -- level 53
          note = "Your targets are within the cavern." },
        { turnin = 4287, when = { log = 4287 } }, -- level 53
        { accept = 4321, when = { done = 4285 } }, -- level 53
        { turnin = 4321, when = { log = 4321 }, -- level 53
          note = "Your targets are within the cavern." },
        { destroy = 11482 }, -- level 53
        { go = { 1449, 43.41, 6.84 }, text = "Head out of the cave" }, -- level 53
        { turnin = 4496, why = { kind = "detour", quest = 4496, seconds = 300, short = true, xp = 5300 }, -- level 53
          note = "The NPC is indoors." },
        { turnin = 4120, -- level 54
          note = "The NPC is indoors." },
        { go = { 1444, 59.09, 44.57 }, elite = true, text = "Reveal Dire Maul on your map", -- level 54
          note = "Get onto the massive incline. Watch out for elite foes here. Flee afterward." },
        { go = { 1444, 44.56, 9.85 }, text = "Stand on the neighboring ledge, then hop into this crack in the wall" }, -- level 54
        { collect = { { 11242, 1 } }, object = 164798, spots = { { 1444, 44.6, 10.18 } }, -- level 54
          note = "The object is indoors." },
        { complete = 3909, talk = 7775, -- level 54
          note = "Finish the quest named The Videre Elixir. Keep the elixir in your bags; never consume it. You will die from it." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 54
        { train = true, talk = 3047, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 54
          note = "Your targets are within the cavern." },
        { talk = 8356, collect = { { 10680, 1 }, { 10538, 1 } }, spots = { { 1456, 47.19, 57.86 } }, -- level 54
          note = "The NPC is indoors." },
        { talk = 8356, bank = 11243, -- level 54
          note = "The NPC is indoors. You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot." },
        { accept = 3762, -- level 54
          note = "The NPC is indoors." },
        { go = { 1456, 29.77, 29.79 }, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, text = "Go into the cavern", -- level 54
          note = "Your targets are within the cavern." },
        { train = true, talk = 3045, races = { "Scourge", "Troll" }, classes = { "PRIEST" } }, -- level 54
        { train = true, talk = 3030, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 54
          note = "The NPC is indoors." },
        { train = true, talk = 10086, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 54
          note = "The NPC is indoors." },
        { train = true, talk = 3040, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 54
          note = "The NPC is indoors." },
        { train = true, talk = 3043, classes = { "WARRIOR" }, -- level 54
          note = "The NPC is indoors." },
        { accept = 1000, patrol = { { 1456, 42.63, 59.47 }, { 1456, 39.28, 63.15 }, { 1456, 37.18, 59.82 }, { 1456, 36.35, 54.02 }, { 1456, 37.84, 51.05 }, { 1456, 42.82, 56.46 }, { 1456, 44.33, 68.45 }, { 1456, 46.23, 69.19 }, { 1456, 49.01, 66.7 }, { 1456, 49.79, 61.98 }, { 1456, 56.74, 61.7 }, { 1456, 56.22, 54.54 }, { 1456, 59, 52.27 }, { 1456, 57.7, 48.52 }, { 1456, 54.28, 48.48 }, { 1456, 52.54, 51.27 }, { 1456, 55.25, 54.57 } }, -- level 54
          note = "The NPC patrols a long route; look along it." },
        { turnin = 3518, accept = 3562, -- level 54
          note = "The NPC is indoors." },
        { turnin = { 3762, 1000 }, accept = { 3761, 1123 }, why = { kind = "carry", quest = 1123, seconds = 106920, xp = 1400 }, -- level 54
          note = "The NPC is indoors." },
        { turnin = 3761, when = { ready = 3761 } }, -- level 54
        { destroy = 11018, -- level 54
          note = "You no longer need these; vendor or discard them." },
        { accept = 3782, when = { done = 3761 }, -- level 54
          note = "The NPC is indoors." },
        { turnin = 3782, when = { log = 3782 }, -- level 54
          note = "The NPC is indoors." },
        { turnin = 4502, elite = true }, -- level 54
        { turnin = 4147, why = { chain = 2, kind = "detour", quest = 5158, quests = 4, seconds = 240, short = true, total = 13000, xp = 11000 }, -- level 54
          note = "The NPC is indoors." },
        { turnin = 5158 }, -- level 54
        { accept = 5159, why = { kind = "carry", once = true, quest = 5159, seconds = 4860, xp = 2700 }, -- level 54
          note = "Wait for the talking to finish" },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 54
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 54
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 54
          note = "This NPC is found down in the Cleft of Shadow." },
    },
})
