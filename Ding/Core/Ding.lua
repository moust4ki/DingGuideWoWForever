-- Ding: namespace, saved variables and event bus.
local ADDON_NAME, Ding = ...

-- Public global so external guide packs can call Ding.RegisterGuide.
_G.Ding = Ding

Ding.name = ADDON_NAME
-- The name players see (window titles, the addon list, the options, the key bindings): the
-- code, the folder and the saved variables keep "Ding".
Ding.TITLE = "Ding!"
-- Runs at file load: a failing metadata call must not stop the addon from loading.
local function metadata(fn, field)
    if type(fn) ~= "function" then return nil end
    local ok, value = pcall(fn, ADDON_NAME, field)
    return ok and value or nil
end
-- The packager replaces @project-version@ with the release tag; a copy of the repository
-- keeps the keyword and reports itself as "dev".
local version = metadata(C_AddOns and C_AddOns.GetAddOnMetadata, "Version")
    or metadata(GetAddOnMetadata, "Version")
Ding.version = (type(version) == "string" and version ~= "" and not version:find("@", 1, true))
    and version or "dev"

-- Defaults of the design (docs/UI-handoff.md): background 85 %, window 100 %, arrow 56
-- units, 120 above the screen center. Ding's own arrow: TomTom's is an opt-in.
local DEFAULTS = {
    panel = {
        shown = true, point = "TOPRIGHT", x = -260, y = -220, scale = 1, width = 300,
        locked = false, bgAlpha = 0.85, compactInCombat = true,
        hideInInstance = false, keyHints = true, itemButton = true, preview = 0, weaponReminder = true,
    },
    arrow = { shown = true, point = "CENTER", x = 0, y = 120, size = 56, mode = 0, style = "ding", tomtom = false,
        loop = true, worldMap = true },
    item = { point = "BOTTOM", x = 0, y = 220 },
    minimap = { shown = true, angle = 200, pins = true },
    -- hearth, deathSkip, dungeons, elites: the guide's steps behind an option (Engine).
    -- welcomed: the first launch's Keybinds tab was shown; setupDone: its setup assistant (UI/Setup.lua).
    ui = { buttonStyle = "xbox", sound = true, welcomed = false, setupDone = false, autoAccept = true, autoTurnin = true,
        skipGrey = false, hearth = true, deathSkip = false, dungeons = false, elites = false,
        chooseReward = false, sellGrey = true, repair = true, markTarget = true, serviceSteps = true,
        offers = true,   -- beside an NPC's window, what the guide does with its quests (UI/Offers.lua)
        trainerSteps = true, flightSteps = true, autoEquip = false, autoFly = false,
        -- Quest monsters (UI/QuestMobs.lua): marks on enemy nameplates, the tooltip line, and
        -- the enemy nameplates' distance raised to the client's maximum.
        mobIcons = true, mobTooltip = true, farPlates = false },
    timings = {},
    imported = {},   -- [pack id] = { pack, guides, at }: guides imported as text (Import)
}
Ding.DEFAULTS = DEFAULTS
local SETTINGS = { "panel", "arrow", "item", "minimap", "ui" }

local CHAR_DEFAULTS = {
    guide = nil,     -- active guide id (a section of a guide pack)
    pack = nil,      -- pack of the active guide: a section of it is suggested if that guide goes away
    step = 1,        -- active step index
    manual = {},     -- [guideId] = { [stepIndex] = true } steps validated by hand
    resumeTo = nil,  -- { guide, step }: resuming up to this step (Engine:Resume)
    guideSig = nil,  -- signature of the active guide's steps: a changed guide is resumed
    early = {},      -- [questID] = true: taken ahead of the guide on the way (AutoQuest)
    skipped = {},    -- [guideId] = { [stepIndex] = true } steps skipped, still to do
    killXP = {},     -- the last kills, as a share of a monster of the player's level (Grind)
    deathskip = nil, -- { guide, step }: died during a death skip step, done once alive again
}

local function applyDefaults(target, defaults)
    for k, v in pairs(defaults) do
        if target[k] == nil then
            if type(v) == "table" then
                target[k] = {}
                applyDefaults(target[k], v)
            else
                target[k] = v
            end
        elseif type(v) == "table" and type(target[k]) == "table" then
            applyDefaults(target[k], v)
        end
    end
end

-- Settings reset ("Restore all defaults"): timings and debug stay.
function Ding:ResetSettings()
    for _, key in ipairs(SETTINGS) do
        local t = self.db[key]
        for k in pairs(t) do t[k] = nil end
        applyDefaults(t, DEFAULTS[key])
    end
    self.db.ui.welcomed, self.db.ui.setupDone = true, true
end

-- Settings saved before the design (layout 1) in the current shape, once.
local LAYOUT = 2
local function migrate(db)
    if (db.layout or 1) >= LAYOUT then return end
    local arrow = db.arrow
    if arrow.point == "TOP" and arrow.x == 0 and arrow.y == -120 then
        arrow.point, arrow.x, arrow.y = "CENTER", 0, 120
    end
    if tonumber(arrow.scale) then
        arrow.size = math.max(40, math.min(80, math.floor(56 * arrow.scale / 4 + 0.5) * 4))
    end
    arrow.scale = nil
    -- Ding's arrow first: TomTom's was the default before the design.
    arrow.tomtom = false
    db.panel.scale = math.max(0.5, math.min(1.5, tonumber(db.panel.scale) or 1))
    db.panel.textSize = nil
    db.ui.opacity = nil
    db.layout = LAYOUT
end
Ding.Migrate = migrate

---------------------------------------------------------------------------
-- Event bus: several modules can listen to the same event.
---------------------------------------------------------------------------
local frame = CreateFrame("Frame")
local listeners = {}

function Ding:On(event, fn)
    if not listeners[event] then
        listeners[event] = {}
        -- An event this client does not know (gamepad events...) must not stop the loading.
        pcall(frame.RegisterEvent, frame, event)
    end
    table.insert(listeners[event], fn)
end

frame:SetScript("OnEvent", function(_, event, ...)
    local list = listeners[event]
    if not list then return end
    for i = 1, #list do
        local ok, err = pcall(list[i], event, ...)
        if not ok then Ding:Debug(event .. ": " .. tostring(err)) end
    end
end)

---------------------------------------------------------------------------
-- Output helpers
---------------------------------------------------------------------------
function Ding:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99" .. Ding.TITLE .. "|r " .. tostring(msg))
end

function Ding:Debug(msg)
    if DingDB and DingDB.debug then
        self:Print("|cff999999" .. tostring(msg) .. "|r")
    end
end

-- Calls fn(...) protected: a failing display must stop neither the engine nor the other
-- displays, and must not flood the screen. Each different error goes once to the game's
-- error frame, then only to the debug output. Returns true when fn ran without error.
local reported = {}
function Ding:Safe(fn, ...)
    local ok, err = pcall(fn, ...)
    if ok then return true end
    err = tostring(err)
    if not reported[err] then
        reported[err] = true
        local handler = type(geterrorhandler) == "function" and geterrorhandler()
        if handler then pcall(handler, err) end
    end
    self:Debug(err)
    return false
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------
Ding:On("ADDON_LOADED", function(_, name)
    if name ~= ADDON_NAME then return end
    DingDB = DingDB or {}
    DingCharDB = DingCharDB or {}
    applyDefaults(DingDB, DEFAULTS)
    applyDefaults(DingCharDB, CHAR_DEFAULTS)
    migrate(DingDB)
    Ding.db = DingDB
    Ding.char = DingCharDB
end)

-- One listener per module: each runs protected, so a failing module cannot stop the others.
Ding:On("PLAYER_LOGIN", function() Ding.Data:Init() end)
Ding:On("PLAYER_LOGIN", function() Ding.Arrow:Create() end)
Ding:On("PLAYER_LOGIN", function() Ding.Panel:Create() end)
Ding:On("PLAYER_LOGIN", function() Ding.ItemButton:Create() end)
Ding:On("PLAYER_LOGIN", function() Ding.Minimap:Create() end)
-- Guides imported as text: once every addon has registered its packs, before the engine.
Ding:On("PLAYER_LOGIN", function() Ding.Import:RegisterSaved() end)
Ding:On("PLAYER_LOGIN", function() Ding.Engine:Start() end)
Ding:On("PLAYER_LOGIN", function() Ding.Config:Init() end)
