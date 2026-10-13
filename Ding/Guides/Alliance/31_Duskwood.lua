-- Drafted by tools/draft_guide.lua from tools/routes/alliance.lua and the QuestieDB
-- Forever export, then checked with tools/check_guides.lua. Edit the route, not this file:
-- it is written again on each run. Quest ids only, names and places come from QuestieDB.
-- French text: Ding/Locales/Guides/frFR/Alliance/31_Duskwood.lua.
-- Simulated: level 31 (0%) -> 32 (13%), 35 quests turned in, about 3 h 36 (16 091 XP per hour).
Ding.RegisterGuide({
    id       = "alliance-31-duskwood",
    pack     = "ding-zones",
    title    = "Duskwood (31-32)",
    faction  = "Alliance",
    minLevel = 31, maxLevel = 32,
    next     = "alliance-33-hillsbrad",
    steps    = {
        { accept = 56, -- level 31
          note = "Back to Duskwood for the end of its quests: Darkshire is still your base." },
        { accept = 174 }, -- level 31
        { complete = 174 }, -- level 31
        { turnin = 174, accept = 175 }, -- level 31
        { turnin = 175, accept = 177 }, -- level 31
        { complete = { 56, 177 } }, -- level 31
        { turnin = 177, accept = 181 }, -- level 31
        { accept = 173 }, -- level 31
        { turnin = 56, accept = 57 }, -- level 31
        { complete = 173 }, -- level 31
        { accept = 148 }, -- level 31
        { accept = 95 }, -- level 31
        { complete = 57 }, -- level 31
        { complete = 181 }, -- level 31
        { turnin = 95, accept = 230 }, -- level 31
        { turnin = 57, accept = 58 }, -- level 31
        { turnin = 148, accept = { 66, 149 } }, -- level 31
        { turnin = 181 }, -- level 31
        { turnin = 149, accept = 154 }, -- level 31
        { turnin = 173, accept = 221 }, -- level 31
        { turnin = 154, accept = 157 }, -- level 31
        { sethearth = "Darkshire" }, -- level 31
        { complete = 221 }, -- level 31
        { turnin = 157, accept = 158 }, -- level 31
        { turnin = 230, accept = 262 }, -- level 31
        { hearth = true }, -- level 31
        { turnin = 262, accept = 265 }, -- level 31
        { turnin = 221, accept = 222 }, -- level 31
        { turnin = { 66, 265 }, accept = 266 }, -- level 31
        { turnin = { 266, 158 }, accept = 156 }, -- level 31
        { complete = 156 }, -- level 31
        { complete = 222 }, -- level 31
        { turnin = 156, accept = { 453, 159 } }, -- level 31
        { turnin = 159, accept = 133 }, -- level 31
        { complete = 133 }, -- level 31
        { turnin = 133, accept = 134 }, -- level 31
        { complete = 134 }, -- level 31
        { turnin = 453, accept = 268 }, -- level 31
        { turnin = 268, accept = 323 }, -- level 31
        { complete = 323 }, -- level 31
        { turnin = 323, accept = 269 }, -- level 31
        { complete = 58 }, -- level 31
        { turnin = 134, accept = 160 }, -- level 31
        { hearth = true }, -- level 31
        { turnin = 160, accept = 251 }, -- level 31
        { turnin = 251, accept = 401 }, -- level 31
        { turnin = 401, accept = 252 }, -- level 31
        { turnin = { 252, 58 } }, -- level 31
        { turnin = 222, accept = 223 }, -- level 32
        { turnin = 223 }, -- level 32
        { turnin = 1075 }, -- level 32
        { turnin = 269 }, -- level 32
    },
})
