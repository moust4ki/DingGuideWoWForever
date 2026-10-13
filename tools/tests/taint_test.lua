-- Taint: Ding never drives the game's own frames (quest log, map, options, panels).
-- Called from an addon, they run tainted; on Forever their secret values then fail by the
-- dozen and the game offers to disable Ding (in game, 11/10/2026: the quest log opened
-- from a click on a row). Ding shows what it needs in its own frames and tooltips.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])

local FORBIDDEN = {
    "ShowUIPanel", "HideUIPanel", "ToggleQuestLog", "QuestLog_OpenToQuest", "QuestMapFrame",
    "QuestLogFrame", "KeyBindingFrame", "OpenToCategory", "SettingsPanel", "InterfaceOptionsFrame",
    "WorldMapFrame", "ToggleWorldMap", "OpenWorldMap", "SelectQuestLogEntry", "SetSelectedQuest",
    "SetSuperTrackedQuestID", "ToggleGameMenu", "CloseAllWindows", "TakeTaxiNode",
    "C_Map.SetUserWaypoint", "C_Map.ClearUserWaypoint", "SetSuperTrackedUserWaypoint",
}

-- Lines allowed on purpose, each exactly once (file, name, the line without its indent).
local ALLOWED = {
    -- "Take the flight automatically" (Automation tab, off by default, Yendi's decision): the
    -- taxi API's own call, the only one Ding makes; the game's flight map frame is never
    -- touched.
    { file = "Ding/Core/Compat.lua", name = "TakeTaxiNode", code = "return (safe(TakeTaxiNode, index))" },
    -- The flight the player takes is watched after the game's function runs (never changed).
    { file = "Ding/Core/Travel.lua", name = "TakeTaxiNode",
      code = [[if type(hooksecurefunc) == "function" and type(TakeTaxiNode) == "function" then]] },
    { file = "Ding/Core/Travel.lua", name = "TakeTaxiNode", code = [[pcall(hooksecurefunc, "TakeTaxiNode", onTakeTaxi)]] },
    -- "Mark the target on the world map" (Arrow tab, on): the client's own map waypoint for
    -- the arrow's target, set, super-tracked and cleared through the API only (the world map
    -- frame is never touched); Ding moves or clears only the waypoint it set itself.
    { file = "Ding/Core/Compat.lua", name = "C_Map.SetUserWaypoint",
      code = "if not safe(C_Map.SetUserWaypoint, point) then return false end" },
    { file = "Ding/Core/Compat.lua", name = "SetSuperTrackedUserWaypoint",
      code = "local track = C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint" },
    { file = "Ding/Core/Compat.lua", name = "C_Map.ClearUserWaypoint",
      code = [[return waypointApi("ClearUserWaypoint") ~= nil and (safe(C_Map.ClearUserWaypoint)) or false]] },
}

local function allowed(path, name, code)
    local trimmed = code:match("^%s*(.-)%s*$")
    for _, a in ipairs(ALLOWED) do
        if a.name == name and path:find(a.file, 1, true) and trimmed == a.code then
            a.seen = (a.seen or 0) + 1
            return true
        end
    end
    return false
end

local function sources()
    local files = {}
    local list = io.popen("find '" .. tools .. "/../Ding' -name '*.lua'")
    for path in list:lines() do files[#files + 1] = path end
    list:close()
    return files
end

T.test("no call to the game's frames in Ding's code", function()
    local files = sources()
    T.ok(#files > 10, "Ding's files not found")
    for _, path in ipairs(files) do
        local handle = assert(io.open(path, "r"))
        local n = 0
        for line in handle:lines() do
            n = n + 1
            local code = line:gsub("%-%-.*$", "")      -- comments may name them
            for _, name in ipairs(FORBIDDEN) do
                T.ok(not code:find(name, 1, true) or allowed(path, name, code),
                    ("%s:%d calls %s"):format(path:match("Ding/.*$") or path, n, name))
            end
        end
        handle:close()
    end
    for _, a in ipairs(ALLOWED) do
        T.eq(a.seen, 1, ("%s: the allowed line %q"):format(a.file, a.code))
    end
end)

T.run()
