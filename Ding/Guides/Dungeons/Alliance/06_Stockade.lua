-- The Stockade, Alliance, "Ding! - Dungeon quests": the Dark Iron War at Dun Modr (it opens The
-- Fury Runs Deep), Lakeshire's and Darkshire's wanted prisoners, Stormwind's three quests, the
-- prison, then the turn-ins. The Stockade Riots needs Bazil Thredd, which VanCleef's letter opens
-- (Ding! - Dungeon quests' Deadmines guide): without it those steps pass. Its follow-ups, the
-- Lescovar chain in Stormwind up to the king's reward, are optional. Drafted with
-- tools/draft_dungeon.lua, finished by hand; quest ids and chains checked against DingDB
-- (tools/check_guides.lua).
-- Texts are in English, translated in Locales/Guides/<locale>/Dungeons/Alliance/06_Stockade.lua.
Ding.RegisterGuide({
    id       = "dungeon-alliance-stockade",
    pack     = "ding-dungeons",
    title    = "The Stockade (24-32)",
    faction  = "Alliance",
    minLevel = 24, maxLevel = 32,
    steps    = {
        -- Dun Modr, in the north of the Wetlands.
        { accept = 303,
          why = { text = "Far north in the Wetlands: it opens The Fury Runs Deep, whose reward is a two-handed mace or a leather belt.", short = true },
          note = "Motley Garmason, at Dun Modr, in the north of the Wetlands." },
        { complete = 303,
          note = "The Dark Iron dwarves camp around Dun Modr." },
        { turnin = 303, accept = 378 },

        -- Lakeshire, Darkshire.
        { accept = 386,
          why = { text = "Reward: a staff, a sword or a two-handed mace.", short = true },
          note = "Guard Berton, in Lakeshire, in Redridge." },
        { accept = 377,
          why = { text = "Reward: cloth, leather or mail armor.", short = true },
          note = "Councilman Millstipe, in the town hall of Darkshire, in Duskwood." },

        -- Stormwind.
        { accept = 388,
          note = "Nikova Raskol, in Old Town, in Stormwind." },
        { turnin = 373, when = { log = 373 },
          note = "Baros Alexston, in the City Hall of the Cathedral Square." },
        { accept = 389, when = { done = 373 } },
        { accept = 387,
          note = "Warden Thelwater, at the door of the Stockade." },
        { turnin = 389, when = { log = 389 } },
        { accept = 391, when = { done = 389 },
          note = "Warden Thelwater asks for Bazil Thredd's head." },

        -- The prison.
        { go = { 1453, 52.41, 70.01 }, radius = 30, text = "Enter the Stockade",
          note = "The prison's door is by Warden Thelwater, in Stormwind." },
        { complete = 386,
          note = "Targorr the Dread, the first boss, sits in a cell near the start." },
        { complete = 378,
          note = "Kam Deepfury: go north, then east; he waits in the second small cell on the left." },
        { complete = 391, when = { log = 391 },
          note = "Bazil Thredd waits at the end of the east corridor." },
        { complete = 377,
          note = "Dextren Ward waits at the end of the west corridor." },
        { complete = { 387, 388 },
          note = "The prisoners, convicts and insurgents fill every cell; the Defias among them drop the bandanas." },

        -- Turn-ins, and the Lescovar chain (optional).
        { turnin = 387,
          note = "Warden Thelwater, at the door of the Stockade." },
        { turnin = 391, when = { log = 391 } },
        { accept = 392, optional = true, when = { done = 391 },
          why = { text = "Optional: nine more quests in Stormwind; the last brings a ring and about 3,750 XP.", short = true } },
        { turnin = 392, accept = 393, optional = true, when = { done = 391 },
          note = "Baros Alexston, in the City Hall." },
        { turnin = 393, accept = 350, optional = true, when = { done = 391 },
          note = "Master Mathias Shaw, in the SI:7 house of Old Town." },
        { turnin = 350, accept = 2745, optional = true, when = { done = 391 },
          note = "Elling Trias, in the cheese shop of the Trade District." },
        { turnin = 2745, accept = 2746, optional = true, when = { done = 391 },
          note = "Tyrion, near Stormwind Keep." },
        { complete = 2746, optional = true, when = { done = 391 },
          note = "Three silk cloth, and two of Clara's fresh apples, from a basket north-west of Goldshire, in Elwynn Forest." },
        { turnin = 2746, accept = 434, optional = true, when = { done = 391 },
          note = "Tyrion, near Stormwind Keep." },
        { complete = 434, optional = true, when = { done = 391 },
          note = "Wait in the garden by Stormwind Keep until Lord Gregor Lescovar and Marzon the Silent Blade have talked, then defeat both." },
        { turnin = 434, accept = 394, optional = true, when = { done = 391 },
          note = "Elling Trias, in the cheese shop." },
        { turnin = 394, accept = 395, optional = true, when = { done = 391 },
          note = "Master Mathias Shaw, in the SI:7 house." },
        { turnin = 395, accept = 396, optional = true, when = { done = 391 },
          note = "Baros Alexston, in the City Hall." },
        { turnin = 396, optional = true, when = { done = 391 },
          note = "Lady Katrana Prestor, beside the king in Stormwind Keep." },
        { turnin = 388,
          note = "Nikova Raskol, in Old Town." },
        { turnin = 386,
          note = "Guard Berton, in Lakeshire." },
        { turnin = 377,
          note = "Councilman Millstipe, in Darkshire." },
        { turnin = 378,
          note = "Motley Garmason, at Dun Modr." },
    },
})
