-- Guides as text (docs/create-a-guide-with-ai.md): a reader of one Lua table literal, written
-- by hand so that nothing in the text ever runs (no load, loadstring, setfenv nor RunScript):
-- tables, texts, numbers, true / false / nil, `..` between texts, comments; nothing else.
-- And the writer of a table back to that text, in full or on one line.
local _, Ding = ...

local T = {}
Ding.GuideText = T

T.MAX_SIZE = 300 * 1024  -- bytes of text
T.MAX_DEPTH = 10         -- tables inside tables (a pack of guides needs 7)
T.MAX_VALUES = 100000    -- values in the whole text

local ESCAPES = {
    n = "\n", t = "\t", r = "\r", a = "\a", b = "\b", f = "\f", v = "\v",
    ["\\"] = "\\", ['"'] = '"', ["'"] = "'", ["\n"] = "\n",
}
local CONSTANTS = { ["true"] = true, ["false"] = false }

---------------------------------------------------------------------------
-- Reader
---------------------------------------------------------------------------
-- A code fence around the table (```lua ... ```), as chat AIs write it, maybe after a line
-- of their own: only what is inside is read, the line numbers kept.
local function stripFence(text)
    local _, open = text:find("```[%w_%-]*[ \t]*\r?\n")
    if not open then return text end
    local before = text:sub(1, open):gsub("[^\n]", "")
    local finish = text:find("```", open + 1, true)
    return before .. text:sub(open + 1, (finish or #text + 1) - 1)
end

-- Returns the table, or nil and an error { line, key, args } (Ding.Import localizes it).
function T.Parse(text)
    if type(text) ~= "string" then return nil, { line = 1, key = "PARSE_EMPTY" } end
    if #text > T.MAX_SIZE then
        return nil, { line = 1, key = "PARSE_SIZE", args = { math.floor(T.MAX_SIZE / 1024) } }
    end
    text = stripFence((text:gsub("^\239\187\191", "")))
    local pos, line, values = 1, 1, 0

    local function fail(key, ...)
        error({ line = line, key = key, args = { ... } }, 0)
    end
    local function peek(n) return text:sub(pos, pos + (n or 1) - 1) end
    local function newlines(from, to)
        local _, count = text:sub(from, to):gsub("\n", "")
        line = line + count
    end

    -- [[...]] or [==[...]==] at pos: its content (a first newline dropped, as in Lua), or nil.
    local function readLong()
        local level = text:match("^%[(=*)%[", pos)
        if not level then return nil end
        local open = pos + #level + 2
        local close = "]" .. level .. "]"
        local finish = text:find(close, open, true)
        if not finish then fail("PARSE_OPEN") end
        local content = text:sub(open, finish - 1)
        newlines(pos, finish)
        pos = finish + #close
        return (content:gsub("^\r?\n", ""))
    end

    -- Spaces, line ends and comments.
    local function skip()
        while true do
            local c = peek()
            if c == "\n" then
                line = line + 1
                pos = pos + 1
            elseif c == " " or c == "\t" or c == "\r" then
                pos = pos + 1
            elseif peek(2) == "--" then
                pos = pos + 2
                if not readLong() then
                    local finish = text:find("\n", pos, true)
                    pos = finish or #text + 1
                end
            else
                return
            end
        end
    end

    local function readQuoted(q)
        pos = pos + 1
        local out = {}
        while true do
            local c = peek()
            if c == "" or c == "\n" then fail("PARSE_OPEN") end
            if c == q then
                pos = pos + 1
                return table.concat(out)
            end
            if c == "\\" then
                local digits = text:match("^%d%d?%d?", pos + 1)
                local e = text:sub(pos + 1, pos + 1)
                if digits then
                    local byte = tonumber(digits)
                    if byte > 255 then fail("PARSE_ESCAPE") end
                    out[#out + 1] = string.char(byte)
                    pos = pos + 1 + #digits
                elseif ESCAPES[e] then
                    out[#out + 1] = ESCAPES[e]
                    if e == "\n" then line = line + 1 end
                    pos = pos + 2
                else
                    fail("PARSE_ESCAPE")
                end
            else
                local s, e = text:find("^[^\\\n" .. q .. "]+", pos)
                out[#out + 1] = text:sub(s, e)
                pos = e + 1
            end
        end
    end

    -- A text, and the texts joined to it with `..`.
    local function readText()
        local c = peek()
        local s = (c == '"' or c == "'") and readQuoted(c) or readLong()
        if not s then fail("PARSE_VALUE", "[") end
        skip()
        if peek(2) == ".." and peek(3) ~= "..." then
            pos = pos + 2
            skip()
            c = peek()
            if c ~= '"' and c ~= "'" and c ~= "[" then fail("PARSE_JOIN") end
            return s .. readText()
        end
        return s
    end

    local function readNumber()
        local s = text:match("^0[xX]%x+", pos) or text:match("^%d+%.?%d*[eE][-+]?%d+", pos)
            or text:match("^%d+%.?%d*", pos) or text:match("^%.%d+[eE][-+]?%d+", pos) or text:match("^%.%d+", pos)
        if not s then fail("PARSE_NUMBER", peek()) end
        pos = pos + #s
        local v = tonumber(s)
        if text:find("^[%w_%.]", pos) or not v or v ~= v or v == math.huge or v == -math.huge then
            fail("PARSE_NUMBER", s)
        end
        return v
    end

    local readTable

    local function readValue(depth)
        values = values + 1
        if values > T.MAX_VALUES then fail("PARSE_COUNT") end
        local c = peek()
        if c == "{" then return readTable(depth + 1) end
        if c == '"' or c == "'" or (c == "[" and text:find("^%[=*%[", pos)) then return readText() end
        if c == "-" then
            pos = pos + 1
            skip()
            return -readNumber()
        end
        if c:find("^[%d%.]") then return readNumber() end
        local word = text:match("^[%a_][%w_]*", pos)
        if word and CONSTANTS[word] ~= nil then
            pos = pos + #word
            return CONSTANTS[word]
        end
        if word == "nil" then
            pos = pos + 3
            return nil
        end
        if c == "" then fail("PARSE_CLOSE", "}") end
        fail("PARSE_VALUE", word or c)
    end

    function readTable(depth)
        if depth > T.MAX_DEPTH then fail("PARSE_DEPTH") end
        pos = pos + 1
        local t, n = {}, 0
        while true do
            skip()
            local c = peek()
            if c == "}" then
                pos = pos + 1
                return t
            end
            if c == "" then fail("PARSE_CLOSE", "}") end
            local key
            if c == "[" and not text:find("^%[=*%[", pos) then
                pos = pos + 1
                skip()
                key = readValue(depth)
                if type(key) ~= "string" and type(key) ~= "number" then fail("PARSE_KEY") end
                skip()
                if peek() ~= "]" then fail("PARSE_CLOSE", "]") end
                pos = pos + 1
                skip()
                if peek() ~= "=" then fail("PARSE_CLOSE", "=") end
                pos = pos + 1
            else
                local word = text:match("^[%a_][%w_]*", pos)
                if word and CONSTANTS[word] == nil and word ~= "nil" then
                    local start, startLine = pos, line
                    pos = pos + #word
                    skip()
                    if peek() ~= "=" or peek(2) == "==" then
                        pos, line = start, startLine
                        fail("PARSE_VALUE", word)
                    end
                    pos = pos + 1
                    key = word
                end
            end
            skip()
            local value = readValue(depth)
            if key == nil then
                if value == nil then fail("PARSE_VALUE", "nil") end
                n = n + 1
                t[n] = value
            elseif value ~= nil then
                t[key] = value
            end
            skip()
            c = peek()
            if c == "," or c == ";" then
                pos = pos + 1
            elseif c ~= "}" then
                fail("PARSE_CLOSE", "}")
            end
        end
    end

    local ok, result = pcall(function()
        skip()
        if text:find("^return[^%w_]", pos) then
            pos = pos + 6
            skip()
        end
        if peek() == "" then fail("PARSE_EMPTY") end
        if peek() ~= "{" then fail("PARSE_START") end
        local value = readTable(0)
        skip()
        if peek() == ";" then
            pos = pos + 1
            skip()
        end
        if peek() ~= "" then fail("PARSE_END") end
        return value
    end)
    if ok then return result end
    if type(result) == "table" then return nil, result end
    return nil, { line = line, key = "PARSE_BROKEN" }
end

---------------------------------------------------------------------------
-- Writer
---------------------------------------------------------------------------
local QUOTED = { ["\\"] = "\\\\", ['"'] = '\\"', ["\n"] = "\\n", ["\r"] = "\\r", ["\t"] = "\\t" }

-- A text in double quotes; "|" (the chat's escape) and other control characters as \ddd,
-- so that the one-line form can go through the chat.
local function quote(s)
    return '"' .. (s:gsub('[%c\\"|]', function(c) return QUOTED[c] or ("\\%03d"):format(c:byte()) end)) .. '"'
end

local function number(v)
    if v == math.floor(v) and math.abs(v) < 2 ^ 53 then return ("%d"):format(v) end
    return ("%.14g"):format(v)
end

-- Keys of a table: its list part first, then the others by `rank` (then by name).
local function keysOf(t, rank)
    local count = #t
    local keys = {}
    for k in pairs(t) do
        if not (type(k) == "number" and k >= 1 and k <= count and k == math.floor(k)) then keys[#keys + 1] = k end
    end
    table.sort(keys, function(a, b)
        local ra, rb = rank[a] or 1000, rank[b] or 1000
        if ra ~= rb then return ra < rb end
        return tostring(a) < tostring(b)
    end)
    return count, keys
end

-- opts.order: keys in the order to write them; opts.orderOf: [key] = the order inside the
-- values under that key (the steps' keys); opts.compact: one line; opts.layout: [key] =
-- "lines" (a list, one value per line, each on one line: the steps) or "blocks" (a list, one
-- value per line, each laid out like the whole: the guides of a pack). The whole is one
-- entry per line; any other table is on one line.
local function ranks(list)
    local rank = {}
    for i, k in ipairs(list or {}) do rank[k] = i end
    return rank
end

function T.Write(value, opts)
    opts = opts or {}
    local rootRank = ranks(opts.order)
    local rankOf = {}
    for k, list in pairs(opts.orderOf or {}) do rankOf[k] = ranks(list) end
    local layouts = opts.layout or {}
    local compact = opts.compact

    local function writeKey(k)
        if type(k) == "string" and k:find("^[%a_][%w_]*$") and CONSTANTS[k] == nil and k ~= "nil" then return k end
        return "[" .. (type(k) == "number" and number(k) or quote(tostring(k))) .. "]"
    end

    -- shape: "block" (one entry per line, its tables by opts.layout), "lines", "blocks", or
    -- nil (on one line).
    local function write(v, indent, shape, rank)
        local kind = type(v)
        if kind == "string" then return quote(v) end
        if kind == "number" then return number(v) end
        if kind ~= "table" then return tostring(v) end
        local open = shape ~= nil and not compact
        local inner = indent .. "    "
        local function child(k, val)
            local r = k ~= nil and rankOf[k] or rank
            if type(val) ~= "table" or not open or shape == "lines" then return write(val, inner, nil, r) end
            if shape == "blocks" then return write(val, inner, "block", r) end
            return write(val, inner, k ~= nil and layouts[k] or nil, r)
        end
        local count, keys = keysOf(v, rank)
        local parts = {}
        for i = 1, count do parts[#parts + 1] = child(nil, v[i]) end
        for _, k in ipairs(keys) do
            parts[#parts + 1] = writeKey(k) .. (compact and "=" or " = ") .. child(k, v[k])
        end
        if #parts == 0 then return "{}" end
        if compact then return "{" .. table.concat(parts, ",") .. "}" end
        if not open then return "{ " .. table.concat(parts, ", ") .. " }" end
        return "{\n" .. inner .. table.concat(parts, ",\n" .. inner) .. ",\n" .. indent .. "}"
    end

    return write(value, "", "block", rootRank)
end
