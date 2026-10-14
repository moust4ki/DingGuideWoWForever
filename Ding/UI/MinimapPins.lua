-- Pins on the minimap, with Ding's own textures: the arrow's target (an accent ring), a few
-- of the step's nearest spots (dots), and an arrow on the minimap's edge when the target is
-- farther than the minimap shows. Hidden in instances and with the guide window. No world
-- map pins. The pins are Ding's frames on the minimap; the minimap is only read (its size
-- and zoom). Hovered, a pin says what it is.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local MP = {}
Ding.MinimapPins = MP

local INTERVAL = 0.1     -- seconds between two placements
local DOTS = 5           -- spots of the step shown besides the target
local LOOP_DOTS = 12     -- stops of the arrow's farming loop, in a kill or gather area
local EDGE_INSET = 6     -- the edge arrow sits this far inside the minimap's rim
-- Yards across the minimap at each zoom level, outdoors and indoors (Classic).
local OUTDOORS = { [0] = 466 + 2 / 3, 400, 333 + 1 / 3, 266 + 2 / 3, 200, 133 + 1 / 3 }
local INDOORS = { [0] = 300, 240, 180, 120, 80, 50 }

local function minimap() return _G.Minimap end

-- What a pin stands for, in words, when the mouse is over it: the target's or the spot's name,
-- then the arrow's target, a spot of the step, a stop of the farming loop.
function MP:Explain(f)
    local point, line
    if f == self.target or f == self.edge then
        point, line = Ding.Arrow.shownPoint, f == self.edge and L.PIN_EDGE or L.PIN_TARGET
    else
        point, line = f.point, Ding.Arrow.farm and L.PIN_LOOP or L.PIN_SPOT
    end
    local label = point and point.label
    return UI.Colored("accent", Ding.TITLE) .. (label and (" · " .. label) or ""), line
end

-- Hovered, a pin says what it is; the clicks go through to the minimap (motion only). A client
-- that cannot split them keeps the pin out of the mouse's way.
local function hoverable(f)
    f:EnableMouse(true)
    if not (f.SetMouseClickEnabled and pcall(f.SetMouseClickEnabled, f, false)) then
        f:EnableMouse(false)
        return
    end
    f:SetScript("OnEnter", function(self)
        local title, line = MP:Explain(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(title, 1, 1, 1, 1, true)
        GameTooltip:AddLine(line, C.cardText[1], C.cardText[2], C.cardText[3], true)
        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", function(self)
        if GameTooltip:GetOwner() == self then GameTooltip:Hide() end
    end)
end

local function pin(texture, size, color, alpha)
    local f = CreateFrame("Frame", nil, minimap())
    f:SetSize(size, size)
    f:SetFrameLevel(minimap():GetFrameLevel() + 6)
    f.tex = UI.Icon(f, texture, size, color, "OVERLAY")
    f.tex:SetPoint("CENTER", f, "CENTER", 0, 0)
    f:SetAlpha(alpha or 1)
    hoverable(f)
    f:Hide()
    return f
end

function MP:Create()
    if self.target or not minimap() then return end
    self.target = pin("ring", 14, C.accent)
    self.edge = pin("caret_up", 12, C.accent)
    self.dots = {}
    for i = 1, LOOP_DOTS do self.dots[i] = pin("circle", 6, C.accent, 0.7) end
    local driver = CreateFrame("Frame")
    driver.elapsed = 0
    driver:SetScript("OnUpdate", function(d, elapsed)
        d.elapsed = d.elapsed + elapsed
        if d.elapsed < INTERVAL then return end
        d.elapsed = 0
        Ding:Safe(MP.Update, MP)
    end)
    self.driver = driver
end

local function hideAll(self)
    self.target:Hide()
    self.edge:Hide()
    for _, d in ipairs(self.dots) do d:Hide() end
end

-- Whether the minimap shows its indoor view. IsIndoors answers for mounts, not for the
-- minimap: in Ironforge (mounts allowed) the minimap shows the city's inside view at the
-- indoor scale, and the pins sat at two thirds of their distance (in game, 14/10/2026). The
-- client keeps one zoom per view (minimapZoom outdoors, minimapInsideZoom indoors): the
-- minimap's zoom tells which view it is in when the two differ; IsIndoors only when they
-- are the same.
local function indoorView(zoom)
    local okIn, inside = pcall(GetCVar, "minimapInsideZoom")
    local okOut, outside = pcall(GetCVar, "minimapZoom")
    inside = okIn and tonumber(Compat.Plain(inside) or "") or nil
    outside = okOut and tonumber(Compat.Plain(outside) or "") or nil
    if inside and outside and inside ~= outside then
        if zoom == inside then return true end
        if zoom == outside then return false end
    end
    local ok, indoors = pcall(IsIndoors)
    return ok and Compat.Plain(indoors) and true or false
end

-- Half the yards the minimap shows: the client's own figure when it gives one
-- (C_Minimap.GetViewRadius), else from its zoom and view.
local function radiusYards()
    local CM = _G.C_Minimap
    if CM and CM.GetViewRadius then
        local ok, r = pcall(CM.GetViewRadius)
        r = ok and Compat.Plain(r) or nil
        if type(r) == "number" and r > 0 then return r end
    end
    local map = minimap()
    local ok, zoom = pcall(map.GetZoom, map)
    zoom = ok and Compat.Plain(zoom) or 0
    local sizes = indoorView(zoom) and INDOORS or OUTDOORS
    return (sizes[zoom] or sizes[0]) / 2
end

local function inInstance()
    local ok, inside = pcall(IsInInstance)
    return ok and inside and true or false
end

-- Screen offset of a point from the minimap's center, and whether it lies inside it.
local function offset(p, px, py, facing, rotate, scale, radius)
    local dx, dy = p.wx - px, p.wy - py
    local bearing = Ding.Arrow.Bearing(dx, dy)
    if rotate and facing then bearing = bearing - facing end
    local r = math.sqrt(dx * dx + dy * dy) * scale
    return -math.sin(bearing), math.cos(bearing), r, r <= radius, bearing
end

function MP:Update()
    if not self.target then return end
    local map = minimap()
    local db = Ding.db.minimap
    if not (db.pins and Ding.Panel:Visible()) or inInstance() then return hideAll(self) end
    local continent, px, py = Compat.GetPlayerWorld()
    local shown = Ding.Arrow.shownPoint
    if not continent then return hideAll(self) end
    local radius = map:GetWidth() / 2
    local scale = radius / radiusYards()
    local rotate = GetCVar("rotateMinimap") == "1"
    local facing = Compat.GetFacing()

    -- The target: on the minimap, or an arrow on its edge.
    self.target:Hide()
    self.edge:Hide()
    if shown and shown.continent == continent and shown.wx then
        local sx, sy, r, inside, bearing = offset(shown, px, py, facing, rotate, scale, radius)
        if inside then
            self.target:ClearAllPoints()
            self.target:SetPoint("CENTER", map, "CENTER", sx * r, sy * r)
            self.target:Show()
        else
            local edge = radius - EDGE_INSET
            self.edge:ClearAllPoints()
            self.edge:SetPoint("CENTER", map, "CENTER", sx * edge, sy * edge)
            self.edge.tex:SetRotation(bearing)
            self.edge:Show()
        end
    end

    -- The step's nearest spots, inside the minimap only; in a farming loop, its stops.
    local farm = Ding.Arrow.farm
    local spots, most = {}, farm and LOOP_DOTS or DOTS
    for _, p in ipairs(farm and farm.points or Ding.Engine.candidates or {}) do
        if p ~= shown and p.continent == continent and p.wx then
            spots[#spots + 1] = { p = p, d = (p.wx - px) ^ 2 + (p.wy - py) ^ 2 }
        end
    end
    table.sort(spots, function(a, b) return a.d < b.d end)
    local n = 0
    for _, s in ipairs(spots) do
        if n >= most then break end
        local sx, sy, r, inside = offset(s.p, px, py, facing, rotate, scale, radius)
        if not inside then break end
        n = n + 1
        local dot = self.dots[n]
        dot.point = s.p
        dot:ClearAllPoints()
        dot:SetPoint("CENTER", map, "CENTER", sx * r, sy * r)
        dot:Show()
    end
    for i = n + 1, LOOP_DOTS do self.dots[i]:Hide() end
end

Ding:On("PLAYER_LOGIN", function() MP:Create() end)
