-- Razorfen Downs, Horde, "Ding! - Dungeon quests": Andrew Brownell in Undercity, Varimathras's
-- An Unholy Alliance (once Charlga's scroll from Razorfen Kraul is turned in), Myriam Moonsinger's
-- quilboar and cultists outside the downs, the downs and Belnistrasz's ritual, then the turn-ins.
-- Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against
-- DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/11_RazorfenDowns.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-downs",
    pack     = "ding-dungeons",
    title    = "Razorfen Downs (37-46)",
    faction  = "Horde",
    minLevel = 37, maxLevel = 46,
    steps    = {
        { accept = 3341,
          why = { text = "Reward: a sword or a talisman, and about 4,300 XP.", short = true },
          note = "Andrew Brownell, in Undercity." },
        { accept = 6521, when = { done = 6522 },
          why = { text = "Reward: a mace, a gun, a cloth robe or a leather chest.", short = true },
          note = "Varimathras, in the Royal Quarter of Undercity." },
        { accept = 6626,
          why = { text = "About 3,450 XP, without entering the downs.", short = true },
          note = "Myriam Moonsinger, outside Razorfen Downs, in the far south of the Barrens." },
        { complete = 6626,
          note = "The Razorfen battleguards, thornweavers and Death's Head cultists guard the slopes before the downs." },
        { complete = 6521, when = { log = 6521 },
          note = "Ambassador Malcin walks among the quilboar outside the downs." },
        { turnin = 6626,
          note = "Myriam Moonsinger." },

        { go = { 1413, 49.00, 93.90 }, radius = 30, text = "Enter Razorfen Downs",
          note = "The downs' entrance is by Myriam Moonsinger, at the foot of the great thorn mound." },
        { accept = 3523,
          why = { text = "Belnistrasz's ritual: a ring, and about 4,250 XP.", short = true },
          note = "Belnistrasz waits in the Holding Pen, on the north side of the Murder Pens; taking his second quest starts his ritual at once." },
        { turnin = 3523, accept = 3525 },
        { complete = 3525,
          note = "Defend Belnistrasz while he works: waves of quilboar and undead come. Then use his brazier, in the same room." },
        { turnin = 3525 },
        { complete = 3341,
          note = "Amnennar the Coldbringer, the last boss, waits at the top of the Spiral of Thorns." },

        { turnin = 3341,
          note = "Andrew Brownell, in Undercity." },
        { turnin = 6521, when = { log = 6521 },
          note = "Varimathras, in the Royal Quarter." },
    },
})
