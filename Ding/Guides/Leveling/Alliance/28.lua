-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/28.lua.
-- Simulated (warrior): Human 44 (14%) -> 48 (57%) in 31 h 53, 28 quests turned in; Dwarf 44 (14%) -> 48 (57%) in 31 h 53, 28 quests turned in; NightElf 44 (14%) -> 48 (57%) in 31 h 53, 28 quests turned in; Gnome 44 (14%) -> 48 (57%) in 31 h 53, 28 quests turned in; Skyborne 44 (14%) -> 48 (57%) in 31 h 53, 28 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a28-feralas-and-tanaris",
    title    = "Feralas and Tanaris (44-48)",
    faction  = "Alliance",
    minLevel = 44, maxLevel = 48,
    next     = "leveling-a29-the-hinterlands",
    steps    = {
        { accept = 3022, -- level 44
          note = "Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold." },
        { accept = 2821 }, -- level 44
        { sethearth = "Feathermoon Stronghold", talk = 7736, -- level 44
          note = "The NPC is indoors." },
        { accept = 4124, -- level 44
          note = "The NPC is indoors." },
        { accept = 2866, -- level 44
          note = "The NPC is indoors." },
        { accept = 2939, -- level 44
          note = "The NPC is indoors." },
        { accept = 2982, -- level 44
          note = "The NPC is indoors." },
        { turnin = 4124, accept = 4125, -- level 44
          note = "The NPC is indoors, one floor up." },
        { turnin = 2866, accept = 2867, object = 142179, -- level 44
          note = "Position yourself in its center." },
        { turnin = 2867, accept = 3130, -- level 44
          note = "The NPC is indoors." },
        { turnin = 3130, accept = 2869, -- level 44
          note = "The NPC is indoors." },
        { complete = 2869, -- level 44
          note = "Hunt naga." },
        { turnin = 2869, accept = 2870, -- level 44
          note = "The NPC is indoors." },
        { vendor = true, talk = 7942, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 44
          note = "A lengthy grinding stretch is coming up. The NPC is indoors." },
        { go = { 1444, 26.06, 67.3 }, text = "Go into the cavern" }, -- level 44
        { complete = 2870, -- level 44
          note = "Consider bringing a group for this one. Your targets are within the cavern." },
        { go = { 1444, 26.06, 67.3 }, text = "Head out of the cave" }, -- level 44
        { accept = 2766, collect = { { 8705, 1 } }, useitem = 8705, -- level 44
          note = "The item drops rarely." },
        { level = 46, patrol = { { 1444, 25.26, 62.77 }, { 1444, 27.37, 62.45 }, { 1444, 26.64, 65.05 }, { 1444, 24.56, 66.83 }, { 1444, 23.37, 64.16 } }, -- level 44
          note = "Zones with stronger foes lie just ahead. The quests alone won't give you the level you need." },
        { go = { 1444, 26.06, 67.3 }, text = "Head out of the cave" }, -- level 46
        { go = { 1444, 38.99, 74.96 }, text = "Swim this way to stay out of fatigue" }, -- level 46
        { go = { 1444, 41.23, 74.26 }, text = "Swim this way to stay out of fatigue" }, -- level 46
        { turnin = 4125, accept = 4127, object = 164909, -- level 46
          note = "Your targets sit below the water's surface." },
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 46
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 46
          note = "The NPC is indoors." },
        { turnin = 4127, accept = 4129, -- level 46
          note = "The NPC is indoors, one floor up." },
        { turnin = 4129, -- level 46
          note = "The NPC waits on the tower's highest floor." },
        { accept = 4130, -- level 46
          note = "Let the conversation play out. The NPC waits on the tower's highest floor." },
        { turnin = 4130, accept = 4131, -- level 46
          note = "The NPC is indoors, one floor up." },
        { turnin = 2870, accept = 2871, -- level 46
          note = "The NPC is indoors." },
        { turnin = 2871, -- level 46
          note = "The NPC is indoors." },
        { talk = 8612, useitem = 10699, -- level 46
          note = "Hunt the crimson winged serpents. Slay them, then apply the item to their remains." },
        { complete = 3520, dungeon = "Zul'Farrak" }, -- level 46
        { turnin = 3520, accept = 3527, dungeon = "Zul'Farrak" }, -- level 46
        { accept = 2768, dungeon = "Zul'Farrak" }, -- level 46
        { accept = 2865, dungeon = "Zul'Farrak" }, -- level 46
        { accept = 3042, dungeon = "Zul'Farrak", races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 46
        { accept = 3042, dungeon = "Zul'Farrak", races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 46
        { complete = 3527, dungeon = "Zul'Farrak", -- level 46
          note = "The target is the dungeon's second boss." },
        { complete = 2768, dungeon = "Zul'Farrak", -- level 46
          note = "Once freed, they can be killed. Win the encounter at the temple." },
        { complete = 3527, dungeon = "Zul'Farrak", -- level 46
          note = "Take the trail to the southeast. Inside a big room around a central pool. This one roams, so scan the surrounding area." },
        { complete = 2865, dungeon = "Zul'Farrak", -- level 46
          note = "You'll find them all over the instance. Most of them are in Theka the Martyr's scarab chamber." },
        { complete = 3042, dungeon = "Zul'Farrak", races = { "Human", "Dwarf", "Gnome", "Skyborne" }, -- level 46
          note = "The targets are trolls. You'll find them all over the instance. It could take a few trips through the instance." },
        { complete = 3042, dungeon = "Zul'Farrak", races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 46
        { turnin = 3527, dungeon = "Zul'Farrak" }, -- level 46
        { turnin = 2768, dungeon = "Zul'Farrak" }, -- level 46
        { turnin = 2865, dungeon = "Zul'Farrak" }, -- level 46
        { turnin = 3042, dungeon = "Zul'Farrak", races = { "Human", "Dwarf", "Gnome", "Skyborne" } }, -- level 46
        { turnin = 3042, dungeon = "Zul'Farrak", races = { "NightElf" }, classes = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "WARLOCK", "DRUID" } }, -- level 46
        { level = 48, dungeon = "Zul'Farrak", sticky = { 2821, 1452 }, -- level 46
          note = "Zones with stronger foes lie just ahead. The quests alone won't give you the level you need. Do more Zul'Farrak runs." },
        { go = { 1444, 55.19, 56.33 }, text = "Keep to the road, then cross the tunnel" }, -- level 46
        { turnin = 2766, -- level 46
          note = "The robot sits in the open ground linking the cave and the tunnel." },
        { complete = 2821, -- level 46
          note = "The quest wants yetis; seek them out. Others lie past the tunnel." },
        { go = { 1444, 55.19, 56.33 }, text = "Get out of the cave and use the passage beyond" }, -- level 46
        { go = { 1444, 54.13, 68.28 }, text = "Climb the trail" }, -- level 46
        { unbank = 8564, keep = 8564, sticky = { 2982, 1452 }, -- level 46
          note = "Look for a big, pale egg. The targets are spread over several spots. Hang on to it; an upcoming quest uses it." },
        { complete = 2982 }, -- level 46
        { complete = 2982 }, -- level 46
        { complete = 2982 }, -- level 46
        { complete = 1452, -- level 46
          note = "Hunt gorillas. Bears appear at the same spawn spots." },
        { complete = 1452, -- level 46
          note = "Hunt bears. They appear in the same spots as the apes." },
        { go = { 1444, 66.72, 46.61 }, text = "Head to the big cage", -- level 46
          note = "Kill the foes near the big cage first. This helps with the following step." },
        { go = { 1444, 65.62, 46.83 }, text = "Climb the trail" }, -- level 46
        { accept = 2969 }, -- level 46
        { complete = 2969, -- level 46
          note = "This sets Captured Sprite Darters free. Save as many of them as possible. Keep 6 or more of them alive." },
        { go = { 1444, 65.62, 46.83 }, text = "Climb the trail" }, -- level 46
        { turnin = 2969, -- level 46
          note = "A timer runs on this one; don't dawdle. If she is gone, wait until she comes back." },
        { accept = 2970 }, -- level 46
        { complete = 2970 }, -- level 46
        { go = { 1444, 65.62, 46.83 }, text = "Climb the trail" }, -- level 46
        { turnin = 2970, accept = 2972 }, -- level 46
        { turnin = 4131, accept = 4135, object = 164953 }, -- level 46
        { accept = 4281, useitem = 11463 }, -- level 46
        { go = { 1444, 73.12, 63.91 }, text = "Go into the cavern at the trail's foot" }, -- level 46
        { go = { 1444, 72.66, 64.6 }, text = "Take the trail downhill" }, -- level 46
        { turnin = 4135, accept = 4265, object = 164954, -- level 46
          note = "Your targets are within the cavern." },
        { complete = 4265, -- level 46
          note = "Let the conversation play out. Your targets are within the cavern." },
        { turnin = 2821 }, -- level 46
        { turnin = 2982, accept = 3445, -- level 46
          note = "The NPC is indoors." },
        { turnin = 4265, accept = 4266, -- level 46
          note = "The NPC is indoors, one floor up." },
        { turnin = 4266, accept = 4267, -- level 46
          note = "The NPC is indoors." },
        { turnin = 3022, accept = 3661, -- level 46
          note = "The NPC is indoors." },
        { turnin = 2939, -- level 46
          note = "The NPC is indoors, one floor up." },
        { accept = 2940, -- level 46
          note = "The object is indoors, one floor up." },
        { turnin = 2940, accept = 2941, -- level 46
          note = "The NPC is indoors, one floor up." },
        { talk = 4209, bank = { 9329, 10699, 8564, 6258, 6259 } }, -- level 46
        { talk = 8723, collect = { { 11186, 7 }, { 11188, 7 }, { 11185, 7 }, { 11184, 7 } }, -- level 46
          note = "Getting it here speeds up Un'Goro Crater. The NPC is indoors." },
        { talk = 4209, bank = { 11186, 11188, 11185, 11184 } }, -- level 46
        { go = { 1457, 32.08, 16.4 }, classes = { "ROGUE" }, text = "Step into the cavern within the trunk", -- level 46
          note = "The spot is on the lower floor of the hollow tree." },
        { train = true, talk = 4163, classes = { "ROGUE" } }, -- level 46
        { train = true, talk = 4146, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 46
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 4089, classes = { "WARRIOR" } }, -- level 46
        { train = true, talk = 4091, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 46
          note = "The NPC is indoors." },
        { turnin = 4267, -- level 46
          note = "The NPC is indoors, one floor up." },
        { turnin = 2972, -- level 46
          note = "The NPC is indoors, one floor up." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 46
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 46
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 46
          note = "The NPC is indoors." },
        { vendor = true, talk = 7942, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 46
          note = "A lengthy grinding stretch is coming up. The NPC is indoors." },
        { level = 48, xp = 67550, patrol = { { 1444, 25.26, 62.77 }, { 1444, 27.37, 62.45 }, { 1444, 26.64, 65.05 }, { 1444, 24.56, 66.83 }, { 1444, 23.37, 64.16 } }, -- level 46
          note = "Zones with stronger foes lie just ahead. The quests alone won't give you the level you need." },
        { train = true, talk = 12042, races = { "NightElf" }, classes = { "DRUID" } }, -- level 46
        { train = true, talk = 7312, races = { "Human", "Gnome" }, classes = { "MAGE" }, -- level 46
          note = "The NPC is indoors." },
        { turnin = 4281 }, -- level 48
        { talk = 7799, collect = { { 9329, 1 }, { 8564, 1 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 48
          note = "The NPC is indoors." },
        { accept = 2741 }, -- level 48
        { turnin = 2741, when = { ready = 2741 } }, -- level 48
        { collect = { { 8646, 1 }, { 8645, 1 }, { 8644, 1 }, { 8643, 1 } }, useitem = 8647, when = { item = 8647 } }, -- level 48
        { turnin = 2941 }, -- level 48
        { accept = 2944, elite = true }, -- level 48
        { accept = 2750, when = { done = 2741, item = 8646 } }, -- level 48
        { turnin = 2750, when = { item = 8646, ready = 2750 } }, -- level 48
        { accept = 2749, when = { done = 2741, item = 8645 } }, -- level 48
        { turnin = 2749, when = { item = 8645, ready = 2749 } }, -- level 48
        { accept = 2748, when = { done = 2741, item = 8644 } }, -- level 48
        { turnin = 2748, when = { item = 8644, ready = 2748 } }, -- level 48
        { accept = 2747, when = { done = 2741, item = 8643 } }, -- level 48
        { turnin = 2747, when = { item = 8643, ready = 2747 } }, -- level 48
        { accept = 992, elite = true }, -- level 48
        { complete = 992, elite = true, useitem = 8584, -- level 48
          note = "Stay clear of the elite foes. Be ready for a fight right away." },
        { turnin = 992, elite = true }, -- level 48
        { accept = 82, elite = true }, -- level 48
        { turnin = 82, elite = true, when = { ready = 82 } }, -- level 48
        { talk = 7799, collect = { { 6257, 3 }, { 6258, 3 }, { 6259, 3 } }, spots = { { 1446, 52.35, 28.88 } }, -- level 48
          note = "The NPC is indoors." },
        { sethearth = "Gadgetzan", talk = 7733, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 5114, classes = { "WARRIOR" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 5117, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 10090, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 5167, classes = { "ROGUE" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 5172, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 48
          note = "The NPC is indoors." },
        { vendor = true, talk = 6382, races = { "Human", "Gnome" }, classes = { "WARLOCK" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 5143, races = { "Human", "Dwarf", "NightElf" }, classes = { "PRIEST" }, -- level 48
          note = "The NPC is indoors." },
        { train = true, talk = 5148, races = { "Human", "Dwarf" }, classes = { "PALADIN" }, -- level 48
          note = "The NPC is indoors." },
        { vendor = true, talk = 5101, races = { "Dwarf", "NightElf" }, classes = { "HUNTER" }, -- level 48
          note = "The NPC waits on the lower level, indoors. A lengthy stretch of quests is coming up. This vendor sells no arrows or bullets." },
    },
})
