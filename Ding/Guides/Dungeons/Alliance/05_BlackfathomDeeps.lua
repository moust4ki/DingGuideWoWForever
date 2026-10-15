-- Blackfathom Deeps, Alliance, "Ding! - Dungeon quests": Argos Nightwhisper's lead in
-- Stormwind (optional), Gerrig Bonegrip in Ironforge, Gershala Nightwhisper in Auberdine, the
-- Argent Dawn's two quests in Darnassus, the deeps on Ashenvale's coast, then the turn-ins. The
-- warlocks' Orb of Soran'ruk, which also needs Shadowfang Keep, stays with Ding! - Class quests.
-- Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against
-- DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/05_BlackfathomDeeps.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-blackfathom",
    pack     = "ding-dungeons",
    title    = "Blackfathom Deeps (24-32)",
    faction  = "Alliance",
    minLevel = 24, maxLevel = 32,
    steps    = {
        { accept = 3765, optional = true,
          why = { text = "Optional: a lead to Auberdine, worth about 1,450 XP once there.", short = true },
          note = "Argos Nightwhisper, in Stormwind." },
        { accept = 971,
          why = { text = "Reward: a ring.", short = true },
          note = "Gerrig Bonegrip, in the Forlorn Cavern of Ironforge." },
        { turnin = 3765, optional = true,
          note = "Gershala Nightwhisper, in Auberdine, in Darkshore." },
        { accept = 1275,
          why = { text = "Reward: cloth, leather or mail armor.", short = true },
          note = "Gershala Nightwhisper, in Auberdine." },
        { accept = { 1199, 1198 },
          why = { text = "Two quests of the Argent Dawn: the second leads to Twilight Lord Kelris and a wand, a shield or leather armor.", short = true },
          note = "Argent Guard Manados and Dawnwatcher Shaedlass, in Darnassus." },

        { go = { 1440, 14.50, 14.20 }, radius = 30, text = "Enter Blackfathom Deeps",
          note = "The deeps open in ruins half under water, on the coast of Ashenvale's Zoram Strand." },
        { complete = 1275,
          note = "The Blackfathom and Fallenroot creatures carry the brain stems, from the cave before the dungeon's door on." },
        { complete = 971,
          note = "The manuscript lies in a chest under the water, by Ghamoo-ra, the first boss, in the Pool of Ask'ar." },
        { turnin = 1198, accept = 1200,
          note = "Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar." },
        { complete = 1199,
          note = "Every Twilight cultist of the deeps may drop a pendant." },
        { complete = 1200,
          note = "Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum." },

        { turnin = 1275,
          note = "Gershala Nightwhisper, in Auberdine." },
        { turnin = 1199,
          note = "Argent Guard Manados, in Darnassus." },
        { turnin = 1200,
          note = "Dawnwatcher Selgorm, beside him in Darnassus." },
        { turnin = 971,
          note = "Gerrig Bonegrip, in the Forlorn Cavern of Ironforge." },
    },
})
