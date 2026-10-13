-- The NPC directory: what Core/Directory.lua finds in DingDB (categories, weapons, cities,
-- search) and its window (UI/Finder.lua) with the gamepad and with the mouse, the trips it
-- starts, the guide window's button and the weapon reminder.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "enUS" })
local Ding, H = T.Ding, T.H
local E, P, A, L, F, Dir = Ding.Engine, Ding.Panel, Ding.Arrow, Ding.L, Ding.Finder, Ding.Directory

local BULIWYF, BIXI, ANSEKHWA = 11865, 13084, 11869

Ding.RegisterGuide({ id = "t-directory", title = "Directory", steps = {
    { accept = 456 },
    { level = 60 },
} })

-- A character standing somewhere; opts: class, race, faction, level, map, x, y.
local function start(opts)
    H.closeDialog()
    T.reset({ level = opts.level or 12, class = opts.class or "WARRIOR", race = opts.race or "Human",
        faction = opts.faction or "Alliance" })
    H.player.map, H.player.x, H.player.y = opts.map, opts.x, opts.y
    H.setGamepadConnected(true)
    Ding.db.panel.weaponReminder = true
    E:SetGuide("t-directory", 1, true); H.flush()
    H.tick(1)
end

local GOLDSHIRE = { class = "WARRIOR", race = "Human", map = 1429, x = 43.2, y = 65.6 }
local IRONFORGE = { class = "HUNTER", race = "Dwarf", map = 1455, x = 55, y = 50 }
local THUNDER_BLUFF = { class = "HUNTER", race = "Tauren", faction = "Horde", map = 1456, x = 45, y = 55 }

local function side(npc)
    return NpcDB.friendlyToFaction(npc)
end

local function entry(key, within)
    for _, e in ipairs(Dir:Entries(within)) do
        if e.category.key == key then return e end
    end
end

-- The window's rows as the player reads them: "label | sub | right".
local function screen()
    local out = {}
    for i, r in ipairs(F.rows or {}) do out[i] = (r.label or "") .. " | " .. (r.sub or "") .. " | " .. (r.right or "") end
    return table.concat(out, "\n")
end

local function rowIndex(label)
    for i, r in ipairs(F.rows or {}) do
        if r.label == label then return i end
    end
end

local function click(frame, button)
    frame.scripts.OnClick(frame, button or "LeftButton")
    H.flush()
end

---------------------------------------------------------------------------
-- What the directory finds
---------------------------------------------------------------------------
T.test("Travel:Reach prices any point like Travel:Plan, in one pass", function()
    start(IRONFORGE)
    Ding.char.flights = { [1573] = true }
    local reach = Ding.Travel:Reach()
    for _, point in ipairs({ { map = 1455, x = 61, y = 89 }, { map = 1426, x = 47, y = 52 }, { map = 1429, x = 43, y = 65 },
        { map = 1438, x = 55, y = 50 } }) do
        local plan = Ding.Travel:Plan({ map = point.map, x = point.x, y = point.y })
        local seconds = reach:Seconds({ map = point.map, x = point.x, y = point.y })
        T.ok(plan and seconds and math.abs(plan.seconds - seconds) < 1e-6,
            ("%d: %s by Plan, %s by Reach"):format(point.map, tostring(plan and plan.seconds), tostring(seconds)))
    end
end)

T.test("a village: each service the fewest seconds away, on the player's side, in the village", function()
    start(GOLDSHIRE)
    for _, key in ipairs({ "vendor", "repair", "food", "innkeeper", "trainer", "trade" }) do
        local e = entry(key)
        T.ok(e and e.best, "nothing for " .. key)
        local friendly = side(e.best.npc)
        T.ok(friendly == "A" or friendly == "AH", key .. ": not on the Alliance side")
        T.ok(e.best.seconds and e.best.seconds < 120, key .. ": not in the village: " .. tostring(e.best.seconds))
        T.eq(Dir:Place(e.best.point), "Elwynn Forest", key .. " is not in Elwynn Forest")
    end
    T.eq(Dir:Best("innkeeper").npc, 295, "Goldshire's innkeeper")
    T.ok(NpcDB.GetRaw(Dir:Best("trainer").npc, "subName"):find("Warrior", 1, true), "not a warrior trainer")
    -- A warrior uses ammunition, has no reagents nor poisons, no stable master.
    T.ok(entry("ammo"), "no ammunition for a warrior")
    T.eq(entry("reagents"), nil)
    T.eq(entry("poisons"), nil)
    T.eq(entry("stable"), nil)
end)

T.test("a capital: bank, auction house, flight master and weapon masters are in the city", function()
    start(IRONFORGE)
    for _, key in ipairs({ "bank", "auction", "flight", "trainer", "stable" }) do
        local e = entry(key)
        T.ok(e and e.best, "nothing for " .. key)
        T.eq(Dir:Place(e.best.point), "Ironforge", key .. " is not in Ironforge")
    end
    T.ok(NpcDB.GetRaw(Dir:Best("trainer").npc, "subName"):find("Hunter", 1, true), "not a hunter trainer")
    local ammo = entry("ammo")
    T.eq(#ammo.choices, 2, "arrows and bullets")
    T.eq(ammo.choices[1].kind, "arrows")
    T.ok(ammo.choices[2].best, "no bullets in Ironforge")
end)

T.test("vendors by what they sell: ammunition, food and drink, reagents, poisons, trade goods", function()
    start(GOLDSHIRE)
    local function sells(npc, item)
        for _, v in ipairs(Ding.Data:ItemVendors(item)) do
            if v == npc then return true end
        end
        return false
    end
    local function listed(kind, npc)
        for _, id in ipairs(Dir:Ids(kind)) do
            if id == npc then return true end
        end
        return false
    end
    -- Rough Arrow (2512), Light Shot (2516), Tough Jerky (117), Coarse Thread (2320): their
    -- vendors on the Alliance side are in the list.
    for kind, item in pairs({ arrows = 2512, bullets = 2516, food = 117, trade = 2320 }) do
        T.ok(Dir:Best(kind), "nobody sells " .. kind)
        T.ok(#Dir:Ids(kind) > 10, kind .. ": too few vendors")
        for _, npc in ipairs(Ding.Data:ItemVendors(item)) do
            local friendly = side(npc)
            if (friendly == "A" or friendly == "AH") and not listed(kind, npc) then
                local sub = NpcDB.GetRaw(npc, "subName") or ""
                T.ok(sub:find("Smokywood", 1, true) or sub:find("Darkmoon", 1, true), kind .. ": " .. npc .. " left out")
            end
        end
    end
    -- Deadly Poison (2892) is not food: its vendors are listed only when they sell food too.
    for _, npc in ipairs(Ding.Data:ItemVendors(2892)) do
        if listed("food", npc) then T.ok(sells(npc, 117) or sells(npc, 159) or sells(npc, 4540), "a poison vendor as food") end
    end
    T.eq(Dir.GoodsKind({ class = 0, subClass = 0, flags = 64, requiredLevel = 20 }), nil, "a poison")
    T.eq(Dir.GoodsKind({ class = 0, subClass = 0, requiredLevel = 0 }), nil, "alcohol")
    T.eq(Dir.GoodsKind({ class = 0, subClass = 5, requiredLevel = 5 }), "food", "Forever's food")
    -- Every class reagent is a reagent item in DingDB.
    for class, items in pairs(Dir.REAGENTS) do
        for _, item in ipairs(items) do
            local info = Ding.Data:ItemInfo(item)
            T.ok(info and (info.class == 5 or (info.class == 15 and info.subClass == 1)), class .. ": " .. item .. " is not a reagent")
        end
    end
    -- A mage's reagents; a rogue's poisons.
    T.reset({ class = "MAGE", race = "Human", level = 20 })
    H.player.map, H.player.x, H.player.y = 1453, 50, 50
    T.ok(entry("reagents") and entry("reagents").best, "no reagent vendor for a mage")
    T.eq(entry("poisons"), nil)
    T.reset({ class = "ROGUE", race = "Human", level = 20 })
    H.player.map, H.player.x, H.player.y = 1453, 50, 50
    local poisons = entry("poisons")
    T.ok(poisons and poisons.best, "no poison vendor for a rogue")
    T.ok(sells(poisons.best.npc, 2930), "the poison vendor does not sell Essence of Pain")
end)

T.test("profession trainers by profession, from their subtitle", function()
    start(IRONFORGE)
    local e = entry("professions")
    T.eq(#e.choices, 12, "the twelve professions")
    for _, c in ipairs(e.choices) do
        local sub = NpcDB.GetRaw(c.best.npc, "subName")
        T.ok(sub and sub ~= "", c.kind .. ": no subtitle")
        local flags = NpcDB.npcFlags(c.best.npc)
        T.ok(math.floor(flags / 16) % 2 == 1, c.kind .. ": not a trainer")
    end
    T.eq(Dir:Label("profession:alchemy"), L.PROF_ALCHEMY)
end)

---------------------------------------------------------------------------
-- Weapons
---------------------------------------------------------------------------
local function weaponKinds()
    local out = {}
    for _, w in ipairs(Dir:WeaponsToLearn()) do out[w.kind] = true end
    return out
end

T.test("weapons: by weapon, only what the class can use and does not know (hunter guns, both sides)", function()
    start(IRONFORGE)
    local learn = weaponKinds()
    T.ok(learn["weapon:46"], "guns not offered to a hunter")
    T.ok(not learn["weapon:54"], "maces offered to a hunter")
    T.ok(not learn["weapon:229"], "polearms before level 20")
    T.eq(Dir:Best("weapon:46").npc, BULIWYF, "Alliance guns: Buliwyf Stonehand")
    T.eq(Dir:Place(Dir:Best("weapon:46").point), "Ironforge")
    -- Known by its spell, or by the skill line's name.
    H.learnSpell(266)
    Dir:Forget()
    T.ok(not weaponKinds()["weapon:46"], "guns still offered once known (spell)")
    H.learnSpell(266, false)
    H.setSkillLines({ L.WEAPON_GUNS, L.WEAPON_BOWS })
    Dir:Forget()
    local now = weaponKinds()
    T.ok(not now["weapon:46"] and not now["weapon:45"], "guns or bows offered once in the skill lines")
    T.ok(now["weapon:226"], "crossbows not offered")
    -- Level 20: polearms (Woo Ping, Stormwind).
    H.player.level = 20
    Dir:Forget()
    T.ok(weaponKinds()["weapon:229"], "polearms at level 20")
    T.eq(Dir:Best("weapon:229").npc, 11867)
    -- Horde: Ansekhwa, Thunder Bluff.
    start(THUNDER_BLUFF)
    T.eq(Dir:Best("weapon:46").npc, ANSEKHWA, "Horde guns: Ansekhwa")
    T.eq(Dir:Place(Dir:Best("weapon:46").point), "Thunder Bluff")
    -- A mage: no guns, but daggers, staves, swords.
    T.reset({ class = "MAGE", race = "Human" })
    H.player.map, H.player.x, H.player.y = 1453, 50, 50
    local mage = weaponKinds()
    T.ok(not mage["weapon:46"] and mage["weapon:173"] and mage["weapon:136"] and mage["weapon:43"], "a mage's weapons")
end)

T.test("weapons: DingDB knows what each weapon master teaches", function()
    start(IRONFORGE)
    local skills = {}
    for _, s in ipairs(Ding.Data:NpcWeaponSkills(BULIWYF)) do skills[s] = true end
    T.ok(skills[46] and skills[44] and skills[54], "Buliwyf: guns, axes, maces")
    skills = {}
    for _, s in ipairs(Ding.Data:NpcWeaponSkills(BIXI)) do skills[s] = true end
    T.ok(skills[226] and skills[173] and skills[176] and not skills[46], "Bixi: crossbows, daggers, thrown")
    T.eq(LibDingDB.Get("npc", BULIWYF).weaponSkills[2], 46, "LibDingDB")
    local gun = LibDingDB.Get("item", 2516)
    T.eq(gun.class, 6, "Light Shot: a projectile")
    T.eq(gun.subClass, 3, "Light Shot: a bullet")
end)

---------------------------------------------------------------------------
-- Cities
---------------------------------------------------------------------------
T.test("cities: the player's capitals and the neutral towns; a city's categories and NPCs", function()
    start(IRONFORGE)
    local names = {}
    for _, c in ipairs(Dir:Cities()) do names[#names + 1] = c.name end
    T.eq(table.concat(names, ","), "Stormwind City,Ironforge,Darnassus,Booty Bay,Gadgetzan,Ratchet,Everlook")
    local IF = Dir:City("ironforge")
    local within = Dir:CityNpcs(IF)
    T.ok(within[BULIWYF] and within[BIXI], "Ironforge's weapon masters")
    local weapons = entry("weapons", within)
    T.ok(weapons, "no weapon masters in Ironforge")
    for _, c in ipairs(Dir:CityList(IF, Dir:Category("weapons"))) do
        T.ok(c.best.npc == BULIWYF or c.best.npc == BIXI, c.label .. " outside Ironforge")
    end
    local banks = Dir:CityList(IF, Dir:Category("bank"))
    T.ok(#banks >= 2, "Ironforge's bankers")
    T.eq(banks[1].offers, L.DIR_BANK)
    -- Booty Bay: neutral, around its inn.
    local BB = Dir:City("bootybay")
    local bay = Dir:CityNpcs(BB)
    T.ok(bay[6807] and bay[2672], "Booty Bay's innkeeper and its tailoring supplier up the hill")
    T.ok(not bay[2704], "Orgrimmar's weapon master in Booty Bay")
    -- Horde: their capitals, no Alliance NPC.
    start(THUNDER_BLUFF)
    names = {}
    for _, c in ipairs(Dir:Cities()) do names[#names + 1] = c.name end
    T.eq(table.concat(names, ","), "Orgrimmar,Thunder Bluff,Undercity,Booty Bay,Gadgetzan,Ratchet,Everlook")
    for _, e in ipairs(Dir:Entries(Dir:CityNpcs(BB))) do
        T.ok(side(e.best.npc) ~= "A", "an Alliance NPC for the Horde in Booty Bay")
    end
end)

---------------------------------------------------------------------------
-- The window
---------------------------------------------------------------------------
T.test("gamepad: tabs with LB / RB, A opens a list or starts a trip, B goes back", function()
    start(IRONFORGE)
    F:Toggle(); H.flush()
    T.ok(F.frame:IsShown(), "the directory does not open")
    local map = H.overrides[F.frame]
    for _, key in ipairs({ "PADDUP", "PADDDOWN", "PAD1", "PAD2", "PADLSHOULDER", "PADRSHOULDER" }) do
        T.ok(map and map[key], key .. " not taken")
    end
    T.eq(F.tab, 1)
    T.eq(F.rows[1].label, L.FINDER_VENDOR, "Nearby starts with the vendor:\n" .. screen())
    -- Each action once: A on the focused row, B on the close cross, LB / RB on the tabs.
    T.ok(F.frame.rows[1].key:IsShown(), "no A on the focused row")
    T.ok(not F.frame.rows[2].key:IsShown(), "A on a row without the focus")
    T.ok(F.frame.back:IsShown() and F.frame.lb:IsShown() and F.frame.rb:IsShown(), "B, LB or RB missing")
    T.eq(F.frame.help.items[1].label:GetText(), L.DIR_TIMES)
    -- Weapon masters: a list by weapon.
    local i = rowIndex(L.DIR_WEAPONS)
    T.ok(i and F.rows[i].caret, "no weapon masters row")
    for _ = 1, i - 1 do H.press("PADDDOWN") end
    T.eq(F:Page().focus, i)
    H.press("PAD1")
    T.eq(F:Page().kind, "choices")
    T.ok(F.frame.pageTitle:IsShown() and F.frame.pageTitle.key:IsShown(), "no list title with B")
    T.ok(not F.frame.back:IsShown(), "B on the close cross inside a list")
    local guns = rowIndex(L.WEAPON_GUNS)
    T.ok(guns, "no guns:\n" .. screen())
    T.eq(F.rows[guns].sub, "Buliwyf Stonehand · Ironforge")
    H.press("PAD2")
    T.eq(F:Page().kind, "nearby", "B does not go back")
    -- Cities with RB, a city, its categories.
    H.press("PADRSHOULDER")
    T.eq(F.tab, 2)
    T.eq(F.rows[2].label, "Ironforge")
    H.press("PADDDOWN"); H.press("PAD1")
    T.eq(F:Page().kind, "city")
    T.eq(F.frame.pageTitle.label:GetText(), "Ironforge")
    H.press("PADLSHOULDER")
    T.eq(F.tab, 1, "LB")
    T.eq(F:Page().focus, 1)
    -- A on Guns: the trip, the window closes, its keys go.
    for _ = 1, i - 1 do H.press("PADDDOWN") end
    H.press("PAD1")
    for _ = 1, guns - 1 do H.press("PADDDOWN") end
    H.press("PAD1")
    T.ok(not F.frame:IsShown() and H.overrides[F.frame] == nil, "window or keys left after the trip starts")
    T.ok(F.trip and F.trip.npc == BULIWYF and F.trip.label == L.WEAPON_GUNS, "no trip to Buliwyf")
    A.point = nil; A:Tick()
    T.eq(A.point.npc, BULIWYF, "the arrow does not go to Buliwyf")
end)

T.test("trip: the guide window says it; the NPC's window ends it; B or the trip line cancel it", function()
    start(IRONFORGE)
    T.ok(F:Go("bank"))
    local trip = F.trip
    local row
    for _, r in ipairs(P.rowsShown or {}) do if r.action == "trip" then row = r end end
    T.ok(row, "no trip line in the guide window")
    T.ok(H.plain(row.text):find(L.FINDER_TRIP:format(trip.name, L.DIR_BANK), 1, true), H.plain(row.text))
    T.eq(row.sub, L.DIR_TRIP_PAD:format(Ding.Gamepad:ButtonName("PAD1")))
    -- Another NPC's dialogue does not end it; the bank window of an unknown NPC does.
    H.talk({ id = 295 }); H.closeDialog()
    T.ok(F.trip, "another NPC's gossip ended the trip")
    H.setNpcName(nil)
    H.fire("BANKFRAME_OPENED"); H.flush()
    T.eq(F.trip, nil, "the bank window does not end the trip")
    -- The NPC by its id: its gossip ends it.
    F:Go("weapon:46")
    H.talk({ id = BULIWYF }); H.closeDialog()
    T.eq(F.trip, nil, "talking to Buliwyf does not end the trip")
    -- B on the directory's first page cancels; a right click only closes.
    F:Go("vendor")
    F:Open(); H.flush()
    T.eq(F.rows[1].label, L.FINDER_BACK, "no way back to the guide")
    click(F.frame.rows[2], "RightButton")
    T.ok(not F.frame:IsShown() and F.trip, "a right click ended the trip")
    F:Open(); H.flush()
    H.press("PAD2")
    T.eq(F.trip, nil, "B does not end the trip")
    -- The trip line: A in focus mode (or a click) takes the arrow back.
    F:Go("vendor")
    P:StartFocus(); H.flush()
    for i, r in ipairs(P.rowsShown) do if r.action == "trip" then P.focusIndex = i end end
    H.press("PAD1")
    T.eq(F.trip, nil, "A on the trip line does not end it")
    P:StopFocus()
end)

T.test("mouse: no chips, clicks open and go, right click and Esc go back, the wheel scrolls", function()
    start(IRONFORGE)
    H.setGamepadConnected(false)
    F:Open(1); H.flush()
    T.ok(not F.frame.rows[1].key:IsShown() and not F.frame.back:IsShown() and not F.frame.lb:IsShown(), "chips without a gamepad")
    T.eq(F.frame.help.items[1].label:GetText(), L.FINDER_MOUSE)
    T.ok(#F.rows > 9, "a hunter's list scrolls")
    F.frame.list.scripts.OnMouseWheel(F.frame.list, -1)
    T.eq(F.offset, 1, "the wheel does not scroll")
    click(F.frame.tabs[2])
    T.eq(F.tab, 2, "a click on the Cities tab")
    click(F.frame.rows[2])
    T.eq(F:Page().kind, "city")
    T.eq(F.frame.help.items[1].label:GetText(), L.DIR_MOUSE_PAGE)
    F.frame.scripts.OnKeyDown(F.frame, "ESCAPE"); H.flush()
    T.eq(F:Page().kind, "cities", "Esc does not go back")
    click(F.frame.rows[2]); click(F.frame.pageTitle)
    T.eq(F:Page().kind, "cities", "the list's title does not go back")
    click(F.frame.rows[2])
    local bank = rowIndex(L.DIR_BANK)
    click(F.frame.rows[bank])
    T.eq(F:Page().kind, "citylist")
    click(F.frame.rows[1])
    T.ok(F.trip and F.trip.kind == "bank" and not F.frame:IsShown(), "a click does not go to the banker")
    -- Plugging a gamepad in: the chips come.
    F:Open(); H.flush()
    H.setGamepadConnected(true)
    H.fire("GAME_PAD_CONNECTED"); H.flush()
    T.ok(F.frame.rows[1].key:IsShown(), "no chip once a gamepad is plugged in")
    F:Close(); H.flush()
    T.ok(not InCombatLockdown())
    H.setCombat(true)
    T.ok(not F:Open(), "the directory opens in combat")
    H.setCombat(false)
end)

T.test("the guide window's button opens it; in focus mode it is above the first row", function()
    start(IRONFORGE)
    local button = P.frame.finder
    T.ok(button:IsShown(), "no directory button in the guide window")
    click(button)
    T.ok(F.frame:IsShown(), "the button does not open the directory")
    click(button)
    T.ok(not F.frame:IsShown(), "the button does not close it")
    P:StartFocus(); H.flush()
    P.focusIndex = 1; P:Update()
    H.press("PADDUP")
    T.eq(P.focusIndex, 0, "D-pad up from the first row does not reach the button")
    T.ok(button.focus.ring:IsShown() and P.frame.finder.key:IsShown(), "the button shows neither focus nor A")
    H.press("PADDDOWN")
    T.eq(P.focusIndex, 1)
    H.press("PADDUP"); H.press("PAD1")
    T.ok(F.frame:IsShown() and not P.focusing, "A on the button does not open the directory")
    F:Close(); H.flush()
end)

---------------------------------------------------------------------------
-- /ding find
---------------------------------------------------------------------------
T.test("/ding find: a weapon, a name, a service; nothing found; no text", function()
    start(IRONFORGE)
    SlashCmdList.DING("find gun"); H.flush()
    T.ok(F.frame:IsShown() and F:Page().kind == "search", "no search page")
    T.eq(F.frame.pageTitle.label:GetText(), L.DIR_SEARCH_TITLE:format("gun"))
    local guns = rowIndex(L.WEAPON_GUNS)
    T.ok(guns, "gun does not find Guns:\n" .. screen())
    T.eq(F.rows[guns].sub, "Buliwyf Stonehand · Ironforge")
    SlashCmdList.DING("find Buliwyf"); H.flush()
    T.eq(F.rows[1].label, "Buliwyf Stonehand", screen())
    T.ok(F.rows[1].sub:find(L.WEAPON_GUNS, 1, true) and F.rows[1].sub:find("Ironforge", 1, true), F.rows[1].sub)
    T.ok(not F.rows[1].sub:find(L.WEAPON_MACES, 1, true), "a hunter is told about maces")
    H.press("PAD1")
    T.ok(F.trip and F.trip.npc == BULIWYF, "A on a name does not go there")
    F:Cancel()
    SlashCmdList.DING("find BANK"); H.flush()
    T.eq(F.rows[1].label, L.DIR_BANK, screen())
    T.eq(Dir:Place(F.rows[1].entry.point), "Ironforge")
    H.press("PAD2")
    T.eq(F:Page().kind, "nearby", "B goes back to the Nearby tab")
    SlashCmdList.DING("find zzzz"); H.flush()
    T.eq(F.rows[1].label, L.DIR_SEARCH_NONE:format("zzzz"))
    T.ok(F.rows[1].dim)
    F:Close(); H.flush()
    T.ok(not F:Find(""), "an empty search opens the window")
    T.ok(not F.frame:IsShown())
    -- Trainer: the class trainer and the profession trainers' list.
    local results = Dir:Search("trainer")
    local kinds = {}
    for _, r in ipairs(results) do kinds[r.category and r.category.key or r.kind] = true end
    T.ok(kinds.trainer and kinds.professions, "trainer finds neither the class nor the profession trainers")
end)

---------------------------------------------------------------------------
-- The weapon reminder
---------------------------------------------------------------------------
local function reminder()
    for _, r in ipairs(P.rowsShown or {}) do
        if r.action == "weapon" then return r end
    end
end

T.test("weapon reminder: a gun in the bags, a weapon master close by; its option; A goes", function()
    start({ class = "HUNTER", race = "Dwarf", map = 1426, x = 47, y = 52 })
    P:Update()
    T.eq(reminder(), nil, "a reminder far from any weapon master, nothing in the bags")
    H.setItemInfo(950101, { name = "Old Blunderbuss", classID = 2, subclassID = 3, equipLoc = "INVTYPE_RANGED" })
    H.putInBag(0, 3, 950101)
    H.fire("BAG_UPDATE_DELAYED"); H.flush()
    P:Update()
    local row = reminder()
    T.ok(row, "no reminder for a gun in the bags")
    T.eq(H.plain(row.text), L.WEAPON_TO_LEARN:format(L.WEAPON_GUNS, "Buliwyf Stonehand", "Ironforge"))
    -- Known: gone.
    H.learnSpell(266)
    H.fire("LEARNED_SPELL_IN_TAB"); H.flush()
    P:Update()
    T.eq(reminder(), nil, "the reminder stays once guns are known")
    -- Next to Buliwyf: the weapons he could teach.
    H.player.map, H.player.x, H.player.y = 1455, 60.5, 88
    Dir:Forget()
    P:Update()
    row = reminder()
    T.ok(row and H.plain(row.text):find("Buliwyf Stonehand", 1, true), "no reminder next to Buliwyf")
    T.ok(H.plain(row.text):find(L.WEAPON_AXES, 1, true), H.plain(row.text))
    -- A (a click) goes there.
    P:Aim(row)
    T.ok(F.trip and F.trip.npc == BULIWYF, "the reminder does not send the arrow")
    F:Cancel()
    -- The option, in the Guide tab.
    Ding.Config:Open("guide"); H.flush()
    local found
    for _, r in ipairs(Ding.Config.TABS[Ding.Config.TAB.guide].rows) do
        if r.opts and r.opts.label == L.OPT_WEAPON_REMINDER then found = r end
    end
    T.ok(found, "no option in the Guide tab")
    found.opts.set(false)
    Ding.Config:Close(); H.flush()
    Dir:Forget()
    P:Update()
    T.eq(reminder(), nil, "the reminder shows with its option off")
    T.eq(Ding.DEFAULTS.panel.weaponReminder, true, "on by default")
    Ding.db.panel.weaponReminder = true
    H.clearItems()
end)

T.run()
