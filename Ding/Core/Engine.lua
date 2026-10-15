-- Step engine: knows the active guide and step, decides when a step is done,
-- and picks the waypoint the arrow should point to.
local _, Ding = ...
local L = Ding.L
local Compat = Ding.Compat

local E = {}
Ding.Engine = E

E.guide = nil
E.index = 1
E.turnedIn = {}    -- quests turned in this session (the server flag can lag)
E.hold = false     -- true after /ding prev: stay on the shown step until "next"
E.finished = false
E.logReady = false -- the client has sent the quest log (it comes a moment after login)

-- Yards from a step's place that reach it: about the distance to speak to an NPC (a tester:
-- "you're here" at 10 yards, a few more steps to walk without the arrow).
local DEFAULT_RADIUS = 6        -- yards
local LOOKAHEAD = 5             -- steps checked to detect progress past manual steps
local RESUME_WINDOW = 10        -- seconds after loading a guide where it resyncs on turn-ins
local START_TIMEOUT = 5         -- seconds the engine waits for the quest log at login
local HEARTHSTONE_SPELL = 8690  -- casting it validates a `hearth` step

---------------------------------------------------------------------------
-- Steps for the player: their race and class, and the options of the Automation tab. A step
-- whose option is off does not apply, like a step for another race.
---------------------------------------------------------------------------
local STEP_OPTIONS = {
    { key = "sethearth", option = "hearth" },
    { key = "hearth", option = "hearth" },
    { key = "deathskip", option = "deathSkip" },
    { key = "elite", option = "elites" },
    { key = "vendor", option = "serviceSteps" },
    { key = "repair", option = "serviceSteps" },
    { key = "train", option = "trainerSteps" },
    { key = "fly", option = "flightSteps" },
}

-- A dungeon the player wants: its own choice (Automation tab, one per dungeon the guide
-- names), else the "Dungeon quests" option.
function Ding:DungeonWanted(name)
    local ui = self.db and self.db.ui
    if not ui then return false end
    local choice = ui.dungeonChoice and ui.dungeonChoice[name]
    if choice == nil then return ui.dungeons and true or false end
    return choice
end

-- A step's conditions (`when`): all must hold. done / notdone: turned in; log / notlog: in
-- the quest log; ready: in the log, objectives done; item / noitem: in the bags (an id, or
-- { id, count }); minlevel / maxlevel: the player's level, inclusive.
local function asIds(v)
    if type(v) == "number" then return { v } end
    return type(v) == "table" and v or {}
end
-- `when.item`: an id, a pair { id, count } (two numbers, the second below 1000), a list of
-- ids (all held), or a list of pairs. Returns { { id, count } }.
local function heldItems(v)
    if type(v) == "number" then return { { v, 1 } } end
    if type(v) ~= "table" then return {} end
    local out = {}
    if type(v[1]) == "table" then
        for _, p in ipairs(v) do
            if type(p) == "number" then
                out[#out + 1] = { p, 1 }
            elseif type(p) == "table" then
                out[#out + 1] = { p[1], p[2] or 1 }
            end
        end
        return out
    end
    if #v == 2 and type(v[2]) == "number" and v[2] < 1000 then return { { v[1], v[2] } } end
    for _, id in ipairs(v) do out[#out + 1] = { id, 1 } end
    return out
end
E.HeldItems = heldItems

function E:ConditionsHold(when)
    if type(when) ~= "table" then return true end
    for _, q in ipairs(asIds(when.done)) do
        if not (self.turnedIn[q] or Compat.IsQuestCompleted(q)) then return false end
    end
    for _, q in ipairs(asIds(when.notdone)) do
        if self.turnedIn[q] or Compat.IsQuestCompleted(q) then return false end
    end
    for _, q in ipairs(asIds(when.log)) do
        if not Compat.IsInLog(q) then return false end
    end
    for _, q in ipairs(asIds(when.notlog)) do
        if Compat.IsInLog(q) then return false end
    end
    for _, q in ipairs(asIds(when.ready)) do
        if not (Compat.IsInLog(q) and Compat.IsQuestReady(q)) then return false end
    end
    for _, need in ipairs(heldItems(when.item)) do
        if type(need[1]) ~= "number" or Compat.ItemCount(need[1]) < need[2] then return false end
    end
    for _, id in ipairs(asIds(when.noitem)) do
        if Compat.ItemCount(id) > 0 then return false end
    end
    local level = UnitLevel("player")
    if when.minlevel and level < when.minlevel then return false end
    if when.maxlevel and level > when.maxlevel then return false end
    return true
end

-- The setting that hides a step ("elites", "dungeons", "hearth"...), or nil.
function Ding:StepOptionOff(step)
    local ui = self.db and self.db.ui
    if not ui then return nil end
    for _, o in ipairs(STEP_OPTIONS) do
        if step[o.key] and not ui[o.option] then return o.option end
    end
    if step.dungeon and not self:DungeonWanted(step.dungeon) then return "dungeons" end
    return nil
end

function Ding:StepApplies(step)
    if not self:StepForCharacter(step) then return false end
    if step.when and not E:ConditionsHold(step.when) then return false end
    return true
end

-- A step for this character: its race, class and options (StepApplies without the `when`
-- conditions, which come and go with quests and items). The steps the window numbers.
function Ding:StepForCharacter(step)
    return self:StepMatchesPlayer(step) and not self:StepOptionOff(step)
end

-- The number of step `index` among the character's steps of `guide` (the active one by
-- default), and how many there are: "Step 18 / 74", never the guide file's index, which
-- counts the steps of other races, classes and options (Yendi read 111 -> 114 as a jump).
function E:StepNumber(index, guide)
    guide = guide or self.guide
    if not guide then return 0, 0 end
    local n, total = 0, 0
    for i, s in ipairs(guide.steps) do
        if Ding:StepForCharacter(s) then
            total = total + 1
            if i <= index then n = n + 1 end
        end
    end
    return math.max(n, math.min(1, total)), total
end

-- Dungeons the active guide and the sections of its pack name (`dungeon`), in their order.
function E:DungeonNames()
    local names, seen = {}, {}
    local pack = self.guide and self.guide.pack
    if not self.guide then return names end
    for _, g in Ding:IterateGuides(pack) do
        for _, step in ipairs(g.steps) do
            local name = step.dungeon
            if type(name) == "string" and not seen[name] then
                seen[name] = true
                names[#names + 1] = name
            end
        end
    end
    return names
end

-- The same dungeons with the levels of their quests, by level (the settings' list):
-- { { name, min, max } }; a dungeon without quest levels takes its section's.
local dungeonCache
function E:DungeonInfo()
    if not self.guide then return {} end
    local pack, count = self.guide.pack, 0
    for _ in Ding:IterateGuides(pack) do count = count + 1 end
    local key = tostring(pack) .. ":" .. count
    if dungeonCache and dungeonCache.key == key then return dungeonCache.list end
    local found, list = {}, {}
    for _, g in Ding:IterateGuides(pack) do
        for _, step in ipairs(g.steps) do
            local name = step.dungeon
            if type(name) == "string" then
                local d = found[name]
                if not d then
                    d = { name = name }
                    found[name], list[#list + 1] = d, d
                end
                for _, k in ipairs({ "accept", "complete", "turnin" }) do
                    for _, q in ipairs(step[k] or {}) do
                        local level = Ding.Data:QuestLevel(q)
                        if level and level > 0 then
                            d.min = math.min(d.min or level, level)
                            d.max = math.max(d.max or level, level)
                        end
                    end
                end
                if not d.min and g.minLevel then d.min, d.max = g.minLevel, g.maxLevel end
            end
        end
    end
    table.sort(list, function(a, b)
        if (a.min or 999) ~= (b.min or 999) then return (a.min or 999) < (b.min or 999) end
        return a.name < b.name
    end)
    dungeonCache = { key = key, list = list }
    return list
end

-- A `level` step reached: the level, plus its `xp` into it (`level = 12, xp = 4500`), or its
-- fraction of that level's experience (`level = 12.5`).
function E:LevelReached(step)
    if not (step and step.level) then return true end
    local level = UnitLevel("player")
    local _, max = Compat.PlayerXP()
    local whole, into = Ding.Grind:Into(step, max)
    if level ~= whole then return level > whole end
    if into <= 0 then return true end
    local xp = Compat.PlayerXP()
    return xp ~= nil and xp >= into
end

-- Quests of the guide that AutoQuest never accepts by itself (`noauto` on any step).
local noAutoCache = setmetatable({}, { __mode = "k" })
function E:NoAuto(q)
    local guide = self.guide
    if not guide then return false end
    local set = noAutoCache[guide]
    if not set then
        set = {}
        for _, step in ipairs(guide.steps) do
            for _, id in ipairs(asIds(step.noauto)) do set[id] = true end
        end
        noAutoCache[guide] = set
    end
    return set[q] == true
end

-- The guide that follows `guide`: its `next`, or for a guide that ends before the
-- character picks a side (Skyborne), the entry of `next` for the character's faction.
function E:NextGuide(guide)
    local id = guide and guide.next
    if type(id) == "table" then id = id[UnitFactionGroup("player")] end
    return type(id) == "string" and Ding:GetGuide(id) or nil
end

---------------------------------------------------------------------------
-- Quest state
---------------------------------------------------------------------------
local function isTurnedIn(q)
    return E.turnedIn[q] or Compat.IsQuestCompleted(q)
end
function E:IsTurnedIn(q) return isTurnedIn(q) and true or false end

local function isAccepted(q)
    return isTurnedIn(q) or Compat.IsInLog(q)
end

local function isReady(q)
    return isTurnedIn(q) or Compat.IsQuestReady(q)
end
function E:IsReady(q) return isReady(q) end

-- Required level not reached: flagged in the panel, never blocks the guide.
local function tooLow(q)
    return Ding.Data:QuestRequiredLevel(q) > UnitLevel("player")
end

-- A quest above the player's real level. The routes keep "never above the player's level"
-- for a simulated player; in game a player behind it sees such a quest in orange with its
-- level (Panel) and goes on (holding the guide back was too heavy, Yendi). AutoQuest only
-- refuses it ahead of the guide.
local function aboveLevel(q)
    local level = Ding.Data:QuestLevel(q)
    return level > 0 and level > UnitLevel("player")
end
function E:AboveLevel(q) return aboveLevel(q) end

-- Quests taken ahead of the guide on the way (AutoQuest): they say nothing about where
-- the player is, so they never mark a manual step as passed.
local function early(q)
    return Ding.char and Ding.char.early and Ding.char.early[q] or false
end
function E:MarkEarly(q)
    Ding.char.early = Ding.char.early or {}
    Ding.char.early[q] = true
end

---------------------------------------------------------------------------
-- Grey quests: far below the player's level, they are not worth the trip. Not in the log
-- and not a prerequisite of another quest of the guide, they are skipped (setting skipGrey).
-- Only on a leveling route: a guide of another category (an item, a reputation...) is
-- followed for its reward, not the experience, and keeps them.
---------------------------------------------------------------------------
function E:KeepsGrey(guide)
    local pack = guide and Ding:GetGuidePack(guide.pack)
    return pack ~= nil and (pack.category or "leveling") ~= "leveling"
end

local prereqsOfGuide = {}    -- [guideId] = { [questID] = true } prerequisites of its quests

local function guidePrereqs(guide)
    local set = prereqsOfGuide[guide.id]
    if set and set.steps == guide.steps then return set.quests end
    local quests = {}
    for _, step in ipairs(guide.steps) do
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            for _, q in ipairs(step[key] or {}) do
                local single, group = Ding.Data:QuestPrereqs(q)
                for _, p in ipairs(single or {}) do quests[p] = true end
                for _, p in ipairs(group or {}) do quests[p] = true end
            end
        end
    end
    prereqsOfGuide[guide.id] = { steps = guide.steps, quests = quests }
    return quests
end

local function isGrey(q)
    if not (Ding.db and Ding.db.ui.skipGrey) or not E.guide or E:KeepsGrey(E.guide) then return false end
    if isAccepted(q) then return false end
    local level = Ding.Data:QuestLevel(q)
    if level == 0 or not Compat.IsQuestGrey(level) then return false end
    return not guidePrereqs(E.guide)[q]
end

function E:IsGrey(q) return isGrey(q) end

-- Quests the active guide uses, and the guides after it, with the earlier quests of their
-- chains (QuestieDB prerequisites).
local usedBy = setmetatable({}, { __mode = "k" })   -- [guide] = { [questID] = true }
local function usedQuests(guide)
    local set = usedBy[guide]
    if set then return set end
    set = {}
    local seen, g = {}, guide
    while g and not seen[g] do
        seen[g] = true
        for _, step in ipairs(g.steps) do
            for _, key in ipairs({ "accept", "complete", "turnin" }) do
                for _, q in ipairs(step[key] or {}) do
                    set[q] = true
                    local single, group = Ding.Data:QuestPrereqs(q)
                    for _, p in ipairs(single or {}) do set[p] = true end
                    for _, p in ipairs(group or {}) do set[p] = true end
                end
            end
        end
        g = E:NextGuide(g)
    end
    usedBy[guide] = set
    return set
end

-- Quests of the log that neither the active guide nor the guides after it ever use: Ding
-- offers to abandon them (Guide tab), never without the player's confirmation.
function E:UnusedLogQuests()
    if not self.guide then return {} end
    local used, out = usedQuests(self.guide), {}
    for _, q in ipairs(Compat.LogQuests()) do
        if not used[q] then out[#out + 1] = q end
    end
    return out
end

-- Quests of the quest log. A client that cannot list its log (no C_QuestLog.GetInfo nor an
-- older equivalent) still tells whether a quest is in it: then the guide's quests that are.
local guideQuests = setmetatable({}, { __mode = "k" })   -- [guide] = its quest ids, in order
function E:LogQuests()
    local list = Compat.LogQuests()
    if #list > 0 or not self.guide or Compat.NumQuestsInLog() == 0 then return list end
    local all = guideQuests[self.guide]
    if not all then
        all = {}
        local seen = {}
        for _, step in ipairs(self.guide.steps) do
            for _, key in ipairs({ "accept", "complete", "turnin" }) do
                for _, q in ipairs(step[key] or {}) do
                    if not seen[q] then seen[q], all[#all + 1] = true, q end
                end
            end
        end
        guideQuests[self.guide] = all
    end
    for _, q in ipairs(all) do
        if Compat.IsInLog(q) then list[#list + 1] = q end
    end
    return list
end

-- A quest the step works on (turn-in or objectives) that is not in the log yet,
-- e.g. skipped for its level earlier or abandoned: it must be picked up first.
local function needsPickup(q)
    return not isAccepted(q) and not tooLow(q) and not isGrey(q)
end

-- Optional step about a quest the player never got (an item that never dropped...).
local function missingOptionalQuest(step)
    for _, q in ipairs(step.turnin or {}) do if not isAccepted(q) then return true end end
    for _, q in ipairs(step.complete or {}) do if not isAccepted(q) then return true end end
    return false
end

-- What a step is, whatever its number: its actions, quests, places and conditions, not its
-- texts (a new version may reword them), with its rank among the steps alike (two visits to
-- the trainer stay apart). A mark (done by hand, skipped) and the step a section was left on
-- keep it (Ding.char.markKeys, Ding.char.lastKey): when a new version of Ding writes the guide
-- again and the step moves, they move with it. In game, the Wetlands' Carnage step marked
-- done by hand: the guide written again without it there, the mark fell on the step that
-- took its number ("A Noble Brew", "marked as done by hand").
local TEXT_KEYS = { note = true, why = true, text = true }
local function serialize(v, out)
    if type(v) ~= "table" then
        out[#out + 1] = tostring(v)
        return
    end
    local keys = {}
    for k in pairs(v) do
        if not TEXT_KEYS[k] then keys[#keys + 1] = k end
    end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    out[#out + 1] = "{"
    for _, k in ipairs(keys) do
        out[#out + 1] = tostring(k) .. "="
        serialize(v[k], out)
        out[#out + 1] = ";"
    end
    out[#out + 1] = "}"
end

-- [steps table] = { byIndex = { [index] = key }, indexOf = { [key] = index }, version }:
-- version changes with any step.
local stepKeyCache = setmetatable({}, { __mode = "k" })
local function stepKeys(guide)
    local info = stepKeyCache[guide.steps]
    if info then return info end
    info = { byIndex = {}, indexOf = {} }
    local seen, version = {}, #guide.steps
    for i, step in ipairs(guide.steps) do
        local out = {}
        serialize(step, out)
        local text, h = table.concat(out), 0
        for c = 1, #text do h = (h * 31 + text:byte(c)) % 2147483647 end
        seen[h] = (seen[h] or 0) + 1
        local key = h .. "#" .. seen[h]
        info.byIndex[i], info.indexOf[key] = key, i
        version = (version * 31 + h) % 2147483647
    end
    info.version = version
    stepKeyCache[guide.steps] = info
    return info
end

local function markKeys(guide, create)
    Ding.char.markKeys = Ding.char.markKeys or {}
    local all = Ding.char.markKeys
    if create and not all[guide.id] then all[guide.id] = {} end
    return all[guide.id]
end

-- A mark set or taken off on a step of the active guide: its key follows.
local function keepKey(index)
    local guide = E.guide
    if not guide then return end
    if E:StepMark(index) then
        markKeys(guide, true)[index] = stepKeys(guide).byIndex[index]
    else
        local keys = markKeys(guide, false)
        if keys then keys[index] = nil end
    end
end

-- A section taken up: its marks and the step it was left on follow their steps when a new
-- version moved them. A mark saved before marks had keys (Ding 1.5) is kept by its number
-- while the section is the one it was set in, and dropped when the section changed
-- (E.changedGuide, at login): its number may now be another step.
local function followSteps(guide)
    local info = stepKeys(guide)
    local keys = markKeys(guide, false)
    local changed = E.changedGuide == guide.id
    local newKeys = {}
    for _, all in ipairs({ Ding.char.manual, Ding.char.skipped or {} }) do
        local flags = all[guide.id]
        if flags then
            local moved = {}
            for index in pairs(flags) do
                local key = keys and keys[index]
                if not key and not changed then key = info.byIndex[index] end
                local at = key and info.indexOf[key]
                if at then moved[at], newKeys[at] = true, key end
            end
            all[guide.id] = next(moved) and moved or nil
        end
    end
    Ding.char.markKeys[guide.id] = next(newKeys) and newKeys or nil
    -- The step the section was left on, saved with the version of the section it was in.
    local lastKey = Ding.char.lastKey and Ding.char.lastKey[guide.id]
    local last = Ding.char.lastStep and Ding.char.lastStep[guide.id]
    if type(lastKey) == "table" and last and lastKey.version ~= info.version
        and lastKey.key and info.indexOf[lastKey.key] then
        Ding.char.lastStep[guide.id] = info.indexOf[lastKey.key]
    end
end

local function manualFlags(create)
    local guide = E.guide
    if not guide then return nil end
    local all = Ding.char.manual
    if create and not all[guide.id] then all[guide.id] = {} end
    return all[guide.id]
end

local function isManuallyDone(index)
    local flags = manualFlags(false)
    return flags and flags[index] == true
end

local function setManuallyDone(index, value)
    local flags = manualFlags(true)
    if flags then flags[index] = value or nil end
    keepKey(index)
end

-- The inn of a `sethearth` step, bound during that step: the client's own name of it then
-- (Ding.char.hearthInn), so the language does not matter; bound elsewhere since, it is not.
local function boundAt(inn)
    local h = Ding.char and Ding.char.hearthInn
    if not (h and h.inn == inn and h.name) then return false end
    return Compat.BindLocation() == h.name
end

-- Steps the player skipped (E:Skip), per guide: still to do, shown in their own color.
local function skipFlags(create)
    local guide = E.guide
    if not guide then return nil end
    Ding.char.skipped = Ding.char.skipped or {}
    local all = Ding.char.skipped
    if create and not all[guide.id] then all[guide.id] = {} end
    return all[guide.id]
end

local function setSkipped(index, value)
    local flags = skipFlags(true)
    if flags then flags[index] = value or nil end
    keepKey(index)
end

-- How the player left a step by hand: "manual" (marked done), "skipped", or nil. The window
-- shows what is not really done in that step in the mark's own color.
function E:StepMark(index)
    index = index or self.index
    if isManuallyDone(index) then return "manual" end
    local flags = skipFlags(false)
    if flags and flags[index] then return "skipped" end
    return nil
end

-- Does this step contain anything the engine can check by itself?
local function hasAutoActions(step)
    return step.turnin or step.accept or step.complete or step.level or Ding.Goals:Auto(step)
end

local function hasQuestActions(step)
    return step.turnin or step.accept or step.complete
end

-- Turn-ins done, quests accepted (or out of level reach), objectives done; grey quests
-- the player never took are skipped.
local function questActionsDone(step)
    for _, q in ipairs(step.turnin or {}) do
        if not isTurnedIn(q) and not isGrey(q) then return false end
    end
    for _, q in ipairs(step.accept or {}) do
        if not isAccepted(q) and not tooLow(q) and not isGrey(q) then return false end
    end
    for _, q in ipairs(step.complete or {}) do
        if not isReady(q) and not isGrey(q) then return false end
    end
    return true
end

-- Why Advance passed a step without the player doing it: { { quest, reason }, ... }
-- reason: "grey" (skipped) or "level" (taken later, level too low).
local function skipNotes(step, out)
    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        for _, q in ipairs(step[key] or {}) do
            if not isAccepted(q) then
                if isGrey(q) then
                    out[#out + 1] = { quest = q, reason = "grey" }
                elseif key == "accept" and tooLow(q) then
                    out[#out + 1] = { quest = q, reason = "level" }
                end
            end
        end
    end
end

---------------------------------------------------------------------------
-- Catching up on prerequisites: a quest of the step that cannot be taken yet because
-- an earlier quest of its chain was never turned in (skipped, done out of order...).
---------------------------------------------------------------------------
local MAX_CHAIN = 15

-- First prerequisite of q the player still has to turn in, or nil. Only quests open to
-- the player's race and class count: an unreachable one must not block the guide.
local function missingPrereq(q)
    local single, group = Ding.Data:QuestPrereqs(q)
    for _, p in ipairs(group or {}) do
        if not isTurnedIn(p) and Ding.Data:QuestOpenToPlayer(p) then return p end
    end
    if not single or #single == 0 then return nil end
    for _, p in ipairs(single) do
        if isTurnedIn(p) then return nil end
    end
    local first
    for _, p in ipairs(single) do
        if Ding.Data:QuestOpenToPlayer(p) then
            if isAccepted(p) then return p end
            first = first or p
        end
    end
    return first
end

-- Quest to work on before q can be taken: the earliest missing link of its chain (or the
-- one already in the log), nil when q can be taken. Quests of `step` itself don't count:
-- the step already asks for them.
function E:CatchUp(q, step)
    if isAccepted(q) then return nil end
    local inStep = {}
    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        for _, s in ipairs(step and step[key] or {}) do inStep[s] = true end
    end
    local found, seen = nil, {}
    local p = missingPrereq(q)
    for _ = 1, MAX_CHAIN do
        if not p or seen[p] or inStep[p] then break end
        seen[p] = true
        found = p
        if isAccepted(p) then break end
        p = missingPrereq(p)
    end
    return found
end

-- Work left on a quest the player has in the log: finishing it (complete) or turning it in.
-- Resuming stops on such a step of the guide's past; accepts of quests never taken are
-- left behind.
local function backlog(step)
    for _, q in ipairs(step.complete or {}) do
        if Compat.IsInLog(q) and not isReady(q) then return true end
    end
    for _, q in ipairs(step.turnin or {}) do
        if Compat.IsInLog(q) and not isTurnedIn(q) then return true end
    end
    return false
end

-- Resuming (guide just loaded, quest data may still arrive): a quest turned in further down
-- the guide means the player is past this step. Accepts don't count: a quest can be picked
-- up early, out of the guide's order. Nor do turn-ins past a step with work left on a quest
-- of the log: the player is not past that one, and those quests were done out of the
-- guide's order (a zone done earlier, the second half of the section).
local function laterTurnIn(index)
    local steps = E.guide.steps
    for i = index + 1, #steps do
        local s = steps[i]
        if Ding:StepApplies(s) then
            for _, q in ipairs(s.turnin or {}) do if isTurnedIn(q) and not early(q) then return true end end
            if backlog(s) then return false end
        end
    end
    return false
end

function E:IsResuming()
    return self.resumeUntil ~= nil and GetTime() <= self.resumeUntil
end

-- A later step already has quest progress: the player is past this one.
local function laterProgress(index)
    local steps = E.guide.steps
    for i = index + 1, math.min(#steps, index + LOOKAHEAD) do
        local s = steps[i]
        if Ding:StepApplies(s) then
            for _, q in ipairs(s.turnin or {}) do if isTurnedIn(q) and not early(q) then return true end end
            for _, q in ipairs(s.accept or {}) do if isAccepted(q) and not early(q) then return true end end
        end
    end
    return false
end

-- A step that only takes the player somewhere (go, fly, hearth).
local function travelOnly(step)
    return (step.go or step.fly or step.hearth) and not (hasAutoActions(step) or step.train or step.sethearth)
end

-- Nothing is left where a travel step leads: the next step for the player is done by the
-- game's own state (quests turned in, accepted, ready; level reached), or is itself a
-- pointless trip. A manual step next (class trainer, inn) keeps the trip.
local function pointlessTrip(index, depth)
    local steps = E.guide.steps
    for i = index + 1, #steps do
        local s = steps[i]
        if Ding:StepApplies(s) then
            if travelOnly(s) then return depth < 5 and pointlessTrip(i, depth + 1) end
            if not hasAutoActions(s) or s.train or s.sethearth or s.go then return false end
            if not E:LevelReached(s) then return false end
            return questActionsDone(s) and Ding.Goals:Done(s, i, E.guide)
        end
    end
    return false
end

-- "Turn in first" (section wrap-up): only the turn-ins of quests still in the log are left.
local function wrappingUp()
    return E.guide ~= nil and Ding.char and Ding.char.wrapUp == E.guide.id
end

local function pendingTurnIn(step)
    for _, q in ipairs(step.turnin or {}) do
        if Compat.IsInLog(q) and not isTurnedIn(q) then return true end
    end
    return false
end

function E:IsStepDone(step, index)
    if not Ding:StepApplies(step) then return true end
    if wrappingUp() then return not pendingTurnIn(step) end
    if isManuallyDone(index) then return true end
    -- An optional step the player went past, or whose quest never started.
    if step.optional and (laterProgress(index) or missingOptionalQuest(step)) then return true end

    if not questActionsDone(step) then return false end
    if not self:LevelReached(step) then return false end
    -- Goals without a quest (Core/Goals.lua): kills, items, talks, uses, chores.
    if not Ding.Goals:Done(step, index, self.guide) then return false end

    -- Steps the engine cannot verify (go, train, hearth...) need the player,
    -- or progress further down the guide.
    local needsPlayer = step.go or step.sethearth or step.train or step.hearth or step.fly
        or not hasAutoActions(step)
    if needsPlayer then
        -- Still bound at the step's inn.
        if step.sethearth and boundAt(step.sethearth) and not (step.go or step.train or step.hearth or step.fly) then
            return true
        end
        if travelOnly(step) and self.guide and pointlessTrip(index, 0) then return true end
        return laterProgress(index) or (self:IsResuming() and laterTurnIn(index))
    end
    return true
end

-- Everything the engine can check of a step is done (quests, goals, level); false for a
-- step with nothing to check (a patrol alone goes on until "next").
function E:StepPartsDone(step, index)
    if not hasAutoActions(step) then return false end
    return questActionsDone(step) and Ding.Goals:Done(step, index, self.guide) and self:LevelReached(step)
end

-- Patrol (`patrol = { { map, x, y }, ... }`): the arrow goes to one point after the other,
-- and round again; the point reached (within the step's radius) moves it on.
local function patrolState(index)
    local key = (E.guide and E.guide.id or "?") .. "#" .. tostring(index)
    if not E.patrol or E.patrol.key ~= key then E.patrol = { key = key, at = 1 } end
    return E.patrol
end

function E:PatrolPoint(step, index)
    local points = type(step.patrol) == "table" and step.patrol or {}
    if #points == 0 then return nil end
    local state = patrolState(index)
    if state.at > #points then state.at = 1 end
    local p = points[state.at]
    if type(p) ~= "table" or not (p[1] and p[2] and p[3]) then return nil end
    local label = L.PATROL_POINT:format(state.at, #points)
    if step.text then label = step.text .. " · " .. label end
    return { map = p[1], x = p[2], y = p[3], label = label, patrol = true }
end

function E:NextPatrolPoint(step, index)
    local points = type(step.patrol) == "table" and step.patrol or {}
    if #points == 0 then return end
    local state = patrolState(index)
    state.at = state.at % #points + 1
    self:Refresh()
end

-- At least one quest of the step is in the log or turned in (not merely out of reach).
local function touched(step)
    for _, key in ipairs({ "turnin", "accept", "complete" }) do
        for _, q in ipairs(step[key] or {}) do if isAccepted(q) then return true end end
    end
    return false
end

-- How far the character is in a guide, from quests only (no manual flags, no position),
-- over the steps with quest actions (optional steps and steps for other races or classes
-- don't count):
--   worked: steps done that the character really worked on (a guide whose quests are all
--           above the character's level is not "started");
--   left:   steps not done yet.
function E:GuideProgress(guide)
    local worked, left = 0, 0
    for _, step in ipairs(guide.steps) do
        if not step.optional and hasQuestActions(step) and Ding:StepApplies(step) then
            if not questActionsDone(step) then
                left = left + 1
            elseif touched(step) then
                worked = worked + 1
            end
        end
    end
    return worked, left
end

-- Until the client has sent the quest log, every quest looks absent: resuming then would
-- pass the very quests the player still has to turn in.
local function logKnown()
    if not E.logReady and Compat.NumQuestsInLog() > 0 then E.logReady = true end
    return E.logReady
end

-- A new version of Ding can regenerate a guide, and a saved step number then points
-- elsewhere. The signature (quest actions and level steps, in order) tells.
local function signature(guide)
    local h = #guide.steps
    for _, step in ipairs(guide.steps) do
        for _, key in ipairs({ "accept", "complete", "turnin" }) do
            for _, q in ipairs(step[key] or {}) do h = (h * 31 + q + #key) % 2147483647 end
        end
        h = (h * 31 + (step.level or 0)) % 2147483647
    end
    return h
end
E.Signature = signature

-- The step the character is on, saved; and per section (Ding.char.lastStep) where the
-- character was, or where a resume still in progress is going: picking a section again
-- takes it up there, whatever the game cannot check on the way (a trip, a trainer, the
-- inn, a step behind an option turned on since, a goal whose items are spent). Browsing
-- back with "Previous" (E.browseFrom) saves the guide's current step, not the one shown.
local function saveStep(index)
    if E.hold and E.browseFrom then index = math.max(index, E.browseFrom) end
    Ding.char.step = index
    local guide = E.guide
    if not guide then return end
    Ding.char.lastStep = Ding.char.lastStep or {}
    Ding.char.lastStep[guide.id] = math.max(index, E.resumeTo or 0)
    local info = stepKeys(guide)
    Ding.char.lastKey = Ding.char.lastKey or {}
    Ding.char.lastKey[guide.id] = { key = info.byIndex[Ding.char.lastStep[guide.id]], version = info.version }
end

-- Resuming up to a step (E:Resume): saved per character, so a reload keeps it.
-- strict: a resume of "take this guide up where I am" (E:Reset, E:LeftBehind).
local function setResumeTo(step, strict)
    E.resumeTo = step
    E.resumeStrict = step and strict and true or nil
    Ding.char.resumeTo = step and E.guide and { guide = E.guide.id, step = step, strict = E.resumeStrict } or nil
end

---------------------------------------------------------------------------
-- Navigation
---------------------------------------------------------------------------
-- Takes the guide up where the player is. From the first step, Advance passes what the
-- game shows done (quests turned in, accepted, ready; level reached) and what the player
-- marked. Up to the step the character was on in this section before (saveStep), it also
-- passes what the player left behind, but stops on any quest of the guide's past still in
-- the log with work left (to finish or to turn in): that is done first. Never further on
-- the quests alone: quests done out of the guide's order (a zone done earlier, in another
-- guide) sent characters far ahead, past the quests, trainers and trips still to do
-- (Redridge before Duskwood, then the Wetlands at level 24 before the route's Wetlands).
function E:Resume(id, silent, strict)
    local guide = Ding:GetGuide(id)
    if guide then followSteps(guide) end
    local last = Ding.char.lastStep and Ding.char.lastStep[id]
    return self:SetGuide(id, 1, silent, last, strict)
end

-- Switches to a guide pack: the section the character last followed in it (Ding.char.packGuide)
-- while it has work left at their level, else its section for the character
-- (Ding:SuggestGuide, else its first section), taken up where the player is. The active
-- section is kept when it is already in that pack.
function E:SetPack(packId)
    if not Ding:GetGuidePack(packId) then return false end
    if self.guide and self.guide.pack == packId then return true end
    local guide = Ding.char.packGuide and Ding:GetGuide(Ding.char.packGuide[packId])
    if guide and (guide.pack ~= packId or not Ding:GuideMatchesPlayer(guide)
        or UnitLevel("player") > guide.maxLevel or select(2, self:GuideProgress(guide)) == 0) then
        guide = nil
    end
    guide = guide or Ding:SuggestGuide(packId)
    if not guide then
        local _, first = Ding:IterateGuides(packId)()
        guide = first
    end
    if not guide then return false end
    return self:Resume(guide.id)
end

-- The player moves the guide (next, skip, back, another step or section): a trip of the NPC
-- directory (UI/Finder.lua) ends, and the refresh that follows gives the arrow back to the guide.
local function endTrip()
    local F = Ding.Finder
    if not (F and F.trip) then return false end
    F:Cancel(true)
    return true
end

-- resumeTo, strict: optional, see E:Resume and E:Reset.
function E:SetGuide(id, index, silent, resumeTo, strict)
    local guide = Ding:GetGuide(id)
    if not guide then
        Ding:Print(L.GUIDE_UNKNOWN:format(tostring(id)))
        return false
    end
    endTrip()
    followSteps(guide)
    self.guide = guide
    self.index = index or 1
    setResumeTo(resumeTo and resumeTo > self.index and resumeTo or nil, strict)
    self.skipNotes, self.passNotes = nil, nil
    self.hold = false
    self.finished = false
    Ding.char.guide = id
    -- The pack before this one: deleting an imported guide goes back there.
    if Ding.char.pack and Ding.char.pack ~= guide.pack then Ding.char.prevPack = Ding.char.pack end
    Ding.char.pack = guide.pack
    Ding.char.packGuide = Ding.char.packGuide or {}
    Ding.char.packGuide[guide.pack] = id
    Ding.char.guideSig = signature(guide)
    saveStep(self.index)
    if Ding.char.wrapUp ~= id then Ding.char.wrapUp = nil end
    Ding.Timing:Cancel()
    if not silent then Ding:Print(L.GUIDE_SET:format(guide.title)) end
    self.resumeUntil = GetTime() + RESUME_WINDOW
    self:Advance()
    Ding.Timing:Start(self.guide.id, self.index)
    self:Refresh()
    return true
end

-- Where the guide deals with quest `q` (a quest of the log, or of a row): the step that turns
-- it in (or works on it, when it is not ready) when it is in the log, else the one that takes
-- it; in the active guide first, then in the sections of its pack the character fits.
-- Returns { guide = id, index, action = "turnin" | "complete" | "accept" } or nil.
function E:FindQuest(q)
    local wanted
    if Compat.IsInLog(q) then
        wanted = Compat.IsQuestReady(q) and { "turnin", "complete" } or { "complete", "turnin" }
    else
        wanted = { "accept" }
    end
    local guides = {}
    if self.guide then guides[1] = self.guide end
    local pack = self.guide and self.guide.pack
    for _, g in Ding:IterateGuides(pack) do
        if g ~= self.guide and Ding:GuideMatchesPlayer(g) then guides[#guides + 1] = g end
    end
    for _, key in ipairs(wanted) do
        for _, g in ipairs(guides) do
            for index, step in ipairs(g.steps) do
                if Ding:StepApplies(step) then
                    for _, id in ipairs(step[key] or {}) do
                        if id == q then return { guide = g.id, index = index, action = key } end
                    end
                end
            end
        end
    end
    return nil
end

-- The step turns in the quest the player has just turned in: the player is at that step.
local JUST = 30    -- seconds: its next quest, from the same NPC, comes in that time
local function turnedInHere(step)
    local last = E.lastTurnIn
    if not last or GetTime() - last.at > JUST then return false end
    for _, q in ipairs(step.turnin or {}) do
        if q == last.quest then return true end
    end
    return false
end

-- "Take this guide up where I am" (E:Reset) stops on a quest of the route the character can
-- still take: not behind an option (an elite, a dungeon's, turned on since), not optional, open
-- to it now (level, prerequisites). What the player left behind on purpose passes.
local function stillToTake(step)
    if step.optional or step.dungeon then return false end
    for _, o in ipairs(STEP_OPTIONS) do
        if step[o.key] then return false end
    end
    for _, q in ipairs(step.accept or {}) do
        if not isAccepted(q) and not tooLow(q) and not isGrey(q) and not missingPrereq(q) then return true end
    end
    return false
end

-- Resuming: a step the player left behind (no work left on a quest in the log, before the
-- player's place) is passed. Not one where the player just turned a quest in: its next quest
-- comes a moment later, from the same NPC (in game, "Ormer's Revenge" turned in, its sequel
-- not taken yet: the resume passed the step that takes it and the one that completes it).
function E:LeftBehind(step, index)
    if not (self.resumeTo ~= nil and index < self.resumeTo and logKnown() and not backlog(step)
        and not turnedInHere(step)) then
        return false
    end
    return not (self.resumeStrict and stillToTake(step))
end

-- Why the guide passed a step for the character by itself, in a word the window says
-- (Panel, "Step passed: … — you are already there."): "there" (a trip whose place was
-- reached), "trip" (nothing left where it leads), "ahead" (the player is past it: later
-- progress), "marked" (done by hand before), "optional", "notneeded" (its conditions do
-- not hold), "done" (the game shows its quests done).
local SEEN = 2    -- seconds on a step before the window has shown it (its hold is 1.5 s)
local function passReason(step, index)
    if not Ding:StepApplies(step) then
        -- A step behind a condition the game no longer meets because its quest is done: a
        -- turn-in `when = { log = q }` once q is turned in (out of the log) was said "it does
        -- not concern you now" (in game, "The Cursed Crew" turned in, in the Wetlands).
        if hasQuestActions(step) and questActionsDone(step) then return "done" end
        return "notneeded"
    end
    if isManuallyDone(index) then return step.go and "there" or "marked" end
    if step.optional and not questActionsDone(step) then return "optional" end
    if travelOnly(step) and pointlessTrip(index, 0) then return "trip" end
    if step.go or step.sethearth or step.train or step.hearth or step.fly or not hasAutoActions(step) then
        return "ahead"
    end
    return "done"
end

-- Move forward over every finished step. Returns true if the step changed.
-- E.skipNotes: the quests passed (grey, level too low); E.passNotes: the steps for the
-- character the guide passed by itself in play, never shown ({ index, reason }): a number
-- that jumps is never silent. Not the step on screen (the window keeps it 1.5 s, done), unless
-- it had only just come; none while a guide is taken up (the first seconds after loading).
function E:Advance()
    if self.hold or not self.guide then return false end
    local startGuide, startIndex = self.guide, self.index
    local notes, passed = {}, {}
    local fresh = self.since ~= nil and GetTime() - self.since < SEEN
    local tell = not self:IsResuming() and not wrappingUp()
    while true do
        local step = self.guide.steps[self.index]
        if not step then
            local nextGuide = self:NextGuide(self.guide)
            if nextGuide then
                self.guide, self.index = nextGuide, 1
                Ding.char.guide = nextGuide.id
                Ding.char.pack = nextGuide.pack
                Ding.char.guideSig = signature(nextGuide)
                Ding.char.wrapUp = nil
                setResumeTo(nil)
            else
                self.finished = true
                break
            end
        elseif self:IsStepDone(step, self.index) then
            local before = #notes
            if Ding:StepApplies(step) then skipNotes(step, notes) end
            if tell and #notes == before and self.guide == startGuide and Ding:StepForCharacter(step)
                and (self.index > startIndex or fresh) then
                passed[#passed + 1] = { index = self.index, reason = passReason(step, self.index) }
            end
            self.index = self.index + 1
        elseif self:LeftBehind(step, self.index) then
            self.index = self.index + 1
        else
            self.finished = false
            break
        end
    end
    if self.resumeTo and self.index >= self.resumeTo then setResumeTo(nil) end
    saveStep(self.index)
    local moved = startGuide ~= self.guide or startIndex ~= self.index
    if moved then self.skipNotes, self.passNotes, self.since = notes, passed, GetTime() end
    return moved
end

-- The window still shows the step the engine just finished (Panel:EndHold): "next" and
-- "skip" only bring the step it moved to, which the player has not seen yet.
local function heldOnScreen()
    return Ding.Panel and Ding.Panel.EndHold and Ding.Panel:EndHold() or false
end

---------------------------------------------------------------------------
-- Browsing: "Previous" shows the steps before the guide's current step (E.browseFrom) one
-- at a time, done or not; "Next" then shows the step right after the one on screen (the next
-- one for the character's race, class and options), marking nothing, until the current step
-- is back. Only there does "Next" mean "mark done and move on".
---------------------------------------------------------------------------
function E:IsBrowsing()
    return self.hold and self.browseFrom ~= nil and self.index < self.browseFrom
end

-- Shows step `index`, before the guide's current step, without moving the guide ("Go to
-- step" on a step behind). False when it is not behind.
function E:BrowseTo(index)
    if not (self.guide and self.guide.steps[index]) then return false end
    local current = self.hold and self.browseFrom or self.index
    if index >= current then return false end
    endTrip()
    Ding.Timing:Cancel()
    self.browseFrom = current
    self.index, self.hold, self.finished, self.skipNotes, self.passNotes = index, true, false, nil, nil
    saveStep(index)
    self:Refresh()
    return true
end

-- "Next" while browsing: the step right after the one on screen.
local function browseNext()
    local steps, i = E.guide.steps, E.index + 1
    while i < E.browseFrom and not Ding:StepApplies(steps[i]) do i = i + 1 end
    E.index, E.skipNotes, E.passNotes = i, nil, nil
    if i >= E.browseFrom then
        -- The guide's current step again: it goes on as before (done meanwhile, it moves on).
        E.index, E.browseFrom, E.hold = E.browseFrom, nil, false
        E:Advance()
        Ding.Timing:Start(E.guide.id, E.index)
    else
        saveStep(i)
    end
    E:Refresh()
end

function E:Next()
    if not self.guide then return end
    local ended = endTrip()
    if heldOnScreen() then
        if ended then self:Refresh() end
        return
    end
    if self:IsBrowsing() then return browseNext() end
    self:MarkDone()
end

-- Marks the step on screen done and moves on to the next step still to do (the step menu's
-- "Mark as done"; "Next" on the guide's current step).
function E:MarkDone()
    if not self.guide then return end
    local ended = endTrip()
    if heldOnScreen() then
        if ended then self:Refresh() end
        return
    end
    if self.guide.steps[self.index] then
        Ding.Timing:Finish(self.guide.id, self.index)
        setManuallyDone(self.index, true)
        setSkipped(self.index, false)
        self.index = self.index + 1
    end
    -- The step it comes to was never on screen: passed at once, the window says so.
    self.hold, self.since, self.skipNotes, self.passNotes = false, GetTime(), nil, nil
    self:Advance()
    Ding.Timing:Start(self.guide.id, self.index)
    self:Refresh()
end

-- Leaves the step for later, without validating it: jumps to the next step still to do
-- (Advance passes the ones already done). The skipped step stays undone, and is not
-- timed; BackToIncomplete (or Prev) returns to it.
function E:Skip()
    if not self.guide or self.finished then return end
    local ended = endTrip()
    if heldOnScreen() then
        if ended then self:Refresh() end
        return
    end
    local step = self.guide.steps[self.index]
    if step and not self:IsStepDone(step, self.index) then setSkipped(self.index, true) end
    self.index = self.index + 1
    self.hold, self.since, self.skipNotes, self.passNotes = false, GetTime(), nil, nil
    self:Advance()
    Ding.Timing:Start(self.guide.id, self.index)
    self:Refresh()
end

-- Undoes "mark as done" or "skip, do it later" on a step (the current one by default): its
-- mark goes, it is to do again unless the game says it is done. Still to do, the guide goes
-- back to it (like BackToIncomplete); done, the guide goes on from where the player is.
-- Returns false when the step had no mark.
function E:Unmark(index)
    if not self.guide then return false end
    index = index or self.index
    if not self:StepMark(index) then return false end
    endTrip()
    setManuallyDone(index, false)
    setSkipped(index, false)
    local step = self.guide.steps[index]
    if step and not self:IsStepDone(step, index) and index ~= self.index then
        Ding.Timing:Cancel()
        setResumeTo(nil)
        self.index = index
        self.finished = false
        saveStep(index)
        Ding.Timing:Start(self.guide.id, index)
    end
    self.hold = false
    self:Advance()
    self:Refresh()
    return true
end

-- Back to the nearest earlier step still to do (one that was skipped). Returns false
-- when every earlier step is done.
function E:BackToIncomplete()
    if not self.guide then return false end
    endTrip()
    local steps = self.guide.steps
    local from = math.min(self.index, #steps + 1) - 1
    for i = from, 1, -1 do
        if not self:IsStepDone(steps[i], i) then
            Ding.Timing:Cancel()
            setResumeTo(nil)
            setSkipped(i, false)    -- the player comes back to do it
            self.index = i
            self.hold = false
            self.finished = false
            saveStep(i)
            Ding.Timing:Start(self.guide.id, i)
            self:Refresh()
            return true
        end
    end
    return false
end

function E:Prev()
    if not self.guide or self.index <= 1 then return end
    endTrip()
    Ding.Timing:Cancel()
    -- The guide's current step, kept while the player browses back (E:IsBrowsing).
    if not (self.hold and self.browseFrom) then self.browseFrom = self.index end
    self.index = self.index - 1
    -- Skip steps meant for other races or classes.
    while self.index > 1 and not Ding:StepApplies(self.guide.steps[self.index]) do
        self.index = self.index - 1
    end
    -- The step keeps how the player left it (marked done, skipped): the window shows it.
    self.skipNotes, self.passNotes = nil, nil
    self.hold = true
    self.finished = false
    saveStep(self.index)
    self:Refresh()
end

-- "Take this guide up where I am": forgets the steps validated by hand or skipped, then takes
-- the section up from its start to the character's place (a strict resume, E:LeftBehind): it
-- stops on what is really left there, a quest of the log with work left or a quest of the
-- route still to take; what the player left behind on purpose passes, the quests behind an
-- option turned on since included. In game (15/10/2026): "Elite quests" turned on, the button
-- sent the player from step 38 back to step 5, an elite quest never taken.
function E:Reset()
    if not self.guide then return end
    local id = self.guide.id
    local place = math.max(Ding.char.lastStep and Ding.char.lastStep[id] or 1,
        self.browseFrom or 1, self.index or 1)
    Ding.char.manual[id] = nil
    if Ding.char.skipped then Ding.char.skipped[id] = nil end
    if Ding.char.markKeys then Ding.char.markKeys[id] = nil end
    Ding.char.lastStep = Ding.char.lastStep or {}
    Ding.char.lastStep[id] = place
    if Ding.char.lastKey then Ding.char.lastKey[id] = nil end
    self:Resume(id, true, true)
end

-- At login the quest log arrives a moment later: the player is placed once it is there
-- (first QUEST_LOG_UPDATE, START_TIMEOUT at most), never from an empty log.
function E:Start()
    if not logKnown() then
        if not self.startPending then
            self.startPending = true
            C_Timer.After(START_TIMEOUT, function()
                if not self.startPending then return end
                self.logReady = true
                Ding:Safe(self.Start, self)
            end)
        end
        self:Refresh()
        return
    end
    self.startPending = false
    local id = Ding.char.guide
    local guide = id and Ding:GetGuide(id)
    if guide and Ding.char.guideSig and Ding.char.guideSig ~= signature(guide) then
        -- The guide changed since the last session: its step numbers moved.
        self.changedGuide = id
        self:Resume(id, true)
        self.changedGuide = nil
    elseif guide then
        local resume = Ding.char.resumeTo
        local mine = resume and resume.guide == id
        self:SetGuide(id, Ding.char.step or 1, true, mine and resume.step or nil, mine and resume.strict)
    else
        -- New character, or its guide is gone (a pack disabled or updated): a section of
        -- the character's pack when it is still there and has one for them, else Ding's.
        local suggested = Ding:SuggestGuide(Ding.char.pack) or Ding:SuggestGuide()
        if suggested then
            self:Resume(suggested.id)
        else
            self:Refresh()
        end
    end
end

-- Re-evaluate after any game state change.
-- A trip to a dungeon's entrance ends once the player is inside an instance: there the game
-- gives no position, and the step would stay on screen for the whole run (the "Enter ..."
-- steps of Ding! - Dungeon quests). Marked done like a point reached.
local function enteredDungeon()
    if E.hold or not Ding.Data.available then return end
    local step = E:CurrentStep()
    if not (step and step.go and not isManuallyDone(E.index) and Compat.InInstance()) then return end
    if Ding.Data:DungeonAtEntrance(step.go[1], step.go[2], step.go[3]) then setManuallyDone(E.index, true) end
end

function E:Update()
    if not self.guide then return end
    local oldGuide, oldIndex = self.guide.id, self.index
    enteredDungeon()
    local moved = self:Advance()
    if moved then
        Ding.Timing:Finish(oldGuide, oldIndex)
        Ding.Timing:Start(self.guide.id, self.index)
        if Ding.db.ui.sound then
            pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_QUEST_LIST_COMPLETE) or 618)
        end
    end
    -- The panel keeps a step the player just finished on screen a moment (not after "next").
    self.autoMoved = moved
    self:Refresh()
    self.autoMoved = false
end

function E:CurrentStep()
    return self.guide and self.guide.steps[self.index]
end

---------------------------------------------------------------------------
-- Waypoint selection
---------------------------------------------------------------------------
local function lower(s) return s and string.lower(s) or nil end

-- Is the objective of q that names `name` (a monster, an item...) finished? false when the
-- quest log has no such objective.
local function objectiveDone(live, name)
    name = lower(name)
    if not name then return false end
    for _, obj in ipairs(live) do
        local text = lower(obj.text)
        if text and text:find(name, 1, true) then return obj.finished == true end
    end
    return false
end
-- DingDB's targets of a quest, kept for matching only (their names and kinds, never handed
-- out): building them reads every spawn, and ObjectiveDone runs for each objective of each
-- quest a level step weighs (v1.7.1 built them each time: the smoke runs took 3.5 times as long).
local matchTargets = {}
local function targetsForMatch(q)
    local list = matchTargets[q]
    if not list then
        list = Ding.Data:ObjectiveTargets(q)
        matchTargets[q] = list
    end
    return list
end

-- The objective of q for its target named `name`: matched like the arrow's (Data:MatchObjectives,
-- by name, else by rank), so a monster without a name in the client's language counts too.
function E:ObjectiveDone(q, name)
    local live = Compat.GetObjectives(q)
    -- The name in the objective's text first: no list to build.
    local lname = lower(name)
    if lname then
        for _, obj in ipairs(live) do
            local text = lower(obj.text)
            if text and text:find(lname, 1, true) then return obj.finished == true end
        end
    end
    local targets = targetsForMatch(q)
    local byTarget = Ding.Data:MatchObjectives(targets, live)
    for i, target in ipairs(targets) do
        if target.name == name then
            local obj = byTarget[i] and live[byTarget[i]]
            return obj ~= nil and obj.finished == true
        end
    end
    return objectiveDone(live, name)
end

-- Objective targets of a quest that are not finished yet.
local function pendingTargets(q)
    local targets = Ding.Data:ObjectiveTargets(q)
    local live = Compat.GetObjectives(q)
    local byTarget = Ding.Data:MatchObjectives(targets, live)
    local pending = {}
    for i, target in ipairs(targets) do
        local obj = byTarget[i] and live[byTarget[i]]
        if not (obj and obj.finished == true) then pending[#pending + 1] = target end
    end
    if #pending == 0 then return targets end
    return pending
end

local function appendAll(dst, src)
    for _, p in ipairs(src) do dst[#dst + 1] = p end
end

---------------------------------------------------------------------------
-- Persistent objectives: a step's `sticky` quests keep their unfinished objectives listed
-- under every following step (Core/Along.lua) and as low-priority arrow targets, while
-- they are in the log and not ready; remembered per character until turned in.
---------------------------------------------------------------------------
local function asList(v)
    if v == nil then return {} end
    if type(v) == "table" then return v end
    return { v }
end

local function stickySet()
    Ding.char.sticky = Ding.char.sticky or {}
    return Ding.char.sticky
end

-- The sticky quests of the steps reached so far join the set; turned-in ones leave it, and
-- so do the ones the active guide only makes sticky further on (the player went back to an
-- earlier step): never "Still to do" before its step. Those of an earlier section stay.
function E:NoteSticky()
    if not self.guide then return end
    local set = stickySet()
    local reached = {}    -- [q] = true when a step up to the current one makes q sticky
    for i, s in ipairs(self.guide.steps) do
        if s.sticky and Ding:StepApplies(s) then
            for _, q in ipairs(asList(s.sticky)) do
                if type(q) == "number" then reached[q] = reached[q] or i <= self.index end
            end
        end
    end
    for q, now in pairs(reached) do set[q] = now or nil end
    for q in pairs(set) do
        if isTurnedIn(q) then set[q] = nil end
    end
end

-- Sticky quests to show now: in the log, objectives not all done.
function E:StickyQuests()
    local out = {}
    for q in pairs(stickySet()) do
        if Compat.IsInLog(q) and not isReady(q) then out[#out + 1] = q end
    end
    table.sort(out)
    return out
end

-- Their objectives' targets, as low-priority points (not those of the step itself).
function E:StickyPoints(step)
    local inStep, out = {}, {}
    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        for _, q in ipairs(step and step[key] or {}) do inStep[q] = true end
    end
    for _, q in ipairs(self:StickyQuests()) do
        if not inStep[q] then
            for _, target in ipairs(pendingTargets(q)) do
                for _, p in ipairs(target.points) do
                    p.low = true
                    out[#out + 1] = p
                end
            end
        end
    end
    return out
end

-- Candidate points of the step's unfinished actions: the NPCs to turn in to, the quest
-- givers and the objectives' targets, all together (the arrow takes the nearest: they can be
-- done in any order); else the NPCs of turn-ins still waiting on their objectives, else the
-- step's place. A level step: the grinding spot (Core/Grind.lua), else the next place.
-- A step with quests also offers the persistent objectives, at a lower priority.
function E:Candidates(step, index)
    local points = self:StepCandidates(step, index)
    if step and hasQuestActions(step) and #points > 0 then
        for _, p in ipairs(self:StickyPoints(step)) do points[#points + 1] = p end
    end
    return points
end

function E:StepCandidates(step, index)
    local points = {}
    if not step then return points end

    -- A patrol: the arrow goes round its points, one after the other.
    if step.patrol and not self:StepPartsDone(step, index or self.index) then
        local p = self:PatrolPoint(step, index or self.index)
        if p then return { p } end
    end
    if not self:LevelReached(step) and not hasQuestActions(step) then
        local spot = Ding.Grind:Spot(index or self.index)
        if spot then return spot.points end
    end
    -- A service step (trainer, vendor, repair, flight master) with no place of its own: the
    -- nearest NPCs that offer it.
    if not step.go and not hasQuestActions(step) and Ding.Services:StepKind(step) then
        return Ding.Services:StepPoints(step)
    end

    for _, q in ipairs(step.turnin or {}) do
        if not isTurnedIn(q) and isReady(q) then
            appendAll(points, Ding.Data:EndPoints(q))
        end
    end

    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        for _, q in ipairs(step[key] or {}) do
            if needsPickup(q) then
                local p = self:CatchUp(q, step)
                if not p then
                    appendAll(points, Ding.Data:StartPoints(q))
                elseif isReady(p) then
                    appendAll(points, Ding.Data:EndPoints(p))
                elseif isAccepted(p) then
                    local before = #points
                    for _, target in ipairs(pendingTargets(p)) do appendAll(points, target.points) end
                    -- Nothing to kill or collect (a message to deliver...): its turn-in NPC.
                    if #points == before then appendAll(points, Ding.Data:EndPoints(p)) end
                elseif not tooLow(p) then
                    appendAll(points, Ding.Data:StartPoints(p))
                end
            end
        end
    end

    -- Objectives to finish: the step's `complete` quests, and the quests it turns in that are
    -- not ready yet (never straight to the turn-in of a quest whose objectives are not done:
    -- in game, "Ormer's Revenge" without its raptor's talon).
    local working = {}
    for _, key in ipairs({ "complete", "turnin" }) do
        for _, q in ipairs(step[key] or {}) do
            if not working[q] and isAccepted(q) and not isReady(q) then
                working[q] = true
                for _, target in ipairs(pendingTargets(q)) do appendAll(points, target.points) end
            end
        end
    end
    -- Goals without a quest: their monsters, items' sources, NPCs, objects, vendors.
    appendAll(points, Ding.Goals:Points(step, index or self.index))
    if #points > 0 then return points end

    -- Turn-ins whose objectives are not done yet (the guide expects them done by now).
    for _, q in ipairs(step.turnin or {}) do
        if isAccepted(q) and not isTurnedIn(q) then appendAll(points, Ding.Data:EndPoints(q)) end
    end
    if #points > 0 then return points end

    if step.go then
        points[1] = { map = step.go[1], x = step.go[2], y = step.go[3], label = step.text, isGo = true }
    elseif step.level and self.guide and not self:LevelReached(step) then
        -- No monster to suggest: grind on the way to the next place of the guide.
        local steps = self.guide.steps
        local from = index or self.index
        for i = from + 1, math.min(#steps, from + LOOKAHEAD) do
            local s = steps[i]
            if Ding:StepApplies(s) and not s.level then
                for _, p in ipairs(self:Candidates(s, i)) do
                    -- Reaching that place must not validate the level step.
                    points[#points + 1] = { map = p.map, x = p.x, y = p.y, label = p.label, area = p.area }
                end
                if #points > 0 then break end
            end
        end
    end
    return points
end

local function worldOf(p)
    if p.continent == nil then
        local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
        p.continent, p.wx, p.wy = c or false, wx, wy
    end
    return p.continent, p.wx, p.wy
end

-- Nearest candidate to the player (or of `points`), with its distance in yards.
-- Low-priority points (persistent objectives) count as twice as far, plus LOW_PENALTY:
-- the arrow takes them only when they are right there and the step's targets are not.
local LOW_PENALTY = 300

-- `prefer`: the label of the target the arrow already follows. It stays while no other is
-- clearly nearer (under STICK_RATIO of its distance and STICK_YARDS closer): two objectives
-- side by side do not make the arrow flip from one to the other as the player walks.
local STICK_RATIO, STICK_YARDS = 0.5, 40
E.STICK_RATIO, E.STICK_YARDS = STICK_RATIO, STICK_YARDS

function E:NearestPoint(points, prefer)
    points = points or self.candidates
    if not points or #points == 0 then return nil end
    local continent, px, py = Compat.GetPlayerWorld()
    if not continent then return points[1], nil end
    local best, bestCost, bestDist
    local kept, keptCost, keptDist
    for _, p in ipairs(points) do
        local c, wx, wy = worldOf(p)
        if c == continent and wx then
            local d = math.sqrt((wx - px) ^ 2 + (wy - py) ^ 2)
            local cost = p.low and (d * 2 + LOW_PENALTY) or d
            if not bestCost or cost < bestCost then best, bestCost, bestDist = p, cost, d end
            if prefer and p.label == prefer and (not keptCost or cost < keptCost) then
                kept, keptCost, keptDist = p, cost, d
            end
        end
    end
    if not best then return points[1], nil, true end
    if kept and kept ~= best and not (bestCost < keptCost * STICK_RATIO and keptCost - bestCost > STICK_YARDS) then
        return kept, keptDist
    end
    return best, bestDist
end

-- The NPCs and monsters of the step's unfinished actions (the NPC to talk to, objective
-- monsters, the monster to farm), by name, nearest first, at most `max`: what the target
-- binding aims at.
function E:TargetNames(max, points)
    points = points or self.candidates or {}
    local continent, px, py = Compat.GetPlayerWorld()
    local best = {}
    for _, p in ipairs(points) do
        if p.npc and p.label and not p.low then
            local c, wx, wy = worldOf(p)
            local d = math.huge
            if continent and c == continent and wx then d = (wx - px) ^ 2 + (wy - py) ^ 2 end
            if not best[p.label] or d < best[p.label] then best[p.label] = d end
        end
    end
    local names = {}
    for name in pairs(best) do names[#names + 1] = name end
    table.sort(names, function(a, b)
        if best[a] ~= best[b] then return best[a] < best[b] end
        return a < b
    end)
    for i = #names, (max or 3) + 1, -1 do names[i] = nil end
    return names
end

---------------------------------------------------------------------------
-- Zones: where a target is, when it is not where the player is
---------------------------------------------------------------------------
local zoneOfMap = {}    -- [uiMapID] = { id, name } of its zone, or false (session cache)

function E:ZoneOf(map)
    if type(map) ~= "number" then return nil end
    local z = zoneOfMap[map]
    if z == nil then
        local id, name = Compat.ZoneOf(map)
        z = id and { id = id, name = name } or false
        zoneOfMap[map] = z
    end
    return z or nil
end

-- The player's zone, looked up once a second at most.
function E:PlayerZone()
    local now = GetTime()
    if not self.playerZoneAt or now - self.playerZoneAt >= 1 then
        self.playerZoneAt = now
        local map = Compat.PlayerMap()
        self.playerZone = map and self:ZoneOf(map) or nil
    end
    return self.playerZone
end

-- The localized name of a point's zone (the parent zone for a sub-map), when it is not the
-- player's zone; nil when it is, or when the client cannot tell.
function E:ZoneLabel(point)
    if type(point) ~= "table" then return nil end
    local z = self:ZoneOf(point.map)
    if not (z and z.name) then return nil end
    local here = self:PlayerZone()
    if here and here.id == z.id then return nil end
    return z.name
end

-- Called by the arrow a few times per second.
function E:OnPosition(distance, point)
    local step = self:CurrentStep()
    -- A patrol point reached: on to the next one.
    if step and point and point.patrol and distance and distance <= (step.radius or DEFAULT_RADIUS) then
        self:NextPatrolPoint(step, self.index)
        return
    end
    -- After "previous", stay on the step until "next", even when standing on the spot.
    if self.hold or not step or not point or not point.isGo or not distance then return end
    if distance <= (step.radius or DEFAULT_RADIUS) then
        setManuallyDone(self.index, true)
        self.hold = false
        self:Update()
    end
end

---------------------------------------------------------------------------
-- Text for the panel
---------------------------------------------------------------------------
local ICON = {
    accept = "Interface\\GossipFrame\\AvailableQuestIcon",
    turnin = "Interface\\GossipFrame\\ActiveQuestIcon",
    complete = "Interface\\Icons\\Ability_DualWield",
    go = "Interface\\Icons\\INV_Misc_Map_01",
    level = "Interface\\Icons\\Spell_Holy_SurgeOfLight",
    other = "Interface\\Icons\\INV_Misc_Note_01",
}

local function questLabel(q)
    return "|cffffd100" .. Ding.Data:QuestName(q) .. "|r"
end

local function acceptLine(q, level)
    local who = Ding.Data:StarterName(q)
    local text = L.ACCEPT .. " " .. questLabel(q) .. (who and (" — " .. L.FROM .. " " .. who) or "")
    local req = Ding.Data:QuestRequiredLevel(q)
    local low = req > level and not isAccepted(q)
    if low then
        text = text .. " |cffff3333(" .. L.LEVEL_REQUIRED:format(req) .. ")|r"
    end
    return { icon = ICON.accept, action = "accept", quest = q, done = isAccepted(q), text = text,
        dim = low or nil, requires = low and req or nil }
end

-- Returns { { icon=, text=, done=bool, indent=bool, kind=, dim=bool, impossible=bool }, ... }
-- kind tells indented lines apart: "objective" (default), "note" or "hint".
-- dim: the action cannot be done yet (level too low, `requires` = that level).
-- impossible: the quest is not in the log (pick it up first).
-- Main lines also say what they are: action ("accept", "turnin", "complete", "level",
-- "grind", "go" or "manual"), quest, and prequestOf (the quest a catch-up line is for).
-- The level line of the current step has a counter (percent of the level) and a sub-line
-- (experience and kills left); "grind" is the monster to farm (npc, name, minLevel,
-- maxLevel, and quest when a quest of the log needs it).
-- preview: describe a step ahead of the current one (no pick-up reminders).
function E:Describe(step, preview)
    local lines = {}
    if not step then return lines end
    local level = UnitLevel("player")

    -- A quest that needs an earlier quest of its chain first: that one comes first, said
    -- as what is left to do on it (take, complete or turn in).
    local caught = {}
    local function catchUpLines(q)
        local p = not preview and self:CatchUp(q, step)
        if not p or caught[p] then return nil end
        caught[p] = true
        local tag = " |cffbfbfbf(" .. L.PREQUEST_OF:format(Ding.Data:QuestName(q)) .. ")|r"
        if isReady(p) then
            local who = Ding.Data:FinisherName(p)
            lines[#lines + 1] = { icon = ICON.turnin, action = "turnin", quest = p, prequestOf = q,
                text = L.TURNIN .. " " .. questLabel(p) .. (who and (" — " .. L.TO .. " " .. who) or "") .. tag }
        elseif isAccepted(p) then
            lines[#lines + 1] = { icon = ICON.complete, action = "complete", quest = p, prequestOf = q,
                text = L.COMPLETE .. " " .. questLabel(p) .. tag }
            for _, obj in ipairs(Compat.GetObjectives(p)) do
                if obj.text and not obj.finished then
                    lines[#lines + 1] = { indent = true, kind = "objective", text = obj.text }
                end
            end
        else
            local l = acceptLine(p, level)
            l.text = l.text .. tag
            l.prequestOf = q
            lines[#lines + 1] = l
        end
        return p
    end
    -- An accept line for a quest that waits on its chain: red, it cannot be taken yet.
    local function blockedAccept(q)
        local l = acceptLine(q, level)
        if not l.done and catchUpLines(q) then l.impossible = true end
        return l
    end

    -- Quests to turn in or work on that are not in the log: pick them up first.
    if not preview then
        for _, key in ipairs({ "turnin", "complete" }) do
            for _, q in ipairs(step[key] or {}) do
                if not isAccepted(q) and not isGrey(q) then
                    local l = blockedAccept(q)    -- may add catch-up lines first
                    lines[#lines + 1] = l
                end
            end
        end
    end
    -- A quest to turn in or work on that is not in the log cannot be done yet.
    local function impossible(q) return not preview and not isAccepted(q) or nil end
    local completes = {}
    for _, q in ipairs(step.complete or {}) do completes[q] = true end
    for _, q in ipairs(step.turnin or {}) do
        -- In the log, its objectives not done: they come first, never a bare "turn in" (in
        -- game, "Ormer's Revenge" without its raptor's talon).
        if not completes[q] and Compat.IsInLog(q) and not isReady(q) then
            lines[#lines + 1] = { icon = ICON.complete, action = "complete", quest = q, done = false,
                text = L.COMPLETE .. " " .. questLabel(q) }
            for _, obj in ipairs(Compat.GetObjectives(q)) do
                if obj.text and not obj.finished then
                    lines[#lines + 1] = { indent = true, kind = "objective", text = obj.text }
                end
            end
        end
        local who = Ding.Data:FinisherName(q)
        lines[#lines + 1] = { icon = ICON.turnin, action = "turnin", quest = q, done = isTurnedIn(q),
            impossible = impossible(q),
            text = L.TURNIN .. " " .. questLabel(q) .. (who and (" — " .. L.TO .. " " .. who) or "") }
    end
    for _, q in ipairs(step.accept or {}) do
        local l = blockedAccept(q)
        lines[#lines + 1] = l
    end
    for _, q in ipairs(step.complete or {}) do
        local ready = isReady(q)
        lines[#lines + 1] = { icon = ICON.complete, action = "complete", quest = q, done = ready,
            impossible = impossible(q), text = L.COMPLETE .. " " .. questLabel(q) }
        if not ready then
            for _, obj in ipairs(Compat.GetObjectives(q)) do
                if obj.text and not obj.finished then
                    lines[#lines + 1] = { indent = true, kind = "objective", text = obj.text }
                end
            end
        end
    end
    if step.level then
        local _, max = Compat.PlayerXP()
        local whole, into = Ding.Grind:Into(step, max)
        local text = L.REACH_LEVEL:format(whole)
        if step.xp then
            text = L.REACH_LEVEL_XP:format(whole, Compat.Number(step.xp))
        elseif into > 0 then
            text = L.REACH_LEVEL_PART:format(whole, math.floor((step.level - whole) * 100 + 0.5))
        end
        local line = { icon = ICON.level, action = "level", done = self:LevelReached(step), text = text }
        lines[#lines + 1] = line
        -- Guided grinding: experience and kills left, and the monster to farm.
        local current = not preview and not line.done and step == self:CurrentStep()
        local status = current and Ding.Grind:Status(whole, into)
        if status then
            line.counter = L.LEVEL_PERCENT:format(status.percent)
            line.sub = (status.rested and L.LEVEL_LEFT_RESTED or L.LEVEL_LEFT):format(Compat.Number(status.missing),
                status.kills)
        end
        local spot = current and not hasQuestActions(step) and Ding.Grind:Spot(self.index)
        if spot then
            lines[#lines + 1] = { icon = ICON.complete, action = "grind", npc = spot.npc, quest = spot.quest,
                name = spot.name, minLevel = spot.minLevel, maxLevel = spot.maxLevel,
                text = L.ROW_KILL:format(spot.name or "?") }
        end
    end
    if step.sethearth then
        -- The place in the player's language (the guide's translation); `true`: the inn here.
        local place = step.sethearthText or (type(step.sethearth) == "string" and step.sethearth or nil)
        lines[#lines + 1] = { icon = ICON.other, action = "manual",
            text = place and L.SETHEARTH:format(place) or L.SETHEARTH_HERE }
    end
    if step.train then
        lines[#lines + 1] = { icon = ICON.other, action = "manual", text = type(step.train) == "string" and step.train or L.TRAIN }
    end
    if step.hearth then
        local bind = Compat.BindLocation()
        lines[#lines + 1] = { icon = ICON.other, action = "manual", text = bind and L.HEARTH_TO:format(bind) or L.HEARTH }
    end
    if step.fly then
        lines[#lines + 1] = { icon = ICON.other, action = "manual", text = type(step.fly) == "string" and step.fly or L.FLY }
    end
    if step.vendor then
        lines[#lines + 1] = { icon = ICON.other, action = "manual", text = type(step.vendor) == "string" and step.vendor or L.VENDOR }
    end
    if step.repair then
        lines[#lines + 1] = { icon = ICON.other, action = "manual", text = type(step.repair) == "string" and step.repair or L.REPAIR }
    end
    -- Goals without a quest (Core/Goals.lua), one line each.
    if Ding.Goals:Of(step) then
        local index = self.index
        if step ~= self:CurrentStep() and self.guide then
            for i, s in ipairs(self.guide.steps) do
                if s == step then index = i end
            end
        end
        Ding.Goals:Lines(step, index, lines)
    end
    if step.go or ((step.text or step.deathskip) and #lines == 0) then
        local text = step.text or (step.deathskip and L.DEATHSKIP)
        if not text and step.go then text = ("%s %.1f, %.1f"):format(L.GO, step.go[2], step.go[3]) end
        lines[#lines + 1] = { icon = step.go and ICON.go or ICON.other, action = step.go and "go" or "manual", text = text }
    elseif step.text then
        lines[#lines + 1] = { indent = true, kind = "note", text = step.text }
    end
    -- Steps behind an option (Ding:StepApplies): what they ask of the player.
    if step.deathskip then lines[#lines + 1] = { indent = true, kind = "hint", text = L.DEATHSKIP_HINT } end
    if step.dungeon then
        lines[#lines + 1] = { indent = true, kind = "hint", text = L.DUNGEON_STEP:format(tostring(step.dungeon)) }
    end
    if step.elite then lines[#lines + 1] = { indent = true, kind = "hint", text = L.ELITE_STEP } end
    if type(step.patrol) == "table" and #step.patrol > 1 then
        lines[#lines + 1] = { indent = true, kind = "hint", text = L.PATROL_HINT:format(#step.patrol) }
    end
    if step.optional then
        local suffix = " |cffbfbfbf" .. L.OPTIONAL .. "|r"
        local first = lines[1]
        if first and not first.indent then
            first.text = first.text .. suffix
        else
            table.insert(lines, 1, { indent = true, kind = "hint", text = L.OPTIONAL })
        end
    end
    if step.note then
        lines[#lines + 1] = { indent = true, kind = "note", text = step.note }
    end
    return lines
end

-- Steps only the player can validate, with "next" (go, sethearth and deathskip validate
-- themselves).
function E:IsManual(step)
    if not step then return false end
    if step.deathskip then return false end
    if step.train or step.hearth or step.fly then return true end
    return not (hasAutoActions(step) or step.go or step.sethearth)
end

---------------------------------------------------------------------------
-- Section wrap-up: past the section's maxLevel, the player picks "Next section", "Turn in
-- first" (only the turn-in steps of the quests still in the log, then the next section) or
-- "Stay" (remembered for this section).
---------------------------------------------------------------------------
-- { next = guide, turnins = steps to turn in } when the offer stands, else nil.
function E:WrapUpOffer()
    local guide = self.guide
    if not guide or self.finished or wrappingUp() then return nil end
    if UnitLevel("player") <= (guide.maxLevel or 60) then return nil end
    if Ding.char.stay and Ding.char.stay[guide.id] then return nil end
    local nextGuide = self:NextGuide(guide)
    if not nextGuide then return nil end
    local turnins = 0
    for i = self.index, #guide.steps do
        local s = guide.steps[i]
        if Ding:StepApplies(s) and pendingTurnIn(s) then turnins = turnins + 1 end
    end
    return { next = nextGuide, turnins = turnins }
end

function E:WrapUp(choice)
    local offer = self:WrapUpOffer()
    if not offer then return false end
    if choice == "next" then
        return self:Resume(offer.next.id)
    elseif choice == "turnin" then
        Ding.char.wrapUp = self.guide.id
        self.hold = false
        self:Update()
    elseif choice == "stay" then
        Ding.char.stay = Ding.char.stay or {}
        Ding.char.stay[self.guide.id] = true
        self:Refresh()
    end
    return true
end

-- The next steps still to do after the current one (preview), `count` at most: the ones
-- "next" goes to, one after the other (not those a resume passes).
function E:NextSteps(count)
    local out, steps = {}, self.guide and self.guide.steps or {}
    local browsing = self:IsBrowsing()
    for i = self.index + 1, #steps do
        if #out >= count then break end
        local s = steps[i]
        -- Browsing back: up to the guide's current step, every step for the character.
        local shown
        if browsing and i < self.browseFrom then
            shown = Ding:StepApplies(s)
        else
            shown = not self:IsStepDone(s, i) and not self:LeftBehind(s, i)
        end
        if shown then out[#out + 1] = s end
    end
    return out
end

-- What completes a service step by itself, for the window's hint: "window" (the trainer's
-- or merchant's window closed), "flight" (the flight path known), or nil.
function E:ServiceDone(step)
    if not step then return nil end
    if step.train or step.vendor or step.repair then return "window" end
    if step.fly then return "flight" end
    return nil
end

-- Short one-line summary, used for the "next step" preview.
function E:Summary(step)
    local first = self:Describe(step, true)[1]
    return first and first.text or ""
end

---------------------------------------------------------------------------
-- Refresh
---------------------------------------------------------------------------
function E:Refresh()
    local step = self:CurrentStep()
    Ding:Safe(Ding.Goals.Track, Ding.Goals)
    self:NoteSticky()
    self.candidates = Ding.Data.available and self:Candidates(step, self.index) or {}
    if Ding.Along then Ding:Safe(Ding.Along.Refresh, Ding.Along) end
    if Ding.QuestMobs then Ding:Safe(Ding.QuestMobs.Refresh, Ding.QuestMobs) end
    -- Each display on its own: one failing must not stop the others nor the engine.
    if Ding.Panel and Ding.Panel.Update then Ding:Safe(Ding.Panel.Update, Ding.Panel) end
    if Ding.Arrow and Ding.Arrow.Update then Ding:Safe(Ding.Arrow.Update, Ding.Arrow) end
    if Ding.Config and Ding.Config.OnEngineRefresh then Ding:Safe(Ding.Config.OnEngineRefresh, Ding.Config) end
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
local pending = false
local function scheduleUpdate()
    if pending then return end
    pending = true
    C_Timer.After(0.2, function()
        pending = false
        Ding:Safe(E.Update, E)
    end)
end
E.ScheduleUpdate = scheduleUpdate

Ding:On("QUEST_TURNED_IN", function(_, questID)
    if questID then
        E.turnedIn[questID] = true
        E.lastTurnIn = { quest = questID, at = GetTime() }
    end
    scheduleUpdate()
end)
Ding:On("QUEST_ACCEPTED", scheduleUpdate)
Ding:On("QUEST_LOG_UPDATE", function()
    E.logReady = true
    if E.startPending then Ding:Safe(E.Start, E) else scheduleUpdate() end
end)
Ding:On("QUEST_REMOVED", scheduleUpdate)
Ding:On("PLAYER_LEVEL_UP", scheduleUpdate)
-- Steps with conditions (`when`): the bags may change them.
local hasConditions = setmetatable({}, { __mode = "k" })
Ding:On("BAG_UPDATE", function()
    local guide = E.guide
    if not guide then return end
    local any = hasConditions[guide]
    if any == nil then
        any = false
        for _, step in ipairs(guide.steps) do
            if step.when then any = true end
        end
        hasConditions[guide] = any
    end
    if any then scheduleUpdate() end
end)
-- A level step shows the experience and the kills left: each kill updates it.
Ding:On("PLAYER_XP_UPDATE", function()
    local step = E:CurrentStep()
    if step and step.level then scheduleUpdate() end
end)
Ding:On("ZONE_CHANGED_NEW_AREA", scheduleUpdate)
Ding:On("PLAYER_ENTERING_WORLD", scheduleUpdate)
Ding:On("HEARTHSTONE_BOUND", function()
    local step = E:CurrentStep()
    if step and step.sethearth then
        Ding.char.hearthInn = { inn = step.sethearth, name = Compat.BindLocation() }
        setManuallyDone(E.index, true)
        scheduleUpdate()
    end
end)

-- Service steps: a class trainer's window (train) or a merchant's (vendor, repair) opened
-- during the step, then closed; a flight master's map opened, or a new flight path found
-- (fly). "Next" works as before.
local function serviceDone(test)
    local step = E:CurrentStep()
    if step and not E.hold and test(step) then
        setManuallyDone(E.index, true)
        scheduleUpdate()
        return true
    end
    return false
end
Ding:On("TRAINER_SHOW", function()
    local step = E:CurrentStep()
    E.professionWindow = Compat.ProfessionTrainer()
    if step and step.train and not E.professionWindow then
        E.serviceWindow = { guide = E.guide, index = E.index }
    end
end)
Ding:On("MERCHANT_SHOW", function()
    local step = E:CurrentStep()
    if step and (step.vendor or step.repair) then E.serviceWindow = { guide = E.guide, index = E.index } end
end)
local function windowClosed()
    local w = E.serviceWindow
    E.serviceWindow = nil
    if not w then return end
    serviceDone(function() return w.guide == E.guide and w.index == E.index end)
end
Ding:On("TRAINER_CLOSED", function()
    E.professionWindow = nil
    windowClosed()
end)
-- A spell learned during a `train` step (at a class trainer, or any other way) ends it too;
-- not a recipe at a profession trainer.
Ding:On("LEARNED_SPELL_IN_TAB", function()
    if E.professionWindow then return end
    serviceDone(function(step) return step.train end)
end)
Ding:On("MERCHANT_CLOSED", windowClosed)
Ding:On("TAXIMAP_OPENED", function()
    serviceDone(function(step) return step.fly end)
end)
Ding:On("UI_INFO_MESSAGE", function(_, _, message)
    local text = Compat.Plain(message)
    if text ~= nil and text == ERR_NEWTAXIPATH then serviceDone(function(step) return step.fly end) end
end)

-- A `hearth` step validates itself when the player casts the hearthstone.
Ding:On("UNIT_SPELLCAST_SUCCEEDED", function(_, unit, _, spellID)
    if unit ~= "player" or Compat.Plain(spellID) ~= HEARTHSTONE_SPELL then return end
    local step = E:CurrentStep()
    if step and step.hearth and not E.hold then
        setManuallyDone(E.index, true)
        scheduleUpdate()
    end
end)

-- Death skip: the step is done once the player died during it and is alive again (spirit
-- healer, or back to the corpse). Remembered per character: a reload may come in between.
Ding:On("PLAYER_DEAD", function()
    local step = E:CurrentStep()
    if step and step.deathskip and E.guide then
        Ding.char.deathskip = { guide = E.guide.id, step = E.index }
    end
end)
local function backToLife()
    local died = Ding.char and Ding.char.deathskip
    if not died or Compat.IsDeadOrGhost() then return end
    Ding.char.deathskip = nil
    if E.guide and died.guide == E.guide.id and died.step == E.index then
        setManuallyDone(E.index, true)
        E.hold = false
        scheduleUpdate()
    end
end
Ding:On("PLAYER_ALIVE", backToLife)
Ding:On("PLAYER_UNGHOST", backToLife)
