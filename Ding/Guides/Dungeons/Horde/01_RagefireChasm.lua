-- Ragefire Chasm, Horde, "Ding! - Dungeon quests": Rahauro's two quests in Thunder Bluff,
-- Thrall's Hidden Enemies chain and Neeru Fireblade's beast in Orgrimmar, Varimathras's books
-- from Undercity (a zeppelin away: optional), the chasm itself under the Cleft of Shadow, then
-- the turn-ins. Drafted with tools/draft_dungeon.lua, finished by hand; quest ids and chains
-- checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Horde/01_RagefireChasm.lua.
Ding.RegisterGuide({
    id       = "dungeon-horde-ragefire",
    pack     = "ding-dungeons",
    title    = "Ragefire Chasm (13-18)",
    faction  = "Horde",
    minLevel = 13, maxLevel = 18,
    steps    = {
        -- Thunder Bluff: Rahauro.
        { accept = { 5722, 5723 },
          why = { text = "The lost satchel's quest ends with bracers of cloth, leather or mail.", short = true },
          note = "Rahauro, on the Elder Rise of Thunder Bluff." },

        -- Undercity, a zeppelin away: Varimathras's books.
        { accept = 5725, optional = true,
          why = { text = "Optional: given in Undercity, a zeppelin ride each way. Rewards leggings of cloth, leather or mail.", short = true },
          note = "Varimathras, beside Sylvanas in the Royal Quarter of Undercity." },

        -- Orgrimmar: Thrall, the Cleft of Shadow.
        { accept = 5726,
          why = { text = "Thrall's chain of four quests ends with a weapon of your choice.", short = true },
          note = "Thrall, in Grommash Hold, in the Valley of Wisdom." },
        { complete = 5726,
          note = "The Burning Blade cultists of the Cleft of Shadow carry the insignia." },
        { turnin = 5726, accept = 5727 },
        { complete = 5727, talk = 3216,
          note = "Talk to Neeru Fireblade, in the Darkbriar Lodge of the Cleft of Shadow." },
        { accept = 5761,
          note = "Neeru Fireblade also asks for the heart of the chasm's beast." },
        { turnin = 5727, accept = 5728,
          note = "Back to Thrall, in Grommash Hold." },

        -- The chasm.
        { go = { 1454, 52.60, 49.00 }, radius = 30, text = "Enter Ragefire Chasm",
          note = "The entrance is a cave in the Cleft of Shadow, in the middle of Orgrimmar." },
        { complete = 5723,
          note = "Ragefire troggs and their shamans fill the first caves." },
        { turnin = 5722, accept = 5724,
          note = "Maur Grimtotem's body lies in a small cave on the right, past the big trogg cave." },
        { complete = 5725, optional = true,
          note = "The Searing Blade cultists and warlocks carry both books." },
        { complete = 5761,
          note = "Taragaman the Hungerer, the chasm's second boss, guards a lava cave." },
        { complete = 5728,
          note = "Jergosh the Invoker is the third boss; Bazzalan waits at the very end of the chasm." },

        -- Turn-ins: Orgrimmar, Thunder Bluff, then Undercity.
        { turnin = 5728, accept = 5729,
          note = "Thrall, in Grommash Hold." },
        { turnin = { 5729, 5761 }, accept = 5730,
          note = "Neeru Fireblade, in the Cleft of Shadow." },
        { turnin = 5730,
          why = { text = "Your reward: an axe, a mace, a dagger or a staff of Orgrimmar.", short = true },
          note = "Thrall, in Grommash Hold." },
        { turnin = { 5723, 5724 },
          note = "Rahauro, on the Elder Rise of Thunder Bluff." },
        { turnin = 5725, optional = true,
          note = "Varimathras, in the Royal Quarter of Undercity." },
    },
})
