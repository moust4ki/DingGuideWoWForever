-- In game (13/10/2026, the same Dwarf hunter, v1.4.0 candidate): Duskwood finished, the guide
-- went on to "Wetlands (27-29)" while the hunter stood in Darkshire at level 27. The Wetlands
-- had been done at level 24 with another guide: from those quests alone, Ding took the hunter
-- for step 73 and kept passing what the route still had to do there (resumeTo 73 saved). Going
-- back one step, the window listed "The Cursed Crew" (an old quest of the log, 0/13) in red
-- under a step done, as if its objectives were that step's; the weapon reminder looked like a
-- step's work too.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local GUIDE = "leveling-a12-wetlands"
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { GUIDE }, locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, L = Ding.Engine, Ding.Panel, Ding.L

local CURSED_CREW, DOOMED_FLEET, DUN_MODR = 289, 270, 472

local function stepOf(match)
    for i, step in ipairs(Ding:GetGuide(GUIDE).steps) do
        if match(step) then return i end
    end
    error("no such step in " .. GUIDE)
end
local function has(v, id)
    if type(v) == "table" then for _, x in ipairs(v) do if x == id then return true end end return false end
    return v == id
end
local FLEET = stepOf(function(s) return has(s.turnin, DOOMED_FLEET) end)       -- Menethil, the Doomed Fleet
local INN = stepOf(function(s) return s.sethearth end)                         -- the inn of Menethil
local MODR = stepOf(function(s) return has(s.accept, DUN_MODR) end)            -- Fall of Dun Modr
local HOVELS = stepOf(function(s) return has(s.sticky, CURSED_CREW) end)       -- makes the Cursed Crew sticky
local CREW = stepOf(function(s) return has(s.complete, CURSED_CREW) end)       -- complete the Cursed Crew
local APPRENTICE = stepOf(function(s) return has(s.complete, 471) end)         -- complete Apprentice's Duties

-- The hunter in Darkshire, at the end of Duskwood: the Wetlands done at level 24 (another
-- guide), some of their quests still in the log; the Doomed Fleet (elite) taken in Duskwood.
local function arrive()
    T.reset({ level = 27, race = "Dwarf", class = "HUNTER" })
    Ding.db.panel.shown = true
    Ding.db.ui.elites = true
    Ding.char.sticky = nil
    H.player.map, H.player.x, H.player.y = 1431, 74, 44
    for _, q in ipairs({ 279, 281, 284, 285, 288, 276, 277, 295, 296, 299, 484 }) do H.setQuest(q, "turnedin") end
    for _, q in ipairs({ CURSED_CREW, 471, 275, 98245, 286, DOOMED_FLEET }) do H.accept(q) end
    H.player.level = 27
    H.fire("QUEST_LOG_UPDATE"); H.flush()
    -- Duskwood finished: the guide chains to the Wetlands' first step.
    E:SetGuide(GUIDE, 1, true); H.flush()
    H.tick(11)
end

local function rowsOf(q)
    local out = {}
    for _, row in ipairs(P.rowsShown or {}) do
        if row.quest == q and not row.preview then out[#out + 1] = row end
    end
    return out
end

T.test("a zone done earlier in another guide: never taken further than the character was", function()
    arrive()
    T.eq(E.index, FLEET, "the first step still to do: the Doomed Fleet in Menethil")
    -- The section taken up again (another pack and back, the guide list, /ding guide).
    E:Resume(GUIDE, true); H.flush()
    T.eq(E.index, FLEET)
    T.eq(E.resumeTo, nil, "a resume runs into the Wetlands on old quests")
    -- "Take this guide up where I am": the first step still to do too.
    E:Reset(); H.flush()
    T.eq(E.index, FLEET)
    T.eq(E.resumeTo, nil)
    -- In Menethil: the inn, then the quests of the route still to take, one after the other.
    H.turnin(DOOMED_FLEET); H.flush()
    T.eq(E.index, INN, "the inn and the quests after it passed on the quests of another guide")
    H.tick(2)
    E:Next(); H.flush()
    T.eq(E.index, MODR, "Fall of Dun Modr passed on the quests of another guide")
end)

T.test("the game's saved state (step 14, resuming to step 73) is dropped at login", function()
    arrive()
    E:SetGuide(GUIDE, CREW, true); H.flush()
    Ding.char.step, Ding.char.resumeTo = CREW, { guide = GUIDE, step = 73 }
    Ding.char.lastStep[GUIDE], Ding.char.layout = 73, nil
    Ding.MigrateChar(Ding.char)
    E.guide, E.resumeTo = nil, nil
    E:Start(); H.flush()
    T.eq(E.index, CREW)
    T.eq(E.resumeTo, nil, "still resuming towards step 73")
    T.eq(Ding.char.lastStep[GUIDE], CREW)
end)

T.test("\"previous\": a step done shows its own rows, not another quest's in red", function()
    arrive()
    E:SetGuide(GUIDE, CREW, true); H.flush()
    -- On its own step, the Cursed Crew's objectives are the step's: to do.
    local own = rowsOf(CURSED_CREW)
    T.ok(#own > 0, "the step's rows are missing")
    for _, row in ipairs(own) do T.ok(not row.along and not row.sticky, "the step's own objectives said as another quest's") end
    E:Prev(); H.flush()
    T.eq(E.index, HOVELS)
    T.eq(#rowsOf(CURSED_CREW), 0, "the Cursed Crew listed in red under the step gone back to")
    for _, row in ipairs(P.rowsShown) do
        if not row.preview and row.ofStep and row.quest then T.eq(row.state, "done", H.plain(row.text)) end
    end
end)

T.test("the step before the Cursed Crew's own does not list it as another quest", function()
    arrive()
    E:SetGuide(GUIDE, CREW, true); H.flush()
    -- The step that makes it sticky, shown as the guide's step: its own comes right after.
    E.index = HOVELS; E:Refresh(); H.flush()
    T.ok(E:NextSteps(1)[1] == E.guide.steps[CREW], "premise: the Cursed Crew's step comes next")
    T.eq(#rowsOf(CURSED_CREW), 0, "listed as another quest under the step before its own")
end)

-- "Ormer's Revenge" (in game): asked to turn it in without its raptor's talon. Turning in the
-- first part, its sequel came a moment later from the same NPC; the resume running (to step 73)
-- had already passed the step that takes it and the one that completes it.
local ORMER, ORMER_2, PAST = 295, 296, 299
local TAKE_2 = stepOf(function(s) return has(s.accept, ORMER_2) end)
local TALON = stepOf(function(s) return has(s.complete, ORMER_2) end)
local TURNIN_2 = stepOf(function(s) return has(s.turnin, ORMER_2) end)

-- The hunter at level 28 in the Wetlands, the Ormer quests and the fragments not done yet, no
-- other quest of the log with work left before them.
local function ormer()
    arrive()
    H.player.level = 28
    for _, q in ipairs({ ORMER, ORMER_2, PAST, CURSED_CREW, 471, DOOMED_FLEET }) do H.setQuest(q, nil) end
    H.setQuest(DOOMED_FLEET, "turnedin")
    H.fire("QUEST_LOG_UPDATE"); H.flush()
end

T.test("Ormer's Revenge: the sequel taken a moment after the turn-in is not passed", function()
    ormer()
    H.accept(ORMER); H.complete(ORMER); H.accept(PAST); H.flush()
    -- The section taken up again, the character had been further (a resume up to step 73).
    Ding.char.lastStep[GUIDE] = 73
    E:Resume(GUIDE, true); H.flush()
    H.tick(11)
    T.eq(E.index, TAKE_2, "premise: the resume stops on the turn-in of the first part")
    H.turnin(ORMER); H.flush()
    T.eq(E.index, TAKE_2, "the step that takes the sequel passed before it is taken")
    H.accept(ORMER_2); H.flush()
    T.eq(E.index, TALON, "the raptor's talon passed")
end)

T.test("Ormer's Revenge in the log without its talon: complete it first, never a bare turn-in", function()
    ormer()
    H.setQuest(ORMER, "turnedin")
    H.accept(ORMER_2); H.flush()
    E:SetGuide(GUIDE, TURNIN_2, true); H.flush()
    H.tick(11)
    T.eq(E.index, TURNIN_2)
    local lines = E:Describe(E:CurrentStep())
    T.eq(lines[1].action, "complete", "the turn-in comes before the quest's objectives")
    T.eq(lines[1].quest, ORMER_2)
    local rows = rowsOf(ORMER_2)
    T.ok(rows[1] and rows[1].action == "objective" and rows[1].state == "todo", "the talon is not listed to do")
    -- The arrow goes to the raptor, not to Ormer.
    local ormer = Ding.Data:EndPoints(ORMER_2)[1]
    T.ok(#E.candidates > 0, "no target")
    for _, p in ipairs(E.candidates) do
        T.ok(not (p.map == ormer.map and p.x == ormer.x and p.y == ormer.y), "the arrow goes to the turn-in")
    end
    -- The next steps preview says so too, from the fragments' step.
    Ding.db.panel.preview = 3
    E:SetGuide(GUIDE, TURNIN_2 - 2, true); H.flush()
    local said
    for _, row in ipairs(P.rowsShown) do
        if row.preview and H.plain(row.text):find(Ding.Data:QuestName(ORMER_2), 1, true) then said = H.plain(row.text) end
    end
    T.ok(said and said:find(L.ROW_COMPLETE:match("^(.-)%%s"), 1, true) == 1, "the preview says turn in: " .. tostring(said))
end)

-- In game (14/10/2026, an Alliance character of level 28): the guide said to accept Carnage
-- (98283, a Forever quest) from Rethiel the Greenwarden, who only had Blisters on the Land
-- (275, in progress) to offer. Carnage is the fifth quest of his series, after Blisters on the
-- Land, and an elite quest; QuestieDB knew neither (tools/data/corrections/20_forever_quests.lua).
T.test("Carnage: after Blisters on the Land is turned in, behind the elite option", function()
    local CARNAGE, BLISTERS, CARNAGE_NPC = 98283, 275, 271336
    local single = Ding.Data:QuestPrereqs(CARNAGE)
    T.eq(single and table.concat(single, ","), tostring(BLISTERS), "DingDB: Carnage needs Blisters on the Land")
    local DB = Ding.DB
    T.eq(DB.npcs[CARNAGE_NPC][DB.LAYOUT.Npc.rank], 1, "DingDB: Carnage is an elite")
    local turnedIn = stepOf(function(s) return has(s.turnin, BLISTERS) end)
    local seen = 0
    for i, step in ipairs(Ding:GetGuide(GUIDE).steps) do
        if has(step.accept, CARNAGE) or has(step.complete, CARNAGE) or has(step.turnin, CARNAGE) then
            seen = seen + 1
            T.ok(i > turnedIn, ("step %d works on Carnage before Blisters on the Land is turned in (step %d)"):format(i, turnedIn))
            T.eq(step.elite, true, "step " .. i .. ": Carnage is an elite quest")
        end
    end
    T.eq(seen, 3, "accepted, done and turned in")
end)

T.test("further on, the Cursed Crew is said as another quest of the log", function()
    arrive()
    E:SetGuide(GUIDE, APPRENTICE, true); H.flush()
    local header
    for _, row in ipairs(rowsOf(CURSED_CREW)) do
        if row.action == "header" and row.other == "sticky" then header = row end
    end
    T.ok(header, "the Cursed Crew is not kept on screen under its header")
    local text = H.plain(header.text)
    T.ok(text:find(L.OTHER_STICKY:match("^(.-)%%s"), 1, true), "not said as another quest: " .. text)
    T.ok(text:find(Ding.Data:QuestName(CURSED_CREW), 1, true), "its quest is not named: " .. text)
    for _, row in ipairs(rowsOf(CURSED_CREW)) do
        if row.action == "objective" then T.eq(row.state, "other", "another quest's objective in the step's red") end
    end
end)

T.run()
