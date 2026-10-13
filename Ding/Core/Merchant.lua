-- At a merchant: sells the grey items of the bags and repairs everything (two options, on by
-- default), then says it in one chat line. Holding Shift (LT on a gamepad) leaves it all to
-- the player. The window warns when the bags are almost full.
local _, Ding = ...
local L = Ding.L
local Compat = Ding.Compat

local M = {}
Ding.Merchant = M

local POOR = 0            -- item quality of the grey items
M.ALMOST_FULL = 4         -- free bag slots from which the window warns

-- Grey items of the bags, sold one by one: { count, value } of what went.
function M:SellGreys()
    local count, value = 0, 0
    for _, bag in ipairs(Compat.BAGS) do
        for slot = 1, Compat.BagSize(bag) do
            local item = Compat.BagItem(bag, slot)
            -- A grey item a step said to keep (Core/Goals.lua) stays.
            if item and item.quality == POOR and not item.noValue and not Ding.Goals:Keep(item.id) then
                local info = item.link and Compat.ItemInfo(item.link)
                local price = info and info.sellPrice or 0
                if price > 0 and Compat.UseBagItem(bag, slot) then
                    count = count + (item.count or 1)
                    value = value + price * (item.count or 1)
                end
            end
        end
    end
    return count, value
end

-- Repairs everything when the merchant can and the player has the money: its cost, or 0.
function M:Repair()
    local cost = Compat.RepairCost()
    if cost <= 0 or Compat.Money() < cost then return 0 end
    if not Compat.Call("RepairAllItems") then return 0 end
    return cost
end

function M:OnShow()
    local ui = Ding.db and Ding.db.ui
    if not ui or IsShiftKeyDown() then return end
    local sold, value = 0, 0
    if ui.sellGrey then sold, value = self:SellGreys() end
    local repaired = ui.repair and self:Repair() or 0
    if sold == 0 and repaired == 0 then return end
    local parts = {}
    if sold > 0 then parts[#parts + 1] = L.MERCHANT_SOLD:format(sold, Compat.MoneyText(value)) end
    if repaired > 0 then parts[#parts + 1] = L.MERCHANT_REPAIRED:format(Compat.MoneyText(repaired)) end
    parts[#parts + 1] = L.BAG_FREE:format(Compat.FreeBagSlots())
    Ding:Print(table.concat(parts, " · "))
end

-- Free bag slots when they run low, else nil (Panel: a warning under the step).
function M:BagWarning()
    local free = Compat.FreeBagSlots()
    if free <= self.ALMOST_FULL then return free end
    return nil
end

Ding:On("MERCHANT_SHOW", function() M:OnShow() end)

-- The warning follows the bags (their events come in bursts).
local pending = false
Ding:On("BAG_UPDATE", function()
    if pending then return end
    pending = true
    C_Timer.After(0.5, function()
        pending = false
        local warn = M:BagWarning()
        if warn ~= M.shownWarning and Ding.Panel and Ding.Panel.Update then
            M.shownWarning = warn
            Ding:Safe(Ding.Panel.Update, Ding.Panel)
        end
    end)
end)
