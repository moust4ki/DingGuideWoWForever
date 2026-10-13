-- Quest item button: the floating secure button that uses the item the current step needs.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local E, B, P, C = Ding.Engine, Ding.ItemButton, Ding.Panel, Ding.Config
local G = "nightelf-01-shadowglen"

-- 921 "Crown of the Earth": Tenaron hands out the Crystal Phial (5185), used at the moonwell.
-- 2159 "Dolanaar Delivery": a letter (7627), no "Use:" effect.
local PHIAL, LETTER = 5185, 7627
local KEY = "SHIFT-PAD4"
local OTHER = 900601    -- an item QuestieDB does not know

Ding.RegisterGuide({ id = "t-item", title = "Items", races = { "NightElf" }, steps = {
    { complete = 921 },                                   -- 1
    { complete = 2159 },                                  -- 2
    { go = { 1438, 40, 40 }, use = { OTHER, PHIAL } },    -- 3
    { complete = 921, use = OTHER },                      -- 4
    { turnin = 921 },                                     -- 5
} })

local function button() return _G.DingItemButton end

-- Step `index` of t-item (or another guide), quest states, bags.
local function start(opts)
    opts = opts or {}
    T.reset({ level = 3 })
    H.bindings[KEY] = B.BINDING
    Ding.db.panel.itemButton, Ding.db.panel.shown, Ding.db.panel.keyHints = true, true, true
    T.quests(opts.quests or { [921] = "log" })
    for id, count in pairs(opts.items or { [PHIAL] = 1 }) do
        H.setItem(id, count, { use = id ~= LETTER, icon = 130000 + id })
    end
    E:SetGuide(opts.guide or "t-item", opts.index or 1, true)
    E.hold = opts.index ~= nil   -- stay on the step asked for
    E:Refresh()
    H.flush()
end

local function shownItem()
    local b = button()
    if not b:IsShown() then return nil end
    return b:GetAttribute("item")
end

T.test("created at login: secure button, item type, hidden without an item", function()
    T.reset()
    local b = button()
    T.ok(b and b.protected, "no secure DingItemButton")
    T.eq(b:GetAttribute("type"), "item")
    E:Refresh()
    T.ok(not b:IsShown(), "button shown without a guide")
    T.eq(b:GetAttribute("item"), nil)
end)

T.test("setting, binding and label declared", function()
    T.eq(Ding.DEFAULTS.panel.itemButton, true)
    T.eq(B.BINDING, "CLICK DingItemButton:LeftButton")
    T.eq(_G["BINDING_NAME_CLICK DingItemButton:LeftButton"], Ding.L.BIND_ITEM)
    local xml = assert(io.open(tools .. "/../Ding/Bindings.xml")):read("*a")
    T.ok(xml:find('name="CLICK DingItemButton:LeftButton"', 1, true), "binding missing from Bindings.xml")
end)

T.test("quest starting item with a \"Use:\" effect: shown", function()
    start()
    T.eq(E.index, 1)
    T.eq(shownItem(), "item:" .. PHIAL)
    T.eq(button().icon.texture, 130000 + PHIAL, "icon")
    T.eq(button().name:GetText(), "item " .. PHIAL, "item name above the button")
end)

T.test("item without a \"Use:\" effect (letter): no button", function()
    start({ quests = { [921] = "turnedin", [2159] = "log" }, items = { [LETTER] = 1 } })
    T.eq(E.index, 2)
    T.eq(shownItem(), nil)
end)

T.test("item not in the bags: no button, it appears once received", function()
    start({ items = {} })
    T.eq(shownItem(), nil)
    H.setItem(PHIAL, 1, { use = true })
    H.fire("BAG_UPDATE", 0)
    H.flush()
    T.eq(shownItem(), "item:" .. PHIAL)
    H.setItem(PHIAL, 0)
    H.fire("BAG_UPDATE", 0)
    H.flush()
    T.eq(shownItem(), nil)
    T.eq(button():GetAttribute("item"), nil, "a hidden button keeps an item")
end)

T.test("design: 44 x 44, icon 36, 18 glyph overflowing at the bottom right", function()
    start()
    local b = button()
    T.eq(b.w, 44)
    T.eq(b.icon.w, 36)
    T.eq(b.glyph.h, 18)
    local point, rel, relPoint, x, y = b.glyph:GetPoint()
    T.eq(point .. relPoint, "CENTERBOTTOMRIGHT")
    T.ok(rel == b and x == -3 and y == 3, "glyph misplaced")
    T.eq(select(5, b.name:GetPoint()), 10, "name 10 above")
end)

T.test("quest ready to turn in: the button disappears", function()
    -- On the turn-in step, so that only the quest state changes, not the step.
    start({ index = 5 })
    T.eq(E.index, 5)
    T.eq(shownItem(), "item:" .. PHIAL, "objectives not done")
    T.quests({ [921] = "ready" })
    T.eq(E.index, 5)
    T.eq(shownItem(), nil)
end)

T.test("quest log item (clients that have it): takes priority", function()
    start({ items = { [PHIAL] = 1, [OTHER] = 1 } })
    H.setSpecialItem(921, OTHER)
    E:Refresh()
    T.eq(shownItem(), "item:" .. OTHER)
end)

T.test("guide `use` key: first item owned, even without a quest", function()
    start({ index = 3 })
    T.eq(E.index, 3)
    T.eq(shownItem(), "item:" .. PHIAL, "item of the list not found")
    H.setItem(OTHER, 1, { use = true })
    E:Refresh()
    T.eq(shownItem(), "item:" .. OTHER, "list order not followed")
end)

T.test("`use` key takes priority over the quest's item", function()
    start({ index = 4, items = { [PHIAL] = 1, [OTHER] = 1 } })
    T.eq(shownItem(), "item:" .. OTHER)
end)

T.test("`use` key validated when the guide is registered", function()
    T.fails(function()
        Ding.RegisterGuide({ id = "t-item-bad", steps = { { use = "phial" } } })
    end, "use expects item ids")
    T.eq(Ding:GetGuide("t-item-bad"), nil)
    local g = Ding.RegisterGuide({ id = "t-item-one", steps = { { use = PHIAL } } })
    T.eq(type(g.steps[1].use), "table", "a single id is not turned into a list")
end)

T.test("no guide, or guide finished: no button", function()
    start()
    E.finished = true
    E:Refresh()
    T.eq(shownItem(), nil)
    E.guide = nil
    E:Refresh()
    T.eq(shownItem(), nil)
end)

T.test("setting off, panel hidden: no button", function()
    start()
    Ding.db.panel.itemButton = false
    P:Update()
    T.eq(shownItem(), nil, "setting off")
    Ding.db.panel.itemButton = true
    P:Update()
    T.eq(shownItem(), "item:" .. PHIAL)
    P:Toggle()
    T.eq(shownItem(), nil, "panel hidden")
    P:Toggle()
    T.eq(shownItem(), "item:" .. PHIAL)
end)

T.test("setting in the Appearance tab, with the gamepad", function()
    start()
    C:Open("appearance", 1)
    H.flush()
    H.focusOn(C, function(row) return row.opts and row.opts.label == Ding.L.ITEM_BUTTON end, "item button")
    H.press("PAD1")
    T.eq(Ding.db.panel.itemButton, false)
    T.eq(shownItem(), nil, "the button stays shown")
    H.press("PAD1")
    T.eq(shownItem(), "item:" .. PHIAL)
    C:Close()
    H.flush()
end)

T.test("floating: saved position, independent of the guide window", function()
    start()
    local b = button()
    local point, rel, relPoint, x, y = b:GetPoint()
    T.eq(point, "BOTTOM")
    T.eq(rel, UIParent)
    T.eq(relPoint, "BOTTOM")
    T.ok(x == 0 and y == 220, "default position")
    P:SetScale(1.5)
    local db = Ding.db.panel
    db.point, db.x, db.y = "TOPLEFT", 10, -100
    P:ApplyPosition()
    P:Update()
    T.eq(select(5, b:GetPoint()), 220, "the button follows the window")
    T.eq(b:GetScale(), 1, "the button follows the window's scale")
    P:SetScale(1)
    P:ResetPosition()
end)

T.test("dragging with the right button saves the position", function()
    start()
    local b = button()
    T.ok(b.scripts.OnDragStart and b.scripts.OnDragStop, "no dragging")
    b:ClearAllPoints()
    b:SetPoint("CENTER", UIParent, "CENTER", 12, -34)
    b.scripts.OnDragStop(b)
    local db = Ding.db.item
    T.ok(db.point == "CENTER" and db.x == 12 and db.y == -34, "position not saved")
    B:ResetPosition()
    T.ok(db.point == "BOTTOM" and db.y == 220, "original position")
end)

T.test("move mode from the Appearance tab, button visible even without an item", function()
    start({ items = {} })
    T.eq(shownItem(), nil)
    C:Open("appearance", 1); H.flush()
    H.focusOn(C, function(r) return r.opts and r.opts.label == Ding.L.MOVE_ITEM end, "move the button")
    H.press("PAD1")
    T.ok(button():IsShown(), "button hidden while moving")
    local y = Ding.db.item.y
    H.press("PADDUP"); H.press("PAD1")
    T.eq(Ding.db.item.y, y + 5)
    T.ok(not button():IsShown(), "button still visible without an item")
    C:Close(); H.flush()
    B:ResetPosition()
end)

T.test("states: out of range, unusable, pressed", function()
    start()
    local b, C_ = button(), Ding.UI.C
    T.eq(b.icon:GetAlpha(), 1)
    H.setTarget(true)
    H.setItem(PHIAL, 1, { use = true, range = false })
    B:Render()
    T.eq(b.name:GetText(), Ding.L.OUT_OF_RANGE)
    T.eq(b.icon:GetAlpha(), 0.45)
    T.eq(b.look.border.color[1], C_.todoBorder[1], "border not red")
    H.setItem(PHIAL, 1, { use = true, range = true, unusable = true })
    B:Render()
    T.eq(b.name:GetText(), "item " .. PHIAL)
    T.eq(b.icon:GetAlpha(), 0.45, "unusable item not faded")
    H.setTarget(false)
    H.setItem(PHIAL, 1, { use = true })
    b.scripts.PostClick(b)
    T.ok(b.ring:IsShown() and not b.look.border:IsShown(), "no ring when pressed")
    H.tick(0.3)
    T.ok(not b.ring:IsShown(), "the ring stays")
end)

T.test("the binding uses the item shown", function()
    start()
    T.eq(H.pressBinding(KEY), "item:" .. PHIAL)
    T.eq(H.itemUses()[1], "item:" .. PHIAL)
end)

T.test("the binding uses nothing when the button is hidden", function()
    start()
    T.quests({ [921] = "ready" })
    T.eq(H.pressBinding(KEY), nil)
end)

T.test("glyph of the actual binding, depending on the setting", function()
    start()
    local hint = button().glyph
    T.eq(hint:GetAlpha(), 1, "glyph hidden")
    local texts = {}
    for _, p in ipairs(hint.glyph.parts) do texts[#texts + 1] = p.text or "?" end
    T.eq(table.concat(texts), "LT+Y")
    Ding.db.panel.keyHints = false
    P:Update()
    T.eq(hint:GetAlpha(), 0, "glyph shown despite the setting")
    H.bindings[KEY] = nil
    Ding.db.panel.keyHints = true
    P:Update()
    T.eq(hint:GetAlpha(), 0, "glyph without a binding")
end)

T.test("cooldown: veil over the icon and remaining seconds", function()
    start()
    local b = button()
    T.ok(not b.veil:IsShown(), "veil without a cooldown")
    H.setItem(PHIAL, 1, { use = true, start = H.now(), duration = 30 })
    H.fire("BAG_UPDATE_COOLDOWN")
    T.ok(b.veil:IsShown(), "no veil during the cooldown")
    T.eq(b.seconds:GetText(), "30")
    H.tick(10.5)
    T.eq(b.seconds:GetText(), "20", "the seconds do not count down")
    H.tick(20)
    T.ok(not b.veil:IsShown() and b.seconds:GetText() == "", "veil still there after the cooldown")
end)

T.test("combat: nothing protected changes, the button keeps its item", function()
    start({ items = { [PHIAL] = 2, [OTHER] = 1 } })
    -- The panel stays as is: only the button's own handler can catch up after the fight.
    Ding.db.panel.compactInCombat = false
    T.eq(shownItem(), "item:" .. PHIAL)
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    -- The step changes in combat: the button still uses (and shows) the phial.
    H.setSpecialItem(921, OTHER)
    E:Refresh()
    H.flush()
    T.eq(shownItem(), "item:" .. PHIAL)
    T.eq(H.pressBinding(KEY), "item:" .. PHIAL)
    T.eq(button().icon.texture, 130000 + PHIAL, "the icon shows another item")
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
    H.flush()
    T.eq(shownItem(), "item:" .. OTHER, "no update after combat")
    Ding.db.panel.compactInCombat = true
end)

T.test("combat: the completed quest hides the button only after combat", function()
    start()
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    T.quests({ [921] = "ready" })
    T.ok(button():IsShown())
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
    H.flush()
    T.eq(shownItem(), nil)
end)

T.test("combat with the window minimized: the button stays, nothing protected moves", function()
    start()
    Ding.db.panel.compactInCombat = true
    H.fire("PLAYER_REGEN_DISABLED"); H.setCombat(true)
    T.ok(P.compact, "window not minimized")
    T.eq(shownItem(), "item:" .. PHIAL)
    button().scripts.OnDragStart(button())   -- must not move a protected frame in combat
    B:Render()
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
    H.flush()
    T.eq(shownItem(), "item:" .. PHIAL)
end)

T.test("login in combat (reload): button created after combat", function()
    start()
    local old = B.button
    old:Hide()
    B.button = nil
    H.setCombat(true)
    B:Create()
    T.eq(B.button, nil, "secure button created in combat")
    E:Refresh()
    H.setCombat(false); H.fire("PLAYER_REGEN_ENABLED")
    H.flush()
    T.ok(B.button and B.button ~= old, "button not created after combat")
    T.eq(shownItem(), "item:" .. PHIAL)
end)

T.test("Bindings tab: assign the item button with the gamepad", function()
    start()
    H.bindings[KEY] = nil
    C:Open("bindings", 1)
    H.flush()
    H.focusOn(C, function(row) return row.opts and row.opts.action == B.BINDING end, "item binding")
    H.press("PAD1")
    T.ok(C.capturing, "not waiting for a button")
    H.padDown("PAD4", { shift = true })
    T.eq(H.bindings[KEY], B.BINDING, "binding not saved")
    C:Close()
    H.flush()
    T.eq(button().glyph:GetAlpha(), 1, "glyph not shown after the assignment")
end)

T.test("real guide: the crystal phial during \"fill the phial\"", function()
    T.reset({ level = 3 })
    H.setUsable(PHIAL, true)
    H.bindings[KEY] = B.BINDING
    E:SetGuide(G, 1, true)
    H.flush()
    local seen = false
    for _ = 1, 60 do
        if E.finished then break end
        local step = E:CurrentStep()
        if step.complete and step.complete[1] == 921 then
            T.eq(shownItem(), "item:" .. PHIAL, "button missing on the phial step")
            T.eq(H.pressBinding(KEY), "item:" .. PHIAL)
            seen = true
        elseif step.turnin and step.turnin[1] == 921 then
            break
        else
            T.eq(shownItem(), nil, "button shown outside the phial step")
        end
        local index = E.index
        H.play(step)
        H.flush()
        if E.index == index then E:Next(); H.flush() end
    end
    T.ok(seen, "phial step never reached")
end)

T.run()
