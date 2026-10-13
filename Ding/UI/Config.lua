-- Settings window (screen 03 of docs/UI-handoff.md, DingConfigFrame): title bar, six tabs
-- by intent (Guide, Route, Automation, Arrow and maps, Keybinds, Appearance), content in
-- titled blocks, long lists on a page of their own, rarely used rows folded, and a footer of
-- gamepad hints. Driven entirely with the gamepad: while it is open (out of combat only),
-- Ding.Gamepad routes A/B/Y, LB/RB and the D-pad here through temporary override
-- bindings. Settings apply live; their saved keys never depend on where they are shown.
local _, Ding = ...
local L = Ding.L
local UI = Ding.UI
local C = UI.C

local Cfg = {}
Ding.Config = Cfg

local WIDTH, HEIGHT = 560, 440
local TITLE_HEIGHT, TABS_HEIGHT, FOOTER_HEIGHT = 32, 36, 32
local CONTENT_TOP = TITLE_HEIGHT + 1 + TABS_HEIGHT + 1
local CONTENT_HEIGHT = HEIGHT - CONTENT_TOP - FOOTER_HEIGHT - 1

local function G() return Ding.Gamepad end
local function percent(v) return ("%d %%"):format(v) end

---------------------------------------------------------------------------
-- Actions shared by several rows
---------------------------------------------------------------------------
local function refreshAll()
    if Ding.Panel.frame then Ding.Panel:Update() end
    if Ding.Arrow.frame then Ding.Arrow:Update() end
    if Ding.ItemButton.button then Ding.ItemButton:Update() end
    if Ding.Minimap then Ding.Minimap:Update() end
    Cfg:RefreshRows()
end

local function timingCounts()
    local samples, steps = 0, 0
    for _, guide in pairs(Ding.db.timings) do
        for _, list in pairs(guide) do
            steps = steps + 1
            samples = samples + #list
        end
    end
    return samples, steps
end

local function applyAllSettings()
    local P, A = Ding.Panel, Ding.Arrow
    if P.frame then
        P.frame:SetScale(Ding.db.panel.scale)
        P:ApplyPosition()
    end
    if A.frame then
        A:ApplySize()
        A:ApplyPosition()
        A:ApplyStyle()
        A.point = nil
    end
    Ding.QuestMobs:Apply()
    refreshAll()
end

---------------------------------------------------------------------------
-- Tab contents. Each builder gets (canvas, width) and returns the rows, top to bottom.
---------------------------------------------------------------------------
-- Pack shown in the first dropdown: the active section's, else the character's, else the one
-- Ding would start for the character (Leveling, else Zones).
local function activePack()
    local guide = Ding.Engine.guide
    if guide then return guide.pack end
    local saved = Ding.char.pack
    if Ding:GetGuidePack(saved) then return saved end
    local suggested = Ding:SuggestGuide()
    return suggested and suggested.pack or Ding.BUILTIN_PACK
end

-- Levels covered by a pack's sections (only those for the character: matching), or nil.
local function packLevels(packId, matching)
    local low, high
    for _, guide in Ding:IterateGuides(packId) do
        if not matching or Ding:GuideMatchesPlayer(guide) then
            low = math.min(low or guide.minLevel, guide.minLevel)
            high = math.max(high or guide.maxLevel, guide.maxLevel)
        end
    end
    return low, high
end

-- A pack in the first dropdown: greyed when it has no section for the character (it can
-- still be picked).
local function packItem(pack, current)
    local low, high = packLevels(pack.id, true)
    local fits = low ~= nil
    if not fits then low, high = packLevels(pack.id, false) end
    local levels = L.GUIDE_RANGE:format(low, high)
    local detail = pack.builtin and L.PACK_BUILTIN or pack.imported and L.PACK_IMPORTED
        or (pack.author and L.PACK_BY:format(pack.author))
    detail = detail and (detail .. " · " .. levels) or levels
    if not fits then detail = detail .. " · " .. L.GUIDE_OTHER_CHAR end
    return {
        value = pack.id, text = pack.title, levels = levels, detail = detail,
        dim = not fits, current = pack.id == current,
    }
end

-- Guide packs for the first dropdown, grouped by what they are for (Ding.GUIDE_CATEGORIES,
-- leveling first) under headers that cannot be picked; empty groups are left out. In a
-- group: Ding's built-in guide, then the community packs by title.
local function allPacks()
    local groups = {}
    for _, pack in ipairs(Ding:GuidePacks()) do
        local category = pack.category or "leveling"
        groups[category] = groups[category] or {}
        table.insert(groups[category], pack)
    end
    local items = {}
    local current = activePack()
    for _, category in ipairs(Ding.GUIDE_CATEGORIES) do
        if groups[category] then
            items[#items + 1] = { header = true, text = L["CATEGORY_" .. category:upper()] }
            for _, pack in ipairs(groups[category]) do items[#items + 1] = packItem(pack, current) end
        end
    end
    return items
end

-- Sections of the active pack for the second dropdown: the ones for another character, or
-- above the character's level, are greyed (they can still be picked).
local function packSections()
    local items = {}
    local active = Ding.Engine.guide
    local level = UnitLevel("player")
    for id, guide in Ding:IterateGuides(activePack()) do
        local levels = L.GUIDE_RANGE:format(guide.minLevel, guide.maxLevel)
        local detail, dim = levels, false
        if not Ding:GuideMatchesPlayer(guide) then
            detail, dim = levels .. " · " .. L.GUIDE_OTHER_CHAR, true
        elseif guide.minLevel > level then
            detail, dim = levels .. " · " .. L.GUIDE_LEVEL_MIN:format(guide.minLevel), true
        end
        items[#items + 1] = {
            value = id, text = guide.title, levels = levels, detail = detail,
            dim = dim, current = active and active.id == id,
        }
    end
    return items
end

---------------------------------------------------------------------------
-- Shared pieces: "Defaults for this tab", "More options", pages
---------------------------------------------------------------------------
-- The saved settings each tab shows ("Defaults for this tab" puts them back). The keys
-- never change: only where they are shown.
local TAB_SETTINGS = {
    guide = { { "panel", "shown" }, { "panel", "preview" }, { "panel", "weaponReminder" } },
    route = { { "ui", "hearth" }, { "ui", "deathSkip" }, { "ui", "elites" }, { "ui", "dungeons" },
        { "ui", "dungeonChoice" }, { "ui", "trainerSteps" }, { "ui", "flightSteps" }, { "ui", "serviceSteps" } },
    automation = { { "ui", "autoAccept" }, { "ui", "autoTurnin" }, { "ui", "chooseReward" }, { "ui", "skipGrey" },
        { "ui", "sellGrey" }, { "ui", "repair" }, { "ui", "autoEquip" }, { "ui", "autoFly" } },
    arrow = { { "arrow", "shown" }, { "arrow", "style" }, { "arrow", "size" }, { "arrow", "loop" },
        { "arrow", "worldMap" }, { "minimap", "pins" }, { "ui", "markTarget" }, { "ui", "mobIcons" },
        { "ui", "mobTooltip" }, { "ui", "farPlates" }, { "arrow", "tomtom" }, { "arrow", "mode" } },
    appearance = { { "panel", "bgAlpha" }, { "panel", "scale" }, { "panel", "locked" },
        { "panel", "compactInCombat" }, { "panel", "hideInInstance" }, { "panel", "itemButton" },
        { "minimap", "shown" }, { "ui", "sound" }, { nil, "debug" } },
}
Cfg.TAB_SETTINGS = TAB_SETTINGS

local function copy(v)
    if type(v) ~= "table" then return v end
    local t = {}
    for k, x in pairs(v) do t[k] = copy(x) end
    return t
end

function Cfg:TabDefaults(key)
    for _, s in ipairs(TAB_SETTINGS[key] or {}) do
        local section, name = s[1], s[2]
        if section then
            Ding.db[section][name] = copy(Ding.DEFAULTS[section][name])
        else
            Ding.db[name] = copy(Ding.DEFAULTS[name])
        end
    end
    if key == "automation" then Ding.char.talentBuild = nil end
    if key == "arrow" and not Ding.db.arrow.tomtom then Ding.TomTom:Clear() end
    if key == "guide" then Ding.Panel:SetShown(Ding.db.panel.shown) end
    applyAllSettings()
    Ding.Engine:Update()
    Ding:Print(L.TAB_DEFAULTS_DONE)
end

local function defaultsRow(canvas, width, key)
    return UI.ButtonRow(canvas, Cfg, {
        label = L.TAB_DEFAULTS, button = L.RESET_BTN, confirm = true,
        run = function() Cfg:TabDefaults(key) end,
    }, width)
end

-- Rarely used rows, folded under "More options" (per tab, for the session).
Cfg.unfolded = {}
local function foldRow(canvas, width, key, label)
    return UI.FoldRow(canvas, Cfg, {
        label = label or L.MORE_OPTIONS, labelOpen = label or L.FEWER_OPTIONS,
        get = function() return Cfg.unfolded[key] == true end,
        set = function(v)
            Cfg.unfolded[key] = v and true or nil
            Cfg:Rebuild()
        end,
    }, width)
end
local function unfolded(key) return Cfg.unfolded[key] == true end

---------------------------------------------------------------------------
-- Guide: the guide and its section, taking it up again, the window, the next steps
---------------------------------------------------------------------------
-- Quest log cleanup: the quests of the log the guide never uses, to abandon from the game's
-- quest log when it gets full. Ding only lists them, on a page of their own (A or a click:
-- the quest's card): it never selects nor abandons a quest of the game's log (taint).
local function cleanupPage(canvas, width)
    local rows = { UI.InfoRow(canvas, L.CLEANUP_INFO, width) }
    for _, q in ipairs(Ding.Engine:UnusedLogQuests()) do
        local level = Ding.Data:QuestLevel(q)
        local row
        row = UI.ButtonRow(canvas, Cfg, {
            label = Ding.Data:QuestName(q), button = L.CLEANUP_CARD,
            desc = level > 0 and L.CLEANUP_DESC:format(level) or L.CLEANUP_DESC_NOLEVEL,
            run = function() Ding.Panel:ShowQuest({ quest = q, noAim = true }, row) end,
        }, width)
        rows[#rows + 1] = row
    end
    return rows
end

local CLEANUP_PAGE = {
    key = "cleanup", title = L.CLEANUP, build = cleanupPage,
    signature = function() return table.concat(Ding.Engine:UnusedLogQuests(), ",") end,
}

-- The guide window's "log almost full" notice (A or a click): straight to that page.
function Cfg:OpenCleanup()
    self:Open("guide")
    if self.frame and self.frame:IsShown() then self:OpenPage(CLEANUP_PAGE) end
end

-- Guides as text (Core/Import.lua): import one, export the active one, delete the imported
-- ones. The window closes the settings; closing it comes back to this page.
local IMPORTED_PAGE
local function backToImported()
    Cfg:Open("guide")
    Cfg:OpenPage(IMPORTED_PAGE)
end

local function importedPage(canvas, width)
    local rows = {
        UI.ButtonRow(canvas, Cfg, {
            label = L.IMPORT_ROW, desc = L.IMPORT_ROW_DESC, button = L.IMPORT_BUTTON,
            run = function() Ding.ImportWindow:Open("import", nil, backToImported) end,
        }, width),
        UI.ButtonRow(canvas, Cfg, {
            label = L.EXPORT_ROW, desc = L.EXPORT_ROW_DESC, button = L.EXPORT_BUTTON,
            run = function() Ding.ImportWindow:Open("export", nil, backToImported) end,
        }, width),
        UI.HeaderRow(canvas, L.IMPORTED_LIST, width),
    }
    local list = Ding.Import:List()
    if #list == 0 then rows[#rows + 1] = UI.InfoRow(canvas, L.IMPORTED_NONE, width) end
    for _, entry in ipairs(list) do
        rows[#rows + 1] = UI.ButtonRow(canvas, Cfg, {
            label = entry.title, button = L.IMPORTED_DELETE, confirm = true,
            desc = L.IMPORTED_DESC:format(entry.steps, L["CATEGORY_" .. entry.category:upper()] or entry.category, entry.id),
            run = function()
                Ding.Import:Delete(entry.id)
                Cfg:OpenPage(IMPORTED_PAGE)
            end,
        }, width)
    end
    return rows
end

IMPORTED_PAGE = {
    key = "imported", title = L.IMPORTED_HEADER, build = importedPage,
    signature = function()
        local ids = { "imported" }
        for _, entry in ipairs(Ding.Import:List()) do ids[#ids + 1] = entry.id end
        return table.concat(ids, ",")
    end,
}

local function guideRows(canvas, width)
    local panel, P = Ding.db.panel, Ding.Panel
    local rows = {
        UI.HeaderRow(canvas, L.ACTIVE_GUIDE, width),
        UI.DropdownRow(canvas, Cfg, {
            label = L.ACTIVE_GUIDE,
            items = allPacks,
            get = activePack,
            set = function(id)
                Ding.Engine:SetPack(id)
                Cfg:RefreshRows()
            end,
        }, width),
        UI.HeaderRow(canvas, L.GUIDE_SECTION, width),
        UI.DropdownRow(canvas, Cfg, {
            label = L.GUIDE_SECTION, empty = L.GUIDE_NONE,
            items = packSections,
            get = function() return Ding.Engine.guide and Ding.Engine.guide.id end,
            set = function(id)
                local active = Ding.Engine.guide
                if active and active.id == id then return end
                Ding.Engine:Resume(id)
                Cfg:RefreshRows()
            end,
        }, width),
        UI.ButtonRow(canvas, Cfg, {
            label = L.RESTART, desc = L.RESTART_DESC, button = L.RESTART_BTN, confirm = true,
            run = function() Ding.Engine:Reset() end,
        }, width),
        UI.HeaderRow(canvas, L.HEADER_WINDOW, width),
        -- The guide window and its arrow (closed with the window's close button).
        UI.CheckRow(canvas, Cfg, {
            label = L.SHOW_GUIDE,
            get = function() return panel.shown end,
            set = function(v) P:SetShown(v) end,
        }, width),
        -- The next steps under the current one, dimmed: none to three.
        UI.SelectorRow(canvas, Cfg, {
            label = L.PREVIEW, default = 0,
            values = { { 0, L.PREVIEW_OFF }, { 1, "1" }, { 2, "2" }, { 3, "3" } },
            get = function() return panel.preview or 0 end,
            set = function(v)
                panel.preview = v
                P:Update()
            end,
        }, width),
        -- A weapon the class can use but does not know: its weapon master (Core/Directory.lua).
        UI.CheckRow(canvas, Cfg, {
            label = L.OPT_WEAPON_REMINDER, desc = L.OPT_WEAPON_REMINDER_DESC,
            get = function() return panel.weaponReminder end,
            set = function(v)
                panel.weaponReminder = v and true or false
                P:Update()
            end,
        }, width),
    }
    local function add(row) rows[#rows + 1] = row end
    -- Section wrap-up: "Stay in this section" was chosen; the choices come back on demand.
    local guide = Ding.Engine.guide
    if guide and Ding.char.stay and Ding.char.stay[guide.id] then
        add(UI.ButtonRow(canvas, Cfg, {
            label = L.WRAP_STAYING, button = L.WRAP_OFFER_BTN,
            run = function()
                Ding.char.stay[guide.id] = nil
                Ding.Panel:Update()
                Cfg:Rebuild()
            end,
        }, width))
    end
    add(UI.HeaderRow(canvas, L.CLEANUP, width))
    if #Ding.Engine:UnusedLogQuests() == 0 then
        add(UI.InfoRow(canvas, L.CLEANUP_NONE, width))
    else
        add(UI.PageRow(canvas, Cfg, {
            label = L.CLEANUP_ROW,
            value = function() return tostring(#Ding.Engine:UnusedLogQuests()) end,
            open = function() Cfg:OpenPage(CLEANUP_PAGE) end,
        }, width))
    end
    add(UI.HeaderRow(canvas, L.IMPORTED_HEADER, width))
    add(UI.PageRow(canvas, Cfg, {
        label = L.IMPORTED_ROW, desc = L.IMPORTED_ROW_DESC,
        value = function()
            local count = #Ding.Import:List()
            return count == 0 and L.IMPORTED_ZERO or L.IMPORTED_COUNT:format(count)
        end,
        open = function() Cfg:OpenPage(IMPORTED_PAGE) end,
    }, width))
    add(defaultsRow(canvas, width, "guide"))
    return rows
end

---------------------------------------------------------------------------
-- Route: what the guide makes you do
---------------------------------------------------------------------------
-- A guide step behind an option (Ding:StepApplies): the guide passes or takes it again.
local function stepOption(canvas, width, key, label, desc)
    local ui = Ding.db.ui
    return UI.CheckRow(canvas, Cfg, {
        label = label, desc = desc,
        get = function() return ui[key] end,
        set = function(v)
            ui[key] = v and true or false
            Ding.Engine:Update()
        end,
    }, width)
end

-- "Dungeon quests: 3 of 12", "All" or "Off" for the dungeons of the active guide.
local function dungeonSummary()
    local list, on = Ding.Engine:DungeonInfo(), 0
    for _, d in ipairs(list) do
        if Ding:DungeonWanted(d.name) then on = on + 1 end
    end
    if on == 0 then return L.DUNGEONS_OFF end
    if on == #list then return L.DUNGEONS_ALL end
    return L.DUNGEONS_SOME:format(on, #list)
end

-- The dungeons' page: All and None at the top, then one box per dungeon, by levels.
local function dungeonPage(canvas, width)
    local ui = Ding.db.ui
    local function setAll(v)
        ui.dungeons, ui.dungeonChoice = v, nil
        Ding.Engine:Update()
    end
    local rows = {
        UI.ButtonRow(canvas, Cfg, { label = L.DUNGEONS_EVERY, button = L.DUNGEONS_ALL, run = function() setAll(true) end }, width),
        UI.ButtonRow(canvas, Cfg, { label = L.DUNGEONS_NO, button = L.DUNGEONS_NONE, run = function() setAll(false) end }, width),
        UI.HeaderRow(canvas, L.DUNGEONS_BY_LEVEL, width),
    }
    for _, d in ipairs(Ding.Engine:DungeonInfo()) do
        local levels = d.min and (" " .. UI.Colored("secondary", L.GUIDE_RANGE:format(d.min, d.max))) or ""
        rows[#rows + 1] = UI.CheckRow(canvas, Cfg, {
            label = d.name .. levels,
            get = function() return Ding:DungeonWanted(d.name) end,
            set = function(v)
                ui.dungeonChoice = ui.dungeonChoice or {}
                ui.dungeonChoice[d.name] = v and true or false
                Ding.Engine:Update()
            end,
        }, width)
    end
    return rows
end

local function routeRows(canvas, width)
    local rows = {
        UI.HeaderRow(canvas, L.HEADER_TRAVEL, width),
        stepOption(canvas, width, "hearth", L.OPT_HEARTH, L.OPT_HEARTH_DESC),
        stepOption(canvas, width, "deathSkip", L.OPT_DEATHSKIP, L.OPT_DEATHSKIP_DESC),
        UI.HeaderRow(canvas, L.HEADER_GROUP, width),
        stepOption(canvas, width, "elites", L.OPT_ELITES, L.OPT_ELITES_DESC),
    }
    -- The guide's dungeons: one row, the list on its own page; without any, one box.
    if #Ding.Engine:DungeonInfo() > 0 then
        rows[#rows + 1] = UI.PageRow(canvas, Cfg, {
            label = L.OPT_DUNGEONS, desc = L.OPT_DUNGEONS_DESC,
            value = dungeonSummary,
            open = function() Cfg:OpenPage({ key = "dungeons", title = L.OPT_DUNGEONS, build = dungeonPage }) end,
        }, width)
    else
        rows[#rows + 1] = stepOption(canvas, width, "dungeons", L.OPT_DUNGEONS, L.OPT_DUNGEONS_DESC)
    end
    rows[#rows + 1] = UI.HeaderRow(canvas, L.HEADER_STOPS, width)
    rows[#rows + 1] = stepOption(canvas, width, "trainerSteps", L.OPT_TRAINER, L.OPT_TRAINER_DESC)
    rows[#rows + 1] = stepOption(canvas, width, "flightSteps", L.OPT_FLIGHT, L.OPT_FLIGHT_DESC)
    rows[#rows + 1] = stepOption(canvas, width, "serviceSteps", L.OPT_SERVICE, L.OPT_SERVICE_DESC)
    rows[#rows + 1] = defaultsRow(canvas, width, "route")
    return rows
end

-- The dungeon rows depend on the dungeons of the active guide.
local function routeSignature()
    local names = {}
    for _, d in ipairs(Ding.Engine:DungeonInfo()) do names[#names + 1] = d.name end
    return table.concat(names, "|")
end

---------------------------------------------------------------------------
-- Automation: what Ding does by itself
---------------------------------------------------------------------------
-- The talent build the window follows (Core/Talents.lua): the class's builds, or none. No
-- row at all when no build is registered for the class.
local function talentRow(canvas, width)
    local values = {}
    for _, b in ipairs(Ding.Talents:ForClass()) do values[#values + 1] = { b.id, b.title } end
    if #values == 0 then return nil end
    values[#values + 1] = { "off", L.TALENT_OFF }
    return UI.SelectorRow(canvas, Cfg, {
        label = L.TALENT_BUILD, desc = L.TALENT_BUILD_DESC,
        default = values[1][1],
        values = values,
        get = function()
            local active = Ding.Talents:Active()
            return active and active.id or "off"
        end,
        set = function(v)
            Ding.char.talentBuild = v
            Ding.Talents.armed = nil
            Ding.Panel:Update()
        end,
    }, width)
end

-- The talent builds offered depend on the class and on what was registered.
local function talentSignature()
    return tostring(Ding.Compat.PlayerClass()) .. ":" .. #Ding.Talents:ForClass()
end

local function automationRows(canvas, width)
    local ui = Ding.db.ui
    local function check(label, key, desc, after)
        return UI.CheckRow(canvas, Cfg, {
            label = label, desc = desc,
            get = function() return ui[key] end,
            set = function(v)
                ui[key] = v and true or false
                if after then after(ui[key]) end
            end,
        }, width)
    end
    local rows = {
        UI.HeaderRow(canvas, L.HEADER_QUESTS, width),
        check(L.AUTO_ACCEPT, "autoAccept"),
        check(L.AUTO_TURNIN, "autoTurnin"),
        check(L.CHOOSE_REWARD, "chooseReward", L.CHOOSE_REWARD_DESC),
        check(L.SKIP_GREY, "skipGrey", L.SKIP_GREY_DESC, function() Ding.Engine:Update() end),
        UI.HeaderRow(canvas, L.HEADER_MERCHANT, width),
        check(L.SELL_GREY, "sellGrey", L.SELL_GREY_DESC),
        check(L.AUTO_REPAIR, "repair"),
        UI.HeaderRow(canvas, L.HEADER_EQUIPMENT, width),
        check(L.AUTO_EQUIP, "autoEquip", L.AUTO_EQUIP_DESC, function(v) if v then Ding.Gear:AutoEquip() end end),
    }
    local talent = talentRow(canvas, width)
    if talent then rows[#rows + 1] = talent end
    rows[#rows + 1] = UI.HeaderRow(canvas, L.HEADER_FLIGHTS, width)
    rows[#rows + 1] = check(L.AUTO_FLY, "autoFly", L.AUTO_FLY_DESC)
    rows[#rows + 1] = defaultsRow(canvas, width, "automation")
    return rows
end

---------------------------------------------------------------------------
-- Arrow and maps
---------------------------------------------------------------------------
local function arrowRows(canvas, width)
    local db, A = Ding.db.arrow, Ding.Arrow
    local rows = {
        UI.HeaderRow(canvas, L.HEADER_ARROW, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.SHOW_ARROW,
            get = function() return db.shown end,
            set = function(v) db.shown = v; A:Update() end,
        }, width),
        UI.SelectorRow(canvas, Cfg, {
            label = L.ARROW_STYLE, default = "ding",
            values = { { "ding", L.ARROW_STYLE_DING }, { "classic", L.ARROW_STYLE_CLASSIC } },
            get = function() return db.style end,
            set = function(v) A:SetStyle(v) end,
        }, width),
        UI.SliderRow(canvas, Cfg, {
            label = L.ARROW_SIZE, min = 40, max = 80, step = 4, default = 56,
            format = function(v) return ("%d"):format(v) end,
            get = function() return db.size end,
            set = function(v) A:SetSize(v) end,
        }, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.FARM_LOOP_OPT, desc = L.FARM_LOOP_DESC,
            get = function() return db.loop ~= false end,
            set = function(v)
                db.loop = v and true or false
                A.farm, A.point = nil, nil
            end,
        }, width),
        UI.ButtonRow(canvas, Cfg, {
            label = L.MOVE_ARROW, button = L.MOVE_BTN,
            run = function() Cfg:StartMove(A:MoveTarget()) end,
        }, width),
        UI.HeaderRow(canvas, L.HEADER_MAPS, width),
        -- The arrow's target on the world map: the client's waypoint, else TomTom's pin.
        UI.CheckRow(canvas, Cfg, {
            label = L.WORLD_MARK,
            desc = Ding.Compat.HasUserWaypoint() and L.WORLD_MARK_DESC
                or (Ding.TomTom:Available() and L.WORLD_MARK_TOMTOM or L.WORLD_MARK_NONE),
            get = function() return db.worldMap ~= false end,
            set = function(v)
                db.worldMap = v and true or false
                A:MarkWorld(A.point)
            end,
        }, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.MINIMAP_PINS, desc = L.MINIMAP_PINS_DESC,
            get = function() return Ding.db.minimap.pins end,
            set = function(v) Ding.db.minimap.pins = v and true or false end,
        }, width),
        UI.HeaderRow(canvas, L.HEADER_TARGET, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.MARK_TARGET, desc = L.MARK_TARGET_DESC,
            get = function() return Ding.db.ui.markTarget end,
            set = function(v) Ding.db.ui.markTarget = v and true or false end,
        }, width),
        -- Quest monsters (UI/QuestMobs.lua): nameplates and tooltips.
        UI.HeaderRow(canvas, L.HEADER_QUEST_MOBS, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.MOB_ICONS, desc = L.MOB_ICONS_DESC,
            get = function() return Ding.db.ui.mobIcons ~= false end,
            set = function(v)
                Ding.db.ui.mobIcons = v and true or false
                Ding.QuestMobs:Apply()
            end,
        }, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.MOB_TOOLTIP, desc = L.MOB_TOOLTIP_DESC,
            get = function() return Ding.db.ui.mobTooltip ~= false end,
            set = function(v)
                Ding.db.ui.mobTooltip = v and true or false
                Ding.QuestMobs:Apply()
            end,
        }, width),
        UI.CheckRow(canvas, Cfg, {
            label = L.FAR_PLATES, desc = L.FAR_PLATES_DESC,
            get = function() return Ding.db.ui.farPlates end,
            set = function(v)
                Ding.db.ui.farPlates = v and true or false
                Ding.QuestMobs:ApplyDistance(true)
            end,
        }, width),
        foldRow(canvas, width, "arrow"),
    }
    if unfolded("arrow") then
        rows[#rows + 1] = UI.SelectorRow(canvas, Cfg, {
            label = L.ORIENTATION, default = 0,
            desc = L.ARROW_TEST,
            values = {
                { 0, L.ORIENTATION_VAL:format(1) }, { 1, L.ORIENTATION_VAL:format(2) },
                { 2, L.ORIENTATION_VAL:format(3) }, { 3, L.ORIENTATION_VAL:format(4) },
            },
            get = function() return db.mode or 0 end,
            set = function(v) A:SetMode(v) end,
        }, width)
        rows[#rows + 1] = UI.CheckRow(canvas, Cfg, {
            label = L.USE_TOMTOM,
            desc = Ding.TomTom:Available() and L.USE_TOMTOM_DESC or L.TOMTOM_MISSING,
            get = function() return db.tomtom end,
            set = function(v) A:SetTomTom(v) end,
        }, width)
        rows[#rows + 1] = UI.ButtonRow(canvas, Cfg, {
            label = L.RESET_POS_ARROW, button = L.RESET_BTN,
            run = function() A:ResetPosition() end,
        }, width)
    end
    rows[#rows + 1] = defaultsRow(canvas, width, "arrow")
    return rows
end

---------------------------------------------------------------------------
-- Keybinds (unchanged)
---------------------------------------------------------------------------
local BINDINGS = {
    { action = "DING_CONFIG", label = L.BIND_CONFIG },
    { action = "DING_NEXT", label = L.BIND_NEXT },
    { action = "DING_PREV", label = L.BIND_PREV },
    { action = "CLICK DingItemButton:LeftButton", label = L.BIND_ITEM },
    { action = "CLICK DingItemButton:Target", label = L.BIND_TARGET },
    { action = "DING_FINDER", label = L.BIND_FINDER },
    { action = "DING_CYCLE", label = L.BIND_CYCLE },
    { action = "DING_FOCUS", label = L.BIND_FOCUS },
    { action = "DING_TOGGLE", label = L.BIND_TOGGLE },
    { action = "DING_COMPACT", label = L.BIND_COMPACT },
    { action = "DING_SKIP", label = L.BIND_SKIP },
    { action = "DING_UNSKIP", label = L.BIND_UNSKIP },
}

local function bindingRows(canvas, width)
    local rows = {}
    if Cfg.welcome then rows[#rows + 1] = UI.BannerRow(canvas, L.WELCOME_TITLE, L.WELCOME_TEXT, width) end
    rows[#rows + 1] = UI.InfoRow(canvas, L.BINDINGS_INFO, width)
    for _, b in ipairs(BINDINGS) do
        rows[#rows + 1] = UI.BindingRow(canvas, Cfg, { label = b.label, action = b.action }, width)
    end
    -- With the target key, the game's own "Interact with target" key talks or attacks.
    rows[#rows + 1] = UI.InfoRow(canvas, L.BIND_INTERACT_TIP, width)
    rows[#rows + 1] = UI.SelectorRow(canvas, Cfg, {
        label = L.BUTTON_NAMES, default = "xbox",
        values = { { "xbox", L.BUTTONS_XBOX }, { "ps", L.BUTTONS_PS } },
        get = function() return Ding.db.ui.buttonStyle end,
        set = function(v) Ding.db.ui.buttonStyle = v; refreshAll() end,
    }, width)
    rows[#rows + 1] = UI.CheckRow(canvas, Cfg, {
        label = L.KEY_HINTS,
        get = function() return Ding.db.panel.keyHints end,
        set = function(v) Ding.db.panel.keyHints = v; refreshAll() end,
    }, width)
    return rows
end

---------------------------------------------------------------------------
-- Appearance
---------------------------------------------------------------------------
-- Appearance preview: a scene with the minimized guide window, at the chosen opacity.
local function previewRow(canvas, width)
    local row = CreateFrame("Frame", nil, canvas)
    row:SetSize(width, 8 + 92)
    local scene = CreateFrame("Frame", nil, row)
    scene:SetPoint("TOPLEFT", row, "TOPLEFT", 0, -8)
    scene:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", 0, 0)
    UI.Shape(scene, "row", C.scene, "BACKGROUND"):Place(scene)
    local w = CreateFrame("Frame", nil, scene)
    w:SetSize(300, 28)
    w:SetPoint("CENTER", scene, "CENTER", 0, 0)
    w.look = UI.Window(w)
    for i = -1, 1 do
        local t = w:CreateTexture(nil, "ARTWORK")
        t:SetColorTexture(unpack(C.secondary))
        t:SetSize(10, 1.5)
        t:SetPoint("CENTER", w, "LEFT", 14, i * 3.5)
    end
    w.count = UI.Text(w, "semibold", 11, C.muted)
    w.count:SetPoint("LEFT", w, "LEFT", 30, 0)
    w.icon = UI.Shape(w, "small", C.todoIconBg, "ARTWORK")
    w.iconHolder = CreateFrame("Frame", nil, w)
    w.iconHolder:SetSize(14, 14)
    w.icon:Place(w.iconHolder)
    w.glyph = UI.Icon(w.iconHolder, "icon_diamond", 5, C.todo, "OVERLAY")
    w.glyph:SetPoint("CENTER", w.iconHolder, "CENTER", 0, 0)
    w.text = UI.Text(w, "regular", 12, C.text)
    w.counter = UI.Text(w, "semibold", 12, C.todo)
    w.counter:SetJustifyH("RIGHT")
    w.counter:SetPoint("RIGHT", w, "RIGHT", -30, 0)
    w.line = w:CreateTexture(nil, "ARTWORK")
    w.line:SetColorTexture(unpack(C.accent))
    w.line:SetHeight(2)
    w.line:SetPoint("BOTTOMLEFT", w, "BOTTOMLEFT", 3, 1)
    row.window = w

    function row:Refresh()
        w.look:SetBgAlpha(Ding.db.panel.bgAlpha or 0.85)
        local E = Ding.Engine
        local data, current, total
        if E.guide then
            for _, r in ipairs(Ding.Panel:Rows()) do
                if r.state == "todo" then data = r break end
            end
            total = #E.guide.steps
            current = E.finished and total or math.min(E.index, total)
        end
        w.count:SetText(L.COMPACT_COUNT:format(current or 3, total or 42))
        w.iconHolder:ClearAllPoints()
        w.iconHolder:SetPoint("LEFT", w.count, "RIGHT", 6, 0)
        w.text:ClearAllPoints()
        w.text:SetPoint("LEFT", w.iconHolder, "RIGHT", 6, 0)
        w.counter:SetText(data and data.counter or (data and "" or "2/6"))
        w.text:SetWidth(math.max(20, 300 - 30 - w.count:GetStringWidth() - 6 - 14 - 6 - 30 - w.counter:GetStringWidth() - 6))
        w.text:SetText(data and UI.StripColors(data.text) or L.PREVIEW_SAMPLE)
        w.line:SetWidth(math.max(1, 294 * (current or 3) / (total or 42)))
    end
    row:Refresh()
    return row
end

local function appearanceRows(canvas, width)
    local panel, ui = Ding.db.panel, Ding.db.ui
    local P = Ding.Panel
    local rows = {}
    local function add(row) rows[#rows + 1] = row end
    local preview
    add(UI.HeaderRow(canvas, L.HEADER_WINDOW, width))
    add(UI.SliderRow(canvas, Cfg, {
        label = L.BG_OPACITY, min = 0, max = 100, step = 5, default = 85, format = percent,
        help = L.SLIDER_HELP_STEP:format(5),
        get = function() return math.floor((panel.bgAlpha or 0.85) * 100 + 0.5) end,
        set = function(v)
            P:SetBackgroundAlpha(v / 100)
            if preview then preview:Refresh() end
        end,
    }, width))
    add(UI.SliderRow(canvas, Cfg, {
        label = L.WINDOW_SCALE, min = 50, max = 150, step = 5, default = 100, format = percent,
        get = function() return math.floor((panel.scale or 1) * 100 + 0.5) end,
        set = function(v) P:SetScale(v / 100) end,
    }, width))
    preview = previewRow(canvas, width)
    add(preview)
    add(UI.CheckRow(canvas, Cfg, {
        label = L.LOCK,
        get = function() return panel.locked end,
        set = function(v) panel.locked = v end,
    }, width))
    add(UI.CheckRow(canvas, Cfg, {
        label = L.COMBAT_COMPACT,
        get = function() return panel.compactInCombat end,
        set = function(v) panel.compactInCombat = v end,
    }, width))
    add(UI.CheckRow(canvas, Cfg, {
        label = L.HIDE_INSTANCE,
        get = function() return panel.hideInInstance end,
        set = function(v) panel.hideInInstance = v; P:SetShown(panel.shown) end,
    }, width))
    add(UI.ButtonRow(canvas, Cfg, {
        label = L.MOVE_PANEL, button = L.MOVE_BTN,
        run = function() Cfg:StartMove(P:MoveTarget()) end,
    }, width))
    add(UI.HeaderRow(canvas, L.HEADER_ITEM_BUTTON, width))
    add(UI.CheckRow(canvas, Cfg, {
        label = L.ITEM_BUTTON, desc = L.ITEM_BUTTON_DESC,
        get = function() return panel.itemButton end,
        set = function(v) panel.itemButton = v; Ding.ItemButton:Update() end,
    }, width))
    add(UI.ButtonRow(canvas, Cfg, {
        label = L.MOVE_ITEM, button = L.MOVE_BTN,
        run = function() Cfg:StartMove(Ding.ItemButton:MoveTarget()) end,
    }, width))
    add(UI.HeaderRow(canvas, L.HEADER_MINIMAP_SOUND, width))
    add(UI.CheckRow(canvas, Cfg, {
        label = L.MINIMAP_BUTTON,
        get = function() return Ding.db.minimap.shown end,
        set = function(v) Ding.db.minimap.shown = v; Ding.Minimap:Update() end,
    }, width))
    add(UI.CheckRow(canvas, Cfg, {
        label = L.SOUND,
        get = function() return ui.sound end,
        set = function(v) ui.sound = v end,
    }, width))
    add(foldRow(canvas, width, "appearance", L.ADVANCED))
    if unfolded("appearance") then
        add(UI.ButtonRow(canvas, Cfg, {
            label = L.RESET_POS, button = L.RESET_BTN,
            run = function() P:ResetPosition() end,
        }, width))
        add(UI.CheckRow(canvas, Cfg, {
            label = L.DEBUG, desc = L.DEBUG_DESC,
            get = function() return Ding.db.debug end,
            set = function(v) Ding.db.debug = v and true or nil end,
        }, width))
        add(UI.ButtonRow(canvas, Cfg, {
            label = L.TIMING, button = L.CLEAR_BTN, confirm = true,
            desc = function() return L.TIMING_DESC:format(timingCounts()) end,
            run = function()
                for k in pairs(Ding.db.timings) do Ding.db.timings[k] = nil end
                Ding:Print(L.TIMING_CLEARED)
            end,
        }, width))
        add(UI.ButtonRow(canvas, Cfg, {
            label = L.RESET_ALL, button = L.RESET_BTN, confirm = true,
            run = function()
                Ding:ResetSettings()
                applyAllSettings()
                Ding:Print(L.DEFAULTS_RESTORED)
            end,
        }, width))
    end
    add(defaultsRow(canvas, width, "appearance"))
    return rows
end

-- What a tab's rows depend on: when it changes, the tab is built again.
local function guideSignature()
    local parts = { tostring(UnitLevel("player")) }
    for id, guide in Ding:IterateGuides() do parts[#parts + 1] = guide.pack .. "/" .. id end
    local active = Ding.Engine.guide
    parts[#parts + 1] = "guide:" .. (active and active.id or "")
    parts[#parts + 1] = "stay:" .. tostring(active and Ding.char.stay and Ding.char.stay[active.id] or false)
    parts[#parts + 1] = "unused:" .. #Ding.Engine:UnusedLogQuests()
    return table.concat(parts, ",")
end

-- Six tabs, by intent; each has a key (Cfg.TAB[key] is its index).
local TABS = {
    { key = "guide", label = L.TAB_GUIDE, build = guideRows, signature = guideSignature },
    { key = "route", label = L.TAB_ROUTE, build = routeRows, signature = routeSignature },
    { key = "automation", label = L.TAB_AUTOMATION, build = automationRows, signature = talentSignature },
    { key = "arrow", label = L.TAB_ARROW, build = arrowRows },
    { key = "bindings", label = L.TAB_BINDINGS, build = bindingRows, signature = function() return tostring(Cfg.welcome) end },
    { key = "appearance", label = L.TAB_APPEARANCE, build = appearanceRows },
}
Cfg.TABS = TABS
Cfg.TAB = {}
for i, tab in ipairs(TABS) do
    tab.pad, tab.gap = 12, 4
    Cfg.TAB[tab.key] = i
end
local BINDINGS_TAB = Cfg.TAB.bindings

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
-- Tab: label only; the active one is light with a 2-unit accent underline.
local function tabButton(parent, text)
    local b = CreateFrame("Button", nil, parent)
    b:SetHeight(TABS_HEIGHT)
    b:RegisterForClicks("LeftButtonUp")
    b.label = UI.Text(b, "semibold", 12, C.secondary)
    b.label:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.label:SetText(text)
    b.underline = b:CreateTexture(nil, "ARTWORK")
    b.underline:SetColorTexture(unpack(C.accent))
    b.underline:SetHeight(2)
    b.underline:SetPoint("BOTTOMLEFT", b, "BOTTOMLEFT", 0, 0)
    b.underline:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 0, 0)
    function b:SetActive(active)
        self.active = active
        self.label:SetTextColor(unpack(active and C.text or C.secondary))
        self.underline:SetShown(active)
    end
    b:SetScript("OnEnter", function(self) if not self.active then self.label:SetTextColor(unpack(C.text)) end end)
    b:SetScript("OnLeave", function(self) self:SetActive(self.active) end)
    return b
end

-- Tabs between LB and RB; padding 12 per side, down to 6 when the row is too wide
-- (French, German), then 11-unit labels.
local function layoutTabs(f)
    local lb, rb = f.lb:GetWidth(), f.rb:GetWidth()
    local room = WIDTH - 8 - lb - 4 - 8 - rb - 4
    local function total(p)
        local sum = 0
        for i, b in ipairs(f.tabs) do sum = sum + b.label:GetStringWidth() + 2 * p + (i > 1 and 2 or 0) end
        return sum
    end
    for _, b in ipairs(f.tabs) do b.label:SetFontObject(UI.Font("semibold", 12)) end
    local pad = 12
    while pad > 6 and total(pad) > room do pad = pad - 2 end
    if total(pad) > room then
        for _, b in ipairs(f.tabs) do b.label:SetFontObject(UI.Font("semibold", 11)) end
    end
    local x = 8 + lb + 4
    for _, b in ipairs(f.tabs) do
        b:SetWidth(b.label:GetStringWidth() + 2 * pad)
        b:ClearAllPoints()
        b:SetPoint("TOPLEFT", f, "TOPLEFT", x, -(TITLE_HEIGHT + 1))
        x = x + b:GetWidth() + 2
    end
end

function Cfg:Create()
    if self.frame then return end
    local f = CreateFrame("Frame", "DingConfigFrame", UIParent)
    f:SetSize(WIDTH, HEIGHT)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetFrameStrata("DIALOG")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:Hide()
    f.look = UI.Window(f)
    if type(UISpecialFrames) == "table" then table.insert(UISpecialFrames, "DingConfigFrame") end

    -- Title bar: "Ding · Settings", B glyph, close cross.
    f.title = UI.Text(f, "semibold", 13, C.text)
    f.title:SetPoint("LEFT", f, "TOPLEFT", 12, -TITLE_HEIGHT / 2)
    f.title:SetText(UI.Colored("accent", Ding.TITLE) .. UI.Colored("disabled", " · ") .. L.SETTINGS)
    f.close = UI.IconButton(f, 24)
    f.close:SetPoint("RIGHT", f, "TOPRIGHT", -6, -TITLE_HEIGHT / 2)
    f.close.label = UI.Text(f.close, "regular", 16, C.secondary)
    f.close.label:SetPoint("CENTER", f.close, "CENTER", 0, 1)
    f.close.label:SetText("×")
    f.close:SetScript("OnClick", function() Cfg:Close() end)
    f.back = UI.Glyph(f)
    f.back:SetPoint("RIGHT", f.close, "LEFT", -8, 0)
    UI.Divider(f, -TITLE_HEIGHT)

    -- Tabs, with LB / RB at the ends.
    f.lb = UI.Glyph(f)
    f.lb:SetPoint("LEFT", f, "TOPLEFT", 8, -(TITLE_HEIGHT + 1 + TABS_HEIGHT / 2))
    f.rb = UI.Glyph(f)
    f.rb:SetPoint("RIGHT", f, "TOPRIGHT", -8, -(TITLE_HEIGHT + 1 + TABS_HEIGHT / 2))
    f.tabs = {}
    for i, tab in ipairs(TABS) do
        local b = tabButton(f, tab.label)
        b:SetScript("OnClick", function() Cfg:SelectTab(i) end)
        f.tabs[i] = b
    end
    UI.Divider(f, -(TITLE_HEIGHT + 1 + TABS_HEIGHT), C.border)

    local content = CreateFrame("ScrollFrame", nil, f)
    content:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -CONTENT_TOP)
    content:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, FOOTER_HEIGHT + 1)
    content:EnableMouseWheel(true)
    content:SetScript("OnMouseWheel", function(_, delta) Cfg:Scroll(-delta * 40) end)
    -- On a page, a right click anywhere goes back.
    content:EnableMouse(true)
    content:SetScript("OnMouseUp", function(_, button)
        if button == "RightButton" and Cfg.page then Cfg:ClosePage() end
    end)
    f.content = content

    -- Esc on a page goes back to its tab (elsewhere it closes the window, as UISpecialFrames
    -- does): the key is kept from the game only then.
    f:EnableKeyboard(true)
    pcall(f.SetPropagateKeyboardInput, f, true)
    f:SetScript("OnKeyDown", function(self, key)
        local back = key == "ESCAPE" and Cfg.page ~= nil
        pcall(self.SetPropagateKeyboardInput, self, not back)
        if back then Cfg:ClosePage() end
    end)

    -- Footer: hints for the focused element.
    UI.Divider(f, -(HEIGHT - FOOTER_HEIGHT - 1))
    f.help = G():NewHintBar(f, WIDTH - 24, FOOTER_HEIGHT, function(key) Cfg:OnKey(key) end)
    f.help:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, 0)

    f:SetScript("OnShow", function() Cfg:OnShow() end)
    f:SetScript("OnHide", function() Cfg:OnHide() end)

    self.frame = f
    self.tab = self.tab or 1
    self.focusIndex = self.focusIndex or {}
end

-- Rows top to bottom in a canvas: their place, the focusable ones, the height.
local function layoutRows(view, canvas, rows)
    local y = view.pad
    view.focusable = {}
    for n, row in ipairs(rows) do
        if n > 1 then y = y + view.gap end
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", canvas, "TOPLEFT", view.pad, -y)
        row.y = y
        y = y + row:GetHeight()
        if row.focusable then view.focusable[#view.focusable + 1] = row end
    end
    y = y + view.pad
    canvas:SetHeight(math.max(y, 1))
    view.canvas, view.rows, view.height = canvas, rows, y
end

-- What is on screen: the open page, else the tab.
function Cfg:View()
    return self.page or TABS[self.tab]
end

local function tabSignature(tab)
    return (tab.signature and tab.signature() or "") .. "|" .. tostring(Cfg.unfolded[tab.key])
end

-- Builds a tab's rows in its own canvas, again only when its signature (or what is folded)
-- changed.
function Cfg:BuildTab(i)
    local tab = TABS[i]
    local signature = tabSignature(tab)
    if tab.canvas and signature == tab.built then return tab end
    if tab.canvas then tab.canvas:Hide() end
    tab.built = signature
    local canvas = CreateFrame("Frame", nil, self.frame.content)
    canvas:SetWidth(WIDTH)
    layoutRows(tab, canvas, tab.build(canvas, WIDTH - 2 * tab.pad))
    return tab
end

-- The tab again (a fold opened or closed, a row added), the focus on the same row.
function Cfg:Rebuild()
    local tab = TABS[self.tab]
    if not tab or not self.frame then return end
    tab.built = nil
    self:SelectTab(self.tab, self.focusIndex[self.tab])
end

-- A long list on a page of its own (def: key, title, build(canvas, width) -> rows, and
-- signature() when the list can change while it is open), over the tab's content; B, Esc,
-- a right click or its title go back.
function Cfg:OpenPage(def)
    local f = self.frame
    self:CancelPending()
    local tab = TABS[self.tab]
    if tab.canvas then tab.canvas:Hide() end
    if self.focus then self.focus:SetFocused(false) end
    local again = self.page and self.page.def == def and self.page or nil
    if again then again.canvas:Hide() end
    local page = { def = def, key = def.key, pad = 12, gap = 4, tab = again and again.tab or self.tab,
        from = again and again.from or self.focusIndex[self.tab], built = def.signature and def.signature() }
    local canvas = CreateFrame("Frame", nil, f.content)
    canvas:SetWidth(WIDTH)
    local width = WIDTH - 2 * page.pad
    local rows = { UI.PageTitleRow(canvas, def.title, width, function() Cfg:ClosePage() end) }
    for _, row in ipairs(def.build(canvas, width)) do rows[#rows + 1] = row end
    layoutRows(page, canvas, rows)
    self.page = page
    f.content:SetScrollChild(canvas)
    f.content:SetVerticalScroll(0)
    canvas:Show()
    self.focus = nil
    self:RefreshRows()
    local index = again and again.index or 1
    self:SetFocus(page.focusable[math.max(1, math.min(index, #page.focusable))])
end

-- Leaves the page: back on its tab, the focus on the row that opened it.
local function dropPage(self)
    local page = self.page
    if not page then return nil end
    if self.focus then
        self.focus:SetFocused(false)
        if GameTooltip:GetOwner() == self.focus then GameTooltip:Hide() end
    end
    self.focus = nil
    page.canvas:Hide()
    self.page = nil
    return page
end

function Cfg:ClosePage()
    if not self.page then return end
    self:CancelPending()
    local page = dropPage(self)
    self:SelectTab(page.tab, page.from)
end

function Cfg:SelectTab(i, focusIndex)
    local f = self.frame
    self:CancelPending()
    dropPage(self)
    for _, tab in ipairs(TABS) do
        if tab.canvas then tab.canvas:Hide() end
    end
    self.tab = i
    local tab = self:BuildTab(i)
    f.content:SetScrollChild(tab.canvas)
    f.content:SetVerticalScroll(0)
    tab.canvas:Show()
    for j, b in ipairs(f.tabs) do b:SetActive(j == i) end
    self:RefreshRows()
    local index = math.max(1, math.min(focusIndex or 1, #tab.focusable))
    self:SetFocus(tab.focusable[index])
end

function Cfg:RefreshRows()
    local f = self.frame
    local view = f and self:View()
    if not view or not view.rows then return end
    for _, row in ipairs(view.rows) do row:Refresh() end
    -- The focused row again: its A chip follows the gamepad.
    if self.focus then self.focus:SetFocused(true) end
    f.lb:SetKey("PADLSHOULDER")
    f.rb:SetKey("PADRSHOULDER")
    f.back:SetKey("PAD2")
    layoutTabs(f)
    self:UpdateHelp()
end

function Cfg:OnEngineRefresh()
    if not (self.frame and self.frame:IsShown()) then return end
    -- A quest abandoned, another guide: the tab's rows changed, it is built again.
    -- A page whose list changed (a quest abandoned): built again, or closed once empty.
    local page = self.page
    if page and page.def.signature and page.built ~= page.def.signature() and not self.dropdown then
        if page.def.signature() == "" then self:ClosePage() else self:OpenPage(page.def) end
        return
    end
    local tab = TABS[self.tab]
    if tab and not self.page and not self.dropdown and tab.built ~= tabSignature(tab) then
        self:SelectTab(self.tab, self.focusIndex[self.tab])
        return
    end
    self:RefreshRows()
end

---------------------------------------------------------------------------
-- Focus, scrolling, footer
---------------------------------------------------------------------------
function Cfg:Scroll(delta)
    local f, tab = self.frame, self:View()
    local max = math.max(0, (tab.height or 0) - CONTENT_HEIGHT)
    f.content:SetVerticalScroll(math.max(0, math.min(max, f.content:GetVerticalScroll() + delta)))
end

local function ensureVisible(f, tab, row)
    local scroll = f.content:GetVerticalScroll()
    local top, bottom = row.y - tab.pad, row.y + row:GetHeight() + tab.pad
    if top < scroll then
        f.content:SetVerticalScroll(math.max(0, top))
    elseif bottom > scroll + CONTENT_HEIGHT then
        f.content:SetVerticalScroll(bottom - CONTENT_HEIGHT)
    end
end

-- A quest card shown from a row (quest log cleanup) goes with the focus.
local function hideCard(row)
    if row and GameTooltip:GetOwner() == row then GameTooltip:Hide() end
end

function Cfg:SetFocus(row)
    local f = self.frame
    if self.focus and self.focus ~= row then
        self.focus:Cancel()
        self.focus:SetFocused(false)
        hideCard(self.focus)
    end
    self.focus = row
    if not row then
        self:UpdateHelp()
        return
    end
    local tab = self:View()
    for i, r in ipairs(tab.focusable or {}) do
        if r == row then
            if self.page then self.page.index = i else self.focusIndex[self.tab] = i end
        end
    end
    row:SetFocused(true)
    ensureVisible(f, tab, row)
    self:UpdateHelp()
end

function Cfg:MoveFocus(delta)
    local list = self:View().focusable
    if #list == 0 then return end
    local current = self.page and self.page.index or self.focusIndex[self.tab]
    local index = (current or 1) + delta
    index = (index - 1) % #list + 1
    self:SetFocus(list[index])
end

local function hint(keys, label) return UI.Hint(keys, label) end

-- Without a gamepad, the help speaks of the mouse and the keyboard.
local function mouseHelp(self, row)
    if self.capturing then return L.MOUSE_CAPTURE end
    if self.conflictRow or (row and row.confirming) then return L.MOUSE_CONFIRM end
    if self.page then return L.MOUSE_PAGE_HINT end
    return L.MOUSE_HINT
end

-- Each action shows once (Yendi: the same action as a hint and as a button). With a gamepad,
-- a chip sits on what its button does when that is on screen: B on the close cross (on a tab)
-- or on the page's title (on a page), LB / RB at the ends of the tabs, A on the focused row
-- when the row has one (check box, button). The footer keeps the others.
function Cfg:UpdateHelp()
    local f = self.frame
    if not f then return end
    local row = self.focus
    local pad = G():Active()
    -- While a list is open, a button waited for or a conflict settled, B and LB / RB do
    -- something else (or nothing): their chips go away, the footer says it.
    local busy = self.dropdown or self.capturing or self.conflictRow
    local confirming = row and row.confirming
    f.lb:SetShown(pad and not busy)
    f.rb:SetShown(pad and not busy)
    f.back:SetShown(pad and not busy and not confirming and not self.page)
    if self.page then self.page.rows[1]:ShowKey(pad and not busy and not confirming) end
    if not pad then
        f.help:SetHints({ UI.Hint(nil, mouseHelp(self, row)) })
        return
    end
    local hints
    if self.dropdown then
        hints = { hint("PAD1", L.HINT_SELECT), hint("PAD2", L.HINT_BACK) }
    elseif self.capturing then
        hints = { hint("PAD2", L.HINT_CANCEL) }
    elseif self.conflictRow then
        hints = { hint("PAD1", L.HINT_CONFIRM), hint("PAD2", L.HINT_CANCEL) }
    elseif confirming then
        -- The row's button says "Confirm? (A)".
        hints = { hint("PAD2", L.HINT_CANCEL) }
    else
        hints = row and row:Hints() or {}
    end
    f.help:SetHints(hints)
end

---------------------------------------------------------------------------
-- Key binding capture
---------------------------------------------------------------------------
function Cfg:StartCapture(row)
    if InCombatLockdown() then return end
    self.capturing = row
    row.capturing = true
    row:Refresh()
    self:UpdateHelp()
    G():Capture(function(key)
        row.capturing = false
        self.capturing = nil
        if key then
            local _, name = G():ConflictFor(row.opts.action, key)
            if name then
                row.conflict = name
                self.conflictRow, self.pendingKey = row, key
            else
                G():Bind(row.opts.action, key)
            end
        end
        refreshAll()
    end)
end

-- Mouse: a binding conflict waits for a click on its row (replace) or a right click
-- (cancel); a click elsewhere cancels it too. A capture in progress ignores clicks.
function Cfg:OnRowClick(row, button)
    if self.conflictRow then
        self:ResolveConflict(row == self.conflictRow and button ~= "RightButton")
        return true
    end
    -- On a page, a right click goes back (or cancels a confirmation first).
    if self.page and button == "RightButton" and not self.capturing then
        if row.confirming then row:Cancel() else self:ClosePage() end
        return true
    end
    return self.capturing ~= nil
end

function Cfg:ResolveConflict(accept)
    local row, key = self.conflictRow, self.pendingKey
    self.conflictRow, self.pendingKey = nil, nil
    if not row then return end
    row.conflict = nil
    if accept then G():Bind(row.opts.action, key) end
    refreshAll()
end

-- Drops any confirmation, capture or conflict in progress.
function Cfg:CancelPending()
    if self.capturing then G():StopCapture(nil) end
    if self.conflictRow then self:ResolveConflict(false) end
    if self.focus then self.focus:Cancel() end
end

---------------------------------------------------------------------------
-- Navigation (keys from Ding.Gamepad)
---------------------------------------------------------------------------
function Cfg:OnKey(key)
    if self.capturing then return end
    if self.conflictRow then
        if key == "PAD1" then self:ResolveConflict(true)
        elseif key == "PAD2" then self:ResolveConflict(false) end
        return
    end
    if self.dropdown then
        if key == "PADFORWARD" then
            self:Close()
        else
            self.dropdown:OnKey(key)
        end
        return
    end
    local row = self.focus
    if key == "PAD1" then
        if row then row:Activate() end
    elseif key == "PAD2" then
        if row and row.confirming then
            row:Cancel()
        elseif self.page then
            self:ClosePage()
        else
            self:Close()
        end
    elseif key == "PAD4" then
        if row then row:Reset() end
    elseif key == "PADLSHOULDER" then
        self:SelectTab((self.tab - 2) % #TABS + 1)
    elseif key == "PADRSHOULDER" then
        self:SelectTab(self.tab % #TABS + 1)
    elseif key == "PADDUP" then
        self:MoveFocus(-1)
    elseif key == "PADDDOWN" then
        self:MoveFocus(1)
    elseif key == "PADDLEFT" then
        if row then row:Left() end
    elseif key == "PADDRIGHT" then
        if row then row:Right() end
    elseif key == "PADFORWARD" then
        self:Close()
    end
end

---------------------------------------------------------------------------
-- Opening, closing, move mode
---------------------------------------------------------------------------
-- tab (index or key: "guide", "route"...), focusIndex: optional; by default the last tab and
-- element of the session.
function Cfg:Open(tab, focusIndex)
    if type(tab) == "string" then tab = Cfg.TAB[tab] end
    if InCombatLockdown() then
        Ding:Print(L.CONFIG_COMBAT)
        return
    end
    self:Create()
    self.openTab = tab or self.tab or 1
    self.openFocus = focusIndex or (self.focusIndex and self.focusIndex[self.openTab]) or 1
    if self.frame:IsShown() then
        self:SelectTab(self.openTab, self.openFocus)
    else
        self.frame:Show()
    end
end

function Cfg:Close()
    if self.frame then self.frame:Hide() end
end

function Cfg:Toggle()
    if self.frame and self.frame:IsShown() then self:Close() else self:Open() end
end

function Cfg:OnShow()
    if Ding.Panel.focusing then Ding.Panel:StopFocus() end
    G():Take(self.frame, function(key) Cfg:OnKey(key) end, 0.4, 0.12)
    self:SelectTab(self.openTab or self.tab or 1, self.openFocus)
end

function Cfg:OnHide()
    self:CancelPending()
    dropPage(self)
    if self.focus then
        self.focus:SetFocused(false)
        hideCard(self.focus)
    end
    G():Release(self.frame)
    self.welcome = false
end

-- The window hides while the guide window, the arrow or the item button moves.
function Cfg:StartMove(target)
    local tab, index = self.tab, self.focusIndex[self.tab]
    self:Close()
    G():StartMove(target, function()
        if not self.inCombat then self:Open(tab, index) end
    end)
end

---------------------------------------------------------------------------
-- Game options entry (AddOns > Ding!) and first launch
---------------------------------------------------------------------------
local function registerAddOnCategory()
    local panel = CreateFrame("Frame")
    panel.name = Ding.TITLE
    local button = CreateFrame("Button", nil, panel)
    button:SetSize(220, 32)
    button:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)
    button:RegisterForClicks("LeftButtonUp")
    UI.Shape(button, "row", C.control, "BACKGROUND"):Place(button)
    button.label = UI.Text(button, "medium", 12, C.text)
    button.label:SetPoint("CENTER", button, "CENTER", 0, 0)
    button.label:SetText(L.ADDONS_OPEN)
    -- Ding's window opens over the game's options, which stay as they are: closing them
    -- from here would taint them.
    button:SetScript("OnClick", function() Cfg:Open() end)
    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        local ok, category = pcall(Settings.RegisterCanvasLayoutCategory, panel, Ding.TITLE)
        if ok and category and pcall(Settings.RegisterAddOnCategory, category) then return end
    end
    if InterfaceOptions_AddCategory then pcall(InterfaceOptions_AddCategory, panel) end
end

function Cfg:Init()
    registerAddOnCategory()
    local ui = Ding.db.ui
    if ui.welcomed or G():BindingKey("DING_CONFIG") then
        ui.welcomed = true
        return
    end
    C_Timer.After(2, function()
        if InCombatLockdown() or ui.welcomed then return end
        ui.welcomed = true
        Cfg.welcome = true
        -- Focus "Open Ding settings" (binding rows are the tab's first focusable rows).
        local focus = 1
        for i, b in ipairs(BINDINGS) do
            if b.action == "DING_CONFIG" then focus = i end
        end
        Cfg:Open(BINDINGS_TAB, focus)
    end)
end

-- Closes before the combat lockdown starts (the override bindings must go now).
Ding:On("PLAYER_REGEN_DISABLED", function()
    Cfg.inCombat = true
    if G():IsMoving() then G():CancelMove() end
    Cfg:Close()
end)
Ding:On("PLAYER_REGEN_ENABLED", function() Cfg.inCombat = false end)
