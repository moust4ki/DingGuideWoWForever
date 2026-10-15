-- Warrior quests, Alliance, "Ding! - Class quests": Defensive Stance at level 10 (Humans in
-- Stormwind, Dwarves and Gnomes in Dun Morogh, Night Elves in Teldrassil, Skyborne on Zephras
-- Isle, UiMap 2521), Berserker Stance at 30 on Fray Island, the Whirlwind weapon at 30 to 40,
-- and the Fallen Hero's chain at 50. Quest ids, races and chains checked against DingDB
-- (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Class/Alliance/Warrior.lua.
Ding.RegisterGuide({
    id       = "class-alliance-warrior",
    pack     = "ding-class",
    title    = "Warrior quests",
    faction  = "Alliance",
    classes  = { "WARRIOR" },
    minLevel = 10, maxLevel = 60,
    steps    = {
        -- Level 10, Humans: Bartleby.
        { accept = 1638, races = { "Human" },
          why = { text = "From level 10: the chain that teaches Defensive Stance.", short = true },
          note = "Lyria Du Lac, the warrior trainer of Goldshire." },
        { turnin = 1638, accept = 1639, races = { "Human" },
          note = "Harry Burlguard, in the tavern of Old Town, in Stormwind." },
        { turnin = 1639, accept = 1640, races = { "Human" },
          note = "Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest." },
        { complete = 1640, races = { "Human" } },
        { turnin = 1640, accept = 1665, races = { "Human" } },
        { turnin = 1665, races = { "Human" },
          why = { text = "Turning this in teaches Defensive Stance.", short = true } },

        -- Level 10, Dwarves and Gnomes: Vejrek.
        { accept = 1679, races = { "Dwarf", "Gnome" },
          why = { text = "From level 10: the chain that teaches Defensive Stance.", short = true },
          note = "Granis Swiftaxe, the warrior trainer of Kharanos." },
        { turnin = 1679, accept = 1678, races = { "Dwarf", "Gnome" },
          floor = "up", note = "Muren Stormpike, upstairs in the Hall of Arms of Ironforge." },
        { complete = 1678, races = { "Dwarf", "Gnome" },
          note = "Vejrek waits in a Frostmane hut in the west of Dun Morogh." },
        { turnin = 1678, races = { "Dwarf", "Gnome" },
          why = { text = "Turning this in teaches Defensive Stance.", short = true } },

        -- Level 10, Night Elves: Vorlus Vilehoof.
        { accept = 1684, races = { "NightElf" },
          why = { text = "From level 10: the chain that teaches Defensive Stance.", short = true },
          note = "Kyra Windblade, the warrior trainer of Dolanaar." },
        { turnin = 1684, accept = 1683, races = { "NightElf" },
          note = "Elanaria, on the Warrior's Terrace of Darnassus." },
        { complete = 1683, races = { "NightElf" },
          note = "Vorlus Vilehoof roams with the satyrs southwest of Dolanaar." },
        { turnin = 1683, races = { "NightElf" },
          why = { text = "Turning this in teaches Defensive Stance.", short = true } },

        -- Level 10, Skyborne: the Skybreaker Bulwark.
        { accept = 94003, races = { "Skyborne" },
          why = { text = "From level 10: the Skyborne warrior quest of Zephras Isle.", short = true },
          note = "Seena Skybreaker, the warrior trainer of Zephras Isle." },
        { complete = 94003, races = { "Skyborne" },
          note = "Zaal Stormshield carries the bulwark, in the north of the isle." },
        { turnin = 94003, races = { "Skyborne" } },

        -- Level 30: the Affray, on Fray Island.
        { accept = 1718,
          why = { text = "From level 30: the chain that teaches Berserker Stance.", short = true },
          note = "Your capital's warrior trainer gives it." },
        { turnin = 1718, accept = 1719,
          note = "Klannoc Macleod, on Fray Island, off the coast of the Barrens." },
        { complete = 1719,
          note = "Step on the grate of the arena: six fighters come one at a time, then Big Will." },
        { turnin = 1719,
          why = { text = "Turning this in teaches Berserker Stance.", short = true } },

        -- Levels 30 to 40: the Whirlwind weapon.
        { accept = 1791,
          why = { text = "From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice.", short = true } },
        { turnin = 1791, accept = 1712,
          note = "Bath'rah the Windwatcher, in the hills of the Alterac Mountains." },
        { collect = { { 3357, 8 } },
          note = "Eight Liferoot: an herb, picked with Herbalism or bought at the auction house." },
        { collect = { { 4480, 1 }, { 4479, 1 }, { 4481, 1 } },
          note = "The Drywhisker kobolds of eastern Arathi Highlands carry the three charms." },
        { accept = 1714, complete = 1714,
          note = "At Bath'rah's cauldron, right by him: put the three charms in it." },
        { turnin = 1714 },
        { complete = 1712,
          note = "The Bloodscalp trolls of northern Stranglethorn carry the tusks." },
        { turnin = 1712, accept = 1713 },
        { complete = 1713,
          note = "Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help." },
        { turnin = 1713, accept = 1792 },
        { turnin = 1792,
          why = { text = "Your reward: a Whirlwind weapon of your choice.", short = true } },

        -- Level 50: the Fallen Hero of the Horde.
        { accept = 8417,
          why = { text = "From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar.", short = true },
          note = "Your capital's warrior trainer gives it." },
        { turnin = 8417, accept = 8423,
          note = "The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows." },
        { complete = 8423,
          note = "The Helboars of the Blasted Lands." },
        { turnin = 8423, accept = 8424 },
        { complete = 8424,
          note = "The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly." },
        { turnin = 8424 },
        { accept = 8425, dungeon = "The Temple of Atal'Hakkar" },
        { complete = 8425, dungeon = "The Temple of Atal'Hakkar",
          note = "The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro." },
        { turnin = 8425, dungeon = "The Temple of Atal'Hakkar" },
    },
})
