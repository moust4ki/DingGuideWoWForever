-- Translation of the generated guides' texts (tools/guide_texts.lua): a whole text, a note
-- joining several phrases, a title with its level range.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { bare = true })
local Texts = dofile(tools .. "/guide_texts.lua")

local dict = {
    ["Westfall"] = "Marche de l'Ouest",
    ["Head for Sentinel Hill."] = "Direction la colline des Sentinelles.",
    ["Kill the gnolls."] = "Tue les gnolls.",
}

T.test("a text of the dictionary, or a note made of its phrases", function()
    T.eq(Texts.translate("Head for Sentinel Hill.", dict, "frFR"), "Direction la colline des Sentinelles.")
    T.eq(Texts.translate("Head for Sentinel Hill. Kill the gnolls.", dict, "frFR"),
        "Direction la colline des Sentinelles. Tue les gnolls.")
    T.eq(Texts.translate("Kill the murlocs.", dict, "frFR"), nil, "unknown phrase")
end)

T.test("a title: the dictionary names the zone, the level range stays", function()
    T.eq(Texts.translate("Westfall (11-16)", dict, "frFR"), "Marche de l'Ouest (11-16)")
    T.eq(Texts.translate("Westfall (48)", dict, "frFR"), "Marche de l'Ouest (48)", "a single level")
    T.eq(Texts.translate("Duskwood (20-24)", dict, "frFR"), nil, "zone not in the dictionary")
    T.eq(Texts.translate("Westfall (soon)", dict, "frFR"), nil, "not a level range")
end)

T.test("the shipped dictionaries name each zone once, without its levels", function()
    for locale, d in pairs(Texts.load(tools .. "/routes/locales")) do
        for english in pairs(d) do
            T.ok(not english:find(" %(%d+%-?%d*%)$"), ("%s: title with its levels: %s"):format(locale, english))
        end
    end
end)

T.run()
