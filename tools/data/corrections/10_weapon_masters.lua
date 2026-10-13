-- Weapon masters: the weapon skills each one teaches (a field of DingDB's own, `weaponSkills`,
-- which Questie's data does not have). Values are the game's skill line ids: 43 Swords,
-- 44 Axes, 45 Bows, 46 Guns, 54 Maces, 55 Two-Handed Swords, 136 Staves, 160 Two-Handed Maces,
-- 172 Two-Handed Axes, 173 Daggers, 176 Thrown, 226 Crossbows, 229 Polearms, 473 Fist Weapons.
-- Facts noted by hand and checked against the trainer lists of cMaNGOS classic-db (GPL v3).
return {
    npcs = {
        [11867] = { weaponSkills = { 43, 55, 136, 173, 226, 229 } },   -- Woo Ping, Stormwind
        [11865] = { weaponSkills = { 44, 46, 54, 160, 172, 473 } },    -- Buliwyf Stonehand, Ironforge
        [13084] = { weaponSkills = { 173, 176, 226 } },                -- Bixi Wobblebonk, Ironforge
        [11866] = { weaponSkills = { 45, 136, 173, 176, 473 } },       -- Ilyenia Moonfire, Darnassus
        [2704] = { weaponSkills = { 44, 45, 136, 172, 176 } },         -- Hanashi, Orgrimmar
        [11868] = { weaponSkills = { 44, 45, 172, 173, 176, 473 } },   -- Sayoc, Orgrimmar
        [11869] = { weaponSkills = { 46, 54, 136, 160 } },             -- Ansekhwa, Thunder Bluff
        [11870] = { weaponSkills = { 43, 55, 173, 226, 229 } },        -- Archibald, Undercity
    },
}
