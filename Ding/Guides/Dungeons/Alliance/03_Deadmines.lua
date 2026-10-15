-- The Deadmines, Alliance, "Ding! - Dungeon quests": Wilder Thistlenettle and Shoni in
-- Stormwind, the Defias Brotherhood chain between Westfall, Redridge and Stormwind (it opens
-- VanCleef's head and the Red Silk Bandanas), Alba Fairmoon's explosives, the mine under
-- Moonbrook and the dungeon, then the turn-ins and VanCleef's letter, which leads to the
-- Stockade. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains checked
-- against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/03_Deadmines.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-deadmines",
    pack     = "ding-dungeons",
    title    = "The Deadmines (17-26)",
    faction  = "Alliance",
    minLevel = 17, maxLevel = 26,
    steps    = {
        -- Stormwind.
        { accept = { 167, 168 },
          why = { text = "Two quests of the mine under Moonbrook; their rewards include a two-handed axe and cloth, leather or mail armor.", short = true },
          note = "Wilder Thistlenettle, in the Dwarven District of Stormwind." },
        { accept = 2040,
          why = { text = "Reward: armor of leather or mail, or a wand.", short = true },
          note = "Shoni the Shilent, in the Dwarven District." },

        -- The Defias Brotherhood, from Sentinel Hill.
        { accept = 65,
          why = { text = "A long chain of six quests between Westfall, Redridge and Stormwind: it leads to VanCleef, whose head brings mail leggings, a leather tunic or a staff.", short = true },
          note = "Gryan Stoutmantle, in the tower of Sentinel Hill, in Westfall." },
        { accept = 92753,
          why = { text = "A quest of the mine under Moonbrook, ended at the Deadmines' exit.", short = true },
          note = "Alba Fairmoon, south-west of Sentinel Hill." },
        { turnin = 65, accept = 132,
          note = "Wiley the Black, in the inn of Lakeshire, in Redridge." },
        { turnin = 132, accept = 135,
          note = "Gryan Stoutmantle, at Sentinel Hill." },
        { turnin = 135, accept = 141,
          note = "Master Mathias Shaw, in the SI:7 house of Old Town, in Stormwind." },
        { turnin = 141, accept = 142,
          note = "Gryan Stoutmantle, at Sentinel Hill." },
        { complete = 142,
          note = "The Defias Messenger walks the road to Moonbrook; he carries the message." },
        { turnin = 142, accept = 155 },
        { complete = 155,
          note = "Follow the Defias Traitor to Moonbrook; Defias attack on the way." },
        { turnin = 155, accept = 166,
          note = "Gryan Stoutmantle, at Sentinel Hill." },
        { accept = 214,
          why = { text = "Reward: a weapon of your choice.", short = true },
          note = "Scout Riell, at the top of the Sentinel Hill tower." },

        -- The mine under Moonbrook, then the dungeon.
        { go = { 1436, 42.50, 71.70 }, radius = 30, text = "Go down into the mine under Moonbrook",
          note = "The mine opens inside a house in the middle of Moonbrook." },
        { complete = { 167, 168 },
          note = "Foreman Thistlenettle and the undead miners roam the mine's tunnels, before the dungeon's door." },
        { complete = 92753,
          note = "Plant the explosives by the forge hidden in the Deadmines." },
        { complete = 214,
          note = "Every Defias of the dungeon may drop a bandana." },
        { complete = 2040,
          note = "Sneed's Shredder, the second boss, in the goblins' lumber cave, drops the Gnoam Sprecklesprocket." },
        { complete = 166,
          note = "Edwin VanCleef, the last boss, waits on the deck of the Defias ship at the end of the cave." },
        { accept = 373, use = 2874, when = { item = 2874 },
          note = "VanCleef drops a letter: read it to take its quest." },

        -- Turn-ins: the Deadmines' exit, Sentinel Hill, Stormwind.
        { accept = 92819,
          note = "Alba Fairmoon waits at the Deadmines' exit, on the coast south-west of Moonbrook." },
        { turnin = { 92819, 92753 },
          note = "Use her detonator, then tell her." },
        { turnin = { 166, 214 },
          note = "Gryan Stoutmantle and Scout Riell, in the Sentinel Hill tower." },
        { turnin = { 167, 168 },
          note = "Wilder Thistlenettle, in the Dwarven District of Stormwind." },
        { turnin = 2040,
          note = "Shoni the Shilent, in the Dwarven District." },
        { turnin = 373, when = { log = 373 },
          note = "Baros Alexston, in the City Hall of the Cathedral Square." },
        { accept = 389, when = { done = 373 },
          why = { text = "Bazil Thredd leads to the Stockade's riots.", short = true } },
        { turnin = 389, when = { log = 389 },
          note = "Warden Thelwater, at the door of the Stockade, in Stormwind." },
    },
})
