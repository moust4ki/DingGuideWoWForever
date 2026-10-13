-- Guide window (screen 01 of docs/UI-handoff.md): title bar, step bar, the rows of the
-- current step and the guide progress; or the one-line minimized version. Plain
-- (non-secure) frames only, so it can be shown, hidden, minimized and moved in combat.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C
local Compat = Ding.Compat

local P = {}
Ding.Panel = P

local WIDTH, MIN_WIDTH, MAX_WIDTH = 300, 240, 420
local MIN_SCALE, MAX_SCALE = 0.5, 1.5
local TITLE_HEIGHT, STEP_HEIGHT = 24, 28
local LIST_TOP = TITLE_HEIGHT + 1 + STEP_HEIGHT + 1
local LIST_PAD, ROW_GAP = 4, 2
local ROW_PAD_X, ROW_PAD_Y, ROW_GAP_X, ICON = 6, 4, 8, 16
local COUNTER_MIN = 28
local COMPACT_HEIGHT = 28
local HOLD = 1.5             -- seconds a finished step stays on screen
local LOG_ALMOST_FULL = 16   -- quests in the log (20 at most) from which unused ones are pointed out
local FOCUS_KEYS = { "PADDUP", "PADDDOWN", "PAD1", "PAD2", "PAD3", "PAD4", "PADLSHOULDER", "PADRSHOULDER",
    "PADFORWARD", "PADDLEFT", "PADDRIGHT" }

-- Row looks by state (design: done / to do / impossible).
local STATES = {
    done = { row = C.doneRowBg, icon = C.doneIconBg, glyph = C.done, text = C.secondary, counter = C.done },
    todo = { row = C.todoRowBg, icon = C.todoIconBg, glyph = C.todo, text = C.text, counter = C.todo },
    impossible = { icon = C.impossibleIconBg, glyph = C.disabled, text = C.disabled, counter = C.disabled },
    -- A step left by hand (Engine:StepMark): what is not really done takes the mark's color.
    manual = { row = C.manualRowBg, icon = C.manualIconBg, glyph = C.manual, text = C.secondary, counter = C.manual },
    skipped = { row = C.skippedRowBg, icon = C.skippedIconBg, glyph = C.skipped, text = C.text, counter = C.skipped },
    -- A step further on (preview of the next steps): dimmed, no background.
    preview = { icon = C.impossibleIconBg, glyph = C.disabled, text = C.muted, counter = C.disabled },
}

local function clamp(v, low, high) return math.max(low, math.min(high, v)) end

local function inInstance()
    local ok, inside = pcall(IsInInstance)
    return ok and inside and true or false
end

local function link(s) return UI.Colored("accent", s) end
local function quoted(q) return L.QUOTE:format(Ding.Data:QuestName(q)) end

-- A quest above the player's level is shown, never held back (Yendi): its name in orange,
-- with its level. `plain`: the name without the blue of a link otherwise (sub-lines).
local function questName(q, plain)
    local level = Ding.Data:QuestLevel(q)
    if level > 0 and level > UnitLevel("player") then
        return UI.Colored("above", quoted(q) .. " · " .. L.QUEST_LEVEL:format(level))
    end
    return plain and quoted(q) or link(quoted(q))
end

-- The quest with its level first, "[29] “Name”" (the next steps' preview).
local function leveledName(q)
    local level = Ding.Data:QuestLevel(q)
    return level > 0 and L.QUEST_WITH_LEVEL:format(level, quoted(q)) or quoted(q)
end

---------------------------------------------------------------------------
-- Rows: what the window lists for the current step
---------------------------------------------------------------------------
-- Lua pattern from a client format string (Compat.FormatPattern).
local formatPattern = Compat.FormatPattern
P.FormatPattern = formatPattern

local patterns
local function objectivePatterns()
    if not patterns then
        patterns = {}
        for _, name in ipairs({ "QUEST_MONSTERS_KILLED", "QUEST_ITEMS_NEEDED", "QUEST_OBJECTS_FOUND" }) do
            patterns[#patterns + 1] = formatPattern(_G[name])
        end
    end
    return patterns
end
-- Tests change the client strings: the patterns are built again on next use.
function P.ResetObjectivePatterns() patterns = nil end

-- "Mottled Boar slain: 2/6" -> "Mottled Boar", in the client's language.
local function objectiveName(obj)
    local text = obj.text or ""
    for _, pattern in ipairs(objectivePatterns()) do
        local ok, name = pcall(string.match, text, pattern)
        if ok and name and name ~= "" then return name end
    end
    local name = text:gsub("%s*:?%s*%d+%s*/%s*%d+%s*$", "")
    return name
end
P.ObjectiveName = objectiveName

local function objectiveCount(obj)
    local have, need = tonumber(obj.numFulfilled), tonumber(obj.numRequired)
    if not need then
        local a, b = (obj.text or ""):match("(%d+)%s*/%s*(%d+)%s*$")
        have, need = tonumber(a), tonumber(b)
    end
    return have, need
end

local VERBS = {
    kill = { L.ROW_KILL, L.ROW_KILL_N, L.ROW_KILLED, L.ROW_KILLED_N },
    collect = { L.ROW_COLLECT, L.ROW_COLLECT_N, L.ROW_COLLECTED, L.ROW_COLLECTED_N },
}

-- One row per objective of a quest in the log, finished ones included. `questDone`: the
-- quest is ready to turn in or turned in, so every objective is done whatever the client
-- says (a turned-in quest reports its objectives at 0, and `finished` can be secret).
local function objectiveRows(q, itemID, itemQuest, questDone)
    local rows = {}
    local useItem = itemID and itemQuest == q
    for i, obj in ipairs(Compat.GetObjectives(q)) do
        if obj.text and obj.text ~= "" then
            local name = objectiveName(obj)
            local have, need = objectiveCount(obj)
            local kind = obj.type == "monster" and "kill" or (obj.type == "item" and "collect" or "objective")
            local done = (questDone or obj.finished or (have and need and need > 0 and have >= need)) and true or false
            local row = { action = "objective", kind = kind, quest = q, target = name, index = i,
                state = done and "done" or "todo" }
            local verbs = VERBS[kind]
            if useItem and not done then
                -- The step's item is used on this objective ("Use the Blackjack on Lazy Peons").
                local item = Compat.ItemName(itemID) or Ding.Data:ItemName(itemID) or L.BIND_ITEM
                row.kind, row.item = "use", itemID
                row.text = name ~= "" and L.ROW_USE_ON:format(link(item), name) or L.ROW_USE:format(link(item))
                useItem = false
            elseif verbs then
                local several = need and need > 1
                local fmt = verbs[(done and 3 or 1) + (several and 1 or 0)]
                row.text = several and fmt:format(need, link(name)) or fmt:format(link(name))
            else
                row.text = name
            end
            if need then row.counter = ("%d/%d"):format(done and need or math.min(have or 0, need), need) end
            rows[#rows + 1] = row
        end
    end
    return rows
end

local GLYPH_OF = { accept = "accept", turnin = "turnin", complete = "objective", level = "level", go = "go",
    grind = "kill" }

-- "level 12" or "level 11-13".
local function npcLevels(low, high)
    if not low then return nil end
    if not high or high == low then return L.NPC_LEVEL:format(low) end
    return L.NPC_LEVELS:format(low, high)
end

-- Where a row's target is, when it is not in the player's zone: "Madame Eva, Duskwood" for a
-- quest giver or a turn-in, "Duskwood" for the rest; nil in the player's zone. Looked up
-- again every few seconds (the player moves on).
local WHERE_TTL = 3
local whereCache = {}
function P:Where(row)
    local key = table.concat({ tostring(row.action), tostring(row.quest), tostring(row.target or row.npc or ""),
        tostring(row.goal and row.goal.kind or ""), tostring(row.goal and (row.goal.id or row.goal.ids and row.goal.ids[1]) or "") }, ":")
    local now = GetTime()
    local c = whereCache[key]
    if c and now - c.t < WHERE_TTL then return c.text end
    local E, text = Ding.Engine, nil
    local points = self:PointsOf(row)
    if #points == 0 and row.action == "manual" then
        local step = E:CurrentStep()
        if step and Ding.Services:StepKind(step) then points = E.candidates or {} end
    end
    local nearest = #points > 0 and E:NearestPoint(points)
    local zone = nearest and E:ZoneLabel(nearest)
    if zone then
        local who
        if row.action == "accept" then who = Ding.Data:StarterName(row.quest) end
        if row.action == "turnin" then who = Ding.Data:FinisherName(row.quest) end
        text = who and L.WHERE_WHO:format(who, zone) or zone
    end
    whereCache[key] = { t = now, text = text }
    return text
end
function P.ResetWhere() whereCache = {} end

-- A main line of Engine:Describe as a row.
local function questRow(line)
    local action = line.action or "other"
    local q = line.quest
    local row = { action = action, quest = q, kind = line.glyph or GLYPH_OF[action] or "other", counter = line.counter,
        sub = line.sub, service = line.service, item = line.item, wrap = line.wrap, talent = line.talent,
        goal = line.goal, goalStep = line.goalStep, entry = line.entry, what = line.what }
    if action == "gear" then row.kind = "use" end
    if action == "talent" then row.kind = "level" end
    if action == "accept" then
        row.text = L.ROW_ACCEPT:format(questName(q))
    elseif action == "turnin" then
        row.text = L.ROW_TURNIN:format(questName(q))
    elseif action == "complete" then
        row.text = L.ROW_COMPLETE:format(questName(q))
    elseif action == "grind" then
        -- The monster to farm for a level step, with its levels; its quest when one needs it.
        local levels = npcLevels(line.minLevel, line.maxLevel)
        row.text = L.ROW_KILL:format(link(line.name or "?")) .. (levels and UI.Colored("secondary", " · " .. levels) or "")
        row.npc = line.npc
        if q then row.sub = L.FOR_QUEST:format(questName(q, true)) end
    else
        row.text = line.text or ""
    end
    if line.prequestOf then
        row.text = row.text .. UI.Colored("secondary", " · " .. L.PREQUEST_OF:format(Ding.Data:QuestName(line.prequestOf)))
    end
    if line.done then
        row.state = "done"
    elseif line.dim and line.requires then
        row.state = "impossible"
        row.text = row.text .. " · " .. L.ROW_REQUIRES:format(line.requires)
    elseif line.impossible or line.dim then
        row.state = "impossible"
    else
        row.state = (action == "info") and "impossible" or "todo"
    end
    return row
end

local QUEST_VERBS = { accept = "ROW_ACCEPT", turnin = "ROW_TURNIN", complete = "ROW_COMPLETE" }

-- A line the player still has to do: not done, not a quest the engine passes (level too low
-- to take it, grey).
local function pending(line)
    return not line.done and not line.dim and not (line.quest and Ding.Engine:IsGrey(line.quest))
end

-- A next step on one dimmed line: what it asks first, with its quest's level, and how many
-- other quests it still deals with ("Turn in [2] “Name” +1"); a step without a quest keeps
-- its own text.
local function previewRow(step)
    local main, first = {}, nil
    for _, line in ipairs(Ding.Engine:Describe(step, true)) do
        if not line.indent then main[#main + 1] = line end
    end
    for _, line in ipairs(main) do
        if pending(line) then first = line break end
    end
    first = first or main[1]
    if not first then return nil end
    local row = questRow(first)
    local q = QUEST_VERBS[first.action] and first.quest
    if q then
        local more, seen = 0, { [q] = true }
        for _, line in ipairs(main) do
            if QUEST_VERBS[line.action] and line.quest and pending(line) and not seen[line.quest] then
                seen[line.quest] = true
                more = more + 1
            end
        end
        row.text = L[QUEST_VERBS[first.action]]:format(leveledName(q))
            .. (more > 0 and " " .. L.PREVIEW_MORE:format(more) or "")
            .. (first.dim and first.requires and " · " .. L.ROW_REQUIRES:format(first.requires) or "")
    end
    row.action, row.state, row.preview = "preview", "preview", true
    row.counter, row.sub = nil, nil
    return row
end

-- Rows of the step on screen, with the guide's notes and Ding's hints as sub-lines.
function P:Rows(content)
    content = content or self:Content()
    local itemID, itemQuest = Ding.ItemButton:Wanted()
    local rows, notes, hints, along, extra, preview = {}, {}, {}, {}, {}, {}
    for _, line in ipairs(content) do
        if line.indent then
            -- Objectives are listed from the quest log below; notes and hints become sub-lines.
            if line.kind == "note" then
                notes[#notes + 1] = line.text
            elseif line.kind == "hint" then
                hints[#hints + 1] = line.text
            end
        elseif line.action == "along" then
            along[#along + 1] = line
        elseif line.action == "service" or line.action == "gear" or line.action == "talent" or line.action == "wrapup"
            or line.action == "jump" or line.action == "trip" or line.action == "weapon" then
            extra[#extra + 1] = line
        elseif line.action == "preview" then
            preview[#preview + 1] = line
        elseif line.action == "complete" and line.quest and not line.impossible then
            local list = objectiveRows(line.quest, itemID, itemQuest, line.done)
            if #list == 0 then list = { questRow(line) } end
            for _, row in ipairs(list) do rows[#rows + 1] = row end
        else
            rows[#rows + 1] = questRow(line)
        end
    end
    if #rows == 0 then return rows end
    -- Objectives say which quest they are for, unless a row of the step names it already.
    local named, seen = {}, {}
    for _, row in ipairs(rows) do
        if row.quest and row.action ~= "objective" then named[row.quest] = true end
    end
    for _, row in ipairs(rows) do
        local q = row.quest
        if q and row.action == "objective" and not named[q] and not seen[q] then
            seen[q] = true
            row.sub = L.FOR_QUEST:format(questName(q, true))
        end
    end
    -- A target in another zone: its zone (and its NPC) after the row's text.
    for _, row in ipairs(rows) do
        if row.state ~= "done" and row.action ~= "level" then
            local where = self:Where(row)
            if where then row.text = row.text .. UI.Colored("secondary", " — " .. where) end
        end
    end
    -- The guide's note goes under the first row still to do, hints under the last row.
    local noteRow = rows[#rows]
    for _, row in ipairs(rows) do
        if row.state == "todo" then noteRow = row break end
    end
    local function attach(row, list)
        if #list == 0 then return end
        local text = table.concat(list, "\n")
        row.sub = row.sub and (row.sub .. "\n" .. text) or text
    end
    attach(noteRow, notes)
    attach(rows[#rows], hints)
    -- A step marked done by hand or skipped: what the game does not confirm takes its color.
    if content.mark then
        for _, row in ipairs(rows) do
            if row.state == "todo" or row.state == "impossible" then row.state = content.mark end
        end
    end
    -- Along the way: objectives of other quests right around the player, after the step;
    -- the persistent ones ("Still to do") wherever the player is.
    local lastQuest, lastGroup
    for _, line in ipairs(along) do
        for _, row in ipairs(objectiveRows(line.quest, itemID, itemQuest, false)) do
            if row.index == line.objective then
                row.along, row.sticky = true, line.sticky
                local group = line.sticky and L.STICKY_WAY or L.ALONG_WAY
                if row.quest ~= lastQuest or group ~= lastGroup then
                    local forQuest = L.FOR_QUEST:format(questName(row.quest, true))
                    row.sub = group ~= lastGroup and (group .. " · " .. forQuest) or forQuest
                    lastQuest, lastGroup = row.quest, group
                end
                rows[#rows + 1] = row
            end
        end
    end
    -- Training waiting at the class trainer, a gear upgrade in the bags, the section's end.
    for _, line in ipairs(extra) do
        local row = questRow(line)
        row.extra = true
        rows[#rows + 1] = row
    end
    -- The next steps, dimmed (option): what the step after this one will ask.
    for _, line in ipairs(preview) do
        rows[#rows + 1] = previewRow(line.step)
    end
    return rows
end

-- Where a row sends the arrow: its NPC, its objective's spawns, its "go" point.
function P:PointsOf(row)
    local D, q = Ding.Data, row.quest
    if row.goal then return row.state == "done" and {} or Ding.Goals:PartPoints(row.goalStep, row.goal) end
    if row.action == "accept" then return D:StartPoints(q) end
    if row.action == "turnin" then return D:EndPoints(q) end
    if row.action == "grind" then
        local spot = Ding.Grind.spot
        if spot and spot.npc == row.npc then return spot.points end
        local points = D:NpcPoints(row.npc)
        for _, p in ipairs(points) do p.area = true end
        return points
    end
    if q then
        local points, all = {}, {}
        local wanted = row.target and row.target:lower()
        for _, target in ipairs(D:ObjectiveTargets(q)) do
            local name = target.name and target.name:lower()
            local match = wanted and name and (wanted:find(name, 1, true) or name:find(wanted, 1, true))
            for _, p in ipairs(target.points) do
                all[#all + 1] = p
                if match then points[#points + 1] = p end
            end
        end
        if #points > 0 then return points end
        if #all > 0 then return all end
        return D:EndPoints(q)
    end
    local step = Ding.Engine:CurrentStep()
    if row.action == "go" and step and step.go then
        return { { map = step.go[1], x = step.go[2], y = step.go[3], label = step.text, isGo = true } }
    end
    return {}
end

-- Binding DING_CYCLE: the arrow on the step's next target, in the rows' order (that of
-- focus mode), then back to the nearest of all. In focus mode, the focus follows.
function P:CycleTarget()
    local E, stops = Ding.Engine, {}
    for i, row in ipairs(self.rowsShown or {}) do
        if not (row.preview or row.along or row.sticky) and row.action ~= "wrapup" and row.action ~= "service"
            and row.action ~= "gear" then
            local points = self:PointsOf(row)
            if #points > 0 then stops[#stops + 1] = { index = i, points = points } end
        end
    end
    if #stops == 0 then return end
    local c = self.cycle
    if not c or c.guide ~= E.guide or c.index ~= E.index or c.count ~= #stops then
        c = { guide = E.guide, index = E.index, count = #stops, at = 0 }
        self.cycle = c
    end
    c.at = c.at + 1
    if c.at > #stops then
        c.at = 0
        Ding.Arrow:Unfocus()
        return
    end
    local stop = stops[c.at]
    if self.focusing then
        self.focusIndex = stop.index
        self:Update()
    end
    Ding.Arrow:Focus(stop.points)
end

-- Where the guide deals with quest `q` (a row's quest): offered as a row under the step,
-- "Step 12 of Westfall", A or a click goes there; nothing found, or the current step: a
-- chat line.
function P:FindQuest(q)
    local E = Ding.Engine
    local found = E:FindQuest(q)
    local name = Ding.Data:QuestName(q) or tostring(q)
    if not found then
        self.findOffer = nil
        Ding:Print(L.FIND_NONE:format(name))
    elseif found.guide == (E.guide and E.guide.id) and found.index == E.index then
        self.findOffer = nil
        Ding:Print(L.FIND_HERE:format(name))
    else
        found.quest = q
        found.from = { guide = E.guide and E.guide.id, index = E.index }
        self.findOffer = found
    end
    self:Update()
    -- In focus mode, the focus goes to the offer.
    if self.findOffer and self.focusing then
        for i, row in ipairs(self.rowsShown or {}) do
            if row.action == "jump" then self.focusIndex = i end
        end
        self:Update()
    end
end

function P:CancelFind()
    self.findOffer = nil
    self:Update()
end

-- The offer taken: the guide goes to that section and step.
function P:Jump()
    local offer = self.findOffer
    self.findOffer = nil
    if not offer then return end
    if Ding.Engine:SetGuide(offer.guide, offer.index, true) then
        Ding:Print(L.FIND_JUMPED:format(offer.index, Ding.Engine.guide.title))
    end
    if self.focusing then self.focusIndex = 1 end
    self:Update()
end

-- Mouse click or A in focus mode: the arrow points to this row's target.
function P:Aim(row)
    -- A service row (training): the nearest trainer, through the NPC directory.
    if row and row.action == "service" then return Ding.Finder:Go(row.service) end
    -- A weapon to learn: its weapon master. The trip line: back to the guide.
    if row and row.action == "weapon" then return Ding.Finder:GoTo(row.entry, row.what) end
    if row and row.action == "trip" then return Ding.Finder:Cancel() end
    if row and row.action == "wrapup" then return Ding.Engine:WrapUp(row.wrap) end
    if row and row.action == "preview" then return end
    if row and row.action == "gear" then return end
    if row and row.action == "jump" then return self:Jump() end
    -- A talent suggestion: the first press asks to confirm, the second learns it.
    if row and row.action == "talent" then return Ding.Talents:Press(row.talent) end
    local points = row and self:PointsOf(row) or {}
    if #points > 0 then Ding.Arrow:Focus(points) end
end

-- The quest of a row, in a tooltip next to `owner`: name, level, objectives. Ding never
-- opens the game's quest log itself: driving Blizzard's frames from an addon spreads its
-- taint there, and on Forever their secret values then fail by the dozen.
function P:ShowQuest(row, owner)
    local q = row and row.quest
    if row and row.action == "gear" and row.item then
        -- The upgrade itself: the game's own card of the item.
        GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
        if not pcall(GameTooltip.SetItemByID, GameTooltip, row.item) then
            GameTooltip:SetText(Compat.ItemName(row.item) or "?")
        end
        GameTooltip:Show()
        return
    end
    if row and row.action == "talent" and row.talent then
        -- The talent itself: the game's own card of it.
        local t = row.talent
        GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
        if not pcall(GameTooltip.SetTalent, GameTooltip, t.tab, t.index) then
            GameTooltip:SetText(t.name or "?")
            GameTooltip:AddLine(("%d/%d"):format(t.rank, t.maxRank), 0.8, 0.8, 0.8)
        end
        GameTooltip:Show()
        return
    end
    if row and row.action == "grind" and not q then
        -- The monster to farm: its name and levels.
        GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
        GameTooltip:SetText(Ding.Data:NpcName(row.npc) or "?", 1, 0.82, 0)
        local info = Ding.Data:NpcInfo(row.npc)
        if info then GameTooltip:AddLine(npcLevels(info.minLevel, info.maxLevel), 0.8, 0.8, 0.8) end
        GameTooltip:AddLine(L.ROW_CLICK, 0.6, 0.6, 0.6, true)
        GameTooltip:Show()
        return
    end
    if not q then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(Ding.Data:QuestName(q), 1, 0.82, 0)
    local level = Ding.Data:QuestLevel(q)
    if level and level > 0 then GameTooltip:AddLine(L.QUEST_LEVEL:format(level), 0.8, 0.8, 0.8) end
    if Compat.IsInLog(q) then
        for _, obj in ipairs(Compat.GetObjectives(q)) do
            if obj.text then
                local c = obj.finished and C.done or C.text
                GameTooltip:AddLine(obj.text, c[1], c[2], c[3], true)
            end
        end
    else
        GameTooltip:AddLine(L.NOT_IN_LOG, 0.8, 0.8, 0.8, true)
    end
    -- noAim: a card shown elsewhere than in the guide window (settings).
    if not row.noAim then GameTooltip:AddLine(L.ROW_CLICK, 0.6, 0.6, 0.6, true) end
    GameTooltip:Show()
end

local function hideQuest(owner)
    if GameTooltip:GetOwner() == owner then GameTooltip:Hide() end
end

---------------------------------------------------------------------------
-- Construction
---------------------------------------------------------------------------
local function startDrag()
    if not Ding.db.panel.locked then P.frame:StartMoving() end
end

local function stopDrag()
    P.frame:StopMovingOrSizing()
    P:SavePosition()
end

-- Three 10 x 1.5 lines, 2 apart: the menu icon.
local function menuIcon(button)
    for i = -1, 1 do
        local t = button:CreateTexture(nil, "ARTWORK")
        t:SetColorTexture(unpack(C.secondary))
        t:SetSize(10, 1.5)
        t:SetPoint("CENTER", button, "CENTER", 0, i * 3.5)
    end
end

local function newRow(parent)
    local r = CreateFrame("Button", nil, parent)
    r:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    r.bg = UI.Shape(r, "row", nil, "BACKGROUND"):Place(r)
    r.focus = UI.Focus(r)
    r.icon = CreateFrame("Frame", nil, r)
    r.icon:SetSize(ICON, ICON)
    r.icon:SetPoint("TOPLEFT", r, "TOPLEFT", ROW_PAD_X, -ROW_PAD_Y)
    r.icon.bg = UI.Shape(r.icon, "small", nil, "BACKGROUND"):Place(r.icon)
    r.icon.tex = r.icon:CreateTexture(nil, "ARTWORK")
    r.icon.tex:SetPoint("CENTER", r.icon, "CENTER", 0, 0)
    r.icon.letter = UI.Text(r.icon, "bold", 11, C.text)
    r.icon.letter:SetJustifyH("CENTER")
    r.icon.letter:SetPoint("CENTER", r.icon, "CENTER", 0, 0)
    r.icon.item = UI.ItemIcon(r.icon, ICON)
    r.icon.item:SetPoint("CENTER", r.icon, "CENTER", 0, 0)
    r.icon.border = UI.Shape(r.icon, "smallBorder", C.strong, "OVERLAY"):Place(r.icon)
    r.text = UI.Text(r, "regular", 12, C.text)
    UI.Wrap(r.text, 12, 2)
    r.text:SetPoint("TOPLEFT", r, "TOPLEFT", ROW_PAD_X + ICON + ROW_GAP_X, -ROW_PAD_Y)
    r.counter = UI.Text(r, "semibold", 12, C.todo)
    r.counter:SetJustifyH("RIGHT")
    r.counter:SetPoint("TOPRIGHT", r, "TOPRIGHT", -ROW_PAD_X, -ROW_PAD_Y)
    r.sub = UI.Text(r, "regular", 11, C.secondary)
    UI.Wrap(r.sub, 11, 3)
    r.sub:SetPoint("TOPLEFT", r.text, "BOTTOMLEFT", 0, -2)
    r:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            -- On a gear upgrade: not wanted, never offered again. On a jump offer: never mind.
            if self.data and self.data.action == "gear" then return Ding.Gear:Decline() end
            if self.data and self.data.action == "jump" then return P:CancelFind() end
            return P:OpenStepMenu(self.data)
        end
        P:Aim(self.data)
        P:ShowQuest(self.data, self)
    end)
    r:SetScript("OnEnter", function(self) P:ShowQuest(self.data, self) end)
    r:SetScript("OnLeave", hideQuest)
    return r
end

-- The glyph of a row's icon: check, diamond, dot, ! ? , item icon or caret.
local function setIcon(icon, data, look)
    local tex, letter, item = icon.tex, icon.letter, icon.item
    tex:Hide()
    letter:Hide()
    item:Hide()
    icon.border:Hide()
    icon.bg:SetColor(look.icon)
    icon.bg:Show()
    local kind = (data.state == "done" or data.state == "manual") and "done" or data.kind
    if kind == "use" and data.item then
        item:SetTexture(Compat.ItemIcon(data.item) or "Interface\\Icons\\INV_Misc_QuestionMark")
        item:Show()
        icon.border:Show()
        icon.bg:Hide()
        return
    end
    local file, size, rotation = nil, 6, 0
    if kind == "done" then file, size = "icon_check", 11
    elseif kind == "kill" then file = "icon_diamond"
    elseif kind == "collect" then file = "circle"
    elseif kind == "accept" or kind == "turnin" then
        letter:SetText(kind == "accept" and "!" or "?")
        letter:SetTextColor(unpack(look.glyph))
        letter:Show()
        return
    elseif kind == "level" then file, size = "caret_up", 8
    else file, size, rotation = "caret_up", 8, -math.pi / 2 end
    tex:SetTexture(UI.TEX .. file)
    tex:SetSize(size, size)
    tex:SetRotation(rotation)
    tex:SetVertexColor(unpack(look.glyph))
    tex:Show()
end

local function dividerAt(f, y)
    local t = UI.Divider(f, y)
    return t
end

function P:Create()
    if self.frame then return end
    local db = Ding.db.panel
    db.scale = clamp(tonumber(db.scale) or 1, MIN_SCALE, MAX_SCALE)
    db.width = clamp(tonumber(db.width) or WIDTH, MIN_WIDTH, MAX_WIDTH)

    local f = CreateFrame("Frame", "DingPanelFrame", UIParent)
    f:SetSize(db.width, 80)
    f:SetScale(db.scale)
    f:SetFrameStrata("MEDIUM")
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", startDrag)
    f:SetScript("OnDragStop", stopDrag)
    f:SetScript("OnMouseUp", function(_, button)
        if button == "RightButton" then P:OpenStepMenu() end
    end)
    f.look = UI.Window(f)

    -- Title bar: menu, "Ding · guide", minimize, close.
    f.menu = UI.IconButton(f, 20)
    f.menu:SetPoint("TOPLEFT", f, "TOPLEFT", 4, -2)
    menuIcon(f.menu)
    f.menu.tooltip = L.BIND_CONFIG
    f.menu:SetScript("OnClick", function() Ding.Config:Toggle() end)

    f.close = UI.IconButton(f, 20)
    f.close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -2)
    f.close.label = UI.Text(f.close, "regular", 14, C.secondary)
    f.close.label:SetPoint("CENTER", f.close, "CENTER", 0, 1)
    f.close.label:SetText("×")
    f.close.tooltip = L.PANEL_CLOSE
    f.close:SetScript("OnClick", function() P:Close() end)

    f.minimize = UI.IconButton(f, 20)
    f.minimize:SetPoint("TOPRIGHT", f, "TOPRIGHT", -28, -2)
    local bar = f.minimize:CreateTexture(nil, "ARTWORK")
    bar:SetColorTexture(unpack(C.secondary))
    bar:SetSize(9, 1.5)
    bar:SetPoint("CENTER", f.minimize, "CENTER", 0, 0)
    f.minimize.tooltip = L.BIND_COMPACT
    f.minimize:SetScript("OnClick", function() P:SetCompact(true) end)

    -- The NPC directory (UI/Finder.lua): a map pin. In focus mode, above the first row.
    f.finder = UI.IconButton(f, 20)
    f.finder:SetPoint("TOPRIGHT", f, "TOPRIGHT", -52, -2)
    local head = UI.Icon(f.finder, "circle", 8, C.secondary)
    head:SetPoint("CENTER", f.finder, "CENTER", 0, 2)
    local tip = UI.Caret(f.finder, "DOWN", 7, C.secondary)
    tip:SetPoint("CENTER", f.finder, "CENTER", 0, -3)
    local hole = UI.Icon(f.finder, "circle", 3, C.bg, "OVERLAY")
    hole:SetPoint("CENTER", head, "CENTER", 0, 0)
    f.finder.tooltip = L.BIND_FINDER
    f.finder:SetScript("OnClick", function() Ding.Finder:Toggle() end)
    f.finder.focus = UI.Focus(f.finder, true)
    f.finder.key = UI.Glyph(f)
    f.finder.key:SetPoint("RIGHT", f.finder, "LEFT", -6, 0)
    f.finder.key:Hide()

    f.title = UI.Text(f, "semibold", 12, C.text)
    f.title:SetPoint("TOPLEFT", f, "TOPLEFT", 28, -4)
    -- The title area drags the window; its tooltip gives the full guide name.
    f.titleArea = CreateFrame("Button", nil, f)
    f.titleArea:SetPoint("TOPLEFT", f, "TOPLEFT", 28, 0)
    f.titleArea:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", -76, -TITLE_HEIGHT)
    f.titleArea:RegisterForDrag("LeftButton")
    f.titleArea:SetScript("OnDragStart", startDrag)
    f.titleArea:SetScript("OnDragStop", stopDrag)
    f.titleArea:SetScript("OnEnter", function(self)
        local guide = Ding.Engine.guide
        if not guide then return end
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(guide.title)
        GameTooltip:Show()
    end)
    f.titleArea:SetScript("OnLeave", function() GameTooltip:Hide() end)
    f.titleDivider = dividerAt(f, -TITLE_HEIGHT)

    -- Step bar: LB ‹ Step 3 / 42 › RB ... zone.
    f.lb = UI.Glyph(f)
    f.prev = UI.IconButton(f, 24, C.subtle)
    f.prev.label = UI.Text(f.prev, "semibold", 13, C.text)
    f.prev.label:SetPoint("CENTER", f.prev, "CENTER", 0, 1)
    f.prev.label:SetText("‹")
    f.prev:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    f.prev:SetScript("OnClick", function(_, button)
        if button == "RightButton" then P:BackToSkipped() else Ding.Engine:Prev() end
    end)
    f.prev.tooltip = L.BIND_PREV .. "\n" .. L.RIGHT_CLICK:format(L.BIND_UNSKIP)
    f.stepText = UI.Text(f, "semibold", 12, C.text)
    f.stepTotal = UI.Text(f, "regular", 12, C.muted)
    f.next = UI.IconButton(f, 24, C.subtle)
    f.next.label = UI.Text(f.next, "semibold", 13, C.text)
    f.next.label:SetPoint("CENTER", f.next, "CENTER", 0, 1)
    f.next.label:SetText("›")
    f.next:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    f.next:SetScript("OnClick", function(_, button)
        if button == "RightButton" then Ding.Engine:Skip() else Ding.Engine:Next() end
    end)
    f.next.tooltip = L.BIND_NEXT .. "\n" .. L.RIGHT_CLICK:format(L.BIND_SKIP)
    f.rb = UI.Glyph(f)
    f.zone = UI.Text(f, "regular", 11, C.secondary)
    f.zone:SetJustifyH("RIGHT")
    f.stepDivider = dividerAt(f, -(TITLE_HEIGHT + 1 + STEP_HEIGHT))

    -- Rows and progress bar.
    f.rows = {}
    f.trackHolder = CreateFrame("Frame", nil, f)
    f.trackHolder:SetHeight(3)
    f.track = UI.Shape(f.trackHolder, "bar", C.border, "ARTWORK"):Place(f.trackHolder)
    f.fillHolder = CreateFrame("Frame", nil, f)
    f.fillHolder:SetHeight(3)
    f.fillHolder:SetFrameLevel(f.trackHolder:GetFrameLevel() + 1)
    f.fill = UI.Shape(f.fillHolder, "bar", C.accent, "ARTWORK"):Place(f.fillHolder)

    -- Minimized: count, icon, text, counter, expand; 2-unit progress line at the bottom.
    f.mini = CreateFrame("Frame", nil, f)
    f.mini:SetAllPoints(f)
    local m = f.mini
    m.menu = UI.IconButton(m, 20)
    menuIcon(m.menu)
    m.menu.tooltip = L.BIND_CONFIG
    m.menu:SetScript("OnClick", function() Ding.Config:Toggle() end)
    m.count = UI.Text(m, "semibold", 11, C.muted)
    m.icon = CreateFrame("Frame", nil, m)
    m.icon:SetSize(14, 14)
    m.icon.bg = UI.Shape(m.icon, "small", nil, "BACKGROUND"):Place(m.icon)
    m.icon.tex = m.icon:CreateTexture(nil, "ARTWORK")
    m.icon.tex:SetPoint("CENTER", m.icon, "CENTER", 0, 0)
    m.text = UI.Text(m, "regular", 12, C.text)
    m.counter = UI.Text(m, "semibold", 12, C.todo)
    m.counter:SetJustifyH("RIGHT")
    m.expand = UI.IconButton(m, 20)
    m.expand:SetPoint("RIGHT", m, "RIGHT", -4, 0)
    m.expand.square = CreateFrame("Frame", nil, m.expand)
    m.expand.square:SetSize(9, 9)
    m.expand.square:SetPoint("CENTER", m.expand, "CENTER", 0, 0)
    UI.Shape(m.expand.square, "smallBorder", C.secondary, "ARTWORK"):Place(m.expand.square)
    m.expand.tooltip = L.BIND_COMPACT
    m.expand:SetScript("OnClick", function() P:SetCompact(false) end)
    m.line = m:CreateTexture(nil, "ARTWORK")
    m.line:SetColorTexture(unpack(C.border))
    m.line:SetHeight(2)
    m.line:SetPoint("BOTTOMLEFT", m, "BOTTOMLEFT", 3, 1)
    m.line:SetPoint("BOTTOMRIGHT", m, "BOTTOMRIGHT", -3, 1)
    m.lineFill = m:CreateTexture(nil, "ARTWORK", nil, 1)
    m.lineFill:SetColorTexture(unpack(C.accent))
    m.lineFill:SetHeight(2)
    m.lineFill:SetPoint("BOTTOMLEFT", m, "BOTTOMLEFT", 3, 1)

    -- Bottom-right corner: drag to resize the width (240-420).
    f.grip = CreateFrame("Button", nil, f)
    f.grip:SetSize(12, 12)
    f.grip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
    f.grip:SetScript("OnMouseDown", function()
        if Ding.db.panel.locked then return end
        P.resizing = { x = GetCursorPosition() / f:GetEffectiveScale(), width = Ding.db.panel.width }
    end)
    f.grip:SetScript("OnMouseUp", function() P.resizing = nil end)
    f.grip:SetScript("OnUpdate", function()
        local r = P.resizing
        if r then P:SetWidth(r.width + GetCursorPosition() / f:GetEffectiveScale() - r.x) end
    end)

    self.frame = f
    self:ApplyPosition()
    self:Update()
end

---------------------------------------------------------------------------
-- Position, size and options (Ding.db.panel)
---------------------------------------------------------------------------
local function updateItemButton()
    if Ding.ItemButton then Ding.ItemButton:Update() end
end

function P:ApplyPosition()
    local f, db = self.frame, Ding.db.panel
    f:ClearAllPoints()
    f:SetPoint(db.point, UIParent, db.point, db.x, db.y)
end

-- Anchor by the top-left corner so the window grows downwards as steps get longer.
function P:SavePosition()
    local f, db = self.frame, Ding.db.panel
    local left, top = f:GetLeft(), f:GetTop()
    if f.SetUserPlaced then pcall(f.SetUserPlaced, f, false) end
    if not left or not top then return end
    db.point = "TOPLEFT"
    db.x = left
    db.y = top - UIParent:GetTop() / f:GetScale()
    self:ApplyPosition()
end

function P:ResetPosition()
    local db, default = Ding.db.panel, Ding.DEFAULTS.panel
    db.point, db.x, db.y = default.point, default.x, default.y
    if self.frame then self:ApplyPosition() end
end

-- Window scale 0.5-1.5 (50-150 %); returns the scale applied, nil if not a number.
function P:SetScale(value)
    local scale = tonumber(value)
    if not scale then return nil end
    scale = clamp(scale, MIN_SCALE, MAX_SCALE)
    local db = Ding.db.panel
    -- Offsets are expressed in the frame's own scale: rescale them to keep the anchor in place.
    local ratio = (db.scale or 1) / scale
    db.x, db.y = db.x * ratio, db.y * ratio
    db.scale = scale
    if self.frame then
        self.frame:SetScale(scale)
        self:ApplyPosition()
    end
    return scale
end

function P:SetWidth(value)
    local db = Ding.db.panel
    db.width = clamp(math.floor((tonumber(value) or WIDTH) + 0.5), MIN_WIDTH, MAX_WIDTH)
    if self.frame then self:Update() end
    return db.width
end

function P:SetBackgroundAlpha(alpha)
    Ding.db.panel.bgAlpha = clamp(tonumber(alpha) or 0.85, 0, 1)
    if self.frame then self.frame.look:SetBgAlpha(Ding.db.panel.bgAlpha) end
end

-- On screen: opened by the player, and not hidden in a dungeon (setting). The arrow
-- follows it (UI/Arrow.lua).
function P:Visible()
    local db = Ding.db.panel
    return db.shown and not (db.hideInInstance and inInstance()) and true or false
end

-- The guide window and its arrow, shown or hidden together.
function P:SetShown(shown)
    Ding.db.panel.shown = shown and true or false
    self:Update()
    if Ding.Arrow and Ding.Arrow.Update then Ding:Safe(Ding.Arrow.Update, Ding.Arrow) end
end

function P:Toggle()
    self:SetShown(not Ding.db.panel.shown)
end

---------------------------------------------------------------------------
-- Step menu (right click on the window): mark the step done by hand, or skip it for
-- later. On a gamepad the "Next step" and "Skip step" bindings do the same.
---------------------------------------------------------------------------
local MENU_WIDTH, MENU_ITEM, MENU_PAD = 210, 26, 4

local function menuItem(menu, i, text, action)
    local b = CreateFrame("Button", nil, menu)
    b:SetHeight(MENU_ITEM)
    b:SetPoint("TOPLEFT", menu, "TOPLEFT", MENU_PAD, -MENU_PAD - (i - 1) * MENU_ITEM)
    b:SetPoint("TOPRIGHT", menu, "TOPRIGHT", -MENU_PAD, -MENU_PAD - (i - 1) * MENU_ITEM)
    b:RegisterForClicks("LeftButtonUp")
    b.bg = UI.Shape(b, "row", C.hover, "BACKGROUND"):Place(b)
    b.bg:Hide()
    b.text = UI.Text(b, "regular", 12, C.text)
    b.text:SetPoint("LEFT", b, "LEFT", 8, 0)
    b.text:SetText(text)
    b:SetScript("OnEnter", function(self) self.bg:Show() end)
    b:SetScript("OnLeave", function(self) self.bg:Hide() end)
    b:SetScript("OnClick", function()
        P:CloseStepMenu()
        action()
    end)
    return b
end

function P:OpenStepMenu(row)
    local E = Ding.Engine
    if not E.guide or E.finished then return end
    local m = self.stepMenu
    if not m then
        -- A click anywhere else closes the menu.
        local catcher = CreateFrame("Button", nil, UIParent)
        catcher:SetAllPoints(UIParent)
        catcher:SetFrameStrata("DIALOG")
        catcher:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        catcher:SetScript("OnClick", function() P:CloseStepMenu() end)
        m = CreateFrame("Frame", "DingStepMenu", UIParent)
        m:SetFrameStrata("DIALOG")
        m:SetFrameLevel(catcher:GetFrameLevel() + 5)
        m:SetClampedToScreen(true)
        m:SetSize(MENU_WIDTH, MENU_PAD * 2 + MENU_ITEM * 2)
        m:EnableMouse(true)
        m.look = UI.Window(m)
        m.done = menuItem(m, 1, L.STEP_MENU_DONE, function() Ding.Engine:Next() end)
        m.skip = menuItem(m, 2, L.STEP_MENU_SKIP, function() Ding.Engine:Skip() end)
        -- On a row with a quest: where the guide deals with it.
        m.find = menuItem(m, 3, L.STEP_MENU_FIND, function() P:FindQuest(m.quest) end)
        m.catcher = catcher
        self.stepMenu = m
    end
    m.quest = row and row.quest or nil
    m.find:SetShown(m.quest ~= nil)
    m:SetHeight(MENU_PAD * 2 + MENU_ITEM * (m.quest and 3 or 2))
    local scale = UIParent:GetEffectiveScale()
    local x, y = GetCursorPosition()
    m:ClearAllPoints()
    m:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale, y / scale)
    m.catcher:Show()
    m:Show()
end

function P:CloseStepMenu()
    local m = self.stepMenu
    if not m then return end
    m:Hide()
    m.catcher:Hide()
end

-- The close button: window and arrow hidden until /ding, the minimap button, the binding
-- or the settings show them again.
function P:Close()
    self:SetShown(false)
    Ding:Print(L.PANEL_HIDDEN)
end

-- Minimized to one line, by hand (DING_COMPACT) or for the duration of a fight.
function P:SetCompact(compact, byCombat)
    if (self.compact or false) == compact then return end
    if compact and self.focusing then self:StopFocus() end
    self.compact = compact
    self.combatCompact = compact and byCombat or false
    self:Update()
end

function P:ToggleCompact()
    self:SetCompact(not self.compact, false)
end

-- DING_UNSKIP: back to the nearest skipped step, or say there is none.
function P:BackToSkipped()
    if not Ding.Engine:BackToIncomplete() then Ding:Print(L.NO_SKIPPED) end
end

-- Target for the gamepad move mode (Ding.Gamepad:StartMove).
function P:MoveTarget()
    local db = Ding.db.panel
    self:SavePosition()
    return {
        frame = self.frame,
        title = L.MOVE_TITLE,
        get = function() return db.x, db.y end,
        set = function(x, y)
            db.x, db.y = x, y
            P:ApplyPosition()
        end,
        save = function() P:SavePosition() end,
        dragged = function() P:SavePosition() end,
        reset = function()
            P:ResetPosition()
            P:SavePosition()
        end,
    }
end

---------------------------------------------------------------------------
-- Content
---------------------------------------------------------------------------
local function manualHint()
    local key = Ding.Gamepad:BindingText("DING_NEXT")
    return key and L.MANUAL_HINT:format(key) or L.MANUAL_HINT_NOKEY
end

-- A service step goes on by itself ("window" closed, "flight" path known); Next still works.
local function serviceHint(kind)
    local key = Ding.Gamepad:BindingText("DING_NEXT")
    if kind == "flight" then return key and L.SERVICE_FLY_HINT:format(key) or L.SERVICE_FLY_HINT_NOKEY end
    return key and L.SERVICE_HINT:format(key) or L.SERVICE_HINT_NOKEY
end

-- Why the guide just passed steps the player did not do (grey quests, level too low).
local MAX_SKIP_LINES = 2
local function skippedLines(E, content)
    local notes = E.skipNotes
    if not notes or #notes == 0 then return end
    for i = 1, math.min(#notes, MAX_SKIP_LINES) do
        local note = notes[i]
        local name = Ding.Data:QuestName(note.quest)
        local text = note.reason == "grey" and L.SKIPPED_GREY:format(name)
            or L.SKIPPED_LEVEL:format(name, Ding.Data:QuestRequiredLevel(note.quest))
        content[#content + 1] = { indent = true, kind = "hint", text = text }
    end
    if #notes > MAX_SKIP_LINES then
        content[#content + 1] = { indent = true, kind = "hint", text = L.SKIPPED_MORE:format(#notes - MAX_SKIP_LINES) }
    end
end

-- Lines of the step on screen (Engine:Describe), or the no-guide / end-of-guide messages.
function P:Content()
    local E = Ding.Engine
    if not E.guide then
        return {
            { action = "info", text = L.NO_GUIDE },
            { indent = true, kind = "hint", text = L.NO_GUIDE_HINT },
        }
    end
    if E.finished then
        return {
            { action = "info", done = true, text = L.GUIDE_END },
            { indent = true, kind = "hint", text = L.GUIDE_END_HINT },
        }
    end
    local step, held = E:CurrentStep(), self.holding
    if held then step = held.step end
    local content = E:Describe(step)
    local service = not held and E:ServiceDone(step)
    if service then
        content[#content + 1] = { indent = true, kind = "hint", text = serviceHint(service) }
    elseif not held and E:IsManual(step) then
        content[#content + 1] = { indent = true, kind = "hint", text = manualHint() }
    end
    -- Bags almost full (Core/Merchant.lua).
    local free = not held and Ding.Merchant and Ding.Merchant:BagWarning()
    if Ding.Merchant then Ding.Merchant.shownWarning = free or nil end
    if free then content[#content + 1] = { indent = true, kind = "hint", text = L.BAGS_ALMOST_FULL:format(free) } end
    if not held then skippedLines(E, content) end
    -- The way there when walking is not the fastest (Core/Travel.lua, through the arrow).
    if not held and Ding.Arrow and Ding.Arrow.hint then
        content[#content + 1] = { indent = true, kind = "hint", text = Ding.Arrow.hint }
        -- The whole way, leg by leg, with its total time.
        local route = Ding.Travel:Itinerary(Ding.Travel.plan)
        if route then content[#content + 1] = { indent = true, kind = "hint", text = route } end
    end
    -- A log almost full, with quests the guide never uses: they can go (Guide tab).
    if not held and Compat.NumQuestsInLog() >= LOG_ALMOST_FULL then
        local unused = #E:UnusedLogQuests()
        if unused > 0 then content[#content + 1] = { indent = true, kind = "hint", text = L.CLEANUP_HINT:format(unused) } end
    end
    local mark = not held and E:StepMark() or nil
    if mark then
        content.mark = mark
        content[#content + 1] = { indent = true, kind = "hint",
            text = mark == "manual" and L.STEP_MARKED_DONE or L.STEP_MARKED_SKIPPED }
    end
    -- Objectives of other quests around the player (Core/Along.lua).
    if not held and Ding.Along then
        for _, e in ipairs(Ding.Along.shown) do
            content[#content + 1] = { action = "along", quest = e.quest, objective = e.index, sticky = e.sticky }
        end
    end
    if not held then
        self:Extras(step, content)
        local count = Ding.db.panel.preview or 0
        for _, s in ipairs(count > 0 and E:NextSteps(count) or {}) do
            content[#content + 1] = { action = "preview", step = s }
        end
    end
    return content
end

-- Under the step: the trip to an NPC of the directory (UI/Finder.lua; a press takes the arrow
-- back), training waiting at the class trainer (Core/Training.lua), a weapon to learn
-- (Core/Directory.lua), a gear upgrade in the bags (Core/Gear.lua), the next talent
-- (Core/Talents.lua).
function P:Extras(step, content)
    local trip = Ding.Finder and Ding.Finder.trip
    if trip then
        local pad = Ding.Gamepad:Active()
        content[#content + 1] = { action = "trip", text = L.FINDER_TRIP:format(trip.name or "?", trip.label or "?"),
            sub = pad and L.DIR_TRIP_PAD:format(Ding.Gamepad:ButtonName("PAD1")) or L.DIR_TRIP_MOUSE }
    end
    local due = Ding.Training and not (step and step.train) and Ding.Training:Due()
    if due then
        content[#content + 1] = { action = "service", service = "trainer",
            text = type(due) == "number" and L.TRAINING_DUE:format(Compat.MoneyText(due))
                or L.TRAINING_DUE_GUESS:format(UnitLevel("player")) }
    end
    local weapon = Ding.db.panel.weaponReminder and not trip and Ding.Directory and Ding.Directory:WeaponReminder()
    if weapon then
        local names = {}
        for i, w in ipairs(weapon.weapons) do
            if i <= 3 then names[i] = w.label end
        end
        local text = table.concat(names, ", ")
        if #weapon.weapons > 3 then text = text .. " " .. L.PREVIEW_MORE:format(#weapon.weapons - 3) end
        local best = weapon.best
        content[#content + 1] = { action = "weapon", entry = best, what = weapon.weapons[1].label,
            text = (#weapon.weapons > 1 and L.WEAPONS_TO_LEARN or L.WEAPON_TO_LEARN):format(text, best.name or "?",
                Ding.Directory:Place(best.point) or "?") }
    end
    local up = Ding.Gear and Ding.Gear.upgrade
    if up then
        local pad = Ding.Gamepad:Active()
        content[#content + 1] = { action = "gear", item = up.id, text = L.GEAR_ROW:format(up.link or "?"),
            counter = ("+%d"):format(math.floor(up.gain + 0.5)), sub = pad and L.GEAR_ROW_PAD or L.GEAR_ROW_MOUSE }
    end
    -- A quest found elsewhere in the guide (P:FindQuest): go there, or never mind.
    local offer = self.findOffer
    local E = Ding.Engine
    if offer and (offer.from.guide ~= (E.guide and E.guide.id) or offer.from.index ~= E.index) then
        offer, self.findOffer = nil, nil    -- the guide moved on meanwhile
    end
    if offer then
        local pad = Ding.Gamepad:Active()
        local g = Ding:GetGuide(offer.guide)
        content[#content + 1] = { action = "jump", quest = offer.quest,
            text = L.FIND_JUMP:format(offer.index, g and g.title or offer.guide),
            sub = L["FIND_" .. offer.action:upper()]:format(Ding.Data:QuestName(offer.quest) or "?") .. " · "
                .. (pad and L.FIND_JUMP_PAD:format(Ding.Gamepad:ButtonName("PAD1")) or L.FIND_JUMP_MOUSE) }
    end
    -- A flight master next to the player on a continent where no flight map was opened yet.
    local fm = not (step and step.fly) and Ding.Travel:NewContinentFlightMaster()
    if fm then
        content[#content + 1] = { action = "service", service = "flight",
            text = L.TAXI_NEW_CONTINENT:format(fm.name or "?") }
    end
    -- A free talent point: the build's next talent (Core/Talents.lua), learned on a
    -- confirmed press.
    local talent = Ding.Talents and Ding.Talents:Suggestion()
    if talent then
        local pad = Ding.Gamepad:Active()
        local armed = Ding.Talents:Armed(talent)
        local button = Ding.Gamepad:ButtonName("PAD1")
        local sub
        if armed then
            sub = pad and L.TALENT_CONFIRM_PAD:format(button) or L.TALENT_CONFIRM_MOUSE
        else
            sub = pad and L.TALENT_ROW_PAD:format(button) or L.TALENT_ROW_MOUSE
        end
        content[#content + 1] = { action = "talent", talent = talent, text = L.TALENT_ROW:format(talent.name or "?"),
            counter = ("%d/%d"):format(talent.rank + 1, talent.maxRank), sub = sub }
    end
    -- Past the section's levels: next section, turn in first, or stay.
    local offer = Ding.Engine:WrapUpOffer()
    if offer then
        content[#content + 1] = { action = "wrapup", wrap = "next", text = L.WRAP_NEXT:format(offer.next.title),
            sub = L.WRAP_INFO:format(Ding.Engine.guide.maxLevel) }
        if offer.turnins > 0 then
            content[#content + 1] = { action = "wrapup", wrap = "turnin", text = L.WRAP_TURNIN:format(offer.turnins) }
        end
        content[#content + 1] = { action = "wrapup", wrap = "stay", text = L.WRAP_STAY }
    end
end

-- Step shown and total: the held step while it stays on screen.
local function progress(E, held)
    local total = #E.guide.steps
    if held then return held.index, total end
    return E.finished and total or math.min(E.index, total), total
end

-- The engine moved on because the step on screen got done: keep it, all green, 1.5 s.
function P:CheckHold()
    local E, last = Ding.Engine, self.lastShown
    self.lastShown = E.guide and { guide = E.guide, index = E.index } or nil
    local held = self.holding
    if held and (E.guide ~= held.guide or E.index ~= held.target) then
        self.holding = nil
    end
    if self.holding or not last or not E.guide or last.guide ~= E.guide or E.index <= last.index then return end
    -- Only when the engine moved by itself; catching up after login does not count.
    if not E.autoMoved or E:IsResuming() then return end
    local step = E.guide.steps[last.index]
    if not step or E:IsManual(step) or not E:IsStepDone(step, last.index) then return end
    local token = {}
    self.holding = { guide = E.guide, index = last.index, step = step, target = E.index, token = token }
    C_Timer.After(HOLD, function()
        if P.holding and P.holding.token == token then
            P.holding = nil
            Ding:Safe(P.Update, P)
        end
    end)
end

-- Focus mode: A uses the quest item when the focused row is the item's (a secure click).
local function syncItemKey()
    if Ding.Gamepad.owner ~= P.frame then return end
    local row = P.rowsShown and P.rowsShown[P.focusIndex]
    local button = _G.DingItemButton
    local use = row and row.kind == "use" and button and button:IsShown()
        and (not row.item or row.item == Ding.ItemButton.item)
    Ding.Gamepad:Redirect("PAD1", use and "DingItemButton" or nil)
end

local function setGlyph(glyph, action, show)
    local key = show and Ding.Gamepad:BindingKey(action)
    if key then
        glyph:SetKey(key)
        glyph:Show()
        return true
    end
    glyph:Hide()
    return false
end

-- Lays out one row at offset y (from the window top); returns its height.
local function layoutRow(f, i, data, y, width)
    local r = f.rows[i] or newRow(f)
    f.rows[i] = r
    r.data = data
    local focused = P.focusing and P.focusIndex == i
    local look = STATES[data.state] or STATES.todo
    r:ClearAllPoints()
    r:SetPoint("TOPLEFT", f, "TOPLEFT", LIST_PAD, y)
    r:SetWidth(width)
    if look.row then
        r.bg:SetColor(look.row)
        r.bg:Show()
    else
        r.bg:Hide()
    end
    r.focus:SetShown(focused)
    setIcon(r.icon, data, look)

    local counterWidth = 0
    if data.counter and data.state ~= "impossible" then
        r.counter:SetText(data.counter)
        r.counter:SetTextColor(unpack(look.counter))
        counterWidth = math.max(COUNTER_MIN, UI.Measure(r.counter))
        r.counter:SetWidth(counterWidth)
        r.counter:Show()
    else
        r.counter:Hide()
    end
    local textWidth = width - ROW_PAD_X * 2 - ICON - ROW_GAP_X - (counterWidth > 0 and counterWidth + ROW_GAP_X or 0)
    r.text:SetWidth(textWidth)
    local text = data.text or ""
    if data.state == "impossible" or data.state == "preview" then text = UI.StripColors(text) end
    r.text:SetText(text)
    r.text:SetTextColor(unpack(focused and C.text or look.text))
    local height = r.text:GetStringHeight()
    if data.sub then
        r.sub:SetWidth(textWidth)
        r.sub:SetText(data.sub)
        r.sub:Show()
        height = height + 2 + r.sub:GetStringHeight()
    else
        r.sub:Hide()
    end
    height = ROW_PAD_Y * 2 + math.max(ICON, height)
    r:SetHeight(height)
    r:Show()
    return height
end

function P:LayoutFull()
    local f, db, E = self.frame, Ding.db.panel, Ding.Engine
    local width, guide, held = db.width, E.guide, self.holding
    f.mini:Hide()
    for _, region in ipairs({ f.menu, f.close, f.minimize, f.finder, f.title, f.titleArea, f.titleDivider,
        f.stepDivider, f.prev, f.next, f.stepText, f.stepTotal, f.zone }) do
        region:Show()
    end
    -- In focus mode, the directory's button can take the focus (above the first row): A on it.
    local onFinder = self.focusing and self.focusIndex == 0
    f.finder.focus:SetShown(onFinder)
    local finderKey = onFinder and Ding.Gamepad:Active()
    if finderKey then f.finder.key:SetKey("PAD1") end
    f.finder.key:SetShown(finderKey and true or false)
    f.title:SetWidth(width - 28 - 76 - (finderKey and (f.finder.key:GetWidth() + 6) or 0))
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. (guide and guide.title or L.GUIDE_NONE))

    -- Step bar
    local y = -(TITLE_HEIGHT + 1 + (STEP_HEIGHT - 24) / 2)
    local x = 6
    local chips = db.keyHints and Ding.Gamepad:Active()
    if setGlyph(f.lb, "DING_PREV", chips) then
        f.lb:ClearAllPoints()
        f.lb:SetPoint("TOPLEFT", f, "TOPLEFT", x, y - 5)
        x = x + f.lb:GetWidth() + 6
    end
    f.prev:ClearAllPoints()
    f.prev:SetPoint("TOPLEFT", f, "TOPLEFT", x, y)
    x = x + 24 + 6
    local current, total = 0, 0
    if guide then current, total = progress(E, held) end
    f.stepText:SetText(L.STEP_LABEL:format(current))
    f.stepTotal:SetText(L.STEP_TOTAL:format(total))
    f.stepText:ClearAllPoints()
    f.stepText:SetPoint("TOPLEFT", f, "TOPLEFT", x, y - 4)
    f.stepTotal:ClearAllPoints()
    f.stepTotal:SetPoint("TOPLEFT", f.stepText, "TOPRIGHT", 0, 0)
    x = x + f.stepText:GetStringWidth() + f.stepTotal:GetStringWidth() + 6
    f.next:ClearAllPoints()
    f.next:SetPoint("TOPLEFT", f, "TOPLEFT", x, y)
    x = x + 24 + 6
    if setGlyph(f.rb, "DING_NEXT", chips) then
        f.rb:ClearAllPoints()
        f.rb:SetPoint("TOPLEFT", f, "TOPLEFT", x, y - 5)
        x = x + f.rb:GetWidth() + 6
    end
    f.zone:ClearAllPoints()
    f.zone:SetPoint("TOPRIGHT", f, "TOPRIGHT", -6, y - 5)
    f.zone:SetWidth(math.max(0, width - 6 - x))
    f.zone:SetText(Compat.ZoneText() or "")
    f.prev:SetEnabled(guide ~= nil and E.index > 1)
    f.next:SetEnabled(guide ~= nil and not E.finished)

    -- Rows
    local rows = self:Rows()
    self.rowsShown = rows
    if self.focusing then
        -- The step may have changed under the focus: keep it on a row, and A on its target.
        self.focusIndex = clamp(self.focusIndex or 1, self.focusIndex == 0 and 0 or 1, math.max(1, #rows))
        syncItemKey()
    end
    y = -LIST_TOP - LIST_PAD
    for i, data in ipairs(rows) do
        if i > 1 then y = y - ROW_GAP end
        y = y - layoutRow(f, i, data, y, width - 2 * LIST_PAD)
    end
    for i = #rows + 1, #f.rows do f.rows[i]:Hide() end
    y = y - LIST_PAD

    -- Progress: 2 above, 8 on the sides and below.
    y = y - 2
    f.trackHolder:ClearAllPoints()
    f.trackHolder:SetPoint("TOPLEFT", f, "TOPLEFT", 8, y)
    f.trackHolder:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, y)
    f.trackHolder:Show()
    local ratio = total > 0 and (E.finished and 1 or current / total) or 0
    f.fillHolder:ClearAllPoints()
    f.fillHolder:SetPoint("TOPLEFT", f, "TOPLEFT", 8, y)
    f.fillHolder:SetWidth(math.max(4, (width - 16) * ratio))
    f.fillHolder:SetShown(ratio > 0)
    f:SetHeight(-y + 3 + 8)
end

function P:LayoutCompact()
    local f, E = self.frame, Ding.Engine
    local width, m = Ding.db.panel.width, f.mini
    f.finder.key:Hide()
    for _, region in ipairs({ f.menu, f.close, f.minimize, f.finder, f.title, f.titleArea, f.titleDivider,
        f.stepDivider, f.prev, f.next, f.stepText, f.stepTotal, f.zone, f.lb, f.rb, f.trackHolder, f.fillHolder }) do
        region:Hide()
    end
    for _, r in ipairs(f.rows) do r:Hide() end
    m:Show()

    local rows = self:Rows()
    local data
    for _, row in ipairs(rows) do
        if row.state == "todo" then data = row break end
    end
    data = data or rows[1] or { text = "", state = "impossible", kind = "other" }
    local done = self.holding ~= nil or data.state == "done"
    local current, total = 0, 0
    if E.guide then current, total = progress(E, self.holding) end
    local look = STATES[done and "done" or data.state] or STATES.todo

    -- Done: no buttons, 8 on the sides; otherwise 4, menu and expand buttons.
    local pad = done and 8 or 4
    local x = pad
    m.menu:SetShown(not done)
    m.expand:SetShown(not done)
    if not done then
        m.menu:ClearAllPoints()
        m.menu:SetPoint("LEFT", m, "LEFT", x, 0)
        x = x + 20 + 6
    end
    m.count:SetText(L.COMPACT_COUNT:format(current, total))
    m.count:ClearAllPoints()
    m.count:SetPoint("LEFT", m, "LEFT", x, 0)
    x = x + m.count:GetStringWidth() + 6
    m.icon:ClearAllPoints()
    m.icon:SetPoint("LEFT", m, "LEFT", x, 0)
    m.icon.bg:SetColor(look.icon)
    local glyph = done and "icon_check" or ({ kill = "icon_diamond", collect = "circle" })[data.kind] or "caret_up"
    m.icon.tex:SetTexture(UI.TEX .. glyph)
    m.icon.tex:SetSize(done and 9 or 5, done and 9 or 5)
    m.icon.tex:SetRotation(glyph == "caret_up" and -math.pi / 2 or 0)
    m.icon.tex:SetVertexColor(unpack(look.glyph))
    x = x + 14 + 6

    local right = done and pad or (4 + 20 + 6)
    local counter = data.counter or ""
    m.counter:SetText(counter)
    m.counter:SetTextColor(unpack(look.counter))
    m.counter:ClearAllPoints()
    m.counter:SetPoint("RIGHT", m, "RIGHT", -right, 0)
    m.counter:SetShown(counter ~= "")
    local counterWidth = counter ~= "" and (m.counter:GetStringWidth() + 6) or 0
    m.text:ClearAllPoints()
    m.text:SetPoint("LEFT", m, "LEFT", x, 0)
    m.text:SetWidth(math.max(20, width - x - right - counterWidth))
    m.text:SetText(UI.StripColors(data.text or ""))
    m.text:SetTextColor(unpack(done and C.done or (data.state == "impossible" and C.disabled or C.text)))

    local ratio = total > 0 and (E.finished and 1 or current / total) or 0
    m.lineFill:SetWidth(math.max(1, (width - 6) * ratio))
    m.lineFill:SetShown(ratio > 0)
    f:SetHeight(COMPACT_HEIGHT)
end

function P:Update()
    local f = self.frame
    if not f then return end
    local db = Ding.db.panel
    f:SetShown(self:Visible())
    updateItemButton()
    if not f:IsShown() then
        if self.focusing then self:StopFocus() end
        return
    end
    self:CheckHold()
    f:SetWidth(db.width)
    f.look:SetBgAlpha(db.bgAlpha or 0.85)
    if self.compact then
        self:LayoutCompact()
    else
        self:LayoutFull()
    end
end

---------------------------------------------------------------------------
-- Focus mode (DING_FOCUS): the D-pad walks the rows, A points the arrow to a row (or
-- uses the quest item on its row), X shows its quest, LB / RB change step, Y minimizes,
-- B leaves.
-- Only these keys are taken; the others keep their game binding.
---------------------------------------------------------------------------
function P:StartFocus()
    if InCombatLockdown() or not self.frame then return end
    -- The settings window and the move mode own the gamepad while they are open.
    local config = Ding.Config.frame
    if (config and config:IsShown()) or Ding.Gamepad:IsMoving() then return end
    if not Ding.db.panel.shown then self:SetShown(true) end
    if self.compact then self:SetCompact(false) end
    self.focusing = true
    self:Update()
    self.focusIndex = 1
    for i, row in ipairs(self.rowsShown or {}) do
        if row.state == "todo" then self.focusIndex = i break end
    end
    Ding.Gamepad:Take(self.frame, function(key) P:OnFocusKey(key) end, 0.4, 0.12, FOCUS_KEYS)
    syncItemKey()
    self:Update()
end

function P:StopFocus()
    if not self.focusing then return end
    self.focusing = false
    for _, row in ipairs(self.frame.rows) do hideQuest(row) end
    Ding.Gamepad:Release(self.frame)
    self:Update()
end

function P:ToggleFocus()
    if self.focusing then self:StopFocus() else self:StartFocus() end
end

function P:OnFocusKey(key)
    local count = #(self.rowsShown or {})
    if key == "PADDUP" or key == "PADDDOWN" then
        if count > 0 then
            for _, row in ipairs(self.frame.rows) do hideQuest(row) end
            -- Above the first row: the directory's button.
            self.focusIndex = clamp((self.focusIndex or 1) + (key == "PADDUP" and -1 or 1), 0, count)
            syncItemKey()
            self:Update()
        end
    elseif key == "PAD1" then
        if self.focusIndex == 0 then
            self:StopFocus()
            return Ding.Finder:Open()
        end
        self:Aim(self.rowsShown and self.rowsShown[self.focusIndex])
    elseif key == "PAD3" then
        local row = self.frame.rows[self.focusIndex]
        if row then self:ShowQuest(row.data, row) end
    elseif key == "PADLSHOULDER" then
        Ding.Engine:Prev()
    elseif key == "PADRSHOULDER" then
        Ding.Engine:Next()
    elseif key == "PAD4" then
        self:StopFocus()
        self:SetCompact(true)
    elseif key == "PAD2" or key == "PADFORWARD" then
        self:StopFocus()
    elseif key == "PADDLEFT" then
        -- On a gear upgrade: not wanted. On a jump offer: never mind.
        local row = self.rowsShown and self.rowsShown[self.focusIndex]
        if row and row.action == "gear" then Ding.Gear:Decline() end
        if row and row.action == "jump" then self:CancelFind() end
    elseif key == "PADDRIGHT" then
        -- On a row with a quest: where the guide deals with it.
        local row = self.rowsShown and self.rowsShown[self.focusIndex]
        if row and row.quest then self:FindQuest(row.quest) end
    end
end

---------------------------------------------------------------------------
-- Events: minimize in combat, hide in dungeons
---------------------------------------------------------------------------
Ding:On("PLAYER_REGEN_DISABLED", function()
    if P.focusing then P:StopFocus() end
    if Ding.db and Ding.db.panel.compactInCombat and not P.compact then P:SetCompact(true, true) end
end)
Ding:On("PLAYER_REGEN_ENABLED", function()
    if P.combatCompact then P:SetCompact(false) end
end)
Ding:On("PLAYER_ENTERING_WORLD", function() P:Update() end)
Ding:On("ZONE_CHANGED_NEW_AREA", function() P:Update() end)
Ding:On("ZONE_CHANGED", function() P:Update() end)
