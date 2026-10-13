-- The NPC directory on a French client: the window's texts, NPC names from DingDB in French,
-- and /ding find in French (with or without accents) or in English.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "frFR" })
local Ding, H = T.Ding, T.H
local E, P, L, F, Dir = Ding.Engine, Ding.Panel, Ding.L, Ding.Finder, Ding.Directory

Ding.RegisterGuide({ id = "t-annuaire", title = "Annuaire", steps = { { accept = 456 }, { level = 60 } } })

local function start(opts)
    H.closeDialog()
    T.reset({ level = 12, class = opts.class or "HUNTER", race = opts.race or "Dwarf", faction = "Alliance" })
    H.player.map, H.player.x, H.player.y = opts.map, opts.x, opts.y
    H.setGamepadConnected(true)
    E:SetGuide("t-annuaire", 1, true); H.flush()
    H.tick(1)
end

local function rowIndex(label)
    for i, r in ipairs(F.rows or {}) do
        if r.label == label then return i end
    end
end

T.test("the window in French", function()
    start({ map = 1455, x = 55, y = 50 })
    F:Open(1); H.flush()
    T.eq(H.plain(F.frame.title:GetText()), "Ding! · Annuaire")
    T.eq(F.frame.tabs[1].label:GetText(), "À proximité")
    T.eq(F.frame.tabs[2].label:GetText(), "Villes")
    T.eq(F.rows[1].label, "Marchand")
    T.ok(rowIndex("Maîtres d'armes") and rowIndex("Banque") and rowIndex("Maître des écuries"), "French categories")
    F:Close(); H.flush()
end)

T.test("/ding find in French, without accents, or in English", function()
    start({ map = 1455, x = 55, y = 50 })
    for _, text in ipairs({ "arme à feu", "ARMES A FEU", "gun" }) do
        SlashCmdList.DING("find " .. text); H.flush()
        local i = rowIndex("Armes à feu")
        T.ok(i, text .. " does not find Armes à feu")
        T.eq(F.rows[i].sub, "Buliwyf Stonehand · Ironforge")
    end
    SlashCmdList.DING("find banque"); H.flush()
    T.eq(F.rows[1].label, "Banque")
    -- NPC names in French (DingDB's frFR names): Goldshire's innkeeper.
    start({ class = "WARRIOR", race = "Human", map = 1429, x = 43.2, y = 65.6 })
    SlashCmdList.DING("find farley"); H.flush()
    T.eq(F.rows[1].label, "Aubergiste Farley")
    T.ok(F.rows[1].sub:find("Aubergiste", 1, true), F.rows[1].sub)
    F:Close(); H.flush()
end)

T.test("the weapon reminder in French", function()
    start({ map = 1426, x = 47, y = 52 })
    H.setItemInfo(950102, { name = "Tromblon", classID = 2, subclassID = 3, equipLoc = "INVTYPE_RANGED" })
    H.putInBag(0, 3, 950102)
    H.fire("BAG_UPDATE_DELAYED"); H.flush()
    P:Update()
    local found
    for _, r in ipairs(P.rowsShown or {}) do
        if r.action == "weapon" then found = H.plain(r.text) end
    end
    T.eq(found, "Arme à apprendre : Armes à feu — Buliwyf Stonehand, Ironforge")
    H.clearItems()
end)

T.run()
