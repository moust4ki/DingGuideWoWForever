-- Wailing Caverns, Alliance, "Ding! - Dungeon quests": Ratchet's two goblins, the hidden cave
-- above the entrance, the caverns, then the turn-ins; the Glowing Shard's chain only when Mutanus
-- dropped it. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains
-- checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/02_WailingCaverns.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-wailing",
    pack     = "ding-dungeons",
    title    = "Wailing Caverns (17-24)",
    faction  = "Alliance",
    minLevel = 17, maxLevel = 24,
    steps    = {
        -- Ratchet.
        { accept = 865,
          why = { text = "Raptor Horns opens Smart Drinks, a quest of the caverns.", short = true },
          note = "Mebok Mizzyrix, in Ratchet." },
        { accept = 959,
          note = "Crane Operator Bigglefuzz, on the docks of Ratchet." },
        { complete = 865,
          note = "The sunscale raptors roam the plains between the Crossroads and Ratchet." },
        { turnin = 865, accept = 1491,
          note = "Mebok Mizzyrix, in Ratchet." },

        -- The hidden cave above the entrance.
        { accept = { 1486, 1487 },
          why = { text = "Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand.", short = true },
          note = "Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge." },
        { complete = 959,
          note = "Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door." },

        -- The caverns.
        { go = { 1413, 46.00, 36.50 }, radius = 30, text = "Enter Wailing Caverns",
          note = "The mouth of the caverns opens on the hill above the Lushwater Oasis." },
        { complete = 1486,
          note = "Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on." },
        { complete = 1491,
          note = "The ectoplasms, living oozes of the caverns, drop the essence." },
        { complete = 1487,
          note = "Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in." },
        { accept = 6981, use = 10441, when = { item = 10441 },
          note = "Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead." },

        -- Turn-ins: the cave above the entrance, Ratchet, Darnassus.
        { turnin = { 1486, 1487 },
          note = "Nalpak and Ebru, in their cave on the caverns' hill." },
        { turnin = { 1491, 959 },
          note = "Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet." },
        { complete = 6981, talk = 3442, when = { log = 6981 },
          note = "Sputtervalve, in Ratchet, knows what the shard is." },
        { turnin = 6981, when = { log = 6981 },
          note = "Falla Sagewind, on top of the caverns' hill." },
        { accept = 3370, when = { done = 6981 } },
        { turnin = 3370, when = { log = 3370 },
          note = "Mathrengyl Bearwalker, in the Cenarion Enclave of Darnassus." },
    },
})
