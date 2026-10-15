-- Picks the UI strings for the client's language. The strings live in Locales/<locale>.lua,
-- one file per language, loaded just before this file: English is the default and the
-- fallback for any missing key; deDE, esES, frFR, koKR, ptBR, zhCN and zhTW are used by a
-- client in that language. Guide texts are translated separately
-- (Ding.RegisterGuideTranslation, Core/Registry.lua).
local _, Ding = ...

local locales = Ding.Locales or {}
local enUS = assert(locales.enUS, "Ding: Locales/enUS.lua must load before Core/Locales.lua")

-- Latin American Spanish uses the Spanish texts, British English the English ones.
-- QuestieDB still gets the client's own language (Core/Data.lua).
local ALIASES = { esMX = "esES", enGB = "enUS" }
Ding.locale = ALIASES[GetLocale()] or GetLocale()

local L = locales[Ding.locale] or enUS
setmetatable(L, { __index = function(_, k) return rawget(enUS, k) or k end })
Ding.L = L

-- Key binding labels (Bindings.xml).
BINDING_HEADER_DING = "Ding!"
BINDING_NAME_DING_NEXT = L.BIND_NEXT
BINDING_NAME_DING_PREV = L.BIND_PREV
BINDING_NAME_DING_TOGGLE = L.BIND_TOGGLE
BINDING_NAME_DING_CONFIG = L.BIND_CONFIG
BINDING_NAME_DING_COMPACT = L.BIND_COMPACT
BINDING_NAME_DING_FOCUS = L.BIND_FOCUS
BINDING_NAME_DING_SKIP = L.BIND_SKIP
BINDING_NAME_DING_UNSKIP = L.BIND_UNSKIP
BINDING_NAME_DING_FINDER = L.BIND_FINDER
BINDING_NAME_DING_CYCLE = L.BIND_CYCLE
BINDING_NAME_DING_REPORT = L.BIND_REPORT
_G["BINDING_NAME_CLICK DingItemButton:LeftButton"] = L.BIND_ITEM
_G["BINDING_NAME_CLICK DingItemButton:Target"] = L.BIND_TARGET
