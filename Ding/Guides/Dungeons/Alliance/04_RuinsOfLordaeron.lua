-- Ruins of Lordaeron, Alliance, "Ding! - Dungeon quests": a dungeon of WoW Forever in the ruins
-- above Undercity. Its Alliance quests start from what it drops (a crest, insignias, Edward
-- Heartweaver's letter), all turned in in Stormwind. Abominable Creatures is left out: DingDB does not
-- know who gives it or takes it back. DingDB does not place the ruins' monsters yet: the notes only
-- say what the quests ask. Levels from its quests. Drafted with tools/draft_dungeon.lua, finished by
-- hand; quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/04_RuinsOfLordaeron.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-lordaeron",
    pack     = "ding-dungeons",
    title    = "Ruins of Lordaeron (19-24)",
    faction  = "Alliance",
    minLevel = 19, maxLevel = 24,
    steps    = {
        { go = { 1458, 72.48, 11.33 }, radius = 30, text = "Enter the Ruins of Lordaeron",
          note = "The ruins rise above Undercity, in Tirisfal Glades: Horde land, keep your guard up." },
        { accept = 95195, use = 268535, when = { item = 268535 },
          why = { text = "Reward: leather leggings or mail armor.", short = true },
          note = "The undead of the ruins may drop a bloodied insignia: read it." },
        { complete = 95195, when = { log = 95195 },
          note = "Ten insignias, from the undead of the ruins." },
        { accept = 95189, use = 268579, when = { item = 268579 },
          why = { text = "Reward: a small sack of gems.", short = true },
          note = "The Crest of Lordaeron lies in the ruins: take it, then read it." },
        { accept = 92415, use = { 251270, 251520 }, optional = true,
          note = "Edward Heartweaver's last letter lies in the ruins: read it." },

        { turnin = 95195, when = { log = 95195 },
          note = "General Marcus Jonathan, at the gate of Stormwind." },
        { turnin = 95189, when = { log = 95189 },
          note = "Lady Dena Kennedy, in Stormwind." },
        { turnin = 92415, optional = true,
          note = "Orphan Matron Nightingale, at the orphanage of Stormwind." },
    },
})
