-- The guide window as plain text: what the player sees in Ding's guide window for a scenario
-- of tools/panel_scenarios.lua (title, step bar, every row with its look said in words, its
-- counter and sub-lines, the notices, the "Next steps" preview, the minimized line, the step
-- menu) and the card of each row (hover with the mouse, X in focus mode), in a given language.
-- Humans read it; the French snapshots in tools/tests/snapshots/ show any change of the window
-- in a review (panel_snapshot_test.lua compares them).
--
-- usage: lua5.1 tools/panel_snapshot.lua <combined dir> [scenario ...] [--locale frFR]
--                                        [--theme <id>] [--write <dir>] [--list]
--   no scenario: all of them, one after the other. --write: one file per scenario
--   (<dir>/<scenario>.txt, <dir>/<scenario>@<theme>.txt for another theme than Ding dark)
--   instead of the standard output. --list: the scenarios and what each one shows. --theme:
--   the look (UI/Themes.lua), "dingdark" by default: the snapshots of every scenario were
--   written with it; Snap.THEMED lists the scenarios kept in the other themes too.
-- As a module (tests): dofile("tools/panel_snapshot.lua") returns
--   { scenarios, GUIDES, THEMED, Bind(T) -> view }, view:Setup(scenario or name),
--   view:Render(scenario), view:Snapshot(name[, theme]) (setup then render).
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local Snap = {}
Snap.scenarios = dofile(here .. "/panel_scenarios.lua")
-- The shipped guides the scenarios use (the mock loads only these).
Snap.GUIDES = Snap.scenarios.GUIDES

local byName = {}
for _, sc in ipairs(Snap.scenarios) do byName[sc.name] = sc end
Snap.byName = byName
-- The look of the snapshots, and the scenarios also kept in the other themes.
Snap.THEME = "dingdark"
Snap.THEMED = { themes = { "halo", "ardoise", "bandes" }, scenarios = { "a12-fragments", "a11-minimized" } }

-- Color tokens of the theme (UI.C) in words, for the looks of a row. Several tokens share a
-- value (border and hover): the first name that matches wins, in this order. A theme's own words
-- come first (the to-do of Halo is its gold accent, the one of Bandes a white on a blue band).
local COLOR_WORDS = {
    { "doneRowBg", "green" }, { "todoRowBg", "red" }, { "manualRowBg", "violet" },
    { "skippedRowBg", "amber" }, { "noticeBg", "grey box" }, { "control", "button" },
    { "done", "green" }, { "todo", "red" }, { "manual", "violet" }, { "skipped", "amber" },
    { "above", "orange" }, { "accent", "blue" }, { "text", "white" }, { "chipText", "white" },
    { "secondary", "light grey" }, { "subText", "light grey" }, { "muted", "dim grey" }, { "disabled", "grey" },
}
local THEME_WORDS = {
    halo = { { "todo", "gold" }, { "accent", "gold" }, { "quest", "gold" }, { "link", "light blue" },
        { "skipped", "teal" } },
    ardoise = { { "todoRowBg", "amber" }, { "todo", "amber" }, { "accent", "gold" }, { "link", "light blue" },
        { "skippedRowBg", "teal" }, { "skipped", "teal" } },
    bandes = { { "doneRowBg", "green band" }, { "todoRowBg", "blue band" }, { "infoRowBg", "dark band" },
        { "noticeBg", "dark band" }, { "panelStepbar", "dark band" }, { "manualRowBg", "violet band" },
        { "skippedRowBg", "amber band" },
        { "todo", "white" } },
}
local GLYPHS = { icon_check = "check", icon_diamond = "diamond", circle = "dot" }

function Snap.Bind(T)
    local Ding, H = T.Ding, T.H
    local E, P, L, UI = Ding.Engine, Ding.Panel, Ding.L, Ding.UI
    local C = UI.C
    local view = {}

    local function same(a, b)
        if not (a and b) then return false end
        for i = 1, 4 do
            if math.abs((a[i] or 1) - (b[i] or 1)) > 0.002 then return false end
        end
        return true
    end
    local function colorWord(rgba)
        if not rgba then return "?" end
        for _, words in ipairs({ THEME_WORDS[UI.Theme.current.id] or {}, COLOR_WORDS }) do
            for _, pair in ipairs(words) do
                if C[pair[1]] and same(rgba, C[pair[1]]) then return pair[2] end
            end
        end
        return ("rgb %.2f %.2f %.2f"):format(rgba[1], rgba[2], rgba[3])
    end
    view.colorWord = colorWord

    -- A font in words: its weight and size ("semibold 12"), "game font 13" for the client's
    -- own; Noto Sans Regular 12 (the rows' text) says nothing.
    local function fontWord(font)
        if not font then return nil end
        local path, size, flags = font:GetFont()
        local weight = tostring(path):match("NotoSans%-(%a+)%.ttf")
        local word = weight and (weight:lower() .. " " .. tostring(size)) or ("game font " .. tostring(size))
        if flags and flags ~= "" then word = word .. " " .. flags:lower() end
        if word == "regular 12" then return nil end
        return word
    end
    view.fontWord = fontWord

    -- A text as the player reads it: colors gone, but the orange of a quest above the player's
    -- level kept as {orange: ...} (a color that carries a meaning, said in words elsewhere); an
    -- item link as the client shows it, its name in brackets.
    local function readable(s)
        s = tostring(s or "")
        s = s:gsub("|cff" .. UI.HexOf(C.above) .. "(.-)|r", "{orange: %1}")
        s = s:gsub("|H.-|h(.-)|h", "%1")
        return H.plain(s)
    end
    view.readable = readable

    local function lines(s)
        local out = {}
        for line in (tostring(s) .. "\n"):gmatch("(.-)\n") do out[#out + 1] = line end
        return out
    end

    -- What a row frame looks like, in words: background, icon, text color, counter, font.
    local function look(r, data)
        local parts = {}
        if r.rule and r.rule:IsShown() then parts[#parts + 1] = "LINE ABOVE" end
        if r.bg:IsShown() then parts[#parts + 1] = colorWord(r.bg.color) .. " background" end
        if r.icon:IsShown() then
            local icon
            if r.icon.item:IsShown() then
                icon = "item icon"
            elseif r.icon.letter:IsShown() then
                icon = colorWord(r.icon.letter.color) .. " \"" .. tostring(r.icon.letter:GetText()) .. "\""
            elseif r.icon.tex:IsShown() then
                local file = tostring(r.icon.tex.texture):match("([^\\]+)$") or "?"
                local name = GLYPHS[file] or (file == "caret_up" and ((r.icon.tex.rotation or 0) ~= 0 and "caret right"
                    or "caret up")) or file
                icon = colorWord(r.icon.tex.vertexColor) .. " " .. name
            end
            parts[#parts + 1] = (icon or "empty") .. " icon"
        else
            parts[#parts + 1] = "no icon"
        end
        parts[#parts + 1] = "text " .. colorWord(r.text.color)
        local font = fontWord(r.text.fontObject)
        if font then parts[#parts + 1] = font end
        if data.nested then parts[#parts + 1] = "indented" end
        if r.counter:IsShown() then
            parts[#parts + 1] = "counter " .. tostring(r.counter:GetText()) .. " " .. colorWord(r.counter.color)
        end
        if r.key:IsShown() then parts[#parts + 1] = "A chip" end
        if r.focus.ring:IsShown() then parts[#parts + 1] = "FOCUSED" end
        return table.concat(parts, ", ")
    end

    -- The card a row shows (the card of Ding, or the game tooltip for an item or a talent):
    -- hover (mouse), or X in focus mode (`focus`).
    local Card = UI.Card
    local function shownCard(owner)
        for _, tip in ipairs({ Card, GameTooltip }) do
            if tip:IsShown() and tip:GetOwner() == owner then return tip end
        end
    end
    local function hideCards()
        Card:Hide()
        GameTooltip:Hide()
    end
    view.shownCard = shownCard
    local function card(r, i, focus)
        hideCards()
        if focus then
            P.focusIndex = i
            P:Update()
            H.press("PAD3")
        else
            r.scripts.OnEnter(r)
        end
        local out
        local tip = shownCard(r)
        if tip then
            out = { readable(tip.text) }
            for _, line in ipairs(tip.lines or {}) do out[#out + 1] = readable(line) end
        end
        if not focus then r.scripts.OnLeave(r) end
        hideCards()
        return out
    end

    local function stepMenu(row)
        P:OpenStepMenu(row)
        local m = P.stepMenu
        local out = {}
        if m and m:IsShown() then
            for _, b in ipairs(m.items or {}) do out[#out + 1] = readable(b.text:GetText()) end
        end
        P:CloseStepMenu()
        return out
    end

    local function pad(on)
        H.setGamepadConnected(on)
        H.fire(on and "GAME_PAD_CONNECTED" or "GAME_PAD_DISCONNECTED")
        H.flush()
    end
    view.pad = pad

    -- Puts the game and the guide in the scenario's state (tools/panel_scenarios.lua).
    function view:Setup(sc)
        if type(sc) == "string" then sc = assert(byName[sc], "no scenario " .. sc) end
        local S = Snap.scenarios
        return S.Setup(sc, { T = T, H = H, Ding = Ding, E = E, P = P, L = L, pad = pad })
    end

    -- The window of the current state as text, with the scenario's heading.
    function view:Render(sc, ctx)
        if type(sc) == "string" then sc = byName[sc] end
        local out = {}
        local function add(s) out[#out + 1] = s end
        local f = P.frame
        local focus = sc.focus and true or false
        add(("# %s"):format(sc.name))
        add(("# %s"):format(sc.about))
        local theme = UI.Theme.current.id
        add(("# %s, %s %s level %d, window %d wide, scale %s%s%s"):format(Ding.locale or GetLocale(),
            H.player.race, H.player.class, H.player.level, Ding.db.panel.width, tostring(Ding.db.panel.scale or 1),
            Ding.Gamepad:Active() and ", gamepad" or ", mouse",
            theme ~= Snap.THEME and (", theme " .. theme .. ", background " .. math.floor(UI.Theme.Opacity() * 100 + 0.5)
                .. " %") or ""))
        if ctx and ctx.warning then add("!! " .. ctx.warning) end
        add("")
        if P.compact then
            local m = f.mini
            local data = P.compactRow or {}
            add("MINIMIZED")
            add(("  %s | %s icon | %s%s"):format(readable(m.count:GetText()), colorWord(m.icon.tex.vertexColor),
                readable(m.text:GetText()), m.counter:IsShown() and (" | " .. tostring(m.counter:GetText())) or ""))
            if m.band:IsShown() then add("  " .. colorWord(m.band.color) .. " behind the line") end
            if m.text:IsTruncated() then add("  (the line is cut by an ellipsis: hover shows it whole)") end
            hideCards()
            f.scripts.OnEnter(f)
            local tip = shownCard(f)
            if tip then
                add("  hover card:")
                add("    " .. readable(tip.text))
                for _, line in ipairs(tip.lines or {}) do add("    " .. readable(line)) end
            end
            f.scripts.OnLeave(f)
            hideCards()
            add(("  state of its row: %s"):format(tostring(data.state)))
            return table.concat(out, "\n") .. "\n"
        end
        add("TITLE  " .. readable(f.title:GetText()))
        local bar = {}
        if f.lb:IsShown() then bar[#bar + 1] = "[LB]" end
        bar[#bar + 1] = "<" .. (f.prev.enabled == false and " (off)" or "")
        bar[#bar + 1] = readable(f.stepText:GetText()) .. readable(f.stepTotal:GetText())
        bar[#bar + 1] = ">" .. (f.next.enabled == false and " (off)" or "")
        if f.rb:IsShown() then bar[#bar + 1] = "[RB]" end
        add("STEP   " .. table.concat(bar, " ") .. "   zone: " .. readable(f.zone:GetText()))
        add("")
        local cut = 0
        for i, data in ipairs(P.rowsShown or {}) do
            local r = f.rows[i]
            add(("%2d  %s  [%s] %s"):format(i, tostring(data.action), tostring(data.state), look(r, data)))
            local indent = data.nested and "      " or "    "
            for _, line in ipairs(lines(readable(r.text:GetText()))) do add(indent .. line) end
            if r.sub:IsShown() then
                for _, line in ipairs(lines(readable(r.sub:GetText()))) do add(indent .. "  > " .. line) end
            end
            if r.text:IsTruncated() or (r.sub:IsShown() and r.sub:IsTruncated()) then
                cut = cut + 1
                add(indent .. "!! CUT: this row's text does not show whole")
            end
            local c = card(r, i, focus)
            if c then
                add(indent .. (focus and "X card:" or "card:"))
                for _, line in ipairs(c) do add(indent .. "  | " .. line) end
            end
            if focus then
                local hints = {}
                for _, h in ipairs(P:FocusHints()) do
                    local keys = {}
                    for _, k in ipairs(type(h.keys) == "table" and h.keys or { h.keys }) do
                        keys[#keys + 1] = Ding.Gamepad:ButtonName(k)
                    end
                    hints[#hints + 1] = table.concat(keys, "+") .. " " .. readable(h.label)
                end
                add(indent .. "hint bar: " .. table.concat(hints, " · "))
            end
        end
        if focus then
            hideCards()
            P.focusIndex = 1
            P:Update()
        end
        add("")
        -- The step among the character's steps, as the step bar counts them (Engine:StepNumber).
        local current, total = 0, 0
        if E.guide then current, total = E:StepNumber(math.min(E.index, #E.guide.steps)) end
        add(("PROGRESS bar %d / %d"):format(current, total))
        local menu = stepMenu(nil)
        add("MENU (right click on the window): " .. (#menu > 0 and table.concat(menu, " | ") or "none"))
        for _, data in ipairs(P.rowsShown or {}) do
            if data.quest and data.action ~= "preview" then
                add("MENU (right click on a row with a quest): " .. table.concat(stepMenu(data), " | "))
                break
            end
        end
        if cut > 0 then add(("!! %d row(s) cut"):format(cut)) end
        return table.concat(out, "\n") .. "\n"
    end

    -- `theme`: the look (Snap.THEME by default); the background at the default of that theme.
    function view:Snapshot(name, theme)
        local sc = assert(byName[name], "no scenario " .. tostring(name))
        Ding.db.ui.opacityTouched = nil
        UI.Theme.Apply(theme or Snap.THEME)
        local ctx = self:Setup(sc)
        local text = self:Render(sc, ctx)
        Snap.scenarios.Teardown(sc, { T = T, H = H, Ding = Ding, E = E, P = P, L = L, pad = pad })
        return text
    end

    return view
end

---------------------------------------------------------------------------
-- Command line
---------------------------------------------------------------------------
local cli = { ... }
if #cli == 0 then return Snap end

local combined = cli[1]
local locale, write, list, names, theme = "frFR", nil, false, {}, nil
local i = 2
while cli[i] do
    local a = cli[i]
    if a == "--locale" then
        locale, i = cli[i + 1], i + 1
    elseif a == "--theme" then
        theme, i = cli[i + 1], i + 1
    elseif a == "--write" then
        write, i = cli[i + 1], i + 1
    elseif a == "--list" then
        list = true
    else
        names[#names + 1] = a
    end
    i = i + 1
end
if list then
    for _, sc in ipairs(Snap.scenarios) do print(("%-28s %s"):format(sc.name, sc.about)) end
    os.exit(0)
end
local T = dofile(here .. "/testlib.lua")(combined, { guides = Snap.GUIDES, locale = locale })
local view = Snap.Bind(T)
if #names == 0 then
    for _, sc in ipairs(Snap.scenarios) do names[#names + 1] = sc.name end
end
local problems = T.H.problems()
for _, name in ipairs(names) do
    if not byName[name] then
        io.stderr:write("unknown scenario: " .. name .. " (--list)\n")
        os.exit(2)
    end
    local text = view:Snapshot(name, theme)
    if write then
        local path = write .. "/" .. name .. ((theme and theme ~= Snap.THEME) and ("@" .. theme) or "") .. ".txt"
        local file = assert(io.open(path, "wb"))
        file:write(text)
        file:close()
        print("written: " .. path)
    else
        io.write(text, "\n")
    end
end
os.exit(T.H.problems() > problems and 1 or 0)
