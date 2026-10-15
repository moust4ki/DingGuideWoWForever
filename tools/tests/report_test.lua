-- Report a problem (Core/Report.lua, UI/Report.lua): the guide window's flag beside the
-- directory's pin, reached by the gamepad's focus mode; the binding, its chord, /ding bug; the
-- window's parts in plain words, the ready reasons with a gamepad, the player's words with a
-- keyboard (never taken from the chat); the text (GitHub Markdown: the step, the position, the
-- quests and their counters, the arrow, the settings, the client; never the character's name
-- nor the realm); the GitHub link; the last 20 reports kept, "Restore all defaults" included.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Layout = dofile(tools .. "/layout.lua")
local Ding, H = T.Ding, T.H
local E, P, L, R, W, G = Ding.Engine, Ding.Panel, Ding.L, Ding.Report, Ding.ReportWindow, Ding.Gamepad
local UI = Ding.UI

Ding.RegisterGuide({ id = "t-report", title = "Report test", steps = {
    { accept = 456 },
    { complete = 456 },
    { turnin = 456, accept = 457 },
    { complete = 916 },
    { complete = 457 },
} })

local function pad(on)
    H.setGamepadConnected(on)
    H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
    H.flush()
end

local function click(frame, button)
    frame.scripts.OnClick(frame, button or "LeftButton")
    H.flush()
end

-- A night elf in Shadowglen on "The Balance of Nature" (456): 3 of 7 nightsabers slain;
-- "Webwood Venom" (916, named by a next step) and "A Good Friend" (4495, named by none) in the log.
local function start(gamepad)
    W:Close()
    if P.focusing then P:StopFocus() end
    H.closeDialog()
    T.reset({ level = 3, class = "HUNTER", race = "NightElf" })
    H.player.name = "Thalindra"
    H.player.map, H.player.x, H.player.y = 1438, 58.71, 44.27
    pad(gamepad ~= false)
    E:SetGuide("t-report", 1, true); H.flush()
    H.accept(456); H.flush()
    H.setObjective(456, 1, 3, 7)
    H.setQuest(916, "log")
    H.setQuest(4495, "log")
    H.fire("QUEST_LOG_UPDATE")
    H.tick(1)
    T.eq(E.index, 2, "not on the step that completes 456")
end

local function chipsOn(b)
    local keys = {}
    for _, g in ipairs(b.keyGlyphs or {}) do
        if g:IsShown() then keys[g.padKey] = true end
    end
    return keys
end

local function anyKey(keys) return next(keys) ~= nil end

local function shownParts()
    local out = {}
    for _, fs in ipairs(W.frame.parts) do
        if fs:IsShown() then out[#out + 1] = fs:GetText() end
    end
    return out
end

local function partWith(text)
    for _, part in ipairs(shownParts()) do
        if part:find(text, 1, true) then return part end
    end
    return nil
end

---------------------------------------------------------------------------
-- How to open it
---------------------------------------------------------------------------
T.test("the guide window: a flag right beside the directory's pin, its tooltip in words; a click opens and closes", function()
    start()
    local f = P.frame
    T.ok(f.report:IsShown() and f.finder:IsShown(), "no report button")
    local flag, pin = Layout.rect(f.report), Layout.rect(f.finder)
    T.ok(math.abs(flag.top - pin.top) < 0.01, "not on the pin's line")
    T.ok(flag.right <= pin.left and pin.left - flag.right <= 6, ("not beside the pin (%.0f apart)"):format(pin.left - flag.right))
    -- The title stops before the flag (its drag area too).
    T.ok(Layout.rect(f.title).right <= flag.left, "the title runs under the flag")
    T.ok(Layout.rect(f.titleArea).right <= flag.left, "the title's drag area covers the flag")
    -- Its tooltip says it in words: a problem with this step, not a technical "bug".
    f.report.scripts.OnEnter(f.report)
    T.ok(GameTooltip:IsShown() and GameTooltip:GetOwner() == f.report, "no tooltip")
    T.eq(GameTooltip.text, L.REPORT_BUTTON)
    T.eq(L.REPORT_BUTTON, "Problem with this step?")
    T.ok(table.concat(GameTooltip.lines or {}, "\n"):find(L.REPORT_BUTTON_TIP, 1, true), "no line under the tooltip's title")
    T.ok(f.report.hover:IsShown() and f.report.bg:IsShown() and f.report.bg.token == UI.C.report,
        "the warm fill does not stay under the mouse")
    f.report.scripts.OnLeave(f.report)
    T.ok(not f.report.hover:IsShown() and not GameTooltip:IsShown(), "the hover stays")
    click(f.report)
    T.ok(W:IsShown(), "the flag does not open the window")
    click(f.report)
    T.ok(not W:IsShown(), "the flag does not close it")
    -- Minimized: hidden with the other title bar buttons.
    P:SetCompact(true); H.flush()
    T.ok(not f.report:IsShown(), "the flag stays on the minimized window")
    P:SetCompact(false); H.flush()
end)

T.test("focus mode: up from the first row, the pin then the flag; left and right between them; A opens", function()
    start()
    local f = P.frame
    P:StartFocus(); H.flush()
    P.focusIndex = 1; P:Update()
    H.press("PADDUP")
    T.eq(P.focusIndex, 0, "the pin is not reached")
    H.press("PADDUP")
    T.eq(P.focusIndex, -1, "the flag is not reached")
    T.ok(f.report.focus.ring:IsShown() and f.report.key:IsShown(), "the flag shows neither focus nor A")
    T.ok(not f.finder.focus.ring:IsShown() and not f.finder.key:IsShown(), "the pin keeps the focus")
    T.ok(GameTooltip:IsShown() and GameTooltip:GetOwner() == f.report and GameTooltip.text == L.REPORT_BUTTON,
        "the focused flag does not say what it is")
    -- The A chip sits left of both buttons, the title shortens for it.
    T.ok(Layout.rect(f.report.key).right <= Layout.rect(f.report).left, "the A chip covers the flag")
    T.ok(Layout.rect(f.title).right <= Layout.rect(f.report.key).left, "the title runs under the A chip")
    H.press("PADDRIGHT")
    T.eq(P.focusIndex, 0, "right from the flag: not the pin")
    T.ok(Layout.rect(f.finder.key).right <= Layout.rect(f.report).left, "the pin's A chip covers the flag")
    H.press("PADDLEFT")
    T.eq(P.focusIndex, -1, "left from the pin: not the flag")
    H.press("PADDUP")
    T.eq(P.focusIndex, -1, "above the flag: nothing")
    H.press("PADDDOWN"); H.press("PADDDOWN")
    T.eq(P.focusIndex, 1, "back down to the first row")
    H.press("PADDUP"); H.press("PADDUP"); H.press("PAD1")
    T.ok(W:IsShown() and not P.focusing, "A on the flag does not open the window")
    W:Close(); H.flush()
end)

-- WCAG contrast of two colors (0-1 values).
local function luminance(c)
    local function channel(v) return v <= 0.03928 and v / 12.92 or ((v + 0.055) / 1.055) ^ 2.4 end
    return 0.2126 * channel(c[1]) + 0.7152 * channel(c[2]) + 0.0722 * channel(c[3])
end
local function contrast(a, b)
    local x, y = luminance(a), luminance(b)
    if x < y then x, y = y, x end
    return (x + 0.05) / (y + 0.05)
end

T.test("the flag stands out in every theme: a warm fill unlike the accent, a dark flag on it, the focus ring", function()
    start()
    local f = P.frame
    for _, id in ipairs(UI.ThemeOrder) do
        UI.Theme.Apply(id); H.flush()
        local C = UI.C
        T.ok(f.report.bg:IsShown() and f.report.bg.token == C.report, id .. ": no fill")
        T.eq(UI.HexOf(f.report.bg.color), UI.HexOf(C.report), id .. ": the fill is not the theme's")
        T.ok(C.report[1] >= 0.9 and C.report[1] > C.report[2] and C.report[2] > C.report[3], id .. ": not warm")
        T.ok(math.abs(C.report[2] - C.accent[2]) > 0.2 or math.abs(C.report[3] - C.accent[3]) > 0.2,
            id .. ": too close to the accent")
        T.ok(contrast(C.report, C.onReport) >= 4.5, ("%s: the flag on its fill, %.1f:1"):format(id, contrast(C.report, C.onReport)))
        T.ok(contrast(C.report, C.bg) >= 4.5, ("%s: the fill on the window, %.1f:1"):format(id, contrast(C.report, C.bg)))
        T.ok(f.report.pole.dingPaint[2] == C.onReport and f.report.flag.dingPaint[2] == C.onReport, id .. ": the flag's ink")
        P:StartFocus(); H.flush()
        P.focusIndex = -1; P:Update()
        T.ok(f.report.focus.ring:IsShown() and f.report.key:IsShown(), id .. ": no focus ring or A on the flag")
        T.ok(f.report.bg:IsShown() and f.report.bg.token == C.report, id .. ": the fill goes with the focus")
        P:StopFocus(); H.flush()
    end
    UI.Theme.Apply("halo"); H.flush()
end)

T.test("in words, a problem with the guide: never \"bug\" in what the player reads (the command apart)", function()
    for _, name in ipairs({ "enUS", "frFR", "deDE", "esES", "ptBR", "koKR", "zhCN", "zhTW" }) do
        local source = assert(io.open(tools .. "/../Ding/Locales/" .. name .. ".lua")):read("*a")
        for key, value in source:gmatch('\n    (%u[%u_]*) = "([^\n]*)",') do
            if key == "BIND_REPORT" or key:find("^REPORT_") then
                T.ok(not value:lower():find("bug", 1, true), ("%s %s says bug: %s"):format(name, key, value))
            end
        end
    end
    T.eq(L.BIND_REPORT, "Report a problem with the guide")
end)

T.test("a key binding, its chord, a row in the Keybinds tab, /ding bug and the /ding help", function()
    start()
    T.eq(_G.BINDING_NAME_DING_REPORT, L.BIND_REPORT)
    T.ok(G:ChordAllowed("DING_REPORT"), "no chord for it")
    local xml = assert(io.open(tools .. "/../Ding/Bindings.xml")):read("*a")
    T.ok(xml:find('<Binding name="DING_REPORT" category="ADDONS">%s*Ding%.ReportWindow:Toggle%(%)'), "not in Bindings.xml")
    Ding.Config:Open("bindings"); H.flush()
    local found = false
    for _, row in ipairs(Ding.Config.TABS[Ding.Config.TAB.bindings].rows) do
        if row.opts and row.opts.action == "DING_REPORT" then found = true end
    end
    T.ok(found, "no row in the Keybinds tab")
    Ding.Config:Close(); H.flush()
    G.CHORD_RUN.DING_REPORT(); H.flush()
    T.ok(W:IsShown(), "the chord's action does not open it")
    G.CHORD_RUN.DING_REPORT(); H.flush()
    T.ok(not W:IsShown(), "the chord's action does not close it")
    SlashCmdList.DING("bug"); H.flush()
    T.ok(W:IsShown(), "/ding bug does not open it")
    W:Close(); H.flush()
    T.ok(L.HELP:find("/ding bug", 1, true), "/ding help does not list /ding bug")
    for _, name in ipairs({ "frFR", "deDE", "esES", "ptBR", "koKR", "zhCN", "zhTW" }) do
        local source = assert(io.open(tools .. "/../Ding/Locales/" .. name .. ".lua")):read("*a")
        T.ok(source:match('\n    HELP = "[^\n]*/ding bug'), name .. ": /ding help does not list /ding bug")
    end
    -- In combat: not opened, said in words.
    H.setCombat(true)
    T.ok(not W:Open(), "opened in combat")
    H.setCombat(false)
end)

---------------------------------------------------------------------------
-- The window
---------------------------------------------------------------------------
T.test("the window says in plain words what the report will contain, before anything is made", function()
    start()
    W:Open(); H.flush()
    local f = W.frame
    T.ok(f.title:GetText():find(L.BIND_REPORT, 1, true), "no title")
    T.ok(f.form:IsShown() and not f.done:IsShown(), "not on the first page")
    T.eq(#R:Saved(), 0, "a report made on opening")
    local number, total = E:StepNumber(2)
    T.ok(partWith(L.REPORT_PART_STEP:format(number, total, 2, "")), "no step part:\n" .. table.concat(shownParts(), "\n"))
    T.ok(partWith(L.REPORT_PART_GUIDE:format("Ding!", "Report test")) or partWith("Report test"), "no guide part")
    T.ok(partWith(L.REPORT_PART_PLACE:format("Teldrassil", "58.7", "44.3")) or partWith("58.7, 44.3"),
        "no position part:\n" .. table.concat(shownParts(), "\n"))
    local quests = partWith(L.REPORT_PART_QUESTS:format(""))
    T.ok(quests, "no quests part")
    T.ok(quests:find(Ding.Data:QuestName(456), 1, true) and quests:find("3/7", 1, true),
        "the step's quest and its counter missing: " .. quests)
    T.ok(quests:find(Ding.Data:QuestName(916), 1, true), "the next step's quest of the log missing: " .. quests)
    T.ok(not quests:find(Ding.Data:QuestName(4495), 1, true), "a quest no step names is listed: " .. quests)
    local arrow = partWith(L.REPORT_PART_ARROW:match("^(.-)%%s"))
    local shown = Ding.Arrow.shownPoint
    T.ok(shown and arrow and arrow:find(shown.label, 1, true), "the arrow's target missing: " .. tostring(arrow))
    T.ok(partWith(L.REPORT_PART_SETTINGS), "no settings part")
    T.ok(partWith(L.REPORT_PART_CLIENT:format(Ding.version)), "no client part")
    T.ok(partWith(L.REPORT_PART_PRIVATE), "the window does not say what is never in it")
    for _, part in ipairs(shownParts()) do
        T.ok(not part:find("Thalindra", 1, true), "the character's name in the window")
    end
    -- The four ready reasons, none chosen yet; the box for the player's words.
    for i, reason in ipairs(R.REASONS) do
        T.eq(f.reasons[i].label:GetText(), L[reason.label])
        T.ok(not f.reasons[i].dot:IsShown(), "a reason already chosen")
    end
    T.ok(f.comment:IsShown(), "no box for the player's words")
    W:Close(); H.flush()
end)

T.test("the text: title line, step, position, quests with counters, arrow, settings, client, the words; no name", function()
    start(false)
    W:Open(); H.flush()
    local f = W.frame
    -- With a keyboard the box has it at once: the player types.
    T.ok(f.comment.edit:HasFocus(), "the words' box does not take the keyboard")
    H.type(f.comment.edit, "Ilthalaine is not at his place\nI looked everywhere")
    click(f.reasons[1])
    T.ok(f.reasons[1].dot:IsShown(), "the click does not choose the reason")
    click(f.buttons[1])
    T.ok(f.done:IsShown() and not f.form:IsShown(), "not on the text's page")
    local text = f.text:GetValue()
    local number, total = E:StepNumber(2)
    local first = text:match("^[^\n]*")
    T.eq(first, ("Ding! report: Step %d/%d of Report test: The NPC is not there"):format(number, total))
    for _, want in ipairs({
        "**What went wrong:** The NPC is not there",
        "> Ilthalaine is not at his place\n> I looked everywhere",
        "- Section: Report test (`t-report`)",
        ("- Step: %d / %d, index 2 of 5 in the guide's file"):format(number, total),
        "- Keys: `{ complete = 456 }`",
        "- Map: ", "UiMap 1438",
        "- Position: 58.7, 44.3",
        "- Level 3 NightElf HUNTER, Alliance",
        "- [456] The Balance of Nature",
        "in the log (this step)",
        "Young Nightsaber slain: 3/7 (3/7)",
        "- [916] ",
        ("(step %d)"):format((E:StepNumber(4))),
        "- Candidate points for this step: ",
        "- Route: elites off, dungeons off, hearth on, deathSkip off, skipGrey off, serviceSteps on, trainerSteps on, flightSteps on",
        "- Theme: ", "TomTom: off",
        "- Ding! " .. Ding.version .. ", locale enUS, game 1.60.0 (61234)",
        " UTC",
    }) do
        T.ok(text:find(want, 1, true), ("the text lacks %q:\n%s"):format(want, text))
    end
    T.ok(not text:find("[4495]", 1, true), "a quest no step names is in the text")
    T.ok(not text:find("Thalindra", 1, true), "the character's name is in the text")
    T.ok(not text:find("Forever Realm", 1, true), "the realm is in the text")
    T.ok(not text:find("|", 1, true), "a raw | in the text (the box would read it as an escape)")
    -- The arrow: what it points at, its map and distance.
    local arrow = text:match("%- Points to: ([^\n]*)")
    T.ok(arrow and arrow:find("UiMap 1438", 1, true) and arrow:find("yards away", 1, true),
        "the arrow's target: " .. tostring(arrow))
    -- Selected for Ctrl+C, said in words; the link to paste it into, selectable too.
    T.ok(f.text.edit:HasFocus() and f.text.edit.selection, "the text is not selected")
    T.eq(f.copy:GetText(), L.REPORT_COPY)
    T.ok(L.REPORT_COPY:find("Ctrl+C", 1, true))
    T.eq(f.clipboard:GetText(), L.REPORT_CLIPBOARD)
    T.eq(f.link:GetValue(), "https://github.com/moust4ki/DingGuideWoWForever/issues/new?template=ding-report.yml")
    click(f.buttons[2])
    T.ok(f.link.edit:HasFocus() and f.link.edit.selection, "Select the link does not select it")
    T.ok(f.saved:GetText():find("WTF\\Account\\<account>\\SavedVariables\\Ding.lua", 1, true), "where the file is")
    -- Read-only: typing puts the text back.
    H.type(f.text.edit, "changed")
    T.eq(f.text:GetValue(), text, "the report can be typed over")
    -- Kept with the others.
    local saved = R:Saved()
    T.eq(#saved, 1)
    T.eq(saved[1].text, text)
    T.eq(saved[1].title, first)
    W:Close(); H.flush()
    T.ok(not f.text.edit:HasFocus() and not f.link.edit:HasFocus(), "a box keeps the keyboard once closed")
end)

T.test("with a gamepad: the reasons first, A picks one and goes on to Create, A creates, Y selects, B closes", function()
    start()
    W:Open(); H.flush()
    local f = W.frame
    T.ok(not f.comment.edit:HasFocus(), "the words' box takes the keyboard with a gamepad")
    T.ok(f.reasons[1].focus.ring:IsShown() and f.reasons[1].key:IsShown(), "the first reason is not focused with A")
    H.press("PADDDOWN")
    T.ok(f.reasons[2].focus.ring:IsShown() and not f.reasons[1].key:IsShown(), "D-pad down: not the second reason")
    H.press("PAD1")
    T.ok(f.reasons[2].dot:IsShown() and W.reason == "arrow", "A does not choose the reason")
    T.ok(chipsOn(f.buttons[1]).PAD1, "A not on Create the text after a reason")
    T.ok(not f.reasons[2].key:IsShown(), "A left on the reason")
    -- The words' box, optional, is a stop between the reasons and the button.
    H.press("PADDUP")
    T.ok(f.comment.focus.ring:IsShown() and f.commentKey:IsShown(), "the box is not a stop with its A")
    H.press("PAD1")
    T.ok(f.comment.edit:HasFocus(), "A on the box does not give it the keyboard")
    H.type(f.comment.edit, "")
    H.press("PADDDOWN")
    H.press("PAD1")
    T.ok(f.done:IsShown(), "A on Create the text does not make it")
    local text = f.text:GetValue()
    T.ok(text:find("**What went wrong:** The arrow points to the wrong place", 1, true), text)
    T.ok(not text:find("In the player's words", 1, true), "an empty comment is written")
    T.ok(text:match("^[^\n]*"):find(": The arrow points to the wrong place$"), "the title line lacks the reason")
    -- Each action once: A on the focused button, Y on Select the text, B by the cross.
    T.ok(chipsOn(f.buttons[1]).PAD1 and chipsOn(f.buttons[1]).PAD4, "A and Y not on Select the text")
    T.ok(not anyKey(chipsOn(f.buttons[2])), "a chip on Select the link")
    T.ok(f.back:IsShown(), "no B by the close cross")
    T.eq(#(f.hints.list or {}), 0, "a hint repeats a button with a gamepad")
    H.press("PADDRIGHT")
    T.ok(chipsOn(f.buttons[2]).PAD1 and not chipsOn(f.buttons[1]).PAD1, "D-pad right: A not on Select the link")
    H.press("PAD1")
    T.ok(f.link.edit:HasFocus(), "A on Select the link")
    H.press("PAD4")
    T.ok(f.text.edit:HasFocus() and f.text.edit.selection, "Y does not select the text")
    H.press("PAD2")
    T.ok(not W:IsShown(), "B does not close the window")
    T.eq(G.owner, nil, "the gamepad is not given back")
end)

T.test("Something else with words: the title line takes the player's first words", function()
    start()
    local info = R:Collect()
    local title = R:Title(info, "other", "The boars run through the wall near the well, and more words after that")
    T.ok(title:find(": The boars run through the wall near the well, and more...", 1, true), title)
    -- Never half a character.
    local french = R:Title(info, "other", ("\195\169"):rep(40))
    T.ok(french:find(("\195\169"):rep(28) .. "...", 1, true) and not french:find(("\195\169"):rep(29), 1, true), french)
    T.ok(#title < 120, "the title is too long")
    T.ok(R:Title(info, "other", ""):find("Report test$"), "Something else without words: " .. R:Title(info, "other", ""))
    T.ok(R:Text(info, nil, ""):find("**What went wrong:** not chosen", 1, true), "no reason chosen")
end)

T.test("keyboard: from the chat (/ding bug) the words' box waits for the chat to close; nothing blocked", function()
    start(false)
    local problems = H.problems()
    H.chat("/ding bug")
    local f = W.frame
    T.ok(W:IsShown(), "/ding bug from the chat does not open it")
    T.ok(H.chatHasKeyboard(), "Ding took the keyboard from the chat")
    T.ok(not f.comment.edit:HasFocus(), "the box has the keyboard while the chat does")
    T.eq(f.formStatus:GetText(), L.IMPORT_WAIT_KEYBOARD)
    T.ok(f.formStatus:IsShown(), "the wait is not said")
    H.closeChat()
    H.tick(0.2)
    T.ok(f.comment.edit:HasFocus(), "the box does not take the keyboard once the chat is closed")
    T.ok(not f.formStatus:IsShown(), "the wait is still said")
    T.eq(H.problems(), problems, "a blocked action (see above)")
    W:Close(); H.flush()
end)

T.test("mouse: no chip, the mouse help; plugged in while open, the chips come", function()
    start(false)
    W:Open(); H.flush()
    local f = W.frame
    T.ok(not f.back:IsShown(), "B by the cross without a gamepad")
    for _, r in ipairs(f.reasons) do T.ok(not r.key:IsShown(), "an A chip on a reason") end
    T.ok(not anyKey(chipsOn(f.buttons[1])), "a chip on Create the text")
    T.eq(#f.hints.list, 1)
    T.eq(f.hints.list[1].label, L.REPORT_MOUSE)
    T.eq(f.hints.list[1].keys, nil, "a gamepad hint without a gamepad")
    -- Right click closes.
    f.scripts.OnMouseUp(f, "RightButton")
    T.ok(not W:IsShown(), "a right click does not close it")
    W:Open(); H.flush()
    pad(true)
    T.ok(f.back:IsShown() and f.reasons[1].key:IsShown(), "plugged in: no chips")
    T.eq(#(f.hints.list or {}), 0, "plugged in: the mouse help stays")
    W:Close(); H.flush()
    pad(false)
    W:Open(); H.flush()
    click(f.buttons[1])
    T.eq(f.hints.list[1].label, L.EXPORT_MOUSE, "the text's page: not the copy help")
    W:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- The reports kept
---------------------------------------------------------------------------
T.test("the last 20 reports are kept, oldest out first; \"Restore all defaults\" keeps them", function()
    start()
    local info = R:Collect()
    for i = 1, 25 do R:Make(info, "other", "report " .. i) end
    local saved = R:Saved()
    T.eq(#saved, 20)
    T.ok(saved[1].text:find("> report 6", 1, true), "the oldest is not the one dropped")
    T.ok(saved[20].text:find("> report 25", 1, true), "the newest is not last")
    T.ok(saved[20].at and saved[20].at:find("UTC$"), "no date")
    Ding:ResetSettings()
    T.eq(#Ding.db.reports, 20, "Restore all defaults drops the reports")
    T.eq(Ding.DEFAULTS.reports ~= nil, true)
end)

T.test("no guide, no position: the report still says what it can", function()
    start()
    E.guide = nil
    H.player.map = nil
    W:Open(); H.flush()
    T.ok(partWith(L.REPORT_NO_GUIDE), "no guide: not said")
    T.ok(partWith(L.REPORT_PLACE_UNKNOWN), "no position: not said")
    click(W.frame.buttons[1])
    local text = W.frame.text:GetValue()
    T.ok(text:find("^Ding! report: No guide"), text)
    T.ok(text:find("- No guide", 1, true) and text:find("- Position: unknown here", 1, true), text)
    W:Close(); H.flush()
end)

T.test("combat closes it and gives the gamepad back", function()
    start()
    W:Open(); H.flush()
    H.setCombat(true)
    H.fire("PLAYER_REGEN_DISABLED"); H.flush()
    T.ok(not W:IsShown(), "still open in combat")
    T.eq(G.owner, nil, "the gamepad is not given back")
    H.setCombat(false)
end)

T.run()
