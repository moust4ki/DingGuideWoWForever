-- Writes the translations of every guide listed in Ding/Ding.toc, one file per guide and
-- language (Ding/Locales/Guides/<locale>/...), from the dictionaries of
-- tools/routes/locales/<locale>.lua, then lists those files in Ding.toc after the guides.
-- usage: lua5.1 tools/translate_guides.lua [locale...]   (from anywhere; default: every
--        language that has a dictionary)
-- Exit code: 0 when every text of every guide is translated in every language, 1 otherwise
-- (the missing texts are listed: add them to the dictionaries and run again).
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local Texts = dofile(here .. "/guide_texts.lua")

local tocPath = root .. "/Ding/Ding.toc"
local handle = assert(io.open(tocPath, "rb"))
local raw = handle:read("*a")
handle:close()
local crlf = raw:find("\r\n", 1, true) ~= nil
local lines = {}
for line in (raw:gsub("\r\n", "\n")):gmatch("([^\n]*)\n") do lines[#lines + 1] = line end

-- The guides, in load order.
local guides = {}
for _, line in ipairs(lines) do
    if line:find("^Guides\\") then guides[#guides + 1] = line:gsub("^Guides\\", ""):gsub("\\", "/") end
end
assert(#guides > 0, "no guide in Ding.toc")

local function loadGuide(file)
    local def
    _G.Ding = { RegisterGuide = function(d) def = d return d end }
    dofile(root .. "/Ding/Guides/" .. file)
    _G.Ding = nil
    return assert(def, file .. " registers no guide")
end

local dicts = Texts.load(root .. "/tools/routes/locales")
if arg[1] then
    local only = {}
    for i = 1, #arg do only[arg[i]] = dicts[arg[i]] or error("no dictionary for " .. arg[i]) end
    dicts = only
end
local missing = {}
for _, file in ipairs(guides) do
    for _, m in ipairs(Texts.write(loadGuide(file), file, dicts, root .. "/Ding/Locales/Guides")) do
        missing[#missing + 1] = file .. " (" .. m .. ")"
    end
end

-- Ding.toc: the translation files right after the guides, language by language.
local out, inserted = {}, false
local lastGuide = 0
for i, line in ipairs(lines) do
    if line:find("^Guides\\") then lastGuide = i end
end
for i, line in ipairs(lines) do
    if not line:find("^Locales\\Guides\\") then
        out[#out + 1] = line
        if i == lastGuide and not inserted then
            inserted = true
            for _, locale in ipairs(Texts.LOCALES) do
                if dicts[locale] then
                    out[#out + 1] = ""
                    for _, file in ipairs(guides) do
                        out[#out + 1] = "Locales\\Guides\\" .. locale .. "\\" .. file:gsub("/", "\\")
                    end
                end
            end
        end
    end
end
-- No run of blank lines left by the old block.
local tidy = {}
for _, line in ipairs(out) do
    if not (line == "" and tidy[#tidy] == "") then tidy[#tidy + 1] = line end
end
while tidy[#tidy] == "" do tidy[#tidy] = nil end
local f = assert(io.open(tocPath, "wb"))
local eol = crlf and "\r\n" or "\n"
f:write(table.concat(tidy, eol), eol)
f:close()

local languages = {}
for _, locale in ipairs(Texts.LOCALES) do
    if dicts[locale] then languages[#languages + 1] = locale end
end
print(("%d guides, %d languages (%s)"):format(#guides, #languages, table.concat(languages, ", ")))
for _, m in ipairs(missing) do print("missing translation: " .. m) end
os.exit(#missing == 0 and 0 or 1)
