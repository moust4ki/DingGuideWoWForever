-- Report a problem (the window: UI/Report.lua): what Ding writes down for the people who make
-- the guide, as GitHub Markdown with English labels (the player's words stay as typed). The
-- guide pack, its section and the step (its number as the guide window shows it, its index in
-- the guide's file, its summary and its keys); where the character stands (map, position,
-- level, race, class, side); the step's quests and the quests of the log the next steps name
-- (state, objectives with the client's counters); what the arrow points at; the settings that
-- change the route, the theme, TomTom; Ding's version, the client's language and build, the
-- date (UTC). Never the character's name, the realm nor the account. The last KEEP reports stay
-- in DingDB.reports, outside the settings ("Restore all defaults" keeps them): a player who
-- cannot copy a text (a gamepad alone) can send the file.
local _, Ding = ...
local Compat = Ding.Compat

local R = {}
Ding.Report = R

R.KEEP = 20
R.NEXT_STEPS = 3      -- the next steps whose quests of the log are listed too
R.ISSUE_URL = "https://github.com/moust4ki/DingGuideWoWForever/issues/new?template=ding-report.yml"
R.FILE = "WTF\\Account\\<account>\\SavedVariables\\Ding.lua"

-- The ready reasons (with a gamepad, typing is hard): the window's words, the text's.
R.REASONS = {
    { key = "npc", label = "REPORT_REASON_NPC", text = "The NPC is not there" },
    { key = "arrow", label = "REPORT_REASON_ARROW", text = "The arrow points to the wrong place" },
    { key = "quest", label = "REPORT_REASON_QUEST", text = "The quest is not offered" },
    { key = "other", label = "REPORT_REASON_OTHER", text = "Something else" },
}

-- The settings that change the route (Ding.db.ui).
R.OPTIONS = { "elites", "dungeons", "hearth", "deathSkip", "skipGrey", "serviceSteps", "trainerSteps", "flightSteps" }

local STATES = { log = "in the log", ready = "ready to turn in", turnedin = "turned in", none = "not in the log" }

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------
-- A text of the game or of a guide on one line, without the client's escapes (colors,
-- textures): a "|" left alone would start one in the window's box.
local function clean(s)
    if type(s) ~= "string" then return nil end
    s = s:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|T.-|t", ""):gsub("|", "/")
    s = s:gsub("%s*\n%s*", " "):gsub("^%s+", ""):gsub("%s+$", "")
    return s
end
R.Clean = clean

local function one(n) return ("%.1f"):format(n) end

-- fn's result, nil when it fails: a part that cannot be read must not stop the report.
local function try(fn, ...)
    local ok, a, b, c, d = pcall(fn, ...)
    if ok then return a, b, c, d end
    return nil
end

local function number(v)
    v = Compat.Plain(v)
    return type(v) == "number" and v or nil
end

---------------------------------------------------------------------------
-- What the report holds
---------------------------------------------------------------------------
local function questState(q)
    if Compat.IsInLog(q) then return Compat.IsQuestReady(q) and "ready" or "log" end
    if Ding.Engine:IsTurnedIn(q) then return "turnedin" end
    return "none"
end

-- A quest: id, its English name (and the client's when it differs), level, state, where the
-- guide names it, and its objectives as the client gives them (text, have / need, done).
local function questInfo(q, where)
    local D = Ding.Data
    local info = { id = q, where = where, state = questState(q), objectives = {} }
    info.name = clean(try(D.QuestEnglishName, D, q))
    local shown = clean(try(D.QuestName, D, q))
    if shown ~= info.name then info.shownName = shown end
    info.level = try(D.QuestLevel, D, q)
    if info.state == "log" or info.state == "ready" then
        for _, o in ipairs(Compat.GetObjectives(q)) do
            info.objectives[#info.objectives + 1] = { text = clean(o.text), have = tonumber(o.numFulfilled),
                need = tonumber(o.numRequired), finished = o.finished }
        end
    end
    return info
end

local function stepQuests(step, out)
    out = out or {}
    for _, key in ipairs({ "accept", "complete", "turnin" }) do
        local list = step and step[key]
        if type(list) == "number" then list = { list } end
        for _, q in ipairs(type(list) == "table" and list or {}) do out[#out + 1] = q end
    end
    return out
end

-- The guide: the step on screen (the one held a moment after it is done, as the window shows
-- it), its number among the character's steps and its index in the guide's file.
local function guideInfo()
    local E, P = Ding.Engine, Ding.Panel
    local guide, index = E.guide, E.index
    if not guide then return nil end
    local held = P and P.holding
    if held and held.guide then guide, index = held.guide, held.index end
    local step = guide.steps[index]
    local pack = guide.pack and Ding:GetGuidePack(guide.pack)
    local info = {
        id = guide.id, title = clean(guide.title), packId = guide.pack, pack = clean(pack and pack.title),
        index = index, count = #guide.steps, finished = E.finished and not held, step = step,
    }
    info.number, info.total = E:StepNumber(info.finished and #guide.steps or index, guide)
    if step then
        info.summary = clean(try(E.Summary, E, step))
        info.keys = try(Ding.Import.StepText, Ding.Import, step)
    end
    return info
end

-- The step's quests whatever their state, then the quests of the log that the next steps name.
local function questsInfo(guide)
    local list, seen = {}, {}
    if not guide then return list end
    for _, q in ipairs(stepQuests(guide.step)) do
        if not seen[q] then
            seen[q] = true
            list[#list + 1] = questInfo(q, "this step")
        end
    end
    local E = Ding.Engine
    local where = {}
    for i, s in ipairs(E.guide and E.guide.steps or {}) do where[s] = i end
    for _, s in ipairs(try(E.NextSteps, E, R.NEXT_STEPS) or {}) do
        local index = where[s]
        for _, q in ipairs(stepQuests(s)) do
            if not seen[q] and Compat.IsInLog(q) then
                seen[q] = true
                local n = index and E:StepNumber(index) or nil
                list[#list + 1] = questInfo(q, n and ("step " .. n) or "a next step")
            end
        end
    end
    return list
end

local function playerInfo()
    local p = {}
    p.map, p.x, p.y = Compat.GetPlayerMapPosition()
    p.zone = p.map and clean(Compat.MapName(p.map)) or nil
    p.place = clean(Compat.ZoneText())
    p.level = number(try(UnitLevel, "player"))
    p.race, p.raceName = Compat.PlayerRace(), clean((try(UnitRace, "player")))
    p.class, p.className = Compat.PlayerClass(), clean((try(UnitClass, "player")))
    local faction, factionName = try(UnitFactionGroup, "player")
    p.faction, p.factionName = clean(faction), clean(factionName)
    return p
end

-- Yards between the player and a point { map, x, y }; nil on another continent or unknown.
local function distanceTo(point)
    local continent, px, py = Compat.GetPlayerWorld()
    if not continent or not point.map then return nil end
    local c, wx, wy = Compat.MapToWorld(point.map, point.x, point.y)
    if c ~= continent or not wx then return nil end
    return math.sqrt((wx - px) ^ 2 + (wy - py) ^ 2), true
end

-- What the arrow points at now: the point it shows (a farming loop's stop, a flight master on
-- the way), the travel hint, the directory's trip, the step's number of candidate points.
local function arrowInfo()
    local A, E = Ding.Arrow, Ding.Engine
    local info = { candidates = #(E.candidates or {}) }
    local point = A and (A.shownPoint or A.point)
    if point then
        info.label = clean(point.label)
        info.map, info.x, info.y = point.map, point.x, point.y
        info.zone = point.map and clean(Compat.MapName(point.map)) or nil
        info.npc, info.object = point.npc, point.object
        info.distance = try(distanceTo, point)
    end
    info.hint = A and clean(A.hint)
    local trip = Ding.Finder and Ding.Finder.trip
    if trip then info.trip = clean(trip.label .. ": " .. (trip.name or "?")) end
    info.shown = Ding.db.arrow.shown and true or false
    return info
end

local function settingsInfo()
    local ui = Ding.db.ui
    local options = {}
    for _, key in ipairs(R.OPTIONS) do options[#options + 1] = { key = key, on = ui[key] and true or false } end
    return {
        options = options, theme = ui.theme,
        tomtom = Ding.db.arrow.tomtom and true or false, tomtomLoaded = Compat.IsAddOnLoaded("TomTom"),
    }
end

local function clientInfo()
    local c = { version = Ding.version, locale = try(GetLocale) }
    local version, build = try(GetBuildInfo)
    c.build = version and (version .. (build and (" (" .. build .. ")") or "")) or nil
    c.at = try(date, "!%Y-%m-%d %H:%M UTC")
    return c
end

-- Everything the report holds, read now (the window shows it, the text writes it).
function R:Collect()
    local guide = guideInfo()
    return {
        guide = guide,
        player = playerInfo(),
        quests = questsInfo(guide),
        arrow = arrowInfo(),
        settings = settingsInfo(),
        client = clientInfo(),
    }
end

---------------------------------------------------------------------------
-- The text (GitHub Markdown)
---------------------------------------------------------------------------
function R:Reason(key)
    for _, reason in ipairs(self.REASONS) do
        if reason.key == key then return reason end
    end
    return nil
end

-- The player's first line, cut after a word near 60 characters ("...").
local function firstLine(s)
    s = (s or ""):match("^%s*([^\n]*)") or ""
    s = s:gsub("%s+$", "")
    if #s <= 60 then return s end
    local cut = s:sub(1, 57)
    local words = cut:match("^(.*%S)%s+%S*$")
    if words and #words >= 30 then cut = words end
    -- Never half a character (UTF-8).
    cut = cut:gsub("[\192-\255][\128-\191]*$", function(c)
        local lead = c:byte(1)
        local size = lead >= 240 and 4 or lead >= 224 and 3 or 2
        return #c == size and c or ""
    end)
    return cut .. "..."
end

-- The short line a player can use as the issue's title: the step, then what went wrong (the
-- player's first words when no ready reason says it).
function R:Title(info, reasonKey, comment)
    local g = info.guide
    local where = g and ("Step %d/%d of %s"):format(g.number, g.total, g.title or g.id) or "No guide"
    local reason = self:Reason(reasonKey)
    local what = reason and reason.key ~= "other" and reason.text or nil
    if not what and firstLine(comment) ~= "" then what = firstLine(comment) end
    return "Ding! report: " .. where .. (what and (": " .. what) or "")
end

local function questLine(q)
    local name = q.name or "?"
    if q.shownName then name = name .. " / " .. q.shownName end
    local level = q.level and q.level > 0 and (", level " .. q.level) or ""
    return ("- [%d] %s%s: %s (%s)"):format(q.id, name, level, STATES[q.state] or q.state, q.where)
end

local function objectiveLine(o)
    local count = (o.have and o.need) and (" (%d/%d)"):format(o.have, o.need) or ""
    return ("  - %s%s%s"):format(o.text or "?", count, o.finished and ", done" or "")
end

function R:Text(info, reasonKey, comment)
    local out = {}
    local function add(line) out[#out + 1] = line end
    add(self:Title(info, reasonKey, comment))
    add("")
    local reason = self:Reason(reasonKey)
    add("**What went wrong:** " .. (reason and reason.text or "not chosen"))
    comment = (comment or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if comment ~= "" then
        add("")
        add("**In the player's words:**")
        for line in (comment .. "\n"):gmatch("(.-)\r?\n") do add("> " .. line) end
    end

    local g = info.guide
    add("")
    add("### Guide")
    if g then
        add(("- Pack: %s (`%s`)"):format(g.pack or "?", tostring(g.packId)))
        add(("- Section: %s (`%s`)"):format(g.title or "?", g.id))
        add(("- Step: %d / %d, index %d of %d in the guide's file%s"):format(g.number, g.total, g.index, g.count,
            g.finished and ", section finished" or ""))
        if g.summary and g.summary ~= "" then add("- Summary: " .. g.summary) end
        if g.keys then add("- Keys: `" .. g.keys .. "`") end
    else
        add("- No guide")
    end

    local p = info.player
    add("")
    add("### Player")
    if p.map then
        add(("- Map: %s, UiMap %d%s"):format(p.zone or "?", p.map, p.place and (", " .. p.place) or ""))
        add(("- Position: %s, %s"):format(one(p.x), one(p.y)))
    else
        add("- Position: unknown here" .. (p.place and (" (" .. p.place .. ")") or ""))
    end
    add(("- Level %s %s %s, %s"):format(p.level or "?", p.race or "?", p.class or "?", p.faction or "?"))

    add("")
    add("### Quests")
    if #info.quests == 0 then add("- None for this step") end
    for _, q in ipairs(info.quests) do
        add(questLine(q))
        for _, o in ipairs(q.objectives) do add(objectiveLine(o)) end
    end

    local a = info.arrow
    add("")
    add("### Arrow")
    if a.label or a.map then
        local where = a.map and (" at %s, %s, UiMap %d%s"):format(one(a.x or 0), one(a.y or 0), a.map,
            a.zone and (" (" .. a.zone .. ")") or "") or ""
        local ids = (a.npc and (", NPC " .. a.npc) or "") .. (a.object and (", object " .. a.object) or "")
        local far = a.distance and (", %d yards away"):format(math.floor(a.distance + 0.5)) or ", distance unknown"
        add(("- Points to: %s%s%s%s"):format(a.label or "?", ids, where, far))
    else
        add("- No target")
    end
    if a.hint then add("- Travel: " .. a.hint) end
    if a.trip then add("- Directory trip: " .. a.trip) end
    add(("- Candidate points for this step: %d"):format(a.candidates))
    if not a.shown then add("- The arrow is hidden") end

    local s = info.settings
    add("")
    add("### Settings")
    local options = {}
    for _, o in ipairs(s.options) do options[#options + 1] = o.key .. " " .. (o.on and "on" or "off") end
    add("- Route: " .. table.concat(options, ", "))
    add(("- Theme: %s; TomTom: %s%s"):format(tostring(s.theme), s.tomtom and "on" or "off",
        s.tomtomLoaded and " (installed)" or ""))

    local c = info.client
    add("")
    add("### Client")
    add(("- Ding! %s, locale %s, game %s"):format(tostring(c.version), tostring(c.locale), c.build or "unknown"))
    add("- " .. (c.at or "date unknown"))
    return table.concat(out, "\n")
end

---------------------------------------------------------------------------
-- The reports kept (DingDB.reports: { at, title, text }, oldest first)
---------------------------------------------------------------------------
function R:Saved()
    local db = Ding.db
    if type(db.reports) ~= "table" then db.reports = {} end
    return db.reports
end

function R:Save(info, text, title)
    local list = self:Saved()
    list[#list + 1] = { at = info.client.at, title = title, text = text }
    while #list > self.KEEP do table.remove(list, 1) end
end

-- The report of `info` with a reason and the player's words: its text, kept with the others.
function R:Make(info, reasonKey, comment)
    local text = self:Text(info, reasonKey, comment)
    self:Save(info, text, self:Title(info, reasonKey, comment))
    return text
end
