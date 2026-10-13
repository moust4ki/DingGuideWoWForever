-- Free quests of the Leveling routes: quests a route leaves out although they cost almost nothing
-- on its way (tools/route_free.lua), and the steps that add them to the route.
-- usage: lua5.1 tools/audit_free_quests.lua <combined dir> [route.lua...] [--apply] [--also <ids>] [--passes <n>]
--   route.lua: tools/routes/leveling/alliance.lua and horde.lua by default
--   --apply:   writes the free quests into each route file (a step to accept, one to finish the
--              objectives when there are any, one to turn in, each right after the route step
--              the audit names); --also adds these borderline quests too (comma-separated ids);
--              the route is audited again after each change, --passes times at most (5)
--
-- Runs tools/write_leveling.lua --dry-run --free-quests on each route and prints, per section,
-- each free quest (XP, seconds added, times the section's pace, objectives, where its steps go),
-- then the borderline ones with the reason. Free: XP per added second at least 10 times the
-- section's own pace, 2 minutes added at most; borderline: from 4 times, or when the data
-- cannot tell what its objective costs. After --apply, write the guides again
-- (tools/write_leveling.lua, then tools/translate_guides.lua) and check them as usual. A free
-- quest the route should keep out goes in the route's `exclude`, with the reason.
local here = arg[0]:match("^(.*)[/\\]") or "."
local root = here:match("^(.*)[/\\]tools$") or (here == "." and "..") or (here .. "/..")
local X = dofile(here .. "/questiedb_export.lua")

local COMBINED, ROUTES, APPLY, ALSO, PASSES = nil, {}, false, {}, 5
do
    local i = 1
    while i <= #arg do
        local a = arg[i]
        if a == "--apply" then
            APPLY = true
        elseif a == "--passes" then
            i = i + 1
            PASSES = tonumber(arg[i]) or PASSES
        elseif a == "--also" then
            i = i + 1
            for id in tostring(arg[i]):gmatch("%d+") do ALSO[tonumber(id)] = true end
        elseif not COMBINED then
            COMBINED = a
        else
            ROUTES[#ROUTES + 1] = a
        end
        i = i + 1
    end
end
if not COMBINED then
    io.stderr:write("usage: lua5.1 tools/audit_free_quests.lua <combined dir> [route.lua...] [--apply] [--also <ids>]"
        .. " [--passes <n>]\n")
    os.exit(2)
end
if #ROUTES == 0 then
    ROUTES = { root .. "/tools/routes/leveling/alliance.lua", root .. "/tools/routes/leveling/horde.lua" }
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
local temp = ((windows and (os.getenv("TEMP") or os.getenv("TMP")) or os.getenv("TMPDIR")) or "/tmp"):gsub("\\", "/")

-- The audit of one route: the table tools/write_leveling.lua --free-quests writes.
local function audit(route)
    local out = ("%s/ding_free_quests_%d_%d.lua"):format(temp, os.time(), math.floor(os.clock() * 1000))
    local command = table.concat({ quote(lua), quote(here .. "/write_leveling.lua"), quote(COMBINED), quote(route),
        "--dry-run", "--free-quests", quote(out) }, " ")
    if windows then command = '"' .. command .. '"' end
    local pipe = assert(io.popen(command .. " 2>&1"))
    local output = pipe:read("*a")
    pipe:close()
    local chunk = loadfile(out)
    os.remove(out)
    if not chunk then
        io.stderr:write(output)
        error("tools/write_leveling.lua wrote no free quests for " .. route, 0)
    end
    return chunk()
end

local function readFile(path)
    local f = assert(io.open(path, "rb"))
    local text = f:read("*a")
    f:close()
    return text
end

-- The route's own Lua text with the new steps: { { section, after, text } ... }, each inserted
-- right after step `after` of its section (0: first), in the order given.
local function insert(text, adds)
    local eol = text:find("\r\n", 1, true) and "\r\n" or "\n"
    local lines = {}
    for line in (text .. "\n"):gmatch("([^\n]*)\n") do lines[#lines + 1] = (line:gsub("\r$", "")) end
    if lines[#lines] == "" then lines[#lines] = nil end
    -- Steps of each section: { [id] = { open = line of `steps = {`, steps = { line... }, indent } }.
    local sections, current = {}, nil
    for n, line in ipairs(lines) do
        local id = line:match('^%s*id = "([^"]+)"')
        if id then current = { steps = {} }; sections[id] = current end
        if current and not current.open and line:match("^%s*steps = {%s*$") then
            current.open = n
        elseif current and current.open and not current.closed then
            local indent = line:match("^(%s+){.*},%s*$")
            if indent then
                current.indent = current.indent or indent
                table.insert(current.steps, n)
            elseif line:match("^%s*},%s*$") then
                current.closed = true
            end
        end
    end
    -- Lines to add after each line of the file.
    local after = {}
    for _, a in ipairs(adds) do
        local s = sections[a.section]
        if not s or not s.open then error("section not found in the route: " .. a.section, 0) end
        local at = a.after == 0 and s.open or s.steps[a.after]
        if not at then error(("no step %d in %s"):format(a.after, a.section), 0) end
        after[at] = after[at] or {}
        table.insert(after[at], (s.indent or "                ") .. a.text)
    end
    local out = {}
    for n, line in ipairs(lines) do
        out[#out + 1] = line
        for _, extra in ipairs(after[n] or {}) do out[#out + 1] = extra end
    end
    return table.concat(out, eol) .. eol
end

local function strList(v)
    local parts = {}
    for _, x in ipairs(v) do parts[#parts + 1] = ("%q"):format(x) end
    return "{ " .. table.concat(parts, ", ") .. " }"
end
local function where(f)
    local parts = {}
    for _, s in ipairs(f.steps) do
        local label = s.action == "turnin" and "turn in" or s.action == "complete" and "finish" or s.action
        parts[#parts + 1] = ("%s after %s%d (%s)"):format(label, s.section ~= f.section and (s.section .. " ") or "",
            s.after, s.at)
    end
    return table.concat(parts, "; ")
end

local total = { free = 0, borderline = 0 }
-- With --apply, the route is audited again after each change: a quest added puts the route in new
-- places, where more may be free.
for _, route in ipairs(ROUTES) do
  for pass = 1, APPLY and PASSES or 1 do
    local result = audit(route)
    local free, border, bySection, order = {}, {}, {}, {}
    for _, f in ipairs(result.findings) do
        if f.kind == "free" or ALSO[f.q] then
            free[#free + 1] = f
            if not bySection[f.section] then
                bySection[f.section] = { quests = 0, xp = 0, seconds = 0 }
                order[#order + 1] = f.section
            end
            local s = bySection[f.section]
            s.quests, s.xp, s.seconds = s.quests + 1, s.xp + f.xp, s.seconds + f.added
        else
            border[#border + 1] = f
        end
    end
    total.free, total.borderline = total.free + #free, total.borderline + #border
    print(("Free quests of %s (%s)%s: %d free, %d borderline"):format(result.route, result.faction,
        pass > 1 and (" (pass " .. pass .. ")") or "", #free, #border))
    print(("  %-48s %-40s %4s %6s %5s %6s  %s"):format("section", "quest", "lvl", "XP", "+s", "pace", "objectives"))
    for _, f in ipairs(free) do
        print(("  %-48s %-40s %4d %6d %5.0f %5.1fx  %s%s"):format(f.section, (f.q .. " " .. f.name):sub(1, 40), f.level,
            f.xp, f.added, f.ratio, f.objectives, f.races and (" (" .. table.concat(f.races, ", ") .. ")") or ""))
        print("      " .. where(f))
    end
    print("  Per section:")
    for _, id in ipairs(order) do
        local s = bySection[id]
        print(("    %-48s %2d quests, +%d XP, +%.0f s"):format(id, s.quests, s.xp, s.seconds))
    end
    if #border > 0 then
        print("  Borderline (not added: a person decides):")
        for _, f in ipairs(border) do
            print(("  %-48s %-40s %4d %6d %5.0f %5.1fx  %s: %s%s"):format(f.section, (f.q .. " " .. f.name):sub(1, 40),
                f.level, f.xp, f.added, f.ratio, f.objectives, f.why or "?",
                f.races and (" (" .. table.concat(f.races, ", ") .. ")") or ""))
            print("      " .. where(f))
        end
    end
    local reasons = {}
    for _, s in ipairs(result.skipped or {}) do reasons[#reasons + 1] = s end
    table.sort(reasons, function(a, b)
        if a.quests ~= b.quests then return a.quests > b.quests end
        return a.why < b.why
    end)
    local parts = {}
    for _, s in ipairs(reasons) do parts[#parts + 1] = ("%s: %d"):format(s.why, s.quests) end
    if #parts > 0 then print("  Other quests of the side, not free: " .. table.concat(parts, "; ")) end
    if APPLY and #free > 0 then
        -- One step per action and place: the races of findings placed there together (none
        -- when they make up the whole side, the races that join on the way included).
        local plan = dofile(route)
        local side = {}
        for _, race in ipairs(X.FACTION_RACES[plan.faction or result.faction] or {}) do side[race] = true end
        for race in pairs(plan.entries or {}) do side[race] = true end
        local adds, byKey = {}, {}
        for _, f in ipairs(free) do
            for _, s in ipairs(f.steps) do
                local key = table.concat({ s.section, s.after, s.action, f.q }, "#")
                local a = byKey[key]
                if not a then
                    a = { section = s.section, after = s.after, action = s.action, q = f.q, races = f.races and {} or nil }
                    byKey[key] = a
                    adds[#adds + 1] = a
                elseif not f.races then
                    a.races = nil
                end
                for _, race in ipairs(a.races and f.races or {}) do a.races[#a.races + 1] = race end
            end
        end
        local sectionRaces = {}
        for _, s in ipairs(plan.sections or {}) do sectionRaces[s.id] = s.races end
        for _, a in ipairs(adds) do
            if a.races then
                local seen, all = {}, true
                for _, race in ipairs(a.races) do seen[race] = true end
                -- (A race start's own section: its races only.)
                local whole = side
                if sectionRaces[a.section] then
                    whole = {}
                    for _, race in ipairs(sectionRaces[a.section]) do whole[race] = true end
                end
                for race in pairs(whole) do if not seen[race] then all = false end end
                if all then a.races = nil end
            end
            a.text = ("{ %s = %d%s },"):format(a.action, a.q, a.races and (", races = " .. strList(a.races)) or "")
        end
        local text = insert(readFile(route), adds)
        local file = assert(io.open(route, "wb"))
        file:write(text)
        file:close()
        print(("  %d steps added to %s"):format(#adds, route))
    end
    print("")
    if #free == 0 then break end
  end
end
if APPLY then
    print("Next: write the guides again (tools/write_leveling.lua, tools/translate_guides.lua) and check them.")
end
