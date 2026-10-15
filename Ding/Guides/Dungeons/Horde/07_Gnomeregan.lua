-- Gnomeregan, Horde, "Ding! - Dungeon quests": Nogg's Rig Wars in Orgrimmar, Sovik's lead to
-- Scooty in Booty Bay, whose transponder sends you to Gnomeregan, the city, then the turn-ins; the
-- Grime-Encrusted Ring only when it dropped, Kernobee's escort optional. The Sparklematic 5200's
-- cleaning quests (a box of random loot for each grimy object) are left out. Drafted with
-- tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against DingDB
-- (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/07_Gnomeregan.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-gnomeregan",
    pack     = "ding-dungeons",
    title    = "Gnomeregan (29-38)",
    faction  = "Horde",
    minLevel = 29, maxLevel = 38,
    steps    = {
        { accept = 2841,
          why = { text = "Reward: cloth, leather or mail armor.", short = true },
          note = "Nogg, in his machine shop in the Valley of Honor of Orgrimmar." },
        { accept = 2842,
          why = { text = "Scooty's transponder sends you straight to Gnomeregan, far in Dun Morogh, and stays yours.", short = true },
          note = "Sovik, beside Nogg." },
        { turnin = 2842, accept = 2843,
          note = "Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale." },
        { complete = 2843,
          note = "Wait for Scooty to set up the transponder." },
        { turnin = 2843 },

        { go = { 1426, 24.30, 39.80 }, radius = 30, text = "Enter Gnomeregan",
          note = "The transponder leaves you by the gates of Gnomeregan, in the west of Dun Morogh." },
        { accept = 2904, optional = true,
          why = { text = "Optional: an escort, turned in at Booty Bay; it rewards bracers or shoulders.", short = true },
          note = "Kernobee, a gnome held inside the city." },
        { complete = 2904, optional = true,
          note = "Lead Kernobee to the Clean Zone, by the dungeon's back door." },
        { accept = 2945, use = 9326, when = { item = 9326 },
          note = "The Dark Iron agents may drop a grimy ring: use it." },
        { turnin = 2945, when = { log = 2945 },
          note = "Put it in the Sparklematic 5200, a cleaning machine of the city." },
        { accept = 2949, when = { done = 2945 } },
        { complete = 2841,
          note = "The last boss, Mekgineer Thermaplugg, carries the code of his safe, set in the far wall of the Tinkers' Court next to the third pillar counting from the right." },

        { turnin = 2904, optional = true,
          note = "Scooty, in Booty Bay." },
        { turnin = 2841,
          note = "Nogg, in Orgrimmar." },
        { turnin = 2949, when = { log = 2949 } },
        { accept = 2950, when = { done = 2949 },
          why = { text = "A gold ring, for a silver bar, a moss agate and 30 silver.", short = true } },
        { complete = 2950, when = { log = 2950 },
          note = "A silver bar and a moss agate: from mining, or the auction house." },
        { turnin = 2950, when = { log = 2950 } },
    },
})
