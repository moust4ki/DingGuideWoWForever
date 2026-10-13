-- The guide window as plain text: what the player sees in Ding's guide window for a scenario
-- of tools/panel_scenarios.lua (title, step bar, every row with its look said in words, its
-- counter and sub-lines, the notices, the "Next steps" preview, the minimized line, the step
-- menu) and the card of each row (hover with the mouse, X in focus mode), in a given language.
-- Humans read it; the French snapshots in tools/tests/snapshots/ show any change of the window
-- in a review (panel_snapshot_test.lua compares them).
--
-- usage: lua5.1 tools/panel_snapshot.lua <combined dir> [scenario ...] [--locale frFR]
--                                        [--write <dir>] [--list]
--   no scenario: all of them, one after the other. --write: one file per scenario
--   (<dir>/<scenario>.txt) instead of the standard output. --list: the scenarios and what
--   each one shows.
-- As a module (tests): dofile("tools/panel_snapshot.lua") returns
--   { scenarios, GUIDES, Bind(T) -> view }, view:Setup(scenario or name), view:Render(scenario),
--   view:Snapshot(name) (setup then render).
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local Snap = {}
Snap.scenarios = dofile(here .. "/panel_scenarios.lua")
-- The shipped guides the scenarios use (the mock loads only these).
Snap.GUIDES = Snap.scenarios.GUIDES

local byName = {}
for _, sc in ipairs(Snap.scenarios) do byName[sc.name] = sc end
Snap.byName = byName

-- Color tokens of Ding's design (UI.C) in words, for the looks of a row. Several tokens share a
-- value (border and hover): the first name that matches wins, in this order.
local COLOR_WORDS = {
    { "doneRowBg", "green" }, { "todoRowBg", "red" }, { "manualRowBg", "violet" },
    { "skippedRowBg", "amber" }, { "subtle", "grey box" }, { "control", "button" },
    { "done", "green" }, { "todo", "red" }, { "manual", "violet" }, { "skipped", "amber" },
    { "above", "orange" }, { "accent", "blue" }, { "text", "white" }, { "glyph", "white" },
    { "secondary", "light grey" }, { "muted", "dim grey" }, { "disabled", "grey" },
    { "extraRowBg", "neutral" }, { "extra", "neutral" },
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
        for _, pair in ipairs(COLOR_WORDS) do
            if C[pair[1]] and same(rgba, C[pair[1]]) then return pair[2] end
        end
        return ("rgb %.2f %.2f %.2f"):format(rgba[1], rgba[2], rgba[3])
    end
    view.colorWord = colorWord

    -- A text as the player reads it: colors gone, but the orange of a quest above the player's
    -- level kept as {orange: ...} (a color that carries a meaning, said in words elsewhere).
    local function readable(s)
        s = tostring(s or "")
        s = s:gsub("|cffff8040(.-)|r", "{orange: %1}")
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
        local font = r.text.fontObject and r.text.fontObject.name
        if font and font ~= "DingFont_regular12" then
            parts[#parts + 1] = font:gsub("^DingFont_", ""):gsub("(%a)(%d)", "%1 %2")
        end
        if data.nested then parts[#parts + 1] = "indented" end
        if r.counter:IsShown() then
            parts[#parts + 1] = "counter " .. tostring(r.counter:GetText()) .. " " .. colorWord(r.counter.color)
        end
        if r.key:IsShown() then parts[#parts + 1] = "A chip" end
        if r.focus.ring:IsShown() then parts[#parts + 1] = "FOCUSED" end
        return table.concat(parts, ", ")
    end

    -- The card a row shows: hover (mouse), or X in focus mode (`focus`).
    local function card(r, i, focus)
        GameTooltip:Hide()
        if focus then
            P.focusIndex = i
            P:Update()
            H.press("PAD3")
        else
            r.scripts.OnEnter(r)
        end
        local out
        if GameTooltip:IsShown() and GameTooltip:GetOwner() == r then
            out = { readable(GameTooltip.text) }
            for _, line in ipairs(GameTooltip.lines or {}) do out[#out + 1] = readable(line) end
        end
        if not focus then r.scripts.OnLeave(r) end
        GameTooltip:Hide()
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
        add(("# %s, %s %s level %d, window %d wide, scale %s%s"):format(Ding.locale or GetLocale(),
            H.player.race, H.player.class, H.player.level, Ding.db.panel.width, tostring(Ding.db.panel.scale or 1),
            Ding.Gamepad:Active() and ", gamepad" or ", mouse"))
        if ctx and ctx.warning then add("!! " .. ctx.warning) end
        add("")
        if P.compact then
            local m = f.mini
            local data = P.compactRow or {}
            add("MINIMIZED")
            add(("  %s | %s icon | %s%s"):format(readable(m.count:GetText()), colorWord(m.icon.tex.vertexColor),
                readable(m.text:GetText()), m.counter:IsShown() and (" | " .. tostring(m.counter:GetText())) or ""))
            if m.text:IsTruncated() then add("  (the line is cut by an ellipsis: hover shows it whole)") end
            GameTooltip:Hide()
            f.scripts.OnEnter(f)
            if GameTooltip:IsShown() then
                add("  hover card:")
                add("    " .. readable(GameTooltip.text))
                for _, line in ipairs(GameTooltip.lines or {}) do add("    " .. readable(line)) end
            end
            f.scripts.OnLeave(f)
            GameTooltip:Hide()
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
            GameTooltip:Hide()
            P.focusIndex = 1
            P:Update()
        end
        add("")
        local current, total = E.index, E.guide and #E.guide.steps or 0
        add(("PROGRESS bar %d / %d"):format(math.min(current, total), total))
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

    function view:Snapshot(name)
        local sc = assert(byName[name], "no scenario " .. tostring(name))
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
local locale, write, list, names = "frFR", nil, false, {}
local i = 2
while cli[i] do
    local a = cli[i]
    if a == "--locale" then
        locale, i = cli[i + 1], i + 1
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
    local text = view:Snapshot(name)
    if write then
        local file = assert(io.open(write .. "/" .. name .. ".txt", "wb"))
        file:write(text)
        file:close()
        print("written: " .. write .. "/" .. name .. ".txt")
    else
        io.write(text, "\n")
    end
end
os.exit(T.H.problems() > problems and 1 or 0)
