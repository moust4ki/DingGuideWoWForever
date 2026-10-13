-- Direction arrow (screen 02 of docs/UI-handoff.md): 120 units above the screen center,
-- no background, not clickable. Under it, the target's name, then the distance and the
-- time to get there. Blue on the way, red when the target is behind, a green ring with
-- "You're here" on arrival (it fades after 3 s). Monsters to kill or things to gather
-- make an area: the player is there as soon as they are among the spawns, and the arrow
-- then leads from spawn to spawn in a loop (option, on by default). A ghost is led
-- to their corpse first. With TomTom installed (and the setting on), TomTom's arrow shows
-- the target instead: this frame keeps tracking the distance, invisible, to validate the
-- "go" steps.
local _, Ding = ...
local L = Ding.L
local Compat = Ding.Compat
local UI = Ding.UI
local C = UI.C

local A = {}
Ding.Arrow = A

local UPDATE_INTERVAL = 0.05
local ROUTE_INTERVAL = 1.0      -- re-pick the nearest candidate every second
local SIZE, MIN_SIZE, MAX_SIZE = 56, 40, 80
local LABEL_MAX = 240
local BEHIND = 2 * math.pi / 3  -- more than 120 degrees off: "turn around"
local ARRIVED_FADE = 3          -- seconds before the arrival ring fades
local RUN_SPEED = 7             -- yards per second, for the time while standing still
local MAX_SPEED = 60            -- faster is a teleport (hearthstone...), not a speed
local AREA_ENTER, AREA_LEAVE = 40, 60  -- yards from the nearest spawn: in, then out of an area
local CORPSE_RADIUS = 30        -- close enough to the corpse to come back to life
local TARGET_NAMES = 3          -- names in the target binding's macro, nearest first
-- Farming loop, in a kill or gather area: the spawns around the nearest one, in a loop.
local LOOP_RADIUS = 300         -- yards around the nearest spawn that make one loop
local LOOP_MERGE = 25           -- spawns closer than this are one stop
local LOOP_REACH = 15           -- yards: the stop is reached, on to the next one
local LOOP_MIN, LOOP_MAX = 3, 12 -- stops: fewer, no loop (the plain area); at most
-- Arrow textures, pointing up: the design's, or the game's minimap arrow.
A.TEXTURES = {
    ding = UI.TEX .. "arrow",
    classic = "Interface\\Minimap\\MinimapArrow",
}

local atan2, sqrt, pi = math.atan2, math.sqrt, math.pi

-- WoW world axes: one axis points north, the other west; facing is counter-clockwise
-- from north. If the arrow points the wrong way in game, /ding arrowflip cycles these
-- four conventions until it is right (saved in DingDB.arrow.mode).
local MODES = {
    [0] = function(dx, dy) return atan2(dy, dx) end,
    [1] = function(dx, dy) return atan2(dx, dy) end,
    [2] = function(dx, dy) return atan2(-dy, dx) end,
    [3] = function(dx, dy) return atan2(-dx, dy) end,
}

-- Direction of a world offset, counter-clockwise from north, with the saved convention
-- (also used by the minimap pins).
function A.Bearing(dx, dy)
    return (MODES[Ding.db.arrow.mode or 0] or MODES[0])(dx, dy)
end

local function clampSize(size)
    return math.max(MIN_SIZE, math.min(MAX_SIZE, math.floor((tonumber(size) or SIZE) + 0.5)))
end

function A:ApplyPosition()
    local f, db = self.frame, Ding.db.arrow
    f:ClearAllPoints()
    f:SetPoint(db.point, UIParent, db.point, db.x, db.y)
end

-- Arrow, its shadow, the arrival ring and check, all following the size setting.
function A:ApplySize()
    local f = self.frame
    local size = clampSize(Ding.db.arrow.size)
    Ding.db.arrow.size = size
    local k = size / SIZE
    f:SetSize(size, size)
    f.arrow:SetSize(size, size)
    f.shadow:SetSize(size, size)
    f.ring:SetSize(48 * k, 48 * k)
    f.check:SetSize(22 * k, 22 * k)
end

function A:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingArrowFrame", UIParent)
    f:SetFrameStrata("MEDIUM")
    f:SetClampedToScreen(true)
    f:EnableMouse(false)

    f.shadow = f:CreateTexture(nil, "ARTWORK", nil, 0)
    f.shadow:SetPoint("CENTER", f, "CENTER", 0, -1)
    f.shadow:SetVertexColor(unpack(C.textShadow))
    f.arrow = f:CreateTexture(nil, "ARTWORK", nil, 1)
    f.arrow:SetPoint("CENTER", f, "CENTER", 0, 0)
    f.ring = UI.Icon(f, "ring", 48, C.done, "ARTWORK", 2)
    f.ring:SetPoint("CENTER", f, "CENTER", 0, 0)
    f.check = UI.Icon(f, "icon_check_large", 22, C.done, "ARTWORK", 3)
    f.check:SetPoint("CENTER", f, "CENTER", 0, 0)

    -- Label: the target's name, then "119 yd · 0:08".
    f.label = UI.Text(f, "semibold", 13, C.text, "OVERLAY")
    f.label:SetJustifyH("CENTER")
    f.label:SetPoint("TOP", f, "BOTTOM", 0, -8)
    UI.Shadow(f.label)
    f.line = CreateFrame("Frame", nil, f)
    f.line:SetHeight(20)
    f.line:SetPoint("TOP", f.label, "BOTTOM", 0, -2)
    f.distance = UI.Text(f.line, "semibold", 16, C.text, "OVERLAY")
    f.distance:SetPoint("LEFT", f.line, "LEFT", 0, 0)
    UI.Shadow(f.distance)
    f.eta = UI.Text(f.line, "regular", 12, C.glyph, "OVERLAY")
    f.eta:SetPoint("LEFT", f.distance, "RIGHT", 0, -1)
    UI.Shadow(f.eta)
    -- "Target: name" with the glyph of the target binding (UI/ItemButton.lua), when bound.
    f.target = CreateFrame("Frame", nil, f)
    f.target:SetHeight(18)
    f.target:SetPoint("TOP", f.line, "BOTTOM", 0, -2)
    f.target.glyph = UI.Glyph(f.target)
    f.target.glyph:SetPoint("LEFT", f.target, "LEFT", 0, 0)
    f.target.text = UI.Text(f.target, "regular", 11, C.secondary, "OVERLAY")
    f.target.text:SetPoint("LEFT", f.target.glyph, "RIGHT", 4, 0)
    UI.Shadow(f.target.text)
    f.target:Hide()

    self.frame = f
    self:ApplySize()
    self:ApplyStyle()
    self:ApplyPosition()
    self:SetState("route")
    f:Hide()

    -- The loop runs on its own frame: it must keep validating "go" steps while the
    -- arrow is hidden or replaced by TomTom's.
    local driver = CreateFrame("Frame")
    driver.elapsed, driver.routeElapsed = 0, ROUTE_INTERVAL
    driver:SetScript("OnUpdate", function(d, elapsed)
        d.elapsed = d.elapsed + elapsed
        d.routeElapsed = d.routeElapsed + elapsed
        if d.elapsed < UPDATE_INTERVAL then return end
        d.elapsed = 0
        if d.routeElapsed >= ROUTE_INTERVAL then
            d.routeElapsed = 0
            A.point = nil -- force a nearest-point refresh
        end
        Ding:Safe(A.Tick, A)
    end)
    self.driver = driver
    self:Update()
end

function A:ApplyStyle()
    local f = self.frame
    if not f then return end
    local path = self.TEXTURES[Ding.db.arrow.style] or self.TEXTURES.ding
    f.arrow:SetTexture(path)
    f.shadow:SetTexture(path)
end

function A:SetStyle(style)
    Ding.db.arrow.style = self.TEXTURES[style] and style or "ding"
    self:ApplyStyle()
end

function A:SetSize(size)
    Ding.db.arrow.size = clampSize(size)
    if self.frame then self:ApplySize() end
end

-- Ding's arrow and label are hidden while TomTom shows the target.
function A:SetDelegated(delegated)
    local f = self.frame
    if delegated == self.delegated then return end
    self.delegated = delegated
    for _, region in ipairs({ f.label, f.line }) do region:SetShown(not delegated) end
    if delegated then f.target:Hide() end
    if delegated then
        f.arrow:Hide()
        f.shadow:Hide()
        f.ring:Hide()
        f.check:Hide()
    else
        self:SetState(self.state or "route", true)
    end
end

function A:SetTomTom(enabled)
    Ding.db.arrow.tomtom = enabled and true or false
    if not enabled then Ding.TomTom:Clear() end
    self:Update()
end

-- "route" (blue arrow), "behind" (red arrow) or "arrived" (green ring and check).
function A:SetState(state, force)
    local f = self.frame
    if state == self.state and not force then return end
    self.state = state
    local arrived = state == "arrived"
    f.ring:SetShown(arrived)
    f.check:SetShown(arrived)
    f.arrow:SetShown(not arrived)
    f.shadow:SetShown(not arrived)
    f.arrow:SetVertexColor(unpack(state == "behind" and C.todo or C.accent))
    f.distance:SetTextColor(unpack(arrived and C.done or C.text))
    if arrived then
        self.arrivedAt = GetTime()
    else
        self.arrivedAt, self.arrivedFaded = nil, false
    end
end

-- The row the player clicked (or chose with A) in the guide window: the arrow points to
-- these points until the step changes.
function A:Focus(points)
    local E = Ding.Engine
    self.forced = { points = points, guide = E.guide, index = E.index }
    self.point, self.farm = nil, nil
    self:Update()
end

-- Back to the nearest of the step's targets.
function A:Unfocus()
    self.forced, self.point, self.farm = nil, nil, nil
    self:Update()
end

-- New candidates from the engine (or the player died, released, came back to life).
-- The arrow goes with the guide window: closing the window hides both (Yendi), showing it
-- again (minimap button, binding, /ding, settings) brings both back, and "hide in dungeons"
-- hides both there (no position in a dungeon: the arrow would only show its target and "?").
local function visible()
    return Ding.db.arrow.shown and Ding.Panel:Visible()
end

function A:Update()
    if not self.frame then return end
    local E, forced = Ding.Engine, self.forced
    if forced and (forced.guide ~= E.guide or forced.index ~= E.index or E.finished) then self.forced = nil end
    -- A new step starts outside of any area.
    local step = E:CurrentStep()
    if step ~= self.lastStep then self.inArea, self.lastStep = false, step end
    self.point = nil
    local hasPoints = Compat.IsGhost() or (self.forced ~= nil) or (E.candidates and #E.candidates > 0)
    if visible() and hasPoints and not self.arrivedFaded then
        UI.FadeIn(self.frame, 0.2)
    else
        if not (visible() and hasPoints) then Ding.TomTom:Clear() end
        if not self.moving then UI.FadeOut(self.frame, 0.2) end
    end
    self:Tick()
end

-- The player's speed, measured from their positions (the client keeps GetUnitSpeed
-- secret from addons): yards per second, smoothed over the last moves.
local speed = {}
local function trackSpeed(px, py)
    local now = GetTime()
    if not speed.t then
        speed.x, speed.y, speed.t = px, py, now
        return
    end
    local dt = now - speed.t
    if dt < 0.25 then return end
    local moved = sqrt((px - speed.x) ^ 2 + (py - speed.y) ^ 2) / dt
    if moved <= MAX_SPEED then
        speed.value = speed.value and (speed.value * 0.6 + moved * 0.4) or moved
    end
    speed.x, speed.y, speed.t = px, py, now
end

-- Distance in yards (nil when the position is unknown) and the arrow's rotation
-- (nil without a facing, e.g. in instances).
local function measure(point)
    local continent, px, py = Compat.GetPlayerWorld()
    if not continent or not point.wx then return nil end
    trackSpeed(px, py)
    local dx, dy = point.wx - px, point.wy - py
    local facing = Compat.GetFacing()
    local rotation
    if facing then
        local bearing = (MODES[Ding.db.arrow.mode or 0] or MODES[0])(dx, dy)
        rotation = (bearing - facing) % (2 * pi)
    end
    return sqrt(dx * dx + dy * dy), rotation
end

-- "0:08": time to cover `distance` at the measured speed (running speed when standing).
local function eta(distance)
    local v = (speed.value and speed.value > 1) and speed.value or RUN_SPEED
    local seconds = math.floor(distance / v + 0.5)
    if seconds >= 6000 then return nil end
    return ("%d:%02d"):format(math.floor(seconds / 60), seconds % 60)
end

local function layoutLine(f)
    f.line:SetWidth(math.max(1, f.distance:GetStringWidth() + (f.eta:IsShown() and f.eta:GetStringWidth() or 0)))
end

---------------------------------------------------------------------------
-- Farming loop
---------------------------------------------------------------------------
local function world(p)
    if p.continent == nil then
        local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
        p.continent, p.wx, p.wy = c or false, wx, wy
    end
    return p.continent, p.wx, p.wy
end

local function yards(a, b)
    return sqrt((a.wx - b.wx) ^ 2 + (a.wy - b.wy) ^ 2)
end

-- The stops of a loop around `anchor` (the nearest spawn): the spawns of the same monster or
-- object within LOOP_RADIUS, one stop per LOOP_MERGE yards, nearest neighbour after nearest
-- neighbour from the anchor. Nil with fewer than LOOP_MIN stops.
local function buildLoop(anchor, points)
    world(anchor)
    if not anchor.wx then return nil end
    local near = {}
    for _, p in ipairs(points) do
        local c = world(p)
        if p.area and not p.low and p.label == anchor.label and c == anchor.continent and p.wx then
            local d = yards(p, anchor)
            if d <= LOOP_RADIUS then near[#near + 1] = { p = p, d = d } end
        end
    end
    table.sort(near, function(a, b) return a.d < b.d end)
    local stops = {}
    for _, n in ipairs(near) do
        local merged = false
        for _, s in ipairs(stops) do
            if yards(n.p, s) < LOOP_MERGE then merged = true end
        end
        if not merged and #stops < LOOP_MAX then stops[#stops + 1] = n.p end
    end
    if #stops < LOOP_MIN then return nil end
    local order, current = {}, anchor
    while #stops > 0 do
        local best, bestD
        for i, s in ipairs(stops) do
            local d = yards(current, s)
            if not bestD or d < bestD then best, bestD = i, d end
        end
        current = table.remove(stops, best)
        order[#order + 1] = current
    end
    local E = Ding.Engine
    return { points = order, at = 1, label = anchor.label, center = anchor, guide = E.guide, index = E.index }
end

-- The loop's stop to go to now (the next one once the player reaches it), or nil: no loop
-- here (option off, too few spawns). The loop stays while the nearest spawn is of the same
-- monster, near its center, on the same step.
function A:FarmStop(anchor)
    if Ding.db.arrow.loop == false then
        self.farm = nil
        return nil
    end
    local E, loop = Ding.Engine, self.farm
    world(anchor)
    if not loop or loop.label ~= anchor.label or loop.guide ~= E.guide or loop.index ~= E.index
        or not anchor.wx or yards(anchor, loop.center) > LOOP_RADIUS then
        loop = buildLoop(anchor, (self.forced and self.forced.points) or E.candidates or {})
        self.farm = loop
        if not loop then return nil end
    end
    local continent, px, py = Compat.GetPlayerWorld()
    local stop = loop.points[loop.at]
    if continent and stop.wx and (stop.wx - px) ^ 2 + (stop.wy - py) ^ 2 <= LOOP_REACH * LOOP_REACH then
        loop.at = loop.at % #loop.points + 1
    end
    return loop
end

---------------------------------------------------------------------------
-- The target on the world map
---------------------------------------------------------------------------
-- "Mark the target on the world map" (Arrow tab, on): the client's own map waypoint when it
-- has one (C_Map.SetUserWaypoint, super-tracked), else a TomTom pin when TomTom is there
-- (and does not show the target already), else nothing: the minimap pin stays. Ding only
-- moves or clears the waypoint it set itself; one the player set is left alone.
local WAYPOINT_SLACK = 0.1      -- 0-100 map units: the client rounds a waypoint's position

local function same(a, b)
    return a and b and a.map == b.map and math.abs(a.x - b.x) < WAYPOINT_SLACK and math.abs(a.y - b.y) < WAYPOINT_SLACK
end

function A:MarkWorld(point)
    local on = Ding.db.arrow.worldMap ~= false and visible()
    local want = on and point and type(point.map) == "number" and point or nil
    local key = want and ("%d:%.2f:%.2f"):format(want.map, want.x, want.y) or nil
    if key == self.worldKey then return end
    self.worldKey = key
    -- Ding's last waypoint, kept per character: after a reload it is still Ding's.
    local mine = self.worldMark or (Ding.char.worldMark and { via = "client", map = Ding.char.worldMark.map,
        x = Ding.char.worldMark.x, y = Ding.char.worldMark.y })
    self.worldMark, Ding.char.worldMark = nil, nil
    if mine and mine.via == "tomtom" then Ding.TomTom:ClearWorld() end
    local map, x, y = Compat.UserWaypoint()
    local current = map and { map = map, x = x, y = y } or nil
    if mine and mine.via == "client" and current and not same(current, mine) then
        -- The player set a waypoint of their own since: theirs stays.
        return
    end
    if not want then
        if mine and mine.via == "client" and current then Compat.ClearUserWaypoint() end
        return
    end
    if current and not (mine and mine.via == "client") then return end    -- the player's own
    if Compat.SetUserWaypoint(want.map, want.x, want.y) then
        self.worldMark = { via = "client", map = want.map, x = want.x, y = want.y }
        Ding.char.worldMark = { map = want.map, x = want.x, y = want.y }
    elseif not Ding.TomTom:Active() and Ding.TomTom:MarkWorld(want) then
        self.worldMark = { via = "tomtom" }
    end
end

-- What the arrow points to: the corpse of a ghost, else the row the player chose, else
-- the nearest candidate of the step.
local function target(self)
    -- A death skip that names its spirit healer (`revive = { map, x, y }`): there, not the
    -- corpse.
    if Compat.IsGhost() then
        local step = Ding.Engine:CurrentStep()
        local revive = step and step.deathskip and type(step.revive) == "table" and step.revive
        if revive and revive[1] and revive[2] and revive[3] then
            return Ding.Engine:NearestPoint({ { map = revive[1], x = revive[2], y = revive[3], label = L.SPIRIT_HEALER,
                corpse = true } })
        end
    end
    local corpse = Compat.IsGhost() and Compat.CorpsePoint()
    if corpse then
        corpse.label, corpse.corpse = L.CORPSE, true
        return Ding.Engine:NearestPoint({ corpse })
    end
    -- A trip to a service the player chose (UI/Finder.lua), until that NPC's window opens.
    local trip = Ding.Finder and Ding.Finder.trip
    if trip then return Ding.Engine:NearestPoint({ trip.point }) end
    return Ding.Engine:NearestPoint(self.forced and self.forced.points)
end

function A:Tick()
    local f = self.frame
    if not self.point then
        local point, _, otherContinent = target(self)
        self.point, self.otherContinent = point, otherContinent
    end
    local point = self.point
    self:MarkWorld(point)
    if not point then
        Ding.TomTom:Clear()
        Ding.ItemButton:SetTarget(nil)
        f.target:Hide()
        self.shownPoint = nil
        if not self.moving then UI.FadeOut(f, 0.2) end
        if self.hint then
            self.hint, Ding.Travel.leg = nil, nil
            if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
        end
        return
    end
    self.targetName = point.label

    -- Arrival is checked even when the arrow is hidden or TomTom draws it.
    local distance, rotation
    if not self.otherContinent then
        distance, rotation = measure(point)
        if distance then
            Ding.Engine:OnPosition(distance, point)
            if self.point ~= point then return end -- the step advanced and the arrow was refreshed
        end
    end

    -- Faster than walking (Core/Travel.lua): the arrow goes to the flight master or the dock
    -- first, and says what to take; for the hearthstone it keeps the target and says so.
    local leg = not point.corpse and Ding.Travel:Leg(point) or nil
    local hint = leg and leg.hint
    if hint ~= self.hint then
        self.hint = hint
        if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
        if Ding.ItemButton and Ding.ItemButton.Update then Ding:Safe(Ding.ItemButton.Update, Ding.ItemButton) end
    end
    local otherContinent = self.otherContinent
    if leg and leg.point then
        point = leg.point
        distance, rotation = measure(point)
        otherContinent = distance == nil and point.continent ~= nil
    end

    -- Among the spawns of a kill or gather area: from stop to stop of a loop.
    local farm
    if point.area and not point.corpse and not (leg and leg.point) and distance
        and distance <= (self.inArea and AREA_LEAVE or AREA_ENTER) then
        farm = self:FarmStop(point)
    elseif not point.corpse then
        self.farm = nil
    end
    local areaName = point.label
    if farm then
        self.inArea = true
        point = farm.points[farm.at]
        distance, rotation = measure(point)
    end

    self.shownPoint = point    -- what the arrow shows (the minimap pins follow it)
    -- The target binding aims at what the arrow shows, when it is an NPC or a monster, then
    -- at the step's other NPCs and monsters, nearest first (looked up once a second). On the
    -- way to a flight master or a dock, or on a trip to a service, only that NPC.
    local targetName = point.npc and point.label or nil
    local names = { targetName }
    if not (leg and leg.point) and not (Ding.Finder and Ding.Finder.trip) then
        local now = GetTime()
        if self.targetsFor ~= self.point or now >= (self.targetsAt or 0) then
            self.targetsFor, self.targetsAt = self.point, now + 1
            self.stepTargets = Ding.Engine:TargetNames(TARGET_NAMES)
        end
        for _, name in ipairs(self.stepTargets or {}) do
            if #names < TARGET_NAMES and name ~= targetName then names[#names + 1] = name end
        end
    end
    targetName = names[1]
    Ding.ItemButton:SetTarget(names)

    local shown = visible()
    local delegated = shown and Ding.TomTom:Active() and Ding.TomTom:Show(point)
    if not delegated then Ding.TomTom:Clear() end
    self:SetDelegated(delegated and true or false)
    if not shown or self.delegated then return end

    f.label:SetText(hint or (farm and L.FARM_LOOP:format(areaName or "", farm.at, #farm.points)) or point.label or "")
    f.label:SetWidth(math.min(LABEL_MAX, math.max(1, UI.Measure(f.label))))
    local key = targetName and Ding.Gamepad:BindingKey(Ding.ItemButton.TARGET_BINDING)
    if key then
        f.target.glyph:SetKey(key)
        f.target.text:SetText(L.TARGET_LINE:format(targetName))
        f.target:SetWidth(f.target.glyph:GetWidth() + 4 + UI.Measure(f.target.text))
        f.target:Show()
    else
        f.target:Hide()
    end
    if otherContinent or not distance then
        self:SetState("route")
        f.arrow:Hide()
        f.shadow:Hide()
        local zone = Ding.Engine:ZoneLabel(point)
        f.distance:SetText((otherContinent and L.ANOTHER_CONTINENT or "?") .. (zone and (" · " .. zone) or ""))
        f.eta:Hide()
        layoutLine(f)
        return
    end

    local radius = (Ding.Engine:CurrentStep() or {}).radius or 10
    if leg and leg.point then
        radius = 10
    elseif point.corpse then
        radius = CORPSE_RADIUS
    elseif farm then
        radius = -1    -- the loop never arrives: the next stop follows
    elseif point.area then
        -- In the area until the player walks well out of it: no flicker at its edge.
        radius = self.inArea and AREA_LEAVE or AREA_ENTER
    end
    if distance <= radius then
        self.inArea = point.area and not point.corpse or false
        self:SetState("arrived")
        f.distance:SetText(self.inArea and L.IN_AREA or L.ARRIVED)
        f.eta:Hide()
        -- The ring stays 3 s, then the arrow fades until the player moves away.
        if not self.arrivedFaded and GetTime() - (self.arrivedAt or 0) >= ARRIVED_FADE then
            self.arrivedFaded = true
            UI.FadeOut(f, 0.3)
        end
    else
        if not point.corpse and not farm then self.inArea = false end
        local wasFaded = self.arrivedFaded
        local off = rotation and math.abs(((rotation + pi) % (2 * pi)) - pi)
        local behind = off and off > BEHIND
        self:SetState(behind and "behind" or "route")
        if wasFaded then UI.FadeIn(f, 0.2) end
        -- Far away in another zone: its name next to the distance.
        local zone = Ding.Engine:ZoneLabel(point)
        f.distance:SetText(L.YARDS:format(distance) .. (zone and (" · " .. zone) or ""))
        local time = not behind and eta(distance)
        f.eta:SetText(behind and (" · " .. L.TURN_AROUND) or (time and (" · " .. time) or ""))
        f.eta:Show()
    end
    layoutLine(f)

    if rotation and self.state ~= "arrived" then
        self.rotation = rotation
        f.arrow:SetRotation(rotation)
        f.shadow:SetRotation(rotation)
        f.arrow:Show()
        f.shadow:Show()
    elseif self.state ~= "arrived" then
        f.arrow:Hide()
        f.shadow:Hide()
    end
end

function A:Toggle()
    Ding.db.arrow.shown = not Ding.db.arrow.shown
    self:Update()
end

function A:SetMode(mode)
    Ding.db.arrow.mode = mode % 4
    self.point = nil
end

-- /ding arrowflip: next orientation convention; returns the new mode (0-3).
function A:CycleMode()
    self:SetMode((Ding.db.arrow.mode or 0) + 1)
    return Ding.db.arrow.mode
end

function A:ResetPosition()
    local db, default = Ding.db.arrow, Ding.DEFAULTS.arrow
    db.point, db.x, db.y = default.point, default.x, default.y
    if self.frame then self:ApplyPosition() end
end

-- Target for the gamepad move mode (Ding.Gamepad:StartMove). While it runs the arrow is
-- shown even without a target, so the player sees what moves.
function A:MoveTarget()
    local db, f = Ding.db.arrow, self.frame
    local function save()
        local point, _, _, x, y = f:GetPoint()
        db.point, db.x, db.y = point, x, y
    end
    return {
        frame = f,
        title = L.MOVE_TITLE_ARROW,
        get = function() return db.x, db.y end,
        set = function(x, y)
            db.x, db.y = x, y
            A:ApplyPosition()
        end,
        save = function() end,
        dragged = save,
        reset = function() A:ResetPosition() end,
        start = function()
            A.moving = true
            f:Show()
            f:SetAlpha(1)
        end,
        stop = function()
            A.moving = false
            A:Update()
        end,
    }
end

-- Death: the arrow leads the ghost to the corpse, then back to the guide.
for _, event in ipairs({ "PLAYER_DEAD", "PLAYER_ALIVE", "PLAYER_UNGHOST" }) do
    Ding:On(event, function() A:Update() end)
end
