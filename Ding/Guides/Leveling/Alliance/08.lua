-- Drafted by tools/write_leveling.lua from tools/routes/leveling/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Leveling/Alliance/08.lua.
-- Simulated (warrior): Human 20 (85%) -> 22 (49%) in 3 h 25, 17 quests turned in; Dwarf 20 (84%) -> 22 (48%) in 3 h 25, 17 quests turned in; NightElf 20 (85%) -> 22 (52%) in 3 h 25, 18 quests turned in; Gnome 20 (84%) -> 22 (48%) in 3 h 25, 17 quests turned in; Skyborne 20 (85%) -> 22 (49%) in 3 h 25, 17 quests turned in.
Ding.RegisterGuide({
    id       = "leveling-a08-darkshore",
    title    = "Darkshore (20-21)",
    faction  = "Alliance",
    minLevel = 20, maxLevel = 21,
    next     = "leveling-a09-ashenvale-and-stonetalon-mountains",
    leftOut  = {
        [87760] = { kind = "detour", seconds = 180, xp = 1400 },
        [98042] = { kind = "detour", seconds = 60, xp = 1100 },
    },
    steps    = {
        { go = { 1439, 37.32, 43.64 }, text = "Travel to Auberdine", -- level 20
          note = "Darkshore: Auberdine, the port on the west coast." },
        { accept = 947 }, -- level 20
        { turnin = 3765 }, -- level 20
        { accept = 2139 }, -- level 20
        { accept = 986, -- level 20
          note = "The NPC is indoors." },
        { turnin = 97894 }, -- level 20
        { accept = 4763, -- level 20
          note = "The NPC is indoors." },
        { accept = 729 }, -- level 20
        { collect = { { 12347, 1 } }, spots = { { 1439, 37.82, 43.99 } }, useitem = 12346 }, -- level 20
        { accept = 1003 }, -- level 20
        { accept = 2098, sticky = 2098 }, -- level 20
        { complete = 2098, -- level 20
          note = "Fight the murlocs. Your targets sit below the water's surface." },
        { complete = 2098, sticky = 986, -- level 21
          note = "Hunt the crabs." },
        { complete = 2098, -- level 21
          note = "Big birds that roam on foot." },
        { complete = 986, -- level 21
          note = "Kill black-furred tigers." },
        { accept = 98013 }, -- level 21
        { turnin = 2098, sticky = 947 }, -- level 21
        { complete = 98013 }, -- level 21
        { complete = 6122, useitem = 15844, races = { "NightElf", "Skyborne" }, classes = { "DRUID" }, -- level 21
          note = "The spot is at the cave's mouth." },
        { go = { 1439, 55.01, 33.34 }, text = "Go into the cavern" }, -- level 21
        { complete = 947, -- level 21
          note = "Look for the brown fungi. Climb to the cave's upper level. Extra ones are below, in the side chambers." },
        { complete = 947, -- level 21
          note = "Gather the blue-capped fungi. Your targets are within the cavern." },
        { go = { 1439, 55.01, 33.34 }, text = "Head out of the cave" }, -- level 21
        { collect = { { 12341, 1 } }, spots = { { 1439, 52.82, 33.42 } }, -- level 21
          note = "Expect a possible ambush while you gather it." },
        { go = { 1439, 52.37, 35.9 }, text = "Climb the trail" }, -- level 21
        { complete = 2139, -- level 21
          note = "Your objective lies in a little cavern." },
        { collect = { { 12342, 1 } }, spots = { { 1439, 50.73, 34.95 } }, -- level 21
          note = "Expect a possible ambush while you gather it." },
        { collect = { { 12343, 1 } }, spots = { { 1439, 51.87, 33.53 } }, -- level 21
          note = "Expect a possible ambush while you gather it." },
        { complete = 4763, useitem = 12347, -- level 21
          note = "It shows up a short way off. It shows up at your feet." },
        { turnin = 6122, when = { ready = 6122 }, races = { "NightElf", "Skyborne" }, classes = { "DRUID" }, -- level 21
          note = "The NPC is indoors." },
        { turnin = 4763, -- level 21
          note = "The NPC is indoors." },
        { turnin = 97926 }, -- level 21
        { destroy = { 12341, 12342, 12343, 12347 } }, -- level 21
        { turnin = 947, accept = 948 }, -- level 21
        { accept = 4740 }, -- level 22
        { turnin = 2139 }, -- level 22
        { turnin = 986, accept = 993, -- level 22
          note = "The NPC is indoors." },
        { turnin = 952, when = { log = 952 } }, -- level 22
        { turnin = 948, accept = 944, sticky = 1003 }, -- level 22
        { complete = 4740, -- level 22
          note = "Fight the murlocs. Murloc packs arrive at the waterside. The attackers rush the camp." },
        { accept = 4730 }, -- level 22
        { accept = 4731, -- level 22
          note = "Engage foes one at a time." },
        { accept = 4732, -- level 22
          note = "Engage foes one at a time." },
        { accept = 4733, sticky = 1003, -- level 22
          note = "Watch out, the landscape conceals some monsters. Avoid drawing several foes together." },
        { turnin = 729, -- level 22
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { accept = 731, noauto = 731, -- level 22
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears." },
        { complete = 731, sticky = 1003, when = { log = 731 }, -- level 22
          note = "Let the conversation play out. Stay with Prospector Remtravel and defend him. He is frail and goes down fast." },
        { complete = 944 }, -- level 22
        { turnin = 944, accept = 949, useitem = 5251, -- level 22
          note = "Look on top of the table." },
        { destroy = 5251 }, -- level 22
        { turnin = 949, accept = 950 }, -- level 22
        { accept = 945, noauto = 945, -- level 22
          note = "For this quest you guard an NPC on the move. If she is absent, wait for her to reappear." },
        { complete = 945, -- level 22
          note = "Let the conversation play out. Escort Therylune and defend her." },
        { accept = 968, useitem = 5352, when = { item = 5352 }, why = { continent = true, kind = "carry", quest = 968, seconds = 16800, xp = 2000 } }, -- level 22
        { turnin = 993, accept = 994, noauto = 994, -- level 22
          note = "For this quest you guard an NPC on the move. If the NPC is absent, stay until he reappears. Your objective lies in a little cavern." },
        { complete = 994, -- level 22
          note = "Let the conversation play out. Escort Volcor and defend him. Allow the foes to hit him before you join in." },
        { complete = 1003 }, -- level 22
        { turnin = 1003, object = 17185 }, -- level 22
        { turnin = 950 }, -- level 22
        { turnin = 98013 }, -- level 22
        { accept = 5321, noauto = 5321, -- level 22
          note = "For this quest you guard an NPC on the move. If it is not around, move on without it. It reappears only after a long wait." },
        { complete = 5321, when = { log = 5321 } }, -- level 22
        { complete = 5321, useitem = 13536, when = { log = 5321 }, -- level 22
          note = "Let the conversation play out. Keep Kerlonian Evershade safe while he trails behind you. Keep near him; he dozes off." },
        { turnin = 5321, when = { ready = 5321 }, -- level 22
          note = "The NPC is on the house's raised terrace." },
    },
})
