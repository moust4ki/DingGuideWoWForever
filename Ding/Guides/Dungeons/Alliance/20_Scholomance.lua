-- Scholomance, Alliance, "Ding! - Dungeon quests": the Skeleton Key chain from Chillwind Camp
-- through Andorhal, Gadgetzan and Un'Goro (optional: one key per group opens the door), Weldon
-- Barov's fortune, Betina Bigglezink's hatchlings at Light's Hope, Eva Sarkhoff's chain in Caer
-- Darrow (short trips out of the school between its parts), then Ras Frostwhisper's chain through
-- Stromgarde, Light's Hope and Stratholme (optional). Left out: Dawn's Gambit (its chain needs the
-- Upper Spire's eggs, a raid), the class quests (with Ding! - Class quests), the level 60
-- armor-set chains and the repeatable ones. Drafted with tools/draft_dungeon.lua, finished by hand;
-- quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/20_Scholomance.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-scholomance",
    pack     = "ding-dungeons",
    title    = "Scholomance (58-60)",
    faction  = "Alliance",
    minLevel = 58, maxLevel = 60,
    steps    = {
        -- The Skeleton Key (optional).
        { accept = 5092, optional = true,
          why = { text = "Optional: the chain of the Skeleton Key, which opens Scholomance's door: one key per group is enough. It goes through the Plaguelands, Gadgetzan and Un'Goro.", short = true },
          note = "Commander Ashlam Valorfist, at Chillwind Camp, in the Western Plaguelands." },
        { complete = 5092, optional = true,
          note = "The skeletal flayers and slavering ghouls of Sorrow Hill, in the south of the Western Plaguelands." },
        { turnin = 5092, accept = 5097, optional = true },
        { complete = 5097, optional = true,
          note = "Mark the four watchtowers of Andorhal with the beacon torch, standing in each doorway." },
        { turnin = 5097, accept = 5533, optional = true },
        { turnin = 5533, accept = 5537, optional = true,
          note = "Alchemist Arbington, at Chillwind Camp." },
        { complete = 5537, optional = true,
          note = "The undead of the Western Plaguelands drop the skeletal fragments." },
        { turnin = 5537, accept = 5538, optional = true },
        { turnin = 5538, accept = 5801, optional = true,
          note = "Krinkle Goodsteel, in Gadgetzan, in Tanaris: bring 15 gold." },
        { complete = 5801, optional = true,
          note = "Bring two thorium bars to the top of Fire Plume Ridge, in Un'Goro Crater, and use the mold by the lava lake." },
        { turnin = 5801, accept = 5803, optional = true,
          note = "Alchemist Arbington, at Chillwind Camp." },
        { complete = 5803, optional = true,
          note = "Araj the Summoner stands in the middle of Andorhal." },
        { turnin = 5803, accept = 5505, optional = true },
        { turnin = 5505, optional = true },

        -- Light's Hope, the Plaguelands' camps, Caer Darrow.
        { accept = 5529,
          why = { text = "About 6,200 XP; a hatchling may drop a scale that starts another quest.", short = true },
          note = "Betina Bigglezink, at Light's Hope Chapel, in the Eastern Plaguelands." },
        { accept = 5343,
          why = { text = "The Barov fortune: four deeds inside the school; its follow-up sends you to kill Alexi Barov in the Horde's Bulwark.", short = true },
          note = "Weldon Barov, at Chillwind Camp." },
        { accept = 5382,
          why = { text = "Eva Sarkhoff's chain: three parts inside the school, then Kirtonos the Herald and a sword or an off-hand item among its rewards.", short = true },
          note = "Eva Sarkhoff, in Caer Darrow, on the island of Darrowmere Lake." },

        -- The school.
        { go = { 1422, 69.70, 73.20 }, radius = 30, text = "Enter Scholomance",
          note = "The school stands on the island of Caer Darrow, in Darrowmere Lake, in the south-east of the Western Plaguelands." },
        { complete = 5343,
          note = "The deeds: Southshore's on a table north-east of the Reliquary; Tarren Mill's on a table on the left at the entry of the Great Ossuary; Brill's on a ledge south-west of the Laboratory; Caer Darrow's on a table east of the Barov Family Vault." },
        { complete = 5529,
          note = "The plagued hatchlings fill a room of the Great Ossuary." },
        { accept = 5582, use = 13920, when = { item = 13920 },
          note = "A hatchling may drop a healthy dragon scale: use it." },
        { complete = 5382,
          note = "Doctor Theolen Krastinov, in the east of the upper Headmaster's Study: kill him, then burn the two piles of remains, to the north and the south-east of his room." },

        -- Caer Darrow and back, twice.
        { turnin = 5382, accept = 5515,
          note = "Eva Sarkhoff, in Caer Darrow." },
        { go = { 1422, 69.70, 73.20 }, radius = 30, text = "Enter Scholomance again", },
        { complete = 5515,
          note = "Jandice Barov waits in the north-east of the room down the stairs, on the right of the second big room." },
        { turnin = 5515, accept = 5384,
          note = "Eva Sarkhoff, in Caer Darrow." },
        { go = { 1422, 69.70, 73.20 }, radius = 30, text = "Enter Scholomance again", },
        { complete = 5384,
          note = "Rattlegore, at the bottom of the Great Ossuary, drops the Viewing Room key; put the Blood of Innocents in the brazier on the balcony on the right of the Chamber of Summoning: Kirtonos the Herald comes." },
        { turnin = 5384,
          note = "Eva Sarkhoff, in Caer Darrow." },

        -- Turn-ins: the Plaguelands.
        { turnin = 5529,
          note = "Betina Bigglezink, at Light's Hope Chapel." },
        { turnin = 5582, when = { log = 5582 } },
        { turnin = 5343,
          note = "Weldon Barov, at Chillwind Camp." },
        { accept = 5344, optional = true,
          why = { text = "Optional: an assassination in the other side's camp, among its guards; it brings the Barov Peasant Caller.", short = true } },
        { complete = 5344, optional = true,
          note = "Alexi Barov stands among the guards of the Bulwark, the Horde's camp in the north of the Western Plaguelands." },
        { turnin = 5344, optional = true },

        -- Ras Frostwhisper (optional).
        { accept = 5461, optional = true,
          why = { text = "Optional: a chain through Stromgarde, Light's Hope and the Baron's room of Stratholme, back to the school's last boss; it brings a sword, a dagger, a cloth crown or a shield and about 9,950 XP.", short = true },
          note = "Magistrate Marduke, in Caer Darrow." },
        { complete = 5461, optional = true,
          note = "The Keepsake of Remembrance lies in the ruins of Stromgarde, in Arathi Highlands." },
        { turnin = 5461, accept = 5462, optional = true,
          note = "Magistrate Marduke, in Caer Darrow." },
        { turnin = 5462, accept = 5463, optional = true,
          note = "Leonid Barthalomew the Revered, at Light's Hope Chapel." },
        { turnin = 5463, accept = 5464, optional = true,
          note = "Stratholme: place the keepsake on the unholy ground of Baron Rivendare's room." },
        { turnin = 5464, accept = 5465, optional = true,
          note = "Leonid Barthalomew the Revered, at Light's Hope Chapel." },
        { turnin = 5465, accept = 5466, optional = true,
          note = "Magistrate Marduke, in Caer Darrow." },
        { go = { 1422, 69.70, 73.20 }, radius = 30, text = "Enter Scholomance again", optional = true },
        { complete = 5466, optional = true,
          note = "Ras Frostwhisper waits in the Laboratory: use the Soulbound Keepsake on him." },
        { turnin = 5466, optional = true,
          note = "Magistrate Marduke, in Caer Darrow." },
    },
})
