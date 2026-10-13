-- Why the guide makes its choices, in plain words. A step's `why` (written by the route tools,
-- tools/route_why.lua, or by a pack's author: docs/guide-packs.md) becomes sentences: a short
-- line under a surprising step (a detour, a quest taken now for much later), and the whole
-- reason on demand (the row's tooltip: the mouse over it, or X in focus mode). A section's
-- `leftOut` says why it leaves a quest out (the panel beside an NPC's window, UI/Offers.lua).
-- Only what the data says: figures are the tools' estimates and are said as such; a step
-- without a reason gets none. Option "Guide explanations" (`Ding.db.panel.why`).
local _, Ding = ...
local L = Ding.L
local Compat = Ding.Compat

local W = {}
Ding.Why = W

-- "A lot of XP": this share of the player's current level, at least.
local LOT = 0.25

-- The keys of a step's `why` and of a `leftOut` entry, and the kind of their values (checked by
-- Core/Import.lua; tools/check_guides.lua has the same rules): docs/guide-packs.md.
W.STEP = {
    kinds = { detour = true, carry = true, level = true }, sample = '"detour" / "carry" / "level"',
    keys = { kind = "kind", text = "text", short = "flag", quest = "quest", action = "action", chain = "number",
        quests = "number", xp = "number", total = "number", seconds = "number", back = "flag", continent = "flag",
        once = "flag", levels = "levels" },
}
W.LEFT = {
    kinds = { detour = true, long = true, away = true, far = true, log = true, prereq = true, version = true,
        exclusive = true, followup = true, unsure = true },
    sample = '"detour" / "away" / "far" / "log" / "prereq"...',
    keys = { kind = "kind", text = "text", quest = "quest", xp = "number", seconds = "number", turnin = "flag" },
}

function W:Enabled()
    return Ding.db ~= nil and Ding.db.panel.why ~= false
end

---------------------------------------------------------------------------
-- Figures
---------------------------------------------------------------------------
local function number(n) return Compat.Number(math.floor(n + 0.5)) end

-- "about 1,200 XP", or "a lot of XP (about 13,000)" from a quarter of the player's level
-- (`plain`: the figure only, in the detail where the figures follow each other).
function W.XPText(xp, plain)
    local _, max = Compat.PlayerXP()
    if not plain and max and xp >= LOT * max then return L.WHY_XP_LOT:format(number(xp)) end
    return L.WHY_XP:format(number(xp))
end

-- "about 5 min", "about 2 h", "about 7 h 40".
function W.TimeText(seconds)
    local minutes = math.max(1, math.floor(seconds / 60 + 0.5))
    if minutes < 60 then return L.WHY_MIN:format(minutes) end
    local h, m = math.floor(minutes / 60), minutes % 60
    if m == 0 then return L.WHY_H:format(h) end
    return L.WHY_HM:format(h, m)
end

local function quoted(q)
    return L.QUOTE:format(Ding.Data:QuestName(q) or tostring(q))
end

---------------------------------------------------------------------------
-- A step's reason
---------------------------------------------------------------------------
-- The step's `why` as a table ({ text = ... } for a plain text), or nil.
local function reasonOf(step)
    local why = step and step.why
    if type(why) == "string" then return { text = why } end
    if type(why) == "table" then return why end
    return nil
end

local function positive(n) return type(n) == "number" and n > 0 end

-- The detail: { lines, figures } (figures: estimates were said).
local DETAIL = {}
function DETAIL.detour(r)
    local lines, q = {}, r.quest
    if positive(r.seconds) then lines[#lines + 1] = L.WHY_D_COST:format(W.TimeText(r.seconds)) end
    if q and positive(r.xp) then
        local accept = r.action == "accept"
        local chain = tonumber(r.chain) or 0
        if chain == 1 then
            lines[#lines + 1] = (accept and L.WHY_D_ACCEPT_NEXT or L.WHY_D_TURNIN_NEXT):format(quoted(q),
                W.XPText(r.xp, true))
        elseif chain > 1 then
            lines[#lines + 1] = (accept and L.WHY_D_ACCEPT_CHAIN or L.WHY_D_TURNIN_CHAIN):format(quoted(q), chain,
                W.XPText(r.xp, true))
        else
            lines[#lines + 1] = (accept and L.WHY_D_ACCEPT or L.WHY_D_TURNIN):format(quoted(q), W.XPText(r.xp, true))
        end
    end
    if positive(r.total) and positive(r.quests) then
        lines[#lines + 1] = L.WHY_D_TOTAL:format(W.XPText(r.total, true), r.quests)
    end
    return lines
end
function DETAIL.carry(r)
    local lines = {}
    if positive(r.seconds) and positive(r.xp) then
        lines[#lines + 1] = L.WHY_C_LATER:format(W.TimeText(r.seconds), W.XPText(r.xp, true))
    end
    if r.continent then lines[#lines + 1] = L.WHY_C_CONTINENT end
    if r.once then lines[#lines + 1] = L.WHY_C_ONCE end
    return lines
end
function DETAIL.level(r)
    local levels = type(r.levels) == "table" and r.levels or {}
    local low, high = tonumber(levels[1]), tonumber(levels[2] or levels[1])
    if not low then return {} end
    if not high or high == low then return { L.WHY_L_NEXT_ONE:format(low) } end
    return { L.WHY_L_NEXT:format(low, high) }
end

-- The short line under the step, for a reason marked `short`: a heading ("Why this detour
-- (about 5 min)"), then the reason.
local SHORT = {}
function SHORT.detour(r)
    local q = r.quest
    if not (q and positive(r.xp)) then return nil end
    local accept = r.action == "accept"
    local chain, reason = tonumber(r.chain) or 0, nil
    if chain >= 2 then
        reason = (accept and L.WHY_R_ACCEPT_CHAIN or L.WHY_R_TURNIN_CHAIN):format(quoted(q), W.XPText(r.xp))
    elseif chain == 1 then
        reason = (accept and L.WHY_R_ACCEPT_NEXT or L.WHY_R_TURNIN_NEXT):format(quoted(q), W.XPText(r.xp))
    else
        reason = (accept and L.WHY_R_ACCEPT or L.WHY_R_TURNIN):format(quoted(q), W.XPText(r.xp))
    end
    local head = positive(r.seconds) and L.WHY_DETOUR_TIME:format(W.TimeText(r.seconds)) or L.WHY_DETOUR
    return L.WHY_JOIN:format(head, reason)
end
function SHORT.carry(r)
    if not positive(r.xp) then return nil end
    if r.once then
        return L.WHY_JOIN:format(L.WHY_NOW, (r.continent and L.WHY_R_ONCE_FAR or L.WHY_R_ONCE):format(W.XPText(r.xp)))
    end
    if positive(r.seconds) then return L.WHY_CARRY_LATER:format(W.TimeText(r.seconds), W.XPText(r.xp)) end
    return nil
end

-- What the guide says about a step: { short = text or nil, lines = { text... }, estimates =
-- bool }, or nil when the step has no reason (whatever the option: W:Short and W:Detail ask it).
function W:Step(step)
    local r = reasonOf(step)
    if not r then return nil end
    local text = type(r.text) == "string" and r.text ~= "" and r.text or nil
    local lines = DETAIL[r.kind] and DETAIL[r.kind](r) or {}
    local estimates = #lines > 0
    -- An author's text says it all; the figures follow it.
    if text then table.insert(lines, 1, text) end
    if #lines == 0 then return nil end
    local short
    if r.short then short = text or (SHORT[r.kind] and SHORT[r.kind](r)) or lines[1] end
    return { short = short, lines = lines, estimates = estimates }
end

-- The line under the step, or nil (no surprising choice, or the option is off).
function W:Short(step)
    if not self:Enabled() then return nil end
    local s = self:Step(step)
    return s and s.short or nil
end

-- The reason on demand: its lines, "the guide plans this step here" for a step without one;
-- nil when the option is off.
function W:Detail(step)
    if not self:Enabled() or not step then return nil end
    local s = self:Step(step)
    if not s then return { L.WHY_NONE } end
    local lines = {}
    for _, line in ipairs(s.lines) do lines[#lines + 1] = line end
    if s.estimates then lines[#lines + 1] = L.WHY_ESTIMATE end
    return lines
end

---------------------------------------------------------------------------
-- A quest the guide leaves out
---------------------------------------------------------------------------
local LEFT = {
    detour = function(e)
        if not (positive(e.xp) and positive(e.seconds)) then return nil end
        return L.WHY_Q_DETOUR:format(W.XPText(e.xp, true), W.TimeText(e.seconds))
    end,
    long = function(e)
        if not (positive(e.xp) and positive(e.seconds)) then return nil end
        return L.WHY_Q_LONG:format(W.TimeText(e.seconds), W.XPText(e.xp, true))
    end,
    away = function() return L.WHY_Q_AWAY end,
    far = function(e) return e.turnin and L.WHY_Q_FAR_TURNIN or L.WHY_Q_FAR end,
    log = function() return L.WHY_Q_LOG end,
    prereq = function(e)
        if e.quest then return L.WHY_Q_PREREQ_OF:format(quoted(e.quest)) end
        return L.WHY_Q_PREREQ
    end,
    version = function() return L.WHY_Q_VERSION end,
    exclusive = function() return L.WHY_Q_EXCLUSIVE end,
    followup = function() return L.WHY_Q_FOLLOWUP end,
    unsure = function() return L.WHY_Q_UNSURE end,
}

-- The text of a `leftOut` entry, or nil: a clause that completes "The guide does not do this
-- quest: ..." (the panel beside an NPC, UI/Offers.lua), without a capital nor a final period.
function W.LeftOutText(entry)
    if type(entry) == "string" then return entry ~= "" and entry or nil end
    if type(entry) ~= "table" then return nil end
    if type(entry.text) == "string" and entry.text ~= "" then return entry.text end
    local f = LEFT[entry.kind]
    return f and f(entry) or nil
end

-- Why the guide leaves quest `q` out, as a clause (W.LeftOutText): from the active section's
-- `leftOut`, else from another section of its pack that is for this character. Returns the
-- clause, the entry and its guide; nil when no section says why (the guide does not know: say
-- nothing).
function W:Quest(q, guide)
    guide = guide or Ding.Engine.guide
    if not guide or not q then return nil end
    local function from(g)
        local entry = type(g.leftOut) == "table" and g.leftOut[q]
        local text = entry and W.LeftOutText(entry)
        if text then return text, entry, g end
    end
    local text, entry, g = from(guide)
    if text then return text, entry, g end
    for _, other in Ding:IterateGuides(guide.pack) do
        if other ~= guide and Ding:GuideMatchesPlayer(other) then
            text, entry, g = from(other)
            if text then return text, entry, g end
        end
    end
    return nil
end
