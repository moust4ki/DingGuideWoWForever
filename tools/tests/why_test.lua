-- Why the guide makes its choices (Core/Why.lua): a short line under a surprising step only, the
-- whole reason on demand (the mouse over a row, X in focus mode), "the guide plans this step
-- here" without a reason, never a line the data does not back; the option; a section's quests
-- left out (Why:Quest, for the panel beside an NPC); translations, guides as text, and the
-- shipped Leveling guide (Duskwood's trip to Moonbrook).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local A11 = "leveling-a11-duskwood-and-redridge-mountains"
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = { A11 } })
local Ding, H = T.Ding, T.H
local E, P, W, L = Ding.Engine, Ding.Panel, Ding.Why, Ding.L

-- The Legend of Stalvan (66 -> 67 -> 68 ...), Duskwood; Stepping Stones (79192), Forever's.
local STALVAN1, STALVAN2, STALVAN3, STALVAN4, STALVAN5, STEPPING = 66, 67, 68, 69, 70, 79192
local NIGHT_WATCH, ZOMBIE, EFFIGY = 56, 158, 133
Ding.RegisterGuidePack({ id = "t-why", title = "Why" })
Ding.RegisterGuide({ id = "t-why-1", pack = "t-why", title = "Duskwood", faction = "Alliance", minLevel = 25,
    maxLevel = 28, leftOut = {
        [NIGHT_WATCH] = { kind = "detour", xp = 300, seconds = 240 },
        [ZOMBIE] = { kind = "far" },
        [EFFIGY] = "Plain text reason.",
    }, steps = {
        { accept = STALVAN1, note = "Guide note." },                                          -- 1
        { turnin = STALVAN2, accept = STALVAN3, note = "Be ready.",                            -- 2
          why = { kind = "detour", quest = STALVAN2, chain = 11, xp = 13000, seconds = 300, back = true, short = true } },
        { go = { 1436, 40, 80 }, text = "Head out",                                            -- 3
          why = { kind = "detour", quest = STALVAN2, xp = 1100, seconds = 120 } },
        { accept = STEPPING,                                                                   -- 4
          why = { kind = "carry", quest = STEPPING, xp = 1100, seconds = 27720, continent = true, once = true, short = true } },
        { level = 27, why = { kind = "level", levels = { 28, 30 } } },                         -- 5
        { accept = STALVAN4, why = "A free text from the author." },                           -- 6
        { accept = STALVAN5, why = { text = "Short author text.", short = true } },            -- 7
    } })
Ding.RegisterGuide({ id = "t-why-2", pack = "t-why", title = "Elsewhere", faction = "Alliance", minLevel = 28,
    maxLevel = 30, leftOut = { [STALVAN1 + 1000] = { kind = "log" }, [145] = { kind = "prereq", quest = STALVAN1 } },
    steps = { { accept = 1 } } })

local function start(index, p)
    p = p or {}
    if P.focusing then P:StopFocus() end
    P:SetCompact(false)
    T.reset({ level = p.level or 26, race = "Human" })
    Ding.db.panel.shown = true
    Ding.db.panel.why = p.why
    Ding.db.ui.autoAccept, Ding.db.ui.autoTurnin = false, false
    for _, q in ipairs(p.log or {}) do H.accept(q) end
    H.flush()
    E:SetGuide(p.guide or "t-why-1", index or 1, true)
    H.flush()
end

-- Every sub-line of the window's rows, joined.
local function subs()
    local out = {}
    for _, row in ipairs(P.rowsShown) do
        if row.sub then out[#out + 1] = H.plain(row.sub) end
    end
    return table.concat(out, " | ")
end

-- The tooltip of row i, through the mouse: its title and lines.
local function hover(i)
    local r = P.frame.rows[i]
    r.scripts.OnEnter(r)
    local shown = GameTooltip:IsShown() and GameTooltip:GetOwner() == r
    local text, lines = GameTooltip.text, table.concat(GameTooltip.lines or {}, " | ")
    r.scripts.OnLeave(r)
    return shown, text, lines
end

local function find(haystack, needle, what)
    T.ok(haystack:find(needle, 1, true), ("%s: \"%s\" not in \"%s\""):format(what, needle, haystack))
end

---------------------------------------------------------------------------
-- The window
---------------------------------------------------------------------------
T.test("a surprising step: one line under its first row still to do, after the guide's note", function()
    start(2, { log = { STALVAN2 } })
    local expected = "Pourquoi ce détour (environ 5 min) : rendre « La légende de Stalvan » ouvre une suite"
        .. " de quêtes qui rapporte beaucoup d'XP (environ 13,000)."
    T.eq(W:Short(E:CurrentStep()), expected)
    local row = P.rowsShown[1]
    T.eq(row.state, "todo")
    T.eq(H.plain(row.sub), "Be ready.\n" .. expected, "the note, then the reason")
    -- Once: no other row repeats it.
    local _, count = subs():gsub("Pourquoi ce détour", "")
    T.eq(count, 1)
end)

T.test("honesty: a step without a reason gets no line; on demand, the guide plans it here", function()
    start(1)
    T.eq(W:Short(E:CurrentStep()), nil)
    T.eq(W:Step(E:CurrentStep()), nil)
    T.eq(P.rowsShown[1].sub, "Guide note.", "only the guide's note under the step")
    T.ok(not subs():find(L.WHY_DETOUR, 1, true), "a reason under a step without one: " .. subs())
    local shown, _, lines = hover(1)
    T.ok(shown, "no card")
    find(lines, L.WHY_TITLE, "card")
    find(lines, L.WHY_NONE, "card")
    T.ok(not lines:find(L.WHY_ESTIMATE, 1, true), "estimates announced without any figure")
end)

T.test("on demand (the mouse): the whole reason under \"Why?\", its figures said as estimates", function()
    start(2, { log = { STALVAN2 } })
    local shown, text, lines = hover(1)
    T.ok(shown, "no card")
    T.eq(text, Ding.Data:QuestName(STALVAN2), "the quest's card first")
    find(lines, "Pourquoi ? | Ce détour ajoute environ 5 min au trajet.", "card")
    find(lines, "Rendre « La légende de Stalvan » ouvre 11 autres quêtes que le guide fait ensuite :"
        .. " environ 13,000 XP en tout.", "card")
    find(lines, L.WHY_ESTIMATE, "card")
end)

T.test("focus mode: X shows the reason with the quest's card", function()
    start(2, { log = { STALVAN2 } })
    P:StartFocus()
    H.press("PAD3")
    T.ok(GameTooltip:IsShown(), "X shows no card")
    local lines = table.concat(GameTooltip.lines, " | ")
    find(lines, L.WHY_TITLE, "X")
    find(lines, "Ce détour ajoute environ 5 min au trajet.", "X")
    P:StopFocus()
    T.ok(not GameTooltip:IsShown(), "card still shown after leaving focus mode")
end)

T.test("a row without a quest (a trip): its card is its text and why; X too", function()
    start(3)
    local i
    for n, row in ipairs(P.rowsShown) do
        if row.action == "go" then i = n end
    end
    T.ok(i, "no trip row")
    T.eq(W:Short(E:CurrentStep()), nil, "not marked short: on demand only")
    local shown, text, lines = hover(i)
    T.ok(shown, "no card on the trip")
    T.eq(text, H.plain(P.rowsShown[i].text))
    find(lines, "Ce détour ajoute environ 2 min au trajet.", "trip card")
    find(lines, "Rendre « La légende de Stalvan » : environ 1,100 XP.", "trip card")
    P:StartFocus()
    P.focusIndex = i
    H.press("PAD3")
    T.ok(GameTooltip:IsShown() and GameTooltip:GetOwner() == P.frame.rows[i], "X on the trip: no card")
    P:StopFocus()
end)

T.test("a detour whose quest opens one follow-up: said in the singular", function()
    start(1)
    local step = { why = { kind = "detour", quest = STALVAN2, chain = 1, xp = 2400, seconds = 480, short = true } }
    T.eq(W:Short(step), "Pourquoi ce détour (environ 8 min) : rendre « La légende de Stalvan » puis faire la quête"
        .. " suivante rapporte environ 2,400 XP.", "under a quarter of the level: no \"a lot\"")
    T.eq(W:Detail(step)[2], "Rendre « La légende de Stalvan » ouvre la quête suivante, que le guide fait aussi :"
        .. " environ 2,400 XP en tout.")
    -- Taken there, no follow-up; without its time, the heading alone.
    step = { why = { kind = "detour", quest = STALVAN3, action = "accept", xp = 900, short = true } }
    T.eq(W:Short(step), "Pourquoi ce détour : y prendre « La légende de Stalvan », qui rapporte environ 900 XP.")
end)

T.test("a quest taken now for much later: why now, and when it is turned in", function()
    start(4)
    T.eq(W:Short(E:CurrentStep()), "Pourquoi la prendre maintenant : le guide ne repasse pas par ici avant de"
        .. " la rendre, sur l'autre continent (environ 1,100 XP).")
    local lines = table.concat(W:Detail(E:CurrentStep()), " | ")
    T.eq(lines, "Le guide la rend plus tard, dans environ 7 h 42 : environ 1,100 XP. | Elle se rend sur"
        .. " l'autre continent. | Le guide ne repasse pas par ici d'ici là. | " .. L.WHY_ESTIMATE)
end)

T.test("a level step: the levels of the quests that follow, on demand only", function()
    start(5)
    T.eq(W:Short(E:CurrentStep()), nil)
    T.eq(W:Detail(E:CurrentStep())[1], "Les quêtes qui suivent sont de niveau 28 à 30.")
    local shown, _, lines = hover(1)
    T.ok(shown, "no card on the level row")
    find(lines, "Les quêtes qui suivent sont de niveau 28 à 30.", "level card")
end)

T.test("an author's text: on demand, or under the step when marked short", function()
    start(6)
    T.eq(W:Short(E:CurrentStep()), nil)
    T.eq(table.concat(W:Detail(E:CurrentStep()), " | "), "A free text from the author.", "no figure: no estimate line")
    start(7)
    T.eq(W:Short(E:CurrentStep()), "Short author text.")
    find(subs(), "Short author text.", "window")
end)

T.test("option off: no line under the step, no \"Why?\" in the cards", function()
    start(2, { log = { STALVAN2 }, why = false })
    T.ok(not W:Enabled())
    T.eq(W:Short(E:CurrentStep()), nil)
    T.eq(W:Detail(E:CurrentStep()), nil)
    T.eq(H.plain(P.rowsShown[1].sub), "Be ready.", "the note alone")
    local shown, _, lines = hover(1)
    T.ok(shown, "the quest's card still shows")
    T.ok(not lines:find(L.WHY_TITLE, 1, true), "\"Why?\" with the option off: " .. lines)
    -- A row without a quest has no card at all, as before.
    start(3, { why = false })
    local i
    for n, row in ipairs(P.rowsShown) do
        if row.action == "go" then i = n end
    end
    T.ok(not (hover(i)), "a card on the trip with the option off")
    -- The settings' row turns it back on.
    Ding.db.panel.why = true
    T.ok(W:Enabled())
end)

T.test("the option: on by default, in the Guide tab, with its own default", function()
    T.eq(Ding.DEFAULTS.panel.why, true)
    local found = false
    for _, entry in ipairs(Ding.Config.TAB_SETTINGS.guide) do
        if entry[1] == "panel" and entry[2] == "why" then found = true end
    end
    T.ok(found, "not among the Guide tab's settings")
end)

T.test("narrow window (240): the line is never cut, the row grows", function()
    start(2, { log = { STALVAN2 } })
    P:SetWidth(240)
    for i, data in ipairs(P.rowsShown) do
        local r = P.frame.rows[i]
        T.ok(not r.text:IsTruncated(), ("row %d cut: %s"):format(i, H.plain(data.text)))
        T.ok(not (r.sub:IsShown() and r.sub:IsTruncated()), ("sub-line of row %d cut"):format(i))
    end
    local r = P.frame.rows[1]
    T.ok(r.sub:GetStringHeight() > 3 * 11, "the reason did not wrap onto several lines")
    P:SetWidth(300)
end)

T.test("the finished step kept on screen: no reason under it", function()
    start(2, { log = { STALVAN2 } })
    P.holding = { guide = E.guide, index = 2, step = E:CurrentStep(), target = E.index, token = {} }
    P:Update()
    T.ok(P.holding, "the step is not held")
    T.ok(not subs():find(L.WHY_DETOUR, 1, true), "a reason under a finished step: " .. subs())
    P.holding = nil
    P:Update()
end)

---------------------------------------------------------------------------
-- Quests left out
---------------------------------------------------------------------------
T.test("Why:Quest: the reason a section gives for leaving a quest out, as a clause", function()
    start(1)
    T.eq((W:Quest(NIGHT_WATCH)), "elle rapporte trop peu d'XP pour le détour (environ 300 XP pour environ 4 min)")
    T.eq((W:Quest(ZOMBIE)), "ses objectifs sont loin du chemin du guide")
    T.eq((W:Quest(EFFIGY)), "Plain text reason.")
    -- From another section of the pack.
    local text, entry, guide = W:Quest(145)
    T.eq(text, "elle suit « La légende de Stalvan », que le guide ne fait pas")
    T.eq(entry.kind, "prereq")
    T.eq(guide.id, "t-why-2")
    -- Nothing said: the guide does not know.
    T.eq(W:Quest(STALVAN2), nil)
    T.eq(W:Quest(999999), nil)
    -- Every kind has its clause; the panel beside an NPC says it in its own sentence.
    for kind in pairs(W.LEFT.kinds) do
        local clause = W.LeftOutText({ kind = kind, xp = 500, seconds = 120 })
        T.ok(clause and not clause:find("^%u") and not clause:find("%.$"), "not a clause for " .. kind .. ": "
            .. tostring(clause))
    end
    T.eq(L.OFFER_NOT_DONE:format((W:Quest(ZOMBIE))), "Le guide ne fait pas cette quête : ses objectifs sont loin"
        .. " du chemin du guide.")
    -- The panel beside an NPC asks through its one entry point.
    T.eq(Ding.Offers:WhyLeftOut(ZOMBIE), "ses objectifs sont loin du chemin du guide")
    T.eq(Ding.Offers:WhyLeftOut(STALVAN2), nil)
end)

T.test("translations: the texts of why and leftOut are translated like the notes", function()
    Ding.RegisterGuideTranslation("frFR", "t-why-1", { ["A free text from the author."] = "Un texte libre.",
        ["Plain text reason."] = "Une raison écrite.", ["Short author text."] = "Texte court." })
    start(6)
    T.eq(W:Detail(E:CurrentStep())[1], "Un texte libre.")
    T.eq((W:Quest(EFFIGY)), "Une raison écrite.")
    start(7)
    T.eq(W:Short(E:CurrentStep()), "Texte court.")
end)

---------------------------------------------------------------------------
-- Guides as text
---------------------------------------------------------------------------
local function check(text)
    local data = assert(Ding.GuideText.Parse(text))
    local plan, report = Ding.Import:Check(data)
    return plan, table.concat(report.errors, " | "), table.concat(report.warnings, " | ")
end

T.test("guides as text: why and leftOut are accepted, a wrong one is reported", function()
    local plan, errors = check([[{ title = "T", faction = "Alliance", leftOut = { [56] = { kind = "far" }, [158] = "Text." },
        steps = { { accept = 66, why = "Because." },
                  { turnin = 67, why = { kind = "detour", quest = 67, xp = 9000, seconds = 300, chain = 3, short = true } } } }]])
    T.ok(plan, errors)
    T.eq(errors, "")
    plan, errors = check([[{ title = "T", steps = { { accept = 66, why = { kind = "maybe" } } } }]])
    T.eq(plan, nil)
    find(errors, "why.kind", "errors")
    plan, errors = check([[{ title = "T", steps = { { accept = 66, why = { kind = "detour", xp = -1, color = 1 } } } }]])
    T.eq(plan, nil)
    find(errors, "why.xp", "errors")
    find(errors, "why.color", "errors")
    plan, errors = check([[{ title = "T", leftOut = { [56] = { kind = "nope" } }, steps = { { accept = 66 } } }]])
    T.eq(plan, nil)
    find(errors, "leftOut[56].kind", "errors")
end)

---------------------------------------------------------------------------
-- The shipped Leveling guide
---------------------------------------------------------------------------
T.test("Duskwood (Leveling): the trip to Moonbrook and back says why, in plain words", function()
    local guide = Ding:GetGuide(A11)
    local index
    for i, step in ipairs(guide.steps) do
        for _, q in ipairs(step.turnin or {}) do
            if q == STALVAN2 then index = i end
        end
    end
    T.ok(index, "no step turns in The Legend of Stalvan")
    local step = guide.steps[index]
    T.ok(type(step.why) == "table" and step.why.short, "the detour is not said under its step")
    start(index, { guide = A11, log = { STALVAN2 } })
    local line = W:Short(step)
    T.ok(line:find("^Pourquoi ce détour %(environ %d+ min%) : rendre « La légende de Stalvan » ouvre une suite de"
        .. " quêtes qui rapporte beaucoup d'XP %(environ [%d,]+%)%.$"), line)
    find(subs(), line, "window")
    -- Rare: few steps of the section say a reason under them.
    local short = 0
    for _, s in ipairs(guide.steps) do
        if type(s.why) == "table" and s.why.short then short = short + 1 end
    end
    T.ok(short <= 3, short .. " lines under steps in one section")
end)

T.run()
