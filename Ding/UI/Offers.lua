-- Quests an NPC offers (gossip, quest greeting, quest details): beside the game's window, what
-- the guide does with each one. Now (the steps at the player's place take it), later in this
-- section (its step), in another section of the pack, or not in the guide and why when Ding
-- can tell (an option off, another class or race, an elite quest, above the player's level, a
-- WoW Forever quest the route leaves out). Information only, nothing to press: Ding's own
-- frame on UIParent, without the mouse. The game's windows are only read (where they stand,
-- whether they are shown), never anchored to, changed, shown nor hidden: with the gamepad
-- interface on, touching them taints the game's frame controls.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local O = {}
Ding.Offers = O

local QUEST_ABOVE = 2           -- the routes take quests up to this many levels above the player
local FOREVER_FIRST = 10000     -- WoW Forever's own quests: Classic's quest ids end at 9665
local ELITE_RANKS = { [1] = true, [2] = true, [3] = true }   -- elite, rare elite, boss
local SHOW_DELAY = 0.2          -- seconds: the game shows its window, AutoQuest may take a quest
local WATCH = 0.2               -- seconds between two looks at the game's window
local WIDTH, PAD, TITLE, NAME, ROW_GAP, GAP = 260, 12, 30, 16, 6, 8
local FALLBACK_X, FALLBACK_Y = 370, -116   -- beside the usual place of the NPC windows
-- The game's window of each dialog.
local WINDOWS = { gossip = "GossipFrame", greeting = "QuestFrame", detail = "QuestFrame" }

function O:Enabled()
    return Ding.db ~= nil and Ding.db.ui.offers ~= false
end

---------------------------------------------------------------------------
-- What the guide does with a quest
---------------------------------------------------------------------------
-- Where each section takes or works on each quest: accept[q], work[q] = { step indices }, built
-- once per section (a section registered again has new steps and is read again).
local index = setmetatable({}, { __mode = "k" })
local function push(set, q, i)
    set[q] = set[q] or {}
    table.insert(set[q], i)
end
local function indexOf(guide)
    local idx = index[guide]
    if idx and idx.steps == guide.steps then return idx end
    idx = { steps = guide.steps, accept = {}, work = {} }
    for i, step in ipairs(guide.steps) do
        for _, q in ipairs(step.accept or {}) do push(idx.accept, q, i) end
        for _, q in ipairs(step.complete or {}) do push(idx.work, q, i) end
        for _, q in ipairs(step.turnin or {}) do push(idx.work, q, i) end
    end
    index[guide] = idx
    return idx
end

-- Why a step is not for this character, its conditions (`when`) aside since they can hold
-- later: "class" (side, race or class), the setting that hides it ("elites", "dungeons"...),
-- or nil.
local function blockedBy(step)
    if not Ding:StepMatchesPlayer(step) then return "class" end
    return Ding:StepOptionOff(step)
end

local function eliteNpc(npc)
    local info = Ding.Data:NpcInfo(npc)
    return info ~= nil and ELITE_RANKS[info.rank] == true
end

-- A quest against elite monsters: one of its objectives has elite monsters only (its monster,
-- or every monster that drops its item), or the quest before it in its chain is one.
local function isElite(q, depth)
    local groups = {}
    for _, o in ipairs(Ding.Data:ObjectiveNpcs(q)) do
        local key = o.name or o.npc
        if groups[key] == nil then groups[key] = true end
        groups[key] = groups[key] and eliteNpc(o.npc)
    end
    for _, elite in pairs(groups) do
        if elite then return true end
    end
    if depth then return false end
    local single, group = Ding.Data:QuestPrereqs(q)
    for _, p in ipairs(single or {}) do
        if isElite(p, 1) then return true end
    end
    for _, p in ipairs(group or {}) do
        if isElite(p, 1) then return true end
    end
    return false
end
O.IsElite = isElite

-- What does not change from one quest of the window to the next: the quests the steps at the
-- player's place want (AutoQuest), the last of those steps, the player's level.
function O:Context()
    local AQ, ctx = Ding.AutoQuest, { now = {}, hereEnd = 0, level = UnitLevel("player") }
    local accept, _, ahead = AQ:Wanted()
    for q in pairs(accept) do
        if not ahead[q] then ctx.now[q] = true end
    end
    ctx.hereEnd = AQ:PlaceEnd()
    return ctx
end

-- In another section of the active pack: the first one after the active section, else the last
-- one before it. Returns { guide, step } or nil, and the first reason a section that takes the
-- quest is not for this character.
local function otherSection(q, active)
    local after, before, blocked, past = nil, nil, nil, true
    for _, g in Ding:IterateGuides(active.pack) do
        if g == active then
            past = false
        else
            local steps = indexOf(g).accept[q]
            if steps and not Ding:GuideMatchesPlayer(g) then
                blocked = blocked or "class"
            elseif steps and not (after and not past) then
                for _, i in ipairs(steps) do
                    local off = blockedBy(g.steps[i])
                    if not off then
                        if past then before = { guide = g, step = i } else after = { guide = g, step = i } end
                        break
                    end
                    blocked = blocked or off
                end
            end
        end
    end
    return after or before, blocked
end

-- Why the guide leaves a quest out, when Ding can tell: a reason key or nil.
local REASON_OF_OPTION = { class = "class", elites = "elitesOff", dungeons = "dungeonsOff" }
local function whyNot(q, blocked, ctx)
    if blocked and REASON_OF_OPTION[blocked] then return REASON_OF_OPTION[blocked] end
    local D = Ding.Data
    if D:QuestExists(q) and not D:QuestOpenToPlayer(q) then return "class" end
    if isElite(q) then return "elite" end
    if D:QuestLevel(q) > ctx.level + QUEST_ABOVE then return "above" end
    if q >= FOREVER_FIRST then return "forever" end
    return nil
end

-- What the active guide does with quest q: { kind, step, guide, reason }, kind "now" (the steps
-- at the player's place take it), "later" (a later step of this section takes it), "needed" (a
-- later step works on it: Ding asks to pick it up there), "earlier" (a step already passed took
-- it), "other" (`guide`, another section of the pack, its `step`), "none" (`reason` or nil).
-- nil without a guide.
function O:Classify(q, ctx)
    local E = Ding.Engine
    local guide = E.guide
    if not guide then return nil end
    ctx = ctx or self:Context()
    local idx = indexOf(guide)
    local current = E.finished and #guide.steps + 1 or E.index
    local later, past, blocked
    for _, i in ipairs(idx.accept[q] or {}) do
        local off = blockedBy(guide.steps[i])
        if off then
            blocked = blocked or off
        elseif i >= current then
            later = later or i
        else
            past = i
        end
    end
    local needed
    if not later then
        for _, i in ipairs(idx.work[q] or {}) do
            if i >= current and not blockedBy(guide.steps[i]) then
                needed = i
                break
            end
        end
    end
    if (later or needed or ctx.now[q]) and E:IsGrey(q) then return { kind = "none", reason = "grey" } end
    if ctx.now[q] or (later and later <= ctx.hereEnd) then return { kind = "now", step = later } end
    if later then return { kind = "later", step = later } end
    if needed then return { kind = "needed", step = needed } end
    if past then return { kind = "earlier", step = past } end
    local other, otherBlocked = otherSection(q, guide)
    if other then return { kind = "other", guide = other.guide, step = other.step } end
    return { kind = "none", reason = whyNot(q, blocked or otherBlocked, ctx) }
end

local REASONS = { class = "OFFER_WHY_CLASS", elitesOff = "OFFER_WHY_ELITES_OFF",
    dungeonsOff = "OFFER_WHY_DUNGEONS_OFF", elite = "OFFER_WHY_ELITE", forever = "OFFER_WHY_FOREVER",
    grey = "OFFER_WHY_GREY" }

-- The line under the quest's name, and its color.
function O:Describe(r, q)
    if r.kind == "now" then return L.OFFER_NOW, C.done end
    if r.kind == "later" then return L.OFFER_LATER:format(r.step), C.accent end
    if r.kind == "needed" then return L.OFFER_NEEDED:format(r.step), C.accent end
    if r.kind == "earlier" then return L.OFFER_EARLIER:format(r.step), C.secondary end
    if r.kind == "other" then
        local g = r.guide
        local title = g.title or g.id
        -- The Leveling sections already end with their levels, "(30-32)".
        if title:find("%(%d+%-%d+%)") then return L.OFFER_OTHER:format(title), C.secondary end
        return L.OFFER_OTHER_LEVELS:format(title, g.minLevel or 1, g.maxLevel or 60), C.secondary
    end
    local why
    if r.reason == "above" then
        why = L.OFFER_WHY_ABOVE:format(q and Ding.Data:QuestLevel(q) or 0)
    elseif r.reason then
        why = L[REASONS[r.reason]]
    end
    return why and L.OFFER_NONE_WHY:format(why) or L.OFFER_NONE, C.muted
end

---------------------------------------------------------------------------
-- The quests the open window offers
---------------------------------------------------------------------------
-- The greeting window only gives titles: the quest the NPC starts by that name (open to the
-- player first), else a quest of the active pack by that name.
local packNames = {}   -- [pack] = { count, names = { [lower-case name] = questID } }
local function packQuest(want)
    local guide = Ding.Engine.guide
    if not guide then return nil end
    local count = 0
    for _ in Ding:IterateGuides(guide.pack) do count = count + 1 end
    local cache = packNames[guide.pack]
    if not (cache and cache.count == count) then
        cache = { count = count, names = {} }
        for _, g in Ding:IterateGuides(guide.pack) do
            for q in pairs(indexOf(g).accept) do
                cache.names[string.lower(Ding.Data:QuestName(q))] = q
            end
        end
        packNames[guide.pack] = cache
    end
    return cache.names[want]
end

function O:QuestByTitle(title)
    if type(title) ~= "string" then return nil end
    local want, D, found = string.lower(title), Ding.Data, nil
    local npc = Compat.NpcUnitID()
    for _, q in ipairs(npc and D:NpcQuests(npc) or {}) do
        if string.lower(D:QuestName(q)) == want then
            if D:QuestOpenToPlayer(q) and not Compat.IsQuestCompleted(q) then return q end
            found = found or q
        end
    end
    return found or packQuest(want)
end

-- { { quest = id or nil, title } } offered by the window of this dialog.
function O:Offered(kind)
    local out = {}
    if kind == "gossip" then
        local _, available = Compat.GossipQuests()
        for _, quest in ipairs(available or {}) do
            out[#out + 1] = { quest = quest.questID, title = quest.title }
        end
    elseif kind == "greeting" then
        local _, available = Compat.GreetingQuests()
        for _, quest in ipairs(available) do
            out[#out + 1] = { quest = self:QuestByTitle(quest.title), title = quest.title }
        end
    elseif kind == "detail" then
        local q = Compat.DialogQuestID()
        if q then out[1] = { quest = q } end
    end
    return out
end

-- The rows: { quest, name, above, text, color, result }.
function O:Entries(kind)
    local out = {}
    if not Ding.Engine.guide then return out end
    local ctx = self:Context()
    for _, offer in ipairs(self:Offered(kind)) do
        local q, e = offer.quest, { quest = offer.quest }
        local level = q and Ding.Data:QuestLevel(q) or 0
        local name = q and Ding.Data:QuestExists(q) and Ding.Data:QuestName(q) or offer.title or "?"
        e.name = level > 0 and L.QUEST_WITH_LEVEL:format(level, name) or name
        e.above = level > ctx.level
        e.result = q and self:Classify(q, ctx) or { kind = "none" }
        e.text, e.color = self:Describe(e.result, q)
        out[#out + 1] = e
    end
    return out
end

---------------------------------------------------------------------------
-- The frame
---------------------------------------------------------------------------
-- Where a game window stands, in UIParent units: "shown", left, right, top; "hidden"; nil when
-- this client has no such window. Read only.
local function windowState(name)
    local w = name and _G[name]
    if type(w) ~= "table" or type(w.IsVisible) ~= "function" then return nil end
    local ok, visible = pcall(w.IsVisible, w)
    if not (ok and Compat.Plain(visible)) then return "hidden" end
    local okL, left = pcall(w.GetLeft, w)
    local okR, right = pcall(w.GetRight, w)
    local okT, top = pcall(w.GetTop, w)
    local okS, scale = pcall(w.GetEffectiveScale, w)
    left, right, top, scale = Compat.Plain(left), Compat.Plain(right), Compat.Plain(top), Compat.Plain(scale)
    if not (okL and okR and okT and okS and left and right and top and scale) then return "hidden" end
    local k = scale / UIParent:GetEffectiveScale()
    return "shown", left * k, right * k, top * k
end

function O:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingOffers", UIParent)
    f:SetFrameStrata("HIGH")
    f:SetClampedToScreen(true)
    f:EnableMouse(false)
    f:SetWidth(WIDTH)
    f.look = UI.Window(f)
    f.title = UI.Text(f, "semibold", 12, C.text)
    f.title:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -9)
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.OFFERS_TITLE)
    f.divider = UI.Divider(f, -TITLE + 4)
    f.rows = {}
    f:SetScript("OnUpdate", function(_, elapsed) O:Watch(elapsed) end)
    f:Hide()
    self.frame = f
end

local function newRow(f)
    local r = { name = UI.Text(f, "medium", 12, C.text), status = UI.Text(f, "regular", 11, C.secondary) }
    UI.Wrap(r.status, 11, 2)
    return r
end

function O:Layout(entries)
    local f = self.frame
    local y, inner = TITLE + 4, WIDTH - PAD * 2
    for i, e in ipairs(entries) do
        local r = f.rows[i] or newRow(f)
        f.rows[i] = r
        r.name:ClearAllPoints()
        r.name:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -y)
        r.name:SetWidth(inner)
        r.name:SetText(e.name)
        r.name:SetTextColor(unpack(e.above and C.above or C.text))
        r.status:ClearAllPoints()
        r.status:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -(y + NAME))
        r.status:SetWidth(inner)
        r.status:SetText(e.text)
        r.status:SetTextColor(unpack(e.color))
        r.name:Show()
        r.status:Show()
        y = y + NAME + r.status:GetStringHeight() + ROW_GAP
    end
    for i = #entries + 1, #f.rows do
        f.rows[i].name:Hide()
        f.rows[i].status:Hide()
    end
    f:SetHeight(y - ROW_GAP + PAD)
end

-- Beside the game's window (on its right, else on its left when the screen has no room), else
-- where the NPC windows usually stand. Returns true when the window was found.
function O:Place()
    local f = self.frame
    local state, left, right, top = windowState(WINDOWS[self.kind])
    f:ClearAllPoints()
    if state ~= "shown" then
        f:SetPoint("TOPLEFT", UIParent, "TOPLEFT", FALLBACK_X, FALLBACK_Y)
        return false
    end
    local x, screen = right + GAP, UIParent:GetWidth()
    if screen and screen > 0 and x + WIDTH > screen and left - GAP - WIDTH >= 0 then x = left - GAP - WIDTH end
    f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, top)
    return true
end

function O:Show(kind)
    -- The window closed meanwhile (a quest taken, the player walked away): nothing to show.
    if not self:Enabled() or windowState(WINDOWS[kind]) == "hidden" then return end
    local entries = self:Entries(kind)
    if #entries == 0 then return self:Hide() end
    self:Create()
    self.kind, self.elapsed, self.entries = kind, 0, entries
    self:Layout(entries)
    self.placed = self:Place()
    self.frame:Show()
end

function O:Hide()
    self.kind, self.placed = nil, nil
    if self.frame then self.frame:Hide() end
end

-- While shown: beside the game's window once it appears, hidden once it is gone (an event
-- missed, or a client that sends none).
function O:Watch(elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < WATCH then return end
    self.elapsed = 0
    local state = windowState(WINDOWS[self.kind])
    if self.placed and state ~= "shown" then
        self:Hide()
    elseif not self.placed and state == "shown" then
        self.placed = self:Place()
    end
end

-- An NPC window opened: shown a moment later, for the last window opened only.
function O:Open(kind)
    self.token = (self.token or 0) + 1
    local token = self.token
    C_Timer.After(SHOW_DELAY, function()
        if O.token == token then Ding:Safe(O.Show, O, kind) end
    end)
end

-- A window closed: the panel goes with it. The close of the gossip may come after the quest
-- window that replaces it opened, and a quest window may close while a gossip shows.
function O:Closed(event)
    if not self.kind then return end
    if event == "GOSSIP_CLOSED" then
        if self.kind ~= "gossip" and windowState(WINDOWS[self.kind]) == "shown" then return end
    elseif self.kind == "gossip" then
        return
    end
    self:Hide()
end

function O:Apply()
    if not self:Enabled() then self:Hide() end
end

Ding:On("GOSSIP_SHOW", function() O:Open("gossip") end)
Ding:On("QUEST_GREETING", function() O:Open("greeting") end)
Ding:On("QUEST_DETAIL", function() O:Open("detail") end)
Ding:On("GOSSIP_CLOSED", function() O:Closed("GOSSIP_CLOSED") end)
Ding:On("QUEST_FINISHED", function() O:Closed("QUEST_FINISHED") end)
