-- A client in a language Ding does not translate (Russian): English UI and guides.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1], { locale = "ruRU" })
local Ding, H = T.Ding, T.H

T.test("Russian client (untranslated language): interface in English", function()
    T.eq(Ding.locale, "ruRU")
    T.eq(Ding.L.ACCEPT, "Accept")
    T.eq(Ding.L.SETTINGS, "Settings")
    T.eq(Ding.L.T_NOWHERE, "T_NOWHERE")
    T.eq(Ding.Locales.frFR, nil, "the French texts must not be loaded")
    T.eq(BINDING_NAME_DING_NEXT, "Next step")
end)

T.test("Russian client (untranslated language): guide in English", function()
    local g = Ding:GetGuide("nightelf-01-shadowglen")
    T.eq(g.title, "Shadowglen (1-6)")
    T.eq(g.steps[1].note, "Both quest givers stand right in front of you, at the foot of Aldrassil.")
    T.eq(g.steps[#g.steps].text, "Head for Dolanaar")
end)

T.test("a French translation is ignored", function()
    local g = Ding.RegisterGuide({ id = "t-tr-en", title = "Title", steps = { { accept = 456, note = "Go" } } })
    Ding.RegisterGuideTranslation("frFR", "t-tr-en", { ["Title"] = "Titre", ["Go"] = "Va" })
    T.eq(g.title, "Title")
    T.eq(g.steps[1].note, "Go")
end)

T.test("panel and messages in English", function()
    T.reset()
    local printed = {}
    local add = DEFAULT_CHAT_FRAME.AddMessage
    DEFAULT_CHAT_FRAME.AddMessage = function(_, msg) printed[#printed + 1] = msg end
    Ding.Engine:SetGuide("nightelf-01-shadowglen", 1)
    SlashCmdList.DING("arrowflip")
    DEFAULT_CHAT_FRAME.AddMessage = add
    H.flush()
    T.ok(printed[1]:find("Guide: Shadowglen (1-6)", 1, true), printed[1])
    T.ok(printed[2]:find("Arrow orientation: setting %d of 4"), printed[2])
    local summary = Ding.Engine:Summary(Ding.Engine:CurrentStep())
    T.ok(summary:find("^Accept"), summary)
end)

T.run()
