-- First section: the quests around Aldrassil, Night Elves only. Teldrassil is map 1438.
-- Quest ids only: Ding reads the names, the NPCs and their places from QuestieDB.
Ding.RegisterGuide({
    pack     = "example",
    id       = "example-01-aldrassil",
    title    = "Aldrassil (1-4)",
    faction  = "Alliance",
    races    = { "NightElf" },
    minLevel = 1, maxLevel = 4,
    next     = "example-02-cave",
    steps    = {
        { accept = { 456, 458 },
          note = "Both quest givers stand at the foot of Aldrassil, the great tree." },
        { complete = 456,
          note = "Young nightsabers and thistle boars all around the tree." },
        { turnin = 456, accept = 457 },
        { turnin = 458, accept = 459 },
        { train = true,
          note = "Your class trainer is inside Aldrassil." },
        { complete = { 457, 459 },
          note = "Nightsabers and boars to the north, moss on the grells to the west." },
        { turnin = 457 },
        { turnin = 459 },
    },
})
