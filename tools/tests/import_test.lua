-- Guides as text (Core/GuideText.lua, Core/Import.lua, UI/ImportWindow.lua): the reader of
-- the table literal and the hostile texts it refuses, the checks against the guide format
-- and QuestieDB, the import (ids, storage, login, delete), the export and its round trip,
-- the window (gamepad and mouse) and the Guide tab's page.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, C, L = Ding.Engine, Ding.Config, Ding.L
local Text, I, W = Ding.GuideText, Ding.Import, Ding.ImportWindow
local press = H.press
local SHADOWGLEN = "nightelf-01-shadowglen"

local function start()
    if C.frame and C.frame:IsShown() then C:Close() end
    if W.frame and W.frame:IsShown() then W:Close() end
    T.reset({ level = 1 })
    for id in pairs(Ding.db.imported) do I:Delete(id) end
    E:SetGuide(SHADOWGLEN, 1, true)
    H.flush()
end

local function parseError(text)
    local value, err = Text.Parse(text)
    T.eq(value, nil, "read without error: " .. text:sub(1, 60))
    return err
end

-- The report's lines, joined (errors first).
local function lines(report)
    local out = {}
    for _, l in ipairs(report.errors) do out[#out + 1] = "E " .. l end
    for _, l in ipairs(report.warnings) do out[#out + 1] = "W " .. l end
    return table.concat(out, "\n")
end

local function has(report, level, text)
    for _, l in ipairs(level == "error" and report.errors or report.warnings) do
        if l == text then return true end
    end
    error(("missing %s %q in:\n%s"):format(level, text, lines(report)), 2)
end

local GUIDE = [==[
-- A guide written by hand, as an AI would answer.
```lua
{
    id = "t-bag", title = "Test bag", category = "items",
    minLevel = 1, maxLevel = 10,
    steps = {
        { accept = 456, note = "Near the " .. 'tree' },
        { go = { 1438, 54.6, 33.0 }, text = [[Walk north]] },
        { complete = { 456 }, kill = { { 1984, 4 } } },  -- a pair list
        { turnin = 456, faction = "Alliance" },
    },
}
```
]==]

---------------------------------------------------------------------------
-- The reader
---------------------------------------------------------------------------
T.test("reader: a guide with comments, a code fence, joined and long texts", function()
    local g = assert(Text.Parse(GUIDE))
    T.eq(g.id, "t-bag")
    T.eq(g.category, "items")
    T.eq(#g.steps, 4)
    T.eq(g.steps[1].note, "Near the tree")
    T.eq(g.steps[2].text, "Walk north")
    T.eq(g.steps[2].go[2], 54.6)
    T.eq(g.steps[3].kill[1][2], 4)
    T.eq(g.steps[3].complete[1], 456)
    local r = assert(Text.Parse("return { a = -3, b = 0x10, c = 'x\\ty\\065', [2] = true, d = nil; 'z' }"))
    T.eq(r.a, -3)
    T.eq(r.b, 16)
    T.eq(r.c, "x\tyA")
    T.eq(r[1], "z")
    T.eq(r[2], true)
end)

T.test("reader: mistakes give their line", function()
    local err = parseError("{\n  a = 1,\n  b = 'open\n}")
    T.eq(err.line, 3)
    T.eq(err.key, "PARSE_OPEN")
    T.eq(parseError("{ a = 1 } x").key, "PARSE_END")
    T.eq(parseError("").key, "PARSE_EMPTY")
    T.eq(parseError("   -- only a comment").key, "PARSE_EMPTY")
    T.eq(parseError("x = 1").key, "PARSE_START")
    T.eq(parseError("{ a = 1 b = 2 }").key, "PARSE_CLOSE")
    T.eq(parseError("{ a = 12abc }").key, "PARSE_NUMBER")
    T.eq(parseError("{ a = 'x' .. }").key, "PARSE_JOIN")
    T.eq(parseError("{ [true] = 1 }").key, "PARSE_KEY")
    T.eq(parseError("{ a = '\\q' }").key, "PARSE_ESCAPE")
    T.eq(parseError("{\n\n --[[ never closed\n").line, 3)
end)

T.test("reader: code is refused and never runs", function()
    _G.DING_PWNED = nil
    _G.dingPwn = function() _G.DING_PWNED = true end
    for _, text in ipairs({
        "{ a = dingPwn() }", "{ dingPwn() }", "{ a = os.execute('x') }", "{ a = function() end }",
        "{ a = loadstring('dingPwn()') }", "{ [dingPwn] = 1 }", "{ a = 1 + 2 }", "{ a = #'x' }",
        "{ a = (1) }", "{ a = {} .. 'x' }", "dingPwn() or {}", "{ a = setmetatable({}, {}) }",
        "{ a = RunScript('dingPwn()') }",
    }) do
        local err = parseError(text)
        T.ok(err.key == "PARSE_VALUE" or err.key == "PARSE_CLOSE" or err.key == "PARSE_START"
            or err.key == "PARSE_JOIN", text .. ": " .. err.key)
    end
    T.eq(_G.DING_PWNED, nil, "a function of the text ran")
    _G.dingPwn = nil
    -- Nothing of Lua's loaders in the reader nor the import.
    for _, file in ipairs({ "Ding/Core/GuideText.lua", "Ding/Core/Import.lua", "Ding/UI/ImportWindow.lua" }) do
        local f = assert(io.open(tools .. "/../" .. file, "rb"))
        local source = f:read("*a"):gsub("%-%-[^\n]*", "")
        f:close()
        for _, word in ipairs({ "loadstring", "load%(", "setfenv", "RunScript", "dofile", "loadfile" }) do
            T.ok(not source:find(word), file .. " uses " .. word)
        end
    end
end)

T.test("reader: limits on size, depth and the number of values", function()
    T.eq(parseError("{ a = '" .. string.rep("x", Text.MAX_SIZE) .. "' }").key, "PARSE_SIZE")
    T.eq(parseError(string.rep("{", 30) .. string.rep("}", 30)).key, "PARSE_DEPTH")
    T.eq(parseError("{" .. string.rep("1,", Text.MAX_VALUES + 1) .. "}").key, "PARSE_COUNT")
    T.ok(Text.Parse(string.rep("{", Text.MAX_DEPTH) .. string.rep("}", Text.MAX_DEPTH)), "the deepest allowed")
end)

---------------------------------------------------------------------------
-- The checks
---------------------------------------------------------------------------
local function check(text)
    local data = assert(Text.Parse(text))
    return I:Check(data)
end

T.test("checks: the example guide passes; an item QuestieDB lacks is a warning", function()
    start()
    local plan, report = check(GUIDE)
    T.ok(plan, lines(report))
    T.eq(#report.errors, 0)
    plan, report = check([[{ steps = { { accept = 456, when = { item = { 5469, 4 }, minlevel = 2 } },
        { accept = 456, when = { item = { 5469, 5470, 5471 }, done = { 456 } } },
        { accept = 456, when = { item = { { 5469, 4 }, { 5470, 1 } }, noitem = 5469 } } } }]])
    T.ok(plan, lines(report))
    plan, report = check("{ steps = { { accept = 456, use = 99999901 } } }")
    T.ok(plan, "an unknown item blocks the import")
    has(report, "warning", L.IMPORT_STEP:format(1, L.IMPORT_ITEM:format(99999901)))
end)

T.test("checks: unknown ids, keys and values, with the step number", function()
    start()
    local plan, report = check([[{ steps = {
        { accept = 456 },
        { talk = 99999902, object = 99999903 },
        { turnin = 99999904, colour = "red" },
        { go = { 1438, 120, 50 } },
        { go = { 99999, 10, 10 } },
        { go = "north" },
        { note = "alone" },
        { accept = 456, when = { done = 456, sometimes = true }, races = { "Elf" }, classes = "JEDI" },
        { kill = { { 1984, 0 } } },
    } }]])
    T.eq(plan, nil)
    has(report, "error", L.IMPORT_STEP:format(2, L.IMPORT_NPC:format(99999902)))
    has(report, "error", L.IMPORT_STEP:format(2, L.IMPORT_OBJECT:format(99999903)))
    has(report, "error", L.IMPORT_STEP:format(3, L.IMPORT_QUEST:format(99999904)))
    has(report, "error", L.IMPORT_STEP:format(3, L.IMPORT_KEY:format("colour")))
    has(report, "error", L.IMPORT_STEP:format(4, L.IMPORT_COORDS:format("go")))
    has(report, "error", L.IMPORT_STEP:format(5, L.IMPORT_MAP:format(99999)))
    has(report, "error", L.IMPORT_STEP:format(6, L.IMPORT_EXPECTS:format("go", "{ 1438, 54.6, 33.0 }")))
    has(report, "error", L.IMPORT_STEP:format(7, L.IMPORT_EMPTY_STEP))
    has(report, "error", L.IMPORT_STEP:format(8, L.IMPORT_KEY:format("when.sometimes")))
    has(report, "error", L.IMPORT_STEP:format(8, L.IMPORT_RACE:format("Elf")))
    has(report, "error", L.IMPORT_STEP:format(8, L.IMPORT_CLASS:format("JEDI")))
    has(report, "error", L.IMPORT_STEP:format(9, L.IMPORT_EXPECTS:format("kill", "{ { 1984, 8 } }")))
end)

T.test("checks: own spots make an unknown monster or object a warning", function()
    start()
    local plan, report = check("{ steps = { { object = 99999903, spots = { { 1438, 40, 40 } } } } }")
    T.ok(plan, lines(report))
    has(report, "warning", L.IMPORT_STEP:format(1, L.IMPORT_OBJECT:format(99999903)))
end)

T.test("checks: faction and races: a quest of the other side, a race of the other side", function()
    start()
    local plan, report = check([[{ faction = "Horde", races = { "Orc", "Human" }, steps = { { text = "x" } } }]])
    has(report, "error", L.IMPORT_RACE_SIDE:format("Human", "Horde"))
    plan, report = check([[{ faction = "Horde", steps = { { accept = 456 }, { accept = 4641 } } }]])
    T.eq(plan, nil)
    has(report, "error", L.IMPORT_STEP:format(1, L.IMPORT_SIDE:format(456)))
    for _, l in ipairs(report.errors) do T.ok(not l:find("4641", 1, true), "Horde quest refused: " .. l) end
    -- A step's own faction: the Alliance half of a guide for both sides.
    plan, report = check([[{ steps = { { accept = 79008, faction = "Alliance" }, { accept = 79007, faction = "Horde" } } }]])
    T.ok(plan, lines(report))
    plan, report = check([[{ steps = { { accept = 79008, faction = "Horde" } } }]])
    has(report, "error", L.IMPORT_STEP:format(1, L.IMPORT_SIDE:format(79008)))
end)

T.test("checks: the guide's own fields and a pack's", function()
    start()
    local plan, report = check([[{ minLevel = 20, maxLevel = 10, faction = "Both", pages = 3, steps = { { text = "x" } } }]])
    T.eq(plan, nil)
    has(report, "error", L.IMPORT_LEVELS)
    has(report, "error", L.IMPORT_EXPECTS:format("faction", '"Alliance" / "Horde"'))
    has(report, "error", L.IMPORT_KEY:format("pages"))
    plan, report = check([[{ pack = { title = "P", colour = 1, category = "pets" }, guides = {
        { id = "a", steps = { { text = "x" } }, next = "b" },
        { id = "a", steps = {} },
    } }]])
    T.eq(plan, nil)
    has(report, "error", L.IMPORT_KEY:format("pack.colour"))
    has(report, "warning", L.IMPORT_CATEGORY:format("pets"))
    has(report, "error", L.IMPORT_GUIDE:format("a", L.IMPORT_TWICE:format("a")))
    has(report, "error", L.IMPORT_GUIDE:format("a", L.IMPORT_NO_STEPS))
    has(report, "warning", L.IMPORT_GUIDE:format("a", L.IMPORT_NEXT:format("b")))
    plan, report = check("{ title = 'nothing' }")
    has(report, "error", L.IMPORT_SHAPE)
    plan, report = check("{ pack = { title = 'P' }, guides = {} }")
    has(report, "error", L.IMPORT_NO_GUIDES)
end)

T.test("docs/create-a-guide-with-ai.md: its complete example imports without an error", function()
    start()
    local f = assert(io.open(tools .. "/../docs/create-a-guide-with-ai.md", "rb"))
    local doc = f:read("*a")
    f:close()
    local from = assert(doc:find("<!-- example", 1, true), "example marker missing")
    local block = assert(doc:match("```lua\r?\n(.-)```", from), "example block missing")
    local id, report = I:Import(block)
    T.eq(id, "example-cozy-sleeping-bag", lines(report))
    T.eq(#report.errors + #report.warnings, 0, lines(report))
    T.eq(Ding:GetGuidePack(id).category, "items")
    T.eq(#Ding:GetGuide(id).steps, 13)
end)

---------------------------------------------------------------------------
-- Import, storage, login, delete
---------------------------------------------------------------------------
T.test("import: a pack of its own with its category, kept account-wide, listed as imported", function()
    start()
    local id, report = I:Import(GUIDE)
    T.eq(id, "t-bag", lines(report))
    local pack = Ding:GetGuidePack("t-bag")
    T.ok(pack and pack.imported, "pack not registered as imported")
    T.eq(pack.category, "items")
    T.eq(pack.title, "Test bag")
    local guide = Ding:GetGuide("t-bag")
    T.eq(guide.pack, "t-bag")
    T.eq(#guide.steps, 4)
    T.eq(guide.steps[1].accept[1], 456, "the registry's own form")
    T.ok(Ding.db.imported["t-bag"], "not saved")
    T.eq(Ding.db.imported["t-bag"].guides[1].steps[1].accept, 456, "the saved copy was changed by the registry")
    C:Open("guide", 1); H.flush()
    press("PAD1")
    local entry
    for _, e in ipairs(C.dropdown.entries) do if e.value == "t-bag" then entry = e end end
    T.ok(entry and entry.detail:find(L.PACK_IMPORTED, 1, true), "no \"imported\" in the list")
    press("PAD2")
    C:Close(); H.flush()
end)

T.test("import: missing or taken ids get a user- id; the same id again replaces it", function()
    start()
    local home = Ding:GetGuide(SHADOWGLEN).pack
    local id, report = I:Import("{ title = 'My Route!', steps = { { text = 'Go' } } }")
    T.eq(id, "user-my-route")
    T.eq(Ding:GetGuide("user-my-route").title, "My Route!")
    id, report = I:Import("{ id = '" .. SHADOWGLEN .. "', steps = { { text = 'Go' } } }")
    T.eq(id, "user-" .. SHADOWGLEN)
    has(report, "warning", L.IMPORT_RENAMED:format(SHADOWGLEN, "user-" .. SHADOWGLEN))
    T.eq(Ding:GetGuide(SHADOWGLEN).pack, home, "Ding's guide was replaced")
    id = I:Import("{ pack = { id = 'ding', title = 'Mine' }, guides = { { steps = { { text = 'Go' } } } } }")
    T.eq(id, "user-ding")
    T.eq(Ding:GetGuide("user-ding-1").pack, "user-ding")
    id, report = I:Import("{ title = 'My Route!', steps = { { text = 'Again' } } }")
    T.eq(id, "user-my-route")
    has(report, "warning", L.IMPORT_REPLACES:format("My Route!"))
    T.eq(Ding:GetGuide("user-my-route").steps[1].text, "Again")
    T.eq(#I:List(), 3)
end)

T.test("import: a pack of two guides; next follows a renamed guide", function()
    start()
    local id, report = I:Import([[{ pack = { id = "t-two", title = "Two", author = "Me" }, guides = {
        { id = "]] .. SHADOWGLEN .. [[", title = "One", next = "]] .. SHADOWGLEN .. [[-b", steps = { { text = "1" } } },
        { id = "]] .. SHADOWGLEN .. [[-b", title = "Two", steps = { { text = "2" } } },
    } }]])
    T.eq(id, "t-two", lines(report))
    local first = Ding:GetGuide("user-" .. SHADOWGLEN)
    T.ok(first, "first guide not renamed")
    T.eq(first.next, SHADOWGLEN .. "-b", "next changed though its guide kept its id")
    T.eq(Ding:GetGuidePack("t-two").author, "Me")
    local ids = {}
    for gid in Ding:IterateGuides("t-two") do ids[#ids + 1] = gid end
    T.eq(table.concat(ids, ","), "user-" .. SHADOWGLEN .. "," .. SHADOWGLEN .. "-b")
end)

T.test("import: refused with errors, nothing kept", function()
    start()
    local id, report = I:Import("{ steps = { { accept = 99999904 } } }")
    T.eq(id, nil)
    has(report, "error", L.IMPORT_STEP:format(1, L.IMPORT_QUEST:format(99999904)))
    T.eq(next(Ding.db.imported), nil)
    id, report = I:Import("{ steps = { { accept = 456 }")
    T.eq(id, nil)
    has(report, "error", L.IMPORT_LINE:format(1, L.PARSE_CLOSE:format("}")))
end)

T.test("login: the saved guides come back; an addon that took the id moves them to user-", function()
    start()
    I:Import(GUIDE)
    local saved = I.Copy(Ding.db.imported["t-bag"])
    Ding.UnregisterGuidePack("t-bag")
    I:RegisterSaved()
    T.ok(Ding:GetGuide("t-bag"), "not registered at login")
    -- An addon pack with the same id, installed since.
    Ding.UnregisterGuidePack("t-bag")
    Ding.RegisterGuidePack({ id = "t-bag", title = "Addon" })
    I:RegisterSaved()
    T.eq(Ding:GetGuidePack("t-bag").title, "Addon", "the addon's pack was replaced")
    T.ok(Ding.db.imported["user-t-bag"], "the import kept its id")
    T.ok(Ding:GetGuidePack("user-t-bag").imported)
    Ding.UnregisterGuidePack("t-bag")
    T.eq(saved.pack.id, "t-bag")
end)

T.test("delete: the pack goes; a character on it goes back to the pack and section before", function()
    start()
    local home = Ding:GetGuide(SHADOWGLEN).pack
    T.quests({ [456] = "log", [458] = "log" })
    local index = E.index
    T.ok(index > 1, "the test needs a step past the first")
    I:Import(GUIDE)
    E:SetPack("t-bag"); H.flush()
    T.eq(E.guide.id, "t-bag")
    T.eq(Ding.char.prevPack, home)
    T.ok(I:Delete("t-bag"))
    T.eq(Ding:GetGuidePack("t-bag"), nil)
    T.eq(Ding:GetGuide("t-bag"), nil)
    T.eq(Ding.db.imported["t-bag"], nil)
    T.eq(E.guide.id, SHADOWGLEN, "not back on the section before")
    T.eq(E.index, index, "not back on the step before")
    T.ok(not I:Delete(Ding.BUILTIN_PACK), "Ding's own pack deleted")
    T.ok(Ding:GetGuidePack(Ding.BUILTIN_PACK))
end)

---------------------------------------------------------------------------
-- Export
---------------------------------------------------------------------------
T.test("export: Ding's own guide reads back clean, and the same text comes out again", function()
    start()
    local text = I:Export(SHADOWGLEN)
    local head = "{\n    id = \"" .. SHADOWGLEN .. "\""
    T.eq(text and text:sub(1, #head), head)
    T.ok(text:find("\n    steps = {\n        { ", 1, true), "steps not one per line")
    local data = assert(Text.Parse(text))
    local plan, report = I:Check(data)
    T.ok(plan, lines(report))
    T.eq(#data.steps, #Ding:GetGuide(SHADOWGLEN).steps)
    -- Imported (under a user- id), then exported again: the same steps.
    local id = I:Import(text)
    T.eq(id, "user-" .. SHADOWGLEN)
    local again = I:Export(id):gsub("user%-" .. SHADOWGLEN:gsub("%-", "%%-"), SHADOWGLEN)
    T.eq(again, text)
end)

T.test("export: on one line, safe for the chat, reads back the same", function()
    start()
    I:Import(GUIDE)
    local full, line = I:Export("t-bag"), I:Export("t-bag", true)
    T.ok(not line:find("\n", 1, true), "a line end in the compact form")
    T.ok(not line:find("|", 1, true), "a | in the compact form")
    local a, b = assert(Text.Parse(full)), assert(Text.Parse(line))
    T.eq(Text.Write(a, { compact = true }), Text.Write(b, { compact = true }))
    T.ok(not full:find("pack = {", 1, true), "a guide imported alone does not come back as a pack")
    T.eq(b.id, "t-bag")
    T.eq(b.category, "items")
    T.eq(#b.steps, 4)
    T.eq(I:Export("no-such-guide"), nil)
    T.ok(I:Export(nil), "the active guide")
end)

T.test("export: a pack of several guides in the pack form, each guide a block", function()
    start()
    I:Import([[{ pack = { id = "t-two", title = "Two", category = "items" }, guides = {
        { id = "t-two-a", steps = { { text = "1" } } }, { id = "t-two-b", steps = { { text = "2" } } } } }]])
    local text = I:Export("t-two")
    T.ok(text:find("^{\n    pack = { id = \"t%-two\", title = \"Two\", category = \"items\" },\n    guides = {\n        {\n"), text)
    local data = assert(Text.Parse(text))
    T.eq(#data.guides, 2)
    T.eq(data.guides[2].steps[1].text, "2")
    T.ok(I:Check(data), "the pack form does not read back")
end)

T.test("export: a text with quotes, line ends and | reads back as it was", function()
    local value = { note = 'a "b"\nc|d\\e', n = 54.62, flag = false, list = { 1, 2 } }
    local back = assert(Text.Parse(Text.Write(value, { compact = true })))
    T.eq(back.note, value.note)
    T.eq(back.n, 54.62)
    T.eq(back.flag, false)
    T.eq(back.list[2], 2)
end)

---------------------------------------------------------------------------
-- The window
---------------------------------------------------------------------------
T.test("window, gamepad: /ding import, paste, A imports; A again follows the guide", function()
    start()
    SlashCmdList.DING("import")
    local f = W.frame
    T.ok(f and f:IsShown(), "/ding import does not open the window")
    T.ok(f.text.edit:HasFocus(), "the text box does not take the paste")
    H.type(f.text.edit, GUIDE)
    T.eq(W.actions[1].label, L.IMPORT_BUTTON)
    press("PAD1")
    T.eq(f.status:GetText(), L.IMPORT_DONE:format("Test bag", 4, 0))
    T.ok(Ding:GetGuide("t-bag"), "not imported")
    T.eq(W.actions[1].label, L.IMPORT_FOLLOW)
    press("PAD1")
    T.ok(not f:IsShown(), "the window stays open")
    T.eq(E.guide.id, "t-bag")
end)

T.test("window: errors listed, copyable, the window stays; B closes", function()
    start()
    W:Open("import")
    local f = W.frame
    H.type(f.text.edit, "{ steps = {\n { accept = 99999904 },\n { colour = 1 } } }")
    press("PAD1")
    T.eq(f.status:GetText(), L.IMPORT_FAILED:format(3, 0))
    local report = f.report.edit:GetText()
    T.ok(report:find(L.IMPORT_ERROR_LINE:format(L.IMPORT_STEP:format(1, L.IMPORT_QUEST:format(99999904))), 1, true), report)
    T.ok(f.report:IsShown())
    press("PAD4")
    T.ok(f.report.edit:HasFocus() and f.report.edit.selection, "Y does not select the report")
    H.type(f.report.edit, "changed")
    T.eq(f.report.edit:GetText(), report, "the report can be typed into")
    T.ok(f:IsShown())
    press("PAD2")
    T.ok(not f:IsShown(), "B does not close")
end)

T.test("window, mouse: the buttons are clicked; Esc in the text closes", function()
    start()
    W:Open("import")
    local f = W.frame
    H.type(f.text.edit, GUIDE)
    f.buttons[1].scripts.OnClick(f.buttons[1])
    T.ok(Ding:GetGuide("t-bag"), "the Import button")
    f.buttons[3].scripts.OnEnter(f.buttons[3])
    T.eq(W.focusIndex, 3, "hover does not move the focus")
    f.buttons[3].scripts.OnClick(f.buttons[3])
    T.ok(not f:IsShown(), "the Close button")
    W:Open("import")
    f.text.edit.scripts.OnEscapePressed(f.text.edit)
    T.ok(not f:IsShown(), "Esc does not close")
end)

T.test("window: /ding export shows the active guide selected and locked; one line on demand", function()
    start()
    SlashCmdList.DING("export")
    local f = W.frame
    T.ok(f:IsShown())
    local text = f.text.edit:GetText()
    T.eq(text, I:Export(SHADOWGLEN))
    T.ok(f.text.edit:HasFocus() and f.text.edit.selection, "the text is not selected")
    H.type(f.text.edit, "x")
    T.eq(f.text.edit:GetText(), text, "the exported text can be typed into")
    press("PADDRIGHT")
    T.eq(W.actions[W.focusIndex].label, L.EXPORT_ONE_LINE)
    press("PAD1")
    T.eq(f.text.edit:GetText(), I:Export(SHADOWGLEN, true))
    T.eq(W.actions[2].label, L.EXPORT_FULL)
    press("PAD2")
    SlashCmdList.DING("export no-such-guide")
    T.ok(not f:IsShown(), "a window for a guide that does not exist")
end)

T.test("window: combat closes it", function()
    start()
    W:Open("import")
    -- The event comes just before the lockdown, while bindings can still be cleared.
    H.fire("PLAYER_REGEN_DISABLED")
    H.setCombat(true)
    T.ok(not W.frame:IsShown())
    T.ok(not W:Open("import"), "opened in combat")
    H.setCombat(false)
end)

---------------------------------------------------------------------------
-- The Guide tab's page
---------------------------------------------------------------------------
local function focusOnLabel(label)
    for _ = 1, 40 do
        if C.focus and C.focus.opts and C.focus.opts.label == label then return C.focus end
        press("PADDDOWN")
    end
    error("row not found: " .. label)
end

T.test("Guide tab: the page of guides as text: import, back to the page, delete with confirmation", function()
    start()
    C:Open("guide", 1); H.flush()
    local row = focusOnLabel(L.IMPORTED_ROW)
    T.eq(row.value:GetText(), L.IMPORTED_ZERO)
    press("PAD1")
    T.eq(C.page and C.page.key, "imported", "the page did not open")
    focusOnLabel(L.IMPORT_ROW)
    press("PAD1")
    T.ok(W.frame:IsShown() and not C.frame:IsShown(), "the import window")
    H.type(W.frame.text.edit, GUIDE)
    press("PAD1")
    press("PADDRIGHT"); press("PADDRIGHT")
    press("PAD1")
    T.ok(C.frame:IsShown() and C.page and C.page.key == "imported", "not back on the page")
    local entry = focusOnLabel("Test bag")
    T.ok(entry.desc and entry.desc:GetText():find("t-bag", 1, true), "no id under the title")
    press("PAD1")
    T.ok(Ding:GetGuide("t-bag"), "deleted without confirmation")
    press("PAD1")
    T.eq(Ding:GetGuide("t-bag"), nil, "not deleted")
    T.eq(C.page and C.page.key, "imported", "the page closed")
    C:Close(); H.flush()
end)

T.test("Guide tab: export the active guide from the page, with the mouse", function()
    start()
    C:Open("guide", 1); H.flush()
    C:OpenPage(C.IMPORTED_PAGE or (function()
        focusOnLabel(L.IMPORTED_ROW)
        press("PAD1")
        return C.page.def
    end)())
    local row = focusOnLabel(L.EXPORT_ROW)
    row.scripts.OnClick(row, "LeftButton")
    T.ok(W.frame:IsShown(), "the export window")
    T.eq(W.frame.text.edit:GetText(), I:Export(SHADOWGLEN))
    W:Close()
    T.ok(C.frame:IsShown(), "closing does not come back to the settings")
    C:Close(); H.flush()
end)

T.run()
