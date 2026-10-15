-- Lower Blackrock Spire, Horde, "Ding! - Dungeon quests": Kargath's quests in the Badlands
-- (Galamav, Lexlort's Operative Bijou, Warlord Goretooth's command), Flame Crest in the Burning
-- Steppes, Yeh'kinya's lost tablets in Tanaris (once The God Hakkar is turned in), the spire, then
-- the turn-ins; the Seal of Ascension optional. The Upper Spire's quests are left out (a raid of
-- ten), with Onyxia's and Blackwing Lair's attunements, the level 60 armor-set chains and the
-- professions' quests. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains
-- checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/17_BlackrockSpire.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-spire",
    pack     = "ding-dungeons",
    title    = "Blackrock Spire (55-60)",
    faction  = "Horde",
    minLevel = 55, maxLevel = 60,
    steps    = {
        -- Tanaris: the lost tablets of Mosh'aru (once The God Hakkar is turned in).
        { accept = 5065, when = { done = 3528 },
          why = { text = "Yeh'kinya's chain from Zul'Farrak and the sunken temple goes on: two tablets in the Eastern Plaguelands, two inside the spire, then a cloak.", short = true },
          note = "Prospector Ironboot, at Steamwheedle Port, in Tanaris." },
        { complete = 5065, when = { log = 5065 },
          note = "The third and fourth tablets lie in the troll ruins of the north of the Eastern Plaguelands." },
        { turnin = 5065, when = { log = 5065 },
          note = "Prospector Ironboot, at Steamwheedle Port." },
        { accept = 4788, when = { done = 5065 } },

        -- Kargath.
        { accept = 4724,
          why = { text = "Reward: a cloth robe, a leather jerkin or a mail breastplate.", short = true },
          note = "Galamav the Marksman, at Kargath, in the west of the Badlands." },
        { accept = 4981,
          why = { text = "Lexlort's chain: Bijou's report brings cloth gloves or a mail belt.", short = true },
          note = "Lexlort, at Kargath." },
        { accept = 4903,
          why = { text = "Reward: armor of any kind, for the spire's three generals and their documents.", short = true },
          note = "Warlord Goretooth, at Kargath." },

        -- The Burning Steppes.
        { accept = { 4729, 4862 },
          why = { text = "Kibler's two quests: a worg pup or a smolderweb spider, pets that follow you.", short = true },
          note = "Kibler, at Flame Crest, in the north of the Burning Steppes." },
        { accept = 4866,
          why = { text = "Reward: Ragged John's neverending cup, and about 9,950 XP.", short = true },
          note = "Ragged John, at Flame Crest." },

        -- The spire.
        { go = { 1427, 34.80, 85.30 }, radius = 30, text = "Enter Blackrock Spire",
          note = "Blackrock Mountain opens in the south of the Searing Gorge; inside, the spire's door is at the top of the mountain." },
        { accept = 4867,
          why = { text = "Reward: a charm, after a fight with Urok Doomhowl.", short = true },
          note = "Warosh, a troll who walks near the spire's entrance." },
        { accept = 4742, optional = true,
          why = { text = "Optional: the Seal of Ascension, the key to the Upper Spire, a raid of ten; its last part is in Dustwallow Marsh.", short = true },
          note = "Vaelan, a Scarshield infiltrator, stands up the ramp near the spire's entrance." },
        { turnin = 4981, accept = 4982,
          note = "Bijou hides down in the trench after Hordemar City's second bridge." },
        { complete = 4982,
          note = "Her belongings lie in a chest on the bottom tier of Hordemar City; it can also stand as far as the Skitterweb Tunnels." },
        { turnin = 4982, accept = 4983,
          note = "Back to Bijou." },
        { complete = 4788, when = { log = 4788 },
          note = "The fifth tablet hangs on a wall of Shadow Hunter Vosh'gajin's room, the sixth on a wall of War Master Voone's room." },
        { complete = 4867,
          note = "Take the Roughshod Pike from a weapon rack on the left wall after Hordemar City's second bridge, join it to Highlord Omokk's head, and use it on the skull pile up the ramp past Mother Smolderweb: ogres come, then Urok Doomhowl." },
        { complete = 4862,
          note = "The spire spider eggs lie in the upper Skitterweb Tunnels." },
        { complete = 4729,
          note = "Use the empty cage on a Bloodaxe worg pup, in Halycon's room." },
        { complete = 4724,
          note = "Halycon, the worgs' mother, holds Halycon's Lair." },
        { complete = 4742, optional = true,
          note = "The Scarshield dwarves drop the unadorned seal; Highlord Omokk, north of Mok'Doom, may drop the Spirestone gem, War Master Voone, at the bottom of Tazz'Alaor, the Smolderthorn gem, and Overlord Wyrmthalak, the last boss, the Bloodaxe gem." },
        { turnin = 4742, accept = 4743, optional = true,
          note = "Vaelan, near the entrance." },
        { turnin = 4867,
          note = "Warosh, near the entrance." },
        { complete = 4866,
          note = "Let Mother Smolderweb poison you and do not cure it: the poison must last until Ragged John, at Flame Crest." },
        { complete = 4903,
          note = "Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle. The documents lie in one of their rooms, or by Urok's tribute pile." },

        -- Turn-ins.
        { turnin = { 4729, 4862, 4866 },
          note = "Kibler and Ragged John, at Flame Crest." },
        { turnin = { 4724, 4983, 4903 },
          note = "Galamav the Marksman, Lexlort and Warlord Goretooth, at Kargath." },
        { complete = 4743, optional = true,
          note = "Beat Emberstrife, a dragon of the Wyrmbog in Dustwallow Marsh, until his will breaks, then place the seal before him." },
        { turnin = 4743, optional = true,
          note = "Vaelan, near the spire's entrance." },
        { turnin = 4788, when = { log = 4788 },
          note = "Prospector Ironboot, at Steamwheedle Port, in Tanaris." },
        { accept = 8181, when = { done = 4788 } },
        { turnin = 8181, when = { log = 8181 },
          note = "Yeh'kinya, beside him." },
    },
})
