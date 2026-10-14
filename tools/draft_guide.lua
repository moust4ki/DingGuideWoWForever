-- Drafts Ding guides from a route file and the QuestieDB Forever export.
-- usage: lua5.1 tools/draft_guide.lua <combined dir> <route.lua> [options]
--   --out <dir>        where guide files are written (default: Ding/Guides, translations in
--                      Ding/Locales/Guides/<locale>; with --out: <dir>/Locales/<locale>), one
--                      translation per dictionary of tools/routes/locales
--   --report           before/after table of each guide: distance, time, XP, XP per hour,
--                      quests left out by the optimizer and why
--   --trace            every action of each tour, and the quests left out at selection
--   --iterations <n>   local search moves per guide (default: route_solver.lua)
--   --greedy           no optimization: the nearest-first tour of earlier versions
--   --quest-above <n>  quests at most n levels above the simulated player (default:
--                      route_model.lua PARAMS.questAbove)
--   --mob-above <n>    objective monsters at most n levels above the player (PARAMS.mobAbove)
--   --grind-stop <s>   seconds of grinding stops inside a guide, at most, for a quest a later
--                      guide needs (PARAMS.maxGrindStop)
--   --fit              each guide starts at the level the previous one reached (not at its
--                      minLevel) and ends without a level step; prints the level windows
--                      that chain without grinding (tools/fit_windows.lua writes them
--                      into the route)
--   --dry-run          writes no file: simulation and reports only
--
-- A route (tools/routes/*.lua) lists the guides of one track in order: zone, level window,
-- quests to add or leave out, and our notes. For each guide the tool picks the quests of
-- the zone that the track's races can do solo (selection), builds a first tour the way a
-- player would (always the nearest thing to do), then improves it with tools/route_solver.lua
-- for XP per hour, under the rules of the game (prerequisites, exclusive quests, required
-- levels, quest log). Times and XP come from tools/route_model.lua.
-- The resulting order is written as Ding steps. Nothing from QuestieDB is copied: the guide
-- holds quest ids and our notes only, names and places come from QuestieDB in game.
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local X = dofile(here .. "/questiedb_export.lua")
local Model = dofile(here .. "/route_model.lua")
local RouteData = dofile(here .. "/route_data.lua")
local Solver = dofile(here .. "/route_solver.lua")
local Texts = dofile(here .. "/guide_texts.lua")
local Travel = dofile(here .. "/route_travel.lua")
local Work = dofile(here .. "/route_work.lua")
local QK = X.QUEST

local COMBINED, ROUTE, OUT, REPORT, TRACE, ITERATIONS, GREEDY, QUEST_ABOVE, MOB_ABOVE, FIT, DRY, GRIND_STOP
do
    local i = 1
    while i <= #arg do
        local a = arg[i]
        if a == "--out" then
            i = i + 1
            OUT = arg[i]
        elseif a == "--report" then
            REPORT = true
        elseif a == "--trace" then
            TRACE = true
        elseif a == "--iterations" then
            i = i + 1
            ITERATIONS = tonumber(arg[i])
        elseif a == "--greedy" then
            GREEDY = true
        elseif a == "--quest-above" then
            i = i + 1
            QUEST_ABOVE = tonumber(arg[i])
        elseif a == "--mob-above" then
            i = i + 1
            MOB_ABOVE = tonumber(arg[i])
        elseif a == "--fit" then
            FIT = true
        elseif a == "--dry-run" then
            DRY = true
        elseif a == "--grind-stop" then
            i = i + 1
            GRIND_STOP = tonumber(arg[i])
        elseif not COMBINED then
            COMBINED = a
        else
            ROUTE = a
        end
        i = i + 1
    end
end
if not COMBINED or not ROUTE then
    io.stderr:write("usage: lua5.1 tools/draft_guide.lua <combined dir> <route.lua> [--out <dir>]"
        .. " [--report] [--trace] [--iterations <n>] [--greedy] [--quest-above <n>] [--mob-above <n>]"
        .. " [--grind-stop <s>] [--fit] [--dry-run]\n")
    os.exit(2)
end
local OUT_LOCALES = OUT and (OUT .. "/Locales")
OUT = OUT or (root .. "/Ding/Guides")

local db = X.loadCorrected(COMBINED)
local ok, D = pcall(RouteData.new, db, COMBINED)
if not ok then
    io.stderr:write(tostring(D) .. "\n")
    os.exit(2)
end
if not D.geometry then
    io.stderr:write("Map geometry not found (QuestieDB's data/Forever/conversion.json):"
        .. " distances are approximate.\n")
end
local route = dofile(ROUTE)

---------------------------------------------------------------------------
-- Tuning
---------------------------------------------------------------------------
local LOG_LIMIT = route.logLimit or 18  -- keep room under the client's 20
local NEAR = 100         -- yards: turn-ins and accepts this close share a step
local MERGE_WORK = 250   -- yards: consecutive objective areas this close share a step
local HUB_RADIUS = 60    -- yards: radius of a guide's hub (where most of its quests start)
local DEFER_RADIUS = 3500 -- yards: a quest too high waits for the next guide when it starts this close

---------------------------------------------------------------------------
-- Route state shared by the whole track
---------------------------------------------------------------------------
local raceBits = {}
for _, race in ipairs(route.races) do
    if X.RACE_BITS[race] then
        raceBits[#raceBits + 1] = X.RACE_BITS[race]
    else
        -- A race found on both sides (Skyborne): on a route without a side, only the quests
        -- open to both.
        local bits = assert(X.RACE_FACTION_BITS[race], "unknown race: " .. tostring(race))
        for _, side in ipairs(route.faction and { route.faction } or { "Alliance", "Horde" }) do
            raceBits[#raceBits + 1] = bits[side]
        end
    end
end

local FACTION = route.faction or "Alliance"
-- Classes a quest of the route is for, when not every class: { [questId] = { class = true } }.
local questClasses = {}

local state = {
    level = route.startLevel or 1, xp = 0,
    log = {}, logSize = 0, done = {}, taken = {},
    pos = nil,
    bind = nil, hearthLeft = 0,   -- inn of the hearthstone { at, name }, seconds before it is ready
    known = {},                   -- zones whose flight masters the player knows
}
-- Flight masters known from the start: the faction's capitals, and the zones the route says
-- (route.knownAreas: those of the race tracks before a trunk). Then each guide's zones.
local CAPITALS = { Alliance = { 1519, 1537 }, Horde = { 1637, 1638, 1497 } }
for _, area in ipairs(CAPITALS[FACTION] or {}) do state.known[area] = true end
for _, area in ipairs(route.knownAreas or {}) do state.known[area] = true end

local function levelLabel(level, xp)
    level, xp = level or state.level, xp or state.xp
    local need = Model.XP_TO_LEVEL[level]
    return need and string.format("%d (%d%%)", level, math.floor(100 * xp / need)) or tostring(level)
end

-- Level and XP as one number: 16.5 is level 16 and half of the XP to 17.
local function levelNumber(level, xp)
    local need = Model.XP_TO_LEVEL[level]
    return level + (need and xp / need or 0)
end

local function asSet(list)
    local set = {}
    for _, v in ipairs(list or {}) do set[v] = true end
    return set
end

local function sortedKeys(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys)
    return keys
end

-- XP of a quest done outside the optimizer (hand-written guides played first), with the
-- same margin as the optimizer's.
local function questGain(q, quest)
    local margin = Model.PARAMS.killXPMargin
    local base, estimated = D.questXP(q, quest)
    local xp = Model.questXP(base, quest[QK.questLevel] or 0, state.level) * (estimated and margin or 1)
    for _, job in ipairs((D.questJobs(q, quest, nil))) do
        if job.kind == "kill" then xp = xp + job.count * Model.mobXP(job.mobLevel or state.level, state.level) * margin end
    end
    return xp
end

local function replayPrior(path)
    local saved = _G.Ding
    _G.Ding = { RegisterGuide = function(def)
        for _, step in ipairs(def.steps) do
            local function each(v, fn)
                if type(v) == "number" then fn(v) elseif type(v) == "table" then for _, q in ipairs(v) do fn(q) end end
            end
            each(step.turnin, function(q)
                if state.log[q] then state.log[q] = nil; state.logSize = state.logSize - 1 end
                state.done[q] = true
                local quest = db.Quest[q]
                if quest then state.level, state.xp = Model.addXP(state.level, state.xp, questGain(q, quest)) end
            end)
            each(step.accept, function(q)
                if not state.log[q] and not state.done[q] then
                    state.log[q] = { carried = true }
                    state.logSize = state.logSize + 1
                    state.taken[q] = true
                end
            end)
        end
    end }
    dofile(path)
    _G.Ding = saved
end

---------------------------------------------------------------------------
-- Quest selection for one guide
---------------------------------------------------------------------------
local function inBox(p, box)
    if not box then return true end
    return p.map == box[1] and p.px >= box[2] and p.px <= box[4] and p.py >= box[3] and p.py <= box[5]
end

local function openToTrack(quest)
    for _, bit in ipairs(raceBits) do
        if not X.raceAllowed(quest, bit) then return false end
    end
    return true
end

local function mapSet(areas, out)
    out = out or {}
    for _, area in ipairs(areas or {}) do
        local map = D.areaToMap[area]
        if map then out[map] = true end
    end
    return out
end

-- Every map of this guide and of the guides after it: a quest may be turned in later.
local function mapsFrom(index)
    local maps = {}
    for i = index, math.min(#route.guides, index + (route.carry or 1)) do
        mapSet(route.guides[i].areas, maps)
        mapSet(route.guides[i].extraAreas, maps)
    end
    return maps
end

local rejected = {}

-- Quests of guide `index` worth considering. dry: ignore the route state (what was done
-- before) and record nothing; used to find the chains later guides follow.
local function selectQuests(index, dry)
    local g = route.guides[index]
    local function reject(q, why)
        if not dry then rejected[#rejected + 1] = { q = q, why = why, guide = g.id } end
    end
    -- Quests start and are worked on the guide's own zones; extraAreas (towns) only end them.
    local maps = mapSet(g.areas)
    local laterMaps = mapsFrom(index)
    local include, exclude = asSet(g.include), asSet(g.exclude)
    -- (The quests of the guide's way out stay out of the tour.)
    for _, s in ipairs(g.finish or {}) do
        for _, k in ipairs({ "accept", "turnin", "complete" }) do
            for _, q in ipairs(type(s[k]) == "table" and s[k] or { s[k] }) do exclude[q] = true end
        end
    end
    for _, q in ipairs(route.exclude or {}) do exclude[q] = true end
    -- A player at the guide's top level may still take a quest questAbove levels higher.
    -- --fit looks for that top level: only the levels the player reaches limit the quests.
    local maxQuest = g.maxQuestLevel or (FIT and Model.MAX_LEVEL)
        or (g.maxLevel + (QUEST_ABOVE or Model.PARAMS.questAbove))
    local minQuest = g.minQuestLevel or (g.minLevel - 5)
    -- areaMinQuestLevel = { [areaId] = level }: a zone of the guide shared with an earlier
    -- route (the Barrens of the Horde tracks) keeps only its quests from that level on.
    local areaMin = g.areaMinQuestLevel or {}
    -- The level from which a quest counts there: that of its zone, or of a zone where it
    -- starts (a quest filed under a dungeon or under no zone, given in the Barrens).
    local function startMin(quest, zone)
        local min = areaMin[zone] or 0
        if next(areaMin) then
            local givers = quest[QK.startedBy] or {}
            for k, rows in ipairs({ db.Npc, db.Object }) do
                local field = k == 1 and X.NPC.spawns or X.OBJECT.spawns
                for _, id in ipairs(givers[k] or {}) do
                    local spawns = rows[id] and rows[id][field]
                    for area in pairs(type(spawns) == "table" and spawns or {}) do
                        min = math.max(min, areaMin[area] or 0)
                    end
                end
            end
        end
        return min
    end
    local zoneSet = asSet(g.areas)
    local selected, low = {}, {}

    for _, q in ipairs(sortedKeys(db.Quest)) do
        local quest = db.Quest[q]
        local forced = include[q]
        local why
        local qLevel = quest[QK.questLevel] or 0
        local zone = quest[QK.zoneOrSort] or 0
        local givers = quest[QK.startedBy] or {}
        local starts = D.giverPoints(givers, maps)
        local boxed = {}
        for _, p in ipairs(starts) do if inBox(p, g.box) then boxed[#boxed + 1] = p end end
        local itemStart
        if #boxed == 0 and X.hasEntries(givers[3]) then
            -- Started by an item: the monsters dropping it must be in the zone.
            for _, itemId in ipairs(givers[3]) do
                local item = db.Item[itemId]
                for _, npcId in ipairs(item and item[X.ITEM.npcDrops] or {}) do
                    for _, p in ipairs(D.npcPoints(npcId, maps)) do
                        if inBox(p, g.box) then
                            itemStart = itemStart or {}
                            itemStart[npcId] = true
                        end
                    end
                end
            end
        end
        local candidate = forced or ((#boxed > 0 or itemStart) and (zoneSet[zone] or zone == 0 or g.anyZone or #boxed > 0))
        local skip = not dry and (state.done[q] or state.taken[q])
        if candidate and not exclude[q] and not skip then
            local special = quest[QK.specialFlags] or 0
            local classMask = quest[QK.requiredClasses] or 0
            local classes = classMask ~= 0 and X.classesAllowed(classMask, FACTION) or nil
            -- (A Forever quest with no class data, given or ended by a class trainer.)
            if not classes and D.trainerClass(quest) then classes = { D.trainerClass(quest) } end
            if not openToTrack(quest) then
                why = "race"
            elseif classes and not forced and #classes < #X.FACTION_CLASSES[FACTION] - 1 then
                why = "class"
            elseif X.hasBit(special, 1) then
                why = "repeatable"
            elseif zone < 0 and zone ~= X.CAMPING and not forced then
                why = "category " .. zone
            elseif (quest[QK.parentQuest] or 0) ~= 0 then
                why = "subquest"
            elseif X.hasEntries(quest[QK.requiredSkill]) and not forced then
                why = "profession"
            elseif X.hasEntries(quest[QK.requiredMinRep]) and not forced then
                why = "reputation"
            elseif not forced and qLevel > maxQuest then
                why = "level " .. qLevel
            elseif (quest[QK.requiredLevel] or 0) > g.maxLevel and not forced and not FIT then
                why = "required level " .. quest[QK.requiredLevel]
            elseif not forced and D.questDungeon(quest) then
                -- (A dungeon quest is never part of the tour: at most a tagged extra.)
                why = "dungeon (" .. D.questDungeon(quest) .. ")"
            end
            local ends, jobs, killers, elite, unknown
            if not why then
                ends = D.giverPoints(quest[QK.finishedBy], laterMaps)
                jobs, killers, elite, unknown = D.questJobs(q, quest, maps)
                local rate = itemStart and #boxed == 0 and D.startDropRate(givers, maps)
                if #ends == 0 then
                    why = "turned in outside the route"
                elseif unknown and not forced then
                    why = "objective not found in the zone (" .. unknown .. ")"
                elseif elite and not forced and not g.elites then
                    why = "elite"
                elseif rate and rate < Model.PARAMS.minStartDropRate and not forced then
                    why = string.format("rare starting item (%.0f %%)", 100 * rate)
                end
            end
            if why then
                reject(q, why)
            else
                local info = {
                    id = q, quest = quest, starts = #boxed > 0 and boxed or starts, ends = ends,
                    jobs = jobs, killers = killers, itemStart = itemStart,
                    optional = itemStart ~= nil and #boxed == 0,
                    hasObjectives = #jobs > 0 or X.hasObjectives(quest),
                    forced = forced, classes = classes,
                }
                if not forced and qLevel > 0 and (qLevel < minQuest or qLevel < startMin(quest, zone)) then
                    low[q] = info
                    reject(q, "level " .. qLevel)
                else
                    selected[q] = info
                end
            end
        end
    end
    -- Low quests come back when they open a chain the guide follows.
    local changed = true
    while changed do
        changed = false
        for _, q in ipairs(sortedKeys(selected)) do
            local quest = selected[q].quest
            local single = quest[QK.preQuestSingle]
            local need = {}
            if X.hasEntries(single) then
                local met = false
                for _, p in ipairs(single) do
                    if selected[p] or (not dry and (state.done[p] or state.taken[p])) then met = true end
                end
                if not met then
                    for _, p in ipairs(single) do if low[p] then need[#need + 1] = p; break end end
                end
            end
            for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                if p > 0 and low[p] and not selected[p] then need[#need + 1] = p end
            end
            for _, p in ipairs(need) do
                if not selected[p] then
                    selected[p] = low[p]
                    selected[p].forced = true
                    changed = true
                end
            end
        end
    end
    -- An item-started quest that opens a chain is part of the route, not a bonus.
    for _, q in ipairs(sortedKeys(selected)) do
        local quest = selected[q].quest
        for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
            for _, p in ipairs(quest[key] or {}) do
                if selected[p] and selected[p].optional then selected[p].optional = false end
            end
        end
    end
    return selected, maps
end

-- Quests that a later guide of the route needs done first: never dropped. Hub of each
-- guide: where most of its quests start (its town), the start of its tour.
local laterNeeds, hubs = {}, {}
do
    local needed = {}
    for index = #route.guides, 1, -1 do
        laterNeeds[index] = {}
        for q in pairs(needed) do laterNeeds[index][q] = true end
        local selected = selectQuests(index, true)
        local givers = {}
        for _, q in ipairs(sortedKeys(selected)) do
            for _, p in ipairs(selected[q].starts) do givers[#givers + 1] = p end
        end
        local hub = D.clusters(givers, HUB_RADIUS, 1)[1]
        hubs[index] = hub and hub.at
        for _, q in ipairs(sortedKeys(selected)) do
            local quest = selected[q].quest
            for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
                for _, p in ipairs(quest[key] or {}) do
                    if p > 0 then needed[p] = true end
                end
            end
        end
    end
end

---------------------------------------------------------------------------
-- Optimizer instance of one guide
---------------------------------------------------------------------------
local Jobs = Work.new(D)
local spots, workOptions = Jobs.spots, Jobs.workOptions

-- Binding the hearthstone at each inn of the guide's zones and towns: pseudo-quests of the
-- optimizer (route_solver.lua, `bind`), which keeps those that save time. Id: minus the
-- innkeeper's NPC id.
local function bindings(maps)
    local out = {}
    for _, inn in ipairs(D.innkeepers(FACTION)) do
        if maps[inn.point.map] then
            out[#out + 1] = { id = -inn.id, accept = { inn.point },
                bind = { at = inn.point, name = Travel.INNS[inn.id] or inn.name } }
        end
    end
    return out
end

local function buildInstance(index, selected, maps)
    local g = route.guides[index]
    local endMaps = {}
    for map in pairs(maps) do endMaps[map] = true end
    mapSet(g.extraAreas, endMaps)
    local level = state.level
    -- Trips: the faction's travel network, with the flight masters of the zones known so far.
    for _, area in ipairs(g.areas or {}) do state.known[area] = true end
    for _, area in ipairs(g.extraAreas or {}) do state.known[area] = true end
    local known = {}
    for area in pairs(state.known) do known[area] = true end
    local net = Travel.new(D, FACTION, { areas = known })
    local function trip(a, b, l) return net:travel(a, b, l) end
    local quests = {}
    local extraLog = 0
    local function base(q, quest)
        local xp, estimated = D.questXP(q, quest)
        return {
            id = q, xp = xp, xpEstimated = estimated, qLevel = quest[QK.questLevel] or 0,
            reqLevel = quest[QK.requiredLevel] or 0,
            single = quest[QK.preQuestSingle], group = quest[QK.preQuestGroup], exclusive = quest[QK.exclusiveTo],
        }
    end
    local function endsHere(quest, extraMaps)
        local ends = endMaps
        if extraMaps then
            ends = {}
            for map in pairs(endMaps) do ends[map] = true end
            for map in pairs(extraMaps) do ends[map] = true end
        end
        return spots(D.giverPoints(quest[QK.finishedBy], ends))
    end
    for _, q in ipairs(sortedKeys(selected)) do
        local info = selected[q]
        local item = base(q, info.quest)
        item.forced, item.optional = info.forced, info.optional
        item.pinned = info.forced or laterNeeds[index][q]
        item.itemStart, item.killers = info.itemStart, info.killers
        if not (info.itemStart and #info.starts == 0) then
            item.accept = spots(info.starts)
            item.itemStart = nil
        end
        if #info.jobs > 0 then
            item.work = workOptions(info.jobs, level, trip)
        elseif info.hasObjectives then
            item.work = { { time = 0, dist = 0, jobs = {} } }
        end
        item.turnin = endsHere(info.quest, info.endMaps)
        quests[#quests + 1] = item
    end
    for _, b in ipairs(bindings(endMaps)) do quests[#quests + 1] = b end
    -- Quests carried from an earlier guide: worked or turned in here when they can be.
    for _, q in ipairs(sortedKeys(state.log)) do
        local entry, quest = state.log[q], db.Quest[q]
        local turnin = quest and endsHere(quest)
        local jobs = quest and not entry.completed and D.questJobs(q, quest, maps) or {}
        if quest and (turnin or #jobs > 0) then
            local item = base(q, quest)
            item.inLog, item.pinned, item.optional = true, true, entry.optional
            item.completed = entry.completed or #jobs == 0
            if not item.completed then
                item.work = workOptions(jobs, level, trip)
                local _, killers = D.questJobs(q, quest, maps)
                item.killers = killers
            end
            item.turnin = turnin
            quests[#quests + 1] = item
        else
            extraLog = extraLog + 1
        end
    end
    local done, inLog = {}, {}
    for q in pairs(state.done) do done[q] = true end
    for q in pairs(state.log) do inLog[q] = true end
    -- The tour starts where the last one ended, or at the guide's hub (the trip from the
    -- last zone is in the intro, not in this tour).
    local pos = state.pos
    if g.start then
        pos = D.point(D.areaToMap[g.start[1]], g.start[2], g.start[3])
    elseif not pos or not endMaps[pos.map] then
        pos = hubs[index]
    end
    local nextStart = route.guides[index + 1] and route.guides[index + 1].start
    local finish = nextStart and D.point(D.areaToMap[nextStart[1]], nextStart[2], nextStart[3]) or hubs[index + 1]
    local inst = {
        quests = quests,
        start = { level = state.level, xp = state.xp, pos = pos, done = done, log = inLog, extraLog = extraLog,
            bind = state.bind, hearthReady = state.hearthLeft },
        finish = finish, targetLevel = g.maxLevel, maxLevel = g.maxLevel, logLimit = LOG_LIMIT,
        questAbove = QUEST_ABOVE, mobAbove = MOB_ABOVE, maxGrindStop = GRIND_STOP,
        travel = trip, shortWaits = route.multiZone,
    }
    return Solver.prepare(inst)
end

-- Minimum level of a guide of this route, or of another route of the same folder (the
-- next guide of a race track is the first of the shared trunk).
local guideMinLevels
local function guideMinLevel(id)
    if not guideMinLevels then
        guideMinLevels = {}
        local dir = ROUTE:match("^(.*)[/\\]") or "."
        local windows = package.config:sub(1, 1) == "\\"
        local list = io.popen(windows and ('dir /b "' .. dir:gsub("/", "\\") .. '"') or ("ls '" .. dir .. "'"))
        for name in list:lines() do
            if name:find("%.lua$") then
                local ok, other = pcall(dofile, dir .. "/" .. name)
                if ok and type(other) == "table" then
                    for _, og in ipairs(other.guides or {}) do guideMinLevels[og.id] = og.minLevel end
                end
            end
        end
        list:close()
        -- The Leveling routes' sections (tools/routes/leveling), where a race may join Ding - Leveling.
        local baseDir = root .. "/tools/routes/leveling"
        list = io.popen(windows and ('dir /b "' .. baseDir:gsub("/", "\\") .. '"') or ("ls '" .. baseDir .. "'"))
        for name in list:lines() do
            if name:find("%.lua$") then
                local ok, other = pcall(dofile, baseDir .. "/" .. name)
                if ok and type(other) == "table" then
                    for _, section in ipairs(other.sections or {}) do guideMinLevels[section.id] = section.minLevel end
                end
            end
        end
        list:close()
        for _, og in ipairs(route.guides) do guideMinLevels[og.id] = og.minLevel end
    end
    if type(id) == "table" then
        -- A next guide per faction: the lower of their levels.
        local low
        for _, v in pairs(id) do
            local l = guideMinLevels[v]
            if l and (not low or l < low) then low = l end
        end
        return low
    end
    return guideMinLevels[id]
end

-- Seed of a guide's search: from its id, so that each guide keeps its own sequence.
local function seedOf(id)
    local seed = route.seed or 1
    for i = 1, #id do seed = (seed * 31 + id:byte(i)) % 2147483647 end
    return seed
end

---------------------------------------------------------------------------
-- Steps
---------------------------------------------------------------------------
local RANK = { turnin = 1, accept = 2, complete = 3 }

local function near(a, b, limit)
    if not a or not b then return false end
    local d = Model.distance(a, b)
    return d ~= nil and d <= limit
end

-- classesOf(questId): sorted list of the classes a quest's steps are for, or nil (all).
-- mobAbove: objectives join a step only while their monsters stay within reach of the
-- step's level (its "-- level N" comment), as the optimizer saw them.
local function buildSteps(actions, classesOf, mobAbove)
    local steps = {}
    local cur, curAt, curRank, curIds
    local function close()
        if cur then steps[#steps + 1] = cur end
        cur, curAt, curRank, curIds = nil, nil, nil, nil
    end
    for _, a in ipairs(actions) do
        if a.kind == "level" then
            close()
            steps[#steps + 1] = { level = a.level }
        elseif a.kind == "hearth" then
            close()
            steps[#steps + 1] = { hearth = true, simLevel = a.level }
        elseif a.kind == "sethearth" then
            close()
            steps[#steps + 1] = { sethearth = a.name, simLevel = a.level }
        else
            local rank = RANK[a.kind]
            local limit = a.kind == "complete" and MERGE_WORK or NEAR
            local classes = classesOf and classesOf(a.q)
            local key = classes and table.concat(classes, " ") or ""
            local fits = cur and not a.optional and not cur.optional
                and (cur.classKey or "") == key
                and near(a.at, curAt, limit)
                and rank >= curRank and not curIds[a.q]
                and (a.kind ~= "complete" or curRank == 3 or not cur.accept)
            if a.kind == "complete" and cur and curRank ~= 3 then fits = false end
            if fits and a.kind == "complete" and a.monsters and a.monsters > cur.simLevel + mobAbove then fits = false end
            if not fits then
                close()
                cur, curAt, curRank, curIds = { at = a.at, time = a.t }, a.at, rank, {}
                if a.optional then cur.optional = true end
                cur.simLevel = a.level
                cur.classes, cur.classKey = classes, key
            end
            if a.kind == "accept" and not cur.accepts then
                cur.simLevel, cur.accepts = a.level, true
            end
            cur[a.kind] = cur[a.kind] or {}
            table.insert(cur[a.kind], a.q)
            curIds[a.q] = true
            curRank = rank
        end
    end
    close()
    return steps
end

---------------------------------------------------------------------------
-- Writer
---------------------------------------------------------------------------
local WINDOWS = package.config:sub(1, 1) == "\\"
local function ensureDir(path)
    if WINDOWS then
        os.execute('mkdir "' .. path:gsub("/", "\\") .. '" 2>nul')
    else
        os.execute("mkdir -p '" .. path:gsub("'", "'\\''") .. "'")
    end
end

local function quote(s)
    return (string.format("%q", s):gsub("\\\n", "\\n"))
end

local function idList(list)
    if #list == 1 then return tostring(list[1]) end
    return "{ " .. table.concat(list, ", ") .. " }"
end

local function duration(seconds)
    local minutes = math.floor(seconds / 60 + 0.5)
    if minutes < 60 then return minutes .. " min" end
    return string.format("%d h %02d", math.floor(minutes / 60), minutes % 60)
end

local function writeGuide(g, steps, summary)
    local lines = {}
    local function add(s) lines[#lines + 1] = s end
    for _, c in ipairs(g.comment or {}) do add("-- " .. c) end
    add("-- Drafted by tools/draft_guide.lua from tools/routes/" .. (route.file or "?") .. " and the QuestieDB")
    add("-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:")
    add("-- it is written again on each run. Quest ids only, names and places come from QuestieDB.")
    add("-- French text: Ding/Locales/Guides/frFR/" .. g.file .. ".")
    add("-- Simulated: " .. summary .. ".")
    add("Ding.RegisterGuide({")
    add(string.format("    id       = %s,", quote(g.id)))
    if route.pack then add(string.format("    pack     = %s,", quote(route.pack))) end
    add(string.format("    title    = %s,", quote(g.title)))
    -- (A route without a side, `neutral = true`, writes guides for both factions.)
    if not route.neutral then add(string.format("    faction  = %s,", quote(route.faction or "Alliance"))) end
    if g.races or route.guideRaces then
        local races = g.races or route.guideRaces
        local parts = {}
        for i, r in ipairs(races) do parts[i] = quote(r) end
        add("    races    = { " .. table.concat(parts, ", ") .. " },")
    end
    add(string.format("    minLevel = %d, maxLevel = %d,", g.minLevel, g.maxLevel))
    if type(g.next) == "table" then
        -- One next guide per faction, for a race that picks its side on the way.
        add(string.format("    next     = { Alliance = %s, Horde = %s },", quote(g.next.Alliance), quote(g.next.Horde)))
    elseif g.next then
        add(string.format("    next     = %s,", quote(g.next)))
    end
    add("    steps    = {")
    for _, step in ipairs(steps) do
        local parts = {}
        for _, key in ipairs({ "turnin", "accept", "complete" }) do
            if step[key] then parts[#parts + 1] = key .. " = " .. idList(step[key]) end
        end
        if step.go then parts[#parts + 1] = ("go = { %d, %s, %s }"):format(step.go[1], step.go[2], step.go[3]) end
        if step.level then parts[#parts + 1] = "level = " .. step.level end
        if step.optional then parts[#parts + 1] = "optional = true" end
        if step.classes then
            local names = {}
            for i, c in ipairs(step.classes) do names[i] = quote(c) end
            parts[#parts + 1] = "classes = { " .. table.concat(names, ", ") .. " }"
        end
        if step.deathskip then parts[#parts + 1] = "deathskip = true" end
        if step.dungeon then parts[#parts + 1] = "dungeon = " .. quote(step.dungeon) end
        if step.elite then parts[#parts + 1] = "elite = true" end
        if step.sethearth then parts[#parts + 1] = "sethearth = " .. quote(step.sethearth) end
        if step.hearth then parts[#parts + 1] = "hearth = true" end
        if step.train then parts[#parts + 1] = "train = true" end
        if step.text then parts[#parts + 1] = "text = " .. quote(step.text) end
        local line = "        { " .. table.concat(parts, ", ")
        -- Simulated level at the step's accepts (or its start): what it asks is not above.
        local level = step.simLevel and (" -- level " .. step.simLevel) or ""
        if step.note then
            add(line .. "," .. level)
            add("          note = " .. quote(step.note) .. " },")
        else
            add(line .. " }," .. level)
        end
    end
    add("    },")
    add("})")
    local path = OUT .. "/" .. g.file
    ensureDir(path:match("^(.*)/[^/]+$"))
    local f = assert(io.open(path, "w"))
    f:write(table.concat(lines, "\n"), "\n")
    f:close()
    return path
end

---------------------------------------------------------------------------
-- Notes from the route: by quest (first step with the quest), by step index, and per guide
---------------------------------------------------------------------------
-- Texts are English in the guide; each language translates them in its own dictionary,
-- tools/routes/locales/<locale>.lua (see tools/guide_texts.lua).
local AUTO_NOTES = {
    itemStart = "If the starting item dropped: use it from your bags.",
    level = "Finish the level on nearby monsters before moving on.",
}

local function addNote(step, text, before)
    if not step.note then
        step.note = text
    elseif before then
        step.note = text .. " " .. step.note
    else
        step.note = step.note .. " " .. text
    end
end

-- Intro of each zone (UiMapID -> text): that of the first guide of the routes listed in
-- route.zoneIntrosFrom (files of the route's folder) whose first area is the zone.
local ZONE_INTROS, BOXED_INTROS = {}, {}
for _, name in ipairs(route.zoneIntrosFrom or {}) do
    local dir = ROUTE:match("^(.*)[/\\]") or "."
    local other = dofile(dir .. "/" .. name)
    for _, og in ipairs(other.guides or {}) do
        local map = og.areas and D.areaToMap[og.areas[1]]
        -- A guide boxed in a corner of a zone (a starting valley) speaks for its box only.
        if map and og.intro then
            if og.box then
                BOXED_INTROS[#BOXED_INTROS + 1] = { box = og.box, text = og.intro }
            elseif not ZONE_INTROS[map] then
                ZONE_INTROS[map] = og.intro
            end
        end
    end
end

-- Route notes: { questId, english, kind = "accept" | "complete" | "turnin" }. startPos: where
-- the player starts, the previous guide's end or the route's start (no zone intro for the
-- zone the player is already in).
local function applyNotes(g, steps, startPos)
    local function stepWith(q, kind)
        for _, step in ipairs(steps) do
            for _, k in ipairs(kind and { kind } or { "accept", "complete", "turnin" }) do
                for _, id in ipairs(step[k] or {}) do
                    if id == q then return step end
                end
            end
        end
    end
    for _, n in ipairs(g.notes or {}) do
        local step = stepWith(n[1], n.kind)
        if step then
            addNote(step, n[2])
        else
            io.stderr:write(string.format("%s: note without a step for quest %d\n", g.id, n[1]))
        end
    end
    for _, step in ipairs(steps) do
        if step.optional and step.accept and not step.note then
            addNote(step, AUTO_NOTES.itemStart)
        end
        if step.level and not step.note then
            addNote(step, AUTO_NOTES.level)
        end
    end
    -- Route texts never go on a step behind an option (hearthstone, death skip, dungeon,
    -- elite): a player without the option never sees that step.
    local function tagged(step)
        return step.sethearth or step.hearth or step.deathskip or step.dungeon or step.elite
    end
    -- A guide that opens by binding the hearthstone in its town: the arrival step (and the
    -- note that tells how to get there) comes first, the inn right after.
    if steps[1] and steps[1].sethearth and steps[2] and not tagged(steps[2]) then
        steps[1], steps[2] = steps[2], steps[1]
    end
    local first
    for _, step in ipairs(steps) do
        if not tagged(step) then first = step break end
    end
    -- A guide over several zones: the first step in each zone tells how to get there and
    -- where its base is (the intro of the zone's own guide, route.zoneIntrosFrom).
    if #(g.areas or {}) > 1 then
        -- Region of a point: its zone, or the box of a starting valley in it; and its intro.
        local function region(p)
            for i, b in ipairs(BOXED_INTROS) do
                if inBox(p, b.box) then return "box" .. i, b.text end
            end
            return p.map, ZONE_INTROS[p.map]
        end
        local lastZone, noted = nil, {}
        if startPos then
            lastZone = region(startPos)
            noted[lastZone] = true
        end
        for _, step in ipairs(steps) do
            local zone, intro
            if not tagged(step) and step.at then zone, intro = region(step.at) end
            if zone and zone ~= lastZone then
                -- (The guide's own intro opens it: no zone intro on its first step then,
                -- unless the player comes from another zone.)
                if not noted[zone] and intro and not (step == first and g.intro and not startPos) then
                    addNote(step, intro, true)
                end
                noted[zone] = true
                lastZone = zone
            end
        end
    end
    if g.intro and first then addNote(first, g.intro, true) end
end

-- The guide's texts in every language that has a dictionary (tools/routes/locales):
-- Ding/Locales/Guides/<locale>/<file>. A text missing from a dictionary is reported; the
-- guide stays in English for that language until the dictionary has it
-- (tools/translate_guides.lua then writes every translation again).
local DICTIONARIES = Texts.load(root .. "/tools/routes/locales")
local function writeTranslation(g, steps)
    local missing = Texts.write({ id = g.id, title = g.title, steps = steps }, g.file, DICTIONARIES,
        OUT_LOCALES or (root .. "/Ding/Locales/Guides"))
    for _, m in ipairs(missing) do
        io.stderr:write(string.format("%s: text without translation (%s)\n", g.id, m))
    end
end

---------------------------------------------------------------------------
-- Report
---------------------------------------------------------------------------
local function questName(q)
    local quest = db.Quest[q]
    return quest and tostring(quest[QK.name]) or ("quest " .. q)
end

local function thousands(n)
    local s = tostring(math.floor(n + 0.5))
    local out = s:reverse():gsub("(%d%d%d)", "%1 "):reverse()
    return (out:gsub("^ ", ""))
end

-- Time to reach the guide's top level (tour, then grinding what is missing), or a dash
-- when the tour starts at that level already.
local function targetTime(m)
    return m.reached and "-" or duration(m.effective)
end

-- Figures of a tour. XP per hour leaves out the grinding stops (counted apart).
-- Figures of a tour, with the grinding of the final level step (up to nextMin, the next
-- guide's minimum level).
local function metrics(inst, st, plan, nextMin)
    local quests = 0
    for i in pairs(plan.inc) do
        if not inst.quests[i].bind then quests = quests + 1 end
    end
    local questTime, questXP = st.time - st.grind, st.credit - st.grindXP
    local final = nextMin and st.level < nextMin and Model.xpTo(st.level, st.lxp, nextMin) / inst.rateEnd or 0
    return {
        dist = st.dist, time = st.time + final, xp = st.credit, rate = questTime > 0 and questXP / questTime * 3600 or 0,
        effective = st.effective, reached = inst.xpTarget == 0, quests = quests, turnins = st.turnins,
        grind = st.grind + final, final = final, level = st.level, lxp = st.lxp,
        killShare = questXP > 0 and st.killXP / questXP or 0,
    }
end

local function withGrind(m)
    return duration(m.time) .. (m.grind > 0 and (" (grinding " .. duration(m.grind) .. ")") or "")
end

local function metricLine(label, m)
    return string.format("   %-6s %6.1f km  %9s  %8s XP (monsters %d %%)  %7s XP/h  top level in %9s  %3d quests  end lvl %s",
        label, m.dist * 0.9144 / 1000, withGrind(m), thousands(m.xp), math.floor(100 * m.killShare + 0.5),
        thousands(m.rate), targetTime(m), m.quests, levelLabel(m.level, m.lxp))
end

-- Why the optimizer left a quest out of the tour, and whether its level is the reason
-- (the quest, or its monsters, above the player until the end of the tour).
local function exclusion(inst, plan, cost, st, i)
    local q = inst.quests[i]
    local why, other = Solver.blocker(inst, plan, i)
    if why then
        return other and string.format("%s with %d %s", why, other, questName(other)) or why
    end
    local cand, c = Solver.bestInsertion(inst, plan, i)
    if not cand then
        local level = c and (c:find("^required level") or c:find("^quest level") or c:find("^monsters of level"))
            and true or false
        return "no place possible: " .. (c or "?"), level
    end
    local _, st2 = Solver.evaluate(inst, cand)
    if st2.waits > st.waits then
        return string.format("%s > player level: grinding stop of %s", st2.grindWhy or "?",
            duration(st2.grind - st.grind)), true
    end
    -- As the optimizer sees it: the walk to the next guide counts, and kills count no more
    -- than grinding.
    local dt = st2.time - st.time + st2.finish - st.finish
    local dxp = st2.credit - st.credit - inst.rateEnd * (st2.surplus - st.surplus)
    if c <= cost + 1e-6 then
        return string.format("no gain (+%s, +%s XP)", duration(dt), thousands(dxp))
    end
    local rate = dt > 0 and string.format("%s XP/h", thousands(dxp / dt * 3600)) or "costs more than it earns"
    return string.format("+%s for +%s XP: %s, below the grinding rate of %s XP/h",
        duration(math.max(0, dt)), thousands(dxp), rate, thousands(inst.rateEnd * 3600))
end

-- Classes each quest of a tour is for: its own (requiredClasses), narrowed to those that can
-- have its prerequisites (a chain opened by a class quest stays with those classes).
-- Sets { [class] = true }, nil for every class.
local function tourClasses(inst, plan, selected)
    local function intersect(a, b)
        if not a then return b end
        if not b then return a end
        local out = {}
        for c in pairs(a) do if b[c] then out[c] = true end end
        return out
    end
    local function classSet(list)
        if not list then return nil end
        local set = {}
        for _, c in ipairs(list) do set[c] = true end
        return set
    end
    local out = {}
    -- Classes able to have quest p done: this tour's view, or the route's for earlier ones.
    local function prereq(p)
        local i = inst.byId[p]
        if i and plan.inc[i] then return true, out[p] end
        if inst.start.done[p] then return true, questClasses[p] end
        return false
    end
    for _ = 1, 8 do
        local changed = false
        for i, iq in ipairs(inst.quests) do
            if plan.inc[i] and not iq.inLog and not iq.bind then
                local quest = db.Quest[iq.id]
                local info = selected[iq.id]
                local c = classSet(info and info.classes)
                local single = quest[QK.preQuestSingle]
                if X.hasEntries(single) then
                    local union, all = {}, false
                    for _, p in ipairs(single) do
                        local ok, pc = prereq(p)
                        if ok and not pc then all = true end
                        if ok and pc then for k in pairs(pc) do union[k] = true end end
                    end
                    if not all then c = intersect(c, union) end
                end
                for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                    if p > 0 then
                        local ok, pc = prereq(p)
                        if ok then c = intersect(c, pc) end
                    end
                end
                local before = out[iq.id]
                local same = (before == nil) == (c == nil)
                if same and c then
                    for k in pairs(c) do if not before[k] then same = false end end
                    for k in pairs(before) do if not c[k] then same = false end end
                end
                if not same then out[iq.id], changed = c, true end
            elseif plan.inc[i] then
                out[iq.id] = questClasses[iq.id]
            end
        end
        if not changed then break end
    end
    return out
end

-- Sorted list of a class set, in the faction's order.
local function classList(set)
    if not set then return nil end
    local list = {}
    for _, c in ipairs(X.FACTION_CLASSES[FACTION]) do if set[c] then list[#list + 1] = c end end
    return list
end

---------------------------------------------------------------------------
-- Dungeon and elite quests: optional extras (route.extras)
---------------------------------------------------------------------------
-- Tagged for Ding's options, off by default: `dungeon = "<name>"` or `elite = true` on their
-- steps. The tour never counts on them (their XP is not simulated) and nothing depends on
-- them: one is offered only where the guide passes by its giver at its level, with its
-- prerequisites done by the guide itself, its ender in the same town (accept, objectives and
-- turn-in follow each other: one more quest in the log at most), and no quest of the route
-- needing it.
local EXTRA_RADIUS = 200   -- yards: a step this close to the giver passes by
local TOWN_RADIUS = 300    -- yards between the giver and the ender, at most

local function addExtras(index, steps, inst, plan, maps, endMaps, doneAtStart)
    local planned, needed = {}, {}
    for q in pairs(laterNeeds[index]) do needed[q] = true end
    for i, iq in ipairs(inst.quests) do
        if plan.inc[i] and not iq.bind then
            planned[iq.id] = true
            local quest = db.Quest[iq.id]
            for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
                for _, p in ipairs(quest and quest[key] or {}) do needed[math.abs(p)] = true end
            end
        end
    end
    local candidates = {}
    for _, q in ipairs(sortedKeys(db.Quest)) do
        local quest = db.Quest[q]
        local qLevel = quest[QK.questLevel] or 0
        local givers = quest[QK.startedBy] or {}
        -- A class quest (route.classQuests): one class by its mask, its class category or
        -- its class trainer, a class the faction has.
        local classMask = quest[QK.requiredClasses] or 0
        local only
        if route.classQuests then
            if classMask ~= 0 then
                local allowed = X.classesAllowed(classMask, FACTION)
                only = allowed and #allowed == 1 and allowed[1] or nil
            else
                only = X.CLASS_SORTS[quest[QK.zoneOrSort] or 0] or D.trainerClass(quest)
            end
            local has = false
            for _, c in ipairs(only and X.FACTION_CLASSES[FACTION] or {}) do if c == only then has = true end end
            if not has then only = nil end
        end
        local ok = qLevel > 0 and not state.done[q] and not state.taken[q] and not planned[q] and not needed[q]
            and openToTrack(quest) and (classMask == 0 or only ~= nil)
            and not X.hasBit(quest[QK.specialFlags] or 0, 1) and (quest[QK.parentQuest] or 0) == 0
            and not X.hasEntries(quest[QK.requiredSkill]) and not X.hasEntries(quest[QK.requiredMinRep])
            and qLevel >= state.level - 3
        if ok then
            for _, e in ipairs(quest[QK.exclusiveTo] or {}) do
                if state.done[e] or state.taken[e] or planned[e] then ok = false end
            end
        end
        local starts, ends
        if ok then
            starts = D.giverPoints(givers, endMaps)
            ends = D.giverPoints(quest[QK.finishedBy], endMaps)
            ok = #starts > 0 and #ends > 0
        end
        -- (A class quest may send its class elsewhere in the zone: no town to stay in.)
        if ok and not only then
            local town = false
            for _, a in ipairs(starts) do
                for _, b in ipairs(ends) do
                    local d = Model.distance(a, b)
                    if d and d <= TOWN_RADIUS then town = true end
                end
            end
            ok = town
        end
        if ok then
            local need = math.max(quest[QK.requiredLevel] or 0, qLevel - 1)
            local dungeon = D.questDungeon(quest)
            local tag
            if dungeon then
                tag = not only and { dungeon = dungeon } or nil
            else
                local jobs, _, elite, unknown = D.questJobs(q, quest, maps)
                if elite and not unknown and #jobs > 0 then
                    tag = { elite = true }
                    -- Monsters within reach as for the tour's quests (guide_levels_test).
                    for _, job in ipairs(jobs) do
                        local low
                        for _, p in ipairs(job.kind == "kill" and job.points or {}) do
                            if p.mobLevel and (not low or p.mobLevel < low) then low = p.mobLevel end
                        end
                        if low then need = math.max(need, Model.monsterLevel(low) - (MOB_ABOVE or Model.PARAMS.mobAbove)) end
                    end
                end
                if only then
                    tag = tag or {}
                    tag.classes = { only }
                end
            end
            if tag then
                candidates[#candidates + 1] = { id = q, quest = quest, starts = starts, need = need, tag = tag,
                    hasObjectives = X.hasObjectives(quest) }
            end
        end
    end
    -- Placement: after the first step that passes by the giver at the quest's level, once the
    -- guide has turned in its prerequisites.
    local turnedIn = {}
    for q in pairs(doneAtStart) do turnedIn[q] = true end
    local after = {}
    local placed = 0
    for k, step in ipairs(steps) do
        for _, q in ipairs(step.turnin or {}) do turnedIn[q] = true end
        for _, c in ipairs(candidates) do
            if not c.placed and step.at and (step.simLevel or 0) >= c.need then
                local near = false
                for _, p in ipairs(c.starts) do
                    local d = Model.distance(step.at, p)
                    if d and d <= EXTRA_RADIUS then near = true end
                end
                local prereqs = near
                local single = c.quest[QK.preQuestSingle]
                if prereqs and X.hasEntries(single) then
                    local any = false
                    for _, p in ipairs(single) do if turnedIn[p] then any = true end end
                    prereqs = any
                end
                for _, p in ipairs(c.quest[QK.preQuestGroup] or {}) do
                    if (p > 0 and not turnedIn[p]) or (p < 0 and turnedIn[-p]) then prereqs = false end
                end
                if prereqs then
                    c.placed = true
                    after[k] = after[k] or {}
                    table.insert(after[k], c)
                    placed = placed + 1
                    state.taken[c.id] = true
                    -- (Done right there: the next quest of a class chain may follow.)
                    turnedIn[c.id] = true
                end
            end
        end
    end
    local out = {}
    for k, step in ipairs(steps) do
        out[#out + 1] = step
        for _, c in ipairs(after[k] or {}) do
            local function tagged(s)
                s.dungeon, s.elite, s.classes, s.simLevel = c.tag.dungeon, c.tag.elite, c.tag.classes, step.simLevel
                return s
            end
            out[#out + 1] = tagged({ accept = { c.id } })
            if c.hasObjectives then out[#out + 1] = tagged({ complete = { c.id } }) end
            out[#out + 1] = tagged({ turnin = { c.id } })
        end
    end
    for k = 1, #out do steps[k] = out[k] end
    return placed
end

---------------------------------------------------------------------------
-- Death skips: optional shortcuts (route.deathSkips)
---------------------------------------------------------------------------
-- Tagged for Ding's option, off by default (`deathskip = true` and its text). Where the guide
-- has a long trip ahead (DEATH_GAIN seconds saved at least) and the graveyard nearest to the
-- place the player leaves is close to the next stop, dying there and resurrecting at its
-- spirit healer is faster. Graveyards: the spirit healers of QuestieDB, read at generation
-- time. Above level 10, resurrection sickness weakens the player for (level - 10) minutes,
-- 10 at most: no skip when objectives come within that time. The tour does not count on it.
local DEATH_COST = 60      -- seconds: be killed, release the spirit, resurrect at the healer
local DEATH_GAIN = 180     -- seconds the skip saves at least
local DEATH_TEXT = "Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."
local graveyards

local function addDeathSkips(steps, inst)
    graveyards = graveyards or D.spiritHealers()
    local out, added, prev = {}, 0, nil
    for k, step in ipairs(steps) do
        if step.hearth then prev = nil end
        if step.at and prev and prev.time then
            local level = prev.simLevel or 1
            local trip = inst.travel(prev.at, step.at, level)
            local yard, yardD
            for _, g in ipairs(graveyards) do
                local d = Model.distance(prev.at, g.point)
                if d and (not yardD or d < yardD) then yard, yardD = g.point, d end
            end
            if yard and trip - (DEATH_COST + inst.travel(yard, step.at, level)) >= DEATH_GAIN then
                local sick = level <= 10 and 0 or math.min(10, level - 10) * 60
                local fights = false
                for j = k, #steps do
                    local s = steps[j]
                    if not s.time or s.time > prev.time + trip + sick then break end
                    if s.complete then fights = true end
                end
                if sick == 0 or not fights then
                    out[#out + 1] = { deathskip = true, text = DEATH_TEXT, simLevel = level }
                    added = added + 1
                end
            end
        end
        out[#out + 1] = step
        if step.at then prev = step end
    end
    for k = 1, #out do steps[k] = out[k] end
    return added
end

local summaryRows = {}
-- --fit: simulated level at the start and end of each guide.
local fitRows = {}
-- Quests left out for their level, offered to the next guide: { [questId] = { info, from,
-- endMaps, why } }.
local pending = {}

---------------------------------------------------------------------------
-- Main
---------------------------------------------------------------------------
for _, path in ipairs(route.prior or {}) do replayPrior(root .. "/" .. path) end
if route.startLevel and state.level < route.startLevel then
    state.level, state.xp = route.startLevel, 0
end

print(string.format("Route %s (%s)", route.file or ROUTE, table.concat(route.races, ", ")))
for index, g in ipairs(route.guides) do
    if g.next == nil then g.next = route.guides[index + 1] and route.guides[index + 1].id or route.next end
    -- The route names the zone; the title adds the guide's level window.
    g.title = g.title:gsub(" %(%d+%-?%d*%)$", "") .. " (" .. (g.minLevel == g.maxLevel and g.minLevel
        or (g.minLevel .. "-" .. g.maxLevel)) .. ")"
    -- A guide starts at its own minimum level at least: the route's first guide assumes it,
    -- the others follow a guide that ends with a level step up to it when the simulated
    -- level (prudent: route_model.lua PARAMS.killXPMargin) falls short. --fit: only the
    -- route's first guide.
    if state.level < g.minLevel and (not FIT or index == 1) then
        state.level, state.xp = g.minLevel, 0
    end
    local startLevel = levelLabel()
    local startNumber = levelNumber(state.level, state.xp)
    -- Where the previous guide left the player, or the route's start (nil for the first
    -- guide of a route that starts where its guide begins).
    local startPos = state.pos or (g.start and D.point(D.areaToMap[g.start[1]], g.start[2], g.start[3]))
    -- Quests turned in before this guide (state.done grows with the guide's own).
    local doneAtStart = {}
    for q in pairs(state.done) do doneAtStart[q] = true end
    local selected, maps = selectQuests(index)
    -- Quests the previous guide left for a higher level: still worth it now?
    local resumed = {}
    for _, q in ipairs(sortedKeys(pending)) do
        local p = pending[q]
        if not selected[q] and not state.done[q] and not state.taken[q] then
            p.info.endMaps = p.endMaps
            selected[q] = p.info
            resumed[q] = p
        end
    end
    pending = {}
    local inst = buildInstance(index, selected, maps)
    local greedy = Solver.greedy(inst)
    local greedyCost, greedySt = Solver.evaluate(inst, greedy)
    local plan, cost = greedy, greedyCost
    if not GREEDY then
        plan, cost = Solver.optimize(inst, greedy, { seed = seedOf(g.id), iterations = ITERATIONS })
    end
    local trace = {}
    local _, st = Solver.evaluate(inst, plan, trace)
    -- Short of the next guide's level: the guide ends with a level step, so that the next
    -- one never sends the player above their level.
    local nextMin = not FIT and g.next and guideMinLevel(g.next) or nil
    -- The route's last guide: what the quests do not give up to its top level is ground
    -- after it (no level step: nothing follows), and counted.
    local goal = nextMin or (not g.next and not FIT and g.maxLevel) or nil
    local before, after = metrics(inst, greedySt, greedy, goal), metrics(inst, st, plan, goal)
    if nextMin and st.level < nextMin then trace[#trace + 1] = { kind = "level", level = nextMin } end
    for _, u in ipairs(inst.unplaced or {}) do
        if u.forced then
            io.stderr:write(string.format("%s: quest %d forced but impossible to place (%s)\n", g.id, u.id, u.why))
        end
    end

    -- Why each quest stays out; those out for their level wait for the next guide when it
    -- starts close by (a guide revisiting their zone later selects them again anyway).
    local outs, deferred = {}, 0
    local zone = mapSet(g.extraAreas, mapSet(g.areas))
    local nextGuide = route.guides[index + 1]
    local nextHub = nextGuide and (nextGuide.start and D.point(D.areaToMap[nextGuide.start[1]], nextGuide.start[2],
        nextGuide.start[3]) or hubs[index + 1])
    for i, q in ipairs(inst.quests) do
        if not plan.inc[i] and not q.unavailable and not q.inLog and not q.bind then
            local why, level = exclusion(inst, plan, cost, st, i)
            outs[i] = why
            local info = selected[q.id]
            local spot = info.starts[1] or (info.jobs[1] and info.jobs[1].points[1])
            local d = nextHub and spot and Model.distance(spot, nextHub)
            if level and d and d <= DEFER_RADIUS and not resumed[q.id] then
                pending[q.id] = { info = info, from = g.id, endMaps = zone, why = why }
                deferred = deferred + 1
            end
        end
    end

    -- The tour's outcome becomes the route state.
    for _, a in ipairs(trace) do
        if a.kind == "accept" then
            if not state.log[a.q] then state.logSize = state.logSize + 1 end
            state.log[a.q] = { optional = a.optional }
            state.taken[a.q] = true
        elseif a.kind == "complete" then
            state.log[a.q].completed = true
        elseif a.kind == "turnin" then
            state.log[a.q] = nil
            state.logSize = state.logSize - 1
            state.done[a.q] = true
        end
    end
    for i, q in ipairs(inst.quests) do
        if q.inLog and q.completed and state.log[q.id] then state.log[q.id].completed = true end
        if plan.inc[i] and not q.work and state.log[q.id] then state.log[q.id].completed = true end
    end
    state.level, state.xp, state.pos = st.level, st.lxp, st.pos or state.pos
    state.bind, state.hearthLeft = st.bind, math.max(0, st.hearthReady - st.time)

    local classes = tourClasses(inst, plan, selected)
    for q, set in pairs(classes) do questClasses[q] = set end
    local steps = buildSteps(trace, function(q) return classList(classes[q]) end, inst.mobAbove)
    local extras = route.extras and addExtras(index, steps, inst, plan, maps, mapSet(g.extraAreas, mapSet(g.areas)), doneAtStart) or 0
    local skips = route.deathSkips and addDeathSkips(steps, inst) or 0
    -- The route's way out of the guide (g.finish: an exit quest turned in elsewhere, a
    -- portal), after the tour, as written.
    for _, s in ipairs(g.finish or {}) do
        local copy = {}
        for k, v in pairs(s) do copy[k] = v end
        for _, k in ipairs({ "accept", "turnin", "complete" }) do
            if copy[k] ~= nil and type(copy[k]) ~= "table" then copy[k] = { copy[k] } end
        end
        copy.simLevel = steps[#steps] and steps[#steps].simLevel
        steps[#steps + 1] = copy
        for _, q in ipairs(copy.accept or {}) do state.taken[q] = true end
        for _, q in ipairs(copy.turnin or {}) do state.done[q] = true end
    end
    applyNotes(g, steps, startPos)
    fitRows[#fitRows + 1] = { id = g.id, from = startNumber, to = levelNumber(st.level, st.lxp),
        min = g.minLevel, max = g.maxLevel }
    local summary = string.format("level %s -> %s, %d quests turned in, about %s (%s XP per hour)",
        startLevel, levelLabel(), st.turnins, duration(st.time - st.grind), thousands(after.rate))
    if g.next and after.grind > 0 then
        summary = summary .. string.format(", plus up to %s of grinding at the level steps", duration(after.grind))
    elseif not g.next and after.grind > 0 then
        local inside = after.grind - after.final
        if inside > 0 then
            summary = summary .. string.format(", plus up to %s of grinding at the level steps", duration(inside))
        end
        if after.final > 0 then
            summary = summary .. string.format(", then about %s of grinding up to level %d", duration(after.final), g.maxLevel)
        end
    end
    local path = OUT .. "/" .. g.file
    if not DRY then
        writeGuide(g, steps, summary)
        writeTranslation(g, steps)
    end
    local carried = sortedKeys(state.log)
    print(string.format("%-28s level %-9s -> %-9s %3d steps, %3d quests turned in%s, log at the end: %s",
        g.id, startLevel, levelLabel(), #steps, st.turnins,
        (extras > 0 and (", " .. extras .. " extras") or "") .. (skips > 0 and (", " .. skips .. " death skips") or ""),
        #carried > 0 and table.concat(carried, " ") or "-"))

    if REPORT then
        print(metricLine("before", before))
        print(metricLine("after", after))
        local dropped, added, back = 0, 0, 0
        local function out(label, q, why)
            local from = resumed[q.id] and (" (deferred from " .. resumed[q.id].from .. ")") or ""
            print(string.format("     %-8s %6d %-34s %s%s", pending[q.id] and "deferred" or label, q.id,
                questName(q.id), why, from))
        end
        for i, q in ipairs(inst.quests) do
            if greedy.inc[i] and not plan.inc[i] and not q.bind then
                dropped = dropped + 1
                out("dropped", q, outs[i] or "?")
            end
        end
        for i, q in ipairs(inst.quests) do
            if q.bind then
                -- Hearthstone bindings: steps of their own (sethearth).
            elseif plan.inc[i] and resumed[q.id] then
                back = back + 1
                print(string.format("     resumed  %6d %s (deferred from %s)", q.id, questName(q.id), resumed[q.id].from))
            elseif plan.inc[i] and not greedy.inc[i] then
                added = added + 1
                print(string.format("     added    %6d %s", q.id, questName(q.id)))
            end
        end
        for i, q in ipairs(inst.quests) do
            if not greedy.inc[i] and not plan.inc[i] and outs[i] then out("left out", q, outs[i]) end
        end
        summaryRows[#summaryRows + 1] = { id = g.id, before = before, after = after, dropped = dropped,
            added = added, deferred = deferred, resumed = back }
    end
    if TRACE then
        print("   -> " .. path)
        for _, a in ipairs(trace) do
            if a.kind == "level" then
                print(string.format("   level    %d%s", a.level, a.why and string.format("  (%s, %s)", a.why,
                    duration(a.seconds or 0)) or ""))
            elseif a.kind == "hearth" or a.kind == "sethearth" then
                print(string.format("   %-9s       lvl %2d  %s", a.kind, a.level or 0, a.name))
            else
                print(string.format("   %-8s %6d  lvl %2d  (%d, %.1f, %.1f)%s  %s", a.kind, a.q, a.level or 0,
                    a.at and a.at.map or 0, a.at and a.at.px or 0, a.at and a.at.py or 0,
                    a.optional and " optional" or "", questName(a.q)))
            end
        end
    end
end

if FIT then
    print("")
    print("Level windows that chain without grinding (route minLevel-maxLevel -> simulated):")
    for i, r in ipairs(fitRows) do
        local nextFrom = fitRows[i + 1] and fitRows[i + 1].from or r.to
        print(string.format("   %-28s %2d-%-2d -> %2d-%-2d  (%.2f -> %.2f)", r.id, r.min, r.max, math.floor(r.from),
            math.floor(nextFrom), r.from, r.to))
    end
end

if REPORT and #summaryRows > 0 then
    print("")
    print("| Guide | Distance (km) | Estimated time | XP | XP/h without grinding | Top level reached in | Quests | Deferred / resumed |")
    print("| --- | --- | --- | --- | --- | --- | --- | --- |")
    local function pair(a, b, fmt) return fmt(a) .. " → " .. fmt(b) end
    for _, r in ipairs(summaryRows) do
        local b, a = r.before, r.after
        local gain = b.rate > 0 and (a.rate / b.rate - 1) * 100 or 0
        print(string.format("| %s | %s | %s | %s | %s (%+.0f %%) | %s | %d → %d | %d / %d |", r.id,
            pair(b.dist, a.dist, function(v) return string.format("%.1f", v * 0.9144 / 1000) end),
            pair(b, a, withGrind), pair(b.xp, a.xp, thousands), pair(b.rate, a.rate, thousands), gain,
            b.reached and "-" or pair(b.effective, a.effective, duration), b.quests, a.quests, r.deferred, r.resumed))
    end
end

if TRACE and #rejected > 0 then
    print("Quests left out at selection:")
    table.sort(rejected, function(a, b) return a.q < b.q end)
    local seenQ = {}
    for _, r in ipairs(rejected) do
        if not seenQ[r.q] and r.why ~= "race" and r.why ~= "class" and r.why ~= "repeatable" then
            seenQ[r.q] = true
            local quest = db.Quest[r.q]
            print(string.format("   %6d  lvl %2d  %-34s %s", r.q, quest[QK.questLevel] or 0, tostring(quest[QK.name]), r.why))
        end
    end
end
