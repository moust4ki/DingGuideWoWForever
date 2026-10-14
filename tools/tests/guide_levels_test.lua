-- The guides written by tools/draft_guide.lua never send the player to a quest or to
-- monsters too far above their level (Yendi's rule, 12/10/2026), nor into a dungeon outside
-- a step tagged for it (route_data.lua questDungeon): each step carries the
-- simulated level (comment "-- level N"); every quest it accepts has a quest level at most
-- N + questAbove (2) and a required level at most N; the monsters of every quest it works
-- on are at most N + mobAbove (1), average of their level range, in at least one of their
-- spawns in the guide's zones (route_model.lua PARAMS).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local X = dofile(tools .. "/questiedb_export.lua")
local Model = dofile(tools .. "/route_model.lua")
local RouteData = dofile(tools .. "/route_data.lua")
local QK = X.QUEST
local db = X.loadCorrected(T.combined)
local D = RouteData.new(db, T.combined)
local QUEST_ABOVE, MOB_ABOVE = Model.PARAMS.questAbove, Model.PARAMS.mobAbove

-- Guides of every route (tools/routes/*.lua), and the sections of Ding - Leveling
-- (tools/routes/leveling/*.lua): their route steps are kept as written; the caps
-- hold for the quests tools/write_leveling.lua adds (g.base: quests of the
-- route's own section).
local ROUTES = { "human", "dwarf_gnome", "nightelf", "alliance", "orc_troll", "tauren", "undead", "horde",
    "skyborne_alliance", "skyborne_horde" }
local guides = {}
for _, name in ipairs(ROUTES) do
    local route = dofile(tools .. "/routes/" .. name .. ".lua")
    for _, g in ipairs(route.guides) do guides[#guides + 1] = g end
end
for _, name in ipairs({ "alliance", "horde" }) do
    local route = dofile(tools .. "/routes/leveling/" .. name .. ".lua")
    -- The faction's base quests (a repair may move one to another section) and the
    -- prerequisites Forever gives them (done right before, to keep the route step).
    local base = {}
    local function trust(q)
        if base[q] then return end
        base[q] = true
        local quest = db.Quest[q]
        for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
            for _, p in ipairs(quest and quest[key] or {}) do
                if p > 0 then trust(p) end
            end
        end
    end
    for _, s in ipairs(route.sections) do
        for _, step in ipairs(s.steps) do
            for _, k in ipairs({ "accept", "complete", "turnin" }) do
                local v = step[k]
                for _, q in ipairs(type(v) == "table" and v or { v }) do trust(q) end
            end
        end
    end
    for _, s in ipairs(route.sections) do
        local maps = {}
        for _, m in ipairs(s.uiMaps or {}) do maps[m] = true end
        guides[#guides + 1] = { file = ("Leveling/%s/%s.lua"):format(route.faction, s.id:match("^leveling%-%a(%d+)")),
            maps = maps, base = base }
    end
end

-- { { line, level, accepts = { ids }, completes = { ids }, levelStep }, ... } for a guide file.
local function steps(path)
    local out = {}
    local n = 0
    local function ids(line, key)
        local list = {}
        local value = line:match(key .. " = (%b{})") or line:match(key .. " = (%d+)")
        for id in (value or ""):gmatch("%d+") do list[#list + 1] = tonumber(id) end
        return list
    end
    for line in io.lines(path) do
        n = n + 1
        if line:match("^%s+{ ") then
            out[#out + 1] = { line = n, level = tonumber(line:match("%-%- level (%d+)%s*$")),
                accepts = ids(line, "accept"), completes = ids(line, "complete"), turnins = ids(line, "turnin"),
                levelStep = line:match("{ level = ") ~= nil, dungeon = line:match("dungeon = ") ~= nil }
        end
    end
    return out
end

local function mapsOf(g)
    if g.maps then return g.maps end
    local maps = {}
    for _, area in ipairs(g.areas or {}) do
        local map = D.areaToMap[area]
        if map then maps[map] = true end
    end
    return maps
end

T.test("every step of the generated guides carries its simulated level", function()
    for _, g in ipairs(guides) do
        for _, step in ipairs(steps(tools .. "/../Ding/Guides/" .. g.file)) do
            T.ok(step.level or step.levelStep, ("%s, line %d: simulated level missing"):format(g.file, step.line))
        end
    end
end)

T.test("no quest accepted above the simulated level + questAbove, nor above its required level", function()
    local bad, checked = {}, 0
    for _, g in ipairs(guides) do
        for _, step in ipairs(steps(tools .. "/../Ding/Guides/" .. g.file)) do
            for _, q in ipairs(step.accepts) do
                local quest = db.Quest[q]
                T.ok(quest, ("%s, line %d: unknown quest %d"):format(g.file, step.line, q))
                if not (g.base and g.base[q]) then
                    local qLevel, req = quest[QK.questLevel] or 0, quest[QK.requiredLevel] or 0
                    checked = checked + 1
                    if qLevel > step.level + QUEST_ABOVE then
                        bad[#bad + 1] = ("%s, line %d: quest %d of level %d accepted at level %d"):format(g.file,
                            step.line, q, qLevel, step.level)
                    end
                    if req > step.level then
                        bad[#bad + 1] = ("%s, line %d: quest %d requires level %d, accepted at level %d"):format(
                            g.file, step.line, q, req, step.level)
                    end
                end
            end
        end
    end
    T.ok(checked > 300, "quests checked: " .. checked)
    T.ok(#bad == 0, table.concat(bad, "\n        "))
end)

T.test("no monsters above the simulated level + mobAbove", function()
    local bad, checked = {}, 0
    for _, g in ipairs(guides) do
        local maps = mapsOf(g)
        for _, step in ipairs(steps(tools .. "/../Ding/Guides/" .. g.file)) do
            for _, q in ipairs(step.completes) do
                local quest = not (g.base and g.base[q]) and db.Quest[q]
                local jobs = quest and D.questJobs(q, quest, maps) or {}
                for _, job in ipairs(jobs) do
                    -- The weakest of the monsters met in the zone: the player picks them.
                    local low
                    for _, p in ipairs(job.kind == "kill" and job.points or {}) do
                        if p.mobLevel and (not low or p.mobLevel < low) then low = p.mobLevel end
                    end
                    if low then
                        checked = checked + 1
                        if Model.monsterLevel(low) > step.level + MOB_ABOVE then
                            bad[#bad + 1] = ("%s, line %d: quest %d, monsters of level %d at level %d"):format(g.file,
                                step.line, q, Model.monsterLevel(low), step.level)
                        end
                    end
                end
            end
        end
    end
    T.ok(checked > 300, "objectives checked: " .. checked)
    T.ok(#bad == 0, table.concat(bad, "\n        "))
end)

T.test("dungeon quests only on steps tagged with their dungeon", function()
    local bad = {}
    for _, g in ipairs(guides) do
        for _, step in ipairs(steps(tools .. "/../Ding/Guides/" .. g.file)) do
            if not step.dungeon then
                for _, list in ipairs({ step.accepts, step.completes, step.turnins }) do
                    for _, q in ipairs(list) do
                        local dungeon = db.Quest[q] and D.questDungeon(db.Quest[q])
                        if dungeon then
                            bad[#bad + 1] = ("%s, line %d: quest %d is done in %s"):format(g.file, step.line, q, dungeon)
                        end
                    end
                end
            end
        end
    end
    T.ok(#bad == 0, table.concat(bad, "\n        "))
end)

T.run()
