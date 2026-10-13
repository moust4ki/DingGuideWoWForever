-- Nearby services (binding DING_FINDER): a small list of the vendor, repairer, innkeeper,
-- flight master and class trainer of the player's side that are the fewest seconds away
-- (Core/Travel.lua), else the fewest yards. A (or a click) sends the arrow to one until that
-- NPC's window opens; B (Esc, a right click) closes the list and, during such a trip, takes
-- the arrow back to the guide. The list takes the D-pad, A and B only while it is open, out
-- of combat (temporary bindings).
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local F = {}
Ding.Finder = F

local KINDS = { "vendor", "repair", "innkeeper", "flight", "trainer" }
F.KINDS = KINDS
local LABELS = { vendor = "FINDER_VENDOR", repair = "FINDER_REPAIR", innkeeper = "FINDER_INN",
    flight = "FINDER_FLIGHT", trainer = "FINDER_TRAINER" }
local CANDIDATES = 4             -- nearest by distance, then compared by travel time
local WIDTH, ROW, PAD, TITLE, FOOTER = 320, 32, 6, 28, 28
local KEYS = { "PADDUP", "PADDDOWN", "PAD1", "PAD2", "PADFORWARD" }

function F:Label(kind) return L[LABELS[kind]] end

-- The NPC of a service to go to: { kind, npc, name, point, seconds, distance } or nil.
function F:Best(kind)
    local best
    for _, n in ipairs(Ding.Services:Nearest(kind, CANDIDATES)) do
        local plan = Ding.Travel:Plan(n.point)
        local entry = { kind = kind, npc = n.npc, name = n.name, point = n.point, distance = n.distance,
            seconds = plan and plan.seconds or nil }
        if not best then
            best = entry
        elseif entry.seconds and best.seconds then
            if entry.seconds < best.seconds then best = entry end
        elseif entry.distance < best.distance then
            best = entry
        end
    end
    return best
end

---------------------------------------------------------------------------
-- The trip: the arrow goes to the chosen NPC (UI/Arrow.lua reads F.trip)
---------------------------------------------------------------------------
local function refresh()
    if Ding.Arrow and Ding.Arrow.frame then
        Ding.Arrow.point = nil
        Ding:Safe(Ding.Arrow.Update, Ding.Arrow)
    end
    if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
end

function F:Go(kind)
    local best = self:Best(kind)
    if not best then
        Ding:Print(L.FINDER_NONE:format(self:Label(kind)))
        return false
    end
    self.trip = best
    refresh()
    return true
end

function F:Cancel()
    if not self.trip then return end
    self.trip = nil
    refresh()
end

-- That NPC's window opened: the guide takes the arrow back.
local function arrived(kinds)
    local trip = F.trip
    if not trip or not kinds[trip.kind] then return end
    local name = Compat.NpcUnitName()
    if name and trip.name and name ~= trip.name then return end
    F:Cancel()
end
Ding:On("MERCHANT_SHOW", function() arrived({ vendor = true, repair = true, innkeeper = true }) end)
Ding:On("GOSSIP_SHOW", function() arrived({ innkeeper = true }) end)
Ding:On("TAXIMAP_OPENED", function() arrived({ flight = true }) end)
Ding:On("TRAINER_SHOW", function() arrived({ trainer = true }) end)

---------------------------------------------------------------------------
-- The list
---------------------------------------------------------------------------
local function G() return Ding.Gamepad end

local function newRow(f, i)
    local r = CreateFrame("Button", nil, f)
    r:SetHeight(ROW)
    r:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -(TITLE + PAD + (i - 1) * (ROW + 2)))
    r:SetPoint("TOPRIGHT", f, "TOPRIGHT", -PAD, -(TITLE + PAD + (i - 1) * (ROW + 2)))
    r:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    r.bg = UI.Shape(r, "row", C.control, "BACKGROUND"):Place(r)
    r.focus = UI.Focus(r)
    r.label = UI.Text(r, "medium", 12, C.text)
    r.label:SetPoint("TOPLEFT", r, "TOPLEFT", 8, -4)
    r.sub = UI.Text(r, "regular", 11, C.secondary)
    r.sub:SetPoint("TOPLEFT", r.label, "BOTTOMLEFT", 0, -1)
    r.time = UI.Text(r, "semibold", 12, C.accent)
    r.time:SetJustifyH("RIGHT")
    r.time:SetPoint("RIGHT", r, "RIGHT", -8, 0)
    r:SetScript("OnClick", function(self, button)
        if button == "RightButton" then return F:Close() end
        F:Choose(self.entry)
    end)
    r:SetScript("OnEnter", function(self) F:SetFocus(self.index) end)
    return r
end

-- "1:20" for seconds, "320 yd" without a time.
local function cost(entry)
    if entry.seconds then
        local s = math.floor(entry.seconds + 0.5)
        return ("%d:%02d"):format(math.floor(s / 60), s % 60)
    end
    if entry.distance then return L.YARDS:format(entry.distance) end
    return ""
end

function F:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingFinder", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 80)
    f.look = UI.Window(f)
    f.title = UI.Text(f, "semibold", 12, C.text)
    f.title:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -8)
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.FINDER_TITLE)
    f.rows = {}
    f.help = G():NewHintBar(f, WIDTH - 24, FOOTER, function(key) F:OnKey(key) end)
    f.help:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, 0)
    f:SetScript("OnHide", function() F:OnHide() end)
    f:Hide()
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingFinder") end
    self.frame = f
end

-- Entries: back to the guide (during a trip), then each service found.
function F:Entries()
    local out = {}
    if self.trip then out[#out + 1] = { kind = "guide" } end
    for _, kind in ipairs(KINDS) do
        out[#out + 1] = self:Best(kind) or { kind = kind, missing = true }
    end
    return out
end

function F:Layout()
    local f = self.frame
    self.entries = self:Entries()
    for i, entry in ipairs(self.entries) do
        local r = f.rows[i] or newRow(f, i)
        f.rows[i] = r
        r.entry, r.index = entry, i
        if entry.kind == "guide" then
            r.label:SetText(L.FINDER_BACK)
            r.sub:SetText(L.FINDER_TRIP_NOW:format(self.trip.name or "?"))
            r.time:SetText("")
        else
            r.label:SetText(self:Label(entry.kind))
            r.sub:SetText(entry.missing and L.FINDER_NOTHING or (entry.name or "?"))
            r.time:SetText(entry.missing and "" or cost(entry))
        end
        r.label:SetTextColor(unpack(entry.missing and C.disabled or C.text))
        r:Show()
    end
    for i = #self.entries + 1, #f.rows do f.rows[i]:Hide() end
    f:SetSize(WIDTH, TITLE + PAD * 2 + #self.entries * (ROW + 2) + FOOTER)
    self:SetFocus(math.max(1, math.min(self.focusIndex or 1, #self.entries)))
end

function F:SetFocus(i)
    self.focusIndex = i
    for j, r in ipairs(self.frame.rows) do r.focus:SetShown(j == i and r:IsShown()) end
    self:UpdateHelp()
end

function F:UpdateHelp()
    local help = self.frame.help
    if G():Active() then
        help:SetHints({ UI.Hint("PAD1", L.HINT_GO), UI.Hint("PAD2", L.HINT_BACK) })
    else
        help:SetHints({ UI.Hint(nil, L.FINDER_MOUSE) })
    end
end

function F:Open()
    if InCombatLockdown() then
        Ding:Print(L.CONFIG_COMBAT)
        return
    end
    self:Create()
    if Ding.Config.frame and Ding.Config.frame:IsShown() then Ding.Config:Close() end
    if Ding.Panel.focusing then Ding.Panel:StopFocus() end
    self.focusIndex = 1
    self:Layout()
    self.frame:Show()
    G():Take(self.frame, function(key) F:OnKey(key) end, 0.4, 0.12, KEYS)
end

function F:Close()
    if self.frame then self.frame:Hide() end
end

function F:Toggle()
    if self.frame and self.frame:IsShown() then self:Close() else self:Open() end
end

function F:OnHide()
    G():Release(self.frame)
end

-- A row chosen: back to the guide, or a trip to that NPC.
function F:Choose(entry)
    if not entry or entry.missing then return end
    self:Close()
    if entry.kind == "guide" then
        self:Cancel()
    else
        self.trip = entry
        refresh()
    end
end

function F:OnKey(key)
    local count = #(self.entries or {})
    if key == "PADDUP" or key == "PADDDOWN" then
        if count > 0 then self:SetFocus((self.focusIndex - 1 + (key == "PADDUP" and -1 or 1)) % count + 1) end
    elseif key == "PAD1" then
        self:Choose(self.entries[self.focusIndex])
    elseif key == "PAD2" or key == "PADFORWARD" then
        -- B during a trip: the guide takes the arrow back.
        self:Close()
        self:Cancel()
    end
end

Ding:On("PLAYER_REGEN_DISABLED", function() F:Close() end)
