-- Runs every unit test file (tools/tests/*_test.lua), each in its own Lua process so
-- that no state leaks from one file to the next.
-- usage: lua5.1 tools/run_tests.lua <combined dir> [filter]
-- Exit code: 0 when every file passed, 1 otherwise, 2 on bad usage.
local here = arg[0]:match("^(.*)[/\\]") or "."
local combined, filter = arg[1], arg[2]
if not combined then
    io.stderr:write("usage: lua5.1 tools/run_tests.lua <combined dir> [filter]\n")
    os.exit(2)
end

-- The interpreter running this script, to start the test files the same way.
local lua = "lua5.1"
local i = -1
while arg[i] do lua = arg[i]; i = i - 1 end

-- Shell commands go through sh on Linux and cmd.exe on Windows, which quote differently.
local windows = package.config:sub(1, 1) == "\\"
local function quote(s)
    if windows then return '"' .. s .. '"' end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end
local function shell(command)
    -- cmd.exe drops the outer quotes of a command line that starts with one.
    return windows and ('"' .. command .. '"') or command
end

local files = {}
local list = io.popen(windows and shell("dir /b " .. quote((here .. "\\tests"):gsub("/", "\\")))
    or ("ls " .. quote(here .. "/tests") .. " 2>/dev/null"))
for name in list:lines() do
    if name:find("_test%.lua$") and (not filter or name:find(filter, 1, true)) then
        files[#files + 1] = name
    end
end
list:close()
table.sort(files)
if #files == 0 then
    io.stderr:write("no test file found\n")
    os.exit(1)
end

local failed = 0
for _, name in ipairs(files) do
    print("# " .. name)
    io.stdout:flush()
    local ok, _, code = os.execute(shell(quote(lua) .. " " .. quote(here .. "/tests/" .. name) .. " " .. quote(combined)))
    -- Lua 5.1 returns the status code alone; later versions return true/nil, "exit", code.
    if type(ok) == "number" then code = ok end
    if code ~= 0 and ok ~= true then failed = failed + 1 end
end
print(("Unit tests: %d file(s), %d failed"):format(#files, failed))
os.exit(failed > 0 and 1 or 0)
