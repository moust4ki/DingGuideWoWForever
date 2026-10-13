-- What Ding's guides need that DingDB lacks. For every quest a shipped guide uses: a giver with a
-- place (accept), a turn-in with a place (turnin), places for its objectives (complete); and the
-- NPCs, objects and items the steps name (talk, kill, collect, object, useitem). A target only
-- inside a dungeon counts as placed when the dungeon's entrances are known. Without them the
-- arrow has nothing to point at, unless the step carries its own `go` or `spots`: those steps are
-- counted apart ("covered"). Reads Ding/DB only (no QuestieDB needed). The answer to a gap is a
-- correction in tools/data/corrections (docs/dingdb.md).
-- usage: lua5.1 tools/audit_data.lua [<combined dir>] [--list]
--   <combined dir>  the QuestieDB export Ding/DB was built from: tells the NPCs and objects that
--                   are only inside a dungeon (no map outside: expected) from those with no place
--   --list          every gap (default: counts and the first ones of each kind)
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here .. "/.."
local listAll, combined = false, nil
for _, a in ipairs(arg) do
    if a == "--list" then listAll = true else combined = a end
end
local raw = combined and dofile(here .. "/questiedb_export.lua").load(combined)

-- With the export: "dungeon" when the NPC or object has spawns, but none on a map (inside an
-- instance), "none" when QuestieDB has no spawn at all; nil without the export.
local function why(kind, id)
    if not raw then return nil end
    local row = raw[kind][id]
    local spawns = row and row[kind == "Npc" and 7 or 4]
    if type(spawns) == "table" and next(spawns) then return "dungeon" end
    return "none"
end

---------------------------------------------------------------------------
-- DingDB, as the game loads it (English names)
---------------------------------------------------------------------------
local ns = {}
_G.GetLocale = function() return "enUS" end
for _, f in ipairs({ "DB.lua", "Zones.lua", "Quests.lua", "Npcs.lua", "Objects.lua", "Items.lua" }) do
    assert(loadfile(root .. "/Ding/DB/" .. f))("Ding", ns)
end
local DB = ns.DB
local L = DB.LAYOUT

local function hasSpawns(spawns)
    if type(spawns) ~= "table" then return false end
    for _, coords in pairs(spawns) do
        if type(coords) == "table" and #coords >= 2 then return true end
    end
    return false
end
-- Placed: spawns on a map, or only inside a dungeon whose entrances are known (Ding leads there).
local function entranceKnown(area) return area and DB.zones.dungeons[area] ~= nil end
local function npcPlaced(id)
    local r = DB.npcs[id]
    return r and (hasSpawns(r[L.Npc.spawns]) or entranceKnown(r[L.Npc.dungeon])) or false
end
local function objectPlaced(id)
    local r = DB.objects[id]
    return r and (hasSpawns(r[L.Object.spawns]) or entranceKnown(r[L.Object.dungeon])) or false
end
local function itemPlaced(id)
    local r = DB.items[id]
    if not r then return false end
    for _, n in ipairs(r[L.Item.npcDrops] or {}) do if npcPlaced(n) then return true end end
    for _, o in ipairs(r[L.Item.objectDrops] or {}) do if objectPlaced(o) then return true end end
    for _, v in ipairs(r[L.Item.vendors] or {}) do if npcPlaced(v) then return true end end
    return false
end
-- startedBy / finishedBy: { npcs?, objects?, items? }; placed when one of them has a place.
local function giversPlaced(givers)
    if type(givers) ~= "table" then return false end
    for _, id in ipairs(givers[1] or {}) do if npcPlaced(id) then return true end end
    for _, id in ipairs(givers[2] or {}) do if objectPlaced(id) then return true end end
    for _, id in ipairs(givers[3] or {}) do if itemPlaced(id) then return true end end
    return false
end
-- Why something has no place: "dungeon" (only inside an instance, expected: the route leads
-- to the dungeon), "none" (no spawn at all: data to add), or "?" without the export.
-- Content the player makes appear (a summoned demon, an item from another item, a quest's own
-- item) has no place of its own either: "made", not data to add.
local handedOut = {}
for _, rec in pairs(DB.quests) do
    local item = rec[L.Quest.sourceItemId]
    if item then handedOut[item] = true end
end
local function npcWhy(id)
    local name = DB.npcs[id] and DB.npcs[id][L.Npc.name]
    if type(name) == "string" and name:find("^Summoned ") then return "made" end
    return why("Npc", id) or "?"
end
local function objectWhy(id) return why("Object", id) or "?" end
local function itemWhy(id)
    local r = DB.items[id]
    for _, n in ipairs(r and r[L.Item.npcDrops] or {}) do if npcWhy(n) == "dungeon" then return "dungeon" end end
    for _, o in ipairs(r and r[L.Item.objectDrops] or {}) do if objectWhy(o) == "dungeon" then return "dungeon" end end
    if handedOut[id] then return "made" end
    local row = raw and raw.Item[id]
    if row and ((type(row[4]) == "table" and next(row[4])) or (type(row[6]) == "table" and next(row[6]))) then
        return "made"   -- from another item, or a quest's reward
    end
    return raw and "none" or "?"
end
local function giversWhy(givers)
    for _, id in ipairs(type(givers) == "table" and givers[1] or {}) do if npcWhy(id) == "dungeon" then return "dungeon" end end
    for _, id in ipairs(type(givers) == "table" and givers[2] or {}) do if objectWhy(id) == "dungeon" then return "dungeon" end end
    for _, id in ipairs(type(givers) == "table" and givers[3] or {}) do if itemWhy(id) == "dungeon" then return "dungeon" end end
    return raw and "none" or "?"
end

-- Objectives without a place: { { what, why } } (creatures, objects, items, kill credit).
local function objectivesUnplaced(q)
    local rec = DB.quests[q]
    local out = {}
    local o = rec[L.Quest.objectives] or {}
    for _, c in ipairs(o[1] or {}) do if not npcPlaced(c[1]) then out[#out + 1] = { "npc " .. c[1], npcWhy(c[1]) } end end
    for _, c in ipairs(o[2] or {}) do if not objectPlaced(c[1]) then out[#out + 1] = { "object " .. c[1], objectWhy(c[1]) } end end
    for _, c in ipairs(o[3] or {}) do if not itemPlaced(c[1]) then out[#out + 1] = { "item " .. c[1], itemWhy(c[1]) } end end
    for _, c in ipairs(o[5] or {}) do
        local any, inside = false, false
        for _, n in ipairs(c[1] or {}) do
            any = any or npcPlaced(n)
            inside = inside or npcWhy(n) == "dungeon"
        end
        if not any then out[#out + 1] = { "kill credit " .. tostring(c[2]), inside and "dungeon" or (raw and "none" or "?") } end
    end
    return out
end

---------------------------------------------------------------------------
-- The shipped guides, as the TOC lists them
---------------------------------------------------------------------------
local guides = {}
_G.Ding = {
    RegisterGuide = function(def) guides[#guides + 1] = def end,
    RegisterGuidePack = function() end, RegisterGuideTranslation = function() end,
}
for line in io.lines(root .. "/Ding/Ding.toc") do
    line = line:gsub("\r", "")
    if line:find("^Guides[\\/]") then
        assert(loadfile(root .. "/Ding/" .. line:gsub("\\", "/")))("Ding", {})
    end
end

local function each(v, fn)
    if type(v) == "number" then fn(v) elseif type(v) == "table" then
        for _, x in ipairs(v) do
            if type(x) == "number" then fn(x) elseif type(x) == "table" and type(x[1]) == "number" then fn(x[1]) end
        end
    end
end

-- gaps[kind][key] = { where = first place, count, covered = steps with their own place, why }
local gaps = {}
local function gap(kind, key, where, covered, reason)
    gaps[kind] = gaps[kind] or {}
    local g = gaps[kind][key]
    if not g then
        g = { where = where, count = 0, covered = 0, why = reason or "?" }
        gaps[kind][key] = g
    end
    g.count = g.count + 1
    if covered then g.covered = g.covered + 1 end
end

local quests, steps = {}, 0
for _, guide in ipairs(guides) do
    for i, step in ipairs(guide.steps or {}) do
        steps = steps + 1
        local where = ("%s, step %d"):format(guide.id, i)
        local own = step.go ~= nil or step.spots ~= nil or step.patrol ~= nil
        each(step.accept, function(q)
            quests[q] = true
            local rec = DB.quests[q]
            if not rec then gap("quest unknown", q, where, own, "none")
            elseif not giversPlaced(rec[L.Quest.startedBy]) then
                gap("giver without a place", q, where, own, giversWhy(rec[L.Quest.startedBy]))
            end
        end)
        each(step.turnin, function(q)
            quests[q] = true
            local rec = DB.quests[q]
            if rec and not giversPlaced(rec[L.Quest.finishedBy]) then
                gap("turn-in without a place", q, where, own, giversWhy(rec[L.Quest.finishedBy]))
            end
        end)
        each(step.complete, function(q)
            quests[q] = true
            if DB.quests[q] then
                for _, w in ipairs(objectivesUnplaced(q)) do
                    gap("objective without a place", q .. " (" .. w[1] .. ")", where, own, w[2])
                end
            end
        end)
        if type(step.talk) == "number" and not npcPlaced(step.talk) then
            gap("NPC to talk to without a place", step.talk, where, own, npcWhy(step.talk))
        end
        each(step.kill, function(n)
            if not npcPlaced(n) then gap("monster to kill without a place", n, where, own, npcWhy(n)) end
        end)
        each(step.collect, function(it)
            if not itemPlaced(it) then gap("item to collect without a source", it, where, own, itemWhy(it)) end
        end)
        if type(step.object) == "number" and not objectPlaced(step.object) then
            gap("object without a place", step.object, where, own, objectWhy(step.object))
        end
    end
end

---------------------------------------------------------------------------
-- Report: data to add first (no place at all, the step has none either)
---------------------------------------------------------------------------
local nQuests = 0
for _ in pairs(quests) do nQuests = nQuests + 1 end
print(("%d guides, %d steps, %d quests (DingDB: %s)"):format(#guides, steps, nQuests, DB.source))
if not raw then print("(pass the QuestieDB export to tell dungeon content from missing data)") end
local kinds = {}
for kind in pairs(gaps) do kinds[#kinds + 1] = kind end
table.sort(kinds)
local totals = { dungeon = 0, made = 0, none = 0, ["?"] = 0, covered = 0 }
for _, kind in ipairs(kinds) do
    local keys = {}
    for key in pairs(gaps[kind]) do keys[#keys + 1] = key end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local counts = { dungeon = 0, made = 0, none = 0, ["?"] = 0, covered = 0 }
    for _, key in ipairs(keys) do
        local g = gaps[kind][key]
        local c = g.covered == g.count and "covered" or g.why
        counts[c] = counts[c] + 1
        totals[c] = totals[c] + 1
    end
    print(("\n%s: %d (to add %d, inside a dungeon %d, made by the player %d, covered by the step %d%s)"):format(
        kind, #keys, counts.none, counts.dungeon, counts.made, counts.covered,
        counts["?"] > 0 and (", unknown " .. counts["?"]) or ""))
    local shown = 0
    for _, key in ipairs(keys) do
        local g = gaps[kind][key]
        local open = g.covered < g.count
        if listAll or (open and (g.why == "none" or g.why == "?") and shown < 12) then
            shown = shown + 1
            print(("  %-28s %s%s"):format(tostring(key), g.where,
                not open and "  (covered)" or ((g.why == "dungeon" or g.why == "made") and ("  (" .. g.why .. ")") or "")))
        end
    end
end
print(("\nTotal: %d to add, %d inside a dungeon, %d made by the player, %d covered by their step%s"):format(
    totals.none, totals.dungeon, totals.made, totals.covered, totals["?"] > 0 and (", " .. totals["?"] .. " unknown") or ""))
