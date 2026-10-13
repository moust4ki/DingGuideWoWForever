-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/39.lua.
-- Simulated (warrior): Orc 56 (16%) -> 58 (13%) in 13 h 33, 45 quests turned in; Scourge 56 (16%) -> 58 (13%) in 13 h 33, 45 quests turned in; Tauren 56 (16%) -> 58 (13%) in 13 h 33, 45 quests turned in; Troll 56 (16%) -> 58 (13%) in 13 h 33, 45 quests turned in; Skyborne 56 (16%) -> 58 (13%) in 13 h 02, 46 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h39-western-and-eastern-plaguelands",
    title    = "The Plaguelands (56-58)",
    faction  = "Horde",
    minLevel = 56, maxLevel = 58,
    next     = "leveling-h40-winterspring",
    steps    = {
        { go = { 1458, 63.9, 44.08 }, text = "Travel to the Undercity", -- level 56
          note = "Undercity first, then the Plaguelands." },
        { accept = 5094, -- level 56
          note = "The NPC wears a pale shirt and carries a lamp. The NPC patrols a long route; look along it." },
        { vendor = true, talk = 4555, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 56
          note = "A lengthy stretch of quests is coming up. You won't find an ammunition seller." },
        { turnin = 5094, accept = 5096 }, -- level 56
        { collect = { { 12814, 1 } }, spots = { { 1420, 83.11, 69.13 } } }, -- level 56
        { turnin = 6029, accept = 5405 }, -- level 56
        { turnin = 5405 }, -- level 56
        { equip = 12846, -- level 56
          note = "Undead foes drop these in both Plaguelands zones, Western and Eastern. Keep your Argent Dawn Commission aura up." },
        { complete = 5096, useitem = 12807 }, -- level 56
        { turnin = 5096, accept = 5228 }, -- level 56
        { accept = 5098, elite = true }, -- level 56
        { destroy = 12814 }, -- level 56
        { turnin = 5228, accept = 5229 }, -- level 56
        { complete = 5229 }, -- level 56
        { turnin = 5229, accept = 5230 }, -- level 56
        { accept = 5021, -- level 56
          note = "The NPC is indoors, one floor up." },
        { turnin = 5021, accept = 5023, -- level 56
          note = "The object is indoors." },
        { turnin = 5230, accept = 5231 }, -- level 56
        { complete = 5231 }, -- level 56
        { turnin = 5231, accept = 5232 }, -- level 56
        { accept = 5058, -- level 56
          note = "The object is indoors." },
        { turnin = 5058 }, -- level 56
        { collect = { { 12738, 1 } }, -- level 56
          note = "Look for a white set of bones. This one roams, so scan the surrounding area. The targets appear in several places." },
        { collect = { { 12739, 1 } }, -- level 56
          note = "Finish Locked Away to obtain this." },
        { accept = 5060, -- level 56
          note = "The object is indoors, one floor up." },
        { turnin = 5060, when = { ready = 5060 } }, -- level 56
        { accept = 4971, -- level 56
          note = "The NPC is indoors, one floor up." },
        { complete = 5098, elite = true, useitem = 12815, -- level 56
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { complete = 5098, elite = true, useitem = 12815, -- level 56
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { complete = 4971, useitem = 12627, -- level 56
          note = "Close to the big buildings lit in blue. A new one may appear when one is killed." },
        { complete = 5098, elite = true, useitem = 12815, -- level 56
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { complete = 5098, elite = true, useitem = 12815, -- level 56
          note = "Stand at the watchtower's doorway. An elite foe waits indoors; stay clear of it." },
        { turnin = 4971, accept = 4972, -- level 56
          note = "The NPC is indoors, one floor up." },
        { complete = 4972, -- level 56
          note = "Look for little gray coffers of metal. The targets are in the ruined houses." },
        { turnin = 5098, elite = true }, -- level 56
        { accept = 838, elite = true }, -- level 56
        { destroy = 12815 }, -- level 56
        { turnin = 838, elite = true }, -- level 56
        { accept = 964, elite = true }, -- level 56
        { turnin = 5232, accept = 5233 }, -- level 56
        { accept = 5901 }, -- level 56
        { complete = 964, elite = true }, -- level 56
        { complete = 5233 }, -- level 56
        { turnin = 5233, accept = 5234 }, -- level 56
        { accept = 4984, sticky = 4984, -- level 56
          note = "The NPC is indoors." },
        { accept = 6004 }, -- level 56
        { complete = 6004 }, -- level 56
        { complete = 6004 }, -- level 56
        { turnin = 6004 }, -- level 56
        { accept = 6023, elite = true }, -- level 56
        { complete = 6023, elite = true }, -- level 56
        { complete = 6023, elite = true, -- level 56
          note = "This one roams, so scan the surrounding area. Targets are in the tower and around its base. If an elite stands on the tower's roof, hold back outside." },
        { turnin = 6023, elite = true }, -- level 56
        { complete = 4984, -- level 56
          note = "Spiders also appear at these spawn spots." },
        { turnin = 4984, accept = 4985, sticky = 4985, -- level 56
          note = "The NPC is indoors." },
        { accept = { 5542, 5543, 5544 }, sticky = { 5544, 5542, 5543 } }, -- level 56
        { accept = 6042 }, -- level 56
        { accept = 6022, elite = true }, -- level 56
        { turnin = 5601, accept = 5149, -- level 56
          note = "The NPC is within the ruined home." },
        { collect = { { 12886, 1 } }, object = 176116, spots = { { 1423, 32.57, 79.29 }, { 1423, 33.94, 77.32 }, { 1423, 33.93, 79.55 } }, -- level 56
          note = "Search within the houses here. Be ready for a fight right away." },
        { collect = { { 12887, 1 } }, object = 176142, spots = { { 1423, 32.57, 79.29 }, { 1423, 33.94, 77.32 }, { 1423, 33.93, 79.55 } }, -- level 56
          note = "Search within the houses here. Be ready for a fight right away." },
        { collect = { { 12888, 1 } }, object = 176143, spots = { { 1423, 32.57, 79.29 }, { 1423, 33.94, 77.32 }, { 1423, 33.93, 79.55 } }, -- level 56
          note = "Search within the houses here. Be ready for a fight right away." },
        { complete = 5149, useitem = 12886 }, -- level 56
        { turnin = 5149, sticky = { 5542, 5543 }, when = { item = 12885 }, -- level 56
          note = "The NPC is within the ruined home." },
        { accept = 5152, when = { done = 5149 } }, -- level 56
        { accept = 5241, when = { done = 5149 }, races = { "Skyborne" } }, -- level 56
        { complete = 5544, -- level 56
          note = "Look for big yellow grubs." },
        { complete = { 5542, 5543 } }, -- level 56
        { level = 57, patrol = { { 1423, 34.58, 71.45 }, { 1423, 31.85, 69.49 }, { 1423, 29.64, 71.46 }, { 1423, 26.38, 72.7 }, { 1423, 26.49, 66.21 }, { 1423, 28.83, 63.24 }, { 1423, 27.56, 58.92 }, { 1423, 24.85, 59.13 }, { 1423, 22.97, 56.78 }, { 1423, 24.3, 54.25 }, { 1423, 26.94, 54.15 }, { 1423, 21.72, 52.89 }, { 1423, 19.38, 54.34 }, { 1423, 16.74, 55.05 }, { 1423, 14.5, 57.77 }, { 1423, 16.76, 59.83 }, { 1423, 17.64, 62.46 }, { 1423, 13.5, 63.71 }, { 1423, 14.04, 67.13 }, { 1423, 17.94, 68.29 }, { 1423, 21.35, 59.28 }, { 1423, 13.15, 54.17 }, { 1423, 31.24, 58.22 }, { 1423, 35.1, 58.39 }, { 1423, 35.11, 55.52 }, { 1423, 38.78, 55.6 }, { 1423, 38.54, 61.27 }, { 1423, 40.95, 62.25 }, { 1423, 42.85, 66.13 }, { 1423, 39.69, 68.29 }, { 1423, 35.81, 67.41 }, { 1423, 36.55, 63.62 } } }, -- level 56
        { complete = 6022, elite = true, collect = { { 15447, 7 } }, useitem = 15454, -- level 56
          note = "Fight undead foes. Beware of foes lurking in stealth. Elite human foes walk patrols here; stay clear." },
        { complete = { 5542, 6042 } }, -- level 57
        { turnin = 6030 }, -- level 57
        { turnin = 5241, when = { log = 5241 } }, -- level 57
        { accept = 5211 }, -- level 57
        { accept = 6021, races = { "Skyborne" }, -- level 57
          note = "This one roams, so scan the surrounding area." },
        { vendor = true, talk = 11038, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 57
          note = "A lengthy stretch of quests is coming up. This one roams, so scan the surrounding area." },
        { go = { 1423, 70.49, 47.5 }, fly = true, talk = 12636, text = "Flight master at Light's Hope Chapel" }, -- level 57
        { complete = 5901, -- level 57
          note = "Look for big rocks seeping green slime. Progress westward as you go." },
        { complete = { 5542, 6042 } }, -- level 57
        { complete = 5211, talk = 11064, -- level 57
          note = "The targets are ghouls. Other undead compete for the same spawn points. The spirits rise where those foes die." },
        { go = { 1423, 23.38, 73.25 }, text = "Go down into the tomb" }, -- level 57
        { complete = 6021, races = { "Skyborne" }, -- level 57
          note = "This is below ground, on the crypt's lower floor." },
        { turnin = 6022, elite = true, when = { item = 15448 } }, -- level 57
        { turnin = 6042 }, -- level 57
        { turnin = { 5542, 5543, 5544 }, accept = 5742 }, -- level 57
        { complete = 5742, talk = 1855, -- level 57
          note = "Your character must be seated first." },
        { turnin = 5742 }, -- level 57
        { complete = 4985, -- level 57
          note = "Spiders also appear at these spawn spots." },
        { turnin = 4985, accept = 4987, -- level 57
          note = "The NPC is indoors." },
        { turnin = 5152, when = { log = 5152 }, -- level 57
          note = "Check each of the two floors indoors." },
        { accept = 5153, when = { done = 5152 } }, -- level 57
        { complete = 5153, when = { log = 5153 } }, -- level 57
        { turnin = 4972, -- level 57
          note = "The NPC is indoors, one floor up." },
        { turnin = 5153, when = { log = 5153 } }, -- level 57
        { accept = 5154, when = { done = 5153 } }, -- level 57
        { complete = 5154, when = { log = 5154 }, -- level 57
          note = "Move the camera close and check which book is genuine. Some books are traps that summon foes. The genuine book can look two ways:" },
        { turnin = 5154, when = { log = 5154 }, -- level 57
          note = "The NPC is indoors, one floor up." },
        { accept = 5210, when = { done = 5154 } }, -- level 57
        { destroy = 15696 }, -- level 57
        { turnin = 964, elite = true }, -- level 57
        { turnin = 5234, accept = 5235 }, -- level 57
        { turnin = 5901, accept = 5902 }, -- level 57
        { complete = 95314, races = { "Scourge" } }, -- level 57
        { turnin = 95314, races = { "Scourge" } }, -- level 57
        { complete = 95314, races = { "Tauren" } }, -- level 57
        { turnin = 95314, races = { "Tauren" } }, -- level 57
        { complete = 95314, races = { "Orc", "Troll" } }, -- level 57
        { turnin = 95314, races = { "Orc", "Troll" } }, -- level 57
        { destroy = 15043 }, -- level 57
        { turnin = 5023, accept = 5049 }, -- level 57
        { turnin = 5049, accept = 5050, -- level 57
          note = "The NPC hides beneath the staircase." },
        { talk = 15682, collect = { { 2592, 60 }, { 4306, 60 }, { 4338, 60 }, { 14047, 60 } }, -- level 57
          note = "You can also take it out of your bank." },
        { accept = 7813, when = { item = { 2592, 60 } } }, -- level 57
        { turnin = 7813, when = { item = { 2592, 60 }, ready = 7813 } }, -- level 57
        { accept = 7814, when = { item = { 4306, 60 } } }, -- level 57
        { turnin = 7814, when = { item = { 4306, 60 }, ready = 7814 } }, -- level 57
        { accept = 7817, when = { item = { 4338, 60 } } }, -- level 57
        { turnin = 7817, when = { item = { 4338, 60 }, ready = 7817 } }, -- level 57
        { accept = 7818, when = { done = 7813, item = { 14047, 60 } } }, -- level 57
        { turnin = 7818, when = { item = { 14047, 60 }, ready = 7818 } }, -- level 57
        { turnin = 6021, races = { "Skyborne" }, -- level 57
          note = "This one roams, so scan the surrounding area." },
        { turnin = 5211 }, -- level 57
        { turnin = 5210, when = { log = 5210 } }, -- level 57
        { accept = 5181, when = { done = 5210 } }, -- level 57
        { complete = 5181, when = { log = 5181 }, -- level 57
          note = "Your targets sit below the water's surface." },
        { complete = 5181, when = { log = 5181 } }, -- level 57
        { turnin = 5235, when = { ready = 5235 } }, -- level 57
        { accept = 5236, when = { done = 5235 } }, -- level 57
        { turnin = 5902, accept = 6390, -- level 57
          note = "The object is indoors. It shows up on top of the box." },
        { turnin = 5050, accept = 5051, -- level 57
          note = "The NPC is indoors, one floor up." },
        { collect = { { 12722, 1 } }, spots = { { 1422, 38.03, 56.41 }, { 1422, 36.17, 57.43 }, { 1422, 36.15, 59.35 }, { 1422, 37.26, 55.35 } }, -- level 57
          note = "The target is a ghoul armed with a hayfork. This one roams, so scan the surrounding area. It can appear at this spot." },
        { complete = 5051, useitem = 12722 }, -- level 57
        { turnin = 5051, when = { item = 12723 }, -- level 57
          note = "The NPC is indoors, one floor up." },
        { level = 58, patrol = { { 1422, 41.76, 62.04 }, { 1422, 44.76, 62.24 }, { 1422, 47.94, 63.04 }, { 1422, 45.66, 65.43 }, { 1422, 42.57, 66.96 }, { 1422, 39.35, 66.86 }, { 1422, 37.83, 70.45 }, { 1422, 40.97, 70.37 }, { 1422, 44.44, 69.83 }, { 1422, 46.94, 71.55 }, { 1422, 48.03, 68.17 }, { 1422, 44.24, 74.76 }, { 1422, 40.23, 73.75 } } }, -- level 57
        { turnin = 5236, when = { log = 5236 } }, -- level 58
        { turnin = 6390 }, -- level 58
        { accept = 5238, when = { done = 5236 } }, -- level 58
        { turnin = 5238, when = { log = 5238 } }, -- level 58
        { turnin = 5181, when = { log = 5181 } }, -- level 58
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 58
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 58
          note = "The NPC is indoors." },
        { talk = 8673, collect = { { 2592, 60 }, { 4306, 60 }, { 4338, 60 }, { 14047, 60 } }, -- level 58
          note = "You can also take it out of your bank. The NPC is indoors." },
        { talk = 3309, collect = { { 10679, 1 } }, spots = { { 1454, 49.62, 69.06 } }, -- level 58
          note = "The NPC is indoors." },
        { talk = 3309, bank = 12663, -- level 58
          note = "The NPC is indoors." },
        { accept = 7826, when = { item = { 2592, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7826, when = { item = { 2592, 60 }, ready = 7826 } }, -- level 58
        { accept = 7827, when = { item = { 4306, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7827, when = { item = { 4306, 60 }, ready = 7827 } }, -- level 58
        { accept = 7831, when = { item = { 4338, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7831, when = { item = { 4338, 60 }, ready = 7831 } }, -- level 58
        { accept = 7824, when = { done = 7826, item = { 14047, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7824, when = { item = { 14047, 60 }, ready = 7824 } }, -- level 58
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 58
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 58
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 58
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 58
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 58
          note = "This NPC is found down in the Cleft of Shadow." },
        { talk = 8673, collect = { { 2592, 60 }, { 4306, 60 }, { 4338, 60 }, { 14047, 60 } }, -- level 58
          note = "You can also take it out of your bank. The NPC is indoors." },
        { accept = 8276 }, -- level 58
        { accept = 7833, when = { item = { 2592, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7833, when = { item = { 2592, 60 }, ready = 7833 } }, -- level 58
        { accept = 7834, when = { item = { 4306, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7834, when = { item = { 4306, 60 }, ready = 7834 } }, -- level 58
        { accept = 7835, when = { item = { 4338, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7835, when = { item = { 4338, 60 }, ready = 7835 } }, -- level 58
        { accept = 7836, when = { done = 7833, item = { 14047, 60 } }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 7836, when = { item = { 14047, 60 }, ready = 7836 } }, -- level 58
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 58
          note = "The NPC is indoors." },
        { turnin = 3564 }, -- level 58
    },
})
