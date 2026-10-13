-- Scenarios of the guide window (tools/panel_snapshot.lua, tools/tests/panel_rules*.lua): the
-- game and the guide in a given state, most of them from the Leveling guides and from Yendi's
-- reports in game (13/10/2026: a Dwarf hunter around Darkshire, Goldshire, Stormwind, Westfall,
-- then the Wetlands). Each scenario:
--   name, about        file name of its snapshot; what it shows (English)
--   guide              guide id; step = what finds the step (a step key and a quest id: the
--                      first step for the character with it, `nth` for a later one; or a function)
--   char               { race, class, level, spells = { known spell ids } }
--   place              where the player stands: { starts = q } (its quest giver), { ends = q },
--                      { npc = id }, { object = id }, { objective = q } (its first target), or
--                      { map, x, y }; zone = the minimap's zone text by locale
--   done, log          quests turned in; quests in the log: true (counts 0), "ready", or the
--                      counts of its objectives { { have, need }, ... }
--   stale              quests whose objectives the client reports as Forever can: counts at 0,
--                      "finished" secret (turned in, or seen again with "Previous")
--   prev               "Previous" pressed that many times once on the step (browsing back)
--   width, scale, preview, compact, focus (gamepad focus mode: X cards and the hint bar), pad
--   (a gamepad plugged in), why (false: the guide's explanations off), setup(ctx) (anything else)
local S = {}

local A11 = "leveling-a11-duskwood-and-redridge-mountains"
local A12 = "leveling-a12-wetlands"
S.GUIDES = { A11, A12, "leveling-a13-stonetalon-mountains-and-ashenvale" }

local DWARF_HUNTER = { race = "Dwarf", class = "HUNTER", spells = { 266, 196 } }   -- Guns, Axes
local function hunter(level)
    return { race = DWARF_HUNTER.race, class = DWARF_HUNTER.class, spells = DWARF_HUNTER.spells, level = level }
end

local list = {
    {
        name = "a11-darkshire-accepts",
        about = "Darkshire, Duskwood's first quests: two accepts, one above the player's level, a note, the next steps",
        guide = A11, step = { accept = 66 }, char = hunter(25),
        place = { starts = 66 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        preview = 3,
    },
    {
        name = "a11-darkshire-objectives",
        about = "Duskwood around Darkshire: a step's objectives under their quest, a quest the guide carries along",
        guide = A11, step = { complete = 101 }, char = hunter(26),
        place = { map = 1431, x = 77.5, y = 44.3 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        done = { 66, 174, 175 }, log = { [101] = { { 3, 7 }, { 0, 7 }, { 7, 7 } }, [56] = { { 5, 12 }, { 0, 6 } },
            [67] = true, [177] = true, [96139] = true },
    },
    {
        name = "a11-goldshire-chest",
        about = "Goldshire, the chest upstairs at the inn: a step with a note, 240 wide",
        guide = A11, step = { complete = 70 }, char = hunter(27), width = 240,
        place = { object = 1560 }, zone = { frFR = "Comté-de-l'Or", enUS = "Goldshire" },
        done = { 66, 67, 68, 69 }, log = { [70] = true },
    },
    {
        name = "a11-folsom",
        about = "Stormwind, Caretaker Folsom: turn in one quest, take the next; the weapon to learn is near",
        guide = A11, step = { turnin = 70 }, char = hunter(27),
        place = { ends = 70 }, zone = { frFR = "Hurlevent", enUS = "Stormwind City" },
        done = { 66, 67, 68, 69 }, log = { [70] = "ready" },
    },
    {
        name = "a11-crate",
        about = "Stormwind, the sealed crate: a turn-in at an object, its fight note, a quest carried for long",
        guide = A11, step = { turnin = 72 }, char = hunter(27),
        place = { ends = 72 }, zone = { frFR = "Hurlevent", enUS = "Stormwind City" },
        done = { 66, 67, 68, 69, 70 }, log = { [72] = "ready" },
    },
    {
        name = "a11-bank",
        about = "Stormwind, Olivia Burnside: a bank step (keep an item for later), its note",
        guide = A11, step = { bank = 916 }, char = hunter(28),
        place = { npc = 2455 }, zone = { frFR = "Hurlevent", enUS = "Stormwind City" },
        done = { 66, 67, 68, 69, 70, 72 }, log = { [74] = true }, items = { 916 },
    },
    {
        name = "a11-westfall-detour",
        about = "Westfall, Moonbrook: a detour, its why line under the step and the whole reason on demand",
        guide = A11, step = { turnin = 67 }, char = hunter(26),
        place = { ends = 67 }, zone = { frFR = "Ruisselune", enUS = "Moonbrook" },
        done = { 66 }, log = { [67] = "ready" },
    },
    {
        name = "a11-two-quests",
        about = "Redridge: one step, two quests' objectives under their own headers",
        guide = A11, step = { complete = 150 }, char = hunter(27),
        place = { objective = 150 }, zone = { frFR = "Lac Everstill", enUS = "Lake Everstill" },
        log = { [150] = { { 4, 8 } }, [127] = { { 10, 10 } } }, items = { 1467, 1468 },
    },
    {
        name = "a11-finished-seen-again",
        about = "Previous over a finished quest: its objectives green, full counters, though the client says 0",
        guide = A11, step = { turnin = 165 }, char = hunter(26), prev = 1,
        place = { map = 1431, x = 75.8, y = 47.0 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        done = { 66, 226 }, log = { [165] = true, [101] = true, [56] = true },
        stale = { 226 },
    },
    {
        name = "a11-marked-done",
        about = "A step marked done by hand, seen again with Previous: violet, said in words, its undo",
        guide = A11, step = { accept = 56 }, char = hunter(25),
        place = { starts = 56 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        log = { [66] = true, [101] = true },
        setup = function(ctx) ctx.E:Next(); ctx.H.flush(); ctx.E:Prev(); ctx.H.flush() end,
    },
    {
        name = "a11-skipped",
        about = "A step skipped for later, seen again with Previous: amber, said in words, its undo",
        guide = A11, step = { accept = 56 }, char = hunter(25),
        place = { starts = 56 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        log = { [66] = true, [101] = true },
        setup = function(ctx) ctx.E:Skip(); ctx.H.flush(); ctx.E:Prev(); ctx.H.flush() end,
    },
    {
        name = "a11-directory-trip",
        about = "A trip of the NPC directory to the class trainer: its notice, the way there, Cancel the trip",
        guide = A11, step = { accept = 56 }, char = hunter(25),
        place = { starts = 56 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        log = { [66] = true, [101] = true },
        setup = function(ctx) ctx.Ding.Finder:Go("trainer") end,
    },
    {
        name = "a11-log-almost-full",
        about = "The quest log almost full, with quests the guide never uses: a notice that opens the list",
        guide = A11, step = { accept = 56 }, char = hunter(25),
        place = { starts = 56 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        log = { [66] = true, [101] = true },
        setup = function(ctx)
            for _, q in ipairs({ 7, 15, 18, 21, 33, 35, 40, 46, 47, 52, 60, 61, 62, 76 }) do ctx.H.setQuest(q, "log") end
        end,
    },
    {
        name = "a11-bags-almost-full",
        about = "Bags almost full, a step passed for its gray quest: notices of their own, not under the step",
        guide = A11, step = { accept = 56 }, char = hunter(25),
        place = { starts = 56 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        log = { [66] = true, [101] = true },
        setup = function(ctx)
            -- The guide just passed a step without the player: a gray quest.
            ctx.E.skipNotes = { { quest = 163, reason = "grey" } }
            for slot = 1, 12 do ctx.H.putInBag(0, slot, 2589, 1) end
            ctx.H.fire("BAG_UPDATE", 0)
            ctx.H.tick(1)
        end,
    },
    {
        name = "a11-extras",
        about = "Rows added under the step: training waiting, a weapon to learn (Ironforge), a gear upgrade",
        guide = A11, step = { accept = 56 }, char = hunter(26),
        place = { map = 1455, x = 61, y = 88 }, zone = { frFR = "Forgefer", enUS = "Ironforge" },
        log = { [66] = true, [101] = true },
        items = { 2208 },
        setup = function(ctx)
            ctx.Ding.char.training = { now = 0, future = { [26] = 2600 }, level = 24 }
            ctx.Ding.Gear.upgrade = { id = 2208, link = "[" .. tostring(ctx.Ding.Data:ItemName(2208)) .. "]", gain = 12 }
        end,
    },
    {
        name = "a11-level-step",
        about = "A level step in the tomb: the level's counter, experience and kills left, the monster to farm",
        guide = A11, step = { level = 26 }, char = hunter(25),
        place = { map = 1431, x = 23.6, y = 34.9 }, zone = { frFR = "Le cimetière de Raven Hill", enUS = "Raven Hill Cemetery" },
        done = { 66, 226 }, log = { [101] = { { 7, 7 }, { 7, 7 }, { 7, 7 } } },
        setup = function(ctx) ctx.H.player.xp = 20000 end,
    },
    {
        name = "a11-go-darkshire",
        about = "The section's first step, a trip to Darkshire from Stormwind: the way there in a notice",
        guide = A11, step = function(step) return step.go ~= nil end, char = hunter(25),
        place = { map = 1453, x = 66, y = 62 }, zone = { frFR = "Hurlevent", enUS = "Stormwind City" },
    },
    {
        name = "a11-minimized",
        about = "The minimized window, 240 wide: one line, the hover card shows the row whole",
        guide = A11, step = { complete = 70 }, char = hunter(27), width = 240, compact = true,
        place = { object = 1560 }, zone = { frFR = "Comté-de-l'Or", enUS = "Goldshire" },
        done = { 66, 67, 68, 69 }, log = { [70] = true },
    },
    {
        name = "a11-focus-gamepad",
        about = "Focus mode with a gamepad: the X card and the hint bar of each row",
        guide = A11, step = { complete = 101 }, char = hunter(26), focus = true,
        place = { map = 1431, x = 77.5, y = 44.3 }, zone = { frFR = "Sombre-Comté", enUS = "Darkshire" },
        done = { 66, 174, 175 }, log = { [101] = { { 3, 7 }, { 0, 7 }, { 7, 7 } }, [56] = { { 5, 12 }, { 0, 6 } } },
    },
    {
        name = "a12-cursed-crew-ahead",
        about = "Menethil: « The Cursed Crew » in the log at 0/13, its step further on, its sailors close by",
        guide = A12, step = { accept = 472 }, char = hunter(28),
        place = { objective = 289 }, zone = { frFR = "Port de Menethil", enUS = "Menethil Harbor" },
        done = { 288 }, log = { [289] = { { 0, 13 }, { 0, 5 }, { 0, 1 } }, [281] = true, [471] = true },
    },
    {
        name = "a12-cursed-crew-carried",
        about = "Wetlands, past the step that carries « The Cursed Crew » along: said as another quest",
        guide = A12, step = { complete = 471 }, char = hunter(28),
        place = { map = 1437, x = 18, y = 40 }, zone = { frFR = "Les Paluns", enUS = "Wetlands" },
        done = { 288, 281, 284, 285 }, log = { [289] = { { 4, 13 }, { 0, 5 }, { 0, 1 } }, [471] = { { 2, 8 } },
            [286] = true },
    },
    {
        name = "a12-along-behind",
        about = "Wetlands: a quest whose step is behind, not finished, its crocolisks right here: along the way",
        guide = A12, step = { complete = 277 }, char = hunter(28),
        place = { objective = 471 }, zone = { frFR = "Les Paluns", enUS = "Wetlands" },
        done = { 288, 281, 284, 285 }, log = { [471] = { { 2, 8 } }, [277] = { { 1, 8 } } },
    },
    {
        name = "a12-cursed-crew-next",
        about = "Wetlands, the step that makes « The Cursed Crew » persistent: its own step comes next, not listed",
        guide = A12, step = { turnin = 285 }, char = hunter(28),
        place = { map = 1437, x = 18, y = 40 }, zone = { frFR = "Les Paluns", enUS = "Wetlands" },
        done = { 288, 281, 284 }, log = { [289] = { { 0, 13 }, { 0, 5 }, { 0, 1 } }, [285] = "ready", [471] = true },
    },
    {
        name = "a12-fragments",
        about = "In game, Wetlands step 30: three fragments found, another quest's banners close by, a weapon "
            .. "to learn, an upgrade, the log almost full, the next steps",
        guide = A12, step = { complete = 299, nth = 4 }, char = hunter(28), preview = 2,
        place = { objective = 464 }, zone = { frFR = "Les Paluns", enUS = "Wetlands" },
        done = { 288, 281, 284, 285, 286, 295 },
        log = { [299] = { { 1, 1 }, { 1, 1 }, { 1, 1 }, { 0, 1 } }, [464] = { { 0, 8 } }, [296] = true, [289] = true,
            [471] = true, [277] = true },
        setup = function(ctx) S.WetlandsExtras(ctx) end,
    },
    {
        name = "a12-ormer-turnin",
        about = "In game, Wetlands step 32: the step's own turn-in stands out from what comes besides it",
        guide = A12, step = { turnin = 296 }, char = hunter(28),
        place = { ends = 296 }, zone = { frFR = "Les Paluns", enUS = "Wetlands" },
        done = { 288, 281, 284, 285, 286, 295 },
        log = { [296] = "ready", [464] = { { 3, 8 } }, [299] = "ready" },
        setup = function(ctx) S.WetlandsExtras(ctx) end,
    },
}
for _, sc in ipairs(list) do S[#S + 1] = sc end

-- What came besides the step in Yendi's Wetlands screenshots: a polearm in the bags (a weapon to
-- learn), a gear upgrade, and a quest log almost full of quests the guide never uses.
function S.WetlandsExtras(ctx)
    local H = ctx.H
    H.setItemInfo(950200, { name = "Hallebarde", classID = 2, subclassID = 6, equipLoc = "INVTYPE_2HWEAPON" })
    H.putInBag(0, 1, 950200, 1)
    ctx.Ding.Directory:Forget()
    ctx.Ding.Gear.upgrade = { id = 15231, link = "[Hachette trancheuse du loup]", gain = 4 }
    for _, q in ipairs({ 7, 15, 18, 21, 33, 35, 40, 46, 47, 52 }) do H.setQuest(q, "log") end
end

---------------------------------------------------------------------------
-- Setting a scenario up
---------------------------------------------------------------------------
local function contains(v, x)
    if type(v) == "table" then
        for _, y in ipairs(v) do
            if y == x then return true end
        end
        return false
    end
    return v == x
end

-- Index of the step `want` names among the steps for the character.
function S.FindStep(Ding, guide, want)
    local nth = type(want) == "table" and want.nth or 1
    for i, step in ipairs(guide.steps) do
        local ok = Ding:StepApplies(step)
        if ok and type(want) == "function" then
            ok = want(step, i)
        elseif ok then
            for key, v in pairs(want) do
                if key ~= "nth" and not contains(step[key], v) then ok = false end
            end
        end
        if ok then
            nth = nth - 1
            if nth == 0 then return i end
        end
    end
end

local function placePlayer(ctx, place)
    local D, H, p = ctx.Ding.Data, ctx.H, nil
    if place.starts then p = D:StartPoints(place.starts)[1] end
    if place.ends then p = D:EndPoints(place.ends)[1] end
    if place.npc then p = D:NpcPoints(place.npc)[1] end
    if place.object then p = D:ObjectPoints(place.object)[1] end
    if place.objective then
        local target = D:ObjectiveTargets(place.objective)[1]
        p = target and target.points[1]
    end
    p = p or place
    H.player.map, H.player.x, H.player.y = p.map, p.x, p.y
end

-- The client's objectives of `stale` quests as Forever can report them: counts at 0 and the
-- "finished" flag secret, also once the quest is turned in.
local savedObjectives
local function staleObjectives(ctx, quests, before)
    local api = _G.C_QuestLog.GetQuestObjectives
    savedObjectives = savedObjectives or api
    local stale = {}
    for _, q in ipairs(quests) do stale[q] = true end
    _G.C_QuestLog.GetQuestObjectives = function(q)
        local objectives = api(q)
        if not stale[q] then return objectives end
        if #objectives == 0 and before[q] then objectives = before[q] end
        local out = {}
        for i, obj in ipairs(objectives) do
            out[i] = { text = obj.text, type = obj.type, finished = ctx.H.SECRET, numFulfilled = 0,
                numRequired = obj.numRequired }
        end
        return out
    end
end

local zoneText
function S.Setup(sc, ctx)
    local T, H, Ding, E, P = ctx.T, ctx.H, ctx.Ding, ctx.E, ctx.P
    S.Teardown(sc, ctx)
    ctx.pad((sc.pad or sc.focus) and true or false)
    local c = sc.char or {}
    T.reset({ level = c.level or 25, race = c.race, class = c.class, faction = c.faction })
    -- What T.reset leaves of the last scenario: steps skipped, persistent quests, a resume.
    Ding.char.skipped, Ding.char.sticky, Ding.char.resumeTo, Ding.char.early = nil, nil, nil, nil
    E.skipNotes = nil
    -- Items named as the client names them (the mock's client says "item <id>").
    for _, id in ipairs(sc.items or {}) do H.setItemInfo(id, { name = Ding.Data:ItemName(id) }) end
    local db = Ding.db.panel
    db.shown, db.preview, db.keyHints = true, sc.preview or 0, true
    db.why = sc.why ~= false
    db.weaponReminder = true
    P:SetWidth(sc.width or 300)
    P:SetScale(sc.scale or 1)
    for _, id in ipairs(c.spells or {}) do H.learnSpell(id) end
    -- Quests: turned in, then the log (the objectives' counts), the ones the client reports badly.
    for _, q in ipairs(sc.done or {}) do H.setQuest(q, "turnedin") end
    local inLog = {}
    for q in pairs(sc.log or {}) do inLog[#inLog + 1] = q end
    table.sort(inLog)
    local before = {}
    for _, q in ipairs(inLog) do
        local state = sc.log[q]
        H.accept(q)
        if type(state) == "table" then
            for i, count in ipairs(state) do
                if H.log()[q] and H.log()[q].objectives[i] then H.setObjective(q, i, count[1], count[2]) end
            end
        elseif state == "ready" then
            H.log()[q].done = true
        end
        before[q] = _G.C_QuestLog.GetQuestObjectives(q)
    end
    for _, q in ipairs(sc.stale or {}) do
        if not before[q] then
            H.accept(q)
            before[q] = _G.C_QuestLog.GetQuestObjectives(q)
            H.setQuest(q, "turnedin")
        end
    end
    if sc.stale then staleObjectives(ctx, sc.stale, before) end
    H.player.level = c.level or 25
    H.player.xp = 0
    placePlayer(ctx, sc.place or {})
    local locale = Ding.locale or GetLocale()
    zoneText = sc.zone and (sc.zone[locale] or sc.zone.enUS) or nil
    _G.GetMinimapZoneText = zoneText and function() return zoneText end or nil
    -- The guide on the scenario's step, past the resume window of a guide just taken.
    local guide = assert(Ding:GetGuide(sc.guide), "guide not loaded: " .. tostring(sc.guide))
    local index = assert(S.FindStep(Ding, guide, sc.step), sc.name .. ": no such step")
    E:SetGuide(sc.guide, index, true)
    H.flush()
    H.tick(11)
    local warning
    if E.index ~= index then
        warning = ("the engine moved from step %d to step %d"):format(index, E.index)
    end
    for _ = 1, sc.prev or 0 do
        E:Prev()
        H.flush()
    end
    local out = { index = index, warning = warning }
    if sc.setup then sc.setup(setmetatable({ index = index, guide = guide }, { __index = ctx })) end
    H.flush()
    E:Refresh()
    H.flush()
    if sc.compact then P:SetCompact(true) end
    if sc.focus then
        P:StartFocus()
        H.flush()
    end
    P:Update()
    return out
end

-- Back to a plain state: no focus mode, window expanded, the client's own objectives, no zone.
function S.Teardown(_, ctx)
    local P = ctx.P
    if P.focusing then P:StopFocus() end
    P:SetCompact(false)
    P:CloseStepMenu()
    GameTooltip:Hide()
    if savedObjectives then
        _G.C_QuestLog.GetQuestObjectives = savedObjectives
        savedObjectives = nil
    end
    _G.GetMinimapZoneText = nil
    if ctx.Ding.Finder.trip then ctx.Ding.Finder:Cancel(true) end
end

return S
