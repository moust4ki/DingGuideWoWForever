-- The flight map open: when the travel engine (Core/Travel.lua) flies the player somewhere,
-- a banner says where ("Fly to Sentinel Hill") and a ring marks that node on the map. Both
-- are Ding's own frames on UIParent (UI.Banner, UI.Ring): the game's flight map is only read
-- (where its node button stands), never anchored to, shown, hidden or changed.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI

local TM = {}
Ding.TaxiMap = TM

function TM:Create()
    if self.banner then return end
    self.banner = UI.Banner("DingTaxiBanner")
    self.marker = UI.Ring("DingTaxiMarker")
end

-- TAXIMAP_OPENED (after the engine learned the map's nodes).
function TM:Show()
    self:Create()
    local leg = Ding.Travel.leg
    if not leg or leg.kind ~= "fly" then
        self:Hide()
        return
    end
    local node
    for _, n in ipairs(Ding.Travel.taxiNodes or {}) do
        if leg.flight and n.npc == leg.flight then node = n end
    end
    local name = (node and node.name) or leg.name
    self.banner.text:SetText(L.TRAVEL_FLY:format(UI.Colored("accent", name or "?")))
    self.banner:Show()
    local x, y = UI.ScreenCenter(node and _G["TaxiButton" .. node.index])
    if x then self.marker:ShowAt(x, y) else self.marker:Hide() end
end

function TM:Hide()
    if self.banner then self.banner:Hide() end
    if self.marker then self.marker:Hide() end
end
