-- Parse-only check, equivalent to `luac5.1 -p` for each file given.
local bad = 0
for _, path in ipairs(arg) do
    local fn, err = loadfile(path)
    if not fn then bad = bad + 1; io.stderr:write(err, "\n") end
end
print(("syntax: %d files, %d errors"):format(#arg, bad))
os.exit(bad == 0 and 0 or 1)
