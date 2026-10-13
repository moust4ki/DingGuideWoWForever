-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/28.lua.
-- Simulated (warrior): Orc 46 (9%) -> 48 (4%) in 12 h 12, 22 quests turned in; Scourge 46 (9%) -> 48 (4%) in 12 h 12, 22 quests turned in; Tauren 46 (9%) -> 48 (4%) in 12 h 12, 22 quests turned in; Troll 46 (9%) -> 48 (4%) in 12 h 12, 22 quests turned in; Skyborne 46 (9%) -> 48 (4%) in 12 h 12, 22 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h28-tanaris-and-dustwallow-marsh",
    title    = "Tanaris and Dustwallow (46-48)",
    faction  = "Horde",
    minLevel = 46, maxLevel = 48,
    next     = "leveling-h29-the-hinterlands",
    leftOut  = {
        [1189] = { kind = "detour", seconds = 120, xp = 800 },
    },
    steps    = {
        { go = { 1441, 77.79, 77.27 }, text = "Travel to the Shimmering Flats", -- level 46
          note = "Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh." },
        { turnin = 1119, when = { log = 1119 } }, -- level 46
        { accept = 1120, when = { done = 1119 }, -- level 46
          note = "Wait for the talking to finish" },
        { turnin = 1120, when = { log = 1120 } }, -- level 46
        { accept = 1122, when = { done = 1120 }, why = { continent = true, kind = "carry", quest = 1122, seconds = 88020, xp = 1500 } }, -- level 46
        { turnin = 1187, accept = 1188 }, -- level 46
        { accept = 3362 }, -- level 46
        { turnin = 1188 }, -- level 46
        { elite = true, useitem = 8584, -- level 46
          note = "Stay clear of the elite foes. Be ready for a fight right away. Watch out for a pair of stronger monsters here." },
        { accept = 82, elite = true }, -- level 46
        { accept = { 2781, 2875 } }, -- level 46
        { accept = 2741 }, -- level 46
        { turnin = 2741, when = { ready = 2741 } }, -- level 46
        { collect = { { 8646, 1 }, { 8645, 1 }, { 8644, 1 }, { 8643, 1 } }, useitem = 8647, when = { item = 8647 } }, -- level 46
        { accept = 2750, when = { done = 2741, item = 8646 } }, -- level 46
        { turnin = 2750, when = { item = 8646, ready = 2750 } }, -- level 46
        { accept = 2749, when = { done = 2741, item = 8645 } }, -- level 46
        { turnin = 2749, when = { item = 8645, ready = 2749 } }, -- level 46
        { accept = 2748, when = { done = 2741, item = 8644 } }, -- level 46
        { turnin = 2748, when = { item = 8644, ready = 2748 } }, -- level 46
        { accept = 2747, when = { done = 2741, item = 8643 } }, -- level 46
        { turnin = 2747, when = { item = 8643, ready = 2747 } }, -- level 46
        { accept = 5863 }, -- level 46
        { accept = 1691 }, -- level 46
        { talk = 7799, bank = { 9618, 5807 }, -- level 46
          note = "The NPC is indoors. You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots." },
        { accept = 2605 }, -- level 46
        { accept = 8365 }, -- level 46
        { turnin = 3520 }, -- level 46
        { vendor = true, talk = 8139, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 46
          note = "A lengthy grinding stretch is coming up. The NPC is indoors." },
        { accept = 8366, -- level 46
          note = "The NPC is indoors." },
        { accept = 2873, sticky = 1691, -- level 46
          note = "The NPC is indoors." },
        { complete = 2781, patrol = { { 1446, 63.89, 31.92 }, { 1446, 63.33, 37.26 }, { 1446, 62.25, 37.8 }, { 1446, 59.56, 41.25 }, { 1446, 58.76, 38.2 }, { 1446, 61.91, 33.36 } }, -- level 46
          note = "The target patrols a wide loop, turning counterclockwise. Watch for a pair of guards hiding in stealth. The target's spawn point is 58.9, 39.3 in Tanaris." },
        { complete = 1691, sticky = { 8365, 8366 }, -- level 46
          note = "These foes hide in stealth." },
        { go = { 1446, 68.56, 41.43 }, text = "Head down the passage that opens on Lost Rigger Cove" }, -- level 46
        { complete = 2873, -- level 46
          note = "The object is indoors, one floor up." },
        { complete = 2875 }, -- level 46
        { accept = 2876, collect = { { 9276, 1 }, { 9250, 1 } }, useitem = { 9276, 9250 }, when = { maxlevel = 46 }, -- level 46
          note = "Few kills yield this item." },
        { collect = { { 8623, 1 } }, useitem = 8623, when = { maxlevel = 46 }, -- level 46
          note = "Few kills yield this item." },
        { complete = 8365 }, -- level 46
        { complete = 8366 }, -- level 46
        { complete = 8366, -- level 46
          note = "Others can be found on raised wood platforms close by." },
        { complete = 8366, -- level 46
          note = "Others are indoors too." },
        { level = 47, patrol = { { 1446, 73.84, 46.57 }, { 1446, 73.24, 48.64 }, { 1446, 70.96, 47.24 }, { 1446, 72.34, 45.04 }, { 1446, 70.34, 42.44 }, { 1446, 76.16, 45.57 } }, why = { kind = "level", levels = { 45, 51 } }, -- level 46
          note = "Tougher foes are coming up next. Dungeon runs are a fine choice here too, as you like." },
        { go = { 1446, 69.69, 42.33 }, text = "Take the passage out of Lost Rigger Cove" }, -- level 47
        { turnin = { 2875, 8366 }, -- level 47
          note = "The NPC is indoors." },
        { turnin = 2876, when = { log = 2876 } }, -- level 47
        { turnin = 2873, accept = 2874, why = { continent = true, kind = "carry", quest = 2874, seconds = 64500, xp = 3900 }, -- level 47
          note = "The NPC is indoors." },
        { turnin = 8365 }, -- level 47
        { turnin = { 2781, 1691 } }, -- level 47
        { talk = 7799, bank = 9245, -- level 47
          note = "The NPC is indoors. You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot." },
        { turnin = 3380, accept = { 3444, 3161 } }, -- level 47
        { complete = 5863, -- level 47
          note = "Your objective lies in a little cavern." },
        { complete = 5863 }, -- level 47
        { complete = 3161, sticky = 3362, -- level 47
          note = "Search the sand mounds." },
        { complete = 2605, -- level 47
          note = "It competes for spawn points." },
        { complete = 3362 }, -- level 47
        { turnin = 3161 }, -- level 47
        { turnin = 2605, accept = 2606 }, -- level 47
        { sethearth = "Gadgetzan", talk = 7733, -- level 47
          note = "The NPC is indoors." },
        { turnin = 5863 }, -- level 47
        { turnin = 3362 }, -- level 47
        { turnin = 2606, accept = 2641 }, -- level 47
        { turnin = 82, elite = true, when = { ready = 82 } }, -- level 47
        { accept = 10, elite = true, when = { done = 82 } }, -- level 47
        { go = { 1446, 55.74, 68.86 }, text = "Go into the cavern" }, -- level 47
        { go = { 1446, 57.67, 70.72 }, text = "Take the trail downhill" }, -- level 47
        { complete = 10, elite = true, when = { log = 10 } }, -- level 47
        { accept = 864, when = { done = 654 }, why = { continent = true, kind = "carry", once = true, quest = 864, seconds = 16980, short = true, xp = 5100 } }, -- level 47
        { talk = 7799, bank = 8527, -- level 47
          note = "The NPC is indoors. You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot." },
        { turnin = 10, elite = true, when = { log = 10 } }, -- level 47
        { accept = 110, elite = true, when = { done = 10 } }, -- level 47
        { turnin = 110, elite = true, when = { log = 110 } }, -- level 47
        { accept = 113, elite = true, when = { done = 110 } }, -- level 47
        { turnin = 113, elite = true, when = { log = 113 } }, -- level 47
        { accept = 32, elite = true, when = { done = 113 } }, -- level 47
        { level = 48, collect = { { 8483, 1 }, { 8483, 1 } }, patrol = { { 1446, 60.74, 36.66 }, { 1446, 58.37, 36.46 }, { 1446, 58.36, 38.44 }, { 1446, 60.46, 39.17 }, { 1446, 63.36, 39.76 }, { 1446, 65.14, 39.18 }, { 1446, 63.35, 37.46 }, { 1446, 61.85, 34.16 }, { 1446, 60.34, 32.37 } }, why = { kind = "level", levels = { 39, 52 } }, -- level 47
          note = "Targets here are human. Watch out for foes hidden in stealth. Zones with stronger foes lie just ahead." },
        { accept = 1172, why = { chain = 1, kind = "detour", quest = 1172, seconds = 420, short = true, xp = 9700 }, -- level 48
          note = "Your objective lies in a little cavern." },
        { accept = 2846, dungeon = "Zul'Farrak", -- level 48
          note = "The NPC is indoors." },
        { complete = 1172, -- level 48
          note = "Look for brown eggs covered in spikes." },
        { turnin = 1172, -- level 48
          note = "Your objective lies in a little cavern." },
        { accept = 3527, dungeon = "Zul'Farrak" }, -- level 48
        { accept = 2768, dungeon = "Zul'Farrak" }, -- level 48
        { accept = 2865, dungeon = "Zul'Farrak" }, -- level 48
        { accept = 3042, dungeon = "Zul'Farrak" }, -- level 48
        { complete = 3527, dungeon = "Zul'Farrak", -- level 48
          note = "The target is the dungeon's second boss." },
        { complete = 2768, dungeon = "Zul'Farrak", -- level 48
          note = "Once freed, they can be killed. Win the encounter at the temple." },
        { complete = { 3527, 2846 }, dungeon = "Zul'Farrak", -- level 48
          note = "Take the trail to the southeast. Inside a big room around a central pool. This one roams, so scan the surrounding area." },
        { complete = 2865, dungeon = "Zul'Farrak", -- level 48
          note = "You'll find them all over the instance. Most of them are in Theka the Martyr's scarab chamber." },
        { complete = 3042, dungeon = "Zul'Farrak", -- level 48
          note = "The targets are trolls. You'll find them all over the instance. It could take a few trips through the instance." },
        { turnin = 3527, dungeon = "Zul'Farrak" }, -- level 48
        { turnin = 2768, dungeon = "Zul'Farrak" }, -- level 48
        { turnin = 2865, dungeon = "Zul'Farrak" }, -- level 48
        { turnin = 3042, dungeon = "Zul'Farrak" }, -- level 48
        { turnin = 2846, dungeon = "Zul'Farrak", -- level 48
          note = "The NPC is indoors." },
        { complete = 3444, why = { kind = "detour", quest = 98906, seconds = 120, xp = 600 } }, -- level 48
        { accept = 98906 }, -- level 48
        { turnin = 98906 }, -- level 48
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 48
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 48
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 48
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 48
          note = "This NPC is found down in the Cleft of Shadow." },
        { go = { 1454, 56.45, 56.87 }, text = "Climb the steps" }, -- level 48
        { turnin = 32, elite = true, when = { log = 32 } }, -- level 48
        { accept = 649, -- level 48
          note = "The NPC is indoors." },
        { turnin = 649, accept = 650, -- level 48
          note = "The NPC is indoors." },
        { accept = 4300, -- level 48
          note = "The NPC is upstairs, out on the balcony." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 48
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 48
          note = "The NPC stands on the highest level of this structure." },
    },
})
