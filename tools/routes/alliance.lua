-- Alliance trunk, levels 20-60, shared by every race after its own track.
-- Our route: zones, level windows and notes. tools/draft_guide.lua turns it into guides.
-- areas: zones where quests start and are worked; extraAreas: towns where they may end.
-- Texts are English; each language translates them in tools/routes/locales/<locale>.lua.
-- Track zones (Elwynn, Westfall, Dun Morogh, Loch Modan, Teldrassil, Darkshore) stay out of
-- the trunk so that no race meets a quest it already did.
local SW, IF, DN, DARKSHORE = 1519, 1537, 1657, 148


local function guide(id, file, areas, extraAreas, minLevel, maxLevel, minQuestLevel, en)
    return {
        id = id, file = "Alliance/" .. file, areas = areas, extraAreas = extraAreas,
        minLevel = minLevel, maxLevel = maxLevel, minQuestLevel = minQuestLevel,
        title = en[1], intro = en[2],
    }
end

return {
    file = "alliance.lua",
    -- Guides of Ding's "Zones" pack (one per zone): the default "Leveling" pack is leveling_*.lua.
    pack = "ding-zones",
    races = { "Human", "Dwarf", "NightElf", "Gnome" },
    carry = 2,
    guides = {
        guide("alliance-20-redridge", "20_Redridge.lua", { 44 }, { SW }, 18, 19, 15,
            { "Redridge Mountains", "Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind." }),
        guide("alliance-22-duskwood", "22_Duskwood.lua", { 10 }, { SW }, 19, 20, 18,
            { "Duskwood", "Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base." }),
        guide("alliance-24-wetlands", "24_Wetlands.lua", { 11 }, { IF }, 20, 26, 19,
            { "Wetlands", "The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base." }),
        guide("alliance-26-ashenvale", "26_Ashenvale.lua", { 331 }, { DN, DARKSHORE }, 26, 27, 19,
            { "Ashenvale", "Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base." }),
        guide("alliance-28-stonetalon", "28_Stonetalon.lua", { 406 }, { DN }, 27, 27, 20,
            { "Stonetalon Mountains", "The Stonetalon Mountains are west of Ashenvale." }),
        guide("alliance-29-ashenvale", "29_Ashenvale.lua", { 331 }, { DN, DARKSHORE }, 27, 31, nil,
            { "Ashenvale", "Back to Astranaar for the last Ashenvale quests." }),
        guide("alliance-31-duskwood", "31_Duskwood.lua", { 10 }, { SW }, 31, 32, nil,
            { "Duskwood", "Back to Duskwood for the end of its quests: Darkshire is still your base." }),
        guide("alliance-33-hillsbrad", "33_Hillsbrad.lua", { 267, 36 }, { IF }, 32, 34, 28,
            { "Hillsbrad Foothills", "From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base." }),
        guide("alliance-34-needles", "34_ThousandNeedles.lua", { 400 }, nil, 34, 34, 29,
            { "Thousand Needles", "Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base." }),
        guide("alliance-35-desolace", "35_Desolace.lua", { 405 }, nil, 34, 37, 30,
            { "Desolace", "Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone." }),
        guide("alliance-37-stv", "37_Stranglethorn.lua", { 33 }, { SW }, 37, 39, 31,
            { "Stranglethorn Vale", "Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south." }),
        guide("alliance-39-arathi", "39_Arathi.lua", { 45 }, { IF }, 39, 40, 33,
            { "Arathi Highlands", "The Arathi Highlands are north of the Wetlands, across Thandol Span." }),
        guide("alliance-40-dustwallow", "40_Dustwallow.lua", { 15 }, nil, 40, 40, 34,
            { "Dustwallow Marsh", "Boat from Menethil to Theramore, the Alliance base on the edge of the marsh." }),
        guide("alliance-41-badlands", "41_Badlands.lua", { 3 }, { IF }, 40, 41, 35,
            { "Badlands", "The Badlands are southeast of Loch Modan." }),
        guide("alliance-42-swamp", "42_SwampOfSorrows.lua", { 8 }, nil, 41, 41, 35,
            { "Swamp of Sorrows", "The Swamp of Sorrows is east of Deadwind Pass, south of Redridge." }),
        guide("alliance-43-stv", "43_Stranglethorn.lua", { 33 }, { SW }, 41, 41, 37,
            { "Stranglethorn Vale", "Back to Stranglethorn for the end of its quests, from Booty Bay." }),
        guide("alliance-45-tanaris", "45_Tanaris.lua", { 440 }, nil, 41, 47, 40,
            { "Tanaris", "Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore." }),
        guide("alliance-47-feralas", "47_Feralas.lua", { 357 }, { DN }, 47, 48, 41,
            { "Feralas", "The Alliance stronghold of Feralas is on an island west of the zone." }),
        guide("alliance-49-hinterlands", "49_Hinterlands.lua", { 47 }, { IF }, 48, 48, 42,
            { "The Hinterlands", "The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west." }),
        guide("alliance-50-searinggorge", "50_SearingGorge.lua", { 51 }, { IF }, 48, 48, 44,
            { "Searing Gorge", "Searing Gorge is south of Loch Modan, through the Badlands." }),
        guide("alliance-50-blastedlands", "50_BlastedLands.lua", { 4 }, { IF, SW }, 48, 49, 45,
            { "Blasted Lands", "Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base." }),
        guide("alliance-51-ungoro", "51_UnGoro.lua", { 490 }, nil, 49, 51, 46,
            { "Un'Goro Crater", "Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan." }),
        guide("alliance-53-azshara", "53_Azshara.lua", { 16 }, nil, 51, 51, 46,
            { "Azshara", "Azshara is east of Ashenvale." }),
        guide("alliance-54-felwood", "54_Felwood.lua", { 361 }, { DN }, 51, 54, 47,
            { "Felwood", "Felwood is north of Ashenvale: the Alliance base is in the south of the zone." }),
        guide("alliance-55-burningsteppes", "55_BurningSteppes.lua", { 46 }, { IF, SW }, 54, 54, 48,
            { "Burning Steppes", "The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone." }),
        guide("alliance-56-winterspring", "56_Winterspring.lua", { 618 }, { DN }, 54, 54, 50,
            { "Winterspring", "Winterspring is northeast of Felwood: Everlook is your base." }),
        guide("alliance-57-wpl", "57_WesternPlaguelands.lua", { 28 }, { IF, SW }, 54, 55, 51,
            { "Western Plaguelands", "The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone." }),
        guide("alliance-58-epl", "58_EasternPlaguelands.lua", { 139 }, nil, 55, 56, 52,
            { "Eastern Plaguelands", "The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east." }),
        guide("alliance-59-silithus", "59_Silithus.lua", { 1377 }, nil, 56, 60, 53,
            { "Silithus", "Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone." }),
    },
}
