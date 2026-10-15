-- Ding - Leveling from the Leveling routes (tools/routes/leveling/<faction>.lua): the route's order is
-- kept, and the script changes it as little as possible for Forever.
-- usage: lua5.1 tools/write_leveling.lua <combined dir> <Leveling route> [--out <dir>] [--dry-run]
--                                    [--report] [--no-additions] [--deviation] [--free-quests <file>] [--why]
--
-- 1. Tags: a quest done in a dungeon or against elites carries its tag on every one of its
--    steps (split from untagged quests of the same step), and so do its follow-ups; the go
--    step that leads to a death skip is part of the shortcut.
-- 2. Forever repairs, replayed for every race and class of the faction with the rules of
--    tools/check_guides.lua: a quest missing from Forever, closed to the race or class,
--    already done or in the log, or exclusive with one done is left out for them; a missing
--    prerequisite whose giver stands on the same map is done right before; one still in the
--    log makes the quest wait for its turn-in; anything else leaves the quest out. A step
--    whose quest only some races or classes keep is restricted to them.
-- 3. Forever's own quests (absent from Classic, not in the route) go where the detour is
--    smallest, in route order, after their prerequisites, at a level that fits (required
--    level reached, quest at most +2, monsters at most +1, not grey) and with room in the
--    quest log. Only these follow the level caps: the route's own steps are trusted.
-- 4. Simulation (tools/route_model.lua, travel tools/route_travel.lua) of each race as a
--    warrior: the "-- level N" of each step is the lowest level a race reaches there.
-- 5. A trip to the place the character's previous step already took it (the steps in between
--    being for others) is left out for that character.
-- 6. Free quests (tools/route_free.lua): a quest the route leaves out although it costs almost
--    nothing on its way is a warning; --free-quests writes them, with the borderline ones, for
--    tools/audit_free_quests.lua.
-- 7. Reasons (tools/route_why.lua): a step whose choice surprises (a detour, a quest taken now
--    or never) gets its `why`, measured on the simulation; the audit's verdicts on the quests
--    the route leaves out become each section's `leftOut`. --why lists them.
-- 8. Floors (tools/guide_floor.lua): a step whose note says the target is upstairs, at the top
--    or downstairs gets `floor`, which the arrow says on arrival.
-- Writes Ding/Guides/<file> and its translations (tools/routes/locales).
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local X = dofile(here .. "/questiedb_export.lua")
local Model = dofile(here .. "/route_model.lua")
local RouteData = dofile(here .. "/route_data.lua")
local Travel = dofile(here .. "/route_travel.lua")
local Work = dofile(here .. "/route_work.lua")
local Texts = dofile(here .. "/guide_texts.lua")
local Solver = dofile(here .. "/route_solver.lua")
local Free = dofile(here .. "/route_free.lua")
local Why = dofile(here .. "/route_why.lua")
local Floor = dofile(here .. "/guide_floor.lua")
local QK = X.QUEST
local P = Model.PARAMS

local COMBINED, ROUTE, OUT, DRY, REPORT, ADDITIONS, DEVIATION, FREE_OUT = nil, nil, nil, false, false, true, false, nil
local WHY_REPORT = false
do
    local i = 1
    while arg[i] do
        local a = arg[i]
        if a == "--out" then
            i = i + 1
            OUT = arg[i]
        elseif a == "--dry-run" then
            DRY = true
        elseif a == "--report" then
            REPORT = true
        elseif a == "--no-additions" then
            ADDITIONS = false
        elseif a == "--deviation" then
            DEVIATION = true
        elseif a == "--free-quests" then
            i = i + 1
            FREE_OUT = arg[i]
        elseif a == "--why" then
            WHY_REPORT = true
        elseif not COMBINED then
            COMBINED = a
        elseif not ROUTE then
            ROUTE = a
        end
        i = i + 1
    end
end
if not COMBINED or not ROUTE then
    io.stderr:write("usage: lua5.1 tools/write_leveling.lua <combined dir> <Leveling route> [--out <dir>] [--dry-run]"
        .. " [--report] [--no-additions] [--deviation] [--free-quests <file>] [--why]\n")
    os.exit(2)
end
local OUT_LOCALES = OUT and (OUT .. "/Locales")
OUT = OUT or (root .. "/Ding/Guides")

local db = X.loadCorrected(COMBINED)
local D = RouteData.new(db, COMBINED)
local Jobs = Work.new(D)
local route = dofile(ROUTE)
local FACTION = route.faction
-- The faction's races, then those that join the route on the way (route.entries: { [race] =
-- { section = id, level = n } }, the Skyborne after their own start).
local RACES = {}
for _, race in ipairs(X.FACTION_RACES[FACTION]) do RACES[#RACES + 1] = race end
local ENTRIES = route.entries or {}
for _, race in ipairs((function()
    local list = {}
    for race in pairs(ENTRIES) do list[#list + 1] = race end
    table.sort(list)
    return list
end)()) do
    RACES[#RACES + 1] = race
end
local CLASSES = X.FACTION_CLASSES[FACTION]
local LOG_LIMIT = 20
local SIM_CLASS = "WARRIOR"
local CAPITALS = { Alliance = { 1519, 1537, 1657 }, Horde = { 1637, 1638, 1497 } }
local ROUTE_NAME = ROUTE:gsub("\\", "/"):match("(tools/routes/.*)$") or ROUTE
-- How each section begins (travel.lua next to the route): { [section id] = { intro = text,
-- travel = text } }.
local TRAVEL = {}
do
    local ok, t = pcall(dofile, (ROUTE:match("^(.*)[/\\]") or ".") .. "/travel.lua")
    if ok and type(t) == "table" then TRAVEL = t end
end

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------
local function contains(list, v)
    if not list then return true end
    for _, x in ipairs(list) do if x == v then return true end end
    return false
end
local function asList(v)
    if v == nil then return nil end
    if type(v) == "table" then return v end
    return { v }
end
local function sortedKeys(t)
    local out = {}
    for k in pairs(t) do out[#out + 1] = k end
    table.sort(out, function(a, b)
        if type(a) == type(b) then return a < b end
        return tostring(a) < tostring(b)
    end)
    return out
end
local function questName(q)
    local quest = db.Quest[q]
    return ("%d %s"):format(q, quest and quest[QK.name] or "?")
end
local function mapSet(list)
    local set = {}
    for _, m in ipairs(list or {}) do set[m] = true end
    return set
end

local uid = 0
local function newStep(t)
    uid = uid + 1
    t.uid = uid
    return t
end
local QUEST_KEYS = { "turnin", "accept", "complete" }
local function questActions(step)
    local n = 0
    for _, k in ipairs(QUEST_KEYS) do n = n + #(step[k] or {}) end
    return n
end
-- A step that still does something once its quests are gone.
-- Goals of a step that are not quest actions (phase 9 keys), written to the guide as they are.
local GOAL_KEYS = { "xp", "revive", "vendor", "repair", "talk", "kill", "collect", "object", "spots", "useitem",
    "buy", "equip", "destroy", "bank", "unbank", "keep", "abandon", "sticky", "noauto", "patrol", "when" }
local function hasOther(step)
    if step.go or step.level or step.sethearth or step.hearth or step.deathskip or step.fly or step.train
        or step.text then
        return true
    end
    for _, k in ipairs({ "vendor", "repair", "talk", "kill", "collect", "object", "useitem", "buy", "equip",
        "destroy", "bank", "unbank", "abandon" }) do
        if step[k] then return true end
    end
    return false
end

---------------------------------------------------------------------------
-- Sections and chains
---------------------------------------------------------------------------
local sections, byId = route.sections, {}
for i, s in ipairs(sections) do
    s.index = i
    byId[s.id] = s
    s.out = {}
    for j, step in ipairs(s.steps) do
        local copy = {}
        for k, v in pairs(step) do copy[k] = v end
        for _, k in ipairs(QUEST_KEYS) do copy[k] = asList(copy[k]) end
        copy.races, copy.classes = asList(copy.races), asList(copy.classes)
        copy.base, copy.src = true, j
        -- A `when.item` list of one pair is written as the pair itself, or the id.
        local held = copy.when and copy.when.item
        if type(held) == "table" and #held == 1 and type(held[1]) == "table" then
            local w = {}
            for k, v in pairs(copy.when) do w[k] = v end
            local p = held[1]
            w.item = (p[2] or 1) > 1 and { p[1], p[2] } or p[1]
            copy.when = w
        end
        -- A quest both accepted and turned in on one step is done on the spot: accepted
        -- first, then turned in (a Ding step turns in before it accepts).
        local instant = {}
        if copy.turnin and copy.accept then
            local accepted = {}
            for _, q in ipairs(copy.accept) do accepted[q] = true end
            local keep = {}
            for _, q in ipairs(copy.turnin) do
                if accepted[q] then instant[#instant + 1] = q else keep[#keep + 1] = q end
            end
            copy.turnin = #keep > 0 and keep or nil
        end
        s.out[#s.out + 1] = newStep(copy)
        if #instant > 0 then
            s.out[#s.out + 1] = newStep({ turnin = instant, races = copy.races, classes = copy.classes,
                dungeon = copy.dungeon, elite = copy.elite, when = copy.when, base = true, src = j })
        end
    end
end
-- Chain of a race: its start section (or the section it joins at), then `next`.
local chains = {}
for _, race in ipairs(RACES) do
    for _, s in ipairs(sections) do
        if (ENTRIES[race] and s.id == ENTRIES[race].section) or (not ENTRIES[race] and s.races and contains(s.races, race)) then
            local chain, seen = {}, {}
            local cur = s
            while cur and not seen[cur.id] do
                seen[cur.id] = true
                chain[#chain + 1] = cur
                cur = cur.next and byId[cur.next]
            end
            chains[race] = chain
            break
        end
    end
    if not chains[race] then io.stderr:write("no start section for " .. race .. "\n") end
end
-- Only the races the route starts.
do
    local started = {}
    for _, race in ipairs(RACES) do if chains[race] then started[#started + 1] = race end end
    RACES = started
end
-- The Leveling route does not know the races that join on the way: its quest steps kept for some
-- races (those whose start did not do them) are offered to the joining races too; the replay
-- below keeps them where those races can really do them.
for race in pairs(ENTRIES) do
    for _, section in ipairs(chains[race] or {}) do
        for _, step in ipairs(section.out) do
            local quests = 0
            for _, k in ipairs({ "turnin", "accept", "complete" }) do quests = quests + #(step[k] or {}) end
            if step.races and quests > 0 and not contains(step.races, race) then
                local list = {}
                for _, r in ipairs(step.races) do list[#list + 1] = r end
                list[#list + 1] = race
                step.races = list
            end
        end
    end
end

local function applies(section, step, race, class)
    if section.races and not contains(section.races, race) then return false end
    if step.races and not contains(step.races, race) then return false end
    if class == "*" then return step.classes == nil end
    return step.classes == nil or contains(step.classes, class)
end
local function tagged(step) return step.dungeon or step.elite end

-- Every quest of the route (any race, any step).
local routeQuests = {}
for _, s in ipairs(sections) do
    for _, step in ipairs(s.out) do
        for _, k in ipairs(QUEST_KEYS) do
            for _, q in ipairs(step[k] or {}) do routeQuests[q] = true end
        end
    end
end

---------------------------------------------------------------------------
-- 1. Tags
---------------------------------------------------------------------------
local tagOf = {}
for _, s in ipairs(sections) do
    for _, step in ipairs(s.out) do
        if tagged(step) then
            for _, k in ipairs(QUEST_KEYS) do
                for _, q in ipairs(step[k] or {}) do
                    tagOf[q] = tagOf[q] or { dungeon = step.dungeon, elite = step.elite }
                end
            end
        end
    end
end
-- Follow-ups of a tagged quest take its tag: without the option, their prerequisite is
-- never done.
do
    local changed = true
    while changed do
        changed = false
        for q in pairs(routeQuests) do
            local quest = db.Quest[q]
            if quest and not tagOf[q] then
                local single = quest[QK.preQuestSingle]
                local tag
                if X.hasEntries(single) then
                    local all, any = true, false
                    for _, p in ipairs(single) do
                        if routeQuests[p] then
                            any = true
                            if not tagOf[p] then all = false elseif not tag then tag = tagOf[p] end
                        end
                    end
                    if not (all and any) then tag = nil end
                end
                for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                    if p > 0 and tagOf[p] then tag = tag or tagOf[p] end
                end
                if tag then
                    tagOf[q] = tag
                    changed = true
                end
            end
        end
    end
end
-- Tagged quests on steps of their own; the go before a death skip joins the shortcut.
local stats = { split = 0, dieSpots = 0 }
for _, s in ipairs(sections) do
    local out = {}
    for n, step in ipairs(s.out) do
        local moved = {}
        if not tagged(step) then
            for _, k in ipairs(QUEST_KEYS) do
                local keep = {}
                for _, q in ipairs(step[k] or {}) do
                    if tagOf[q] then
                        moved[#moved + 1] = { k = k, q = q }
                    else
                        keep[#keep + 1] = q
                    end
                end
                if step[k] then step[k] = #keep > 0 and keep or nil end
            end
        end
        local nextStep = s.out[n + 1]
        if nextStep and nextStep.deathskip and step.go and step.text and questActions(step) == 0 and not step.deathskip then
            step.deathskip = true
            stats.dieSpots = stats.dieSpots + 1
        end
        local function split(m)
            stats.split = stats.split + 1
            local t = tagOf[m.q]
            out[#out + 1] = newStep({ [m.k] = { m.q }, dungeon = t.dungeon, elite = t.elite, races = step.races,
                classes = step.classes, when = step.when, base = true, src = step.src })
        end
        for _, m in ipairs(moved) do if m.k == "turnin" then split(m) end end
        if questActions(step) > 0 or hasOther(step) or #moved == 0 then out[#out + 1] = step end
        for _, m in ipairs(moved) do if m.k ~= "turnin" then split(m) end end
    end
    s.out = out
end

---------------------------------------------------------------------------
-- 1b. Carried items: a quest whose turn-in needs an item brought from elsewhere (one the
-- route buys, one vendors sell, or one nothing drops) applies only while the item is
-- in the bags, its accept too when the route buys the item and never works the quest; its
-- follow-ups only once it is turned in. A player without the item (a section started
-- midway, a purchase skipped) passes the chain instead of being stuck on it.
---------------------------------------------------------------------------
local gateOf = {}
-- Items the route buys (the simulation takes them as held).
local routeBought = {}
do
    local bought, worked = routeBought, {}
    for _, s in ipairs(sections) do
        for _, step in ipairs(s.out) do
            local buy = step.buy
            if type(buy) == "table" and type(buy[1]) == "number" then buy = { buy } end
            for _, b in ipairs(type(buy) == "table" and buy or {}) do bought[b[1]] = true end
            -- (Worked for everyone: a complete step kept for some races or classes leaves the
            -- others doing it along the way.)
            if not step.races and not step.classes then
                for _, q in ipairs(step.complete or {}) do worked[q] = true end
            end
        end
    end
    local function dropped(item)
        return X.hasEntries(item[X.ITEM.npcDrops]) or X.hasEntries(item[X.ITEM.objectDrops])
            or X.hasEntries(item[X.ITEM.itemDrops])
    end
    for _, q in ipairs(sortedKeys(routeQuests)) do
        local quest = db.Quest[q]
        local objectives = quest and quest[QK.objectives]
        local starts = quest and quest[QK.startedBy] or {}
        for _, o in ipairs(objectives and objectives[3] or {}) do
            local id, item = o[1], db.Item[o[1]]
            if item and id ~= quest[QK.sourceItem] and not contains(starts[3] or {}, id)
                and (bought[id] or X.hasEntries(item[X.ITEM.vendors]) or not dropped(item)) then
                local held = { item = (o[2] or 1) > 1 and { id, o[2] } or id }
                gateOf[q] = { turnin = held, accept = bought[id] and not worked[q] and held or nil }
                break
            end
        end
    end
    -- A quest the route never works on (its objectives done along the way) is turned in once
    -- it is ready, passed otherwise.
    local alongTheWay = {}
    for _, q in ipairs(sortedKeys(routeQuests)) do
        local quest = db.Quest[q]
        if quest and not gateOf[q] and not worked[q] and X.hasObjectives(quest) then alongTheWay[q] = true end
    end
    -- Follow-ups, through the chain: taken once the gated quest is turned in, turned in (once
    -- ready, for one done along the way) or worked while in the log.
    local changed = true
    while changed do
        changed = false
        for _, q in ipairs(sortedKeys(routeQuests)) do
            local quest = db.Quest[q]
            if quest and not gateOf[q] then
                local function gated(p) return gateOf[p] or alongTheWay[p] end
                local before = {}
                for _, p in ipairs(quest[QK.preQuestSingle] or {}) do
                    if routeQuests[p] then before[#before + 1] = p end
                end
                local p = #before == 1 and gated(before[1]) and before[1]
                for _, g in ipairs(quest[QK.preQuestGroup] or {}) do
                    if g > 0 and gated(g) then p = p or g end
                end
                if p then
                    gateOf[q] = { accept = { done = p }, turnin = alongTheWay[q] and { ready = q } or { log = q },
                        complete = { log = q } }
                    changed = true
                end
            end
        end
    end
    for q in pairs(alongTheWay) do
        if not gateOf[q] then gateOf[q] = { turnin = { ready = q } } end
    end
end
-- Conditions of a step's own and of its gated quests, together.
local function withWhen(when, extra)
    if not extra then return when end
    local out = {}
    for k, v in pairs(when or {}) do out[k] = v end
    for k, v in pairs(extra) do if out[k] == nil then out[k] = v end end
    return out
end
local function whenKey(w)
    if not w then return "" end
    local keys = sortedKeys(w)
    local parts = {}
    for _, k in ipairs(keys) do
        local v = w[k]
        parts[#parts + 1] = k .. "=" .. (type(v) == "table" and table.concat(v, ",") or tostring(v))
    end
    return table.concat(parts, ";")
end
-- A step whose quests have different conditions is split: one step per condition, turn-ins
-- first; the step's other keys stay with its first part.
stats.gated = 0
for _, s in ipairs(sections) do
    local out = {}
    for _, step in ipairs(s.out) do
        local own = step.when
        local groups, order = {}, {}
        for rank, k in ipairs(QUEST_KEYS) do
            for _, q in ipairs(step[k] or {}) do
                local gate = gateOf[q] and gateOf[q][k]
                local key = whenKey(gate)
                if not groups[key] then
                    groups[key] = { gate = gate, rank = rank, acts = {} }
                    order[#order + 1] = key
                end
                groups[key].acts[#groups[key].acts + 1] = { k = k, q = q }
            end
        end
        if #order == 0 or (#order == 1 and order[1] == "") then
            out[#out + 1] = step
        elseif #order == 1 then
            stats.gated = stats.gated + 1
            step.when = withWhen(own, groups[order[1]].gate)
            out[#out + 1] = step
        else
            table.sort(order, function(a, b)
                if groups[a].rank ~= groups[b].rank then return groups[a].rank < groups[b].rank end
                return a < b
            end)
            for i, key in ipairs(order) do
                local g = groups[key]
                local part = i == 1 and step or newStep({ races = step.races, classes = step.classes,
                    dungeon = step.dungeon, elite = step.elite, optional = step.optional, base = true, src = step.src })
                for _, k in ipairs(QUEST_KEYS) do part[k] = nil end
                for _, a in ipairs(g.acts) do
                    part[a.k] = part[a.k] or {}
                    part[a.k][#part[a.k] + 1] = a.q
                end
                part.when = withWhen(own, g.gate)
                if g.gate then stats.gated = stats.gated + 1 end
                out[#out + 1] = part
            end
        end
    end
    s.out = out
end

---------------------------------------------------------------------------
-- 2. Forever repairs: replay of each race and class
---------------------------------------------------------------------------
local RACE_BIT = {}
for _, race in ipairs(RACES) do RACE_BIT[race] = X.raceBit(race, FACTION) end

-- Maps of a quest's givers (to tell a prerequisite in the same zone).
local giverMapsCache = {}
local function giverMaps(q)
    if giverMapsCache[q] then return giverMapsCache[q] end
    local set = {}
    local quest = db.Quest[q]
    for _, p in ipairs(quest and D.giverPoints(quest[QK.startedBy]) or {}) do set[p.map] = true end
    giverMapsCache[q] = set
    return set
end
local function shareMap(a, b)
    local mb = giverMaps(b)
    for m in pairs(giverMaps(a)) do if mb[m] then return true end end
    return false
end

-- Why the game refuses quest q now (nil: it accepts), and the prerequisites to repair.
local function refusal(st, q, race, class)
    local quest = db.Quest[q]
    if not quest then return "not in Forever" end
    if not X.raceAllowed(quest, RACE_BIT[race]) then return "race" end
    local cm = quest[QK.requiredClasses] or 0
    if cm ~= 0 and (class == "*" or not X.hasBit(cm, X.CLASS_BITS[class] or 0)) then return "class" end
    if st.done[q] then return "done" end
    if st.log[q] then return "in the log" end
    for _, e in ipairs(quest[QK.exclusiveTo] or {}) do
        if st.done[e] or st.log[e] then return "exclusive" end
    end
    local single = quest[QK.preQuestSingle]
    if X.hasEntries(single) then
        local any = false
        for _, p in ipairs(single) do if st.done[p] then any = true end end
        if not any then return "prerequisite", single, "single" end
    end
    local missing = {}
    for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
        if p > 0 and not st.done[p] then missing[#missing + 1] = p end
        if p < 0 and st.done[-p] then return "exclusive" end
    end
    if #missing > 0 then return "prerequisite", missing, "group" end
    local parent = quest[QK.parentQuest] or 0
    if parent ~= 0 and not st.log[parent] then return "parent" end
    return nil
end

-- Decisions: decision[step uid][kind][q][key] = true (kept) | reason.
local decision = {}
local function decide(step, kind, q, key, value)
    local d = decision[step.uid] or {}
    decision[step.uid] = d
    d[kind] = d[kind] or {}
    d[kind][q] = d[kind][q] or {}
    d[kind][q][key] = value
end
-- Insertions: insert[step uid] = { before = { [sig] = req }, after = { [sig] = req } };
-- req = { quests = { q... }, full = bool, keys = { [key] = true }, order }.
local insert = {}
local insertOrder = 0
local function request(step, where, q, full, key)
    local ins = insert[step.uid] or { before = {}, mid = {}, after = {} }
    insert[step.uid] = ins
    local sig = q .. (full and "f" or "a")
    local req = ins[where][sig]
    if not req then
        insertOrder = insertOrder + 1
        req = { q = q, full = full, keys = {}, order = insertOrder }
        ins[where][sig] = req
    end
    req.keys[key] = true
end
local repairs = {}
local function noteRepair(section, what, q, extra)
    local key = section.id .. "|" .. what .. "|" .. q
    if not repairs[key] then
        repairs[key] = { section = section.id, what = what, q = q, extra = extra }
    end
end

-- A step's conditions in a replay: "yes", "no", or "maybe" (items, level: unknown here).
local function whenState(when, st)
    if type(when) ~= "table" then return "yes" end
    local function list(v)
        if type(v) == "number" then return { v } end
        return type(v) == "table" and v or {}
    end
    for _, q in ipairs(list(when.done)) do if not st.done[q] then return "no" end end
    for _, q in ipairs(list(when.notdone)) do if st.done[q] then return "no" end end
    for _, q in ipairs(list(when.log)) do if not st.log[q] then return "no" end end
    for _, q in ipairs(list(when.notlog)) do if st.log[q] then return "no" end end
    for _, q in ipairs(list(when.ready)) do if not st.log[q] then return "no" end end
    if when.ready or when.item or when.noitem or when.minlevel or when.maxlevel then return "maybe" end
    return "yes"
end
-- Why a race or class can never take a quest (missing from Forever, closed to them), or nil.
local function staticRefusal(q, race, class)
    local quest = db.Quest[q]
    if not quest then return "not in Forever" end
    if not X.raceAllowed(quest, RACE_BIT[race]) then return "race" end
    local cm = quest[QK.requiredClasses] or 0
    if cm ~= 0 and (class == "*" or not X.hasBit(cm, X.CLASS_BITS[class] or 0)) then return "class" end
    return nil
end
-- Sticky quests a race or class does not have by that step: { [step uid] = { [quest] = true } }.
local stickyBad = {}

local function replay(race, class, repair)
    local key = race .. "|" .. class
    local st = { log = {}, size = 0, done = {}, waits = {}, missed = {}, accepted = {} }
    local peak = 0
    local function acceptNow(q)
        st.accepted[q] = true
        st.log[q] = true
        st.size = st.size + 1
        if st.size > peak then peak = st.size end
    end
    -- A missing prerequisite: done right before (same map), or the quest waits for it.
    local function fix(section, step, q, ids, how, depth)
        local function fulfil(p)
            if st.done[p] then return true end
            if not db.Quest[p] then return false end
            if st.log[p] then
                st.waits[p] = st.waits[p] or {}
                table.insert(st.waits[p], q)
                return "wait"
            end
            if not shareMap(p, q) then return false end
            local why, ids2, how2 = refusal(st, p, race, class)
            if why == "prerequisite" and depth < 3 then
                if fix(section, step, p, ids2, how2, depth + 1) ~= true then return false end
                why = refusal(st, p, race, class)
            end
            if why then return false end
            if repair then
                request(step, "mid", p, true, key)
                noteRepair(section, "prerequisite done first", p, q)
            end
            st.done[p] = true
            return true
        end
        if how == "single" then
            for _, p in ipairs(ids) do
                local r = fulfil(p)
                if r then return r end
            end
            return false
        end
        for _, p in ipairs(ids) do
            local r = fulfil(p)
            if r ~= true then return r end
        end
        return true
    end
    -- Last turn-in of each quest along the chain: a quest the route never turns in after its
    -- accept (a branch it leaves, a quest it gives up) is not taken; it would only fill the log.
    local lastTurnin, pos = {}, 0
    for _, section in ipairs(chains[race]) do
        for _, step in ipairs(section.out) do
            if applies(section, step, race, class) then
                pos = pos + 1
                for _, q in ipairs(step.turnin or {}) do lastTurnin[q] = pos end
            end
        end
    end
    pos = 0
    for _, section in ipairs(chains[race]) do
        for _, step in ipairs(section.out) do
            if applies(section, step, race, class) then
                pos = pos + 1
                -- A step under conditions plays only when they hold and all its actions can be
                -- played; otherwise it stays as written (its condition keeps it away in the game).
                local cond = step.when and whenState(step.when, st) or "yes"
                if step.when and cond ~= "no" then
                    -- (The step turns in first, then accepts: its turn-ins count as done.)
                    local turned = {}
                    for _, q in ipairs(step.turnin or {}) do
                        if not st.log[q] then cond = "no" else turned[#turned + 1] = q end
                    end
                    for _, q in ipairs(turned) do st.log[q], st.done[q] = nil, true end
                    for _, q in ipairs(step.accept or {}) do
                        if refusal(st, q, race, class) then cond = "no" end
                    end
                    for _, q in ipairs(turned) do st.log[q], st.done[q] = true, nil end
                    -- (Playable but for the log's room: played, its accepts left out for a full log.)
                end
                if cond == "no" then
                    for _, k in ipairs(QUEST_KEYS) do
                        for _, q in ipairs(step[k] or {}) do decide(step, k, q, key, staticRefusal(q, race, class) or true) end
                    end
                else
                for _, q in ipairs(step.turnin or {}) do
                    if st.log[q] then
                        decide(step, "turnin", q, key, true)
                        st.log[q] = nil
                        st.size = st.size - 1
                        st.done[q] = true
                        for _, w in ipairs(st.waits[q] or {}) do
                            if not st.done[w] and not st.log[w] and not refusal(st, w, race, class) then
                                local full = st.missed[w] or false
                                if repair then
                                    request(step, "after", w, full, key)
                                    noteRepair(section, "waits for its prerequisite", w, q)
                                end
                                if full then st.done[w] = true else acceptNow(w) end
                            end
                        end
                        st.waits[q] = nil
                    else
                        decide(step, "turnin", q, key, st.done[q] and "done" or "not in the log")
                        if not st.done[q] then st.missed[q] = true end
                    end
                end
                for _, q in ipairs(step.accept or {}) do
                    local why, ids, how = refusal(st, q, race, class)
                    if why == "prerequisite" then
                        local r = fix(section, step, q, ids, how, 0)
                        if r == "wait" then
                            why = "waits for its prerequisite"
                        elseif r then
                            why = refusal(st, q, race, class)
                        end
                    end
                    if not why and (lastTurnin[q] or 0) <= pos then why = "never turned in" end
                    if not why and st.size >= LOG_LIMIT then why = "quest log full" end
                    if why then
                        decide(step, "accept", q, key, why)
                    else
                        decide(step, "accept", q, key, true)
                        acceptNow(q)
                    end
                end
                for _, q in ipairs(step.complete or {}) do
                    decide(step, "complete", q, key, st.log[q] and true or "not in the log")
                end
                -- Quests the player drops from the log.
                for _, q in ipairs(type(step.abandon) == "table" and step.abandon or { step.abandon }) do
                    if st.log[q] then
                        st.log[q] = nil
                        st.size = st.size - 1
                    end
                end
                end
                -- Objectives kept in view: quests taken by now.
                for _, q in ipairs(type(step.sticky) == "table" and step.sticky or { step.sticky }) do
                    if not (st.accepted[q] or st.done[q]) or staticRefusal(q, race, class) then
                        stickyBad[step.uid] = stickyBad[step.uid] or {}
                        stickyBad[step.uid][q] = true
                    end
                end
            end
        end
    end
    return peak
end

-- "*": a character whose class has no step of its own in the race's chain, as
-- tools/check_guides.lua replays it; none when every class of the faction has some.
local STAR = {}
for _, race in ipairs(RACES) do
    local named = {}
    for _, section in ipairs(chains[race] or {}) do
        for _, step in ipairs(section.out) do
            for _, c in ipairs(step.classes or {}) do named[c] = true end
        end
    end
    for _, c in ipairs(CLASSES) do
        if not named[c] then STAR[race] = true end
    end
end

local function classKeys(race)
    local list = STAR[race] and { "*" } or {}
    for _, c in ipairs(CLASSES) do list[#list + 1] = c end
    return list
end

local function runReplays(repair)
    decision, insert, stickyBad = {}, {}, {}
    local peaks = {}
    for _, race in ipairs(RACES) do
        for _, class in ipairs(classKeys(race)) do
            peaks[race .. "|" .. class] = replay(race, class, repair)
        end
    end
    return peaks
end

-- Races and classes keeping an action (valid: decisions per "race|class" key): nil = all
-- those the step applies to, false = none, else groups { { races, classes }, ... } (races nil:
-- every race the step reaches; classes nil: every class).
local function groupsOf(perRace, reaching)
    local groups, order = {}, {}
    for _, race in ipairs(RACES) do
        local sig = perRace[race]
        if sig then
            if not groups[sig.key] then
                groups[sig.key] = { classes = sig.classes, races = {} }
                order[#order + 1] = sig.key
            end
            table.insert(groups[sig.key].races, race)
        end
    end
    table.sort(order)
    local list = {}
    for _, key in ipairs(order) do
        local g = groups[key]
        if #g.races == reaching then g.races = nil end
        list[#list + 1] = g
    end
    return list
end

local function restriction(section, step, valid)
    local perRace, reaching, full, any = {}, 0, true, false
    for _, race in ipairs(RACES) do
        local reach, ok = {}, {}
        for _, c in ipairs(step.classes or CLASSES) do
            if applies(section, step, race, c) then
                reach[#reach + 1] = c
                if valid[race .. "|" .. c] == true then ok[#ok + 1] = c end
            end
        end
        local star = STAR[race] and not step.classes and applies(section, step, race, "*")
        local starOk = star and valid[race .. "|*"] == true
        if #reach > 0 or star then
            reaching = reaching + 1
            if #ok < #reach or (star and not starOk) then full = false end
            if (starOk or not star) and #ok == #reach and (#reach > 0 or starOk) and not step.classes then
                perRace[race] = { key = "*" }
            elseif starOk and #ok == #reach then
                perRace[race] = { key = "*" }
            elseif #ok > 0 then
                perRace[race] = { key = table.concat(ok, ","), classes = ok }
            end
            if perRace[race] then any = true end
        end
    end
    if full then return nil end
    if not any then return false end
    return groupsOf(perRace, reaching)
end

-- Groups of the keys that asked for a repair.
local function groupsOfKeys(keys)
    local classes, star = {}, {}
    for k in pairs(keys) do
        local race, class = k:match("^(.-)|(.*)$")
        classes[race] = classes[race] or {}
        if class == "*" then star[race] = true else classes[race][class] = true end
    end
    local perRace = {}
    for _, race in ipairs(RACES) do
        if classes[race] then
            local list = {}
            for _, c in ipairs(CLASSES) do if classes[race][c] then list[#list + 1] = c end end
            if star[race] or (not STAR[race] and #list == #CLASSES) then
                perRace[race] = { key = "*" }
            else
                perRace[race] = { key = table.concat(list, ","), classes = list }
            end
        end
    end
    return groupsOf(perRace, #RACES)
end

local function intersect(a, b)
    if not a then return b end
    if not b then return a end
    local out = {}
    for _, v in ipairs(a) do if contains(b, v) then out[#out + 1] = v end end
    return out
end

local dropped = {}
local droppedSeen = {}
local function noteDrop(section, q, kind, why)
    local key = section.id .. kind .. q
    if droppedSeen[key] then return end
    droppedSeen[key] = true
    dropped[#dropped + 1] = { section = section.id, q = q, kind = kind, why = why }
end

-- Rebuilds each section's steps from the decisions: actions kept everywhere stay, those
-- some races or classes keep move to restricted steps, the others go; requested repairs
-- are inserted.
local function materialize()
    for _, section in ipairs(sections) do
        local out = {}
        for _, step in ipairs(section.out) do
            local ins = insert[step.uid]
            local function emit(req, where)
                local quest = db.Quest[req.q]
                local list = where == "before" and { "accept", "complete", "turnin" }
                    or (req.full and { "accept", "complete", "turnin" } or { "accept" })
                for _, g in ipairs(groupsOfKeys(req.keys)) do
                    local races, classes = intersect(step.races, g.races), intersect(step.classes, g.classes)
                    for _, k in ipairs(list) do
                        if k ~= "complete" or (quest and X.hasObjectives(quest)) then
                            local t = tagOf[req.q] or {}
                            -- (`inserted`, not `repair`: that key sends the player to repair their gear.)
                            out[#out + 1] = newStep({ [k] = { req.q }, races = races, classes = classes, inserted = true,
                                dungeon = t.dungeon, elite = t.elite })
                        end
                    end
                end
            end
            local function ordered(set)
                local list = {}
                for _, req in pairs(set) do list[#list + 1] = req end
                table.sort(list, function(a, b) return a.order < b.order end)
                return list
            end
            if ins then for _, req in ipairs(ordered(ins.before)) do emit(req, "before") end end
            if ins and next(ins.mid) then
                if step.turnin then
                    out[#out + 1] = newStep({ turnin = step.turnin, races = step.races, classes = step.classes,
                        dungeon = step.dungeon, elite = step.elite, when = step.when, base = true, src = step.src })
                    decision[out[#out].uid] = { turnin = (decision[step.uid] or {}).turnin }
                    step.turnin = nil
                end
                for _, req in ipairs(ordered(ins.mid)) do emit(req, "before") end
            end
            local d = decision[step.uid] or {}
            local extra = {}
            if step.sticky and stickyBad[step.uid] then
                local keep = {}
                for _, q in ipairs(type(step.sticky) == "table" and step.sticky or { step.sticky }) do
                    if not stickyBad[step.uid][q] then keep[#keep + 1] = q end
                end
                step.sticky = #keep > 0 and keep or nil
            end
            for _, k in ipairs(QUEST_KEYS) do
                if step[k] then
                    local keep = {}
                    for _, q in ipairs(step[k]) do
                        local valid = d[k] and d[k][q] or {}
                        local r = restriction(section, step, valid)
                        if r == nil then
                            keep[#keep + 1] = q
                        elseif r == false then
                            local why
                            for _, v in pairs(valid) do if v ~= true then why = v break end end
                            noteDrop(section, q, k, why or "never reached")
                        else
                            for _, g in ipairs(r) do
                                local sig = table.concat(g.races or {}, ",") .. ";" .. table.concat(g.classes or {}, ",")
                                extra[sig] = extra[sig] or { r = g, keys = {} }
                                extra[sig].keys[k] = extra[sig].keys[k] or {}
                                table.insert(extra[sig].keys[k], q)
                            end
                        end
                    end
                    step[k] = #keep > 0 and keep or nil
                end
            end
            if questActions(step) > 0 or hasOther(step) then
                out[#out + 1] = step
            elseif step.note and next(extra) then
                -- (The note goes with the quests that stay.)
                local sig = next(extra)
                extra[sig].note = step.note
            end
            for _, sig in ipairs(sortedKeys(extra)) do
                local e = extra[sig]
                local s2 = newStep({ races = intersect(step.races, e.r.races), classes = intersect(step.classes, e.r.classes),
                    dungeon = step.dungeon, elite = step.elite, optional = step.optional, note = e.note,
                    when = step.when, base = true, src = step.src })
                for k, list in pairs(e.keys) do s2[k] = list end
                out[#out + 1] = s2
            end
            if ins then for _, req in ipairs(ordered(ins.after)) do emit(req, "after") end end
        end
        section.out = out
    end
end

local function settle()
    -- Repairs first, then only what still fails is left out (that always ends: each pass
    -- only takes actions away).
    for pass = 1, 30 do
        runReplays(pass <= 6)
        local changed = next(insert) ~= nil
        if not changed then
            for _, section in ipairs(sections) do
                for _, step in ipairs(section.out) do
                    local d = decision[step.uid] or {}
                    for _, k in ipairs(QUEST_KEYS) do
                        for _, q in ipairs(step[k] or {}) do
                            if restriction(section, step, d[k] and d[k][q] or {}) ~= nil then changed = true end
                        end
                    end
                end
            end
        end
        if not changed then return end
        materialize()
    end
end
settle()

---------------------------------------------------------------------------
-- 4. Simulation (used by the additions, then for the final levels)
---------------------------------------------------------------------------
local INN_POINTS = {}
for _, inn in ipairs(D.innkeepers(FACTION)) do
    local name = Travel.INNS[inn.id]
    if name then
        INN_POINTS[name] = INN_POINTS[name] or {}
        table.insert(INN_POINTS[name], inn.point)
    end
end

local netCache = {}
local function netFor(race, sectionIndex, known)
    local k = race .. ":" .. sectionIndex
    if not netCache[k] then netCache[k] = Travel.new(D, FACTION, { areas = known }) end
    return netCache[k]
end

local jobsCache, workCache = {}, {}
local function questJobs(q, section)
    local k = q .. ":" .. section.id
    if jobsCache[k] == nil then
        local quest = db.Quest[q]
        local jobs, _, elite, unknown = D.questJobs(q, quest, mapSet(section.uiMaps))
        if #jobs == 0 or unknown then jobs, _, elite, unknown = D.questJobs(q, quest, nil) end
        jobsCache[k] = (#jobs > 0 and not unknown) and jobs or false
    end
    return jobsCache[k] or nil
end

local pointsCache = {}
local function questPoints(q, which)
    local k = which .. q
    if not pointsCache[k] then
        local quest = db.Quest[q]
        pointsCache[k] = quest and D.giverPoints(quest[which == "s" and QK.startedBy or QK.finishedBy]) or {}
    end
    return pointsCache[k]
end

local function nearest(points, pos, trip, level)
    local best, bestT
    for _, p in ipairs(points) do
        local t = pos and trip(pos, p, level) or 0
        if not bestT or t < bestT then best, bestT = p, t end
    end
    return best
end

-- Plays a race's chain as a warrior: { levels = { [step uid] = level }, nodes = { { p, level,
-- step, section, log, time, work } }, sections = { [id] = { from, to, time, turnins } },
-- accepted / turned = { [quest] = node } }; a node's `work`: the jobs of route_work.lua done there.
-- A step's conditions in the simulation: the player holds what the route buys or carries
-- (items are not simulated).
local function simWhen(when, st)
    if type(when) ~= "table" then return true end
    local function list(v)
        if type(v) == "number" then return { v } end
        return type(v) == "table" and v or {}
    end
    for _, q in ipairs(list(when.done)) do if not st.done[q] then return false end end
    for _, q in ipairs(list(when.notdone)) do if st.done[q] then return false end end
    for _, q in ipairs(list(when.log)) do if not st.log[q] then return false end end
    for _, q in ipairs(list(when.notlog)) do if st.log[q] then return false end end
    -- (Ready: objectives done along the way, which the simulation does not play; in the log.)
    for _, q in ipairs(list(when.ready)) do if not st.log[q] then return false end end
    if when.minlevel and st.level < when.minlevel then return false end
    if when.maxlevel and st.level > when.maxlevel then return false end
    return true
end

local function simulate(race)
    local st = { level = ENTRIES[race] and ENTRIES[race].level or 1, xp = 0, time = 0, pos = nil, log = {},
        size = 0, done = {}, bind = nil,
        hearthReady = 0 }
    local res = { levels = {}, nodes = {}, sections = {}, accepted = {}, turned = {}, visits = {}, xpOf = {} }
    local known = {}
    for _, a in ipairs(CAPITALS[FACTION]) do known[a] = true end
    local net, trip
    -- The step being played, for tools/route_why.lua: its time on the way, grinding, XP,
    -- quests and places (read only by the reasons, never by the route).
    local cur
    local function gain(amount)
        if st.level >= 60 then return end
        if cur then cur.xp = cur.xp + amount end
        st.level, st.xp = Model.addXP(st.level, st.xp, amount)
        if st.level >= 60 then st.level, st.xp = 60, 0 end
    end
    local function grindTo(target)
        local from = st.time
        while st.level < target and st.level < 60 do
            local need = Model.xpTo(st.level, st.xp, st.level + 1)
            st.time = st.time + need / Model.grindRate(st.level)
            st.level, st.xp = st.level + 1, 0
        end
        if cur then cur.grind = cur.grind + st.time - from end
    end
    local function moveTo(p, section, step)
        if not p then return end
        local t = 0
        if st.pos then
            t = trip(st.pos, p, st.level)
            if st.bind and st.time >= st.hearthReady then
                local th = P.hearthTime + trip(st.bind, p, st.level)
                if th + P.hearthGain < t then
                    t = th
                    st.hearthReady = st.time + P.hearthCooldown
                    if cur then cur.hearth = true end
                end
            end
            st.time = st.time + t
            if cur then cur.travel = cur.travel + t end
        end
        if cur then
            cur.places[#cur.places + 1] = p
            cur.legs[#cur.legs + 1] = t
        end
        st.pos = p
        res.nodes[#res.nodes + 1] = { p = p, level = st.level, step = step, section = section, log = st.size,
            time = st.time }
    end
    res.starts = {}
    for _, section in ipairs(chains[race]) do
        for _, a in ipairs(section.areas or {}) do known[a] = true end
        net = netFor(race, section.index, known)
        trip = function(a, b, level) return net:travel(a, b, level) end
        local done, log = {}, {}
        for q in pairs(st.done) do done[q] = true end
        for q, v in pairs(st.log) do log[q] = v end
        res.starts[section.id] = { level = st.level, xp = st.xp, pos = st.pos, done = done, log = log,
            bind = st.bind, hearthReady = math.max(0, st.hearthReady - st.time), trip = trip }
        local stats = { from = st.level + st.xp / (Model.XP_TO_LEVEL[st.level] or 1), time = st.time, turnins = 0 }
        for _, step in ipairs(section.out) do
            if applies(section, step, race, SIM_CLASS) and not tagged(step) and not step.deathskip
                and simWhen(step.when, st) then
                res.levels[step.uid] = st.level
                cur = { step = step, section = section, from = st.time, pos0 = st.pos, level = st.level, travel = 0,
                    grind = 0, xp = 0, turned = {}, accepted = {}, places = {}, legs = {} }
                if step.go then moveTo(D.point(step.go[1], step.go[2], step.go[3]), section, step) end
                for _, q in ipairs(step.turnin or {}) do
                    local quest = db.Quest[q]
                    -- A conditional turn-in is not worked here: objectives done along the
                    -- way, or an item the route buys, are turned in as they are; an item
                    -- found elsewhere (pages, crafts) is not counted on, out of the log.
                    local items = type(step.when) == "table" and X.heldItems(step.when.item) or {}
                    local held, bought = #items > 0, true
                    for _, p in ipairs(items) do if not routeBought[p[1]] then bought = false end end
                    local along = type(step.when) == "table" and (step.when.ready or held) and st.log[q] == 1
                    if along and held and not bought then
                        st.log[q] = nil
                        st.size = st.size - 1
                        quest = nil
                    elseif along then
                        st.log[q] = 2
                    end
                    if st.log[q] and quest then
                        if st.log[q] == 1 then
                            local jobs = questJobs(q, section)
                            if jobs then
                                local opts = Jobs.workOptions(jobs, st.level, trip)
                                local best = nearest((function()
                                    local e = {}
                                    for _, o in ipairs(opts) do e[#e + 1] = o.entry end
                                    return e
                                end)(), st.pos, trip, st.level)
                                for _, o in ipairs(opts) do
                                    if o.entry == best then
                                        moveTo(o.entry, section, step)
                                        res.nodes[#res.nodes].work = o.jobs
                                        st.time = st.time + o.time
                                        for _, j in ipairs(o.jobs) do
                                            if j.kills > 0 then gain(j.kills * Model.mobXP(j.mobLevel or st.level, st.level) * P.killXPMargin) end
                                        end
                                        st.pos = o.exit
                                        break
                                    end
                                end
                            end
                        end
                        moveTo(nearest(questPoints(q, "e"), st.pos, trip, st.level), section, step)
                        st.time = st.time + P.npcTime
                        local xp, estimated = D.questXP(q, quest)
                        local amount = Model.questXP(xp, quest[QK.questLevel] or st.level, st.level) * (estimated and P.killXPMargin or 1)
                        res.xpOf[q] = amount
                        cur.turned[#cur.turned + 1] = q
                        gain(amount)
                        st.log[q] = nil
                        st.size = st.size - 1
                        st.done[q] = true
                        res.turned[q] = #res.nodes
                        stats.turnins = stats.turnins + 1
                    end
                end
                for _, q in ipairs(step.accept or {}) do
                    local quest = db.Quest[q]
                    if quest and not st.log[q] and not st.done[q] and not step.optional then
                        local req = quest[QK.requiredLevel] or 0
                        if req > st.level then grindTo(req) end
                        local points = questPoints(q, "s")
                        if #points > 0 then moveTo(nearest(points, st.pos, trip, st.level), section, step) end
                        st.time = st.time + P.npcTime
                        st.log[q] = X.hasObjectives(quest) and 1 or 2
                        st.size = st.size + 1
                        res.accepted[q] = #res.nodes
                        cur.accepted[#cur.accepted + 1] = q
                    end
                end
                for _, q in ipairs(step.complete or {}) do
                    local quest = db.Quest[q]
                    if st.log[q] == 1 and quest then
                        local jobs = questJobs(q, section)
                        if jobs then
                            local opts = Jobs.workOptions(jobs, st.level, trip)
                            local best, bestC
                            for _, o in ipairs(opts) do
                                local c = o.time + (st.pos and trip(st.pos, o.entry, st.level) or 0)
                                if not bestC or c < bestC then best, bestC = o, c end
                            end
                            if best then
                                moveTo(best.entry, section, step)
                                res.nodes[#res.nodes].work = best.jobs
                                st.time = st.time + best.time
                                for _, j in ipairs(best.jobs) do
                                    if j.kills > 0 then gain(j.kills * Model.mobXP(j.mobLevel or st.level, st.level) * P.killXPMargin) end
                                end
                                st.pos = best.exit
                            end
                        end
                        st.log[q] = 2
                    end
                end
                if step.level then
                    grindTo(math.floor(step.level))
                    -- (level + xp, or a fraction of the level: grind that far into it.)
                    local want = step.xp or (step.level % 1) * (Model.XP_TO_LEVEL[st.level] or 0)
                    if st.level == math.floor(step.level) and want > st.xp then
                        local t = (want - st.xp) / Model.grindRate(st.level)
                        st.time = st.time + t
                        cur.grind = cur.grind + t
                        st.xp = want
                    end
                end
                for _, q in ipairs(type(step.abandon) == "table" and step.abandon or { step.abandon }) do
                    if st.log[q] then
                        st.log[q] = nil
                        st.size = st.size - 1
                    end
                end
                if step.talk or step.vendor or step.buy then st.time = st.time + P.npcTime end
                if step.sethearth then
                    local inn = nearest(INN_POINTS[step.sethearth] or {}, st.pos, trip, st.level)
                    if inn then
                        moveTo(inn, section, step)
                        st.bind = inn
                    end
                    st.time = st.time + P.npcTime
                end
                if step.hearth and st.bind then
                    st.pos = st.bind
                    st.time = st.time + P.hearthTime
                    st.hearthReady = st.time + P.hearthCooldown
                    cur.hearth, cur.travel = true, cur.travel + P.hearthTime
                    cur.places[#cur.places + 1] = st.bind
                    cur.legs[#cur.legs + 1] = P.hearthTime
                end
                if step.fly or step.train then st.time = st.time + P.npcTime end
                cur.to, cur.pos, cur.levelTo = st.time, st.pos, st.level
                res.visits[#res.visits + 1] = cur
                cur = nil
            end
        end
        stats.to = st.level + st.xp / (Model.XP_TO_LEVEL[st.level] or 1)
        stats.time = st.time - stats.time
        res.sections[section.id] = stats
    end
    res.time = st.time
    res.level = st.level
    return res
end

---------------------------------------------------------------------------
-- 3. Forever's own quests
---------------------------------------------------------------------------
local function classicQuests()
    local qdb = COMBINED:gsub("\\", "/"):match("^(.*)/src/corrections/")
    local f = qdb and io.open(qdb .. "/data/Classic/classicQuestDB.lua", "rb")
    if not f then return nil end
    local text = f:read("*a")
    f:close()
    local a = text:find("QuestieDB.questData = [[", 1, true)
    local b = a and text:find("]]", a, true)
    if not b then return nil end
    local chunk = loadstring(text:sub(a + #"QuestieDB.questData = [[", b - 1))
    return chunk and chunk() or nil
end


local additions = { added = {}, skipped = {} }
local function addForeverQuests(sims)
    local classic = classicQuests()
    if not classic then
        io.stderr:write("Classic quest list not found (QuestieDB's data/Classic): no Forever quests added.\n")
        return
    end
    -- Candidates: quests of the faction absent from Classic and from the route.
    local cands = {}
    for _, q in ipairs(sortedKeys(db.Quest)) do
        local quest = db.Quest[q]
        if route.exclude and route.exclude[q] then
            additions.skipped[#additions.skipped + 1] = { q = q, why = "left out by the route: " .. route.exclude[q] }
        elseif not classic[q] and not routeQuests[q] and (quest[QK.questLevel] or 0) > 0 then
            local races = {}
            for _, race in ipairs(RACES) do
                if X.raceAllowed(quest, RACE_BIT[race]) then races[#races + 1] = race end
            end
            local cm = quest[QK.requiredClasses] or 0
            local classes
            if cm ~= 0 then
                classes = {}
                for _, c in ipairs(CLASSES) do if X.hasBit(cm, X.CLASS_BITS[c]) then classes[#classes + 1] = c end end
            end
            -- QuestieDB's new content often has no class data: a quest given or ended by a
            -- class trainer is that class's quest.
            local trainer = D.trainerClass(quest)
            if trainer and not classes then classes = { trainer } end
            if classes then
                local mine = {}
                for _, c in ipairs(classes) do if contains(CLASSES, c) then mine[#mine + 1] = c end end
                classes = mine
            end
            local why
            if #races == 0 then why = "other faction"
            elseif classes and #classes == 0 then why = "classes of the other faction"
            elseif X.hasBit(quest[QK.specialFlags] or 0, 1) then why = "repeatable"
            elseif X.hasEntries(quest[QK.requiredSkill]) then why = "profession"
            elseif X.hasEntries(quest[QK.requiredMinRep]) then why = "reputation"
            elseif (quest[QK.parentQuest] or 0) ~= 0 then why = "subquest"
            end
            if not why then
                local starts = D.giverPoints(quest[QK.startedBy])
                local ends = D.giverPoints(quest[QK.finishedBy])
                local dungeon = D.questDungeon(quest)
                local jobs, _, elite, unknown = D.questJobs(q, quest, nil)
                if #starts == 0 then why = "no giver known"
                elseif #ends == 0 then why = "no turn-in known"
                elseif not dungeon and X.hasObjectives(quest) and (#jobs == 0 or unknown) then why = "objectives unknown to QuestieDB"
                else
                    local mob = 0
                    for _, j in ipairs(dungeon and {} or jobs) do
                        if j.mobLevel then mob = math.max(mob, Model.monsterLevel(j.mobLevel)) end
                    end
                    cands[#cands + 1] = { q = q, quest = quest, races = races, classes = classes, starts = starts,
                        ends = ends, jobs = (not dungeon and #jobs > 0) and jobs or nil, dungeon = dungeon,
                        elite = (not dungeon) and elite or nil, mob = mob, name = quest[QK.name] }
                end
            end
            if why and #races > 0 then additions.skipped[#additions.skipped + 1] = { q = q, why = why } end
        end
    end
    -- Prerequisites first.
    local isCand = {}
    for _, c in ipairs(cands) do isCand[c.q] = c end
    local depth = {}
    local function depthOf(q, seen)
        if depth[q] then return depth[q] end
        seen = seen or {}
        if seen[q] then return 0 end
        seen[q] = true
        local quest, d = db.Quest[q], 0
        for _, key in ipairs({ QK.preQuestSingle, QK.preQuestGroup }) do
            for _, p in ipairs(quest[key] or {}) do
                if p > 0 and isCand[p] then d = math.max(d, depthOf(p, seen) + 1) end
            end
        end
        depth[q] = d
        return d
    end
    table.sort(cands, function(a, b)
        local da, dbb = depthOf(a.q), depthOf(b.q)
        if da ~= dbb then return da < dbb end
        local la, lb = a.quest[QK.questLevel] or 0, b.quest[QK.questLevel] or 0
        if la ~= lb then return la < lb end
        return a.q < b.q
    end)

    -- Paths: each race's simulated nodes; a node's level is the lowest of the races that
    -- pass there (the same step), its log the fullest.
    local stepLevel, stepLog = {}, {}
    for _, race in ipairs(RACES) do
        for _, n in ipairs(sims[race].nodes) do
            local u = n.step.uid
            stepLevel[u] = math.min(stepLevel[u] or 99, n.level)
            stepLog[u] = math.max(stepLog[u] or 0, n.log)
        end
    end
    local paths = {}
    for _, race in ipairs(RACES) do
        local path = {}
        for _, n in ipairs(sims[race].nodes) do
            if path[#path] and path[#path].step == n.step then path[#path] = n else path[#path + 1] = n end
        end
        local byMap = {}
        for i, n in ipairs(path) do
            byMap[n.p.map] = byMap[n.p.map] or {}
            table.insert(byMap[n.p.map], i)
        end
        local edge = {}
        for i = 1, #path - 1 do edge[i] = Model.travel(path[i].p, path[i + 1].p, path[i].level) end
        -- Where the route turns in each quest for this race (path index).
        local doneAt = {}
        for i, n in ipairs(path) do
            for _, q in ipairs(n.step.turnin or {}) do doneAt[q] = doneAt[q] or i end
        end
        paths[race] = { nodes = path, byMap = byMap, edge = edge, doneAt = doneAt, extraLog = {} }
    end

    local inserts = {} -- [step uid] = { { kind, q, races, classes, tag }, ... }
    local placedName = {}
    for _, c in ipairs(cands) do
        local quest, q = c.quest, c.q
        local qLevel, req = quest[QK.questLevel] or 0, quest[QK.requiredLevel] or 0
        local placements = {}
        for _, race in ipairs(c.races) do
            local covered = placedName[c.name]
            if not (covered and covered[race]) then
                local P2 = paths[race]
                local N = #P2.nodes
                local function level(i) return stepLevel[P2.nodes[i].step.uid] or P2.nodes[i].level end
                local function detour(i, x)
                    local a = P2.nodes[i].p
                    if i == N then return Model.travel(a, x, level(i)) end
                    return Model.travel(a, x, level(i)) + Model.travel(x, P2.nodes[i + 1].p, level(i)) - P2.edge[i]
                end
                local function fits(L)
                    return req <= L and qLevel <= L + 2 and c.mob <= L + 1 and not Model.isQuestGrey(qLevel, L)
                end
                local earliest, ok = 1, true
                local single = quest[QK.preQuestSingle]
                if X.hasEntries(single) then
                    local best
                    for _, p in ipairs(single) do
                        local at = P2.doneAt[p]
                        if at and (not best or at < best) then best = at end
                    end
                    if best then earliest = best else ok = false end
                end
                for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                    if p > 0 then
                        if P2.doneAt[p] then earliest = math.max(earliest, P2.doneAt[p]) else ok = false end
                    end
                end
                if ok then
                    local A, W, T = {}, {}, {}
                    for _, p in ipairs(c.starts) do
                        for _, i in ipairs(P2.byMap[p.map] or {}) do
                            if i >= earliest and fits(level(i)) then
                                local v = detour(i, p)
                                if not A[i] or v < A[i] then A[i] = v end
                            end
                        end
                    end
                    local opts = c.jobs and Jobs.workOptions(c.jobs, math.max(1, qLevel), function(a, b, l)
                        return Model.travel(a, b, l)
                    end)
                    for _, o in ipairs(opts or {}) do
                        for _, i in ipairs(P2.byMap[o.entry.map] or {}) do
                            local v = detour(i, o.entry) + o.time
                            if not W[i] or v < W[i] then W[i] = v end
                        end
                    end
                    for _, p in ipairs(c.ends) do
                        for _, i in ipairs(P2.byMap[p.map] or {}) do
                            local v = detour(i, p)
                            if not T[i] or v < T[i] then T[i] = v end
                        end
                    end
                    -- Best accept i <= work j <= turn-in k, the log never full in between.
                    local sufT, sufTk = {}, {}
                    local bc, bk = math.huge, nil
                    for k = N, 1, -1 do
                        if T[k] and T[k] < bc then bc, bk = T[k], k end
                        sufT[k], sufTk[k] = bc, bk
                    end
                    local sufW, sufWj = {}, {}
                    local bw, bj = math.huge, nil
                    for j = N, 1, -1 do
                        local wc = opts and (W[j] or math.huge) or 0
                        local v = wc + sufT[j]
                        if v < bw then bw, bj = v, j end
                        sufW[j], sufWj[j] = bw, bj
                    end
                    local best, bi
                    for i = 1, N do
                        if A[i] and sufW[i] < math.huge then
                            local v = A[i] + sufW[i]
                            if not best or v < best then best, bi = v, i end
                        end
                    end
                    if best then
                        local j = sufWj[bi]
                        local k = sufTk[j]
                        local room = true
                        for x = bi, k do
                            local u = P2.nodes[x].step.uid
                            if (stepLog[u] or 0) + (P2.extraLog[x] or 0) >= LOG_LIMIT then room = false break end
                        end
                        if room then
                            placements[#placements + 1] = { race = race, i = bi, j = j, k = k,
                                a = P2.nodes[bi].step, w = P2.nodes[j].step, t = P2.nodes[k].step, level = level(bi) }
                        end
                    end
                end
            end
        end
        if #placements == 0 then
            additions.skipped[#additions.skipped + 1] = { q = q, why = "no place on the route at a fitting level" }
        else
            -- Races placed at the same steps share one set of steps.
            local groups = {}
            for _, pl in ipairs(placements) do
                local sig = pl.a.uid .. ":" .. pl.w.uid .. ":" .. pl.t.uid
                groups[sig] = groups[sig] or { pl = pl, races = {} }
                table.insert(groups[sig].races, pl.race)
            end
            for _, sig in ipairs(sortedKeys(groups)) do
                local g = groups[sig]
                local races = #g.races < #RACES and g.races or nil
                local tag = { dungeon = c.dungeon, elite = c.elite or nil }
                local function add(step, kind)
                    inserts[step.uid] = inserts[step.uid] or {}
                    table.insert(inserts[step.uid], { kind = kind, q = q, races = races, classes = c.classes, tag = tag })
                end
                add(g.pl.a, "accept")
                if c.dungeon then add(g.pl.a, "complete")
                elseif c.jobs then add(g.pl.w, "complete") end
                add(g.pl.t, "turnin")
                for _, race in ipairs(g.races) do
                    local P2 = paths[race]
                    P2.doneAt[q] = g.pl.k
                    for x = g.pl.i, g.pl.k do P2.extraLog[x] = (P2.extraLog[x] or 0) + 1 end
                    placedName[c.name] = placedName[c.name] or {}
                    placedName[c.name][race] = true
                end
                additions.added[#additions.added + 1] = { q = q, races = g.races, level = g.pl.level,
                    section = g.pl.a.section or "?" }
            end
        end
    end
    -- Into the sections, right after their anchor steps.
    for _, section in ipairs(sections) do
        local out = {}
        for _, step in ipairs(section.out) do
            out[#out + 1] = step
            for _, a in ipairs(inserts[step.uid] or {}) do
                out[#out + 1] = newStep({ [a.kind] = { a.q }, races = intersect(step.races, a.races) or a.races,
                    classes = a.classes, dungeon = a.tag.dungeon, elite = a.tag.elite and true or nil, added = true })
            end
        end
        section.out = out
    end
end

-- Section of each step, for the report of the additions.
local function indexSections()
    for _, section in ipairs(sections) do
        for _, step in ipairs(section.out) do step.section = section.id end
    end
end

indexSections()
local sims = {}
for _, race in ipairs(RACES) do sims[race] = simulate(race) end
if ADDITIONS then
    addForeverQuests(sims)
    -- The added quests checked like the rest (log, prerequisites): repaired or dropped.
    settle()
    indexSections()
    for _, race in ipairs(RACES) do sims[race] = simulate(race) end
end

---------------------------------------------------------------------------
-- 6. Free quests (tools/route_free.lua): left out by the route, almost free on its way
---------------------------------------------------------------------------
-- Where each step stands in the route: its section and the route step it comes after.
local routePos = {}
for _, section in ipairs(sections) do
    local src = 0
    for _, step in ipairs(section.out) do
        if step.base and step.src then src = step.src end
        routePos[step] = { section = section.id, after = src }
    end
end
local free
do
    -- (The route's own quests, those the replay left out included, and Forever's added ones.)
    local known = {}
    for q in pairs(routeQuests) do known[q] = true end
    for _, section in ipairs(sections) do
        for _, step in ipairs(section.out) do
            for _, k in ipairs(QUEST_KEYS) do
                for _, q in ipairs(step[k] or {}) do known[q] = true end
            end
        end
    end
    local paths = {}
    for _, race in ipairs(RACES) do
        local sim = sims[race]
        local trips, nodes = {}, {}
        for id, start in pairs(sim.starts) do trips[id] = start.trip end
        for _, n in ipairs(sim.nodes) do
            nodes[#nodes + 1] = { p = n.p, level = n.level, log = n.log, time = n.time, step = n.step,
                section = n.section.id, work = n.work }
        end
        paths[race] = { nodes = nodes, accepted = sim.accepted, turned = sim.turned, trips = trips }
    end
    free = Free.audit({
        db = db, D = D, Jobs = Jobs, faction = FACTION, races = RACES, raceBit = RACE_BIT, logLimit = LOG_LIMIT,
        known = known, exclude = route.exclude, paths = paths,
        rate = function(race, id)
            local s = sims[race].sections[id]
            if not s or s.time <= 0 then return nil end
            return (Free.totalXP(s.to) - Free.totalXP(s.from)) / s.time
        end,
        -- New steps follow a step every character of the race plays: no class, option nor condition.
        anchor = function(step)
            return not tagged(step) and not step.deathskip and not step.when and not step.optional and not step.classes
        end,
        position = function(step)
            local pos = routePos[step]
            return pos.section .. "#" .. pos.after
        end,
    })
end
---------------------------------------------------------------------------
-- 7. Reasons (tools/route_why.lua): what a surprising step brings, measured on the simulation
---------------------------------------------------------------------------
local reasons = Why.reasons({ db = db, races = RACES, sims = sims })
-- A detour also made for what the simulation does not value (a trainer, a vendor, a bank, a
-- flight path, the inn, an NPC to talk to), on any step of it for any class: its quests are not
-- the whole reason, so none is given.
do
    local order, at = {}, {}
    for _, section in ipairs(sections) do
        for _, step in ipairs(section.out) do
            order[#order + 1] = step
            at[step] = #order
        end
    end
    local OTHER = { "train", "vendor", "repair", "buy", "bank", "unbank", "sethearth", "fly", "talk" }
    for step, r in pairs(reasons) do
        if r.kind == "detour" then
            for i = at[step], at[r.last] or at[step] do
                for _, k in ipairs(OTHER) do
                    if order[i][k] ~= nil and not (k == "talk" and questActions(order[i]) > 0) then reasons[step] = nil end
                end
            end
        end
    end
end
-- Quests the audit looked at and left out, with the route's reason: in the section where it
-- measured them, else the first section on the map of their giver.
local leftOutBy, nLeftOut = {}, 0
do
    local firstOn = {}
    for i, section in ipairs(sections) do
        for _, m in ipairs(section.uiMaps or {}) do firstOn[m] = firstOn[m] or i end
    end
    for _, q in ipairs(sortedKeys(free.quests)) do
        local o = free.quests[q]
        local entry = Why.leftOut(o)
        if entry then
            local id = o.section
            if not id then
                local quest, best = db.Quest[q], nil
                for _, p in ipairs(quest and D.giverPoints(quest[QK.startedBy]) or {}) do
                    local i = firstOn[p.map]
                    if i and (not best or i < best) then best = i end
                end
                id = best and sections[best].id
            end
            if id then
                leftOutBy[id] = leftOutBy[id] or {}
                leftOutBy[id][q] = entry
                nLeftOut = nLeftOut + 1
            end
        end
    end
end
if WHY_REPORT then
    local list = {}
    for step, r in pairs(reasons) do list[#list + 1] = { step = step, r = r, pos = routePos[step] } end
    table.sort(list, function(a, b)
        if a.pos.section ~= b.pos.section then return a.pos.section < b.pos.section end
        return a.step.uid < b.step.uid
    end)
    for _, e in ipairs(list) do
        local r = e.r
        io.stderr:write(("why %-6s %-5s %-46s after %3d: %s %s, %s XP (named %s, chain %d, %d quests), %d s, level %d%s%s%s%s\n"):format(
            r.kind, r.short and "SHORT" or "", e.pos.section, e.pos.after, tostring(r.action),
            r.quest and questName(r.quest) or "-", Why.thousands(r.xp), Why.thousands(r.questXP), r.chain or 0,
            #r.quests, r.seconds, r.level, r.steps and (" " .. r.steps .. " steps") or "", r.back and " back" or "",
            r.continent and " continent" or "", r.next and (" next " .. r.next[1] .. "-" .. r.next[2]) or ""))
    end
end

---------------------------------------------------------------------------
-- The 10 % rule (--deviation): would our optimizer gain that much on a section?
---------------------------------------------------------------------------
-- A section's quests as the optimizer sees them (route_solver.lua), for the first race that
-- plays it, with the route order as the plan; then the optimizer's best order from it. Both
-- are costed the same way (time to the section's top level). Report only: the route order
-- stays unless a section gains 10 % of its time.
local deviations = {}
local function deviation(section, race, sim)
    local start = sim.starts[section.id]
    if not start then return nil end
    local trip = start.trip
    local quests, byId, seq = {}, {}, {}
    local function item(q)
        if byId[q] then return byId[q] end
        local quest = db.Quest[q]
        if not quest then return nil end
        local xp, estimated = D.questXP(q, quest)
        local it = { id = q, xp = xp, xpEstimated = estimated, qLevel = quest[QK.questLevel] or 0,
            reqLevel = quest[QK.requiredLevel] or 0, single = quest[QK.preQuestSingle],
            group = quest[QK.preQuestGroup], exclusive = quest[QK.exclusiveTo], forced = true }
        quests[#quests + 1] = it
        byId[q] = it
        return it
    end
    -- Actions in route order (the first complete of a quest stands for its work).
    local order = {}
    for _, step in ipairs(section.out) do
        if applies(section, step, race, SIM_CLASS) and not tagged(step) and not step.deathskip and not step.optional then
            for _, k in ipairs(QUEST_KEYS) do
                for _, q in ipairs(step[k] or {}) do order[#order + 1] = { kind = k, q = q } end
            end
        end
    end
    local accepted, turned = {}, {}
    for _, a in ipairs(order) do
        if a.kind == "accept" then accepted[a.q] = true end
        if a.kind == "turnin" then turned[a.q] = true end
    end
    for _, a in ipairs(order) do
        local q = a.q
        local quest = db.Quest[q]
        if quest and (accepted[q] or start.log[q]) then
            local it = item(q)
            if it and not it.ready then
                it.ready = true
                local jobs = X.hasObjectives(quest) and questJobs(q, section) or nil
                if start.log[q] then
                    it.inLog = true
                    it.completed = start.log[q] == 2 or not jobs
                else
                    local starts = D.giverPoints(quest[QK.startedBy])
                    it.accept = Jobs.spots(starts)
                end
                it.work = jobs and Jobs.workOptions(jobs, start.level, trip) or { { time = 0, dist = 0, jobs = {} } }
                if #it.work == 0 then it.work = { { time = 0, dist = 0, jobs = {} } } end
                it.turnin = turned[q] and Jobs.spots(D.giverPoints(quest[QK.finishedBy])) or nil
            end
        end
    end
    -- Quests whose giver or ender has no known spot are left as they are.
    local kept = {}
    for _, it in ipairs(quests) do
        if (it.inLog or it.accept) and (not turned[it.id] or it.turnin) then kept[#kept + 1] = it end
    end
    if #kept == 0 then return nil end
    local log, extra = {}, 0
    for q in pairs(start.log) do
        log[q] = true
        local found = false
        for _, it in ipairs(kept) do if it.id == q then found = true end end
        if not found then extra = extra + 1 end
    end
    local inst = Solver.prepare({
        quests = kept,
        start = { level = start.level, xp = start.xp, pos = start.pos, done = start.done, log = log, extraLog = extra,
            bind = start.bind and { at = start.bind, name = "inn" } or nil, hearthReady = start.hearthReady },
        -- (The level the route order reaches, rounded up: both orders are costed to it.)
        targetLevel = math.min(60, math.max(section.maxLevel, math.floor((sim.sections[section.id] or {}).to or 0) + 1)),
        maxLevel = 60, logLimit = LOG_LIMIT,
        questAbove = 60, mobAbove = 60, maxGrindStop = math.huge, travel = trip,
    })
    local index = {}
    for i, it in ipairs(inst.quests) do index[it.id] = i end
    local plan = { seq = {}, inc = {} }
    local used = {}
    local KIND = { accept = Solver.ACCEPT, complete = Solver.WORK, turnin = Solver.TURNIN }
    local function push(i, kind)
        local act = inst.qActs[i][kind]
        if act and not used[act] then
            used[act] = true
            plan.seq[#plan.seq + 1] = act
        end
    end
    for _, a in ipairs(order) do
        local i = index[a.q]
        if i and not inst.quests[i].unavailable then
            plan.inc[i] = true
            if a.kind == "turnin" then push(i, Solver.WORK) end
            push(i, KIND[a.kind])
        end
    end
    for i in pairs(plan.inc) do
        for _, kind in ipairs({ Solver.ACCEPT, Solver.WORK, Solver.TURNIN }) do
            local act = inst.qActs[i][kind]
            if act and not used[act] then plan.inc[i] = nil end
        end
    end
    local cleaned = {}
    for _, act in ipairs(plan.seq) do
        if plan.inc[inst.acts[act].q] then cleaned[#cleaned + 1] = act end
    end
    plan.seq = cleaned
    local baseCost = Solver.evaluate(inst, plan)
    if baseCost == math.huge then return { section = section.id, race = race, why = "route order not playable as a tour" } end
    local _, bestCost = Solver.optimize(inst, plan, { iterations = 3000, seed = 1 })
    return { section = section.id, race = race, base = baseCost, best = bestCost, gain = (baseCost - bestCost) / baseCost,
        quests = #plan.seq }
end
if DEVIATION then
    for _, section in ipairs(sections) do
        for _, race in ipairs(RACES) do
            if sims[race].starts and sims[race].starts[section.id] then
                local d = deviation(section, race, sims[race])
                if d then deviations[#deviations + 1] = d end
                break
            end
        end
    end
end

-- Final check: nothing left to repair.
local peaks = runReplays(false)
local residual = 0
for _, section in ipairs(sections) do
    for _, step in ipairs(section.out) do
        local d = decision[step.uid] or {}
        for _, k in ipairs(QUEST_KEYS) do
            for _, q in ipairs(step[k] or {}) do
                local r = restriction(section, step, d[k] and d[k][q] or {})
                if r ~= nil then
                    residual = residual + 1
                    if REPORT then
                        local why = {}
                        for key, v in pairs(d[k] and d[k][q] or {}) do if v ~= true then why[#why + 1] = key .. "=" .. v end end
                        table.sort(why)
                        io.stderr:write(("residual: %s %s %s: %s\n"):format(section.id, k, questName(q), table.concat(why, " ", 1, math.min(4, #why))))
                    end
                end
            end
        end
    end
end

---------------------------------------------------------------------------
-- 5. A trip right after the same trip
---------------------------------------------------------------------------
-- A step that only travels: a go and nothing to do there (the rule of tools/check_guides.lua).
local ACTION_KEYS = { "accept", "turnin", "complete", "level", "sethearth", "hearth", "deathskip", "train", "fly",
    "vendor", "repair", "kill", "collect", "talk", "gossip", "useitem", "buy", "object", "equip", "destroy", "bank",
    "unbank", "abandon", "patrol" }
local function onlyTravels(step)
    if not step.go then return false end
    for _, k in ipairs(ACTION_KEYS) do
        if step[k] ~= nil then return false end
    end
    return true
end
local function samePlace(a, b)
    return a[1] == b[1] and math.abs(a[2] - b[2]) <= 0.1 and math.abs(a[3] - b[3]) <= 0.1
end
local function written(step) return questActions(step) > 0 or hasOther(step) end
-- A character whose last step was a trip to the same place is there already: the trip would
-- pass on arrival and show the same line twice (the route repeats it, or the steps in between
-- are for other races or classes). The trip goes for those characters: left out when it is so
-- for all it applies to, else kept for the others (when races or classes can name them). A
-- step under conditions in between may have been played: the trip stays.
stats.tripsLeftOut, stats.tripsRestricted = 0, 0
local function dropRepeatedTrips(section)
    local out = {}
    for _, step in ipairs(section.out) do
        local keep = true
        if written(step) and onlyTravels(step) then
            local all, there, n = {}, {}, 0
            for _, race in ipairs(RACES) do
                for _, class in ipairs(CLASSES) do
                    if applies(section, step, race, class) then
                        local key = race .. "|" .. class
                        all[#all + 1] = { race = race, class = class, key = key }
                        for i = #out, 1, -1 do
                            local before = out[i]
                            if written(before) and applies(section, before, race, class) then
                                if not before.when and onlyTravels(before) and samePlace(before.go, step.go) then
                                    there[key] = true
                                    n = n + 1
                                end
                                break
                            end
                        end
                    end
                end
            end
            -- (A note of its own stays: the trip with it.)
            if n > 0 and n == #all and not step.note then
                keep = false
                stats.tripsLeftOut = stats.tripsLeftOut + 1
            elseif n > 0 and n < #all then
                local races, classes, inRaces, inClasses, allRaces, allClasses = {}, {}, {}, {}, {}, {}
                for _, c in ipairs(all) do
                    allRaces[c.race], allClasses[c.class] = true, true
                    if not there[c.key] then
                        if not inRaces[c.race] then races[#races + 1] = c.race end
                        if not inClasses[c.class] then classes[#classes + 1] = c.class end
                        inRaces[c.race], inClasses[c.class] = true, true
                    end
                end
                -- (Expressible: no character already there among those races and classes.)
                local named = true
                for _, c in ipairs(all) do
                    if there[c.key] and inRaces[c.race] and inClasses[c.class] then named = false end
                end
                if named then
                    local function count(set)
                        local k = 0
                        for _ in pairs(set) do k = k + 1 end
                        return k
                    end
                    if #races < count(allRaces) then step.races = races end
                    if #classes < count(allClasses) then step.classes = classes end
                    stats.tripsRestricted = stats.tripsRestricted + 1
                end
            end
        end
        if keep then out[#out + 1] = step end
    end
    section.out = out
end
for _, section in ipairs(sections) do dropRepeatedTrips(section) end

---------------------------------------------------------------------------
-- Output
---------------------------------------------------------------------------
local function quote(s) return (("%q"):format(s):gsub("\\\n", "\\n")) end
local function round2(x) return (("%.2f"):format(x):gsub("0+$", ""):gsub("%.$", "")) end
local function list(v)
    if #v == 1 then return tostring(v[1]) end
    local parts = {}
    for _, x in ipairs(v) do parts[#parts + 1] = tostring(x) end
    return "{ " .. table.concat(parts, ", ") .. " }"
end
-- Lua source of a value: numbers, strings, booleans, lists, tables with sorted keys.
local function luaValue(v)
    if type(v) == "string" then return quote(v) end
    if type(v) ~= "table" then return tostring(v) end
    if #v > 0 then
        local parts = {}
        for _, x in ipairs(v) do parts[#parts + 1] = luaValue(x) end
        return "{ " .. table.concat(parts, ", ") .. " }"
    end
    local keys = {}
    for k in pairs(v) do keys[#keys + 1] = k end
    table.sort(keys)
    local parts = {}
    for _, k in ipairs(keys) do parts[#parts + 1] = k .. " = " .. luaValue(v[k]) end
    return "{ " .. table.concat(parts, ", ") .. " }"
end
local function strList(v)
    local parts = {}
    for _, x in ipairs(v) do parts[#parts + 1] = quote(x) end
    return "{ " .. table.concat(parts, ", ") .. " }"
end
local function hm(seconds)
    local minutes = math.floor(seconds / 60 + 0.5)
    if minutes < 60 then return minutes .. " min" end
    return string.format("%d h %02d", math.floor(minutes / 60), minutes % 60)
end
local function levelText(x)
    local l = math.floor(x)
    return ("%d (%d%%)"):format(l, math.floor((x - l) * 100 + 0.5))
end

-- Level shown on each step: the lowest a race reaches there; steps no warrior plays (other
-- classes, options) take the level of the step before.
local shownLevel = {}
for _, race in ipairs(RACES) do
    for u, l in pairs(sims[race].levels) do shownLevel[u] = math.min(shownLevel[u] or 99, l) end
end

local DICTIONARIES = Texts.load(root .. "/tools/routes/locales")
local whyWritten, whyShort = {}, {}
local missingTexts = {}
local summary = {}
for _, section in ipairs(sections) do
    local file = section.file or ("Leveling/" .. FACTION .. "/" .. section.id:match("^leveling%-%a(%d+)") .. ".lua")
    local title = section.title .. (" (%d-%d)"):format(section.minLevel, section.maxLevel)
    local steps, last = {}, section.minLevel
    -- How the section begins: its intro on the first step; a go step to the first quest giver
    -- first, when the section before ends elsewhere (unless the route opens with its own go).
    local begin = TRAVEL[section.id] or {}
    local first
    for _, step in ipairs(section.out) do
        if not first and (questActions(step) > 0 or hasOther(step)) then first = step end
    end
    local opening = begin.intro
    if first and begin.travel and not first.go then
        -- Where the section's first step for every race takes place: its quest giver, the NPC
        -- it talks to, or its spot; on the section's maps first.
        local maps = mapSet(section.uiMaps)
        local function pointOf(step)
            local found = {}
            for _, k in ipairs({ "turnin", "accept", "complete" }) do
                for _, q in ipairs(step[k] or {}) do
                    for _, p in ipairs(questPoints(q, k == "accept" and "s" or "f")) do found[#found + 1] = p end
                end
            end
            for _, id in ipairs(type(step.talk) == "table" and step.talk or { step.talk }) do
                for _, p in ipairs(D.npcPoints(id)) do found[#found + 1] = p end
            end
            for _, s in ipairs(type(step.spots) == "table" and step.spots or {}) do
                found[#found + 1] = { map = s[1], px = s[2], py = s[3] }
            end
            for _, p in ipairs(found) do if maps[p.map] then return p end end
            return found[1]
        end
        local where
        for _, step in ipairs(section.out) do
            if not where and not step.races and not step.classes and not step.go
                and (questActions(step) > 0 or hasOther(step)) then
                where = pointOf(step)
            end
        end
        where = where or pointOf(first)
        if where then
            steps[#steps + 1] = { parts = { ("go = { %d, %s, %s }"):format(where.map, round2(where.px), round2(where.py)),
                "text = " .. quote(begin.travel) }, note = opening, level = shownLevel[first.uid] or last,
                text = begin.travel }
            opening = nil
        end
    end
    for _, step in ipairs(section.out) do
        if questActions(step) > 0 or hasOther(step) then
            local l = shownLevel[step.uid] or last
            last = l
            local parts = {}
            for _, k in ipairs(QUEST_KEYS) do
                if step[k] and #step[k] > 0 then parts[#parts + 1] = k .. " = " .. list(step[k]) end
            end
            if step.go then parts[#parts + 1] = ("go = { %d, %s, %s }"):format(step.go[1], step.go[2], step.go[3]) end
            if step.level then parts[#parts + 1] = "level = " .. step.level end
            if step.sethearth then parts[#parts + 1] = "sethearth = " .. quote(step.sethearth) end
            if step.hearth then parts[#parts + 1] = "hearth = true" end
            if step.deathskip then parts[#parts + 1] = "deathskip = true" end
            -- (A fly or train label becomes the step text: texts are translated, keys are not.)
            local text = step.text
            for _, k in ipairs({ "fly", "train" }) do
                if step[k] then
                    parts[#parts + 1] = k .. " = true"
                    if type(step[k]) == "string" and not text then text = step[k] end
                end
            end
            if step.dungeon then parts[#parts + 1] = "dungeon = " .. quote(step.dungeon) end
            if step.elite then parts[#parts + 1] = "elite = true" end
            if step.optional then parts[#parts + 1] = "optional = true" end
            -- The floor the route's note names (tools/guide_floor.lua): the arrow says it on
            -- arrival. Not on a trip: its point is the way in, the note is for the next step.
            local floor = not step.go and Floor.of(step.note)
            if floor then parts[#parts + 1] = "floor = " .. quote(floor) end
            for _, k in ipairs(GOAL_KEYS) do
                if step[k] ~= nil then parts[#parts + 1] = k .. " = " .. luaValue(step[k]) end
            end
            if step.races then parts[#parts + 1] = "races = " .. strList(step.races) end
            if step.classes then parts[#parts + 1] = "classes = " .. strList(step.classes) end
            if text then parts[#parts + 1] = "text = " .. quote(text) end
            if reasons[step] then
                parts[#parts + 1] = "why = " .. luaValue(Why.data(reasons[step]))
                whyWritten[reasons[step].kind] = (whyWritten[reasons[step].kind] or 0) + 1
                if reasons[step].short then whyShort[reasons[step].kind] = (whyShort[reasons[step].kind] or 0) + 1 end
            end
            local note = step.note
            if step == first and opening then note = note and (opening .. " " .. note) or opening end
            steps[#steps + 1] = { parts = parts, note = note, level = l, text = text }
        end
    end
    -- The simulated section, for each race that plays it.
    local played = {}
    for _, race in ipairs(RACES) do
        local s = sims[race].sections[section.id]
        if s then played[#played + 1] = { race = race, s = s } end
    end
    local head = "-- Simulated (warrior):"
    for _, p in ipairs(played) do
        head = head .. (" %s %s -> %s in %s, %d quests turned in;"):format(p.race, levelText(p.s.from),
            levelText(p.s.to), hm(p.s.time), p.s.turnins)
    end
    summary[#summary + 1] = { id = section.id, played = played, steps = #steps }
    local lines = {
        "-- Drafted by tools/write_leveling.lua from " .. ROUTE_NAME .. " and the QuestieDB",
        "-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:",
        "-- it is written again on each run. Quest ids only, names and places come from QuestieDB.",
        "-- French text: Ding/Locales/Guides/frFR/" .. file .. ".",
        (head:gsub(";$", ".")),
        "Ding.RegisterGuide({",
        "    id       = " .. quote(section.id) .. ",",
        "    title    = " .. quote(title) .. ",",
        "    faction  = " .. quote(FACTION) .. ",",
    }
    if section.races then lines[#lines + 1] = "    races    = " .. strList(section.races) .. "," end
    lines[#lines + 1] = ("    minLevel = %d, maxLevel = %d,"):format(section.minLevel, section.maxLevel)
    if section.next then lines[#lines + 1] = "    next     = " .. quote(section.next) .. "," end
    -- Quests the section leaves out, and why (the window beside an NPC says it).
    local left = leftOutBy[section.id]
    if left then
        lines[#lines + 1] = "    leftOut  = {"
        for _, q in ipairs(sortedKeys(left)) do lines[#lines + 1] = ("        [%d] = %s,"):format(q, luaValue(left[q])) end
        lines[#lines + 1] = "    },"
    end
    lines[#lines + 1] = "    steps    = {"
    for _, s in ipairs(steps) do
        local body = table.concat(s.parts, ", ")
        if s.note then
            lines[#lines + 1] = ("        { %s%s -- level %d"):format(body, body ~= "" and "," or "", s.level)
            lines[#lines + 1] = "          note = " .. quote(s.note) .. " },"
        else
            lines[#lines + 1] = ("        { %s }, -- level %d"):format(body, s.level)
        end
    end
    lines[#lines + 1] = "    },"
    lines[#lines + 1] = "})"
    if not DRY then
        local path = OUT .. "/" .. file
        local dir = path:match("^(.*)/[^/]+$")
        if package.config:sub(1, 1) == "\\" then
            os.execute('mkdir "' .. dir:gsub("/", "\\") .. '" 2>nul')
        else
            os.execute("mkdir -p '" .. dir .. "'")
        end
        local f = assert(io.open(path, "w"))
        f:write(table.concat(lines, "\n"), "\n")
        f:close()
        local guide = { id = section.id, title = title, steps = {} }
        for _, s in ipairs(steps) do guide.steps[#guide.steps + 1] = { text = s.text, note = s.note } end
        for _, m in ipairs(Texts.write(guide, file, DICTIONARIES, OUT_LOCALES or (root .. "/Ding/Locales/Guides"), ROUTE_NAME)) do
            missingTexts[m] = true
        end
    end
end

---------------------------------------------------------------------------
-- Report
---------------------------------------------------------------------------
print(("Leveling route %s (%s): %d sections"):format(ROUTE_NAME, FACTION, #sections))
for _, s in ipairs(summary) do
    local parts = {}
    for _, p in ipairs(s.played) do
        parts[#parts + 1] = ("%s %.2f->%.2f %s"):format(p.race, p.s.from, p.s.to, hm(p.s.time))
    end
    print(("%-48s %4d steps  %s"):format(s.id, s.steps, table.concat(parts, ", ")))
end
for _, race in ipairs(RACES) do
    print(("%s: level %d, %s in all"):format(race, sims[race].level, hm(sims[race].time)))
end
local nRepairs = 0
for _ in pairs(repairs) do nRepairs = nRepairs + 1 end
print(("Tags: %d quest actions split onto tagged steps, %d go steps joined to their death skip"):format(stats.split,
    stats.dieSpots))
print(("Forever repairs: %d, quest actions left out: %d, residual problems: %d"):format(nRepairs, #dropped, residual))
print(("Forever quests added: %d, not added: %d"):format(#additions.added, #additions.skipped))
print(("Trips right after the same trip: %d left out, %d kept for the races or classes that need them"):format(
    stats.tripsLeftOut, stats.tripsRestricted))
local peak = 0
for _, v in pairs(peaks) do peak = math.max(peak, v) end
print(("Quest log: %d at most"):format(peak))
if DEVIATION then
    print("\nThe 10 % rule: the section's simulated time in route order, and after our optimizer")
    local over = 0
    for _, d in ipairs(deviations) do
        if d.why then
            print(("  %-48s %s: %s"):format(d.section, d.race, d.why))
        else
            local mark = d.gain >= 0.10 and "  <- 10 % or more" or ""
            if d.gain >= 0.10 then over = over + 1 end
            print(("  %-48s %-9s %s -> %s (%4.1f %%, %d actions)%s"):format(d.section, d.race, hm(d.base), hm(d.best),
                100 * d.gain, d.quests, mark))
        end
    end
    print(("Sections where the optimizer gains 10 %% or more: %d"):format(over))
end
local nMissing = 0
for _ in pairs(missingTexts) do nMissing = nMissing + 1 end
if nMissing > 0 then print(("Texts without translation: %d (locale: text)"):format(nMissing)) end

-- Free quests: a warning for each one, the file of the audit (tools/audit_free_quests.lua).
local function stepLabel(step)
    local parts = {}
    for _, k in ipairs(QUEST_KEYS) do
        if step[k] and #step[k] > 0 then parts[#parts + 1] = k .. " " .. table.concat(step[k], ",") end
    end
    if step.go then parts[#parts + 1] = ("go %d %s,%s"):format(step.go[1], step.go[2], step.go[3]) end
    if step.level then parts[#parts + 1] = "level " .. step.level end
    for _, k in ipairs({ "talk", "vendor", "train", "fly", "sethearth", "hearth" }) do
        if step[k] then parts[#parts + 1] = k end
    end
    return #parts > 0 and table.concat(parts, ", ") or "?"
end
local freeOut, nFree, nBorder = {}, 0, 0
for _, f in ipairs(free.findings) do
    if f.kind == "free" then nFree = nFree + 1 else nBorder = nBorder + 1 end
    local steps = {}
    local function add(action, step)
        local pos = routePos[step]
        steps[#steps + 1] = { action = action, section = pos.section, after = pos.after, at = stepLabel(step) }
    end
    add("accept", f.accept)
    if f.work then add("complete", f.work) end
    add("turnin", f.turnin)
    freeOut[#freeOut + 1] = { q = f.q, name = f.name, level = f.level, kind = f.kind, why = f.why, races = f.races,
        xp = f.xp, estimated = f.estimated or nil, added = math.floor(f.added * 10 + 0.5) / 10,
        rate = math.floor(f.rate * 1000 + 0.5) / 1000, ratio = math.floor(f.ratio * 10 + 0.5) / 10,
        hold = math.floor(f.hold + 0.5), objectives = f.objectives, section = f.section, steps = steps }
    if f.kind == "free" then
        io.stderr:write(("warning: free quest left out: %s in %s, after route step %d: +%d XP for %.0f s (%.1f times"
            .. " the section's pace); add it to the route, or to its exclude list with the reason\n"):format(
            questName(f.q), f.section, steps[1].after, f.xp, f.added, f.ratio))
    end
end
print(("Free quests left out: %d, borderline: %d (tools/audit_free_quests.lua)"):format(nFree, nBorder))
do
    local all, short = 0, 0
    for _, n in pairs(whyWritten) do all = all + n end
    for _, n in pairs(whyShort) do short = short + n end
    print(("Reasons (tools/route_why.lua): %d steps, %d said under their step (%d detours, %d quests taken now"
        .. " or never), %d level steps; %d quests left out with the route's reason"):format(all, short,
        whyShort.detour or 0, whyShort.carry or 0, whyWritten.level or 0, nLeftOut))
end
if FREE_OUT then
    local f = assert(io.open(FREE_OUT, "w"))
    f:write("-- Free quests of ", ROUTE_NAME, " (tools/write_leveling.lua --free-quests)\n")
    f:write("return {\n    route = ", quote(ROUTE_NAME), ", faction = ", quote(FACTION), ",\n    findings = {\n")
    for _, r in ipairs(freeOut) do f:write("        ", luaValue(r), ",\n") end
    f:write("    },\n    skipped = {\n")
    for _, why in ipairs(sortedKeys(free.skipped)) do
        f:write("        { why = ", quote(why), ", quests = ", free.skipped[why], " },\n")
    end
    f:write("    },\n}\n")
    f:close()
end
if REPORT then
    print("\nRepairs:")
    for _, k in ipairs(sortedKeys(repairs)) do
        local r = repairs[k]
        print(("  %-44s %-28s %s (for %s)"):format(r.section, r.what, questName(r.q), questName(r.extra)))
    end
    print("\nLeft out:")
    for _, d in ipairs(dropped) do
        print(("  %-44s %-8s %-40s %s"):format(d.section, d.kind, questName(d.q), d.why))
    end
    print("\nForever quests added:")
    for _, a in ipairs(additions.added) do
        print(("  %-40s level %2d in %s%s"):format(questName(a.q), a.level, a.section,
            #a.races < #RACES and (" (" .. table.concat(a.races, ", ") .. ")") or ""))
    end
    print("\nForever quests not added:")
    for _, a in ipairs(additions.skipped) do print(("  %-40s %s"):format(questName(a.q), a.why)) end
    if nMissing > 0 then
        print("\nTexts without translation:")
        for _, m in ipairs(sortedKeys(missingTexts)) do print("  " .. m) end
    end
end
os.exit(residual > 0 and 1 or 0)
