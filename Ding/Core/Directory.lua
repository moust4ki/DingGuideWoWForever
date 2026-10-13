-- NPC directory: who offers what, anywhere in the world, from DingDB (Core/Data.lua). Each kind
-- of NPC is a list of NPC ids, read once per session:
--   services by their npcFlags: vendor, repair, innkeeper, flight master, bank, auction house,
--   stable master; class trainers (Data:Services); weapon masters by weapon (DingDB's
--   weaponSkills); profession trainers by profession (the trainer flag and their English
--   subtitle); vendors by what they sell (DingDB's item vendors and item classes): arrows,
--   bullets, food and drink, trade goods; reagents and poisons from the items of a class.
-- The window (UI/Finder.lua) lists them the fewest seconds away first (Core/Travel.lua), by
-- category, by city, or found by name (/ding find). The rules: docs/SPEC.md, NPC directory.
local _, Ding = ...
local Compat = Ding.Compat
local L = Ding.L

local Dir = {}
Ding.Directory = Dir

local NEAR_CANDIDATES = 4        -- nearest NPCs of a kind (by distance) priced in seconds
local JUMP_CANDIDATES = 2        -- the same around the inn and the teleports' landings
local FEW = 24                   -- a kind with this many NPCs at most: all of them are priced
local REACH_TTL, REACH_MOVE = 5, 60   -- travel times are computed again past these (s, yd)
local REMINDER_TTL = 10          -- seconds the weapon reminder is kept
local SEARCH_NPCS = 20           -- NPCs found by name, at most

-- npcFlags bits of the services (Classic flags).
local FLAGS = { trainer = 16, bank = 256, auction = 4096, stable = 8192 }

local function hasFlag(flags, bit) return math.floor(flags / bit) % 2 == 1 end

---------------------------------------------------------------------------
-- Facts noted by hand
---------------------------------------------------------------------------
-- Weapon skills: the skill line (DingDB's weaponSkills), the item subclass (Core/Gear.lua: what
-- a class can use), the passive spell a character knows with it, its name, and the level a
-- weapon master asks for (polearms).
local WEAPONS = {
    { skill = 44, subclass = 0, spell = 196, label = "WEAPON_AXES" },
    { skill = 172, subclass = 1, spell = 197, label = "WEAPON_AXES_2H" },
    { skill = 54, subclass = 4, spell = 198, label = "WEAPON_MACES" },
    { skill = 160, subclass = 5, spell = 199, label = "WEAPON_MACES_2H" },
    { skill = 43, subclass = 7, spell = 201, label = "WEAPON_SWORDS" },
    { skill = 55, subclass = 8, spell = 202, label = "WEAPON_SWORDS_2H" },
    { skill = 229, subclass = 6, spell = 200, label = "WEAPON_POLEARMS", level = 20 },
    { skill = 136, subclass = 10, spell = 227, label = "WEAPON_STAVES" },
    { skill = 173, subclass = 15, spell = 1180, label = "WEAPON_DAGGERS" },
    { skill = 473, subclass = 13, spell = 15590, label = "WEAPON_FIST" },
    { skill = 45, subclass = 2, spell = 264, label = "WEAPON_BOWS" },
    { skill = 226, subclass = 18, spell = 5011, label = "WEAPON_CROSSBOWS" },
    { skill = 46, subclass = 3, spell = 266, label = "WEAPON_GUNS" },
    { skill = 176, subclass = 16, spell = 2567, label = "WEAPON_THROWN" },
}
Dir.WEAPONS = WEAPONS
local WEAPON_BY_SKILL, WEAPON_BY_SUBCLASS = {}, {}
for _, w in ipairs(WEAPONS) do
    WEAPON_BY_SKILL[w.skill] = w
    WEAPON_BY_SUBCLASS[w.subclass] = w
end

-- Professions: a trainer's English subtitle names its profession ("Journeyman Alchemist",
-- "Fishing Trainer", "Physician"); specialists of a branch are left out.
local PROFESSIONS = {
    { key = "alchemy", label = "PROF_ALCHEMY", words = { "Alchem" } },
    { key = "blacksmithing", label = "PROF_BLACKSMITHING", words = { "Blacksmith" } },
    { key = "enchanting", label = "PROF_ENCHANTING", words = { "Enchant" } },
    { key = "engineering", label = "PROF_ENGINEERING", words = { "Engineer" } },
    { key = "herbalism", label = "PROF_HERBALISM", words = { "Herbalis" } },
    { key = "leatherworking", label = "PROF_LEATHERWORKING", words = { "Leatherwork", "Leathercraft" } },
    { key = "mining", label = "PROF_MINING", words = { "Mining" } },
    { key = "skinning", label = "PROF_SKINNING", words = { "Skinning" } },
    { key = "tailoring", label = "PROF_TAILORING", words = { "Tailor" } },
    { key = "cooking", label = "PROF_COOKING", words = { "Cook" } },
    { key = "firstaid", label = "PROF_FIRST_AID", words = { "First Aid", "Physician", "Medic" } },
    { key = "fishing", label = "PROF_FISHING", words = { "Fishing", "Fisherman", "Fisher" } },
}
Dir.PROFESSIONS = PROFESSIONS
local SPECIALISTS = { "Dragonscale", "Elemental", "Tribal", "Gnome", "Goblin", "Shadoweave", "Mithril Order" }

-- The reagents a class buys for its spells (item ids); DingDB says who sells them.
local REAGENTS = {
    MAGE = { 17020, 17031, 17032, 17056 },                  -- Arcane Powder, runes, Light Feather
    PRIEST = { 17028, 17029, 17056 },                       -- candles, Light Feather
    PALADIN = { 17033, 21177 },                             -- Symbol of Divinity, of Kings
    SHAMAN = { 17030, 17057, 17058 },                       -- Ankh, Shiny Fish Scales, Fish Oil
    DRUID = { 17021, 17026, 17034, 17035, 17036, 17037, 17038 },   -- berries, thornroot, seeds
    WARLOCK = { 5565, 16583 },                              -- Infernal Stone, Demonic Figurine
}
Dir.REAGENTS = REAGENTS
-- A rogue's poisons: the reagents only poisons use (Essence of Pain, Deathweed, Essence of
-- Agony, Dust of Deterioration), Flash Powder, and the poisons themselves.
local POISONS = { 2930, 5173, 8923, 8924, 5140, 6947, 6949, 6950, 8926, 8927, 8928, 2892, 2893, 8984, 8985,
    20844, 3775, 3776, 5237, 6951, 9186, 10918, 10920, 10921, 10922 }
Dir.POISONS = POISONS

-- Vendors of seasonal events (not always there) are left out.
local EVENT_WORDS = { "Smokywood Pastures", "Darkmoon Faire", "Hallow's End", "Festival", "Holiday",
    "Sweet Treats", "Fishing Extravaganza", "Fishing Promoter" }

-- Cities: the capitals (their own map) and the neutral towns (around their inn).
local CITIES = {
    { key = "stormwind", map = 1453, side = "A", area = 1519, label = "CITY_STORMWIND" },
    { key = "ironforge", map = 1455, side = "A", area = 1537, label = "CITY_IRONFORGE" },
    { key = "darnassus", map = 1457, side = "A", area = 1657, label = "CITY_DARNASSUS" },
    { key = "orgrimmar", map = 1454, side = "H", area = 1637, label = "CITY_ORGRIMMAR" },
    { key = "thunderbluff", map = 1456, side = "H", area = 1638, label = "CITY_THUNDER_BLUFF" },
    { key = "undercity", map = 1458, side = "H", area = 1497, label = "CITY_UNDERCITY" },
    { key = "bootybay", inn = 6807, radius = 260, area = 35, label = "CITY_BOOTY_BAY" },
    { key = "gadgetzan", inn = 7733, radius = 200, area = 976, label = "CITY_GADGETZAN" },
    { key = "ratchet", inn = 6791, radius = 200, area = 392, label = "CITY_RATCHET" },
    { key = "everlook", inn = 11118, radius = 160, area = 2255, label = "CITY_EVERLOOK" },
}
Dir.CITIES = CITIES

---------------------------------------------------------------------------
-- Categories, in the window's order. `kind`: the NPCs behind it; `choices`: its sub-choices
-- (each a kind); `classes`: only for these classes.
---------------------------------------------------------------------------
local REAGENT_CLASSES = {}
for class in pairs(REAGENTS) do REAGENT_CLASSES[class] = true end
local CATEGORIES = {
    { key = "vendor", label = "FINDER_VENDOR", kind = "vendor" },
    { key = "repair", label = "FINDER_REPAIR", kind = "repair" },
    { key = "food", label = "DIR_FOOD", kind = "food" },
    { key = "ammo", label = "DIR_AMMO", choices = "ammo", classes = { HUNTER = true, WARRIOR = true, ROGUE = true } },
    { key = "reagents", label = "DIR_REAGENTS", kind = "reagents", classes = REAGENT_CLASSES },
    { key = "poisons", label = "DIR_POISONS", kind = "poisons", classes = { ROGUE = true } },
    { key = "innkeeper", label = "FINDER_INN", kind = "innkeeper" },
    { key = "flight", label = "FINDER_FLIGHT", kind = "flight" },
    { key = "trainer", label = "FINDER_TRAINER", kind = "trainer" },
    { key = "weapons", label = "DIR_WEAPONS", choices = "weapons" },
    { key = "professions", label = "DIR_PROFESSIONS", choices = "professions" },
    { key = "trade", label = "DIR_TRADE", kind = "trade" },
    { key = "bank", label = "DIR_BANK", kind = "bank" },
    { key = "auction", label = "DIR_AUCTION", kind = "auction" },
    { key = "stable", label = "DIR_STABLE", kind = "stable", classes = { HUNTER = true } },
}
Dir.CATEGORIES = CATEGORIES
local CATEGORY = {}
for _, c in ipairs(CATEGORIES) do CATEGORY[c.key] = c end

-- Kinds of the NPCs, with their label key (the category's for a kind of its own).
local KIND_LABELS = { arrows = "DIR_ARROWS", bullets = "DIR_BULLETS" }
for _, c in ipairs(CATEGORIES) do
    if c.kind then KIND_LABELS[c.kind] = c.label end
end
for _, w in ipairs(WEAPONS) do KIND_LABELS["weapon:" .. w.skill] = w.label end
for _, p in ipairs(PROFESSIONS) do KIND_LABELS["profession:" .. p.key] = p.label end

-- The order of the kinds in a line ("Vendor, Repair, Ammunition"): the categories', their
-- sub-choices in their own order.
local KIND_ORDER = {}
do
    local n = 0
    local function rank(kind)
        n = n + 1
        KIND_ORDER[kind] = n
    end
    for _, c in ipairs(CATEGORIES) do
        if c.kind then rank(c.kind) end
        if c.choices == "ammo" then rank("arrows"); rank("bullets") end
        if c.choices == "weapons" then
            for _, w in ipairs(WEAPONS) do rank("weapon:" .. w.skill) end
        end
        if c.choices == "professions" then
            for _, p in ipairs(PROFESSIONS) do rank("profession:" .. p.key) end
        end
    end
end

-- The label key of a kind ("vendor", "weapon:46", "profession:alchemy"...).
function Dir:LabelKey(kind) return KIND_LABELS[kind] end

-- The kind's name in the client's language.
function Dir:Label(kind)
    local key = KIND_LABELS[kind]
    return key and L[key] or tostring(kind)
end

function Dir:Category(key) return CATEGORY[key] end

-- The categories for the player's class.
function Dir:Categories()
    local class, out = Compat.PlayerClass(), {}
    for _, c in ipairs(CATEGORIES) do
        if not c.classes or c.classes[class] then out[#out + 1] = c end
    end
    return out
end

---------------------------------------------------------------------------
-- The index: kind -> NPC ids (all sides), NPC -> its kinds
---------------------------------------------------------------------------
local index, kindsOf
local opened = {}                -- [faction letter][kind] = ids open to that side

local function hasWord(text, words)
    for _, w in ipairs(words) do
        if text:find(w, 1, true) then return true end
    end
    return false
end

local function professionOf(sub)
    if hasWord(sub, SPECIALISTS) then return nil end
    for _, p in ipairs(PROFESSIONS) do
        if hasWord(sub, p.words) then return p.key end
    end
    return nil
end

-- What a vendor's item makes it: arrows, bullets, food (food and drink), trade, or nil.
local function goodsKind(info)
    local class, sub = info.class, info.subClass
    if class == 6 and sub == 2 then return "arrows" end
    if class == 6 and sub == 3 then return "bullets" end
    -- Consumables (subclass 0; Forever's new food has 5, "Food & Drink") with no item flag
    -- (poisons, lures, bandages and explosives have one), from level 1 (alcohol: level 0).
    if class == 0 and (sub == 0 or sub == 5) and (info.flags or 0) == 0 and (info.requiredLevel or 0) >= 1 then
        return "food"
    end
    if class == 7 then return "trade" end
    return nil
end
Dir.GoodsKind = goodsKind

local function build()
    local D = Ding.Data
    local sets = {}
    local function add(kind, npc)
        local set = sets[kind] or {}
        sets[kind] = set
        set[npc] = true
    end
    local services = D:Services()
    for _, kind in ipairs({ "vendor", "repair", "innkeeper", "flight" }) do
        for _, npc in ipairs(services[kind] or {}) do add(kind, npc) end
    end
    for class, ids in pairs(services.trainer or {}) do
        for _, npc in ipairs(ids) do add("trainer:" .. class, npc) end
    end
    for _, npc in ipairs(D:NpcIds()) do
        local flags = D:NpcFlags(npc)
        if flags > 0 then
            for _, kind in ipairs({ "bank", "auction", "stable" }) do
                if hasFlag(flags, FLAGS[kind]) then add(kind, npc) end
            end
            local sub = hasFlag(flags, FLAGS.trainer) and D:NpcSubName(npc)
            local profession = type(sub) == "string" and professionOf(sub)
            if profession then add("profession:" .. profession, npc) end
        end
        for _, skill in ipairs(D:NpcWeaponSkills(npc) or {}) do
            if WEAPON_BY_SKILL[skill] then add("weapon:" .. skill, npc) end
        end
    end
    for _, item in ipairs(D:ItemIds()) do
        local vendors = D:ItemVendors(item)
        if #vendors > 0 then
            local kind = goodsKind(D:ItemInfo(item) or {})
            if kind then
                for _, npc in ipairs(vendors) do add(kind, npc) end
            end
        end
    end
    for class, items in pairs(REAGENTS) do
        for _, item in ipairs(items) do
            for _, npc in ipairs(D:ItemVendors(item)) do add("reagents:" .. class, npc) end
        end
    end
    for _, item in ipairs(POISONS) do
        for _, npc in ipairs(D:ItemVendors(item)) do add("poisons", npc) end
    end

    index, kindsOf = {}, {}
    local event = {}
    for kind, set in pairs(sets) do
        local list = {}
        for npc in pairs(set) do
            if event[npc] == nil then
                local sub = D:NpcSubName(npc)
                event[npc] = type(sub) == "string" and hasWord(sub, EVENT_WORDS) or false
            end
            if not event[npc] then list[#list + 1] = npc end
        end
        table.sort(list)
        index[kind] = list
    end
    local kinds = {}
    for kind in pairs(index) do kinds[#kinds + 1] = kind end
    table.sort(kinds)
    for _, kind in ipairs(kinds) do
        for _, npc in ipairs(index[kind]) do
            local list = kindsOf[npc] or {}
            kindsOf[npc] = list
            list[#list + 1] = kind
        end
    end
end

-- Travel times and the reminder computed again on the next question.
function Dir:Forget()
    self.reachCache, self.priced, self.reminder = nil, nil, nil
end

-- Everything built again on the next question (another database).
function Dir:Reset()
    index, kindsOf, opened = nil, nil, {}
    self.cities = nil
    for _, city in ipairs(CITIES) do city.centre = nil end
    Ding.Services:Reset()
    self:Forget()
end

local FACTION_LETTER = { Alliance = "A", Horde = "H" }
local function letter() return FACTION_LETTER[UnitFactionGroup("player")] end

local function openTo(npc, side)
    local friendly = Ding.Data:NpcFriendly(npc)
    return type(friendly) == "string" and side ~= nil and friendly:find(side, 1, true) ~= nil
end

-- The index's key of a kind: the class trainer and the reagents are the player's class's.
local function indexKey(kind)
    if kind == "trainer" or kind == "reagents" then return kind .. ":" .. tostring(Compat.PlayerClass()) end
    return kind
end

-- The NPC ids of a kind open to the player's side (friendly to it, or neutral).
function Dir:Ids(kind)
    if not index then build() end
    local side = letter()
    local key = indexKey(kind)
    opened[side or "?"] = opened[side or "?"] or {}
    local cache = opened[side or "?"]
    if not cache[key] then
        local out = {}
        for _, npc in ipairs(index[key] or {}) do
            if openTo(npc, side) then out[#out + 1] = npc end
        end
        cache[key] = out
    end
    return cache[key]
end

-- The kinds of an NPC (for the player's class: other classes' trainers and reagents left out).
function Dir:KindsOf(npc)
    if not index then build() end
    local class, out = tostring(Compat.PlayerClass()), {}
    for _, key in ipairs(kindsOf[npc] or {}) do
        local base, owner = key:match("^(%a+):(%u+)$")
        if not base then
            out[#out + 1] = key
        elseif owner == class then
            out[#out + 1] = base
        end
    end
    table.sort(out, function(a, b) return (KIND_ORDER[a] or 999) < (KIND_ORDER[b] or 999) end)
    return out
end

---------------------------------------------------------------------------
-- Where and how far
---------------------------------------------------------------------------
-- An NPC's spawn nearest to a world position on its continent and its distance (yards);
-- elsewhere, its first spawn and no distance. Spawns inside a dungeon are left out.
local function spawnOf(npc, continent, wx, wy)
    local best, bestD, first
    for _, p in ipairs(Ding.Services.SpawnsOf(npc)) do
        if p.wx and not p.dungeon then
            first = first or p
            if continent and p.continent == continent then
                local d = (p.wx - wx) ^ 2 + (p.wy - wy) ^ 2
                if not bestD or d < bestD then best, bestD = p, d end
            end
        end
    end
    if best then return best, math.sqrt(bestD) end
    return first, nil
end
Dir.SpawnOf = spawnOf

-- Travel times from where the player stands (Travel:Reach), kept a few seconds.
function Dir:Reach()
    local continent, wx, wy = Compat.GetPlayerWorld()
    local c, now = self.reachCache, GetTime()
    if c and now - c.t < REACH_TTL and c.continent == continent and wx and c.wx
        and (wx - c.wx) ^ 2 + (wy - c.wy) ^ 2 < REACH_MOVE ^ 2 then
        return c.reach
    end
    self.reachCache = { t = now, continent = continent, wx = wx, wy = wy, reach = Ding.Travel:Reach() }
    self.priced = {}
    return self.reachCache.reach
end

local function byCost(a, b)
    if a.seconds and b.seconds then
        if a.seconds ~= b.seconds then return a.seconds < b.seconds end
    elseif a.seconds or b.seconds then
        return a.seconds ~= nil
    elseif a.distance and b.distance and a.distance ~= b.distance then
        return a.distance < b.distance
    elseif (a.distance ~= nil) ~= (b.distance ~= nil) then
        return a.distance ~= nil
    end
    return a.npc < b.npc
end

-- The `n` entries of `all` nearest to a world position (same continent).
local function nearestTo(all, continent, wx, wy, n, out, seen)
    local list = {}
    for _, e in ipairs(all) do
        if e.point.continent == continent and not seen[e.npc] then
            list[#list + 1] = { e = e, d = (e.point.wx - wx) ^ 2 + (e.point.wy - wy) ^ 2 }
        end
    end
    table.sort(list, function(a, b) return a.d < b.d end)
    for i = 1, math.min(n, #list) do
        out[#out + 1] = list[i].e
        seen[list[i].e.npc] = true
    end
end

-- The NPCs of a kind open to the player, the fewest seconds away first (the nearest ones
-- priced with Core/Travel.lua; the others only by distance): entries { kind, npc, name, point,
-- seconds, means (the ways taken: { "fly", "boat"... }), distance }. `within`: a set of NPC ids
-- (a city) to choose from, all priced.
function Dir:Fastest(kind, within)
    local reach = self:Reach()
    self.priced = self.priced or {}
    local key = indexKey(kind) .. "|" .. tostring(letter()) .. (within and ("@" .. tostring(within)) or "")
    if self.priced[key] then return self.priced[key] end
    local continent, px, py = Compat.GetPlayerWorld()
    local all = {}
    for _, npc in ipairs(self:Ids(kind)) do
        if not within or within[npc] then
            local point, d = spawnOf(npc, continent, px, py)
            if point then all[#all + 1] = { kind = kind, npc = npc, point = point, distance = d } end
        end
    end
    -- A city's NPCs are all priced (a list of the same city shows times only).
    local priced = all
    if #all > FEW and not within then
        priced = {}
        local seen = {}
        if continent then nearestTo(all, continent, px, py, NEAR_CANDIDATES, priced, seen) end
        for _, jump in ipairs(reach and reach.jumps or {}) do
            if jump.continent and jump.wx then
                nearestTo(all, jump.continent, jump.wx, jump.wy, JUMP_CANDIDATES, priced, seen)
            end
        end
        if #priced == 0 then
            for i = 1, FEW do priced[i] = all[i] end
        end
    end
    for _, e in ipairs(priced) do
        e.name = Ding.Data:NpcName(e.npc)
        if reach then e.seconds, e.means = reach:Route(e.point) end
    end
    table.sort(priced, byCost)
    self.priced[key] = priced
    return priced
end

-- The NPC of a kind the fewest seconds away (else the fewest yards), or nil.
function Dir:Best(kind, within)
    return self:Fastest(kind, within)[1]
end

---------------------------------------------------------------------------
-- Cities
---------------------------------------------------------------------------
local function cityCentre(city)
    if city.centre == nil then
        local point
        if city.map then
            point = { map = city.map, x = 50, y = 50 }
        else
            local spawn = Ding.Data:NpcPoints(city.inn)[1]
            point = spawn and { map = spawn.map, x = spawn.x, y = spawn.y }
        end
        if point then
            local c, wx, wy = Compat.MapToWorld(point.map, point.x, point.y)
            point.continent, point.wx, point.wy = c or false, wx, wy
        end
        city.centre = point or false
    end
    return city.centre or nil
end

-- The point is in the city: on the capital's map, or close to the town's inn.
function Dir:InCity(city, point)
    if city.map then return point.map == city.map end
    local centre = cityCentre(city)
    return centre ~= nil and centre.wx ~= nil and point.wx ~= nil and point.continent == centre.continent
        and (point.wx - centre.wx) ^ 2 + (point.wy - centre.wy) ^ 2 <= city.radius ^ 2
end

function Dir:CityName(city)
    return (city.map and Compat.MapName(city.map)) or Compat.AreaName(city.area) or L[city.label]
end

-- The capitals of the player's side, then the neutral towns: { city, name, point, seconds }.
function Dir:Cities()
    local side, reach, out = letter(), self:Reach(), {}
    for _, city in ipairs(CITIES) do
        if not city.side or city.side == side then
            local centre = cityCentre(city)
            local entry = { city = city, name = self:CityName(city), point = centre }
            if centre and reach then entry.seconds, entry.means = reach:Route(centre) end
            out[#out + 1] = entry
        end
    end
    return out
end

function Dir:City(key)
    for _, city in ipairs(CITIES) do
        if city.key == key then return city end
    end
    return nil
end

-- The NPCs of the directory in a city: { [npc] = true } (any of their spawns there).
function Dir:CityNpcs(city)
    if not index then build() end
    self.cities = self.cities or {}
    if self.cities[city.key] then return self.cities[city.key] end
    local set = {}
    for npc in pairs(kindsOf) do
        for _, p in ipairs(Ding.Services.SpawnsOf(npc)) do
            if not p.dungeon and self:InCity(city, p) then
                set[npc] = true
                break
            end
        end
    end
    self.cities[city.key] = set
    return set
end

-- Where an NPC stands, for a row: the city, else the zone (the client's names).
function Dir:Place(point)
    if not point then return nil end
    for _, city in ipairs(CITIES) do
        if self:InCity(city, point) then return self:CityName(city) end
    end
    local _, zone = Compat.ZoneOf(point.map)
    return zone or Compat.MapName(point.map)
end

---------------------------------------------------------------------------
-- Weapons
---------------------------------------------------------------------------
-- The weapons the player's class can use (a weapon master teaches them), with `known`.
function Dir:Weapons()
    local allowed = {}
    for _, s in ipairs((Ding.Gear.WEAPONS or {})[Compat.PlayerClass()] or {}) do allowed[s] = true end
    local skills = Compat.SkillNames()
    local english = Ding.Locales and Ding.Locales.enUS or {}
    local out = {}
    for _, w in ipairs(WEAPONS) do
        if allowed[w.subclass] then
            local label = L[w.label]
            local known = Compat.SpellKnown(w.spell) or skills[label] or skills[english[w.label] or ""] or false
            out[#out + 1] = { skill = w.skill, kind = "weapon:" .. w.skill, label = label, known = known and true,
                level = w.level }
        end
    end
    return out
end

-- The weapons the player can learn now: usable, not known, the level reached, and a weapon
-- master of the player's side teaches it.
function Dir:WeaponsToLearn()
    local level, out = UnitLevel("player"), {}
    for _, w in ipairs(self:Weapons()) do
        if not w.known and level >= (w.level or 1) and #self:Ids(w.kind) > 0 then out[#out + 1] = w end
    end
    return out
end

-- A weapon the player has in hand and could learn: worn, in the bags, or offered as a quest
-- reward while the quest's window is open. Its weapon entry, where it is ("worn", "bags",
-- "reward") and the item (a link when the client gives one), or nil.
local function heldWeapon(learnable)
    local function check(item)
        local classID, subclassID = Compat.ItemClass(item)
        local w = classID == 2 and WEAPON_BY_SUBCLASS[subclassID]
        return w and learnable[w.skill] or nil
    end
    for _, slot in ipairs({ 16, 17, 18 }) do
        local id = Compat.EquippedID(slot)
        local found = id and check(id)
        if found then return found, "worn", id end
    end
    for _, bag in ipairs(Compat.BAGS) do
        for slot = 1, Compat.BagSize(bag) do
            local item = Compat.BagItem(bag, slot)
            local found = item and (item.link or item.id) and check(item.link or item.id)
            if found then return found, "bags", item.link or item.id end
        end
    end
    if Dir.questOpen then
        for _, choice in ipairs(Compat.RewardChoices()) do
            local found = choice.link and check(choice.link)
            if found then return found, "reward", choice.link end
        end
    end
    return nil
end

-- The weapon types the player said never to suggest again (Ding.char.weaponsDismissed).
local function dismissed()
    return Ding.char and Ding.char.weaponsDismissed or {}
end

-- The weapon reminder of the guide window. Only a weapon the player has in hand: worn, in the
-- bags, or a quest reward on screen, whose type the class can use but the player has not
-- learned (a weapon master teaches it), and that the player did not dismiss. Never only
-- because a weapon master is close by (Yendi: polearms suggested in Stormwind, for nothing).
-- { weapons = { the weapon's entry of Weapons() }, best = the master's entry the fewest seconds
-- away, source = "worn" | "bags" | "reward", item = link or id } or nil; kept a few seconds.
function Dir:WeaponReminder()
    local now = GetTime()
    local r = self.reminder
    if r and now - r.t < REMINDER_TTL then return r.value end
    local value
    local learnable, no = nil, dismissed()
    for _, w in ipairs(self:WeaponsToLearn()) do
        if not no[w.skill] then
            learnable = learnable or {}
            learnable[w.skill] = w
        end
    end
    local held, source, item
    if learnable then held, source, item = heldWeapon(learnable) end
    if held then
        local best = self:Best(held.kind)
        if best then value = { weapons = { held }, best = best, source = source, item = item } end
    end
    self.reminder = { t = now, value = value }
    return value
end

-- Never suggest this weapon type again (skill line id), for this character.
function Dir:DismissWeapon(skill)
    if not (Ding.char and skill) then return end
    Ding.char.weaponsDismissed = Ding.char.weaponsDismissed or {}
    Ding.char.weaponsDismissed[skill] = true
    self.reminder = nil
end

-- Bags, skills, level and a quest's rewards change what the reminder says.
local function forget() Dir.reminder = nil end
for _, event in ipairs({ "BAG_UPDATE_DELAYED", "SKILL_LINES_CHANGED", "LEARNED_SPELL_IN_TAB", "PLAYER_LEVEL_UP",
    "PLAYER_EQUIPMENT_CHANGED" }) do
    Ding:On(event, forget)
end
for _, event in ipairs({ "QUEST_DETAIL", "QUEST_COMPLETE" }) do
    Ding:On(event, function()
        Dir.questOpen = true
        forget()
    end)
end
Ding:On("QUEST_FINISHED", function()
    Dir.questOpen = nil
    forget()
end)

---------------------------------------------------------------------------
-- Entries of the window
---------------------------------------------------------------------------
-- A category's sub-choices: { { kind, label } } (weapons: those the player can learn).
function Dir:Choices(category, all)
    local out = {}
    if category.choices == "ammo" then
        for _, kind in ipairs({ "arrows", "bullets" }) do out[#out + 1] = { kind = kind, label = self:Label(kind) } end
    elseif category.choices == "weapons" then
        for _, w in ipairs(all and self:Weapons() or self:WeaponsToLearn()) do
            out[#out + 1] = { kind = w.kind, label = w.label, known = w.known }
        end
    elseif category.choices == "professions" then
        for _, p in ipairs(PROFESSIONS) do
            local kind = "profession:" .. p.key
            out[#out + 1] = { kind = kind, label = self:Label(kind) }
        end
    end
    return out
end

-- The sub-choices with the NPC of each (`within`: a city's NPCs), those with one only.
function Dir:ChoiceEntries(category, within, all)
    local out = {}
    for _, c in ipairs(self:Choices(category, all)) do
        local best = self:Best(c.kind, within)
        if best then
            c.best = best
            out[#out + 1] = c
        end
    end
    return out
end

-- One entry per category: { category, kind, best } (a category with sub-choices: `choices`,
-- best = the fastest of them; left out when it has none). `within`: a city's NPCs (only the
-- categories found there).
function Dir:Entries(within)
    local out = {}
    for _, c in ipairs(self:Categories()) do
        if c.choices then
            local choices = self:ChoiceEntries(c, within)
            if #choices > 0 then
                local best
                for _, choice in ipairs(choices) do
                    if not best or byCost(choice.best, best) then best = choice.best end
                end
                out[#out + 1] = { category = c, choices = choices, best = best }
            end
        else
            local best = self:Best(c.kind, within)
            if best or not within then out[#out + 1] = { category = c, kind = c.kind, best = best } end
        end
    end
    return out
end

-- What an NPC offers, as one line ("Vendor, Repair, Food and drink"; a weapon master: his
-- weapons the player can use).
function Dir:Offers(npc)
    local usable = {}
    for _, s in ipairs((Ding.Gear.WEAPONS or {})[Compat.PlayerClass()] or {}) do usable[s] = true end
    local names, seen = {}, {}
    for _, kind in ipairs(self:KindsOf(npc)) do
        local label = self:Label(kind)
        local skill = tonumber(kind:match("^weapon:(%d+)$"))
        if skill and not usable[WEAPON_BY_SKILL[skill].subclass] then label = nil end
        if label and not seen[label] then
            seen[label] = true
            names[#names + 1] = label
        end
    end
    return table.concat(names, ", ")
end

-- A category's NPCs in a city, the fastest first, each with what it offers.
function Dir:CityList(city, category)
    local within = self:CityNpcs(city)
    if category.choices then return self:ChoiceEntries(category, within, true) end
    local out = {}
    for _, e in ipairs(self:Fastest(category.kind, within)) do
        e.offers = self:Offers(e.npc)
        out[#out + 1] = e
    end
    return out
end

---------------------------------------------------------------------------
-- Search (/ding find): categories, weapons, professions, services and NPC names
---------------------------------------------------------------------------
local FOLD = {
    ["à"] = "a", ["á"] = "a", ["â"] = "a", ["ã"] = "a", ["ä"] = "a", ["À"] = "a", ["Á"] = "a", ["Â"] = "a",
    ["Ä"] = "a", ["ç"] = "c", ["Ç"] = "c", ["è"] = "e", ["é"] = "e", ["ê"] = "e", ["ë"] = "e", ["È"] = "e",
    ["É"] = "e", ["Ê"] = "e", ["ì"] = "i", ["í"] = "i", ["î"] = "i", ["ï"] = "i", ["Î"] = "i", ["Í"] = "i",
    ["ñ"] = "n", ["Ñ"] = "n", ["ò"] = "o", ["ó"] = "o", ["ô"] = "o", ["õ"] = "o", ["ö"] = "o", ["Ó"] = "o",
    ["Ô"] = "o", ["Ö"] = "o", ["ù"] = "u", ["ú"] = "u", ["û"] = "u", ["ü"] = "u", ["Ú"] = "u", ["Ü"] = "u",
    ["ß"] = "ss", ["’"] = "'",
}
-- Text compared without case nor accents.
local function fold(text)
    text = tostring(text or ""):gsub("[\195\226][\128-\191]+", function(c) return FOLD[c] end)
    return (text:lower():gsub("%s+", " "))
end
Dir.Fold = fold

-- Every word of the needle starts a word of the text ("arme a feu" finds "Armes à feu").
local function wordsMatch(needle, text)
    for word in needle:gmatch("[^%s%p]+") do
        local found = false
        for other in text:gmatch("[^%s%p]+") do
            if other:sub(1, #word) == word then
                found = true
                break
            end
        end
        if not found then return false end
    end
    return needle:find("[^%s%p]") ~= nil
end

-- The text holds the needle, or each of its words starts one of the text's.
local function matches(needle, ...)
    for i = 1, select("#", ...) do
        local text = select(i, ...)
        if text then
            text = fold(text)
            if text:find(needle, 1, true) or wordsMatch(needle, text) then return true end
        end
    end
    return false
end

-- Results for a text: { { category } (opens it), { kind, label, best } (a weapon, a profession,
-- a kind of ammunition...), { npc entry with `offers` } }, in the window's order.
function Dir:Search(text)
    local needle = fold(text):gsub("^ ", ""):gsub(" $", "")
    local out = {}
    if needle == "" then return out end
    local english = Ding.Locales and Ding.Locales.enUS or {}
    for _, c in ipairs(self:Categories()) do
        if matches(needle, L[c.label], english[c.label]) then
            if c.choices then
                if #self:ChoiceEntries(c, nil, true) > 0 then out[#out + 1] = { category = c } end
            else
                out[#out + 1] = { kind = c.kind, label = L[c.label], best = self:Best(c.kind) }
            end
        end
        if c.choices then
            for _, choice in ipairs(self:ChoiceEntries(c, nil, true)) do
                local key = KIND_LABELS[choice.kind]
                if matches(needle, choice.label, english[key]) then out[#out + 1] = choice end
            end
        end
    end
    if not index then build() end
    local side, npcs = letter(), {}
    for npc in pairs(kindsOf) do
        if openTo(npc, side) and #self:KindsOf(npc) > 0 and matches(needle, Ding.Data:NpcName(npc)) then
            npcs[#npcs + 1] = npc
        end
    end
    if #npcs > 0 then
        local continent, px, py = Compat.GetPlayerWorld()
        local reach = self:Reach()
        local found = {}
        for _, npc in ipairs(npcs) do
            local point, d = spawnOf(npc, continent, px, py)
            if point then
                found[#found + 1] = { kind = "npc", npc = npc, name = Ding.Data:NpcName(npc), point = point,
                    distance = d }
            end
        end
        table.sort(found, function(a, b)
            if (a.distance ~= nil) ~= (b.distance ~= nil) then return a.distance ~= nil end
            if a.distance and b.distance and a.distance ~= b.distance then return a.distance < b.distance end
            return a.npc < b.npc
        end)
        for i = 1, math.min(SEARCH_NPCS, #found) do
            local e = found[i]
            if reach then e.seconds, e.means = reach:Route(e.point) end
            e.offers = self:Offers(e.npc)
            out[#out + 1] = e
        end
    end
    return out
end
