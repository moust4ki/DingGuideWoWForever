-- Guide window (screen 01 of the design): rows of a step, the finished step kept 1.5 s,
-- the minimized line, title bar buttons, width, the gamepad focus mode; the minimap button
-- and the migration of settings saved before the design.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P, A, Cfg, B = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.Config, Ding.ItemButton
local L, C = Ding.L, Ding.UI.C

-- 456 "The Balance of Nature": kill young nightsabers and thistle boars.
-- 921 "Crown of the Earth": fill the Crystal Phial (5185) at the moonwell.
local PHIAL = 5185
-- Quest ids above 900000 are not in QuestieDB.
local Q1, Q2 = 900801, 900802
Ding.RegisterGuide({ id = "t-win", title = "Window", races = { "NightElf" }, steps = {
    { accept = 456, note = "Guide note." },     -- 1
    { complete = 456 },                            -- 2
    { train = true },                              -- 3
} })
Ding.RegisterGuide({ id = "t-hold", title = "Waiting", races = { "NightElf" }, steps = {
    { accept = Q1 }, { accept = Q2 }, { level = 60 },
} })
Ding.RegisterGuide({ id = "t-phial", title = "Phial", races = { "NightElf" }, steps = { { complete = 921 } } })

local function start(guide, level)
    if Cfg.frame and Cfg.frame:IsShown() then Cfg:Close() end
    if P.focusing then P:StopFocus() end
    P:SetCompact(false)
    T.reset({ level = level or 3 })
    Ding.db.panel.shown = true
    E:SetGuide(guide or "t-win", 1, true)
    H.flush()
end

local function rowTexts()
    local out = {}
    for _, row in ipairs(P.rowsShown) do out[#out + 1] = H.plain(row.text) end
    return table.concat(out, " | ")
end

---------------------------------------------------------------------------
-- Rows
---------------------------------------------------------------------------
T.test("accept row: Accept \"[level] quest\", with the guide note below", function()
    start()
    local row = P.rowsShown[1]
    T.eq(row.state, "todo")
    T.eq(H.plain(row.text), L.ROW_ACCEPT:format(L.QUEST_WITH_LEVEL:format(Ding.Data:QuestLevel(456),
        L.QUOTE:format(Ding.Data:QuestName(456)))))
    T.ok(row.text:find("|cff5bb4ff", 1, true), "quest name not a blue link")
    T.eq(row.sub, "Guide note.")
end)

T.test("log objectives: verb, name, counter; past tense once done", function()
    start()
    H.accept(456); H.flush()
    T.eq(E.index, 2, rowTexts())
    T.ok(#P.rowsShown >= 3, "objectives missing: " .. rowTexts())
    T.eq(P.rowsShown[1].action, "header")
    local row = P.rowsShown[2]
    T.eq(row.kind, "kill")
    T.eq(row.counter, "0/1")
    T.ok(H.plain(row.text):find("^" .. L.ROW_KILL:format("")), "verb: " .. H.plain(row.text))
    local r = P.frame.rows[2]
    T.ok(r.counter:IsShown() and r.counter.color[1] == C.todo[1], "red counter missing")
    T.eq(r.icon.tex.texture, Ding.UI.TEX .. "icon_diamond", "diamond for \"kill\"")
    -- Objectives done: the step stays until the turn-in, rows in the past tense.
    E.hold = true
    H.complete(456); H.flush()
    row = P.rowsShown[2]
    T.eq(row.state, "done", rowTexts())
    T.eq(H.plain(row.text), L.ROW_KILLED:format(row.target), "not in the past tense")
    T.eq(P.frame.rows[2].icon.tex.texture, Ding.UI.TEX .. "icon_check", "check mark for done objectives")
end)

-- The client's objectives as Forever can give them: `finished` secret, counts at 0. `fixed`:
-- objectives to report for quests the client no longer has in the log (turned in).
local function staleObjectives(fixed, fn)
    local api = _G.C_QuestLog.GetQuestObjectives
    _G.C_QuestLog.GetQuestObjectives = function(q)
        local list = api(q)
        if #list == 0 and fixed[q] then list = fixed[q] end
        local out = {}
        for i, obj in ipairs(list) do
            out[i] = { text = obj.text, type = obj.type, finished = H.SECRET, numFulfilled = 0,
                numRequired = obj.numRequired }
        end
        return out
    end
    local ok, err = pcall(fn)
    _G.C_QuestLog.GetQuestObjectives = api
    if not ok then error(err, 0) end
end

local function objectiveRowsOf(q)
    local out = {}
    for _, row in ipairs(P.rowsShown) do
        if row.action == "objective" and row.quest == q then out[#out + 1] = row end
    end
    return out
end

T.test("quest complete: its objectives turn green, even if the game still says they are to do", function()
    start()
    H.accept(456); H.flush()
    E.hold = true
    staleObjectives({}, function()
        H.complete(456); H.flush()
        T.eq(E.index, 2, rowTexts())
        local rows = objectiveRowsOf(456)
        T.ok(#rows >= 2, "objectives missing: " .. rowTexts())
        for _, row in ipairs(rows) do
            T.eq(row.state, "done", rowTexts())
            T.eq(row.counter, "1/1", "counter not full")
            T.eq(H.plain(row.text), L.ROW_KILLED:format(row.target), "not in the past tense")
        end
    end)
end)

T.test("quest turned in: its objectives stay green when the game resets them to 0", function()
    Ding.RegisterGuide({ id = "t-turnedin", title = "Turned in", races = { "NightElf" }, steps = {
        { complete = { 456, 921 } },
    } })
    start("t-turnedin", 5)    -- 921 is a level 5 quest
    T.quests({ [456] = "log", [921] = "log" })
    local before = _G.C_QuestLog.GetQuestObjectives(456)
    T.ok(#before >= 1, "objectives of 456 missing from the mocked log")
    T.quests({ [456] = "turnedin" })
    staleObjectives({ [456] = before }, function()
        E:Refresh(); H.flush()
        T.eq(E.index, 1, "the step still waits for 921")
        local rows = objectiveRowsOf(456)
        T.eq(#rows, #before, rowTexts())
        for _, row in ipairs(rows) do
            T.eq(row.state, "done", rowTexts())
            T.eq(row.counter, "1/1", "counter reset to 0")
        end
        for _, row in ipairs(objectiveRowsOf(921)) do T.eq(row.state, "todo", rowTexts()) end
    end)
end)

T.test("back to a past step: the monsters of a turned-in quest are green", function()
    start()
    H.accept(456); H.flush()
    local before = _G.C_QuestLog.GetQuestObjectives(456)
    T.quests({ [456] = "turnedin" })
    T.eq(E.index, 3, rowTexts())
    staleObjectives({ [456] = before }, function()
        E:Prev(); H.flush()
        T.eq(E.index, 2, rowTexts())
        local rows = objectiveRowsOf(456)
        T.eq(#rows, #before, rowTexts())
        for _, row in ipairs(rows) do
            T.eq(row.state, "done", rowTexts())
            T.eq(H.plain(row.text), L.ROW_KILLED:format(row.target), "not in the past tense")
        end
    end)
end)

T.test("objective with a full counter: done, even without the game's flag", function()
    start()
    H.accept(456); H.flush()
    local api = _G.C_QuestLog.GetQuestObjectives
    _G.C_QuestLog.GetQuestObjectives = function(q)
        local list = api(q)
        if list[1] then list[1].finished, list[1].numFulfilled = nil, list[1].numRequired end
        return list
    end
    E:Refresh(); H.flush()
    _G.C_QuestLog.GetQuestObjectives = api
    local rows = objectiveRowsOf(456)
    T.eq(rows[1].state, "done", rowTexts())
    T.eq(rows[2].state, "todo", rowTexts())
end)

T.test("client objective formats: positions, |4…; grammar and Lua magic characters", function()
    local cases = {
        -- French client (Forever): positional placeholders and |4singular:plural;
        { "%1$s : %2$d/%3$d |4personnage tué:personnages tués;", "Sanglier : 2/6 personnages tués", "Sanglier" },
        { "%1$s : %2$d/%3$d", "Viande de crocilisque : 0/5", "Viande de crocilisque" },
        -- English client
        { "%s slain: %d/%d", "Mottled Boar slain: 2/6", "Mottled Boar" },
        { "%s: %d/%d", "Scorpid Worker Tail: 3/8", "Scorpid Worker Tail" },
        -- Lua magic characters and a literal percent in the text around
        { "%s (+%d%%) [%d]", "Pierre (+5%) [3]", "Pierre" },
    }
    for _, c in ipairs(cases) do
        local pattern = P.FormatPattern(c[1])
        T.ok(pattern, "no pattern for " .. c[1])
        local ok, name = pcall(string.match, c[2], pattern)
        T.ok(ok, ("invalid pattern for %s: %s"):format(c[1], tostring(name)))
        T.eq(name, c[3], c[1])
    end
    T.eq(P.FormatPattern(nil), nil)
    T.eq(P.FormatPattern(""), nil)
end)

T.test("objective name: never an error, falls back to the text without the counter", function()
    local saved = { _G.QUEST_MONSTERS_KILLED, _G.QUEST_ITEMS_NEEDED, _G.QUEST_OBJECTS_FOUND }
    _G.QUEST_MONSTERS_KILLED, _G.QUEST_ITEMS_NEEDED, _G.QUEST_OBJECTS_FOUND = "%1$s : %2$d/%3$d |4a:b;", "%(", "%"
    P.ResetObjectivePatterns()
    T.eq(P.ObjectiveName({ text = "Viande de crocilisque : 0/5" }), "Viande de crocilisque")
    T.eq(P.ObjectiveName({ text = "Explorer la grotte" }), "Explorer la grotte")
    T.eq(P.ObjectiveName({}), "")
    _G.QUEST_MONSTERS_KILLED, _G.QUEST_ITEMS_NEEDED, _G.QUEST_OBJECTS_FOUND = saved[1], saved[2], saved[3]
    P.ResetObjectivePatterns()
end)

T.test("a display error stops neither the engine nor the other displays, reported once", function()
    start()
    local update, arrowUpdates = P.Update, 0
    local arrowUpdate = A.Update
    local handler, reported = _G.geterrorhandler, 0
    _G.geterrorhandler = function() return function() reported = reported + 1 end end
    P.Update = function() error("panel broken") end
    A.Update = function(self, ...) arrowUpdates = arrowUpdates + 1; return arrowUpdate(self, ...) end
    E:Refresh(); E:Refresh()
    P.Update, A.Update, _G.geterrorhandler = update, arrowUpdate, handler
    T.eq(arrowUpdates, 2, "the arrow is no longer updated")
    T.eq(reported, 1, "error not reported, or reported every time")
end)

T.test("objectives: under a header with their quest's level and name, unless the step names it", function()
    start()
    H.accept(456); H.flush()
    T.eq(E.index, 2)
    local header = P.rowsShown[1]
    T.eq(header.action, "header")
    T.eq(header.state, "header")
    T.eq(header.quest, 456)
    T.eq(H.plain(header.text), L.QUEST_WITH_LEVEL:format(Ding.Data:QuestLevel(456), L.QUOTE:format(Ding.Data:QuestName(456))))
    T.ok(header.text:find("|cff5bb4ff", 1, true), "quest name not a blue link")
    for i = 2, #P.rowsShown do
        local row = P.rowsShown[i]
        T.eq(row.action, "objective")
        T.ok(row.nested, "objective not under its header")
        T.eq(row.sub, nil, "quest repeated under an objective")
    end
    -- In the window: SemiBold, no icon nor background; the objectives indented.
    local h, o = P.frame.rows[1], P.frame.rows[2]
    T.ok(not h.icon:IsShown() and not h.bg:IsShown(), "header with an icon or a background")
    T.eq(h.text.fontObject, Ding.UI.Font("semibold", 12))
    T.eq(o.text.fontObject, Ding.UI.Font("regular", 12))
    T.ok(o.icon:IsShown(), "objective without its icon")
    T.ok(select(4, o:GetPoint()) > select(4, h:GetPoint()), "objectives not indented")
    -- A turn-in row of the same quest in the step already names it: no header.
    Ding.RegisterGuide({ id = "t-named", title = "Named", races = { "NightElf" }, steps = {
        { turnin = 456, complete = 456 },
    } })
    E:SetGuide("t-named", 1, true); H.flush()
    for _, row in ipairs(P.rowsShown) do
        T.ok(row.action ~= "header", "quest named twice")
        T.ok(not row.nested, "objective indented without a header")
    end
end)

T.test("objectives of two quests: one header each; the target binding passes over them", function()
    Ding.RegisterGuide({ id = "t-two", title = "Two", races = { "NightElf" }, steps = {
        { complete = { 456, 916 } },
    } })
    start()
    H.accept(456); H.accept(916); H.flush()
    E:SetGuide("t-two", 1, true); H.flush()
    local headers = {}
    for i, row in ipairs(P.rowsShown) do
        if row.action == "header" then headers[#headers + 1] = i end
    end
    T.eq(#headers, 2, rowTexts())
    T.eq(headers[1], 1)
    T.eq(P.rowsShown[headers[1]].quest, 456)
    T.eq(P.rowsShown[headers[2]].quest, 916)
    for i = headers[1] + 1, headers[2] - 1 do T.eq(P.rowsShown[i].quest, 456) end
    T.eq(P.rowsShown[headers[2] + 1].quest, 916)
    P:StartFocus()
    local stops = 0
    for _ = 1, #P.rowsShown do
        P:CycleTarget()
        if P.cycle and P.cycle.at > 0 then
            stops = stops + 1
            T.ok(P.rowsShown[P.focusIndex].action ~= "header", "the target binding stops on a header")
        end
    end
    T.ok(stops > 0, "no stop")
    P:StopFocus()
end)

T.test("click on an objective row: the arrow goes there, the quest card shows", function()
    start()
    H.accept(456); H.flush()
    local problems = H.problems()
    local r = P.frame.rows[2]
    r.scripts.OnClick(r)
    T.ok(A.forced, "the arrow does not aim at the row")
    T.eq(GameTooltip:GetOwner(), r, "card not next to the row")
    T.eq(GameTooltip.text, Ding.Data:QuestName(456), "card without the quest")
    local lines = table.concat(GameTooltip.lines, " | ")
    T.ok(lines:find(L.QUEST_LEVEL:format(Ding.Data:QuestLevel(456)), 1, true), "level missing: " .. lines)
    T.ok(lines:find(P.rowsShown[2].target, 1, true), "objectives missing: " .. lines)
    -- Never the game's own windows (taint): the mock turns such calls into problems.
    T.eq(H.problems(), problems, "Ding touched the game's interface")
    r.scripts.OnLeave(r)
    T.ok(not GameTooltip:IsShown(), "card still shown after hovering")
end)

T.test("card of a quest not accepted yet: \"not in your log yet\"", function()
    start()
    local r = P.frame.rows[1]            -- "Accept" 456, not in the log
    r.scripts.OnEnter(r)
    T.eq(GameTooltip.text, Ding.Data:QuestName(456))
    T.ok(table.concat(GameTooltip.lines, " | "):find(L.NOT_IN_LOG, 1, true), "mention missing")
    r.scripts.OnLeave(r)
end)

T.test("focus mode: X shows the quest card, the D-pad closes it", function()
    start()
    H.accept(456); H.flush()
    P:StartFocus()
    H.press("PAD3")
    T.ok(GameTooltip:IsShown() and GameTooltip.text == Ding.Data:QuestName(456), "X does not show the quest")
    T.eq(GameTooltip:GetOwner(), P.frame.rows[2])
    -- On the quest's header too.
    H.press("PADDUP")
    T.eq(P.focusIndex, 1)
    H.press("PAD3")
    T.ok(GameTooltip:IsShown() and GameTooltip:GetOwner() == P.frame.rows[1], "X on the header: no card")
    H.press("PADDDOWN")
    T.ok(not GameTooltip:IsShown(), "card still shown after changing rows")
    H.press("PAD3")
    P:StopFocus()
    T.ok(not GameTooltip:IsShown(), "card still shown after leaving focus mode")
end)

T.test("class trainer step: the hint says it ends with the window, Next still works", function()
    start()
    E.index, E.hold = 3, true
    E:Refresh()
    local last = P.rowsShown[#P.rowsShown]
    T.ok(last.sub and last.sub:find(L.SERVICE_HINT:format(".+")), "hint missing: " .. tostring(last.sub))
end)

T.test("use an item: the item icon, \"Use … on …\"", function()
    start("t-phial")
    H.setUsable(PHIAL, true)
    H.accept(921)
    H.setItem(PHIAL, 1, { use = true, icon = 135000 })
    E:Refresh(); H.flush()
    local use
    for i, row in ipairs(P.rowsShown) do if row.kind == "use" then use = i end end
    T.ok(use, "no \"use\" row: " .. rowTexts())
    local r = P.frame.rows[use]
    T.ok(r.icon.item:IsShown() and r.icon.item.texture == 135000, "item icon")
    T.ok(H.plain(P.rowsShown[use].text):find("item " .. PHIAL, 1, true), "item name")
end)

---------------------------------------------------------------------------
-- A finished step stays 1.5 s (not after "next")
---------------------------------------------------------------------------
T.test("finished step: shown 1.5 s in green, then the next one", function()
    start("t-hold")
    H.tick(11)                      -- past the resume window
    T.quests({ [Q1] = "log" })
    T.eq(E.index, 2, "the engine does not advance")
    T.ok(P.holding, "no hold")
    T.eq(H.plain(P.frame.stepText.text), L.STEP_LABEL:format(1), "the finished step is not kept")
    T.eq(P.rowsShown[1].state, "done")
    H.tick(1.6)
    T.ok(not P.holding, "endless hold")
    T.eq(H.plain(P.frame.stepText.text), L.STEP_LABEL:format(2))
end)

T.test("\"next\" by hand: the window moves on right away", function()
    start("t-hold")
    H.tick(11)
    E:Next(); H.flush()
    T.ok(not P.holding, "hold after \"next\"")
    T.eq(H.plain(P.frame.stepText.text), L.STEP_LABEL:format(2))
end)

T.test("minimized: the current objective, then \"done\" in green during the hold", function()
    start("t-hold")
    H.tick(11)
    P:SetCompact(true)
    local m = P.frame.mini
    T.ok(m:IsShown() and m.menu:IsShown() and m.expand:IsShown(), "buttons of the minimized line")
    T.ok(H.plain(m.text.text):find(Ding.Data:QuestName(Q1), 1, true), "text: " .. H.plain(m.text.text))
    T.eq(H.plain(m.count.text), L.COMPACT_COUNT:format(1, 3))
    T.quests({ [Q1] = "log" })
    T.ok(not m.menu:IsShown() and not m.expand:IsShown(), "buttons shown during \"done\"")
    T.eq(m.text.color[1], C.done[1], "text not green during \"done\"")
    H.tick(1.6)
    T.ok(m.menu:IsShown(), "no return to the next objective")
    P:SetCompact(false)
end)

---------------------------------------------------------------------------
-- Mouse
---------------------------------------------------------------------------
T.test("click on a row: the arrow aims at its target", function()
    start()
    local r = P.frame.rows[1]
    r.scripts.OnClick(r)
    H.tick(0.1)
    T.ok(A.forced, "the arrow does not aim at the row")
    T.eq(A.targetName, Ding.Data:StarterName(456))
end)

T.test("title bar: menu, minimize, expand, close", function()
    start()
    local f = P.frame
    f.menu.scripts.OnClick(f.menu)
    T.ok(Cfg.frame:IsShown(), "the menu does not open the settings")
    Cfg:Close(); H.flush()
    f.minimize.scripts.OnClick(f.minimize)
    T.ok(P.compact and f.h == 28, "minimize")
    f.mini.expand.scripts.OnClick(f.mini.expand)
    T.ok(not P.compact, "expand")
    f.close.scripts.OnClick(f.close)
    T.ok(not f:IsShown() and not Ding.db.panel.shown, "close")
    SlashCmdList.DING("")
    T.ok(f:IsShown(), "/ding does not show the window again")
end)

T.test("title \"Ding! · guide\", zone on the right of the step bar", function()
    start()
    _G.GetMinimapZoneText = function() return "Sombrevallée" end
    P:Update()
    T.eq(H.plain(P.frame.title.text), "Ding! · Window")
    T.eq(P.frame.zone:GetText(), "Sombrevallée")
    _G.GetMinimapZoneText = nil
end)

T.test("width adjustable with the mouse between 240 and 420, not when the window is locked", function()
    start()
    local grip, f = P.frame.grip, P.frame
    local cursor = _G.GetCursorPosition
    _G.GetCursorPosition = function() return 400, 300 end
    grip.scripts.OnMouseDown(grip)
    _G.GetCursorPosition = function() return 460, 300 end
    grip.scripts.OnUpdate(grip)
    T.eq(Ding.db.panel.width, 360)
    T.eq(f.w, 360)
    _G.GetCursorPosition = function() return 900, 300 end
    grip.scripts.OnUpdate(grip)
    T.eq(Ding.db.panel.width, 420)
    grip.scripts.OnMouseUp(grip)
    P:SetWidth(300)
    Ding.db.panel.locked = true
    grip.scripts.OnMouseDown(grip)
    grip.scripts.OnUpdate(grip)
    T.eq(Ding.db.panel.width, 300, "resized while locked")
    Ding.db.panel.locked = false
    _G.GetCursorPosition = cursor
end)

---------------------------------------------------------------------------
-- Gamepad focus mode (DING_FOCUS)
---------------------------------------------------------------------------
T.test("narrow window (240): the header, indented objectives and a notice box fit", function()
    start()
    H.accept(456); H.flush()
    P:SetWidth(240)
    E.skipNotes = { { quest = 916, reason = "grey" } }
    E:Refresh()
    local notice
    for i, data in ipairs(P.rowsShown) do
        local r = P.frame.rows[i]
        T.ok(select(4, r:GetPoint()) + r:GetWidth() <= 240 - 4, "row " .. i .. " goes past the window")
        T.ok(r.text:GetWidth() >= 120, ("row %d: text %d wide"):format(i, r.text:GetWidth()))
        if data.action == "notice" then notice = r end
    end
    T.ok(notice, "no notice: " .. rowTexts())
    T.eq(H.plain(notice.text:GetText()), L.SKIPPED_GREY:format(Ding.Data:QuestName(916)))
    T.eq(notice.text.fontObject, Ding.UI.Font("regular", 11))
    T.ok(not notice.icon:IsShown() and notice.bg:IsShown(), "a notice is a box without an icon")
    -- Not under the objectives.
    for _, data in ipairs(P.rowsShown) do
        T.ok(data.action == "notice" or not (data.sub and data.sub:find(notice.text:GetText(), 1, true)), "notice under a row")
    end
    E.skipNotes = nil
    P:SetWidth(300)
end)

-- Yendi: a step note cut by an ellipsis ("Le PNJ est à l'intérieur, un étage plus…") could
-- not be read anywhere. Every text of the window wraps whole and its row grows.
local LONG_NOTE = "Le PNJ est à l'intérieur, un étage plus haut, au fond de la salle à droite de "
    .. "l'escalier. Parle-lui deux fois : la première réponse ne donne rien, la seconde ouvre la quête."

local ROW_PAD = 4        -- the rows' vertical padding (docs/UI-handoff.md)
local function shownWhole(label)
    for i, data in ipairs(P.rowsShown) do
        local r = P.frame.rows[i]
        T.ok(not r.text:IsTruncated(), ("%s: row %d cut: %s"):format(label, i, H.plain(data.text)))
        T.ok(not (r.sub:IsShown() and r.sub:IsTruncated()), ("%s: sub-line of row %d cut"):format(label, i))
        local need = ROW_PAD * 2 + r.text:GetStringHeight() + (r.sub:IsShown() and 2 + r.sub:GetStringHeight() or 0)
        T.ok(r:GetHeight() >= need - ROW_PAD, ("%s: row %d shorter than its text"):format(label, i))
    end
end

T.test("long texts: never cut, the rows grow (240 wide)", function()
    Ding.RegisterGuide({ id = "t-long", title = "Long", races = { "NightElf" }, steps = {
        { complete = 456, note = LONG_NOTE },
    } })
    start()
    H.accept(456); H.flush()
    E:SetGuide("t-long", 1, true); H.flush()
    for _, width in ipairs({ 240, 300, 420 }) do
        P:SetWidth(width)
        shownWhole(width .. " wide")
    end
    P:SetWidth(240)
    local noteRow
    for i, data in ipairs(P.rowsShown) do
        if data.sub and data.sub:find(LONG_NOTE, 1, true) then noteRow = P.frame.rows[i] end
    end
    T.ok(noteRow, "the note is not in the window")
    T.ok(noteRow.sub:GetStringHeight() > 3 * 11, "the note's sub-line did not grow past three lines")
    -- A long notice (the way there) and a long objective-like text, too.
    A.hint = LONG_NOTE
    P:Update()
    local notice
    for i, data in ipairs(P.rowsShown) do
        if data.notice == "travel" then notice = P.frame.rows[i] end
    end
    T.ok(notice, "no travel notice")
    T.ok(notice.text:GetStringHeight() > 3 * 11, "the notice did not grow past three lines")
    shownWhole("notice")
    A.hint = nil
    -- Minimized, the window keeps one line: hovering it shows the whole row and its note.
    P:SetCompact(true)
    local f = P.frame
    T.ok(f.mini.text:IsTruncated(), "the one-line text is not cut at 240: nothing to check")
    f.scripts.OnEnter(f)
    T.ok(GameTooltip:IsShown() and GameTooltip:GetOwner() == f, "no card over the minimized window")
    local row
    for _, data in ipairs(P:Rows()) do
        if data.state == "todo" then row = row or data end
    end
    T.eq(GameTooltip.text, H.plain(row.text))
    T.ok(table.concat(GameTooltip.lines, " "):find(LONG_NOTE, 1, true), "the note is missing from the card")
    f.scripts.OnLeave(f)
    T.ok(not GameTooltip:IsShown(), "card still shown")
    P:SetCompact(false)
    P:SetWidth(300)
end)

T.test("focus mode: only its keys are taken, the D-pad browses, A aims, B exits", function()
    start()
    H.accept(456); H.flush()
    P:StartFocus()
    local map = H.overrides[P.frame]
    T.ok(map and map.PADDDOWN and map.PAD1 and map.PAD2, "focus mode keys missing")
    T.ok(map.PADDLEFT, "Left (ignore a gear upgrade) is not taken")
    T.ok(map.PADDRIGHT, "Right (find the quest in the guide) is not taken")
    T.eq(map.PADLSTICK, nil, "a key focus mode does not use is taken")
    -- The focus starts on the first objective, past its quest's header.
    T.eq(P.focusIndex, 2)
    T.ok(P.frame.rows[2].focus.ring:IsShown(), "focus ring missing")
    H.press("PADDDOWN")
    T.eq(P.focusIndex, 3)
    T.ok(P.frame.rows[3].focus.ring:IsShown() and not P.frame.rows[2].focus.ring:IsShown(), "focus not moved")
    H.press("PAD1")
    T.ok(A.forced, "A does not aim at the row")
    -- A on the header: the arrow to the quest's objectives.
    A:Unfocus()
    H.press("PADDUP"); H.press("PADDUP")
    T.eq(P.focusIndex, 1)
    H.press("PAD1")
    T.ok(A.forced, "A on the header does not aim at the quest")
    H.press("PAD2")
    T.ok(not P.focusing and H.overrides[P.frame] == nil, "B does not exit focus mode")
end)

T.test("focus mode: LB / RB change steps, Y minimizes and exits", function()
    start()
    P:StartFocus()
    H.press("PADRSHOULDER")
    T.eq(E.index, 2)
    H.press("PADLSHOULDER")
    T.eq(E.index, 1)
    H.press("PAD4")
    T.ok(P.compact and not P.focusing, "Y does not minimize")
    T.eq(H.overrides[P.frame], nil)
    P:SetCompact(false)
end)

T.test("focus mode: exits on entering combat, does not start in combat", function()
    start()
    P:StartFocus()
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    T.ok(not P.focusing and next(H.overrides) == nil, "bindings still there in combat")
    P:StartFocus()
    T.ok(not P.focusing, "focus mode started in combat")
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
    P:SetCompact(false)
end)

T.test("focus mode: refused while the settings are open, stopped when they open", function()
    start()
    Cfg:Open("guide", 1); H.flush()
    P:StartFocus()
    T.ok(not P.focusing, "focus mode started on top of the settings")
    T.ok(H.overrides[Cfg.frame] and H.overrides[Cfg.frame].PAD1, "the settings lost the gamepad")
    Cfg:Close(); H.flush()
    P:StartFocus()
    T.ok(P.focusing)
    Cfg:Open("guide", 1); H.flush()
    T.ok(not P.focusing and H.overrides[P.frame] == nil, "focus mode stays under the settings")
    Cfg:Close(); H.flush()
end)

T.test("focus mode: on the item row, A clicks the secure button", function()
    start("t-phial")
    H.setUsable(PHIAL, true)
    H.accept(921)
    H.setItem(PHIAL, 1, { use = true })
    E:Refresh(); H.flush()
    T.ok(_G.DingItemButton:IsShown(), "item button hidden")
    P:StartFocus()
    for _ = 1, #P.rowsShown do
        if P.rowsShown[P.focusIndex].kind == "use" then break end
        H.press("PADDDOWN")
    end
    T.eq(P.rowsShown[P.focusIndex].kind, "use")
    T.eq(H.overrides[P.frame].PAD1, "DingItemButton", "A does not target the item button")
    P:StopFocus()
end)

T.test("\"Browse the guide\" binding: declared and assignable", function()
    local xml = assert(io.open(tools .. "/../Ding/Bindings.xml")):read("*a")
    T.ok(xml:find('name="DING_FOCUS"', 1, true), "DING_FOCUS missing from Bindings.xml")
    T.eq(BINDING_NAME_DING_FOCUS, L.BIND_FOCUS)
    start()
    Cfg:Open("bindings", 1); H.flush()
    T.eq(Cfg.focus.opts.action, "DING_CONFIG", "\"Open settings\" is not the first binding")
    H.focusOn(Cfg, function(r) return r.opts and r.opts.action == "DING_FOCUS" end, "browse")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Minimap button
---------------------------------------------------------------------------
T.test("minimap button: settings, guide, drag around, can be hidden", function()
    start()
    local b = _G.DingMinimapButton
    T.ok(b and b:IsShown(), "button missing")
    b.scripts.OnClick(b, "LeftButton")
    T.ok(Cfg.frame:IsShown(), "left click: settings")
    b.scripts.OnClick(b, "LeftButton")
    T.ok(not Cfg.frame:IsShown(), "left click: close again")
    b.scripts.OnClick(b, "RightButton")
    T.ok(not P.frame:IsShown(), "right click: hide the guide")
    b.scripts.OnClick(b, "RightButton")
    T.ok(P.frame:IsShown(), "right click: show the guide")
    -- Dragging: the cursor straight above the minimap's center.
    local cursor = _G.GetCursorPosition
    _G.GetCursorPosition = function() return 400, 400 end
    b.scripts.OnDragStart(b)
    b.scripts.OnUpdate(b)
    b.scripts.OnDragStop(b)
    _G.GetCursorPosition = cursor
    T.ok(math.abs(Ding.db.minimap.angle - 90) < 1e-6, "angle: " .. tostring(Ding.db.minimap.angle))
    local _, rel, _, x, y = b:GetPoint()
    T.ok(rel == _G.Minimap and math.abs(x) < 1e-6 and math.abs(y - 80) < 1e-6, "position around the minimap")
    SlashCmdList.DING("minimap")
    T.ok(not b:IsShown(), "/ding minimap does not hide the button")
    Cfg:Open("appearance", 1); H.flush()
    H.focusOn(Cfg, function(r) return r.opts and r.opts.label == L.MINIMAP_BUTTON end, "minimap")
    H.press("PAD1")
    T.ok(b:IsShown() and Ding.db.minimap.shown, "the Appearance tab checkbox does not show it again")
    Cfg:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Settings saved before the design
---------------------------------------------------------------------------
T.test("old settings: arrow centered, size, scale, TomTom off, only once", function()
    local db = {
        panel = { scale = 2, textSize = 16 },
        arrow = { point = "TOP", x = 0, y = -120, scale = 1.5, tomtom = true },
        ui = { opacity = 0.5 },
    }
    Ding.Migrate(db)
    T.eq(db.arrow.point, "CENTER")
    T.eq(db.arrow.y, 120)
    T.eq(db.arrow.size, 80, "arrow size capped at 80")
    T.eq(db.arrow.scale, nil)
    T.eq(db.arrow.tomtom, false, "Ding's arrow first")
    T.eq(db.panel.scale, 1.5)
    T.eq(db.panel.textSize, nil)
    T.eq(db.ui.opacity, nil)
    T.eq(db.layout, 2)
    db.arrow.tomtom = true
    Ding.Migrate(db)
    T.eq(db.arrow.tomtom, true, "migration replayed")
    local moved = { panel = {}, arrow = { point = "TOPLEFT", x = 40, y = -90, scale = 1 }, ui = {} }
    Ding.Migrate(moved)
    T.ok(moved.arrow.point == "TOPLEFT" and moved.arrow.x == 40 and moved.arrow.size == 56, "arrow moved by the player")
end)

T.run()
