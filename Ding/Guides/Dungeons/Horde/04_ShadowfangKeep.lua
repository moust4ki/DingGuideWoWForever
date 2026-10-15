-- Shadowfang Keep, Horde, "Ding! - Dungeon quests": Keeper Bel'dugur's book in Undercity, the
-- Sepulcher's two quests in Silverpine Forest, the keep, then the turn-ins. The warlocks' Orb of
-- Soran'ruk, which also needs Blackfathom Deeps, stays with Ding! - Class quests. Drafted with
-- tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against DingDB
-- (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/04_ShadowfangKeep.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-shadowfang",
    pack     = "ding-dungeons",
    title    = "Shadowfang Keep (22-30)",
    faction  = "Horde",
    minLevel = 22, maxLevel = 30,
    steps    = {
        { accept = 1013,
          why = { text = "Reward: cloth, leather or mail armor.", short = true },
          note = "Keeper Bel'dugur, in Undercity." },
        { accept = 1014,
          why = { text = "Reward: a ring and about 3,300 XP.", short = true },
          note = "Dalar Dawnweaver, at the Sepulcher, in Silverpine Forest." },
        { accept = 1098,
          why = { text = "Reward: shoulders of cloth, leather or mail.", short = true },
          note = "High Executor Hadrec, at the Sepulcher." },

        { go = { 1421, 44.80, 67.80 }, radius = 30, text = "Enter Shadowfang Keep",
          note = "The keep stands south of the Sepulcher." },
        { turnin = 1098,
          note = "Deathstalker Vincent lies in the courtyard: Deathstalker Adamant, freed after Rethilgore, opens its door." },
        { complete = 1013,
          note = "The Book of Ur, a blue book, stands on a bookshelf on the left of Fenrus the Devourer's room." },
        { complete = 1014,
          note = "Archmage Arugal, the last boss, waits at the top of the keep." },

        { turnin = 1014,
          note = "Dalar Dawnweaver, at the Sepulcher." },
        { turnin = 1013,
          note = "Keeper Bel'dugur, in Undercity." },
    },
})
