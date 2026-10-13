-- Mocked WoW API for the offline tests: widgets, game state, a QuestieDB built from the
-- Forever export, and Ding loaded in .toc order. Shared by smoke_test.lua and the unit
-- tests in tools/tests/. Only the methods Ding uses are mocked: any other one errors.
-- usage: local H = dofile("tools/wow_mock.lua")({ combined = dir, quiet = bool, skipOptional = bool,
--                                                 locale = "frFR" (default) or "enUS"...,
--                                                 addons = { dir of a guide pack addon, ... } })
local here = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local X = dofile(here .. "/questiedb_export.lua")

return function(opts)
    local COMBINED, QUIET, SKIP_OPTIONAL = opts.combined, opts.quiet, opts.skipOptional

    local problems = 0
    local function problem(msg)
        problems = problems + 1
        print("!! " .. msg)
    end
    local function say(msg)
        if not QUIET then print(msg) end
    end

    ---------------------------------------------------------------------------
    -- Widgets: only the methods Ding uses are mocked; any other method name errors,
    -- which catches typos that luac cannot see.
    ---------------------------------------------------------------------------
    local allWidgets = {}
    local function noop() end
    local Methods = {}
    for _, m in ipairs({ "SetFrameStrata", "SetClampedToScreen", "SetMovable", "EnableMouse",
        "RegisterForDrag", "StartMoving", "StopMovingOrSizing", "SetUserPlaced", "SetJustifyH",
        "SetJustifyV", "SetWordWrap", "SetTexCoord",
        "SetDesaturated", "SetStatusBarTexture", "SetStatusBarColor", "SetMinMaxValues",
        "SetNormalTexture", "SetPushedTexture", "SetDisabledTexture", "SetHighlightTexture",
        "SetCheckedTexture", "UnregisterEvent", "SetBlendMode", "SetMaxLines",
        "SetOrientation", "SetThumbTexture", "SetValueStep", "SetObeyStepOnDrag", "EnableMouseWheel",
        "RegisterForClicks", "EnableGamePadButton", "EnableKeyboard",
        "SetPropagateKeyboardInput", "SetShadowOffset", "SetShadowColor", "SetSpacing", "AddMaskTexture" }) do
        Methods[m] = noop
    end
    function Methods:SetVertexColor(r, g, b, a)
        assert(type(r) == "number" and type(g) == "number" and type(b) == "number", "SetVertexColor(r, g, b[, a])")
        self.vertexColor = { r, g, b, a or 1 }
    end
    function Methods:SetRotation(radians)
        assert(type(radians) == "number", "SetRotation expects radians")
        self.rotation = radians
    end
    function Methods:EnableMouse(v) self.mouse = v and true or false end
    function Methods:IsMouseEnabled() return self.mouse == true end
    function Methods:GetCenter() return 400, 300 end
    function Methods:SetAlpha(a)
        assert(type(a) == "number" and a >= 0 and a <= 1, "SetAlpha expects 0-1")
        self.alpha = a
    end
    function Methods:GetAlpha() return self.alpha or 1 end
    function Methods:SetColorTexture(r, g, b, a)
        assert(type(r) == "number" and type(g) == "number" and type(b) == "number", "SetColorTexture(r, g, b[, a])")
        self.colorTexture = { r, g, b, a or 1 }
    end
    function Methods:SetSize(w, h) self.w, self.h = w, h end
    function Methods:SetWidth(w)
        assert(type(w) == "number" and w == w and w >= 0, "bad width")
        self.w = w
    end
    function Methods:SetHeight(h)
        assert(type(h) == "number" and h == h and h >= 0, "bad height")
        self.h = h
    end
    function Methods:GetWidth() return self.w or 0 end
    function Methods:GetHeight() return self.h or 0 end
    -- Which edge or center each anchor pins, vertically and horizontally.
    local V = { TOPLEFT = "edge", TOP = "edge", TOPRIGHT = "edge", BOTTOMLEFT = "edge", BOTTOM = "edge",
        BOTTOMRIGHT = "edge", LEFT = "center", CENTER = "center", RIGHT = "center" }
    local H = { TOPLEFT = "edge", LEFT = "edge", BOTTOMLEFT = "edge", TOPRIGHT = "edge", RIGHT = "edge",
        BOTTOMRIGHT = "edge", TOP = "center", CENTER = "center", BOTTOM = "center" }
    function Methods:SetPoint(point, rel, relPoint, x, y)
        if type(rel) == "number" then x, y, rel = rel, relPoint, nil end
        assert(V[point], "unknown anchor point " .. tostring(point))
        assert(relPoint == nil or type(relPoint) == "number" or V[relPoint], "unknown relative point " .. tostring(relPoint))
        self.points = self.points or {}
        -- An edge plus a center on the same axis silently overrides SetHeight/SetWidth in game.
        for _, p in ipairs(self.points) do
            if p[1] ~= point and ((V[p[1]] ~= V[point]) or (H[p[1]] ~= H[point])) then
                error(("conflicting anchors %s + %s"):format(p[1], point), 2)
            end
        end
        self.points[#self.points + 1] = { point, rel, relPoint, x or 0, y or 0 }
    end
    function Methods:SetAllPoints(rel)
        self.points = { { "TOPLEFT", rel, "TOPLEFT", 0, 0 }, { "BOTTOMRIGHT", rel, "BOTTOMRIGHT", 0, 0 } }
    end
    function Methods:ClearAllPoints() self.points = {} end
    function Methods:GetPoint() local p = self.points[1]; return p[1], p[2], p[3], p[4], p[5] end
    function Methods:SetScale(s) self.scale = s end
    function Methods:GetScale() return self.scale or 1 end
    function Methods:GetEffectiveScale() return self.scale or 1 end
    function Methods:SetScript(name, fn) self.scripts = self.scripts or {}; self.scripts[name] = fn end
    function Methods:GetScript(name) return self.scripts and self.scripts[name] end
    function Methods:Show()
        if self.shown == false then
            self.shown = true
            if self.scripts and self.scripts.OnShow then self.scripts.OnShow(self) end
        end
    end
    function Methods:Hide()
        if self.shown ~= false then
            self.shown = false
            if self.scripts and self.scripts.OnHide then self.scripts.OnHide(self) end
        end
    end
    function Methods:SetShown(v) if v then self:Show() else self:Hide() end end
    function Methods:IsShown() return self.shown ~= false end
    -- Positions follow a TOPLEFT anchor on UIParent (768 units high), so SavePosition round-trips.
    function Methods:GetLeft()
        local p = self.points and self.points[1]
        if p and p[1] == "TOPLEFT" and p[2] == UIParent then return p[4] end
        return 900
    end
    function Methods:GetTop()
        local p = self.points and self.points[1]
        if p and p[1] == "TOPLEFT" and p[2] == UIParent then return 768 / (self.scale or 1) + p[5] end
        return 600
    end
    function Methods:SetParent(p) self.parent = p end
    function Methods:SetFrameLevel(n) self.level = n end
    function Methods:GetFrameLevel() return self.level or 1 end
    function Methods:RegisterEvent(e) self.events = self.events or {}; self.events[e] = true end
    function Methods:SetText(t)
        assert(t == nil or type(t) == "string" or type(t) == "number", "SetText expects a string")
        -- Like the client: a font object whose file failed to load has no font.
        if self.fontObject and not self.fontObject:GetFont() then error("FontString:SetText(): Font not set", 2) end
        self.text = t
    end
    function Methods:GetText() return self.text end
    function Methods:SetTextColor(r, g, b) self.color = { r, g, b } end
    function Methods:SetFontObject(font)
        assert(type(font) == "table" and font.GetFont, "font object expected")
        self.fontObject = font
        self.fontSize = select(2, font:GetFont())
    end
    function Methods:SetFont(path, size)
        assert(type(path) == "string" and type(size) == "number", "SetFont(path, size)")
        self.fontSize = size
    end
    local function plainText(w)
        return (tostring(w.text or ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
    end
    -- 6 per character, 12 for a wide one (Chinese, Japanese, Korean: from U+3000), bytes of a
    -- character counted once.
    local function measure(text)
        local width = 0
        for lead in text:gmatch("[^\128-\191]") do
            width = width + (lead:byte() >= 0xE3 and 12 or 6)
        end
        return width
    end
    -- Like the modern client, the measure is bounded by a width already set (0 = none).
    function Methods:GetStringWidth()
        local full = measure(plainText(self))
        if self.w and self.w > 0 then return math.min(full, self.w) end
        return full
    end
    function Methods:GetStringHeight()
        local plain = plainText(self)
        if plain == "" then return 0 end
        local width = (self.w and self.w > 0) and self.w or 300
        local perLine = math.max(1, math.floor(width / 6))
        return (self.fontSize or 12) * math.ceil(#plain / perLine)
    end
    function Methods:SetTexture(path)
        assert(type(path) == "string" or type(path) == "number", "texture path or file id expected")
        self.texture = path
    end
    function Methods:SetValue(v) assert(type(v) == "number" and v == v, "bad value"); self.value = v end
    function Methods:GetValue() return self.value or 0 end
    function Methods:SetChecked(v) self.checked = not not v end
    function Methods:GetChecked() return self.checked end
    function Methods:SetEnabled(v) self.enabled = not not v end
    function Methods:SetBackdropColor() assert(self.backdrop, "SetBackdrop first") end
    function Methods:SetBackdropBorderColor() assert(self.backdrop, "SetBackdrop first") end
    function Methods:SetScrollChild(child) self.scrollChild = child end
    function Methods:GetVerticalScrollRange() return 0 end
    -- Edit boxes (the import window): the focus and the selection; SetText does not fire
    -- OnTextChanged as typed (H.type does). A box that loses the keyboard runs its
    -- OnEditFocusLost right away, in the execution that took the keyboard from it.
    local focusedEdit
    local function focusLost(edit)
        local fn = edit.scripts and edit.scripts.OnEditFocusLost
        if fn then fn(edit) end
    end
    function Methods:SetMultiLine(v) self.multiLine = v and true or false end
    function Methods:SetAutoFocus(v) self.autoFocus = v and true or false end
    function Methods:SetMaxLetters(n) assert(type(n) == "number", "SetMaxLetters(n)") end
    function Methods:SetFocus()
        local previous = focusedEdit
        focusedEdit = self
        if previous and previous ~= self then focusLost(previous) end
    end
    function Methods:ClearFocus()
        if focusedEdit ~= self then return end
        focusedEdit = nil
        focusLost(self)
    end
    _G.GetCurrentKeyBoardFocus = function() return focusedEdit end
    function Methods:HasFocus() return focusedEdit == self end
    function Methods:HighlightText(from, to) self.selection = { from or 0, to or -1 } end
    function Methods:SetVerticalScroll(v)
        assert(type(v) == "number" and v >= 0, "bad scroll")
        self.scroll = v
    end
    function Methods:GetVerticalScroll() return self.scroll or 0 end
    function Methods:SetOwner(owner)
        self.owner, self.lines = owner, {}
    end
    function Methods:AddLine(text) self.lines = self.lines or {}; self.lines[#self.lines + 1] = text end
    function Methods:SetCooldown(start, duration)
        assert(type(start) == "number" and type(duration) == "number", "SetCooldown(start, duration)")
        self.cooldownStart, self.cooldownDuration = start, duration
    end
    function Methods:GetOwner() return self.owner end
    function Methods:SetItemByID(id)
        assert(type(id) == "number", "SetItemByID expects an item id")
        self.text = "item " .. id
    end
    function Methods:SetSpellByID(id)
        assert(type(id) == "number", "SetSpellByID expects a spell id")
        self.text = "spell " .. id
    end
    function Methods:SetTalent(tab, index)
        assert(type(tab) == "number" and type(index) == "number", "SetTalent(tab, index)")
        self.text = "talent " .. tab .. ":" .. index
    end

    -- Animation groups finish at once unless they loop.
    local function newAnimationGroup()
        local group = { anims = {}, scripts = {}, playing = false }
        function group:CreateAnimation(kind)
            assert(kind == "Alpha" or kind == "Scale" or kind == "Translation", "animation type " .. tostring(kind))
            local anim = {}
            for _, m in ipairs({ "SetDuration", "SetOrder", "SetScaleFrom", "SetScaleTo" }) do
                anim[m] = noop
            end
            function anim:SetFromAlpha(a) self.fromAlpha = a end
            function anim:SetToAlpha(a) self.toAlpha = a end
            self.anims[#self.anims + 1] = anim
            return anim
        end
        function group:SetLooping(mode) self.looping = mode end
        function group:SetScript(name, fn) self.scripts[name] = fn end
        function group:Play()
            if self.looping and self.looping ~= "NONE" then
                self.playing = true
            elseif self.scripts.OnFinished then
                self.scripts.OnFinished(self)
            end
        end
        function group:Stop() self.playing = false end
        function group:IsPlaying() return self.playing end
        return group
    end
    Methods.CreateAnimationGroup = function() return newAnimationGroup() end

    -- Protected frames: what the client forbids in combat (InCombatLockdown).
    local PROTECTED = { "Show", "Hide", "SetPoint", "ClearAllPoints", "SetAllPoints", "SetScale", "SetSize",
        "SetWidth", "SetHeight", "SetParent", "SetAttribute" }
    local inCombat = false
    local fire    -- events to Ding's frames, defined once Ding is loaded (below)
    local function protect(methods)
        function methods:SetAttribute(name, value)
            self.attributes = self.attributes or {}
            self.attributes[name] = value
        end
        function methods:GetAttribute(name) return self.attributes and self.attributes[name] end
        for _, m in ipairs(PROTECTED) do
            local base = methods[m]
            methods[m] = function(self, ...)
                if inCombat then error("protected frame: " .. m .. " in combat", 2) end
                return base(self, ...)
            end
        end
    end

    local newWidget
    function newWidget(kind, parent, template)
        local w = { kind = kind, parent = parent, children = {} }
        local methods = setmetatable({}, { __index = Methods })
        if template == "BackdropTemplate" then
            methods.SetBackdrop = function(self, b) self.backdrop = b end
        elseif template == "SecureActionButtonTemplate" then
            assert(kind == "Button", "secure action template on a " .. kind)
            assert(not inCombat, "secure frame created in combat")
            w.protected = true
            protect(methods)
        elseif template == "CooldownFrameTemplate" then
            assert(kind == "Cooldown", "cooldown template on a " .. kind)
        elseif template ~= nil then
            error("unexpected template " .. tostring(template), 3)
        end
        function methods:CreateFontString(_, _, font)
            assert(font == nil, "font templates may be missing on Forever: use SetFontObject")
            local fs = newWidget("FontString", self)
            self.children[#self.children + 1] = fs
            return fs
        end
        function methods:CreateTexture(_, layer)
            local t = newWidget("Texture", self)
            t.layer = layer
            self.children[#self.children + 1] = t
            return t
        end
        function methods:CreateMaskTexture()
            local t = newWidget("MaskTexture", self)
            self.children[#self.children + 1] = t
            return t
        end
        function methods:GetHighlightTexture()
            self.highlight = self.highlight or newWidget("Texture", self)
            return self.highlight
        end
        setmetatable(w, { __index = function(_, k)
            local m = methods[k]
            if m == nil and type(k) == "string" and k:find("^%u") then
                error("unknown widget method: " .. k, 2)
            end
            return m
        end })
        allWidgets[#allWidgets + 1] = w
        return w
    end

    ---------------------------------------------------------------------------
    -- Game state and API
    -- The quest title the client shows, in its own language: Ding/DB's names of that
    -- language when Ding is loaded, else QuestieDB's English one.
    local function clientTitle(q)
        local db = _G.Ding and _G.Ding.DB
        return db and db.names.quests[q] or QuestDB.name(q)
    end
    -- The same for an NPC, object or item name (the quest log's objectives, the XP messages).
    local function clientName(kind, id)
        local db = _G.Ding and _G.Ding.DB
        local base = ({ npcs = NpcDB, objects = ObjectDB, items = ItemDB })[kind].name(id)
        return db and db.names[kind][id] or base
    end
    ---------------------------------------------------------------------------
    local player = { level = 1, xp = 0, rested = 0, race = "NightElf", class = "WARRIOR", faction = "Alliance",
        x = 50, y = 50 }
    local log, completed, logOrder = {}, {}, {}
    local timers = {}
    local inInstance = false
    local modifiers = {}
    local bindings = { ["SHIFT-PADDRIGHT"] = "DING_NEXT", ["SHIFT-PADDLEFT"] = "DING_PREV" }
    local overrides = {}       -- [owner] = { [key] = button name }
    local registered = {}      -- AddOns category

    local LOCALE = opts.locale or "frFR"
    _G.GetLocale = function() return LOCALE end
    _G.CreateFrame = function(kind, name, parent, template)
        local f = newWidget(kind, parent, template)
        if name then _G[name] = f end
        return f
    end
    _G.UIParent = newWidget("Frame")
    function UIParent:GetTop() return 768 end
    _G.Minimap = newWidget("Frame")
    Minimap:SetSize(140, 140)
    function Minimap:GetZoom() return 0 end
    _G.GetCursorPosition = function() return 400, 300 end
    _G.GameTooltip = newWidget("GameTooltip")
    _G.DEFAULT_CHAT_FRAME = { AddMessage = function(_, msg)
        say("   [chat] " .. msg:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
    end }
    _G.SlashCmdList = {}
    -- Actions only the Blizzard UI may take: run in an execution an addon tainted, the game
    -- refuses them with ADDON_ACTION_FORBIDDEN, whose popup offers to disable the addon.
    -- `secure` is true only while the mock plays the game's own input (H.chat, H.closeChat):
    -- everything a test calls in Ding, and all that follows from it, is tainted.
    local secure = false
    local function blizzardOnly(name)
        if not secure then problem("ADDON_ACTION_FORBIDDEN: Ding's execution reached " .. name) end
    end
    _G.SetGamePadCursorControl = function() blizzardOnly("SetGamePadCursorControl") end
    -- The game's chat box with its gamepad interface on: losing the keyboard takes the chat
    -- out of the gamepad navigation, which gives the stick back to the cursor (Blizzard only).
    -- After a message the box keeps the keyboard, emptied, until the player closes it.
    local chatBox = newWidget("EditBox", UIParent)
    _G.ChatFrame1EditBox = chatBox
    chatBox:SetScript("OnEditFocusLost", function() SetGamePadCursorControl(false) end)
    _G.BackdropTemplateMixin = {}
    _G.TOOLTIP_DEFAULT_COLOR = { r = 1, g = 1, b = 1 }
    _G.TOOLTIP_DEFAULT_BACKGROUND_COLOR = { r = 0.09, g = 0.09, b = 0.19 }
    -- Game time only moves in tick(); flush() runs what is due, plus short debounces.
    local now = 0
    _G.C_Timer = { After = function(delay, fn) timers[#timers + 1] = { due = now + delay, fn = fn } end }
    _G.GetTime = function() return now end
    _G.date = os.date
    _G.UnitLevel = function() return player.level end
    -- Classic experience from one level to the next.
    local XP_PER_LEVEL = {
        400, 900, 1400, 2100, 2800, 3600, 4500, 5400, 6500, 7600,
        8800, 10100, 11400, 12900, 14400, 16000, 17700, 19400, 21300, 23200,
        25200, 27300, 29400, 31700, 34000, 36400, 38900, 41400, 44300, 47400,
        50800, 54500, 58600, 62800, 67100, 71600, 76100, 80800, 85700, 90700,
        95800, 101000, 106300, 111800, 117500, 123200, 129100, 135100, 141200, 147500,
        153900, 160400, 167100, 173900, 180800, 187900, 195000, 202300, 209800,
    }
    _G.UnitXP = function() return player.xp end
    _G.UnitXPMax = function() return XP_PER_LEVEL[player.level] or 0 end
    -- Rested experience: nil when there is none, like the client.
    _G.GetXPExhaustion = function() return player.rested > 0 and player.rested or nil end
    _G.BreakUpLargeNumbers = function(n)
        local s = tostring(math.floor(n))
        while true do
            local done
            s, done = s:gsub("^(%d+)(%d%d%d)", "%1,%2")
            if done == 0 then return s end
        end
    end
    _G.UnitRace = function() return player.race, player.race end
    _G.UnitClass = function() return player.class, player.class end
    _G.UnitFactionGroup = function() return player.faction end
    -- Font objects; NumberFontNormalLarge is left out on purpose to exercise the fallback.
    local function fontObject(size) return { GetFont = function() return "Fonts\\FRIZQT__.TTF", size, "" end } end
    for name, size in pairs({ GameFontNormal = 12, GameFontHighlight = 12, GameFontHighlightSmall = 10,
        GameFontNormalLarge = 16, GameFontHighlightLarge = 16, GameFontDisable = 12,
        NumberFontNormal = 14, NumberFontNormalSmall = 12 }) do
        _G[name] = fontObject(size)
    end
    _G.STANDARD_TEXT_FONT = "Fonts\\FRIZQT__.TTF"
    -- Fonts created by Ding: a file under Interface\AddOns\Ding must exist in the repository.
    local fonts = {}
    _G.CreateFont = function(name)
        assert(type(name) == "string" and not fonts[name], "CreateFont: unique name expected")
        local font = { name = name }
        function font:SetFont(path, size, flags)
            assert(type(path) == "string" and type(size) == "number" and type(flags) == "string",
                "Font:SetFont(path, size, flags)")
            local prefix = "Interface\\AddOns\\Ding\\"
            if path:sub(1, #prefix) == prefix then
                local handle = io.open(root .. "/Ding/" .. path:sub(#prefix + 1):gsub("\\", "/"), "rb")
                if not handle then return false end
                handle:close()
            end
            self.path, self.size = path, size
            return true
        end
        function font:GetFont() return self.path, self.size, "" end
        fonts[name] = font
        _G[name] = font
        return font
    end
    -- Objective formats of the client, as Forever ships them: positional placeholders and
    -- the |4singular:plural; grammar in French. Lua's format does not take positional
    -- placeholders: objectiveText() writes the texts the way the client shows them.
    if LOCALE == "frFR" then
        _G.QUEST_MONSTERS_KILLED = "%1$s : %2$d/%3$d |4personnage tué:personnages tués;"
        _G.QUEST_ITEMS_NEEDED = "%1$s : %2$d/%3$d"
        _G.QUEST_OBJECTS_FOUND = "%1$s : %2$d/%3$d"
        _G.COMBATLOG_XPGAIN_FIRSTPERSON = "%1$s meurt, vous gagnez %2$d points d'expérience."
    else
        _G.COMBATLOG_XPGAIN_FIRSTPERSON = "%s dies, you gain %d experience."
        _G.QUEST_MONSTERS_KILLED = "%s slain: %d/%d"
        _G.QUEST_ITEMS_NEEDED = "%s: %d/%d"
        _G.QUEST_OBJECTS_FOUND = "%s: %d/%d"
    end
    local function objectiveText(kind, name, have, need)
        if LOCALE == "frFR" then return ("%s : %d/%d"):format(name, have, need) end
        if kind == "monster" then return ("%s slain: %d/%d"):format(name, have, need) end
        return ("%s: %d/%d"):format(name, have, need)
    end
    -- Errors sent to the game's error frame (Ding:Safe) are problems too.
    _G.geterrorhandler = function()
        return function(err) problem("Lua error (game error frame): " .. tostring(err)) end
    end
    _G.GetBindingKey = function(action)
        local keys = {}
        for key, a in pairs(bindings) do if a == action then keys[#keys + 1] = key end end
        table.sort(keys)
        return unpack(keys)
    end
    _G.GetBindingAction = function(key) return bindings[key] or "" end
    _G.GetBindingText = function(key) return key end
    _G.SetBinding = function(key, action)
        assert(not inCombat, "SetBinding in combat")
        bindings[key] = action
    end
    _G.SaveBindings = function(set) assert(set == 1 or set == 2, "binding set") end
    _G.GetCurrentBindingSet = function() return 2 end
    _G.GetCVar = function(name)
        return ({ GamePadEmulateShift = "PADLTRIGGER", GamePadEmulateCtrl = "PADRTRIGGER", GamePadEmulateAlt = "NONE",
            GamePadEnable = "1", rotateMinimap = "0" })[name]
    end
    _G.IsIndoors = function() return false end
    -- Spells the player knows (H.learnSpell) and their cooldowns (H.setSpellCooldown).
    local knownSpells, spellCooldowns = {}, {}
    _G.IsSpellKnown = function(id) return knownSpells[id] == true end
    _G.GetSpellCooldown = function(id)
        local c = spellCooldowns[id]
        return c and c.start or 0, c and c.duration or 0, 1
    end
    local SPELL_NAMES = { [3561] = "Teleport: Stormwind", [3562] = "Teleport: Ironforge", [3565] = "Teleport: Darnassus",
        [3567] = "Teleport: Orgrimmar", [3563] = "Teleport: Undercity", [3566] = "Teleport: Thunder Bluff",
        [18960] = "Teleport: Moonglade" }
    _G.GetSpellInfo = function(id) return SPELL_NAMES[id] or ("Spell " .. tostring(id)), nil, 136235 end
    _G.GetSpellTexture = function() return 136235 end
    _G.IsUsableSpell = function(id) return knownSpells[id] == true, false end
    -- Talents: the same small tree for every class (made-up names), the points free
    -- (H.setTalentPoints) and the ranks learned; LearnTalent follows the client's rules
    -- (a free point, 5 points in the tree per tier, the prerequisite at its last rank).
    local TALENT_TABS = {
        { name = "Tab One", talents = {
            { name = "Sharp Edge", tier = 1, column = 1, maxRank = 3 },
            { name = "Thick Skin", tier = 1, column = 2, maxRank = 5 },
            { name = "Quick Hands", tier = 2, column = 1, maxRank = 2 },
            { name = "Deep Cuts", tier = 2, column = 2, maxRank = 3, prereq = { 1, 2 } },
            { name = "Last Stand", tier = 3, column = 2, maxRank = 1 },
        } },
        { name = "Tab Two", talents = {
            { name = "Iron Will", tier = 1, column = 1, maxRank = 5 },
            { name = "Steady Aim", tier = 2, column = 3, maxRank = 3 },
        } },
        { name = "Tab Three", talents = {
            { name = "Calm Mind", tier = 1, column = 2, maxRank = 5 },
        } },
    }
    local talentRanks, talentPoints, talentCalls = {}, 0, {}
    local function talentRank(tab, i) return talentRanks[tab .. ":" .. i] or 0 end
    local function spentIn(tab)
        local n = 0
        for i in ipairs(TALENT_TABS[tab].talents) do n = n + talentRank(tab, i) end
        return n
    end
    local function talentAt(tab, tier, column)
        for i, t in ipairs(TALENT_TABS[tab].talents) do
            if t.tier == tier and t.column == column then return i, t end
        end
    end
    _G.GetNumTalentTabs = function() return #TALENT_TABS end
    _G.GetNumTalents = function(tab) return TALENT_TABS[tab] and #TALENT_TABS[tab].talents or 0 end
    _G.GetTalentInfo = function(tab, i)
        local t = TALENT_TABS[tab] and TALENT_TABS[tab].talents[i]
        if not t then return nil end
        return t.name, 132090, t.tier, t.column, talentRank(tab, i), t.maxRank, false, true
    end
    _G.GetTalentPrereqs = function(tab, i)
        local t = TALENT_TABS[tab] and TALENT_TABS[tab].talents[i]
        if not (t and t.prereq) then return nil end
        local pi, pt = talentAt(tab, t.prereq[1], t.prereq[2])
        return t.prereq[1], t.prereq[2], talentRank(tab, pi) >= pt.maxRank
    end
    _G.UnitCharacterPoints = function(unit)
        assert(unit == "player", "UnitCharacterPoints: player only")
        return talentPoints, 0
    end
    _G.LearnTalent = function(tab, i)
        assert(not inCombat, "LearnTalent in combat")
        talentCalls[#talentCalls + 1] = tab .. ":" .. i
        local t = TALENT_TABS[tab] and TALENT_TABS[tab].talents[i]
        if not t or talentPoints <= 0 or talentRank(tab, i) >= t.maxRank then return end
        if spentIn(tab) < (t.tier - 1) * 5 then return end
        if t.prereq then
            local pi, pt = talentAt(tab, t.prereq[1], t.prereq[2])
            if talentRank(tab, pi) < pt.maxRank then return end
        end
        talentRanks[tab .. ":" .. i] = talentRank(tab, i) + 1
        talentPoints = talentPoints - 1
        fire("CHARACTER_POINTS_CHANGED", -1)
    end
    -- Gamepad enabled (the GamePadEnable CVar, read again each time: tests change it) and
    -- plugged in (H.setGamepadConnected).
    local padConnected = true
    _G.C_GamePad = {
        IsEnabled = function() return _G.GetCVar("GamePadEnable") == "1" end,
        GetAllDeviceIDs = function() return padConnected and { 0 } or {} end,
    }
    _G.IsShiftKeyDown = function() return modifiers.shift end
    _G.IsControlKeyDown = function() return modifiers.ctrl end
    _G.IsAltKeyDown = function() return modifiers.alt end
    _G.InCombatLockdown = function() return inCombat end
    _G.IsInInstance = function() return inInstance, inInstance and "party" or "none" end
    _G.SetOverrideBindingClick = function(owner, _, key, name)
        assert(not inCombat, "override binding in combat")
        assert(_G[name], "no button named " .. tostring(name))
        overrides[owner] = overrides[owner] or {}
        overrides[owner][key] = name
    end
    _G.ClearOverrideBindings = function(owner)
        assert(not inCombat, "ClearOverrideBindings in combat")
        overrides[owner] = nil
    end
    _G.UISpecialFrames = {}
    _G.PlaySound = function() end
    _G.SOUNDKIT = { IG_QUEST_LIST_COMPLETE = 618 }
    _G.Settings = {
        RegisterCanvasLayoutCategory = function(panel, name) return { panel = panel, name = name } end,
        RegisterAddOnCategory = function(category) registered[#registered + 1] = category end,
        OpenToCategory = function() problem("Ding opens a category of the game options (taint)") end,
        KEYBINDINGS_CATEGORY_ID = 1,
    }
    -- Driving Blizzard's frames from an addon taints them; on Forever their secret values then
    -- fail by the dozen and the game offers to disable the addon. Ding must never do it.
    for _, name in ipairs({ "HideUIPanel", "ShowUIPanel", "ToggleQuestLog", "QuestLog_OpenToQuest",
        "QuestMapFrame_OpenToQuestDetails", "KeyBindingFrame_LoadUI", "ToggleWorldMap", "OpenWorldMap" }) do
        _G[name] = function() problem("Ding calls " .. name .. " (taints the game's interface)") end
    end
    _G.GetPlayerFacing = function() return 0 end
    -- Secret values (Forever): an addon may not compare them nor compute with them. A
    -- table stands in for one: comparing it with a number errors, like in the client.
    local SECRET = setmetatable({}, { __tostring = function() return "<secret>" end })
    _G.issecretvalue = function(v) return rawequal(v, SECRET) end
    -- In the client a secret is a number: type() and tonumber() let it through.
    local rawType, rawToNumber = type, tonumber
    _G.type = function(v) if rawequal(v, SECRET) then return "number" end return rawType(v) end
    _G.tonumber = function(v, ...) if rawequal(v, SECRET) then return v end return rawToNumber(v, ...) end
    _G.GetUnitSpeed = function() return SECRET, SECRET, SECRET, SECRET end
    -- Death: ghost after release, corpse somewhere on a map.
    local ghost, corpse, dead = false, nil, false
    _G.UnitIsGhost = function(unit) return unit == "player" and ghost end
    _G.UnitIsDeadOrGhost = function(unit) return unit == "player" and (dead or ghost) end
    -- Hearthstone: where it is bound (player.bind), nil before the first inn.
    _G.GetBindLocation = function() return player.bind end
    _G.C_DeathInfo = {
        GetCorpseMapPosition = function(map)
            if corpse and corpse.map == map then return { x = corpse.x / 100, y = corpse.y / 100 } end
            return nil
        end,
    }
    _G.CreateVector2D = function(x, y) return { x = x, y = y } end
    -- Metadata straight from the "## Field: value" lines of Ding.toc, as the game reads them.
    _G.C_AddOns = {
        GetAddOnMetadata = function(_, field)
            for line in io.lines(root .. "/Ding/Ding.toc") do
                local key, value = line:gsub("", ""):match("^##%s*([^:]+):%s*(.-)%s*$")
                if key == field then return value end
            end
            return nil
        end,
        IsAddOnLoaded = function() return false, false end,
    }
    -- Legacy functions that exist but fail on Forever: Ding must survive them.
    _G.IsAddOnLoaded = function() error("legacy IsAddOnLoaded is broken") end
    _G.GetQuestLogIndexByID = function() error("legacy GetQuestLogIndexByID is broken") end
    _G.GetQuestLogTitle = function() error("legacy GetQuestLogTitle is broken") end

    -- Bags: items[id] = { count, use = bool, icon = file id, start, duration,
    -- unusable = bool, range = true / false (with a target) }.
    local items, specialItems, itemUses, macroUses = {}, {}, {}, {}
    local bagSlots    -- the bags' slots (defined with the bags, below)
    local hasTarget = false
    _G.C_Item = {
        -- Like the client: the copies in the bags (H.setItem's counts and H.putInBag's slots).
        GetItemCount = function(id)
            local n = items[id] and items[id].count or 0
            for _, b in pairs(bagSlots()) do
                for _, it in pairs(b.slots) do if it.id == id then n = n + (it.count or 1) end end
            end
            return n
        end,
        GetItemIconByID = function(id) return items[id] and items[id].icon or 134400 end,
        GetItemNameByID = function(id) return "item " .. id end,
        GetItemSpell = function(id)
            if items[id] and items[id].use then return "Use " .. id, 1000 + id end
            return nil
        end,
        IsUsableItem = function(id) return not (items[id] and items[id].unusable), false end,
        IsItemInRange = function(id, unit)
            assert(unit == "target", "IsItemInRange(item, unit)")
            if not hasTarget or not items[id] then return nil end
            return items[id].range
        end,
    }
    -- Item facts (H.setItemInfo): { name, quality, equipLoc, sellPrice, stats, usable }; the
    -- client answers by id or by link, nil for an item it has not loaded.
    local itemInfo, equipped = {}, {}
    local function itemID(item)
        if type(item) == "number" then return item end
        return tonumber(tostring(item):match("item:(%d+)"))
    end
    local function itemLink(id)
        return "|cff1eff00|Hitem:" .. id .. "::::::::20:::::::|h[" .. (itemInfo[id] and itemInfo[id].name or "item") .. "]|h|r"
    end
    C_Item.GetItemInfo = function(item)
        local id = itemID(item)
        local it = id and itemInfo[id]
        if not it then return nil end
        return it.name, itemLink(id), it.quality or 2, 20, it.minLevel or 1, "Armor", "Mail", 1, it.equipLoc or "",
            134400, it.sellPrice or 0
    end
    C_Item.GetItemStats = function(link)
        local id = itemID(link)
        local it = id and itemInfo[id]
        if not it then return nil end
        local out = {}
        for k, v in pairs(it.stats or {}) do out[k] = v end
        return out
    end
    _G.GetInventoryItemLink = function(unit, slot)
        assert(unit == "player", "GetInventoryItemLink(unit, slot)")
        return equipped[slot] and itemLink(equipped[slot]) or nil
    end
    _G.GetInventoryItemID = function(unit, slot)
        assert(unit == "player", "GetInventoryItemID(unit, slot)")
        return equipped[slot]
    end
    -- Item facts without loading: classID (4 armor, 2 weapon) and subclassID from H.setItemInfo.
    C_Item.GetItemInfoInstant = function(item)
        local id = itemID(item)
        local it = id and itemInfo[id]
        if not it then return nil end
        return id, "Armor", "Mail", it.equipLoc or "", 134400, it.classID, it.subclassID
    end
    _G.UnitExists = function(unit) return unit == "target" and hasTarget end
    -- The target's name (H.setTarget("name")), the group, raid markers.
    local targetName, inGroup, raidMarks = nil, false, {}
    local npcName = nil       -- the NPC whose window is open (H.setNpcName)
    local npcID = nil         -- its creature id (an NPC of H.talk with an `id`)
    _G.UnitGUID = function(unit)
        if unit == "npc" and npcID then return ("Creature-0-4170-0-12-%d-00002A3B4C"):format(npcID) end
        if unit == "player" then return "Player-4170-00000001" end
        return nil
    end
    _G.UnitName = function(unit)
        if unit == "target" then return targetName end
        if unit == "npc" then return npcName end
        if unit == "player" then return "Player" end
        return nil
    end
    _G.IsInGroup = function() return inGroup end
    _G.GetRaidTargetIndex = function(unit) return unit == "target" and targetName and raidMarks[targetName] or nil end
    _G.SetRaidTarget = function(unit, icon)
        assert(unit == "target" and type(icon) == "number", "SetRaidTarget(unit, icon)")
        if targetName then raidMarks[targetName] = icon end
    end

    -- Bags: bags[bag] = { size, slots = { [slot] = { id, count } } } (backpack 16, others empty).
    local bags = {}
    local function resetBags()
        bags = { [0] = { size = 16, slots = {} } }
        for bag = 1, 4 do bags[bag] = { size = 0, slots = {} } end
    end
    resetBags()
    bagSlots = function() return bags end
    -- Merchant open: { canRepair, repairCost }; what was sold.
    local merchant, money, sold = nil, 0, {}
    _G.C_Container = {
        GetItemCooldown = function(id)
            local it = items[id]
            return it and it.start or 0, it and it.duration or 0, 1
        end,
        GetContainerNumSlots = function(bag) return bags[bag] and bags[bag].size or 0 end,
        GetContainerNumFreeSlots = function(bag)
            local b = bags[bag]
            if not b then return 0, 0 end
            local used = 0
            for slot in pairs(b.slots) do if slot <= b.size then used = used + 1 end end
            return b.size - used, 0
        end,
        GetContainerItemInfo = function(bag, slot)
            local it = bags[bag] and bags[bag].slots[slot]
            if not it then return nil end
            local info = itemInfo[it.id] or {}
            return { itemID = it.id, hyperlink = itemLink(it.id), stackCount = it.count or 1,
                quality = info.quality or 1, hasNoValue = (info.sellPrice or 0) == 0 }
        end,
        -- At a merchant, using an item sells it.
        UseContainerItem = function(bag, slot)
            local it = bags[bag] and bags[bag].slots[slot]
            if not it then return end
            assert(merchant, "UseContainerItem away from a merchant in the tests")
            bags[bag].slots[slot] = nil
            money = money + ((itemInfo[it.id] or {}).sellPrice or 0) * (it.count or 1)
            sold[#sold + 1] = it.id
        end,
    }
    _G.CanMerchantRepair = function() return merchant ~= nil and merchant.canRepair == true end
    _G.GetRepairAllCost = function()
        local cost = merchant and merchant.repairCost or 0
        return cost, cost > 0
    end
    _G.RepairAllItems = function()
        assert(merchant and merchant.canRepair, "RepairAllItems without a repairer")
        assert(money >= merchant.repairCost, "RepairAllItems without the money")
        money = money - merchant.repairCost
        merchant.repaired, merchant.repairCost = merchant.repairCost, 0
    end
    _G.GetMoney = function() return money end
    -- Bound items (H.setItemInfo { bound = true }) and equipping from the bags: the worn item
    -- goes where the new one was.
    _G.ItemLocation = {
        CreateFromBagAndSlot = function(_, bag, slot) return { bag = bag, slot = slot } end,
    }
    C_Item.IsBound = function(location)
        local it = bags[location.bag] and bags[location.bag].slots[location.slot]
        return it ~= nil and (itemInfo[it.id] or {}).bound == true
    end
    C_Item.EquipItemByName = function(link)
        assert(not inCombat, "EquipItemByName in combat")
        local id = itemID(link)
        for bag, b in pairs(bags) do
            for slot, it in pairs(b.slots) do
                if it.id == id then
                    local loc = (itemInfo[id] or {}).equipLoc
                    local target = ({ INVTYPE_HAND = 10, INVTYPE_CHEST = 5, INVTYPE_ROBE = 5, INVTYPE_FEET = 8,
                        INVTYPE_HEAD = 1, INVTYPE_LEGS = 7, INVTYPE_WEAPON = 16, INVTYPE_2HWEAPON = 16 })[loc]
                    assert(target, "EquipItemByName: no slot for " .. tostring(loc))
                    local worn = equipped[target]
                    equipped[target] = id
                    b.slots[slot] = worn and { id = worn, count = 1 } or nil
                    fire("PLAYER_EQUIPMENT_CHANGED", target)
                    return
                end
            end
        end
    end
    -- Class trainer services (H.setTrainerServices): { name, category, level, cost }.
    local trainerServices = {}
    _G.GetNumTrainerServices = function() return #trainerServices end
    _G.GetTrainerServiceInfo = function(i)
        local s = trainerServices[i]
        if not s then return nil end
        return s.name, "Rank 1", s.category
    end
    _G.GetTrainerServiceLevelReq = function(i) return trainerServices[i] and trainerServices[i].level or 0 end
    _G.GetTrainerServiceCost = function(i) return trainerServices[i] and trainerServices[i].cost or 0 end
    -- A trainer window: class (false) or profession (true).
    local professionTrainer = false
    _G.IsTradeskillTrainer = function() return professionTrainer end
    _G.ERR_NEWTAXIPATH = "New flight path discovered!"
    _G.GetItemSpell = function() error("legacy GetItemSpell is broken") end
    -- Quest log item (only on clients that have it): a link, like the client.
    _G.GetQuestLogSpecialItemInfo = function(index)
        local q = logOrder[index]
        local id = q and specialItems[q]
        if id then return "|cffffffff|Hitem:" .. id .. "::::::::1:::::::|h[item]|h|r", 134400, 1 end
        return nil
    end

    local function rebuildLogOrder()
        logOrder = {}
        for q in pairs(log) do logOrder[#logOrder + 1] = q end
        table.sort(logOrder)
    end

    _G.C_QuestLog = {
        IsQuestFlaggedCompleted = function(q) return completed[q] == true end,
        GetLogIndexForQuestID = function(q)
            for i, id in ipairs(logOrder) do if id == q then return i end end
            return nil
        end,
        IsComplete = function(q) return log[q] ~= nil and log[q].done end,
        GetNumQuestLogEntries = function() return #logOrder, #logOrder end,
        GetInfo = function(i)
            local q = logOrder[i]
            return q and { questID = q, isHeader = false, title = clientTitle(q) } or nil
        end,

        GetQuestObjectives = function(q)
            if not log[q] then return {} end
            local list = {}
            -- Like the client: localized text, type, counts.
            for i, name in ipairs(log[q].objectives) do
                local kind, done = (log[q].types or {})[i] or "monster", log[q].done
                list[#list + 1] = { text = objectiveText(kind, name, done and 1 or 0, 1), type = kind,
                    finished = done, numFulfilled = done and 1 or 0, numRequired = 1 }
            end
            return list
        end,
    }
    -- Two continents, like the client: the Eastern Kingdoms (instance 0, continent map 1415)
    -- and Kalimdor (instance 1, map 1414). A zone's percentages become world yards at the
    -- zone's own place on its continent: Teldrassil at the origin (51 yards per percent of x,
    -- 34 of y: the distances the tests count on), the other zones side by side. A continent
    -- map spans 40000 x 60000 yards.
    local EASTERN = { [1415] = true, [1453] = true, [1455] = true, [1458] = true }
    for map = 1416, 1437 do EASTERN[map] = true end
    local ZONE_W, ZONE_H, CONT_W, CONT_H = 3400, 5100, 40000, 60000
    local MAP_NAMES = { [1411] = "Durotar", [1413] = "The Barrens", [1414] = "Kalimdor", [1415] = "Eastern Kingdoms",
        [1420] = "Tirisfal Glades", [1429] = "Elwynn Forest", [1434] = "Stranglethorn Vale", [1436] = "Westfall",
        [1437] = "Wetlands", [1438] = "Teldrassil", [1439] = "Darkshore", [1445] = "Dustwallow Marsh",
        [1453] = "Stormwind City", [1455] = "Ironforge", [1457] = "Darnassus", [1431] = "Duskwood",
        [1433] = "Redridge Mountains" }
    -- Sub-maps (a dungeon, a cave) of a zone: { name, mapType 4 or 5, parent zone }.
    local SUB_MAPS = { [1581] = { name = "The Deadmines", mapType = 4, parent = 1436 } }
    local function place(map)
        if map == 1414 or map == 1415 then return map == 1415 and 0 or 1, 0, 0, CONT_W, CONT_H end
        local continent = EASTERN[map] and 0 or 1
        if map == 1438 or type(map) ~= "number" then return continent, 0, 0, ZONE_W, ZONE_H end
        local i = map % 50
        return continent, (i % 8 + 1) * 4000, math.floor(i / 8) * 6000, ZONE_W, ZONE_H
    end
    _G.C_Map = {
        GetBestMapForUnit = function() return player.map end,
        GetPlayerMapPosition = function() return { x = player.x / 100, y = player.y / 100 } end,
        GetWorldPosFromMapPos = function(map, pos)
            local continent, ox, oy, w, h = place(map)
            return continent, { x = ox + pos.y * w, y = oy + pos.x * h }
        end,
        -- The zone under a world position: the zones lie side by side (see place()).
        GetMapPosFromWorldPos = function(continent, pos)
            for map = 1411, 1458 do
                if map ~= 1414 and map ~= 1415 then
                    local c, ox, oy, w, h = place(map)
                    if c == continent and pos.x >= ox and pos.x <= ox + w and pos.y >= oy and pos.y <= oy + h then
                        return map, { x = (pos.y - oy) / h, y = (pos.x - ox) / w }
                    end
                end
            end
            return nil
        end,
        GetMapInfo = function(map)
            -- Real UiMapIDs are far below 90000: above, a map the client does not know.
            if type(map) ~= "number" or map >= 90000 then return nil end
            local sub = SUB_MAPS[map]
            if sub then return { mapID = map, name = sub.name, mapType = sub.mapType, parentMapID = sub.parent } end
            local continent = map == 1414 or map == 1415
            return { mapID = map, name = MAP_NAMES[map] or ("Map " .. tostring(map)), mapType = continent and 2 or 3,
                parentMapID = continent and 0 or (EASTERN[map] and 1415 or 1414) }
        end,
    }

    -- The client's map waypoint (user waypoint) and its super-tracking; a client without it:
    -- H.setWaypointApi(false). Positions are rounded like the client's (3 decimals).
    local userWaypoint, superTracked, waypointCalls = nil, false, 0
    _G.UiMapPoint = {
        CreateFromCoordinates = function(map, x, y)
            assert(type(map) == "number" and x >= 0 and x <= 1 and y >= 0 and y <= 1, "UiMapPoint(map, 0-1, 0-1)")
            return { uiMapID = map, position = { x = x, y = y } }
        end,
    }
    local waypointApi = {
        CanSetUserWaypointOnMap = function(map) return SUB_MAPS[map] == nil end,
        SetUserWaypoint = function(p)
            assert(type(p) == "table" and p.uiMapID, "SetUserWaypoint(UiMapPoint)")
            waypointCalls = waypointCalls + 1
            local round = function(v) return math.floor(v * 1000 + 0.5) / 1000 end
            userWaypoint = { uiMapID = p.uiMapID, position = { x = round(p.position.x), y = round(p.position.y) } }
        end,
        GetUserWaypoint = function() return userWaypoint end,
        ClearUserWaypoint = function() userWaypoint, superTracked = nil, false end,
    }
    for name, fn in pairs(waypointApi) do _G.C_Map[name] = fn end
    _G.C_SuperTrack = { SetSuperTrackedUserWaypoint = function(v) superTracked = v and true or false end }

    -- Flight map: open with its nodes ({ name, state 0 current / 1 reachable / 2 unreachable,
    -- position on the continent map 0-1, slotIndex }), the flight in progress.
    local taxi = { open = false, nodes = {}, onTaxi = false }
    _G.C_TaxiMap = {
        GetAllTaxiNodes = function(map)
            assert(map == 1414 or map == 1415, "GetAllTaxiNodes expects a continent map")
            if not taxi.open then return {} end
            local out = {}
            for i, n in ipairs(taxi.nodes) do
                out[i] = { nodeID = i, name = n.name, state = n.state, slotIndex = i,
                    position = { x = n.position.x, y = n.position.y } }
            end
            return out
        end,
    }
    _G.NumTaxiNodes = function() return taxi.open and #taxi.nodes or 0 end
    _G.TakeTaxiNode = function(index)
        assert(taxi.open and taxi.nodes[index], "TakeTaxiNode: no such node")
        taxi.taken, taxi.onTaxi = index, true
    end
    _G.UnitOnTaxi = function(unit) return unit == "player" and taxi.onTaxi end
    -- Mounted (H.setMounted); Dismount gets off, like the client out of combat.
    local mounted = false
    _G.IsMounted = function() return mounted end
    _G.Dismount = function()
        assert(not inCombat, "Dismount in combat")
        mounted = false
    end
    -- Like the client's: the hook runs after the function, which it never changes.
    _G.hooksecurefunc = function(name, fn)
        local original = assert(_G[name], "hooksecurefunc: no function " .. tostring(name))
        _G[name] = function(...)
            local results = { original(...) }
            fn(...)
            return unpack(results)
        end
    end

    ---------------------------------------------------------------------------
    -- QuestieDB built from the export, with the getter semantics of its docs/api.md
    ---------------------------------------------------------------------------
    local data = X.load(COMBINED)
    local FIELDS = {
        Quest = { name = 1, startedBy = 2, finishedBy = 3, requiredLevel = 4, questLevel = 5, requiredRaces = 6,
            requiredClasses = 7, triggerEnd = 9, objectives = 10, sourceItemId = 11, preQuestGroup = 12,
            preQuestSingle = 13 },
        Npc = { name = 1, minLevel = 4, maxLevel = 5, rank = 6, spawns = 7, friendlyToFaction = 13, subName = 14,
            npcFlags = 15 },
        Object = { name = 1, spawns = 4 },
        Item = { name = 1, npcDrops = 2, objectDrops = 3 },
    }
    local NEVER_NIL = { startedBy = true, finishedBy = true, objectives = true }
    local NUMBERS = { requiredLevel = true, sourceItemId = true, questLevel = true, requiredRaces = true,
        minLevel = true, maxLevel = true, rank = true, npcFlags = true,
        requiredClasses = true }
    local function copy(v)
        if type(v) ~= "table" then return v end
        local t = {}
        for k, x in pairs(v) do t[k] = copy(x) end
        return t
    end
    local function entity(kind)
        local db = { Exists = function(id) return data[kind][id] ~= nil end }
        function db.GetAllIds()
            local ids = {}
            for id in pairs(data[kind]) do ids[#ids + 1] = id end
            table.sort(ids)
            return ids
        end
        -- Base data, never localized (QuestieDB's GetRaw): fields by name.
        function db.GetRaw(id, key)
            local row = data[kind][id]
            local index = FIELDS[kind][key]
            if not row or not index then return nil end
            return copy(row[index])
        end
        for field, index in pairs(FIELDS[kind]) do
            db[field] = function(id)
                local row = data[kind][id]
                if not row then return nil end
                local v = row[index]
                if NUMBERS[field] then return v or 0 end
                if type(v) == "table" and next(v) == nil then v = nil end
                if v == nil and NEVER_NIL[field] then return {} end
                return copy(v)
            end
        end
        return db
    end
    _G.QuestDB, _G.NpcDB, _G.ItemDB, _G.ObjectDB = entity("Quest"), entity("Npc"), entity("Item"), entity("Object")

    -- AreaID -> UiMapID: QuestieDB's own table when the export sits in a QuestieDB checkout,
    -- else the zones of the first guides.
    local zonePrivate = { areaIdToUiMapId = "return { [141] = 1438, [188] = 1438, [1657] = 1457, [148] = 1439 }" }
    do
        local support = COMBINED:gsub("[/\\]src[/\\]corrections[/\\]Forever[/\\]combined[/\\]?$", "")
            .. "/support/Forever/Zones/areaIdToUiMapId.lua"
        local chunk = loadfile(support)
        if chunk then
            local private = {}
            setfenv(chunk, setmetatable({ QuestieLoader = { ImportModule = function() return { private = private } end } },
                { __index = _G }))
            if pcall(chunk) and private.areaIdToUiMapId then zonePrivate = private end
        end
        -- Dungeon entrances (the Deeprun Tram's too), as the Forever flavor loads them.
        local dungeons = loadfile((support:gsub("areaIdToUiMapId%.lua$", "dungeons.lua")))
        if dungeons then
            local expansions = setmetatable({ Current = 1 }, { __index = function() return 99 end })
            -- Called as QuestieLoader:ImportModule(name); the file reads the side at load (the
            -- Alliance's entrances; a few battlegrounds differ for the Horde).
            setfenv(dungeons, setmetatable({ QuestieLoader = { ImportModule = function(_, name)
                if name == "Expansions" then return expansions end
                return { private = zonePrivate }
            end }, UnitFactionGroup = function() return "Alliance" end }, { __index = _G }))
            pcall(dungeons)
        end
        zonePrivate.dungeons = zonePrivate.dungeons
            or { [2257] = { "Deeprun Tram", nil, 1519, { { 1519, 71.98, 27.61 }, { 1537, 84.1, 53.1 } } } }
    end
    _G.LibQuestieDB = {
        Support = { Get = function(name)
            assert(name == "ZoneDB", "unexpected support module " .. tostring(name))
            return { private = zonePrivate }
        end },
        l10n = { SetLocale = function() end },
    }

    ---------------------------------------------------------------------------
    -- Load the addon in .toc order
    ---------------------------------------------------------------------------
    -- opts.guides = list of shipped guide ids to keep (nil = all): unit tests name the
    -- guides they rely on, so they do not depend on how many guides Ding ships.
    local keep
    if opts.guides then
        keep = {}
        for _, id in ipairs(opts.guides) do keep[id] = true end
    end
    local ns = {}
    for line in io.lines(root .. "/Ding/Ding.toc") do
        line = line:gsub("\r", ""):gsub("%s+$", "")
        if line ~= "" and not line:find("^##") then
            local path = root .. "/Ding/" .. line:gsub("\\", "/")
            local chunk = assert(loadfile(path))
            local register = ns.RegisterGuide
            if keep and register and line:find("^Guides[/\\]") then
                ns.RegisterGuide = function(def)
                    if keep[def.id] then return register(def) end
                end
                chunk("Ding", ns)
                ns.RegisterGuide = register
            else
                chunk("Ding", ns)
            end
        end
    end
    -- Guide pack addons ("## Dependencies: Ding"): loaded after Ding, in their .toc order,
    -- each with its own namespace, as the game does.
    for _, dir in ipairs(opts.addons or {}) do
        local name = dir:gsub("[/\\]+$", ""):match("([^/\\]+)$")
        for line in io.lines(dir .. "/" .. name .. ".toc") do
            line = line:gsub("\r", ""):gsub("%s+$", "")
            if line ~= "" and not line:find("^#") then
                assert(loadfile(dir .. "/" .. line:gsub("\\", "/")))(name, {})
            end
        end
    end
    local Ding = _G.Ding
    -- The event bus reports handler errors through Ding:Debug: turn them into failures.
    local debug = Ding.Debug
    Ding.Debug = function(self, msg)
        if tostring(msg):find("^[%u_]+: ") then problem("Lua error in an event handler: " .. tostring(msg)) end
        return debug(self, msg)
    end

    local eventFrames = {}
    for _, w in ipairs(allWidgets) do if w.events then eventFrames[#eventFrames + 1] = w end end

    function fire(event, ...)
        for _, f in ipairs(eventFrames) do
            if f.events[event] then f.scripts.OnEvent(f, event, ...) end
        end
    end
    local function flush()
        for _ = 1, 20 do
            local due, later = {}, {}
            for _, t in ipairs(timers) do
                if t.due <= now + 0.5 then due[#due + 1] = t else later[#later + 1] = t end
            end
            timers = later
            if #due == 0 then return end
            for _, t in ipairs(due) do t.fn() end
        end
        problem("C_Timer loops forever")
    end

    -- The quest giver hands out the quest's source item; it goes away on turn-in.
    -- usable[itemID] = true gives it a "Use:" effect (QuestieDB does not say).
    local usable = {}
    local function giveSourceItem(q)
        local id = QuestDB.sourceItemId(q)
        if id and id ~= 0 then items[id] = { count = 1, use = usable[id] } end
    end
    local function takeSourceItem(q)
        local id = QuestDB.sourceItemId(q)
        if id and id ~= 0 then items[id] = nil end
    end

    ---------------------------------------------------------------------------
    -- NPC quest dialogs. talk(npc) opens the NPC's window; npc = { gives = { ids },
    -- ends = { ids }, greeting = bool (quest greeting instead of gossip),
    -- choices = { [questID] = number of reward choices } }. Like the Classic client,
    -- accepting or turning in a quest closes the window. dialogCalls records what Ding did.
    ---------------------------------------------------------------------------
    local dialog = {}          -- npc, kind ("gossip" | "greeting" | "detail" | "progress" | "complete"), quest
    local dialogCalls = {}
    local function record(what) dialogCalls[#dialogCalls + 1] = what end
    local function isDone(q) return log[q] ~= nil and log[q].done end
    local function lists()
        local active, available = {}, {}
        for _, q in ipairs(dialog.npc.ends or {}) do
            if log[q] then active[#active + 1] = q end
        end
        for _, q in ipairs(dialog.npc.gives or {}) do
            if not log[q] and not completed[q] then available[#available + 1] = q end
        end
        return active, available
    end
    local gossipOptions = {}  -- the dialogue's own lines (an NPC of H.talk with `options`)
    local function closeDialog()
        if not dialog.kind then return end
        local kind = dialog.kind
        dialog.kind, dialog.quest = nil, nil
        npcID, gossipOptions = nil, {}
        fire((kind == "gossip" or kind == "greeting") and "GOSSIP_CLOSED" or "QUEST_FINISHED")
    end
    local function openQuest(kind, q)
        dialog.kind, dialog.quest = kind, q
        fire(kind == "detail" and "QUEST_DETAIL" or "QUEST_PROGRESS")
    end
    _G.C_GossipInfo = {
        GetOptions = function()
            local out = {}
            for i, text in ipairs(gossipOptions) do out[i] = { gossipOptionID = 100 + i, name = text, orderIndex = i - 1 } end
            return out
        end,
        GetActiveQuests = function()
            assert(dialog.kind == "gossip", "GetActiveQuests outside gossip")
            local out = {}
            for _, q in ipairs((lists())) do
                out[#out + 1] = { questID = q, title = clientTitle(q), isComplete = isDone(q) }
            end
            return out
        end,
        GetAvailableQuests = function()
            assert(dialog.kind == "gossip", "GetAvailableQuests outside gossip")
            local out = {}
            local _, available = lists()
            for _, q in ipairs(available) do out[#out + 1] = { questID = q, title = clientTitle(q) } end
            return out
        end,
        SelectActiveQuest = function(q)
            assert(dialog.kind == "gossip", "SelectActiveQuest outside gossip")
            record("select-active " .. q)
            openQuest("progress", q)
        end,
        SelectAvailableQuest = function(q)
            assert(dialog.kind == "gossip", "SelectAvailableQuest outside gossip")
            record("select-available " .. q)
            openQuest("detail", q)
        end,
    }
    -- Quest greeting: same lists, by index and title.
    _G.GetNumActiveQuests = function() return dialog.kind == "greeting" and #(lists()) or 0 end
    _G.GetActiveTitle = function(i)
        local q = (lists())[i]
        return q and clientTitle(q), q and isDone(q)
    end
    _G.GetNumAvailableQuests = function()
        if dialog.kind ~= "greeting" then return 0 end
        local _, available = lists()
        return #available
    end
    _G.GetAvailableTitle = function(i)
        local _, available = lists()
        return available[i] and clientTitle(available[i])
    end
    _G.SelectActiveQuest = function(i)
        assert(dialog.kind == "greeting", "SelectActiveQuest outside greeting")
        local q = assert((lists())[i], "no active quest " .. tostring(i))
        record("select-active " .. q)
        openQuest("progress", q)
    end
    _G.SelectAvailableQuest = function(i)
        assert(dialog.kind == "greeting", "SelectAvailableQuest outside greeting")
        local _, available = lists()
        local q = assert(available[i], "no available quest " .. tostring(i))
        record("select-available " .. q)
        openQuest("detail", q)
    end
    _G.GetQuestID = function() return dialog.quest or 0 end
    _G.AcceptQuest = function()
        assert(dialog.kind == "detail", "AcceptQuest outside quest details")
        local q = dialog.quest
        record("accept " .. q)
        log[q] = { done = false, objectives = { "objective " .. q } }
        rebuildLogOrder()
        giveSourceItem(q)
        fire("QUEST_ACCEPTED", q)
        fire("QUEST_LOG_UPDATE")
        closeDialog()
    end
    _G.IsQuestCompletable = function() return dialog.kind == "progress" and isDone(dialog.quest) end
    _G.CompleteQuest = function()
        assert(dialog.kind == "progress" and isDone(dialog.quest), "CompleteQuest on a quest not ready")
        record("complete " .. dialog.quest)
        dialog.kind = "complete"
        fire("QUEST_COMPLETE")
    end
    -- Reward choices: npc.rewards[q] = { item ids } (facts from H.setItemInfo), or only their
    -- number, npc.choices[q].
    local function rewardList()
        return dialog.npc and (dialog.npc.rewards or {})[dialog.quest]
    end
    local function choiceCount()
        local list = rewardList()
        if list then return #list end
        return (dialog.npc.choices or {})[dialog.quest] or 0
    end
    _G.GetNumQuestChoices = function()
        return dialog.kind == "complete" and choiceCount() or 0
    end
    _G.GetQuestItemLink = function(kind, i)
        assert(kind == "choice" or kind == "reward", "GetQuestItemLink(kind, index)")
        local list = dialog.kind == "complete" and kind == "choice" and rewardList()
        local id = list and list[i]
        return id and itemLink(id) or nil
    end
    _G.GetQuestItemInfo = function(kind, i)
        local list = dialog.kind == "complete" and kind == "choice" and rewardList()
        local id = list and list[i]
        if not id then return nil end
        local it = itemInfo[id] or {}
        return it.name or "item", 134400, 1, it.quality or 2, it.usable ~= false
    end
    _G.GetQuestReward = function(choice)
        assert(dialog.kind == "complete", "GetQuestReward outside the reward window")
        local n = choiceCount()
        assert((n == 0 and choice == 0) or (choice >= 1 and choice <= n), "bad reward choice " .. tostring(choice))
        local q = dialog.quest
        record("reward " .. q .. " " .. choice)
        log[q], completed[q] = nil, true
        rebuildLogOrder()
        takeSourceItem(q)
        fire("QUEST_TURNED_IN", q, 0, 0)
        fire("QUEST_REMOVED", q)
        fire("QUEST_LOG_UPDATE")
        closeDialog()
    end
    local function talk(npc)
        closeDialog()
        dialog.npc = npc
        if npc.id then npcID, npcName = npc.id, clientName("npcs", npc.id) end
        gossipOptions = npc.options or {}
        dialog.kind = npc.greeting and "greeting" or "gossip"
        fire(npc.greeting and "QUEST_GREETING" or "GOSSIP_SHOW")
    end
    -- Single-quest NPC: the quest frame opens directly (or an item starts a quest).
    local function showQuest(npc, kind, q)
        closeDialog()
        dialog.npc = npc
        openQuest(kind, q)
    end

    ---------------------------------------------------------------------------
    -- Panel dump
    ---------------------------------------------------------------------------
    local function plain(s) return (tostring(s or ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")) end

    local function checkPanel(label)
        local P = Ding.Panel
        local f = P.frame
        if not f then
            if not P.reportedMissing then problem("panel not created") end
            P.reportedMissing = true
            return
        end
        if not f:IsShown() then return end
        local minHeight = P.compact and 28 or 60
        if (f.h or 0) < minHeight then problem(label .. ": suspicious window height (" .. tostring(f.h) .. ")") end
        local rows = P.rowsShown or {}
        if not P.compact then
            if plain(f.title.text) == "" then problem(label .. ": empty title") end
            if #rows == 0 then problem(label .. ": no row in the window") end
            for i, r in ipairs(rows) do
                if plain(r.text) == "" then problem(("%s: row %d is empty"):format(label, i)) end
                -- manual / skipped: a step the player marked done or skipped (Engine:StepMark).
                if not ({ done = true, todo = true, impossible = true, manual = true, skipped = true, preview = true })[r.state] then
                    problem(("%s: row %d has no state (%s)"):format(label, i, tostring(r.state)))
                end
            end
        end
        if QUIET then return end
        print(("== %s | %s | %s%s | %d px"):format(label, plain(f.title.text), plain(f.stepText.text),
            plain(f.stepTotal.text), f.h))
        local marks = { done = "[x] ", todo = "[ ] ", impossible = "[-] " }
        for _, r in ipairs(rows) do
            print("    " .. (marks[r.state] or "") .. plain(r.text) .. (r.counter and ("  " .. r.counter) or ""))
            if r.sub then print("        " .. (plain(r.sub):gsub("\n", " / "))) end
        end
        print("   " .. (f.prev.enabled and " [<]" or "") .. (f.next.enabled and " [>]" or ""))
    end

    ---------------------------------------------------------------------------
    -- Player actions
    ---------------------------------------------------------------------------
    local function gainXP(amount)
        player.xp = player.xp + amount
        while XP_PER_LEVEL[player.level] and player.xp >= XP_PER_LEVEL[player.level] do
            player.xp = player.xp - XP_PER_LEVEL[player.level]
            player.level = player.level + 1
            fire("PLAYER_LEVEL_UP", player.level)
        end
        fire("PLAYER_XP_UPDATE", "player")
    end
    -- A monster killed: its experience, doubled while rested (the bonus comes out of the
    -- rested pool), like the client.
    local function kill(amount)
        local bonus = math.min(amount, player.rested)
        player.rested = player.rested - bonus
        gainXP(amount + bonus)
    end
    -- One experience update per level: Ding sees a grind as a few big gains, never as kills.
    local function grindTo(level)
        if player.level >= level then return end
        say(("   (kills monsters up to level %d)"):format(level))
        while player.level < level and XP_PER_LEVEL[player.level] do
            gainXP(XP_PER_LEVEL[player.level] - player.xp)
        end
    end

    local function accept(q)
        grindTo(QuestDB.requiredLevel(q))
        local objectives, names, types = QuestDB.objectives(q), {}, {}
        local namers = { function(id) return clientName("npcs", id) end, function(id) return clientName("objects", id) end,
            function(id) return clientName("items", id) end }
        local kinds = { "monster", "object", "item" }
        for group = 1, 3 do
            for _, o in ipairs(objectives[group] or {}) do
                names[#names + 1] = namers[group](o[1]) or "?"
                types[#names] = kinds[group]
            end
        end
        for _, o in ipairs(objectives[5] or {}) do
            names[#names + 1] = o[3] or "?"
            types[#names] = "monster"
        end
        log[q] = { done = #names == 0 and QuestDB.triggerEnd(q) == nil, objectives = names, types = types }
        rebuildLogOrder()
        giveSourceItem(q)
        fire("QUEST_ACCEPTED", q)    -- Forever: questID only
        fire("QUEST_LOG_UPDATE")
    end
    local function complete(q)
        if log[q] and not log[q].done then
            log[q].done = true
            gainXP(400)
        end
        fire("QUEST_LOG_UPDATE")
    end
    local function turnin(q)
        log[q] = nil
        completed[q] = true
        rebuildLogOrder()
        takeSourceItem(q)
        gainXP(300)
        fire("QUEST_TURNED_IN", q, 300, 0)
        fire("QUEST_REMOVED", q)
        fire("QUEST_LOG_UPDATE")
    end

    -- The goals without a quest of a step (Core/Goals.lua), done as a player would: kills
    -- (the client's experience message), items in the bags, a talk and its dialogue line, an
    -- item used, an object opened where it stands, an item worn, chores, a quest abandoned.
    local function xpMessage(name)
        return LOCALE == "frFR" and ("%s meurt, vous gagnez %d points d'expérience."):format(name, 40)
            or ("%s dies, you gain %d experience."):format(name, 40)
    end
    local function giveItem(id, count)
        local it = items[id] or { count = 0 }
        it.count = math.max(it.count, count)
        items[id] = it
        fire("BAG_UPDATE", 0)
    end
    local function playGoals(step)
        local GO = Ding.Goals
        local g = GO and GO:Of(step)
        if not g then return end
        for _, p in ipairs(g.kill or {}) do
            for _ = 1, p[2] do fire("CHAT_MSG_COMBAT_XP_GAIN", xpMessage(clientName("npcs", p[1]) or "?")) end
        end
        for _, key in ipairs({ "collect", "buy" }) do
            for _, p in ipairs(g[key] or {}) do giveItem(p[1], p[2]) end
        end
        if g.talk or g.gossip then
            talk({ id = g.talk and g.talk[1], gives = {}, options = g.gossip and { "Yes" } or nil })
            closeDialog()
        end
        for _, id in ipairs(g.useitem or {}) do
            giveItem(id, 1)
            items[id].use = true
            fire("UNIT_SPELLCAST_SUCCEEDED", "player", "cast-" .. id, 1000 + id)
        end
        if g.object then
            local spawn = Ding.Data:ObjectPoints(g.object[1])[1]
            if spawn then player.map, player.x, player.y = spawn.map, spawn.x, spawn.y end
            fire("LOOT_OPENED")
        end
        for i, id in ipairs(g.equip or {}) do
            equipped[i] = id
            if items[id] then items[id] = nil end
            fire("PLAYER_EQUIPMENT_CHANGED", i, false)
        end
        for _, key in ipairs({ "destroy", "bank" }) do
            for _, id in ipairs(g[key] or {}) do items[id] = nil end
        end
        for _, id in ipairs(g.unbank or {}) do giveItem(id, 1) end
        for _, q in ipairs(g.abandon or {}) do
            if log[q] then
                log[q] = nil
                rebuildLogOrder()
                fire("QUEST_REMOVED", q)
            end
        end
        fire("BAG_UPDATE", 0)
        fire("QUEST_LOG_UPDATE")
    end

    -- Does what the active step asks, as a player would; returns false for manual steps.
    local function play(step)
        for _, q in ipairs(step.turnin or {}) do
            if not completed[q] then
                if not log[q] then accept(q) end
                complete(q)
                turnin(q)
            end
        end
        for _, q in ipairs(step.accept or {}) do
            if not log[q] and not completed[q] then
                if QuestDB.requiredLevel(q) > player.level then
                    say(("   (%d: level %d required, postponed)"):format(q, QuestDB.requiredLevel(q)))
                elseif step.optional and SKIP_OPTIONAL then
                    say(("   (%d: optional, never started)"):format(q))
                else
                    accept(q)
                end
            end
        end
        for _, q in ipairs(step.complete or {}) do
            if not completed[q] then
                if not log[q] then accept(q) end
                complete(q)
            end
        end
        if step.level then
            grindTo(math.floor(step.level))
            -- A target inside the level (`xp`, or a fraction): the experience up to it.
            local _, into = Ding.Grind:Into(step, XP_PER_LEVEL[player.level])
            if player.level == math.floor(step.level) and into > player.xp then gainXP(into - player.xp) end
        end
        if Ding:StepApplies(step) then playGoals(step) end
        -- A patrol: round its points.
        for _, p in ipairs(type(step.patrol) == "table" and step.patrol or {}) do
            player.map, player.x, player.y = p[1], p[2], p[3]
            Ding.Arrow.point = nil
            Ding.Arrow:Tick()
        end
        -- A death skip: dead, released (at the spirit healer the step names), alive again.
        if step.deathskip and Ding:StepApplies(step) then
            dead = true
            fire("PLAYER_DEAD")
            local revive = type(step.revive) == "table" and step.revive
            ghost, corpse, dead = true, { map = player.map, x = player.x, y = player.y }, false
            if revive then player.map, player.x, player.y = revive[1], revive[2], revive[3] end
            fire("PLAYER_ALIVE")
            ghost, corpse = false, nil
            fire("PLAYER_UNGHOST")
        end
        if step.go then
            player.map, player.x, player.y = step.go[1], step.go[2], step.go[3]
            Ding.Arrow.point = nil
            Ding.Arrow:Tick()
            return true
        end
        local checkable = step.turnin or step.accept or step.complete or step.level
            or (Ding.Goals and Ding.Goals:Auto(step))
        return not (step.train or step.hearth or step.fly or step.sethearth or step.deathskip or not checkable)
    end

    ---------------------------------------------------------------------------
    -- Gamepad: presses go through the override bindings Ding set up.
    ---------------------------------------------------------------------------
    local function expect(cond, msg)
        if not cond then problem(msg) end
    end

    local function boundButton(key)
        local found, owners = nil, 0
        for _, map in pairs(overrides) do
            if map[key] then found, owners = map[key], owners + 1 end
        end
        if owners > 1 then problem("several frames own the binding " .. key) end
        return found and _G[found]
    end

    local function hold(key)
        local b = boundButton(key)
        if not b then
            problem("no temporary binding for " .. key)
            return
        end
        b.scripts.OnClick(b, "LeftButton", true)
        flush()
    end

    local function release(key)
        local b = boundButton(key)
        if b then b.scripts.OnClick(b, "LeftButton", false) end
        flush()
    end

    local function press(key)
        hold(key)
        release(key)
    end

    -- Runs every OnUpdate script for `seconds` of game time.
    local function tick(seconds)
        local dt = 0.05
        for _ = 1, math.floor(seconds / dt + 0.5) do
            now = now + dt
            flush()
            for _, w in ipairs(allWidgets) do
                local fn = w.scripts and w.scripts.OnUpdate
                if fn and w:IsShown() then fn(w, dt) end
            end
        end
        flush()
    end

    -- A button pressed while Ding waits for one (key binding capture).
    local function padDown(button, mods)
        local f = _G.DingCaptureFrame
        if not (f and f:IsShown()) then
            problem("not waiting for a button")
            return
        end
        modifiers = mods or {}
        f.scripts.OnGamePadButtonDown(f, button)
        modifiers = {}
        flush()
    end

    -- Walks the settings' focus down to the element `test` accepts; a folded block on the
    -- way ("More options") is unfolded with A, like a player would.
    local function focusOn(C, test, label)
        for _ = 1, 40 do
            if C.focus and test(C.focus) then return true end
            if C.focus and C.focus.kind == "fold" and not C.focus.opts.get() then press("PAD1") end
            press("PADDDOWN")
        end
        problem("element not found in the settings: " .. label)
        return false
    end

    local function selectTab(C, i)
        for _ = 1, 10 do
            if C.tab == i then return end
            press("PADRSHOULDER")
        end
        problem("tab not found: " .. i)
    end

    ---------------------------------------------------------------------------
    -- What the tests use
    ---------------------------------------------------------------------------
    local H = {
        X = X, Ding = Ding, player = player, bindings = bindings, overrides = overrides,
        registered = registered, data = data, widgets = allWidgets,
        problem = problem, say = say, expect = expect, plain = plain, checkPanel = checkPanel,
        fire = fire, flush = flush, tick = tick, press = press, hold = hold, release = release,
        padDown = padDown, focusOn = focusOn, selectTab = selectTab,
        accept = accept, complete = complete, turnin = turnin, play = play, grindTo = grindTo, kill = kill,
    }
    function H.problems() return problems end
    function H.logOrder() return logOrder end
    function H.log() return log end
    function H.completed() return completed end
    function H.resetQuests()
        log, completed = {}, {}
        rebuildLogOrder()
    end
    -- Puts a quest in a given state without side effects (no XP, no events):
    -- nil (unknown), "log" (in progress), "ready" (objectives done), "turnedin".
    function H.setQuest(q, state)
        log[q], completed[q] = nil, nil
        if state == "turnedin" then
            completed[q] = true
        elseif state == "log" or state == "ready" then
            log[q] = { done = state == "ready", objectives = { "objective " .. q } }
        else
            assert(state == nil, "unknown quest state " .. tostring(state))
        end
        rebuildLogOrder()
    end
    H.talk, H.showQuest, H.closeDialog = talk, showQuest, closeDialog
    function H.dialogCalls() return dialogCalls end
    function H.clearDialogCalls() for i = #dialogCalls, 1, -1 do dialogCalls[i] = nil end end
    function H.dialogKind() return dialog.kind end
    function H.setModifier(name, v) modifiers[name] = v end
    -- The map waypoint: where it is ({ map, x, y } 0-100), the player's own, the API on or off.
    function H.userWaypoint()
        if not userWaypoint then return nil end
        return { map = userWaypoint.uiMapID, x = userWaypoint.position.x * 100, y = userWaypoint.position.y * 100,
            tracked = superTracked }
    end
    function H.setUserWaypoint(map, x, y)
        userWaypoint = map and { uiMapID = map, position = { x = x / 100, y = y / 100 } } or nil
    end
    function H.waypointCalls() return waypointCalls end
    function H.setWaypointApi(on)
        for name, fn in pairs(waypointApi) do _G.C_Map[name] = on and fn or nil end
    end
    function H.setMounted(v) mounted = v and true or false end
    function H.isMounted() return mounted end
    function H.setCombat(v) inCombat = v end
    -- Bag contents, without events: count (0 or nil removes), opts = { use, icon, start, duration }.
    function H.setItem(id, count, opts)
        if not count or count == 0 then
            items[id] = nil
            return
        end
        local it = { count = count }
        for k, v in pairs(opts or {}) do it[k] = v end
        items[id] = it
    end
    function H.setSpecialItem(q, id) specialItems[q] = id end
    -- Typing or pasting into an edit box: its text, then OnTextChanged as typed.
    function H.type(edit, text)
        edit:SetText(text)
        local fn = edit.scripts and edit.scripts.OnTextChanged
        if fn then fn(edit, true) end
    end
    -- A slash command typed in the game's chat: the player opens the chat (the game's code),
    -- then Enter runs the addon's command, tainted from there on, while the chat still has the
    -- keyboard; the gamepad interface keeps it open, emptied. H.closeChat: B or Escape.
    function H.chat(text)
        local command, msg = text:match("^(/%S+)%s*(.-)%s*$")
        local handler
        for key, fn in pairs(SlashCmdList) do
            for i = 1, 9 do
                local tag = _G["SLASH_" .. key .. i]
                if tag and tag:upper() == command:upper() then handler = fn end
            end
        end
        assert(handler, "no slash command " .. tostring(command))
        secure = true
        chatBox:SetFocus()
        chatBox:SetText(text)
        secure = false
        handler(msg, chatBox)
        chatBox:SetText("")
        flush()
    end
    function H.closeChat()
        secure = true
        chatBox:ClearFocus()
        secure = false
    end
    function H.chatHasKeyboard() return chatBox:HasFocus() end
    function H.setUsable(id, v) usable[id] = v or nil end
    function H.clearItems()
        items, specialItems, usable = {}, {}, {}
        for i = #itemUses, 1, -1 do itemUses[i] = nil end
    end
    function H.itemUses() return itemUses end
    -- A game key binding pressed: "CLICK Name:Button" clicks a secure action button the way
    -- the client does (type "item" uses the "item" attribute, even on a hidden button).
    function H.pressBinding(key)
        local action = bindings[key]
        if not action then
            problem("no key binding on " .. key)
            return nil
        end
        local name = action:match("^CLICK ([^:]+):")
        assert(name, "only CLICK bindings are simulated: " .. action)
        local b = _G[name]
        if not (b and b.protected) then
            problem("the binding " .. key .. " targets a non-secure button: " .. name)
            return nil
        end
        -- The binding's mouse button picks the attributes: "type" for the left one,
        -- "type-<name>" for a virtual one ("CLICK DingItemButton:Target").
        local button = action:match("^CLICK [^:]+:(.+)$") or "LeftButton"
        local suffix = button == "LeftButton" and "" or ("-" .. button)
        local kind = b:GetAttribute("type" .. suffix)
        local item = kind == "item" and b:GetAttribute("item" .. suffix) or nil
        if item then itemUses[#itemUses + 1] = item end
        local result = item
        if kind == "spell" then
            result = "spell:" .. tostring(b:GetAttribute("spell" .. suffix))
            itemUses[#itemUses + 1] = result
        end
        if kind == "macro" then
            local text = b:GetAttribute("macrotext" .. suffix) or ""
            macroUses[#macroUses + 1] = text
            -- Every name is around in the mock: each line takes the target, the last one wins.
            local name
            for line in text:gmatch("[^\n]+") do
                name = line:match("^/targetexact (.+)$") or name
            end
            if name then
                targetName, hasTarget = name, true
                fire("PLAYER_TARGET_CHANGED")
            end
            result = text
        end
        local post = b.scripts and b.scripts.PostClick
        if post then post(b, button, false) end
        flush()
        return result
    end
    function H.macroUses() return macroUses end
    -- Bags: a slot's content, or nil to empty it; resetBags for a fresh character.
    function H.putInBag(bag, slot, id, count)
        bags[bag].slots[slot] = id and { id = id, count = count or 1 } or nil
    end
    function H.setBagSize(bag, size) bags[bag].size = size end
    H.resetBags = resetBags
    function H.bagItem(bag, slot) return bags[bag].slots[slot] end
    -- A merchant: opts = { canRepair, repairCost }; closing it fires MERCHANT_CLOSED.
    function H.openMerchant(opts)
        merchant = { canRepair = opts and opts.canRepair or false, repairCost = opts and opts.repairCost or 0 }
        sold = {}
        fire("MERCHANT_SHOW")
        flush()
        return merchant
    end
    function H.closeMerchant()
        merchant = nil
        fire("MERCHANT_CLOSED")
        flush()
    end
    function H.sold() return sold end
    function H.setMoney(v) money = v end
    function H.money() return money end
    function H.openTrainer(profession)
        professionTrainer = profession and true or false
        fire("TRAINER_SHOW")
        flush()
    end
    function H.closeTrainer()
        fire("TRAINER_CLOSED")
        professionTrainer = false
        flush()
    end
    function H.setGroup(v) inGroup = v and true or false end
    function H.setNpcName(name) npcName = name end
    -- A kill that gives experience: the client's chat line (CHAT_MSG_COMBAT_XP_GAIN).
    function H.killXP(name, xp)
        local text = LOCALE == "frFR" and ("%s meurt, vous gagnez %d points d'expérience."):format(name, xp or 50)
            or ("%s dies, you gain %d experience."):format(name, xp or 50)
        fire("CHAT_MSG_COMBAT_XP_GAIN", text)
        flush()
    end
    function H.learnSpell(id, known) knownSpells[id] = known ~= false or nil end
    function H.setTalentPoints(n)
        talentPoints = n
        fire("CHARACTER_POINTS_CHANGED", n)
    end
    function H.setTalentRank(tab, i, rank) talentRanks[tab .. ":" .. i] = rank end
    function H.talentRank(tab, i) return talentRank(tab, i) end
    function H.talentCalls() return talentCalls end
    function H.resetTalents() talentRanks, talentPoints, talentCalls = {}, 0, {} end
    function H.forgetSpells() knownSpells, spellCooldowns = {}, {} end
    function H.setSpellCooldown(id, start, duration) spellCooldowns[id] = { start = start, duration = duration } end
    function H.setTrainerServices(list) trainerServices = list end
    function H.equipped(slot) return equipped[slot] end
    function H.raidMark(name) return raidMarks[name] end
    function H.clearRaidMarks() raidMarks = {} end
    function H.setInstance(v) inInstance = v end
    function H.setGamepadConnected(v) padConnected = v end
    -- A target (true, or its name), or none.
    function H.setTarget(v)
        hasTarget = v and true or false
        targetName = type(v) == "string" and v or nil
    end
    -- Ghost (released) with its corpse at { map, x, y }, or alive again (nil).
    function H.setGhost(where)
        ghost, corpse = where ~= nil, where
        if ghost then dead = false end
    end
    -- Dead, not released yet (true), or alive (false).
    function H.setDead(v) dead = v and true or false end
    -- Item facts for GetItemInfo / GetItemStats: { name, quality, equipLoc, sellPrice,
    -- stats = { ITEM_MOD_STRENGTH_SHORT = 3, ... }, usable = false for a red item }.
    function H.setItemInfo(id, info) itemInfo[id] = info end
    -- What the player wears: H.equip(slot, item id or nil).
    function H.equip(slot, id) equipped[slot] = id end
    function H.clearEquipment() equipped = {} end
    -- The quest window's reward buttons, like the client's (choices first).
    for i = 1, 6 do
        _G["QuestInfoRewardsFrameQuestInfoItem" .. i] = {
            GetCenter = function() return 500 + 40 * i, 400 end,
            GetEffectiveScale = function() return 1 end,
            IsVisible = function() return dialog.kind == "complete" end,
        }
    end
    -- Position (0-100) on the continent map of a point of a zone map.
    function H.continentPos(map, x, y)
        local _, world = C_Map.GetWorldPosFromMapPos(map, { x = x / 100, y = y / 100 })
        return world.y / CONT_H * 100, world.x / CONT_W * 100
    end
    -- Opens the flight map with these nodes: { name, state, map, x, y } (the node's place on
    -- its zone map); each node gets its button, like the client's TaxiButton<i>.
    function H.openTaxi(nodes)
        taxi.nodes, taxi.open = {}, true
        for i, n in ipairs(nodes) do
            local cx, cy = H.continentPos(n.map, n.x, n.y)
            taxi.nodes[i] = { name = n.name, state = n.state, position = { x = cx / 100, y = cy / 100 } }
            _G["TaxiButton" .. i] = {
                GetCenter = function() return 100 + 20 * i, 300 end,
                GetEffectiveScale = function() return 1 end,
            }
        end
        fire("TAXIMAP_OPENED")
        flush()
    end
    function H.closeTaxi()
        taxi.open = false
        fire("TAXIMAP_CLOSED")
        flush()
    end
    -- The flight lands at (map, x, y).
    function H.land(map, x, y)
        taxi.onTaxi = false
        player.map, player.x, player.y = map, x, y
        fire("PLAYER_CONTROL_GAINED")
        flush()
    end
    function H.taxi() return taxi end
    H.SECRET = SECRET
    function H.now() return now end
    return H
end
