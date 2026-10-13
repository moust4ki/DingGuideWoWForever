-- Quest monsters (UI/QuestMobs.lua): a mark above the enemy nameplates of the monsters a
-- log quest needs (kill, drop) with the counter, the current step's in the accent color, a
-- finished objective without one; a line in the unit tooltip; the quest givers of the step
-- on friendly plates; a GUID the client keeps secret; the options; the nameplate distance.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, L, D, QM, Cfg, UI = Ding.Engine, Ding.L, Ding.Data, Ding.QuestMobs, Ding.Config, Ding.UI
local C = UI.C

-- Teldrassil: "The Balance of Nature" (kill young nightsabers and young thistle boars),
-- "Webwood Venom" (sacs dropped by Webwood Spiders).
local BALANCE, VENOM = 456, 916
local NIGHTSABER, BOAR, SPIDER = 2031, 1984, 1986

Ding.RegisterGuide({ id = "t-mobs", title = "Quest monsters", races = { "NightElf" }, steps = {
    { accept = { BALANCE, VENOM } },
    { complete = BALANCE },
    { complete = VENOM },
    { turnin = { BALANCE, VENOM } },
    { kill = { BOAR, 3 }, text = "Boars" },
} })

-- Both quests in the log, at the step that completes `index` (2: The Balance of Nature).
local function start(index, accepted)
    T.reset({ level = 5 })
    H.resetPlates()
    local ui = Ding.db.ui
    ui.mobIcons, ui.mobTooltip, ui.farPlates = true, true, false
    if accepted ~= false then
        H.accept(BALANCE)
        H.accept(VENOM)
    end
    E:SetGuide("t-mobs", index or 2, true)
    H.flush()
end

-- The quest log changed (a kill, a loot).
local function update()
    H.fire("QUEST_LOG_UPDATE")
    H.flush()
end

local function plate(unit, npc, opts)
    opts = opts or {}
    return H.addPlate(unit, { npc = npc, name = opts.name or D:NpcName(npc), guid = opts.guid,
        attackable = opts.attackable })
end

-- Ding's mark on a unit's plate, when shown.
local function mark(unit)
    local info = QM.plates[unit]
    local b = info and info.badge
    return b and b:IsShown() and b or nil
end

local function same(color, want)
    for i = 1, 3 do
        if math.abs(color[i] - want[i]) > 1e-6 then return false end
    end
    return true
end

-- The tooltip's lines without colors, the unit's name first.
local function tooltip(unit)
    local out = {}
    for i, line in ipairs(H.mouseover(unit)) do out[i] = H.plain(line) end
    return out
end

local function row(label)
    Cfg:Open("arrow")
    H.flush()
    for _, r in ipairs(Cfg.TABS[Cfg.TAB.arrow].rows) do
        if r.opts and r.opts.label == label then return r end
    end
    error("no settings row " .. tostring(label))
end

T.test("a monster to kill: a diamond and the counter, over the game's plate", function()
    start()
    H.setObjective(BALANCE, 1, 3, 7)
    update()
    local frame = plate("nameplate1", NIGHTSABER)
    local b = mark("nameplate1")
    T.ok(b, "no mark on a young nightsaber")
    T.eq(b.counter:GetText(), "3/7")
    T.ok(b.counter:IsShown() and b.glyph:IsShown() and not b.letter:IsShown(), "diamond and counter")
    T.eq(b.glyph.texture, UI.TEX .. "icon_diamond")
    -- Ding's own frame, parented to the plate; the game's plate itself is never touched.
    T.eq(b.parent, frame)
    T.eq(frame.points, nil, "the game's plate was moved")
    T.eq(frame.scripts, nil, "a script set on the game's plate")
    -- A kill: the counter follows.
    H.setObjective(BALANCE, 1, 4, 7)
    update()
    T.eq(mark("nameplate1").counter:GetText(), "4/7")
    -- A monster no quest needs: nothing.
    plate("nameplate2", 1988)
    T.ok(not mark("nameplate2"), "a mark on a monster no quest needs")
end)

T.test("a monster that drops a quest item: a dot and the item's counter", function()
    start()
    H.setObjective(VENOM, 1, 2, 10)
    update()
    plate("nameplate1", SPIDER)
    local b = mark("nameplate1")
    T.ok(b, "no mark on a Webwood Spider")
    T.eq(b.glyph.texture, UI.TEX .. "circle")
    T.eq(b.counter:GetText(), "2/10")
end)

T.test("the current step's monsters stand out, the log's other quests are quieter", function()
    start(2)
    plate("nameplate1", NIGHTSABER)
    plate("nameplate2", SPIDER)
    local current, other = mark("nameplate1"), mark("nameplate2")
    T.ok(same(current.border.color, C.accent), "the step's monster is not in the accent color")
    T.ok(same(current.glyph.vertexColor, C.accent))
    T.eq(current:GetAlpha(), 1)
    T.ok(same(other.border.color, C.border), "another quest's monster in the accent color")
    T.ok(same(other.glyph.vertexColor, C.secondary))
    T.ok(other:GetAlpha() < 1)
    -- The next step works on the venom: the spiders come first now.
    E:SetGuide("t-mobs", 3, true)
    H.flush()
    T.ok(same(mark("nameplate2").border.color, C.accent), "the spider is not the step's monster")
    T.ok(same(mark("nameplate1").border.color, C.border))
end)

T.test("a finished objective loses its mark, the others keep theirs", function()
    start()
    H.setObjective(BALANCE, 1, 6, 7)
    H.setObjective(BALANCE, 2, 1, 4)
    update()
    plate("nameplate1", NIGHTSABER)
    plate("nameplate2", BOAR)
    T.ok(mark("nameplate1") and mark("nameplate2"), "marks missing")
    H.setObjective(BALANCE, 1, 7, 7)
    update()
    T.ok(not mark("nameplate1"), "the nightsabers are done but keep their mark")
    T.eq(mark("nameplate2").counter:GetText(), "1/4")
    -- The whole quest done: no mark at all.
    H.complete(BALANCE)
    H.flush()
    T.ok(not mark("nameplate2"), "a mark for a quest ready to turn in")
end)

T.test("the tooltip line: the mark in words, the quest in the client's language, its counter", function()
    start()
    T.eq(QM.tooltipHook, "processor", "the tooltip processor is not hooked")
    H.setObjective(BALANCE, 1, 3, 7)
    update()
    plate("nameplate1", NIGHTSABER)
    local lines = tooltip("nameplate1")
    T.eq(lines[1], D:NpcName(NIGHTSABER), "the game's own line changed")
    -- The color of the step's mark says "current step": the line says it in words too.
    T.eq(lines[2], "Ding! · À tuer pour « L'Equilibre de la nature » 3/7 · étape en cours")
    T.eq(#lines, 2)
    -- The step's quest in the text color, another quest's in the secondary one.
    T.ok(same(GameTooltip.lineColors[2], C.text), "the step's quest is not in the text color")
    plate("nameplate2", SPIDER)
    T.eq(tooltip("nameplate2")[2], "Ding! · Butin pour « Le venin des Tissebois » 0/1")
    T.ok(same(GameTooltip.lineColors[2], C.secondary), "another quest in the text color")
    plate("nameplate3", 1988)
    T.eq(#tooltip("nameplate3"), 1, "a line on a monster no quest needs")
end)

T.test("options off: no mark, no tooltip line; on again, back", function()
    start()
    H.setObjective(BALANCE, 1, 3, 7)
    update()
    plate("nameplate1", NIGHTSABER)
    local icons = row(L.MOB_ICONS)
    T.ok(icons.opts.desc, "no description")
    icons:Activate()
    H.flush()
    T.eq(Ding.db.ui.mobIcons, false)
    T.ok(not mark("nameplate1"), "a mark with the option off")
    T.eq(#tooltip("nameplate1"), 2, "the tooltip line follows the icons' option")
    local line = row(L.MOB_TOOLTIP)
    line:Activate()
    H.flush()
    T.eq(Ding.db.ui.mobTooltip, false)
    T.eq(#tooltip("nameplate1"), 1, "a tooltip line with the option off")
    -- A plate that appears while the marks are off gets one once they are on again.
    plate("nameplate2", BOAR)
    T.ok(not mark("nameplate2"))
    row(L.MOB_ICONS):Activate()
    row(L.MOB_TOOLTIP):Activate()
    H.flush()
    T.ok(mark("nameplate1") and mark("nameplate2"), "no mark once on again")
    T.eq(#tooltip("nameplate1"), 2)
    Cfg:Close()
    H.flush()
end)

T.test("a secret GUID: the plate keeps its monster, else its name is matched", function()
    start()
    H.setObjective(BALANCE, 1, 2, 7)
    update()
    -- Known when the plate appeared, kept secret afterwards (in combat).
    plate("nameplate1", NIGHTSABER)
    H.setPlate("nameplate1", "guid", H.SECRET)
    H.setCombat(true)
    H.setObjective(BALANCE, 1, 3, 7)
    update()
    T.eq(mark("nameplate1").counter:GetText(), "3/7", "the plate lost its monster")
    -- Secret from the start: the name says which monster.
    plate("nameplate2", BOAR, { guid = H.SECRET })
    T.ok(mark("nameplate2"), "no mark from the name")
    T.eq(#tooltip("nameplate2"), 2, "no tooltip line from the name")
    -- Neither the GUID nor the name: nothing, and no error.
    H.addPlate("nameplate3", { guid = H.SECRET, name = H.SECRET })
    T.ok(not mark("nameplate3"))
    T.eq(#tooltip("nameplate3"), 0)
    H.setCombat(false)
    -- A player of the same name as a monster: never a mark.
    H.addPlate("nameplate4", { guid = "Player-4170-00000002", name = D:NpcName(NIGHTSABER) })
    T.ok(not mark("nameplate4"), "a mark on a player")
end)

T.test("friendly plates: the step's quest giver and turn-in NPC", function()
    start(1, false)
    local giver = D:StarterNpcs(BALANCE)[1]
    T.ok(giver, "no quest giver in the data")
    plate("nameplate1", giver, { attackable = false })
    local b = mark("nameplate1")
    T.ok(b, "no mark on the quest giver")
    T.ok(b.letter:IsShown() and not b.glyph:IsShown() and not b.counter:IsShown())
    T.eq(b.letter:GetText(), "!")
    -- The same NPC as a monster to kill (never on a friendly plate) and the reverse.
    plate("nameplate2", giver, { attackable = true })
    T.ok(not mark("nameplate2"), "a quest giver's mark on an enemy plate")
    -- Turn-in: "?" once ready, on the step that turns it in.
    H.accept(BALANCE)
    H.complete(BALANCE)
    E:SetGuide("t-mobs", 4, true)
    H.flush()
    local finisher = D:FinisherNpcs(BALANCE)[1]
    H.resetPlates()
    plate("nameplate1", finisher, { attackable = false })
    T.eq(mark("nameplate1").letter:GetText(), "?")
end)

T.test("a step's own kills (goal without a quest): the counter of the goal", function()
    start(5)
    plate("nameplate1", BOAR)
    local b = mark("nameplate1")
    T.ok(b, "no mark on the goal's monster")
    T.eq(b.counter:GetText(), "0/3")
    T.ok(same(b.border.color, C.accent))
    H.killXP(D:NpcName(BOAR))
    T.eq(mark("nameplate1").counter:GetText(), "1/3")
end)

T.test("the game reuses its plates: the mark follows the unit, not the frame", function()
    start()
    local frame = plate("nameplate1", NIGHTSABER)
    local b = mark("nameplate1")
    T.ok(b)
    H.removePlate("nameplate1")
    T.ok(not b:IsShown(), "a mark left on a plate that went away")
    T.eq(QM.plates.nameplate1, nil)
    local again = plate("nameplate2", 1988)
    T.eq(again, frame, "the mock did not reuse the plate")
    T.ok(not b:IsShown(), "the old mark on another monster")
    H.removePlate("nameplate2")
    plate("nameplate3", BOAR)
    T.ok(mark("nameplate3"))
    T.eq(mark("nameplate3"), b, "one mark per plate of the game, reused")
end)

T.test("enemy nameplates farther: the client's maximum, then the value before", function()
    start()
    H.setCVarRaw(QM.DISTANCE_CVAR, "20")
    Ding.db.farPlatesFrom = nil
    T.eq(Ding.db.ui.farPlates, false, "on by default")
    local printed = {}
    local print0 = Ding.Print
    Ding.Print = function(_, msg) printed[#printed + 1] = msg end
    row(L.FAR_PLATES):Activate()
    H.flush()
    T.eq(H.cvar(QM.DISTANCE_CVAR), "41", "the client's maximum")
    T.eq(Ding.db.farPlatesFrom, "20")
    T.eq(printed[#printed], L.FAR_PLATES_SET:format(41))
    row(L.FAR_PLATES):Activate()
    H.flush()
    T.eq(H.cvar(QM.DISTANCE_CVAR), "20", "not put back")
    T.eq(Ding.db.farPlatesFrom, nil)
    T.eq(printed[#printed], L.FAR_PLATES_SET:format(20))
    -- In combat: once the fight is over (the mock reports a SetCVar in combat).
    H.setCombat(true)
    row(L.FAR_PLATES):Activate()
    H.flush()
    T.eq(H.cvar(QM.DISTANCE_CVAR), "20", "changed in combat")
    H.setCombat(false)
    H.fire("PLAYER_REGEN_ENABLED")
    H.flush()
    T.eq(H.cvar(QM.DISTANCE_CVAR), "41")
    -- At login with the option on: still at the maximum (a fresh client config).
    H.setCVarRaw(QM.DISTANCE_CVAR, "20")
    QM:ApplyDistance()
    T.eq(H.cvar(QM.DISTANCE_CVAR), "41")
    T.eq(Ding.db.farPlatesFrom, "20", "the value before was lost")
    -- The tab's defaults: off, and the value before.
    Cfg:TabDefaults("arrow")
    H.flush()
    T.eq(Ding.db.ui.farPlates, false)
    T.eq(H.cvar(QM.DISTANCE_CVAR), "20")
    -- A client without the setting: said once, nothing set.
    H.setCVarRaw(QM.DISTANCE_CVAR, nil)
    Ding.db.ui.farPlates = true
    QM:ApplyDistance(true)
    T.eq(printed[#printed], L.FAR_PLATES_NONE)
    T.eq(Ding.db.farPlatesFrom, nil)
    Ding.db.ui.farPlates = false
    H.setCVarRaw(QM.DISTANCE_CVAR, "20")
    Ding.Print = print0
    Cfg:Close()
    H.flush()
end)

T.run()
