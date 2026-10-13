-- Quest rewards to choose from: the best upgrade for the player's class (its stats weighted
-- for the class, against what is equipped in that slot), else the item that sells for the
-- most. Ding takes it only with the "Choose quest rewards" option (and automatic turn-in);
-- otherwise it points it out (UI/Rewards.lua). Holding Shift (LT on a gamepad) leaves the
-- choice to the player, like the rest of the automation.
local _, Ding = ...
local Compat = Ding.Compat

local R = {}
Ding.Rewards = R

local MIN_GAIN = 0.5      -- below, not worth calling an upgrade
local RETRY = 1           -- seconds before looking again at items the client had not loaded

-- Inventory slots of an equip location.
local SLOTS = {
    INVTYPE_HEAD = { 1 }, INVTYPE_NECK = { 2 }, INVTYPE_SHOULDER = { 3 }, INVTYPE_BODY = { 4 },
    INVTYPE_CHEST = { 5 }, INVTYPE_ROBE = { 5 }, INVTYPE_WAIST = { 6 }, INVTYPE_LEGS = { 7 },
    INVTYPE_FEET = { 8 }, INVTYPE_WRIST = { 9 }, INVTYPE_HAND = { 10 }, INVTYPE_FINGER = { 11, 12 },
    INVTYPE_TRINKET = { 13, 14 }, INVTYPE_CLOAK = { 15 }, INVTYPE_WEAPON = { 16 },
    INVTYPE_WEAPONMAINHAND = { 16 }, INVTYPE_2HWEAPON = { 16 }, INVTYPE_SHIELD = { 17 },
    INVTYPE_WEAPONOFFHAND = { 17 }, INVTYPE_HOLDABLE = { 17 }, INVTYPE_RANGED = { 18 },
    INVTYPE_THROWN = { 18 }, INVTYPE_RANGEDRIGHT = { 18 }, INVTYPE_RELIC = { 18 },
}
local RANGED_SLOT = 18

-- Weight of each stat point for a class while leveling (weapon damage per second: DPS for
-- the hands, RANGED for the ranged slot, the casters' wands included).
local WEIGHTS = {
    WARRIOR = { STR = 2, AGI = 1, STA = 1.5, INT = 0, SPI = 0.2, ARMOR = 0.02, DPS = 3, RANGED = 0.5 },
    PALADIN = { STR = 2, AGI = 0.5, STA = 1.5, INT = 0.7, SPI = 0.5, ARMOR = 0.02, DPS = 3, RANGED = 0 },
    HUNTER = { STR = 0.3, AGI = 2, STA = 1, INT = 0.6, SPI = 0.4, ARMOR = 0.01, DPS = 0.5, RANGED = 3 },
    ROGUE = { STR = 1, AGI = 2, STA = 1, INT = 0, SPI = 0.2, ARMOR = 0.01, DPS = 3, RANGED = 0.3 },
    PRIEST = { STR = 0, AGI = 0, STA = 1, INT = 1.5, SPI = 2, ARMOR = 0.005, DPS = 0, RANGED = 2 },
    SHAMAN = { STR = 1.5, AGI = 1, STA = 1.2, INT = 1, SPI = 0.5, ARMOR = 0.015, DPS = 2.5, RANGED = 0 },
    MAGE = { STR = 0, AGI = 0, STA = 1, INT = 2, SPI = 1, ARMOR = 0.005, DPS = 0, RANGED = 2 },
    WARLOCK = { STR = 0, AGI = 0, STA = 1.5, INT = 1.5, SPI = 1, ARMOR = 0.005, DPS = 0, RANGED = 2 },
    DRUID = { STR = 1.5, AGI = 1, STA = 1, INT = 1, SPI = 1, ARMOR = 0.015, DPS = 1, RANGED = 0 },
}
local STATS = {
    STR = "ITEM_MOD_STRENGTH_SHORT", AGI = "ITEM_MOD_AGILITY_SHORT", STA = "ITEM_MOD_STAMINA_SHORT",
    INT = "ITEM_MOD_INTELLECT_SHORT", SPI = "ITEM_MOD_SPIRIT_SHORT", ARMOR = "RESISTANCE0_NAME",
}
local DPS = "ITEM_MOD_DAMAGE_PER_SECOND_SHORT"

-- Worth of an item for the player's class, in its slot.
function R:Score(link, slot)
    if not link then return 0 end
    local weights = WEIGHTS[Compat.PlayerClass()] or WEIGHTS.WARRIOR
    local stats = Compat.ItemStats(link)
    local score = 0
    for key, stat in pairs(STATS) do score = score + (stats[stat] or 0) * weights[key] end
    score = score + (stats[DPS] or 0) * (slot == RANGED_SLOT and weights.RANGED or weights.DPS)
    return score
end

-- What the item would replace: the weaker of its slots (rings, trinkets); a two-hander
-- replaces both hands.
local function equippedScore(self, equipLoc)
    local slots = SLOTS[equipLoc]
    if equipLoc == "INVTYPE_2HWEAPON" then
        return self:Score(Compat.EquippedLink(16), 16) + self:Score(Compat.EquippedLink(17), 17), 16
    end
    local worst, worstSlot
    for _, slot in ipairs(slots) do
        local s = self:Score(Compat.EquippedLink(slot), slot)
        if not worst or s < worst then worst, worstSlot = s, slot end
    end
    return worst, worstSlot
end

-- How much better an item would be than what it replaces, and its slot (nil when it is not
-- worn: no equip location). Used for rewards and for the bags (Core/Gear.lua).
function R:Gain(link, equipLoc)
    if not SLOTS[equipLoc] then return nil end
    local before, slot = equippedScore(self, equipLoc)
    return self:Score(link, slot) - before, slot
end
R.SLOTS = SLOTS

-- The reward to take: { index, link, reason = "upgrade" | "price", gain } or nil; also nil
-- (with `missing` true) while the client has not loaded every item.
function R:Best()
    local choices = Compat.RewardChoices()
    if #choices < 2 then return nil end
    local upgrade, price
    for _, c in ipairs(choices) do
        local info = c.link and Compat.ItemInfo(c.link)
        if not info then return nil, true end
        local slots = c.usable and SLOTS[info.equipLoc]
        if slots then
            local before, slot = equippedScore(self, info.equipLoc)
            local gain = self:Score(c.link, slot) - before
            if gain >= MIN_GAIN and (not upgrade or gain > upgrade.gain) then
                upgrade = { index = c.index, link = c.link, reason = "upgrade", gain = gain }
            end
        end
        if not price or info.sellPrice > price.sellPrice then
            price = { index = c.index, link = c.link, reason = "price", sellPrice = info.sellPrice }
        end
    end
    return upgrade or price
end

local function wanted()
    local ui = Ding.db and Ding.db.ui
    return ui and ui.chooseReward and ui.autoTurnin and not IsShiftKeyDown()
end

-- QUEST_COMPLETE with several rewards: point the best one out, take it with the option.
-- Items the client has not loaded yet: looked at again when they arrive (or a second later).
function R:OnComplete(retried)
    local best, missing = self:Best()
    self.waiting = missing and true or nil
    if not best then
        if missing and not retried then
            C_Timer.After(RETRY, function()
                if R.waiting then Ding:Safe(R.OnComplete, R, true) end
            end)
        end
        return
    end
    self.best, self.last = best, best
    if Ding.RewardHint then Ding:Safe(Ding.RewardHint.Show, Ding.RewardHint, best) end
    if wanted() then Compat.Call("GetQuestReward", best.index) end
end

Ding:On("QUEST_COMPLETE", function() R:OnComplete() end)
Ding:On("GET_ITEM_INFO_RECEIVED", function()
    if R.waiting then R:OnComplete(true) end
end)
Ding:On("QUEST_FINISHED", function()
    R.best, R.waiting = nil, nil
    if Ding.RewardHint then Ding:Safe(Ding.RewardHint.Hide, Ding.RewardHint) end
end)
