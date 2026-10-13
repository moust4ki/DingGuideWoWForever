-- Skyborne start, Horde side, Zephras Isle (levels 1-13), in Ding - Leveling: the optimizer
-- picks the order of the isle's quests (tools/draft_guide.lua). A Skyborne has a side from
-- creation (one race bit per side, questiedb_export.lua RACE_FACTION_BITS): the quests open to
-- the Horde's Skyborne, then the Horde's Leveling route, where tools/routes/leveling/horde.lua
-- lets them join (`entries`). The Alliance side: skyborne_alliance.lua.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
return {
    file = "skyborne_horde.lua",
    faction = "Horde",
    races = { "Skyborne" },
    guideRaces = { "Skyborne" },
    next = "leveling-h04-silverpine-forest",
    -- Dungeon and elite quests as optional extras, tagged for the options (draft_guide.lua addExtras).
    extras = true,
    -- Class quests of the isle on steps for their class (draft_guide.lua addExtras).
    classQuests = true,
    guides = {
        { id = "leveling-s02-skyborne-horde", file = "Leveling/Skyborne/02.lua", title = "Skyborne start",
          areas = { 16593 }, minLevel = 1, maxLevel = 13,
          intro = "Everything starts on Zephras Isle: follow the arrow from NPC to NPC.",
          -- The way off the isle: The Earthen Ring, turned in to Alaana Stormwalker in Mulgore.
          finish = {
              { accept = 95349 },
              { turnin = 95349 },
          } },
    },
}
