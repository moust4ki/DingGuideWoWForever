-- NPC directory (binding DING_FINDER, the guide window's pin button, /ding find): two tabs,
-- Nearby (one row per category, its NPC the fewest seconds away) and Cities (the capitals of the
-- player's side and the neutral towns, their categories, their NPCs). LB / RB or a click change
-- tab; A or a click opens a row's list or sends the arrow to its NPC until that NPC's window
-- opens; B, Esc or a right click go back or close; B on the first page during a trip also takes
-- the arrow back to the guide. With a gamepad each action shows once: A on the focused row, B on
-- the close cross or the list's title, LB / RB at the ends of the tabs (a gamepad plugged in or
-- out lays it out again: UI/Gamepad.lua). The window takes the D-pad, A, B and the shoulders
-- only while it is open, out of combat (temporary bindings).
-- What it lists: Core/Directory.lua.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local F = {}
Ding.Finder = F

local SIZE = UI.SIZE
local WIDTH, PAD = 360, 6
local TITLE, TABS, PAGE_TITLE, FOOTER = SIZE.title, SIZE.tabs, SIZE.pageTitle, SIZE.footer
local ROW, GAP = SIZE.row2, SIZE.gap
local VISIBLE = 9                -- rows shown at once; more scroll
local EDGE, SPACE = 8, 6         -- a row's inner margin; between the time and the caret or A
local KEYS = { "PADDUP", "PADDDOWN", "PADDLEFT", "PADDRIGHT", "PAD1", "PAD2", "PADFORWARD", "PADLSHOULDER",
    "PADRSHOULDER" }
local TAB_PAGES = { "nearby", "cities" }

local function Dir() return Ding.Directory end
local function G() return Ding.Gamepad end

-- A kind's name ("Repair", "Guns", "Alchemy").
function F:Label(kind) return Dir():Label(kind) end

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

-- Sends the arrow to an entry of the directory ({ kind, npc, name, point }); `label` says what
-- for ("Guns"), the kind's name by default.
function F:GoTo(entry, label)
    if not (entry and entry.point) then return false end
    self.trip = { kind = entry.kind, npc = entry.npc, name = entry.name, point = entry.point,
        label = label or self:Label(entry.kind) }
    refresh()
    return true
end

-- The NPC of a kind the fewest seconds away (the guide window's rows: class trainer, flight
-- master, a weapon to learn).
function F:Go(kind)
    local best = Dir():Best(kind)
    if not best then
        Ding:Print(L.FINDER_NONE:format(self:Label(kind)))
        return false
    end
    return self:GoTo(best)
end

-- Ends the trip: the arrow goes back to the guide. `quiet`: the caller refreshes (the engine,
-- when the player moves the guide).
function F:Cancel(quiet)
    if not self.trip then return end
    self.trip = nil
    if not quiet then refresh() end
end

-- The game window each kind of NPC opens; a gossip window counts for every kind.
local MERCHANTS = { vendor = true, repair = true, food = true, arrows = true, bullets = true, reagents = true,
    poisons = true, trade = true, innkeeper = true }
local function windowOf(kind)
    if MERCHANTS[kind] then return "merchant" end
    if kind == "trainer" or kind:find("^weapon:") or kind:find("^profession:") then return "trainer" end
    return kind
end

-- A window of the trip's NPC opened: the guide takes the arrow back. The NPC is known by its
-- creature id, else by its name; when the client tells neither, the window of its kind counts.
local function arrived(window)
    local trip = F.trip
    if not trip then return end
    local id, name = Compat.NpcUnitID(), Compat.NpcUnitName()
    if id then
        if id == trip.npc then F:Cancel() end
    elseif name then
        if name == trip.name then F:Cancel() end
    elseif window ~= "gossip" and window == windowOf(trip.kind) then
        F:Cancel()
    end
end
for event, window in pairs({ MERCHANT_SHOW = "merchant", TRAINER_SHOW = "trainer", TAXIMAP_OPENED = "flight",
    BANKFRAME_OPENED = "bank", AUCTION_HOUSE_SHOW = "auction", PET_STABLE_SHOW = "stable", GOSSIP_SHOW = "gossip" }) do
    Ding:On(event, function() arrived(window) end)
end

---------------------------------------------------------------------------
-- What the pages show
---------------------------------------------------------------------------
-- "8 min away" (the fastest way, Core/Travel.lua), "under 1 min away"; "320 yd" without a time.
local function cost(entry)
    if entry and entry.seconds then
        if entry.seconds < 60 then return L.DIR_UNDER_MINUTE end
        return L.DIR_MINUTES:format(math.floor(entry.seconds / 60 + 0.5))
    end
    if entry and entry.distance then return L.YARDS:format(Ding.Compat.Number(entry.distance)) end
    return ""
end

-- The ways the trip takes besides walking, after a line: "… · by flight, boat".
local MEANS = { fly = "DIR_BY_FLY", boat = "DIR_BY_BOAT", zeppelin = "DIR_BY_ZEPPELIN", tram = "DIR_BY_TRAM",
    hearth = "DIR_BY_HEARTH", teleport = "DIR_BY_TELEPORT" }
local function withMeans(text, entry)
    local names, seen = {}, {}
    for _, kind in ipairs(entry and entry.means or {}) do
        local key = MEANS[kind]
        if key and not seen[key] then
            seen[key] = true
            names[#names + 1] = L[key]
        end
    end
    if #names == 0 then return text end
    return text .. " · " .. L.DIR_BY:format(table.concat(names, ", "))
end

-- "Buliwyf Stonehand · Ironforge · by flight"
local function npcLine(entry)
    local place = Dir():Place(entry.point)
    return withMeans((entry.name or "?") .. (place and (" · " .. place) or ""), entry)
end

-- "Guns, Bows, Thrown and 2 more"
local function choiceNames(choices)
    local names = {}
    for i = 1, math.min(3, #choices) do names[i] = choices[i].label end
    local text = table.concat(names, ", ")
    if #choices > 3 then text = text .. " " .. UI.More(#choices - 3) end
    return text
end

-- The first thing an NPC offers ("Vendor, Repair" -> "Vendor"), the trip's label.
local function firstOffer(offers)
    return offers and offers:match("^(.-), ") or offers
end

-- Rows of a page: { label, sub, right, caret (opens `open`), entry (a trip; `label` says what
-- for), back (back to the guide), dim }.
function F:Rows(page)
    local D, rows = Dir(), {}
    local function add(row) rows[#rows + 1] = row end
    if page.kind == "nearby" then
        if self.trip then
            add({ label = L.TRIP_CANCEL, sub = L.FINDER_TRIP_NOW:format(self.trip.name or "?"), back = true })
        end
        for _, e in ipairs(D:Entries()) do
            local name = L[e.category.label]
            if e.choices then
                add({ label = name, sub = choiceNames(e.choices), caret = true,
                    open = { kind = "choices", category = e.category, title = name } })
            elseif e.best then
                add({ label = name, sub = npcLine(e.best), right = cost(e.best), entry = e.best })
            else
                add({ label = name, sub = L.FINDER_NOTHING, dim = true })
            end
        end
    elseif page.kind == "choices" then
        for _, c in ipairs(D:ChoiceEntries(page.category, nil, page.all)) do
            add({ label = c.label, sub = npcLine(c.best), right = cost(c.best), entry = c.best, what = c.label })
        end
    elseif page.kind == "cities" then
        for _, c in ipairs(D:Cities()) do
            add({ label = c.name, sub = withMeans(c.city.side and L.DIR_CAPITAL or L.DIR_TOWN, c), right = cost(c),
                caret = true, open = { kind = "city", city = c.city, title = c.name } })
        end
    elseif page.kind == "city" then
        local within = D:CityNpcs(page.city)
        for _, e in ipairs(D:Entries(within)) do
            local name = L[e.category.label]
            local sub
            if e.choices then
                sub = choiceNames(e.choices)
            else
                local count = #D:Fastest(e.kind, within)
                sub = (e.best.name or "?") .. (count > 1 and (" " .. UI.More(count - 1)) or "")
            end
            add({ label = name, sub = sub, right = cost(e.best), caret = true,
                open = { kind = "citylist", city = page.city, category = e.category,
                    title = page.title .. " · " .. name } })
        end
    elseif page.kind == "citylist" then
        for _, e in ipairs(D:CityList(page.city, page.category)) do
            if page.category.choices then
                add({ label = e.label, sub = e.best.name, right = cost(e.best), entry = e.best, what = e.label })
            else
                add({ label = e.name, sub = withMeans(e.offers, e), right = cost(e), entry = e,
                    what = L[page.category.label] })
            end
        end
    elseif page.kind == "search" then
        for _, r in ipairs(page.results) do
            if r.category then
                local name = L[r.category.label]
                add({ label = name, sub = choiceNames(D:ChoiceEntries(r.category, nil, true)), caret = true,
                    open = { kind = "choices", category = r.category, all = true, title = name } })
            elseif r.kind == "npc" then
                local place = D:Place(r.point)
                local sub = withMeans(r.offers .. (place and (" · " .. place) or ""), r)
                add({ label = r.name, sub = sub, right = cost(r), entry = r, what = firstOffer(r.offers) })
            elseif r.best then
                add({ label = r.label, sub = npcLine(r.best), right = cost(r.best), entry = r.best, what = r.label })
            else
                add({ label = r.label, sub = L.FINDER_NOTHING, dim = true })
            end
        end
        if #rows == 0 then add({ label = L.DIR_SEARCH_NONE:format(page.text), dim = true }) end
    end
    return rows
end

---------------------------------------------------------------------------
-- The window
---------------------------------------------------------------------------
-- Tab: label only; the active one is light with a 2-unit accent underline (the settings' look).
local function tabButton(parent, text)
    local b = CreateFrame("Button", nil, parent)
    b:SetHeight(TABS)
    b:RegisterForClicks("LeftButtonUp")
    b.label = UI.Text(b, "semibold", 12, C.secondary)
    b.label:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.label:SetText(text)
    b.underline = b:CreateTexture(nil, "ARTWORK")
    b.underline:SetColorTexture(unpack(C.accent))
    b.underline:SetHeight(2)
    b.underline:SetPoint("BOTTOMLEFT", b, "BOTTOMLEFT", 0, 0)
    b.underline:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 0, 0)
    function b:SetActive(active)
        self.active = active
        self.label:SetTextColor(unpack(active and C.text or C.secondary))
        self.underline:SetShown(active)
    end
    b:SetScript("OnEnter", function(self) if not self.active then self.label:SetTextColor(unpack(C.text)) end end)
    b:SetScript("OnLeave", function(self) self:SetActive(self.active) end)
    b:SetWidth(UI.Measure(b.label) + 24)
    return b
end

local function newRow(parent, i)
    local r = CreateFrame("Button", nil, parent)
    r:SetHeight(ROW)
    r:SetPoint("TOPLEFT", parent, "TOPLEFT", PAD, -((i - 1) * (ROW + GAP)))
    r:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -PAD, -((i - 1) * (ROW + GAP)))
    r:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    r.bg = UI.Shape(r, "row", C.control, "BACKGROUND"):Place(r)
    r.focus = UI.Focus(r)
    r.label = UI.Text(r, "medium", 12, C.text)
    r.sub = UI.Text(r, "regular", 11, C.secondary)
    r.sub:SetPoint("TOPLEFT", r.label, "BOTTOMLEFT", 0, -2)
    r.time = UI.Text(r, "semibold", 12, C.accent)
    r.time:SetJustifyH("RIGHT")
    r.caret = UI.Caret(r, "RIGHT", 8, C.secondary)
    r.key = UI.Glyph(r)
    r.key:SetKey("PAD1")
    r.key:SetPoint("RIGHT", r, "RIGHT", -EDGE, 0)
    r:SetScript("OnClick", function(self, button)
        if button == "RightButton" then return F:Back() end
        F:Activate(self.index)
    end)
    r:SetScript("OnEnter", function(self) F:SetFocus(self.index) end)
    r:EnableMouseWheel(true)
    r:SetScript("OnMouseWheel", function(_, delta) F:Scroll(-delta) end)
    return r
end

function F:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingFinder", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetWidth(WIDTH)
    UI.Dialog(f, 0, 80)
    f.look = UI.Window(f)

    -- Title bar: "Ding! · Directory", B, close cross.
    f.title = UI.Text(f, "semibold", 13, C.text)
    f.title:SetPoint("LEFT", f, "TOPLEFT", 12, -TITLE / 2)
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.FINDER_TITLE)
    f.close = UI.IconButton(f, 24)
    f.close:SetPoint("RIGHT", f, "TOPRIGHT", -6, -TITLE / 2)
    f.close.label = UI.Text(f.close, "regular", 16, C.secondary)
    f.close.label:SetPoint("CENTER", f.close, "CENTER", 0, 1)
    f.close.label:SetText("×")
    f.close:SetScript("OnClick", function() F:Close() end)
    f.back = UI.Glyph(f)
    f.back:SetKey("PAD2")
    f.back:SetPoint("RIGHT", f.close, "LEFT", -8, 0)
    UI.Divider(f, -TITLE)

    -- Tabs between LB and RB.
    f.lb = UI.Glyph(f)
    f.lb:SetKey("PADLSHOULDER")
    f.lb:SetPoint("LEFT", f, "TOPLEFT", 8, -(TITLE + 1 + TABS / 2))
    f.rb = UI.Glyph(f)
    f.rb:SetKey("PADRSHOULDER")
    f.tabs = {}
    for i, key in ipairs(TAB_PAGES) do
        local b = tabButton(f, key == "nearby" and L.DIR_TAB_NEARBY or L.DIR_TAB_CITIES)
        b:SetScript("OnClick", function() F:SelectTab(i) end)
        f.tabs[i] = b
    end
    UI.Divider(f, -(TITLE + 1 + TABS), C.border)

    -- A list's title: back caret, B, its name; a click goes back.
    local t = CreateFrame("Button", nil, f)
    t:SetHeight(PAGE_TITLE)
    t:SetPoint("TOPLEFT", f, "TOPLEFT", PAD, -(TITLE + 2 + TABS))
    t:SetPoint("TOPRIGHT", f, "TOPRIGHT", -PAD, -(TITLE + 2 + TABS))
    t:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    t.caret = UI.Caret(t, "LEFT", 8, C.accent)
    t.caret:SetPoint("LEFT", t, "LEFT", 8, 0)
    t.key = UI.Glyph(t)
    t.key:SetKey("PAD2")
    t.key:SetPoint("LEFT", t.caret, "RIGHT", 8, 0)
    t.label = UI.Text(t, "semibold", 13, C.text)
    t:SetScript("OnClick", function() F:Back() end)
    f.pageTitle = t

    -- The rows, in a scroll frame.
    local list = CreateFrame("ScrollFrame", nil, f)
    list:EnableMouseWheel(true)
    list:SetScript("OnMouseWheel", function(_, delta) F:Scroll(-delta) end)
    list.child = CreateFrame("Frame", nil, list)
    list.child:SetWidth(WIDTH)
    list:SetScrollChild(list.child)
    f.list = list
    f.rows = {}

    f.divider = UI.Divider(f, -100)
    f.help = G():NewHintBar(f, WIDTH - 24, FOOTER, function(key) F:OnKey(key) end)
    f.help:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, 0)

    -- Esc goes back or closes (a trip goes on): the key is kept from the game.
    f:EnableKeyboard(true)
    pcall(f.SetPropagateKeyboardInput, f, true)
    f:SetScript("OnKeyDown", function(self, key)
        local mine = key == "ESCAPE"
        pcall(self.SetPropagateKeyboardInput, self, not mine)
        if mine then F:Back() end
    end)
    f:SetScript("OnMouseUp", function(_, button) if button == "RightButton" then F:Back() end end)
    f:SetScript("OnHide", function() F:OnHide() end)
    f:Hide()
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingFinder") end
    self.frame = f
end

-- The page on screen, top of the stack.
function F:Page() return self.stack and self.stack[#self.stack] end

-- Lays the page out: title or tabs, rows, height, focus, help.
function F:Layout()
    local f, page = self.frame, self:Page()
    local pad = G():Active()
    self.rows = self:Rows(page)
    local deep = #self.stack > 1

    for i, b in ipairs(f.tabs) do b:SetActive(i == self.tab) end
    local x = 8 + (pad and (f.lb:GetWidth() + 6) or 0)
    for _, b in ipairs(f.tabs) do
        b:ClearAllPoints()
        b:SetPoint("TOPLEFT", f, "TOPLEFT", x, -(TITLE + 1))
        x = x + b:GetWidth() + 2
    end
    f.lb:SetShown(pad)
    f.rb:ClearAllPoints()
    f.rb:SetPoint("LEFT", f, "TOPLEFT", x + 4, -(TITLE + 1 + TABS / 2))
    f.rb:SetShown(pad)
    -- B on the close cross on a tab's first page, on the list's title further in.
    f.back:SetShown(pad and not deep)
    local t = f.pageTitle
    t:SetShown(deep)
    t.key:SetShown(pad)
    t.label:ClearAllPoints()
    t.label:SetPoint("LEFT", pad and t.key or t.caret, "RIGHT", pad and 6 or 8, 0)
    t.label:SetText(deep and page.title or "")

    local top = TITLE + 2 + TABS + (deep and PAGE_TITLE or 0) + PAD
    local shown = math.max(1, math.min(VISIBLE, #self.rows))
    local height = shown * (ROW + GAP) - GAP
    f.list:ClearAllPoints()
    f.list:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -top)
    f.list:SetSize(WIDTH, height)
    f.list.child:SetHeight(math.max(1, #self.rows * (ROW + GAP) - GAP))
    -- On the right of a row, from its edge: a slot for the caret (a list) or, on the focused row
    -- with a gamepad, the A chip in its place; then the time. With a gamepad every row keeps the
    -- chip's room, so that nothing moves with the focus; the texts stop before them.
    local slot = pad and UI.KeysWidth({ "PAD1" }) - 6 or 8     -- the chip alone, without its gap to a label
    for i, row in ipairs(self.rows) do
        local r = f.rows[i] or newRow(f.list.child, i)
        f.rows[i] = r
        r.index, r.data = i, row
        local mark = (pad or row.caret) and slot or 0
        r.label:SetText(row.label or "")
        r.label:SetTextColor(unpack(row.dim and C.disabled or C.text))
        r.label:ClearAllPoints()
        if row.sub then
            r.label:SetPoint("TOPLEFT", r, "TOPLEFT", EDGE, -math.floor((ROW - (16 + 2 + 14)) / 2))
        else
            r.label:SetPoint("LEFT", r, "LEFT", EDGE, 0)
        end
        r.sub:SetText(row.sub or "")
        r.sub:SetShown(row.sub ~= nil)
        r.caret:ClearAllPoints()
        r.caret:SetPoint("CENTER", r, "RIGHT", -(EDGE + mark / 2), 0)
        r.caret:SetShown(row.caret == true)
        r.time:SetText(row.right or "")
        r.time:ClearAllPoints()
        local timeRight = EDGE + mark + (mark > 0 and SPACE or 0)
        r.time:SetPoint("RIGHT", r, "RIGHT", -timeRight, 0)
        local time = (row.right or "") ~= "" and UI.Measure(r.time) or 0
        local text = WIDTH - 2 * PAD - EDGE - timeRight - (time > 0 and time + EDGE or 0)
        r.label:SetWidth(math.max(40, text))
        r.sub:SetWidth(math.max(40, text))
        r:Show()
    end
    for i = #self.rows + 1, #f.rows do f.rows[i]:Hide() end
    local footerTop = top + height + PAD
    f.divider:ClearAllPoints()
    f.divider:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -footerTop)
    f.divider:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -footerTop)
    f:SetHeight(footerTop + 1 + FOOTER)
    page.focus = math.max(1, math.min(page.focus or 1, #self.rows))
    self:SetFocus(page.focus)
end

-- The focused row: its ring, A on it in the caret's place (gamepad), and in view.
function F:SetFocus(i)
    local page, f = self:Page(), self.frame
    if not page then return end
    page.focus = i
    local pad = G():Active()
    for j, r in ipairs(f.rows) do
        local on = j == i and r:IsShown()
        r.focus:SetShown(on)
        local data = r.data or {}
        local key = on and pad and not data.dim and true or false
        r.key:SetShown(key)
        r.caret:SetShown(data.caret == true and not key)
    end
    -- Scrolled so that the focused row shows.
    local offset = self.offset or 0
    local count = #(self.rows or {})
    if i - 1 < offset then offset = i - 1 end
    if i > offset + VISIBLE then offset = i - VISIBLE end
    self:ScrollTo(math.max(0, math.min(offset, math.max(0, count - VISIBLE))))
    self:UpdateHelp()
end

function F:ScrollTo(offset)
    self.offset = offset
    if self.frame.list.SetVerticalScroll then self.frame.list:SetVerticalScroll(offset * (ROW + GAP)) end
end

-- The mouse wheel: a row at a time.
function F:Scroll(delta)
    local count = #(self.rows or {})
    self:ScrollTo(math.max(0, math.min((self.offset or 0) + delta, math.max(0, count - VISIBLE))))
end

-- The footer: with a gamepad, what the times mean (every action has its chip); without, the
-- mouse help.
function F:UpdateHelp()
    local help = self.frame.help
    if G():Active() then
        help:SetHints({ UI.Hint(nil, L.DIR_TIMES) })
    else
        help:SetHints({ UI.Hint(nil, #self.stack > 1 and L.DIR_MOUSE_PAGE or L.FINDER_MOUSE) })
    end
end

-- Opens the window on a tab (1 Nearby, 2 Cities; the last one by default).
function F:Open(tab)
    if InCombatLockdown() then
        Ding:Print(L.CONFIG_COMBAT)
        return false
    end
    self:Create()
    if Ding.Config.frame and Ding.Config.frame:IsShown() then Ding.Config:Close() end
    if Ding.Setup:IsShown() then Ding.Setup:Close(true) end
    if Ding.Panel.focusing then Ding.Panel:StopFocus() end
    Dir():Forget()
    self.tab = tab or self.tab or 1
    self.stack = { { kind = TAB_PAGES[self.tab] } }
    self.offset = 0
    self.frame:Show()
    self:Layout()
    G():Take(self.frame, function(key) F:OnKey(key) end, 0.4, 0.12, KEYS)
    return true
end

-- /ding find <text>: the results in the window, over the Nearby tab (B goes back to it).
function F:Find(text)
    text = (text or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if text == "" then
        Ding:Print(L.DIR_FIND_USAGE)
        return false
    end
    if not self:Open(1) then return false end
    local results = Dir():Search(text)
    if #results == 0 then Ding:Print(L.DIR_SEARCH_NONE:format(text)) end
    self:Push({ kind = "search", text = text, results = results, title = L.DIR_SEARCH_TITLE:format(text) })
    return true
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

function F:SelectTab(i)
    self.tab = (i - 1) % #TAB_PAGES + 1
    self.stack = { { kind = TAB_PAGES[self.tab] } }
    self.offset = 0
    self:Layout()
end

function F:Push(page)
    self.stack[#self.stack + 1] = page
    self.offset = 0
    self:Layout()
end

-- Back to the previous page; on a tab's first page, close (B: and end a trip, `cancel`).
function F:Back(cancel)
    if self.stack and #self.stack > 1 then
        table.remove(self.stack)
        self.offset = 0
        self:Layout()
        return
    end
    self:Close()
    if cancel then self:Cancel() end
end

-- A or a click on a row: back to the guide, a list, or a trip to its NPC.
function F:Activate(i)
    local row = self.rows and self.rows[i]
    if not row or row.dim then return end
    if row.back then
        self:Close()
        self:Cancel()
    elseif row.open then
        self:Push(row.open)
    elseif row.entry then
        self:Close()
        self:GoTo(row.entry, row.what)
    end
end

function F:OnKey(key)
    local page = self:Page()
    local count = #(self.rows or {})
    if key == "PADDUP" or key == "PADDDOWN" then
        if count > 0 then self:SetFocus((page.focus - 1 + (key == "PADDUP" and -1 or 1)) % count + 1) end
    elseif key == "PAD1" then
        self:Activate(page.focus)
    elseif key == "PADDRIGHT" then
        local row = self.rows[page.focus]
        if row and row.open then self:Push(row.open) end
    elseif key == "PAD2" or key == "PADFORWARD" then
        self:Back(true)
    elseif key == "PADDLEFT" then
        if #self.stack > 1 then self:Back() end
    elseif key == "PADLSHOULDER" or key == "PADRSHOULDER" then
        self:SelectTab(self.tab + (key == "PADLSHOULDER" and -1 or 1))
    end
end

Ding:On("PLAYER_REGEN_DISABLED", function() F:Close() end)
