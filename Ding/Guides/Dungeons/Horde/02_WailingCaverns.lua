-- Wailing Caverns, Horde, "Ding! - Dungeon quests": Tonga Runetotem's oases at the Crossroads
-- (they open Leaders of the Fang), Ratchet's two goblins, Thunder Bluff's druids and apothecary,
-- the hidden cave above the entrance, the caverns, then the turn-ins; the Glowing Shard's chain
-- only when Mutanus dropped it. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids
-- and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/02_WailingCaverns.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-wailing",
    pack     = "ding-dungeons",
    title    = "Wailing Caverns (17-24)",
    faction  = "Horde",
    minLevel = 17, maxLevel = 24,
    steps    = {
        -- The Crossroads: Tonga's oases.
        { accept = 870,
          why = { text = "Tonga's three oases open Leaders of the Fang, the caverns' main quest: a weapon of your choice.", short = true },
          note = "Tonga Runetotem, at the Crossroads." },
        { complete = 870,
          note = "The Forgotten Pools lie north-west of the Crossroads, north of the caverns' hill." },
        { turnin = 870, accept = 877 },
        { complete = 877,
          note = "The Stagnant Oasis lies south-east of the Crossroads: use the bubbling fissure in its water." },
        { turnin = 877, accept = 880 },
        { complete = 880,
          note = "The snapjaw turtles of the Lushwater Oasis, at the foot of the caverns' hill." },
        { turnin = 880, accept = 1489 },

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

        -- Thunder Bluff.
        { accept = 962,
          why = { text = "Reward: a piece of cloth, leather or mail armor.", short = true },
          note = "Apothecary Zamah, in the Pools of Vision under the Spirit Rise." },
        { turnin = 1489, accept = 1490,
          note = "Arch Druid Hamuul Runetotem, on the Elder Rise." },
        { turnin = 1490, accept = 914,
          note = "Nara Wildmane, on the Elder Rise." },

        -- The hidden cave above the entrance.
        { accept = { 1486, 1487 },
          why = { text = "Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand.", short = true },
          note = "Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge." },
        { complete = 959,
          note = "Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door." },
        { complete = 962,
          note = "Serpentbloom: small green shrubs with violet flowers, in the caves before the door and inside." },

        -- The caverns.
        { go = { 1413, 46.00, 36.50 }, radius = 30, text = "Enter Wailing Caverns",
          note = "The mouth of the caverns opens on the hill above the Lushwater Oasis." },
        { complete = 1486,
          note = "Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on." },
        { complete = 1491,
          note = "The ectoplasms, living oozes of the caverns, drop the essence." },
        { complete = 914,
          note = "The four Fanglords each drop a gem: Lady Anacondra and Lord Cobrahn first, then Lord Pythas, and Lord Serpentis last." },
        { complete = 1487,
          note = "Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in." },
        { accept = 6981, use = 10441, when = { item = 10441 },
          note = "Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead." },

        -- Turn-ins: the cave above the entrance, Ratchet, Thunder Bluff.
        { turnin = { 1486, 1487 },
          note = "Nalpak and Ebru, in their cave on the caverns' hill." },
        { turnin = { 1491, 959 },
          note = "Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet." },
        { complete = 6981, talk = 3442, when = { log = 6981 },
          note = "Sputtervalve, in Ratchet, knows what the shard is." },
        { turnin = 6981, when = { log = 6981 },
          note = "Falla Sagewind, on top of the caverns' hill." },
        { accept = 3369, when = { done = 6981 } },
        { turnin = 914,
          why = { text = "Your reward: a staff, a mace or a sword.", short = true },
          note = "Nara Wildmane, on the Elder Rise of Thunder Bluff." },
        { turnin = 962,
          note = "Apothecary Zamah, in the Pools of Vision." },
        { turnin = 3369, when = { log = 3369 },
          note = "Arch Druid Hamuul Runetotem, on the Elder Rise." },
    },
})
