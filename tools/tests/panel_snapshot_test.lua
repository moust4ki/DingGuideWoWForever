-- The guide window as the player sees it, in French, for every scenario of
-- tools/panel_scenarios.lua: tools/panel_snapshot.lua's text must match the snapshot kept in
-- tools/tests/snapshots/<scenario>.txt. A change of the window shows in a review as a change of
-- these files; after an intended change, write them again:
--   lua5.1 tools/panel_snapshot.lua <combined dir> --write tools/tests/snapshots
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local Snap = dofile(tools .. "/panel_snapshot.lua")
local T = dofile(tools .. "/testlib.lua")(arg[1], { guides = Snap.GUIDES, locale = "frFR" })
local view = Snap.Bind(T)
local DIR = tools .. "/tests/snapshots"

local function lines(text)
    local out = {}
    for line in (text:gsub("\r", "") .. "\n"):gmatch("(.-)\n") do out[#out + 1] = line end
    return out
end

for _, sc in ipairs(Snap.scenarios) do
    T.test(sc.name .. ": " .. sc.about, function()
        local file = io.open(DIR .. "/" .. sc.name .. ".txt", "rb")
        T.ok(file, "no snapshot: write it with tools/panel_snapshot.lua --write tools/tests/snapshots")
        local want = lines(file:read("*a"))
        file:close()
        local got = lines(view:Snapshot(sc.name))
        for i = 1, math.max(#want, #got) do
            if want[i] ~= got[i] then
                error(("line %d differs (write the snapshots again if the change is intended)\n        kept: %s\n"
                    .. "        now:  %s"):format(i, tostring(want[i]), tostring(got[i])), 0)
            end
        end
    end)
end

T.run()
