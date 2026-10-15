-- Validates Ding guides against the QuestieDB Forever export.
-- usage: lua5.1 tools/check_guides.lua <combined dir> [guide.lua ...]
--        lua5.1 tools/check_guides.lua <combined dir> --addon <guide pack addon dir>
-- Without guide files, loads every "Guides\..." file listed in Ding/Ding.toc, then their
-- translations ("Locales\Guides\..."). With --addon, loads every file listed in the pack's
-- own .toc (docs/guide-packs.md): its pack and its guides are checked, Ding's guides are
-- only read for their ids (a pack may not reuse them, its `next` may lead to them).
--
-- Guides are chained through `next` (one guide, or one per faction: the chain forks) and
-- replayed in order, once per race (and per class when steps are class-specific). Checks: the quest exists and is open to the race and
-- class, its prerequisites were turned in earlier in the chain, it is in the log before
-- being worked on or turned in, it is not taken twice, the log never exceeds 20, the
-- items of `use` exist, and no character gets the same trip (`go` alone) twice in a row; a
-- `go` without a text is a warning. Translations: every guide text (title, text, note, sethearth) is translated
-- in each language (Ding's: the shipped ones; a pack's: those it has translations for), and
-- no translation is left without its English text.
-- Exit code: 0 when there is no error, 1 otherwise, 2 on bad usage.
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local X = dofile(here .. "/questiedb_export.lua")
local QK = X.QUEST

local MAX_LOG = 20
local BUILTIN_PACK, ZONES_PACK, ITEMS_PACK, CLASS_PACK = "ding", "ding-zones", "ding-items", "ding-class"
local DUNGEONS_PACK = "ding-dungeons"
local STEP_KEYS = {
    accept = true, turnin = true, complete = true, go = true, level = true, sethearth = true,
    train = true, hearth = true, fly = true, text = true, note = true, optional = true,
    faction = true, races = true, classes = true, radius = true, use = true,
    -- Tagged for Ding's options: optional shortcuts and extras nothing else depends on.
    deathskip = true, dungeon = true, elite = true, vendor = true, repair = true,
    -- Quests whose unfinished objectives stay listed under the following steps.
    sticky = true,
    -- Goals without a quest, conditions, travel and progression (phase 9).
    kill = true, collect = true, spots = true, talk = true, gossip = true, useitem = true, buy = true,
    object = true, equip = true, destroy = true, bank = true, unbank = true, keep = true, abandon = true,
    when = true, noauto = true, revive = true, patrol = true, xp = true,
    -- Why the guide plans the step (Ding/Core/Why.lua).
    why = true,
}
local WHEN_KEYS = {
    done = true, notdone = true, log = true, notlog = true, ready = true, item = true, noitem = true,
    minlevel = true, maxlevel = true,
}
local GUIDE_KEYS = {
    id = true, pack = true, title = true, faction = true, races = true, classes = true,
    minLevel = true, maxLevel = true, next = true, steps = true,
    -- Quests the section leaves out, and why (Ding/Core/Why.lua).
    leftOut = true,
}
-- `why` of a step and `leftOut` of a guide (docs/guide-packs.md, Ding/Core/Why.lua): the kinds
-- and the keys of each value ("id": a quest, "count", "number", "flag", "levels", "action").
local WHY_KINDS = { detour = true, carry = true, level = true }
local WHY_KEYS = {
    kind = "kind", text = "text", short = "flag", quest = "id", action = "action", chain = "count",
    quests = "count", xp = "number", total = "number", seconds = "number", back = "flag", continent = "flag",
    once = "flag", levels = "levels",
}
local LEFT_KINDS = {
    detour = true, long = true, away = true, far = true, log = true, prereq = true, version = true,
    exclusive = true, followup = true, unsure = true,
}
local LEFT_KEYS = { kind = "kind", text = "text", quest = "id", xp = "number", seconds = "number", turnin = "flag" }
local PACK_KEYS = { id = true, title = true, author = true, category = true }
-- Ding.GUIDE_CATEGORIES (Core/Registry.lua).
local CATEGORIES = { leveling = true, items = true, reputations = true, professions = true, class = true,
    dungeon = true }

local function usage()
    io.stderr:write("usage: lua5.1 tools/check_guides.lua <combined dir> [guide.lua ...]\n"
        .. "       lua5.1 tools/check_guides.lua <combined dir> --addon <guide pack addon dir>\n")
    os.exit(2)
end

local dir = arg[1]
if not dir then usage() end
local addonDir
if arg[2] == "--addon" then
    addonDir = arg[3] and arg[3]:gsub("[/\\]+$", "")
    if not addonDir or arg[4] then usage() end
end
local db = X.loadCorrected(dir)

---------------------------------------------------------------------------
-- Report
---------------------------------------------------------------------------
local counts = { error = 0, warning = 0 }
local seen = {}
local LABELS = { error = "ERROR", warning = "WARNING", info = "info" }

local function report(level, where, msg)
    local key = level .. where .. msg
    if seen[key] then return end
    seen[key] = true
    if counts[level] then counts[level] = counts[level] + 1 end
    print(string.format("[%s] %s: %s", LABELS[level], where, msg))
end

local function questName(id)
    local q = db.Quest[id]
    return string.format("%d \"%s\"", id, q and q[QK.name] or "?")
end

---------------------------------------------------------------------------
-- Loading guides with a fake Ding.RegisterGuide
---------------------------------------------------------------------------
local guides, order = {}, {}
local packs = { [BUILTIN_PACK] = { id = BUILTIN_PACK }, [ZONES_PACK] = { id = ZONES_PACK },
    [ITEMS_PACK] = { id = ITEMS_PACK }, [CLASS_PACK] = { id = CLASS_PACK }, [DUNGEONS_PACK] = { id = DUNGEONS_PACK } }
-- Ids of Ding's own guides, with --addon (read only, not checked).
local builtinIds = {}
local readingBuiltin = false

local function asList(value)
    if value == nil then return nil end
    if type(value) == "table" then return value end
    return { value }
end

-- Race and class names of a guide or a step: those of the client (UnitRace, UnitClass).
local function checkRacesClasses(def, where)
    for _, race in ipairs(def.races or {}) do
        if not X.RACE_BITS[race] and not X.RACE_FACTION_BITS[race] then
            report("error", where, "unknown race: " .. tostring(race))
        end
    end
    for _, class in ipairs(def.classes or {}) do
        if not X.CLASS_BITS[class] then report("error", where, "unknown class: " .. tostring(class)) end
    end
end

_G.Ding = {}
local currentFile

function Ding.RegisterGuidePack(def)
    local where = currentFile
    if type(def) ~= "table" or type(def.id) ~= "string" or def.id == "" then
        report("error", where, "RegisterGuidePack without an id")
        return
    end
    where = "pack " .. def.id
    if def.id == BUILTIN_PACK or def.id == ZONES_PACK or def.id == ITEMS_PACK or def.id == CLASS_PACK
        or def.id == DUNGEONS_PACK then
        report("error", where, "this id is one of Ding's own packs: choose another one")
        return
    end
    if packs[def.id] then report("error", where, "pack id already used by " .. packs[def.id].file) end
    for key in pairs(def) do
        if not PACK_KEYS[key] then report("warning", where, "unknown pack key: " .. tostring(key)) end
    end
    for _, key in ipairs({ "title", "author" }) do
        if def[key] ~= nil and type(def[key]) ~= "string" then report("error", where, key .. " must be a string") end
    end
    if def.title == nil then report("warning", where, "no title: the settings will show the id") end
    if def.category ~= nil and not CATEGORIES[def.category] then
        report("warning", where, "unknown category " .. tostring(def.category) .. ": the pack is listed under leveling")
    end
    packs[def.id] = { id = def.id, file = currentFile }
end

-- A number, or a list of numbers (nil when neither).
local function idList(v)
    if type(v) == "number" then return { v } end
    if type(v) ~= "table" then return nil end
    for _, x in ipairs(v) do
        if type(x) ~= "number" then return nil end
    end
    return v
end
-- A list of pairs or triplets { id, count[, extra] }: also one written alone, or a bare id.
local function tuples(v)
    if type(v) == "number" then return { { v, 1 } } end
    if type(v) ~= "table" then return nil end
    if type(v[1]) == "number" then return { v } end
    for _, t in ipairs(v) do
        if type(t) ~= "table" or type(t[1]) ~= "number" then return nil end
    end
    return v
end
local function point(p)
    return type(p) == "table" and #p == 3 and type(p[1]) == "number" and type(p[2]) == "number"
        and type(p[3]) == "number" and p[2] >= 0 and p[2] <= 100 and p[3] >= 0 and p[3] <= 100
end

-- A value of `why` or of a `leftOut` entry, against its keys; kinds: the known kinds.
local function checkReason(v, keys, kinds, at, what)
    if type(v) == "string" then
        if v == "" then report("error", at, what .. ": an empty text") end
        return
    end
    if type(v) ~= "table" then return report("error", at, what .. " expects a text or { kind = ..., ... }") end
    for key, x in pairs(v) do
        local kind = keys[key]
        local bad
        if not kind then
            report("warning", at, what .. ": unknown key " .. tostring(key))
        elseif kind == "kind" then
            if not kinds[x] then report("error", at, what .. ": unknown kind " .. tostring(x)) end
        elseif kind == "text" then
            bad = type(x) ~= "string" or x == ""
        elseif kind == "flag" then
            bad = x ~= true
        elseif kind == "id" then
            if type(x) ~= "number" then
                bad = true
            elseif not db.Quest[x] then
                report("error", at, ("%s: quest %d is not in QuestieDB"):format(what, x))
            end
        elseif kind == "action" then
            bad = x ~= "turnin" and x ~= "accept"
        elseif kind == "count" then
            bad = type(x) ~= "number" or x < 0 or x ~= math.floor(x)
        elseif kind == "number" then
            bad = type(x) ~= "number" or x <= 0
        elseif kind == "levels" then
            bad = type(x) ~= "table" or type(x[1]) ~= "number" or (x[2] ~= nil and type(x[2]) ~= "number")
        end
        if bad then report("error", at, what .. "." .. key .. ": wrong value") end
    end
    if v.kind == nil and v.text == nil then report("error", at, what .. " needs a kind or a text") end
end

-- The phase 9 keys of a step: shapes, and ids that QuestieDB knows (a warning otherwise).
local function checkGoals(step, at)
    local function known(kind, id)
        local rows = kind == "npc" and db.Npc or kind == "item" and db.Item or db.Object
        if not rows[id] then report("warning", at, ("%s %d is not in QuestieDB"):format(kind, id)) end
    end
    for _, key in ipairs({ "kill", "collect" }) do
        if step[key] ~= nil then
            local list = tuples(step[key])
            if not list then
                report("error", at, key .. " expects { { id, count }, ... }")
            else
                for _, t in ipairs(list) do
                    known(key == "kill" and "npc" or "item", t[1])
                    if t[2] ~= nil and (type(t[2]) ~= "number" or t[2] < 1) then
                        report("error", at, key .. ": a count is a number of 1 or more")
                    end
                end
            end
        end
    end
    if step.buy ~= nil then
        local list = tuples(step.buy)
        if not list then
            report("error", at, "buy expects { { itemId, count, vendorNpcId }, ... }")
        else
            for _, t in ipairs(list) do
                known("item", t[1])
                if t[3] ~= nil then
                    if type(t[3]) ~= "number" then report("error", at, "buy: the vendor is an NPC id") else known("npc", t[3]) end
                end
            end
        end
    end
    for _, k in ipairs({ { "talk", "npc" }, { "useitem", "item" }, { "equip", "item" }, { "destroy", "item" },
        { "bank", "item" }, { "unbank", "item" }, { "keep", "item" }, { "object", "object" } }) do
        local key, kind = k[1], k[2]
        if step[key] ~= nil then
            local list = idList(step[key])
            if not list then
                report("error", at, key .. " expects an id or a list of ids")
            else
                for _, id in ipairs(list) do known(kind, id) end
            end
        end
    end
    for _, key in ipairs({ "abandon", "noauto" }) do
        if step[key] ~= nil and not idList(step[key]) then report("error", at, key .. " expects quest ids") end
    end
    if step.gossip ~= nil then
        if type(step.gossip) ~= "number" or step.gossip < 1 or step.gossip % 1 ~= 0 then
            report("error", at, "gossip expects the option's position, 1 or more")
        elseif step.talk == nil and step.accept == nil and step.turnin == nil then
            report("warning", at, "gossip without talk nor quest NPC: whom to talk to?")
        end
    end
    if step.spots ~= nil then
        local ok = type(step.spots) == "table" and #step.spots > 0
        for _, p in ipairs(type(step.spots) == "table" and step.spots or {}) do ok = ok and point(p) end
        if not ok then report("error", at, "spots = { { uiMapId, x, y }, ... }, x and y from 0 to 100") end
    end
    if step.patrol ~= nil then
        local ok = type(step.patrol) == "table" and #step.patrol >= 2
        for _, p in ipairs(type(step.patrol) == "table" and step.patrol or {}) do ok = ok and point(p) end
        if not ok then report("error", at, "patrol = { { uiMapId, x, y }, ... }, two points or more, x and y 0-100") end
    end
    if step.revive ~= nil then
        if not step.deathskip then report("error", at, "revive belongs on a deathskip step") end
        if step.revive ~= "corpse" and not point(step.revive) then
            report("error", at, "revive = { uiMapId, x, y } or \"corpse\"")
        end
    end
    if step.xp ~= nil then
        if type(step.xp) ~= "number" or step.xp < 0 then report("error", at, "xp expects a number")
        elseif type(step.level) ~= "number" or step.level % 1 ~= 0 then
            report("error", at, "xp goes with a whole level")
        end
    end
    if step.when ~= nil then
        if type(step.when) ~= "table" then
            report("error", at, "when expects a table of conditions")
        else
            for k, v in pairs(step.when) do
                if not WHEN_KEYS[k] then
                    report("error", at, "when: unknown condition " .. tostring(k))
                elseif k == "minlevel" or k == "maxlevel" then
                    if type(v) ~= "number" then report("error", at, "when." .. k .. " expects a level") end
                elseif k == "item" then
                    -- (As the engine reads it: questiedb_export.lua heldItems.)
                    if not X.heldItems(v) then
                        report("error", at, "when.item expects an item id, { itemId, count }, a list of ids"
                            .. " or a list of pairs")
                    end
                elseif not idList(v) then
                    report("error", at, "when." .. k .. " expects ids")
                end
            end
            local lo, hi = step.when.minlevel, step.when.maxlevel
            if type(lo) == "number" and type(hi) == "number" and lo > hi then
                report("error", at, "when: minlevel above maxlevel")
            end
        end
    end
end

function Ding.RegisterGuide(def)
    if readingBuiltin then
        if type(def) == "table" and type(def.id) == "string" then builtinIds[def.id] = true end
        return
    end
    local where = currentFile
    if type(def) ~= "table" or type(def.id) ~= "string" or def.id == "" then
        report("error", where, "RegisterGuide without an id")
        return
    end
    where = def.id
    if guides[def.id] then report("error", where, "id already used by " .. guides[def.id].file) end
    if builtinIds[def.id] then report("error", where, "id already used by one of Ding's guides") end
    for key in pairs(def) do
        if not GUIDE_KEYS[key] then report("warning", where, "unknown guide key: " .. tostring(key)) end
    end
    if def.pack == nil then
        if addonDir then report("error", where, "no pack: the guide would be added to Ding's own guide") end
    elseif not packs[def.pack] then
        report("error", where, "unknown pack " .. tostring(def.pack) .. ": call Ding.RegisterGuidePack first")
    end
    if def.faction and not X.FACTION_RACES[def.faction] then
        report("error", where, "unknown faction: " .. tostring(def.faction))
    end
    if type(def.steps) ~= "table" or #def.steps == 0 then
        report("error", where, "no steps")
        def.steps = {}
    end
    def.races, def.classes = asList(def.races), asList(def.classes)
    checkRacesClasses(def, where)
    def.minLevel, def.maxLevel = def.minLevel or 1, def.maxLevel or 60
    def.file = currentFile
    for i, step in ipairs(def.steps) do
        local at = string.format("%s, step %d", def.id, i)
        if type(step) ~= "table" then
            report("error", at, "the step is not a table")
            def.steps[i] = {}
        else
            for key in pairs(step) do
                if not STEP_KEYS[key] then report("warning", at, "unknown step key: " .. tostring(key)) end
            end
            for _, key in ipairs({ "turnin", "accept", "complete", "sticky" }) do
                step[key] = asList(step[key])
                for _, q in ipairs(step[key] or {}) do
                    if type(q) ~= "number" then report("error", at, key .. " expects quest ids") end
                end
            end
            step.use = asList(step.use)
            for _, item in ipairs(step.use or {}) do
                if type(item) ~= "number" then
                    report("error", at, "use expects item ids")
                elseif not db.Item[item] then
                    report("error", at, ("item %d is not in QuestieDB"):format(item))
                end
            end
            step.races, step.classes = asList(step.races), asList(step.classes)
            checkRacesClasses(step, at)
            if step.faction ~= nil and not X.FACTION_RACES[step.faction] then
                report("error", at, "unknown faction: " .. tostring(step.faction))
            elseif step.faction and def.faction and step.faction ~= def.faction then
                report("warning", at, "a " .. step.faction .. " step in a guide for the " .. def.faction .. ": it never applies")
            end
            local go = step.go
            if go ~= nil then
                if type(go) ~= "table" or #go ~= 3 or type(go[1]) ~= "number" then
                    report("error", at, "go = { uiMapId, x, y }")
                elseif go[2] < 0 or go[2] > 100 or go[3] < 0 or go[3] > 100 then
                    report("error", at, "go coordinates outside 0-100")
                end
                -- (Without a text, the window only shows the coordinates.)
                if step.text == nil then
                    report("warning", at, "go without text: say where the player goes, or what for")
                end
            end
            if step.level ~= nil and type(step.level) ~= "number" then report("error", at, "level expects a number") end
            if step.sethearth ~= nil and (type(step.sethearth) ~= "string" or step.sethearth == "") then
                report("error", at, "sethearth expects the inn's name")
            end
            for _, key in ipairs({ "hearth", "deathskip", "elite" }) do
                if step[key] ~= nil and step[key] ~= true then report("error", at, key .. " expects true") end
            end
            for _, key in ipairs({ "vendor", "repair" }) do
                local v = step[key]
                if v ~= nil and v ~= true and (type(v) ~= "string" or v == "") then
                    report("error", at, key .. " expects true or a text")
                end
            end
            if step.deathskip and type(step.text) ~= "string" then
                report("error", at, "deathskip needs a text: what to do, the player chooses")
            end
            if step.dungeon ~= nil and (type(step.dungeon) ~= "string" or step.dungeon == "") then
                report("error", at, "dungeon expects the dungeon's name")
            end
            if step.dungeon and step.elite then report("warning", at, "dungeon and elite on the same step") end
            checkGoals(step, at)
            if step.why ~= nil then
                checkReason(step.why, WHY_KEYS, WHY_KINDS, at, "why")
                local why = step.why
                if type(why) == "table" and (why.kind == "detour" or why.kind == "carry") and not why.text
                    and not (why.quest and why.xp) then
                    report("error", at, "why: a " .. why.kind .. " names its quest and its XP (quest, xp)")
                end
            end
            -- Off, an option takes its whole step away: a shortcut never carries the route.
            for _, key in ipairs({ "sethearth", "hearth", "deathskip" }) do
                if step[key] then
                    for _, other in ipairs({ "accept", "turnin", "complete", "level", "train", "fly" }) do
                        if step[other] ~= nil then
                            report("warning", at, key .. " needs a step of its own, without " .. other
                                .. " (the option may take the whole step away)")
                        end
                    end
                end
            end
        end
    end
    -- A dungeon or elite quest is tagged on every one of its steps: without the option, the
    -- player never gets half of it.
    local tagged, plain = {}, {}
    for i, step in ipairs(def.steps) do
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            for _, q in ipairs(type(step[key]) == "table" and step[key] or {}) do
                local set = (step.dungeon or step.elite) and tagged or plain
                set[q] = set[q] or i
            end
        end
    end
    local mixed = {}
    for q in pairs(tagged) do if plain[q] then mixed[#mixed + 1] = q end end
    table.sort(mixed)
    for _, q in ipairs(mixed) do
        report("warning", string.format("%s, step %d", def.id, plain[q]),
            questName(q) .. " has dungeon or elite steps: tag this one too")
    end
    -- Quests the section leaves out: not quests its own steps take.
    if def.leftOut ~= nil then
        if type(def.leftOut) ~= "table" then
            report("error", where, "leftOut expects { [quest id] = reason }")
        else
            for q, entry in pairs(def.leftOut) do
                local at = where .. ", leftOut"
                if type(q) ~= "number" then
                    report("error", at, "leftOut keys are quest ids")
                else
                    at = at .. " " .. q
                    if not db.Quest[q] then report("warning", at, ("quest %d is not in QuestieDB"):format(q)) end
                    if tagged[q] or plain[q] then
                        report("warning", at, questName(q) .. " is left out, yet a step of the guide does it")
                    end
                    checkReason(entry, LEFT_KEYS, LEFT_KINDS, at, "leftOut")
                end
            end
        end
    end
    if type(def.next) == "table" then
        for faction, id in pairs(def.next) do
            if not X.FACTION_RACES[faction] then
                report("error", where, "next: unknown faction " .. tostring(faction))
            elseif type(id) ~= "string" then
                report("error", where, "next." .. faction .. " expects a guide id")
            end
        end
    elseif def.next ~= nil and type(def.next) ~= "string" then
        report("error", where, "next expects a guide id, or { Alliance = id, Horde = id }")
    end
    guides[def.id] = def
    order[#order + 1] = def.id
end

-- [locale][guide id] = { map = { [English] = translated }, file = path }
local translations = {}
function Ding.RegisterGuideTranslation(locale, guideId, map)
    local where = currentFile
    if type(locale) ~= "string" or type(guideId) ~= "string" or type(map) ~= "table" then
        report("error", where, "RegisterGuideTranslation(locale, guideId, map) expected")
        return
    end
    translations[locale] = translations[locale] or {}
    local entry = translations[locale][guideId] or { map = {}, file = where }
    translations[locale][guideId] = entry
    for english, text in pairs(map) do
        if type(english) ~= "string" or type(text) ~= "string" then
            report("error", where, "translation " .. locale .. " of " .. guideId .. ": strings expected")
        else
            entry.map[english] = text
        end
    end
end

-- Files listed in a .toc: { path relative to the addon }, nil when it cannot be read.
local function tocFiles(toc, keep)
    local handle = io.open(toc, "r")
    if not handle then return nil end
    local files = {}
    for line in handle:lines() do
        line = line:gsub("\r", ""):gsub("%s+$", "")
        if line ~= "" and not line:find("^#") and (not keep or keep(line)) then
            files[#files + 1] = (line:gsub("\\", "/"))
        end
    end
    handle:close()
    return files
end

-- Runs a file of an addon as the game does: (addon name, addon namespace).
local function loadFile(file, addon, namespace)
    currentFile = file
    local chunk, err = loadfile(file)
    if not chunk then
        report("error", file, "syntax error: " .. tostring(err))
        return
    end
    local ok, runErr = pcall(chunk, addon, namespace)
    if not ok then report("error", file, "error while loading: " .. tostring(runErr)) end
end

local function cannotRead(path)
    io.stderr:write("Cannot read " .. path .. "\n")
    os.exit(2)
end

local files = {}
local addonName = "Ding"
local dingToc = root .. "/Ding/Ding.toc"
if addonDir then
    local builtin = tocFiles(dingToc, function(line) return line:find("^Guides[\\/]") ~= nil end)
    if not builtin then cannotRead(dingToc) end
    readingBuiltin = true
    for _, path in ipairs(builtin) do loadFile(root .. "/Ding/" .. path, "Ding", {}) end
    readingBuiltin = false
    addonName = addonDir:match("([^/\\]+)$")
    local toc = addonDir .. "/" .. addonName .. ".toc"
    local listed = tocFiles(toc)
    if not listed then cannotRead(toc) end
    for _, path in ipairs(listed) do files[#files + 1] = addonDir .. "/" .. path end
else
    for i = 2, #arg do files[#files + 1] = arg[i] end
    if #files == 0 then
        local listed = tocFiles(dingToc, function(line)
            return line:find("^Guides[\\/]") or line:find("^Locales[\\/]Guides[\\/]")
        end)
        if not listed then cannotRead(dingToc) end
        for _, path in ipairs(listed) do files[#files + 1] = root .. "/Ding/" .. path end
    end
end

local namespace = {}
for _, file in ipairs(files) do loadFile(file, addonName, namespace) end
print(string.format("%d guide(s) loaded from %d file(s)", #order, #files))

---------------------------------------------------------------------------
-- Chains
---------------------------------------------------------------------------
-- The guides a guide continues into: { { id, faction }, ... }; faction is set when `next`
-- gives one guide per faction (a race that picks its side on the way, the Skyborne).
local function nextGuides(g)
    if type(g.next) == "table" then
        local out = {}
        for _, faction in ipairs({ "Alliance", "Horde" }) do
            if type(g.next[faction]) == "string" then out[#out + 1] = { id = g.next[faction], faction = faction } end
        end
        return out
    end
    return type(g.next) == "string" and { { id = g.next } } or {}
end

local referenced = {}
for _, id in ipairs(order) do
    for _, n in ipairs(nextGuides(guides[id])) do
        if guides[n.id] then
            referenced[n.id] = true
        elseif builtinIds[n.id] then
            report("info", id, "continues into Ding's guide " .. n.id)
        else
            report("warning", id, "next guide not found: " .. tostring(n.id))
        end
    end
end

-- Chains: from each guide no other one leads to, along `next`; a `next` per faction forks
-- the chain, one per faction (chain.faction).
local chains = {}
local inChain = {}
local function walk(g, chain, visited, faction)
    while g do
        if visited[g.id] then
            report("error", chain[1].id, "the chain loops on " .. g.id)
            break
        end
        visited[g.id] = true
        inChain[g.id] = true
        chain[#chain + 1] = g
        local nexts = nextGuides(g)
        if nexts[1] and nexts[1].faction then
            for _, n in ipairs(nexts) do
                local copy, seen = {}, {}
                for i, c in ipairs(chain) do copy[i] = c end
                for k in pairs(visited) do seen[k] = true end
                walk(guides[n.id], copy, seen, n.faction)
            end
            return
        end
        g = nexts[1] and guides[nexts[1].id]
    end
    chain.faction = faction
    chains[#chains + 1] = chain
end
for _, id in ipairs(order) do
    if not referenced[id] then walk(guides[id], {}, {}, nil) end
end
for _, id in ipairs(order) do
    if not inChain[id] then report("error", id, "guide caught in a loop of next") end
end

---------------------------------------------------------------------------
-- Replay
---------------------------------------------------------------------------
local function contains(list, value)
    if not list then return true end
    for _, v in ipairs(list) do if v == value then return true end end
    return false
end

-- Races a chain is written for: the first guide's races, else its faction's races, with the
-- two-sided races its steps name (a class guide's Skyborne steps).
local function chainRaces(chain)
    local first = chain[1]
    if first.races then return first.races end
    local side = first.faction or chain.faction
    if side then
        local list, known = {}, {}
        for _, race in ipairs(X.FACTION_RACES[side]) do
            list[#list + 1] = race
            known[race] = true
        end
        for _, g in ipairs(chain) do
            for _, step in ipairs(g.steps) do
                for _, race in ipairs(step.races or {}) do
                    if not known[race] and X.raceBit(race, side) then
                        known[race] = true
                        list[#list + 1] = race
                    end
                end
            end
        end
        return list
    end
    local all = {}
    for race in pairs(X.RACE_BITS) do all[#all + 1] = race end
    table.sort(all)
    return all
end

-- "*" = a character whose class has no specific step; then every class named by a step. A
-- chain for some classes only (a class guide's `classes`): those classes.
local function chainClasses(chain)
    if chain[1].classes then return chain[1].classes end
    local list, known = {}, {}
    for _, g in ipairs(chain) do
        for _, step in ipairs(g.steps) do
            for _, c in ipairs(step.classes or {}) do
                if not known[c] then
                    known[c] = true
                    list[#list + 1] = c
                end
            end
        end
    end
    -- "*" stands for a class with no step of its own: none left when every class of the
    -- chain's faction has some.
    local faction = chain[1].faction or chain.faction
    local all = faction and X.FACTION_CLASSES[faction]
    local missing = not all
    for _, c in ipairs(all or {}) do
        if not known[c] then missing = true end
    end
    if missing then table.insert(list, 1, "*") end
    return list
end

-- The side of a race (a race found on both sides: none, the chain's branch gives it).
local RACE_SIDE = {}
for side, races in pairs(X.FACTION_RACES) do
    for _, race in ipairs(races) do RACE_SIDE[race] = side end
end

-- A step that only travels: a go and nothing for the player to do there.
local ACTION_KEYS = { "accept", "turnin", "complete", "level", "sethearth", "hearth", "deathskip", "train", "fly",
    "vendor", "repair", "kill", "collect", "talk", "gossip", "useitem", "buy", "object", "equip", "destroy", "bank",
    "unbank", "abandon", "patrol" }
local function onlyTravels(step)
    if type(step.go) ~= "table" or type(step.go[2]) ~= "number" or type(step.go[3]) ~= "number" then return false end
    for _, key in ipairs(ACTION_KEYS) do
        if step[key] ~= nil then return false end
    end
    return true
end
local function samePlace(a, b)
    return a[1] == b[1] and math.abs(a[2] - b[2]) <= 0.1 and math.abs(a[3] - b[3]) <= 0.1
end

-- A quest's preQuestSingle, or nil. A list naming the quest itself is how the data writes a
-- group of alternatives (Call of Earth: one version per start), not a prerequisite: none, as the
-- engine reads it (Engine:CatchUp leaves out the quests of the step itself).
local function prereqSingle(q, quest)
    local single = quest[QK.preQuestSingle]
    if not X.hasEntries(single) then return nil end
    for _, p in ipairs(single) do
        if p == q then return nil end
    end
    return single
end

-- side: the replayed character's faction.
local function stepApplies(guide, step, race, class, side)
    if guide.races and not contains(guide.races, race) then return false end
    if step.faction and step.faction ~= side then return false end
    if step.races and not contains(step.races, race) then return false end
    if class == "*" then return step.classes == nil end
    if guide.classes and not contains(guide.classes, class) then return false end
    return contains(step.classes, class)
end

local function replay(chain, race, class)
    -- (A race found on both sides has one bit per faction: the side of the chain's branch.)
    local raceBit = X.raceBit(race, chain.faction or chain[1].faction)
    if not raceBit then
        report("error", chain[1].id, "unknown race: " .. tostring(race))
        return
    end
    local log, logSize = {}, 0
    local turnedIn, worked, accepted = {}, {}, {}
    -- Turned in, and accepted, by steps that are no dungeon or elite extra: the guide must
    -- hold without its extras (their options are off by default).
    local mainTurnedIn, mainAccepted = {}, {}
    local maxLog, maxAt = 0, "-"

    -- The classes of the guide being replayed (a class guide: every step is for them).
    local guideClasses
    local function checkQuest(at, step, q)
        local quest = db.Quest[q]
        if not quest then
            report("error", at, "quest not in QuestieDB: " .. q)
            return nil
        end
        if not X.raceAllowed(quest, raceBit) then
            report("error", at, questName(q) .. " is not available to the race " .. race)
        end
        local classMask = quest[QK.requiredClasses] or 0
        if classMask ~= 0 then
            if not (step.classes or guideClasses) then
                report("error", at, questName(q) .. " is for some classes only: add classes = { ... } to the step")
            elseif not X.hasBit(classMask, X.CLASS_BITS[class] or 0) then
                report("error", at, questName(q) .. " is not available to the class " .. class)
            end
        end
        return quest
    end

    -- Items the player was told to buy by now.
    local bought = {}
    -- The item a quest's turn-in needs that the player brings from elsewhere: one sold by
    -- vendors or dropped by nothing (not the item the quest gives, nor the one that starts it).
    local function carried(quest)
        local objectives = quest[QK.objectives]
        local starts = quest[QK.startedBy] or {}
        for _, o in ipairs(objectives and objectives[3] or {}) do
            local id, item = o[1], db.Item[o[1]]
            local given = id == quest[QK.sourceItem]
            for _, s in ipairs(starts[3] or {}) do if s == id then given = true end end
            if item and not given then
                local sold = X.hasEntries(item[X.ITEM.vendors])
                local drops = X.hasEntries(item[X.ITEM.npcDrops]) or X.hasEntries(item[X.ITEM.objectDrops])
                    or X.hasEntries(item[X.ITEM.itemDrops])
                if sold or not drops then return id, item end
            end
        end
        return nil
    end
    local function rewarded(item)
        for _, p in ipairs(item[X.ITEM.questRewards] or {}) do
            if turnedIn[p] then return true end
        end
        return false
    end
    local function heldBy(when, id)
        for _, p in ipairs(type(when) == "table" and X.heldItems(when.item) or {}) do
            if p[1] == id then return true end
        end
        return false
    end

    -- A step's conditions (`when`): "yes", "no", or "maybe" when one of them is unknown to
    -- the replay (items in the bags, the player's level).
    local function whenState(when)
        if type(when) ~= "table" then return "yes" end
        local state = "yes"
        local function each(v, test)
            for _, q in ipairs(idList(v) or {}) do
                if not test(q) then return false end
            end
            return true
        end
        if when.done and not each(when.done, function(q) return turnedIn[q] end) then return "no" end
        if when.notdone and not each(when.notdone, function(q) return not turnedIn[q] end) then return "no" end
        if when.log and not each(when.log, function(q) return log[q] end) then return "no" end
        if when.notlog and not each(when.notlog, function(q) return not log[q] end) then return "no" end
        if when.ready then
            if not each(when.ready, function(q) return log[q] end) then return "no" end
            if not each(when.ready, function(q) return worked[q] end) then state = "maybe" end
        end
        if when.item or when.noitem or when.minlevel or when.maxlevel then state = "maybe" end
        return state
    end
    -- Whether the step's quest actions can all be played now (for a step whose conditions the
    -- replay cannot tell: played when they can, passed otherwise).
    local function playable(step)
        for _, q in ipairs(step.turnin or {}) do
            if not log[q] then return false end
        end
        -- (The step turns in first, then accepts: its turn-ins count as done.)
        local after, done = {}, {}
        for q in pairs(log) do after[q] = true end
        for q in pairs(turnedIn) do done[q] = true end
        for _, q in ipairs(step.turnin or {}) do
            after[q] = nil
            done[q] = true
        end
        for _, q in ipairs(step.accept or {}) do
            local quest = db.Quest[q]
            if not quest or done[q] or after[q] then return false end
            local single = prereqSingle(q, quest)
            if single then
                local any = false
                for _, p in ipairs(single) do if done[p] then any = true end end
                if not any then return false end
            end
            for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                if (p > 0 and not done[p]) or (p < 0 and done[-p]) then return false end
            end
            for _, e in ipairs(quest[QK.exclusiveTo] or {}) do
                if after[e] or done[e] then return false end
            end
        end
        for _, q in ipairs(step.complete or {}) do
            if not log[q] and not after[q] then
                local accepting = false
                for _, a in ipairs(step.accept or {}) do if a == q then accepting = true end end
                if not accepting then return false end
            end
        end
        return true
    end

    local side = chain.faction or chain[1].faction or RACE_SIDE[race]
    for _, guide in ipairs(chain) do
        guideClasses = guide.classes
        -- The step this character played just before, in this guide (a guide may be started
        -- on its own: its first trip is never one too many).
        local previous
        for i, step in ipairs(guide.steps) do
            local cond = stepApplies(guide, step, race, class, side) and whenState(step.when) or "no"
            -- (A step under conditions is a branch: played when all its actions can be, as the
            -- game would show it, passed otherwise.)
            if step.when and cond ~= "no" and not playable(step) then cond = "no" end
            if cond ~= "no" then
                local at = string.format("%s, step %d", guide.id, i)
                local extra = step.dungeon or step.elite

                -- The same trip twice in a row: the second one is passed on arrival, the window
                -- shows the same line twice.
                if previous and onlyTravels(step) and onlyTravels(previous.step) and samePlace(step.go, previous.step.go) then
                    report("error", at, ("the same go as step %d, right before it: merge the two steps"):format(previous.index))
                end
                previous = { step = step, index = i }

                for _, q in ipairs(step.complete or {}) do
                    if not extra and log[q] and not mainAccepted[q] then
                        report("error", at, "works on " .. questName(q) .. ", accepted only in a dungeon or elite step")
                    end
                end
                for _, q in ipairs(step.turnin or {}) do
                    if not extra then
                        mainTurnedIn[q] = true
                        if log[q] and not mainAccepted[q] then
                            report("error", at, "turns in " .. questName(q) .. ", accepted only in a dungeon or elite step")
                        end
                    end
                end
                for _, q in ipairs(step.accept or {}) do
                    if not extra then mainAccepted[q] = true end
                    local quest = db.Quest[q]
                    if not extra and quest then
                        local single = prereqSingle(q, quest)
                        local before, main = not single, not single
                        for _, p in ipairs(single or {}) do
                            if turnedIn[p] then before = true end
                            if mainTurnedIn[p] then main = true end
                        end
                        for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                            if p > 0 and turnedIn[p] and not mainTurnedIn[p] then main = false end
                        end
                        if before and not main then
                            report("error", at, questName(q) .. " depends on a quest done only in a dungeon or elite step")
                        end
                    end
                end

                for _, q in ipairs(step.turnin or {}) do
                    local quest = checkQuest(at, step, q)
                    if turnedIn[q] then
                        report("error", at, "turns in " .. questName(q) .. ", already turned in")
                    elseif not log[q] then
                        report("error", at, "turns in " .. questName(q) .. ", never accepted")
                    else
                        -- (A turn-in that applies only once the quest is ready, or only with its
                        -- item in the bags, needs no step of its own for the objectives.)
                        local gated = false
                        for _, r in ipairs(type(step.when) == "table" and idList(step.when.ready) or {}) do
                            if r == q then gated = true end
                        end
                        local objectives = quest and quest[QK.objectives]
                        for _, o in ipairs(objectives and objectives[3] or {}) do
                            if heldBy(step.when, o[1]) then gated = true end
                        end
                        if quest and X.hasObjectives(quest) and not worked[q] and not gated then
                            report("warning", at, "turns in " .. questName(q) .. " without a complete step for its objectives")
                        end
                        -- An item brought from elsewhere: bought by now, given by a quest done,
                        -- or the step applies only while it is in the bags.
                        local id, item = nil, nil
                        if quest and not worked[q] then id, item = carried(quest) end
                        if id and not bought[id] and not rewarded(item) and not heldBy(step.when, id) then
                            report("error", at, ("turns in %s, which needs %s (%d): never bought nor given before; buy it"
                                .. " first, or put when = { item = %d } on the step"):format(questName(q),
                                tostring(item[X.ITEM.name]), id, id))
                        end
                        log[q] = nil
                        logSize = logSize - 1
                    end
                    turnedIn[q] = true
                end

                for _, q in ipairs(step.accept or {}) do
                    local quest = checkQuest(at, step, q)
                    if turnedIn[q] then
                        report("error", at, "accepts " .. questName(q) .. ", already turned in")
                    elseif log[q] then
                        report("error", at, "accepts " .. questName(q) .. ", already in the quest log")
                    elseif quest then
                        local single = prereqSingle(q, quest)
                        if single then
                            local any = false
                            for _, p in ipairs(single) do if turnedIn[p] then any = true end end
                            if not any then
                                report("error", at, questName(q) .. " needs one of these turned in first: "
                                    .. table.concat(single, ", "))
                            end
                        end
                        for _, p in ipairs(quest[QK.preQuestGroup] or {}) do
                            if p > 0 and not turnedIn[p] then
                                report("error", at, questName(q) .. " needs " .. questName(p) .. " turned in first")
                            elseif p < 0 and turnedIn[-p] then
                                report("error", at, questName(q) .. " is no longer available after " .. questName(-p))
                            end
                        end
                        local parent = quest[QK.parentQuest] or 0
                        if parent ~= 0 and not log[parent] then
                            report("error", at, questName(q) .. " needs " .. questName(parent) .. " in the quest log")
                        end
                        for _, e in ipairs(quest[QK.exclusiveTo] or {}) do
                            if log[e] or turnedIn[e] then
                                report("error", at, questName(q) .. " is exclusive with " .. questName(e))
                            end
                        end
                        local req = quest[QK.requiredLevel] or 0
                        if req > guide.maxLevel then
                            report("warning", at, questName(q) .. " needs level " .. req
                                .. ", above the guide's maxLevel (" .. guide.maxLevel .. ")")
                        end
                    end
                    accepted[q] = true
                    if not log[q] and not turnedIn[q] then
                        log[q] = true
                        logSize = logSize + 1
                        if logSize > maxLog then maxLog, maxAt = logSize, at end
                        if logSize == MAX_LOG + 1 then
                            report("error", at, string.format("quest log full: %d quests (at most %d)", logSize, MAX_LOG))
                        end
                    end
                end

                for _, q in ipairs(step.complete or {}) do
                    checkQuest(at, step, q)
                    if turnedIn[q] then
                        report("error", at, "works on " .. questName(q) .. ", already turned in")
                    elseif not log[q] then
                        report("error", at, "works on " .. questName(q) .. ", never accepted")
                    end
                    worked[q] = true
                end

                -- buy: items held from now on.
                local buy = step.buy
                if type(buy) == "table" and type(buy[1]) == "number" then buy = { buy } end
                for _, b in ipairs(type(buy) == "table" and buy or {}) do
                    if type(b) == "table" and type(b[1]) == "number" then bought[b[1]] = true end
                end

                -- abandon: the player drops these quests from the log (not turned in).
                for _, q in ipairs(idList(step.abandon) or {}) do
                    if log[q] then
                        log[q] = nil
                        logSize = logSize - 1
                    end
                end

                -- sticky: quests taken by now, with objectives to keep in view.
                for _, q in ipairs(step.sticky or {}) do
                    local quest = checkQuest(at, step, q)
                    if not accepted[q] then
                        report("error", at, "sticky " .. questName(q) .. ": not accepted by this step")
                    end
                    if quest and not X.hasObjectives(quest) then
                        report("error", at, "sticky " .. questName(q) .. ": the quest has no objectives")
                    end
                end
            end
        end
    end

    local context = race .. (class ~= "*" and ("/" .. class) or "")
    local left = {}
    for q in pairs(log) do left[#left + 1] = q end
    table.sort(left)
    for i, q in ipairs(left) do left[i] = questName(q) end
    report("info", chain[#chain].id, string.format("[%s] quest log: %d quests at most (%s); still in the log at the end: %s",
        context, maxLog, maxAt, #left > 0 and table.concat(left, ", ") or "none"))
end

for _, chain in ipairs(chains) do
    local ids = {}
    for i, g in ipairs(chain) do ids[i] = g.id end
    print("Chain: " .. table.concat(ids, " -> ") .. (chain.faction and (" (" .. chain.faction .. ")") or ""))
    for _, race in ipairs(chainRaces(chain)) do
        for _, class in ipairs(chainClasses(chain)) do
            replay(chain, race, class)
        end
    end
end

---------------------------------------------------------------------------
-- Translations
---------------------------------------------------------------------------
-- Texts of a guide that a translation must cover: { [text] = true }.
local function guideTexts(g)
    local texts = {}
    if type(g.title) == "string" then texts[g.title] = true end
    for _, step in ipairs(g.steps) do
        if type(step.text) == "string" then texts[step.text] = true end
        if type(step.note) == "string" then texts[step.note] = true end
        if type(step.sethearth) == "string" then texts[step.sethearth] = true end
        local why = step.why
        if type(why) == "table" then why = why.text end
        if type(why) == "string" then texts[why] = true end
    end
    for _, entry in pairs(type(g.leftOut) == "table" and g.leftOut or {}) do
        local text = type(entry) == "table" and entry.text or entry
        if type(text) == "string" then texts[text] = true end
    end
    return texts
end

local function sortedKeys(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys)
    return keys
end

local function shortText(text)
    return #text > 60 and (text:sub(1, 57) .. "...") or text
end

-- Languages every guide must be translated into: Ding's, those of tools/guide_texts.lua
-- that have a dictionary in tools/routes/locales; a pack's, those it translates into.
local translated = {}
if addonDir then
    translated = sortedKeys(translations)
else
    for _, locale in ipairs(dofile(here .. "/guide_texts.lua").LOCALES) do
        local dictionary = io.open(here .. "/routes/locales/" .. locale .. ".lua", "r")
        if dictionary then
            dictionary:close()
            translated[#translated + 1] = locale
        end
    end
end

for _, locale in ipairs(sortedKeys(translations)) do
    for _, guideId in ipairs(sortedKeys(translations[locale])) do
        local entry = translations[locale][guideId]
        if not guides[guideId] then
            report("error", entry.file, ("%s translation of an unknown guide: %s"):format(locale, guideId))
        end
    end
end
for _, id in ipairs(order) do
    local texts = guideTexts(guides[id])
    for _, locale in ipairs(translated) do
        local entry = translations[locale] and translations[locale][id]
        if not entry then
            report("warning", id, "no translation " .. locale)
        else
            for _, text in ipairs(sortedKeys(texts)) do
                if not entry.map[text] then
                    report("warning", id, ("untranslated text (%s): \"%s\""):format(locale, shortText(text)))
                end
            end
            for _, english in ipairs(sortedKeys(entry.map)) do
                if not texts[english] then
                    report("warning", id, ("%s translation without its English text: \"%s\""):format(locale, shortText(english)))
                end
            end
        end
    end
end

print(string.format("Result: %d error(s), %d warning(s)", counts.error, counts.warning))
os.exit(counts.error > 0 and 1 or 0)
