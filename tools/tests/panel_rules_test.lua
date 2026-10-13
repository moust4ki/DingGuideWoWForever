-- The guide window's rules (docs/SPEC.md, "Guide window: rules"), in French: tools/tests/panel_rules.lua.
local tools = (arg[0]:match("^(.*)[/\]") or ".") .. "/.."
dofile(tools .. "/tests/panel_rules.lua")(tools, "frFR")
