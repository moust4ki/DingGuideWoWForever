-- Guide registry. A guide pack (Ding's own, or a community addon that declares
-- "## Dependencies: Ding") registers itself with Ding.RegisterGuidePack, then its sections
-- (one per zone in Ding's pack) with Ding.RegisterGuide. docs/guide-packs.md is the
-- authors' documentation.
local _, Ding = ...

local guides, order = {}, {}
Ding.guides = guides

-- Guide packs: [id] = { id, title, author, builtin }. Ding ships three: "Leveling" (`ding`, the
-- default, guides without `pack`: level brackets over several zones), "Zones" (one section
-- per zone, `pack = "ding-zones"`) and "Items" (one section per item worth getting off the
-- leveling route, `pack = "ding-items"`, category "items"). builtin: their order in the list.
local BUILTIN, ZONES, ITEMS = "ding", "ding-zones", "ding-items"
Ding.BUILTIN_PACK, Ding.ZONES_PACK, Ding.ITEMS_PACK = BUILTIN, ZONES, ITEMS
local packs = {
    [BUILTIN] = { id = BUILTIN, title = Ding.L.PACK_LEVELING, builtin = 1 },
    [ZONES] = { id = ZONES, title = Ding.L.PACK_ZONES, builtin = 2 },
    [ITEMS] = { id = ITEMS, title = Ding.L.PACK_ITEMS, builtin = 3, category = "items" },
}
-- [guide id] = { [English text] = translated text }, for the client's language only.
local translations = {}

-- Step keys holding an id or a list of ids.
local ID_KEYS = { { "turnin", "quest ids" }, { "accept", "quest ids" }, { "complete", "quest ids" }, { "use", "item ids" } }

local function asList(value)
    if value == nil then return nil end
    if type(value) == "table" then return value end
    return { value }
end

local function normalizeStep(step, guideId, index)
    assert(type(step) == "table", ("Ding: guide %s, step %d is not a table"):format(guideId, index))
    for _, entry in ipairs(ID_KEYS) do
        local key, what = entry[1], entry[2]
        step[key] = asList(step[key])
        if step[key] then
            for _, id in ipairs(step[key]) do
                assert(type(id) == "number", ("Ding: guide %s, step %d: %s expects %s"):format(guideId, index, key, what))
            end
        end
    end
    if step.go then
        assert(type(step.go) == "table" and #step.go == 3,
            ("Ding: guide %s, step %d: go = { uiMapId, x, y }"):format(guideId, index))
    end
    assert(step.faction == nil or step.faction == "Alliance" or step.faction == "Horde",
        ("Ding: guide %s, step %d: faction = \"Alliance\" or \"Horde\""):format(guideId, index))
    step.races = asList(step.races)
    step.classes = asList(step.classes)
    return step
end

-- Guide texts (title, step text and note, the texts of `why` and `leftOut`) are written in
-- English; a translation replaces them in place, whichever of the guide and its translation
-- loads first. A `sethearth` place keeps its English name (the engine knows the inn by it) and
-- gets `sethearthText`, the name the window shows.
local function translate(def)
    local map = translations[def.id]
    if not map then return end
    def.title = map[def.title] or def.title
    for _, step in ipairs(def.steps) do
        if step.text then step.text = map[step.text] or step.text end
        if step.note then step.note = map[step.note] or step.note end
        if type(step.sethearth) == "string" then step.sethearthText = map[step.sethearth] end
        if type(step.why) == "string" then
            step.why = map[step.why] or step.why
        elseif type(step.why) == "table" and type(step.why.text) == "string" then
            step.why.text = map[step.why.text] or step.why.text
        end
    end
    for q, entry in pairs(type(def.leftOut) == "table" and def.leftOut or {}) do
        if type(entry) == "string" then
            def.leftOut[q] = map[entry] or entry
        elseif type(entry) == "table" and type(entry.text) == "string" then
            entry.text = map[entry.text] or entry.text
        end
    end
end

-- Locales/Guides/<locale>/*.lua: map = { [English text] = text in <locale> }. Ignored
-- unless the client runs in that language.
function Ding.RegisterGuideTranslation(locale, guideId, map)
    assert(type(locale) == "string" and type(guideId) == "string" and type(map) == "table",
        "Ding.RegisterGuideTranslation(locale, guideId, map)")
    for english, text in pairs(map) do
        assert(type(english) == "string" and type(text) == "string",
            ("Ding: translation of guide %s: strings expected"):format(guideId))
    end
    if locale ~= Ding.locale then return end
    local merged = translations[guideId] or {}
    for english, text in pairs(map) do merged[english] = text end
    translations[guideId] = merged
    if guides[guideId] then translate(guides[guideId]) end
end

-- What a pack is for (`pack.category`, nil: "leveling"), in the order of the settings' list.
Ding.GUIDE_CATEGORIES = { "leveling", "items", "reputations", "professions", "class" }

-- A community pack, before its guides: { id, title, author, category }. The id is stable
-- (a character remembers its pack) and unique among the installed packs. An unknown
-- category is "leveling".
function Ding.RegisterGuidePack(def)
    assert(type(def) == "table", "Ding.RegisterGuidePack expects a table")
    assert(type(def.id) == "string" and def.id ~= "", "Ding.RegisterGuidePack: id is required")
    assert(not packs[def.id], ("Ding.RegisterGuidePack: pack id %s is already used"):format(def.id))
    assert(def.title == nil or type(def.title) == "string", "Ding.RegisterGuidePack: title must be a string")
    assert(def.author == nil or type(def.author) == "string", "Ding.RegisterGuidePack: author must be a string")
    local category = "leveling"
    for _, known in ipairs(Ding.GUIDE_CATEGORIES) do
        if def.category == known then category = known end
    end
    if def.category ~= nil and def.category ~= category then
        Ding:Debug(("pack %s: unknown category %s, leveling used"):format(def.id, tostring(def.category)))
    end
    local pack = { id = def.id, title = def.title or def.id, author = def.author, category = category }
    packs[pack.id] = pack
    return pack
end

-- Takes a pack and its sections out (a guide imported as text, deleted by the player).
-- Ding's own pack stays.
function Ding.UnregisterGuidePack(id)
    if id == BUILTIN or not packs[id] then return false end
    packs[id] = nil
    for i = #order, 1, -1 do
        if guides[order[i]].pack == id then
            guides[order[i]] = nil
            table.remove(order, i)
        end
    end
    return true
end

function Ding.RegisterGuide(def)
    assert(type(def) == "table", "Ding.RegisterGuide expects a table")
    assert(type(def.id) == "string" and def.id ~= "", "Ding.RegisterGuide: id is required")
    assert(type(def.steps) == "table" and #def.steps > 0, "Ding.RegisterGuide: steps are required")
    local pack = def.pack or BUILTIN
    assert(packs[pack], ("Ding: guide %s: unknown pack %s (call Ding.RegisterGuidePack first)")
        :format(def.id, tostring(pack)))
    local existing = guides[def.id]
    assert(not existing or existing.pack == pack,
        ("Ding: guide id %s is already used by pack %s"):format(def.id, existing and existing.pack or ""))
    -- Validate every step before touching the registry: a rejected guide leaves no trace.
    for i, step in ipairs(def.steps) do normalizeStep(step, def.id, i) end
    def.pack = pack
    def.title = def.title or def.id
    def.races = asList(def.races)
    def.classes = asList(def.classes)
    def.minLevel = def.minLevel or 1
    def.maxLevel = def.maxLevel or 60
    if guides[def.id] then
        Ding:Debug("guide replaced: " .. def.id)
    else
        order[#order + 1] = def.id
    end
    guides[def.id] = def
    translate(def)
    return def
end

function Ding:GetGuide(id)
    return guides[id]
end

-- Every guide, in registration order; with packId, the sections of that pack only.
function Ding:IterateGuides(packId)
    local i = 0
    return function()
        while true do
            i = i + 1
            local id = order[i]
            if not id then return nil end
            local g = guides[id]
            if not packId or g.pack == packId then return id, g end
        end
    end
end

function Ding:GetGuidePack(id)
    return packs[id]
end

-- Packs that have sections: Ding's first, then the community packs by title.
function Ding:GuidePacks()
    local used, list = {}, {}
    for _, g in pairs(guides) do
        if not used[g.pack] then
            used[g.pack] = true
            list[#list + 1] = packs[g.pack]
        end
    end
    table.sort(list, function(a, b)
        if (a.builtin ~= nil) ~= (b.builtin ~= nil) then return a.builtin ~= nil end
        if a.builtin and b.builtin then return a.builtin < b.builtin end
        local ta, tb = a.title:lower(), b.title:lower()
        if ta ~= tb then return ta < tb end
        return a.id < b.id
    end)
    return list
end

local function contains(list, value)
    if not list then return true end
    for _, v in ipairs(list) do
        if v == value then return true end
    end
    return false
end

function Ding:GuideMatchesPlayer(guide)
    local faction = UnitFactionGroup("player")
    if guide.faction and guide.faction ~= faction then return false end
    if not contains(guide.races, Ding.Compat.PlayerRace()) then return false end
    if not contains(guide.classes, Ding.Compat.PlayerClass()) then return false end
    return true
end

-- A step's faction, races and classes. `faction`: a step of a guide for both sides (a race
-- that picks its side later gets it once it has one).
function Ding:StepMatchesPlayer(step)
    if step.faction and step.faction ~= UnitFactionGroup("player") then return false end
    return contains(step.races, Ding.Compat.PlayerRace()) and contains(step.classes, Ding.Compat.PlayerClass())
end

-- Section of a pack for a character Ding has never seen (packId nil or unknown: Ding's
-- Leveling pack, else its Zones pack), in guide order among the pack's compatible sections:
-- 1. the first one started but not finished, unless the character outleveled it;
-- 2. else the first not started whose level range contains the character's level;
-- 3. else the last not started below the character's level, else the first not started;
-- 4. else (everything done or outleveled) the last compatible section.
-- nil when the pack has no section for the character.
function Ding:SuggestGuide(packId)
    if not packs[packId] then
        return self:SuggestGuide(BUILTIN) or self:SuggestGuide(ZONES)
    end
    local level = UnitLevel("player")
    local fresh, last = {}, nil
    for _, id in ipairs(order) do
        local g = guides[id]
        if g.pack == packId and self:GuideMatchesPlayer(g) then
            last = g
            local worked, left = Ding.Engine:GuideProgress(g)
            if worked > 0 and left > 0 and level <= g.maxLevel then return g end
            if worked == 0 and left > 0 then fresh[#fresh + 1] = g end
        end
    end
    local below
    for _, g in ipairs(fresh) do
        if level >= g.minLevel and level <= g.maxLevel then return g end
        if g.minLevel <= level then below = g end
    end
    return below or fresh[1] or last
end
