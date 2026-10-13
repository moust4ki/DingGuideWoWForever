-- Minimap button: a round Ding button on the edge of the minimap. Left click opens the
-- settings, right click shows or hides the guide window, dragging slides it around the
-- minimap (angle saved in Ding.db.minimap). Hidden from the Appearance tab. Gamepad
-- players open the settings with the "Open Ding settings" binding instead.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C

local M = {}
Ding.Minimap = M

local SIZE = 32
local OUTSIDE = 10   -- distance from the minimap's edge to the button's center

local function minimap() return _G.Minimap end

-- Center of the button for an angle (degrees, 0 = east, counter-clockwise).
function M:Place()
    local b, map = self.button, minimap()
    local angle = math.rad(Ding.db.minimap.angle or 200)
    local radius = map:GetWidth() / 2 + OUTSIDE
    b:ClearAllPoints()
    b:SetPoint("CENTER", map, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

-- While dragging: the angle from the minimap's center to the cursor.
local function follow()
    local map = minimap()
    local cx, cy = map:GetCenter()
    if not cx then return end
    local scale = map:GetEffectiveScale()
    local x, y = GetCursorPosition()
    Ding.db.minimap.angle = math.deg(math.atan2(y / scale - cy, x / scale - cx)) % 360
    M:Place()
end

local function showTooltip(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText(Ding.TITLE)
    GameTooltip:AddLine(L.MINIMAP_LEFT, 0.8, 0.8, 0.8)
    GameTooltip:AddLine(L.MINIMAP_RIGHT, 0.8, 0.8, 0.8)
    GameTooltip:AddLine(L.MINIMAP_DRAG, 0.8, 0.8, 0.8)
    GameTooltip:Show()
end

function M:Create()
    if self.button or not minimap() then return end
    local b = CreateFrame("Button", "DingMinimapButton", minimap())
    b:SetSize(SIZE, SIZE)
    b:SetFrameStrata("MEDIUM")
    b:SetFrameLevel(minimap():GetFrameLevel() + 8)
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    b:RegisterForDrag("LeftButton")

    -- Ding's icon (disc, arrow and spark, drawn in Media/Textures/icon.tga) on a soft shadow.
    b.shadow = UI.Icon(b, "circle", SIZE + 2, { 0, 0, 0, 0.35 }, "BACKGROUND", 0)
    b.shadow:SetPoint("CENTER", b, "CENTER", 0, -1)
    b.icon = UI.Icon(b, "icon", SIZE, { 1, 1, 1, 1 }, "ARTWORK")
    b.icon:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.hover = UI.Icon(b, "circle", SIZE - 6, C.hover, "HIGHLIGHT")
    b.hover:SetPoint("CENTER", b, "CENTER", 0, 0)

    b:SetScript("OnClick", function(_, button)
        if button == "RightButton" then Ding.Panel:Toggle() else Ding.Config:Toggle() end
    end)
    b:SetScript("OnEnter", showTooltip)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:SetScript("OnDragStart", function(self)
        GameTooltip:Hide()
        self:SetScript("OnUpdate", follow)
    end)
    b:SetScript("OnDragStop", function(self) self:SetScript("OnUpdate", nil) end)

    self.button = b
    self:Update()
end

function M:Update()
    if not self.button then return end
    self:Place()
    self.button:SetShown(Ding.db.minimap.shown and true or false)
end
