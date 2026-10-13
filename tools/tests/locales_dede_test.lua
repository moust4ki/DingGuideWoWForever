-- A client in one of the translated languages other than French (German): its own UI
-- strings and guide texts, its translation loaded, the others left out.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "deDE" })
local Ding = T.Ding
local german = dofile(tools .. "/routes/locales/deDE.lua")

T.test("German client: interface in German, without the other languages", function()
    T.eq(Ding.locale, "deDE")
    T.ok(Ding.Locales.deDE, "Locales/deDE.lua not loaded")
    T.eq(Ding.L.ACCEPT, Ding.Locales.deDE.ACCEPT)
    T.ok(Ding.L.ACCEPT ~= "Accept", "interface still in English")
    T.eq(BINDING_NAME_DING_NEXT, Ding.Locales.deDE.BIND_NEXT)
    for _, other in ipairs({ "frFR", "esES", "ptBR", "koKR", "zhCN", "zhTW" }) do
        T.eq(Ding.Locales[other], nil, other .. " loaded by a German client")
    end
end)

T.test("German client: guides in German", function()
    local g = Ding:GetGuide("nightelf-01-shadowglen")
    T.eq(g.title, german["Shadowglen"] .. " (1-6)", "the dictionary names the zone, the range stays")
    T.eq(g.steps[1].note, german["Both quest givers stand right in front of you, at the foot of Aldrassil."])
end)

T.test("German client: the Noto Sans font (it has the umlauts)", function()
    T.ok(tostring(Ding.UI.Font("regular", 12):GetFont()):find("NotoSans%-Regular"), "game font in German")
end)

T.run()
