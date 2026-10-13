-- Quest monsters' tooltip line on a client without the tooltip processor: the unit
-- tooltip's OnTooltipSetUnit script, hooked (never replaced). The processor's own case is in
-- quest_mobs_test.lua.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { tooltipScript = true })
local Ding, H = T.Ding, T.H
local E, D, QM = Ding.Engine, Ding.Data, Ding.QuestMobs

local BALANCE, NIGHTSABER = 456, 2031

Ding.RegisterGuide({ id = "t-mobs-tip", title = "Quest monsters", races = { "NightElf" }, steps = {
    { accept = BALANCE },
    { complete = BALANCE },
} })

T.test("the OnTooltipSetUnit script, hooked: the same line", function()
    T.eq(_G.TooltipDataProcessor, nil, "the mock has the processor")
    T.eq(QM.tooltipHook, "script")
    T.reset({ level = 5 })
    H.accept(BALANCE)
    E:SetGuide("t-mobs-tip", 2, true)
    H.setObjective(BALANCE, 1, 5, 7)
    H.fire("QUEST_LOG_UPDATE")
    H.flush()
    H.addPlate("nameplate1", { npc = NIGHTSABER, name = D:NpcName(NIGHTSABER) })
    local lines = H.mouseover("nameplate1")
    T.eq(#lines, 2)
    T.eq(H.plain(lines[2]), "Ding! · À tuer pour « L'Equilibre de la nature » 5/7 · étape en cours")
    -- Off: the hook stays, adds nothing.
    Ding.db.ui.mobTooltip = false
    T.eq(#H.mouseover("nameplate1"), 1)
    Ding.db.ui.mobTooltip = true
end)

T.run()
