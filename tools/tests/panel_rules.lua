-- The guide window's rules (docs/SPEC.md, "Guide window: rules"): one test per rule, named
-- after its number, on the scenarios of tools/panel_scenarios.lua (the Leveling guides, Yendi's
-- reports in game). Run in French by panel_rules_test.lua and in English by
-- panel_rules_enus_test.lua (not a test file itself: no "_test" in its name).
return function(tools, locale)
    local Snap = dofile(tools .. "/panel_snapshot.lua")
    local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = Snap.GUIDES, locale = locale })
    local Ding, H = T.Ding, T.H
    local E, P, A, L, UI, D = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.UI, Ding.Data
    local C = UI.C
    local view = Snap.Bind(T)
    local S = Snap.scenarios

    ---------------------------------------------------------------------------
    -- Helpers
    ---------------------------------------------------------------------------
    local function scene(name)
        local ctx = view:Setup(name)
        T.ok(not ctx.warning, name .. ": " .. tostring(ctx.warning))
        return ctx
    end
    local function plain(s) return H.plain(s or "") end
    local function rows() return P.rowsShown or {} end
    local function frame(i) return P.frame.rows[i] end
    local function has(text, part) return text and part and text:find(part, 1, true) ~= nil end
    local function describe()
        local out = {}
        for i, row in ipairs(rows()) do out[#out + 1] = i .. " " .. tostring(row.action) .. ": " .. plain(row.text) end
        return table.concat(out, " | ")
    end
    -- The quest as the window names it: "[28] « Name »".
    local function leveled(q)
        local name = L.QUOTE:format(D:QuestName(q))
        local level = D:QuestLevel(q)
        return level > 0 and L.QUEST_WITH_LEVEL:format(level, name) or name
    end
    -- The card of row i as the mouse's hover shows it: { title, lines... } in plain text, or nil.
    local function card(i)
        local r = frame(i)
        GameTooltip:Hide()
        r.scripts.OnEnter(r)
        local out
        if GameTooltip:IsShown() and GameTooltip:GetOwner() == r then
            out = { plain(GameTooltip.text) }
            for _, line in ipairs(GameTooltip.lines or {}) do out[#out + 1] = plain(line) end
        end
        r.scripts.OnLeave(r)
        GameTooltip:Hide()
        return out
    end
    local function cardHas(c, part)
        for _, line in ipairs(c or {}) do
            if has(line, part) then return true end
        end
        return false
    end
    local function find(test)
        for i, row in ipairs(rows()) do
            if test(row) then return row, i end
        end
    end
    local function all(test)
        local out = {}
        for i, row in ipairs(rows()) do
            if test(row) then out[#out + 1] = i end
        end
        return out
    end
    local function bg(i)
        local r = frame(i)
        return r.bg:IsShown() and view.colorWord(r.bg.color) or nil
    end
    local function glyphColor(i)
        local icon = frame(i).icon
        if not icon:IsShown() then return nil end
        if icon.letter:IsShown() then return view.colorWord(icon.letter.color) end
        if icon.tex:IsShown() then return view.colorWord(icon.tex.vertexColor) end
        return "item"
    end
    local function font(i) return frame(i).text.fontObject end
    local PREFIX = function(fmt) return (fmt:match("^(.-)%%[sd]")) end
    -- Kinds of rows: a section title, a notice and a control say it all in their text.
    local SAYS_IT_ALL = { section = true, notice = true, button = true }
    local function pad(on) view.pad(on) end
    -- A rule whose fix belongs to another branch (Core/Along.lua's choice of the rows): its
    -- failure is printed as PENDING, not counted, until that branch lands.
    local function pending(name, owner, fn)
        T.test(name .. " [pending: " .. owner .. "]", function()
            local ok, err = pcall(fn)
            if not ok then print(("  PENDING  %s\n           %s"):format(name, tostring(err))) end
        end)
    end

    ---------------------------------------------------------------------------
    -- Information apart from the step
    ---------------------------------------------------------------------------
    -- A row of information: not the step's work (Yendi: "informational messages must be
    -- clearly separated from the quest steps").
    local function isInfo(row)
        return row.action == "notice" or row.action == "tripcancel" or row.other ~= nil or row.extra == true
    end
    local STEP_STATES = { todo = true, done = true, impossible = true, manual = true, skipped = true }
    local STATE_BG = { red = true, green = true, violet = true, amber = true }

    T.test("1 information apart from the step: the step's work first, then a line, \"Good to know\" and the rest", function()
        local seen = 0
        for _, sc in ipairs(S) do
            if not sc.compact then
                scene(sc.name)
                local _, title = find(function(r) return r.action == "infoHeader" end)
                local lastStep, firstInfo, previewAt = 0, nil, nil
                for i, row in ipairs(rows()) do
                    if row.ofStep or row.action == "unmark" then lastStep = i end
                    if isInfo(row) then
                        firstInfo = firstInfo or i
                        T.ok(not STEP_STATES[row.state], ("%s: row %d (%s) has a step's state %s"):format(sc.name, i,
                            plain(row.text), tostring(row.state)))
                        T.ok(not STATE_BG[bg(i) or ""], ("%s: row %d (%s) has a step's %s background"):format(sc.name, i,
                            plain(row.text), tostring(bg(i))))
                        T.ok(row.info, ("%s: row %d (%s) is not in the information block"):format(sc.name, i, plain(row.text)))
                    end
                    if row.preview then previewAt = previewAt or i end
                end
                if firstInfo then
                    seen = seen + 1
                    T.ok(title, sc.name .. ": information without its title: " .. describe())
                    T.eq(plain(rows()[title].text), L.INFO_HEADER)
                    T.ok(frame(title).rule:IsShown(), sc.name .. ": no line above \"Good to know\"")
                    T.ok(lastStep < title and title < firstInfo, ("%s: information above or between the step's rows "
                        .. "(last step row %d, title %s, first information %d)"):format(sc.name, lastStep, tostring(title), firstInfo))
                    for i = title + 1, #rows() do
                        T.ok(not rows()[i].ofStep, ("%s: a step's row %d after the information"):format(sc.name, i))
                    end
                    if previewAt then T.ok(previewAt > firstInfo, sc.name .. ": the next steps above the information") end
                else
                    T.eq(title, nil, sc.name .. ": \"Good to know\" with nothing under it")
                end
            end
        end
        T.ok(seen >= 10, "too few scenarios with information: " .. seen)
    end)

    ---------------------------------------------------------------------------
    -- Words
    ---------------------------------------------------------------------------
    T.test("2 nothing said by a color or an icon alone: every row has a card that says its look", function()
        for _, sc in ipairs(S) do
            if not sc.compact and not sc.focus then
                scene(sc.name)
                for i, row in ipairs(rows()) do
                    if not SAYS_IT_ALL[row.state] then
                        local meaning = P:RowMeaning(row)
                        T.ok(#meaning > 0, ("%s: row %d (%s) says nothing of its look"):format(sc.name, i, plain(row.text)))
                        local c = card(i)
                        T.ok(c, ("%s: row %d (%s) has no card"):format(sc.name, i, plain(row.text)))
                        T.ok(cardHas(c, plain(meaning[1])), ("%s: row %d: the card does not say %q"):format(sc.name, i,
                            plain(meaning[1])))
                    end
                end
            end
        end
    end)

    T.test("2 a quest header says where its quest stands", function()
        scene("a11-darkshire-objectives")
        local _, i = find(function(r) return r.action == "header" and r.quest == 101 end)
        T.ok(i, describe())
        T.ok(cardHas(card(i), L.STATE_IN_PROGRESS), "in progress")
        scene("a11-finished-seen-again")
        _, i = find(function(r) return r.action == "header" and r.quest == 226 end)
        T.ok(i, describe())
        T.ok(cardHas(card(i), L.QUEST_TURNED_IN), "turned in")
    end)

    T.test("2 a reminder to keep an item is a line under the step, never a row \"to do\"", function()
        scene("a11-two-quests")
        T.eq(#all(function(r) return r.goal and r.goal.kind == "keep" end), 0, "a keep reminder as a row: " .. describe())
        local keep = L.GOAL_KEEP:format(D:ItemName(1468))
        T.ok(find(function(r) return r.ofStep and has(r.sub, keep) end), "the reminder is not under the step: " .. keep)
    end)

    T.test("3 why lines: only for a surprising step, after the note; the reason on demand; option off", function()
        local ctx = scene("a11-westfall-detour")
        local step = E:CurrentStep()
        local short = Ding.Why:Short(step)
        T.ok(short, "the detour has no short reason")
        local row, i = find(function(r) return r.state == "todo" end)
        T.ok(row and row.sub, describe())
        local lines = {}
        for line in (row.sub .. "\n"):gmatch("(.-)\n") do lines[#lines + 1] = line end
        T.eq(lines[#lines], short, "the why line is not the last line under the first row to do")
        T.ok(#lines >= 2, "the guide's note is not before the why line")
        T.ok(cardHas(card(i), L.WHY_TITLE), "no \"Why?\" in the card")
        -- Only once in the window.
        local count = 0
        for _, r in ipairs(rows()) do
            if has(r.sub, short) then count = count + 1 end
        end
        T.eq(count, 1, "the why line is repeated")
        -- Option off: neither the line nor the reason.
        Ding.db.panel.why = false
        P:Update()
        for j, r in ipairs(rows()) do
            T.ok(not has(r.sub, short), "the why line with the option off")
            T.ok(not cardHas(card(j), L.WHY_TITLE), "\"Why?\" in a card with the option off")
        end
        Ding.db.panel.why = true
        -- A step with no surprising reason: no line under it.
        scene("a11-darkshire-accepts")
        T.eq(Ding.Why:Short(E:CurrentStep()), nil)
        local _ = ctx
    end)

    local function wholeTexts(label)
        for i, data in ipairs(rows()) do
            local r = frame(i)
            T.ok(not r.text:IsTruncated(), ("%s: row %d cut: %s"):format(label, i, plain(data.text)))
            T.ok(not (r.sub:IsShown() and r.sub:IsTruncated()), ("%s: sub-line of row %d cut"):format(label, i))
            local need = r.text:GetStringHeight() + (r.sub:IsShown() and 2 + r.sub:GetStringHeight() or 0)
            T.ok(r:GetHeight() >= need, ("%s: row %d shorter than its text"):format(label, i))
        end
    end

    T.test("4 texts never cut: every scenario from 240 to 420 wide, at every scale", function()
        for _, sc in ipairs(S) do
            if not sc.compact then
                scene(sc.name)
                -- The narrowest at the largest scale, the widest at the smallest, and the default.
                for _, case in ipairs({ { 240, 1.5 }, { 300, 1 }, { 420, 0.5 } }) do
                    P:SetWidth(case[1])
                    P:SetScale(case[2])
                    P:Update()
                    wholeTexts(("%s, %d wide, scale %s"):format(sc.name, case[1], case[2]))
                end
                P:SetScale(1)
            end
        end
    end)

    T.test("4 minimized: hovering shows the row whole, its note, its state and \"Step N of M\"", function()
        scene("a11-minimized")
        local f, data = P.frame, P.compactRow
        T.ok(P.compact and data, "not minimized")
        f.scripts.OnEnter(f)
        T.ok(GameTooltip:IsShown(), "no card")
        local c = { plain(GameTooltip.text) }
        for _, line in ipairs(GameTooltip.lines) do c[#c + 1] = plain(line) end
        f.scripts.OnLeave(f)
        T.eq(c[1], plain(data.text))
        T.ok(cardHas(c, plain(data.sub)), "the note is missing")
        T.ok(cardHas(c, P:RowMeaning(data)[1]), "the state is missing")
        T.ok(cardHas(c, L.COMPACT_STEP:format(E:StepNumber(E.index))), "\"Step N of M\" is missing")
    end)

    T.test("5 every quest carries its level; above the player's, orange and said in words", function()
        local NAMED = { accept = true, turnin = true, complete = true, header = true, preview = true }
        for _, sc in ipairs(S) do
            if not sc.compact then
                scene(sc.name)
                for i, row in ipairs(rows()) do
                    if row.quest and NAMED[row.action] and D:QuestLevel(row.quest) > 0 then
                        local level = "[" .. D:QuestLevel(row.quest) .. "]"
                        T.ok(has(plain(row.text), level), ("%s: row %d without its quest's level: %s"):format(sc.name, i,
                            plain(row.text)))
                    end
                end
            end
        end
        scene("a11-darkshire-accepts")
        local row, i = find(function(r) return r.quest == 66 end)
        T.ok(D:QuestLevel(66) > UnitLevel("player"), "66 is not above the player's level")
        T.ok(has(row.text, "|cffff8040"), "not orange: " .. row.text)
        T.ok(cardHas(card(i), L.QUEST_LEVEL_ABOVE:format(D:QuestLevel(66), UnitLevel("player"))), "not said in words")
        -- Everywhere a quest is named: notices of steps passed, the "before" of a chain.
        scene("a11-bags-almost-full")
        local notice = find(function(r) return r.notice == "skipped" end)
        T.ok(notice and has(plain(notice.text), leveled(163)), "the passed quest without its level: " .. describe())
    end)

    ---------------------------------------------------------------------------
    -- The step's quests
    ---------------------------------------------------------------------------
    T.test("6 objectives under a header \"[level] « Name »\", indented; none when the step names the quest", function()
        scene("a11-two-quests")
        for _, q in ipairs({ 150, 127 }) do
            local header, i = find(function(r) return r.action == "header" and r.quest == q end)
            T.ok(header, "no header for " .. q .. ": " .. describe())
            T.eq(plain(header.text), leveled(q))
            local r = frame(i)
            T.ok(not r.icon:IsShown() and not r.bg:IsShown(), "a header with an icon or a background")
            T.eq(font(i), UI.Font("semibold", 12))
            local nextRow = rows()[i + 1]
            T.ok(nextRow and nextRow.action == "objective" and nextRow.quest == q and nextRow.nested, "objective not under it")
            T.ok(select(4, frame(i + 1):GetPoint()) == select(4, r:GetPoint()) + 8, "objective not indented by 8")
        end
        scene("a11-folsom")
        T.eq(#all(function(r) return r.action == "header" end), 0, "a header for a quest the step names: " .. describe())
    end)

    T.test("7 accept, turn-in and complete rows: the action and the quest; done, in the past", function()
        scene("a11-darkshire-accepts")
        local row = find(function(r) return r.quest == 101 end)
        T.eq(plain(row.text), plain(L.ROW_ACCEPT:format(leveled(101))))
        H.accept(101)
        H.player.level = 25
        H.flush()
        row = find(function(r) return r.quest == 101 end)
        T.eq(row.state, "done", describe())
        T.eq(plain(row.text), plain(L.ROW_ACCEPTED:format(leveled(101))))
        scene("a11-folsom")
        row = find(function(r) return r.action == "turnin" end)
        T.eq(plain(row.text), plain(L.ROW_TURNIN:format(leveled(70))))
    end)

    T.test("8 a quest ready or turned in: green objectives, full counters, past tense, whatever the client says", function()
        scene("a11-finished-seen-again")
        local list = all(function(r) return r.action == "objective" and r.quest == 226 end)
        T.ok(#list >= 1, describe())
        for _, i in ipairs(list) do
            local row = rows()[i]
            T.eq(row.state, "done", plain(row.text))
            local have, need = row.counter:match("(%d+)/(%d+)")
            T.ok(have and have == need, "counter not full: " .. tostring(row.counter))
            T.eq(bg(i), "green")
            T.ok(not cardHas(card(i), L.NOT_IN_LOG), "a turned-in quest \"not in your log yet\"")
            T.ok(cardHas(card(i), L.QUEST_TURNED_IN), "the card does not say it is turned in")
        end
        scene("a11-two-quests")
        for _, i in ipairs(all(function(r) return r.action == "objective" and r.quest == 127 end)) do
            T.eq(rows()[i].state, "done")
            T.eq(rows()[i].counter, "10/10")
        end
    end)

    ---------------------------------------------------------------------------
    -- Other quests
    ---------------------------------------------------------------------------
    T.test("9 other quests: never one the step names, never twice", function()
        scene("a12-cursed-crew-carried")
        T.eq(#all(function(r) return r.action == "header" and r.other and r.quest == 289 end), 1, describe())
        local seen = {}
        for _, i in ipairs(all(function(r) return r.other and r.action == "objective" end)) do
            local key = rows()[i].quest .. ":" .. rows()[i].index
            T.ok(not seen[key], "listed twice: " .. key)
            seen[key] = true
        end
        -- The step that works on it, the guide's current step: its own rows, no "other quest".
        local guide = E.guide
        local index = S.FindStep(Ding, guide, { complete = 289 })
        E:SetGuide(guide.id, index, true)
        H.flush()
        T.eq(E.index, index)
        T.eq(#all(function(r) return r.other and r.quest == 289 end), 0, "the step's own quest as another quest")
    end)

    T.test("9 other quests: none under a step seen again with Previous", function()
        scene("a12-cursed-crew-carried")
        T.ok(#all(function(r) return r.other end) > 0, "nothing to hide: " .. describe())
        E:Prev()
        H.flush()
        T.eq(#all(function(r) return r.other end), 0, "another quest's rows under a step seen again: " .. describe())
    end)

    T.test("9 a persistent quest: not before the step that makes it persistent, nor when its own step is next", function()
        -- Menethil, step 7, away from the wreck: the step that keeps it on screen (13) is ahead.
        scene("a12-cursed-crew-ahead")
        H.player.x, H.player.y = 18, 40
        H.tick(2.5)
        E:Refresh()
        H.flush()
        T.eq(#all(function(r) return r.quest == 289 end), 0, "kept on screen before its step: " .. describe())
        -- Step 13 makes it persistent, step 14 works on it: not listed under 13.
        scene("a12-cursed-crew-next")
        T.eq(#all(function(r) return r.quest == 289 end), 0, "listed right before its own step: " .. describe())
        -- Further on, it is.
        scene("a12-cursed-crew-carried")
        T.ok(#all(function(r) return r.quest == 289 and r.other == "sticky" end) > 0, "not kept on screen: " .. describe())
    end)

    pending("9 along the way: a quest whose own step is further on (open: Yendi's decision)",
        "Core/Along.lua, a decision first", function()
        scene("a12-cursed-crew-ahead")
        T.eq(#all(function(r) return r.quest == 289 end), 0,
            "« The Cursed Crew » listed while its step is further on: " .. describe())
    end)

    T.test("10 other quests never pass for the step's work: a header that says why, no red", function()
        for _, case in ipairs({ { "a12-cursed-crew-carried", 289, "sticky", L.OTHER_STICKY, L.STATE_STICKY },
            { "a12-along-behind", 471, "along", L.OTHER_ALONG, L.STATE_ALONG } }) do
            scene(case[1])
            local header, i = find(function(r) return r.action == "header" and r.quest == case[2] end)
            T.ok(header and header.other == case[3], case[1] .. ": no header: " .. describe())
            T.eq(plain(header.text), plain(case[4]:format(leveled(case[2]))))
            T.ok(cardHas(card(i), case[5]), "the header's card does not say why it is there")
            local list = all(function(r) return r.other and r.action == "objective" end)
            T.ok(#list > 0, case[1] .. ": no objective")
            for _, j in ipairs(list) do
                T.eq(rows()[j].state, "other")
                T.eq(bg(j), nil, "a background on another quest's objective")
                T.eq(glyphColor(j), "light grey")
                T.ok(rows()[j].nested, "not under its header")
                T.ok(cardHas(card(j), case[5]), "the card does not say it is not the step's work")
                T.ok(j > i, "above its header")
            end
        end
    end)

    ---------------------------------------------------------------------------
    -- Notices, rows besides the step, next steps
    ---------------------------------------------------------------------------
    T.test("11 window-wide messages are notices: boxes of their own, never under a row", function()
        local kinds = {}
        for _, name in ipairs({ "a11-bags-almost-full", "a11-log-almost-full", "a11-directory-trip", "a11-go-darkshire" }) do
            scene(name)
            local notices = all(function(r) return r.action == "notice" end)
            T.ok(#notices > 0, name .. ": no notice: " .. describe())
            for _, i in ipairs(notices) do
                local row = rows()[i]
                kinds[row.notice] = true
                T.eq(row.state, "notice")
                T.eq(bg(i), "grey box")
                T.ok(not frame(i).icon:IsShown(), "a notice with an icon")
                T.eq(font(i), UI.Font("regular", 11))
                for _, other in ipairs(rows()) do
                    T.ok(other == row or not has(other.sub, row.text), name .. ": the notice under a row too")
                end
            end
        end
        for _, kind in ipairs({ "bags", "skipped", "cleanup", "trip", "travel" }) do
            T.ok(kinds[kind], "no " .. kind .. " notice in the scenarios")
        end
        -- The guide's note stays under the step.
        scene("a11-goldshire-chest")
        local row = find(function(r) return r.action == "objective" and r.quest == 70 end)
        T.ok(row and row.sub and row.sub ~= "", "the note is not under the step's row")
    end)

    T.test("12 a trip of the NPC directory: \"Cancel the trip\" right under its notice", function()
        scene("a11-directory-trip")
        local notice, i = find(function(r) return r.notice == "trip" end)
        T.ok(notice, describe())
        local control = rows()[i + 1]
        T.ok(control and control.action == "tripcancel" and control.state == "button", describe())
        T.eq(plain(control.text), L.TRIP_CANCEL)
        frame(i + 1).scripts.OnClick(frame(i + 1), "LeftButton")
        T.eq(Ding.Finder.trip, nil, "the control does not end the trip")
    end)

    T.test("13 rows besides the step: under \"Good to know\", never the look of the step's objectives", function()
        for _, name in ipairs({ "a11-extras", "a11-bank" }) do
            scene(name)
            local extras = all(function(r) return r.extra end)
            T.ok(#extras > 0, name .. ": no row besides the step: " .. describe())
            local _, title = find(function(r) return r.action == "infoHeader" end)
            T.ok(title and title < extras[1], name .. ": no title above them")
            T.eq(plain(rows()[title].text), L.INFO_HEADER)
            for _, i in ipairs(extras) do
                local row = rows()[i]
                T.eq(row.state, "extra", plain(row.text))
                T.eq(bg(i), nil, name .. ": a background on " .. plain(row.text))
                local color = glyphColor(i)
                T.ok(color == "blue" or color == "item", name .. ": the icon of " .. plain(row.text) .. " is " .. tostring(color))
                local c = card(i)
                T.ok(cardHas(c, L.STATE_EXTRA), name .. ": the card does not say it is not a step: " .. plain(row.text))
                if row.action == "weapon" or row.action == "service" then
                    T.ok(cardHas(c, L.ROW_CLICK), "the card does not say what a click does")
                end
            end
            -- After the step's own rows.
            for i, row in ipairs(rows()) do
                if row.ofStep then T.ok(i < title, "a step's row after the rows besides it") end
            end
        end
    end)

    T.test("14 next steps: under their title, dimmed, levels and \"and N more\" in words; what Next shows", function()
        scene("a11-darkshire-accepts")
        local _, title = find(function(r) return r.action == "previewHeader" end)
        T.ok(title, describe())
        T.eq(rows()[title].state, "section")
        T.eq(plain(rows()[title].text), L.PREVIEW_HEADER)
        local previews = all(function(r) return r.preview end)
        T.eq(#previews, 3)
        for _, i in ipairs(previews) do
            T.ok(i > title, "a next step above its title")
            T.eq(view.colorWord(frame(i).text.color), "dim grey")
            T.ok(not plain(rows()[i].text):find("%+%d"), "a bare +N: " .. plain(rows()[i].text))
        end
        local more = find(function(r) return r.preview and has(plain(r.text), UI.More(1, true)) end)
        T.ok(more, "no \"and 1 more quest\": " .. describe())
        -- Next goes to exactly these steps, in this order.
        local ahead = E:NextSteps(3)
        for k = 1, 3 do
            E:Next()
            H.flush()
            T.eq(E:CurrentStep(), ahead[k], ("Next does not go to next step %d"):format(k))
        end
    end)

    ---------------------------------------------------------------------------
    -- Moving through the guide, marks
    ---------------------------------------------------------------------------
    T.test("15 browsing: Previous and Next move one step at a time and mark nothing", function()
        scene("a11-finished-seen-again")
        local shown = E.index
        E:Prev()
        H.flush()
        T.eq(E.index, shown - 1, "Previous does not go back one step")
        E:Next()
        H.flush()
        T.eq(E:StepMark(shown - 1), nil, "Next while browsing marks the step it leaves")
        T.eq(E.index, shown, "Next while browsing does not move one step")
    end)

    T.test("15 on the guide's current step, Next marks it done and moves on", function()
        scene("a11-darkshire-accepts")
        local index = E.index
        E:Next()
        H.flush()
        T.eq(E:StepMark(index), "manual")
        T.ok(E.index > index, "Next did not move on")
    end)

    T.test("16 a finished step stays 1.5 s, green; Next meanwhile only brings the next step", function()
        scene("a11-marked-done")
        Ding.Engine:Unmark()
        H.flush()
        local index = E.index
        H.accept(56)
        H.player.level = 25
        H.flush()
        T.ok(P.holding, "the finished step is not kept")
        T.eq(rows()[1].state, "done")
        local moved = E.index
        T.ok(moved > index, "the engine did not move on")
        E:Next()
        H.flush()
        T.eq(E.index, moved, "Next during the hold passed a step")
        T.eq(E:StepMark(moved), nil, "the step not seen yet is marked")
        T.ok(not P.holding)
    end)

    T.test("17 marked by hand: violet or amber, said in words, undone by its control", function()
        for _, case in ipairs({ { "a11-marked-done", "manual", "violet", L.STEP_MARKED_DONE, L.STATE_MANUAL, L.STEP_UNDO_DONE },
            { "a11-skipped", "skipped", "amber", L.STEP_MARKED_SKIPPED, L.STATE_SKIPPED, L.STEP_UNDO_SKIP } }) do
            scene(case[1])
            local index = E.index
            T.eq(E:StepMark(), case[2])
            local row, i = find(function(r) return r.state == case[2] end)
            T.ok(row, case[1] .. ": " .. describe())
            T.eq(bg(i), case[3])
            T.ok(has(row.sub, case[4]), "no line under the step")
            T.ok(cardHas(card(i), case[5]), "the card does not say it")
            local _, u = find(function(r) return r.action == "unmark" end)
            T.ok(u, "no undo control")
            T.eq(plain(rows()[u].text), case[6])
            frame(u).scripts.OnClick(frame(u), "LeftButton")
            H.flush()
            T.eq(E:StepMark(index), nil, "the mark stays")
        end
    end)

    local function menu(row)
        P:OpenStepMenu(row)
        local out = {}
        for _, b in ipairs(P.stepMenu.items or {}) do out[#out + 1] = plain(b.text:GetText()) end
        P:CloseStepMenu()
        return out
    end
    local function contains(list, x)
        for _, y in ipairs(list) do
            if y == x then return true end
        end
        return false
    end

    T.test("18 the step menu says what each entry acts on, never what the mark says already", function()
        scene("a11-marked-done")
        local m = menu()
        T.eq(m[1], L.STEP_UNDO_DONE)
        T.ok(not contains(m, L.STEP_MENU_DONE), "\"Mark as done\" on a step marked done")
        T.ok(contains(m, L.STEP_MENU_SKIP))
        scene("a11-skipped")
        m = menu()
        T.eq(m[1], L.STEP_UNDO_SKIP)
        T.ok(not contains(m, L.STEP_MENU_SKIP), "\"Skip\" on a skipped step")
        T.ok(contains(m, L.STEP_MENU_DONE))
        scene("a11-directory-trip")
        local trip = Ding.Finder.trip
        m = menu()
        T.eq(m[1], L.TRIP_CANCEL_TO:format(trip.name))
        T.eq(m[2], L.TRIP_DONE_AT:format(trip.name))
        T.ok(contains(m, L.STEP_MENU_DONE_GUIDE) and contains(m, L.STEP_MENU_SKIP_GUIDE), table.concat(m, " | "))
        T.ok(not contains(m, L.STEP_MENU_DONE), "a plain \"Mark as done\" during a trip")
        scene("a11-darkshire-accepts")
        local row = find(function(r) return r.quest == 66 end)
        T.eq(menu(row)[#menu(row)], L.STEP_MENU_FIND)
        T.ok(not contains(menu(), L.STEP_MENU_FIND), "\"Find this quest\" without a quest")
    end)

    ---------------------------------------------------------------------------
    -- Gamepad and mouse
    ---------------------------------------------------------------------------
    local function hintKeys()
        local keys = {}
        for _, h in ipairs(P:FocusHints()) do keys[type(h.keys) == "table" and h.keys[1] or h.keys] = true end
        return keys
    end

    T.test("19 each action once: a focused control carries A, the hint bar only what no control does", function()
        scene("a11-directory-trip")
        pad(true)
        P:StartFocus()
        H.flush()
        local _, i = find(function(r) return r.action == "tripcancel" end)
        P.focusIndex = i
        P:Update()
        T.ok(frame(i).key:IsShown(), "no A chip on the focused control")
        T.ok(not hintKeys().PAD1, "the hint bar repeats A for a control")
        T.ok(hintKeys().PAD2, "no B in the hint bar")
        local _, o = find(function(r) return r.state == "skipped" or r.state == "todo" end)
        P.focusIndex = o
        P:Update()
        T.ok(not frame(o).key:IsShown(), "a chip on a row that is not a control")
        T.ok(hintKeys().PAD1 and hintKeys().PAD3, "A or X missing from the hint bar")
        T.ok(P.frame.lb:IsShown() and P.frame.rb:IsShown(), "no LB / RB chips with a gamepad")
        P:StopFocus()
        pad(false)
        P:Update()
        T.ok(not P.frame.focusHints:IsShown(), "a hint bar without focus mode")
        T.ok(not P.frame.lb:IsShown() and not P.frame.rb:IsShown(), "LB / RB chips without a gamepad")
        for j = 1, #rows() do T.ok(not frame(j).key:IsShown(), "a chip without a gamepad") end
    end)

    T.test("20 focus mode reaches every row and the directory's button; X shows the card, A what a click does", function()
        for _, name in ipairs({ "a11-focus-gamepad", "a11-extras", "a12-cursed-crew-carried", "a11-directory-trip" }) do
            scene(name)
            pad(true)
            if not P.focusing then P:StartFocus() end
            H.flush()
            P.focusIndex = 1
            P:Update()
            H.press("PADDUP")
            T.eq(P.focusIndex, 0, name .. ": the directory's button is not reached")
            for i = 1, #rows() do
                H.press("PADDDOWN")
                T.eq(P.focusIndex, i, name .. ": row " .. i .. " is not reached")
                T.ok(frame(i).focus.ring:IsShown(), "no focus ring on row " .. i)
                if P:HasCard(rows()[i]) then
                    H.press("PAD3")
                    T.ok(GameTooltip:IsShown() and GameTooltip:GetOwner() == frame(i), name .. ": X shows no card on row " .. i)
                    GameTooltip:Hide()
                end
            end
            P:StopFocus()
            pad(false)
        end
        -- A on an objective = a click on it: the arrow goes there.
        scene("a11-focus-gamepad")
        local _, i = find(function(r) return r.action == "objective" and r.state == "todo" end)
        A:Unfocus()
        P.focusIndex = i
        P:Update()
        H.press("PAD1")
        T.ok(A.forced, "A does not aim at the row")
        P:StopFocus()
        pad(false)
    end)

    T.test("20 the target binding stops on the step's own rows only, never a header nor another quest", function()
        for _, name in ipairs({ "a12-cursed-crew-carried", "a11-extras", "a12-along-behind" }) do
            scene(name)
            pad(true)
            P:StartFocus()
            H.flush()
            local stops = 0
            for _ = 1, #rows() + 1 do
                P:CycleTarget()
                if P.cycle and P.cycle.at > 0 then
                    stops = stops + 1
                    local row = rows()[P.focusIndex]
                    T.ok(row.ofStep and row.action ~= "header", name .. ": the binding stops on " .. plain(row.text))
                end
            end
            T.ok(stops > 0, name .. ": no stop")
            P:StopFocus()
            pad(false)
        end
    end)

    T.test("21 the mouse does everything: click = A, hover = X, right click = the step menu", function()
        scene("a11-darkshire-objectives")
        local _, i = find(function(r) return r.action == "objective" and r.state == "todo" end)
        A:Unfocus()
        frame(i).scripts.OnClick(frame(i), "LeftButton")
        T.ok(A.forced, "a click does not aim at the row")
        T.ok(card(i), "no card on hover")
        frame(i).scripts.OnClick(frame(i), "RightButton")
        T.ok(P.stepMenu and P.stepMenu:IsShown(), "a right click opens no menu")
        P:CloseStepMenu()
    end)

    ---------------------------------------------------------------------------
    -- Frames and looks
    ---------------------------------------------------------------------------
    T.test("22 own frames only: nothing protected, no game window touched", function()
        local problems = H.problems()
        for _, sc in ipairs(S) do
            local text = view:Snapshot(sc.name)     -- hover, menus, focus mode: all of it
            T.ok(#text > 0)
        end
        T.eq(H.problems(), problems, "the window touched the game's interface (see above)")
        local function check(f, path)
            T.ok(not f.protected, "a protected frame in the window: " .. path)
            for k, child in pairs(f.children or {}) do check(child, path .. "." .. tostring(k)) end
        end
        check(P.frame, "DingPanelFrame")
        local source = assert(io.open(tools .. "/../Ding/UI/Panel.lua")):read("*a")
        for _, call in ipairs({ "ShowUIPanel", "HideUIPanel", "ToggleQuestLog", "QuestLogFrame", "WorldMapFrame",
            "ToggleWorldMap", "OpenQuestLog", "TalentFrame" }) do
            T.ok(not source:find(call, 1, true), "Panel.lua calls " .. call)
        end
    end)

    T.test("23 one look per kind, the same in every scenario", function()
        local looks, where = {}, {}
        local function kindOf(row)
            if row.extra then return "extra" end
            if row.other and row.action == "objective" then return "other" end
            if row.state == "header" then return "quest header" end
            if row.preview then return "next step" end
            return row.state
        end
        for _, sc in ipairs(S) do
            if not sc.compact and not sc.focus then
                scene(sc.name)
                for i, row in ipairs(rows()) do
                    local r = frame(i)
                    local kind = kindOf(row)
                    local look = table.concat({ tostring(bg(i)), r.icon:IsShown() and "icon" or "no icon",
                        tostring(r.text.fontObject and r.text.fontObject.name), view.colorWord(r.text.color),
                        tostring(r.icon:IsShown() and r.icon.bg:IsShown() and view.colorWord(r.icon.bg.color) or "") }, ", ")
                    if row.action == "gear" then look = look:gsub(", [^,]*$", "") end    -- the item's own icon
                    if looks[kind] and not (row.action == "gear" and kind == "extra") then
                        T.eq(look, looks[kind], ("%s row %d (%s) looks unlike its kind %s (%s)"):format(sc.name, i,
                            plain(row.text), kind, where[kind]))
                    elseif not looks[kind] then
                        looks[kind], where[kind] = look, sc.name
                    end
                end
            end
        end
        -- The kinds the rules name, as the rules say.
        T.ok(looks.todo:find("^red, icon"), looks.todo)
        T.ok(looks.done:find("^green, icon"), looks.done)
        T.ok(looks["quest header"]:find("^nil, no icon, DingFont_semibold12"), looks["quest header"])
        T.ok(looks.section:find("^nil, no icon, DingFont_semibold11, dim grey"), looks.section)
        T.ok(looks.notice:find("^grey box, no icon, DingFont_regular11"), looks.notice)
        T.ok(looks.button:find("^button, no icon"), looks.button)
        T.ok(looks.extra:find("^nil, icon"), looks.extra)
        T.ok(looks.other:find("^nil, icon"), looks.other)
        T.ok(looks["next step"]:find("^nil, icon, DingFont_regular12, dim grey"), looks["next step"])
    end)

    T.test("23 the step's own work stands out: only its rows have a state's background", function()
        local STATE_BG = { red = true, green = true, violet = true, amber = true }
        for _, sc in ipairs(S) do
            if not sc.compact then
                scene(sc.name)
                for i, row in ipairs(rows()) do
                    if STATE_BG[bg(i) or ""] then
                        T.ok(row.ofStep, ("%s: row %d (%s) has the step's %s background"):format(sc.name, i,
                            plain(row.text), bg(i)))
                    end
                end
            end
        end
    end)

    ---------------------------------------------------------------------------
    -- Sentences
    ---------------------------------------------------------------------------
    -- A sentence ends like one, in every language.
    local function sentence(line) return line:find("[%.!%?]$") or line:find("。$") or line:find("%)$") end

    T.test("24 sub-lines are plain sentences, with the mouse and with a gamepad", function()
        for _, on in ipairs({ false, true }) do
            for _, sc in ipairs(S) do
                if not sc.compact and not sc.focus then
                    scene(sc.name)
                    pad(on)
                    P:Update()
                    for i, row in ipairs(rows()) do
                        local sub = row.sub and plain(row.sub)
                        if sub and row.action ~= "notice" then
                            T.ok(not sub:find(" · ", 1, true), ("%s: row %d, a shorthand sub-line: %s"):format(sc.name, i, sub))
                        end
                        if sub and (row.extra or row.notice == "cleanup") then
                            local last = sub:match("([^\n]*)$")
                            T.ok(sentence(last), ("%s: row %d, not a sentence: %s"):format(sc.name, i, last))
                        end
                    end
                    pad(false)
                end
            end
        end
    end)

    T.run()
end
