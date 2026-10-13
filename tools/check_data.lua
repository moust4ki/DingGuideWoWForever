-- Checks DingDB's corrections and additions (tools/data/corrections/*.lua, docs/dingdb.md):
-- each file reads as plain data, and every entry has a known section, a valid id, known fields
-- and the right shape. tools/build_data.lua refuses the same mistakes.
-- usage: lua5.1 tools/check_data.lua [<corrections dir>]
-- Exit code: 0 when everything is valid, 1 otherwise.
local here = arg[0]:match("^(.*)[/\\]") or "."
local C = dofile(here .. "/dingdb_corrections.lua")
local dir = arg[1] or (here .. "/data/corrections")

local files, errors = C.load(dir)
local entries = 0
for _, f in ipairs(files) do
    for _, e in ipairs(C.check(f.data, f.file)) do errors[#errors + 1] = e end
    for key, list in pairs(f.data) do
        if C.KINDS[key] and type(list) == "table" then
            for _ in pairs(list) do entries = entries + 1 end
        end
    end
end
for _, e in ipairs(errors) do print("[ERROR] " .. e) end
print(("DingDB corrections: %d file(s), %d entr%s, %d error(s)"):format(#files, entries,
    entries == 1 and "y" or "ies", #errors))
os.exit(#errors == 0 and 0 or 1)
