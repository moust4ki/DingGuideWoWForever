-- Second section, reached through `next` from the first one: the spider cave north of
-- Aldrassil. Shows a level step with a patrol for the arrow, a `go` step, an optional step,
-- a step under a condition (`when`) and a final manual step.
Ding.RegisterGuide({
    pack     = "example",
    id       = "example-02-cave",
    title    = "The spider cave (3-5)",
    faction  = "Alliance",
    races    = { "NightElf" },
    minLevel = 3, maxLevel = 5,
    steps    = {
        { level = 3, patrol = { { 1438, 57.0, 42.0 }, { 1438, 59.5, 39.0 }, { 1438, 61.5, 42.5 } },
          note = "Gilshalan only talks to level 3 characters: finish the level on boars if needed." },
        { accept = { 916, 4495 } },
        { go = { 1438, 54.6, 33.0 }, text = "Walk north to the cave",
          note = "Iverron waits in front of it." },
        { turnin = 4495, accept = 3519 },
        { complete = 916,
          note = "The webwood spiders live in that cave." },
        { accept = 97236, optional = true,
          note = "Githyiss the Vile, at the back of the cave, may drop a fang: use it from your bags." },
        { turnin = 3519,
          note = "Back to Aldrassil." },
        -- Only if the fang's quest was taken (`optional` too: Ding versions before `when`).
        { turnin = 97236, optional = true, when = { log = 97236 } },
        { turnin = 916 },
        { text = "End of the example: pick Ding's guide again in the settings (Guide tab)." },
    },
})
