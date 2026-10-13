-- Goals without a quest (step keys, docs/guide-packs.md): monsters to kill and items to
-- collect or buy (counted), an NPC to talk to, a dialogue line to pick, an item to use or to
-- wear, an object to use, inventory chores (destroy, bank, take out of the bank, keep) and a
-- quest to abandon. Ding never does the chores itself: it says what is left and sees it
-- done. What the client does not keep (kills, talks, uses) is kept per guide step in
-- Ding.char.goals; the engine asks Done, Points and Lines.
local _, Ding = ...
local Compat = Ding.Compat
local L = Ding.L

local GO = {}
Ding.Goals = GO

local OBJECT_NEAR = 20          -- yards: a window opened this close to an object is its use
local EQUIP_SLOTS = 19

---------------------------------------------------------------------------
-- The step's goals, normalized (cached apart from the guide's own tables)
---------------------------------------------------------------------------
local ID_KEYS = { "talk", "useitem", "object", "equip", "destroy", "bank", "unbank", "keep", "abandon" }
-- Keys the engine can see done by itself (`keep` is only a reminder).
local AUTO_KEYS = { "kill", "collect", "buy", "talk", "gossip", "useitem", "object", "equip", "destroy", "bank",
    "unbank", "abandon" }
GO.KEYS = { "kill", "collect", "buy", "spots", "talk", "gossip", "useitem", "object", "equip", "destroy", "bank",
    "unbank", "keep", "abandon" }

local function asIds(v)
    if v == nil then return nil end
    if type(v) == "number" then return { v } end
    return type(v) == "table" and v or nil
end

-- { { id, count, extra }, ... } from a list of pairs, one pair alone, or a bare id.
local function asPairs(v)
    if v == nil then return nil end
    if type(v) == "number" then return { { v, 1 } } end
    if type(v) ~= "table" then return nil end
    if type(v[1]) == "number" then return { { v[1], v[2] or 1, v[3] } } end
    local out = {}
    for _, p in ipairs(v) do
        if type(p) == "number" then
            out[#out + 1] = { p, 1 }
        elseif type(p) == "table" and type(p[1]) == "number" then
            out[#out + 1] = { p[1], p[2] or 1, p[3] }
        end
    end
    return out
end

local cache = setmetatable({}, { __mode = "k" })

function GO:Of(step)
    if type(step) ~= "table" then return nil end
    local g = cache[step]
    if g == nil then
        g = { kill = asPairs(step.kill), collect = asPairs(step.collect), buy = asPairs(step.buy),
            gossip = type(step.gossip) == "number" and step.gossip or nil, spots = step.spots }
        for _, k in ipairs(ID_KEYS) do g[k] = asIds(step[k]) end
        local any = false
        for _, k in ipairs(GO.KEYS) do
            if k ~= "spots" and g[k] ~= nil then any = true end
        end
        if not any then g = false end
        cache[step] = g
    end
    return g or nil
end

-- The step has a goal the engine can see done by itself.
function GO:Auto(step)
    local g = self:Of(step)
    if not g then return false end
    for _, k in ipairs(AUTO_KEYS) do
        if g[k] ~= nil then return true end
    end
    return false
end

---------------------------------------------------------------------------
-- Progress kept per guide step
---------------------------------------------------------------------------
function GO:State(guide, index, create)
    if not (guide and index and Ding.char) then return nil end
    local key = guide.id .. "#" .. index
    local all = Ding.char.goals
    if not all and create then
        all = {}
        Ding.char.goals = all
    end
    local s = all and all[key]
    if not s and create then
        s = { kills = {} }
        all[key] = s
    end
    return s
end

local function worn(id)
    for slot = 1, EQUIP_SLOTS do
        if Compat.EquippedID(slot) == id then return true end
    end
    return false
end

-- Each part of the step's goals: { kind, id, ids, count, have, done }. `keep` has no done:
-- it is only a reminder.
function GO:Parts(step, index, guide)
    local g = self:Of(step)
    if not g then return {} end
    guide = guide or Ding.Engine.guide
    local s = self:State(guide, index) or {}
    local kills, used = s.kills or {}, s.used or {}
    local parts = {}
    local function add(part) parts[#parts + 1] = part end
    for _, p in ipairs(g.kill or {}) do
        local have = kills[p[1]] or 0
        add({ kind = "kill", id = p[1], count = p[2], have = math.min(have, p[2]), done = have >= p[2] })
    end
    for _, key in ipairs({ "collect", "buy" }) do
        for _, p in ipairs(g[key] or {}) do
            local have = Compat.ItemCount(p[1])
            add({ kind = key, id = p[1], count = p[2], npc = p[3], have = math.min(have, p[2]), done = have >= p[2] })
        end
    end
    if g.talk then add({ kind = "talk", ids = g.talk, done = s.talked == true }) end
    if g.gossip then add({ kind = "gossip", index = g.gossip, done = s.gossiped == true }) end
    for _, id in ipairs(g.useitem or {}) do add({ kind = "useitem", id = id, done = used[id] == true }) end
    if g.object then add({ kind = "object", ids = g.object, done = s.object == true }) end
    for _, id in ipairs(g.equip or {}) do add({ kind = "equip", id = id, done = worn(id) }) end
    for _, id in ipairs(g.destroy or {}) do
        local have = Compat.ItemCount(id)
        add({ kind = "destroy", id = id, have = have, done = have == 0 })
    end
    for _, id in ipairs(g.bank or {}) do
        local have = Compat.ItemCount(id)
        add({ kind = "bank", id = id, have = have, done = have == 0 })
    end
    for _, id in ipairs(g.unbank or {}) do add({ kind = "unbank", id = id, done = Compat.ItemCount(id) > 0 }) end
    for _, id in ipairs(g.keep or {}) do add({ kind = "keep", id = id }) end
    for _, q in ipairs(g.abandon or {}) do add({ kind = "abandon", id = q, done = not Compat.IsInLog(q) }) end
    return parts
end

-- Every goal of the step is done (reminders aside).
function GO:Done(step, index, guide)
    if not self:Of(step) then return true end
    for _, part in ipairs(self:Parts(step, index, guide)) do
        if part.kind ~= "keep" and not part.done then return false end
    end
    return true
end

---------------------------------------------------------------------------
-- Where to go
---------------------------------------------------------------------------
local function append(dst, src)
    for _, p in ipairs(src) do dst[#dst + 1] = p end
    return dst
end

local function areas(points)
    for _, p in ipairs(points) do p.area = true end
    return points
end

-- The step's own places (`spots`), as an area named after the goal.
local function spotPoints(spots, label)
    local out = {}
    for _, s in ipairs(spots or {}) do
        if type(s) == "table" and s[1] and s[2] and s[3] then
            out[#out + 1] = { map = s[1], x = s[2], y = s[3], label = label, area = true }
        end
    end
    return #out > 0 and out or nil
end

local function itemName(id)
    return Compat.ItemName(id) or Ding.Data:ItemName(id) or ("#" .. id)
end

-- Points of one unfinished part of the step's goals.
function GO:PartPoints(step, part)
    local D, g = Ding.Data, self:Of(step) or {}
    if part.kind == "kill" then
        return spotPoints(g.spots, D:NpcName(part.id)) or areas(D:NpcPoints(part.id))
    elseif part.kind == "collect" then
        return spotPoints(g.spots, itemName(part.id)) or D:ItemSourcePoints(part.id)
    elseif part.kind == "object" then
        local out = {}
        for _, id in ipairs(part.ids) do D:ObjectPoints(id, out) end
        return spotPoints(g.spots, D:ObjectName(part.ids[1])) or areas(out)
    elseif part.kind == "talk" then
        local out = {}
        for _, id in ipairs(part.ids) do D:NpcPoints(id, out) end
        return out
    elseif part.kind == "buy" then
        if part.npc then return D:NpcPoints(part.npc) end
        local out = {}
        for _, npc in ipairs(D:ItemVendors(part.id)) do D:NpcPoints(npc, out) end
        if #out > 0 then return out end
        return Ding.Services and Ding.Services:StepPoints({ vendor = true }) or {}
    end
    return {}
end

-- Points of the step's unfinished goals.
function GO:Points(step, index)
    local out = {}
    if not self:Of(step) then return out end
    for _, part in ipairs(self:Parts(step, index)) do
        if not part.done and part.kind ~= "keep" then append(out, self:PartPoints(step, part)) end
    end
    return out
end

---------------------------------------------------------------------------
-- Lines of the window
---------------------------------------------------------------------------
local GLYPH = { kill = "kill", collect = "objective", buy = "other", talk = "accept", gossip = "other",
    useitem = "use", object = "objective", equip = "use", destroy = "other", bank = "other", unbank = "other",
    keep = "other", abandon = "other" }

local function partText(part)
    local D = Ding.Data
    if part.kind == "kill" then return L.GOAL_KILL:format(D:NpcName(part.id) or ("#" .. part.id)) end
    if part.kind == "collect" then return L.GOAL_COLLECT:format(itemName(part.id)) end
    if part.kind == "buy" then return L.GOAL_BUY:format(itemName(part.id)) end
    if part.kind == "talk" then return L.GOAL_TALK:format(D:NpcName(part.ids[1]) or ("#" .. part.ids[1])) end
    if part.kind == "gossip" then
        local option = GO.gossipOpen and Compat.GossipOption(part.index)
        return option and L.GOAL_GOSSIP_PICK:format(option) or L.GOAL_GOSSIP:format(part.index)
    end
    if part.kind == "useitem" then return L.GOAL_USE:format(itemName(part.id)) end
    if part.kind == "object" then return L.GOAL_OBJECT:format(D:ObjectName(part.ids[1]) or ("#" .. part.ids[1])) end
    if part.kind == "equip" then return L.GOAL_EQUIP:format(itemName(part.id)) end
    if part.kind == "destroy" then return L.GOAL_DESTROY:format(itemName(part.id)) end
    if part.kind == "bank" then return L.GOAL_BANK:format(itemName(part.id)) end
    if part.kind == "unbank" then return L.GOAL_UNBANK:format(itemName(part.id)) end
    if part.kind == "keep" then return L.GOAL_KEEP:format(itemName(part.id)) end
    if part.kind == "abandon" then return L.GOAL_ABANDON:format(D:QuestName(part.id) or ("#" .. part.id)) end
    return "?"
end

-- Main lines of the step's goals, for Engine:Describe: `goal` (the part) lets the window find
-- its places (Panel:PointsOf); `item` puts it on the item button (A in focus mode uses it).
function GO:Lines(step, index, lines)
    lines = lines or {}
    for _, part in ipairs(self:Parts(step, index)) do
        local line = { action = "goal", glyph = GLYPH[part.kind], text = partText(part), done = part.done,
            goal = part, goalStep = step }
        if part.count and part.count > 1 or part.kind == "collect" or part.kind == "buy" then
            line.counter = ("%d/%d"):format(part.have or 0, part.count)
        elseif (part.kind == "destroy" or part.kind == "bank") and not part.done then
            line.counter = tostring(part.have)
        end
        if part.kind == "useitem" or part.kind == "equip" then line.item = part.id end
        if part.kind == "abandon" and not part.done then line.sub = L.GOAL_ABANDON_HINT end
        lines[#lines + 1] = line
    end
    return lines
end

-- The item the step's goals put on the item button: one to use not used yet, or one to wear
-- not worn yet, in the bags.
function GO:ButtonItem(step, index)
    for _, part in ipairs(self:Parts(step, index)) do
        if (part.kind == "useitem" or part.kind == "equip") and not part.done and Compat.ItemCount(part.id) > 0 then
            return part.id
        end
    end
    return nil
end

-- Items a step said to keep (never sold at a merchant).
function GO:Keep(itemID)
    return Ding.char and Ding.char.keep and Ding.char.keep[itemID] == true or false
end

---------------------------------------------------------------------------
-- Seeing goals done
---------------------------------------------------------------------------
local function current()
    local E = Ding.Engine
    if not E or not E.guide or E.finished then return nil end
    local step = E:CurrentStep()
    if not (step and GO:Of(step) and Ding:StepApplies(step)) then return nil end
    return step, E.index, E.guide
end

local function changed()
    if Ding.Engine and Ding.Engine.ScheduleUpdate then Ding.Engine.ScheduleUpdate() end
end

-- The current step's starting point (once per step): item counts of the items to use, the
-- objectives of its quests, the items to keep. Called by Engine:Refresh.
local function objectiveSum(step)
    local n = 0
    for _, q in ipairs(step.complete or {}) do
        for _, obj in ipairs(Compat.GetObjectives(q)) do n = n + (tonumber(obj.numFulfilled) or 0) end
    end
    return n
end

function GO:Track()
    local step, index, guide = current()
    if not step then return end
    local g = self:Of(step)
    if g.keep then
        Ding.char.keep = Ding.char.keep or {}
        for _, id in ipairs(g.keep) do Ding.char.keep[id] = true end
    end
    if not g.useitem then return end
    local s = self:State(guide, index, true)
    if s.counts then return end
    s.counts = {}
    for _, id in ipairs(g.useitem) do s.counts[id] = Compat.ItemCount(id) end
    s.progress = objectiveSum(step)
end

-- Kills: the client's "X dies, you gain N experience." (any language), kills that give
-- experience only. The pattern is the client's own format, open-ended (rested and group
-- bonuses follow).
local xpPattern
local function killedName(text)
    if xpPattern == nil then
        local p = Compat.FormatPattern(_G.COMBATLOG_XPGAIN_FIRSTPERSON)
        xpPattern = p and (p:gsub("%$$", "")) or false
    end
    return xpPattern and text:match(xpPattern) or nil
end
function GO.ResetPatterns() xpPattern = nil end

Ding:On("CHAT_MSG_COMBAT_XP_GAIN", function(_, text)
    text = Compat.Plain(text)
    if type(text) ~= "string" then return end
    local step, index, guide = current()
    local g = step and GO:Of(step)
    if not (g and g.kill) then return end
    local name = killedName(text)
    if not name then return end
    for _, p in ipairs(g.kill) do
        if Ding.Data:NpcName(p[1]) == name then
            local s = GO:State(guide, index, true)
            s.kills[p[1]] = (s.kills[p[1]] or 0) + 1
            changed()
            return
        end
    end
end)

-- An NPC's window: the NPC to talk to.
local function onNpcWindow()
    local step, index, guide = current()
    local g = step and GO:Of(step)
    if not (g and g.talk) then return end
    local id, name = Compat.NpcUnitID(), Compat.NpcUnitName()
    for _, t in ipairs(g.talk) do
        if t == id or (name ~= nil and name == Ding.Data:NpcName(t)) then
            GO:State(guide, index, true).talked = true
            changed()
            return
        end
    end
end

-- A window opened next to one of the object's spawns (or the step's spots): the object used.
-- An object QuestieDB has no spawn of (and no spots): any such window during the step.
local function nearObject(g)
    local points = {}
    for _, id in ipairs(g.object) do Ding.Data:ObjectPoints(id, points) end
    append(points, spotPoints(g.spots, "") or {})
    if #points == 0 then return true end
    local continent, px, py = Compat.GetPlayerWorld()
    if not continent then return false end
    for _, p in ipairs(points) do
        local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
        if c == continent and wx and (wx - px) ^ 2 + (wy - py) ^ 2 <= OBJECT_NEAR * OBJECT_NEAR then return true end
    end
    return false
end
local function onObjectWindow()
    local step, index, guide = current()
    local g = step and GO:Of(step)
    if not (g and g.object) or not nearObject(g) then return end
    GO:State(guide, index, true).object = true
    changed()
end

for _, event in ipairs({ "GOSSIP_SHOW", "QUEST_GREETING", "QUEST_DETAIL", "QUEST_PROGRESS", "QUEST_COMPLETE",
    "MERCHANT_SHOW", "TRAINER_SHOW", "TAXIMAP_OPENED", "BANKFRAME_OPENED", "PET_STABLE_SHOW" }) do
    Ding:On(event, onNpcWindow)
end
for _, event in ipairs({ "LOOT_OPENED", "GOSSIP_SHOW", "QUEST_DETAIL", "ITEM_TEXT_BEGIN" }) do
    Ding:On(event, onObjectWindow)
end

-- The dialogue line to pick: named on a banner while the dialogue is open (Ding never
-- clicks it); done once the dialogue, shown during the step, closes.
function GO:ShowGossip(index)
    local UI = Ding.UI
    if not UI then return end
    self.banner = self.banner or UI.Banner("DingGossipBanner")
    local option = Compat.GossipOption(index)
    self.banner.text:SetText(option and L.GOAL_GOSSIP_PICK:format(UI.Colored("accent", option))
        or L.GOAL_GOSSIP:format(index))
    self.banner:Show()
end

function GO:HideGossip()
    if self.banner then self.banner:Hide() end
end

Ding:On("GOSSIP_SHOW", function()
    local step, index, guide = current()
    local g = step and GO:Of(step)
    if not (g and g.gossip) then return end
    GO.gossipOpen = { guide = guide, index = index }
    Ding:Safe(GO.ShowGossip, GO, g.gossip)
    changed()
end)
Ding:On("GOSSIP_CLOSED", function()
    local open = GO.gossipOpen
    GO.gossipOpen = nil
    GO:HideGossip()
    if not open then return end
    GO:State(open.guide, open.index, true).gossiped = true
    changed()
end)

-- An item to use: its spell cast, its count down since the step began, or an objective of
-- the step's quest advanced.
local function markUsed(test)
    local step, index, guide = current()
    local g = step and GO:Of(step)
    if not (g and g.useitem) then return end
    local s = GO:State(guide, index, true)
    s.used = s.used or {}
    local any = false
    for _, id in ipairs(g.useitem) do
        if not s.used[id] and test(id, s, step) then
            s.used[id] = true
            any = true
        end
    end
    if any then changed() end
end
Ding:On("UNIT_SPELLCAST_SUCCEEDED", function(_, unit, _, spellID)
    if unit ~= "player" then return end
    spellID = Compat.Plain(spellID)
    if not spellID then return end
    markUsed(function(id) return Compat.ItemSpellID(id) == spellID end)
end)
Ding:On("BAG_UPDATE", function()
    markUsed(function(id, s) return s.counts and s.counts[id] and Compat.ItemCount(id) < s.counts[id] end)
    if current() then changed() end
end)
Ding:On("QUEST_LOG_UPDATE", function()
    markUsed(function(_, s, step) return s.progress and objectiveSum(step) > s.progress end)
end)
Ding:On("PLAYER_EQUIPMENT_CHANGED", function()
    if current() then changed() end
end)
