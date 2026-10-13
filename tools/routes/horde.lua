-- Horde trunk, levels 20-60, shared by every race after its own track.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
--
-- Order and windows: the player never takes a quest above their level, so each zone comes
-- when most of its quests are at the player's level, and the Barrens, the Stonetalon
-- Mountains and the Hillsbrad Foothills come back once their higher quests open. Several
-- orders were compared with draft_guide.lua --report (time to reach 60, quests turned in);
-- this one keeps the most quests for the least grinding.
--
-- Durotar, Mulgore and Tirisfal stay out of the trunk. The Barrens, the Stonetalon Mountains
-- and Silverpine Forest are split by quest level: the race tracks stop at level 19 quests
-- (maxQuestLevel), the trunk starts at 20 (minQuestLevel) and leaves out the quests whose
-- chain starts below 20, which a track may or may not have done (lowChains).
local ORGRIMMAR, THUNDER_BLUFF, UNDERCITY = 1637, 1638, 1497

-- Quests of level 20 and more whose prerequisites start below 20, found in the QuestieDB
-- export (each quest's chain, quest levels only).
local lowChains = {
    barrens = { 822, 873, 874, 876, 913, 1060, 1068, 4021, 6382 },
    stonetalon = { 1068, 6481 },
    silverpine = { 442, 480, 530 },
}
local function merge(...)
    local out = {}
    for _, list in ipairs({ ... }) do
        for _, q in ipairs(list) do out[#out + 1] = q end
    end
    return out
end
-- Forever quests of the Barrens with no level in the export (Goblin Lockpicks, A Sealed
-- Crate): every race track takes them, so the trunk leaves them out.
local takenByTracks = { 78270, 91901 }
local BARRENS_STONETALON = merge(lowChains.barrens, lowChains.stonetalon, takenByTracks)

local function guide(id, file, areas, extraAreas, minLevel, maxLevel, minQuestLevel, en, extra)
    local g = {
        id = id, file = "Horde/" .. file, areas = areas, extraAreas = extraAreas,
        minLevel = minLevel, maxLevel = maxLevel, minQuestLevel = minQuestLevel,
        title = en[1], intro = en[2],
    }
    for k, v in pairs(extra or {}) do g[k] = v end
    return g
end

return {
    file = "horde.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    faction = "Horde",
    races = { "Orc", "Scourge", "Tauren", "Troll" },
    carry = 2,
    -- Shared with tools/routes/leveling_horde.lua.
    lowChains = lowChains, takenByTracks = takenByTracks,
    guides = {
        guide("horde-20-barrens", "20_Barrens.lua", { 17, 406 }, { ORGRIMMAR, THUNDER_BLUFF }, 19, 20, 20,
            { "The Barrens and Stonetalon", "The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens." },
            { exclude = BARRENS_STONETALON }),
        guide("horde-23-ashenvale", "23_Ashenvale.lua", { 331 }, { ORGRIMMAR }, 20, 25, 19,
            { "Ashenvale", "Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base." }),
        guide("horde-25-hillsbrad", "25_Hillsbrad.lua", { 267, 36, 130 }, { UNDERCITY }, 25, 27, 20,
            { "Hillsbrad Foothills", "Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base." },
            { exclude = lowChains.silverpine }),
        guide("horde-27-barrens", "27_Barrens.lua", { 17, 406 }, { ORGRIMMAR, THUNDER_BLUFF }, 27, 28, 20,
            { "The Barrens and Stonetalon", "Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains." },
            { exclude = BARRENS_STONETALON }),
        guide("horde-29-needles", "29_ThousandNeedles.lua", { 400 }, { THUNDER_BLUFF }, 28, 30, 23,
            { "Thousand Needles", "Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base." }),
        guide("horde-31-hillsbrad", "31_Hillsbrad.lua", { 267, 36, 45 }, { UNDERCITY }, 30, 32, 24,
            { "Hillsbrad, Alterac and Arathi", "Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands." }),
        guide("horde-33-desolace", "33_Desolace.lua", { 405 }, nil, 32, 34, 28,
            { "Desolace", "Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast." }),
        guide("horde-35-stv", "35_Stranglethorn.lua", { 33 }, { ORGRIMMAR, UNDERCITY }, 34, 36, 30,
            { "Stranglethorn Vale", "Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn." }),
        guide("horde-37-dustwallow", "37_Dustwallow.lua", { 15, 400 }, { ORGRIMMAR, THUNDER_BLUFF }, 36, 37, 30,
            { "Dustwallow and Thousand Needles", "Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles." }),
        guide("horde-39-arathi", "39_Arathi.lua", { 45 }, { UNDERCITY }, 37, 38, 33,
            { "Arathi Highlands", "Back to the Arathi Highlands: Hammerfall is in the east of the zone." }),
        guide("horde-40-badlands", "40_Badlands.lua", { 3 }, { UNDERCITY }, 38, 38, 35,
            { "Badlands", "Fly from Hammerfall to Kargath, in the west of the Badlands." }),
        guide("horde-41-stv", "41_Stranglethorn.lua", { 33 }, { ORGRIMMAR, UNDERCITY }, 38, 42, 37,
            { "Stranglethorn Vale", "Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay." }),
        guide("horde-43-swamp", "43_SwampOfSorrows.lua", { 8 }, nil, 42, 42, 38,
            { "Swamp of Sorrows", "The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base." }),
        guide("horde-44-feralas", "44_Feralas.lua", { 357 }, { THUNDER_BLUFF }, 42, 44, 41,
            { "Feralas", "Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base." }),
        guide("horde-46-tanaris", "46_Tanaris.lua", { 440 }, nil, 44, 48, 41,
            { "Tanaris", "Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet." }),
        guide("horde-48-hinterlands", "48_Hinterlands.lua", { 47 }, { UNDERCITY }, 48, 49, 42,
            { "The Hinterlands", "The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast." }),
        guide("horde-49-searinggorge", "49_SearingGorge.lua", { 51, 46 }, { UNDERCITY }, 49, 50, 44,
            { "Searing Gorge", "Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge." }),
        guide("horde-50-ungoro", "50_UnGoro.lua", { 490 }, nil, 50, 51, 46,
            { "Un'Goro Crater", "Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan." }),
        guide("horde-53-azshara", "53_Azshara.lua", { 16 }, { ORGRIMMAR }, 51, 51, 46,
            { "Azshara", "Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base." }),
        guide("horde-54-felwood", "54_Felwood.lua", { 361 }, { ORGRIMMAR }, 51, 53, 47,
            { "Felwood", "Felwood is north of Ashenvale: the Horde post is in the west of the zone." }),
        guide("horde-56-wpl", "56_WesternPlaguelands.lua", { 28 }, { UNDERCITY }, 53, 55, 50,
            { "Western Plaguelands", "The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill." }),
        guide("horde-57-winterspring", "57_Winterspring.lua", { 618 }, { ORGRIMMAR }, 55, 56, 50,
            { "Winterspring", "Winterspring is northeast of Felwood: Everlook is your base." }),
        guide("horde-58-epl", "58_EasternPlaguelands.lua", { 139 }, { UNDERCITY }, 56, 56, 52,
            { "Eastern Plaguelands", "The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east." }),
        guide("horde-59-silithus", "59_Silithus.lua", { 1377 }, nil, 56, 60, 53,
            { "Silithus", "Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone." }),
    },
}
