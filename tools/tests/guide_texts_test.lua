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

-- Names that every language writes the English way (proper names); the Skyborne innkeepers
-- have no name of their own in any language. Anything else left in English is an oversight.
local SAME = {
    Astranaar = true, Auberdine = true, Dolanaar = true, Kharanos = true, Thelsamar = true, Gadgetzan = true,
    Kargath = true, Orgrimmar = true, Theramore = true, ["Grom'gol"] = true, Brill = true, Hammerfall = true,
    ["Camp Mojache"] = true, ["Camp Taurajo"] = true, ["Coriella Calmbreeze"] = true, ["Donaal Downbreeze"] = true,
    -- The German dictionary's name, as the rest of its guides say it (to check in game).
    ["Shadowprey Village"] = true,
}

T.test("every hearthstone step's place, in every language: never left in English", function()
    local root = tools .. "/.."
    local places = {}
    local toc = assert(io.open(root .. "/Ding/Ding.toc", "rb")):read("*a")
    -- The guides' own lines of the TOC (not their translations, Locales\Guides\...).
    for line in toc:gmatch("[^\r\n]+") do
        local file = line:match("^Guides\\(.+%.lua)$")
        if file then
            local def
            _G.Ding = { RegisterGuide = function(d) def = d return d end }
            dofile(root .. "/Ding/Guides/" .. file:gsub("\\", "/"))
            _G.Ding = nil
            for _, step in ipairs(def and def.steps or {}) do
                if type(step.sethearth) == "string" then places[step.sethearth] = file end
            end
        end
    end
    T.ok(next(places), "no hearthstone step in the shipped guides")
    for locale, d in pairs(Texts.load(tools .. "/routes/locales")) do
        for place, file in pairs(places) do
            local text = d[place]
            T.ok(text and text ~= "", ("%s: no name for the hearthstone place %q (%s)"):format(locale, place, file))
            T.ok(text ~= place or SAME[place], ("%s: the hearthstone place %q left in English (%s)"):format(locale, place, file))
        end
    end
end)

T.run()
