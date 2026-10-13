-- Localization: UI string files (Locales/enUS.lua, Locales/frFR.lua), guide translations
-- (Ding.RegisterGuideTranslation) and their use on a French client (the mock's default).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding, H = T.Ding, T.H
local root = tools .. "/.."

-- Loads one UI string file as the game would, for a client in `locale`.
local function loadStrings(name, locale)
    local ns, getLocale = {}, _G.GetLocale
    _G.GetLocale = function() return locale end
    local ok, err = pcall(assert(loadfile(root .. "/Ding/Locales/" .. name .. ".lua")), "Ding", ns)
    _G.GetLocale = getLocale
    assert(ok, err)
    return ns.Locales and ns.Locales[name]
end

-- Every translated UI language has its own file; esES also serves Latin American clients.
local LANGUAGES = dofile(tools .. "/guide_texts.lua").LOCALES
local enUS = loadStrings("enUS", "frFR")
local strings = {}
for _, name in ipairs(LANGUAGES) do strings[name] = loadStrings(name, name) end
local frFR = strings.frFR

-- Characters the fonts have no glyph for (Noto Sans, and the game's font in Asian clients).
local MISSING = { "←", "→", "↑", "↓", "◂", "▸", "▴", "▾", "◀", "▶", "▲", "▼", "✕", "✓", "□", "△", "○", "●", "◆" }
local function missingChar(text)
    for _, c in ipairs(MISSING) do
        if text:find(c, 1, true) then return c end
    end
end

-- Format specifiers in order ("%d", "%s", "%.2f"...), "%%" left out.
local function specifiers(text)
    local list = {}
    for spec in text:gsub("%%%%", ""):gmatch("%%[%d%.]*%a") do list[#list + 1] = spec end
    return table.concat(list, " ")
end

local function sortedKeys(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys)
    return keys
end

-- Ding.L keys used in the code: L.KEY or L["KEY"].
local function usedKeys()
    local keys, files = {}, {}
    local list = io.popen("find '" .. root .. "/Ding' -name '*.lua' -not -path '*/Locales/*'")
    for path in list:lines() do files[#files + 1] = path end
    list:close()
    for _, path in ipairs(files) do
        local handle = assert(io.open(path, "r"))
        local source = handle:read("*a")
        handle:close()
        for key in source:gmatch("%f[%w_]L%.([%u_][%u%d_]*)") do keys[key] = path end
        for key in source:gmatch("%f[%w_]L%[\"([%u_][%u%d_]*)\"%]") do keys[key] = path end
    end
    return keys
end

T.test("each language file is only loaded by a client in that language", function()
    T.ok(type(enUS) == "table" and enUS.ACCEPT == "Accept", "Locales/enUS.lua")
    T.ok(loadStrings("enUS", "deDE"), "enUS must always load")
    T.ok(type(frFR) == "table" and frFR.ACCEPT == "Prendre", "Locales/frFR.lua")
    for _, name in ipairs(LANGUAGES) do
        T.ok(type(strings[name]) == "table", "Locales/" .. name .. ".lua missing or empty")
        T.eq(loadStrings(name, "enUS"), nil, name .. " loaded by an English client")
        local other = name == "frFR" and "deDE" or "frFR"
        T.eq(loadStrings(name, other), nil, name .. " loaded by a client in " .. other)
    end
    T.ok(loadStrings("esES", "esMX"), "Spanish missing from a Latin American client")
end)

T.test("each language has exactly the English keys", function()
    for _, name in ipairs(LANGUAGES) do
        local t = strings[name] or {}
        for _, k in ipairs(sortedKeys(enUS)) do T.ok(t[k] ~= nil, ("key without a %s translation: %s"):format(name, k)) end
        for _, k in ipairs(sortedKeys(t)) do T.ok(enUS[k] ~= nil, ("%s key missing from enUS: %s"):format(name, k)) end
    end
end)

T.test("no empty text, same format specifiers in the same order", function()
    for _, k in ipairs(sortedKeys(enUS)) do
        T.ok(type(enUS[k]) == "string" and enUS[k] ~= "", "empty English text: " .. k)
        for _, name in ipairs(LANGUAGES) do
            local text = (strings[name] or {})[k]
            if text then
                T.ok(type(text) == "string" and text ~= "", ("empty %s text: %s"):format(name, k))
                T.eq(specifiers(text), specifiers(enUS[k]), ("format of %s in %s"):format(k, name))
            end
        end
    end
end)

T.test("no interface text uses a character the fonts lack", function()
    for _, name in ipairs({ "enUS", unpack(LANGUAGES) }) do
        local t = name == "enUS" and enUS or strings[name] or {}
        for _, k in ipairs(sortedKeys(t)) do
            local c = missingChar(t[k])
            T.ok(not c, ("%s.%s contains %s"):format(name, k, tostring(c)))
        end
    end
end)

T.test("Latin American client: Spanish texts; British client: English", function()
    local saved = {}
    for k, v in pairs(_G) do
        if type(k) == "string" and k:find("^BINDING_") then saved[k] = v end
    end
    local function pick(clientLocale)
        local ns, getLocale = { Locales = { enUS = enUS, esES = strings.esES } }, _G.GetLocale
        _G.GetLocale = function() return clientLocale end
        local ok, err = pcall(assert(loadfile(root .. "/Ding/Core/Locales.lua")), "Ding", ns)
        _G.GetLocale = getLocale
        assert(ok, err)
        return ns
    end
    local mx, gb = pick("esMX"), pick("enGB")
    for k, v in pairs(saved) do _G[k] = v end
    T.eq(mx.locale, "esES")
    T.eq(mx.L.ACCEPT, strings.esES.ACCEPT)
    T.eq(gb.locale, "enUS")
    T.eq(gb.L.ACCEPT, "Accept")
end)

T.test("every key used by the code exists in English", function()
    local keys = usedKeys()
    T.ok(next(keys) ~= nil, "no key found: check the pattern")
    for _, k in ipairs(sortedKeys(keys)) do
        T.ok(enUS[k] ~= nil, ("unknown key %s (%s)"):format(k, keys[k]))
    end
end)

T.test("French client: Ding.L in French, falls back to English then to the key", function()
    T.eq(Ding.locale, "frFR")
    T.eq(Ding.L.ACCEPT, "Prendre")
    T.eq(Ding.L.SETTINGS, frFR.SETTINGS)
    local english = Ding.Locales.enUS
    T.eq(Ding.L.T_ONLY_ENGLISH, "T_ONLY_ENGLISH")
    english.T_ONLY_ENGLISH = "English only"
    local fallback = Ding.L.T_ONLY_ENGLISH
    english.T_ONLY_ENGLISH = nil
    T.eq(fallback, "English only")
end)

T.test("key binding labels in French", function()
    T.eq(BINDING_NAME_DING_NEXT, "Étape suivante")
    T.eq(_G["BINDING_NAME_CLICK DingItemButton:LeftButton"], "Utiliser l'objet de quête")
end)

-- The French texts of a translation file: { [French text] = true }.
local function frenchTexts(path)
    local texts, register = {}, Ding.RegisterGuideTranslation
    Ding.RegisterGuideTranslation = function(_, _, map)
        for _, text in pairs(map) do texts[text] = true end
    end
    local ok, err = pcall(assert(loadfile(root .. "/Ding/Locales/Guides/frFR/" .. path)))
    Ding.RegisterGuideTranslation = register
    assert(ok, err)
    return texts
end

-- The texts of a guide translation file: { [English] = translated }.
local function guideTexts(path)
    local texts, register = {}, Ding.RegisterGuideTranslation
    Ding.RegisterGuideTranslation = function(_, _, map)
        for english, text in pairs(map) do texts[english] = text end
    end
    local ok, err = pcall(assert(loadfile(root .. "/Ding/Locales/Guides/" .. path)))
    Ding.RegisterGuideTranslation = register
    assert(ok, err)
    return texts
end

T.test("the Shadowglen guide is translated into every language", function()
    local french = guideTexts("frFR/NightElf/01_Shadowglen.lua")
    T.ok(next(french) ~= nil, "empty French translation")
    for _, name in ipairs(LANGUAGES) do
        local texts = guideTexts(name .. "/NightElf/01_Shadowglen.lua")
        for english in pairs(french) do
            T.ok(texts[english], ("%s: untranslated text: %s"):format(name, english))
        end
    end
end)

T.test("no translated guide text uses a character the fonts lack", function()
    local files = 0
    for line in io.lines(root .. "/Ding/Ding.toc") do
        local path = line:gsub("\r", ""):match("^Locales\\Guides\\(.+%.lua)$")
        if path then
            files = files + 1
            path = path:gsub("\\", "/")
            for english, text in pairs(guideTexts(path)) do
                local c = missingChar(text)
                T.ok(not c, ("%s: %s contains %s"):format(path, english, tostring(c)))
            end
        end
    end
    T.ok(files >= #LANGUAGES, "guide translations missing from the TOC")
end)

T.test("the Shadowglen guide is shown entirely in French", function()
    local g = Ding:GetGuide("nightelf-01-shadowglen")
    local french = frenchTexts("NightElf/01_Shadowglen.lua")
    T.eq(g.title, "Sombrevallée (1-6)")
    T.eq(g.steps[1].note, "Les deux donneurs sont juste devant toi, au pied d'Aldrassil.")
    T.eq(g.steps[#g.steps].text, "Direction Dolanaar")
    for i, step in ipairs(g.steps) do
        for _, field in ipairs({ "text", "note" }) do
            local text = step[field]
            T.ok(text == nil or french[text], ("step %d, %s not translated: %s"):format(i, field, tostring(text)))
        end
    end
end)

T.test("a translation applies whether the guide is loaded before or after it", function()
    Ding.RegisterGuideTranslation("frFR", "t-tr-before", { ["Title"] = "Titre", ["Go"] = "Va" })
    local before = Ding.RegisterGuide({ id = "t-tr-before", title = "Title",
        steps = { { accept = 456, note = "Go" }, { go = { 1438, 50, 50 }, text = "Go" } } })
    T.eq(before.title, "Titre")
    T.eq(before.steps[1].note, "Va")
    T.eq(before.steps[2].text, "Va")
    local after = Ding.RegisterGuide({ id = "t-tr-after", title = "Title", steps = { { accept = 456, note = "Go" } } })
    T.eq(after.title, "Title")
    Ding.RegisterGuideTranslation("frFR", "t-tr-after", { ["Title"] = "Titre", ["Go"] = "Va" })
    T.eq(after.title, "Titre")
    T.eq(after.steps[1].note, "Va")
end)

T.test("text without a translation stays in English, other language ignored", function()
    local g = Ding.RegisterGuide({ id = "t-tr-partial", title = "Title",
        steps = { { accept = 456, note = "Kept" }, { accept = 457, note = "Go" } } })
    Ding.RegisterGuideTranslation("frFR", "t-tr-partial", { ["Go"] = "Va" })
    Ding.RegisterGuideTranslation("deDE", "t-tr-partial", { ["Title"] = "Titel", ["Kept"] = "Behalten" })
    T.eq(g.title, "Title")
    T.eq(g.steps[1].note, "Kept")
    T.eq(g.steps[2].note, "Va")
end)

T.test("a re-registered guide is translated again", function()
    Ding.RegisterGuideTranslation("frFR", "t-tr-again", { ["Title"] = "Titre" })
    Ding.RegisterGuide({ id = "t-tr-again", title = "Title", steps = { { accept = 456 } } })
    local g = Ding.RegisterGuide({ id = "t-tr-again", title = "Title", steps = { { accept = 456 } } })
    T.eq(g.title, "Titre")
    T.eq(Ding:GetGuide("t-tr-again"), g)
end)

T.test("a malformed translation is rejected with a clear message", function()
    T.fails(function() Ding.RegisterGuideTranslation("frFR", "t-x") end, "RegisterGuideTranslation(locale, guideId, map)")
    T.fails(function() Ding.RegisterGuideTranslation("frFR", "t-x", { ["a"] = 1 }) end, "strings expected")
    T.fails(function() Ding.RegisterGuideTranslation("deDE", "t-x", { ["a"] = 1 }) end, "strings expected",
        "a translation for another language is checked too")
    local g = Ding.RegisterGuide({ id = "t-tr-bad", title = "Title", steps = { { accept = 456, note = "Go" } } })
    T.fails(function() Ding.RegisterGuideTranslation("frFR", "t-tr-bad", { ["Title"] = "Titre", ["Go"] = false }) end,
        "strings expected")
    T.eq(g.title, "Title", "a rejected translation leaves no trace")
end)

T.test("the panel shows the step's translated note", function()
    T.reset()
    Ding.Engine:SetGuide("nightelf-01-shadowglen", 1, true)
    H.flush()
    local found
    for _, line in ipairs(Ding.Engine:Describe(Ding.Engine:CurrentStep())) do
        if line.text == "Les deux donneurs sont juste devant toi, au pied d'Aldrassil." then found = true end
    end
    T.ok(found, "French note missing from step 1")
end)

T.test("/ding messages in French", function()
    local printed = {}
    local add = DEFAULT_CHAT_FRAME.AddMessage
    DEFAULT_CHAT_FRAME.AddMessage = function(_, msg) printed[#printed + 1] = msg end
    local debugBefore = Ding.db.debug
    SlashCmdList.DING("debug")
    SlashCmdList.DING("debug")
    DEFAULT_CHAT_FRAME.AddMessage = add
    Ding.db.debug = debugBefore
    T.ok(printed[1]:find(debugBefore and "désactivé" or "activé", 1, true), printed[1])
    T.ok(printed[2]:find(debugBefore and "activé" or "désactivé", 1, true), printed[2])
end)

T.run()
