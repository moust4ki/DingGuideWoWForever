-- tools/audit_data.lua: what Ding's guides need that DingDB lacks, read from Ding/DB alone or
-- with the QuestieDB export (dungeon content and what the player makes appear told apart).
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })

local windows = package.config:sub(1, 1) == "\\"
local function quote(s)
    if windows then return '"' .. s .. '"' end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end
local function shell(command) return windows and ('"' .. command .. '"') or command end
local lua = "lua5.1"
local i = -1
while arg[i] do lua = arg[i]; i = i - 1 end
local function run(...)
    local pipe = io.popen(shell(table.concat({ quote(lua), quote(tools .. "/audit_data.lua"), ... }, " ") .. " 2>&1"))
    local output = pipe:read("*a")
    pipe:close()
    return output
end

T.test("alone: every shipped guide read, the gaps counted, a hint to pass the export", function()
    local out = run()
    T.ok(out:find("^%d+ guides, %d+ steps, %d+ quests %(DingDB: QuestieDB"), out:sub(1, 200))
    T.ok(out:find("pass the QuestieDB export", 1, true), "hint")
    T.ok(out:find("\nTotal: %d+ to add"), "total")
end)

T.test("with the export: dungeon content and what the player makes appear are told apart", function()
    local out = run(quote(T.combined))
    local add, dungeon, made = out:match("Total: (%d+) to add, (%d+) inside a dungeon, (%d+) made by the player")
    T.ok(add and tonumber(dungeon) > 0 and tonumber(made) > 0, out:sub(-300))
    T.ok(not out:find("unknown", 1, true), "every gap explained")
end)

T.run()
