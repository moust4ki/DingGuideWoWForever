-- Quests an NPC offers (gossip, quest greeting, quest details): beside the game's window, a plain
-- sentence per quest says whether to take it now and why, in the guide's terms (no color code:
-- Yendi's feedback). Take it (the steps at the player's place take it, or a later step needs
-- it), later in the guide (its step; you can take it now when AutoQuest would), when you come
-- back in a later section, the guide took it earlier, or the guide does not do it and the real
-- reason when Ding knows it (an option off, another race or class, an elite quest, gray; the
-- route's own reasons through Ding.Why when it is there), else honestly that the guide does not
-- plan it. Shown only when one quest at least is not for right now. Information only, nothing to
-- press: Ding's own frame on UIParent, without the mouse. The game's windows are only read (where
-- they stand, whether they are shown), never anchored to, changed, shown nor hidden: with the
-- gamepad interface on, touching them taints the game's frame controls.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local O = {}
Ding.Offers = O

local ELITE_RANKS = { [1] = true, [2] = true, [3] = true }   -- elite, rare elite, boss
local SHOW_DELAY = 0.2          -- seconds: the game shows its window, AutoQuest may take a quest
local WATCH = 0.2               -- seconds between two looks at the game's window
local WIDTH, PAD, TITLE, LINE_GAP, ROW_GAP, GAP = 280, 12, 30, 2, 8, 8
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
-- player's place want and those AutoQuest takes ahead of the guide, the last of those steps,
-- the player's level.
function O:Context()
    local AQ = Ding.AutoQuest
    local accept, _, ahead = AQ:Wanted()
    local ctx = { now = {}, ahead = ahead, hereEnd = AQ:PlaceEnd(), level = UnitLevel("player") }
    for q in pairs(accept) do
        if not ahead[q] then ctx.now[q] = true end
    end
    return ctx
end

-- In another section of the active pack: the first one after the active section, else the last
-- one before it (`before`). Returns { guide, step, before } or nil, and the first reason a
-- section that takes the quest is not for this character.
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
                        if past then before = { guide = g, step = i, before = true } else after = { guide = g, step = i } end
                        break
                    end
                    blocked = blocked or off
                end
            end
        end
    end
    return after or before, blocked
end

-- The route's own reason for leaving quest q out, as the generator wrote it (Ding.Why, when it is
-- there): a clause in the client's language, or nil. The one place that asks: never guessed here.
function O:WhyLeftOut(q)
    local why = Ding.Why
    if type(why) ~= "table" or type(why.Quest) ~= "function" then return nil end
    local ok, text = pcall(why.Quest, why, q)
    if ok and type(text) == "table" then text = text.text end
    if ok and type(text) == "string" and text ~= "" then return text end
    return nil
end

-- Why the guide does not do a quest, when Ding knows it: a reason key ("class", "elitesOff",
-- "dungeonsOff", "route" with the route's text, "elite") and that text, or nil. The player's own
-- settings and race or class first, then the route's reason, then an elite quest (the generator
-- leaves elite quests out unless a guide tags them).
local REASON_OF_OPTION = { class = "class", elites = "elitesOff", dungeons = "dungeonsOff" }
local function whyNot(q, blocked)
    if blocked and REASON_OF_OPTION[blocked] then return REASON_OF_OPTION[blocked] end
    local D = Ding.Data
    if D:QuestExists(q) and not D:QuestOpenToPlayer(q) then return "class" end
    local text = O:WhyLeftOut(q)
    if text then return "route", text end
    if isElite(q) then return "elite" end
    return nil
end

-- What the active guide does with quest q: { kind, step, guide, before, ahead, reason }, kind
-- "now" (the steps at the player's place take it), "later" (a later step of this section takes
-- it; `ahead`: AutoQuest would take it on the way), "needed" (a later step works on it: Ding asks
-- to pick it up there), "earlier" (a step already passed took it), "other" (`guide`, another
-- section of the pack, its `step`; `before`: a section before the active one), "none" (`reason`
-- or nil, `text`: the route's own words). nil without a guide.
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
    if later then return { kind = "later", step = later, ahead = ctx.ahead[q] == true } end
    if needed then return { kind = "needed", step = needed } end
    if past then return { kind = "earlier", step = past } end
    local other, otherBlocked = otherSection(q, guide)
    if other then return { kind = "other", guide = other.guide, step = other.step, before = other.before } end
    local reason, text = whyNot(q, blocked or otherBlocked)
    return { kind = "none", reason = reason, text = text }
end

local REASONS = { class = "OFFER_WHY_CLASS", elitesOff = "OFFER_WHY_ELITES_OFF",
    dungeonsOff = "OFFER_WHY_DUNGEONS_OFF", elite = "OFFER_WHY_ELITE" }

-- A section's title without the levels the Leveling sections end with, "(30-32)".
local function sectionName(g)
    return ((g.title or g.id):gsub("%s*%(%d+%-%d+%)%s*$", ""))
end

-- Whether to take quest q now, from what the guide does with it (Classify): the verdict ("take",
-- "can", "notNow", "optional", "useless") and plain sentences for the player, without color
-- codes. A quest above the player's level says both levels.
function O:Verdict(r, q, ctx)
    local level = q and Ding.Data:QuestLevel(q) or 0
    local above = level > ctx.level
    local verdict, text
    if r.kind == "now" then
        verdict = "take"
        if not r.step then
            text = L.OFFER_TAKE_CHAIN
        elseif r.step <= Ding.Engine.index then
            text = L.OFFER_TAKE_CURRENT
        else
            text = L.OFFER_TAKE_HERE:format(r.step)
        end
    elseif r.kind == "needed" then
        verdict, text = "take", L.OFFER_TAKE_NEEDED:format(r.step)
    elseif r.kind == "later" then
        text = L.OFFER_LATER:format(r.step)
        if r.ahead then
            verdict, text = "can", L.OFFER_JOIN:format(text, L.OFFER_LATER_NOW)
        elseif above then
            -- AutoQuest leaves it for later: too high now.
            verdict, text, above = "notNow", L.OFFER_JOIN:format(text, L.OFFER_TOO_HIGH:format(level, ctx.level)), false
        elseif Compat.NumQuestsInLog() >= Ding.AutoQuest.AHEAD_LOG_LIMIT then
            verdict, text = "notNow", L.OFFER_JOIN:format(text, L.OFFER_LOG_FULL)
        else
            verdict = "notNow"
        end
    elseif r.kind == "earlier" then
        verdict, text = "optional", L.OFFER_EARLIER:format(r.step)
    elseif r.kind == "other" then
        local g = r.guide
        verdict = r.before and "optional" or "notNow"
        text = (r.before and L.OFFER_EARLIER_SECTION or L.OFFER_COME_BACK)
            :format(sectionName(g), g.minLevel or 1, g.maxLevel or 60)
    else
        verdict = "useless"
        if r.reason == "grey" then
            text = L.OFFER_GREY
        elseif r.text or REASONS[r.reason] then
            text = L.OFFER_NOT_DONE:format(r.text or L[REASONS[r.reason]])
        else
            -- No reason known: said as it is, never made up. Too high is a fact, not the reason.
            text = L.OFFER_UNKNOWN
            if above then
                text, above = L.OFFER_JOIN:format(text, L.OFFER_TOO_HIGH:format(level, ctx.level)), false
            end
        end
    end
    if above then text = L.OFFER_JOIN:format(text, L.OFFER_LEVEL_GAP:format(level, ctx.level)) end
    return verdict, text
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

-- The rows: { quest, name, result, verdict, text }.
function O:Entries(kind)
    local out = {}
    if not Ding.Engine.guide then return out end
    local ctx = self:Context()
    for _, offer in ipairs(self:Offered(kind)) do
        local q, e = offer.quest, { quest = offer.quest }
        local level = q and Ding.Data:QuestLevel(q) or 0
        local name = q and Ding.Data:QuestExists(q) and Ding.Data:QuestName(q) or offer.title or "?"
        -- No card to hover here (the panel takes no mouse): the level in words, not "[24]".
        e.name = level > 0 and L.OFFER_NAME:format(name, level) or name
        e.result = q and self:Classify(q, ctx) or { kind = "none" }
        e.verdict, e.text = self:Verdict(e.result, q, ctx)
        out[#out + 1] = e
    end
    return out
end

-- Worth showing: one quest at least that the steps at the player's place do not take (when the
-- guide takes them all here, there is nothing to say).
function O:Useful(entries)
    for _, e in ipairs(entries) do
        if e.result.kind ~= "now" then return true end
    end
    return false
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

-- Both texts wrap without a limit: never cut.
local function newRow(f)
    local r = { name = UI.Text(f, "medium", 12, C.text), status = UI.Text(f, "regular", 11, C.secondary) }
    UI.Wrap(r.name, 12)
    UI.Wrap(r.status, 11)
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
        y = y + r.name:GetStringHeight() + LINE_GAP
        r.status:ClearAllPoints()
        r.status:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -y)
        r.status:SetWidth(inner)
        r.status:SetText(e.text)
        r.name:Show()
        r.status:Show()
        y = y + r.status:GetStringHeight() + ROW_GAP
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
    if not self:Useful(entries) then return self:Hide() end
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
