-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/26.lua.
-- Simulated (warrior): Human 43 (37%) -> 43 (71%) in 1 h 33, 7 quests turned in; Dwarf 43 (37%) -> 43 (71%) in 1 h 33, 7 quests turned in; NightElf 43 (37%) -> 43 (71%) in 1 h 33, 7 quests turned in; Gnome 43 (37%) -> 43 (71%) in 1 h 33, 7 quests turned in; Skyborne 43 (37%) -> 43 (71%) in 1 h 33, 7 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a26-swamp-of-sorrows",
    title    = "Swamp of Sorrows (43-43)",
    faction  = "Alliance",
    minLevel = 43, maxLevel = 43,
    next     = "leveling-a27-tanaris",
    steps    = {
        { go = { 1431, 75.78, 46.16 }, text = "Travel to Darkshire", -- level 43
          note = "Duskwood: Darkshire first, then the Swamp of Sorrows." },
        { turnin = 1477 }, -- level 43
        { accept = 1398, sticky = { 1258, 1364 } }, -- level 43
        { complete = 1398, -- level 43
          note = "Collect the chunks of wood. Do not go near Stonard." },
        { complete = 1258, -- level 43
          note = "Hunt the crabs. Silt Crawlers drop it more often. You'll find extra ones swimming nearby as well." },
        { complete = 1364, -- level 43
          note = "Fight the elementals of the swamp. The item drops rarely." },
        { accept = 93176 }, -- level 43
        { complete = 1364, -- level 43
          note = "Fight the elementals of the swamp. The item drops rarely." },
        { turnin = 1398, accept = 1425 }, -- level 43
        { turnin = 1364, -- level 43
          note = "The NPC waits on the tower's highest floor." },
        { turnin = 1425 }, -- level 43
        { go = { 1419, 65.5, 24.38 }, fly = true, talk = 8609, text = "Fly to Nethergarde Keep", -- level 43
          note = "The NPC is atop the raised platform." },
        { accept = 1395, -- level 43
          note = "A timer runs on this one; don't dawdle." },
        { turnin = 1395, -- level 43
          note = "A timer runs on this one; don't dawdle." },
        { accept = 580, elite = true }, -- level 43
        { accept = 1119, when = { done = 621 }, -- level 43
          note = "The NPC is indoors at street level." },
        { accept = 2864, -- level 43
          note = "Climb to the highest floor of the building." },
        { accept = 2872, -- level 43
          note = "The NPC is indoors." },
        { turnin = 623, -- level 43
          note = "This one roams, so scan the surrounding area." },
        { turnin = 1258, -- level 43
          note = "The NPC is indoors." },
        { sethearth = "Theramore Isle", talk = 6272, -- level 43
          note = "The NPC is indoors." },
    },
})
