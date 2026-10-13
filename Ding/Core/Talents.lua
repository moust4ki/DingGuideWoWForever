-- Talent advisor: talent builds registered per class (Ding.RegisterTalentBuild), the one the
-- player picked (Automation tab; the class's first by default). When a talent point is free,
-- the window suggests the build's next talent; a confirmed press (A twice in focus mode, or
-- two clicks) learns it, out of combat. A build is the ordered list of its points:
--   Ding.RegisterTalentBuild({ id = "warrior-arms-leveling", class = "WARRIOR",
--       title = "Arms (leveling)", picks = { { 1, 1, 2 }, { 1, 1, 2 }, ... } })
-- each pick { tab, tier, column } (tab in the client's talent frame order), one per rank.
local _, Ding = ...
local Compat = Ding.Compat
local L = Ding.L

local TA = {}
Ding.Talents = TA

local CONFIRM_WINDOW = 5         -- seconds in which the second press learns the talent
local POINTS_PER_TIER = 5        -- points in a tree that open its next tier
TA.CONFIRM_WINDOW = CONFIRM_WINDOW

local builds, byClass = {}, {}
TA.builds = builds

function Ding.RegisterTalentBuild(def)
    assert(type(def) == "table", "Ding.RegisterTalentBuild expects a table")
    assert(type(def.id) == "string" and def.id ~= "", "Ding.RegisterTalentBuild: id is required")
    assert(def.id ~= "off", "Ding.RegisterTalentBuild: \"off\" is not a valid id")
    assert(type(def.class) == "string", ("Ding: talent build %s: class is required"):format(def.id))
    assert(type(def.picks) == "table" and #def.picks > 0, ("Ding: talent build %s: picks are required"):format(def.id))
    for i, p in ipairs(def.picks) do
        assert(type(p) == "table" and type(p[1]) == "number" and type(p[2]) == "number" and type(p[3]) == "number",
            ("Ding: talent build %s, pick %d: { tab, tier, column } expected"):format(def.id, i))
    end
    def.title = def.title or def.id
    local old = builds[def.id]
    byClass[def.class] = byClass[def.class] or {}
    local list = byClass[def.class]
    if old then
        -- Registered again (an update): same place in its class's list.
        for i, b in ipairs(byClass[old.class] or {}) do
            if b == old then table.remove(byClass[old.class], i) break end
        end
    end
    list[#list + 1] = def
    builds[def.id] = def
    return def
end

-- Builds for the player's class, in registration order.
function TA:ForClass()
    return byClass[Compat.PlayerClass()] or {}
end

-- The build the player follows: the one picked ("off": none), else the class's first.
function TA:Active()
    local picked = Ding.char and Ding.char.talentBuild
    if picked == "off" then return nil end
    local build = picked and builds[picked]
    if build and build.class == Compat.PlayerClass() then return build end
    return self:ForClass()[1]
end

-- The talent trees as the client shows them: tree[tab] = { spent, [tier] = { [column] =
-- { tab, index, name, icon, tier, column, rank, maxRank, prereq } } }.
local function tree()
    local out = {}
    local ok, tabs = Compat.Call("GetNumTalentTabs")
    tabs = ok and Compat.Plain(tabs)
    for tab = 1, type(tabs) == "number" and tabs or 0 do
        local t = { spent = 0 }
        out[tab] = t
        local okN, count = Compat.Call("GetNumTalents", tab)
        count = okN and Compat.Plain(count)
        for i = 1, type(count) == "number" and count or 0 do
            local okI, name, icon, tier, column, rank, maxRank = Compat.Call("GetTalentInfo", tab, i)
            tier, column = okI and Compat.Plain(tier), okI and Compat.Plain(column)
            if type(tier) == "number" and type(column) == "number" then
                rank = Compat.Plain(rank)
                rank = type(rank) == "number" and rank or 0
                local okP, preTier, preColumn = Compat.Call("GetTalentPrereqs", tab, i)
                t[tier] = t[tier] or {}
                t[tier][column] = { tab = tab, index = i, name = Compat.Plain(name), icon = icon, tier = tier,
                    column = column, rank = rank, maxRank = Compat.Plain(maxRank) or 1,
                    prereq = okP and type(preTier) == "number" and { preTier, preColumn } or nil }
                t.spent = t.spent + rank
            end
        end
    end
    return out
end

-- The talent can take a point now: its tier is open, its prerequisite at its last rank.
local function learnable(trees, talent)
    local t = trees[talent.tab]
    if t.spent < (talent.tier - 1) * POINTS_PER_TIER then return false end
    local pre = talent.prereq
    if pre then
        local p = t[pre[1]] and t[pre[1]][pre[2]]
        if p and p.rank < p.maxRank then return false end
    end
    return talent.rank < talent.maxRank
end

-- The next talent of the active build: the first pick the player does not have yet and can
-- take now (a pick out of reach, after points spent elsewhere, waits), or nil.
function TA:Next()
    local build = self:Active()
    if not build then return nil end
    local trees = tree()
    local planned = {}
    for _, p in ipairs(build.picks) do
        local tab = trees[p[1]]
        local talent = tab and tab[p[2]] and tab[p[2]][p[3]]
        if talent then
            local key = p[1] .. ":" .. p[2] .. ":" .. p[3]
            planned[key] = (planned[key] or 0) + 1
            if planned[key] > talent.rank and learnable(trees, talent) then return talent end
        end
    end
    return nil
end

-- A suggestion when a point is free: the next talent, or nil.
function TA:Suggestion()
    if Compat.FreeTalentPoints() <= 0 then return nil end
    return self:Next()
end

local function keyOf(talent)
    return talent.tab .. ":" .. talent.index .. ":" .. talent.rank
end

local function changed()
    if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
end

-- The first press on the suggestion arms it, for CONFIRM_WINDOW seconds.
function TA:Armed(talent)
    local a = self.armed
    return a ~= nil and talent ~= nil and a.key == keyOf(talent) and GetTime() - a.t <= CONFIRM_WINDOW
end

-- A press on the suggestion (A in focus mode, or a click): the first one asks to confirm,
-- the second one learns the talent. Returns true once learned.
function TA:Press(talent)
    if not talent then return false end
    if self:Armed(talent) then
        self.armed = nil
        return self:Learn(talent)
    end
    local armed = { key = keyOf(talent), t = GetTime() }
    self.armed = armed
    C_Timer.After(CONFIRM_WINDOW, function()
        if TA.armed == armed then TA.armed = nil end
        changed()
    end)
    changed()
    return false
end

-- Learns the suggested talent (the player confirmed it): out of combat only.
function TA:Learn(talent)
    if not talent then return false end
    if InCombatLockdown() then
        Ding:Print(L.TALENT_COMBAT)
        return false
    end
    local ok = Compat.Call("LearnTalent", talent.tab, talent.index)
    if ok then Ding:Print(L.TALENT_LEARNED:format(talent.name or "?")) end
    changed()
    return ok
end

Ding:On("CHARACTER_POINTS_CHANGED", function()
    TA.armed = nil
    changed()
end)
Ding:On("PLAYER_LEVEL_UP", changed)
