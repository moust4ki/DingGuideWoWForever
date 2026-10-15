-- Guides imported as text (docs/create-a-guide-with-ai.md): read by Ding.GuideText (nothing
-- in the text runs), checked against the guide format and QuestieDB, kept account-wide in
-- DingDB.imported, registered at login as packs of their own; and any guide written back
-- to text (export).
local _, Ding = ...
local L = Ding.L
local Text = Ding.GuideText

local I = {}
Ding.Import = I

I.MAX_GUIDES = 50   -- guides in a pack
I.MAX_STEPS = 1000  -- steps in a guide
I.MAX_TEXT = 1000   -- characters of a text or a note

local FACTION_RACES = {
    Alliance = { "Human", "Dwarf", "NightElf", "Gnome" },
    Horde = { "Orc", "Scourge", "Tauren", "Troll" },
}
-- Race file names and their side (false: a race that picks its side later).
local RACES = {
    Human = "Alliance", Dwarf = "Alliance", NightElf = "Alliance", Gnome = "Alliance",
    Orc = "Horde", Scourge = "Horde", Tauren = "Horde", Troll = "Horde", Skyborne = false,
}
local CLASSES = {
    WARRIOR = true, PALADIN = true, HUNTER = true, ROGUE = true, PRIEST = true,
    SHAMAN = true, MAGE = true, WARLOCK = true, DRUID = true,
}

-- The keys a guide, a pack and a step may hold (docs/guide-packs.md, sections 4 to 6), and
-- the kind of value of each: nothing else is accepted.
local PACK_KEYS = { id = "id", title = "title", author = "title", category = "category" }
local GUIDE_KEYS = {
    id = "id", title = "title", category = "category", faction = "faction", races = "races",
    classes = "classes", minLevel = "level", maxLevel = "level", next = "next", steps = "steps",
    leftOut = "leftOut", pack = "ignored",
}
local STEP_KEYS = {
    accept = "quests", turnin = "quests", complete = "quests", sticky = "quests", noauto = "quests",
    abandon = "quests", level = "level", xp = "number", go = "point", radius = "number",
    text = "text", note = "text", sethearth = "textOrTrue", train = "textOrTrue", fly = "textOrTrue",
    vendor = "textOrTrue", repair = "textOrTrue", hearth = "flag", deathskip = "flag",
    optional = "flag", elite = "flag", dungeon = "text", races = "races", classes = "classes",
    faction = "faction", use = "items", useitem = "items", equip = "items", destroy = "items",
    bank = "items", unbank = "items", keep = "items", kill = "npcPairs", collect = "itemPairs",
    buy = "buys", talk = "npcs", gossip = "index", object = "objects", spots = "points",
    patrol = "points", revive = "revive", when = "when", why = "why", floor = "floor",
}
local WHEN_KEYS = {
    done = "quests", notdone = "quests", log = "quests", notlog = "quests", ready = "quests",
    item = "held", noitem = "items", minlevel = "level", maxlevel = "level",
}
-- Keys that give a step something to do.
local ACTIONS = {
    "accept", "turnin", "complete", "level", "go", "sethearth", "train", "fly", "vendor", "repair",
    "hearth", "deathskip", "text", "kill", "collect", "buy", "talk", "useitem", "object", "equip",
    "destroy", "bank", "unbank", "abandon", "patrol",
}
I.STEP_KEYS, I.GUIDE_KEYS, I.PACK_KEYS = STEP_KEYS, GUIDE_KEYS, PACK_KEYS

-- A sample of each kind of value, in the errors ("go expects { 1438, 54.6, 33.0 }").
local SAMPLES = {
    id = '"my-guide"', title = '"text"', text = '"text"', flag = "true", textOrTrue = 'true / "text"',
    level = "12", number = "15", index = "1", quests = "{ 456, 457 }", items = "{ 5469 }",
    npcs = "{ 1984 }", objects = "{ 1617 }", point = "{ 1438, 54.6, 33.0 }",
    points = "{ { 1438, 54.6, 33.0 } }", npcPairs = "{ { 1984, 8 } }", itemPairs = "{ { 5469, 4 } }",
    buys = "{ { 159, 5, 6736 } }", revive = '{ 1438, 54.6, 33.0 } / "corpse"',
    races = '{ "NightElf" }', classes = '{ "HUNTER" }', faction = '"Alliance" / "Horde"',
    next = '"guide-id"', when = "{ done = 456 }", held = "{ { 5469, 4 } }", steps = "{ { accept = 456 } }",
    category = '"leveling" / "items"', guides = "{ { steps = { ... } } }", pack = '{ title = "text" }',
    why = '"text" / { kind = "detour", quest = 67, xp = 9000 }', leftOut = '{ [456] = "text" }',
    floor = '"up" / "top" / "down"',
}

-- The order of the keys in an exported guide.
local ORDER = {
    "pack", "guides", "id", "title", "author", "category", "faction", "races", "classes",
    "minLevel", "maxLevel", "next", "leftOut", "steps",
}
local STEP_ORDER = {
    "turnin", "accept", "complete", "level", "xp", "go", "radius", "sethearth", "hearth", "deathskip",
    "revive", "train", "fly", "vendor", "repair", "kill", "collect", "buy", "talk", "gossip", "useitem",
    "object", "equip", "destroy", "bank", "unbank", "abandon", "keep", "spots", "patrol", "use",
    "sticky", "noauto", "dungeon", "elite", "optional", "faction", "races", "classes", "when", "text",
    "floor", "note", "why", "done", "notdone", "log", "notlog", "ready", "item", "noitem", "minlevel", "maxlevel",
}

---------------------------------------------------------------------------
-- Checks
---------------------------------------------------------------------------
local function isId(v) return type(v) == "number" and v > 0 and v == math.floor(v) end

-- An id or a list of ids, as a list; nil when it is neither.
local function ids(v)
    if isId(v) then return { v } end
    if type(v) ~= "table" or #v == 0 then return nil end
    for k, x in pairs(v) do
        if type(k) ~= "number" or not isId(x) then return nil end
    end
    return v
end

-- A list of { id, count[, id] } (size 2 or 3), one alone, or a bare id; as a list, or nil.
local function tuples(v, size)
    if isId(v) then return { { v } } end
    if type(v) ~= "table" or #v == 0 then return nil end
    local list = type(v[1]) == "number" and { v } or v
    for _, p in ipairs(list) do
        if type(p) ~= "table" or not isId(p[1]) or #p > size then return nil end
        if p[2] ~= nil and (type(p[2]) ~= "number" or p[2] < 1) then return nil end
        if size == 3 and p[3] ~= nil and not isId(p[3]) then return nil end
    end
    return list
end

local function names(v)
    local list = type(v) == "string" and { v } or v
    if type(list) ~= "table" or #list == 0 then return nil end
    for _, name in ipairs(list) do
        if type(name) ~= "string" then return nil end
    end
    return list
end

-- One check of a whole import: where the problems are, then the problems.
local function Report(single)
    local r = { errors = {}, warnings = {}, single = single }
    function r:Add(level, guide, step, text)
        local line
        if step and (self.single or not guide) then
            line = L.IMPORT_STEP:format(step, text)
        elseif step then
            line = L.IMPORT_GUIDE_STEP:format(guide, step, text)
        elseif guide and not self.single then
            line = L.IMPORT_GUIDE:format(guide, text)
        else
            line = text
        end
        local list = level == "error" and self.errors or self.warnings
        list[#list + 1] = line
    end
    return r
end

local function mapExists(map)
    return Ding.Compat.MapName(map) ~= nil
end

-- The checks of one value of kind `kind` under key `key`; at(level, text) reports.
local function checkValue(kind, key, v, at, ctx)
    local D, db = Ding.Data, ctx.db
    local function expects() at("error", L.IMPORT_EXPECTS:format(key, SAMPLES[kind] or "?")) end
    local function point(p)
        if type(p) ~= "table" or #p ~= 3 or type(p[1]) ~= "number" or type(p[2]) ~= "number"
            or type(p[3]) ~= "number" then
            return false
        end
        if p[2] < 0 or p[2] > 100 or p[3] < 0 or p[3] > 100 then
            at("error", L.IMPORT_COORDS:format(key))
        elseif not mapExists(p[1]) then
            at("error", L.IMPORT_MAP:format(p[1]))
        end
        return true
    end
    local function npc(id)
        if db and not D:NpcName(id) then at(ctx.fallback and "warning" or "error", L.IMPORT_NPC:format(id)) end
    end
    local function item(id)
        if db and not D:ItemName(id) then at("warning", L.IMPORT_ITEM:format(id)) end
    end
    if kind == "ignored" then return end
    if kind == "id" then
        if type(v) ~= "string" or not v:find("^[%w_%-%.]+$") or #v > 64 then expects() end
    elseif kind == "title" or kind == "text" then
        if type(v) ~= "string" then return expects() end
        local max = kind == "title" and 100 or I.MAX_TEXT
        if #v > max then at("error", L.IMPORT_LONG:format(key, max)) end
    elseif kind == "flag" then
        if type(v) ~= "boolean" then expects() end
    elseif kind == "textOrTrue" then
        if v ~= true and type(v) ~= "string" then expects() end
    elseif kind == "level" then
        if type(v) ~= "number" or v < 1 or v > 60 then expects() end
    elseif kind == "number" then
        if type(v) ~= "number" or v < 0 then expects() end
    elseif kind == "index" then
        if not isId(v) then expects() end
    elseif kind == "category" then
        if type(v) ~= "string" then return expects() end
        local known = false
        for _, c in ipairs(Ding.GUIDE_CATEGORIES) do known = known or c == v end
        if not known then at("warning", L.IMPORT_CATEGORY:format(v)) end
    elseif kind == "faction" then
        if not FACTION_RACES[v] then expects() end
    elseif kind == "floor" then
        if v ~= "up" and v ~= "top" and v ~= "down" then expects() end
    elseif kind == "races" or kind == "classes" then
        local list = names(v)
        if not list then return expects() end
        for _, name in ipairs(list) do
            if kind == "races" and RACES[name] == nil then at("error", L.IMPORT_RACE:format(name)) end
            if kind == "classes" and not CLASSES[name] then at("error", L.IMPORT_CLASS:format(name)) end
        end
    elseif kind == "quests" then
        local list = ids(v)
        if not list then return expects() end
        for _, q in ipairs(list) do
            if db and not D:QuestExists(q) then at("error", L.IMPORT_QUEST:format(q)) end
        end
    elseif kind == "items" then
        local list = ids(v)
        if not list then return expects() end
        for _, id in ipairs(list) do item(id) end
    elseif kind == "npcs" then
        local list = ids(v)
        if not list then return expects() end
        for _, id in ipairs(list) do npc(id) end
    elseif kind == "objects" then
        local list = ids(v)
        if not list then return expects() end
        for _, id in ipairs(list) do
            if db and not D:ObjectName(id) then
                at(ctx.fallback and "warning" or "error", L.IMPORT_OBJECT:format(id))
            end
        end
    elseif kind == "held" then
        -- when.item: an id, a pair, a list of ids, a list of pairs (Engine.HeldItems).
        local list = Ding.Engine.HeldItems(v)
        if #list == 0 then return expects() end
        for _, p in ipairs(list) do
            if not isId(p[1]) or type(p[2]) ~= "number" then return expects() end
            item(p[1])
        end
    elseif kind == "npcPairs" or kind == "itemPairs" or kind == "buys" then
        local list = tuples(v, kind == "buys" and 3 or 2)
        if not list then return expects() end
        for _, p in ipairs(list) do
            if kind == "npcPairs" then npc(p[1]) else item(p[1]) end
            if kind == "buys" and p[3] then npc(p[3]) end
        end
    elseif kind == "point" then
        if not point(v) then expects() end
    elseif kind == "points" then
        if type(v) ~= "table" or #v == 0 then return expects() end
        for _, p in ipairs(v) do
            if not point(p) then return expects() end
        end
    elseif kind == "revive" then
        if v ~= "corpse" and not point(v) then expects() end
    elseif kind == "next" then
        if type(v) == "string" then
            if not ctx.guideIds[v] and not Ding:GetGuide(v) then at("warning", L.IMPORT_NEXT:format(v)) end
        elseif type(v) == "table" then
            for side, id in pairs(v) do
                if not FACTION_RACES[side] or type(id) ~= "string" then return expects() end
                if not ctx.guideIds[id] and not Ding:GetGuide(id) then at("warning", L.IMPORT_NEXT:format(id)) end
            end
        else
            expects()
        end
    elseif kind == "when" then
        if type(v) ~= "table" then return expects() end
        for k, value in pairs(v) do
            if not WHEN_KEYS[k] then
                at("error", L.IMPORT_KEY:format("when." .. tostring(k)))
            else
                checkValue(WHEN_KEYS[k], "when." .. k, value, at, ctx)
            end
        end
    elseif kind == "why" or kind == "reason" then
        -- A step's `why` or a `leftOut` entry (Core/Why.lua): a text, or a kind and its figures.
        if type(v) == "string" then return checkValue("text", key, v, at, ctx) end
        local schema = kind == "why" and Ding.Why.STEP or Ding.Why.LEFT
        if type(v) ~= "table" or (v.kind == nil and v.text == nil) then return expects() end
        for k, value in pairs(v) do
            local sub = schema.keys[k]
            local name = key .. "." .. tostring(k)
            if not sub then
                at("error", L.IMPORT_KEY:format(name))
            elseif sub == "kind" then
                if not schema.kinds[value] then at("error", L.IMPORT_EXPECTS:format(name, schema.sample)) end
            elseif sub == "quest" then
                if type(value) ~= "number" then expects() else checkValue("quests", name, value, at, ctx) end
            elseif sub == "levels" then
                if type(value) ~= "table" or type(value[1]) ~= "number" or (value[2] ~= nil and type(value[2]) ~= "number") then
                    at("error", L.IMPORT_EXPECTS:format(name, "{ 28, 30 }"))
                end
            elseif sub == "action" then
                if value ~= "turnin" and value ~= "accept" then at("error", L.IMPORT_EXPECTS:format(name, '"turnin" / "accept"')) end
            else
                checkValue(sub, name, value, at, ctx)
            end
        end
    elseif kind == "leftOut" then
        if type(v) ~= "table" then return expects() end
        for q, entry in pairs(v) do
            if not isId(q) then return expects() end
            if ctx.db and not D:QuestExists(q) then at("warning", L.IMPORT_QUEST:format(q)) end
            checkValue("reason", key .. "[" .. q .. "]", entry, at, ctx)
        end
    end
end

-- The races a quest of this step must be open to: the step's, else the guide's, else its
-- side's; nil for every race.
local function stepRaces(step, guide)
    local races = names(step.races) or names(guide.races)
    if races then return races end
    local side = FACTION_RACES[step.faction] and step.faction or FACTION_RACES[guide.faction] and guide.faction
    return side and FACTION_RACES[side] or nil
end

local function checkStep(step, index, guide, label, report, ctx)
    local function at(level, text) report:Add(level, label, index, text) end
    if type(step) ~= "table" then return at("error", L.IMPORT_EXPECTS:format("step", "{ accept = 456 }")) end
    local doing = false
    for _, key in ipairs(ACTIONS) do doing = doing or step[key] ~= nil end
    if not doing then at("error", L.IMPORT_EMPTY_STEP) end
    -- Own places, or a place to go: a monster or an object QuestieDB does not know still has
    -- somewhere for the arrow.
    ctx.fallback = step.spots ~= nil or step.go ~= nil
    for key, v in pairs(step) do
        local kind = STEP_KEYS[key]
        if not kind then
            at("error", L.IMPORT_KEY:format(tostring(key)))
        else
            checkValue(kind, key, v, at, ctx)
        end
    end
    -- Faction and races: the quests taken here must be open to the step's races.
    local races = ctx.db and stepRaces(step, guide)
    if races then
        for _, q in ipairs(ids(step.accept) or {}) do
            if Ding.Data:QuestExists(q) and not Ding.Data:QuestOpenToRaces(q, races) then
                at("error", L.IMPORT_SIDE:format(q))
            end
        end
    end
end

local function checkGuide(guide, n, report, ctx)
    local label = type(guide.id) == "string" and guide.id or tostring(n)
    local function at(level, text) report:Add(level, label, nil, text) end
    for key, v in pairs(guide) do
        local kind = GUIDE_KEYS[key]
        if not kind then
            at("error", L.IMPORT_KEY:format(tostring(key)))
        elseif key ~= "steps" then
            checkValue(kind, key, v, at, ctx)
        end
    end
    if type(guide.minLevel) == "number" and type(guide.maxLevel) == "number" and guide.minLevel > guide.maxLevel then
        at("error", L.IMPORT_LEVELS)
    end
    if FACTION_RACES[guide.faction] then
        for _, race in ipairs(names(guide.races) or {}) do
            if RACES[race] and RACES[race] ~= guide.faction then
                at("error", L.IMPORT_RACE_SIDE:format(race, guide.faction))
            end
        end
    end
    local steps = guide.steps
    if type(steps) ~= "table" or #steps == 0 then return at("error", L.IMPORT_NO_STEPS) end
    if #steps > I.MAX_STEPS then return at("error", L.IMPORT_STEPS_MAX:format(I.MAX_STEPS)) end
    for k in pairs(steps) do
        if type(k) ~= "number" then return at("error", L.IMPORT_EXPECTS:format("steps", SAMPLES.steps)) end
    end
    for i, step in ipairs(steps) do checkStep(step, i, guide, label, report, ctx) end
end

-- Checks a table read from the text: a guide ({ steps = ... }) or a pack ({ pack, guides }).
-- Returns { pack, guides } (nil with errors) and the report { errors, warnings }.
function I:Check(data)
    if type(data) ~= "table" then data = {} end
    local single = data.steps ~= nil or (data.pack == nil and data.guides == nil)
    local report = Report(single)
    local ctx = { db = Ding.Data.available, guideIds = {} }
    if not ctx.db then report:Add("warning", nil, nil, L.IMPORT_NO_DB) end
    local packDef, list
    if single then
        if data.steps == nil then
            report:Add("error", nil, nil, L.IMPORT_SHAPE)
            return nil, report
        end
        list = { data }
        packDef = { id = data.id, title = data.title, category = data.category }
    else
        for key in pairs(data) do
            if key ~= "pack" and key ~= "guides" then report:Add("error", nil, nil, L.IMPORT_KEY:format(tostring(key))) end
        end
        packDef, list = data.pack or {}, data.guides
        if type(packDef) ~= "table" then
            report:Add("error", nil, nil, L.IMPORT_EXPECTS:format("pack", SAMPLES.pack))
            packDef = {}
        end
        for key, v in pairs(packDef) do
            local kind = PACK_KEYS[key]
            local function at(level, text) report:Add(level, nil, nil, text) end
            if not kind then
                at("error", L.IMPORT_KEY:format("pack." .. tostring(key)))
            else
                checkValue(kind, "pack." .. key, v, at, ctx)
            end
        end
        if type(list) ~= "table" or #list == 0 then
            report:Add("error", nil, nil, L.IMPORT_NO_GUIDES)
            return nil, report
        end
        if #list > I.MAX_GUIDES then
            report:Add("error", nil, nil, L.IMPORT_GUIDES_MAX:format(I.MAX_GUIDES))
            return nil, report
        end
    end
    for n, guide in ipairs(list) do
        if type(guide) ~= "table" then
            report:Add("error", tostring(n), nil, L.IMPORT_EXPECTS:format("guide", SAMPLES.steps))
        elseif type(guide.id) == "string" then
            if ctx.guideIds[guide.id] then report:Add("error", guide.id, nil, L.IMPORT_TWICE:format(guide.id)) end
            ctx.guideIds[guide.id] = true
        end
    end
    for n, guide in ipairs(list) do
        if type(guide) == "table" then checkGuide(guide, n, report, ctx) end
    end
    if #report.errors > 0 then return nil, report end
    return { pack = packDef, guides = list, single = single }, report
end

---------------------------------------------------------------------------
-- Storage and registration
---------------------------------------------------------------------------
local function copy(v)
    if type(v) ~= "table" then return v end
    local out = {}
    for k, x in pairs(v) do out[k] = copy(x) end
    return out
end
I.Copy = copy

local function slug(s)
    s = tostring(s or ""):lower():gsub("[^%w]+", "-"):gsub("^%-+", ""):gsub("%-+$", "")
    return s ~= "" and s:sub(1, 40) or "guide"
end

local function saved()
    Ding.db.imported = Ding.db.imported or {}
    return Ding.db.imported
end

-- A free id from `want`: kept unless a pack of an addon (or Ding's) uses it, then "user-…",
-- then "user-…-2". An imported pack of the same id is replaced.
local function freePackId(want)
    local function free(id) return saved()[id] ~= nil or not Ding:GetGuidePack(id) end
    if free(want) then return want end
    local base = want:find("^user%-") and want or ("user-" .. want)
    local id, n = base, 1
    while not free(id) do
        n = n + 1
        id = base .. "-" .. n
    end
    return id
end

-- A guide alone is a pack of the same id: an id free for both.
local function freeSingleId(want)
    local function free(id)
        local pack, guide = Ding:GetGuidePack(id), Ding:GetGuide(id)
        return (not pack or saved()[id] ~= nil) and (not guide or guide.pack == id)
    end
    if free(want) then return want end
    local base = want:find("^user%-") and want or ("user-" .. want)
    local id, n = base, 1
    while not free(id) do
        n = n + 1
        id = base .. "-" .. n
    end
    return id
end

local function freeGuideId(want, packId, taken)
    local function free(id)
        local g = Ding:GetGuide(id)
        return not taken[id] and (not g or g.pack == packId)
    end
    if free(want) then return want end
    local base = want:find("^user%-") and want or ("user-" .. want)
    local id, n = base, 1
    while not free(id) do
        n = n + 1
        id = base .. "-" .. n
    end
    return id
end

-- Registers a stored entry { pack, guides } as a pack of its own; its sections in order.
function I:Register(entry)
    local id = entry.pack.id
    local pack = Ding:GetGuidePack(id)
    if pack and not pack.imported then return false end
    if pack then Ding.UnregisterGuidePack(id) end
    pack = Ding.RegisterGuidePack({
        id = id, title = entry.pack.title, author = entry.pack.author, category = entry.pack.category,
    })
    pack.imported = true
    for _, g in ipairs(entry.guides) do
        local def = copy(g)
        def.pack = id
        local ok, err = pcall(Ding.RegisterGuide, def)
        if not ok then Ding:Debug("imported guide " .. tostring(g.id) .. ": " .. tostring(err)) end
    end
    return true
end

-- At login, once every addon is loaded: the imported packs, after the packs of addons (an
-- addon that took an imported pack's id since moves the import to a "user-" id).
function I:RegisterSaved()
    local store = saved()
    local ids = {}
    for id in pairs(store) do ids[#ids + 1] = id end
    table.sort(ids)
    for _, id in ipairs(ids) do
        local entry = store[id]
        local pack = Ding:GetGuidePack(id)
        if pack and not pack.imported then
            store[id] = nil
            id = freePackId(id)
            entry.pack.id = id
            store[id] = entry
        end
        local ok, err = pcall(self.Register, self, entry)
        if not ok then Ding:Debug("imported pack " .. tostring(id) .. ": " .. tostring(err)) end
    end
end

-- Reads, checks and keeps a guide given as text. Returns the pack id (nil when refused) and
-- the report { errors, warnings } as lines of text.
function I:Import(text)
    local data, err = Text.Parse(text)
    if not data then
        local report = Report(true)
        local message = L[err.key] or err.key
        message = message:format(unpack(err.args or {}))
        report:Add("error", nil, nil, L.IMPORT_LINE:format(err.line, message))
        return nil, report
    end
    local plan, report = self:Check(data)
    if not plan then return nil, report end
    local first = plan.guides[1]
    local wanted = plan.pack.id or (plan.single and first.id)
    wanted = wanted or ("user-" .. slug(plan.pack.title or first.title))
    local packId = plan.single and freeSingleId(wanted) or freePackId(wanted)
    if packId ~= wanted then report:Add("warning", nil, nil, L.IMPORT_RENAMED:format(wanted, packId)) end
    if saved()[packId] then report:Add("warning", nil, nil, L.IMPORT_REPLACES:format(saved()[packId].pack.title or packId)) end
    -- The guides' ids: kept, else free ones; `next` follows a renamed guide.
    local renamed, taken, guides = {}, {}, {}
    for n, g in ipairs(plan.guides) do
        local def = copy(g)
        def.pack, def.category = nil, nil
        local want = def.id or (plan.single and packId or (packId .. "-" .. n))
        def.id = freeGuideId(want, packId, taken)
        if g.id and def.id ~= g.id then
            renamed[g.id] = def.id
            if not plan.single then report:Add("warning", nil, nil, L.IMPORT_RENAMED:format(g.id, def.id)) end
        end
        taken[def.id] = true
        def.title = def.title or (plan.single and plan.pack.title) or def.id
        guides[n] = def
    end
    for _, def in ipairs(guides) do
        if type(def.next) == "string" then
            def.next = renamed[def.next] or def.next
        elseif type(def.next) == "table" then
            for side, id in pairs(def.next) do def.next[side] = renamed[id] or id end
        end
    end
    local category = plan.pack.category
    local known = false
    for _, c in ipairs(Ding.GUIDE_CATEGORIES) do known = known or c == category end
    local entry = {
        pack = {
            id = packId, title = plan.pack.title or first.title or packId, author = plan.pack.author,
            category = known and category or nil,
        },
        guides = guides,
        at = time and time() or 0,
    }
    saved()[packId] = entry
    self:Register(entry)
    return packId, report
end

-- The imported packs, by title: { id, title, guides (count), steps (count), category }.
function I:List()
    local out = {}
    for id, entry in pairs(saved()) do
        local steps = 0
        for _, g in ipairs(entry.guides) do steps = steps + #(g.steps or {}) end
        out[#out + 1] = {
            id = id, title = entry.pack.title or id, guides = #entry.guides, steps = steps,
            category = entry.pack.category or "leveling",
        }
    end
    table.sort(out, function(a, b)
        if a.title:lower() ~= b.title:lower() then return a.title:lower() < b.title:lower() end
        return a.id < b.id
    end)
    return out
end

-- Deletes an imported pack: the character on it goes back to the pack it was on before
-- (Ding.char.prevPack), else to Ding's guide.
function I:Delete(id)
    if not saved()[id] then return false end
    saved()[id] = nil
    local E = Ding.Engine
    local leaving = E.guide and E.guide.pack == id
    Ding.UnregisterGuidePack(id)
    if leaving then
        E.guide = nil
        local back = Ding.char.prevPack
        if back == id or not Ding:GetGuidePack(back or "") then back = nil end
        if not (back and E:SetPack(back)) and not E:SetPack(Ding.BUILTIN_PACK) then
            local guide = Ding:SuggestGuide()
            if guide then E:Resume(guide.id) else E:Refresh() end
        end
    end
    return true
end

---------------------------------------------------------------------------
-- Export
---------------------------------------------------------------------------
local ID_KINDS = { quests = true, items = true, npcs = true, objects = true }

local function exportGuide(guide, pack, inPack)
    local out = {}
    for _, key in ipairs({ "id", "title", "faction", "races", "classes", "minLevel", "maxLevel", "next" }) do
        out[key] = copy(guide[key])
    end
    if not inPack and pack and pack.category and pack.category ~= "leveling" then out.category = pack.category end
    out.steps = {}
    for i, step in ipairs(guide.steps) do
        local s = {}
        for key, v in pairs(step) do
            local kind = STEP_KEYS[key]
            -- One id alone, as guides are written (the registry made it a list).
            if ID_KINDS[kind] and type(v) == "table" and #v == 1 and type(v[1]) == "number" then
                s[key] = v[1]
            elseif kind then
                s[key] = copy(v)
            end
        end
        out.steps[i] = s
    end
    return out
end

-- A pack (by its id) or a guide (by its id; the active one by default) as text, in full or
-- on one line (compact). A pack of one guide of its own id (a guide imported alone) is
-- written as that guide. nil when there is no such guide.
function I:Export(id, compact)
    local data
    local pack = id and Ding:GetGuidePack(id)
    if pack then
        local list = {}
        for _, guide in Ding:IterateGuides(pack.id) do list[#list + 1] = guide end
        if #list == 0 then return nil end
        if #list == 1 and list[1].id == pack.id then
            data = exportGuide(list[1], pack)
        else
            data = {
                pack = { id = pack.id, title = pack.title, author = pack.author, category = pack.category },
                guides = {},
            }
            for _, guide in ipairs(list) do data.guides[#data.guides + 1] = exportGuide(guide, pack, true) end
        end
    else
        local guide = Ding:GetGuide(id or (Ding.Engine.guide and Ding.Engine.guide.id))
        if not guide then return nil end
        data = exportGuide(guide, Ding:GetGuidePack(guide.pack))
    end
    return Text.Write(data, {
        compact = compact, order = ORDER, orderOf = { steps = STEP_ORDER },
        layout = { steps = "lines", guides = "blocks" },
    })
end
