-- Catching up on missing prerequisites, skipping grey quests, and saying why steps passed.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P, L = Ding.Engine, Ding.Panel, Ding.L
local Data, Compat = Ding.Data, Ding.Compat

-- Shadowglen chains (QuestieDB): 456 -> 457, 458 -> 459, 916 -> 917 -> 920 -> 921.
-- Quest levels: 456 = 2, 458 = 1, 916 = 4 (required level 3), 921 = 5.
Ding.RegisterGuide({ id = "t-pre", title = "Prequests", races = { "NightElf" }, steps = { { accept = 457 } } })
Ding.RegisterGuide({ id = "t-pre-chain", title = "Chain", races = { "NightElf" }, steps = { { accept = 921 } } })
Ding.RegisterGuide({ id = "t-pre-work", title = "Work", races = { "NightElf" }, steps = { { complete = 457 } } })
Ding.RegisterGuide({ id = "t-grey", title = "Grey", races = { "NightElf" }, steps = {
    { accept = 456 }, { accept = 916 }, { complete = 916 },
} })
Ding.RegisterGuide({ id = "t-grey-needed", title = "Useful grey", races = { "NightElf" }, steps = {
    { accept = 456 }, { turnin = 456 }, { accept = 457 },
} })
Ding.RegisterGuide({ id = "t-grey-turnin", title = "Grey to turn in", races = { "NightElf" }, steps = {
    { turnin = 456 }, { accept = 916 },
} })
-- The same quests in an item guide: followed for the reward, grey or not.
Ding.RegisterGuidePack({ id = "t-items", title = "Items", category = "items" })
Ding.RegisterGuide({ pack = "t-items", id = "t-grey-item", title = "Grey item", races = { "NightElf" }, steps = {
    { accept = 456 }, { accept = 916 }, { complete = 916 },
} })
Ding.RegisterGuide({ id = "t-later", title = "Later", races = { "NightElf" }, steps = {
    { accept = 916 }, { accept = 456 },
} })

local function start(guide, states, level)
    H.closeDialog()
    T.reset({ level = level or 3 })
    Ding.db.ui.skipGrey, Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = true, true, true
    H.tick(3)
    T.quests(states or {})
    E:SetGuide(guide, 1, true)
    H.flush()
    H.clearDialogCalls()
end

local function texts(step)
    local out = {}
    for _, l in ipairs(E:Describe(step or E:CurrentStep())) do out[#out + 1] = H.plain(l.text) end
    return out
end

local function hasText(lines, text)
    for _, t in ipairs(lines) do if t:find(text, 1, true) then return true end end
    return false
end

local function samePoints(a, b)
    if #a ~= #b or #a == 0 then return false end
    for i = 1, #a do
        if a[i].x ~= b[i].x or a[i].y ~= b[i].y or a[i].map ~= b[i].map then return false end
    end
    return true
end

---------------------------------------------------------------------------
-- Catch-up
---------------------------------------------------------------------------
T.test("prequest never accepted: \"Accept\" the prequest first, the quest in red", function()
    start("t-pre")
    T.eq(E.index, 1)
    local lines = E:Describe(E:CurrentStep())
    T.ok(H.plain(lines[1].text):find(Data:QuestName(456), 1, true), "prequest missing: " .. H.plain(lines[1].text))
    T.ok(H.plain(lines[1].text):find(L.PREQUEST_OF:format(Data:QuestName(457)), 1, true), "\"before\" mention missing")
    T.ok(H.plain(lines[2].text):find(L.ACCEPT, 1, true))
    T.ok(lines[2].impossible, "the blocked quest is not in red")
    T.ok(samePoints(E.candidates, Data:StartPoints(456)), "the arrow does not aim at the prequest's giver")
end)

T.test("prequest in progress: its objectives, the arrow towards them", function()
    start("t-pre", { [456] = "log" })
    local lines = texts()
    T.ok(lines[1]:find(L.COMPLETE .. " " .. Data:QuestName(456), 1, true), "\"Complete\" missing: " .. lines[1])
    T.ok(hasText(lines, "objective 456"), "objectives missing")
    T.ok(#E.candidates > 0 and not samePoints(E.candidates, Data:StartPoints(457)), "the arrow aims at the blocked quest")
end)

T.test("prequest ready: turn it in first", function()
    start("t-pre", { [456] = "ready" })
    local lines = texts()
    T.ok(lines[1]:find(L.TURNIN .. " " .. Data:QuestName(456), 1, true), "\"Turn in\" missing: " .. lines[1])
    T.ok(samePoints(E.candidates, Data:EndPoints(456)), "the arrow does not aim at the turn-in NPC")
end)

T.test("prequest turned in: no more catch-up", function()
    start("t-pre", { [456] = "turnedin" })
    local lines = E:Describe(E:CurrentStep())
    T.eq(#lines, 1)
    T.ok(not lines[1].impossible)
    T.ok(samePoints(E.candidates, Data:StartPoints(457)))
end)

T.test("long chain: goes back to the first missing link", function()
    start("t-pre-chain")
    T.eq(E:CatchUp(921), 916)
    T.quests({ [916] = "turnedin", [917] = "log" })
    T.eq(E:CatchUp(921), 917, "link already in the log")
    T.quests({ [917] = "turnedin", [920] = "turnedin" })
    T.eq(E:CatchUp(921), nil)
    -- A link in the log is the one to work on, even if the data says it needs an earlier one.
    T.quests({ [916] = false, [917] = false, [920] = "log" })
    T.eq(E:CatchUp(921), 920)
end)

T.test("prequest in progress with nothing to kill or loot: the arrow towards its turn-in NPC", function()
    -- 920 "Tenaron's Summons" is a message to deliver: no objective targets in QuestieDB.
    start("t-pre-chain", { [916] = "turnedin", [917] = "turnedin", [920] = "log" })
    T.eq(E:CatchUp(921), 920)
    T.ok(samePoints(E.candidates, Data:EndPoints(920)), "no destination for the prequest")
end)

T.test("prequest too high: \"level required\", no arrow towards it", function()
    start("t-pre-chain", {}, 2)
    T.eq(E:CatchUp(921), 916)
    local lines = texts()
    T.ok(lines[1]:find(L.LEVEL_REQUIRED:format(3), 1, true), "required level missing: " .. lines[1])
    T.eq(#E.candidates, 0)
end)

T.test("a quest of the step itself is not caught up twice", function()
    start("nightelf-01-shadowglen", { [456] = "turnedin", [458] = "ready", [457] = "log" })
    T.eq(E.index, 4)
    local step = E:CurrentStep()
    T.eq(E:CatchUp(459, step), nil)
    for _, t in ipairs(texts(step)) do
        T.ok(not t:find(L.PREQUEST_OF:format(""), 1, true), "duplicate catch-up: " .. t)
    end
end)

T.test("quest to complete without its prequest: catch-up too", function()
    start("t-pre-work")
    local lines = texts()
    T.ok(lines[1]:find(Data:QuestName(456), 1, true), "prequest missing: " .. lines[1])
end)

T.test("prequest restricted to another race or class: does not block", function()
    -- 4641 "Your Place In The World" is for orcs and trolls only (QuestieDB requiredRaces).
    local mask = H.data.Quest[4641][6]
    T.ok(mask ~= 0 and math.floor(mask / 8) % 2 == 0, "4641 open to night elves")
    T.ok(not Data:QuestOpenToPlayer(4641))
    T.ok(Data:QuestOpenToPlayer(456))
    T.ok(not Data:QuestOpenToPlayer(900999), "unknown quest open")
    start("t-pre")
    local get = Data.QuestPrereqs
    Data.QuestPrereqs = function(_, q)
        if q == 457 then return { 4641 }, nil end
        return get(Data, q)
    end
    T.eq(E:CatchUp(457), nil, "single")
    Data.QuestPrereqs = function(_, q)
        if q == 457 then return nil, { 4641, 456 } end
        return get(Data, q)
    end
    T.eq(E:CatchUp(457), 456, "group: the closed quest is ignored")
    Data.QuestPrereqs = get
end)

T.test("one of the possible prequests is enough", function()
    start("t-pre")
    -- 457 has a single prerequisite; a fake "single" list is tested through the data module.
    local get = Data.QuestPrereqs
    Data.QuestPrereqs = function(_, q)
        if q == 457 then return { 458, 456 }, nil end
        return get(Data, q)
    end
    T.eq(E:CatchUp(457), 458, "first of the list")
    T.quests({ [456] = "log" })
    T.eq(E:CatchUp(457), 456, "the one already in the log first")
    T.quests({ [458] = "turnedin" })
    T.eq(E:CatchUp(457), nil, "a single one turned in is enough")
    Data.QuestPrereqs = get
end)

T.test("auto accept: the prequest is accepted then turned in at the NPC", function()
    start("t-pre")
    H.talk({ gives = { 456 } }); H.flush()
    T.eq(table.concat(H.dialogCalls(), ", "), "select-available 456, accept 456")
    H.complete(456); H.flush(); H.tick(3)
    H.clearDialogCalls()
    H.talk({ ends = { 456 }, gives = { 457 } }); H.flush()
    H.talk({ ends = { 456 }, gives = { 457 } }); H.flush()
    T.eq(table.concat(H.dialogCalls(), ", "), "select-active 456, complete 456, reward 456 0, select-available 457, accept 457")
    T.ok(E.finished, "step not validated")
end)

---------------------------------------------------------------------------
-- Grey quests
---------------------------------------------------------------------------
T.test("Classic grey threshold, without GetQuestGreenRange", function()
    local function grey(level, questLevel)
        H.player.level = level
        return Compat.IsQuestGrey(questLevel)
    end
    T.ok(not grey(5, 1), "nothing is grey at level 5")
    T.ok(grey(6, 1) and not grey(6, 2))
    T.ok(grey(8, 3) and not grey(8, 4))
    T.ok(grey(39, 31) and not grey(39, 32))
    T.ok(grey(40, 31) and not grey(40, 32))
    T.ok(grey(60, 47) and not grey(60, 48))
end)

T.test("the client's GetQuestGreenRange takes priority", function()
    _G.GetQuestGreenRange = function() return 8 end
    H.player.level = 10
    T.ok(not Compat.IsQuestGrey(2), "gap of 8: green")
    T.ok(Compat.IsQuestGrey(1), "gap of 9: grey")
    _G.GetQuestGreenRange = nil
end)

T.test("grey quest never accepted: skipped, with the reason", function()
    start("t-grey", {}, 8)
    T.eq(E.index, 2, "grey quest not skipped")
    T.eq(E.skipNotes[1].quest, 456)
    T.eq(E.skipNotes[1].reason, "grey")
    T.ok(hasText((function()
        local out = {}
        for _, l in ipairs(P:Content()) do out[#out + 1] = H.plain(l.text) end
        return out
    end)(), L.SKIPPED_GREY:format(Data:QuestName(456))), "reason missing from the panel")
end)

T.test("an item guide keeps its grey quests: shown, accepted, never skipped", function()
    start("t-grey-item", {}, 8)
    T.ok(Compat.IsQuestGrey(Data:QuestLevel(456)), "456 should be grey at level 8")
    T.ok(E:KeepsGrey(E.guide), "an item guide does not keep grey quests")
    T.ok(not E:KeepsGrey(Ding:GetGuide("t-grey")), "a leveling guide keeps grey quests")
    T.eq(E.index, 1, "the grey quest of an item guide was skipped")
    T.ok(not E:IsGrey(456))
    T.ok(not hasText(texts(), L.SKIPPED_GREY:format(Data:QuestName(456))), "a grey reason on an item guide")
    E:SetGuide("t-grey", 1, true); H.flush()
    T.eq(E.index, 2, "the same quest in a leveling guide is not skipped any more")
end)

T.test("setting off: grey quests stay", function()
    start("t-grey", {}, 8)
    Ding.db.ui.skipGrey = false
    E:SetGuide("t-grey", 1, true); H.flush()
    T.eq(E.index, 1)
    Ding.db.ui.skipGrey = true
end)

T.test("setting in the Automation tab, applied right away", function()
    start("t-grey", {}, 8)
    Ding.db.ui.skipGrey = false
    E:SetGuide("t-grey", 1, true); H.flush()
    local C = Ding.Config
    C:Open("automation", 1); H.flush()
    H.focusOn(C, function(r) return r.opts and r.opts.label == L.SKIP_GREY end, "grey quests")
    H.press("PAD1")
    T.eq(Ding.db.ui.skipGrey, true)
    C:Close(); H.flush()
    T.eq(E.index, 2, "the guide did not realign")
end)

T.test("grey quest already in the log: kept", function()
    start("t-grey-turnin", { [456] = "log" }, 8)
    T.eq(E.index, 1, "turn-in skipped although the quest is in the log")
    start("t-grey-turnin", {}, 8)
    T.eq(E.index, 2, "turn-in of a grey quest never accepted not skipped")
end)

T.test("grey quest needed by another quest of the guide: kept", function()
    start("t-grey-needed", {}, 8)
    T.eq(E.index, 1)
end)

T.test("auto accept: a grey quest is never accepted", function()
    start("t-grey", {}, 8)
    E.index, E.hold = 1, true
    H.talk({ gives = { 456 } }); H.flush()
    T.eq(table.concat(H.dialogCalls(), ", "), "")
end)

---------------------------------------------------------------------------
-- Why steps passed
---------------------------------------------------------------------------
T.test("level too low: \"for later\" with the level", function()
    start("t-later", {}, 2)
    T.eq(E.index, 2)
    T.eq(E.skipNotes[1].reason, "level")
    local found = false
    for _, l in ipairs(P:Content()) do
        if H.plain(l.text) == L.SKIPPED_LEVEL:format(Data:QuestName(916), 3) then found = true end
    end
    T.ok(found, "reason missing from the panel")
end)

T.test("the reasons go away with \"previous\" and when the step changes", function()
    start("t-later", {}, 2)
    T.ok(E.skipNotes and #E.skipNotes == 1)
    E:Prev(); H.flush()
    T.eq(E.skipNotes, nil)
    start("t-later", {}, 2)
    T.quests({ [456] = "log" })
    T.ok(E.finished)
    T.eq(#E.skipNotes, 0, "reasons of a previous step still shown")
end)

T.test("many steps skipped: two rows and \"and N more\"", function()
    Ding.RegisterGuide({ id = "t-many", title = "Many", races = { "NightElf" }, steps = {
        { accept = 456 }, { accept = 2159 }, { accept = 97236 }, { accept = 997 }, { level = 60 },
    } })
    start("t-many", {}, 12)
    T.eq(E.index, 5)
    T.eq(#E.skipNotes, 4)
    local lines = 0
    for _, l in ipairs(P:Content()) do if l.action == "notice" and l.notice == "skipped" then lines = lines + 1 end end
    T.eq(lines, 3)
    -- One box of their own: the first reason, then the others under it.
    local boxes = {}
    for _, row in ipairs(P.rowsShown) do if row.notice == "skipped" then boxes[#boxes + 1] = row end end
    T.eq(#boxes, 1)
    T.ok(boxes[1].sub and H.plain(boxes[1].sub):find(L.SKIPPED_MORE:format(2), 1, true), tostring(boxes[1].sub))
    T.ok(hasText((function()
        local out = {}
        for _, l in ipairs(P:Content()) do out[#out + 1] = H.plain(l.text) end
        return out
    end)(), L.SKIPPED_MORE:format(2)))
end)

T.test("design default setting: grey quests kept", function()
    T.eq(Ding.DEFAULTS.ui.skipGrey, false)
end)

T.run()
