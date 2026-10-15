-- Arrow styles and the optional TomTom bridge: with TomTom installed, Ding's target goes to
-- TomTom's arrow and Ding's own arrow steps aside, still validating the "go" steps.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, A, TT = Ding.Engine, Ding.Arrow, Ding.TomTom

Ding.RegisterGuide({ id = "t-arrow", title = "Arrow", races = { "NightElf" }, steps = {
    { go = { 1438, 40, 40 }, text = "Point A" },
    { go = { 1438, 60, 60 }, text = "Point B" },
    { level = 60 },
} })

-- A TomTom stand-in that records the calls Ding makes to its public API.
local fake
local function installTomTom(opts)
    opts = opts or {}
    fake = { added = {}, removed = {}, next = 0 }
    function fake:AddWaypoint(map, x, y, wp)
        if opts.fail then error("TomTom broke") end
        self.next = self.next + 1
        self.added[#self.added + 1] = { map = map, x = x, y = y, opts = wp, uid = { n = self.next } }
        return self.added[#self.added].uid
    end
    function fake:RemoveWaypoint(uid) self.removed[#self.removed + 1] = uid end
    _G.TomTom = fake
end

local function start()
    TT:Clear()
    TT.failed = nil
    Ding.db.arrow.shown, Ding.db.arrow.tomtom, Ding.db.arrow.style = true, true, "ding"
    A:SetDelegated(false)
    A:ApplyStyle()
    T.reset({ level = 2 })
    H.player.map, H.player.x, H.player.y = 1438, 50, 50
    E:SetGuide("t-arrow", 1, true)
    H.tick(1)
end

local function done()
    TT:Clear()
    _G.TomTom = nil
    fake = nil
    A.forced = nil       -- a row chosen by an earlier test
    H.setGhost(nil)
end

local f = A.frame

---------------------------------------------------------------------------
-- Skins (Settings > Arrow and maps; tools/tests/themes_test.lua: the picker)
---------------------------------------------------------------------------
T.test("the theme's arrow by default, the Minimap arrow on request, an unknown skin = the theme's", function()
    T.eq(Ding.DEFAULTS.arrow.skin, "theme")
    Ding.UI.Theme.Apply("dingdark")
    start()
    T.eq(f.arrow.texture, Ding.UI.TEX .. "arrow")
    A:SetSkin("classic")
    T.eq(f.arrow.texture, "Interface\\Minimap\\MinimapArrow")
    A:SetSkin("nope")
    T.eq(Ding.db.arrow.skin, "theme")
    T.eq(f.arrow.texture, Ding.UI.TEX .. "arrow")
    Ding.UI.Theme.Apply("halo")
    T.eq(f.arrow.texture, Ding.UI.TEX .. (A.state == "behind" and "arrow_halo_back" or "arrow_halo_gold"),
        "Halo: its own arrows")
end)

T.test("Ding's texture ships with the addon", function()
    local path = (Ding.UI.TEX .. "arrow"):gsub("^Interface\\AddOns\\Ding\\", ""):gsub("\\", "/")
    local file = io.open(tools .. "/../Ding/" .. path .. ".tga", "rb")
    T.ok(file, "Ding/" .. path .. ".tga missing")
    local header = file:read(18)
    file:close()
    T.eq(header:byte(3), 2, "uncompressed TGA expected")
    T.eq(header:byte(13) + 256 * header:byte(14), 128, "width")
    T.eq(header:byte(15) + 256 * header:byte(16), 128, "height")
    T.eq(header:byte(17), 32, "32 bits (alpha channel)")
end)

---------------------------------------------------------------------------
-- Without TomTom
---------------------------------------------------------------------------
T.test("without TomTom: Ding's arrow shows", function()
    done()
    start()
    T.ok(not TT:Available(), "TomTom seen as installed")
    T.ok(f:IsShown() and f.arrow:IsShown() and f.label:IsShown(), "arrow or plate hidden")
end)

T.test("arrow hidden: reaching the point still validates the \"go\" step", function()
    done()
    start()
    A:Toggle()
    H.tick(1)
    T.ok(not f:IsShown(), "arrow still visible")
    H.player.x, H.player.y = 40, 40
    H.tick(2); H.flush(); H.tick(1)
    T.eq(E.index, 2, "\"go\" step not validated with the arrow hidden")
    A:Toggle()
end)

T.test("no facing (dungeon): distance measured, arrow hidden", function()
    done()
    start()
    local facing = _G.GetPlayerFacing
    _G.GetPlayerFacing = function() return nil end
    A.point = nil; A:Tick()
    local arrowShown, distance = f.arrow:IsShown(), f.distance.text
    H.player.x, H.player.y = 40, 40
    H.tick(2); H.flush()
    local index = E.index
    _G.GetPlayerFacing = facing
    T.ok(not arrowShown, "arrow rotated without a facing")
    T.ok(distance ~= "?", "unknown distance: " .. tostring(distance))
    T.eq(index, 2, "\"go\" step not validated without a facing")
end)

---------------------------------------------------------------------------
-- With TomTom
---------------------------------------------------------------------------
T.test("with TomTom: the target goes to TomTom, only once", function()
    installTomTom()
    start()
    T.eq(#fake.added, 1, "waypoints added")
    local wp = fake.added[1]
    T.eq(wp.map, 1438)
    T.eq(wp.x, 0.4)
    T.eq(wp.y, 0.4)
    T.ok(wp.opts.title:find("Point A", 1, true), "title: " .. tostring(wp.opts.title))
    T.eq(wp.opts.crazy, true, "TomTom's arrow")
    T.eq(wp.opts.persistent, false, "waypoint kept after the session")
    H.tick(3)
    T.eq(#fake.added, 1, "the same waypoint is sent again every frame")
    done()
end)

T.test("with TomTom: Ding's arrow and plate hide", function()
    installTomTom()
    start()
    T.ok(not f.arrow:IsShown(), "Ding's arrow visible")
    T.ok(not f.label:IsShown(), "Ding's plate visible")
    done()
end)

T.test("with TomTom: reaching the point validates the step and moves on to the next point", function()
    installTomTom()
    start()
    local first = fake.added[1].uid
    H.player.x, H.player.y = 40, 40
    H.tick(2); H.flush(); H.tick(2)
    T.eq(E.index, 2, "\"go\" step not validated")
    T.eq(fake.removed[1], first, "old waypoint not removed")
    T.eq(#fake.added, 2)
    T.eq(fake.added[2].x, 0.6)
    T.ok(fake.added[2].opts.title:find("Point B", 1, true))
    done()
end)

T.test("with TomTom: no point left (end of the \"go\" steps), the waypoint is removed", function()
    installTomTom()
    start()
    E:Next(); H.flush(); H.tick(1)
    E:Next(); H.flush(); H.tick(1)
    T.eq(#fake.removed, #fake.added, "waypoint left in TomTom")
    done()
end)

T.test("setting off: waypoint removed, Ding's arrow back", function()
    installTomTom()
    start()
    A:SetTomTom(false)
    H.tick(1)
    T.eq(Ding.db.arrow.tomtom, false)
    T.eq(#fake.removed, 1, "waypoint not removed")
    T.eq(#fake.added, 1, "waypoint sent despite the setting")
    T.ok(f.arrow:IsShown() and f.label:IsShown(), "Ding's arrow missing")
    A:SetTomTom(true)
    H.tick(1)
    T.eq(#fake.added, 2, "waypoint not sent again once the setting is back on")
    T.ok(not f.label:IsShown())
    done()
end)

T.test("arrow hidden: the waypoint is removed from TomTom", function()
    installTomTom()
    start()
    A:Toggle()
    T.eq(#fake.removed, 1)
    A:Toggle()
    H.tick(1)
    T.eq(#fake.added, 2)
    done()
end)

T.test("closing the guide window hides the arrow too; reopening it brings it back", function()
    done()
    start()
    T.ok(f:IsShown(), "arrow missing at the start")
    Ding.Panel:Close()
    H.tick(1)
    T.ok(not f:IsShown(), "arrow still visible, window closed")
    T.ok(Ding.db.arrow.shown, "the \"Show the arrow\" setting changed")
    -- The "go" steps still validate themselves, window and arrow closed.
    H.player.x, H.player.y = 40, 40
    H.tick(2); H.flush(); H.tick(1)
    T.eq(E.index, 2, "\"go\" step not validated with the window closed")
    Ding.Panel:Toggle()          -- minimap button (right click), binding, /ding
    H.tick(1)
    T.ok(Ding.db.panel.shown, "window not reopened")
end)

T.test("window closed: the waypoint leaves TomTom; the settings checkbox brings back guide and arrow", function()
    installTomTom()
    start()
    Ding.Panel:Close()
    T.eq(#fake.removed, 1, "TomTom waypoint kept with the window closed")
    Ding.Panel:SetShown(true)    -- Settings > Guide > "Show the guide and its arrow"
    H.tick(1)
    T.eq(#fake.added, 2, "TomTom waypoint not put back")
    T.ok(Ding.db.panel.shown)
    done()
end)

T.test("\"hide in dungeons\": the arrow hides with the window in an instance, and comes back", function()
    done()
    start()
    Ding.db.panel.hideInInstance = true
    H.setInstance(true)
    H.fire("ZONE_CHANGED_NEW_AREA"); H.flush(); H.tick(1)
    T.ok(not Ding.Panel.frame:IsShown(), "window visible in a dungeon")
    T.ok(not f:IsShown(), "arrow visible in a dungeon (name and \"?\")")
    H.setInstance(false)
    H.fire("ZONE_CHANGED_NEW_AREA"); H.flush(); H.tick(1)
    T.ok(Ding.Panel.frame:IsShown() and f:IsShown(), "window or arrow not back outside the dungeon")
    Ding.db.panel.hideInInstance = false
end)

T.test("TomTom failing: Ding's arrow takes over, without errors", function()
    installTomTom({ fail = true })
    start()
    T.ok(TT.failed, "failure not remembered")
    T.ok(not TT:Active())
    T.ok(f.arrow:IsShown() and f.label:IsShown(), "Ding's arrow missing")
    H.tick(2)
    done()
end)

T.test("Arrow tab: the arrow's look, size and TomTom checkbox with the gamepad", function()
    installTomTom()
    start()
    local C, L = Ding.Config, Ding.L
    C:Open("arrow", 1); H.flush()
    H.focusOn(C, function(r) return r.kind == "arrows" end, "the arrow cards")
    H.press("PADDRIGHT")
    T.eq(f.arrow.texture, Ding.UI.TEX .. (A.state == "behind" and "arrow_halo_back" or "arrow_halo_gold"),
        "the arrow does not show the focused skin")
    T.eq(Ding.db.arrow.skin, "theme", "a preview saved")
    H.press("PAD1")
    T.eq(Ding.db.arrow.skin, "halo")
    H.press("PAD4")
    T.eq(Ding.db.arrow.skin, "theme", "Y does not restore the theme's arrow")
    H.focusOn(C, function(r) return r.opts and r.opts.label == L.ARROW_SIZE end, "size")
    H.press("PADDRIGHT")
    T.eq(Ding.db.arrow.size, 60)
    T.eq(f.arrow.w, 60, "the arrow does not follow the size")
    H.press("PAD4")
    T.eq(Ding.db.arrow.size, 56)
    H.focusOn(C, function(r) return r.opts and r.opts.label == L.USE_TOMTOM end, "TomTom")
    T.eq(C.focus.opts.desc, L.USE_TOMTOM_DESC)
    H.press("PAD1")
    T.eq(Ding.db.arrow.tomtom, false)
    C:Close(); H.flush()
    done()
end)

---------------------------------------------------------------------------
-- Design states: on the way (blue), behind (red), arrived (green ring, fades)
---------------------------------------------------------------------------
local C_ = Ding.UI.C
local function facing(radians)
    _G.GetPlayerFacing = function() return radians end
    A.point = nil; A:Tick()
end
local function sameColor(tex, color)
    local c = tex.vertexColor
    return c and math.abs(c[1] - color[1]) < 1e-6 and math.abs(c[2] - color[2]) < 1e-6
end

T.test("on the way: the theme's arrow (blue in Ding dark, gold in Halo), name, distance and time", function()
    done()
    start()
    facing(0)
    local ahead = A.rotation        -- with facing 0, the arrow turns by this much
    facing(ahead)                   -- facing the target: it is straight ahead
    T.ok(math.abs(math.sin(A.rotation)) < 1e-6 and math.cos(A.rotation) > 0, "target not straight ahead")
    T.eq(A.state, "route")
    T.ok(sameColor(f.arrow, C_.arrowTint), "arrow not in the theme's color")
    T.eq(f.arrow.texture, Ding.UI.TEX .. Ding.UI.Theme.current.tex.arrow, "not the theme's arrow")
    T.eq(f.label:GetText(), "Point A")
    T.ok(H.plain(f.distance:GetText()):find("^%d+ m$"), "distance: " .. tostring(f.distance:GetText()))
    T.ok(H.plain(f.eta:GetText()):find("^ · %d+:%d%d$"), "time: " .. tostring(f.eta:GetText()))
    facing(0)
end)

T.test("behind (more than 120 degrees): the turn-around arrow and color, \"turn around\"", function()
    done()
    start()
    facing(0)
    local ahead = A.rotation
    facing(ahead + math.pi)         -- back to the target
    T.eq(A.state, "behind")
    T.ok(sameColor(f.arrow, C_.arrowBackTint), "arrow not in the turn-around color")
    T.eq(f.arrow.texture, Ding.UI.TEX .. Ding.UI.Theme.current.tex.arrowBack, "not the theme's turn-around arrow")
    T.ok(f.distance.color and math.abs(f.distance.color[1] - C_.arrowBack[1]) < 1e-6, "distance not in the turn-around color")
    T.eq(f.eta:GetText(), " · " .. Ding.L.TURN_AROUND)
    facing(0)
end)

T.test("arrived: green ring and check mark, \"You're there\", fades after 3 s, back when walking away", function()
    done()
    Ding.RegisterGuide({ id = "t-arrow-npc", title = "NPC", races = { "NightElf" }, steps = { { accept = 456 } } })
    T.reset({ level = 1 })
    local npc = Ding.Data:StartPoints(456)[1]
    T.ok(npc, "no quest giver for 456")
    H.player.map, H.player.x, H.player.y = npc.map, npc.x, npc.y
    E:SetGuide("t-arrow-npc", 1, true)
    H.tick(0.5)
    T.eq(A.state, "arrived")
    T.ok(f.ring:IsShown() and f.check:IsShown() and not f.arrow:IsShown(), "ring missing or arrow visible")
    T.ok(sameColor(f.ring, C_.done), "ring not green")
    T.eq(f.distance:GetText(), Ding.L.ARRIVED)
    T.ok(f:IsShown(), "arrow hidden right away")
    H.tick(3.5)
    T.ok(not f:IsShown(), "no fade after 3 s")
    E:Refresh(); H.flush()
    T.ok(not f:IsShown(), "came back without moving")
    H.player.x = npc.x + 5
    H.tick(0.5)
    T.ok(f:IsShown() and A.state ~= "arrived", "does not come back when walking away")
end)

T.test("size adjustable from 40 to 80: arrow, ring and check mark follow", function()
    done()
    start()
    A:SetSize(100)
    T.eq(Ding.db.arrow.size, 80)
    T.eq(f.arrow.w, 80)
    T.ok(math.abs(f.ring.w - 48 * 80 / 56) < 1e-6, "ring")
    A:SetSize(10)
    T.eq(Ding.db.arrow.size, 40)
    A:SetSize(56)
    T.eq(f.check.w, 22)
end)

T.test("a row chosen in the window: the arrow aims at it until the step changes", function()
    done()
    start()
    T.eq(A.targetName, "Point A")
    A:Focus({ { map = 1438, x = 70, y = 70, label = "Elsewhere" } })
    T.eq(A.targetName, "Elsewhere")
    H.tick(2)
    T.eq(A.targetName, "Elsewhere", "the chosen target is forgotten")
    E:Next(); H.flush(); H.tick(0.1)
    T.eq(A.targetName, "Point B", "the chosen target outlives the step change")
end)

T.test("not clickable; movable only in move mode", function()
    done()
    start()
    T.ok(not f:IsMouseEnabled(), "the arrow captures the mouse")
    T.eq(Ding.DEFAULTS.arrow.point, "CENTER")
    T.eq(Ding.DEFAULTS.arrow.y, 120)
end)

---------------------------------------------------------------------------
-- Hunting areas, corpse, measured speed
---------------------------------------------------------------------------
-- In the mock world, 1 % of map x is 51 yards (and 1 % of map y, 34 yards).
T.test("objectives and item sources: areas; quest givers: a point", function()
    local D = Ding.Data
    local targets = D:ObjectiveTargets(456)
    T.ok(#targets > 0 and #targets[1].points > 0, "no spawns for 456")
    for _, target in ipairs(targets) do
        for _, p in ipairs(target.points) do T.ok(p.area, "objective spawn without an area") end
    end
    for _, p in ipairs(D:StartPoints(456)) do T.ok(not p.area, "quest giver marked as an area") end
end)

-- A tester: "in the area" at 40 yards, still a walk away from the monsters. Now about an
-- attack's reach: in at 25 yards, out past 40.
T.test("hunting area: arrived among the spawns (25), up to 40, without flickering", function()
    done()
    start()
    A:Focus({ { map = 1438, x = 50, y = 50, label = "Boars", area = true } })
    H.player.x, H.player.y = 50, 50
    H.tick(0.1)
    T.eq(A.state, "arrived")
    T.eq(f.distance:GetText(), Ding.L.IN_AREA)
    H.player.x = 50.6                     -- 31 yards: still in the area
    H.tick(0.1)
    T.eq(A.state, "arrived", "left the area at 31 yards")
    H.player.x = 51.0                     -- 51 yards: out of it
    H.tick(0.1)
    T.ok(A.state ~= "arrived", "still in the area at 51 yards")
    H.player.x = 50.6                     -- 31 yards from outside: not in yet
    H.tick(0.1)
    T.ok(A.state ~= "arrived", "entered the area at 31 yards")
    H.player.x = 50.4                     -- 20 yards: in
    H.tick(0.1)
    T.eq(A.state, "arrived", "not entered at 20 yards")
end)

T.test("a place or an NPC: \"you're here\" at 6 yards, not at 10", function()
    done()
    start()
    A:Focus({ { map = 1438, x = 50, y = 50, label = "Conservator Ilthalaine", npc = 2079 } })
    H.player.x, H.player.y = 50.18, 50    -- 9 yards
    H.tick(0.1)
    T.ok(A.state ~= "arrived", "arrived 9 yards away")
    H.player.x = 50.1                     -- 5 yards
    H.tick(0.1)
    T.eq(A.state, "arrived", "not arrived 5 yards away")
    T.eq(f.distance:GetText(), Ding.L.ARRIVED)
end)

-- Two objectives side by side (spiders east, skeletons west, about 100 yards apart): walking
-- between them, the arrow keeps the one it follows until the other is clearly nearer.
T.test("two objectives side by side: the arrow keeps its target until another is clearly nearer", function()
    done()
    start()
    local spiders = { map = 1438, x = 52, y = 50, label = "Spiders", area = true }
    local skeletons = { map = 1438, x = 48, y = 50, label = "Skeletons", area = true }
    local function at(x)
        H.player.x = x
        E.candidates = { spiders, skeletons }
        A.point = nil
        A:Tick()
        return A.point and A.point.label
    end
    A.follow = nil
    T.eq(at(50.6), "Spiders", "nearer at first")
    T.eq(at(49.6), "Spiders", "skeletons a bit nearer: the arrow stays")
    T.eq(at(48.6), "Skeletons", "skeletons clearly nearer: the arrow moves")
    T.eq(at(49.4), "Skeletons", "and stays on them in turn")
    -- The target it follows gone (objective done): the nearest one.
    A.point = nil
    E.candidates = { spiders }
    A:Tick()
    T.eq(A.point.label, "Spiders")
end)

T.test("a new step starts without a followed target", function()
    done()
    start()
    A.follow = "Somebody else"
    E:Next(); H.tick(1)
    T.eq(A.follow ~= "Somebody else", true)
end)

T.test("hunting area: the arrow fades while hunting, comes back on leaving", function()
    done()
    start()
    A:Focus({ { map = 1438, x = 50, y = 50, label = "Boars", area = true } })
    H.player.x, H.player.y = 50, 50
    H.tick(3.5)
    T.ok(not f:IsShown(), "the arrow stays shown while hunting")
    E:Refresh(); H.flush()             -- a kill updates the quest log
    T.ok(not f:IsShown(), "the arrow comes back after each kill")
    H.player.x = 51.5
    H.tick(0.5)
    T.ok(f:IsShown(), "the arrow does not come back outside the area")
end)

T.test("death: the arrow leads to the corpse, then back to the guide", function()
    done()
    start()
    T.eq(A.targetName, "Point A")
    H.setGhost({ map = 1438, x = 60, y = 60 })
    H.fire("PLAYER_DEAD"); H.tick(0.1)
    T.eq(A.targetName, Ding.L.CORPSE, "the arrow does not aim at the corpse")
    T.ok(f:IsShown(), "arrow hidden for the ghost")
    H.player.x, H.player.y = 60.4, 60  -- 20 yards: close enough to come back
    H.tick(0.1)
    T.eq(A.state, "arrived")
    T.eq(E.index, 1, "the corpse validated a guide step")
    H.setGhost(nil)
    H.fire("PLAYER_UNGHOST"); H.tick(0.1)
    T.eq(A.targetName, "Point A", "no return to the guide after resurrecting")
end)

T.test("speed: never the client's (secret), measured from movement", function()
    done()
    start()
    T.eq(Ding.Compat.Plain(H.SECRET), nil, "secret value not filtered")
    T.eq(Ding.Compat.Plain(12), 12)
    facing(0)
    facing(A.rotation)                 -- the target straight ahead: a time, not "turn around"
    -- A steady run: 0.02 % of map x every 0.05 s, about 20 yards per second.
    for _ = 1, 100 do
        H.player.x = H.player.x - 0.02
        H.tick(0.05)
    end
    local distance = tonumber((H.plain(f.distance:GetText()):match("%d+")))
    local m, s = H.plain(f.eta:GetText()):match("(%d+):(%d+)")
    local seconds = tonumber(m) * 60 + tonumber(s)
    T.ok(math.abs(seconds - distance / 20.4) <= 2, ("time %ds for %d m at 20 m/s"):format(seconds, distance))
    facing(0)
end)

T.run()
