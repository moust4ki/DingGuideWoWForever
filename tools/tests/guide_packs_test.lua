-- Guide packs: community addons register a pack and its sections (docs/guide-packs.md).
-- Loaded here like the game does: Ding, then examples/DingExamplePack. The Guide tab shows
-- two dropdowns: the pack (Ding's built-in guide first), then the sections of that pack.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { addons = { tools .. "/../examples/DingExamplePack" } })
local Ding, H = T.Ding, T.H
local E, C, L = Ding.Engine, Ding.Config, Ding.L
local press = H.press
local SHADOWGLEN = "nightelf-01-shadowglen"
-- Shadowglen, the only guide of Ding these tests load, is in Ding's "Zones" pack.
local DING = Ding.ZONES_PACK
local FIRST, SECOND = "example-01-aldrassil", "example-02-cave"

-- Two more packs, for the order of the list; their only sections are for Orcs.
Ding.RegisterGuidePack({ id = "t-zeta", title = "Zeta route" })
Ding.RegisterGuidePack({ id = "t-alpha", title = "alpha route", author = "Someone" })
Ding.RegisterGuidePack({ id = "t-empty", title = "No section" })
for _, pack in ipairs({ "t-zeta", "t-alpha" }) do
    Ding.RegisterGuide({ pack = pack, id = pack .. "-1", title = pack, faction = "Horde", races = { "Orc" },
        minLevel = 10, maxLevel = 20, steps = { { accept = 4641 } } })
end

local function ids(iterator)
    local out = {}
    for id in iterator do out[#out + 1] = id end
    return table.concat(out, ",")
end

local function packIds()
    local out = {}
    for _, pack in ipairs(Ding:GuidePacks()) do out[#out + 1] = pack.id end
    return table.concat(out, ",")
end

local function start(guide)
    if C.frame and C.frame:IsShown() then C:Close() end
    T.reset({ level = 1 })
    if guide then E:SetGuide(guide, 1, true) end
    H.flush()
end

local function chat(fn)
    local printed = {}
    local add = DEFAULT_CHAT_FRAME.AddMessage
    DEFAULT_CHAT_FRAME.AddMessage = function(_, msg) printed[#printed + 1] = msg end
    local ok, err = pcall(fn)
    DEFAULT_CHAT_FRAME.AddMessage = add
    assert(ok, err)
    return printed
end

---------------------------------------------------------------------------
-- Registry
---------------------------------------------------------------------------
T.test("the example pack is loaded with its two sections, separate from Ding's", function()
    local pack = Ding:GetGuidePack("example")
    T.ok(pack, "example pack missing")
    T.eq(pack.title, "Example pack")
    T.eq(pack.author, "Ding! contributors")
    T.eq(ids(Ding:IterateGuides("example")), FIRST .. "," .. SECOND)
    T.eq(Ding:GetGuide(FIRST).pack, "example")
    T.eq(Ding:GetGuide(SHADOWGLEN).pack, DING, "Shadowglen is not in Ding's Zones pack")
    T.ok(not ids(Ding:IterateGuides(DING)):find("example", 1, true), "example sections in Ding's pack")
end)

T.test("a pack's translations apply like Ding's", function()
    T.eq(Ding:GetGuide(SECOND).title, "La grotte des araignées (3-5)")
    T.eq(Ding:GetGuide(SECOND).steps[3].text, "Marche vers la grotte, au nord")
end)

T.test("pack list: Ding's first, then by title; a pack without sections is not listed", function()
    T.eq(packIds(), "ding-zones,t-alpha,example,t-zeta")
end)

T.test("a malformed pack or guide is rejected with a clear message", function()
    T.fails(function() Ding.RegisterGuidePack({ title = "x" }) end, "id is required")
    T.fails(function() Ding.RegisterGuidePack({ id = "example" }) end, "already used")
    T.fails(function() Ding.RegisterGuidePack({ id = Ding.BUILTIN_PACK }) end, "already used")
    T.fails(function() Ding.RegisterGuidePack({ id = Ding.ZONES_PACK }) end, "already used")
    T.fails(function() Ding.RegisterGuidePack({ id = "t-bad", title = 3 }) end, "title must be a string")
    T.fails(function() Ding.RegisterGuide({ pack = "t-nowhere", id = "t-lost", steps = { { level = 2 } } }) end,
        "unknown pack t-nowhere")
    T.fails(function() Ding.RegisterGuide({ pack = "t-zeta", id = SHADOWGLEN, steps = { { level = 2 } } }) end,
        "already used by pack ding")
    T.ok(not Ding:GetGuidePack("t-bad"), "rejected pack registered")
    T.ok(not Ding:GetGuide("t-lost"), "rejected guide registered")
    T.eq(Ding:GetGuide(SHADOWGLEN).pack, DING, "Ding's guide was taken by another pack")
end)

T.test("a pack can re-register its own section", function()
    Ding.RegisterGuide({ pack = "t-zeta", id = "t-zeta-1", title = "Zeta again", faction = "Horde",
        races = { "Orc" }, minLevel = 10, maxLevel = 20, steps = { { accept = 4641 } } })
    T.eq(Ding:GetGuide("t-zeta-1").title, "Zeta again")
    T.eq(ids(Ding:IterateGuides("t-zeta")), "t-zeta-1")
end)

T.test("suggested section: taken from the requested pack, Ding's if it is unknown", function()
    start(nil)
    T.eq(Ding:SuggestGuide("example").id, FIRST)
    T.eq(Ding:SuggestGuide("t-nowhere").id, SHADOWGLEN)
    T.eq(Ding:SuggestGuide().id, SHADOWGLEN)
    T.eq(Ding:SuggestGuide("t-zeta"), nil, "Orc section suggested to a Night Elf")
end)

---------------------------------------------------------------------------
-- Engine
---------------------------------------------------------------------------
T.test("switching packs: its section for the character, saved along with the pack", function()
    start(SHADOWGLEN)
    T.eq(Ding.char.pack, DING)
    T.ok(E:SetPack("example"))
    T.eq(E.guide.id, FIRST)
    T.eq(Ding.char.guide, FIRST)
    T.eq(Ding.char.pack, "example")
    T.ok(not E:SetPack("t-nowhere"), "unknown pack accepted")
    T.eq(E.guide.id, FIRST)
end)

T.test("choosing the active pack again keeps the section and the step", function()
    start(FIRST)
    T.quests({ [456] = "log", [458] = "log" })
    T.eq(E.index, 2)
    E:SetPack("example"); H.flush()
    T.eq(E.guide.id, FIRST)
    T.eq(E.index, 2, "the step changed")
end)

T.test("going back to Ding's guide resumes where the character is", function()
    start(FIRST)
    T.quests({ [456] = "turnedin", [457] = "log", [458] = "turnedin", [459] = "log" })
    E:SetPack(DING); H.flush()
    T.eq(E.guide.id, SHADOWGLEN)
    T.ok(E.index >= 4, "completed steps not skipped: " .. E.index)
    T.eq(Ding.char.pack, DING)
end)

T.test("a pack without a section for the character still loads its first section", function()
    start(SHADOWGLEN)
    T.ok(E:SetPack("t-zeta"))
    T.eq(E.guide.id, "t-zeta-1")
end)

T.test("the next section (next) follows on within the pack", function()
    start(FIRST)
    T.quests({ [456] = "log", [458] = "log" })
    T.quests({ [456] = "ready" })
    T.quests({ [456] = "turnedin", [457] = "log" })
    T.quests({ [458] = "turnedin", [459] = "log" })
    T.eq(E.index, 5, "class trainer step")
    E:Next(); H.flush()
    T.quests({ [457] = "ready", [459] = "ready" })
    T.quests({ [457] = "turnedin" })
    T.quests({ [459] = "turnedin" })
    T.eq(E.guide.id, SECOND)
    T.eq(E.index, 1, "level 3 step")
    T.eq(Ding.char.guide, SECOND)
    T.eq(Ding.char.pack, "example")
end)

T.test("the second section of the example pack plays through to the end", function()
    start(SECOND)
    T.eq(E.index, 1, "level 3 step")
    H.player.level = 3
    T.quests({ [916] = "log", [4495] = "log" })
    T.eq(E.index, 3, "go step")
    H.player.map, H.player.x, H.player.y = 1438, 54.6, 33.0
    H.tick(2); H.flush()
    T.eq(E.index, 4, "arrival at the cave not validated")
    T.quests({ [4495] = "turnedin", [3519] = "log" })
    T.quests({ [916] = "ready" })
    T.quests({ [3519] = "turnedin" })
    T.eq(E.index, 9, "optional steps (fang never dropped) not skipped")
    T.quests({ [916] = "turnedin" })
    T.eq(E.index, 10, "last step")
    T.ok(E:IsManual(E:CurrentStep()), "the last step does not wait for \"next\"")
    E:Next(); H.flush()
    T.ok(E.finished, "pack not finished")
end)

T.test("next can lead to another pack's section: the character's pack follows", function()
    Ding.RegisterGuidePack({ id = "t-bridge", title = "Bridge" })
    Ding.RegisterGuide({ pack = "t-bridge", id = "t-bridge-1", next = SHADOWGLEN, steps = { { level = 1 } } })
    start("t-bridge-1")
    T.eq(E.guide.id, SHADOWGLEN)
    T.eq(Ding.char.pack, DING)
end)

T.test("login: section gone, the character's pack suggests another one", function()
    start(nil)
    Ding.char.guide, Ding.char.pack = "example-99-gone", "example"
    E:Start(); H.flush()
    T.eq(E.guide.id, FIRST)
end)

T.test("login: pack gone (addon disabled), back to Ding's guide", function()
    start(nil)
    Ding.char.guide, Ding.char.pack = "gone-01", "t-gone"
    E:Start(); H.flush()
    T.eq(E.guide.id, SHADOWGLEN)
    T.eq(Ding.char.pack, DING)
end)

---------------------------------------------------------------------------
-- Settings: the two dropdowns
---------------------------------------------------------------------------
local function entry(id)
    for _, e in ipairs(C.dropdown.entries) do
        if e.value == id then return e end
    end
end

local function choose(id)
    local target
    for n, e in ipairs(C.dropdown.entries) do
        if e.value == id then target = n end
    end
    T.ok(target, "missing from the list: " .. id)
    while C.dropdown.index ~= target do press("PADDDOWN") end
    press("PAD1")
end

T.test("Guide tab: the guide list first, Ding shown for a new character", function()
    start(nil)
    C:Open("guide", 1); H.flush()
    local row = C.focus
    T.eq(row.opts.label, L.ACTIVE_GUIDE)
    T.eq(row.box.text:GetText(), L.PACK_ZONES)
    T.eq(row.box.detail:GetText(), L.GUIDE_RANGE:format(1, 6), "levels of the character's sections")
    C:Close(); H.flush()
end)

T.test("the guide list: Ding \"built-in\", packs with their author, greyed out if unusable", function()
    start(SHADOWGLEN)
    C:Open("guide", 1); H.flush()
    press("PAD1")
    T.ok(C.dropdown, "list closed")
    local packs = 0
    for _, e in ipairs(C.dropdown.entries) do
        if not e.header then packs = packs + 1 end
    end
    T.eq(packs, #Ding:GuidePacks())
    local ding = entry(DING)
    T.ok(ding.current, "Ding is not marked as active")
    T.eq(ding.detail, L.PACK_BUILTIN .. " · " .. L.GUIDE_RANGE:format(1, 6))
    local example = entry("example")
    T.eq(example.text, "Example pack")
    T.eq(example.detail, L.PACK_BY:format("Ding! contributors") .. " · " .. L.GUIDE_RANGE:format(1, 5))
    T.ok(not example.dim, "example pack greyed out for a Night Elf")
    local zeta = entry("t-zeta")
    T.ok(zeta.dim, "Orc pack not greyed out")
    T.eq(zeta.detail, L.GUIDE_RANGE:format(10, 20) .. " · " .. L.GUIDE_OTHER_CHAR)
    T.ok(entry("t-alpha").detail:find(L.PACK_BY:format("Someone"), 1, true), "author missing")
    press("PAD2")
    C:Close(); H.flush()
end)

T.test("choosing a pack with the gamepad loads its section; the section list only shows its own", function()
    start(SHADOWGLEN)
    C:Open("guide", 1); H.flush()
    press("PAD1")
    choose("example")
    T.ok(not C.dropdown, "list still open")
    T.eq(E.guide.id, FIRST)
    T.eq(C.focus.box.text:GetText(), "Example pack", "new pack not shown")
    press("PADDDOWN")
    local sections = C.focus
    T.eq(sections.opts.label, L.GUIDE_SECTION)
    T.eq(sections.box.text:GetText(), "Aldrassil (1-4)")
    press("PAD1")
    T.eq(#C.dropdown.entries, 2, "sections of other packs listed")
    T.ok(entry(FIRST).current, "active section not marked")
    T.ok(entry(SECOND).dim, "level 3 section not greyed out at level 1")
    choose(SECOND)
    T.eq(E.guide.id, SECOND)
    T.eq(Ding.char.pack, "example")
    C:Close(); H.flush()
end)

T.test("with the mouse: click on the guide list, then on a pack", function()
    start(FIRST)
    C:Open("guide", 1); H.flush()
    local row = C.focus
    row.box.scripts.OnClick(row.box)
    local list = C.dropdown
    T.ok(list, "the click does not open the list")
    local n
    for i, e in ipairs(list.entries) do if e.value == DING then n = i end end
    local item = list.items[n - list.offset]
    item.scripts.OnEnter(item)
    item.scripts.OnClick(item)
    T.eq(E.guide.id, SHADOWGLEN)
    T.eq(row.box.text:GetText(), L.PACK_ZONES)
    C:Close(); H.flush()
end)

T.test("choosing the active pack again in the list reloads nothing", function()
    start(FIRST)
    T.quests({ [456] = "log", [458] = "log" })
    C:Open("guide", 1); H.flush()
    press("PAD1")
    press("PAD1")
    T.eq(E.guide.id, FIRST)
    T.eq(E.index, 2)
    C:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- Categories: the guide list grouped under headers that cannot be picked
---------------------------------------------------------------------------
T.test("pack category: leveling by default, a known one kept, an unknown one is leveling", function()
    T.eq(Ding:GetGuidePack(Ding.BUILTIN_PACK).category or "leveling", "leveling")
    T.eq(Ding:GetGuidePack("example").category, "leveling")
    T.eq(Ding:GetGuidePack("t-zeta").category, "leveling", "no category given")
    local debug = DingDB.debug
    DingDB.debug = true
    local printed = chat(function() Ding.RegisterGuidePack({ id = "t-odd", category = "pets" }) end)
    DingDB.debug = debug
    T.eq(Ding:GetGuidePack("t-odd").category, "leveling")
    T.ok(printed[1] and printed[1]:find("unknown category pets", 1, true), "no debug note")
    Ding.RegisterGuidePack({ id = "t-items", title = "Bag hunt", category = "items" })
    Ding.RegisterGuide({ pack = "t-items", id = "t-items-1", title = "Sleeping bag",
        steps = { { text = "Bag one" }, { text = "Bag two" }, { text = "Bag three" } } })
    T.eq(Ding:GetGuidePack("t-items").category, "items")
end)

-- The pack of the character's section (Ding's own; its zones pack where Ding has several).
local function home() return Ding:GetGuide(SHADOWGLEN).pack end

-- Index of the header of a category in the open list.
local function headerAt(list, text)
    for n, e in ipairs(list.entries) do
        if e.header and e.text == text then return n end
    end
end

T.test("the guide list: leveling first, then items; no header for an empty category", function()
    start(SHADOWGLEN)
    C:Open("guide", 1); H.flush()
    press("PAD1")
    local list = C.dropdown
    local headers, category = {}, nil
    for _, e in ipairs(list.entries) do
        if e.header then
            headers[#headers + 1] = e.text
            category = e.text == L.CATEGORY_LEVELING and "leveling" or e.text == L.CATEGORY_ITEMS and "items"
        else
            T.ok(category, "a pack above the first header: " .. e.value)
            T.eq(Ding:GetGuidePack(e.value).category or "leveling", category, "under the wrong header: " .. e.value)
        end
    end
    T.eq(table.concat(headers, ","), L.CATEGORY_LEVELING .. "," .. L.CATEGORY_ITEMS)
    T.ok(Ding:GetGuidePack(list.entries[2].value).builtin, "Ding's guide is not first under leveling")
    T.eq(list.entries[#list.entries].value, "t-items")
    T.eq(list.entries[list.index].value, home(), "the active pack is not highlighted")
    local header = list.items[1]
    T.ok(not header.mark:IsShown() and not header.focus.fill:IsShown(), "a header looks like an entry")
    T.eq(header.text:GetText(), L.CATEGORY_LEVELING)
    press("PAD2")
    C:Close(); H.flush()
end)

T.test("the d-pad skips the headers, up and down, by page too", function()
    start(SHADOWGLEN)
    C:Open("guide", 1); H.flush()
    press("PAD1")
    local list = C.dropdown
    local function at() return list.entries[list.index].value end
    local first = list.entries[2].value
    while list.index > 2 do press("PADDUP") end
    press("PADDUP")
    T.eq(at(), "t-items", "up from the first pack: the last one, past the header")
    press("PADDDOWN")
    T.eq(at(), first, "down from the last pack: the first one, past the header")
    local items = headerAt(list, L.CATEGORY_ITEMS)
    while list.index < items - 1 do press("PADDDOWN") end
    T.eq(list.index, items - 1, "a header taken on the way down")
    press("PADDDOWN")
    T.eq(list.index, items + 1, "the items header was not skipped")
    press("PADDUP")
    T.eq(list.index, items - 1, "the items header was not skipped going up")
    for _ = 1, 3 do
        press("PADDLEFT")
        T.ok(not list.entries[list.index].header, "a page up stopped on a header")
    end
    T.eq(at(), first, "a page up from the top")
    press("PADDRIGHT"); press("PADDRIGHT"); press("PADDRIGHT")
    T.eq(at(), "t-items", "a page down to the end")
    press("PAD2")
    C:Close(); H.flush()
end)

T.test("the mouse: a header is neither highlighted nor picked", function()
    start(SHADOWGLEN)
    C:Open("guide", 1); H.flush()
    local row = C.focus
    row.box.scripts.OnClick(row.box)
    local list = C.dropdown
    local n = headerAt(list, L.CATEGORY_ITEMS)
    list:Highlight(n + 1)
    list:Highlight(2)
    list.offset = math.max(0, n - 1 - (#list.items - 2))
    list:Render()
    local header = list.items[n - list.offset]
    T.ok(header and header:IsShown(), "the items header is not on screen")
    header.scripts.OnEnter(header)
    T.eq(list.index, 2, "the header got the highlight")
    header.scripts.OnClick(header)
    T.ok(C.dropdown == list and list:IsShown(), "a click on a header closed the list")
    T.eq(E.guide.id, SHADOWGLEN)
    local item = list.items[n + 1 - list.offset]
    item.scripts.OnEnter(item)
    item.scripts.OnClick(item)
    T.eq(E.guide.id, "t-items-1")
    T.eq(row.box.text:GetText(), "Bag hunt")
    C:Close(); H.flush()
end)

T.test("an item guide, then the leveling pack again: the section and the step the character was on", function()
    start(nil)
    H.player.level = 3
    E:SetGuide(SECOND, 1, true); H.flush()
    T.eq(E.index, 2, "the quests to take")
    T.eq(Ding:SuggestGuide("example").id, FIRST, "the test needs another suggested section")
    C:Open("guide", 1); H.flush()
    press("PAD1")
    choose("t-items")
    T.eq(E.guide.id, "t-items-1")
    E:Next(); H.flush()
    T.eq(E.index, 2)
    press("PAD1")
    choose("example")
    T.eq(E.guide.id, SECOND, "not the section the character was on")
    T.eq(E.index, 2, "not the step the character was on")
    press("PAD1")
    choose("t-items")
    T.eq(E.guide.id, "t-items-1")
    T.eq(E.index, 2, "the item guide starts over")
    C:Close(); H.flush()
end)

T.test("the remembered section is left for the suggestion once the character outlevels it", function()
    start(FIRST)
    E:SetPack("t-items"); H.flush()
    H.player.level = 6
    E:SetPack("example"); H.flush()
    T.eq(E.guide.id, SECOND, "an outleveled section taken up again")
end)

---------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------
T.test("/ding list: sections grouped by pack", function()
    start(nil)
    local printed = chat(function() SlashCmdList.DING("list") end)
    local text = table.concat(printed, "\n")
    local ding = text:find(L.PACK_ZONES .. "|r — " .. L.PACK_BUILTIN, 1, true)
    local example = text:find("Example pack|r — " .. L.PACK_BY:format("Ding! contributors"), 1, true)
    T.ok(ding and example and ding < example, text)
    T.ok(text:find(SHADOWGLEN, ding, true) < example, "Shadowglen outside Ding's pack")
    T.ok(text:find(FIRST, example, true), "example pack sections missing")
end)

T.test("/ding where: the player's position, ready to paste into a guide", function()
    start(nil)
    H.player.map, H.player.x, H.player.y = 1438, 54.62, 33.04
    local printed = chat(function() SlashCmdList.DING("where") end)
    T.ok(printed[1]:find("go = { 1438, 54.6, 33.0 },", 1, true), printed[1])
    local bestMap = C_Map.GetBestMapForUnit
    C_Map.GetBestMapForUnit = function() return nil end    -- in an instance, for example
    printed = chat(function() SlashCmdList.DING("where") end)
    C_Map.GetBestMapForUnit = bestMap
    T.ok(printed[1]:find(L.POSITION_UNKNOWN, 1, true), printed[1])
end)

T.test("Ding's two packs: Leveling, the default, first, then Zones", function()
    Ding.RegisterGuide({ id = "t-leveling-orc", title = "Orc", faction = "Horde", races = { "Orc" },
        minLevel = 1, maxLevel = 10, steps = { { accept = 4641 } } })
    T.eq(Ding:GetGuide("t-leveling-orc").pack, Ding.BUILTIN_PACK, "a guide without a pack is in Leveling")
    T.ok(packIds():find("^ding,ding%-zones,"), "Ding's packs first: " .. packIds())
    T.eq(Ding:GetGuidePack(Ding.BUILTIN_PACK).title, L.PACK_LEVELING)
    T.eq(Ding:GetGuidePack(Ding.ZONES_PACK).title, L.PACK_ZONES)
    T.ok(Ding:GetGuidePack(Ding.BUILTIN_PACK).builtin and Ding:GetGuidePack(Ding.ZONES_PACK).builtin, "both built in")
    -- No Leveling section for a Night Elf here: a new character starts in the Zones pack.
    start(nil)
    T.eq(Ding:SuggestGuide().id, SHADOWGLEN)
    T.eq(Ding:SuggestGuide(Ding.BUILTIN_PACK), nil)
end)

T.run()
