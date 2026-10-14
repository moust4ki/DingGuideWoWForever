-- Rogue quests, Alliance, "Ding! - Class quests": the errand of Ironforge's rogues at level 10
-- (Dwarves and Gnomes), Pick Lock at 16, Klaven's Tower at 20 (it ends with your poisons),
-- Forever's Syndicate chain of Ravenholdt at 24, and the Azure Key at 50. Quest ids, races and
-- chains checked against DingDB (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Class/Alliance/Rogue.lua.
Ding.RegisterGuide({
    id       = "class-alliance-rogue",
    pack     = "ding-class",
    title    = "Rogue quests",
    faction  = "Alliance",
    classes  = { "ROGUE" },
    minLevel = 10, maxLevel = 60,
    leftOut  = {
        [96783] = { kind = "unsure" },
    },
    steps    = {
        -- Level 10: Ironforge's rogues.
        { accept = 2218, races = { "Dwarf", "Gnome" },
          why = { text = "From level 10: a first errand for the rogues of Ironforge.", short = true },
          note = "Hogral Bakkan, the rogue trainer of Kharanos." },
        { turnin = 2218, accept = 2238, races = { "Dwarf", "Gnome" },
          note = "Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge." },
        { turnin = 2238, accept = 2239, races = { "Dwarf", "Gnome" },
          note = "Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan." },
        { turnin = 2239, races = { "Dwarf", "Gnome" } },

        -- Level 16: Pick Lock.
        { train = true,
          why = { text = "From level 16: Pick Lock opens the chests and boxes of the quests to come.", short = true },
          note = "Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75." },

        -- Level 20: Klaven's Tower, then your poisons.
        { accept = 2360,
          why = { text = "From level 20: the chain that teaches your poisons.", short = true },
          note = "Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town." },
        { turnin = 2360, accept = 2359,
          note = "Agent Kearnen watches from a hill in the southeast of Westfall." },
        { complete = 2359,
          note = "Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest." },
        { turnin = 2359, accept = 2607,
          note = "The chest leaves a sickness on you: that is the next quest." },
        { turnin = 2607, accept = 2608,
          note = "Doc Mixilpixil works in the cellar of SI:7's headquarters." },
        { complete = 2608,
          note = "Lie down in front of him (the emote) so he can examine you." },
        { turnin = 2608,
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
