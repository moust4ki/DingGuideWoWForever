-- Priest quests, Horde, "Ding! - Class quests": the first robe at level 5, the racial spells at 10
-- and 20 (Hex of Weakness and Shadowguard for Trolls, Touch of Weakness and Devouring Plague for
-- the Undead), then Ogtinc's chain in Azshara at 50. Quest ids, races and chains checked
-- against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Class/Horde/Priest.lua.
Ding.RegisterGuide({
    id       = "class-horde-priest",
    pack     = "ding-class",
    title    = "Priest quests",
    faction  = "Horde",
    classes  = { "PRIEST" },
    minLevel = 5, maxLevel = 60,
    steps    = {
        -- Level 5: a robe for healing a wounded guard.
        { accept = 5649, races = { "Troll" },
          why = { text = "From level 5: heal a wounded grunt, and get your first robe.", short = true },
          note = "Ken'jai, the priest trainer of the Valley of Trials." },
        { turnin = 5649, accept = 5648, races = { "Troll" },
          note = "Tai'jin, the priest trainer of Razor Hill." },
        { complete = 5648, races = { "Troll" },
          note = "Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude." },
        { turnin = 5648, races = { "Troll" } },
        { accept = 5651, races = { "Scourge" },
          why = { text = "From level 5: heal a wounded deathguard, and get your first robe.", short = true },
          note = "Dark Cleric Duesten, the priest trainer of Deathknell." },
        { turnin = 5651, accept = 5650, races = { "Scourge" },
          note = "Dark Cleric Beryl, the priest trainer of Brill." },
        { complete = 5650, races = { "Scourge" },
          note = "Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude." },
        { turnin = 5650, races = { "Scourge" } },

        -- Level 10: the racial spells.
        { accept = 5654, races = { "Troll" },
          why = { text = "From level 10: the quest that teaches Hex of Weakness.", short = true },
          note = "Tai'jin, the priest trainer of Razor Hill." },
        { turnin = 5654, races = { "Troll" },
          note = "Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits." },
        { accept = 5658, races = { "Scourge" },
          why = { text = "From level 10: the quest that teaches Touch of Weakness.", short = true },
          note = "Aelthalyste, the priest trainer of the Undercity, in the War Quarter." },
        { turnin = 5658, races = { "Scourge" } },

        -- Level 20: the second racial spells.
        { accept = 5680, races = { "Troll" },
          why = { text = "From level 20: the quest that teaches Shadowguard.", short = true },
          note = "Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits." },
        { turnin = 5680, races = { "Troll" } },
        { accept = 5679, races = { "Scourge" },
          why = { text = "From level 20: the quest that teaches Devouring Plague.", short = true },
          note = "Aelthalyste, the priest trainer of the Undercity, in the War Quarter." },
        { turnin = 5679, races = { "Scourge" } },

        -- Level 50: Ogtinc, in Azshara.
        { accept = 8254,
          why = { text = "From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar.", short = true },
          note = "Any priest trainer of a capital gives it." },
        { turnin = 8254, accept = 8255,
          note = "Ogtinc lives up a hill path in the middle of Azshara." },
        { complete = 8255,
          note = "The Mosshoof Coursers of northern Azshara carry the glands; only some do." },
        { turnin = 8255, accept = 8256 },
        { complete = 8256,
          note = "The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor." },
        { turnin = 8256 },
        { accept = 8257, dungeon = "The Temple of Atal'Hakkar" },
        { complete = 8257, dungeon = "The Temple of Atal'Hakkar",
          note = "Morphaz, one of the green dragons of the temple, carries the blood." },
        { turnin = 8257, dungeon = "The Temple of Atal'Hakkar",
          note = "Greta Mosshoof, at the Emerald Sanctuary in Felwood." },
    },
})
