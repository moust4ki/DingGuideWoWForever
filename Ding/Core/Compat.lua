-- API wrappers. Forever ships the Classic API under Retail's project ID, and some legacy
-- globals exist but fail, so every call prefers C_* namespaces and is protected.
local _, Ding = ...

local C = {}
Ding.Compat = C

local function safe(fn, ...)
    if type(fn) ~= "function" then return false end
    return pcall(fn, ...)
end

-- The client can hand an addon "secret" values (the player's speed, for instance): an
-- addon may not compare them nor compute with them, and trying is an error. Such a value
-- is treated as unknown (nil).
local function plain(v)
    if type(issecretvalue) == "function" then
        local ok, secret = pcall(issecretvalue, v)
        if not ok or secret then return nil end
    end
    return v
end
C.Plain = plain

-- Quest turned in at least once (account for server lag with Engine.turnedIn).
function C.IsQuestCompleted(questID)
    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        local ok, done = safe(C_QuestLog.IsQuestFlaggedCompleted, questID)
        if ok then return done == true end
    end
    local ok, done = safe(IsQuestFlaggedCompleted, questID)
    return ok and done == true
end

-- Falls back to the legacy function when the C_ one fails or does not know the quest.
function C.GetLogIndex(questID)
    if C_QuestLog and C_QuestLog.GetLogIndexForQuestID then
        local ok, index = safe(C_QuestLog.GetLogIndexForQuestID, questID)
        index = ok and plain(index)
        if index and index > 0 then return index end
    end
    local ok, index = safe(GetQuestLogIndexByID, questID)
    index = ok and plain(index)
    if index and index > 0 then return index end
    return nil
end

function C.IsInLog(questID)
    return C.GetLogIndex(questID) ~= nil
end

-- All objectives done, ready to turn in.
function C.IsQuestReady(questID)
    if not C.IsInLog(questID) then return false end
    if C_QuestLog and C_QuestLog.IsComplete then
        local ok, done = safe(C_QuestLog.IsComplete, questID)
        if ok and done ~= nil then return done == true end
    end
    local index = C.GetLogIndex(questID)
    local ok, _, _, _, _, _, isComplete = safe(GetQuestLogTitle, index)
    return ok and (isComplete == 1 or isComplete == true)
end

-- { { text = "Young Nightsaber slain: 3/7", type = "monster", finished = false,
--     numFulfilled = 3, numRequired = 7 }, ... } (fields the client keeps secret: nil). A count
-- the client keeps secret comes from the text's "3/7" (its last one: "Sanglier : 2/6
-- personnages tués" too), and then whether it is finished: an objective done must not read 0.
local function textCount(text)
    local have, need
    for a, b in (text or ""):gmatch("(%d+)%s*/%s*(%d+)") do have, need = a, b end
    return tonumber(have), tonumber(need)
end

function C.GetObjectives(questID)
    local out = {}
    if C_QuestLog and C_QuestLog.GetQuestObjectives then
        local ok, list = safe(C_QuestLog.GetQuestObjectives, questID)
        if ok and type(list) == "table" then
            for i, obj in ipairs(list) do
                local o = {
                    text = plain(obj.text), type = plain(obj.type), finished = plain(obj.finished),
                    numFulfilled = plain(obj.numFulfilled), numRequired = plain(obj.numRequired),
                }
                if o.numFulfilled == nil or o.numRequired == nil then
                    local have, need = textCount(o.text)
                    if o.numFulfilled == nil then o.numFulfilled = have end
                    if o.numRequired == nil then o.numRequired = need end
                end
                local have, need = tonumber(o.numFulfilled), tonumber(o.numRequired)
                if o.finished == nil and have and need and need > 0 then o.finished = have >= need end
                out[i] = o
            end
        end
    end
    return out
end

function C.NumQuestsInLog()
    if C_QuestLog and C_QuestLog.GetNumQuestLogEntries then
        local ok, _, quests = safe(C_QuestLog.GetNumQuestLogEntries)
        if ok and quests then return quests end
    end
    local ok, _, quests = safe(GetNumQuestLogEntries)
    return ok and quests or 0
end

-- Quest id of a quest log line, nil for a header or when the client cannot tell.
local function logLineQuest(index)
    if C_QuestLog and C_QuestLog.GetInfo then
        local ok, info = safe(C_QuestLog.GetInfo, index)
        if ok and type(info) == "table" then
            if plain(info.isHeader) then return nil end
            local id = plain(info.questID)
            if type(id) == "number" and id > 0 then return id end
        end
    end
    if C_QuestLog and C_QuestLog.GetQuestIDForLogIndex then
        local ok, id = safe(C_QuestLog.GetQuestIDForLogIndex, index)
        id = ok and plain(id)
        if type(id) == "number" and id > 0 then return id end
    end
    local ok, _, _, _, header, _, _, _, id = safe(GetQuestLogTitle, index)
    id = ok and not plain(header) and plain(id)
    if type(id) == "number" and id > 0 then return id end
    return nil
end

-- Quest ids of the quest log, in the log's order (headers left out).
function C.LogQuests()
    local entries
    if C_QuestLog and C_QuestLog.GetNumQuestLogEntries then
        local ok, n = safe(C_QuestLog.GetNumQuestLogEntries)
        entries = ok and plain(n)
    end
    if type(entries) ~= "number" then
        local ok, n = safe(GetNumQuestLogEntries)
        entries = ok and plain(n)
    end
    local out = {}
    for i = 1, type(entries) == "number" and math.min(entries, 100) or 0 do
        local id = logLineQuest(i)
        if id then out[#out + 1] = id end
    end
    return out
end

-- Experience: current, needed for the next level, rested (0 without), or nil when the
-- client keeps it secret.
function C.PlayerXP()
    local okX, xp = safe(UnitXP, "player")
    local okM, max = safe(UnitXPMax, "player")
    xp, max = okX and plain(xp), okM and plain(max)
    if type(xp) ~= "number" or type(max) ~= "number" or max <= 0 then return nil end
    local okR, rested = safe(GetXPExhaustion)
    rested = okR and plain(rested)
    return xp, max, type(rested) == "number" and rested > 0 and rested or 0
end

---------------------------------------------------------------------------
-- Positions. World coordinates are in yards, shared by every map of a continent.
---------------------------------------------------------------------------
function C.MapToWorld(uiMapID, x, y)
    if not (C_Map and C_Map.GetWorldPosFromMapPos and CreateVector2D) then return nil end
    local ok, continent, world = safe(C_Map.GetWorldPosFromMapPos, uiMapID, CreateVector2D(x / 100, y / 100))
    if not ok or not plain(continent) or not world then return nil end
    local wx, wy = plain(world.x), plain(world.y)
    if not wx or not wy then return nil end
    return continent, wx, wy
end

-- The zone map (UiMapID) under a world position of a continent, or nil.
function C.WorldToMap(continent, wx, wy)
    if not (C_Map and C_Map.GetMapPosFromWorldPos and CreateVector2D) then return nil end
    local ok, map = safe(C_Map.GetMapPosFromWorldPos, continent, CreateVector2D(wx, wy))
    map = ok and plain(map)
    return type(map) == "number" and map or nil
end

-- The player knows this spell.
function C.SpellKnown(spellID)
    local ok, known = safe(IsSpellKnown, spellID)
    if ok then return plain(known) and true or false end
    ok, known = safe(IsPlayerSpell, spellID)
    return ok and plain(known) and true or false
end

-- Seconds before a spell can be cast again (0 when ready or unknown).
function C.SpellCooldown(spellID)
    local start, duration
    if C_Spell and C_Spell.GetSpellCooldown then
        local ok, info = safe(C_Spell.GetSpellCooldown, spellID)
        if ok and type(info) == "table" then start, duration = plain(info.startTime), plain(info.duration) end
    end
    if start == nil then
        local ok, s, d = safe(GetSpellCooldown, spellID)
        start, duration = ok and plain(s), ok and plain(d)
    end
    if type(start) ~= "number" or type(duration) ~= "number" or start <= 0 then return 0 end
    return math.max(0, start + duration - GetTime())
end

-- uiMapID, x, y (0-100) of the player on the map of their zone, or nil.
function C.GetPlayerMapPosition()
    if not C_Map then return nil end
    local okMap, uiMapID = safe(C_Map.GetBestMapForUnit, "player")
    uiMapID = okMap and plain(uiMapID)
    if not uiMapID then return nil end
    local okPos, pos = safe(C_Map.GetPlayerMapPosition, uiMapID, "player")
    if not okPos or not pos then return nil end
    local x, y = plain(pos.x), plain(pos.y)
    if not x or not y then return nil end
    return uiMapID, x * 100, y * 100
end

-- continent, worldX, worldY, uiMapID
function C.GetPlayerWorld()
    if not C_Map then return nil end
    local okMap, uiMapID = safe(C_Map.GetBestMapForUnit, "player")
    if not okMap or not uiMapID then return nil end
    local okPos, pos = safe(C_Map.GetPlayerMapPosition, uiMapID, "player")
    if not okPos or not pos then return nil end
    local okW, continent, world = safe(C_Map.GetWorldPosFromMapPos, uiMapID, pos)
    if not okW or not plain(continent) or not world then return nil end
    local x, y = plain(world.x), plain(world.y)
    if not x or not y then return nil end
    return continent, x, y, uiMapID
end

function C.GetFacing()
    local ok, facing = safe(GetPlayerFacing)
    facing = ok and plain(facing)
    if type(facing) == "number" then return facing end
    return nil
end

-- Name of the place the player is in, sub-zone first ("Valley of Trials").
function C.ZoneText()
    for _, name in ipairs({ "GetMinimapZoneText", "GetSubZoneText", "GetRealZoneText", "GetZoneText" }) do
        local ok, text = safe(_G[name])
        if ok and type(text) == "string" and text ~= "" then return text end
    end
    return nil
end

-- Dead and released: a ghost on its way back to its corpse.
function C.IsGhost()
    local ok, ghost = safe(UnitIsGhost, "player")
    return ok and plain(ghost) and true or false
end

-- Dead, released or not.
function C.IsDeadOrGhost()
    local ok, dead = safe(UnitIsDeadOrGhost, "player")
    if ok then return plain(dead) and true or false end
    return C.IsGhost()
end

-- Name of the place the hearthstone is bound to ("Goldshire"), or nil.
function C.BindLocation()
    local ok, name = safe(GetBindLocation)
    name = ok and plain(name)
    return type(name) == "string" and name ~= "" and name or nil
end

-- The corpse as a point { map, x, y } (0-100) on the player's map or one of its parents
-- (the corpse may lie in another zone of the continent); nil when unknown.
function C.CorpsePoint()
    local getCorpse = C_DeathInfo and C_DeathInfo.GetCorpseMapPosition
    if not getCorpse or not C_Map then return nil end
    local ok, map = safe(C_Map.GetBestMapForUnit, "player")
    map = ok and plain(map)
    for _ = 1, 4 do
        if not map then return nil end
        local okPos, pos = safe(getCorpse, map)
        local x, y = okPos and pos and plain(pos.x), okPos and pos and plain(pos.y)
        if x and y and (x > 0 or y > 0) then return { map = map, x = x * 100, y = y * 100 } end
        local okInfo, info = safe(C_Map.GetMapInfo, map)
        map = okInfo and info and plain(info.parentMapID)
        if map == 0 then map = nil end
    end
    return nil
end

function C.IsAddOnLoaded(name)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        local ok, loaded = safe(C_AddOns.IsAddOnLoaded, name)
        if ok then return loaded == true end
    end
    local ok, loaded = safe(IsAddOnLoaded, name)
    return ok and (loaded == true or loaded == 1)
end

function C.PlayerRace()
    local _, raceFile = UnitRace("player")
    return raceFile
end

function C.PlayerClass()
    local _, classFile = UnitClass("player")
    return classFile
end

-- Mounted, and getting off (when the client lets an addon do it).
function C.Mounted()
    local ok, mounted = safe(IsMounted)
    return ok and plain(mounted) and true or false
end

function C.Dismount()
    return (safe(Dismount))
end

-- Takes the flight to node `index` of the open flight map: the taxi API's own call, the only
-- one Ding makes ("Take the flight automatically", tools/tests/taint_test.lua allows it).
function C.TakeTaxi(index)
    return (safe(TakeTaxiNode, index))
end

-- Talent points the player has not spent yet (0 when the client cannot tell).
function C.FreeTalentPoints()
    local ok, n = safe(UnitCharacterPoints, "player")
    n = ok and plain(n)
    if type(n) ~= "number" then
        ok, n = safe(GetUnspentTalentPoints)
        n = ok and plain(n)
    end
    return type(n) == "number" and n or 0
end

---------------------------------------------------------------------------
-- NPC quest dialogs (gossip, greeting, quest frame)
---------------------------------------------------------------------------
-- Calls a global function by name, protected; returns ok, results...
function C.Call(name, ...)
    return safe(_G[name], ...)
end

-- Quest shown in the quest frame (detail, progress, reward), or nil.
function C.DialogQuestID()
    local ok, id = safe(GetQuestID)
    if ok and type(id) == "number" and id > 0 then return id end
    return nil
end

-- Gossip window quests: active = { { questID, title, isComplete } }, available = { { questID, title } }.
-- nil when C_GossipInfo is missing.
function C.GossipQuests()
    if not (C_GossipInfo and C_GossipInfo.GetActiveQuests and C_GossipInfo.GetAvailableQuests) then return nil end
    local okA, active = safe(C_GossipInfo.GetActiveQuests)
    local okB, available = safe(C_GossipInfo.GetAvailableQuests)
    if not (okA and okB) then return nil end
    return type(active) == "table" and active or {}, type(available) == "table" and available or {}
end

function C.SelectGossipQuest(questID, active)
    if not C_GossipInfo then return false end
    local fn = active and C_GossipInfo.SelectActiveQuest or C_GossipInfo.SelectAvailableQuest
    return (safe(fn, questID))
end

-- Quest greeting window (NPCs with several quests and no gossip): lists by index.
-- active = { { index, title, isComplete } }, available = { { index, title } }.
function C.GreetingQuests()
    local active, available = {}, {}
    local ok, n = safe(GetNumActiveQuests)
    for i = 1, (ok and n or 0) do
        local okT, title, isComplete = safe(GetActiveTitle, i)
        if okT and title then active[#active + 1] = { index = i, title = title, isComplete = isComplete } end
    end
    ok, n = safe(GetNumAvailableQuests)
    for i = 1, (ok and n or 0) do
        local okT, title = safe(GetAvailableTitle, i)
        if okT and title then available[#available + 1] = { index = i, title = title } end
    end
    return active, available
end

---------------------------------------------------------------------------
-- Items (quest item button)
---------------------------------------------------------------------------
-- First function of the list that exists and answers without error; returns its results.
-- The list may have holes (a C_ function the client lacks): every entry is tried.
local function first(fns, ...)
    for i = 1, table.maxn(fns) do
        local results = { safe(fns[i], ...) }
        if results[1] and results[2] ~= nil then return unpack(results, 2, table.maxn(results)) end
    end
    return nil
end

local function itemApi(name)
    return C_Item and C_Item[name]
end

-- Number of copies in the bags.
function C.ItemCount(itemID)
    local count = plain(first({ itemApi("GetItemCount"), GetItemCount }, itemID))
    return type(count) == "number" and count or 0
end

function C.ItemIcon(itemID)
    return first({ itemApi("GetItemIconByID"), GetItemIcon }, itemID)
end

function C.ItemName(itemID)
    return first({ itemApi("GetItemNameByID"), GetItemInfo }, itemID)
end

-- The item has a "Use:" effect.
function C.ItemHasUse(itemID)
    return first({ itemApi("GetItemSpell"), GetItemSpell }, itemID) ~= nil
end

-- start, duration (0, 0 when ready or unknown).
function C.ItemCooldown(itemID)
    local start, duration = first({ C_Container and C_Container.GetItemCooldown, GetItemCooldown }, itemID)
    start, duration = plain(start), plain(duration)
    if type(start) ~= "number" or type(duration) ~= "number" then return 0, 0 end
    return start, duration
end

-- false when the item cannot be used right now; nil when the client cannot tell.
function C.ItemUsable(itemID)
    local usable = plain(first({ itemApi("IsUsableItem"), IsUsableItem }, itemID))
    if usable == nil then return nil end
    return usable and true or false
end

-- false when the target is out of the item's range; nil without a target or a range.
function C.ItemInRange(itemID)
    local ok, exists = safe(UnitExists, "target")
    if not ok or not plain(exists) then return nil end
    local inRange = plain(first({ itemApi("IsItemInRange"), IsItemInRange }, itemID, "target"))
    if inRange == nil then return nil end
    return inRange and true or false
end

-- Name and icon of a spell, or nil.
function C.SpellName(spellID)
    local name = first({ C_Spell and C_Spell.GetSpellName, GetSpellInfo }, spellID)
    return type(name) == "string" and name or nil
end

function C.SpellIcon(spellID)
    return first({ C_Spell and C_Spell.GetSpellTexture, GetSpellTexture }, spellID)
end

-- false when the spell cannot be cast right now (reagent, mana); nil when the client cannot tell.
function C.SpellUsable(spellID)
    local usable = plain(first({ C_Spell and C_Spell.IsSpellUsable, IsUsableSpell }, spellID))
    if usable == nil then return nil end
    return usable and true or false
end

-- What GetItemInfo knows of an item (id or link): { name, link, quality, minLevel, equipLoc,
-- sellPrice }, or nil while the client has not loaded it.
function C.ItemInfo(item)
    local name, link, quality, _, minLevel, _, _, _, equipLoc, _, sellPrice =
        first({ itemApi("GetItemInfo"), GetItemInfo }, item)
    if type(name) ~= "string" then return nil end
    return { name = name, link = link, quality = plain(quality), minLevel = plain(minLevel),
        equipLoc = plain(equipLoc), sellPrice = plain(sellPrice) or 0 }
end

-- Stats of an item link: { ITEM_MOD_STRENGTH_SHORT = 3, RESISTANCE0_NAME = 120, ... } (empty
-- when unknown).
function C.ItemStats(link)
    if not link then return {} end
    local stats = first({ itemApi("GetItemStats"), GetItemStats }, link)
    local out = {}
    if type(stats) == "table" then
        for k, v in pairs(stats) do
            v = plain(v)
            if type(v) == "number" then out[k] = v end
        end
    end
    return out
end

-- Link of the item equipped in an inventory slot, or nil.
function C.EquippedLink(slot)
    local ok, link = safe(GetInventoryItemLink, "player", slot)
    return ok and type(link) == "string" and link or nil
end

-- Reward choices of the quest window: { { index, link, usable } } (empty when none).
function C.RewardChoices()
    local out = {}
    local ok, n = safe(GetNumQuestChoices)
    n = ok and plain(n)
    for i = 1, type(n) == "number" and n or 0 do
        local okL, link = safe(GetQuestItemLink, "choice", i)
        local okI, _, _, _, _, usable = safe(GetQuestItemInfo, "choice", i)
        out[#out + 1] = { index = i, link = okL and type(link) == "string" and link or nil,
            usable = not okI or plain(usable) ~= false }
    end
    return out
end

---------------------------------------------------------------------------
-- Bags and merchants
---------------------------------------------------------------------------
local BAGS = { 0, 1, 2, 3, 4 }
C.BAGS = BAGS

local function containerApi(name) return C_Container and C_Container[name] end

function C.BagSize(bag)
    local n = plain(first({ containerApi("GetContainerNumSlots"), GetContainerNumSlots }, bag))
    return type(n) == "number" and n or 0
end

-- What a bag slot holds: { id, link, count, quality, noValue } or nil when empty.
function C.BagItem(bag, slot)
    local fn = containerApi("GetContainerItemInfo")
    if fn then
        local ok, info = safe(fn, bag, slot)
        if ok and type(info) == "table" then
            return { id = plain(info.itemID), link = plain(info.hyperlink), count = plain(info.stackCount) or 1,
                quality = plain(info.quality), noValue = plain(info.hasNoValue) and true or false }
        end
        if ok then return nil end
    end
    local ok, _, count, _, quality, _, _, link, _, noValue, id = safe(GetContainerItemInfo, bag, slot)
    if not ok or not link then return nil end
    return { id = plain(id), link = plain(link), count = plain(count) or 1, quality = plain(quality),
        noValue = plain(noValue) and true or false }
end

-- Uses a bag slot: at a merchant, sells it.
function C.UseBagItem(bag, slot)
    local ok = safe(containerApi("UseContainerItem") or UseContainerItem, bag, slot)
    return ok
end

-- Free slots of the bags that hold anything (not the profession bags).
function C.FreeBagSlots()
    local free = 0
    for _, bag in ipairs(BAGS) do
        local n, kind = first({ containerApi("GetContainerNumFreeSlots"), GetContainerNumFreeSlots }, bag)
        n, kind = plain(n), plain(kind)
        if type(n) == "number" and (kind == nil or kind == 0) then free = free + n end
    end
    return free
end

-- Repairing everything here: its cost (0 when nothing to repair or no repairer).
function C.RepairCost()
    local okCan, can = safe(CanMerchantRepair)
    if not okCan or not plain(can) then return 0 end
    local ok, cost, needed = safe(GetRepairAllCost)
    cost = ok and plain(cost)
    if type(cost) ~= "number" or (needed ~= nil and not plain(needed)) then return 0 end
    return cost
end

function C.Money()
    local ok, money = safe(GetMoney)
    money = ok and plain(money)
    return type(money) == "number" and money or 0
end

-- "1g 20s 5c", the client's coin icons when it has them.
function C.MoneyText(copper)
    local ok, text = safe(GetCoinTextureString, copper)
    if ok and type(text) == "string" and text ~= "" then return text end
    local g, s, c = math.floor(copper / 10000), math.floor(copper / 100) % 100, copper % 100
    local parts = {}
    if g > 0 then parts[#parts + 1] = g .. "g" end
    if s > 0 then parts[#parts + 1] = s .. "s" end
    if c > 0 or #parts == 0 then parts[#parts + 1] = c .. "c" end
    return table.concat(parts, " ")
end

---------------------------------------------------------------------------
-- Target, group, trainer
---------------------------------------------------------------------------
-- Name of the target, or nil (none, or kept secret).
function C.TargetName()
    local ok, name = safe(UnitName, "target")
    name = ok and plain(name)
    return type(name) == "string" and name or nil
end

function C.InGroup()
    local ok, group = safe(IsInGroup)
    if ok then return plain(group) and true or false end
    local okR, raid = safe(GetNumRaidMembers)
    local okP, party = safe(GetNumPartyMembers)
    return (okR and (plain(raid) or 0) > 0) or (okP and (plain(party) or 0) > 0) or false
end

-- Puts raid marker `icon` (1-8) on the target unless it has one.
function C.MarkTarget(icon)
    local ok, current = safe(GetRaidTargetIndex, "target")
    if ok and plain(current) then return false end
    return (safe(SetRaidTarget, "target", icon))
end

-- Name of the NPC whose window is open (gossip, merchant, trainer), or nil.
function C.NpcUnitName()
    local ok, name = safe(UnitName, "npc")
    name = ok and plain(name)
    return type(name) == "string" and name or nil
end

-- The creature id of a GUID ("Creature-0-…-<id>-…"); false for one that is no creature's (a
-- player); nil without a GUID, or when the client keeps it secret (in combat, maybe).
function C.GuidNpcID(guid)
    guid = plain(guid)
    if type(guid) ~= "string" then return nil end
    local kind, id = guid:match("^(%a+)%-%d+%-%d+%-%d+%-%d+%-(%d+)")
    if kind ~= "Creature" and kind ~= "Vehicle" then return false end
    return tonumber(id)
end

-- The creature id of a unit, the same way.
function C.UnitNpcID(unit)
    local ok, guid = safe(UnitGUID, unit)
    if not ok then return nil end
    return C.GuidNpcID(guid)
end

function C.UnitExists(unit)
    local ok, exists = safe(UnitExists, unit)
    return ok and plain(exists) and true or false
end

-- The creature id of the NPC whose window is open, or nil.
function C.NpcUnitID() return C.UnitNpcID("npc") or nil end

-- A unit's name, or nil (none, or kept secret).
function C.UnitName(unit)
    local ok, name = safe(UnitName, unit)
    name = ok and plain(name)
    return type(name) == "string" and name ~= "" and name or nil
end

-- The player can attack the unit: true / false, nil when the client cannot tell.
function C.UnitAttackable(unit)
    local ok, yes = safe(UnitCanAttack, "player", unit)
    if not ok then return nil end
    if plain(yes) == nil then
        -- nil (no), or a value the client keeps secret (unknown).
        if type(issecretvalue) == "function" then
            local okS, secret = pcall(issecretvalue, yes)
            if not okS or secret then return nil end
        end
        return false
    end
    return yes and true or false
end

-- The game's nameplate of a unit token ("nameplate3"), or nil (none, or one the client keeps
-- from addons). Ding only parents its own frames to it.
function C.NamePlateForUnit(unit)
    if not (C_NamePlate and C_NamePlate.GetNamePlateForUnit) then return nil end
    local ok, plate = safe(C_NamePlate.GetNamePlateForUnit, unit)
    return ok and type(plate) == "table" and plate or nil
end

-- A console variable: its value as text, or nil.
function C.GetCVar(name)
    local value = first({ C_CVar and C_CVar.GetCVar, GetCVar }, name)
    value = plain(value)
    return value ~= nil and tostring(value) or nil
end

-- Sets a console variable; true when the client took it.
function C.SetCVar(name, value)
    local fn = (C_CVar and C_CVar.SetCVar) or SetCVar
    local ok, result = safe(fn, name, tostring(value))
    return ok and result ~= false
end

-- The text of the n-th option of the open dialogue (C_GossipInfo, else the legacy list of
-- text and type pairs), or nil.
function C.GossipOption(index)
    if C_GossipInfo and C_GossipInfo.GetOptions then
        local ok, options = safe(C_GossipInfo.GetOptions)
        if ok and type(options) == "table" then
            local option = options[index]
            local name = option and plain(option.name)
            if type(name) == "string" then return name end
        end
    end
    local ok, text = safe(function() return (select(2 * index - 1, GetGossipOptions())) end)
    text = ok and plain(text)
    return type(text) == "string" and text or nil
end

-- The spell an item casts when used, or nil.
function C.ItemSpellID(itemID)
    local _, spell = first({ C_Item and C_Item.GetItemSpell }, itemID)
    return plain(spell)
end

-- Lua pattern from a client format string, the name captured:
--   "%s slain: %d/%d"                         -> "^(.-) slain: %d+/%d+$"
--   "%1$s : %2$d/%3$d |4tué:tués;" (French)   -> "^(.-) : %d+/%d+ .-$"
-- Placeholders (plain or positional), "%%" and the |4singular:plural; grammar are set
-- aside before the Lua magic characters of the rest are escaped. nil if no usable pattern.
function C.FormatPattern(fmt)
    if type(fmt) ~= "string" or fmt == "" then return nil end
    local p = fmt:gsub("|4[^;]*;", "\1"):gsub("%%%%", "\4"):gsub("%%%d*%$?s", "\2"):gsub("%%%d*%$?d", "\3")
    p = p:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
    p = "^" .. p:gsub("\1", ".-"):gsub("\2", "(.-)"):gsub("\3", "%%d+"):gsub("\4", "%%%%") .. "$"
    -- A string this does not understand must never break anything.
    if not pcall(string.match, "", p) then return nil end
    return p
end

-- Item class and subclass ids (4 armor, 2 weapon...) and equip location, without loading it.
function C.ItemClass(item)
    local _, _, _, equipLoc, _, classID, subclassID = first({ itemApi("GetItemInfoInstant"), GetItemInfoInstant }, item)
    return plain(classID), plain(subclassID), plain(equipLoc)
end

-- Id of the item worn in an inventory slot, or nil.
function C.EquippedID(slot)
    local ok, id = safe(GetInventoryItemID, "player", slot)
    id = ok and plain(id)
    return type(id) == "number" and id or nil
end

-- The item of a bag slot is bound to the player: true / false, nil when the client cannot tell.
function C.BagItemBound(bag, slot)
    if not (C_Item and C_Item.IsBound and ItemLocation and ItemLocation.CreateFromBagAndSlot) then return nil end
    local okL, location = safe(ItemLocation.CreateFromBagAndSlot, ItemLocation, bag, slot)
    if not okL or not location then return nil end
    local ok, bound = safe(C_Item.IsBound, location)
    if not ok then return nil end
    return plain(bound) and true or false
end

-- Wears an item from the bags (out of combat).
function C.EquipItem(link)
    return (safe(itemApi("EquipItemByName") or EquipItemByName, link))
end

-- The trainer window open teaches a profession (not the class).
function C.ProfessionTrainer()
    local ok, yes = safe(IsTradeskillTrainer)
    return ok and plain(yes) and true or false
end

-- Item shown next to the quest in the quest log (clients that have it), or nil.
function C.QuestSpecialItem(questID)
    local index = C.GetLogIndex(questID)
    if not index then return nil end
    local ok, link = safe(GetQuestLogSpecialItemInfo, index)
    local id = ok and type(link) == "string" and link:match("item:(%d+)")
    return id and tonumber(id) or nil
end

-- Highest grey level for a player of this level: a monster at or below it gives no
-- experience (Classic formula).
function C.GreyLevel(level)
    if level <= 5 then return 0 end
    if level <= 39 then return level - math.floor(level / 10) - 5 end
    return level - math.floor(level / 5) - 1
end

-- Quest of this level shown grey (trivial) to the player: the client's green range when it
-- has one, else the Classic grey-level formula (the one used for monsters' experience).
function C.IsQuestGrey(questLevel)
    local level = UnitLevel("player")
    local ok, range = safe(GetQuestGreenRange, "player")
    if ok and type(range) == "number" then return level - questLevel > range end
    return questLevel <= C.GreyLevel(level)
end

-- Localized name of a UiMap ("Darkshore"), or nil.
function C.MapName(uiMapID)
    if not (C_Map and C_Map.GetMapInfo) then return nil end
    local ok, info = safe(C_Map.GetMapInfo, uiMapID)
    local name = ok and type(info) == "table" and plain(info.name)
    return type(name) == "string" and name ~= "" and name or nil
end

-- Localized name of an area (AreaID: a town such as Booty Bay, 35), or nil.
function C.AreaName(areaID)
    if not (C_Map and C_Map.GetAreaInfo) then return nil end
    local ok, name = safe(C_Map.GetAreaInfo, areaID)
    name = ok and plain(name)
    return type(name) == "string" and name ~= "" and name or nil
end

-- The names of the character's skill lines (the skills panel: weapons, professions...), as a
-- set; empty when the client cannot tell.
function C.SkillNames()
    local out = {}
    local ok, count = safe(GetNumSkillLines)
    count = ok and plain(count)
    if type(count) ~= "number" then return out end
    for i = 1, count do
        local okI, name, header = safe(GetSkillLineInfo, i)
        name = okI and plain(name)
        if type(name) == "string" and not plain(header) then out[name] = true end
    end
    return out
end

-- The zone (UiMap type 3) a map belongs to: the map itself, or its parent for a dungeon,
-- a city's sub-map or a cave. Its id and localized name, or nil.
function C.ZoneOf(uiMapID)
    if not (C_Map and C_Map.GetMapInfo) then return nil end
    local map = uiMapID
    for _ = 1, 6 do
        if type(map) ~= "number" or map == 0 then return nil end
        local ok, info = safe(C_Map.GetMapInfo, map)
        if not ok or type(info) ~= "table" then return nil end
        local kind = plain(info.mapType)
        if type(kind) ~= "number" or kind <= 3 then
            local name = plain(info.name)
            return map, type(name) == "string" and name ~= "" and name or nil
        end
        map = plain(info.parentMapID)
    end
    return nil
end

---------------------------------------------------------------------------
-- The client's own map waypoint (the pin a player sets on the world map), when the client
-- has it. Ding sets it for the arrow's target ("Mark the target on the world map"): API
-- calls only, the world map frame is never touched (tools/tests/taint_test.lua allows these
-- three calls, here only).
---------------------------------------------------------------------------
local function waypointApi(name) return C_Map and C_Map[name] end

function C.HasUserWaypoint()
    return waypointApi("SetUserWaypoint") ~= nil and type(UiMapPoint) == "table"
        and type(UiMapPoint.CreateFromCoordinates) == "function"
end

-- Sets it at x, y (0-100) of a UiMap, and super-tracks it when the client can. True if set.
function C.SetUserWaypoint(uiMapID, x, y)
    if not C.HasUserWaypoint() then return false end
    local can = waypointApi("CanSetUserWaypointOnMap")
    if can then
        local ok, yes = safe(can, uiMapID)
        if not ok or not plain(yes) then return false end
    end
    local okP, point = safe(UiMapPoint.CreateFromCoordinates, uiMapID, x / 100, y / 100)
    if not okP or not point then return false end
    if not safe(C_Map.SetUserWaypoint, point) then return false end
    local track = C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint
    if track then safe(track, true) end
    return true
end

-- The waypoint set now (by Ding or by the player): map, x, y (0-100), or nil.
function C.UserWaypoint()
    local get = waypointApi("GetUserWaypoint")
    if not get then return nil end
    local ok, p = safe(get)
    if not ok or type(p) ~= "table" then return nil end
    local map, pos = plain(p.uiMapID), p.position
    local x, y = type(pos) == "table" and plain(pos.x), type(pos) == "table" and plain(pos.y)
    if type(map) ~= "number" or type(x) ~= "number" or type(y) ~= "number" then return nil end
    return map, x * 100, y * 100
end

function C.ClearUserWaypoint()
    return waypointApi("ClearUserWaypoint") ~= nil and (safe(C_Map.ClearUserWaypoint)) or false
end

-- The continent map (UiMap type 2) above the player's zone, or nil.
function C.ContinentMap()
    if not C_Map then return nil end
    local ok, map = safe(C_Map.GetBestMapForUnit, "player")
    map = ok and plain(map)
    for _ = 1, 6 do
        if type(map) ~= "number" or map == 0 then return nil end
        local okInfo, info = safe(C_Map.GetMapInfo, map)
        if not okInfo or type(info) ~= "table" then return nil end
        if plain(info.mapType) == 2 then return map end
        map = plain(info.parentMapID)
    end
    return nil
end

-- On a flight path.
function C.OnTaxi()
    local ok, onTaxi = safe(UnitOnTaxi, "player")
    return ok and plain(onTaxi) and true or false
end

-- Nodes of the open flight map: { { index, name, state = "current" | "known" | "unknown",
-- x, y } } with x, y (0-100) on the continent map `continentMap`; C_TaxiMap first, else the
-- legacy functions. Empty when the flight map is not open.
function C.TaxiNodes(continentMap)
    local out = {}
    if C_TaxiMap and C_TaxiMap.GetAllTaxiNodes and continentMap then
        local ok, nodes = safe(C_TaxiMap.GetAllTaxiNodes, continentMap)
        if ok and type(nodes) == "table" and #nodes > 0 then
            for i, n in ipairs(nodes) do
                local state = plain(n.state)
                local pos = type(n.position) == "table" and n.position
                local x, y = pos and plain(pos.x), pos and plain(pos.y)
                if x and y then
                    out[#out + 1] = { index = plain(n.slotIndex) or i, name = plain(n.name),
                        state = state == 0 and "current" or (state == 1 and "known" or "unknown"),
                        x = x * 100, y = y * 100 }
                end
            end
            return out
        end
    end
    local ok, count = safe(NumTaxiNodes)
    count = ok and plain(count)
    for i = 1, type(count) == "number" and count or 0 do
        local okT, kind = safe(TaxiNodeGetType, i)
        local okP, x, y = safe(TaxiNodePosition, i)
        local okN, name = safe(TaxiNodeName, i)
        kind, x, y = okT and plain(kind), okP and plain(x), okP and plain(y)
        if x and y then
            out[#out + 1] = { index = i, name = okN and plain(name) or nil,
                state = kind == "CURRENT" and "current" or (kind == "REACHABLE" and "known" or "unknown"),
                x = x * 100, y = y * 100 }
        end
    end
    return out
end

-- UiMapID of the zone the player is in, or nil.
function C.PlayerMap()
    if not C_Map then return nil end
    local ok, map = safe(C_Map.GetBestMapForUnit, "player")
    map = ok and plain(map)
    return type(map) == "number" and map or nil
end

-- "12,345" with the client's thousands separator when it has one.
function C.Number(n)
    local ok, text = safe(BreakUpLargeNumbers, n)
    if ok and type(text) == "string" then return text end
    return tostring(n)
end
