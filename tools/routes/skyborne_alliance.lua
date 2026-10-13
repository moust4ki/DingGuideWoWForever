-- Skyborne start, Alliance side, Zephras Isle (levels 1-13), in Ding - Leveling: the optimizer
-- picks the order of the isle's quests (tools/draft_guide.lua). A Skyborne has a side from
-- creation (one race bit per side, questiedb_export.lua RACE_FACTION_BITS): the quests open to
-- the Alliance's Skyborne, then the Alliance's Leveling route, where tools/routes/leveling/
-- alliance.lua lets them join (`entries`). The Horde side: skyborne_horde.lua.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
return {
    file = "skyborne_alliance.lua",
    faction = "Alliance",
    races = { "Skyborne" },
    guideRaces = { "Skyborne" },
    next = "leveling-a04-westfall",
    -- Dungeon and elite quests as optional extras, tagged for the options (draft_guide.lua addExtras).
    extras = true,
    -- Class quests of the isle on steps for their class (draft_guide.lua addExtras).
    classQuests = true,
    guides = {
        { id = "leveling-s01-skyborne-alliance", file = "Leveling/Skyborne/01.lua", title = "Skyborne start",
          areas = { 16593 }, minLevel = 1, maxLevel = 13,
          intro = "Everything starts on Zephras Isle: follow the arrow from NPC to NPC.",
          -- The way off the isle: The Magical City of Dalaran, turned in at Dalaran (Alterac
          -- Mountains), then the Skyborne portal there to Stormwind.
          finish = {
              { accept = 94946 },
              { turnin = 94946, note = "Dalaran is reached through the Skyborne portal." },
              { go = { 1416, 12.04, 56.21 }, text = "Take the Skyborne portal to Stormwind" },
          } },
    },
}
