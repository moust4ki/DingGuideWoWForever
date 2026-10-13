-- Gear upgrades in the bags: each item the player can wear is scored for the class like the
-- quest rewards (Core/Rewards.lua) against what it would replace. A clear upgrade shows a
-- banner, a row "Equip …" under the step, and the item button offers it (using a piece of
-- gear from the bags equips it; out of combat, like every change of the secure button). A
-- declined item is remembered. Auto-equip is an option, off by default. Never an item a quest
-- of the log needs, nor in place of one.
local _, Ding = ...
local L = Ding.L
local Compat = Ding.Compat

local GR = {}
Ding.Gear = GR

GR.MIN_GAIN = 1                  -- a clear upgrade: one point of class score at least
local BANNER_TIME = 6            -- seconds the banner stays

-- What each class can wear (Classic): armor by subclass (0 misc, 1 cloth, 2 leather, 3 mail,
-- 4 plate, 6 shield; mail and plate from level 40 for some), weapons by subclass (0 one-hand
-- axe, 1 two-hand axe, 2 bow, 3 gun, 4 one-hand mace, 5 two-hand mace, 6 polearm, 7 one-hand
-- sword, 8 two-hand sword, 10 staff, 13 fist, 15 dagger, 16 thrown, 18 crossbow, 19 wand).
local ARMOR = {
    WARRIOR = { [2] = 1, [3] = 1, [4] = 40, [6] = 1 }, PALADIN = { [2] = 1, [3] = 1, [4] = 40, [6] = 1 },
    HUNTER = { [2] = 1, [3] = 40 }, SHAMAN = { [2] = 1, [3] = 40, [6] = 1 }, ROGUE = { [2] = 1 },
    DRUID = { [2] = 1 }, PRIEST = {}, MAGE = {}, WARLOCK = {},
}
local WEAPONS = {
    WARRIOR = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 13, 15, 16, 18 }, PALADIN = { 0, 1, 4, 5, 6, 7, 8 },
    HUNTER = { 0, 1, 2, 3, 6, 7, 8, 10, 13, 15, 16, 18 }, ROGUE = { 2, 3, 4, 7, 13, 15, 16, 18 },
    PRIEST = { 4, 10, 15, 19 }, SHAMAN = { 0, 1, 4, 5, 10, 13, 15 }, MAGE = { 7, 10, 15, 19 },
    WARLOCK = { 7, 10, 15, 19 }, DRUID = { 4, 5, 10, 13, 15 },
}
GR.WEAPONS = WEAPONS               -- the NPC directory's weapons to learn (Core/Directory.lua)
local ARMOR_CLASS, WEAPON_CLASS = 4, 2

-- The player's class can wear the item at their level.
function GR:CanWear(item, info)
    if info.minLevel and info.minLevel > UnitLevel("player") then return false end
    local classID, subclassID = Compat.ItemClass(item)
    local class = Compat.PlayerClass()
    if classID == ARMOR_CLASS then
        if subclassID == 0 or subclassID == 1 then return true end
        local from = (ARMOR[class] or {})[subclassID]
        return from ~= nil and UnitLevel("player") >= from
    elseif classID == WEAPON_CLASS then
        for _, s in ipairs(WEAPONS[class] or {}) do
            if s == subclassID then return true end
        end
        return false
    end
    return classID == nil    -- unknown: let the score decide
end

-- Items quests of the log need (objectives, items handed out): never equipped, never replaced.
local function questItems()
    local set = {}
    for _, q in ipairs(Ding.Engine:LogQuests()) do
        for _, id in ipairs(Ding.Data:ObjectiveItems(q)) do set[id] = true end
        local source = Ding.Data:QuestSourceItem(q)
        if source then set[source] = true end
    end
    return set
end

local function declined()
    Ding.char.gearDeclined = Ding.char.gearDeclined or {}
    return Ding.char.gearDeclined
end

-- The best upgrade in the bags: { bag, slot, id, link, gain, equipLoc, equipSlot } or nil.
function GR:Scan()
    local best
    local needed, no = questItems(), declined()
    for _, bag in ipairs(Compat.BAGS) do
        for slot = 1, Compat.BagSize(bag) do
            local item = Compat.BagItem(bag, slot)
            local info = item and item.id and not no[item.id] and not needed[item.id] and item.link
                and Compat.ItemInfo(item.link)
            if info and Ding.Rewards.SLOTS[info.equipLoc] and self:CanWear(item.link, info) then
                local gain, equipSlot = Ding.Rewards:Gain(item.link, info.equipLoc)
                local worn = equipSlot and Compat.EquippedID(equipSlot)
                if gain and gain >= self.MIN_GAIN and not (worn and needed[worn])
                    and (not best or gain > best.gain) then
                    best = { bag = bag, slot = slot, id = item.id, link = item.link, gain = gain,
                        equipLoc = info.equipLoc, equipSlot = equipSlot }
                end
            end
        end
    end
    return best
end

-- Looks at the bags again; a new upgrade is announced (banner) and, with the option, worn.
function GR:Update()
    local before = self.upgrade
    self.upgrade = self:Scan()
    local up = self.upgrade
    if up and (not before or before.id ~= up.id) then
        if Ding.GearHint then Ding:Safe(Ding.GearHint.Show, Ding.GearHint, up, BANNER_TIME) end
        self:AutoEquip()
    end
    if (before and before.id) ~= (up and up.id) then
        if Ding.ItemButton and Ding.ItemButton.ScheduleUpdate then Ding.ItemButton.ScheduleUpdate() end
        if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
    end
end

-- "Auto-equip upgrades" (off by default): out of combat, only an item already bound to the
-- player (equipping one that binds when worn asks the game's confirmation).
function GR:AutoEquip()
    local up = self.upgrade
    local ui = Ding.db and Ding.db.ui
    if not (up and ui and ui.autoEquip) or InCombatLockdown() then return end
    if Compat.BagItemBound(up.bag, up.slot) ~= true then return end
    if Compat.EquipItem(up.link) then Ding:Print(L.GEAR_EQUIPPED:format(up.link)) end
end

-- The player does not want this one: remembered, never offered again.
function GR:Decline()
    local up = self.upgrade
    if not up then return end
    declined()[up.id] = true
    if Ding.GearHint then Ding:Safe(Ding.GearHint.Hide, Ding.GearHint) end
    self:Update()
end

local pending = false
local function schedule()
    if pending then return end
    pending = true
    C_Timer.After(1, function()
        pending = false
        Ding:Safe(GR.Update, GR)
    end)
end
GR.Schedule = schedule
Ding:On("BAG_UPDATE", schedule)
Ding:On("PLAYER_EQUIPMENT_CHANGED", schedule)
Ding:On("PLAYER_LEVEL_UP", schedule)
Ding:On("PLAYER_REGEN_ENABLED", function() GR:AutoEquip() end)
