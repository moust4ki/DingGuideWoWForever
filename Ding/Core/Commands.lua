-- Slash commands: /ding
local _, Ding = ...
local L = Ding.L

SLASH_DING1 = "/ding"
SlashCmdList.DING = function(input)
    local cmd, rest = (input or ""):match("^%s*(%S*)%s*(.-)%s*$")
    cmd = (cmd or ""):lower()
    local E = Ding.Engine

    if cmd == "" then
        Ding.Panel:Toggle()
    elseif cmd == "config" or cmd == "options" then
        Ding.Config:Open()
    elseif cmd == "next" then
        E:Next()
    elseif cmd == "prev" then
        E:Prev()
    elseif cmd == "skip" then
        E:Skip()
    elseif cmd == "back" then
        Ding.Panel:BackToSkipped()
    elseif cmd == "reset" then
        E:Reset()
    elseif cmd == "list" then
        Ding:Print(L.GUIDES_AVAILABLE)
        for _, pack in ipairs(Ding:GuidePacks()) do
            local by = pack.builtin and L.PACK_BUILTIN or pack.imported and L.PACK_IMPORTED
                or (pack.author and L.PACK_BY:format(pack.author))
            Ding:Print(("|cffffd100%s|r%s"):format(pack.title, by and (" — " .. by) or ""))
            for id, g in Ding:IterateGuides(pack.id) do
                local mark = Ding:GuideMatchesPlayer(g) and "|cff33ff99•|r" or "|cff666666•|r"
                Ding:Print(("%s %s — %s (%d-%d)"):format(mark, id, g.title, g.minLevel, g.maxLevel))
            end
        end
    elseif cmd == "guide" and rest ~= "" then
        E:Resume(rest)
    elseif cmd == "import" then
        Ding.ImportWindow:Open("import")
    elseif cmd == "export" then
        -- A pack or a guide by its id (/ding list), else the active guide.
        Ding.ImportWindow:Open("export", rest ~= "" and rest or nil)
    elseif cmd == "where" then
        -- For guide authors: the player's position, written as a `go` step.
        local map, x, y = Ding.Compat.GetPlayerMapPosition()
        if map then
            Ding:Print(("go = { %d, %.1f, %.1f }, -- %s"):format(map, x, y, Ding.Compat.ZoneText() or ""))
        else
            Ding:Print(L.POSITION_UNKNOWN)
        end
    elseif cmd == "scale" and rest ~= "" then
        local scale = Ding.Panel:SetScale(rest)
        if scale then Ding:Print(L.SCALE_SET:format(scale)) else Ding:Print(L.HELP) end
    elseif cmd == "arrow" then
        Ding.Arrow:Toggle()
    elseif cmd == "minimap" then
        Ding.db.minimap.shown = not Ding.db.minimap.shown
        Ding.Minimap:Update()
    elseif cmd == "arrowflip" then
        Ding:Print(L.ARROW_MODE_SET:format(Ding.Arrow:CycleMode() + 1))
    elseif cmd == "debug" then
        Ding.db.debug = not Ding.db.debug
        Ding:Print(Ding.db.debug and L.DEBUG_ON or L.DEBUG_OFF)
    else
        Ding:Print(L.HELP)
    end
end
