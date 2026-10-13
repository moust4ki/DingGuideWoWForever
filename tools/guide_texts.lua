-- Guide texts in other languages, shared by tools/draft_guide.lua and
-- tools/translate_guides.lua. Each language has its own dictionary file,
-- tools/routes/locales/<locale>.lua: { [English phrase] = translation }. A guide note can join
-- several phrases with a space (a route intro and an automatic note): it is translated
-- phrase by phrase. A title's level range ("Westfall (11-16)") is kept as it is: the
-- dictionary only names the zone. The result is one file per guide and language,
-- Ding/Locales/Guides/<locale>/<guide file>, calling Ding.RegisterGuideTranslation.
local M = {}

-- Order of the translation files in Ding.toc.
M.LOCALES = { "frFR", "deDE", "esES", "ptBR", "koKR", "zhCN", "zhTW" }

M.NAMES = {
    frFR = "French", deDE = "German", esES = "Spanish", ptBR = "Brazilian Portuguese",
    koKR = "Korean", zhCN = "Simplified Chinese", zhTW = "Traditional Chinese",
}

-- Phrases are joined without a space in Chinese.
local JOIN = { zhCN = "", zhTW = "" }

-- { [locale] = dictionary } for every locale of M.LOCALES that has a file in `dir`.
function M.load(dir)
    local dicts = {}
    for _, locale in ipairs(M.LOCALES) do
        local path = dir .. "/" .. locale .. ".lua"
        local handle = io.open(path, "r")
        if handle then
            handle:close()
            local dict = dofile(path)
            assert(type(dict) == "table", path .. " must return a table")
            dicts[locale] = dict
        end
    end
    return dicts
end

-- The phrases of `text` (dictionary keys joined by spaces), longest phrases first; nil when
-- some part is no phrase of the dictionary.
local function split(text, dict)
    local keys = {}
    for k in pairs(dict) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b) return #a > #b or (#a == #b and a < b) end)
    local memo = {}
    local function from(i)
        if i > #text then return {} end
        if memo[i] ~= nil then return memo[i] or nil end
        for _, k in ipairs(keys) do
            local j = i + #k - 1
            if text:sub(i, j) == k then
                local rest
                if j == #text then
                    rest = {}
                elseif text:sub(j + 1, j + 1) == " " then
                    rest = from(j + 2)
                end
                if rest then
                    local parts = { k }
                    for _, p in ipairs(rest) do parts[#parts + 1] = p end
                    memo[i] = parts
                    return parts
                end
            end
        end
        memo[i] = false
        return nil
    end
    return from(1)
end

-- The translation of `text`, or nil when one of its phrases is not in the dictionary. A
-- title ends with its level range, "Westfall (11-16)": the dictionary translates the name,
-- the range stays as it is.
function M.translate(text, dict, locale)
    if dict[text] then return dict[text] end
    local name, range = text:match("^(.-) (%(%d+%-?%d*%))$")
    if name and dict[name] then return dict[name] .. " " .. range end
    local parts = split(text, dict)
    if not parts then return nil end
    local out = {}
    for i, p in ipairs(parts) do out[i] = dict[p] end
    return table.concat(out, JOIN[locale] or " ")
end

-- English texts of a guide to translate, in order: title, then each step's text and note.
function M.texts(guide)
    local list, seen = {}, {}
    local function add(text)
        if text and not seen[text] then
            seen[text] = true
            list[#list + 1] = text
        end
    end
    add(guide.title)
    for _, step in ipairs(guide.steps or {}) do
        add(step.text)
        add(step.note)
    end
    return list
end

local function quote(s) return (("%q"):format(s):gsub("\\\n", "\\n")) end

local WINDOWS = package.config:sub(1, 1) == "\\"
local function ensureDir(path)
    if WINDOWS then
        os.execute('mkdir "' .. path:gsub("/", "\\") .. '" 2>nul')
    else
        os.execute("mkdir -p '" .. path:gsub("'", "'\\''") .. "'")
    end
end

-- Writes Ding/Locales/Guides/<locale>/<file> for every dictionary. `file`: the guide's
-- path under Ding/Guides; `source`: what the header tells to edit. Returns the texts
-- without translation: { "<locale>: <text>", ... }.
function M.write(guide, file, dicts, localesRoot, source)
    local missing = {}
    for _, locale in ipairs(M.LOCALES) do
        local dict = dicts[locale]
        if dict then
            local name = M.NAMES[locale]
            local lines = {
                ("-- %s text of Guides/%s: [English text] = %s text."):format(name, file, name),
                ("-- Written by tools/translate_guides.lua from tools/routes/locales/%s.lua%s."):format(locale,
                    source and (" and " .. source) or ""),
                ("Ding.RegisterGuideTranslation(%s, %s, {"):format(quote(locale), quote(guide.id)),
            }
            for _, text in ipairs(M.texts(guide)) do
                local translated = M.translate(text, dict, locale)
                if translated then
                    lines[#lines + 1] = "    [" .. quote(text) .. "] ="
                    lines[#lines + 1] = "        " .. quote(translated) .. ","
                else
                    missing[#missing + 1] = locale .. ": " .. text
                end
            end
            lines[#lines + 1] = "})"
            local path = localesRoot .. "/" .. locale .. "/" .. file
            ensureDir(path:match("^(.*)/[^/]+$"))
            local f = assert(io.open(path, "w"))
            f:write(table.concat(lines, "\n"), "\n")
            f:close()
        end
    end
    return missing
end

return M
