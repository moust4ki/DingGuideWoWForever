-- The Temple of Atal'Hakkar, Alliance, "Ding! - Dungeon quests": Brohann Caskbelly's long search
-- for the temple (optional), the Atal'ai Exile in the Hinterlands, Muigin and Larion's haze in
-- Un'Goro and Feralas, Marvon Rivetseeker's stone circle in Feathermoon, Tanaris and Ratchet, the
-- sunken temple, then the turn-ins and Eranikus's chain; The God Hakkar only once Yeh'kinya's
-- Ancient Egg is turned in (Zul'Farrak's guide). The level 50 class quests of the temple stay with
-- Ding! - Class quests. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and
-- chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/16_SunkenTemple.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-sunken",
    pack     = "ding-dungeons",
    title    = "The Temple of Atal'Hakkar (50-60)",
    faction  = "Alliance",
    minLevel = 50, maxLevel = 60,
    steps    = {
        -- Brohann Caskbelly's search (optional).
        { accept = 1448, optional = true,
          why = { text = "Optional: a chain of eight quests from Stormwind to the Hinterlands, Tanaris and Feralas; it opens Into the Temple of Atal'Hakkar, a talisman and about 7,100 XP.", short = true },
          note = "Brohann Caskbelly, in the Dwarven District of Stormwind." },
        { complete = 1448, optional = true,
          note = "Find the temple: the ruins in the Pool of Tears, in the east of the Swamp of Sorrows." },
        { turnin = 1448, accept = 1449, optional = true,
          note = "Brohann Caskbelly, in Stormwind." },
        { turnin = 1449, accept = 1450, optional = true,
          note = "Falstad Wildhammer, at Aerie Peak, in the Hinterlands." },
        { turnin = 1450, accept = 1451, optional = true,
          note = "Gryphon Master Talonaxe, at Aerie Peak." },
        { turnin = 1451, accept = 1452, optional = true,
          note = "Rhapsody Shindigger, on the road east of Aerie Peak." },

        -- The Hinterlands.
        { accept = 1446,
          why = { text = "Reward: cloth leggings or a mail helm, and about 6,550 XP.", short = true },
          note = "The Atal'ai Exile, in the south of the Hinterlands." },

        -- Kalimdor.
        { accept = 4141,
          why = { text = "Muigin's chain leads to the temple's haze.", short = true },
          note = "Muigin, at Marshal's Refuge, in Un'Goro Crater." },
        { complete = 4141,
          note = "The bloodpetal plants of Un'Goro drop the petals." },
        { turnin = 4141, accept = 4142 },
        { turnin = 4142, accept = 4143,
          note = "Gregan Brewspewer, in the north of Feralas." },
        { accept = 3445,
          why = { text = "Marvon's chain opens two quests of the temple; one rewards a Hakkari urn.", short = true },
          note = "Angelas Moonbreeze, at Feathermoon Stronghold, in Feralas." },
        { complete = 1452, optional = true,
          note = "Groddoc and ironfur livers in Feralas, roc gizzards in Tanaris." },
        { turnin = 3445, accept = 3444,
          note = "Marvon Rivetseeker, in Tanaris, south of Gadgetzan." },
        { complete = 3444,
          note = "Marvon's chest, in his old workshop in Ratchet, holds the stone circle." },
        { turnin = 3444, accept = { 3446, 3447 },
          note = "Marvon Rivetseeker, in Tanaris." },
        { accept = 4787, when = { done = 3527 },
          note = "Yeh'kinya, at Steamwheedle Port, in Tanaris." },
        { complete = 4787, when = { log = 4787 },
          note = "The Ancient Egg lies at the top of Jintha'Alor, in the Hinterlands, among elite trolls." },
        { turnin = 4787, when = { log = 4787 },
          note = "Yeh'kinya, at Steamwheedle Port." },
        { accept = 3528, when = { done = 4787 },
          why = { text = "Reward: a plate helm, a cloth circlet or a dagger, and about 7,900 XP.", short = true } },

        -- Back east.
        { turnin = 1452, accept = 1469, optional = true,
          note = "Rhapsody Shindigger, in the Hinterlands." },
        { turnin = 1469, accept = 1475, optional = true,
          note = "Brohann Caskbelly, in Stormwind." },
        { complete = 1475, optional = true,
          note = "The Atal'ai tablets lie in the ruins around the Pool of Tears, and inside the temple." },

        -- The temple.
        { go = { 1435, 69.90, 53.50 }, radius = 30, text = "Enter the Temple of Atal'Hakkar",
          note = "The temple lies sunken in the Pool of Tears, in the east of the Swamp of Sorrows: swim down to the ruins' stairs." },
        { complete = 4143,
          note = "The murk worms, deep lurkers and oozes of the temple drop the haze." },
        { complete = 3447,
          note = "Hall of Serpents: use the six statues in this order: south, north, south-west, south-east, north-west, north-east; Atal'alarion appears. The Idol of Hakkar stands in the middle of the Pit of Refuse." },
        { turnin = 3447 },
        { turnin = 3446,
          note = "Climb the stairs of the Pit of Refuse: the Altar of Hakkar waits up there." },
        { complete = 1446,
          note = "Kill the six troll elites on the balconies first: Jammal'an's barrier falls; he waits south-east of the Pit of Sacrifice." },
                { accept = 3373, use = 10454, when = { item = 10454 },
          note = "The Shade of Eranikus, at the end of the south path, may drop his essence: use it." },
        { turnin = 3373, when = { log = 3373 },
          note = "The Essence Font, in the north-east corner of his room." },
        { accept = 3374, use = 10589, when = { item = 10589 },
          note = "Use the Oathstone of Ysera's Dragonflight it gives you." },
        { complete = 3374, when = { log = 3374 },
          note = "Keep the Chained Essence of Eranikus, the font's reward: Itharius asks for it." },
        { complete = 3528, when = { log = 3528 },
          note = "Use the Egg of Hakkar by the skeleton in the Sanctum of the Fallen God, south-west: Hakkari bloodkeepers come, their blood puts out the four eternal flames, then the Avatar of Hakkar comes; his essence fills the egg." },

        -- Turn-ins.
        { turnin = 3374, when = { log = 3374 },
          note = "Itharius, a green dragon in the south-west of the Swamp of Sorrows." },
        { accept = 3512, when = { done = 3374 } },
        { turnin = 1475, optional = true,
          note = "Brohann Caskbelly, in Stormwind." },
        { turnin = 1446,
          note = "The Atal'ai Exile, in the Hinterlands." },
        { turnin = 4143, accept = 4144,
          note = "Muigin, at Marshal's Refuge, in Un'Goro Crater." },
        { complete = 4144,
          note = "The beasts of Un'Goro drop the bloodpetal sprouts." },
        { turnin = 4144 },
        { turnin = 3528, when = { log = 3528 },
          note = "Yeh'kinya, at Steamwheedle Port, in Tanaris." },
        { turnin = 3512, when = { log = 3512 },
          note = "Umbranse the Spiritspeaker, in the east of Winterspring." },
    },
})
