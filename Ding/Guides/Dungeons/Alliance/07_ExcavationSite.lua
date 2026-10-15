-- Excavation Site: Wetlands, Alliance, "Ding! - Dungeon quests": a dungeon of WoW Forever under
-- the Wetlands' dig. Menethil Harbor's quests, Rethiel the Greenwarden and Dorin Songblade's brother,
-- the excavation site, then the turn-ins; the Titan relic's chain to Ironforge only when it
-- dropped. Llana's lead from Ashenvale to Caitlin is left out (far away; Caitlin gives her quest
-- anyway). DingDB does not know who ends Caitlin's and Dorin's searches and who gives their
-- follow-ups: those steps are optional. It does not place the site's monsters yet: the notes only
-- say what the quests ask. Levels from its quests. Drafted with tools/draft_dungeon.lua, finished by
-- hand; quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/07_ExcavationSite.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-excavation",
    pack     = "ding-dungeons",
    title    = "Excavation Site: Wetlands (27-33)",
    faction  = "Alliance",
    minLevel = 27, maxLevel = 33,
    steps    = {
        { accept = 98815,
          note = "James Halloran, the tanner of Menethil Harbor, in the Wetlands." },
        { accept = 95647, optional = true,
          why = { text = "Optional: the guide does not know yet who ends this search; its follow-up brings a satchel of potions.", short = true },
          note = "Caitlin Grassman, in Menethil Harbor." },
        { accept = 95646,
          why = { text = "Reward: an axe, and about 3,200 XP.", short = true },
          note = "Rethiel the Greenwarden, in the middle of the Wetlands." },
        { accept = 95772, optional = true,
          why = { text = "Optional: the guide does not know yet who ends this search.", short = true },
          note = "Dorin Songblade, the armorer of Lakeshire, in Redridge." },

        { go = { 1437, 47.79, 56.16 }, radius = 30, text = "Enter the Excavation Site",
          note = "The excavation site opens by the dig in the middle of the Wetlands." },
        { complete = 98815,
          note = "Four thicket raptor hides, from the raptors of the site." },
        { complete = 95646,
          note = "A Highland Horror carries the root core." },
        { turnin = 95647, optional = true,
          note = "Ardin Grassman, somewhere in the site." },
        { accept = 95809, optional = true },
        { turnin = 95772, optional = true,
          note = "Daewyn, somewhere in the site." },
        { accept = 95795, optional = true },
        { accept = 95810, use = 270865, when = { item = 270865 },
          why = { text = "The Titan relic leads to Ironforge's explorers: a staff or a two-handed mace.", short = true },
          note = "The relic guardians may drop a Titan relic: read it." },

        { turnin = 95810, when = { ready = 95810 },
          note = "Prospector Whelgar, at his excavation camp in the Wetlands." },
        { accept = 98824, when = { done = 95810 } },
        { turnin = 95646,
          note = "Rethiel the Greenwarden." },
        { turnin = 98815,
          note = "James Halloran, in Menethil Harbor." },
        { turnin = 95809, optional = true,
          note = "Caitlin Grassman, in Menethil Harbor." },
        { turnin = 95795, optional = true,
          note = "Dorin Songblade, in Lakeshire." },
        { turnin = 98824, when = { ready = 98824 },
          note = "High Explorer Magellas, in the Hall of Explorers of Ironforge." },
    },
})
