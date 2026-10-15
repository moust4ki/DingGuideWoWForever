-- Excavation Site: Wetlands, Horde, "Ding! - Dungeon quests": a dungeon of WoW Forever under the
-- Wetlands' dig. Zaruk's Dragonmaw rumors from Hammerfall, Borstan's raptor meat in Orgrimmar, the
-- excavation site, then the turn-ins; the Titan relic's chain to Mulgore only when it dropped.
-- DingDB does not place the Deathstalker Agent nor the site's monsters yet: the notes only say what
-- the quests ask. Levels from its quests. Drafted with tools/draft_dungeon.lua, finished by hand;
-- quest ids and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/06_ExcavationSite.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-excavation",
    pack     = "ding-dungeons",
    title    = "Excavation Site: Wetlands (27-33)",
    faction  = "Horde",
    minLevel = 27, maxLevel = 33,
    steps    = {
        { accept = 95697,
          why = { text = "Reward: a dagger or a satchel of potions.", short = true },
          note = "Borstan, the meat vendor of Orgrimmar." },
        { accept = 95663,
          why = { text = "Dragonmaw Rumors leads to Open the Maw, inside the site.", short = true },
          note = "Zaruk, at Hammerfall, in Arathi Highlands." },
        { turnin = 95663, accept = 95682,
          note = "The Deathstalker Agent hides in the hills above the Dragonmaw camp, in the Wetlands." },

        { go = { 1437, 47.79, 56.16 }, radius = 30, text = "Enter the Excavation Site",
          note = "The excavation site opens by the dig in the middle of the Wetlands." },
        { complete = 95697,
          note = "Thicket raptor meat, from the raptors of the site." },
        { complete = 95682,
          note = "The Dragonmaw forces of the site, their thaumaturgists among them." },
        { accept = 95664, use = 270866, when = { item = 270866 },
          why = { text = "The Titan relic leads to the Earthen Ring: a staff or a two-handed mace.", short = true },
          note = "The relic guardians may drop a Titan relic: read it." },

        { turnin = 95682,
          note = "The Deathstalker Agent, above the Dragonmaw camp." },
        { turnin = 95697,
          note = "Borstan, in Orgrimmar." },
        { turnin = 95664, when = { ready = 95664 },
          note = "Bashana Runetotem, on the Elder Rise of Thunder Bluff." },
        { accept = 98823, when = { done = 95664 } },
        { turnin = 98823, when = { log = 98823 },
          note = "Muln Earthfury, on the Skywatcher Plateau, in the north-west of Mulgore." },
    },
})
