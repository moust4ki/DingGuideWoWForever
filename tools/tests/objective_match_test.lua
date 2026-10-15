-- A quest's objectives and DingDB's targets, matched by name, else by rank. In game
-- (15/10/2026, Thendal Grove, a French client): "Al'Aketh Thugs" had its brutes and neophytes
-- killed, Malduko Cloudcrush left; Forever's monsters have no French name in DingDB, the log
-- says "Néophyte al'aketh", and the arrow kept a farming loop on the neophytes already killed.
local tools = (arg[0]:match("^(.*)[/\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, D, AW = Ding.Engine, Ding.Data, Ding.Along

local THUGS = 92544
local BRUTE, NEOPHYTE, MALDUKO = 251145, 251448, 256935

Ding.RegisterGuide({ id = "t-thugs", title = "Thugs", steps = {
    { accept = THUGS },
    { complete = THUGS },
    { turnin = THUGS },
} })

-- The log as the French client writes it: brutes 6/6, neophytes 4/4, Malduko 0/1.
local function start()
    T.reset({ level = 5 })
    H.accept(THUGS)
    local entry = H.log()[THUGS]
    entry.objectives = { "Brute al'aketh", "Néophyte al'aketh", "Malduko Fracasse-nuage" }
    H.setObjective(THUGS, 1, 6, 6)
    H.setObjective(THUGS, 2, 4, 4)
    H.setObjective(THUGS, 3, 0, 1)
    E:SetGuide("t-thugs", 2, true)
    H.flush()
end

local function npcsOf(points)
    local set = {}
    for _, p in ipairs(points or {}) do if p.npc then set[p.npc] = true end end
    return set
end

T.test("premise: DingDB has no French name for these monsters", function()
    start()
    T.ok(not (Ding.Data:NpcName(NEOPHYTE) or ""):lower():find("néophyte", 1, true), "the premise no longer holds")
end)

T.test("the arrow leads to the monster left, not to those already killed", function()
    start()
    T.eq(E.index, 2)
    local npcs = npcsOf(E.candidates)
    T.ok(npcs[MALDUKO], "Malduko is not a target")
    T.ok(not npcs[NEOPHYTE] and not npcs[BRUTE], "a monster already killed is still a target")
end)

T.test("each objective of the log has its target, by rank when the name does not match", function()
    start()
    local targets = D:ObjectiveTargets(THUGS)
    local byTarget = D:MatchObjectives(targets, Ding.Compat.GetObjectives(THUGS))
    T.eq(byTarget[1], 1)
    T.eq(byTarget[2], 2)
    T.eq(byTarget[3], 3)
    T.ok(E:ObjectiveDone(THUGS, targets[2].name), "the neophytes not counted done")
    T.ok(not E:ObjectiveDone(THUGS, targets[3].name), "Malduko counted done")
    -- The objectives left (nameplate marks and counters): Malduko's only.
    local left = AW:Objectives(THUGS)
    T.eq(#left, 1)
    T.eq(left[1] and left[1].index, 3)
end)

T.test("a name in the text still wins over the rank", function()
    T.reset({ level = 5 })
    H.accept(THUGS)
    -- The client lists Malduko first; the English names match the text.
    local entry = H.log()[THUGS]
    entry.objectives = { "Malduko Cloudcrush", "Al'Aketh Brute", "Al'Aketh Neophyte" }
    local byTarget = D:MatchObjectives(D:ObjectiveTargets(THUGS), Ding.Compat.GetObjectives(THUGS))
    T.eq(byTarget[1], 2)
    T.eq(byTarget[2], 3)
    T.eq(byTarget[3], 1)
end)

T.run()
