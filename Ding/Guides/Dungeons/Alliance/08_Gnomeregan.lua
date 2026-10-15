-- Gnomeregan, Alliance, "Ding! - Dungeon quests": Shoni in Stormwind (and Brother Sarno's lead,
-- optional), the gnomes of Tinker Town in Ironforge, Ozzie Togglevolt in Kharanos and the
-- irradiated troggs at the gates, the city itself, then the turn-ins; the Grime-Encrusted Ring
-- only when it dropped, Kernobee's escort (turned in at Booty Bay) optional. Mathiel's and Gaxim
-- Rustfizzle's leads from Darnassus and Stonetalon are left out (far away, the quests they lead to
-- are given in Ironforge too); so are the Sparklematic 5200's cleaning quests (a box of random
-- loot for each grimy object). Drafted with tools/draft_dungeon.lua, finished by hand; quest ids
-- and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/08_Gnomeregan.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-gnomeregan",
    pack     = "ding-dungeons",
    title    = "Gnomeregan (29-38)",
    faction  = "Alliance",
    minLevel = 29, maxLevel = 38,
    steps    = {
        -- Stormwind.
        { accept = 2928,
          why = { text = "Reward: cloth or leather gloves, or an axe.", short = true },
          note = "Shoni the Shilent, in the Dwarven District of Stormwind." },
        { accept = 2923, optional = true,
          why = { text = "Optional: a lead to Tinkmaster Overspark in Ironforge.", short = true },
          note = "Brother Sarno, in the Cathedral of Light." },

        -- Tinker Town, in Ironforge.
        { turnin = 2923, optional = true,
          note = "Tinkmaster Overspark, in Tinker Town, in Ironforge." },
        { accept = 2922,
          note = "Tinkmaster Overspark, in Tinker Town." },
        { accept = { 2930, 2924, 2929 },
          why = { text = "Tinker Town's quests: Data Rescue brings a two-handed mace or a cloak, The Grand Betrayal cloth, leather or mail armor.", short = true },
          note = "Master Mechanic Castpipe, Klockmort Spannerspan and High Tinker Mekkatorque, in Tinker Town." },
        { accept = 2927,
          note = "Gnoarn, in Tinker Town." },

        -- Kharanos, then the gates of Gnomeregan.
        { turnin = 2927, accept = 2926,
          note = "Ozzie Togglevolt, in Kharanos, in Dun Morogh." },
        { complete = 2926,
          note = "Use the empty phial on the irradiated troggs that roam the gates of Gnomeregan." },
        { turnin = 2926, accept = 2962,
          note = "Back to Ozzie Togglevolt, in Kharanos." },

        -- The city.
        { go = { 1426, 24.30, 39.80 }, radius = 30, text = "Enter Gnomeregan",
          note = "The gates of Gnomeregan stand in the west of Dun Morogh." },
        { complete = 2922,
          note = "Techbot, the first boss, waits just inside: he drops the memory core." },
        { complete = { 2924, 2928 },
          note = "The tall, square machines of the city hold the artificials; every mechanical creature may drop the guts." },
        { complete = 2962,
          note = "Use the heavy phial on a living irradiated slime, in the lower Hall of Gears; the fallout does not last long." },
        { complete = 2930,
          note = "The addled leper gnomes drop the white card; the four Matrix Punchographs, from A to D, turn it yellow, blue, red, then prismatic: A on the way in, B at the bottom of the Dormitory, C on the Launch Bay's platform (Electrocutioner 6000's key opens it), D in the lower Engineering Labs." },
        { accept = 2904, optional = true,
          why = { text = "Optional: an escort, turned in at Booty Bay, far away; it rewards bracers or shoulders.", short = true },
          note = "Kernobee, a gnome held inside the city." },
        { complete = 2904, optional = true,
          note = "Lead Kernobee to the Clean Zone, by the dungeon's back door." },
        { accept = 2945, use = 9326, when = { item = 9326 },
          note = "The Dark Iron agents may drop a grimy ring: use it." },
        { turnin = 2945, when = { log = 2945 },
          note = "Put it in the Sparklematic 5200, a cleaning machine of the city." },
        { accept = 2947, when = { done = 2945 } },
        { complete = 2929,
          note = "Mekgineer Thermaplugg, the last boss, waits in the Tinkers' Court." },

        -- Turn-ins: Kharanos, Tinker Town, Stormwind, Booty Bay.
        { turnin = 2962,
          note = "Ozzie Togglevolt, in Kharanos." },
        { turnin = { 2922, 2930, 2924, 2929 },
          note = "Tinker Town, in Ironforge." },
        { turnin = 2947, when = { log = 2947 },
          note = "Talvash del Kissel, in the Mystic Ward of Ironforge." },
        { accept = 2948, when = { done = 2947 },
          why = { text = "A gold ring, for a silver bar, a moss agate and 30 silver.", short = true } },
        { complete = 2948, when = { log = 2948 },
          note = "A silver bar and a moss agate: from mining, or the auction house." },
        { turnin = 2948, when = { log = 2948 } },
        { turnin = 2928,
          note = "Shoni the Shilent, in the Dwarven District of Stormwind." },
        { turnin = 2904, optional = true,
          note = "Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale." },
    },
})
