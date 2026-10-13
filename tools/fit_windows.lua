-- Re-cuts the level windows of a route (tools/routes/*.lua) so that each guide starts at the
-- level the previous one reaches: no guide ends with a level step ("Finish the level on
-- nearby monsters") just to reach the next guide's minimum level.
-- usage: lua5.1 tools/fit_windows.lua <combined dir> <route.lua> [--passes <n>] [--iterations <n>]
--   --iterations: local search moves per guide, passed to draft_guide.lua (tests)
--
-- Runs tools/draft_guide.lua --fit --dry-run on the route (each guide starts where the
-- previous one ended), then writes into the route file: minLevel = the level reached when the
-- guide starts (rounded down), maxLevel = the next guide's minLevel. The route's first
-- minLevel stays (where the route starts), and so does the last maxLevel of a route that
-- leads nowhere (60). A guide's window is also its optimizer target, so the simulation
-- changes a little with it: the tool runs again until the windows no longer move (3 passes
-- at most by default). Titles follow on their own (draft_guide.lua adds the window).
-- Route files are written in one of two styles, both handled: a table per guide
-- (`id = "...", ..., minLevel = 6, maxLevel = 11`) or a call per guide
-- (`guide("<id>", "<file>", { areas }, { extraAreas } | nil, minLevel, maxLevel, ...)`).
local here = arg[0]:match("^(.*)[/\\]") or "."

local COMBINED, ROUTE, PASSES, ITERATIONS = nil, nil, 3, nil
do
    local i = 1
    while i <= #arg do
        if arg[i] == "--passes" then
            i = i + 1
            PASSES = tonumber(arg[i]) or PASSES
        elseif arg[i] == "--iterations" then
            i = i + 1
            ITERATIONS = tonumber(arg[i])
        elseif not COMBINED then
            COMBINED = arg[i]
        else
            ROUTE = arg[i]
        end
        i = i + 1
    end
end
if not COMBINED or not ROUTE then
    io.stderr:write("usage: lua5.1 tools/fit_windows.lua <combined dir> <route.lua> [--passes <n>] [--iterations <n>]\n")
    os.exit(2)
end

local windows = package.config:sub(1, 1) == "\\"
local function quote(s)
    if windows then return '"' .. s .. '"' end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end
local lua = "lua5.1"
do
    local i = -1
    while arg[i] do lua = arg[i]; i = i - 1 end
end

-- Suggested windows: { [id] = { min, max } } and the order of the guides.
local function simulate()
    local command = table.concat({ quote(lua), quote(here .. "/draft_guide.lua"), quote(COMBINED), quote(ROUTE),
        "--fit", "--dry-run", ITERATIONS and ("--iterations " .. ITERATIONS) or "" }, " ")
    if windows then command = '"' .. command .. '"' end
    local pipe = assert(io.popen(command .. " 2>&1"))
    local output = pipe:read("*a")
    pipe:close()
    local fit, order, inTable = {}, {}, false
    for line in output:gmatch("[^\r\n]+") do
        if line:find("^Level windows") then
            inTable = true
        elseif inTable then
            local id, a, b = line:match("^   (%S+)%s+%d+%-%d+%s+%->%s+(%d+)%-(%d+)")
            if id then
                fit[id] = { tonumber(a), tonumber(b) }
                order[#order + 1] = id
            end
        end
    end
    if #order == 0 then
        io.stderr:write(output)
        error("draft_guide.lua --fit printed no level window", 0)
    end
    return fit, order
end

local function readFile(path)
    local f = assert(io.open(path, "rb"))
    local text = f:read("*a")
    f:close()
    return text
end

-- Sets a guide's window in the route text; returns the new text and the old window.
local function setWindow(text, id, min, max)
    local esc = id:gsub("%p", "%%%0")
    -- Table style: the guide's block runs to the next `id = "`.
    local s = text:find('id = "' .. esc .. '"', 1)
    if s then
        local e = text:find('id = "', s + 1, true) or (#text + 1)
        local block = text:sub(s, e - 1)
        local a, b = block:match("minLevel = (%d+), maxLevel = (%d+)")
        assert(a, "no minLevel = .., maxLevel = .. for " .. id)
        block = block:gsub("minLevel = %d+, maxLevel = %d+", ("minLevel = %d, maxLevel = %d"):format(min, max), 1)
        return text:sub(1, s - 1) .. block .. text:sub(e), tonumber(a), tonumber(b)
    end
    -- Call style: guide("<id>", "<file>", { areas }, { extraAreas } | nil, min, max, ...
    s = text:find('guide%("' .. esc .. '", ')
    assert(s, "guide not found in the route: " .. id)
    local head = text:match('^guide%("' .. esc .. '", "[^"]*", %b{}, ', s)
    assert(head, "unexpected guide(...) call for " .. id)
    local p = s + #head
    local extra = text:match("^%b{}, ", p) or text:match("^nil, ", p)
    assert(extra, "unexpected extraAreas for " .. id)
    p = p + #extra
    local a, b = text:match("^(%d+), (%d+),", p)
    assert(a, "unexpected minLevel, maxLevel for " .. id)
    local old = a .. ", " .. b .. ","
    return text:sub(1, p - 1) .. ("%d, %d,"):format(min, max) .. text:sub(p + #old), tonumber(a), tonumber(b)
end

local route = dofile(ROUTE)
local last = route.guides[#route.guides]
for pass = 1, PASSES do
    local fit, order = simulate()
    local text = readFile(ROUTE)
    local changed = 0
    for n, id in ipairs(order) do
        local min, max = fit[id][1], fit[id][2]
        local g = route.guides[n]
        assert(g and g.id == id, "guide order differs from the route at " .. id)
        if n == 1 then min = g.minLevel end
        if id == last.id and not route.next then max = last.maxLevel end
        max = math.max(min, max)
        local oldMin, oldMax
        text, oldMin, oldMax = setWindow(text, id, min, max)
        if oldMin ~= min or oldMax ~= max then
            changed = changed + 1
            print(("pass %d  %-28s %2d-%-2d -> %2d-%-2d"):format(pass, id, oldMin, oldMax, min, max))
        end
    end
    if changed == 0 then
        print(("pass %d: windows unchanged"):format(pass))
        break
    end
    local f = assert(io.open(ROUTE, "wb"))
    f:write(text)
    f:close()
    route = dofile(ROUTE)
end
