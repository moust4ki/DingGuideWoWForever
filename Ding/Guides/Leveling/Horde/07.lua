-- Drafted by tools/write_leveling.lua from tools/routes/leveling/horde.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Horde/07.lua.
-- Simulated (warrior): Orc 22 (54%) -> 24 (96%) in 5 h 20, 19 quests turned in; Scourge 22 (54%) -> 24 (96%) in 5 h 20, 19 quests turned in; Tauren 22 (48%) -> 24 (91%) in 5 h 20, 19 quests turned in; Troll 22 (54%) -> 24 (96%) in 5 h 20, 19 quests turned in; Skyborne 22 (55%) -> 24 (97%) in 5 h 20, 19 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-h07-hillsbrad-foothills",
    title    = "Hillsbrad Foothills (22-24)",
    faction  = "Horde",
    minLevel = 22, maxLevel = 24,
    next     = "leveling-h08-the-barrens",
    steps    = {
        { go = { 1421, 44.19, 42.67 }, text = "Travel to the Undercity", -- level 22
          note = "Undercity first, then Hillsbrad Foothills: Tarren Mill." },
        { talk = 2492, races = { "Scourge", "Troll" }, classes = { "MAGE" }, -- level 22
          note = "The NPC is atop the raised platform." },
        { turnin = 5644, races = { "Scourge" }, classes = { "PRIEST" } }, -- level 22
        { collect = { { 15882, 1 } }, spots = { { 1421, 29.58, 29.44 } }, races = { "Tauren" }, classes = { "DRUID" }, -- level 22
          note = "Your targets sit below the water's surface." },
        { go = { 1456, 29.77, 29.79 }, text = "Head out of the cave" }, -- level 22
        { turnin = 264 }, -- level 22
        { turnin = 3301 }, -- level 22
        { accept = 493 }, -- level 22
        { complete = 98298 }, -- level 22
        { turnin = 98298 }, -- level 22
        { accept = 95981 }, -- level 22
        { complete = 95981 }, -- level 22
        { turnin = 95981 }, -- level 22
        { accept = 98299 }, -- level 22
        { complete = 98299 }, -- level 22
        { turnin = 98299 }, -- level 22
        { accept = 95883 }, -- level 22
        { complete = 95883 }, -- level 22
        { turnin = 95883 }, -- level 22
        { accept = 95885 }, -- level 22
        { complete = 95885 }, -- level 22
        { turnin = 95885 }, -- level 22
        { accept = 494 }, -- level 22
        { go = { 1424, 60.18, 18.57 }, fly = true, talk = 2389, text = "Flight master at Tarren Mill" }, -- level 22
        { turnin = { 493, 1065 }, accept = { 1066, 496, 501 }, -- level 22
          note = "The NPC is indoors." },
        { turnin = 2479, when = { log = 2479 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "The NPC is indoors." },
        { accept = 2480, when = { done = 2479 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" } }, -- level 22
        { complete = 2480, when = { log = 2480 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "Let the conversation play out. The NPC is indoors." },
        { turnin = 2480, when = { ready = 2480 }, races = { "Orc", "Scourge", "Troll", "Skyborne" }, classes = { "ROGUE" }, -- level 22
          note = "The NPC is indoors." },
        { useitem = 8095, races = { "Orc", "Scourge", "Troll" }, classes = { "ROGUE" }, -- level 22
          note = "Get rid of your Touch of Zanzil." },
        { turnin = 494, accept = 527, -- level 22
          note = "This one roams, so scan the surrounding area." },
        { talk = 10057, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Leave your pet with the stable master." }, -- level 22
        { talk = 10057, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 22
          note = "You will tame a short-term pet shortly. Pick up Claw (Rank 3) for your pet." },
        { accept = 567, -- level 22
          note = "The quest comes from a bounty sign." },
        { accept = 549, -- level 22
          note = "The quest comes from a bounty sign." },
        { accept = 498, -- level 22
          note = "The NPC is indoors." },
        { complete = 1536, useitem = 7768, when = { log = 1536 }, races = { "Orc", "Tauren", "Troll", "Skyborne" }, classes = { "SHAMAN" } }, -- level 22
        { go = { 1424, 66.45, 18.96 }, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Tame a beast here to learn the next rank of Claw", -- level 22
          note = "Pick any Gray Bear and use Tame Beast on it." },
        { talk = 10057, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, text = "Get your companion back from the stable master." }, -- level 22
        { talk = 10057, races = { "Orc", "Tauren", "Troll" }, classes = { "HUNTER" }, -- level 22
          note = "Release the short-term pet you tamed." },
        { go = { 1424, 76.6, 46.45 }, text = "Go into Durnholde Keep, then over the bridge" }, -- level 22
        { collect = { { 3499, 1 } }, spots = { { 1424, 78.77, 42.06 }, { 1424, 77.66, 39.14 }, { 1424, 77.75, 40.37 }, { 1424, 79.16, 40.64 } }, -- level 22
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 498, -- level 22
          note = "Look for it bound to the orc's leg." },
        { collect = { { 3467, 1 } }, spots = { { 1424, 79.63, 41.79 }, { 1424, 75.35, 41.96 } }, -- level 22
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots." },
        { complete = 498, -- level 22
          note = "Look for it bound to the orc's leg. The NPC is indoors." },
        { complete = 1066 }, -- level 22
        { complete = 549 }, -- level 23
        { complete = 496, -- level 23
          note = "The targets are spiders with green bodies." },
        { complete = 496 }, -- level 23
        { level = 22, xp = 19570, patrol = { { 1424, 62.86, 34.25 }, { 1424, 60.34, 37.44 }, { 1424, 62.56, 39.63 }, { 1424, 69.23, 41.36 }, { 1424, 70.85, 38.35 }, { 1424, 70.43, 35.37 }, { 1424, 72.34, 44.26 }, { 1424, 68.65, 45.85 }, { 1424, 58.54, 33.34 }, { 1424, 61.24, 30.26 }, { 1424, 58.74, 26.03 }, { 1424, 57.24, 23.45 }, { 1424, 56.45, 28.86 }, { 1424, 66.36, 26.46 }, { 1424, 65.43, 22.46 }, { 1424, 67.55, 16.14 }, { 1424, 61.95, 15.57 }, { 1424, 57.96, 14.63 }, { 1424, 55.15, 17.03 }, { 1424, 55.85, 10.05 } }, -- level 23
          note = "Together with the next turn-ins, this brings you to level 23." },
        { turnin = { 1066, 496 }, accept = { 499, 1067 }, -- level 23
          note = "The NPC is indoors." },
        { turnin = 499, -- level 23
          note = "The NPC is indoors." },
        { turnin = 549, -- level 23
          note = "This one roams, so scan the surrounding area." },
        { turnin = 498, sticky = { 527, 501 }, -- level 23
          note = "The NPC is indoors." },
        { complete = 527, -- level 23
          note = "The targets are spread over several spots. Indoors or out in the open fields." },
        { complete = 527, -- level 24
          note = "Check each of the two floors indoors. It may be found outdoors too." },
        { complete = 527 }, -- level 24
        { complete = 501 }, -- level 24
        { turnin = 501, accept = 502, -- level 24
          note = "The NPC is indoors." },
        { turnin = 527, accept = 528, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { accept = 546, sticky = { 567, 528, 546 } }, -- level 24
        { turnin = 502, -- level 24
          note = "The NPC is a little wolf. This one roams, so scan the surrounding area. He goes berserk and attacks you once the quest is handed in." },
        { complete = 567, -- level 24
          note = "A woman holding a pitchfork. This one roams, so scan the surrounding area." },
        { complete = 567, patrol = { { 1424, 33, 39.61 }, { 1424, 34.2, 38.69 }, { 1424, 35.42, 38.78 }, { 1424, 36.47, 39.39 }, { 1424, 35.72, 38.78 }, { 1424, 34.02, 38.79 }, { 1424, 32.49, 40.05 }, { 1424, 32.64, 38.2 }, { 1424, 32.72, 36.93 }, { 1424, 32.56, 36 }, { 1424, 32.88, 35.23 }, { 1424, 32.63, 35.86 }, { 1424, 32.66, 37.01 }, { 1424, 32.61, 38.24 }, { 1424, 32.58, 39.46 }, { 1424, 32.68, 41.13 }, { 1424, 32.42, 42.49 }, { 1424, 31.34, 42.18 }, { 1424, 31.01, 41.77 }, { 1424, 30.49, 40.58 }, { 1424, 30.79, 41.67 }, { 1424, 31.26, 42.15 }, { 1424, 31.78, 42.2 }, { 1424, 32.48, 42.92 }, { 1424, 32.46, 44.74 }, { 1424, 32.34, 45.18 }, { 1424, 32.49, 44.14 }, { 1424, 32.59, 42.18 }, { 1424, 32.55, 41.2 } }, -- level 24
          note = "The target patrols the trail between the houses. The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills." },
        { complete = 528 }, -- level 24
        { level = 23, xp = 27400, patrol = { { 1424, 41.83, 37.57 }, { 1424, 42.34, 40.77 }, { 1424, 45.24, 39.45 }, { 1424, 46.37, 42.54 }, { 1424, 48.66, 40.25 }, { 1424, 51.06, 42.64 }, { 1424, 54.45, 42.14 }, { 1424, 57.36, 41.46 }, { 1424, 55.45, 36.94 }, { 1424, 52.06, 38.97 }, { 1424, 51.45, 35.65 }, { 1424, 48.46, 34.23 }, { 1424, 48.35, 31.17 }, { 1424, 53.23, 32.66 }, { 1424, 54.77, 29.65 }, { 1424, 44.65, 35.45 }, { 1424, 40.55, 34.44 }, { 1424, 38.05, 35.97 }, { 1424, 38.34, 39.25 }, { 1424, 39.77, 42.56 }, { 1424, 37.24, 44.24 }, { 1424, 39.24, 47.06 }, { 1424, 48.36, 45.65 }, { 1424, 52.15, 46.36 } }, -- level 24
          note = "With the coming hand-ins, this brings you to level 24. Tougher foes are coming up next." },
        { turnin = 528, accept = 529, sticky = { 529, 546 }, -- level 24
          note = "This one roams, so scan the surrounding area." },
        { complete = 529, -- level 24
          note = "The NPC is indoors." },
        { complete = 529, -- level 24
          note = "This one roams, so scan the surrounding area. The targets are spread over several spots. Some may be in the smithy." },
        { complete = 529 }, -- level 24
        { accept = 1013, dungeon = "Shadowfang Keep" }, -- level 24
        { accept = 1014, dungeon = "Shadowfang Keep" }, -- level 24
        { go = { 1421, 43.04, 41.43 }, dungeon = "Shadowfang Keep", text = "Go down into the tomb" }, -- level 24
        { accept = 1098, dungeon = "Shadowfang Keep", -- level 24
          note = "Look within the tomb." },
        { turnin = 1098, dungeon = "Shadowfang Keep", -- level 24
          note = "The NPC is in the yard where black wolves roam. Do this once the prisoner is free." },
        { complete = 1013, dungeon = "Shadowfang Keep", -- level 24
          note = "The tome is blue, resting on a bookshelf. Look in the room where Fenrus is." },
        { complete = 1014, dungeon = "Shadowfang Keep", -- level 24
          note = "The target is the dungeon's last boss." },
        { turnin = 1014, dungeon = "Shadowfang Keep" }, -- level 24
        { turnin = 1013, dungeon = "Shadowfang Keep" }, -- level 24
        { useitem = 15883, when = { log = 30 }, races = { "Tauren", "Skyborne" }, classes = { "DRUID" } }, -- level 24
        { complete = 30, when = { log = 30 }, races = { "Tauren" }, classes = { "DRUID" } }, -- level 24
        { turnin = 30, when = { ready = 30 }, races = { "Tauren" }, classes = { "DRUID" }, -- level 24
          note = "The NPC is indoors, one floor up." },
        { accept = 31, when = { done = 30 }, races = { "Tauren" }, classes = { "DRUID" } }, -- level 24
        { train = true, talk = 12042, races = { "Tauren" }, classes = { "DRUID" } }, -- level 24
        { complete = 546 }, -- level 24
    },
})
