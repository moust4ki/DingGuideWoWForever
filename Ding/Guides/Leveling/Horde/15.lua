-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/15.lua.
-- Simulated (warrior): Orc 34 (9%) -> 36 (32%) in 9 h 47, 21 quests turned in; Scourge 34 (9%) -> 36 (32%) in 9 h 47, 21 quests turned in; Tauren 34 (9%) -> 36 (32%) in 9 h 47, 21 quests turned in; Troll 34 (9%) -> 36 (32%) in 9 h 47, 21 quests turned in; Skyborne 34 (9%) -> 36 (32%) in 9 h 47, 21 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h15-desolace",
    title    = "Desolace (34-36)",
    faction  = "Horde",
    minLevel = 34, maxLevel = 36,
    next     = "leveling-h16-stranglethorn-vale",
    steps    = {
        { go = { 1443, 38.88, 27.16 }, text = "Travel to Desolace", -- level 34
          note = "Desolace: Ghost Walker Post is the hub, in the middle of the zone." },
        { vendor = true, talk = 3313, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 34
          note = "The NPC is indoors. A lengthy grinding stretch is coming up." },
        { accept = 1480, collect = { { 20310, 1 } }, useitem = 20310 }, -- level 34
        { level = 35, patrol = { { 1443, 57.84, 25.44 }, { 1443, 55.64, 24.76 }, { 1443, 55.16, 27.43 }, { 1443, 53.15, 27.46 }, { 1443, 53.43, 30.06 }, { 1443, 56.03, 29.36 }, { 1443, 57.14, 27.76 }, { 1443, 55.74, 31.55 } }, -- level 34
          note = "Plan on killing monsters for quite some time. Dungeon runs are a fine choice here too, as you like." },
        { accept = 5741, -- level 35
          note = "Look for it high on the clifftop." },
        { go = { 1443, 56.06, 53.72 }, text = "Climb the trail" }, -- level 35
        { turnin = 5361 }, -- level 35
        { turnin = 1432, accept = { 1433, 1434 } }, -- level 35
        { turnin = { 1433, 1480 }, accept = { 1435, 1481 } }, -- level 35
        { accept = 1365 }, -- level 35
        { accept = 1368 }, -- level 35
        { complete = 1365, sticky = 1434, -- level 35
          note = "The targets are spread over several spots. The NPC is indoors." },
        { complete = 1481, -- level 35
          note = "Other satyrs use the same spawn points. Beware of foes lurking in stealth." },
        { complete = 1434, -- level 35
          note = "Beware of foes lurking in stealth." },
        { accept = 5501, -- level 35
          note = "This one roams, so scan the surrounding area." },
        { go = { 1443, 55.93, 53.45 }, text = "Climb the trail" }, -- level 35
        { turnin = 1434 }, -- level 35
        { turnin = 1481, accept = 1482 }, -- level 35
        { turnin = 1365, accept = 1366 }, -- level 35
        { complete = { 1366, 1368 }, -- level 35
          note = "The targets here are centaurs. Magram Pack Runners patrol with 2 hyena escorts; steer clear." },
        { accept = 5561, sticky = 5501 }, -- level 35
        { complete = 5561, useitem = 13892, -- level 35
          note = "Target kodos with the item. The kodos trail behind you. Lead them to Smeed Scrabblescrew, then speak with them there." },
        { turnin = 5561 }, -- level 35
        { complete = 5501, -- level 35
          note = "Look for pale skulls of horned beasts. Expect a possible ambush while you gather it. Flee if things go badly." },
        { turnin = 1366, -- level 35
          note = "Look for it high on the clifftop." },
        { turnin = 1368, accept = 1370 }, -- level 35
        { go = { 1443, 26.31, 74.88 }, text = "Take the trail toward Shadowprey Village" }, -- level 35
        { accept = 5381 }, -- level 35
        { talk = 11105, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 35
        { talk = 11105, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 35
          note = "You will tame a short-term pet shortly. Here your pet picks up Claw (Rank 5)." },
        { accept = 6143 }, -- level 35
        { accept = 6142, classes = { "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }, -- level 35
          note = "The NPC is indoors." },
        { go = { 1443, 21.54, 74.17 }, fly = true, talk = 6726, text = "Fly to Shadowprey Village" }, -- level 35
        { go = { 1443, 33.46, 77.24 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 35
          note = "Tame a Scorpashi Lasher with Tame Beast." },
        { go = { 1443, 26.31, 74.88 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Take the trail toward Shadowprey Village" }, -- level 35
        { talk = 11105, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 35
        { talk = 11105, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 35
          note = "Release the short-term pet you tamed." },
        { turnin = 5501, sticky = 1435, -- level 35
          note = "This one roams, so scan the surrounding area." },
        { complete = 5741, -- level 35
          note = "The NPC waits on the tower's highest floor." },
        { complete = 5381, object = 176581, -- level 35
          note = "Defeat every foe in this chamber before starting. The NPC is indoors." },
        { complete = 1435, useitem = 6436, -- level 35
          note = "Target Burning Blade foes with the item. Wait for the foe to be badly hurt, then apply it." },
        { turnin = 5741, accept = 6027, -- level 35
          note = "Look for it high on the clifftop." },
        { accept = 6161, object = 177787, -- level 35
          note = "The quest starts from a little book." },
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE" } }, -- level 35
        { complete = 6161, sticky = { 6161, 6143 }, -- level 35
          note = "The targets are lobsters. Your targets sit below the water's surface." },
        { collect = { { 15874, 1 } }, object = 177784, useitem = 15874, sticky = { 1482, 6143 }, -- level 35
          note = "Look for big white clams. Your targets sit below the water's surface. Hunt the crabs." },
        { complete = 6142, classes = { "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } }, -- level 35
        { useitem = 5996, when = { item = 5996 }, classes = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE" } }, -- level 35
        { complete = 6161, -- level 35
          note = "Hunt naga. The targets are on islands and beneath the surface." },
        { turnin = 6161, object = 177786 }, -- level 35
        { level = 36, patrol = { { 1443, 28.35, 12.24 }, { 1443, 30.44, 9.54 }, { 1443, 27.36, 9.05 }, { 1443, 29.97, 6.37 }, { 1443, 33.69, 10.39 }, { 1443, 29.15, 15.44 } } }, -- level 35
        { complete = 6027 }, -- level 36
        { complete = 1482, -- level 36
          note = "Other naga compete for the same spawn points. The targets are on islands and beneath the surface." },
        { complete = 6143, sticky = 6143, -- level 36
          note = "Other naga compete for the same spawn points." },
        { complete = 6143, -- level 36
          note = "Other naga compete for the same spawn points." },
        { complete = 6143, -- level 36
          note = "Other naga compete for the same spawn points." },
        { go = { 1443, 40.69, 28.9 }, text = "Climb the trail" }, -- level 36
        { turnin = 6027, -- level 36
          note = "Look for it high on the clifftop." },
        { go = { 1443, 55.93, 53.45 }, text = "Climb the trail" }, -- level 36
        { turnin = { 1435, 1482 } }, -- level 36
        { accept = 1484, -- level 36
          note = "Wait for the talking to finish" },
        { turnin = 1484, accept = 1436 }, -- level 36
        { complete = 1370, -- level 36
          note = "Look for tan sacks by the houses. Some of them are not usable. Magram Pack Runners patrol with 2 hyena escorts; steer clear." },
        { turnin = 1370, accept = 1373 }, -- level 36
        { go = { 1443, 26.31, 74.88 }, text = "Take the trail toward Shadowprey Village" }, -- level 36
        { accept = 5763 }, -- level 36
        { turnin = 5381 }, -- level 36
        { turnin = 6143 }, -- level 36
        { turnin = 6142, classes = { "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }, -- level 36
          note = "The NPC is indoors." },
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 36
        { train = true, talk = 5883, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 36
          note = "The NPC is indoors." },
        { train = true, talk = 6018, races = { "Scourge", "Troll" }, classes = { "PRIEST" }, -- level 36
          note = "The NPC is indoors." },
        { train = true, talk = 3328, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 36
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3325, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 36
          note = "This NPC is found down in the Cleft of Shadow." },
        { vendor = true, talk = 5815, races = { "Orc", "Scourge" }, classes = { "WARLOCK" }, -- level 36
          note = "This NPC is found down in the Cleft of Shadow." },
        { train = true, talk = 3344, races = { "Orc", "Tauren", "Troll" }, classes = { "SHAMAN" }, -- level 36
          note = "The NPC is indoors." },
        { turnin = 1436, -- level 36
          note = "This one roams, so scan the surrounding area. The NPC is indoors." },
        { train = true, talk = 3352, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 36
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 10088, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 36
          note = "The NPC stands on the highest level of this structure." },
        { train = true, talk = 3353, classes = { "WARRIOR" }, -- level 36
          note = "The NPC is indoors." },
        { talk = 3309, collect = { { 14542, 1 } }, spots = { { 1454, 49.62, 69.06 } }, -- level 36
          note = "The NPC is indoors." },
    },
})
