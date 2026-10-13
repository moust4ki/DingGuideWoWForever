-- Quests above the player's real level and the guide's later quests taken on the way. The
-- routes keep "never above the player's level" for a simulated player; in game a player can
-- be behind it (quests skipped, deaths): such a quest shows in orange with its level and is
-- taken as usual (holding the guide back was too heavy, Yendi). Only quests taken ahead of
-- the guide stay at or below the player's level.
local tools = (arg[0]:match("^(.*)[/\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, P, L = Ding.Engine, Ding.Panel, Ding.L

local ORANGE, BLUE = "|cffff8040", "|cff5bb4ff"

-- 916 "Webwood Venom": level 4, required level 3. 456: level 2. 458: level 1.
local WEBWOOD, BALANCE, PROTECTOR = 916, 456, 458
Ding.RegisterGuide({ id = "t-above", title = "Above", races = { "NightElf" }, steps = {
    { accept = WEBWOOD },
    { complete = WEBWOOD },
} })
Ding.RegisterGuide({ id = "t-ahead", title = "On the way", races = { "NightElf" }, steps = {
    { accept = BALANCE },                -- 1
    { go = { 1438, 40, 40 } },           -- 2 manual
    { train = true },                    -- 3 manual
    { accept = PROTECTOR },              -- 4 taken on the way
    { accept = WEBWOOD },                -- 5 level 4: not on the way at level 2
} })

local function start(guide, level, states)
    H.closeDialog()
    T.reset({ level = level })
    Ding.char.early = {}
    Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = true, true
    H.setModifier("shift", false)
    H.tick(3)
    T.quests(states or {})
    E:SetGuide(guide, 1, true)
    H.flush()
    H.clearDialogCalls()
end

local function talk(npc)
    H.talk(npc)
    H.flush()
end

T.test("quest to accept above the player's level: name in orange with its level, accepted like the others", function()
    start("t-above", 3)
    local row = P.rowsShown[1]
    T.eq(row.state, "todo", "the quest is held back")
    T.ok(row.text:find(ORANGE, 1, true), "name not in orange: " .. row.text)
    T.ok(H.plain(row.text):find(L.QUEST_LEVEL:format(4), 1, true), "quest level missing: " .. H.plain(row.text))
    for _, line in ipairs(E:Describe(E:CurrentStep())) do
        T.ok(not line.dim, "greyed-out line: " .. tostring(line.text))
    end
    talk({ gives = { WEBWOOD } })
    T.eq(table.concat(H.dialogCalls(), ", "), "select-available 916, accept 916", "quest above the player's level not accepted")
end)

T.test("at the player's level: the usual blue link, no level", function()
    start("t-above", 4)
    local row = P.rowsShown[1]
    T.ok(row.text:find(BLUE, 1, true) and not row.text:find(ORANGE, 1, true), row.text)
    T.ok(not H.plain(row.text):find(L.QUEST_LEVEL:format(4), 1, true), "level shown at the player's level")
end)

T.test("quest to complete above the player's level: normal objectives, its name in orange below", function()
    start("t-above", 3, { [WEBWOOD] = "log" })
    T.eq(E.index, 2)
    T.ok(#P.rowsShown > 0, "no row")
    for _, row in ipairs(P.rowsShown) do T.eq(row.state, "todo", "objective held back") end
    local sub = P.rowsShown[1].sub or ""
    T.ok(sub:find(ORANGE, 1, true) and sub:find(L.QUEST_LEVEL:format(4), 1, true), "objective's quest: " .. sub)
end)

T.test("a later guide quest is picked up along the way, only at the player's level", function()
    start("t-ahead", 2)
    T.eq(E.index, 1)
    talk({ gives = { PROTECTOR, WEBWOOD } })
    T.eq(table.concat(H.dialogCalls(), ", "), "select-available 458, accept 458")
    T.ok(Ding.char.early[PROTECTOR], "not marked as accepted early")
    talk({ gives = { WEBWOOD } })
    T.eq(table.concat(H.dialogCalls(), ", "), "select-available 458, accept 458", "916 (level 4) accepted at level 2")
end)

T.test("a quest accepted early skips neither a travel step nor the class trainer", function()
    start("t-ahead", 2)
    talk({ gives = { PROTECTOR } })
    T.quests({ [BALANCE] = "log" })
    T.eq(E.index, 2, "the travel step is skipped")
    E:Next(); H.flush()
    T.eq(E.index, 3, "the visit to the class trainer is skipped")
end)

T.test("quest log almost full: nothing is accepted early", function()
    local states = {}
    for i = 1, 15 do states[900700 + i] = "log" end
    start("t-ahead", 2, states)
    talk({ gives = { PROTECTOR } })
    T.eq(table.concat(H.dialogCalls(), ", "), "", "quest accepted early with a full log")
end)

T.run()
