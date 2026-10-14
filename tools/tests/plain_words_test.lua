-- Plain words (Yendi, v1.4.0: "the player must understand everything"): no meaning carried
-- only by a color, an icon or developer shorthand. Each code of the interface also says itself
-- in words: the card of a guide window row (hover, X in focus mode), focus mode's hints, the
-- minimized window, the arrow, the minimap pins, the nameplate marks, the item button, the NPC
-- directory, the offers panel, the settings; and every language has every one of these words.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Tip = T.tip    -- the card on screen (Ding's card or the game's tooltip)
local Ding, H = T.Ding, T.H
local E, P, A, B, QM, MP, UI = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.ItemButton, Ding.QuestMobs,
    Ding.MinimapPins, Ding.UI
local L, D = Ding.L, Ding.Data
local root = tools .. "/.."

-- 456 "The Balance of Nature" (level 2), 916 needs level 3; 921 "Crown of the Earth" comes
-- after 916, 917 and 920 in its chain; 5185 the Crystal Phial used for 921.
local BALANCE, WEBWOOD, CROWN, PHIAL = 456, 916, 921, 5185
Ding.RegisterGuide({ id = "t-words", title = "Words", races = { "NightElf" }, steps = {
    { accept = BALANCE },          -- 1
    { complete = BALANCE },        -- 2
    { turnin = BALANCE },          -- 3
    { level = 60 },                -- 4
} })
Ding.RegisterGuide({ id = "t-words-level", title = "Too high", races = { "NightElf" }, steps = {
    { accept = WEBWOOD },
} })
Ding.RegisterGuide({ id = "t-words-chain", title = "Chain", races = { "NightElf" }, steps = {
    { accept = CROWN },
} })
Ding.RegisterGuide({ id = "t-words-phial", title = "Phial", races = { "NightElf" }, steps = {
    { complete = CROWN, use = { PHIAL } },
} })

local function pad(on)
    H.setGamepadConnected(on)
    H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
    H.flush()
end

local function start(guide, index, level)
    if P.focusing then P:StopFocus() end
    P:SetCompact(false)
    pad(false)
    T.reset({ level = level or 3 })
    Ding.db.panel.shown, Ding.db.panel.width, Ding.db.panel.preview = true, 240, 0
    E:SetGuide(guide or "t-words", index or 1, true)
    H.flush()
end

-- Stay on step `index` (the engine would pass a done step), shown again.
local function view(index)
    E.index, E.hold, E.finished = index, true, false
    E:Refresh()
    P:Update()
end

local function rowWhere(test)
    for i, row in ipairs(P.rowsShown) do
        if test(row) then return row, P.frame.rows[i], i end
    end
end

-- The card of a row of the window, as the mouse's hover shows it: its title and lines.
local function card(frame)
    Tip:Hide()
    frame.scripts.OnEnter(frame)
    if not (Tip:IsShown() and Tip:GetOwner() == frame) then return nil end
    return { title = H.plain(Tip.text), lines = table.concat(Tip.lines, " | "), list = Tip.lines }
end

local function has(text, part) return text and text:find(part, 1, true) ~= nil end

---------------------------------------------------------------------------
-- Guide window: what each row's look means
---------------------------------------------------------------------------
T.test("to do, done: the card says it, a quest line done says it in its text too", function()
    start()
    local row, frame = rowWhere(function(r) return r.action == "accept" end)
    T.eq(row.state, "todo")
    local c = card(frame)
    T.ok(c and has(c.lines, L.STATE_TODO), "red row without \"to do\": " .. tostring(c and c.lines))
    H.accept(BALANCE); H.flush()
    view(1)
    row, frame = rowWhere(function(r) return r.action == "accept" end)
    T.eq(row.state, "done")
    T.ok(has(H.plain(row.text), H.plain(L.ROW_ACCEPTED:format(""))), "done accept not in the past: " .. H.plain(row.text))
    T.ok(has(card(frame).lines, L.STATE_DONE), "green row without \"done\"")
    H.complete(BALANCE); H.flush()
    view(2)
    row = rowWhere(function(r) return r.action == "complete" or r.action == "objective" end)
    T.eq(row.state, "done")
    H.turnin(BALANCE); H.flush()
    view(3)
    row = rowWhere(function(r) return r.action == "turnin" end)
    T.eq(row.state, "done")
    T.ok(has(H.plain(row.text), H.plain(L.ROW_TURNEDIN:format(""))), "done turn-in not in the past: " .. H.plain(row.text))
end)

T.test("not possible yet: the level it needs, the quest to take first", function()
    -- Level 2: the engine passes the step (taken later); seen again, it says why it waits.
    start("t-words-level", 1, 2)
    view(1)
    T.eq(D:QuestRequiredLevel(WEBWOOD), 3)
    local row, frame = rowWhere(function(r) return r.quest == WEBWOOD end)
    T.ok(row, "no row of the quest")
    T.eq(row.state, "impossible")
    T.ok(has(card(frame).lines, L.STATE_LEVEL:format(3)), "grey row without the level it needs")
    -- A turn-in of a quest not in the log: grey, "take it first".
    start("t-words", 3)
    row, frame = rowWhere(function(r) return r.action == "turnin" and r.state == "impossible" end)
    T.ok(row, "no grey turn-in")
    T.ok(has(card(frame).lines, L.STATE_NOT_TAKEN), "grey turn-in without \"take the quest first\"")
end)

T.test("not possible yet: a quest that waits on its chain names the quest before it", function()
    start("t-words-chain", 1, 3)
    local row, frame = rowWhere(function(r) return r.quest == CROWN and r.action == "accept" end)
    T.eq(row.state, "impossible")
    T.eq(row.waitsOn, E:CatchUp(CROWN))
    local name = L.QUOTE:format(D:QuestName(row.waitsOn))
    T.ok(has(card(frame).lines, L.STATE_CHAIN:format(name)), "no word on the chain")
    -- The catch-up row: "before “Crown of the Earth”" said in a sentence.
    local _, catchUp = rowWhere(function(r) return r.prequestOf == CROWN end)
    T.ok(has(card(catchUp).lines, L.PREQUEST_DETAIL:format(L.QUOTE:format(D:QuestName(CROWN)))), "no word on the chain")
end)

T.test("marked done by hand, skipped: the card says what the color means", function()
    start()
    E:Next(); H.flush()
    E:Prev(); H.flush()
    T.eq(E:StepMark(), "manual")
    local _, frame = rowWhere(function(r) return r.state == "manual" end)
    T.ok(frame and has(card(frame).lines, L.STATE_MANUAL), "violet row without words")
    E:Unmark(); H.flush()
    E:Skip(); H.flush()
    E:Prev(); H.flush()
    T.eq(E:StepMark(), "skipped")
    _, frame = rowWhere(function(r) return r.state == "skipped" end)
    T.ok(frame and has(card(frame).lines, L.STATE_SKIPPED), "amber row without words")
    E:Unmark(); H.flush()
end)

T.test("above the player's level: the card says why the name is orange", function()
    start("t-words", 2, 1)
    H.accept(BALANCE); H.flush()
    view(2)
    T.ok(D:QuestLevel(BALANCE) > 1)
    local _, frame = rowWhere(function(r) return r.action == "header" end)
    local c = card(frame)
    T.ok(has(c.lines, L.QUEST_LEVEL_ABOVE:format(D:QuestLevel(BALANCE), 1)), "orange without words: " .. c.lines)
    -- At its level, the "[2]" of the window said in words.
    start("t-words", 2, 2)
    H.accept(BALANCE); H.flush()
    view(2)
    _, frame = rowWhere(function(r) return r.action == "header" end)
    T.ok(has(card(frame).lines, L.QUEST_LEVEL:format(2)), "the level tag is not said")
end)

T.test("next steps: under a header, \"and 1 more quest\" in words, a card that says they wait", function()
    start("t-words", 1, 3)
    Ding.db.panel.preview = 2
    P:Update()
    local header, _, at = rowWhere(function(r) return r.action == "previewHeader" end)
    T.ok(header, "no header above the next steps")
    T.eq(header.text, L.PREVIEW_HEADER)
    local nextRow, frame = rowWhere(function(r) return r.preview end)
    T.ok(P.rowsShown[at + 1] == nextRow, "the header is not right above the next steps")
    local c = card(frame)
    T.ok(has(c.lines, L.STATE_PREVIEW), "dimmed row without words")
    T.ok(not has(c.lines, L.ROW_CLICK), "a click does nothing on a next step")
    T.eq(UI.More(1, true), L.MORE_QUESTS_ONE)
    T.eq(UI.More(3, true), L.MORE_QUESTS:format(3))
    T.eq(UI.More(1), L.MORE_ONE)
    T.eq(UI.More(2), L.MORE:format(2))
    Ding.db.panel.preview = 0
end)

T.test("a row without a quest: its text and its state; along the way, still to do, a goal's number", function()
    start("t-words", 4, 3)
    local row, frame = rowWhere(function(r) return r.action == "level" end)
    local c = card(frame)
    T.ok(c, "no card on a level row")
    T.eq(c.title, H.plain(row.text))
    T.ok(has(c.lines, L.STATE_TODO))
    T.eq(P:RowMeaning({ state = "other", along = true, other = "along" })[1], L.STATE_ALONG)
    T.eq(P:RowMeaning({ state = "other", along = true, sticky = true, other = "sticky" })[1], L.STATE_STICKY)
    local lines = P:RowMeaning({ state = "todo", goal = { kind = "destroy" }, counter = "4" })
    T.eq(lines[2], L.GOAL_LEFT:format(4))
    -- Notices and controls say everything in their text: no card. A row besides the step says
    -- it is not a step of the guide.
    T.eq(#P:RowMeaning({ state = "notice", action = "notice" }), 0)
    T.eq(#P:RowMeaning({ state = "button", action = "unmark" }), 0)
    T.eq(P:RowMeaning({ state = "extra", action = "service", extra = true })[1], L.STATE_EXTRA)
end)

T.test("minimized: the card says the row, its state and \"Step 1 of 4\"", function()
    start()
    P:SetCompact(true)
    local f = P.frame
    f.scripts.OnEnter(f)
    T.ok(Tip:IsShown() and Tip:GetOwner() == f, "no card over the minimized window")
    local lines = table.concat(Tip.lines, " | ")
    T.ok(has(lines, L.COMPACT_STEP:format(1, 4)), "\"1/4\" not said in words: " .. lines)
    T.ok(has(lines, L.STATE_TODO), "state missing: " .. lines)
    f.scripts.OnLeave(f)
    P:SetCompact(false)
end)

---------------------------------------------------------------------------
-- Focus mode: its keys in words
---------------------------------------------------------------------------
local function hintLabels()
    local out = {}
    local bar = P.frame.focusHints
    if not bar:IsShown() then return out end
    for i, hint in ipairs(bar.list) do
        if i <= bar.shown then out[#out + 1] = hint.keys .. "=" .. hint.label end
    end
    return out
end

T.test("focus mode, gamepad: A, X and B said under the rows; none with the mouse", function()
    start()
    local height = P.frame:GetHeight()
    pad(true)
    P:StartFocus()
    local labels = table.concat(hintLabels(), ",")
    T.eq(labels, "PAD1=" .. L.FOCUS_AIM .. ",PAD3=" .. L.FOCUS_DETAIL .. ",PAD2=" .. L.FOCUS_LEAVE)
    T.ok(P.frame:GetHeight() > height, "the hints do not have their own room")
    -- X on the row: its card, with A (not a click) and Right in words.
    H.press("PAD3")
    local lines = table.concat(Tip.lines, " | ")
    T.ok(has(lines, L.ROW_CLICK_PAD:format(Ding.Gamepad:ButtonName("PAD1"))), "a click in focus mode: " .. lines)
    T.ok(has(lines, L.ROW_FIND_PAD:format(Ding.Gamepad:ButtonName("PADDRIGHT"))), "Right not said")
    -- The directory's button above the first row: its name, as the hover says it; A is on it.
    while P.focusIndex > 0 do H.press("PADDUP") end
    T.eq(Tip:GetOwner(), P.frame.finder)
    T.eq(Tip.text, L.BIND_FINDER)
    T.eq(table.concat(hintLabels(), ","), "PAD2=" .. L.FOCUS_LEAVE, "A said twice")
    H.press("PADDDOWN")
    T.ok(Tip:GetOwner() ~= P.frame.finder or not Tip:IsShown(), "the directory's card stays")
    H.press("PAD2")
    T.ok(not P.frame.focusHints:IsShown(), "hints after focus mode")
    T.eq(P.frame:GetHeight(), height)
    pad(false)
end)

T.test("focus mode: a control carries A itself, the hints leave it out", function()
    start()
    E:Next(); H.flush()
    E:Prev(); H.flush()
    pad(true)
    P:StartFocus()
    local _, _, at = rowWhere(function(r) return r.action == "unmark" end)
    while P.focusIndex < at do H.press("PADDDOWN") end
    for _, label in ipairs(hintLabels()) do T.ok(not label:find("^PAD1="), "A in the hints and on the control") end
    P:StopFocus()
    E:Unmark(); H.flush()
    pad(false)
end)

T.test("focus mode, every language: A, X and B fit the narrowest window", function()
    local own = {}
    for k, v in pairs(L) do own[k] = v end
    local function use(strings)
        local keys = {}
        for k in pairs(L) do keys[#keys + 1] = k end
        for _, k in ipairs(keys) do L[k] = nil end
        for k, v in pairs(strings) do L[k] = v end
    end
    for _, name in ipairs({ "enUS", unpack(dofile(tools .. "/guide_texts.lua").LOCALES) }) do
        local ns, getLocale = {}, _G.GetLocale
        _G.GetLocale = function() return name end
        assert(loadfile(root .. "/Ding/Locales/" .. name .. ".lua"))("Ding", ns)
        _G.GetLocale = getLocale
        use(ns.Locales[name])
        start()
        pad(true)
        P:StartFocus()
        local bar = P.frame.focusHints
        T.eq(bar.shown, #bar.list, name .. ": a hint left out at 240")
        -- The longest A: the quest item.
        T.ok(bar.used <= Ding.db.panel.width - 16, name .. ": hints wider than the window")
        P:StopFocus()
    end
    use(own)
    pad(false)
end)

---------------------------------------------------------------------------
-- Arrow, minimap, nameplates, item button
---------------------------------------------------------------------------
T.test("arrow: no position, \"distance unknown\"; the farming loop's label never cut", function()
    start("t-words", 2)
    H.accept(BALANCE); H.flush()
    local get = C_Map.GetPlayerMapPosition
    C_Map.GetPlayerMapPosition = function() return nil end
    A.point = nil
    A:Tick()
    C_Map.GetPlayerMapPosition = get
    T.ok(has(H.plain(A.frame.distance:GetText()), L.DISTANCE_UNKNOWN), "a bare \"?\": " .. tostring(A.frame.distance:GetText()))
    A.frame.label:SetText("Jeune sabre-de-nuit tacheté")
    A.frame.label:SetWidth(220)
    T.ok(not A.frame.label:IsTruncated(), "the loop's label is cut")
    A.frame.detail:SetText(L.FARM_LOOP:format(10, 12))
    A.frame.detail:SetWidth(220)
    T.ok(not A.frame.detail:IsTruncated(), "the loop's line is cut")
end)

T.test("minimap pins: hovered, a pin says what it is; the minimap keeps its clicks", function()
    start("t-words", 2)
    H.accept(BALANCE); H.flush()
    MP:Create()
    local pin = MP.target
    T.ok(pin:IsMouseEnabled() and not pin:IsMouseClickEnabled(), "the pin takes the minimap's clicks")
    A.shownPoint = { label = "Sabre", continent = 1 }
    pin.scripts.OnEnter(pin)
    T.ok(has(H.plain(Tip.text), "Sabre"), "no name")
    T.eq(Tip.lines[1], L.PIN_TARGET)
    pin.scripts.OnLeave(pin)
    local _, line = MP:Explain(MP.edge)
    T.eq(line, L.PIN_EDGE)
    MP.dots[1].point = { label = "Sabre" }
    A.farm = nil
    T.eq(select(2, MP:Explain(MP.dots[1])), L.PIN_SPOT)
    A.farm = { points = {} }
    T.eq(select(2, MP:Explain(MP.dots[1])), L.PIN_LOOP)
    A.farm, A.shownPoint = nil, nil
end)

T.test("nameplate marks: kill, loot, take, turn in and the current step, in words", function()
    local label = L.QUOTE:format("Q")
    T.eq(QM:Words({ kind = "kill", quest = 1, label = label, have = 3, need = 8, current = true }),
        L.MOB_KILL:format(label) .. " 3/8 · " .. L.MOB_CURRENT)
    T.eq(QM:Words({ kind = "drop", quest = 1, label = label, have = 0, need = 1 }), L.MOB_DROP:format(label) .. " 0/1")
    T.eq(QM:Words({ kind = "accept", quest = 1, label = label, current = true }),
        L.MOB_ACCEPT:format(label) .. " · " .. L.MOB_CURRENT)
    T.eq(QM:Words({ kind = "turnin", quest = 1, label = label, current = true }),
        L.MOB_TURNIN:format(label) .. " · " .. L.MOB_CURRENT)
    -- A goal or a level step names its own action.
    T.eq(QM:Words({ kind = "kill", label = L.REACH_LEVEL:format(5), current = true }),
        L.REACH_LEVEL:format(5) .. " · " .. L.MOB_CURRENT)
end)

T.test("item button: why this item, its cooldown and a dimmed look, in words", function()
    start("t-words-phial", 1, 5)
    Ding.db.panel.itemButton = true
    T.quests({ [CROWN] = "log" })
    H.setItem(PHIAL, 1, { use = true })
    E:Refresh(); H.flush()
    local b = _G.DingItemButton
    T.ok(b:IsShown(), "no item button")
    b.scripts.OnEnter(b)
    local lines = table.concat(Tip.lines, " | ")
    T.ok(has(lines, L.ITEM_FOR_QUEST:format(L.QUOTE:format(D:QuestName(CROWN)))), "why this item: " .. lines)
    H.setItem(PHIAL, 1, { use = true, start = H.now(), duration = 30, unusable = true })
    H.fire("BAG_UPDATE_COOLDOWN")
    B:Render()
    lines = table.concat(B:Explain(), " | ")
    T.ok(has(lines, L.ITEM_COOLDOWN:format(30)), "the seconds not said: " .. lines)
    T.ok(has(lines, L.ITEM_UNUSABLE), "the dimmed look not said")
    b.scripts.OnLeave(b)
end)

---------------------------------------------------------------------------
-- Every language has every word
---------------------------------------------------------------------------
local NEW_KEYS = { "ROW_ACCEPTED", "ROW_TURNEDIN", "ROW_COMPLETED", "ROW_CLICK_PAD", "ROW_FIND_PAD", "MORE_ONE",
    "MORE", "MORE_QUESTS_ONE", "MORE_QUESTS", "PREVIEW_HEADER", "STATE_TODO", "STATE_DONE", "STATE_LEVEL",
    "STATE_NOT_TAKEN", "STATE_CHAIN", "STATE_MANUAL", "STATE_SKIPPED", "STATE_PREVIEW", "STATE_ALONG",
    "STATE_STICKY", "QUEST_LEVEL_ABOVE", "PREQUEST_DETAIL", "GOAL_LEFT", "GEAR_SLIGHTLY", "GEAR_CLEARLY", "GEAR_EMPTY", "COMPACT_STEP",
    "DISTANCE_UNKNOWN", "MOB_KILL", "MOB_DROP", "MOB_ACCEPT", "MOB_TURNIN", "MOB_CURRENT", "PIN_TARGET", "PIN_EDGE",
    "PIN_SPOT", "PIN_LOOP", "ITEM_FOR_QUEST", "ITEM_FOR_STEP", "ITEM_FASTEST", "ITEM_UPGRADE", "ITEM_COOLDOWN",
    "ITEM_UNUSABLE", "OFFER_NAME", "DIR_BY", "FOCUS_AIM", "FOCUS_USE", "FOCUS_DETAIL", "FOCUS_LEAVE" }
-- Texts that said a code before and say it in words now.
local REWORDED = { "QUEST_LEVEL", "FARM_LOOP", "DIR_MINUTES", "DIR_UNDER_MINUTE", "GUIDE_RANGE",
    "GUIDE_LEVEL_MIN", "SKIPPED_GREY", "MINIMAP_PINS_DESC", "MOB_ICONS_DESC" }
-- The same word as in English is right there.
local SAME = { deDE = { FOCUS_DETAIL = true } }

local function strings(name)
    local ns, getLocale = {}, _G.GetLocale
    _G.GetLocale = function() return name end
    assert(loadfile(root .. "/Ding/Locales/" .. name .. ".lua"))("Ding", ns)
    _G.GetLocale = getLocale
    return ns.Locales[name]
end

T.test("every language: each new word, translated; no bare code left", function()
    local en = strings("enUS")
    for _, name in ipairs({ "enUS", unpack(dofile(tools .. "/guide_texts.lua").LOCALES) }) do
        local t = strings(name)
        for _, key in ipairs(NEW_KEYS) do
            T.ok(type(t[key]) == "string" and t[key] ~= "", name .. ": no " .. key)
            if name ~= "enUS" and not (SAME[name] and SAME[name][key]) then
                T.ok(t[key] ~= en[key], name .. ": " .. key .. " left in English")
            end
        end
        for _, key in ipairs(REWORDED) do T.ok(t[key] and t[key] ~= "", name .. ": no " .. key) end
        -- Shorthand gone: "+2", "< 1 min", "lvl 20+", "3/42" as a step, "2/10" as a loop stop.
        T.eq(t.PREVIEW_MORE, nil, name .. ": PREVIEW_MORE is back")
        T.eq(t.SKIPPED_MORE, nil, name .. ": SKIPPED_MORE is back")
        for _, key in ipairs({ "MORE_ONE", "MORE", "MORE_QUESTS_ONE", "MORE_QUESTS", "DIR_UNDER_MINUTE",
            "GUIDE_LEVEL_MIN", "FARM_LOOP", "COMPACT_STEP" }) do
            local text = t[key]:gsub("%%%a", "")
            T.ok(not text:find("[%+<]") and not text:find("%d/%d"), name .. ": a code in " .. key .. ": " .. t[key])
        end
    end
    -- French: "tu", never "vous", in the new words.
    local fr = strings("frFR")
    for _, key in ipairs(NEW_KEYS) do
        T.ok(not fr[key]:find("[Vv]ous") and not fr[key]:find("[Vv]otre") and not fr[key]:find(" vos "), "vous: " .. key)
    end
end)

T.run()
