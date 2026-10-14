-- Rogue quests, Horde, "Ding! - Class quests": Pick Lock at 16, the Shattered Hand's mission at
-- 20 (it ends with your poisons), Forever's Syndicate chain of Ravenholdt at 24, and the Azure
-- Key at 50. Quest ids, races and chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Class/Horde/Rogue.lua.
Ding.RegisterGuide({
    id       = "class-horde-rogue",
    pack     = "ding-class",
    title    = "Rogue quests",
    faction  = "Horde",
    classes  = { "ROGUE" },
    minLevel = 16, maxLevel = 60,
    leftOut  = {
        [96783] = { kind = "unsure" },
    },
    steps    = {
        -- Level 16: Pick Lock.
        { train = true,
          why = { text = "From level 16: Pick Lock opens the chests and boxes of the quests to come.", short = true },
          note = "Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it." },

        -- Level 20: the Shattered Hand, then your poisons.
        { accept = 2460,
          why = { text = "From level 20: the chain that teaches your poisons.", short = true },
          note = "Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar." },
        { complete = 2460,
          note = "Shenthul greets you with a hand sign: answer it with the salute emote." },
        { turnin = 2460, accept = 2458 },
        { complete = 2458, useitem = 8051,
          note = "By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him." },
        { turnin = 2458, accept = 2478 },
        { complete = 2478,
          note = "In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox." },
        { turnin = 2478, accept = 2479,
          note = "The lockbox leaves a sickness on you: Shenthul sends you to be cured." },
        { turnin = 2479, accept = 2480,
          note = "Serge Hinott, the alchemist of Tarren Mill." },
        { complete = 2480,
          note = "Stay by Serge while he prepares the cure." },
        { turnin = 2480,
          why = { text = "Turning this in teaches your poisons.", short = true } },

        -- Level 24: the Syndicate, a chain added by Forever at Ravenholdt.
        { accept = 96779,
          why = { text = "From level 24: Forever's Syndicate quests, at Ravenholdt Manor.", short = true },
          note = "Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills." },
        { complete = 96779,
          note = "Lord Tomas is hiding in the east of Hillsbrad Foothills." },
        { turnin = 96779, accept = 96781 },
        { complete = 96781 },
        { turnin = 96781 },

        -- Level 50: the Azure Key.
        { accept = 8233,
          why = { text = "From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar.", short = true },
          note = "Any rogue trainer of a capital gives it." },
        { turnin = 8233, accept = 8234,
          note = "Lord Jorach Ravenholdt, in Ravenholdt Manor." },
        { complete = 8234,
          note = "The Timbermaw shamans of northern Azshara carry the bag." },
        { turnin = 8234, accept = 8235,
          note = "Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up." },
        { complete = 8235,
          note = "The Forest Oozes of northeastern Azshara carry the fragments." },
        { turnin = 8235 },
        { accept = 8236, dungeon = "The Temple of Atal'Hakkar" },
        { complete = 8236, dungeon = "The Temple of Atal'Hakkar",
          note = "Morphaz, one of the green dragons of the temple, drops the key." },
        { turnin = 8236, dungeon = "The Temple of Atal'Hakkar",
          note = "Lord Jorach Ravenholdt, in Ravenholdt Manor." },
    },
})
