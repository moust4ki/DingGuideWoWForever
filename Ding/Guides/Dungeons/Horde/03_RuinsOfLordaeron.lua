-- Ruins of Lordaeron, Horde, "Ding! - Dungeon quests": a dungeon of WoW Forever in the ruins above
-- Undercity. Tabitha Heartweaver in Silverpine Forest, Deathguard Kristof in Brill, Undercity's
-- Morbin Lightbane and Theodore Griffs, the ruins, then the turn-ins; the crest and the Baron's
-- head only when they dropped. The Unending Torment chain that the head opens has no order in
-- DingDB: the guide follows its texts, every step optional. Opportunistic Education's giver is
-- unknown to DingDB: left out. DingDB does not place the ruins' monsters yet: the notes only say
-- what the quests ask. Levels from its quests. Drafted with tools/draft_dungeon.lua, finished by
-- hand; quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/03_RuinsOfLordaeron.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-lordaeron",
    pack     = "ding-dungeons",
    title    = "Ruins of Lordaeron (19-24)",
    faction  = "Horde",
    minLevel = 19, maxLevel = 24,
    steps    = {
        { accept = 92401,
          why = { text = "Reward: a dagger or cloth cuffs.", short = true },
          note = "Tabitha Heartweaver, at the Sepulcher, in Silverpine Forest." },
        { accept = 92422,
          why = { text = "Reward: a two-handed axe or a staff.", short = true },
          note = "Deathguard Kristof, in Brill, in Tirisfal Glades." },
        { accept = 92421,
          why = { text = "Reward: leather armor or a mace.", short = true },
          note = "Morbin Lightbane, in Undercity." },
        { accept = 95216,
          why = { text = "Reward: cloth gloves or a sword.", short = true },
          note = "Theodore Griffs, in Undercity." },

        { go = { 1458, 72.48, 11.33 }, radius = 30, text = "Enter the Ruins of Lordaeron",
          note = "The ruins rise above Undercity, in Tirisfal Glades." },
        { complete = 92401,
          note = "Look for Edward Heartweaver in the ruins." },
        { complete = 92421,
          note = "Twenty-five intact limbs, from the undead of the ruins." },
        { complete = 92422,
          note = "Rath'mael waits in the ruins." },
        { complete = 95216,
          note = "Witherfang carries the highly toxic strain." },
        { accept = 95204, use = 275521, when = { item = 275521 },
          why = { text = "Reward: a small sack of gems.", short = true },
          note = "The Crest of Lordaeron lies in the ruins: take it, then read it." },
        { accept = 97288, use = 280438, when = { item = 280438 },
          note = "The Baron may drop an abominable head: read it." },

        { turnin = 92421,
          note = "Morbin Lightbane, in Undercity." },
        { turnin = 95216,
          note = "Theodore Griffs, in Undercity." },
        { turnin = 95204, when = { log = 95204 },
          note = "Oran Snakewrithe, in Undercity." },
        { turnin = 97288, when = { log = 97288 },
          note = "Master Apothecary Faranell, in the Apothecarium of Undercity." },
        { accept = 97291, optional = true, when = { done = 97288 },
          why = { text = "Optional: Faranell's Unending Torment goes on in Undercity; its last part has a two-handed sword among its rewards.", short = true } },
        { complete = 97291, optional = true, when = { done = 97288 },
          note = "A toxic skullcap from Tawny Grisette in the Trade Quarter, blisterweed near the herbalism trainer, and an essence of agony from the poison vendor of the Rogues' Quarter." },
        { turnin = 97291, optional = true, when = { done = 97288 } },
        { accept = 97292, optional = true, when = { done = 97288 } },
        { complete = 97292, optional = true, when = { done = 97288 },
          note = "Inject the hissing serum into the system above Othmar's body." },
        { turnin = 97292, optional = true, when = { done = 97288 } },
        { accept = 97289, optional = true, when = { done = 97288 } },
        { turnin = 97289, optional = true, when = { done = 97288 },
          note = "Bring the Baron's head to Othmar's body, the unfinished abomination." },
        { accept = 97290, optional = true, when = { done = 97288 } },
        { turnin = 97290, optional = true, when = { done = 97288 },
          note = "Master Apothecary Faranell." },
        { turnin = 92422,
          note = "Deathguard Kristof, in Brill." },
        { turnin = 92401,
          note = "Tabitha Heartweaver, at the Sepulcher." },
    },
})
