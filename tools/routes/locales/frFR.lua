-- French guide texts: [English text] = French text, one entry per phrase of the guides
-- (zone names of the titles, route intros, automatic notes, hand-written notes). tools/translate_guides.lua
-- writes Ding/Locales/Guides/frFR/ from it; a note joining several phrases is translated
-- phrase by phrase. Keys: the English texts of the routes (tools/routes/*.lua), the
-- automatic notes of tools/draft_guide.lua and Ding/Guides/NightElf/01_Shadowglen.lua.
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "Sombrevallée",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "Les deux donneurs sont juste devant toi, au pied d'Aldrassil.",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "Jeunes félins et sangliers tout autour d'Aldrassil : tue tout ce que tu croises.",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "Tarindrella se tient un peu au sud-ouest d'Aldrassil (57.8, 45.2).",
    ["The class trainers are inside Aldrassil."] =
        "Les maîtres de classe sont dans Aldrassil.",
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "Il faut être niveau 3 pour Gilshalan : sinon, Ding! te la rappellera avant la grotte.",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "Une seule boucle : félins galeux et sangliers au nord, mousse sur les grells, totems à l'ouest (54, 40).",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "Iverron attend devant la grotte, au nord (54.6, 33).",
    ["Spiders in the cave, right behind Iverron."] =
        "Araignées dans la grotte, juste derrière Iverron.",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "Githyiss la Vile, au fond de la grotte (56.6, 26.3), peut laisser un croc : utilise-le depuis ton sac.",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "Retour à Aldrassil : tout se rend au même endroit.",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "Champignons sur les grells, lys au nord d'Aldrassil (57, 37), ichor sur les araignées, œuf au fond de la grotte.",
    ["Iverron, still in front of the cave."] =
        "Iverron, toujours devant la grotte.",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "Tenaron est tout en haut d'Aldrassil : suis la rampe qui monte autour du tronc.",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "Remplis la fiole au puits de lune, au nord-est (60, 33).",
    ["Porthannius, on the road out of Shadowglen."] =
        "Porthannius, sur la route qui quitte Sombrevallée.",
    ["Head for Dolanaar"] =
        "Direction Dolanaar",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "Suis la route vers le sud jusqu'à l'auberge : les deux quêtes en cours se rendent à Dolanaar.",
    -- human
    ["Northshire"] =
        "Comté du Nord",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "Tout se passe autour de l'abbaye de Comté du Nord : suis la flèche de PNJ en PNJ.",
    ["Elwynn Forest"] =
        "Forêt d'Elwynn",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "Comté-de-l'Or est ta base pour toute la forêt : auberge, maîtres de classe et quêtes.",
    ["Westfall"] =
        "Marche de l'Ouest",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "Direction l'ouest par la route de Comté-de-l'Or, puis la colline des Sentinelles au centre de la Marche.",
    ["Loch Modan"] =
        "Loch Modan",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "Prends le tram des profondeurs à Hurlevent jusqu'à Forgefer, puis la route de l'est par Dun Morogh jusqu'à Thelsamar.",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "Vallée de Frigrecif",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "Tout commence à Frigrecif : suis la flèche de PNJ en PNJ.",
    ["Dun Morogh"] =
        "Dun Morogh",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "Sors de la vallée par le tunnel au nord-est : Kharanos est ta base pour Dun Morogh.",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "Prends la route de l'est par le tunnel de la porte Sud jusqu'à Thelsamar.",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "Tram des profondeurs de Forgefer à Hurlevent, puis la route de l'ouest par Comté-de-l'Or jusqu'à la colline des Sentinelles.",
    -- nightelf
    ["Teldrassil"] =
        "Teldrassil",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "Dolanaar est ta base pour Teldrassil : auberge, maîtres de classe et la plupart des quêtes.",
    ["Darkshore"] =
        "Sombrivage",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "Rut'theran (portail au pied de Darnassus), puis le bateau pour Auberdine : c'est ta base sur Sombrivage.",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "Bateau d'Auberdine pour Menethil, puis la route de l'est à travers les Paluns jusqu'à Loch Modan : Thelsamar est ta base.",
    -- alliance
    ["Redridge Mountains"] =
        "Les Carmines",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "Les Carmines sont à l'est de la forêt d'Elwynn : suis la route de l'est jusqu'à Comté-du-Lac. Elfes de la nuit : bateau d'Auberdine pour Menethil, Forgefer, puis le tram pour Hurlevent.",
    ["Duskwood"] =
        "Bois de la Pénombre",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "Le Bois de la Pénombre est au sud d'Elwynn : Sombre-Comté, à l'est du bois, est ta base.",
    ["Wetlands"] =
        "Les Paluns",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "Les Paluns sont au nord de Loch Modan : Menethil, sur la côte ouest, est ta base.",
    ["Ashenvale"] =
        "Orneval",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "Bateau de Menethil pour Auberdine, puis la route du sud jusqu'à Orneval : Astranaar est ta base.",
    ["Stonetalon Mountains"] =
        "Les Serres-Rocheuses",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "Les Serres-Rocheuses sont à l'ouest d'Orneval.",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "Retour à Astranaar pour les quêtes de fin d'Orneval.",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "Retour au Bois de la Pénombre pour la fin de ses quêtes : Sombre-Comté est toujours ta base.",
    ["Hillsbrad Foothills"] =
        "Contreforts de Hautebrande",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "Depuis Menethil, la route du nord passe par le gouffre de Thandol jusqu'aux Contreforts : Austrivage est ta base.",
    ["Thousand Needles"] =
        "Mille pointes",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "Mille pointes se rejoint par Theramore et le sud des Tarides, ou par Féralas ; le camp gobelin de l'est sert de base.",
    ["Desolace"] =
        "Désolace",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "Désolace est au sud des Serres-Rocheuses : la base de l'Alliance est au nord-est de la zone.",
    ["Stranglethorn Vale"] =
        "Strangleronce",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "La vallée de Strangleronce est au sud du Bois de la Pénombre : camp rebelle au nord, Baie-du-Butin au sud.",
    ["Arathi Highlands"] =
        "Hautes-terres d'Arathi",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "Les Hautes-terres d'Arathi sont au nord des Paluns, par le gouffre de Thandol.",
    ["Dustwallow Marsh"] =
        "Marécage d'Âprefange",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "Bateau de Menethil pour Theramore, la base de l'Alliance au bord du marécage.",
    ["Badlands"] =
        "Terres ingrates",
    ["The Badlands are southeast of Loch Modan."] =
        "Les Terres ingrates sont au sud-est de Loch Modan.",
    ["Swamp of Sorrows"] =
        "Marais des Chagrins",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "Le Marais des Chagrins est à l'est du Défilé de Deuillevent, au sud des Carmines.",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "Retour à Strangleronce pour la fin de ses quêtes, depuis Baie-du-Butin.",
    ["Tanaris"] =
        "Tanaris",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "Gadgetzan, au nord de Tanaris, est ta base. Bateau de Baie-du-Butin pour Cabestan, ou vol depuis Theramore.",
    ["Feralas"] =
        "Féralas",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "Le bastion de l'Alliance de Féralas est sur une île à l'ouest de la zone.",
    ["The Hinterlands"] =
        "Les Hinterlands",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "Les Hinterlands sont au nord-est des Contreforts de Hautebrande : le nid des Marteaux-Hardis est à l'ouest.",
    ["Searing Gorge"] =
        "Gorge des Vents brûlants",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "La Gorge des Vents brûlants est au sud de Loch Modan, par les Terres ingrates.",
    ["Blasted Lands"] =
        "Terres foudroyées",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "Vole jusqu'aux Terres foudroyées, au sud du Marais des Chagrins : le fort de l'Alliance, au nord de la zone, est ta base.",
    ["Un'Goro Crater"] =
        "Cratère d'Un'Goro",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "Le cratère d'Un'Goro s'ouvre au sud-ouest de Tanaris : descends la rampe depuis Gadgetzan.",
    ["Azshara"] =
        "Azshara",
    ["Azshara is east of Ashenvale."] =
        "Azshara est à l'est d'Orneval.",
    ["Felwood"] =
        "Gangrebois",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "Gangrebois est au nord d'Orneval : la base de l'Alliance est au sud de la zone.",
    ["Burning Steppes"] =
        "Steppes ardentes",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "Les Steppes ardentes sont au nord des Carmines : le camp de l'Alliance est à l'est de la zone.",
    ["Winterspring"] =
        "Berceau-de-l'Hiver",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "Berceau-de-l'Hiver est au nord-est de Gangrebois : Long-guet est ta base.",
    ["Western Plaguelands"] =
        "Maleterres de l'Ouest",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "Les Maleterres de l'Ouest sont au nord des Contreforts de Hautebrande : le camp de l'Alliance est au sud de la zone.",
    ["Eastern Plaguelands"] =
        "Maleterres de l'Est",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "Les Maleterres de l'Est prolongent celles de l'Ouest vers l'est : la chapelle de l'Espoir de Lumière est à l'est.",
    ["Silithus"] =
        "Silithus",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "Silithus est au sud du cratère d'Un'Goro : le fort Cénarien est au nord de la zone.",
    -- orc_troll
    ["Valley of Trials"] =
        "Vallée des Épreuves",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "Tout se passe dans la vallée des Épreuves : suis la flèche de PNJ en PNJ.",
    ["Durotar"] =
        "Durotar",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "Sors de la vallée par la route de l'est, puis remonte au nord jusqu'à Tranchecolline : c'est ta base pour Durotar.",
    ["The Barrens"] =
        "Les Tarides",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "Passe le pont à l'ouest de Tranchecolline pour entrer dans les Tarides, puis suis la route jusqu'à la Croisée : c'est ta base.",
    -- tauren
    ["Camp Narache"] =
        "Camp Narache",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "Tout commence au camp Narache : suis la flèche de PNJ en PNJ.",
    ["Mulgore"] =
        "Mulgore",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "Suis la route du nord depuis le camp Narache jusqu'au village de Sabot-de-Sang : c'est ta base pour Mulgore.",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "Quitte Mulgore par la route de l'est pour entrer dans les Tarides, puis remonte au nord jusqu'à la Croisée : c'est ta base.",
    -- undead
    ["Deathknell"] =
        "Le Glas",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "Tout commence au Glas : suis la flèche de PNJ en PNJ.",
    ["Tirisfal Glades"] =
        "Clairières de Tirisfal",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "Quitte le Glas par la route de l'est jusqu'à Brill : c'est ta base pour les clairières de Tirisfal.",
    ["Silverpine Forest"] =
        "Forêt des Pins-Argentés",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "Depuis Brill, prends la route de l'ouest puis du sud, par le pont, jusqu'à la forêt des Pins-Argentés : le Sépulcre est ta base.",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "Zeppelin des tours près de Fossoyeuse pour Orgrimmar, puis la route de l'ouest et du sud jusqu'à la Croisée : c'est ta base pour les Tarides.",
    -- horde
    ["The Barrens and Stonetalon"] =
        "Les Tarides et les Serres-Rocheuses",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "La Croisée, au centre des Tarides, est ta base ; les Serres-Rocheuses sont à l'ouest des Tarides.",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "Orneval est au nord des Tarides : le poste de Bois-Brisé, à l'est de la forêt, est ta base.",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "Zeppelin de la tour près d'Orgrimmar pour Fossoyeuse, puis la route du sud par la forêt des Pins-Argentés jusqu'à Moulin-de-Tarren : c'est ta base.",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "Zeppelin de retour pour Orgrimmar, pour les quêtes plus hautes des Tarides et des Serres-Rocheuses.",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "Mille pointes est au sud des Tarides, en bas du Grand ascenseur : le poste de Librevent est ta base.",
    ["Hillsbrad, Alterac and Arathi"] =
        "Hautebrande, Alterac et Arathi",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "Zeppelin pour Fossoyeuse, puis de nouveau Moulin-de-Tarren ; les montagnes d'Alterac sont au nord des Contreforts, les Hautes-terres d'Arathi à l'est, avec Trépas-d'Orgrim à l'est des hautes-terres.",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "Désolace est au sud des Serres-Rocheuses : le village de la Horde est sur la côte ouest.",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "Zeppelin d'Orgrimmar pour Grom'gol, le camp de la Horde au nord de Strangleronce.",
    ["Dustwallow and Thousand Needles"] =
        "Âprefange et Mille pointes",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "Zeppelin de retour pour Orgrimmar. Le marécage d'Âprefange est à l'est du sud des Tarides, avec le village de Mur-de-Fougères au nord du marécage ; les Salines sont à l'est de Mille pointes.",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "Retour aux Hautes-terres d'Arathi : Trépas-d'Orgrim est à l'est de la zone.",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "Vol de Trépas-d'Orgrim pour Kargath, à l'ouest des Terres ingrates.",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "Retour à Strangleronce pour la fin de ses quêtes, depuis Grom'gol et Baie-du-Butin.",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "Le Marais des Chagrins est à l'est du défilé de Deuillevent : Pierrêche est ta base.",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "Féralas est à l'ouest de Mille pointes : le camp Mojache, à l'est de la zone, est ta base.",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "Gadgetzan, au nord de Tanaris, est ta base : la route du sud par Mille pointes, ou le bateau de Baie-du-Butin pour Cabestan.",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "Les Hinterlands sont à l'est des Contreforts de Hautebrande : le village troll de Vengebroche est sur la côte est.",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "La Gorge des Vents brûlants est au sud des Terres ingrates : vol pour Kargath, puis la route du sud. Les Steppes ardentes sont au sud de la gorge.",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "Azshara est à l'est d'Orneval : Valormok, au sud-ouest de la zone, est ta base.",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "Gangrebois est au nord d'Orneval : le poste de la Horde est à l'ouest de la zone.",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "Les Maleterres de l'Ouest sont à l'est des clairières de Tirisfal : le Rempart garde la frontière, à l'est de Brill.",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "Si l'objet de départ est tombé : utilise-le depuis ton sac.",
    ["Human"] =
        "Humain",
    ["Dwarf and Gnome"] =
        "Nain et gnome",
    ["Night Elf"] =
        "Elfe de la nuit",
    ["Orc and Troll"] =
        "Orc et troll",
    ["Tauren"] =
        "Tauren",
    ["Undead"] =
        "Mort-vivant",
    ["Alliance"] =
        "Alliance",
    ["Horde"] =
        "Horde",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "À partir d'ici, le guide passe d'une zone à l'autre tout seul : la première étape dans une zone dit comment y aller.",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "Raccourci : laisse les monstres te tuer, libère ton esprit et reviens à la vie auprès du gardien des âmes, puis continue.",
    ["Finish the level on nearby monsters before moving on."] =
        "Finis le niveau sur les monstres du coin avant la suite.",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "Départ humain",
    ["Night Elf start"] =
        "Départ elfe de la nuit",
    ["Tauren start"] =
        "Départ tauren",
    ["Undead start"] =
        "Départ mort-vivant",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Départ skyborne",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "Tout commence sur l'île de Zephras : suis la flèche de PNJ en PNJ.",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "Forêt d'Elwynn : l'abbaye de Comté du Nord, où commencent tous les humains.",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "Dun Morogh : la vallée de Frigrecif, où commencent les nains et les gnomes.",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "Teldrassil : Sombrevallée, où commencent les elfes de la nuit.",
    ["Travel to Westfall"] =
        "Rejoins la Marche de l'Ouest",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "Marche de l'Ouest : la colline des Sentinelles est ta base, au centre de la zone. Premier arrêt : la ferme au nord.",
    ["Travel to Auberdine"] =
        "Rejoins Auberdine",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "Sombrivage : Auberdine, le port de la côte ouest.",
    ["Travel to Thelsamar"] =
        "Rejoins Thelsamar",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "Loch Modan : Thelsamar, sur la route, à l'ouest de la zone.",
    ["Travel to Redridge Mountains"] =
        "Rejoins les Carmines",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "Les Carmines : Comté-du-Lac est ta base, au bord du lac. Premier arrêt : le col de l'ouest, qui vient de la forêt d'Elwynn.",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "Orneval : le poste de Maestra à l'ouest, puis Astranaar au centre de la zone.",
    ["Travel to Menethil Harbor"] =
        "Rejoins le port de Menethil",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "Les Paluns : le port de Menethil, sur la côte ouest.",
    ["Travel to Darkshire"] =
        "Rejoins Sombre-Comté",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "Bois de la Pénombre : Sombre-Comté, à l'est de la zone.",
    ["Travel to Stonetalon Peak"] =
        "Rejoins le pic des Serres-Rocheuses",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "Les Serres-Rocheuses : le pic des Serres-Rocheuses, tout au nord de la zone.",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "Hurlevent d'abord, puis le Bois de la Pénombre et la vallée de Strangleronce.",
    ["Travel to Southshore"] =
        "Rejoins Austrivage",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "Contreforts de Hautebrande : Austrivage, sur la côte au sud.",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "Marécage d'Âprefange : l'île de Theramore, au large de la côte est.",
    ["Travel to Booty Bay"] =
        "Rejoins Baie-du-Butin",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "Vallée de Strangleronce : Baie-du-Butin, à la pointe sud. Le bateau de Cabestan y accoste.",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "Désolace : la combe de Nijel, dans le coin nord-est, est la base de l'Alliance.",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "Vallée de Strangleronce : Baie-du-Butin, à la pointe sud.",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "Hurlevent d'abord, puis le Marais des Chagrins.",
    ["Travel to Refuge Pointe"] =
        "Rejoins le Refuge de l'Ornière",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "Hautes-terres d'Arathi : le Refuge de l'Ornière, au centre de la zone.",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "Hurlevent d'abord, puis le marécage d'Âprefange : l'île de Theramore.",
    ["Travel to Nijel's Point"] =
        "Rejoins la combe de Nijel",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "Désolace : la combe de Nijel, dans le coin nord-est.",
    ["Ironforge first, then the Badlands."] =
        "Forgefer d'abord, puis les Terres ingrates.",
    ["Travel to Stormwind"] =
        "Rejoins Hurlevent",
    ["Stormwind first, then Stranglethorn Vale."] =
        "Hurlevent d'abord, puis la vallée de Strangleronce.",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "Bois de la Pénombre : Sombre-Comté d'abord, puis le Marais des Chagrins.",
    ["Travel to Gadgetzan"] =
        "Rejoins Gadgetzan",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "Tanaris : Gadgetzan, au nord de la zone.",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "Tanaris : Gadgetzan d'abord, puis Féralas : le bastion de Pennelune.",
    ["Travel to Aerie Peak"] =
        "Rejoins le Nid-de-l'Aigle",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "Les Hinterlands : le Nid-de-l'Aigle, à l'ouest de la zone.",
    ["Travel to Un'Goro Crater"] =
        "Rejoins le cratère d'Un'Goro",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "Cratère d'Un'Goro : le Refuge de Marshal est ta base, au nord. Premier arrêt : au sud-est.",
    ["Travel to Thorium Point"] =
        "Rejoins la Halte du Thorium",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "Gorge des Vents brûlants : la Halte du Thorium, au nord-ouest de la zone.",
    ["Travel to Nethergarde Keep"] =
        "Rejoins le Rempart-du-Néant",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "Terres foudroyées : le Rempart-du-Néant, au nord-est, puis les Steppes ardentes.",
    ["Travel to Chillwind Camp"] =
        "Rejoins le camp du Noroît",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "Maleterres de l'Ouest : le camp du Noroît, au sud de la zone.",
    ["Travel to Rut'theran Village"] =
        "Rejoins le village de Rut'theran",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "Teldrassil : le village de Rut'theran d'abord, puis Azshara et Gangrebois.",
    ["Travel to Feathermoon Stronghold"] =
        "Rejoins le bastion de Pennelune",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "Féralas : le bastion de Pennelune, sur l'île au large de la côte ouest.",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "Tanaris : Gadgetzan d'abord, puis le cratère d'Un'Goro.",
    ["Travel to Emerald Sanctuary"] =
        "Rejoins le Sanctuaire d'émeraude",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "Gangrebois : le Sanctuaire d'émeraude, au sud de la zone.",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "Forgefer d'abord, puis les Steppes ardentes : la Veille de Morgan, à l'est.",
    ["Travel to Ironforge"] =
        "Rejoins Forgefer",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "Forgefer d'abord, puis les Maleterres : le camp du Noroît et la chapelle de l'Espoir de Lumière.",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "Berceau-de-l'Hiver : Long-guet, au centre de la zone.",
    ["Travel to Silithus"] =
        "Rejoins Silithus",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "Silithus : le Repos des Vaillants, au nord-est, puis le fort Cénarien.",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "Clairières de Tirisfal : le Glas, où se relèvent les morts-vivants.",
    ["Mulgore: Camp Narache, where tauren start."] =
        "Mulgore : le camp Narache, où commencent les taurens.",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "Durotar : la vallée des Épreuves, où commencent les orcs et les trolls.",
    ["Travel to Silverpine Forest"] =
        "Rejoins la forêt des Pins-Argentés",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "Forêt des Pins-Argentés : le Sépulcre est ta base, au centre. Premier arrêt : sur la route, au nord.",
    ["Travel to Razor Hill"] =
        "Rejoins Tranchecolline",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "Durotar : Tranchecolline d'abord, puis les Tarides : la Croisée, et les Serres-Rocheuses.",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "Orneval : le poste de Bois-Brisé, à l'est de la zone. On y entre par le tunnel des Serres-Rocheuses.",
    ["Travel to the Undercity"] =
        "Rejoins Fossoyeuse",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "Fossoyeuse d'abord, puis les Contreforts de Hautebrande : Moulin-de-Tarren.",
    ["Thunder Bluff first, then the Barrens."] =
        "Les Pitons-du-Tonnerre d'abord, puis les Tarides.",
    ["Travel to Sun Rock Retreat"] =
        "Rejoins la retraite de Roche-Soleil",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "Les Serres-Rocheuses : la retraite de Roche-Soleil, au centre de la zone.",
    ["Travel to the Crossroads"] =
        "Rejoins la Croisée",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "Les Tarides : la Croisée d'abord, puis Orneval : le poste de Bois-Brisé.",
    ["Travel to Camp Taurajo"] =
        "Rejoins le camp Taurajo",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "Les Tarides : le camp Taurajo d'abord, puis Mille pointes : le poste de Librevent.",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "Hautes-terres d'Arathi : Trépas-d'Orgrim, à l'est de la zone.",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "Mille pointes : le poste de Librevent, sur les mesas au centre de la zone.",
    ["Travel to Desolace"] =
        "Rejoins Désolace",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "Désolace : le poste de Rôdeur-fantôme est ta base, au centre de la zone.",
    ["Travel to Grom'gol Base Camp"] =
        "Rejoins le campement Grom'gol",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "Vallée de Strangleronce : le campement Grom'gol, sur la côte ouest. Le zeppelin d'Orgrimmar s'y pose.",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "Orgrimmar d'abord, puis le marécage d'Âprefange : le village de Mur-de-Fougères.",
    ["Travel to Tarren Mill"] =
        "Rejoins Moulin-de-Tarren",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "Contreforts de Hautebrande : Moulin-de-Tarren d'abord, puis les montagnes d'Alterac et les Hautes-terres d'Arathi.",
    ["Travel to the Badlands"] =
        "Rejoins les Terres ingrates",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "Terres ingrates : Kargath, à la bordure ouest, est la base de la Horde.",
    ["Travel to Ratchet"] =
        "Rejoins Cabestan",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "Les Tarides : Cabestan d'abord, puis la vallée de Strangleronce et le Marais des Chagrins : Pierrêche.",
    ["Travel to Shadowprey Village"] =
        "Rejoins le village de Proie-de-l'Ombre",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "Désolace : le village de Proie-de-l'Ombre, sur la côte ouest.",
    ["Travel to Brackenwall Village"] =
        "Rejoins le village de Mur-de-Fougères",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "Marécage d'Âprefange : le village de Mur-de-Fougères, au nord-ouest de la zone.",
    ["Travel to Camp Mojache"] =
        "Rejoins le camp Mojache",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "Féralas : le camp Mojache, à l'est de la zone.",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "Vallée de Strangleronce : le campement Grom'gol, sur la côte ouest.",
    ["Travel to the Swamp of Sorrows"] =
        "Rejoins le Marais des Chagrins",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "Marais des Chagrins : Pierrêche est ta base, au centre de la zone.",
    ["Travel to the Shimmering Flats"] =
        "Rejoins les Salines",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "Mille pointes : les Salines d'abord, puis Tanaris et le marécage d'Âprefange.",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "Fossoyeuse d'abord, puis les Hinterlands : le village de Vengebroche.",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "Féralas : le camp Mojache d'abord, puis le cratère d'Un'Goro.",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "Vallée de Strangleronce : Baie-du-Butin d'abord, puis le Marais des Chagrins.",
    ["Travel to the Blasted Lands"] =
        "Rejoins les Terres foudroyées",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "Terres foudroyées : premier arrêt à l'entrée nord, côté Marais des Chagrins.",
    ["Travel to Kargath"] =
        "Rejoins Kargath",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "Terres ingrates : Kargath d'abord, à la bordure ouest, puis la gorge des Vents brûlants.",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "Steppes ardentes : la Corniche des flammes, à l'est. On y entre par le mont Rochenoire.",
    ["Travel to Valormok"] =
        "Rejoins Valormok",
    ["Azshara: Valormok, in the west of the zone."] =
        "Azshara : Valormok, à l'ouest de la zone.",
    ["Travel to Bloodvenom Post"] =
        "Rejoins le poste de la Vénéneuse",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "Gangrebois : le poste de la Vénéneuse, à l'ouest de la zone.",
    ["Undercity first, then the Plaguelands."] =
        "Fossoyeuse d'abord, puis les Maleterres.",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "Ça libère de la place dans tes sacs.",
    ["You receive one further along the route."] =
        "Tu en reçois un plus loin sur le parcours.",
    ["Pick up anything that sells for 10 copper or more."] =
        "Ramasse tout ce qui se vend 10 pièces de cuivre ou plus.",
    ["You'll level faster with this."] =
        "Tu monteras de niveau plus vite avec ça.",
    ["The NPC is outdoors, right beside the structure."] =
        "Le PNJ est dehors, juste à côté du bâtiment.",
    ["Skip the foes and dash into the tent."] =
        "Évite les ennemis et fonce dans la tente.",
    ["Foes cannot strike you from there."] =
        "Les ennemis ne peuvent pas te frapper de là.",
    ["Widen the camera view."] =
        "Élargis le champ de la caméra.",
    ["Recall to your bind point in Northshire Valley"] =
        "Retourne à ton point de foyer, dans la vallée de Comté-du-Nord",
    ["The NPC is indoors."] =
        "Le PNJ est à l'intérieur.",
    ["The NPC is indoors at street level."] =
        "Le PNJ est à l'intérieur, au niveau de la rue.",
    ["The quest giver stands outdoors, not indoors."] =
        "Le donneur de quête est dehors, pas à l'intérieur.",
    ["With the coming hand-ins, this brings you to level 4."] =
        "Avec les prochains rendus, ça te mène au niveau 4.",
    ["The NPC is indoors, on the central storey."] =
        "Le PNJ est à l'intérieur, à l'étage du milieu.",
    ["The objective is underground, in the mine shaft."] =
        "L'objectif est sous terre, dans la galerie de la mine.",
    ["The targets roam the mine and the area around it."] =
        "Les cibles errent dans la mine et autour.",
    ["Exit the mine shaft"] =
        "Sors de la galerie de la mine",
    ["The quest giver stands outdoors at the back of the building."] =
        "Le donneur de quête est dehors, à l'arrière du bâtiment.",
    ["The NPC is out back, at the rear of the structure."] =
        "Le PNJ est derrière, à l'arrière du bâtiment.",
    ["The NPC stands by the horse stalls."] =
        "Le PNJ se tient près des stalles des chevaux.",
    ["Look for wooden pails."] =
        "Cherche des seaux en bois.",
    ["Leave it out if other players crowd the area."] =
        "Laisse tomber si d'autres joueurs encombrent le coin.",
    ["With the coming hand-ins, this gets you to level 6."] =
        "Avec les prochains rendus, ça te mène au niveau 6.",
    ["Climb to the highest floor of the building."] =
        "Monte au dernier étage du bâtiment.",
    ["The NPC waits on the lower level, indoors."] =
        "Le PNJ attend au niveau inférieur, à l'intérieur.",
    ["The NPC is indoors, one floor up."] =
        "Le PNJ est à l'intérieur, un étage plus haut.",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "Soigne le garde Roberts avec Soins inférieurs (Rang 2).",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "Donne Mot de pouvoir : Robustesse au garde Roberts.",
    ["Do it only if you can."] =
        "Fais-le seulement si tu peux.",
    ["Go into the mine"] =
        "Entre dans la mine",
    ["Stay on the trail through the mine"] =
        "Suis le chemin à travers la mine",
    ["This one roams, so scan the surrounding area."] =
        "Celui-ci se déplace : fouille les environs.",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "Avec les prochains rendus, ça te mène au niveau 8.",
    ["Die on purpose at this spot"] =
        "Meurs exprès à cet endroit",
    ["Die to the monsters here on purpose."] =
        "Laisse-toi tuer exprès par les monstres d'ici.",
    ["Dying costs you nothing this early."] =
        "Mourir ne te coûte rien à ce stade.",
    ["This is the quickest way over."] =
        "C'est le chemin le plus rapide.",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "Fais-toi tuer, puis ressuscite auprès du gardien des âmes",
    ["Look for little stacks of brown wood."] =
        "Cherche de petites piles de bois brun.",
    ["Look around tree trunks at ground level."] =
        "Regarde au pied des troncs d'arbres.",
    ["The targets are wolves."] =
        "Les cibles sont des loups.",
    ["The following step may be hard."] =
        "L'étape suivante peut être difficile.",
    ["One extra level makes it easier."] =
        "Un niveau de plus la rend plus facile.",
    ["With the coming turn-ins, this gets you to level 10."] =
        "Avec les prochains rendus, ça te mène au niveau 10.",
    ["The NPC waits outside, at the building's front."] =
        "Le PNJ attend dehors, devant le bâtiment.",
    ["Fly to Lakeshire"] =
        "Vole jusqu'à Comté-du-Lac",
    ["Stay on the road and watch for danger."] =
        "Reste sur la route et fais attention au danger.",
    ["Foes in this area outlevel you."] =
        "Les ennemis du coin ont un niveau supérieur au tien.",
    ["Let the conversation play out."] =
        "Laisse la conversation se dérouler.",
    ["Your targets here are gnolls."] =
        "Ici, tes cibles sont des gnolls.",
    ["Fly to Sentinel Hill"] =
        "Vole jusqu'à la colline des Sentinelles",
    ["Fly to Stormwind City"] =
        "Vole jusqu'à Hurlevent",
    ["Head indoors"] =
        "Va à l'intérieur",
    ["Step onto the pink rune."] =
        "Monte sur la rune rose.",
    ["Look within the tomb."] =
        "Regarde dans la tombe.",
    ["The NPC stands one level over the crypt."] =
        "Le PNJ se tient un niveau au-dessus de la crypte.",
    ["Be ready for a fight right away."] =
        "Prépare-toi à combattre tout de suite.",
    ["The NPC waits indoors, a floor above the entrance."] =
        "Le PNJ attend à l'intérieur, un étage au-dessus de l'entrée.",
    ["Head down into the Deeprun Tram station"] =
        "Descends dans la station du tram des profondeurs",
    ["Pass through the portal to teleport."] =
        "Passe le portail pour te téléporter.",
    ["Take the Deeprun Tram over to Ironforge."] =
        "Prends le tram des profondeurs jusqu'à Forgefer.",
    ["The NPC stands by the wall on the central platform."] =
        "Le PNJ se tient contre le mur, sur le quai central.",
    ["Target the Deeprun Rats with the item."] =
        "Utilise l'objet sur les Deeprun Rats.",
    ["Look for little gray rodents."] =
        "Cherche de petits rongeurs gris.",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "Va au quai côté Forgefer du tram des profondeurs.",
    ["Fly to Ironforge"] =
        "Vole jusqu'à Forgefer",
    ["Stay on the trail"] =
        "Suis le chemin",
    ["Steer clear of the elite yeti patrolling close by."] =
        "Évite le yéti élite qui patrouille tout près.",
    ["The NPC is up on the summit."] =
        "Le PNJ est en haut, au sommet.",
    ["Let the elite yeti stroll off before you go near."] =
        "Laisse le yéti élite s'éloigner avant d'approcher.",
    ["Your objective lies in a little cavern."] =
        "Ton objectif est dans une petite grotte.",
    ["Go quickly, time is short."] =
        "Fais vite, le temps est compté.",
    ["Go into the cavern"] =
        "Entre dans la grotte",
    ["Head to the lower level of the cavern."] =
        "Va au niveau inférieur de la grotte.",
    ["Targets are in the cavern and around its entrance too."] =
        "Les cibles sont dans la grotte et aussi autour de l'entrée.",
    ["Head out of the cave"] =
        "Sors de la grotte",
    ["Climb the trail"] =
        "Monte le chemin",
    ["Once in the Wetlands, head north."] =
        "Une fois dans les Paluns, va vers le nord.",
    ["Leap down from the ledge."] =
        "Saute du rebord.",
    ["This makes Menethil Harbor quicker to get to."] =
        "Ça rend le port de Menethil plus rapide à rejoindre.",
    ["Keep climbing the trail"] =
        "Continue de monter le chemin",
    ["Take the trail downhill"] =
        "Descends le chemin",
    ["Fly to Menethil Harbor"] =
        "Vole jusqu'au port de Menethil",
    ["Your targets are within the cavern."] =
        "Tes cibles sont dans la grotte.",
    ["Without this, one quest can't be picked up."] =
        "Sans ça, une quête ne peut pas être prise.",
    ["The NPC is past the tunnel; stay on the road."] =
        "Le PNJ est après le tunnel : reste sur la route.",
    ["The target is a pale bear."] =
        "La cible est un ours pâle.",
    ["Cross the tunnel to reach the NPC."] =
        "Traverse le tunnel pour rejoindre le PNJ.",
    ["Fly to Thelsamar"] =
        "Vole jusqu'à Thelsamar",
    ["The NPC patrols a long route; look along it."] =
        "Le PNJ patrouille sur un long trajet : cherche-le tout du long.",
    ["The targets are rat-like humanoids."] =
        "Les cibles sont des humanoïdes qui ressemblent à des rats.",
    ["Hunt spiders for it."] =
        "Chasse des araignées pour l'obtenir.",
    ["Take the road to where the trail starts"] =
        "Suis la route jusqu'au début du chemin",
    ["A class quest coming up requires this."] =
        "Une prochaine quête de classe en a besoin.",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "Quitte Stonesplinter Valley, puis reste sur la route",
    ["The NPC waits on the tower's highest floor."] =
        "Le PNJ attend au dernier étage de la tour.",
    ["Head up the incline"] =
        "Monte la pente",
    ["Dwarf and Gnome start"] =
        "Départ nain et gnome",
    ["Step back outside"] =
        "Ressors dehors",
    ["They are rare and scattered widely."] =
        "Ils sont rares et très dispersés.",
    ["Pass through the tunnel, then stay on the road"] =
        "Traverse le tunnel, puis reste sur la route",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "Soigne le montagnard Dolf avec Soins inférieurs (Rang 2).",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "Donne Mot de pouvoir : Robustesse au montagnard Dolf.",
    ["The quest wants yetis; seek them out."] =
        "La quête demande des yétis : va les chercher.",
    ["Look for the timber baskets."] =
        "Cherche les paniers en bois.",
    ["Any spot around Brewnall Village works."] =
        "N'importe quel endroit autour de Brewnall Village convient.",
    ["Give it a few seconds."] =
        "Attends quelques secondes.",
    ["Target one Large Crag Boar with it."] =
        "Utilise-le sur un Large Crag Boar.",
    ["Use it on any Snow Leopard."] =
        "Utilise-le sur n'importe quel léopard des neiges.",
    ["Target any Ice Claw Bear with the item."] =
        "Utilise l'objet sur n'importe quel Ice Claw Bear.",
    ["Keep it as pet food for later."] =
        "Garde-le comme nourriture pour ton familier.",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "Trouve un Ice Claw Bear et lance Apprivoiser une bête dessus.",
    ["Push eastward if you still need more."] =
        "Pousse vers l'est s'il t'en faut encore.",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "Garde-le : une prochaine quête de paladin s'en sert.",
    ["Keep to the road as it crosses the underground passages."] =
        "Reste sur la route qui traverse les passages souterrains.",
    ["The NPC can be indoors or out."] =
        "Le PNJ peut être dedans ou dehors.",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "Prends le tram des profondeurs jusqu'à Hurlevent.",
    ["Flight master in Stormwind"] =
        "Maître de vol de Hurlevent",
    ["The NPC roams a wide loop; look along it."] =
        "Le PNJ fait une grande boucle : cherche-le tout du long.",
    ["You likely gathered 10 Linen Cloth already."] =
        "Tu as sans doute déjà 10 étoffes de lin.",
    ["Narm Faulk lies dead; use the item on his body."] =
        "Narm Faulk est mort : utilise l'objet sur son corps.",
    ["Wait for the talking to finish"] =
        "Attends la fin de la discussion",
    ["Climb the big ramp"] =
        "Monte la grande rampe",
    ["The NPC stands high in the great tree."] =
        "Le PNJ se tient en haut du grand arbre.",
    ["The NPC stands in an adjoining chamber."] =
        "Le PNJ se tient dans une salle voisine.",
    ["The targets are imps."] =
        "Les cibles sont des diablotins.",
    ["Look for groups of pink fungi."] =
        "Cherche des groupes de champignons roses.",
    ["Mostly found beside tree trunks."] =
        "Surtout à côté des troncs d'arbres.",
    ["Look for big orange blossoms."] =
        "Cherche de grosses fleurs orange.",
    ["Climb to the cave's upper level."] =
        "Monte au niveau supérieur de la grotte.",
    ["The NPC stands at the summit of the great tree."] =
        "Le PNJ se tient au sommet du grand arbre.",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "Soigne la sentinelle Shaya avec Soins inférieurs (Rang 2).",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "Donne Mot de pouvoir : Robustesse à la sentinelle Shaya.",
    ["Pick up 5 Earthroot while questing."] =
        "Ramasse 5 Terrestrines pendant tes quêtes.",
    ["A class quest further on requires this."] =
        "Une quête de classe plus loin en a besoin.",
    ["Look for brown clumps of roots."] =
        "Cherche des touffes de racines brunes.",
    ["Kill black-furred tigers."] =
        "Tue des tigres au pelage noir.",
    ["The targets are spiders with green bodies."] =
        "Les cibles sont des araignées au corps vert.",
    ["Look for little brown pinecones giving off green smoke."] =
        "Cherche de petites pommes de pin brunes qui dégagent une fumée verte.",
    ["The target is a satyr."] =
        "La cible est un satyre.",
    ["The targets are spread over several spots."] =
        "Les cibles sont réparties sur plusieurs endroits.",
    ["With the coming hand-ins, this gets you to level 9."] =
        "Avec les prochains rendus, ça te mène au niveau 9.",
    ["At this spot or a bit to the east."] =
        "À cet endroit ou un peu plus à l'est.",
    ["The NPC patrols the road; look along it."] =
        "Le PNJ patrouille sur la route : cherche-le tout du long.",
    ["For this quest you guard an NPC on the move."] =
        "Dans cette quête, tu protèges un PNJ qui se déplace.",
    ["If she is absent, wait for her to reappear."] =
        "Si elle n'est pas là, attends qu'elle réapparaisse.",
    ["Move fast: the clock is ticking on this one."] =
        "Fais vite : cette quête est chronométrée.",
    ["Kill harpies."] =
        "Tue des harpies.",
    ["Step into the cavern within the trunk"] =
        "Entre dans la cavité du tronc",
    ["The spot is on the lower floor of the hollow tree."] =
        "L'endroit est au niveau inférieur de l'arbre creux.",
    ["Don't forget to train Pick Pocket."] =
        "N'oublie pas d'apprendre Vol à la tire.",
    ["Keep it; an upcoming task asks for it."] =
        "Garde-le : une prochaine quête le demande.",
    ["Fly to Moonglade"] =
        "Vole jusqu'à Reflet-de-Lune",
    ["Target a Webwood Lurker with it."] =
        "Utilise-le sur un Webwood Lurker.",
    ["Aim the item at any Nightsaber Stalker."] =
        "Utilise l'objet sur n'importe quel Nightsaber Stalker.",
    ["The beasts are leopards with blue fur."] =
        "Les bêtes sont des léopards au pelage bleu.",
    ["Aim the item at one Strigid Screecher."] =
        "Utilise l'objet sur un Strigid Screecher.",
    ["Target the owls here."] =
        "Cible les chouettes d'ici.",
    ["You need to stand close to this spot."] =
        "Tu dois te tenir près de cet endroit.",
    ["Go into the hollow tree's cavern"] =
        "Entre dans la cavité de l'arbre creux",
    ["The target is a big gray spider."] =
        "La cible est une grosse araignée grise.",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "Cible Sethir l'Ancien et utilise Vol à la tire.",
    ["The target is a violet satyr."] =
        "La cible est un satyre violet.",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "Le PNJ attend ici, puis s'avance sur la grosse branche toute proche.",
    ["Fight the elementals of the swamp."] =
        "Combats les élémentaires du marais.",
    ["Use Herbalism's Track Herbs to spot them."] =
        "Utilise Découverte d'herbes (Herboristerie) pour les repérer.",
    ["Pick these up while questing around Teldrassil."] =
        "Ramasse-les pendant tes quêtes à Teldrassil.",
    ["Get your Herbalism skill to 15."] =
        "Monte ton Herboristerie à 15.",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "Avec les prochains rendus, ça te mène au niveau 11.",
    ["Circle the mountain, then climb the trail"] =
        "Contourne la montagne, puis monte le chemin",
    ["The NPC stands on the highest level of this structure."] =
        "Le PNJ se tient au plus haut niveau de ce bâtiment.",
    ["Flight master in Auberdine"] =
        "Maître de vol d'Auberdine",
    ["Your pet will need this food shortly."] =
        "Ton familier aura bientôt besoin de cette nourriture.",
    ["Hunt the crabs."] =
        "Chasse les crabes.",
    ["You'll find extra ones swimming nearby as well."] =
        "Tu en trouveras d'autres qui nagent aussi tout près.",
    ["Use the item on any Rabid Thistle Bear."] =
        "Utilise l'objet sur n'importe quel Rabid Thistle Bear.",
    ["The targets are bears with grey fur."] =
        "Les cibles sont des ours au pelage gris.",
    ["Keep from damaging the creature."] =
        "Évite de blesser la créature.",
    ["Your targets sit below the water's surface."] =
        "Tes cibles sont sous la surface de l'eau.",
    ["Avoid slaying the satyrs if you can."] =
        "Évite de tuer les satyres si tu peux.",
    ["You'll need this for the following quest."] =
        "Tu en auras besoin pour la quête suivante.",
    ["Hunt down satyrs."] =
        "Traque des satyres.",
    ["Big birds that roam on foot."] =
        "Grands oiseaux qui se déplacent à pied.",
    ["Make your way to the Gates of Ironforge"] =
        "Rejoins les portes de Forgefer",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "Nage jusqu'à ce point précis, puis, dans le menu du jeu, choisis Assistance et demande à être débloqué.",
    ["Stay outdoors by this building."] =
        "Reste dehors, près de ce bâtiment.",
    ["Pull the camera back for a wider view."] =
        "Recule la caméra pour voir plus large.",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "Tourne la caméra pour voir l'armoire des Furlbrow.",
    ["Look for beige sacks."] =
        "Cherche des sacs beiges.",
    ["Look beside objects and structures."] =
        "Regarde près des objets et des bâtiments.",
    ["Hunt the vultures."] =
        "Chasse les vautours.",
    ["Many of them gather in this area."] =
        "Beaucoup se regroupent dans ce coin.",
    ["The rest lie dotted across the zone."] =
        "Les autres sont dispersés dans la zone.",
    ["Kill boars for these."] =
        "Tue des sangliers pour les obtenir.",
    ["With the coming turn-ins, this gets you to level 15."] =
        "Avec les prochains rendus, ça te mène au niveau 15.",
    ["Flight master at Rut'theran Village"] =
        "Maître de vol du village de Rut'theran",
    ["Leave your pet with the stable master."] =
        "Laisse ton familier au maître des écuries.",
    ["You will tame a short-term pet shortly."] =
        "Tu vas bientôt apprivoiser un familier temporaire.",
    ["Here your pet picks up Claw (Rank 2)."] =
        "Ici, ton familier apprend Griffe (Rang 2).",
    ["You will let it go shortly."] =
        "Tu vas bientôt le relâcher.",
    ["Send your pet against a Thistle Bear."] =
        "Envoie ton familier sur un Thistle Bear.",
    ["Get your companion back from the stable master."] =
        "Récupère ton familier auprès du maître des écuries.",
    ["Release the short-term pet you tamed."] =
        "Relâche le familier temporaire que tu as apprivoisé.",
    ["The NPC stands on the pier."] =
        "Le PNJ se tient sur la jetée.",
    ["The targets are sea creatures with long necks."] =
        "Les cibles sont des créatures marines au long cou.",
    ["Head to the hilltop."] =
        "Va au sommet de la colline.",
    ["Wade in to use it."] =
        "Entre dans l'eau pour l'utiliser.",
    ["The spot is at the foot of the falls."] =
        "L'endroit est au pied des chutes.",
    ["Look for an urn of woven wicker."] =
        "Cherche une urne en osier tressé.",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "La cible est le fantôme non hostile d'une elfe de la nuit.",
    ["Look for a figure in yellow and green garb."] =
        "Cherche un personnage en tenue jaune et verte.",
    ["Go to the lowest deck of the wreck."] =
        "Va au pont inférieur de l'épave.",
    ["Swim in by way of a porthole."] =
        "Entre à la nage par un hublot.",
    ["Search stacks of brown crates."] =
        "Fouille les piles de caisses brunes.",
    ["The NPC stands atop the dam."] =
        "Le PNJ se tient en haut du barrage.",
    ["The object rests by the barrier."] =
        "L'objet est près de la barrière.",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "Avec les prochains rendus, ça te mène au niveau 19.",
    ["This skips some tedious quests with a timer."] =
        "Ça évite des quêtes chronométrées pénibles.",
    ["The upcoming quest may prove hard."] =
        "La prochaine quête peut être difficile.",
    ["The targets are troggs."] =
        "Les cibles sont des troggs.",
    ["Redridge and Westfall"] =
        "Carmines et Marche de l'Ouest",
    ["Look for a big mound of brown earth."] =
        "Cherche un gros tas de terre brune.",
    ["The target patrols a long route by the road."] =
        "La cible patrouille sur un long trajet le long de la route.",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "Son trajet va aussi loin dans Jangolode Mine et Gold Coast Quarry.",
    ["It takes roughly 5 minutes to reappear."] =
        "Réapparaît au bout de 5 minutes environ.",
    ["The target is a murloc, grey and bigger than the others."] =
        "La cible est un murloc gris, plus gros que les autres.",
    ["It roams the shoreline."] =
        "Erre sur le rivage.",
    ["If the NPC is absent, stay until he reappears."] =
        "Si le PNJ n'est pas là, attends qu'il réapparaisse.",
    ["Escort The Defias Traitor and keep him alive."] =
        "Escorte le traître défias et garde-le en vie.",
    ["The NPC is on an upper floor of the tower."] =
        "Le PNJ est à un étage supérieur de la tour.",
    ["Hunt the red-feathered birds."] =
        "Chasse les oiseaux aux plumes rouges.",
    ["The targets are little winged dragons."] =
        "Les cibles sont de petits dragons ailés.",
    ["Skip Redridge Alphas; they don't carry them."] =
        "Ignore les Redridge Alphas : ils n'en ont pas.",
    ["Raise Lockpicking to 95"] =
        "Monte Crochetage à 95",
    ["Look for little gray coffers of metal."] =
        "Cherche de petits coffres en métal gris.",
    ["Go inside and stay on the trail"] =
        "Entre et suis le chemin",
    ["Your target is a ghoul."] =
        "Ta cible est une goule.",
    ["Fight undead foes."] =
        "Combats des morts-vivants.",
    ["The target is the dungeon's second boss."] =
        "La cible est le deuxième boss du donjon.",
    ["The target is the dungeon's last boss."] =
        "La cible est le dernier boss du donjon.",
    ["The objective is aboard the vessel."] =
        "L'objectif est à bord du navire.",
    ["You'll find them all over the instance."] =
        "Tu en trouveras partout dans l'instance.",
    ["The NPC is indoors"] =
        "Le PNJ est à l'intérieur",
    ["Fight the murlocs."] =
        "Combats les murlocs.",
    ["The spot is at the cave's mouth."] =
        "L'endroit est à l'entrée de la grotte.",
    ["Look for the brown fungi."] =
        "Cherche les champignons bruns.",
    ["Extra ones are below, in the side chambers."] =
        "Il y en a d'autres en bas, dans les salles latérales.",
    ["Gather the blue-capped fungi."] =
        "Ramasse les champignons à chapeau bleu.",
    ["Expect a possible ambush while you gather it."] =
        "Attends-toi à une embuscade pendant que tu le ramasses.",
    ["It shows up a short way off."] =
        "Apparaît non loin.",
    ["It shows up at your feet."] =
        "Apparaît à tes pieds.",
    ["Murloc packs arrive at the waterside."] =
        "Des groupes de murlocs arrivent au bord de l'eau.",
    ["The attackers rush the camp."] =
        "Les assaillants se ruent sur le camp.",
    ["Engage foes one at a time."] =
        "Affronte les ennemis un par un.",
    ["Watch out, the landscape conceals some monsters."] =
        "Attention, le décor cache des monstres.",
    ["Avoid drawing several foes together."] =
        "Évite d'attirer plusieurs ennemis à la fois.",
    ["Stay with Prospector Remtravel and defend him."] =
        "Reste avec le prospecteur Remtravel et défends-le.",
    ["He is frail and goes down fast."] =
        "Il est fragile et meurt vite.",
    ["Look on top of the table."] =
        "Regarde sur la table.",
    ["Escort Therylune and defend her."] =
        "Escorte Therylune et défends-la.",
    ["Escort Volcor and defend him."] =
        "Escorte Volcor et défends-le.",
    ["Allow the foes to hit him before you join in."] =
        "Laisse les ennemis le frapper avant d'intervenir.",
    ["If it is not around, move on without it."] =
        "S'il n'est pas là, continue sans.",
    ["It reappears only after a long wait."] =
        "Ne réapparaît qu'après une longue attente.",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "Protège Kerlonian Evershade pendant qu'il te suit.",
    ["Keep near him; he dozes off."] =
        "Reste près de lui : il s'endort.",
    ["The NPC is on the house's raised terrace."] =
        "Le PNJ est sur la terrasse surélevée de la maison.",
    ["Ashenvale and Stonetalon"] =
        "Orneval et Serres-Rocheuses",
    ["The item drops rarely."] =
        "L'objet tombe rarement.",
    ["Look for little gray sheaves of straw."] =
        "Cherche de petites gerbes de paille grises.",
    ["Lower the Ground Clutter option to 1."] =
        "Baisse l'option des détails au sol à 1.",
    ["Find it in the game options, under System, then Graphics."] =
        "Elle se trouve dans les options du jeu, sous Système, puis Graphismes.",
    ["Fly to Astranaar"] =
        "Vole jusqu'à Astranaar",
    ["Keep to the road the whole way."] =
        "Reste sur la route tout du long.",
    ["Pick up Claw (Rank 3) for your pet."] =
        "Fais apprendre Griffe (Rang 3) à ton familier.",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "Apprivoise un Ashenvale Bear avec Apprivoiser une bête.",
    ["Track down a chestnut-furred bear."] =
        "Trouve un ours au pelage châtain.",
    ["Keep to the road until you reach the Barrens"] =
        "Reste sur la route jusqu'aux Tarides",
    ["Keep your distance from the Crossroads."] =
        "Garde tes distances avec la Croisée.",
    ["Flight master in Ratchet"] =
        "Maître de vol de Cabestan",
    ["Look for white spheres."] =
        "Cherche des sphères blanches.",
    ["The target is a gray furbolg."] =
        "La cible est un furbolg gris.",
    ["Shrubs that glitter white."] =
        "Buissons qui scintillent en blanc.",
    ["Exit Ruins of Stardust"] =
        "Quitte les Ruins of Stardust",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "Entre dans Fire Scar Shrine et monte le chemin",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "La cible invoque des protecteurs avec Ilkrud's Guardians.",
    ["Cut off the target's spells when you can."] =
        "Interromps les sorts de la cible quand tu peux.",
    ["Exit Fire Scar Shrine"] =
        "Quitte Fire Scar Shrine",
    ["Circle the mountain on foot."] =
        "Contourne la montagne à pied.",
    ["A yellowish naga; her fins look pinkish."] =
        "Une naga jaunâtre aux nageoires rosées.",
    ["The target is rare and seldom up."] =
        "La cible est rare et rarement présente.",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "La cible est une naga à la peau de jade et aux nageoires roses.",
    ["It circles the island clockwise, close to the shore."] =
        "Fait le tour de l'île dans le sens des aiguilles d'une montre, près du rivage.",
    ["She travels with a pair of guards."] =
        "Elle se déplace avec deux gardes.",
    ["Hunt naga."] =
        "Chasse des nagas.",
    ["Take the passage into Stonetalon Mountains"] =
        "Prends le passage vers les Serres-Rocheuses",
    ["Look for it high on the clifftop."] =
        "Cherche-le tout en haut de la falaise.",
    ["The targets are wyverns."] =
        "Les cibles sont des wyvernes.",
    ["Fly to Stonetalon Peak"] =
        "Vole jusqu'au pic des Serres-Rocheuses",
    ["Watch out and keep away from Tideress."] =
        "Attention, tiens-toi loin de Tideress.",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "Ta proie est une créature d'eau vivante aux reflets verts, niveau 27.",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "C'est dans la partie Pool of Ask'ar du donjon.",
    ["Look on Ghamoo-ra's north side."] =
        "Regarde au nord de Ghamoo-ra.",
    ["Dive down into the submerged cave."] =
        "Plonge dans la grotte immergée.",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "Trouve le PNJ au sud-ouest de Ghamoo-ra.",
    ["It is the dungeon's 4th boss."] =
        "C'est le 4e boss du donjon.",
    ["Kill Fallenroot and Blackfathom foes."] =
        "Tue les ennemis de Fallenroot et de Brassenoire.",
    ["Fly to Talrendis Point"] =
        "Vole jusqu'à Talrendis Point",
    ["This trip is dangerous; move with great caution."] =
        "Ce trajet est dangereux : avance très prudemment.",
    ["Stay on the road and keep away from Horde NPCs."] =
        "Reste sur la route et tiens-toi loin des PNJ de la Horde.",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "Les Warsong Outriders qui chevauchent sur la route restent pacifiques.",
    ["The target is a gray murloc."] =
        "La cible est un murloc gris.",
    ["The target appears at this spot."] =
        "La cible apparaît à cet endroit.",
    ["Go into Whelgar's Excavation Site"] =
        "Entre dans Whelgar's Excavation Site",
    ["Head out of Whelgar's Excavation Site"] =
        "Sors de Whelgar's Excavation Site",
    ["The targets are raptors."] =
        "Les cibles sont des raptors.",
    ["Targets are both in the tomb and around it."] =
        "Les cibles sont dans la tombe et autour.",
    ["The vendor stocks only a few."] =
        "Le marchand n'en a que quelques-uns.",
    ["A quest in Duskwood will require it afterward."] =
        "Une quête du Bois de la Pénombre en aura besoin ensuite.",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "Achète-le maintenant : une quête du Bois de la Pénombre en aura bientôt besoin.",
    ["The spot is in the crypt under the building."] =
        "L'endroit est dans la crypte sous le bâtiment.",
    ["Duskwood and Redridge"] =
        "Bois de la Pénombre et Carmines",
    ["Flight master at Darkshire"] =
        "Maître de vol de Sombre-Comté",
    ["The target is a ghoul with red skin."] =
        "La cible est une goule à la peau rouge.",
    ["The targets are ghouls."] =
        "Les cibles sont des goules.",
    ["Exit the tomb"] =
        "Sors de la tombe",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "Fais les poches d'un Malformed Defias Drone avec Vol à la tire.",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "Utilise Assommer sur Klaven Mortwake, puis ouvre le coffre.",
    ["Opening it puts a harmful effect on you."] =
        "L'ouvrir te donne un effet néfaste.",
    ["Climb the trail across the mountains"] =
        "Monte le chemin à travers les montagnes",
    ["Take the trail that circles the peak"] =
        "Prends le chemin qui contourne le pic",
    ["Defeat each wave of attackers."] =
        "Repousse chaque vague d'assaillants.",
    ["Beware of foes lurking in stealth."] =
        "Attention aux ennemis camouflés.",
    ["Target Doc Mixilpixil, then take a seat."] =
        "Cible Doc Mixilpixil, puis assieds-toi.",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "La cible est un sanglier au cuir d'un brun plus foncé.",
    ["The targets are orcs."] =
        "Les cibles sont des orcs.",
    ["You no longer need these; vendor or discard them."] =
        "Tu n'en as plus besoin : vends-les ou détruis-les.",
    ["The targets are Horrors and Fiends."] =
        "Les cibles sont des horreurs et des démons.",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "N'attaque pas Mor'Ladim, un mort-vivant élite de niveau 35.",
    ["The target wanders near the crypt, outdoors."] =
        "La cible erre près de la crypte, dehors.",
    ["Climb the steps and exit the tomb"] =
        "Monte les marches et sors de la tombe",
    ["The target is a sword-wielding gnoll."] =
        "La cible est un gnoll armé d'une épée.",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "La cible est un gnoll en robe pourpre, armé d'une longue lame.",
    ["Beware: nearby foes join when you attack him."] =
        "Attention : les ennemis proches s'en mêlent quand tu l'attaques.",
    ["Keep to the cave's interior when you can."] =
        "Reste dans la grotte autant que possible.",
    ["The following step takes place in the cave."] =
        "L'étape suivante se passe dans la grotte.",
    ["Keep Corporal Keeshan safe during the escort."] =
        "Protège le caporal Keeshan pendant l'escorte.",
    ["At the cave's mouth, draw foes to him with care."] =
        "À l'entrée de la grotte, attire les ennemis vers lui avec prudence.",
    ["The target is the dungeon's fifth boss."] =
        "La cible est le cinquième boss du donjon.",
    ["Targets are within the wrecked vessel underwater."] =
        "Les cibles sont dans l'épave du navire, sous l'eau.",
    ["The target is a blue raptor."] =
        "La cible est un raptor bleu.",
    ["Look for a big mound of dirt."] =
        "Cherche un gros tas de terre.",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "L'objet peut aussi apparaître sur la corniche en hauteur, près de Sarltooth.",
    ["Look for a big, broad yellow urn."] =
        "Cherche une grande urne jaune et large.",
    ["Look for a big, tall crimson urn."] =
        "Cherche une grande urne pourpre et haute.",
    ["The target is a big stone container."] =
        "La cible est un grand récipient en pierre.",
    ["The target is up on the boat's top deck."] =
        "La cible est en haut, sur le pont supérieur du bateau.",
    ["Climb the incline at the rear."] =
        "Monte la pente à l'arrière.",
    ["Go to the lowest deck of the ship."] =
        "Va au pont inférieur du navire.",
    ["Swim in via the gap at the base."] =
        "Entre à la nage par l'ouverture à la base.",
    ["These foes hide in stealth."] =
        "Ces ennemis sont camouflés.",
    ["Most often found in or beside water."] =
        "Le plus souvent dans l'eau ou au bord.",
    ["Grab every one you spot on the way here."] =
        "Ramasse tous ceux que tu vois en venant ici.",
    ["With the coming hand-ins, this brings you to level 29."] =
        "Avec les prochains rendus, ça te mène au niveau 29.",
    ["Take the door on the bridge, then descend the steps"] =
        "Passe la porte sur le pont, puis descends les marches",
    ["The NPC is on the lower level within the bridge."] =
        "Le PNJ est au niveau inférieur, à l'intérieur du pont.",
    ["Leap from the span and splash down below"] =
        "Saute du pont et plonge dans l'eau en dessous",
    ["Look for a pale, rolled scroll."] =
        "Cherche un parchemin pâle enroulé.",
    ["A dwarf corpse grips it."] =
        "Un cadavre de nain le tient.",
    ["Fly to Refuge Pointe"] =
        "Vole jusqu'au Refuge de l'Ornière",
    ["Flight master at Southshore"] =
        "Maître de vol d'Austrivage",
    ["The targets are turtles."] =
        "Les cibles sont des tortues.",
    ["Head north, keeping to the riverbank."] =
        "Va vers le nord en longeant la rive.",
    ["Flight master at Chillwind Camp"] =
        "Maître de vol du camp du Noroît",
    ["Stonetalon and Ashenvale"] =
        "Serres-Rocheuses et Orneval",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "Suis la route, puis monte le chemin jusqu'à la combe de Nijel",
    ["Fly to Nijel's Point"] =
        "Vole jusqu'à la combe de Nijel",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "La quête est grise, mais les suivantes de la chaîne rapportent beaucoup d'XP.",
    ["Take the road until this trail"] =
        "Suis la route jusqu'à ce chemin",
    ["Keep on the trail"] =
        "Reste sur le chemin",
    ["Fight the treants."] =
        "Combats les tréants.",
    ["Head uphill on the trail and across the passage"] =
        "Monte le chemin et traverse le passage",
    ["Exit the Howling Vale by the tunnel"] =
        "Quitte Howling Vale par le tunnel",
    ["You pick up Claw (Rank 4) here."] =
        "Ici, ton familier apprend Griffe (Rang 4).",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "Apprivoise n'importe quel Elder Ashenvale Bear avec Apprivoiser une bête.",
    ["They show up lying on the ground."] =
        "Ils apparaissent posés au sol.",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "Contourne le pic, puis monte le sentier de terre sinueux jusqu'au sanctuaire",
    ["Circle the mountain, then stay on the trail"] =
        "Contourne la montagne, puis reste sur le chemin",
    ["Stand on the marked point, then apply the item."] =
        "Place-toi sur le point indiqué, puis utilise l'objet.",
    ["Obtain Furbolg Form"] =
        "Obtiens la forme de furbolg",
    ["Walk over the span"] =
        "Traverse le pont",
    ["The foes are gnomes."] =
        "Les ennemis sont des gnomes.",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "Dans les salles extérieures de Gnomeregan, pas dans l'instance elle-même.",
    ["Take the lift down, then head north."] =
        "Descends par l'ascenseur, puis va vers le nord.",
    ["The NPC is atop the raised platform."] =
        "Le PNJ est en haut de la plateforme surélevée.",
    ["It sits a short distance southward from Techbot."] =
        "C'est un peu au sud de Techbot.",
    ["Use it on foes that are Irradiated."] =
        "Utilise-le sur les ennemis irradiés.",
    ["The targets are troggs with a green glow."] =
        "Les cibles sont des troggs à la lueur verte.",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "Dans le Hall of Gears, reste aux niveaux supérieurs.",
    ["Take the trail southwest into The Dormitory."] =
        "Prends le chemin au sud-ouest vers le dortoir.",
    ["By the wall on The Dormitory's lower floor."] =
        "Contre le mur, au niveau inférieur du dortoir.",
    ["The target is the third boss you meet."] =
        "La cible est le troisième boss que tu rencontres.",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "La cible est sur la plateforme surélevée, près de l'Électrocuteur 6000.",
    ["In the Engineering Labs, on the lowest floor."] =
        "Dans les labos d'ingénierie, au niveau le plus bas.",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "L'objectif est près de Crowd Pummeler 9-60.",
    ["Keep to Launch Bay's top floor."] =
        "Reste au niveau supérieur de la baie de lancement.",
    ["Look for boxy, standing devices."] =
        "Cherche des appareils debout, en forme de boîte.",
    ["The machine you need is in the Dormitory."] =
        "La machine qu'il te faut est dans le dortoir.",
    ["It can take more than one to get it."] =
        "Il peut en falloir plusieurs pour l'obtenir.",
    ["Duskwood and Stranglethorn"] =
        "Bois de la Pénombre et Strangleronce",
    ["Head into Stormwind Keep"] =
        "Entre dans le donjon de Hurlevent",
    ["The NPC stands by the water's edge."] =
        "Le PNJ se tient au bord de l'eau.",
    ["The targets are worgen."] =
        "Les cibles sont des worgens.",
    ["Other ghouls occupy the same spawn points."] =
        "D'autres goules occupent les mêmes points d'apparition.",
    ["The target can be in the house or around it."] =
        "La cible peut être dans la maison ou autour.",
    ["Just out of the mine."] =
        "Juste à la sortie de la mine.",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "Le PNJ patrouille sur la route sud une fois toutes les 20-30 minutes.",
    ["A pair of foes go after him."] =
        "Deux ennemis s'en prennent à lui.",
    ["Saving his life unlocks a new task."] =
        "Lui sauver la vie débloque une nouvelle quête.",
    ["Hang on to it; an upcoming quest uses it."] =
        "Garde-le : une prochaine quête s'en sert.",
    ["The NPC stands in the narrow lane between houses."] =
        "Le PNJ se tient dans la ruelle entre les maisons.",
    ["Hillsbrad and Arathi"] =
        "Hautebrande et Arathi",
    ["Search for gray rocks standing up beside the walls."] =
        "Cherche des pierres grises dressées le long des murs.",
    ["Further hidden ones lurk on the high ridgelines."] =
        "D'autres sont cachées sur les crêtes en hauteur.",
    ["Some are indoors as well."] =
        "Certaines sont aussi à l'intérieur.",
    ["Fly to Aerie Peak"] =
        "Vole jusqu'au Nid-de-l'Aigle",
    ["The NPC is at the summit of the trail."] =
        "Le PNJ est en haut du chemin.",
    ["This spares you time further on."] =
        "Ça te fera gagner du temps plus tard.",
    ["Flight master at Theramore"] =
        "Maître de vol de Theramore",
    ["This quest is buggy and may not show up."] =
        "Cette quête est buguée et peut ne pas apparaître.",
    ["Expect several foes at once."] =
        "Attends-toi à plusieurs ennemis à la fois.",
    ["Make Private Hendel your main target."] =
        "Concentre-toi sur le soldat Hendel.",
    ["Steer clear of Brackenwall Village."] =
        "Évite le village de Mur-de-Fougères.",
    ["Watch out: the foes here are above your level."] =
        "Attention : les ennemis d'ici sont d'un niveau supérieur au tien.",
    ["The quest starts from a small piece of metal."] =
        "La quête commence avec un petit morceau de métal.",
    ["Take the lift down"] =
        "Descends par l'ascenseur",
    ["Look for a little brown tome."] =
        "Cherche un petit livre brun.",
    ["The item is held by a dwarf corpse."] =
        "L'objet est tenu par un cadavre de nain.",
    ["Flight master at Thalanaar"] =
        "Maître de vol de Thalanaar",
    ["Keep clear of Freewind Post."] =
        "Évite le poste de Librevent.",
    ["This spot has most of them; elsewhere they are rare."] =
        "Il y en a surtout ici : ailleurs, ils sont rares.",
    ["Return here as you do your other quests."] =
        "Reviens ici pendant tes autres quêtes.",
    ["The foes here are scorpions."] =
        "Ici, les ennemis sont des scorpions.",
    ["Look for assorted mechanical pieces."] =
        "Cherche des pièces mécaniques diverses.",
    ["Parts lie all across the Shimmering Flats."] =
        "Il y a des pièces partout dans les Salines.",
    ["Fly to Gadgetzan"] =
        "Vole jusqu'à Gadgetzan",
    ["Stand on the metal grating to begin the battle."] =
        "Place-toi sur la grille métallique pour lancer le combat.",
    ["Shows up once you defeat six challengers."] =
        "Apparaît une fois six adversaires vaincus.",
    ["The NPC is upstairs, out on the balcony."] =
        "Le PNJ est à l'étage, dehors sur le balcon.",
    ["The NPC stands on the top tier of the pier."] =
        "Le PNJ se tient sur le niveau supérieur du quai.",
    ["Fly to Booty Bay"] =
        "Vole jusqu'à Baie-du-Butin",
    ["If he is absent, move on without him."] =
        "S'il n'est pas là, continue sans lui.",
    ["You may come back for it another time."] =
        "Tu pourras y revenir une autre fois.",
    ["These foes heal both their allies and themselves."] =
        "Ces ennemis soignent leurs alliés et eux-mêmes.",
    ["When the targets run out, skip ahead."] =
        "Quand il n'y a plus de cibles, passe à la suite.",
    ["No rush; you may complete this afterwards."] =
        "Rien ne presse : tu peux le terminer plus tard.",
    ["The objective sits up on the raised deck."] =
        "L'objectif est en haut, sur le pont surélevé.",
    ["Search the riverbanks."] =
        "Fouille les berges de la rivière.",
    ["Here your pet picks up Claw (Rank 5)."] =
        "Ici, ton familier apprend Griffe (Rang 5).",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "Apprivoise un Scorpashi Lasher avec Apprivoiser une bête.",
    ["Head uphill into Nijel's Point"] =
        "Monte jusque dans la combe de Nijel",
    ["With the coming hand-ins, this brings you to level 36."] =
        "Avec les rendus à venir, tu atteins le niveau 36.",
    ["The quest starts from a little book."] =
        "La quête commence avec un petit livre.",
    ["The targets are lobsters."] =
        "Les cibles sont des homards.",
    ["Draw him to the doorway so other foes stay out of it."] =
        "Attire-le jusqu'à l'entrée pour que les autres ennemis restent à l'écart.",
    ["Escort Dalinda Malem and keep her alive."] =
        "Escorte Dalinda Malem et garde-la en vie.",
    ["The targets here are centaurs."] =
        "Ici, les cibles sont des centaures.",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "Les Magram Pack Runners patrouillent avec 2 hyènes d'escorte : tiens-toi à l'écart.",
    ["Stay away from Ghost Walker Post."] =
        "Ne t'approche pas du poste de Rôdeur-fantôme.",
    ["Target kodos with the item."] =
        "Utilise l'objet sur les kodos.",
    ["The kodos trail behind you."] =
        "Les kodos te suivent.",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "Mène-les jusqu'à Smeed Scrabblescrew, puis parle-leur là-bas.",
    ["Look for pale skulls of horned beasts."] =
        "Cherche des crânes pâles de bêtes à cornes.",
    ["A lengthy grinding stretch is coming up."] =
        "Une longue phase à tuer des monstres arrive.",
    ["The targets are Sea Witches and Tidehunters."] =
        "Les cibles sont des sorcières des mers et des chasseurs des marées.",
    ["Other naga compete for the same spawn points."] =
        "D'autres nagas se disputent les mêmes points d'apparition.",
    ["The targets are on islands and beneath the surface."] =
        "Les cibles sont sur les îles et sous la surface de l'eau.",
    ["This spreads out the grinding so less is left later."] =
        "Cela répartit les monstres à tuer : il en restera moins plus tard.",
    ["Take the mountain trail to get there."] =
        "Prends le sentier de montagne pour y aller.",
    ["Stay clear of Valley of Spears."] =
        "Tiens-toi loin de la vallée des Lances.",
    ["Look for tan sacks by the houses."] =
        "Cherche des sacs beiges près des maisons.",
    ["Some of them are not usable."] =
        "Certains ne sont pas utilisables.",
    ["Basilisks compete for the same spawn points."] =
        "Les basilics se disputent les mêmes points d'apparition.",
    ["They compete for spawn points with the other Kurzen foes."] =
        "Ils partagent leurs points d'apparition avec les autres ennemis Kurzen.",
    ["A key class quest coming up requires this."] =
        "Une quête de classe importante à venir en a besoin.",
    ["The targets are on the cave floor."] =
        "Les cibles sont au sol de la grotte.",
    ["Targets are spread across the whole cavern."] =
        "Les cibles sont réparties dans toute la caverne.",
    ["Hold on to it for a Searing Gorge task later."] =
        "Garde-le pour une quête de la gorge des Vents brûlants plus tard.",
    ["Stay away from Bhag'thera."] =
        "Ne t'approche pas de Bhag'thera.",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "Le grand félin à trouver rôde à découvert : une panthère noire élite de niveau 40.",
    ["The targets are in the water and along its edges."] =
        "Les cibles sont dans l'eau et sur ses bords.",
    ["Look for an orange tiger."] =
        "Cherche un tigre orange.",
    ["Mostly found atop the hill."] =
        "Surtout au sommet de la colline.",
    ["Steer clear of elite murlocs."] =
        "Tiens-toi loin des murlocs élites.",
    ["The targets are trolls."] =
        "Les cibles sont des trolls.",
    ["With the coming hand-ins, this gets you to level 38."] =
        "Avec les rendus à venir, tu atteins le niveau 38.",
    ["Hunt the little winged dragonkin."] =
        "Chasse les petits draconiens ailés.",
    ["The target is a humanoid escorted by 2 guards."] =
        "La cible est un humanoïde escorté par 2 gardes.",
    ["Clear the monsters just south before you start."] =
        "Nettoie les monstres juste au sud avant de commencer.",
    ["Escort Galen Goodward and keep him alive."] =
        "Escorte Galen Goodward et garde-le en vie.",
    ["Look for big blue crystals."] =
        "Cherche de gros cristaux bleus.",
    ["Keep to the water to skip foes above your level."] =
        "Reste dans l'eau pour éviter les ennemis de plus haut niveau.",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "Avec les prochains rendus, tu atteins le niveau 39.",
    ["Hold on to it for the Whirlwind class chain."] =
        "Garde-le pour la chaîne de quêtes de classe Tourbillon.",
    ["A major boost to your weapon."] =
        "Une grosse amélioration pour ton arme.",
    ["Arathi and Alterac"] =
        "Arathi et Alterac",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "La cible suit la route dans un seul sens, escortée par 4 gardes.",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "Si elle atteint Moulin-de-Tarren, elle réapparaît.",
    ["She starts her route over in Arathi Highlands."] =
        "Elle reprend son trajet depuis les Hautes-terres d'Arathi.",
    ["The targets are kobolds."] =
        "Les cibles sont des kobolds.",
    ["Additional ones are in the cavern up the trail."] =
        "Il y en a d'autres dans la caverne en haut du sentier.",
    ["Keep away from Hammerfall."] =
        "Ne t'approche pas de Trépas-d'Orgrim.",
    ["Climb the trail to the cavern"] =
        "Monte le sentier jusqu'à la caverne",
    ["The NPC stands atop the ridge."] =
        "Le PNJ se tient au sommet de la crête.",
    ["Escort Kinelory and keep her alive."] =
        "Escorte Kinelory et garde-la en vie.",
    ["The targets are ogres."] =
        "Les cibles sont des ogres.",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "Avec les prochains rendus, tu atteins le niveau 40.",
    ["Stay clear of Refuge Point."] =
        "Tiens-toi loin du Refuge de l'Ornière.",
    ["A level 40 elite foe shows up shortly."] =
        "Un ennemi élite de niveau 40 apparaît peu après.",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "Bois une deuxième Potion de protection contre la nature pendant le combat.",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "Bois-en une à l'avance, pour que sa recharge soit finie au début du combat.",
    ["Get Essence of the Exile done as well."] =
        "Termine aussi Essence of the Exile.",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "Vérifie que la recharge de la Potion de protection contre la nature est finie.",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "Reste derrière Bath'rah the Windwatcher pendant qu'il marche.",
    ["This calls up Cyclonian."] =
        "Cela invoque Cyclonian.",
    ["Take the trail across the peaks"] =
        "Prends le sentier qui traverse les sommets",
    ["Take the passage to Faldir's Cove"] =
        "Prends le passage jusqu'à Faldir's Cove",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "Escorte le professeur Phizzlethorpe et garde-le en vie.",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "Le tome a une reliure marron et repose dans une marmite en métal.",
    ["The objective is on the central deck of the submerged wreck."] =
        "L'objectif est sur le pont central de l'épave engloutie.",
    ["Look for a flat beige parchment."] =
        "Cherche un parchemin beige posé à plat.",
    ["Search for a book lying open."] =
        "Cherche un livre ouvert.",
    ["The target is in the ship's lowest hold."] =
        "La cible est dans la cale la plus basse du navire.",
    ["Look for big gray rocks."] =
        "Cherche de gros rochers gris.",
    ["They show up as dots on the minimap."] =
        "Ils apparaissent comme des points sur ta minicarte.",
    ["Hold on to it, an upcoming quest uses it."] =
        "Garde-le, une prochaine quête s'en sert.",
    ["Clear the raptors around before you begin."] =
        "Nettoie les raptors autour avant de commencer.",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "Laisse la conversation se finir, puis escorte \"Stinky\" Ignatz et garde-le en vie.",
    ["Speak with him once he gives up."] =
        "Parle-lui une fois qu'il se rend.",
    ["Hunt the felguards."] =
        "Chasse les gangregardes.",
    ["This is the sole spot; wait for them to reappear."] =
        "C'est le seul endroit : attends qu'ils réapparaissent.",
    ["The targets are felhounds."] =
        "Les cibles sont des chiens corrompus.",
    ["The targets are succubi."] =
        "Les cibles sont des succubes.",
    ["The spot is beside a giant skeleton."] =
        "L'endroit est à côté d'un squelette géant.",
    ["Clear out the foes around here before you start."] =
        "Nettoie les ennemis du coin avant de commencer.",
    ["Target the spectral centaurs."] =
        "Vise les centaures spectraux.",
    ["The targets are brown-colored skeletons."] =
        "Les cibles sont des squelettes de couleur marron.",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "Avec les prochains rendus, tu atteins le niveau 41.",
    ["The target wanders inside the tent and around it."] =
        "La cible erre dans la tente et autour.",
    ["Take the road, then descend the trail"] =
        "Prends la route, puis descends le sentier",
    ["On the road, Rexxar leaves you alone."] =
        "Sur la route, Rexxar te laisse tranquille.",
    ["Cross by boat or by swimming"] =
        "Traverse en bateau ou à la nage",
    ["Flight master at Feathermoon"] =
        "Maître de vol de Pennelune",
    ["Your pet picks up Claw (Rank 6) here."] =
        "Ton familier apprend Griffe (Rang 6) ici.",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "Apprivoise un Scorpid Hunter avec Apprivoiser une bête.",
    ["Head into the Library wing."] =
        "Va dans l'aile Bibliothèque.",
    ["The target is the dungeon's opening boss."] =
        "La cible est le premier boss du donjon.",
    ["Head across the hall called Gallery of Treasures."] =
        "Traverse la salle appelée galerie des Trésors.",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "Surveille la minicarte jusqu'à ce que le nom de la zone redevienne Monastère écarlate.",
    ["This is in the Armory wing."] =
        "C'est dans l'aile Armurerie.",
    ["Found in the Cathedral wing."] =
        "Dans l'aile Cathédrale.",
    ["A lengthy stretch of quests is coming up."] =
        "Une longue série de quêtes arrive.",
    ["This vendor sells no arrows or bullets."] =
        "Ce marchand ne vend ni flèches ni balles.",
    ["Get these for simple Badlands turn-ins ahead."] =
        "Prends-les pour des rendus faciles plus loin, dans les Terres ingrates.",
    ["The NPC or item sits on the rocky shelf above."] =
        "Le PNJ ou l'objet est sur la corniche rocheuse au-dessus.",
    ["Fight the dwarves."] =
        "Combats les nains.",
    ["Look for a timber box."] =
        "Cherche une caisse en bois.",
    ["A cluster of them gathers here."] =
        "Il y en a tout un groupe ici.",
    ["More of them dot the surroundings."] =
        "D'autres sont dispersés aux alentours.",
    ["With the coming hand-ins, this brings you to level 42."] =
        "Avec les rendus à venir, tu atteins le niveau 42.",
    ["Unlocks the flight point at Thorium Point."] =
        "Débloque le point de vol de la Halte du Thorium.",
    ["Flight master at Thorium Point"] =
        "Maître de vol de la Halte du Thorium",
    ["Take the passage out of Booty Bay"] =
        "Prends le passage pour sortir de Baie-du-Butin",
    ["Take the tunnel into Booty Bay"] =
        "Prends le tunnel pour entrer dans Baie-du-Butin",
    ["Take the trail toward the Ruins of Aboraz"] =
        "Prends le sentier vers les ruines d'Aboraz",
    ["Gradually move toward the northeast."] =
        "Avance peu à peu vers le nord-est.",
    ["The targets are goblins."] =
        "Les cibles sont des gobelins.",
    ["Kill the witch doctors and the mystics."] =
        "Tue les féticheurs et les mystiques.",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "Une panthère sombre, élite de niveau 40, visible et non camouflée.",
    ["Be ready: these opponents are elites at level 38."] =
        "Prépare-toi : ces adversaires sont des élites de niveau 38.",
    ["Saltwater Crocolisks spawn in the same places."] =
        "Les Saltwater Crocolisks apparaissent aux mêmes endroits.",
    ["The object is a table made of stone."] =
        "L'objet est une table de pierre.",
    ["Drag him up until he breaks the surface."] =
        "Remonte-le jusqu'à ce qu'il sorte de l'eau.",
    ["Follow the shoreline"] =
        "Suis le rivage",
    ["The item is a brownish sheet of parchment."] =
        "L'objet est une feuille de parchemin brunâtre.",
    ["Look for a flat, white scroll lying open."] =
        "Cherche un rouleau blanc, ouvert à plat.",
    ["If some pages are unavailable, go on without them."] =
        "Si certaines pages manquent, continue sans elles.",
    ["You want Chapters I, II and III."] =
        "Il te faut les chapitres I, II et III.",
    ["Collect the chunks of wood."] =
        "Ramasse les morceaux de bois.",
    ["Do not go near Stonard."] =
        "Ne t'approche pas de Pierrêche.",
    ["Silt Crawlers drop it more often."] =
        "Les Silt Crawlers le lâchent plus souvent.",
    ["Fly to Nethergarde Keep"] =
        "Vole jusqu'au Rempart-du-Néant",
    ["A timer runs on this one; don't dawdle."] =
        "Cette quête est chronométrée : ne traîne pas.",
    ["Hold on until Rizzle has fled."] =
        "Attends que Rizzle se soit enfui.",
    ["Targets here are human."] =
        "Ici, les cibles sont humaines.",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "Faire des donjons ici est un bon choix aussi, comme tu préfères.",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "Chaque lot de 5 rendu à Gadgetzan donne 380 xp.",
    ["Hyenas also use these spawn spots."] =
        "Les hyènes utilisent aussi ces points d'apparition.",
    ["Feralas and Tanaris"] =
        "Féralas et Tanaris",
    ["Position yourself in its center."] =
        "Place-toi en son centre.",
    ["Consider bringing a group for this one."] =
        "Pense à venir en groupe pour celle-ci.",
    ["Zones with stronger foes lie just ahead."] =
        "Des zones aux ennemis plus forts t'attendent juste après.",
    ["The quests alone won't give you the level you need."] =
        "Les quêtes seules ne te donneront pas le niveau nécessaire.",
    ["Swim this way to stay out of fatigue"] =
        "Nage par ici pour éviter la fatigue",
    ["Hunt the crimson winged serpents."] =
        "Chasse les serpents ailés cramoisis.",
    ["Slay them, then apply the item to their remains."] =
        "Tue-les, puis utilise l'objet sur leurs restes.",
    ["Once freed, they can be killed."] =
        "Une fois libérés, ils peuvent être tués.",
    ["Win the encounter at the temple."] =
        "Remporte l'affrontement du temple.",
    ["Take the trail to the southeast."] =
        "Prends le sentier vers le sud-est.",
    ["Inside a big room around a central pool."] =
        "Dans une grande salle, autour d'un bassin central.",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "La plupart sont dans la salle des scarabées de Theka la Martyre.",
    ["It could take a few trips through the instance."] =
        "Il faudra peut-être plusieurs passages dans l'instance.",
    ["Do more Zul'Farrak runs."] =
        "Refais Zul'Farrak encore quelques fois.",
    ["Keep to the road, then cross the tunnel"] =
        "Reste sur la route, puis traverse le tunnel",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "Le robot est dans l'espace dégagé entre la grotte et le tunnel.",
    ["Others lie past the tunnel."] =
        "D'autres sont après le tunnel.",
    ["Get out of the cave and use the passage beyond"] =
        "Sors de la grotte et prends le passage plus loin",
    ["Look for a big, pale egg."] =
        "Cherche un gros œuf pâle.",
    ["Hunt gorillas."] =
        "Chasse les gorilles.",
    ["Bears appear at the same spawn spots."] =
        "Des ours apparaissent aux mêmes endroits.",
    ["Hunt bears."] =
        "Chasse les ours.",
    ["They appear in the same spots as the apes."] =
        "Ils apparaissent aux mêmes endroits que les singes.",
    ["Kill the foes near the big cage first."] =
        "Tue d'abord les ennemis près de la grande cage.",
    ["This helps with the following step."] =
        "Cela aide pour l'étape suivante.",
    ["This sets Captured Sprite Darters free."] =
        "Cela libère les Captured Sprite Darters.",
    ["Save as many of them as possible."] =
        "Sauves-en le plus possible.",
    ["Keep 6 or more of them alive."] =
        "Gardes-en au moins 6 en vie.",
    ["If she is gone, wait until she comes back."] =
        "Si elle n'est pas là, attends qu'elle revienne.",
    ["Go into the cavern at the trail's foot"] =
        "Entre dans la caverne au pied du sentier",
    ["Getting it here speeds up Un'Goro Crater."] =
        "L'obtenir ici accélère le cratère d'Un'Goro.",
    ["Stay clear of the elite foes."] =
        "Tiens-toi loin des ennemis élites.",
    ["Gather the big plumes colored brown and ivory."] =
        "Ramasse les grandes plumes marron et ivoire.",
    ["Drop the Ground Clutter option down to 1."] =
        "Baisse l'option des détails au sol à 1.",
    ["Hop onto the ledge here."] =
        "Saute sur la corniche ici.",
    ["Monsters are unable to reach you from this spot."] =
        "Les monstres ne peuvent pas t'atteindre ici.",
    ["Hold off until you have left combat."] =
        "Attends d'être sorti du combat.",
    ["Other creatures use these spawn points too."] =
        "D'autres créatures utilisent aussi ces points d'apparition.",
    ["If it hasn't turned up by level 49, move on."] =
        "S'il n'est pas apparu au niveau 49, passe à la suite.",
    ["Stay on the road, then take the trail downhill"] =
        "Reste sur la route, puis descends le sentier",
    ["Point it at Gammerita."] =
        "Utilise-le sur Gammerita.",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "Ta proie : une tortue élite coriace, à carapace azur.",
    ["Look for little blue flasks."] =
        "Cherche de petites fioles bleues.",
    ["Steer around Revantusk Village."] =
        "Contourne le village de Vengebroche.",
    ["Stay away from Gammerita."] =
        "Ne t'approche pas de Gammerita.",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "Tue des monstres jusqu'à ce que ta pierre de foyer soit rechargée",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "La cible patrouille en une large boucle, dans le sens inverse des aiguilles d'une montre.",
    ["Watch for a pair of guards hiding in stealth."] =
        "Attention à deux gardes camouflés.",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "Le point d'apparition de la cible est en 58.9, 39.3 à Tanaris.",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "Descends le passage qui s'ouvre sur Lost Rigger Cove",
    ["Few kills yield this item."] =
        "Cet objet tombe rarement.",
    ["Others can be found on raised wood platforms close by."] =
        "D'autres sont sur les plateformes en bois surélevées toutes proches.",
    ["Others are indoors too."] =
        "D'autres sont aussi à l'intérieur.",
    ["Take the passage out of Lost Rigger Cove"] =
        "Prends le passage pour sortir de Lost Rigger Cove",
    ["If the NPC is gone, hold on until it reappears."] =
        "Si le PNJ n'est pas là, attends qu'il réapparaisse.",
    ["Search the sand mounds."] =
        "Fouille les monticules de sable.",
    ["It competes for spawn points."] =
        "Il partage ses points d'apparition.",
    ["Stay clear of the elite tyrannosaur."] =
        "Tiens-toi loin du tyrannosaure élite.",
    ["Every creature in Un'Goro Crater can drop it."] =
        "Toutes les créatures du cratère d'Un'Goro peuvent le lâcher.",
    ["Gather from clumps of multicolored crystals."] =
        "Récolte sur les amas de cristaux multicolores.",
    ["Spawn points are shared, so pick up every one you find."] =
        "Les points d'apparition sont partagés : ramasse tous ceux que tu trouves.",
    ["Gathering it causes other hues to show up."] =
        "En le ramassant, tu fais apparaître d'autres couleurs.",
    ["The targets are mobile plant monsters."] =
        "Les cibles sont des monstres végétaux mobiles.",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "Avec les prochains rendus, tu atteins le niveau 50.",
    ["Flight master at Marshal's Refuge"] =
        "Maître de vol du Refuge de Marshal",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "Dans les tunnels de Maraudon, la cible est un centaure en armure violette.",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "Va dans l'aile violette des tunnels de Maraudon.",
    ["Use it on the Spirit of Gelk."] =
        "Utilise-le sur Spirit of Gelk.",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "Dans les tunnels de Maraudon, trouve la salle qui relie les zones violette et orange.",
    ["Target the Spirit of Kolk with the item."] =
        "Utilise l'objet sur Spirit of Kolk.",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "Dans les tunnels de Maraudon, le long de l'aile orange.",
    ["The target is beside the big pool holding orange crystals."] =
        "La cible est à côté du grand bassin aux cristaux orange.",
    ["Target the Spirit of Magra with it."] =
        "Utilise-le sur Spirit of Magra.",
    ["Target Spirit of Veng with it."] =
        "Utilise-le sur Spirit of Veng.",
    ["In the orange area."] =
        "Dans la zone orange.",
    ["Use it beside the Vylestem Vines."] =
        "Utilise-le à côté des Vylestem Vines.",
    ["Look for stumps topped with big leaves."] =
        "Cherche des souches couvertes de grandes feuilles.",
    ["The spot is in Foulspore Cavern."] =
        "L'endroit est dans Foulspore Cavern.",
    ["This happens in Maraudon's violet wing."] =
        "Cela se passe dans l'aile violette de Maraudon.",
    ["Aim the item at the Spirit of Maraudos."] =
        "Utilise l'objet sur Spirit of Maraudos.",
    ["The target is a spectral centaur holding a spear."] =
        "La cible est un centaure spectral armé d'une lance.",
    ["Small green flasks."] =
        "Petites fioles vertes.",
    ["Search the shoreline, right by the waves."] =
        "Fouille le rivage, au bord des vagues.",
    ["The objective is on the ship's center deck."] =
        "L'objectif est sur le pont central du navire.",
    ["Search for a parchment roll, white in color."] =
        "Cherche un rouleau de parchemin blanc.",
    ["Search the ship's middle or lowest deck."] =
        "Fouille le pont central ou le pont inférieur du navire.",
    ["If she is absent, wait for her to come back."] =
        "Si elle n'est pas là, attends son retour.",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "Traque un raptor élite de niveau 43 aux écailles azur.",
    ["The quarry is a pale tiger, an elite at 43."] =
        "Ta proie est un tigre pâle, élite de niveau 43.",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "Il appelle 2 petits renforts de plus bas niveau, aucun n'est élite.",
    ["When it drops to about 50% health."] =
        "Quand il tombe à environ 50 % de vie.",
    ["Look underneath the bridge."] =
        "Regarde sous le pont.",
    ["Hunt flame and stone elementals."] =
        "Chasse les élémentaires de feu et de pierre.",
    ["Fight elementals and golems."] =
        "Combats les élémentaires et les golems.",
    ["Drop onto the metal catwalk at this spot"] =
        "Saute sur la passerelle métallique à cet endroit",
    ["Drop off the cavern's bridge at this spot"] =
        "Saute du pont de la caverne à cet endroit",
    ["Go in through the second cave opening"] =
        "Entre par la deuxième entrée de la grotte",
    ["Slave Workers can drop them too."] =
        "Les ouvriers esclaves peuvent aussi en lâcher.",
    ["Climb the trail out of the Cauldron"] =
        "Monte le sentier pour sortir du Chaudron",
    ["The foes here are elite."] =
        "Ici, les ennemis sont élites.",
    ["Do not leave this quest undone; it matters."] =
        "Ne laisse pas cette quête de côté : elle compte.",
    ["The spot is at the tower's upper level."] =
        "L'endroit est au niveau supérieur de la tour.",
    ["Beware, this foe is elite."] =
        "Attention, cet ennemi est élite.",
    ["Walk over the rope bridge"] =
        "Traverse le pont de corde",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "Chasse le saurien azur élite, de niveau 48.",
    ["The target wanders the trail."] =
        "La cible erre sur le sentier.",
    ["Defeat every foe close by before you begin."] =
        "Élimine tous les ennemis proches avant de commencer.",
    ["Escort Dorius Stonetender and keep him safe."] =
        "Escorte Dorius Stonetender et protège-le.",
    ["Keep it; a later quest calls for it."] =
        "Garde-le : une quête plus tard en a besoin.",
    ["Look by the lookout towers ringing the Cauldron."] =
        "Regarde près des tours de guet autour du Chaudron.",
    ["Climb the trail into Thorium Point"] =
        "Monte le sentier jusqu'à la Halte du Thorium",
    ["Blasted Lands and Burning Steppes"] =
        "Terres foudroyées et Steppes ardentes",
    ["Prioritize these targets."] =
        "Ces cibles sont prioritaires.",
    ["Hunt basilisks."] =
        "Chasse les basilics.",
    ["They appear in the same spots as the boars."] =
        "Ils apparaissent aux mêmes endroits que les sangliers.",
    ["Hunt hyenas for these."] =
        "Chasse les hyènes pour les obtenir.",
    ["Scorpions spawn in the same spots."] =
        "Des scorpions apparaissent aux mêmes endroits.",
    ["Climb the trail to Morgan's Vigil"] =
        "Monte le sentier jusqu'à la Veille de Morgan",
    ["Flight master at Morgan's Vigil"] =
        "Maître de vol de la Veille de Morgan",
    ["8 different quests will ask for it."] =
        "8 quêtes différentes vont le demander.",
    ["You hand in 60 pieces of cloth for every quest."] =
        "Tu rends 60 pièces de tissu pour chaque quête.",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "Les morts-vivants en lâchent dans les deux Maleterres, de l'Ouest et de l'Est.",
    ["Keep your Argent Dawn Commission aura up."] =
        "Garde l'aura Brevet de l'Aube d'argent active.",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "Avec les prochains rendus, tu atteins le niveau 52.",
    ["Azshara and Felwood"] =
        "Azshara et Gangrebois",
    ["A lengthy stretch of questing lies ahead."] =
        "Une longue série de quêtes t'attend.",
    ["Hand these in afterwards for experience and reputation."] =
        "Rends-les ensuite pour l'expérience et la réputation.",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "Monte ta réputation auprès des Grumegueules à Inamical",
    ["Extra targets wait in the caves."] =
        "D'autres cibles attendent dans les grottes.",
    ["Stay on the trail to reach Jaedenar"] =
        "Reste sur le sentier pour atteindre Jaedenar",
    ["Climb the trail into Jadefire Run"] =
        "Monte le sentier jusqu'à Jadefire Run",
    ["Flight master at Talonbranch Glade"] =
        "Maître de vol de la clairière de Griffebranche",
    ["Big blue plumes."] =
        "Grandes plumes bleues.",
    ["Head eastward as you go."] =
        "Avance vers l'est au fur et à mesure.",
    ["You pick up Claw (Rank 7) here."] =
        "Ici, tu obtiens Griffe (Rang 7).",
    ["Flight master at Everlook"] =
        "Maître de vol de Long-guet",
    ["The flight master stands past the walls, outdoors."] =
        "Le maître de vol est au-delà des murs, dehors.",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "Apprivoise un Angerclaw Mauler avec ton sort Apprivoiser une bête.",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "Traque un ours pestiféré au pelage châtain.",
    ["Feralas and Azshara"] =
        "Féralas et Azshara",
    ["Aim the item at the Strider foes."] =
        "Utilise l'objet sur les trotteurs.",
    ["The targets are towering green giants."] =
        "Les cibles sont d'immenses géants verts.",
    ["The item strips their elite status."] =
        "L'objet leur retire leur statut d'élite.",
    ["Hunt down the elementals formed of water."] =
        "Traque les élémentaires d'eau.",
    ["Reveal Dire Maul on your map"] =
        "Découvre Hache-Tripes sur ta carte",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "Place-toi sur la corniche voisine, puis saute dans cette fissure du mur",
    ["Hop onto the ledge"] =
        "Saute sur la corniche",
    ["Leap over at this spot"] =
        "Saute par-dessus à cet endroit",
    ["Leap up at this spot"] =
        "Saute vers le haut à cet endroit",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "Shay Leafrunner te suit : garde-la en vie.",
    ["Keep near her, as she tends to stray."] =
        "Reste près d'elle, elle a tendance à s'éloigner.",
    ["Finish the quest named The Videre Elixir."] =
        "Termine la quête The Videre Elixir.",
    ["Keep the elixir in your bags; never consume it."] =
        "Garde l'élixir dans ton sac : ne le bois jamais.",
    ["You will die from it."] =
        "Il te tuerait.",
    ["Put these items in your bank vault."] =
        "Range ces objets dans ton coffre à la banque.",
    ["The quest giver waits on the hilltop."] =
        "Le donneur de quête attend au sommet de la colline.",
    ["The targets are Myrmidons and Sirens."] =
        "Les cibles sont des myrmidons et des sirènes.",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "Contourne les ruines d'Eldarath, puis traverse le pont",
    ["Drop down with care"] =
        "Descends avec prudence",
    ["The spot is the middle of the timber deck."] =
        "L'endroit est au milieu de la plateforme en bois.",
    ["It shows up close by after a while."] =
        "Il apparaît tout près au bout d'un moment.",
    ["At times it takes several minutes."] =
        "Cela prend parfois plusieurs minutes.",
    ["The targets are flame elementals."] =
        "Les cibles sont des élémentaires de feu.",
    ["An elite foe waits on the summit; steer clear."] =
        "Un ennemi élite attend au sommet : tiens-toi à l'écart.",
    ["Ringo trails behind you; keep him alive."] =
        "Ringo te suit : garde-le en vie.",
    ["Keep near him; he passes out."] =
        "Reste près de lui : il s'évanouit.",
    ["Take the trail through the cavern"] =
        "Prends le sentier à travers la caverne",
    ["Escort A-Me 01 and keep it alive."] =
        "Escorte A-Me 01 et garde-le en vie.",
    ["Winterspring and Felwood"] =
        "Berceau-de-l'Hiver et Gangrebois",
    ["Go into Jaedenar"] =
        "Entre dans Jaedenar",
    ["Go to the upper floor of the cavern."] =
        "Va à l'étage supérieur de la caverne.",
    ["Circle the gap in the ground, then take the trail downward"] =
        "Fais le tour du trou dans le sol, puis descends le sentier",
    ["The target is deep in the cave, on its lowest floor."] =
        "La cible est au fond de la grotte, à son niveau le plus bas.",
    ["Search the upper and lower floors of the cavern."] =
        "Fouille les niveaux supérieur et inférieur de la caverne.",
    ["The prisoner is held in a cage of yellow wood."] =
        "Le prisonnier est enfermé dans une cage en bois jaune.",
    ["Climb the trail and exit the cavern"] =
        "Monte le sentier et sors de la caverne",
    ["The targets are furbolgs."] =
        "Les cibles sont des furbolgs.",
    ["With the coming hand-ins, this brings you to level 55."] =
        "Avec les rendus à venir, tu atteins le niveau 55.",
    ["A tough quest lies just ahead."] =
        "Une quête difficile t'attend juste après.",
    ["Flee if things go badly."] =
        "Fuis si ça tourne mal.",
    ["The NPC is a human spirit."] =
        "Le PNJ est un esprit humain.",
    ["The targets are leafless trees that walk."] =
        "Les cibles sont des arbres sans feuilles qui marchent.",
    ["Slay the greenish beings of living water."] =
        "Tue les êtres verdâtres d'eau vivante.",
    ["The targets are wolves and bears."] =
        "Les cibles sont des loups et des ours.",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "Les cibles sont 3 furbolgs blancs qui se déplacent en groupe.",
    ["The target patrols a long route beside the road."] =
        "La cible patrouille sur un long trajet le long de la route.",
    ["Move on if you have not seen it once the trail ends."] =
        "Passe à la suite si tu ne l'as pas vue au bout du sentier.",
    ["Escort Ranshalla and guard her."] =
        "Escorte Ranshalla et protège-la.",
    ["Wait until the foes hit her before you strike."] =
        "Attends que les ennemis la frappent avant d'attaquer.",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "Ils apparaissent près de 28.1, 35.0 au Berceau-de-l'Hiver.",
    ["You can also do dungeons until you hit level 56."] =
        "Tu peux aussi faire des donjons jusqu'au niveau 56.",
    ["Give Nafien the items in sets of 5."] =
        "Donne les objets à Nafien par lots de 5.",
    ["Every full set you hand over earns 50 reputation."] =
        "Chaque lot complet rendu rapporte 50 points de réputation.",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "Monte ta réputation auprès des Grumegueules à Neutre",
    ["The NPC stands within the passage."] =
        "Le PNJ se tient dans le passage.",
    ["This foe is elite."] =
        "Cet ennemi est élite.",
    ["Target Black Broodlings with the item."] =
        "Utilise l'objet sur les Black Broodlings.",
    ["A red crystal hovers over each body."] =
        "Un cristal rouge flotte au-dessus de chaque corps.",
    ["Hunt the huge red dragons."] =
        "Chasse les énormes dragons rouges.",
    ["Look for gray standing stones."] =
        "Cherche des pierres levées grises.",
    ["The target is an ogre."] =
        "La cible est un ogre.",
    ["Watch out, its blows are strong."] =
        "Attention, ses coups sont puissants.",
    ["The targets are wolves and orcs."] =
        "Les cibles sont des loups et des orcs.",
    ["The NPC is an elderly human lady."] =
        "Le PNJ est une vieille dame humaine.",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "Si elle n'est pas là, elle peut être à l'étage de la maison, en 52.4, 42.1 à Hurlevent.",
    ["Walk over the rope bridge, then climb the trail"] =
        "Traverse le pont de corde, puis monte le sentier",
    ["The Plaguelands"] =
        "Les Maleterres",
    ["Check each of the two floors indoors."] =
        "Vérifie les deux étages à l'intérieur.",
    ["Stand at the watchtower's doorway."] =
        "Place-toi à l'entrée de la tour de guet.",
    ["An elite foe waits indoors; stay clear of it."] =
        "Un ennemi élite attend à l'intérieur : tiens-toi à l'écart.",
    ["Spiders also appear at these spawn spots."] =
        "Des araignées apparaissent aussi à ces endroits.",
    ["Look for a white set of bones."] =
        "Cherche un tas d'ossements blancs.",
    ["The targets appear in several places."] =
        "Les cibles apparaissent à plusieurs endroits.",
    ["Finish Locked Away to obtain this."] =
        "Termine Locked Away pour l'obtenir.",
    ["The target is a ghoul armed with a pitchfork."] =
        "La cible est une goule armée d'une fourche.",
    ["Elites roam close by; keep your distance."] =
        "Des élites rôdent tout près : garde tes distances.",
    ["Search the bones of a fallen person."] =
        "Fouille les ossements d'une personne morte.",
    ["The NPC is within the ruined home."] =
        "Le PNJ est dans la maison en ruine.",
    ["Search within the houses here."] =
        "Fouille l'intérieur des maisons ici.",
    ["Look for big yellow grubs."] =
        "Cherche de grosses larves jaunes.",
    ["With the coming hand-ins, this gets you to level 58."] =
        "Avec les rendus à venir, tu atteins le niveau 58.",
    ["Flight master at Light's Hope Chapel"] =
        "Maître de vol de la chapelle de l'Espoir de Lumière",
    ["Look for big rocks seeping green slime."] =
        "Cherche de gros rochers suintant de vase verte.",
    ["Progress westward as you go."] =
        "Avance vers l'ouest au fur et à mesure.",
    ["Other undead compete for the same spawn points."] =
        "D'autres morts-vivants se disputent les mêmes points d'apparition.",
    ["The spirits rise where those foes die."] =
        "Les esprits surgissent là où ces ennemis meurent.",
    ["Go down into the tomb"] =
        "Descends dans le tombeau",
    ["This is below ground, on the crypt's lower floor."] =
        "C'est sous terre, au niveau inférieur de la crypte.",
    ["Your character must be seated first."] =
        "Ton personnage doit d'abord être assis.",
    ["Move the camera close and check which book is genuine."] =
        "Rapproche la caméra et vérifie quel livre est le vrai.",
    ["Some books are traps that summon foes."] =
        "Certains livres sont des pièges qui invoquent des ennemis.",
    ["The genuine book can look two ways:"] =
        "Le vrai livre peut avoir deux apparences :",
    ["Close to the big buildings lit in blue."] =
        "Près des grands bâtiments éclairés en bleu.",
    ["A new one may appear when one is killed."] =
        "Un nouveau peut apparaître quand l'un d'eux meurt.",
    ["The targets are in the ruined houses."] =
        "Les cibles sont dans les maisons en ruine.",
    ["It shows up on top of the box."] =
        "Il apparaît sur la caisse.",
    ["Targets are in the tower and around its base."] =
        "Les cibles sont dans la tour et autour de sa base.",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "Si un élite se tient sur le toit de la tour, reste dehors.",
    ["Pick up Claw (Rank 8) for your pet."] =
        "Obtiens Griffe (Rang 8) pour ton familier.",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "Apprivoise un Winterspring Screecher avec le sort Apprivoiser une bête.",
    ["Hunt the white owls."] =
        "Chasse les chouettes blanches.",
    ["Either the patriarch or the matriarch yetis work."] =
        "Les yétis patriarches comme les yétis matriarches conviennent.",
    ["Climb across the mountain to the far side"] =
        "Franchis la montagne jusqu'à l'autre versant",
    ["Hunt the chimaeras."] =
        "Chasse les chimères.",
    ["Target Legacki with the item."] =
        "Utilise l'objet sur Legacki.",
    ["Target Sprinkle with it."] =
        "Utilise-le sur Sprinkle.",
    ["Target Quixxil with it."] =
        "Utilise-le sur Quixxil.",
    ["Flight master at Cenarion Hold"] =
        "Maître de vol du fort Cénarien",
    ["Watch out: killing them can summon more foes."] =
        "Attention : les tuer peut invoquer d'autres ennemis.",
    ["Look for fragments of rock that glow blue."] =
        "Cherche des fragments de roche à lueur bleue.",
    ["Roam the area where the insects swarm."] =
        "Parcours la zone où grouillent les insectes.",
    ["Hunt the gray scorpids."] =
        "Chasse les scorpides gris.",
    ["The target is an orc wearing violet robes."] =
        "La cible est un orc en robe violette.",
    ["It shows up around here."] =
        "Il apparaît par ici.",
    ["Hunt the yellow scorpids."] =
        "Chasse les scorpides jaunes.",
    ["Target the burrowing worms."] =
        "Vise les vers fouisseurs.",
    ["This number shrinks while you kill monsters."] =
        "Ce nombre baisse à mesure que tu tues des monstres.",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "Apporte les plumes que tu ramasses au PNJ en 64.8, 8.1.",
    ["The NPC stands outdoors, next to the crypt."] =
        "Le PNJ se tient dehors, à côté de la crypte.",
    ["The targets are bats."] =
        "Les cibles sont des chauves-souris.",
    ["Check in and around the structures."] =
        "Regarde dans les bâtiments et autour.",
    ["With the coming hand-ins, this gets you to level 5."] =
        "Avec les rendus à venir, tu atteins le niveau 5.",
    ["The target is a shambling zombie."] =
        "La cible est un zombie titubant.",
    ["The quest giver is an abomination."] =
        "Le donneur de quête est une abomination.",
    ["He may step off the road now and then to pick plants."] =
        "Il quitte parfois la route pour cueillir des plantes.",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "Soigne le garde de la mort Kel avec Soins inférieurs (Rang 2).",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "Renforce le garde de la mort Kel avec Mot de pouvoir : Robustesse.",
    ["The targets are gray, demon-like hounds."] =
        "Les cibles sont des chiens gris d'allure démoniaque.",
    ["The targets are zombies."] =
        "Les cibles sont des zombies.",
    ["Look for wilted violet weeds."] =
        "Cherche des herbes violettes fanées.",
    ["Walk the shoreline toward the southwest."] =
        "Longe le rivage vers le sud-ouest.",
    ["If the beach ends first, move on without it."] =
        "Si la plage s'arrête avant, continue sans.",
    ["Keep to the trail as it curves."] =
        "Reste sur le chemin dans le virage.",
    ["Step into the flames."] =
        "Entre dans les flammes.",
    ["Stay on the trail and keep climbing the steps"] =
        "Reste sur le chemin et continue de monter les marches",
    ["Loot the gray chests built from metal."] =
        "Fouille les coffres gris en métal.",
    ["Search in and around the sunken wrecks."] =
        "Cherche dans les épaves englouties et autour.",
    ["The target is a troll in crimson robes."] =
        "La cible est un troll en robe cramoisie.",
    ["Look for the skull-shaped objects."] =
        "Cherche les objets en forme de crâne.",
    ["The targets are clumps of purple eggs."] =
        "Les cibles sont des grappes d'œufs violets.",
    ["Search close to the trunks."] =
        "Cherche près des troncs.",
    ["Stay on the trail, then cross the tunnel"] =
        "Reste sur le chemin, puis traverse le tunnel",
    ["Traverse the passageway"] =
        "Traverse le passage",
    ["Fly to Orgrimmar"] =
        "Vole jusqu'à Orgrimmar",
    ["The quest comes from a bounty sign."] =
        "La quête vient d'un avis de recherche.",
    ["Look for an iron slab marked with a skull."] =
        "Cherche une plaque de fer marquée d'un crâne.",
    ["Use the item at the pink marking."] =
        "Utilise l'objet sur la marque rose.",
    ["Move gradually northwest toward Agamand Mills."] =
        "Avance peu à peu vers le nord-ouest, vers les moulins d'Agamand.",
    ["The target is a skeletal caster in armor."] =
        "La cible est un lanceur de sorts squelette en armure.",
    ["The target is a banshee."] =
        "La cible est une banshee.",
    ["The targets are skeletons in armor."] =
        "Les cibles sont des squelettes en armure.",
    ["The targets are skeletal mages."] =
        "Les cibles sont des mages squelettes.",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "Avec les prochains rendus de quête, tu passes niveau 13.",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "La cible patrouille sur la route entre Brill et le Sépulcre.",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "La cible apparaît près du Sépulcre, en 47.5, 39.8 dans la forêt des Pins-Argentés.",
    ["Fight quilboars."] =
        "Combats des hurans.",
    ["Look for little brown pinecones."] =
        "Cherche des petites pommes de pin brunes.",
    ["Hunt the black-feathered birds."] =
        "Chasse les oiseaux aux plumes noires.",
    ["Look for gray slabs of stone lying flat."] =
        "Cherche des dalles de pierre grises posées à plat.",
    ["Do not trail after the wolf."] =
        "Ne suis pas le loup.",
    ["Take the lift to the top of Thunder Bluff"] =
        "Prends l'ascenseur jusqu'en haut des Pitons-du-Tonnerre",
    ["Beside the forge."] =
        "À côté de la forge.",
    ["Take a lift down out of Thunder Bluff"] =
        "Descends en ascenseur pour quitter les Pitons-du-Tonnerre",
    ["Aim the item at one Adult Plainstrider."] =
        "Vise un trotteur des plaines adulte avec l'objet.",
    ["Target a Prairie Stalker with it."] =
        "Cible un Prairie Stalker avec.",
    ["Use the item on any Swoop."] =
        "Utilise l'objet sur n'importe quel Swoop.",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "Choisis un animal de niveau 9-10 et fais-en ton familier avec le sort Apprivoiser une bête.",
    ["This pet is temporary; a lasting one comes shortly."] =
        "Ce familier est temporaire ; un familier durable arrive bientôt.",
    ["Flight master at Camp Taurajo"] =
        "Maître de vol du camp Taurajo",
    ["Fly to Thunder Bluff"] =
        "Vole jusqu'aux Pitons-du-Tonnerre",
    ["Stick to the road and stay alert."] =
        "Reste sur la route et sois sur tes gardes.",
    ["Flight master at the Crossroads"] =
        "Maître de vol de la Croisée",
    ["This is food for your pet."] =
        "C'est de la nourriture pour ton familier.",
    ["A spirit shows up after this."] =
        "Un esprit apparaît ensuite.",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "Trouve un Venomtail Scorpid et lance Apprivoiser une bête dessus.",
    ["Release your current pet before this."] =
        "Libère d'abord ton familier actuel.",
    ["Here you tame a pet to keep."] =
        "Ici, tu apprivoises un familier à garder.",
    ["The NPC waits at the mountain's summit."] =
        "Le PNJ attend au sommet de la montagne.",
    ["Kill Water Seekers and Thornweavers."] =
        "Tue des chercheurs d'eau et des tisseurs d'épines.",
    ["The objective is at the far end."] =
        "L'objectif est tout au fond.",
    ["Receive Sapta Sight"] =
        "Reçois Sapta Sight",
    ["The quest giver stands among the boulders."] =
        "Le donneur de quête se tient parmi les rochers.",
    ["This NPC is found down in the Cleft of Shadow."] =
        "Ce PNJ se trouve en bas, dans la Faille de l'ombre.",
    ["This clears the quest's time limit."] =
        "Ça supprime la limite de temps de la quête.",
    ["Fly to Undercity"] =
        "Vole jusqu'à Fossoyeuse",
    ["Orc and Troll start"] =
        "Départ orc et troll",
    ["Stay out of the cave when you can."] =
        "Reste hors de la grotte quand tu peux.",
    ["The following step is out of the cave."] =
        "L'étape suivante est hors de la grotte.",
    ["Look for a dark-shelled scorpion."] =
        "Cherche un scorpion à carapace sombre.",
    ["Target Lazy Peons with the item."] =
        "Utilise l'objet sur les péons paresseux.",
    ["The targets are dozing orcs."] =
        "Les cibles sont des orcs assoupis.",
    ["Look for cacti bearing red fruit."] =
        "Cherche des cactus portant des fruits rouges.",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "Soigne le grunt Kor'ja avec le rang 2 de Soins inférieurs.",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "Renforce le grunt Kor'ja avec Mot de pouvoir : Robustesse.",
    ["Aim the item at one Dire Mottled Boar."] =
        "Vise un Dire Mottled Boar avec l'objet.",
    ["Use it on any Surf Crawler."] =
        "Utilise-le sur n'importe quel Surf Crawler.",
    ["Use it on any Armored Scorpid."] =
        "Utilise-le sur n'importe quel Armored Scorpid.",
    ["This leads to a quest for later levels."] =
        "Ça mène à une quête de plus haut niveau.",
    ["Escort Deathstalker Erland and keep him alive."] =
        "Escorte le nécrotraqueur Erland et garde-le en vie.",
    ["Hunt the wolves whose fur is jet black."] =
        "Chasse les loups au pelage noir de jais.",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "Choisis un Ferocious Grizzled Bear et apprivoise-le avec Apprivoiser une bête.",
    ["Fly to The Sepulcher"] =
        "Vole jusqu'au Sépulcre",
    ["He has three ghouls at his side."] =
        "Il a trois goules à ses côtés.",
    ["Hold off until one steps out, then slay it."] =
        "Attends qu'il en sorte un, puis tue-le.",
    ["The target shows up here sooner or later."] =
        "La cible finit par apparaître ici.",
    ["The NPC is on Undercity's upper level."] =
        "Le PNJ est au niveau supérieur de Fossoyeuse.",
    ["The NPC is in a little cave."] =
        "Le PNJ est dans une petite grotte.",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "Le PNJ est après la grande salle des troggs, sur sa droite.",
    ["The quest giver waits in the tent."] =
        "Le donneur de quête attend dans la tente.",
    ["Move on if it is absent."] =
        "S'il n'est pas là, passe à la suite.",
    ["If it isn't there, hold on until it shows up."] =
        "S'il n'est pas là, attends qu'il apparaisse.",
    ["Circle the mountain by its northern flank."] =
        "Contourne la montagne par son flanc nord.",
    ["The target is a troll."] =
        "La cible est un troll.",
    ["The target is a human in a crimson long coat."] =
        "La cible est un humain en long manteau cramoisi.",
    ["The targets are the striped zhevras."] =
        "Les cibles sont les zhévras rayés.",
    ["Go into the water beside the rock that bubbles."] =
        "Entre dans l'eau à côté du rocher qui bouillonne.",
    ["Look for big blue fungi."] =
        "Cherche de gros champignons bleus.",
    ["Up to two foes might jump you."] =
        "Jusqu'à deux ennemis peuvent te tomber dessus.",
    ["Kill the purple raptors."] =
        "Tue les raptors violets.",
    ["Targets are found across the entire Barrens."] =
        "Les cibles se trouvent partout dans les Tarides.",
    ["Slay any you come across along the way."] =
        "Tue tous ceux que tu croises en chemin.",
    ["With the coming hand-ins, this gets you to level 18."] =
        "Avec les prochains rendus de quête, tu passes niveau 18.",
    ["Steal from Gamon using Pick Pocket."] =
        "Vole Gamon avec Vol à la tire.",
    ["Use it on Tazan's Satchel."] =
        "Utilise-le sur la sacoche de Tazan.",
    ["The item is already in your inventory."] =
        "L'objet est déjà dans ton inventaire.",
    ["Check the upper and lower tiers of the structure."] =
        "Regarde aux niveaux supérieur et inférieur de la structure.",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "Escorte le déchiqueteur de Wizzlecrank et garde-le intact.",
    ["Look for gray steel pails."] =
        "Cherche des seaux en acier gris.",
    ["The target is a pale lion."] =
        "La cible est un lion pâle.",
    ["It turns up in the area."] =
        "Il apparaît dans le coin.",
    ["Keep away from Sister Rathtalon."] =
        "Tiens-toi loin de sœur Rathtalon.",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "La cible est une harpie au plumage émeraude ; attention, elle est élite.",
    ["The target circles in the air, so search around."] =
        "La cible tourne dans les airs, cherche autour.",
    ["A small chest made of wood."] =
        "Un petit coffre en bois.",
    ["Polly is the target for the item."] =
        "Polly est la cible de l'objet.",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "Vaincs les ennemis kolkar autour de l'oasis Stagnante.",
    ["Sooner or later a yell shows up in the chat window."] =
        "Tôt ou tard, un cri apparaît dans la fenêtre de discussion.",
    ["Watch for his yell: I am summoned!"] =
        "Guette son cri, qui annonce qu'il est invoqué.",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "Verog arrive après un cri qui défie les intrus de venir mourir dans sa tente.",
    ["Escort Kaya Flathoof and keep her safe."] =
        "Escorte Kaya Flathoof et protège-la.",
    ["Close to the finish, 3 foes ambush you together."] =
        "Près de la fin, 3 ennemis te tendent une embuscade ensemble.",
    ["Fly to Sun Rock Retreat"] =
        "Vole jusqu'à la retraite de Roche-Soleil",
    ["Gather the big, white eggs."] =
        "Ramasse les gros œufs blancs.",
    ["Monsters might jump you here."] =
        "Des monstres peuvent te tomber dessus ici.",
    ["Hatchling spiders may bring a level 22 spider."] =
        "Les bébés araignées peuvent attirer une araignée de niveau 22.",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "Avec les prochains rendus de quête, tu passes niveau 20.",
    ["Look for a kodo with grey hide."] =
        "Cherche un kodo à la peau grise.",
    ["The targets are big pink lizards."] =
        "Les cibles sont de gros lézards roses.",
    ["The targets are under the water and along the shore."] =
        "Les cibles sont sous l'eau et le long du rivage.",
    ["The target is a raptor."] =
        "La cible est un raptor.",
    ["Trade your Blood Shards to gain buffs."] =
        "Échange tes éclats de sang contre des bonus.",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "Pendant tes quêtes dans les Tarides, échange-lui tes éclats de sang en trop.",
    ["Ask him for the Spirit of the Wind buff"] =
        "Demande-lui le bonus Spirit of the Wind",
    ["Hunt the winged serpents."] =
        "Chasse les serpents ailés.",
    ["Take the lift up into Thunder Bluff"] =
        "Monte en ascenseur jusqu'aux Pitons-du-Tonnerre",
    ["The object is a vase woven from wicker."] =
        "L'objet est un vase en osier tressé.",
    ["They appear in scattered spots."] =
        "Ils apparaissent à des endroits épars.",
    ["Climb the mountainside"] =
        "Grimpe le flanc de la montagne",
    ["Descend the slope"] =
        "Descends la pente",
    ["Drop with care onto the rock, then go into the cave"] =
        "Saute prudemment sur le rocher, puis entre dans la grotte",
    ["The targets are oozes."] =
        "Les cibles sont des limons.",
    ["Look for little green shrubs bearing violet blooms."] =
        "Cherche des petits arbustes verts à fleurs violettes.",
    ["A centaur flanked by two bodyguards."] =
        "Un centaure flanqué de deux gardes du corps.",
    ["Climb the trail and cross the peaks"] =
        "Monte le chemin et traverse les sommets",
    ["Look for a robot shaped like a person."] =
        "Cherche un robot de forme humaine.",
    ["The target appears right here."] =
        "La cible apparaît juste ici.",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "Prends le passage et suis les lanternes jusqu'à Orneval",
    ["Stay clear of Astranaar."] =
        "Tiens-toi loin d'Astranaar.",
    ["Exit the tunnel into Ashenvale"] =
        "Sors du tunnel vers Orneval",
    ["Flight master at Zoram'gar Outpost"] =
        "Maître de vol de l'avant-poste de Zoram'gar",
    ["The NPC waits within the hut."] =
        "Le PNJ attend dans la hutte.",
    ["Use it twice on Taskmaster Fizzule."] =
        "Utilise-le deux fois sur Taskmaster Fizzule.",
    ["A short way north of here."] =
        "Un peu au nord d'ici.",
    ["Target Taskmaster Fizzule and salute him."] =
        "Cible Taskmaster Fizzule et salue-le.",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "Fais les poches du contremaître Silixiz avec Vol à la tire.",
    ["Open with Ambush for a bigger hit."] =
        "Ouvre avec Embuscade pour frapper plus fort.",
    ["Lean on Rupture for bonus damage."] =
        "Compte sur Rupture pour des dégâts en plus.",
    ["Eviscerate adds a burst of damage here."] =
        "Éviscération ajoute un pic de dégâts ici.",
    ["The objective is on the terrace above."] =
        "L'objectif est sur la terrasse au-dessus.",
    ["Use Pick Lock to open it."] =
        "Utilise Crochetage pour l'ouvrir.",
    ["Poison crafting needs these."] =
        "Il en faut pour fabriquer des poisons.",
    ["Flight master at Tarren Mill"] =
        "Maître de vol de Moulin-de-Tarren",
    ["Get rid of your Touch of Zanzil."] =
        "Débarrasse-toi du Toucher de Zanzil.",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "Choisis n'importe quel Gray Bear et lance Apprivoiser une bête dessus.",
    ["Go into Durnholde Keep, then over the bridge"] =
        "Entre dans Durnholde Keep, puis traverse le pont",
    ["Look for it bound to the orc's leg."] =
        "Cherche-le attaché à la jambe de l'orc.",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "Avec les prochains rendus de quête, tu passes niveau 23.",
    ["Indoors or out in the open fields."] =
        "À l'intérieur ou dehors, dans les champs.",
    ["It may be found outdoors too."] =
        "On peut aussi le trouver dehors.",
    ["The NPC is a little wolf."] =
        "Le PNJ est un petit loup.",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "Il devient fou furieux et t'attaque une fois la quête rendue.",
    ["A woman holding a pitchfork."] =
        "Une femme qui tient une fourche.",
    ["The target patrols the trail between the houses."] =
        "La cible patrouille sur le chemin entre les maisons.",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "La cible apparaît en 30.5, 40.6 dans les Contreforts de Hautebrande.",
    ["With the coming hand-ins, this brings you to level 24."] =
        "Avec les prochains rendus de quête, tu passes niveau 24.",
    ["Tougher foes are coming up next."] =
        "Des ennemis plus coriaces arrivent ensuite.",
    ["Some may be in the smithy."] =
        "Certains peuvent être dans la forge.",
    ["The NPC is in the yard where black wolves roam."] =
        "Le PNJ est dans la cour où rôdent des loups noirs.",
    ["Do this once the prisoner is free."] =
        "Fais-le une fois le prisonnier libéré.",
    ["The tome is blue, resting on a bookshelf."] =
        "Le tome est bleu, posé sur une étagère.",
    ["Look in the room where Fenrus is."] =
        "Cherche dans la salle de Fenrus.",
    ["The target is a dinosaur with blue hide."] =
        "La cible est un dinosaure à la peau bleue.",
    ["Look for big boulders oozing green fluid."] =
        "Cherche de gros rochers qui suintent un liquide vert.",
    ["The target is a quilboar robed in red."] =
        "La cible est un huran en robe rouge.",
    ["Kill Stalkers and Pathfinders."] =
        "Tue des traqueurs et des éclaireurs.",
    ["The target is a red winged serpent."] =
        "La cible est un serpent ailé rouge.",
    ["The target roams; check the area."] =
        "La cible se déplace ; fouille le coin.",
    ["Keep some range when you use the item."] =
        "Garde tes distances quand tu utilises l'objet.",
    ["With the coming hand-ins, this gets you to level 25."] =
        "Avec les prochains rendus de quête, tu passes niveau 25.",
    ["Fly to Brackenwall Village"] =
        "Vole jusqu'au village de Mur-de-Fougères",
    ["The target is an aquatic dinosaur."] =
        "La cible est un dinosaure aquatique.",
    ["The target roams through the water."] =
        "La cible se déplace dans l'eau.",
    ["The target is beneath the platform."] =
        "La cible est sous la plateforme.",
    ["The target stands atop the timber platform."] =
        "La cible se tient sur la plateforme en bois.",
    ["Exit Windshear Crag"] =
        "Quitte Windshear Crag",
    ["The targets are deer."] =
        "Les cibles sont des cerfs.",
    ["The targets are tiny blue dragons."] =
        "Les cibles sont de minuscules dragons bleus.",
    ["Hunt the green slimes."] =
        "Chasse les limons verts.",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "Les Corrosive Sap Beasts partagent les mêmes points d'apparition.",
    ["Do not engage Sentinel Amarassan."] =
        "N'attaque pas la sentinelle Amarassan.",
    ["The quarry is a kaldorei elite, level 27."] =
        "La proie est un élite kaldorei, niveau 27.",
    ["Exit Stonetalon Peak"] =
        "Quitte le pic des Serres-Rocheuses",
    ["Look for brown pinecones on the ground."] =
        "Cherche des pommes de pin brunes au sol.",
    ["Steer clear of the elite windstrider."] =
        "Évite le Windstrider élite.",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "Les basilics et les arbres mouvants partagent ces points d'apparition.",
    ["Monsters are found throughout the Charred Vale."] =
        "Les monstres sont partout dans le Charred Vale.",
    ["Take the trail toward Sun Rock Retreat"] =
        "Prends le chemin vers la retraite de Roche-Soleil",
    ["Stay on the trail until the Charred Vale"] =
        "Reste sur le chemin jusqu'au Charred Vale",
    ["The NPC is on the tower's middle floor."] =
        "Le PNJ est à l'étage du milieu de la tour.",
    ["Flight master at Splintertree Post"] =
        "Maître de vol du poste de Bois-Brisé",
    ["The targets are night elves hiding in stealth."] =
        "Les cibles sont des elfes de la nuit camouflés.",
    ["Track Hidden makes them simpler to spot."] =
        "Pister les camouflés les rend plus faciles à repérer.",
    ["Escort Torek and guard him."] =
        "Escorte Torek et protège-le.",
    ["Don't let him die."] =
        "Ne le laisse pas mourir.",
    ["Take the riverside trail, then climb this trail"] =
        "Prends le chemin au bord de la rivière, puis monte ce chemin",
    ["The target is a panther with black fur."] =
        "La cible est une panthère au pelage noir.",
    ["The target roams a wide route."] =
        "La cible fait une grande ronde.",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "La cible apparaît près de 62.4, 50.0 à Orneval.",
    ["Take the trail north into Thistlefur Hold"] =
        "Prends le chemin vers le nord jusqu'à Thistlefur Hold",
    ["Search the brown crates built of timber."] =
        "Fouille les caisses brunes en bois.",
    ["Mostly on the cavern's upper level."] =
        "Surtout au niveau supérieur de la caverne.",
    ["The NPC is on the cave's lowest level."] =
        "Le PNJ est au niveau le plus bas de la grotte.",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "Escorte Ruul Snowhoof et garde-le en vie.",
    ["Look for a gray druid-style bear."] =
        "Cherche un ours gris façon druide.",
    ["The target is a watery being tinted a deeper green."] =
        "La cible est un être d'eau d'un vert plus foncé.",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "Avec les prochains rendus de quête, tu passes niveau 28.",
    ["Steer away from Silverwind Refuge."] =
        "Évite Silverwind Refuge.",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "Monte le chemin, puis reviens par la route au poste de Bois-Brisé",
    ["Escort Muglash and keep him safe."] =
        "Escorte Muglash et protège-le.",
    ["If the item isn't usable yet, hold on a moment."] =
        "Si l'objet n'est pas encore utilisable, attends un moment.",
    ["Go into the Blackfathom Deeps instance"] =
        "Entre dans l'instance des profondeurs de Brassenoire",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "Dans les profondeurs de Brassenoire, les nagas le font tomber.",
    ["The targets are all over the tunnels."] =
        "Les cibles sont partout dans les tunnels.",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "Ramasse les éclats azur sur les parois de la caverne, dans les profondeurs de Brassenoire.",
    ["Head to the Moonshrine Ruins for this."] =
        "Va aux Moonshrine Ruins pour ça.",
    ["Head back to Splintertree Post"] =
        "Retourne au poste de Bois-Brisé",
    ["Your quarry is a huge azure bird of level 31."] =
        "Ta proie est un énorme oiseau azur de niveau 31.",
    ["The target circles over a wide area."] =
        "La cible tourne sur une grande zone.",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "Il apparaît près de 78.0, 66.0 à Orneval.",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "Descends en ascenseur dans Mille pointes, suis la route vers le poste de Librevent, puis remonte en ascenseur",
    ["Fly to Freewind Post"] =
        "Vole jusqu'au poste de Librevent",
    ["A pair of level 30 foes stand guard over it."] =
        "Deux ennemis de niveau 30 le gardent.",
    ["Use the teleporter to reach the Plateau"] =
        "Utilise le téléporteur pour rejoindre le plateau",
    ["Go back to Dorn Plainstalker"] =
        "Retourne voir Dorn Plainstalker",
    ["This won't kill you."] =
        "Ça ne te tuera pas.",
    ["Kill Surveyors and Diggers."] =
        "Tue des arpenteurs et des creuseurs.",
    ["Take the lift upward"] =
        "Monte en ascenseur",
    ["Look for big eggs."] =
        "Cherche de gros œufs.",
    ["Keep away from Heartrazor."] =
        "Tiens-toi loin de Heartrazor.",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap est une hyène brune escortée de 2 hyènes.",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "La cible apparaît près de 17.3, 22.2 dans Mille pointes.",
    ["The target is a centaur, black in color."] =
        "La cible est un centaure noir.",
    ["It roams a wide route."] =
        "Il fait une grande ronde.",
    ["Leave it out if you'd rather not hunt for it."] =
        "Laisse tomber si tu ne veux pas le chercher.",
    ["His patrol crosses this spot two times."] =
        "Sa patrouille passe deux fois par ici.",
    ["Expect three foes to strike."] =
        "Attends-toi à trois ennemis.",
    ["Fight off the foes that come at you"] =
        "Repousse les ennemis qui t'attaquent",
    ["Look for thorny plants."] =
        "Cherche des plantes épineuses.",
    ["Hard quests are coming up."] =
        "Des quêtes difficiles arrivent.",
    ["Climb the trail and cross the rope bridges"] =
        "Monte le chemin et traverse les ponts de corde",
    ["The objective lies atop the mesa."] =
        "L'objectif est au sommet de la mesa.",
    ["The target is a level 28 elite."] =
        "La cible est un élite de niveau 28.",
    ["You can defeat it alone without much trouble."] =
        "Tu peux le vaincre seul sans trop de mal.",
    ["Escort Lakota Windsong safely to the end."] =
        "Escorte Lakota Windsong sans encombre jusqu'au bout.",
    ["On every plateau, a pair of foes spawns."] =
        "Sur chaque plateau, deux ennemis apparaissent.",
    ["Be ready: this opponent is an elite at level 30."] =
        "Sois prêt : cet adversaire est un élite de niveau 30.",
    ["Leave it if it proves too hard."] =
        "Laisse tomber si c'est trop dur.",
    ["Climb the road into Feralas"] =
        "Monte la route jusqu'à Féralas",
    ["Should you die, come back to life at Camp Mojache."] =
        "Si tu meurs, ressuscite au camp Mojache.",
    ["Fly to Camp Mojache"] =
        "Vole jusqu'au camp Mojache",
    ["Get Water Sapta done as well."] =
        "Termine aussi Water Sapta.",
    ["You'll need this to pick up an upcoming quest."] =
        "Il te le faut pour prendre une prochaine quête.",
    ["Leap up and take the trail behind that tree"] =
        "Saute et prends le chemin derrière cet arbre",
    ["Head north along the river to reach the NPC."] =
        "Remonte la rivière vers le nord pour rejoindre le PNJ.",
    ["Draw foes one at a time if you can."] =
        "Attire les ennemis un par un si tu peux.",
    ["Do not take on the whole group together."] =
        "N'affronte pas tout le groupe d'un coup.",
    ["Descend the ramp, then stay on the trail"] =
        "Descends la rampe, puis reste sur le chemin",
    ["Climb the trail to the cave's highest level"] =
        "Monte le chemin jusqu'au niveau le plus haut de la grotte",
    ["When nearly dead, it calls two guards."] =
        "Presque mort, il appelle deux gardes.",
    ["Warden Belamoore stands guard over it."] =
        "Warden Belamoore le garde.",
    ["The target is a mage of level 36."] =
        "La cible est un mage de niveau 36.",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "Combats Kegan en coupant sa ligne de vue avec les portes et les escaliers.",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "Quand les Shield Guards brillent, arrête de les frapper au corps à corps.",
    ["Expect heavy damage from it."] =
        "Attends-toi à de gros dégâts.",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "Avec les prochains rendus de quête, tu passes niveau 32.",
    ["Gather the big fungi."] =
        "Ramasse les gros champignons.",
    ["The targets are out in front of the cavern."] =
        "Les cibles sont devant la caverne.",
    ["Flight master at Hammerfall"] =
        "Maître de vol de Trépas-d'Orgrim",
    ["Stay away from Refuge Pointe."] =
        "Tiens-toi loin du Refuge de l'Ornière.",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "Avec les prochains rendus de quête, tu passes niveau 33.",
    ["Head out of the Apothecarium"] =
        "Sors de l'Apothicarium",
    ["Hive Drones compete for these spawn points."] =
        "Les Hive Drones partagent ces points d'apparition.",
    ["The NPC is on the building's ground level."] =
        "Le PNJ est au rez-de-chaussée du bâtiment.",
    ["The quest giver is in the Dormitory."] =
        "Le donneur de quête est dans le dortoir.",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "Escorte Kernobee jusqu'au portail à l'entrée du donjon.",
    ["Open the gray chest built of metal."] =
        "Ouvre le coffre gris en métal.",
    ["Close to the north wall."] =
        "Près du mur nord.",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "Il est dans la même salle que Mekgineer Thermaplugg.",
    ["Plan on killing monsters for quite some time."] =
        "Prévois de tuer des monstres un bon moment.",
    ["Other satyrs use the same spawn points."] =
        "D'autres satyres partagent les mêmes points d'apparition.",
    ["Take the trail toward Shadowprey Village"] =
        "Prends le chemin vers le village de Proie-de-l'Ombre",
    ["Fly to Shadowprey Village"] =
        "Vole jusqu'au village de Proie-de-l'Ombre",
    ["Defeat every foe in this chamber before starting."] =
        "Élimine tous les ennemis de cette salle avant de commencer.",
    ["Target Burning Blade foes with the item."] =
        "Utilise l'objet sur les ennemis de la Lame ardente.",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "Attends que l'ennemi soit bien blessé, puis utilise-le.",
    ["Look for big white clams."] =
        "Cherche de grosses palourdes blanches.",
    ["Flight master at Grom'gol"] =
        "Maître de vol de Grom'gol",
    ["They appear in the same spots as the panthers."] =
        "Ils apparaissent aux mêmes endroits que les panthères.",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "Attention aux Shadowmaw Panthers ; elles sont camouflées.",
    ["Tigers compete for the same spawn points."] =
        "Les tigres partagent les mêmes points d'apparition.",
    ["The NPC is on the building's lowest floor"] =
        "Le PNJ est à l'étage le plus bas du bâtiment",
    ["Climb the steps"] =
        "Monte les marches",
    ["You won't find an ammunition seller."] =
        "Tu ne trouveras pas de vendeur de munitions.",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "Protège \"Stinky\" Ignatz pendant que tu l'escortes.",
    ["Hunt the orange spiders."] =
        "Chasse les araignées orange.",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "Attention : les Darkfang Lurkers sont camouflés.",
    ["Escort Ogron, guarding him from attackers."] =
        "Escorte Ogron en le protégeant des attaques.",
    ["Keep out of Theramore Isle."] =
        "N'entre pas sur l'île de Theramore.",
    ["Let yourself drown for a quick trip."] =
        "Laisse-toi noyer pour un trajet rapide.",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "Garde-le : la suite de quêtes de guerrier de l'arme Tourbillon le demande.",
    ["Alterac and Arathi"] =
        "Alterac et Arathi",
    ["Get ready to take down an elite of level 40 shortly."] =
        "Prépare-toi à abattre bientôt un élite de niveau 40.",
    ["Quaff one potion right away so it is ready again later."] =
        "Bois une potion tout de suite pour qu'elle soit de nouveau prête plus tard.",
    ["It wanders to the mouth of the cave."] =
        "Il erre jusqu'à l'entrée de la grotte.",
    ["Look on the upper floor as well."] =
        "Regarde aussi à l'étage.",
    ["Climb the slope, then leap the wall"] =
        "Monte la pente, puis saute le mur",
    ["Fly to Kargath"] =
        "Vole jusqu'à Kargath",
    ["Stranglethorn and Swamp of Sorrows"] =
        "Strangleronce et Marais des Chagrins",
    ["Go along the shore, then climb the trail"] =
        "Longe le rivage, puis monte le chemin",
    ["Keep clear of Darkshire."] =
        "Tiens-toi loin de Sombre-Comté.",
    ["Flight master at Stonard"] =
        "Maître de vol de Pierrêche",
    ["Look for assorted little brown items."] =
        "Cherche divers petits objets bruns.",
    ["Look for purple rings made of rock."] =
        "Cherche des cercles de pierre violets.",
    ["A guardian shows up."] =
        "Un gardien apparaît.",
    ["Stay clear of Lord Azrethoc."] =
        "Tiens-toi loin du seigneur Azrethoc.",
    ["An elite winged fiend of level 40 with brown hide."] =
        "Un démon ailé élite de niveau 40 à la peau brune.",
    ["The target wanders close by; look around."] =
        "La cible erre tout près ; regarde autour.",
    ["You can handle this alone without much trouble."] =
        "Tu peux t'en charger seul sans trop de mal.",
    ["A tougher foe is coming up."] =
        "Un ennemi plus coriace arrive.",
    ["Grab the loot."] =
        "Ramasse le butin.",
    ["The target is a crocodile with white scales."] =
        "La cible est un crocodile aux écailles blanches.",
    ["The target roams a wide loop through the water."] =
        "La cible fait une grande boucle dans l'eau.",
    ["Accepting this starts a 2 hour countdown."] =
        "Accepter cette quête lance un compte à rebours de 2 heures.",
    ["The timer keeps running while you're offline."] =
        "Le chrono continue même quand tu es déconnecté.",
    ["Take this quest only when you have time to spare."] =
        "Ne prends cette quête que si tu as du temps devant toi.",
    ["Watch out for a pair of stronger monsters here."] =
        "Attention à deux monstres plus forts ici.",
    ["Look for the NPC dressed in red armor."] =
        "Cherche le PNJ en armure rouge.",
    ["Climb the trail to Gordunni Outpost"] =
        "Monte le chemin jusqu'à l'avant-poste gordunni",
    ["Beside the shining blue rings on the ground."] =
        "À côté des cercles bleus brillants au sol.",
    ["Look for earth mounds that pop up."] =
        "Cherche les tas de terre qui apparaissent.",
    ["Ones holding the quest item shine blue."] =
        "Ceux qui contiennent l'objet de quête brillent en bleu.",
    ["Fight the tauren."] =
        "Combats les taurens.",
    ["The target is a winged green bug, level 47."] =
        "La cible est un insecte vert ailé, niveau 47.",
    ["You can likely beat it at your current level."] =
        "Tu peux sans doute le battre à ton niveau actuel.",
    ["Kill bugs."] =
        "Tue des insectes.",
    ["Extra targets lurk in the bug caverns."] =
        "D'autres cibles rôdent dans les cavernes des insectes.",
    ["Stay on the road"] =
        "Reste sur la route",
    ["The targets are ghosts that materialize."] =
        "Les cibles sont des fantômes qui apparaissent.",
    ["No drops come from Stagwings and Skystormers."] =
        "Les Stagwings et les Skystormers ne le font pas tomber.",
    ["Saves you some monster farming afterward."] =
        "Ça t'évite de tuer des monstres plus tard.",
    ["You need Chapter I as well as Chapter II."] =
        "Il te faut le Chapitre I et le Chapitre II.",
    ["It doesn't show up often."] =
        "Il n'apparaît pas souvent.",
    ["The NPC waits on the house's upper-floor terrace."] =
        "Le PNJ attend sur la terrasse à l'étage de la maison.",
    ["Take the road until the trail starts"] =
        "Suis la route jusqu'au début du chemin",
    ["Circle the mountain on the trail, then climb it"] =
        "Contourne la montagne par le chemin, puis monte-le",
    ["Kill the crocodiles."] =
        "Tue les crocodiles.",
    ["Stay out of Swamp Talker's way."] =
        "Ne croise pas la route de Swamp Talker.",
    ["Hunt down the gray murloc; it is level 50."] =
        "Traque le murloc gris ; il est niveau 50.",
    ["Tanaris and Dustwallow"] =
        "Tanaris et Âprefange",
    ["Watch out for foes hidden in stealth."] =
        "Attention aux ennemis camouflés.",
    ["Look for brown eggs covered in spikes."] =
        "Cherche des œufs bruns couverts de piquants.",
    ["Buy plenty of arrows or bullets."] =
        "Achète beaucoup de flèches ou de balles.",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "Fais le plein avant : personne dans les Hinterlands ne vend de flèches ni de balles de niveau 40.",
    ["Take the road that circles the peak, then descend the trail"] =
        "Prends la route qui contourne le pic, puis descends le chemin",
    ["Flight master at Revantusk Village"] =
        "Maître de vol du village de Vengebroche",
    ["A trio of enemies attacks."] =
        "Trois ennemis attaquent.",
    ["Look for a little silver pail holding tools."] =
        "Cherche un petit seau argenté rempli d'outils.",
    ["The targets are big eagle-like beasts."] =
        "Les cibles sont de grosses bêtes qui ressemblent à des aigles.",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "Les loups et les chouettards utilisent aussi ces points d'apparition.",
    ["Look for crates made of wood."] =
        "Cherche des caisses en bois.",
    ["The targets are wolves hidden in stealth."] =
        "Les cibles sont des loups camouflés.",
    ["Steer clear of hostile Alliance NPCs."] =
        "Évite les PNJ hostiles de l'Alliance.",
    ["Warning: this turns on your PvP flag."] =
        "Attention : ça active ton marquage JcJ.",
    ["Head into Shadra'Alor"] =
        "Entre dans Shadra'Alor",
    ["Get out of Shadra'Alor"] =
        "Sors de Shadra'Alor",
    ["Feralas and Un'Goro"] =
        "Féralas et Un'Goro",
    ["The targets are hippogryphs."] =
        "Les cibles sont des hippogriffes.",
    ["Use it on the stone giant foes."] =
        "Utilise-le sur les géants de pierre ennemis.",
    ["You have 2 hours before it disappears."] =
        "Tu as 2 heures avant qu'il disparaisse.",
    ["Watch out: this foe is a level 50 elite."] =
        "Attention : cet ennemi est un élite de niveau 50.",
    ["You can likely do it alone."] =
        "Tu peux sans doute le faire seul.",
    ["The NPC turns hostile and fights you."] =
        "Le PNJ devient hostile et te combat.",
    ["The target yields at roughly 30% health."] =
        "La cible se rend vers 30% de vie.",
    ["The NPC roams the trail close to Kargath."] =
        "Le PNJ arpente le chemin près de Kargath.",
    ["The NPC gives the quest only while at this spot."] =
        "Le PNJ ne donne la quête qu'à cet endroit.",
    ["If the NPC is away, stay until he comes back."] =
        "Si le PNJ n'est pas là, attends qu'il revienne.",
    ["Burning Steppes and Azshara"] =
        "Steppes ardentes et Azshara",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "Traverse le mont Rochenoire jusqu'aux Steppes ardentes",
    ["Fly to Flame Crest"] =
        "Vole jusqu'à la Corniche des flammes",
    ["It lies atop a stone slab."] =
        "Il est posé sur une dalle de pierre.",
    ["The following quest needs you at level 52."] =
        "La quête suivante demande le niveau 52.",
    ["Ammunition can't be bought here."] =
        "On ne peut pas acheter de munitions ici.",
    ["Flight master at Valormok"] =
        "Maître de vol de Valormok",
    ["Look for a rectangular slab etched with green glyphs."] =
        "Cherche une dalle rectangulaire gravée de glyphes verts.",
    ["Look for an oblong slab carved with pink glyphs."] =
        "Cherche une dalle oblongue gravée de glyphes roses.",
    ["A rectangular slab carved with blue glyphs."] =
        "Une dalle rectangulaire gravée de glyphes bleus.",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "Cherche une dalle de pierre sculptée portant des glyphes dorés.",
    ["The NPC is in the tower, which has several floors."] =
        "Le PNJ est dans la tour, qui a plusieurs étages.",
    ["Felwood and Winterspring"] =
        "Gangrebois et Berceau-de-l'Hiver",
    ["Walk west beside the river"] =
        "Marche vers l'ouest le long de la rivière",
    ["Fly to Bloodvenom Post"] =
        "Vole jusqu'au poste de la Vénéneuse",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "Avec les prochains rendus de quête, tu passes niveau 53.",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "Garde-le pour une tâche plus tard dans le cratère d'Un'Goro.",
    ["Get onto the massive incline."] =
        "Monte sur l'immense pente.",
    ["Watch out for elite foes here."] =
        "Attention aux ennemis élites ici.",
    ["Flee afterward."] =
        "Fuis ensuite.",
    ["More than one crystal might be required."] =
        "Il faudra peut-être plus d'un cristal.",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "La cible appelle le magus Rimtori quand elle est gravement blessée.",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "Un félin vert, un Corrupted Saber, apparaît quand tu l'utilises.",
    ["Hold on until it begins to trail you."] =
        "Attends qu'il commence à te suivre.",
    ["The kitten is the green cat beside you."] =
        "Le chaton est le félin vert à côté de toi.",
    ["Look beside Winna Hazzard."] =
        "Regarde à côté de Winna Hazzard.",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "Traque une tortue élite de niveau 48 à la carapace azur.",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "Le PNJ porte une chemise pâle et une lampe.",
    ["Elite human foes walk patrols here; stay clear."] =
        "Des humains élites patrouillent ici ; tiens-toi à l'écart.",
    ["The NPC hides beneath the staircase."] =
        "Le PNJ se cache sous l'escalier.",
    ["You can also take it out of your bank."] =
        "Tu peux aussi le retirer de ta banque.",
    ["The target is a ghoul armed with a hayfork."] =
        "La cible est une goule armée d'une fourche.",
    ["It can appear at this spot."] =
        "Il peut apparaître à cet endroit.",
    ["One last lengthy stretch of monster farming."] =
        "Une dernière longue séance de chasse aux monstres.",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "Garde-le : une tâche au cratère d'Un'Goro en aura besoin plus tard.",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "On rejoint Dalaran par le portail skyborne.",
    ["Take the Skyborne portal to Stormwind"] =
        "Prends le portail skyborne vers Hurlevent",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "Sac de couchage douillet",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "Une piste d'indices sur les deux continents, ouverte dès le niveau 14, qui mène à un sac de couchage valant jusqu'à 3 % d'expérience en plus : aucun combat, seulement des objets à cliquer.",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "Marche de l'Ouest, à l'ouest de la colline des Sentinelles : les restes calcinés à côté de la charrette détruite.",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "Les Tarides, au bord de la route au sud du camp Taurajo : les restes calcinés au pied de la tour brûlée.",
    ["Horde land: stay clear of the guards."] =
        "Terres de la Horde : évite les gardes.",
    ["Alliance land: stay clear of the guards."] =
        "Terres de l'Alliance : évite les gardes.",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "Juste là : l'indice suivant, sur les restes ou sur la planche clouée à côté.",
    ["Path northeast of Sun Rock Retreat"] =
        "Sentier au nord-est de la Retraite de Roche-Soleil",
    ["The camp is up in the hills: follow this path west."] =
        "Le camp est perché dans les collines : suis ce sentier vers l'ouest.",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "Au bout du sentier, dans le camp abandonné : le sac de couchage posé sur une caisse.",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "Facultatif : le bois et l'amadou de cette récompense rallument le feu de camp juste à côté, une petite quête dont le sac n'a pas besoin.",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "En haut de la colline au nord du camp : un tas de terre fraîche.",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "Loch Modan, au sommet du barrage : la figurine d'aigle sur les têtes de pierre sculptées tournées vers les Paluns.",
    ["Cart against Thoradin's Wall"] =
        "Charrette contre le mur de Thoradin",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "Côté Contreforts de Hautebrande : grimpe sur la charrette, puis dans le mur.",
    ["The messenger bag hangs on the outer face of the wall."] =
        "La sacoche de messager pend sur la face extérieure du mur.",
    ["The satchel just below it holds the sleeping bag."] =
        "Le sac juste en dessous contient le sac de couchage.",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "Utilise-le en extérieur et reste dessus sans bouger : chaque minute de sommeil ajoute 1 % d'expérience, jusqu'à 3 %.",
    ["Try the sleeping bag"] =
        "Essaie le sac de couchage",
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "Fouille les bêtes que tu tues en chemin",
    ["Learn First Aid from the trainer"] =
        "Apprends le Secourisme auprès de l'entraîneur",
    ["Learn Blacksmithing from the trainer"] =
        "Apprends la Forge auprès de l'entraîneur",
    ["Learn Mining from the trainer"] =
        "Apprends le Minage auprès de l'entraîneur",
    ["Learn Cooking from the trainer"] =
        "Apprends la Cuisine auprès de l'entraîneur",
    ["Learn Herbalism from the trainer"] =
        "Apprends l'Herboristerie auprès de l'entraîneur",
    ["Learn Thrown at the weapon master"] =
        "Apprends les Armes de jet auprès du maître d'armes",
    ["Learn Staves at the weapon master"] =
        "Apprends les Bâtons auprès du maître d'armes",
    ["Learn Swords at the weapon master"] =
        "Apprends les Épées auprès du maître d'armes",
    ["Learn Maces at the weapon master"] =
        "Apprends les Masses auprès du maître d'armes",
    ["Learn Bows at the weapon master"] =
        "Apprends les Arcs auprès du maître d'armes",
    ["Learn Guns at the weapon master"] =
        "Apprends les Armes à feu auprès du maître d'armes",
    ["Learn Two-Handed Swords at the weapon master"] =
        "Apprends les Épées à deux mains auprès du maître d'armes",
    ["Learn Two-Handed Axes at the weapon master"] =
        "Apprends les Haches à deux mains auprès du maître d'armes",
    ["Learn Two-Handed Maces at the weapon master"] =
        "Apprends les Masses à deux mains auprès du maître d'armes",
    ["Learn Swords and Daggers at the weapon master"] =
        "Apprends les Épées et les Dagues auprès du maître d'armes",
    ["Learn Swords and Staves at the weapon master"] =
        "Apprends les Épées et les Bâtons auprès du maître d'armes",
    ["Learn Bows and Staves at the weapon master"] =
        "Apprends les Arcs et les Bâtons auprès du maître d'armes",
    ["Learn Guns and Maces at the weapon master"] =
        "Apprends les Armes à feu et les Masses auprès du maître d'armes",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "Apprends les Armes à feu et les Haches à deux mains auprès du maître d'armes",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "Apprends les Épées à deux mains et les Bâtons auprès du maître d'armes",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Apprends les Haches à deux mains et les Masses à deux mains auprès du maître d'armes",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "Apprends les Masses à deux mains et les Bâtons auprès du maître d'armes",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "Apprends les Arbalètes et les Épées à deux mains auprès du maître d'armes",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Apprends les Armes à feu, les Haches à deux mains et les Masses à deux mains auprès du maître d'armes",
    ["Tame a pet here"] =
        "Apprivoise un familier ici",
    ["Tame a beast here to learn the next rank of Claw"] =
        "Apprivoise ici une bête pour apprendre le rang suivant de Griffe",
    ["Head to the big cage"] =
        "Rends-toi à la grande cage",
    ["Visit the caged quilboar"] =
        "Va voir le huran en cage",
    ["Go to the corrupted moonwell"] =
        "Va au puits de lune corrompu",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "L'objet est à l'intérieur.",
    ["The object is indoors, one floor up."] =
        "L'objet est à l'intérieur, un étage plus haut.",
    ["The object is on the lower level, indoors."] =
        "L'objet est au niveau inférieur, à l'intérieur.",
    ["The object is on the lower level within the bridge."] =
        "L'objet est au niveau inférieur, à l'intérieur du pont.",
    ["The object is on the highest level of this structure."] =
        "L'objet est au plus haut niveau de ce bâtiment.",
    ["The object is up on the summit."] =
        "L'objet est en haut, au sommet.",
    ["The object sits on the rocky shelf above."] =
        "L'objet est sur la corniche rocheuse au-dessus.",
    ["The target is indoors."] =
        "La cible est à l'intérieur.",
    ["The target is indoors, one floor up."] =
        "La cible est à l'intérieur, un étage plus haut.",
    ["The target is indoors at street level."] =
        "La cible est à l'intérieur, au niveau de la rue.",
    ["The target is indoors, on the central storey."] =
        "La cible est à l'intérieur, à l'étage du milieu.",
    ["The target is on the lower level, indoors."] =
        "La cible est au niveau inférieur, à l'intérieur.",
    ["The target is on the tower's highest floor."] =
        "La cible est au dernier étage de la tour.",
    ["The target is up on the summit."] =
        "La cible est en haut, au sommet.",
    ["The target is down in the Cleft of Shadow."] =
        "La cible est en bas, dans la Faille de l'ombre.",
    ["The target can be indoors or out."] =
        "La cible peut être dedans ou dehors.",
    ["The target patrols a long route; look along it."] =
        "La cible patrouille sur un long trajet : cherche-la tout du long.",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "La cible attend ici, puis s'avance sur la grosse branche toute proche.",
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « La légende de Stalvan » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Livrer le Suc » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Les frères Brassbolts » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Un noble brassage » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Bisque de tortue apaisante » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Nouvelle affectation » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Les pièces détachées de Kravel » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Mécénat gobelin » et « La clé cachée » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Chapitre I » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Chapitre II » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Chapitre III » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Chapitre IV » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « L'épave de Karnitol » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Analyse magique » et « Piégé ! » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Des rumeurs pour Kravel » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Ongeku » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Le trésor englouti » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Retour à Baie-du-Butin » et « La sécurité d'abord » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Le compte rendu à Fizzlebub » et « Le Kocktail Kalimdor de Rhapsody » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Le prêt », « Esprits de Hurleurs », « Le Super-Oeuf-O-Matic » et « Le Kocktail Kalimdor de Rhapsody » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Cristaux de puissance » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « L'histoire de Rhapsody », « Le Preneur d'images FX », « La bibine perdue de Whiskey Slim » et « Dans les faveurs d'Elune ? » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Livraison à MacKinley » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Un appât pour Lar'korwi », « La terre d'Un'Goro », « Visite à Gregan » et « C'est un Secret pour tout le monde » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « L'ascension des silithides » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Un goût de flammes » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « À la poursuite d'A-mi 01 » et « Les runes des arcanes » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Emma la bonne pâte », « Les runes des arcanes » et « L'ingrédient secret de Sprinkle » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Le Cercle de pierres », « Anciens corrompus », « Un grand périple pour une petite gelée », « Les Indomptables lunaires » et « Rendez-vous à la tombe » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Le retour vers Tymor » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Aquementas », « Le rapport de Long-guet », « Le duc Nicholas Zverenhoff » et « Les Esprits troublés de Kel'Theril » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Felnok Steelspring » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « La branche de chêne à glyphes » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « La perturbation cesse » et « Ravitaillement pour la Croisée » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Tonneau vide de Chen » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « La chasse aux œufs » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Souvenirs de morts » et « La bataille d'Hillsbrad » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Gueule-glacée » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « L'essaim s'agrandit » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Martek l'Exilé » et « Hemet Nesingwary » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Piégé ! » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Le Bouclier noir » et « Sur le terrain » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Les échantillons du désert de Tanaris » et « Esprits de Hurleurs » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Retour à Baie-du-Butin » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Mortebourbe » et « La sécurité d'abord » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Encore un message pour les Wildhammer », « Esprits de Hurleurs » et « Le Super-Oeuf-O-Matic » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Retourner voir le sorcier-docteur Uzer'i » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « L'Exilé atal'ai » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Test du récipient » et « Le compte rendu à Fizzlebub » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « De retour vers l'Apothicaire Zinge » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Le Cercle de pierres » et « Cristaux de puissance » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « La livraison de Houle », « La bibine perdue de Whiskey Slim » et « Corruption Suintante » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Fiasco dans la jungle », « Un appât pour Lar'korwi » et « C'est un Secret pour tout le monde » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Livraison à Magatha » et « Corruption Suintante » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Le Paiement de Jes'rimon à Jediga » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Rendez-vous à la tombe » : garde-le à la banque pour libérer une place dans tes sacs.",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Livraison à Andron Gant », « Une situation grave » et « Trahison » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "Tu en auras besoin plus tard pour « Le rapport de Long-guet » et « Le duc Nicholas Zverenhoff » : garde-les à la banque pour libérer de la place dans tes sacs.",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "Tu en auras besoin plus tard pour « Aquementas » : garde-le à la banque pour libérer une place dans tes sacs.",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "Astranaar",
    ["Auberdine"] =
        "Auberdine",
    ["Bloodhoof Village"] =
        "Village de Sabot-de-Sang",
    ["Booty Bay"] =
        "Baie-du-Butin",
    ["Brill"] =
        "Brill",
    ["Camp Mojache"] =
        "Camp Mojache",
    ["Camp Taurajo"] =
        "Camp Taurajo",
    ["Cenarion Hold"] =
        "Fort Cénarien",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "Sombre-Comté",
    ["Deepwater Tavern"] =
        "Port de Menethil",
    ["Dolanaar"] =
        "Dolanaar",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "Long-guet",
    ["Feathermoon Stronghold"] =
        "Bastion de Pennelune",
    ["Freewind Post"] =
        "Poste de Librevent",
    ["Gadgetzan"] =
        "Gadgetzan",
    ["Gallows' End Tavern"] =
        "Brill",
    ["Goldshire"] =
        "Comté-de-l'Or",
    ["Grom'gol"] =
        "Grom'gol",
    ["Hammerfall"] =
        "Trépas-d'Orgrim",
    ["Ironforge"] =
        "Forgefer",
    ["Kargath"] =
        "Kargath",
    ["Kharanos"] =
        "Kharanos",
    ["Lakeshire"] =
        "Comté-du-Lac",
    ["Light's Hope Chapel"] =
        "Chapelle de l'Espoir de Lumière",
    ["Menethil Harbor"] =
        "Port de Menethil",
    ["Nijel's Point"] =
        "Combe de Nijel",
    ["Orgrimmar"] =
        "Orgrimmar",
    ["Ratchet"] =
        "Cabestan",
    ["Razor Hill"] =
        "Tranchecolline",
    ["Revantusk Village"] =
        "Village de Vengebroche",
    ["Sentinel Hill"] =
        "Colline des Sentinelles",
    ["Shadowprey Village"] =
        "Village de Proie-de-l'Ombre",
    ["Southshore"] =
        "Austrivage",
    ["Splintertree Post"] =
        "Poste de Bois-Brisé",
    ["Stonard"] =
        "Pierrêche",
    ["Stonetalon Peak"] =
        "Pic des Serres-Rocheuses",
    ["Stormwind City"] =
        "Hurlevent",
    ["Stoutlager Inn"] =
        "Thelsamar",
    ["Sun Rock Retreat"] =
        "Retraite de Roche-Soleil",
    ["Tarren Mill"] =
        "Moulin-de-Tarren",
    ["The Crossroads"] =
        "La Croisée",
    ["The Sepulcher"] =
        "Le Sépulcre",
    ["Thelsamar"] =
        "Thelsamar",
    ["Theramore"] =
        "Theramore",
    ["Theramore Isle"] =
        "Île de Theramore",
    ["Thunder Bluff"] =
        "Pitons-du-Tonnerre",
    ["Thunderbrew Distillery"] =
        "Kharanos",
    -- Ding! - Class quests (hand-written guides)
    ["Druid quests"] =
        "Quêtes de druide",
    ["At level 10, your trainer teaches Teleport: Moonglade: the quick way to Moonglade and back, used all through this guide."] =
        "Au niveau 10, ton maître t'apprend Téléportation : Reflet-de-Lune, le moyen rapide d'aller à Reflet-de-Lune et d'en revenir, utilisé tout au long de ce guide.",
    ["Denatharion, the druid trainer of the Cenarion Enclave in Darnassus, sends you to Mathrengyl next to him."] =
        "Denatharion, maître des druides de l'Enclave cénarienne à Darnassus, t'envoie voir Mathrengyl, à côté de lui.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave."] =
        "Mathrengyl Bearwalker, à l'étage de l'Enclave cénarienne.",
    ["From level 10: the chain that teaches Bear Form."] =
        "À partir du niveau 10 : la chaîne qui t'apprend Forme d'ours.",
    ["Dendrite Starblaze waits on the upper floor of the great house of Nighthaven."] =
        "Dendrite Starblaze attend à l'étage supérieur de la grande maison de Havrenuit.",
    ["The Great Bear Spirit waits northwest of the village, up the hill path: listen to all it has to say."] =
        "L'Esprit du Grand ours attend au nord-ouest du village, en haut du sentier de la colline : écoute tout ce qu'il a à dire.",
    ["Sindrayl, the hippogryph master south of Nighthaven: take this flight path for your next trips here."] =
        "Sindrayl, maître des hippogryphes au sud de Havrenuit : récupère ce point de vol pour tes prochains trajets ici.",
    ["Lunaclaw's cave, in the hills east of Auberdine"] =
        "La grotte de Lunegriffe, dans les collines à l'est d'Auberdine",
    ["Deep in the cave, use the Cenarion Moondust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "Au fond de la grotte, utilise la Poussière de lune cénarienne près de la pierre des séléniens : Lunegriffe apparaît. Vaincs-la, puis parle à son esprit.",
    ["Turning this in teaches Bear Form."] =
        "Rendre cette quête t'apprend Forme d'ours.",
    ["From level 10: the Skyborne quests of the bear spirit, on Zephras Isle."] =
        "À partir du niveau 10 : les quêtes Skyborne de l'esprit de l'ours, sur l'île de Zephras.",
    ["Alfina Nightgaze, the druid trainer of Dalaran, gives it."] =
        "Alfina Nightgaze, maître des druides de Dalaran, la donne.",
    ["Opens the way to Moonglade, the home of the druids."] =
        "Ouvre la voie vers Reflet-de-Lune, le foyer des druides.",
    ["Sheldras Moontree, the druid trainer of Stormwind, in the park."] =
        "Sheldras Moontree, maître des druides de Hurlevent, dans le parc.",
    ["Five Earthroot will be needed: an herb found along the roads, picked with Herbalism or bought at the auction house."] =
        "Il te faudra cinq Terrestrines : une herbe qui pousse le long des routes, cueillie avec l'Herboristerie ou achetée à l'hôtel des ventes.",
    ["From level 14: the chain that teaches Cure Poison."] =
        "À partir du niveau 14 : la chaîne qui t'apprend Guérison du poison.",
    ["Fill the sampler at the mouth of the Cliffspring Falls cave, northeast of Auberdine."] =
        "Remplis la fiole d'échantillon à l'entrée de la grotte des chutes de la Bondissante, au nord-est d'Auberdine.",
    ["Alanndarian Nightsong, in her house in Auberdine."] =
        "Alanndarian Nightsong, dans sa maison d'Auberdine.",
    ["The Lunar Fungus grows in the small caves of the hills east of Auberdine, near Lunaclaw's."] =
        "Le Champignon lunaire pousse dans les petites grottes des collines à l'est d'Auberdine, près de celle de Lunegriffe.",
    ["Sickly Deer wander the woods of Darkshore: use the salve on them."] =
        "Des Daims malades errent dans les bois de Sombrivage : utilise le remède sur eux.",
    ["Turning this in teaches Cure Poison."] =
        "Rendre cette quête t'apprend Guérison du poison.",
    ["From level 16: the chain that teaches Aquatic Form."] =
        "À partir du niveau 16 : la chaîne qui t'apprend Forme aquatique.",
    ["The Shrine Bauble, a small wicker urn, lies on the bottom of Lake Elune'ara: dive around the shrine."] =
        "Le Colifichet du sanctuaire, une petite urne en osier, repose au fond du lac Elune'ara : plonge autour du sanctuaire.",
    ["Use the bauble at the Shrine of Remulos, by the lake."] =
        "Utilise le colifichet au sanctuaire de Remulos, au bord du lac.",
    ["The first half of the pendant lies under the water off the north of Darkshore."] =
        "La première moitié du pendentif se trouve sous l'eau, au large du nord de Sombrivage.",
    ["The second half lies under the water off the western coast of Westfall."] =
        "La seconde moitié se trouve sous l'eau, au large de la côte ouest de la Marche de l'Ouest.",
    ["Back at the Shrine of Remulos: use a half pendant there to make it whole."] =
        "De retour au sanctuaire de Remulos : utilise une moitié de pendentif sur place pour le reconstituer.",
    ["Turning this in teaches Aquatic Form."] =
        "Rendre cette quête t'apprend Forme aquatique.",
    ["Night Elves get it from Mathrengyl Bearwalker in Darnassus."] =
        "Les elfes de la nuit la reçoivent de Mathrengyl Bearwalker, à Darnassus.",
    ["From level 20: Forever's chain of the Great Cat Spirit, in Moonglade."] =
        "À partir du niveau 20 : la chaîne de Forever de l'Esprit du Grand félin, à Reflet-de-Lune.",
    ["The Great Cat Spirit rests in the south of Moonglade."] =
        "L'Esprit du Grand félin se repose au sud de Reflet-de-Lune.",
    ["The three relics lie in the southeast of Moonglade."] =
        "Les trois reliques se trouvent au sud-est de Reflet-de-Lune.",
    ["The Avatar of Saeyleenan waits in the south of Moonglade."] =
        "L'Avatar of Saeyleenan attend au sud de Reflet-de-Lune.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave of Darnassus."] =
        "Mathrengyl Bearwalker, à l'étage de l'Enclave cénarienne de Darnassus.",
    ["Any druid trainer of a capital gives it."] =
        "N'importe quel maître des druides d'une capitale la donne.",
    ["From level 50: Torwa Pathfinder's chain in Un'Goro Crater, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne de Torwa Pathfinder dans le cratère d'Un'Goro, qui se termine dans le temple d'Atal'Hakkar.",
    ["Torwa Pathfinder camps on the eastern side of the crater."] =
        "Torwa Pathfinder campe du côté est du cratère.",
    ["The Gorishi wasps of the hive in the south carry the stings; the Bloodcaps grow on red plants all over the crater."] =
        "Les guêpes Gorishi de la ruche du sud portent les dards ; les Chapeaux de sang poussent sur des plantes rouges partout dans le cratère.",
    ["Use the barb on a devilsaur: they roam the open plains of the crater."] =
        "Utilise la pointe barbelée sur un diablosaure : ils parcourent les plaines dégagées du cratère.",
    ["Atal'alarion, the guardian of the idol in the temple, drops the Putrid Vine."] =
        "Atal'alarion, le gardien de l'idole du temple, laisse tomber la Liane putride.",
    ["Hunter quests"] =
        "Quêtes de chasseur",
    ["Dazalar, the hunter trainer of Dolanaar."] =
        "Dazalar, maître des chasseurs de Dolanaar.",
    ["From level 10: three beasts to tame, then you can tame a pet of your own."] =
        "À partir du niveau 10 : trois bêtes à dompter, puis tu peux apprivoiser ton propre familier.",
    ["Use the taming rod on a Webwood Lurker, east of Dolanaar. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Utilise le bâtonnet de domptage sur une Rôdeuse Tissebois, à l'est de Dolanaar. Une fois la bête domptée, renvoie-la : elle redevient hostile, alors tiens-toi prêt.",
    ["Use the rod on a Nightsaber Stalker, west of Dolanaar, then dismiss it the same way."] =
        "Utilise le bâtonnet sur un Rôdeur sabre-de-nuit, à l'ouest de Dolanaar, puis renvoie-le de la même façon.",
    ["Use the rod on a Strigid Screecher, south of Dolanaar."] =
        "Utilise le bâtonnet sur un Hurleur Strigid, au sud de Dolanaar.",
    ["Turning this in teaches Tame Beast: you can now keep a pet."] =
        "Rendre cette quête t'apprend Apprivoiser une bête : tu peux maintenant garder un familier.",
    ["Jocaste, the hunter trainer of Darnassus, upstairs."] =
        "Jocaste, maître des chasseurs de Darnassus, à l'étage.",
    ["Your pet can now learn new skills."] =
        "Ton familier peut maintenant apprendre de nouvelles techniques.",
    ["Grif Wildheart, the hunter trainer of Kharanos."] =
        "Grif Wildheart, maître des chasseurs de Kharanos.",
    ["Use the taming rod on a Large Crag Boar, north of Kharanos. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Utilise le bâtonnet de domptage sur un Grand sanglier des rochers, au nord de Kharanos. Une fois la bête domptée, renvoie-la : elle redevient hostile, alors tiens-toi prêt.",
    ["Use the rod on a Snow Leopard, south of Kharanos, then dismiss it the same way."] =
        "Utilise le bâtonnet sur un Léopard des neiges, au sud de Kharanos, puis renvoie-le de la même façon.",
    ["Use the rod on an Ice Claw Bear, in the hills south of Kharanos."] =
        "Utilise le bâtonnet sur un Ours Griffeglace, dans les collines au sud de Kharanos.",
    ["Belia Thundergranite, the pet trainer of Ironforge, in the Hall of Arms."] =
        "Belia Thundergranite, maître des familiers de Forgefer, dans le Hall des armes.",
    ["Josephine Carson, the hunter trainer of Goldshire."] =
        "Josephine Carson, maître des chasseurs de Comté-de-l'Or.",
    ["Use the taming rod on a Rockhide Boar, in the southeast of Elwynn Forest. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Utilise le bâtonnet de domptage sur un Sanglier Rochecuir, au sud-est de la forêt d'Elwynn. Une fois la bête domptée, renvoie-la : elle redevient hostile, alors tiens-toi prêt.",
    ["Use the rod on a Gray Forest Wolf, in the east of the forest, then dismiss it the same way."] =
        "Utilise le bâtonnet sur un Loup forestier gris, à l'est de la forêt, puis renvoie-le de la même façon.",
    ["Use the rod on a Young Forest Bear, in the west of the forest near Westbrook Garrison."] =
        "Utilise le bâtonnet sur un Jeune ours des forêts, à l'ouest de la forêt, près de la garnison du ruisseau de l'Ouest.",
    ["Isaac Chan, the pet trainer, stands next to Josephine."] =
        "Isaac Chan, maître des familiers, se tient à côté de Josephine.",
    ["Elayaa Easewind sends you to Quel'ana Quickgale."] =
        "Elayaa Easewind t'envoie voir Quel'ana Quickgale.",
    ["Use the taming rod on a Windsong Crawler. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Utilise le bâtonnet de domptage sur un Windsong Crawler. Une fois la bête domptée, renvoie-la : elle redevient hostile, alors tiens-toi prêt.",
    ["Use the rod on an Ornery Galestrider, then dismiss it the same way."] =
        "Utilise le bâtonnet sur un Ornery Galestrider, puis renvoie-le de la même façon.",
    ["Use the rod on a Vuldren Alpha."] =
        "Utilise le bâtonnet sur un Vuldren Alpha.",
    ["Quel'dora Quickgale, the pet trainer, stands next to Quel'ana."] =
        "Quel'dora Quickgale, maître des familiers, se tient à côté de Quel'ana.",
    ["Any hunter trainer of a capital gives it."] =
        "N'importe quel maître des chasseurs d'une capitale la donne.",
    ["From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne d'Ogtinc en Azshara, qui se termine dans le temple d'Atal'Hakkar.",
    ["Ogtinc lives up a hill path in the middle of Azshara."] =
        "Ogtinc vit en haut d'un sentier de colline, au centre d'Azshara.",
    ["The Mosshoof Coursers of northern Azshara carry the antlers; only some do."] =
        "Les Coursiers Sabots-de-mousse du nord d'Azshara portent les ramures ; certains seulement.",
    ["Wavethrashers haunt the Azshara shoreline; not every one leaves a scale."] =
        "Les Vandales des flots hantent le rivage d'Azshara ; tous ne laissent pas une écaille.",
    ["Morphaz, one of the green dragons of the temple, drops the tooth."] =
        "Morphaz, l'un des dragons verts du temple, laisse tomber la dent.",
    ["Mage quests"] =
        "Quêtes de mage",
    ["Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."] =
        "Zaldimar Wefhellt, maître des mages de Comté-de-l'Or, à l'étage de l'auberge.",
    ["From level 10: your trainer's first errand, a few minutes from Goldshire."] =
        "À partir du niveau 10 : la première course de ton maître, à quelques minutes de Comté-de-l'Or.",
    ["Jennea Cannon, upstairs in the Wizard's Sanctum of the Mage Quarter, in Stormwind."] =
        "Jennea Cannon, à l'étage du Sanctuaire du sorcier, dans le quartier des mages de Hurlevent.",
    ["Stand in the water of Mirror Lake, in the west of Elwynn Forest, and use the flask there."] =
        "Tiens-toi dans l'eau du lac Miroir, à l'ouest de la forêt d'Elwynn, et utilise la flasque sur place.",
    ["Magis Sparkmantle, the mage trainer of Kharanos."] =
        "Magis Sparkmantle, maître des mages de Kharanos.",
    ["From level 10: your trainer's first errand, in Dun Morogh."] =
        "À partir du niveau 10 : la première course de ton maître, à Dun Morogh.",
    ["Bink, the mage trainer of Ironforge, in the Hall of Mysteries."] =
        "Bink, maître des mages de Forgefer, dans le Hall des mystères.",
    ["Bink's toolbox lies by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "La boîte à outils de Bink se trouve près des portes de Gnomeregan, à l'ouest de Dun Morogh.",
    ["From level 10: the Skyborne mage quests of Zephras Isle."] =
        "À partir du niveau 10 : les quêtes de mage Skyborne de l'île de Zephras.",
    ["The wind-infused boughs lie on the ground west of the camp."] =
        "Les rameaux imprégnés de vent sont au sol, à l'ouest du camp.",
    ["Your mage trainer gives it."] =
        "Ton maître des mages la donne.",
    ["From level 15: a chain in Stormwind that ends with a robe for you."] =
        "À partir du niveau 15 : une chaîne à Hurlevent qui se termine par une robe pour toi.",
    ["The chest of coffers and the cantation lie in Jennea's tower."] =
        "La caisse de coffres et les Chants de manifestation se trouvent dans la tour de Jennea.",
    ["The Blue Recluse, the inn of the Mage Quarter"] =
        "Le Solitaire bleu, l'auberge du quartier des mages",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it. Three hide in the inn, one of them downstairs."] =
        "Lis les Chants de manifestation pour révéler un Rejeton de la faille, combats-le jusqu'à ce qu'il soit étourdi, puis utilise un coffre sur lui. Trois se cachent dans l'auberge, dont un en bas.",
    ["The Charged Rift Gem lies in the Silver Stream Mine, in the north of Loch Modan; the linen comes from humanoids anywhere."] =
        "La Gemme chargée de la faille se trouve dans la mine du Ru d'argent, au nord de Loch Modan ; l'étoffe de lin vient des humanoïdes, partout.",
    ["Wynne Larson, the robe merchant of the Mage Quarter."] =
        "Wynne Larson, marchande de robes du quartier des mages.",
    ["Your reward: the Manaweave Robe."] =
        "Ta récompense : la Robe en tisse-mana.",
    ["From level 26: a chain that ends with a second robe."] =
        "À partir du niveau 26 : une chaîne qui se termine par une deuxième robe.",
    ["High Sorcerer Andromath, at the top of the Wizard's Sanctum."] =
        "Grand sorcier Andromath, au sommet du Sanctuaire du sorcier.",
    ["The book lies in the Tower of Ilgalar, in the east of Redridge Mountains."] =
        "Le livre se trouve dans la tour d'Ilgalar, à l'est des Carmines.",
    ["The spiders of the western woods of Duskwood carry the silk."] =
        "Les araignées des bois de l'ouest du Bois de la Pénombre portent la soie.",
    ["Your reward: the Astral Knot Garment."] =
        "Ta récompense : l'Habit du nœud astral.",
    ["Your capital's mage trainer gives it."] =
        "Le maître des mages de ta capitale la donne.",
    ["From level 30: Tabetha's quests in Dustwallow Marsh, which end with a mage's wand."] =
        "À partir du niveau 30 : les quêtes de Tabetha au marécage d'Âprefange, qui se terminent par une baguette de mage.",
    ["Tabetha lives on her farm in the south of Dustwallow Marsh."] =
        "Tabetha vit dans sa ferme, au sud du marécage d'Âprefange.",
    ["Magus Tirth, at the Shimmering Flats of Thousand Needles, near the race track."] =
        "Magus Tirth, aux Salines de Mille pointes, près de la piste de course.",
    ["\"Plucky\" Johnson, the chicken by the tent: beckon to him with the emote so he turns back into a man, then ask him for the phrase."] =
        "Johnson « le Brave », le poulet près de la tente : fais-lui signe d'approcher avec l'emote pour qu'il redevienne un homme, puis demande-lui la phrase.",
    ["Tabetha gives it too."] =
        "Tabetha la donne aussi.",
    ["The Witherbark trolls of eastern Arathi Highlands carry the totem sticks."] =
        "Les trolls Witherbark de l'est des Hautes-terres d'Arathi portent les bâtons totems.",
    ["Use the stick on the central stone of the Circle of Outer Binding, in Arathi Highlands; clear its guards first. The Jade is a gem found while mining, or at the auction house."] =
        "Utilise le bâton sur la pierre centrale du cercle de Lien extérieur, dans les Hautes-terres d'Arathi ; élimine d'abord ses gardiens. Le Jade est une gemme trouvée en minant, ou à l'hôtel des ventes.",
    ["The book lies in the Library of the Scarlet Monastery."] =
        "Le livre se trouve dans la Bibliothèque du Monastère écarlate.",
    ["Your reward: a mage's wand."] =
        "Ta récompense : une baguette de mage.",
    ["From level 35: Tabetha's second chain, which goes through Uldaman."] =
        "À partir du niveau 35 : la deuxième chaîne de Tabetha, qui passe par Uldaman.",
    ["The Burning Blade summoners of Mannoroc Coven, in southern Desolace, carry the orb."] =
        "Les invocateurs de la Lame ardente du convent de Mannoroc, au sud de Désolace, portent l'orbe.",
    ["Right there: Tabetha frees the demon of the orb; defeat it."] =
        "Sur place : Tabetha libère le démon de l'orbe ; vaincs-le.",
    ["The Obsidian Sentinel of Uldaman holds the power source."] =
        "La Sentinelle d'obsidienne d'Uldaman détient la source d'énergie.",
    ["Right there: destroy the mana surges as they appear around Tabetha."] =
        "Sur place : détruis les Éruptions de mana à mesure qu'elles apparaissent autour de Tabetha.",
    ["From level 40: Tabetha's task in Zul'Farrak."] =
        "À partir du niveau 40 : la mission de Tabetha à Zul'Farrak.",
    ["Hydromancer Velratha, by the sacred pool of Zul'Farrak, drops the tiara."] =
        "L'hydromancienne Velratha, près du bassin sacré de Zul'Farrak, laisse tomber la tiare.",
    ["Your capital's master mage gives it."] =
        "Le maître mage de ta capitale la donne.",
    ["From level 50: Archmage Xylem's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne de l'archimage Xylem en Azshara, qui se termine dans le temple d'Atal'Hakkar.",
    ["Sanath Lim-yo, at the foot of Archmage Xylem's tower in Azshara: talk to him to be sent up to the archmage."] =
        "Sanath Lim-yo, au pied de la tour de l'archimage Xylem en Azshara : parle-lui pour être envoyé auprès de l'archimage.",
    ["The blood elves of the ruins in northeastern Azshara carry the dust."] =
        "Les elfes de sang des ruines du nord-est d'Azshara portent la poussière.",
    ["The Spitelash sirens of the western shore of Azshara carry the coral."] =
        "Les sirènes Fouette-bile de la côte ouest d'Azshara portent le corail.",
    ["Morphaz, one of the green dragons of the temple, drops the shard."] =
        "Morphaz, l'un des dragons verts du temple, laisse tomber l'éclat.",
    ["From level 60: Lorekeeper Lydros' quest, inside Dire Maul."] =
        "À partir du niveau 60 : la quête du gardien du savoir Lydros, dans Hache-Tripes.",
    ["Hydrospawn, a water elemental of Dire Maul, drops the essence."] =
        "Hydrogénos, un élémentaire d'eau de Hache-Tripes, laisse tomber l'essence.",
    ["Paladin quests"] =
        "Quêtes de paladin",
    ["Brother Wilhelm, the paladin trainer of Goldshire, sends you to Stormwind."] =
        "Frère Wilhelm, maître des paladins de Comté-de-l'Or, t'envoie à Hurlevent.",
    ["Duthorian Rall, in the Cathedral of Light."] =
        "Duthorian Rall, dans la cathédrale de la Lumière.",
    ["From level 12: the chain that teaches Redemption."] =
        "À partir du niveau 12 : la chaîne qui t'apprend Rédemption.",
    ["Read the Tome of Divinity from your bags to start the next quest."] =
        "Lis le Tome de divinité depuis ton sac pour lancer la quête suivante.",
    ["Stephanie Turner, a poor woman of Old Town."] =
        "Stephanie Turner, une femme pauvre de la vieille ville.",
    ["She needs Linen Cloth: humanoids carry it everywhere."] =
        "Elle a besoin d'étoffe de lin : les humanoïdes en portent partout.",
    ["Gazin Tenorm, in the Cathedral of Light."] =
        "Gazin Tenorm, dans la cathédrale de la Lumière.",
    ["Henze Faulk lies lifeless in the east of Elwynn Forest: use the Symbol of Life on him."] =
        "Henze Faulk gît sans vie à l'est de la forêt d'Elwynn : utilise le Symbole de vie sur lui.",
    ["The Defias around Henze carry the script."] =
        "Les Défias autour de Henze portent le script.",
    ["Turning this in teaches Redemption."] =
        "Rendre cette quête t'apprend Rédemption.",
    ["Azar Stronghammer, the paladin trainer of Kharanos, sends you to Ironforge."] =
        "Azar Stronghammer, maître des paladins de Kharanos, t'envoie à Forgefer.",
    ["Tiza Battleforge, in the Mystic Ward of Ironforge."] =
        "Tiza Battleforge, dans la Garde mystique de Forgefer.",
    ["John Turner, a poor man who walks the streets of Ironforge."] =
        "John Turner, un homme pauvre qui arpente les rues de Forgefer.",
    ["He needs Linen Cloth: humanoids carry it everywhere."] =
        "Il a besoin d'étoffe de lin : les humanoïdes en portent partout.",
    ["Muiredon Battleforge, beside Tiza."] =
        "Muiredon Battleforge, à côté de Tiza.",
    ["Narm Faulk lies lifeless in the east of Dun Morogh: use the Symbol of Life on him."] =
        "Narm Faulk gît sans vie à l'est de Dun Morogh : utilise le Symbole de vie sur lui.",
    ["The Dark Iron spies around Narm carry the script."] =
        "Les espions Sombrefer autour de Narm portent le script.",
    ["From level 20: the Tome of Valor, then the Test of Righteousness, which ends with Verigan's Fist, a two-handed mace."] =
        "À partir du niveau 20 : le Tome de la bravoure, puis le Test de droiture, qui se termine par le Poing de Verigan, une masse à deux mains.",
    ["Read the Tome of Valor from your bags to start the next quest."] =
        "Lis le Tome de valeur depuis ton sac pour lancer la quête suivante.",
    ["Duthorian Rall, in the Cathedral of Light of Stormwind."] =
        "Duthorian Rall, dans la cathédrale de la Lumière de Hurlevent.",
    ["Daphne Stilwell, at her house in the south of Westfall. Take her quest only when ready: three waves of Defias attack, then more."] =
        "Daphne Stilwell, chez elle, au sud de la Marche de l'Ouest. Ne prends sa quête que quand tu es prêt : trois vagues de Défias attaquent, puis d'autres encore.",
    ["Stay by Daphne until the last wave falls; a friend helps."] =
        "Reste près de Daphne jusqu'à la chute de la dernière vague ; un ami t'aidera.",
    ["Jordan Stilwell, outside the gates of Ironforge."] =
        "Jordan Stilwell, devant les portes de Forgefer.",
    ["Four items: the lumber from the Deadmines, the hammer from Shadowfang Keep, the ore from Loch Modan and the Kor Gem from Darkshore."] =
        "Quatre objets : le bois des Mortemines, le marteau du donjon d'Ombrecroc, le minerai de Loch Modan et la gemme de Kor de Sombrivage.",
    ["Bailor Stonehand, in Thelsamar."] =
        "Bailor Stonehand, à Thelsamar.",
    ["The ore lies in a crate by a tree stump, in the northeast of Loch Modan."] =
        "Le minerai se trouve dans une caisse près d'une souche, au nord-est de Loch Modan.",
    ["Thundris Windweaver, in Auberdine."] =
        "Thundris Windweaver, à Auberdine.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand in Ashenvale, carry the corrupted gem. They are elite: bring a group."] =
        "Les nagas de l'entrée des profondeurs de Brassenoire, sous l'eau de la grève de Zoram à Orneval, portent la gemme corrompue. Ils sont élites : viens en groupe.",
    ["The goblin woodcarvers of the Deadmines carry the lumber."] =
        "Les sculpteurs gobelins des Mortemines portent le bois.",
    ["Jordan's hammer lies in the stables of Shadowfang Keep."] =
        "Le marteau de Jordan se trouve dans les écuries du donjon d'Ombrecroc.",
    ["Your reward: Verigan's Fist."] =
        "Ta récompense : le Poing de Verigan.",
    ["Delgren the Purifier, at Maestra's Post in Ashenvale."] =
        "Delgren le Purificateur, au poste de Maestra, à Orneval.",
    ["From level 22: Forever's paladin chain of Delgren the Purifier."] =
        "À partir du niveau 22 : la chaîne de paladin de Forever de Delgren le Purificateur.",
    ["Katherine the Pure, in the Cathedral of Light of Stormwind."] =
        "Katherine la Pure, dans la cathédrale de la Lumière de Hurlevent.",
    ["Ursula Deline, the warlock trainer of the Mage Quarter."] =
        "Ursula Deline, maître des démonistes du quartier des mages.",
    ["The Blackrock orcs of Redridge Mountains carry the summoner's salt."] =
        "Les orcs Blackrock des Carmines portent le sel d'invocateur.",
    ["The demons of Demon Fall Canyon, in the southeast of Ashenvale, carry the motes."] =
        "Les démons du canyon de la Malechute, au sud-est d'Orneval, portent les granules.",
    ["Bring them to the Spear of Mannoroth, in the canyon."] =
        "Apporte-les à la Lance de Mannoroth, dans le canyon.",
    ["From level 40: the quest of your warhorse."] =
        "À partir du niveau 40 : la quête de ton cheval de guerre.",
    ["Turning this in teaches Summon Warhorse."] =
        "Rendre cette quête t'apprend Invocation d'un cheval de guerre.",
    ["Lord Grayson Shadowbreaker, in the Cathedral of Light."] =
        "Seigneur Grayson Shadowbreaker, dans la cathédrale de la Lumière.",
    ["From level 50: the chain of the Mightstone, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne de la pierre de pouvoir, qui se termine dans le temple d'Atal'Hakkar.",
    ["Commander Ashlam Valorfist, at Chillwind Camp in the Western Plaguelands."] =
        "Commandant Ashlam Valorfist, au camp du Noroît, dans les Maleterres de l'Ouest.",
    ["The skeletons of the fields of Andorhal carry the scourgestones."] =
        "Les squelettes des champs d'Andorhal portent les pierres du Fléau.",
    ["High Priest Thel'danis walks around Chillwind Camp."] =
        "Le grand prêtre Thel'danis se promène dans le camp du Noroît.",
    ["The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro."] =
        "Les six boss trolls de l'anneau supérieur du temple laissent chacun tomber une plume : Balafreur, Zul'Lor, Mijan, Hukku, Zolo et Loro.",
    ["From level 60: the long chain of your charger. It asks for about 200 gold and goes through Stratholme, Dire Maul and Scholomance."] =
        "À partir du niveau 60 : la longue chaîne de ton destrier. Elle demande environ 200 pièces d'or et passe par Stratholme, Hache-Tripes et Scholomance.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge: the sacrifice he asks for is gold."] =
        "Grand prêtre Rohan, dans la Garde mystique de Forgefer : le sacrifice qu'il demande, c'est de l'or.",
    ["Use the censer on the Terrordale Spirits, in the northwest of the Eastern Plaguelands."] =
        "Utilise l'encensoir sur les Esprits de Val-Terreur, au nord-ouest des Maleterres de l'Est.",
    ["Grimand Elmore, in the Dwarven District of Stormwind."] =
        "Grimand Elmore, dans le quartier des Nains de Hurlevent.",
    ["Grimand wants gold, Arthas' Tears (a herb), Runecloth, an Arcanite Bar, and holy water from the supply crates of Stratholme."] =
        "Grimand veut de l'or, des Larmes d'Arthas (une herbe), de l'étoffe runique, une barre d'arcanite et de l'eau sacrée des caisses de ravitaillement de Stratholme.",
    ["Merideth Carlson, the horse breeder of Southshore, makes the horse feed."] =
        "Merideth Carlson, éleveuse de chevaux d'Austrivage, prépare la nourriture pour cheval.",
    ["The Enriched Manna Biscuits are sold by the Argent Dawn's quartermasters."] =
        "Les Biscuits enrichis en manne sont vendus par les intendants de l'Aube d'argent.",
    ["The Ancient Equine Spirit waits in western Dire Maul, past Tendris Warpwood."] =
        "L'Ancien esprit équin attend dans l'ouest de Hache-Tripes, après Tendris Crochebois.",
    ["An Azerothian Diamond and a Pristine Black Diamond: found while mining and on monsters of the Plaguelands, or at the auction house."] =
        "Un Diamant d'Azeroth et un Diamant noir parfait : ils se trouvent en minant et sur les monstres des Maleterres, ou à l'hôtel des ventes.",
    ["In Scholomance, use the Divination Scryer to call Death Knight Darkreaver, defeat him, then use the charger's soul on his fallen mount."] =
        "Dans Scholomance, utilise le Clairvoyant pour appeler le chevalier de la mort Ravassombre, vaincs-le, puis utilise l'âme du destrier sur sa monture tombée.",
    ["Your reward: Summon Charger, your epic mount."] =
        "Ta récompense : Invocation d'un destrier, ta monture épique.",
    ["Priest quests"] =
        "Quêtes de prêtre",
    ["Priestess Anetta, the priest trainer of Northshire Abbey."] =
        "Prêtresse Anetta, maître des prêtres de l'abbaye de Comté du Nord.",
    ["From level 5: heal a wounded guard, and get your first robe."] =
        "À partir du niveau 5 : soigne un garde blessé, et obtiens ta première robe.",
    ["Priestess Josetta, the priest trainer of Goldshire."] =
        "Prêtresse Josetta, maître des prêtres de Comté-de-l'Or.",
    ["Guard Roberts lies wounded east of Goldshire: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "Le garde Roberts gît blessé à l'est de Comté-de-l'Or : soigne-le avec Soins inférieurs, puis donne-lui Mot de pouvoir : Robustesse.",
    ["Branstock Khalder, the priest trainer of Coldridge Valley."] =
        "Branstock Khalder, maître des prêtres de la vallée de Frigrecif.",
    ["From level 5: heal a wounded mountaineer, and get your first robe."] =
        "À partir du niveau 5 : soigne un montagnard blessé, et obtiens ta première robe.",
    ["Maxan Anvol, the priest trainer of Kharanos."] =
        "Maxan Anvol, maître des prêtres de Kharanos.",
    ["Mountaineer Dolf lies wounded near Kharanos: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "Le montagnard Dolf gît blessé près de Kharanos : soigne-le avec Soins inférieurs, puis donne-lui Mot de pouvoir : Robustesse.",
    ["Shanda, the priest trainer of Aldrassil, in Shadowglen."] =
        "Shanda, maître des prêtres d'Aldrassil, à Sombrevallée.",
    ["From level 5: heal a wounded sentinel, and get your first robe."] =
        "À partir du niveau 5 : soigne une sentinelle blessée, et obtiens ta première robe.",
    ["Laurna Morninglight, the priest trainer of Dolanaar."] =
        "Laurna Morninglight, maître des prêtres de Dolanaar.",
    ["Sentinel Shaya lies wounded south of Dolanaar: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "La sentinelle Shaya gît blessée au sud de Dolanaar : soigne-la avec Soins inférieurs, puis donne-lui Mot de pouvoir : Robustesse.",
    ["From level 10: the quest that teaches Desperate Prayer."] =
        "À partir du niveau 10 : la quête qui t'apprend Prière du désespoir.",
    ["High Priestess Laurena, in the Cathedral of Light of Stormwind."] =
        "Grande prêtresse Laurena, dans la cathédrale de la Lumière de Hurlevent.",
    ["Priestess Josetta gives it too."] =
        "La prêtresse Josetta la donne aussi.",
    ["From level 10: Forever's quest of Divine Grace, for Humans."] =
        "À partir du niveau 10 : la quête Divine Grace de Forever, pour les humains.",
    ["From level 10: Forever's quest of Confounding Flash, for Gnomes."] =
        "À partir du niveau 10 : la quête Confounding Flash de Forever, pour les gnomes.",
    ["High Priestess Mims, in the Mystic Ward of Ironforge."] =
        "Grande prêtresse Mims, dans la Garde mystique de Forgefer.",
    ["From level 10: the quest that teaches Starshards."] =
        "À partir du niveau 10 : la quête qui t'apprend Éclats stellaires.",
    ["Priestess Alathea, in the Temple of the Moon of Darnassus."] =
        "Prêtresse Alathea, dans le temple de la Lune de Darnassus.",
    ["From level 20: the quest that teaches Feedback."] =
        "À partir du niveau 20 : la quête qui t'apprend Rétroaction.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge."] =
        "Grand prêtre Rohan, dans la Garde mystique de Forgefer.",
    ["From level 20: the quest that teaches Fear Ward."] =
        "À partir du niveau 20 : la quête qui t'apprend Gardien de peur.",
    ["From level 20: Forever's second Gnome priest quest."] =
        "À partir du niveau 20 : la deuxième quête de prêtre gnome de Forever.",
    ["From level 20: the quest that teaches Elune's Grace."] =
        "À partir du niveau 20 : la quête qui t'apprend Grâce d'Elune.",
    ["Any priest trainer of a capital gives it."] =
        "N'importe quel maître des prêtres d'une capitale la donne.",
    ["The Mosshoof Coursers of northern Azshara carry the glands; only some do."] =
        "Les Coursiers Sabots-de-mousse du nord d'Azshara portent les glandes ; certains seulement.",
    ["The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor."] =
        "Les morts-vivants des Maleterres de l'Ouest et les zombies Zanzil de Strangleronce portent l'ichor.",
    ["Morphaz, one of the green dragons of the temple, carries the blood."] =
        "Morphaz, l'un des dragons verts du temple, porte le sang.",
    ["Greta Mosshoof, at the Emerald Sanctuary in Felwood."] =
        "Greta Mosshoof, au Sanctuaire d'émeraude, à Gangrebois.",
    ["Rogue quests"] =
        "Quêtes de voleur",
    ["Hogral Bakkan, the rogue trainer of Kharanos."] =
        "Hogral Bakkan, maître des voleurs de Kharanos.",
    ["From level 10: a first errand for the rogues of Ironforge."] =
        "À partir du niveau 10 : une première course pour les voleurs de Forgefer.",
    ["Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge."] =
        "Hulfdan Blackbeard, dans la Caverne lugubre de Forgefer.",
    ["Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan."] =
        "Onin MacHammar se tient sur une plate-forme à l'ouest de Dun Morogh, près de Gnomeregan.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75."] =
        "Apprends Crochetage auprès de ton maître, puis entraîne-toi sur des coffrets jusqu'à ce que ta compétence atteigne 75.",
    ["From level 16: Pick Lock opens the chests and boxes of the quests to come."] =
        "À partir du niveau 16 : Crochetage ouvre les coffres et les boîtes des quêtes à venir.",
    ["Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town."] =
        "Maître Mathias Shaw, au dernier étage du quartier général du SI:7, dans la vieille ville.",
    ["From level 20: the chain that teaches your poisons."] =
        "À partir du niveau 20 : la chaîne qui t'apprend tes poisons.",
    ["Agent Kearnen watches from a hill in the southeast of Westfall."] =
        "L'agent Kearnen guette depuis une colline au sud-est de la Marche de l'Ouest.",
    ["Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest."] =
        "Subtilise la Clé de la tour défias dans la poche d'un Pantin défias déformé, près de la tour ; puis, à l'étage, assomme Klaven Mortwake avant d'ouvrir le coffre.",
    ["The chest leaves a sickness on you: that is the next quest."] =
        "Le coffre te laisse une maladie : c'est la quête suivante.",
    ["Doc Mixilpixil works in the cellar of SI:7's headquarters."] =
        "Doc Mixilpixil travaille dans la cave du quartier général du SI:7.",
    ["Lie down in front of him (the emote) so he can examine you."] =
        "Allonge-toi devant lui (l'emote) pour qu'il puisse t'examiner.",
    ["Turning this in teaches your poisons."] =
        "Rendre cette quête t'apprend tes poisons.",
    ["Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills."] =
        "Myrokos Silentform, au manoir de Ravenholdt, dans les montagnes d'Alterac : on y entre par une grotte au nord des Contreforts de Hautebrande.",
    ["From level 24: Forever's Syndicate quests, at Ravenholdt Manor."] =
        "À partir du niveau 24 : les quêtes du Syndicat de Forever, au manoir de Ravenholdt.",
    ["Lord Tomas is hiding in the east of Hillsbrad Foothills."] =
        "Le seigneur Tomas se cache à l'est des Contreforts de Hautebrande.",
    ["Any rogue trainer of a capital gives it."] =
        "N'importe quel maître des voleurs d'une capitale la donne.",
    ["From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne du seigneur Jorach Ravenholdt, qui se termine dans le temple d'Atal'Hakkar.",
    ["Lord Jorach Ravenholdt, in Ravenholdt Manor."] =
        "Seigneur Jorach Ravenholdt, au manoir de Ravenholdt.",
    ["The Timbermaw shamans of northern Azshara carry the bag."] =
        "Les chamans Grumegueule du nord d'Azshara portent le sac.",
    ["Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up."] =
        "Archimage Xylem, au sommet de sa tour en Azshara : Sanath Lim-yo, à son pied, t'envoie en haut.",
    ["The Forest Oozes of northeastern Azshara carry the fragments."] =
        "Les Limons forestiers du nord-est d'Azshara portent les fragments.",
    ["Morphaz, one of the green dragons of the temple, drops the key."] =
        "Morphaz, l'un des dragons verts du temple, laisse tomber la clé.",
    ["Shaman quests"] =
        "Quêtes de chaman",
    ["Teo Hammerstorm, the shaman trainer of Coldridge Valley."] =
        "Teo Hammerstorm, maître des chamans de la vallée de Frigrecif.",
    ["From level 4: the Call of Earth, your first totem."] =
        "À partir du niveau 4 : l'Appel de la terre, ton premier totem.",
    ["The Frostmane trolls south of the valley carry the pendant."] =
        "Les trolls Frostmane au sud de la vallée portent le pendentif.",
    ["On the hill west of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "Sur la colline à l'ouest de la vallée : bois le Sapta de terre pour voir la Manifestation de terre mineure.",
    ["Turning this in teaches your first earth totem."] =
        "Rendre cette quête t'apprend ton premier totem de terre.",
    ["Ingrid Dunwald in Kharanos, or Eldrun Stormbreaker in Ironforge."] =
        "Ingrid Dunwald à Kharanos, ou Eldrun Stormbreaker à Forgefer.",
    ["From level 10: the Call of Fire, your first fire totem."] =
        "À partir du niveau 10 : l'Appel du feu, ton premier totem de feu.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh, by the road to Loch Modan."] =
        "Bruegs Kindleborn, tout à l'est de Dun Morogh, près de la route de Loch Modan.",
    ["Braldir Ashmantle, on a hill in the southwest of Loch Modan."] =
        "Braldir Ashmantle, sur une colline au sud-ouest de Loch Modan.",
    ["The Tunnel Rat geomancers of Loch Modan carry the Fire Tar; the Stonesplinter seers of the south carry the pouches."] =
        "Les géomanciens Rat des tunnels de Loch Modan portent le Goudron de feu ; les prophètes Brisepierre du sud portent les bourses.",
    ["Right by Braldir: call the Minor Manifestation of Fire at the brazier, then defeat it for its ember."] =
        "Juste à côté de Braldir : appelle la Manifestation de feu mineure au brasero, puis vaincs-la pour obtenir sa braise.",
    ["Light the Brazier of the Dormant Flame with the ember."] =
        "Allume le Brasero de la Flamme Dormante avec la braise.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh."] =
        "Bruegs Kindleborn, tout à l'est de Dun Morogh.",
    ["Turning this in teaches your first fire totem."] =
        "Rendre cette quête t'apprend ton premier totem de feu.",
    ["Eldrun Stormbreaker, the shaman trainer of Ironforge."] =
        "Eldrun Stormbreaker, maître des chamans de Forgefer.",
    ["From level 20: the Call of Water, your first water totem."] =
        "À partir du niveau 20 : l'Appel de l'eau, ton premier totem d'eau.",
    ["Norric Lochthane, by the dam in the north of Loch Modan."] =
        "Norric Lochthane, près du barrage au nord de Loch Modan.",
    ["Hervdana Saegrund, in the southeast of the Wetlands."] =
        "Hervdana Saegrund, au sud-est des Paluns.",
    ["Fill the waterskin where Hervdana's quest says: DingDB does not hold this place yet."] =
        "Remplis l'outre à l'endroit indiqué par la quête de Hervdana : DingDB ne connaît pas encore cet endroit.",
    ["At the Forgotten Shrine of Westfall: call the corrupt manifestation of water, then defeat it for its bracers."] =
        "Au sanctuaire oublié de la Marche de l'Ouest : appelle la manifestation d'eau corrompue, puis vaincs-la pour obtenir ses brassards.",
    ["The Minor Manifestation of Water rises beside the shrine."] =
        "La Manifestation d'eau mineure s'élève à côté du sanctuaire.",
    ["Turning this in teaches your first water totem."] =
        "Rendre cette quête t'apprend ton premier totem d'eau.",
    ["From level 30: the Call of Air, your first air totem."] =
        "À partir du niveau 30 : l'Appel de l'air, ton premier totem d'air.",
    ["Veyric Thunderhame, in the north of Arathi Highlands."] =
        "Veyric Thunderhame, au nord des Hautes-terres d'Arathi.",
    ["Turning this in teaches your first air totem."] =
        "Rendre cette quête t'apprend ton premier totem d'air.",
    ["From level 30: Veyric Thunderhame's elemental quests, to level 40."] =
        "À partir du niveau 30 : les quêtes élémentaires de Veyric Thunderhame, jusqu'au niveau 40.",
    ["Four twisted totems: from the Stonevault troggs of the Badlands, the Maraudine centaurs of Desolace, the Lost Ones of the Swamp of Sorrows and the Mirefin murlocs of Dustwallow Marsh."] =
        "Quatre totems tordus : sur les troggs Cavepierre des Terres ingrates, les centaures maraudine de Désolace, les Perdus du Marais des Chagrins et les murlocs Aileron boueux du marécage d'Âprefange.",
    ["Charlga Razorflank, the crone of Razorfen Kraul, carries the note."] =
        "Charlga Trancheflanc, la mégère du kraal de Tranchebauge, porte la note.",
    ["The Ravaging Tempests of western Thousand Needles carry the eye."] =
        "Les Ravaging Tempests de l'ouest de Mille pointes portent l'œil.",
    ["Bath'rah the Windwatcher, in the hills of the Alterac Mountains."] =
        "Bath'rah la Vigie des vents, dans les collines des montagnes d'Alterac.",
    ["Warlock quests"] =
        "Quêtes de démoniste",
    ["Drusilla La Salle, the warlock trainer of Northshire Abbey."] =
        "Drusilla La Salle, maître des démonistes de l'abbaye de Comté du Nord.",
    ["Your trainer's first errand, around Northshire Abbey."] =
        "La première course de ton maître, autour de l'abbaye de Comté du Nord.",
    ["The stolen books lie in the kobold camp east of the abbey."] =
        "Les livres volés se trouvent dans le camp kobold à l'est de l'abbaye.",
    ["Alamar Grimm, the warlock trainer of Coldridge Valley."] =
        "Alamar Grimm, maître des démonistes de la vallée de Frigrecif.",
    ["Your trainer's first errand, around Coldridge Valley."] =
        "La première course de ton maître, autour de la vallée de Frigrecif.",
    ["The Frostmane novices of the troll cave in the south of the valley carry the charm."] =
        "Les novices Frostmane de la grotte des trolls, au sud de la vallée, portent le charme.",
    ["Remen Marcot, in the inn of Goldshire, sends you to Stormwind."] =
        "Remen Marcot, à l'auberge de Comté-de-l'Or, t'envoie à Hurlevent.",
    ["Lago Blackwrench, in the Forlorn Cavern of Ironforge, sends you to Stormwind."] =
        "Lago Blackwrench, dans la Caverne lugubre de Forgefer, t'envoie à Hurlevent.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb, in the Mage Quarter of Stormwind."] =
        "Gakin le Tisse-noir, dans la cave de l'Agneau assassiné, dans le quartier des mages de Hurlevent.",
    ["From level 10: the chain that teaches Summon Voidwalker."] =
        "À partir du niveau 10 : la chaîne qui t'apprend Invocation d'un marcheur du Vide.",
    ["Surena Caledon hides in a house of the Brackwell Pumpkin Patch, in the east of Elwynn Forest."] =
        "Surena Caledon se cache dans une maison du champ de citrouilles des Brackwell, à l'est de la forêt d'Elwynn.",
    ["Down the stairs of the Slaughtered Lamb's crypt: use the choker on the summoning circle, then defeat the voidwalker."] =
        "En bas des escaliers de la crypte de l'Agneau assassiné : utilise le foulard sur le cercle d'invocation, puis vaincs le marcheur du Vide.",
    ["Turning this in teaches Summon Voidwalker."] =
        "Rendre cette quête t'apprend Invocation d'un marcheur du Vide.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."] =
        "Gakin le Tisse-noir, dans la cave de l'Agneau assassiné.",
    ["From level 20: the chain that teaches Summon Succubus."] =
        "À partir du niveau 20 : la chaîne qui t'apprend Invocation d'une succube.",
    ["Takar the Seer, north of Camp Taurajo in the Barrens: Horde land, stay clear of the guards."] =
        "Takar le Prophète, au nord du camp Taurajo dans les Tarides : terre de la Horde, évite les gardes.",
    ["The Heartswood grows in the north of Ashenvale, near the Horde's lumber camp."] =
        "Le Cœur du bois pousse au nord d'Orneval, près du camp de bûcherons de la Horde.",
    ["In the Slaughtered Lamb's crypt again: use the heartswood core on the summoning circle, then defeat the succubus."] =
        "De nouveau dans la crypte de l'Agneau assassiné : utilise le noyau du cœur du bois sur le cercle d'invocation, puis vaincs la succube.",
    ["Turning this in teaches Summon Succubus."] =
        "Rendre cette quête t'apprend Invocation d'une succube.",
    ["From level 30: the chain that teaches Summon Felhunter."] =
        "À partir du niveau 30 : la chaîne qui t'apprend Invocation d'un chasseur corrompu.",
    ["Strahad Farsan, in Ratchet."] =
        "Strahad Farsan, à Cabestan.",
    ["Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "Krom Stoutarm, dans le Hall des explorateurs de Forgefer.",
    ["The moldy tome lies in the southwest of Hillsbrad Foothills; the tattered manuscript, in a damaged chest of western Thousand Needles."] =
        "Le tome moisi se trouve au sud-ouest des Contreforts de Hautebrande ; le manuscrit en lambeaux, dans un coffre endommagé de l'ouest de Mille pointes.",
    ["The Dragonmaw orcs of the Wetlands carry the rod."] =
        "Les orcs Dragonmaw des Paluns portent le bâtonnet.",
    ["Right by Strahad: use the tome on the summoning circle, then defeat the felhunter."] =
        "Juste à côté de Strahad : utilise le tome sur le cercle d'invocation, puis vaincs le chasseur corrompu.",
    ["Turning this in teaches Summon Felhunter."] =
        "Rendre cette quête t'apprend Invocation d'un chasseur corrompu.",
    ["Demisette Cloyce, in the Slaughtered Lamb of Stormwind."] =
        "Demisette Cloyce, à l'Agneau assassiné de Hurlevent.",
    ["From level 40: the quest of your felsteed."] =
        "À partir du niveau 40 : la quête de ton palefroi corrompu.",
    ["Turning this in teaches Summon Felsteed."] =
        "Rendre cette quête t'apprend Invocation d'un palefroi corrompu.",
    ["Niby the Almighty and Impsy wait in a small camp of central Felwood."] =
        "Niby le Tout-puissant et Démonet attendent dans un petit camp au centre de Gangrebois.",
    ["From level 50: the demonic quests of Niby and Impsy, in Felwood."] =
        "À partir du niveau 50 : les quêtes démoniaques de Niby et Démonet, à Gangrebois.",
    ["Felcloth drops from demons and satyrs, Azshara's above all; the auction house sells it too."] =
        "La gangrétoffe tombe sur les démons et les satyres, surtout ceux d'Azshara ; l'hôtel des ventes en vend aussi.",
    ["The Irontree treants of northern Felwood carry the rotting wood; the oozes of the Bloodvenom river, the essence."] =
        "Les tréants Arbrefer du nord de Gangrebois portent le bois pourrissant ; les limons de la rivière Vénéneuse, l'essence.",
    ["Three essences: from the satyrs of Jaedenar in Felwood, the Legashi satyrs of Azshara, and the felguards by the Dark Portal in the Blasted Lands."] =
        "Trois essences : sur les satyres de Jaedenar à Gangrebois, les satyres Legashi d'Azshara et les gangregardes près de la Porte des ténèbres, dans les Terres foudroyées.",
    ["North of the camp, by the remains of Kroshius: use the item Impsy gives you to wake him, then defeat him."] =
        "Au nord du camp, près des restes de Kroshius : utilise l'objet que Démonet te donne pour le réveiller, puis vaincs-le.",
    ["Spackle Thornberry, the demon trainer of the Slaughtered Lamb."] =
        "Spackle Thornberry, maître des démons de l'Agneau assassiné.",
    ["From level 60: the long chain of your dreadsteed. It asks for costly materials and goes through Scholomance and Dire Maul."] =
        "À partir du niveau 60 : la longue chaîne de ton destrier de l'effroi. Elle demande des matériaux coûteux et passe par Scholomance et Hache-Tripes.",
    ["Mor'zul Bloodbringer, in the west of the Burning Steppes."] =
        "Mor'zul Bloodbringer, à l'ouest des Steppes ardentes.",
    ["The owlbeasts of Winterspring carry the blood."] =
        "Les chouettards de Berceau-de-l'Hiver portent le sang.",
    ["Gorzeeki Wildeyes, right by Mor'zul."] =
        "Gorzeeki Wildeyes, juste à côté de Mor'zul.",
    ["Mor'zul gives these three."] =
        "Mor'zul donne ces trois-là.",
    ["These three ask for an alchemist's elixir, an enchanter's shard with ore of the Burning Steppes, and scales of black dragonkin: make them, find them, or buy them at the auction house."] =
        "Ces trois-là demandent un élixir d'alchimiste, un éclat d'enchanteur avec du minerai des Steppes ardentes, et des écailles de draconiens noirs : fabrique-les, trouve-les ou achète-les à l'hôtel des ventes.",
    ["An Arcanite Bar: an alchemist makes it, or the auction house sells it."] =
        "Une barre d'arcanite : un alchimiste la fabrique, ou l'hôtel des ventes la vend.",
    ["Lord Banehollow, in the shrine of Jaedenar, in Felwood."] =
        "Seigneur Banehollow, dans le sanctuaire de Jaedenar, à Gangrebois.",
    ["Ulathek hides in Jaedenar too: defeat him for his heart."] =
        "Ulathek se cache aussi dans Jaedenar : vaincs-le pour obtenir son cœur.",
    ["Ur'dan sells the stardust, right by Lord Banehollow."] =
        "Ur'dan vend la poussière d'étoile, juste à côté du seigneur Banehollow.",
    ["In the alchemy lab of Scholomance, use the imp in a jar and let it do its work."] =
        "Dans le laboratoire d'alchimie de Scholomance, utilise le diablotin en bouteille et laisse-le faire son travail.",
    ["In Dire Maul, summon the Xorothian Dreadsteed with the ritual items and defeat it; then speak to its spirit."] =
        "Dans Hache-Tripes, invoque le Destrier de l'effroi xorothien avec les objets du rituel et vaincs-le ; puis parle à son esprit.",
    ["Your reward: Summon Dreadsteed, your epic mount."] =
        "Ta récompense : Invocation d'un destrier de l'effroi, ta monture épique.",
    ["Warrior quests"] =
        "Quêtes de guerrier",
    ["Lyria Du Lac, the warrior trainer of Goldshire."] =
        "Lyria Du Lac, maître des guerriers de Comté-de-l'Or.",
    ["From level 10: the chain that teaches Defensive Stance."] =
        "À partir du niveau 10 : la chaîne qui t'apprend Posture défensive.",
    ["Harry Burlguard, in the tavern of Old Town, in Stormwind."] =
        "Harry Burlguard, dans la taverne de la vieille ville, à Hurlevent.",
    ["Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest."] =
        "Bartleby, un ivrogne de la même taverne : il attaque dès que tu prends sa quête.",
    ["Turning this in teaches Defensive Stance."] =
        "Rendre cette quête t'apprend Posture défensive.",
    ["Granis Swiftaxe, the warrior trainer of Kharanos."] =
        "Granis Swiftaxe, maître des guerriers de Kharanos.",
    ["Muren Stormpike, upstairs in the Hall of Arms of Ironforge."] =
        "Muren Stormpike, à l'étage du Hall des armes de Forgefer.",
    ["Vejrek waits in a Frostmane hut in the west of Dun Morogh."] =
        "Vejrek attend dans une hutte Frostmane à l'ouest de Dun Morogh.",
    ["Kyra Windblade, the warrior trainer of Dolanaar."] =
        "Kyra Windblade, maître des guerriers de Dolanaar.",
    ["Elanaria, on the Warrior's Terrace of Darnassus."] =
        "Elanaria, sur la terrasse des Guerriers de Darnassus.",
    ["Vorlus Vilehoof roams with the satyrs southwest of Dolanaar."] =
        "Vorlus Vilehoof rôde avec les satyres au sud-ouest de Dolanaar.",
    ["Seena Skybreaker, the warrior trainer of Zephras Isle."] =
        "Seena Skybreaker, maître des guerriers de l'île de Zephras.",
    ["From level 10: the Skyborne warrior quest of Zephras Isle."] =
        "À partir du niveau 10 : la quête de guerrier Skyborne de l'île de Zephras.",
    ["Zaal Stormshield carries the bulwark, in the north of the isle."] =
        "Zaal Stormshield porte le rempart, au nord de l'île.",
    ["Your capital's warrior trainer gives it."] =
        "Le maître des guerriers de ta capitale la donne.",
    ["From level 30: the chain that teaches Berserker Stance."] =
        "À partir du niveau 30 : la chaîne qui t'apprend Posture berserker.",
    ["Klannoc Macleod, on Fray Island, off the coast of the Barrens."] =
        "Klannoc Macleod, sur l'île de la Dispute, au large de la côte des Tarides.",
    ["Step on the grate of the arena: six fighters come one at a time, then Big Will."] =
        "Monte sur la grille de l'arène : six combattants arrivent un par un, puis le Grand Will.",
    ["Turning this in teaches Berserker Stance."] =
        "Rendre cette quête t'apprend Posture berserker.",
    ["From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice."] =
        "À partir du niveau 30 : la chaîne de Bath'rah, qui se termine par une arme Tourbillon de ton choix.",
    ["Eight Liferoot: an herb, picked with Herbalism or bought at the auction house."] =
        "Huit Vietérules : une herbe, cueillie avec l'Herboristerie ou achetée à l'hôtel des ventes.",
    ["The Drywhisker kobolds of eastern Arathi Highlands carry the three charms."] =
        "Les kobolds Sèche-moustache de l'est des Hautes-terres d'Arathi portent les trois charmes.",
    ["At Bath'rah's cauldron, right by him: put the three charms in it."] =
        "Au chaudron de Bath'rah, juste à côté de lui : mets-y les trois charmes.",
    ["The Bloodscalp trolls of northern Stranglethorn carry the tusks."] =
        "Les trolls Bloodscalp du nord de Strangleronce portent les défenses.",
    ["Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help."] =
        "Suis Bath'rah jusqu'à l'invocation, puis vaincs Cyclonien pour obtenir son cœur : un ennemi coriace, viens avec de l'aide.",
    ["Your reward: a Whirlwind weapon of your choice."] =
        "Ta récompense : une arme Tourbillon de ton choix.",
    ["From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne du Héros déchu, qui se termine dans le temple d'Atal'Hakkar.",
    ["The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows."] =
        "Le Héros déchu de la Horde, un esprit à l'ouest du Marais des Chagrins.",
    ["The Helboars of the Blasted Lands."] =
        "Les Sangliers infernaux des Terres foudroyées.",
    ["The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly."] =
        "Les liges d'ombre des Terres foudroyées, près de la Porte des ténèbres ; ils réapparaissent vite.",
    ["Gennia Runetotem, the druid trainer of Bloodhoof Village, sends you to Thunder Bluff."] =
        "Gennia Runetotem, maître des druides du village de Sabot-de-Sang, t'envoie aux Pitons-du-Tonnerre.",
    ["Turak Runetotem, in the Elder Rise of Thunder Bluff."] =
        "Turak Runetotem, sur la cime des Anciens des Pitons-du-Tonnerre.",
    ["Faustron, the wind rider master southwest of Nighthaven: take this flight path for your next trips here."] =
        "Faustron, maître des cavaliers célestes au sud-ouest de Havrenuit : récupère ce point de vol pour tes prochains trajets ici.",
    ["Lunaclaw's spot, west of Camp Taurajo in the Barrens"] =
        "L'endroit de Lunegriffe, à l'ouest du camp Taurajo dans les Tarides",
    ["Use the Cenarion Lunardust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "Utilise la Poussière lunaire cénarienne près de la pierre des séléniens : Lunegriffe apparaît. Vaincs-la, puis parle à son esprit.",
    ["Muln Earthfury gives it, in the northwest of Mulgore."] =
        "Muln Earthfury la donne, au nord-ouest de Mulgore.",
    ["Fill the sampler in the bubbling pool at the top of Dreadmist Peak: three acolytes attack right after, so clear the top first or bring help."] =
        "Remplis la fiole d'échantillon dans le bassin bouillonnant au sommet du pic de Brume-funeste : trois acolytes attaquent juste après, alors nettoie le sommet d'abord ou viens avec de l'aide.",
    ["Tonga Runetotem, just south of the Crossroads."] =
        "Tonga Runetotem, juste au sud de la Croisée.",
    ["The kodos of the northern Barrens carry the Kodo Horns."] =
        "Les kodos du nord des Tarides portent les Cornes de kodo.",
    ["Sickly Gazelles graze in the north of the Barrens: use the salve on them."] =
        "Des Gazelles malades broutent au nord des Tarides : utilise le remède sur elles.",
    ["The first half of the pendant lies under the water in the far north of the Barrens."] =
        "La première moitié du pendentif se trouve sous l'eau, tout au nord des Tarides.",
    ["The second half lies under the water off the coast of Silverpine Forest."] =
        "La seconde moitié se trouve sous l'eau, au large de la côte de la forêt des Pins-Argentés.",
    ["Turak Runetotem gives it, in the Elder Rise of Thunder Bluff."] =
        "Turak Runetotem la donne, sur la cime des Anciens des Pitons-du-Tonnerre.",
    ["Thotar, the hunter trainer of Razor Hill."] =
        "Thotar, maître des chasseurs de Tranchecolline.",
    ["Use the taming rod on a Dire Mottled Boar, south of Razor Hill. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Utilise le bâtonnet de domptage sur un Sanglier tacheté redoutable, au sud de Tranchecolline. Une fois la bête domptée, renvoie-la : elle redevient hostile, alors tiens-toi prêt.",
    ["Use the rod on a Surf Crawler, on the southern shore of Durotar, then dismiss it the same way."] =
        "Utilise le bâtonnet sur un Clampant de l'écume, sur la côte sud de Durotar, puis renvoie-le de la même façon.",
    ["Use the rod on an Armored Scorpid, northwest of Razor Hill."] =
        "Utilise le bâtonnet sur un Scorpide blindé, au nord-ouest de Tranchecolline.",
    ["Ormak Grimshot, the hunter trainer of Orgrimmar, in the Valley of Honor."] =
        "Ormak Grimshot, maître des chasseurs d'Orgrimmar, dans la vallée de l'Honneur.",
    ["Yaw Sharpmane, the hunter trainer of Bloodhoof Village."] =
        "Yaw Sharpmane, maître des chasseurs du village de Sabot-de-Sang.",
    ["Use the taming rod on an Adult Plainstrider, north of the village. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Utilise le bâtonnet de domptage sur un Trotteur des plaines adulte, au nord du village. Une fois la bête domptée, renvoie-la : elle redevient hostile, alors tiens-toi prêt.",
    ["Use the rod on a Prairie Stalker, southeast of the village, then dismiss it the same way."] =
        "Utilise le bâtonnet sur un Traqueur des prairies, au sud-est du village, puis renvoie-le de la même façon.",
    ["Use the rod on a Swoop, in the plains north of the village."] =
        "Utilise le bâtonnet sur un Rapace, dans les plaines au nord du village.",
    ["Holt Thunderhorn, the hunter trainer of Thunder Bluff, on the Hunter Rise."] =
        "Holt Thunderhorn, maître des chasseurs des Pitons-du-Tonnerre, sur la cime des Chasseurs.",
    ["Uthel'nay, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "Uthel'nay, maître des mages d'Orgrimmar, dans la vallée des Esprits.",
    ["From level 10: your trainer's first errand, in Durotar."] =
        "À partir du niveau 10 : la première course de ton maître, à Durotar.",
    ["Un'Thuwa, the mage trainer of Sen'jin Village."] =
        "Un'Thuwa, maître des mages du village de Sen'jin.",
    ["The Ju-Ju Heaps stand on the Echo Isles, off the southern coast."] =
        "Les Monceaux Ju-Ju se dressent sur les îles de l'Écho, au large de la côte sud.",
    ["Cain Firesong, the mage trainer of Brill."] =
        "Cain Firesong, maître des mages de Brill.",
    ["From level 10: your trainer's first errand, in Tirisfal Glades."] =
        "À partir du niveau 10 : la première course de ton maître, dans les clairières de Tirisfal.",
    ["Anastasia Hartwell, the mage trainer of the Undercity, in the Magic Quarter."] =
        "Anastasia Hartwell, maître des mages de Fossoyeuse, dans le quartier de la Magie.",
    ["The snapdragons grow by the farm of the Balnirs, in the east of Tirisfal Glades."] =
        "Les gueules-de-loup poussent près de la ferme des Balnir, à l'est des clairières de Tirisfal.",
    ["From level 15: a chain in the Undercity that ends with a robe for you."] =
        "À partir du niveau 15 : une chaîne à Fossoyeuse qui se termine par une robe pour toi.",
    ["The chest of coffers and the cantation lie beside Anastasia."] =
        "La caisse de coffres et les Chants de manifestation se trouvent à côté d'Anastasia.",
    ["The alchemist shop of the Undercity"] =
        "La boutique d'alchimie de Fossoyeuse",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it."] =
        "Lis les Chants de manifestation pour révéler un Rejeton de la faille, combats-le jusqu'à ce qu'il soit étourdi, puis utilise un coffre sur lui.",
    ["The Dalaran mages of Ambermill, in Silverpine Forest, carry the mana gems; the linen comes from humanoids anywhere."] =
        "Les mages de Dalaran de Moulin-de-l'Ambre, dans la forêt des Pins-Argentés, portent les gemmes de mana ; l'étoffe de lin vient des humanoïdes, partout.",
    ["Josef Gregorian, the tailor of the Undercity's Rogues' Quarter."] =
        "Josef Gregorian, tailleur du quartier des Voleurs de Fossoyeuse.",
    ["Your reward: the Spellfire Robes."] =
        "Ta récompense : la Robe du feu-sorcier.",
    ["Deino, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "Deino, maître des mages d'Orgrimmar, dans la vallée des Esprits.",
    ["Fill the flask at the waterfall of Xavian, in eastern Ashenvale: take the path up from the south."] =
        "Remplis la flasque à la cascade de Xavian, à l'est d'Orneval : prends le chemin qui monte depuis le sud.",
    ["The Laughing Sisters, nymphs of the woods of central Ashenvale, carry the hair."] =
        "Les Sœurs rieuses, nymphes des bois du centre d'Orneval, portent les cheveux.",
    ["Kil'hala, the tailor of the Crossroads."] =
        "Kil'hala, tailleur de la Croisée.",
    ["Your reward: the Nether-lace Garment."] =
        "Ta récompense : l'Habit du néant.",
    ["Shadow Priest Sarvis, at the start of Deathknell."] =
        "Prêtre des ombres Sarvis, à l'entrée du Glas.",
    ["The Forsaken paladin's story, a chain added by Forever, starts in Deathknell."] =
        "L'histoire du paladin réprouvé, une chaîne ajoutée par Forever, commence au Glas.",
    ["Aramis Hammerhand, the paladin trainer of Deathknell."] =
        "Aramis Hammerhand, maître des paladins du Glas.",
    ["Shari Stilwell, the paladin trainer of Brill."] =
        "Shari Stilwell, maître des paladins de Brill.",
    ["Breton Samuels, at the outpost in the west of Tirisfal Glades."] =
        "Breton Samuels, à l'avant-poste à l'ouest des clairières de Tirisfal.",
    ["Jorin Croge, a few steps away."] =
        "Jorin Croge, à quelques pas.",
    ["The Vile Fin murlocs of the western coast."] =
        "Les murlocs Aileron noir de la côte ouest.",
    ["The lumber piles lie on the western coast, south of the murlocs."] =
        "Les piles de bois se trouvent sur la côte ouest, au sud des murlocs.",
    ["Danitha Morr, at the outpost."] =
        "Danitha Morr, à l'avant-poste.",
    ["The Tarnished gather on the western coast; Rudolph Gelhardt, their paladin, carries the head the quest asks for."] =
        "Les Tarnished se rassemblent sur la côte ouest ; Rudolph Gelhardt, leur paladin, porte la tête que demande la quête.",
    ["Lady Sylvanas Windrunner, in the Royal Quarter of the Undercity."] =
        "Dame Sylvanas Windrunner, dans le Quartier royal de Fossoyeuse.",
    ["Danitha Morr, at the outpost in the west of Tirisfal Glades."] =
        "Danitha Morr, à l'avant-poste à l'ouest des clairières de Tirisfal.",
    ["From level 12: the lessons in divinity, the next chapter of the Forsaken paladin's story."] =
        "À partir du niveau 12 : les leçons de divinité, le chapitre suivant de l'histoire du paladin réprouvé.",
    ["Tanis Alderwood, in the Undercity."] =
        "Tanis Alderwood, à Fossoyeuse.",
    ["Tanis needs Linen Cloth: humanoids carry it everywhere."] =
        "Tanis a besoin d'étoffe de lin : les humanoïdes en portent partout.",
    ["Deathguard Billmuth, at the outpost."] =
        "Garde noir Billmuth, à l'avant-poste.",
    ["Deathguard Falgan, in the east of Tirisfal Glades, near the Scarlet watch post."] =
        "Garde noir Falgan, à l'est des clairières de Tirisfal, près du poste de guet écarlate.",
    ["The Scarlet zealots and friars of the watch post carry the attack plans."] =
        "Les zélotes et les frères écarlates du poste de guet portent les plans d'attaque.",
    ["From level 18: the story goes on in Silverpine Forest, around a moonsilver blade."] =
        "À partir du niveau 18 : l'histoire continue dans la forêt des Pins-Argentés, autour d'une lame en argent lunaire.",
    ["Trevan Rol, at the Sepulcher."] =
        "Trevan Rol, au Sépulcre.",
    ["Deathguard Baldren, at the Sepulcher."] =
        "Garde noir Baldren, au Sépulcre.",
    ["The charred remains lie in the east of Silverpine Forest, facing Fenris Isle."] =
        "Les restes calcinés se trouvent à l'est de la forêt des Pins-Argentés, face à l'île de Fenris.",
    ["Lumina Windsinger, held in Fenris Keep."] =
        "Lumina Windsinger, retenue dans le donjon de Fenris.",
    ["The Rot Hide gnolls of Fenris Isle carry the key."] =
        "Les gnolls Poil-Putride de l'île de Fenris portent la clé.",
    ["Lumina Windsinger waits again at the Sepulcher."] =
        "Lumina Windsinger attend de nouveau au Sépulcre.",
    ["Old Fire-Eye prowls the south of Silverpine Forest."] =
        "Old Fire-Eye rôde au sud de la forêt des Pins-Argentés.",
    ["Ott, the weaponsmith of Tarren Mill."] =
        "Ott, fabricant d'armes de Moulin-de-Tarren.",
    ["Ulric Frostveil, at Zoram'gar Outpost on the coast of Ashenvale."] =
        "Ulric Frostveil, à l'avant-poste de Zoram'gar, sur la côte d'Orneval.",
    ["From level 20: Ulric Frostveil's quest of the Kor Gem, in Ashenvale."] =
        "À partir du niveau 20 : la quête de la gemme de Kor d'Ulric Frostveil, à Orneval.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand, carry the corrupted gem. They are elite: bring a group."] =
        "Les nagas de l'entrée des profondeurs de Brassenoire, sous l'eau de la grève de Zoram, portent la gemme corrompue. Ils sont élites : viens en groupe.",
    ["Ken'jai, the priest trainer of the Valley of Trials."] =
        "Ken'jai, maître des prêtres de la vallée des Épreuves.",
    ["From level 5: heal a wounded grunt, and get your first robe."] =
        "À partir du niveau 5 : soigne un grunt blessé, et obtiens ta première robe.",
    ["Tai'jin, the priest trainer of Razor Hill."] =
        "Tai'jin, maître des prêtres de Tranchecolline.",
    ["Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "La grunt Kor'ja gît blessée au sud de Tranchecolline : soigne-la avec Soins inférieurs, puis donne-lui Mot de pouvoir : Robustesse.",
    ["Dark Cleric Duesten, the priest trainer of Deathknell."] =
        "Sombre clerc Duesten, maître des prêtres du Glas.",
    ["From level 5: heal a wounded deathguard, and get your first robe."] =
        "À partir du niveau 5 : soigne un garde noir blessé, et obtiens ta première robe.",
    ["Dark Cleric Beryl, the priest trainer of Brill."] =
        "Sombre clerc Beryl, maître des prêtres de Brill.",
    ["Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "Le garde noir Kel gît blessé au nord de Brill : soigne-le avec Soins inférieurs, puis donne-lui Mot de pouvoir : Robustesse.",
    ["From level 10: the quest that teaches Hex of Weakness."] =
        "À partir du niveau 10 : la quête qui t'apprend Maléfice de faiblesse.",
    ["Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits."] =
        "Ur'kyo, maître des prêtres d'Orgrimmar, dans la vallée des Esprits.",
    ["Aelthalyste, the priest trainer of the Undercity, in the War Quarter."] =
        "Aelthalyste, maître des prêtres de Fossoyeuse, dans le quartier de la Guerre.",
    ["From level 10: the quest that teaches Touch of Weakness."] =
        "À partir du niveau 10 : la quête qui t'apprend Toucher de faiblesse.",
    ["From level 20: the quest that teaches Shadowguard."] =
        "À partir du niveau 20 : la quête qui t'apprend Garde des ténèbres.",
    ["From level 20: the quest that teaches Devouring Plague."] =
        "À partir du niveau 20 : la quête qui t'apprend Peste dévorante.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it."] =
        "Apprends Crochetage auprès de ton maître, puis entraîne-toi sur des coffrets jusqu'à ce que ta compétence atteigne 75 : le coffret de Gallywix, au niveau 20, l'exige.",
    ["Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar."] =
        "Shenthul, dans une tente de la Faille de l'ombre, à Orgrimmar.",
    ["Shenthul greets you with a hand sign: answer it with the salute emote."] =
        "Shenthul te salue d'un signe de la main : réponds-lui avec l'emote de salut.",
    ["By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him."] =
        "Près de la tour de la KapitalRisk, tout au nord des Tarides : cible le sous-chef Fizzule, tire deux fois avec le pistolet de signalisation, puis salue-le.",
    ["In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox."] =
        "Dans la tour : subtilise la clé de Silixiz dans sa poche, tue les gardes étage par étage, Gallywix au sommet, puis ouvre son coffret.",
    ["The lockbox leaves a sickness on you: Shenthul sends you to be cured."] =
        "Le coffret te laisse une maladie : Shenthul t'envoie te faire soigner.",
    ["Serge Hinott, the alchemist of Tarren Mill."] =
        "Serge Hinott, alchimiste de Moulin-de-Tarren.",
    ["Stay by Serge while he prepares the cure."] =
        "Reste près de Serge pendant qu'il prépare le remède.",
    ["Canaga Earthcaller, in the Valley of Trials."] =
        "Canaga Earthcaller, dans la vallée des Épreuves.",
    ["The Felstalkers of the valley carry the hooves."] =
        "Les Traqueurs corrompus de la vallée portent les sabots.",
    ["Up the hill path south of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "En haut du sentier de la colline au sud de la vallée : bois le Sapta de terre pour voir la Manifestation de terre mineure.",
    ["Seer Ravenfeather, in Camp Narache."] =
        "Prophétesse Ravenfeather, au camp Narache.",
    ["The Bristleback shamans east of the camp carry the salve."] =
        "Les chamans Dos-hirsute à l'est du camp portent le baume.",
    ["On the hill south of the camp: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "Sur la colline au sud du camp : bois le Sapta de terre pour voir la Manifestation de terre mineure.",
    ["Windshaper Boro, on Zephras Isle."] =
        "Windshaper Boro, sur l'île de Zephras.",
    ["Drink the Earth Sapta to see the Minor Manifestation of Earth, east of Boro."] =
        "Bois le Sapta de terre pour voir la Manifestation de terre mineure, à l'est de Boro.",
    ["Swart, the shaman trainer of Razor Hill."] =
        "Swart, maître des chamans de Tranchecolline.",
    ["Narm Skychaser, the shaman trainer of Bloodhoof Village."] =
        "Narm Skychaser, maître des chamans du village de Sabot-de-Sang.",
    ["Kranal Fiss, at the Far Watch Post on the border of the Barrens."] =
        "Kranal Fiss, au poste de garde extérieur, à la frontière des Tarides.",
    ["Telf Joolam, on top of a mountain in the west of Durotar."] =
        "Telf Joolam, au sommet d'une montagne à l'ouest de Durotar.",
    ["The Razormane of the northern Barrens carry the Fire Tar; the Burning Blade cultists of the cave north of Razor Hill carry the pouches."] =
        "Les Tranchecrin du nord des Tarides portent le Goudron de feu ; les sectateurs de la Lame ardente de la grotte au nord de Tranchecolline portent les bourses.",
    ["Right by Telf: drink the Fire Sapta, then defeat the Minor Manifestation of Fire for its ember."] =
        "Juste à côté de Telf : bois le Sapta de feu, puis vaincs la Manifestation de feu mineure pour obtenir sa braise.",
    ["Sessaria Skystride, on Zephras Isle."] =
        "Sessaria Skystride, sur l'île de Zephras.",
    ["Olariaan Swiftburn, in the south of the isle."] =
        "Olariaan Swiftburn, au sud de l'île.",
    ["Skypriest Faladiel carries the heart."] =
        "Skypriest Faladiel porte le cœur.",
    ["Kuramaa, the spirit of mischief, carries the mask."] =
        "Kuramaa, l'esprit de la malice, porte le masque.",
    ["Light the Brazier of Offering by Olariaan, then the Brazier of Eternal Flame by Sessaria."] =
        "Allume le brasero de l'Offrande près d'Olariaan, puis le brasero de la Flamme éternelle près de Sessaria.",
    ["Searn Firewarder, in the Valley of Wisdom of Orgrimmar."] =
        "Searn Firewarder, dans la vallée de la Sagesse d'Orgrimmar.",
    ["Xanis Flameweaver, on the Elder Rise of Thunder Bluff."] =
        "Xanis Flameweaver, sur la cime des Anciens des Pitons-du-Tonnerre.",
    ["Islen Waterseer, by the coast east of the Barrens."] =
        "Islen Waterseer, près de la côte à l'est des Tarides.",
    ["Brine, in the south of the Barrens."] =
        "Brine, au sud des Tarides.",
    ["Fill the waterskin at the quilboar watering hole, right by Brine."] =
        "Remplis l'outre au point d'eau des hurans, juste à côté de Brine.",
    ["Fill it at the Spring Well of Tarren Mill, in Hillsbrad Foothills."] =
        "Remplis-la au Puits de printemps de Moulin-de-Tarren, dans les Contreforts de Hautebrande.",
    ["Fill it at the ruins of the Stardust Fountain, in the south of Ashenvale."] =
        "Remplis-la aux ruines de la fontaine de Chimétoile, au sud d'Orneval.",
    ["By the Brazier of Everfount, in the lake of Silverpine Forest: use the brazier's water, then defeat the corrupt manifestation for its bracers."] =
        "Près du Brasero d'Everfount, dans le lac de la forêt des Pins-Argentés : utilise l'eau du brasero, puis vaincs la manifestation corrompue pour obtenir ses brassards.",
    ["The Minor Manifestation of Water rises beside the brazier."] =
        "La Manifestation d'eau mineure s'élève à côté du brasero.",
    ["Prate Cloudseer, on a mesa in the middle of Thousand Needles."] =
        "Prate Cloudseer, sur une mesa au centre de Mille pointes.",
    ["Rau Cliffrunner, at Freewind Post."] =
        "Rau Cliffrunner, au poste de Librevent.",
    ["From level 33: Forever's elemental quests of Rau Cliffrunner, in Thousand Needles."] =
        "À partir du niveau 33 : les quêtes élémentaires de Forever de Rau Cliffrunner, à Mille pointes.",
    ["Beram Skychaser in Thunder Bluff, or Sagorne Creststrider in Orgrimmar."] =
        "Beram Skychaser aux Pitons-du-Tonnerre, ou Sagorne Creststrider à Orgrimmar.",
    ["From level 50: Bath'rah the Windwatcher's chain, which ends in the Temple of Atal'Hakkar."] =
        "À partir du niveau 50 : la chaîne de Bath'rah la Vigie des vents, qui se termine dans le temple d'Atal'Hakkar.",
    ["One Elemental Earth, Fire, Water and Air: elementals drop them, or the auction house sells them."] =
        "Une Terre, un Feu, une Eau et un Air élémentaires : les élémentaires les laissent tomber, ou l'hôtel des ventes les vend.",
    ["The spiders and the bears of the Western Plaguelands carry the eyes and the claws."] =
        "Les araignées et les ours des Maleterres de l'Ouest portent les yeux et les griffes.",
    ["Ruzan, in the Valley of Trials."] =
        "Ruzan, dans la vallée des Épreuves.",
    ["Your trainer's first errand, in the Valley of Trials."] =
        "La première course de ton maître, dans la vallée des Épreuves.",
    ["The Vile Familiars of the cave south of the valley carry the heads."] =
        "Les Vils quasits de la grotte au sud de la vallée portent les têtes.",
    ["Zureetha Fargaze, beside Ruzan."] =
        "Zureetha Fargaze, à côté de Ruzan.",
    ["Venya Marthand, in Deathknell."] =
        "Venya Marthand, au Glas.",
    ["Your trainer's first errand, in Deathknell."] =
        "La première course de ton maître, au Glas.",
    ["The Rattlecage Skeletons east of Deathknell carry the skulls."] =
        "Les Squelettes Cliquethorax à l'est du Glas portent les crânes.",
    ["Ophek, in Razor Hill, sends you to Orgrimmar."] =
        "Ophek, à Tranchecolline, t'envoie à Orgrimmar.",
    ["Gan'rul Bloodeye, in the Cleft of Shadow of Orgrimmar."] =
        "Gan'rul Bloodeye, dans la Faille de l'ombre d'Orgrimmar.",
    ["The Tablet of Verga lies in the Burning Blade stash at the back of Skull Rock, in the north of Durotar."] =
        "La Tablette de Verga se trouve dans la planque de la Lame ardente, au fond du rocher du Crâne, au nord de Durotar.",
    ["Right by Gan'rul: use the glyphs on the summoning circle, then defeat the voidwalker."] =
        "Juste à côté de Gan'rul : utilise les glyphes sur le cercle d'invocation, puis vaincs le marcheur du Vide.",
    ["Ageron Kargal, in Brill, sends you to the Undercity."] =
        "Ageron Kargal, à Brill, t'envoie à Fossoyeuse.",
    ["Carendin Halgar, in the Magic Quarter of the Undercity."] =
        "Carendin Halgar, dans le quartier de la Magie de Fossoyeuse.",
    ["Egalin's Grimoire lies in Perrine's chest, in the house south of Brill."] =
        "Le Grimoire d'Egalin se trouve dans le coffre de Perrine, dans la maison au sud de Brill.",
    ["Right by Carendin: use the runes on the summoning circle, then defeat the voidwalker."] =
        "Juste à côté de Carendin : utilise les runes sur le cercle d'invocation, puis vaincs le marcheur du Vide.",
    ["Cazul, in the Cleft of Shadow."] =
        "Cazul, dans la Faille de l'ombre.",
    ["Zankaja, in the Valley of Spirits of Orgrimmar."] =
        "Zankaja, dans la vallée des Esprits d'Orgrimmar.",
    ["Gazrog, at the Crossroads."] =
        "Gazrog, à la Croisée.",
    ["Ken'zigla, at the camp of Malaka'jin in the far south of Stonetalon Mountains."] =
        "Ken'zigla, au camp de Malaka'jin, tout au sud des Serres-Rocheuses.",
    ["Grunt Logmar, by the road north of Camp Taurajo."] =
        "Grunt Logmar, près de la route au nord du camp Taurajo.",
    ["Grunt Dogran is held by the Kolkar in the Barrens: give him the draught."] =
        "Le grunt Dogran est retenu par les Kolkar dans les Tarides : donne-lui le breuvage.",
    ["Right by Gan'rul: use Dogran's pendant on the summoning circle, then defeat the succubus."] =
        "Juste à côté de Gan'rul : utilise le pendentif de Dogran sur le cercle d'invocation, puis vaincs la succube.",
    ["Jorah Annison, in the Magic Quarter of the Undercity."] =
        "Jorah Annison, dans le quartier de la Magie de Fossoyeuse.",
    ["The Dragonmaw orcs of the Wetlands carry the rod: Alliance land, stay clear of the guards."] =
        "Les orcs Dragonmaw des Paluns portent le bâtonnet : terre de l'Alliance, évite les gardes.",
    ["Zevrost, the warlock trainer of the Cleft of Shadow."] =
        "Zevrost, maître des démonistes de la Faille de l'ombre.",
    ["Kurgul, the demon trainer of the Cleft of Shadow."] =
        "Kurgul, maître des démons de la Faille de l'ombre.",
    ["Your warrior trainer, in Razor Hill or Bloodhoof Village, sends you to Uzzek."] =
        "Ton maître des guerriers, à Tranchecolline ou au village de Sabot-de-Sang, t'envoie voir Uzzek.",
    ["Uzzek, at the Far Watch Post on the border of the Barrens."] =
        "Uzzek, au poste de garde extérieur, à la frontière des Tarides.",
    ["From level 10: the quest that teaches Defensive Stance."] =
        "À partir du niveau 10 : la quête qui t'apprend Posture défensive.",
    ["The Thunder Lizards of the north of Durotar carry the scales."] =
        "Les Lézards-tonnerre du nord de Durotar portent les écailles.",
    ["Thun'grim Firegaze, on a hill east of the Crossroads."] =
        "Thun'grim Firegaze, sur une colline à l'est de la Croisée.",
    ["The steel bars lie in the Razormane camp below the hill."] =
        "Les barres d'acier se trouvent dans le camp des Tranchecrin, en contrebas de la colline.",
    ["Austil de Mon, the warrior trainer of Brill."] =
        "Austil de Mon, maître des guerriers de Brill.",
    ["Deathguard Dillinger, in Brill."] =
        "Garde noir Dillinger, à Brill.",
    ["Open the mausoleum north of Brill: Ulag the Cleaver comes out."] =
        "Ouvre le mausolée au nord de Brill : Ulag le Fendeur en sort.",
    ["Coleman Farthing, in the inn of Brill."] =
        "Coleman Farthing, à l'auberge de Brill.",
    ["The four heirlooms lie in the crypt of the Agamand Mills, in the northwest of Tirisfal Glades."] =
        "Les quatre reliques de famille se trouvent dans la crypte des moulins d'Agamand, au nord-ouest des clairières de Tirisfal.",
    -- Ding! - Dungeon quests (hand-written guides)
    ["The Hall of Thanes"] =
        "Le Hall des Thanes",
    ["Afadra Dunwall and Thom Filch, in the west of Ironforge."] =
        "Afadra Dunwall et Thom Filch, à l'ouest de Forgefer.",
    ["Two quests of the hall: a leather belt or mail bracers, cloth gloves or an off-hand tome."] =
        "Deux quêtes du hall : une ceinture en cuir ou des brassards en mailles, des gants en tissu ou un tome tenu en main gauche.",
    ["The Dark Iron spies of the east of Dun Morogh may drop a Dark Iron map: read it."] =
        "Les espions Sombrefer de l'est de Dun Morogh peuvent laisser tomber une carte Sombrefer : lis-la.",
    ["The Dark Iron map opens Old Ironforge Incursion: a gun, a wand or a two-handed mace."] =
        "La carte Sombrefer ouvre Old Ironforge Incursion : un fusil, une baguette ou une masse à deux mains.",
    ["Earthseer Farsen, in the east of Dun Morogh."] =
        "Earthseer Farsen, à l'est de Dun Morogh.",
    ["Enter the Hall of Thanes"] =
        "Entre dans le Hall des Thanes",
    ["The hall lies beneath Old Ironforge, in the west of the city."] =
        "Le hall se trouve sous le Vieux Forgefer, à l'ouest de la cité.",
    ["Kill the enraged apparitions and the tormented souls of the hall, then put the spirit of Anvilmar to rest."] =
        "Tue les apparitions enragées et les âmes tourmentées du hall, puis apaise l'esprit d'Anvilmar.",
    ["The dwarven heirlooms lie around the hall."] =
        "Les reliques de famille naines se trouvent un peu partout dans le hall.",
    ["The Treaty of Understanding lies in the hall: take it, then read it."] =
        "Le Treaty of Understanding se trouve dans le hall : ramasse-le, puis lis-le.",
    ["Durgen Dirgehammer carries the head the quest asks for."] =
        "Durgen Dirgehammer porte la tête que demande la quête.",
    ["Afadra Dunwall and Thom Filch, in Ironforge."] =
        "Afadra Dunwall et Thom Filch, à Forgefer.",
    ["King Magni Bronzebeard, in the High Seat of Ironforge."] =
        "Roi Magni Bronzebeard, dans la salle du trône de Forgefer.",
    ["King Magni Bronzebeard."] =
        "Roi Magni Bronzebeard.",
    ["Wailing Caverns"] =
        "Cavernes des Lamentations",
    ["Mebok Mizzyrix, in Ratchet."] =
        "Mebok Mizzyrix, à Cabestan.",
    ["Raptor Horns opens Smart Drinks, a quest of the caverns."] =
        "La quête Les cornes de raptors ouvre Les potions d'intelligence, une quête des cavernes.",
    ["Crane Operator Bigglefuzz, on the docks of Ratchet."] =
        "Grutier Bigglefuzz, sur les docks de Cabestan.",
    ["The sunscale raptors roam the plains between the Crossroads and Ratchet."] =
        "Les raptors solécaille parcourent les plaines entre la Croisée et Cabestan.",
    ["Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge."] =
        "Nalpak et Ebru se tiennent dans une grotte sur la colline des cavernes : grimpe la colline par l'est, suis le sentier et saute sur la corniche rocheuse.",
    ["Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand."] =
        "Deux quêtes sur les créatures déviantes ; parmi leurs récompenses, un sac, des jambières en cuir, des gantelets en mailles ou une baguette.",
    ["Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door."] =
        "Magglish le Dingue, un gobelin qui reste caché, parcourt les grottes autour de la porte du donjon.",
    ["Enter Wailing Caverns"] =
        "Entre dans les cavernes des Lamentations",
    ["The mouth of the caverns opens on the hill above the Lushwater Oasis."] =
        "L'entrée des cavernes s'ouvre sur la colline qui domine l'oasis Luxuriante.",
    ["Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on."] =
        "Chaque créature déviante laisse tomber des peaux : raptors, flagellants et serpents, dès les premières salles.",
    ["The ectoplasms, living oozes of the caverns, drop the essence."] =
        "Les ectoplasmes, des limons vivants des cavernes, laissent tomber l'essence.",
    ["Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in."] =
        "Ravageurs et vipères peuplent les premières salles ; les glacials et les crocs-d'effroi viennent plus loin.",
    ["Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead."] =
        "Mutanus le Dévoreur peut laisser tomber l'Eclat luminescent : il apparaît après le rituel du Disciple de Naralex, qui commence une fois les quatre seigneurs du Croc morts.",
    ["Nalpak and Ebru, in their cave on the caverns' hill."] =
        "Nalpak et Ebru, dans leur grotte sur la colline des cavernes.",
    ["Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet."] =
        "Mebok Mizzyrix et Grutier Bigglefuzz, à Cabestan.",
    ["Sputtervalve, in Ratchet, knows what the shard is."] =
        "Sputtervalve, à Cabestan, sait ce qu'est l'éclat.",
    ["Falla Sagewind, on top of the caverns' hill."] =
        "Falla Sagewind, au sommet de la colline des cavernes.",
    ["Mathrengyl Bearwalker, in the Cenarion Enclave of Darnassus."] =
        "Mathrengyl Bearwalker, dans l'Enclave cénarienne de Darnassus.",
    ["The Deadmines"] =
        "Les Mortemines",
    ["Wilder Thistlenettle, in the Dwarven District of Stormwind."] =
        "Wilder Crispechardon, dans le quartier des Nains de Hurlevent.",
    ["Two quests of the mine under Moonbrook; their rewards include a two-handed axe and cloth, leather or mail armor."] =
        "Deux quêtes de la mine sous Ruisselune ; parmi leurs récompenses, une hache à deux mains et une armure en tissu, en cuir ou en mailles.",
    ["Shoni the Shilent, in the Dwarven District."] =
        "Shoni la Silencieuse, dans le quartier des Nains.",
    ["Reward: armor of leather or mail, or a wand."] =
        "Récompense : une armure en cuir ou en mailles, ou une baguette.",
    ["Gryan Stoutmantle, in the tower of Sentinel Hill, in Westfall."] =
        "Gryan Stoutmantle, dans la tour de la colline des Sentinelles, dans la Marche de l'Ouest.",
    ["A long chain of six quests between Westfall, Redridge and Stormwind: it leads to VanCleef, whose head brings mail leggings, a leather tunic or a staff."] =
        "Une longue chaîne de six quêtes entre la Marche de l'Ouest, les Carmines et Hurlevent : elle mène à VanCleef, dont la tête rapporte des jambières en mailles, une tunique en cuir ou un bâton.",
    ["Alba Fairmoon, south-west of Sentinel Hill."] =
        "Alba Fairmoon, au sud-ouest de la colline des Sentinelles.",
    ["A quest of the mine under Moonbrook, ended at the Deadmines' exit."] =
        "Une quête de la mine sous Ruisselune, rendue à la sortie des Mortemines.",
    ["Wiley the Black, in the inn of Lakeshire, in Redridge."] =
        "Wiley le noir, à l'auberge de Comté-du-Lac, dans les Carmines.",
    ["Gryan Stoutmantle, at Sentinel Hill."] =
        "Gryan Stoutmantle, à la colline des Sentinelles.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town, in Stormwind."] =
        "Maître Mathias Shaw, dans la maison du SI:7 de la vieille ville, à Hurlevent.",
    ["The Defias Messenger walks the road to Moonbrook; he carries the message."] =
        "Le Messager défias parcourt la route de Ruisselune ; il porte le message.",
    ["Follow the Defias Traitor to Moonbrook; Defias attack on the way."] =
        "Suis le traître défias jusqu'à Ruisselune ; des Défias attaquent en chemin.",
    ["Scout Riell, at the top of the Sentinel Hill tower."] =
        "Eclaireur Riell, au sommet de la tour de la colline des Sentinelles.",
    ["Reward: a weapon of your choice."] =
        "Récompense : une arme de ton choix.",
    ["Go down into the mine under Moonbrook"] =
        "Descends dans la mine sous Ruisselune",
    ["The mine opens inside a house in the middle of Moonbrook."] =
        "La mine s'ouvre dans une maison au centre de Ruisselune.",
    ["Foreman Thistlenettle and the undead miners roam the mine's tunnels, before the dungeon's door."] =
        "Le contremaître Crispechardon et les mineurs morts-vivants rôdent dans les tunnels de la mine, avant la porte du donjon.",
    ["Plant the explosives by the forge hidden in the Deadmines."] =
        "Place les explosifs près de la forge cachée dans les Mortemines.",
    ["Every Defias of the dungeon may drop a bandana."] =
        "Chaque Défias du donjon peut laisser tomber un masque.",
    ["Sneed's Shredder, the second boss, in the goblins' lumber cave, drops the Gnoam Sprecklesprocket."] =
        "Le Déchiqueteur de Sneed, le deuxième boss, dans la grotte des bûcherons gobelins, laisse tomber l'Indicateur Gnoam.",
    ["Edwin VanCleef, the last boss, waits on the deck of the Defias ship at the end of the cave."] =
        "Edwin VanCleef, le dernier boss, attend sur le pont du navire défias, au fond de la grotte.",
    ["VanCleef drops a letter: read it to take its quest."] =
        "VanCleef laisse tomber une lettre : lis-la pour prendre sa quête.",
    ["Alba Fairmoon waits at the Deadmines' exit, on the coast south-west of Moonbrook."] =
        "Alba Fairmoon attend à la sortie des Mortemines, sur la côte au sud-ouest de Ruisselune.",
    ["Use her detonator, then tell her."] =
        "Utilise son détonateur, puis préviens-la.",
    ["Gryan Stoutmantle and Scout Riell, in the Sentinel Hill tower."] =
        "Gryan Stoutmantle et l'éclaireur Riell, dans la tour de la colline des Sentinelles.",
    ["Baros Alexston, in the City Hall of the Cathedral Square."] =
        "Baros Alexston, à l'hôtel de ville de la place de la Cathédrale.",
    ["Bazil Thredd leads to the Stockade's riots."] =
        "Bazil Thredd mène aux émeutes de la Prison.",
    ["Warden Thelwater, at the door of the Stockade, in Stormwind."] =
        "Gardien Thelwater, à la porte de la Prison, à Hurlevent.",
    ["Ruins of Lordaeron"] =
        "Ruines de Lordaeron",
    ["Enter the Ruins of Lordaeron"] =
        "Entre dans les ruines de Lordaeron",
    ["The ruins rise above Undercity, in Tirisfal Glades: Horde land, keep your guard up."] =
        "Les ruines se dressent au-dessus de Fossoyeuse, dans les clairières de Tirisfal : terre de la Horde, reste sur tes gardes.",
    ["The undead of the ruins may drop a bloodied insignia: read it."] =
        "Les morts-vivants des ruines peuvent laisser tomber un insigne ensanglanté : lis-le.",
    ["Reward: leather leggings or mail armor."] =
        "Récompense : des jambières en cuir ou une armure en mailles.",
    ["Ten insignias, from the undead of the ruins."] =
        "Dix insignes, sur les morts-vivants des ruines.",
    ["The Crest of Lordaeron lies in the ruins: take it, then read it."] =
        "Le Crest of Lordaeron se trouve dans les ruines : ramasse-le, puis lis-le.",
    ["Reward: a small sack of gems."] =
        "Récompense : un petit sac de gemmes.",
    ["Edward Heartweaver's last letter lies in the ruins: read it."] =
        "La dernière lettre d'Edward Heartweaver se trouve dans les ruines : lis-la.",
    ["General Marcus Jonathan, at the gate of Stormwind."] =
        "Général Marcus Jonathan, à la porte de Hurlevent.",
    ["Lady Dena Kennedy, in Stormwind."] =
        "Lady Dena Kennedy, à Hurlevent.",
    ["Orphan Matron Nightingale, at the orphanage of Stormwind."] =
        "Directrice de l'orphelinat Nightingale, à l'orphelinat de Hurlevent.",
    ["Blackfathom Deeps"] =
        "Profondeurs de Brassenoire",
    ["Argos Nightwhisper, in Stormwind."] =
        "Argos Nightwhisper, à Hurlevent.",
    ["Optional: a lead to Auberdine, worth about 1,450 XP once there."] =
        "Facultatif : une piste vers Auberdine, qui rapporte environ 1\194\160450 XP une fois là-bas.",
    ["Gerrig Bonegrip, in the Forlorn Cavern of Ironforge."] =
        "Gerrig Bonegrip, dans la Caverne lugubre de Forgefer.",
    ["Reward: a ring."] =
        "Récompense : un anneau.",
    ["Gershala Nightwhisper, in Auberdine, in Darkshore."] =
        "Gershala Nightwhisper, à Auberdine, en Sombrivage.",
    ["Gershala Nightwhisper, in Auberdine."] =
        "Gershala Nightwhisper, à Auberdine.",
    ["Reward: cloth, leather or mail armor."] =
        "Récompense : une armure en tissu, en cuir ou en mailles.",
    ["Argent Guard Manados and Dawnwatcher Shaedlass, in Darnassus."] =
        "Garde d'argent Manados et le veilleur de l'aube Shaedlass, à Darnassus.",
    ["Two quests of the Argent Dawn: the second leads to Twilight Lord Kelris and a wand, a shield or leather armor."] =
        "Deux quêtes de l'Aube d'argent : la seconde mène au seigneur du crépuscule Kelris et à une baguette, un bouclier ou une armure en cuir.",
    ["Enter Blackfathom Deeps"] =
        "Entre dans les profondeurs de Brassenoire",
    ["The deeps open in ruins half under water, on the coast of Ashenvale's Zoram Strand."] =
        "Les profondeurs s'ouvrent dans des ruines à moitié sous l'eau, sur la côte de la grève de Zoram, à Orneval.",
    ["The Blackfathom and Fallenroot creatures carry the brain stems, from the cave before the dungeon's door on."] =
        "Les créatures de Brassenoire et les Sans-racines portent les souches de cerveau, dès la grotte qui précède la porte du donjon.",
    ["The manuscript lies in a chest under the water, by Ghamoo-ra, the first boss, in the Pool of Ask'ar."] =
        "Le manuscrit se trouve dans un coffre sous l'eau, près de Ghamoo-ra, le premier boss, dans le bassin d'Ask'ar.",
    ["Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar."] =
        "Le garde d’argent Thaelrid attend dans une grotte sous-marine au sud-ouest du bassin d'Ask'ar.",
    ["Every Twilight cultist of the deeps may drop a pendant."] =
        "Chaque sectateur du crépuscule des profondeurs peut laisser tomber un pendentif.",
    ["Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum."] =
        "Le seigneur du crépuscule Kelris, le quatrième boss, tient le sanctuaire lunaire.",
    ["Argent Guard Manados, in Darnassus."] =
        "Garde d'argent Manados, à Darnassus.",
    ["Dawnwatcher Selgorm, beside him in Darnassus."] =
        "Veilleur de l'aube Selgorm, à côté de lui à Darnassus.",
    ["The Stockade"] =
        "La Prison",
    ["Motley Garmason, at Dun Modr, in the north of the Wetlands."] =
        "Motley Garmason, à Dun Modr, au nord des Paluns.",
    ["Far north in the Wetlands: it opens The Fury Runs Deep, whose reward is a two-handed mace or a leather belt."] =
        "Tout au nord des Paluns : elle ouvre Fureur dans les Profondeurs, dont la récompense est une masse à deux mains ou une ceinture en cuir.",
    ["The Dark Iron dwarves camp around Dun Modr."] =
        "Les nains Sombrefer campent autour de Dun Modr.",
    ["Guard Berton, in Lakeshire, in Redridge."] =
        "Garde Berton, à Comté-du-Lac, dans les Carmines.",
    ["Reward: a staff, a sword or a two-handed mace."] =
        "Récompense : un bâton, une épée ou une masse à deux mains.",
    ["Councilman Millstipe, in the town hall of Darkshire, in Duskwood."] =
        "Conseiller Millstipe, à l'hôtel de ville de Sombre-Comté, au Bois de la Pénombre.",
    ["Nikova Raskol, in Old Town, in Stormwind."] =
        "Nikova Raskol, dans la vieille ville, à Hurlevent.",
    ["Warden Thelwater, at the door of the Stockade."] =
        "Gardien Thelwater, à la porte de la Prison.",
    ["Warden Thelwater asks for Bazil Thredd's head."] =
        "Le gardien Thelwater demande la tête de Bazil Thredd.",
    ["Enter the Stockade"] =
        "Entre dans la Prison",
    ["The prison's door is by Warden Thelwater, in Stormwind."] =
        "La porte de la prison se trouve près du gardien Thelwater, à Hurlevent.",
    ["Targorr the Dread, the first boss, sits in a cell near the start."] =
        "Targorr le Terrifiant, le premier boss, est assis dans une cellule près de l'entrée.",
    ["Kam Deepfury: go north, then east; he waits in the second small cell on the left."] =
        "Kam Deepfury : va au nord, puis à l'est ; il attend dans la deuxième petite cellule à gauche.",
    ["Bazil Thredd waits at the end of the east corridor."] =
        "Bazil Thredd attend au bout du couloir est.",
    ["Dextren Ward waits at the end of the west corridor."] =
        "Dextren Ward attend au bout du couloir ouest.",
    ["The prisoners, convicts and insurgents fill every cell; the Defias among them drop the bandanas."] =
        "Les prisonniers, détenus et insurgés remplissent toutes les cellules ; les Défias parmi eux laissent tomber les foulards.",
    ["Optional: nine more quests in Stormwind; the last brings a ring and about 3,750 XP."] =
        "Facultatif : neuf quêtes de plus à Hurlevent ; la dernière rapporte un anneau et environ 3\194\160750 XP.",
    ["Baros Alexston, in the City Hall."] =
        "Baros Alexston, à l'hôtel de ville.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town."] =
        "Maître Mathias Shaw, dans la maison du SI:7 de la vieille ville.",
    ["Elling Trias, in the cheese shop of the Trade District."] =
        "Elling Trias, dans la fromagerie du quartier commerçant.",
    ["Tyrion, near Stormwind Keep."] =
        "Tyrion, près du donjon de Hurlevent.",
    ["Three silk cloth, and two of Clara's fresh apples, from a basket north-west of Goldshire, in Elwynn Forest."] =
        "Trois étoffes de soie, et deux Pommes fraîches de Clara, dans un panier au nord-ouest de Comté-de-l'Or, dans la forêt d'Elwynn.",
    ["Wait in the garden by Stormwind Keep until Lord Gregor Lescovar and Marzon the Silent Blade have talked, then defeat both."] =
        "Attends dans le jardin près du donjon de Hurlevent que le seigneur Gregor Lescovar et Marzon Lame silencieuse aient parlé, puis vaincs-les tous les deux.",
    ["Elling Trias, in the cheese shop."] =
        "Elling Trias, dans la fromagerie.",
    ["Master Mathias Shaw, in the SI:7 house."] =
        "Maître Mathias Shaw, dans la maison du SI:7.",
    ["Lady Katrana Prestor, beside the king in Stormwind Keep."] =
        "Dame Katrana Prestor, à côté du roi, dans le donjon de Hurlevent.",
    ["Nikova Raskol, in Old Town."] =
        "Nikova Raskol, dans la vieille ville.",
    ["Guard Berton, in Lakeshire."] =
        "Garde Berton, à Comté-du-Lac.",
    ["Councilman Millstipe, in Darkshire."] =
        "Conseiller Millstipe, à Sombre-Comté.",
    ["Motley Garmason, at Dun Modr."] =
        "Motley Garmason, à Dun Modr.",
    ["Excavation Site: Wetlands"] =
        "Site de fouilles : Paluns",
    ["James Halloran, the tanner of Menethil Harbor, in the Wetlands."] =
        "James Halloran, tanneur de Menethil, dans les Paluns.",
    ["Caitlin Grassman, in Menethil Harbor."] =
        "Caitlin Grassman, à Menethil.",
    ["Optional: the guide does not know yet who ends this search; its follow-up brings a satchel of potions."] =
        "Facultatif : le guide ne sait pas encore qui termine cette recherche ; sa suite rapporte une sacoche de potions.",
    ["Rethiel the Greenwarden, in the middle of the Wetlands."] =
        "Rethiel le Gouverneur vert, au centre des Paluns.",
    ["Reward: an axe, and about 3,200 XP."] =
        "Récompense : une hache, et environ 3\194\160200 XP.",
    ["Dorin Songblade, the armorer of Lakeshire, in Redridge."] =
        "Dorin Songblade, armurier de Comté-du-Lac, dans les Carmines.",
    ["Optional: the guide does not know yet who ends this search."] =
        "Facultatif : le guide ne sait pas encore qui termine cette recherche.",
    ["Enter the Excavation Site"] =
        "Entre dans le site de fouilles",
    ["The excavation site opens by the dig in the middle of the Wetlands."] =
        "Le site de fouilles s'ouvre près des fouilles, au centre des Paluns.",
    ["Four thicket raptor hides, from the raptors of the site."] =
        "Quatre peaux de raptor des fourrés, sur les raptors du site.",
    ["A Highland Horror carries the root core."] =
        "Un Highland Horror porte le cœur de racine.",
    ["Ardin Grassman, somewhere in the site."] =
        "Ardin Grassman, quelque part dans le site.",
    ["Daewyn, somewhere in the site."] =
        "Daewyn, quelque part dans le site.",
    ["The relic guardians may drop a Titan relic: read it."] =
        "Les gardiens des reliques peuvent laisser tomber une relique des Titans : lis-la.",
    ["The Titan relic leads to Ironforge's explorers: a staff or a two-handed mace."] =
        "La relique des Titans mène aux explorateurs de Forgefer : un bâton ou une masse à deux mains.",
    ["Prospector Whelgar, at his excavation camp in the Wetlands."] =
        "Prospecteur Whelgar, à son camp de fouilles dans les Paluns.",
    ["Rethiel the Greenwarden."] =
        "Rethiel le Gouverneur vert.",
    ["James Halloran, in Menethil Harbor."] =
        "James Halloran, à Menethil.",
    ["Dorin Songblade, in Lakeshire."] =
        "Dorin Songblade, à Comté-du-Lac.",
    ["High Explorer Magellas, in the Hall of Explorers of Ironforge."] =
        "Grand Explorateur Magellas, dans le Hall des explorateurs de Forgefer.",
    ["Gnomeregan"] =
        "Gnomeregan",
    ["Shoni the Shilent, in the Dwarven District of Stormwind."] =
        "Shoni la Silencieuse, dans le quartier des Nains de Hurlevent.",
    ["Reward: cloth or leather gloves, or an axe."] =
        "Récompense : des gants en tissu ou en cuir, ou une hache.",
    ["Brother Sarno, in the Cathedral of Light."] =
        "Frère Sarno, dans la cathédrale de la Lumière.",
    ["Optional: a lead to Tinkmaster Overspark in Ironforge."] =
        "Facultatif : une piste vers le maître-artisan Overspark, à Forgefer.",
    ["Tinkmaster Overspark, in Tinker Town, in Ironforge."] =
        "Maître-artisan Overspark, à Brikabrok, à Forgefer.",
    ["Tinkmaster Overspark, in Tinker Town."] =
        "Maître-artisan Overspark, à Brikabrok.",
    ["Master Mechanic Castpipe, Klockmort Spannerspan and High Tinker Mekkatorque, in Tinker Town."] =
        "Maître mécanicien Castpipe, Klockmort Spannerspan et le grand bricoleur Mekkatorque, à Brikabrok.",
    ["Tinker Town's quests: Data Rescue brings a two-handed mace or a cloak, The Grand Betrayal cloth, leather or mail armor."] =
        "Les quêtes de Brikabrok : Sauvetage de données rapporte une masse à deux mains ou une cape, La grande trahison une armure en tissu, en cuir ou en mailles.",
    ["Gnoarn, in Tinker Town."] =
        "Gnoarn, à Brikabrok.",
    ["Ozzie Togglevolt, in Kharanos, in Dun Morogh."] =
        "Ozzie Togglevolt, à Kharanos, à Dun Morogh.",
    ["Use the empty phial on the irradiated troggs that roam the gates of Gnomeregan."] =
        "Utilise la flasque vide sur les troggs irradiés qui rôdent aux portes de Gnomeregan.",
    ["Back to Ozzie Togglevolt, in Kharanos."] =
        "Retour auprès d'Ozzie Togglevolt, à Kharanos.",
    ["Enter Gnomeregan"] =
        "Entre dans Gnomeregan",
    ["The gates of Gnomeregan stand in the west of Dun Morogh."] =
        "Les portes de Gnomeregan se dressent à l'ouest de Dun Morogh.",
    ["Techbot, the first boss, waits just inside: he drops the memory core."] =
        "Techbot, le premier boss, attend juste à l'entrée : il laisse tomber la mémoire de Techbot.",
    ["The tall, square machines of the city hold the artificials; every mechanical creature may drop the guts."] =
        "Les grandes machines carrées de la cité contiennent les cerveaux mécaniques ; chaque créature mécanique peut laisser tomber les entrailles.",
    ["Use the heavy phial on a living irradiated slime, in the lower Hall of Gears; the fallout does not last long."] =
        "Utilise la flasque lourde sur une gelée irradiée vivante, dans la partie basse du Hall des engrenages ; la matière radioactive ne dure pas longtemps.",
    ["The addled leper gnomes drop the white card; the four Matrix Punchographs, from A to D, turn it yellow, blue, red, then prismatic: A on the way in, B at the bottom of the Dormitory, C on the Launch Bay's platform (Electrocutioner 6000's key opens it), D in the lower Engineering Labs."] =
        "Les lépreux perturbés laissent tomber la carte blanche ; les quatre Matrices d'encodage, de A à D, la rendent jaune, bleue, rouge, puis prismatique : A en entrant, B en bas du Dortoir, C sur la plate-forme de la Baie de lancement (la clé de l'Electrocuteur 6000 l'ouvre), D dans la partie basse des Laboratoires d'ingénierie.",
    ["Kernobee, a gnome held inside the city."] =
        "Kernobee, un gnome retenu dans la cité.",
    ["Optional: an escort, turned in at Booty Bay, far away; it rewards bracers or shoulders."] =
        "Facultatif : une escorte, à rendre à Baie-du-Butin, très loin ; elle rapporte des brassards ou des épaulières.",
    ["Lead Kernobee to the Clean Zone, by the dungeon's back door."] =
        "Conduis Kernobee jusqu'à la Zone propre, près de la porte de derrière du donjon.",
    ["The Dark Iron agents may drop a grimy ring: use it."] =
        "Les agents Sombrefer peuvent laisser tomber un anneau sali : utilise-le.",
    ["Put it in the Sparklematic 5200, a cleaning machine of the city."] =
        "Mets-le dans le Décapeur 5200, une machine de nettoyage de la cité.",
    ["Mekgineer Thermaplugg, the last boss, waits in the Tinkers' Court."] =
        "Le mekgénieur Thermaplugg, le dernier boss, attend dans la Cour des Bricoleurs.",
    ["Ozzie Togglevolt, in Kharanos."] =
        "Ozzie Togglevolt, à Kharanos.",
    ["Tinker Town, in Ironforge."] =
        "Brikabrok, à Forgefer.",
    ["Talvash del Kissel, in the Mystic Ward of Ironforge."] =
        "Talvash del Kissel, dans la Garde mystique de Forgefer.",
    ["A gold ring, for a silver bar, a moss agate and 30 silver."] =
        "Un anneau en or, contre une barre d'argent, une agate mousse et 30 pièces d'argent.",
    ["A silver bar and a moss agate: from mining, or the auction house."] =
        "Une barre d'argent et une agate mousse : en minant, ou à l'hôtel des ventes.",
    ["Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale."] =
        "Scooty, ingénieur gobelin de Baie-du-Butin, dans la vallée de Strangleronce.",
    ["Razorfen Kraul"] =
        "Kraal de Tranchebauge",
    ["Veyric Thunderhame, in the north-east of Arathi Highlands."] =
        "Veyric Thunderhame, au nord-est des Hautes-terres d'Arathi.",
    ["Shamans: Charlga Razorflank carries the note this quest asks for."] =
        "Chamans : Charlga Trancheflanc porte la note que demande cette quête.",
    ["Reward: a small container of gems."] =
        "Récompense : un petit coffre de gemmes.",
    ["Take the crate with holes and the owner's manual beside Mebok, and read the manual."] =
        "Prends la caisse percée et le manuel d'utilisateur à côté de Mebok, et lis le manuel.",
    ["The journal lies by a body in the north-west of Thousand Needles, below the Great Lift: read it."] =
        "Le journal se trouve près d'un corps au nord-ouest de Mille pointes, en contrebas du Grand ascenseur : lis-le.",
    ["Henrig Lonebrow's journal opens The Crone of the Kraul: cloth shoulders, mail belt or a shield."] =
        "Le Journal d'Henrig Lonebrow ouvre La mégère du Kraal : des épaulières en tissu, une ceinture en mailles ou un bouclier.",
    ["Falfindel Waywarder, at Thalanaar, on the eastern edge of Feralas."] =
        "Falfindel Waywarder, à Thalanaar, à la lisière est de Féralas.",
    ["Enter Razorfen Kraul"] =
        "Entre dans le kraal de Tranchebauge",
    ["The kraul's thorny mound rises in the far south of the Barrens."] =
        "Le tertre épineux du kraal se dresse tout au sud des Tarides.",
    ["Past Overlord Ramtusk, open the crate to call the gopher and use the stick on it: it digs up the tubers."] =
        "Après le seigneur Brusquebroche, ouvre la caisse pour appeler l'écureuil et utilise le bâton sur lui : il déterre les racines.",
    ["Charlga Razorflank, the last boss, holds the top of the kraul."] =
        "Charlga Trancheflanc, le dernier boss, tient le sommet du kraal.",
    ["Heralath Fallowbrook lies in the tent on the left, below Charlga Razorflank's platform."] =
        "Heralath Fallowbrook gît dans la tente de gauche, en contrebas de la plate-forme de Charlga Trancheflanc.",
    ["Reward: boots of leather or mail, or a cloak."] =
        "Récompense : des bottes en cuir ou en mailles, ou une cape.",
    ["Willix the Importer waits beside Heralath's tent."] =
        "Willix l’Importateur attend à côté de la tente d'Heralath.",
    ["Reward: a ring of your choice."] =
        "Récompense : un anneau de ton choix.",
    ["Lead Willix back to the entrance; quilboar attack on the way."] =
        "Ramène Willix jusqu'à l'entrée ; des hurans attaquent en chemin.",
    ["Every Razorfen quilboar may drop Treshala's pendant."] =
        "Chaque huran de Tranchebauge peut laisser tomber le Pendentif de Treshala.",
    ["Falfindel Waywarder, at Thalanaar."] =
        "Falfindel Waywarder, à Thalanaar.",
    ["Treshala Fallowbrook, in Darnassus."] =
        "Treshala Fallowbrook, à Darnassus.",
    ["Veyric Thunderhame, in Arathi Highlands."] =
        "Veyric Thunderhame, dans les Hautes-terres d'Arathi.",
    ["City of Dalaran"] =
        "Cité de Dalaran",
    ["Shylamiir, the herbalism trainer of Stormwind, and High Sorcerer Andromath, in the Mage Quarter."] =
        "Shylamiir, maître en herboristerie de Hurlevent, et le grand sorcier Andromath, dans le quartier des mages.",
    ["Two quests of the city from Stormwind: the blossom brings a cloak or a mail belt."] =
        "Deux quêtes de la cité, depuis Hurlevent : la fleur rapporte une cape ou une ceinture en mailles.",
    ["Emissary Jacques, in Hillsbrad Foothills."] =
        "Emissary Jacques, dans les Contreforts de Hautebrande.",
    ["The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest."] =
        "Image of Archmage Modera, près des murailles de Dalaran, à la lisière est de la forêt des Pins-Argentés.",
    ["The Image of Archmage Modera."] =
        "Image of Archmage Modera.",
    ["Archmage Modera's quests: a pendant or an off-hand rod, and an introduction to the Kirin Tor."] =
        "Les quêtes de l'archimage Modera : un pendentif ou un bâtonnet tenu en main gauche, et une présentation au Kirin Tor.",
    ["Enter the City of Dalaran"] =
        "Entre dans la cité de Dalaran",
    ["The city lies under its dome, in the west of the Alterac Mountains."] =
        "La cité se trouve sous son dôme, à l'ouest des montagnes d'Alterac.",
    ["Eight seeking remnants, eight saturated remnants and eight mana echoes, inside the city."] =
        "Huit vestiges chercheurs, huit vestiges saturés et huit échos de mana, dans la cité.",
    ["The arcane mote, inside the city."] =
        "La particule arcanique, dans la cité.",
    ["A fel infused blossom, inside the city."] =
        "Une fleur imprégnée de gangrène, dans la cité.",
    ["The mana elemental, inside the city."] =
        "L'élémentaire de mana, dans la cité.",
    ["Archmage Celindra, in the City of Dalaran."] =
        "Archmage Celindra, dans la cité de Dalaran.",
    ["The Image of Archmage Modera, by the walls of Dalaran."] =
        "Image of Archmage Modera, près des murailles de Dalaran.",
    ["Shylamiir and High Sorcerer Andromath, in Stormwind."] =
        "Shylamiir et le grand sorcier Andromath, à Hurlevent.",
    ["Scarlet Monastery"] =
        "Monastère écarlate",
    ["Brother Crowley, in the Cathedral of Light of Stormwind."] =
        "Frère Crowley, dans la cathédrale de la Lumière de Hurlevent.",
    ["Optional: a lead to Brother Anton in Desolace."] =
        "Facultatif : une piste vers frère Anton, en Désolace.",
    ["Librarian Mae Paledust, in the Hall of Explorers of Ironforge."] =
        "Bibliothécaire Mae Paledust, dans le Hall des explorateurs de Forgefer.",
    ["Reward: a necklace, and about 3,550 XP."] =
        "Récompense : un collier, et environ 3\194\160550 XP.",
    ["Brother Anton, at Nijel's Point, in Desolace."] =
        "Frère Anton, à la combe de Nijel, en Désolace.",
    ["Brother Anton, at Nijel's Point."] =
        "Frère Anton, à la combe de Nijel.",
    ["Down the Scarlet Path, in Desolace then Southshore, opens In the Name of the Light: a weapon or an off-hand orb, and about 4,700 XP."] =
        "Sur le chemin écarlate, en Désolace puis à Austrivage, ouvre Au nom de la Lumière : une arme ou un orbe tenu en main gauche, et environ 4\194\160700 XP.",
    ["The undead ravagers roam the south-east of Desolace."] =
        "Les ravageurs morts-vivants rôdent au sud-est de Désolace.",
    ["Raleigh the Devout, in the inn of Southshore, in Hillsbrad Foothills."] =
        "Raleigh le Dévot, à l'auberge d'Austrivage, dans les Contreforts de Hautebrande.",
    ["Magus Olvek, in the west of the Alterac Mountains."] =
        "Magus Olvek, à l'ouest des montagnes d'Alterac.",
    ["About 3,200 XP."] =
        "Environ 3\194\160200 XP.",
    ["Enter the Scarlet Monastery"] =
        "Entre dans le Monastère écarlate",
    ["The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door."] =
        "Le monastère se dresse tout à l'est des clairières de Tirisfal ; ses quatre ailes, Cimetière, Bibliothèque, Armurerie et Cathédrale, ont chacune leur propre porte.",
    ["Magus Olvek's book lies somewhere in the monastery."] =
        "Le livre de Magus Olvek se trouve quelque part dans le monastère.",
    ["Library: the book lies on the floor under a window, on the left of the room after the Gallery of Treasures."] =
        "Bibliothèque : le livre est posé au sol sous une fenêtre, à gauche de la salle qui suit la Galerie des trésors.",
    ["Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral."] =
        "Maître-chien Loksey, le premier boss de la Bibliothèque ; Herod, le seul boss de l'Armurerie ; le commandant écarlate Mograine et le grand inquisiteur Whitemane, au bout de la Cathédrale. Le coffre de l'arcaniste Doan, au bout de la Bibliothèque, contient la Clé écarlate qui ouvre l'Armurerie et la Cathédrale.",
    ["Magus Olvek, in the Alterac Mountains."] =
        "Magus Olvek, dans les montagnes d'Alterac.",
    ["Raleigh the Devout, in Southshore."] =
        "Raleigh le Dévot, à Austrivage.",
    ["Librarian Mae Paledust, in Ironforge."] =
        "Bibliothécaire Mae Paledust, à Forgefer.",
    ["Razorfen Downs"] =
        "Souilles de Tranchebauge",
    ["Archbishop Benedictus, in the Cathedral of Light of Stormwind."] =
        "Archevêque Benedictus, dans la cathédrale de la Lumière de Hurlevent.",
    ["Reward: a sword or a talisman, and about 4,300 XP."] =
        "Récompense : une épée ou un talisman, et environ 4\194\160300 XP.",
    ["Myriam Moonsinger, outside Razorfen Downs, in the far south of the Barrens."] =
        "Myriam Moonsinger, devant les souilles de Tranchebauge, tout au sud des Tarides.",
    ["About 3,450 XP, without entering the downs."] =
        "Environ 3\194\160450 XP, sans entrer dans les souilles.",
    ["The Razorfen battleguards, thornweavers and Death's Head cultists guard the slopes before the downs."] =
        "Les gardes de guerre et les tisseurs d'épines de Tranchebauge et les sectateurs de la Tête de Mort gardent les pentes devant les souilles.",
    ["Myriam Moonsinger."] =
        "Myriam Moonsinger.",
    ["Enter Razorfen Downs"] =
        "Entre dans les souilles de Tranchebauge",
    ["The downs' entrance is by Myriam Moonsinger, at the foot of the great thorn mound."] =
        "L'entrée des souilles se trouve près de Myriam Moonsinger, au pied du grand tertre d'épines.",
    ["Belnistrasz waits in the Holding Pen, on the north side of the Murder Pens; taking his second quest starts his ritual at once."] =
        "Belnistrasz attend dans l'Enclos de détention, du côté nord des Enclos du meurtre ; prendre sa deuxième quête lance son rituel aussitôt.",
    ["Belnistrasz's ritual: a ring, and about 4,250 XP."] =
        "Le rituel de Belnistrasz : un anneau, et environ 4\194\160250 XP.",
    ["Defend Belnistrasz while he works: waves of quilboar and undead come. Then use his brazier, in the same room."] =
        "Défends Belnistrasz pendant qu'il travaille : des vagues de hurans et de morts-vivants arrivent. Utilise ensuite son brasero, dans la même salle.",
    ["Amnennar the Coldbringer, the last boss, waits at the top of the Spiral of Thorns."] =
        "Amnennar le Porte-froid, le dernier boss, attend au sommet de la Spirale d'épines.",
    ["Archbishop Benedictus, in Stormwind."] =
        "Archevêque Benedictus, à Hurlevent.",
    ["Uldaman"] =
        "Uldaman",
    ["Prospector Stormpike, in the Hall of Explorers of Ironforge."] =
        "Prospecteur Stormpike, dans le Hall des explorateurs de Forgefer.",
    ["The Lost Dwarves leads to the Hidden Chamber: a two-handed axe or a lodestar, and about 3,900 XP."] =
        "La quête Les nains perdus mène à La Chambre secrète : une hache à deux mains ou une pierre d'aimant, et environ 3\194\160900 XP.",
    ["Krom Stoutarm, in the Hall of Explorers."] =
        "Krom Stoutarm, dans le Hall des explorateurs.",
    ["About 3,600 XP for a chest at Uldaman's gates."] =
        "Environ 3\194\160600 XP pour un coffre aux portes d'Uldaman.",
    ["Prospector Ironband, at his excavation site in the south-east of Loch Modan."] =
        "Prospecteur Ironband, à son site de fouilles au sud-est de Loch Modan.",
    ["Find Agmond leads to Agmond's Fate: gloves of cloth, leather or mail."] =
        "Trouver Agmond mène à la quête Le destin d'Agmond : des gants en tissu, en cuir ou en mailles.",
    ["Ghak Healtouch, in Thelsamar."] =
        "Ghak Healtouch, à Thelsamar.",
    ["It opens Uldaman Reagent Run: restorative potions and about 3,450 XP."] =
        "Elle ouvre Rechercher les composants à Uldaman : des potions de restauration et environ 3\194\160450 XP.",
    ["Rigglefuzz, in the middle of the Badlands."] =
        "Rigglefuzz, au centre des Terres ingrates.",
    ["Reward: leather or mail bracers, cloth boots or a shield."] =
        "Récompense : des brassards en cuir ou en mailles, des bottes en tissu ou un bouclier.",
    ["Theldurin the Lost, in the south of the Badlands."] =
        "Theldurin l’Egaré, au sud des Terres ingrates.",
    ["Reward: a cloth robe."] =
        "Récompense : une robe en tissu.",
    ["A crumpled map lies on the ground in the north of the Badlands."] =
        "Une carte chiffonnée est posée au sol, au nord des Terres ingrates.",
    ["A long chain of nine quests between the Badlands and Ironforge: it ends inside Uldaman with the Lost Tablets of Will, a medal and about 5,850 XP."] =
        "Une longue chaîne de neuf quêtes entre les Terres ingrates et Forgefer : elle se termine dans Uldaman avec La tablette de volonté, une médaille et environ 5\194\160850 XP.",
    ["Prospector Ryedol, a short walk south of the map."] =
        "Prospecteur Ryedol, à quelques pas au sud de la carte.",
    ["A battered dwarven skeleton lies in the middle of the Badlands."] =
        "Un squelette de nain décrépi gît au centre des Terres ingrates.",
    ["Murdaloc and the Stonevault troggs camp just south of the skeleton."] =
        "Murdaloc et les troggs Cavepierre campent juste au sud du squelette.",
    ["The buzzards and crag coyotes of the Badlands drop the gizzards and fangs."] =
        "Les busards et les coyotes des rochers des Terres ingrates laissent tomber les gésiers et les crocs.",
    ["Hammertoe Grez, by the gates of Uldaman, in the north of the Badlands."] =
        "Hammertoe Grez, près des portes d'Uldaman, au nord des Terres ingrates.",
    ["Magregan Deepshadow, a Shadowforge dwarf by the gates, carries the amulet; the tablet lies in an ancient chest close by."] =
        "Magregan Deepshadow, un nain Ombreforge près des portes, porte l'amulette ; la tablette se trouve dans un coffre ancien tout près.",
    ["The Shadowforge dwarves around the gates drop the power stones."] =
        "Les nains Ombreforge autour des portes laissent tomber les pierres de puissance.",
    ["The Shadowforge dwarves may also drop a shattered necklace: use it."] =
        "Les nains Ombreforge peuvent aussi laisser tomber un collier brisé : utilise-le.",
    ["Hammertoe Grez."] =
        "Hammertoe Grez.",
    ["Prospector Ryedol."] =
        "Prospecteur Ryedol.",
    ["Theldurin the Lost."] =
        "Theldurin l’Egaré.",
    ["Prospector Ironband, in Loch Modan."] =
        "Prospecteur Ironband, à Loch Modan.",
    ["Historian Karnik, in the Hall of Explorers of Ironforge."] =
        "Historien Karnik, dans le Hall des explorateurs de Forgefer.",
    ["Advisor Belgrum, in the Hall of Explorers."] =
        "Conseiller Belgrum, dans le Hall des explorateurs.",
    ["Historian Karnik."] =
        "Historien Karnik.",
    ["Talvash's chain ends inside Uldaman with a necklace and about 5,600 XP."] =
        "La chaîne de Talvash se termine dans Uldaman avec un collier et environ 5\194\160600 XP.",
    ["Five silver bars: from mining, or the auction house."] =
        "Cinq barres d'argent : en minant, ou à l'hôtel des ventes.",
    ["Ambassador Infernus walks with the Dark Iron dwarves south of Uldaman's gates."] =
        "L'ambassadeur Infernus marche avec les nains Sombrefer au sud des portes d'Uldaman.",
    ["Krom Stoutarm's chest stands in the dig south-west of Uldaman's gates."] =
        "Le coffre de Krom Stoutarm se trouve dans les fouilles au sud-ouest des portes d'Uldaman.",
    ["Carved stone urns lie around the dig and inside Uldaman."] =
        "Des urnes de pierre gravées se trouvent autour des fouilles et dans Uldaman.",
    ["Magenta cap clusters grow on the cave walls, south-west of the gates and inside."] =
        "Des champignons magenta poussent sur les parois de la grotte, au sud-ouest des portes et à l'intérieur.",
    ["Advisor Belgrum, in the Hall of Explorers of Ironforge."] =
        "Conseiller Belgrum, dans le Hall des explorateurs de Forgefer.",
    ["Enter Uldaman"] =
        "Entre dans Uldaman",
    ["The dungeon's door is at the back of the cave by Hammertoe Grez's dig."] =
        "La porte du donjon se trouve au fond de la grotte, près des fouilles de Hammertoe Grez.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage."] =
        "Un paladin mort repose juste à côté de la première grande salle, au bout de son deuxième passage à droite.",
    ["Baelog, the first boss, in Dig Two: the left corridor, then the room to the south."] =
        "Baelog, le premier boss, dans la Fouille deux : le couloir de gauche, puis la salle au sud.",
    ["The Tablet of Will stands against a wall of Dig Three."] =
        "La Tablette de volonté se dresse contre un mur de la Fouille trois.",
    ["The Gni'kiv Medallion lies in Baelog's chest, Revelosh drops the Shaft of Tsol: join them into the Staff of Prehistoria, use it in the Map Chamber, then step into Ironaya's room."] =
        "Le Médaillon de Gni'kiv se trouve dans le coffre de Baelog, Revelosh laisse tomber la Hampe de Tsol : assemble-les en Bâton de la préhistoire, utilise-le dans la Chambre des cartes, puis entre dans la salle d'Ironaya.",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault."] =
        "La topaze est dans une urne ostentatoire au sud-est de la Fouille deux, le rubis dans un coffre de pierre au nord-ouest de la Fouille trois (il fait venir des monstres), le saphir sur Grimlok, au bout du Caveau de pierre.",
    ["Use Talvash's phial at his scrying bowl, in the dungeon."] =
        "Utilise la fiole de Talvash à sa coupe de divination, dans le donjon.",
    ["Archaedas, the last boss, guards the Hall of the Crafters: he drops the power source."] =
        "Archaedas, le dernier boss, garde le Hall des Artisans : il laisse tomber la source d'énergie.",
    ["The Discs of Norgannon, in the room behind Archaedas."] =
        "Les Disques de Norgannon, dans la salle derrière Archaedas.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Ironforge with potions or a bag."] =
        "Facultatif : les Disques de Norgannon, derrière Archaedas, racontent leur histoire ; elle se termine à Forgefer avec des potions ou un sac.",
    ["Prospector Stormpike and Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "Prospecteur Stormpike et Krom Stoutarm, dans le Hall des explorateurs de Forgefer.",
    ["Talvash del Kissel, in the Mystic Ward."] =
        "Talvash del Kissel, dans la Garde mystique.",
    ["High Explorer Magellas, in the Hall of Explorers."] =
        "Grand Explorateur Magellas, dans le Hall des explorateurs.",
    ["Dinita Stonemantle, in Ironforge."] =
        "Dinita Stonemantle, à Forgefer.",
    ["Zul'Farrak"] =
        "Zul'Farrak",
    ["Gryphon Master Talonaxe, at Aerie Peak, in the Hinterlands."] =
        "Maître des gryphons Talonaxe, au Nid-de-l'Aigle, dans les Hinterlands.",
    ["Optional: a chain of seven quests between the Hinterlands, the Blasted Lands and the city; the last one, an elite fight to the top of Jintha'Alor, brings a mace or leather leggings."] =
        "Facultatif : une chaîne de sept quêtes entre les Hinterlands, les Terres foudroyées et la cité ; la dernière, un combat contre des élites jusqu'au sommet de Jintha'Alor, rapporte une masse ou des jambières en cuir.",
    ["The Witherbark cages stand in the troll camps of the south-west of the Hinterlands."] =
        "Les cages Witherbark se dressent dans les camps trolls du sud-ouest des Hinterlands.",
    ["Search the Altar of Zul, in the middle of the trolls' ruins in the south of the Hinterlands."] =
        "Fouille l'autel de Zul, au centre des ruines trolls du sud des Hinterlands.",
    ["Thadius Grimshade, at the top of Nethergarde Keep, in the Blasted Lands."] =
        "Thadius Grimshade, au sommet du Rempart-du-Néant, dans les Terres foudroyées.",
    ["Your mage trainer, in a capital."] =
        "Ton maître des mages, dans une capitale.",
    ["Tabetha, in her house in the middle of Dustwallow Marsh."] =
        "Tabetha, dans sa maison au centre du marécage d'Âprefange.",
    ["Reward: a staff or plate shoulders."] =
        "Récompense : un bâton ou des épaulières en plaques.",
    ["Wizzle Brassbolts, at the racetrack of the Shimmering Flats, in Thousand Needles."] =
        "Wizzle Brassbolts, à la piste de course des Salines, à Mille pointes.",
    ["Reward: a carrot on a stick, which makes your mount faster."] =
        "Récompense : la Carotte et bâton, qui rend ta monture plus rapide.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan, in Tanaris."] =
        "Tran'rek, Trenton Lighthammer et l'ingénieur en chef Bilgewhizzle, à Gadgetzan, à Tanaris.",
    ["Gadgetzan's quests: the Divino-matic Rod brings a ring or a leather helm; the other two, about 3,900 XP each."] =
        "Les quêtes de Gadgetzan : Le bâtonnet divino-matic rapporte un anneau ou un casque en cuir ; les deux autres, environ 3\194\160900 XP chacune.",
    ["Yeh'kinya, at Steamwheedle Port, on the east coast of Tanaris."] =
        "Yeh'kinya, à Port Gentepression, sur la côte est de Tanaris.",
    ["It opens The Prophecy of Mosh'aru, about 5,250 XP."] =
        "Elle ouvre La prophétie de Mosh'aru, environ 5\194\160250 XP.",
    ["Kill the vale screechers of Feralas and use Yeh'kinya's bramble on their bodies."] =
        "Tue les hurleurs des vallées de Féralas et utilise la Ronce de Yeh'kinya sur leurs corps.",
    ["Yeh'kinya, at Steamwheedle Port."] =
        "Yeh'kinya, à Port Gentepression.",
    ["Enter Zul'Farrak"] =
        "Entre dans Zul'Farrak",
    ["The city's gate is in the north-west of Tanaris."] =
        "La porte de la cité se trouve au nord-ouest de Tanaris.",
    ["The scarabs drop the shells; most of them crowd Theka the Martyr's chamber."] =
        "Les scarabées laissent tomber les carapaces ; la plupart s'entassent dans la salle de Theka le Martyr.",
    ["Theka the Martyr, the second boss, in the scarabs' room to the north, holds the first tablet; Hydromancer Velratha, by the pool to the south-east, the second."] =
        "Theka le Martyr, le deuxième boss, dans la salle des scarabées au nord, détient la première tablette ; l'hydromancienne Velratha, près du bassin au sud-est, la seconde.",
    ["Hydromancer Velratha also wears the Tiara of the Deep."] =
        "L'hydromancienne Velratha porte aussi la Tiare des abysses.",
    ["Gahz'rilla rises from the pool when its gong is struck with the Mallet of Zul'Farrak, made in the Hinterlands: one of the group needs it."] =
        "Gahz'rilla surgit du bassin quand on frappe son gong avec le Marteau de Zul'Farrak, fabriqué dans les Hinterlands : un membre du groupe doit l'avoir.",
    ["Nekrum Gutchewer joins the fight at the top of the pyramid, when the prisoners are freed."] =
        "Nekrum Mâchetripes rejoint le combat au sommet de la pyramide, quand les prisonniers sont libérés.",
    ["Sergeant Bly, one of the prisoners at the top of the pyramid: free them, defend them, then he turns on you."] =
        "Le sergent Bly, l'un des prisonniers au sommet de la pyramide : libère-les, défends-les, puis il se retourne contre toi.",
    ["Every troll of the city may drop a troll temper; it can take more than one run."] =
        "Chaque troll de la cité peut laisser tomber un agent durcissant troll ; il peut falloir plus d'un passage.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan."] =
        "Tran'rek, Trenton Lighthammer et l'ingénieur en chef Bilgewhizzle, à Gadgetzan.",
    ["Optional: an egg in the Hinterlands; it opens The God Hakkar, a quest of the Temple of Atal'Hakkar."] =
        "Facultatif : un œuf dans les Hinterlands ; il ouvre Le dieu Hakkar, une quête du temple d'Atal'Hakkar.",
    ["Wizzle Brassbolts, at the Shimmering Flats."] =
        "Wizzle Brassbolts, aux Salines.",
    ["Tabetha, in Dustwallow Marsh."] =
        "Tabetha, au marécage d'Âprefange.",
    ["Thadius Grimshade, in Nethergarde Keep."] =
        "Thadius Grimshade, au Rempart-du-Néant.",
    ["Wait while Thadius Grimshade performs his divination."] =
        "Attends pendant que Thadius Grimshade accomplit sa divination.",
    ["Gryphon Master Talonaxe, at Aerie Peak."] =
        "Maître des gryphons Talonaxe, au Nid-de-l'Aigle.",
    ["Vile Priestess Hexx, at the top of Jintha'Alor, carries the key to Sharpbeak's cage: elite trolls all the way up."] =
        "La vile prêtresse Maléficia, au sommet de Jintha'Alor, porte la clé de la cage de Bec-tranchant : des trolls élites tout le long de la montée.",
    ["The Ancient Egg lies at the top of Jintha'Alor too."] =
        "L'Oeuf antique se trouve aussi au sommet de Jintha'Alor.",
    ["Gryphon Master Talonaxe."] =
        "Maître des gryphons Talonaxe.",
    ["Maraudon"] =
        "Maraudon",
    ["Archmage Tervosh, in his tower in Theramore, in Dustwallow Marsh."] =
        "Archimage Tervosh, dans sa tour à Theramore, au marécage d'Âprefange.",
    ["Reward: a pendant of your choice."] =
        "Récompense : un pendentif de ton choix.",
    ["Talendria and Keeper Marandis, at Nijel's Point, in the north of Desolace."] =
        "Talendria et le gardien Marandis, à la combe de Nijel, au nord de Désolace.",
    ["Nijel's Point's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "Les deux quêtes de la combe de Nijel : un anneau, des gantelets en plaques ou une ceinture en cuir ; puis la fin de Theradras rapporte une épée, un bâton ou un arc.",
    ["Willow, in the middle of Desolace."] =
        "Saule, au centre de Désolace.",
    ["Reward: cloth, leather, mail or plate armor."] =
        "Récompense : une armure en tissu, en cuir, en mailles ou en plaques.",
    ["The Centaur Pariah, an outcast in the south of Desolace."] =
        "Le Paria centaure, un exilé au sud de Désolace.",
    ["About 5,450 XP."] =
        "Environ 5\194\160450 XP.",
    ["Cavindra, on the path to Maraudon, in the west of Desolace."] =
        "Cavindra, sur le chemin de Maraudon, à l'ouest de Désolace.",
    ["Legends of Maraudon leads to the Scepter of Celebras, a shortcut into the inner falls."] =
        "Légendes de Maraudon mène au Sceptre de Celebras, un raccourci vers les chutes intérieures.",
    ["Enter Maraudon"] =
        "Entre dans Maraudon",
    ["Maraudon's caves open in the west of Desolace; inside, an orange and a purple wing lead down to the inner falls."] =
        "Les grottes de Maraudon s'ouvrent à l'ouest de Désolace ; à l'intérieur, une aile orange et une aile violette descendent vers les chutes intérieures.",
    ["The Shadowshard elementals of the outer caves drop the fragments."] =
        "Les élémentaires Ombréclat des grottes extérieures laissent tomber les fragments.",
    ["Fill the vial at the orange crystal pool, in the caves before the Orange wing; in the wing, use it on the stumps with red tops: the Noxxious scions come out."] =
        "Remplis la fiole au bassin de cristal orange, dans les grottes avant l'aile orange ; dans l'aile, utilise-la sur les souches au sommet rouge : les engeances de Noxxious en sortent.",
    ["Every creature of Maraudon may drop a crystal carving."] =
        "Chaque créature de Maraudon peut laisser tomber une gravure de cristal.",
    ["Use the Amulet of Spirits on the Spirit of Veng, who walks the Orange wing, then kill Veng; then on the Spirit of Maraudos in the Purple wing's grotto, then kill Maraudos. Join the two gems."] =
        "Utilise l'Amulette des esprits sur l'Esprit de Veng, qui parcourt l'aile orange, puis tue Veng ; ensuite sur l'Esprit de Maraudos, dans la grotte de l'aile violette, puis tue Maraudos. Assemble les deux gemmes.",
    ["Noxxion, the Orange wing's first boss, drops the rod; Lord Vyletongue, in a small room north of his seat in the Purple wing, the diamond."] =
        "Noxxion, le premier boss de l'aile orange, laisse tomber le bâtonnet ; le seigneur Vylelangue, dans une petite salle au nord de son trône dans l'aile violette, le diamant.",
    ["Kill Celebras the Cursed, on the island of the Poison Falls: Celebras the Redeemed appears."] =
        "Tue Celebras le Maudit, sur l'île des Chutes empoisonnées : Celebras le Racheté apparaît.",
    ["Follow Celebras to his stone and wait for his incantation."] =
        "Suis Celebras jusqu'à sa pierre et attends son incantation.",
    ["Celebras the Redeemed, by his stone."] =
        "Celebras le Racheté, près de sa pierre.",
    ["Princess Theradras, the last boss, waits at the end of Zaetar's Grave, south and down the waterfall."] =
        "La princesse Theradras, le dernier boss, attend au bout de la Tombe de Zaetar, au sud et en bas de la cascade.",
    ["Zaetar's Spirit appears in the middle of Theradras's room."] =
        "L'Esprit de Zaetar apparaît au centre de la salle de Theradras.",
    ["About 6,100 XP; the seed goes to Moonglade."] =
        "Environ 6\194\160100 XP ; la graine est à porter à Reflet-de-Lune.",
    ["The Centaur Pariah, in the south of Desolace."] =
        "Le Paria centaure, au sud de Désolace.",
    ["Talendria and Keeper Marandis, at Nijel's Point."] =
        "Talendria et le gardien Marandis, à la combe de Nijel.",
    ["Archmage Tervosh, in Theramore."] =
        "Archimage Tervosh, à Theramore.",
    ["Keeper Remulos, at the Shrine of Remulos, in Moonglade."] =
        "Gardien Remulos, au sanctuaire de Remulos, à Reflet-de-Lune.",
    ["The Temple of Atal'Hakkar"] =
        "Le temple d'Atal'Hakkar",
    ["Brohann Caskbelly, in the Dwarven District of Stormwind."] =
        "Brohann Caskbelly, dans le quartier des Nains de Hurlevent.",
    ["Optional: a chain of eight quests from Stormwind to the Hinterlands, Tanaris and Feralas; it opens Into the Temple of Atal'Hakkar, a talisman and about 7,100 XP."] =
        "Facultatif : une chaîne de huit quêtes de Hurlevent aux Hinterlands, à Tanaris et à Féralas ; elle ouvre Dans le temple d'Atal'Hakkar, un talisman et environ 7\194\160100 XP.",
    ["Find the temple: the ruins in the Pool of Tears, in the east of the Swamp of Sorrows."] =
        "Trouve le temple : les ruines dans le bassin des larmes, à l'est du Marais des Chagrins.",
    ["Brohann Caskbelly, in Stormwind."] =
        "Brohann Caskbelly, à Hurlevent.",
    ["Falstad Wildhammer, at Aerie Peak, in the Hinterlands."] =
        "Falstad Wildhammer, au Nid-de-l'Aigle, dans les Hinterlands.",
    ["Rhapsody Shindigger, on the road east of Aerie Peak."] =
        "Rhapsody Shindigger, sur la route à l'est du Nid-de-l'Aigle.",
    ["The Atal'ai Exile, in the south of the Hinterlands."] =
        "L'Exilé atal'ai, au sud des Hinterlands.",
    ["Reward: cloth leggings or a mail helm, and about 6,550 XP."] =
        "Récompense : des jambières en tissu ou un casque en mailles, et environ 6\194\160550 XP.",
    ["Muigin, at Marshal's Refuge, in Un'Goro Crater."] =
        "Muigin, au Refuge de Marshal, dans le cratère d'Un'Goro.",
    ["Muigin's chain leads to the temple's haze."] =
        "La chaîne de Muigin mène à la brume du temple.",
    ["The bloodpetal plants of Un'Goro drop the petals."] =
        "Les plantes Pétale-de-sang d'Un'Goro laissent tomber les pétales.",
    ["Gregan Brewspewer, in the north of Feralas."] =
        "Gregan Brewspewer, au nord de Féralas.",
    ["Angelas Moonbreeze, at Feathermoon Stronghold, in Feralas."] =
        "Angelas Moonbreeze, au bastion de Pennelune, à Féralas.",
    ["Marvon's chain opens two quests of the temple; one rewards a Hakkari urn."] =
        "La chaîne de Marvon ouvre deux quêtes du temple ; l'une rapporte une urne hakkari.",
    ["Groddoc and ironfur livers in Feralas, roc gizzards in Tanaris."] =
        "Les foies de Groddoc et de Ferpoil à Féralas, les gésiers de roc à Tanaris.",
    ["Marvon Rivetseeker, in Tanaris, south of Gadgetzan."] =
        "Marvon Rivetseeker, à Tanaris, au sud de Gadgetzan.",
    ["Marvon's chest, in his old workshop in Ratchet, holds the stone circle."] =
        "Le coffre de Marvon, dans son ancien atelier de Cabestan, contient le cercle de pierres.",
    ["Marvon Rivetseeker, in Tanaris."] =
        "Marvon Rivetseeker, à Tanaris.",
    ["Yeh'kinya, at Steamwheedle Port, in Tanaris."] =
        "Yeh'kinya, à Port Gentepression, à Tanaris.",
    ["The Ancient Egg lies at the top of Jintha'Alor, in the Hinterlands, among elite trolls."] =
        "L'Oeuf antique se trouve au sommet de Jintha'Alor, dans les Hinterlands, parmi des trolls élites.",
    ["Reward: a plate helm, a cloth circlet or a dagger, and about 7,900 XP."] =
        "Récompense : un casque en plaques, un diadème en tissu ou une dague, et environ 7\194\160900 XP.",
    ["Rhapsody Shindigger, in the Hinterlands."] =
        "Rhapsody Shindigger, dans les Hinterlands.",
    ["The Atal'ai tablets lie in the ruins around the Pool of Tears, and inside the temple."] =
        "Les tablettes atal'ai se trouvent dans les ruines autour du bassin des larmes, et dans le temple.",
    ["Enter the Temple of Atal'Hakkar"] =
        "Entre dans le temple d'Atal'Hakkar",
    ["The temple lies sunken in the Pool of Tears, in the east of the Swamp of Sorrows: swim down to the ruins' stairs."] =
        "Le temple est englouti dans le bassin des larmes, à l'est du Marais des Chagrins : nage vers le fond jusqu'aux escaliers des ruines.",
    ["The murk worms, deep lurkers and oozes of the temple drop the haze."] =
        "Les vers des boues, les rôdeurs des abysses et les limons du temple laissent tomber la brume.",
    ["Hall of Serpents: use the six statues in this order: south, north, south-west, south-east, north-west, north-east; Atal'alarion appears. The Idol of Hakkar stands in the middle of the Pit of Refuse."] =
        "Salle des serpents : utilise les six statues dans cet ordre : sud, nord, sud-ouest, sud-est, nord-ouest, nord-est ; Atal'alarion apparaît. L'Idole d'Hakkar se dresse au centre de la Fosse aux immondices.",
    ["Climb the stairs of the Pit of Refuse: the Altar of Hakkar waits up there."] =
        "Monte les escaliers de la Fosse aux immondices : l'Autel d'Hakkar se trouve là-haut.",
    ["Kill the six troll elites on the balconies first: Jammal'an's barrier falls; he waits south-east of the Pit of Sacrifice."] =
        "Tue d'abord les six trolls élites des balcons : la barrière de Jammal'an tombe ; il attend au sud-est de la Fosse du sacrifice.",
    ["The Shade of Eranikus, at the end of the south path, may drop his essence: use it."] =
        "L'Ombre d'Eranikus, au bout du chemin sud, peut laisser tomber son essence : utilise-la.",
    ["The Essence Font, in the north-east corner of his room."] =
        "Le Réceptacle d'essence, dans le coin nord-est de sa salle.",
    ["Use the Oathstone of Ysera's Dragonflight it gives you."] =
        "Utilise la Pierre de voeu des dragons d'Ysera qu'il te donne.",
    ["Keep the Chained Essence of Eranikus, the font's reward: Itharius asks for it."] =
        "Garde l'Essence d'Eranikus enchaînée, la récompense du réceptacle : Itharius la demande.",
    ["Use the Egg of Hakkar by the skeleton in the Sanctum of the Fallen God, south-west: Hakkari bloodkeepers come, their blood puts out the four eternal flames, then the Avatar of Hakkar comes; his essence fills the egg."] =
        "Utilise l'Oeuf d'Hakkar près du squelette dans le Sanctuaire du dieu déchu, au sud-ouest : des gardes de sang Hakkar'i arrivent, leur sang éteint les quatre flammes éternelles, puis l'Avatar d'Hakkar arrive ; son essence remplit l'œuf.",
    ["Itharius, a green dragon in the south-west of the Swamp of Sorrows."] =
        "Itharius, un dragon vert au sud-ouest du Marais des Chagrins.",
    ["The Atal'ai Exile, in the Hinterlands."] =
        "L'Exilé atal'ai, dans les Hinterlands.",
    ["The beasts of Un'Goro drop the bloodpetal sprouts."] =
        "Les bêtes d'Un'Goro laissent tomber les pousses de Pétale-de-sang.",
    ["Umbranse the Spiritspeaker, in the east of Winterspring."] =
        "Umbranse l'Implorateur d'esprits, à l'est de Berceau-de-l'Hiver.",
    ["Blackrock Depths"] =
        "Profondeurs de Rochenoire",
    ["Royal Historian Archesonus, in the Hall of Explorers of Ironforge."] =
        "Historienne royale Archesonus, dans le Hall des explorateurs de Forgefer.",
    ["The royal historian's chain leads to Kharan Mighthammer, then to the emperor and the princess: King Magni's reward and about 9,650 XP at its end."] =
        "La chaîne de l'historienne royale mène à Kharan Mighthammer, puis à l'empereur et à la princesse : la récompense du roi Magni et environ 9\194\160650 XP au bout.",
    ["Listen to the royal historian."] =
        "Écoute l'historienne royale.",
    ["Ragnar Thunderbrew, in Kharanos, in Dun Morogh."] =
        "Ragnar Thunderbrew, à Kharanos, à Dun Morogh.",
    ["Reward: a two-handed axe or a mace, or dark dwarven lager."] =
        "Récompense : une hache à deux mains ou une masse, ou de la bière brune naine.",
    ["Kalaran Windblade, in the middle of the Searing Gorge."] =
        "Kalaran Windblade, au centre de la gorge des Vents brûlants.",
    ["Optional: ten quests in the Searing Gorge before A Taste of Flame, which brings a cloth cape or sash or leather shoulders."] =
        "Facultatif : dix quêtes dans la gorge des Vents brûlants avant Un goût de flammes, qui rapporte une cape ou une écharpe en tissu, ou des épaulières en cuir.",
    ["Listen to Kalaran Windblade's story."] =
        "Écoute l'histoire de Kalaran Windblade.",
    ["The fire elementals of the Searing Gorge drop the hearts of flame; the golems, the oil."] =
        "Les élémentaires de feu de la gorge des Vents brûlants laissent tomber les cœurs des flammes ; les golems, l'huile.",
    ["The Dark Iron dwarves of the gorge carry the thorium plated daggers."] =
        "Les nains Sombrefer de la gorge portent les dagues plaquées en thorium.",
    ["The Twilight cultists of the gorge carry the symbols of Ragnaros."] =
        "Les sectateurs du crépuscule de la gorge portent les symboles de Ragnaros.",
    ["Listen to Kalaran Windblade."] =
        "Écoute Kalaran Windblade.",
    ["Use the Torch of Retribution beside Kalaran."] =
        "Utilise la Torche de vindicte à côté de Kalaran.",
    ["Squire Maltrake, beside Kalaran."] =
        "Ecuyer Maltrake, à côté de Kalaran.",
    ["Light the four sentry braziers on the Dark Iron watchtowers of the gorge."] =
        "Allume les quatre braseros de sentinelle sur les tours de guet Sombrefer de la gorge.",
    ["The Hoard of the Black Dragonflight, beside Squire Maltrake."] =
        "Le Trésor du Vol noir, à côté de l'écuyer Maltrake.",
    ["The ghost of Franclorn Forgewright, inside Blackrock Mountain, by the way down to the depths."] =
        "Le fantôme de Franclorn Forgewright, dans le mont Rochenoire, près du chemin qui descend vers les profondeurs.",
    ["Franclorn's quest brings the Shadowforge Key, which opens doors of the depths."] =
        "La quête de Franclorn rapporte la Clé ombreforge, qui ouvre des portes des profondeurs.",
    ["Use the Thaurissan relic in the ruins of Thaurissan, in the middle of the Burning Steppes."] =
        "Utilise la Relique de Thaurissan dans les ruines de Thaurissan, au centre des Steppes ardentes.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest, in the north of the Burning Steppes."] =
        "Yuka Screwspigot et Maxwort Uberglint, à la Corniche des flammes, au nord des Steppes ardentes.",
    ["Flame Crest's two quests: Ribbly's head brings leather shoulders, cloth boots or mail armor."] =
        "Les deux quêtes de la Corniche des flammes : la tête de Ribbly rapporte des épaulières en cuir, des bottes en tissu ou une armure en mailles.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "Jalinda Sprig et Oralius, à la Veille de Morgan, à l'est des Steppes ardentes.",
    ["Morgan's Vigil's quests: Incendius! brings armor of any kind, The Good Stuff a fanny pack of loot."] =
        "Les quêtes de la Veille de Morgan : Incendius ! rapporte une armure de n'importe quel type, Du beau matériel une sacoche de butin.",
    ["Cyrus Therepentous, in the far east of the Burning Steppes."] =
        "Cyrus Therepentous, tout à l'est des Steppes ardentes.",
    ["A frenzied black drake of the steppes drops the molt; then talk to Cyrus."] =
        "Un drake noir frénétique des steppes laisse tomber le cuir de dragon noir ; parle ensuite à Cyrus.",
    ["Helendis Riverhorn, at Morgan's Vigil."] =
        "Helendis Riverhorn, à la Veille de Morgan.",
    ["Optional: eight quests between the steppes, Lakeshire and Stormwind before Marshal Windsor, whose Jail Break! brings a sword or a dagger among its rewards, and about 7,750 XP."] =
        "Facultatif : huit quêtes entre les steppes, Comté-du-Lac et Hurlevent avant le maréchal Windsor, dont Evasion ! rapporte entre autres une épée ou une dague, et environ 7\194\160750 XP.",
    ["The black dragonkin of the steppes' north."] =
        "Les draconiens noirs du nord des steppes.",
    ["Magistrate Solomon, in the town hall of Lakeshire, in Redridge."] =
        "Magistrat Solomon, à l'hôtel de ville de Comté-du-Lac, dans les Carmines.",
    ["Highlord Bolvar Fordragon, in Stormwind Keep."] =
        "Généralissime Bolvar Fordragon, dans le donjon de Hurlevent.",
    ["Talk to Lady Katrana Prestor, beside the king."] =
        "Parle à dame Katrana Prestor, à côté du roi.",
    ["Magistrate Solomon, in Lakeshire."] =
        "Magistrat Solomon, à Comté-du-Lac.",
    ["Marshal Maxwell, at Morgan's Vigil."] =
        "Maréchal Maxwell, à la Veille de Morgan.",
    ["Talk to Ragged John, at Flame Crest."] =
        "Parle à John le Loqueteux, à la Corniche des flammes.",
    ["Royal Historian Archesonus, in Ironforge."] =
        "Historienne royale Archesonus, à Forgefer.",
    ["Overmaster Pyron walks the bottom of Blackrock Mountain, before the depths' door."] =
        "Le grand seigneur Pyron arpente le bas du mont Rochenoire, devant la porte des profondeurs.",
    ["Enter Blackrock Depths"] =
        "Entre dans les profondeurs de Rochenoire",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the depths' door is at the bottom of the mountain."] =
        "Le mont Rochenoire s'ouvre à l'ouest des Steppes ardentes ; à l'intérieur, la porte des profondeurs se trouve au pied de la montagne.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Kharan Mighthammer sits in the second cell on the right of the tunnel."] =
        "Le grand interrogateur Gerstahn, dans une arrière-salle à droite du Bloc de détention, porte la clé des cellules ; Kharan Mighthammer est assis dans la deuxième cellule à droite du tunnel.",
    ["Let Kharan tell his story."] =
        "Laisse Kharan raconter son histoire.",
    ["Marshal Windsor, two cells further."] =
        "Maréchal Windsor, deux cellules plus loin.",
    ["The Anvilrage dwarves of the first rooms may drop a crumpled note: read it."] =
        "Les nains Ragenclume des premières salles peuvent laisser tomber une note chiffonnée : lis-la.",
    ["Marshal Windsor, in his cell."] =
        "Maréchal Windsor, dans sa cellule.",
    ["Fineous Darkvire, in the lower Hall of Crafting, carries Ironfel; the Monument of Franclorn Forgewright stands at the dead end past the Shrine of Thaurissan."] =
        "Fineous Darkvire, dans la partie basse du Hall de l'artisanat, porte Souillefer ; le Monument de Franclorn Forgewright se dresse au bout de l'impasse après le Sanctuaire de Thaurissan.",
    ["The Monument of Franclorn Forgewright."] =
        "Le Monument de Franclorn Forgewright.",
    ["Bael'Gar waits at the end of the Dark Iron Highway: use Cyrus's molt on his body."] =
        "Bael'Gar attend au bout de la Grand-route Sombrefer : utilise le cuir de Cyrus sur son corps.",
    ["General Angerforge, down the stairs of the West Garrison, and Golem Lord Argelmach, in the Manufactory, carry Windsor's lost information."] =
        "Le général Forgehargne, en bas des escaliers de la Garnison ouest, et le seigneur golem Argelmach, dans la Manufacture, portent les informations égarées de Windsor.",
    ["Free Marshal Windsor and follow him through the Detention Block and the Halls of the Law."] =
        "Libère le maréchal Windsor et suis-le à travers le Bloc de détention et les Salles de la Loi.",
    ["Mistress Nagmara, in the Grim Guzzler tavern."] =
        "Gouvernante Nagmara, dans la taverne du Sinistre dévoreur.",
    ["Optional: Mistress Nagmara's love potion needs herbs, silver veins of giants and water of Un'Goro's hot springs; it brings cloth bracers or a leather belt."] =
        "Facultatif : le philtre d'amour de la gouvernante Nagmara demande des herbes, des veines d'argent de géants et de l'eau des sources chaudes d'Un'Goro ; il rapporte des brassards en tissu ou une ceinture en cuir.",
    ["Ribbly Screwspigot sits at the bottom of the Grim Guzzler: talk to him, then fight him."] =
        "Ribbly Screwspigot est assis au fond du Sinistre dévoreur : parle-lui, puis combats-le.",
    ["Break the three Thunderbrew lager kegs in a side room of the lower Grim Guzzler: Hurley Blackbreath comes."] =
        "Brise les trois tonneaux de bière Thunderbrew dans une salle latérale du bas du Sinistre dévoreur : Hurley Blackbreath arrive.",
    ["The relic coffer keys drop from the dwarves; the twelve coffers of the Black Vault call Watchman Doomgrip, who opens the Heart's vault."] =
        "Les clés des coffres aux reliques tombent sur les nains ; les douze coffres du Caveau noir font venir la sentinelle Doomgrip, qui ouvre la chambre forte du Cœur.",
    ["The Anvilrage dwarves drop the fanny packs."] =
        "Les nains Ragenclume laissent tomber les sacoches.",
    ["King Magni Bronzebeard, in Ironforge."] =
        "Roi Magni Bronzebeard, à Forgefer.",
    ["Jalinda Sprig, at Morgan's Vigil."] =
        "Jalinda Sprig, à la Veille de Morgan.",
    ["Gromsblood, from herbalism or the auction house; giant silver veins from the giants of Azshara; the vial filled at the Golakka Hot Springs of Un'Goro Crater."] =
        "Le gromsang, par l'herboristerie ou à l'hôtel des ventes ; les veines d'argent de géant, sur les géants d'Azshara ; la fiole, remplie aux sources chaudes de Golakka, dans le cratère d'Un'Goro.",
    ["Enter Blackrock Depths again"] =
        "Entre de nouveau dans les profondeurs de Rochenoire",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City."] =
        "Le seigneur Incendius attend à l'Enclume noire, dans la cité d'Ombreforge.",
    ["Mistress Nagmara, in the Grim Guzzler."] =
        "Gouvernante Nagmara, au Sinistre dévoreur.",
    ["Emperor Dagran Thaurissan, the last boss, sits in the Imperial Seat: keep Princess Moira alive while you fight him."] =
        "L'empereur Dagran Thaurissan, le dernier boss, siège dans la salle du Trône impérial : garde la princesse Moira en vie pendant que tu le combats.",
    ["Princess Moira Bronzebeard, in the Imperial Seat."] =
        "Princesse Moira Bronzebeard, dans la salle du Trône impérial.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest."] =
        "Yuka Screwspigot et Maxwort Uberglint, à la Corniche des flammes.",
    ["Cyrus Therepentous, in the far east of the steppes."] =
        "Cyrus Therepentous, tout à l'est des steppes.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil."] =
        "Jalinda Sprig et Oralius, à la Veille de Morgan.",
    ["Marshal Maxwell."] =
        "Maréchal Maxwell.",
    ["Ragnar Thunderbrew, in Kharanos."] =
        "Ragnar Thunderbrew, à Kharanos.",
    ["Blackrock Spire"] =
        "Pic Rochenoire",
    ["Prospector Ironboot, at Steamwheedle Port, in Tanaris."] =
        "Prospecteur Ironboot, à Port Gentepression, à Tanaris.",
    ["Yeh'kinya's chain from Zul'Farrak and the sunken temple goes on: two tablets in the Eastern Plaguelands, two inside the spire, then a cloak."] =
        "La chaîne de Yeh'kinya, venue de Zul'Farrak et du temple englouti, continue : deux tablettes dans les Maleterres de l'Est, deux dans le pic, puis une cape.",
    ["The third and fourth tablets lie in the troll ruins of the north of the Eastern Plaguelands."] =
        "Les troisième et quatrième tablettes se trouvent dans les ruines trolls du nord des Maleterres de l'Est.",
    ["Prospector Ironboot, at Steamwheedle Port."] =
        "Prospecteur Ironboot, à Port Gentepression.",
    ["Kibler, at Flame Crest, in the north of the Burning Steppes."] =
        "Kibler, à la Corniche des flammes, au nord des Steppes ardentes.",
    ["Kibler's two quests: a worg pup or a smolderweb spider, pets that follow you."] =
        "Les deux quêtes de Kibler : un jeune worg ou une jeune Couveuse, des mascottes qui te suivent.",
    ["Ragged John, at Flame Crest."] =
        "John le Loqueteux, à la Corniche des flammes.",
    ["Reward: Ragged John's neverending cup, and about 9,950 XP."] =
        "Récompense : la Chope sans fin de John le Loqueteux, et environ 9\194\160950 XP.",
    ["Helendis Riverhorn, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "Helendis Riverhorn, à la Veille de Morgan, à l'est des Steppes ardentes.",
    ["Reward: a cloth robe, a leather jerkin or a mail breastplate."] =
        "Récompense : une robe en tissu, un pourpoint en cuir ou une cuirasse en mailles.",
    ["Enter Blackrock Spire"] =
        "Entre dans le pic Rochenoire",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the spire's door is at the top of the mountain."] =
        "Le mont Rochenoire s'ouvre à l'ouest des Steppes ardentes ; à l'intérieur, la porte du pic se trouve en haut de la montagne.",
    ["Warosh, a troll who walks near the spire's entrance."] =
        "Warosh, un troll qui marche près de l'entrée du pic.",
    ["Reward: a charm, after a fight with Urok Doomhowl."] =
        "Récompense : un charme, après un combat contre Urok Hurleruine.",
    ["Vaelan, a Scarshield infiltrator, stands up the ramp near the spire's entrance."] =
        "Vaelan, un infiltrateur du Bouclier balafré, se tient en haut de la rampe près de l'entrée du pic.",
    ["Optional: the Seal of Ascension, the key to the Upper Spire, a raid of ten; its last part is in Dustwallow Marsh."] =
        "Facultatif : le Sceau d'ascension, la clé du sommet du pic, un raid de dix ; sa dernière étape est au marécage d'Âprefange.",
    ["Bijou hides down in the trench after Hordemar City's second bridge."] =
        "Bijou se cache au fond de la tranchée après le deuxième pont de la cité de Hordemar.",
    ["Bijou's chain leads to Maxwell's Mission: armor of any kind, after a second visit."] =
        "La chaîne de Bijou mène à Mission de Maxwell : une armure de n'importe quel type, après une deuxième visite.",
    ["Her belongings lie in a chest on the bottom tier of Hordemar City; it can also stand as far as the Skitterweb Tunnels."] =
        "Ses affaires se trouvent dans un coffre au niveau inférieur de la cité de Hordemar ; il peut aussi se trouver jusque dans les tunnels de Grouilletoile.",
    ["Back to Bijou."] =
        "Retour auprès de Bijou.",
    ["The fifth tablet hangs on a wall of Shadow Hunter Vosh'gajin's room, the sixth on a wall of War Master Voone's room."] =
        "La cinquième tablette est accrochée à un mur de la salle de la chasseresse des ombres Vosh'gajin, la sixième à un mur de la salle du maître de guerre Voone.",
    ["Take the Roughshod Pike from a weapon rack on the left wall after Hordemar City's second bridge, join it to Highlord Omokk's head, and use it on the skull pile up the ramp past Mother Smolderweb: ogres come, then Urok Doomhowl."] =
        "Prends la Pique de fortune sur un râtelier d'armes contre le mur de gauche après le deuxième pont de la cité de Hordemar, assemble-la avec la tête du généralissime Omokk, et utilise-la sur le tas de crânes en haut de la rampe après la Matriarche Couveuse : des ogres arrivent, puis Urok Hurleruine.",
    ["The spire spider eggs lie in the upper Skitterweb Tunnels."] =
        "Les œufs d'araignée du pic se trouvent dans la partie haute des tunnels de Grouilletoile.",
    ["Use the empty cage on a Bloodaxe worg pup, in Halycon's room."] =
        "Utilise la cage vide sur un jeune worgen Bloodaxe, dans la salle de Halycon.",
    ["Halycon, the worgs' mother, holds Halycon's Lair."] =
        "Halycon, la mère des worgs, tient l'Antre de Halycon.",
    ["The Scarshield dwarves drop the unadorned seal; Highlord Omokk, north of Mok'Doom, may drop the Spirestone gem, War Master Voone, at the bottom of Tazz'Alaor, the Smolderthorn gem, and Overlord Wyrmthalak, the last boss, the Bloodaxe gem."] =
        "Les nains du Bouclier balafré laissent tomber le sceau non décoré ; le généralissime Omokk, au nord de Mok'Doom, peut laisser tomber la Gemme de Pierre-du-pic, le maître de guerre Voone, au fond de Tazz'Alaor, la Gemme de Smolderthorn, et le seigneur Wyrmthalak, le dernier boss, la Gemme de Bloodaxe.",
    ["Vaelan, near the entrance."] =
        "Vaelan, près de l'entrée.",
    ["Warosh, near the entrance."] =
        "Warosh, près de l'entrée.",
    ["Let Mother Smolderweb poison you and do not cure it: the poison must last until Ragged John, at Flame Crest."] =
        "Laisse la Matriarche Couveuse t'empoisonner et ne te soigne pas : le poison doit durer jusqu'à John le Loqueteux, à la Corniche des flammes.",
    ["Enter Blackrock Spire again"] =
        "Entre de nouveau dans le pic Rochenoire",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle."] =
        "Le généralissime Omokk, au nord de Mok'Doom ; le maître de guerre Voone, au fond de Tazz'Alaor ; le seigneur Wyrmthalak, le dernier boss, dans la Salle de bataille.",
    ["Kibler and Ragged John, at Flame Crest."] =
        "Kibler et John le Loqueteux, à la Corniche des flammes.",
    ["Helendis Riverhorn and Marshal Maxwell, at Morgan's Vigil."] =
        "Helendis Riverhorn et le maréchal Maxwell, à la Veille de Morgan.",
    ["Beat Emberstrife, a dragon of the Wyrmbog in Dustwallow Marsh, until his will breaks, then place the seal before him."] =
        "Frappe Brandeguerre, un dragon de la Tourbière du Wyrm au marécage d'Âprefange, jusqu'à ce que sa volonté se brise, puis place le sceau devant lui.",
    ["Vaelan, near the spire's entrance."] =
        "Vaelan, près de l'entrée du pic.",
    ["Yeh'kinya, beside him."] =
        "Yeh'kinya, à côté de lui.",
    ["Dire Maul"] =
        "Hache-Tripes",
    ["A herald of your capital: Crier Goodman in Stormwind, Courier Hammerfall in Ironforge, Herald Moonstalker in Darnassus."] =
        "Un héraut de ta capitale : le crieur Goodman à Hurlevent, le messager Hammerfall à Forgefer, le héraut Moonstalker à Darnassus.",
    ["Optional: a lead to Feathermoon Stronghold, about 1,500 XP."] =
        "Facultatif : une piste vers le bastion de Pennelune, environ 1\194\160500 XP.",
    ["Latronicus Moonspear, at Feathermoon Stronghold, in Feralas."] =
        "Latronicus Moonspear, au bastion de Pennelune, à Féralas.",
    ["Latronicus Moonspear and Scholar Runethorn, at Feathermoon Stronghold."] =
        "Latronicus Moonspear et l'érudite Runethorn, au bastion de Pennelune.",
    ["Lethtendris's Web brings a dagger; Elven Legends, about 8,300 XP for a search in the library."] =
        "Le filet de Lethtendris rapporte une dague ; Légendes elfiques, environ 8\194\160300 XP pour une recherche dans la bibliothèque.",
    ["Azj'Tordin, at Lariss Pavilion, in the east of Feralas."] =
        "Azj'Tordin, au pavillon de Lariss, à l'est de Féralas.",
    ["Reward: a two-handed sword or leather boots; Pusillin also drops the Crescent Key, which opens the west and north wings."] =
        "Récompense : une épée à deux mains ou des bottes en cuir ; Pusillin laisse aussi tomber la Clé en croissant, qui ouvre les ailes ouest et nord.",
    ["Rabine Saturna, in Nighthaven, in Moonglade."] =
        "Rabine Saturna, à Havrenuit, à Reflet-de-Lune.",
    ["Optional: a reliquary in Silithus for Rabine Saturna in Moonglade, then a shard of the Felvine: a shield or an off-hand lexicon."] =
        "Facultatif : un reliquaire à Silithus pour Rabine Saturna, à Reflet-de-Lune, puis un fragment de la Gangrevigne : un bouclier ou un lexique tenu en main gauche.",
    ["The Reliquary of Purity lies in the ruins of Southwind Village, in Silithus."] =
        "Le Reliquaire de pureté se trouve dans les ruines du village de Sudevent, à Silithus.",
    ["Rabine Saturna, in Nighthaven."] =
        "Rabine Saturna, à Havrenuit.",
    ["Enter Dire Maul"] =
        "Entre dans Hache-Tripes",
    ["The ruins of Dire Maul stand in the middle of Feralas; the east, west and north wings each have their own door."] =
        "Les ruines de Hache-Tripes se dressent au centre de Féralas ; les ailes est, ouest et nord ont chacune leur propre porte.",
    ["East: talk to Pusillin each time he stops; he runs five times, then fights on a small platform up a ramp and drops the book."] =
        "Est : parle à Pusillin chaque fois qu'il s'arrête ; il s'enfuit cinq fois, puis combat sur une petite plate-forme en haut d'une rampe et laisse tomber le livre.",
    ["East: Lethtendris waits on the upper level of the room left of the ramps between the Hidden Reach and the Warpwood Quarter."] =
        "Est : Lethtendris attend au niveau supérieur de la salle à gauche des rampes, entre les Confins cachés et le quartier de Crochebois.",
    ["East: kill Zevrim Thornhoof, then Ironbark the Redeemed, in the Conservatory, opens the door to Alzzin the Wildshaper; after Alzzin, use the reliquary by the twisted vine."] =
        "Est : tue Zevrim Thornhoof, puis Ecorcefer le Racheté, dans le Conservatoire, ouvre la porte d'Alzzin le Modeleur ; après Alzzin, utilise le reliquaire près de la vigne tordue.",
    ["West: the Shen'dralar Ancient stands above the platform over Tendris Warpwood."] =
        "Ouest : l'Ancienne de Shen'Dralar se tient au-dessus de la plate-forme qui domine Tendris Crochebois.",
    ["About 9,950 XP; its treasure, a chest in the library, brings a two-handed mace, a mail helm or leather boots."] =
        "Environ 9\194\160950 XP ; son trésor, un coffre dans la bibliothèque, rapporte une masse à deux mains, un casque en mailles ou des bottes en cuir.",
    ["West: destroy the five pylons of the Capital Gardens, the Court of the Highborne and the Prison; Immol'thar waits in the Prison, behind Tendris (the Crescent Key opens it); Prince Tortheldrin, under the entry platform of the Athenaeum."] =
        "Ouest : détruis les cinq pylônes des Jardins de la capitale, de la Cour des Bien-nés et de la Prison ; Immol'thar attend dans la Prison, derrière Tendris (la Clé en croissant l'ouvre) ; le prince Tortheldrin, sous la plate-forme d'entrée de l'Athenaeum.",
    ["West: the treasure is a big stone chest under the ramp of the Athenaeum."] =
        "Ouest : le trésor est un grand coffre de pierre sous la rampe de l'Athenaeum.",
    ["West: through the Conservatory Door (the Crescent Key opens it), the remains lie by a dead elf and a bookcase, in the north of the Athenaeum."] =
        "Ouest : par la porte du Conservatoire (la Clé en croissant l'ouvre), les restes se trouvent près d'un elfe mort et d'une étagère de livres, au nord de l'Athenaeum.",
    ["North: Knot Thimblejack is chained in the north-east corner of the Halls of Destruction."] =
        "Nord : Knot Thimblejack est enchaîné dans le coin nord-est des Salles de la Destruction.",
    ["About 6,600 XP for a key the Gordok guards carry."] =
        "Environ 6\194\160600 XP pour une clé que portent les gardes gordok.",
    ["Optional: the Gordok Ogre Suit needs runecloth, rugged leather and rune threads."] =
        "Facultatif : la Tenue d'ogre gordok demande de l'étoffe runique, du cuir robuste et du fil runique.",
    ["North: the Gordok guards Mol'dar, Slip'kik and Fengus, and Captain Kromcrush, carry the shackle key."] =
        "Nord : les gardes gordok Mol'dar, Slip'kik et Fengus, ainsi que le capitaine Kromcrush, portent la clé des menottes.",
    ["Knot Thimblejack."] =
        "Knot Thimblejack.",
    ["North: the ogre tannin lies up the ramp above Knot, in the north-west corner: one per group."] =
        "Nord : le tanin ogre se trouve en haut de la rampe au-dessus de Knot, dans le coin nord-ouest : un seul par groupe.",
    ["North: Captain Kromcrush, once King Gordok is dead."] =
        "Nord : le capitaine Kromcrush, une fois le roi Gordok mort.",
    ["Optional, after a tribute run (King Gordok dead, his guards alive): gloves of any kind."] =
        "Facultatif, après un passage tribut (roi Gordok mort, ses gardes en vie) : des gants de n'importe quel type.",
    ["The Gauntlet of Gordok Might lies in the Prince's chest, in the Athenaeum of the west wing."] =
        "Le Gantelet de puissance gordok se trouve dans le coffre du prince, dans l'Athenaeum de l'aile ouest.",
    ["North: Stomper Kreeg, after a tribute run."] =
        "Nord : Kreeg le Marteleur, après un passage tribut.",
    ["Azj'Tordin, at Lariss Pavilion."] =
        "Azj'Tordin, au pavillon de Lariss.",
    ["Latronicus Moonspear, at Feathermoon Stronghold."] =
        "Latronicus Moonspear, au bastion de Pennelune.",
    ["Scholar Runethorn, at Feathermoon Stronghold."] =
        "Erudite Runethorn, au bastion de Pennelune.",
    ["Scholomance"] =
        "Scholomance",
    ["Commander Ashlam Valorfist, at Chillwind Camp, in the Western Plaguelands."] =
        "Commandant Ashlam Valorfist, au camp du Noroît, dans les Maleterres de l'Ouest.",
    ["Optional: the chain of the Skeleton Key, which opens Scholomance's door: one key per group is enough. It goes through the Plaguelands, Gadgetzan and Un'Goro."] =
        "Facultatif : la chaîne de la Clé squelette, qui ouvre la porte de Scholomance : une clé par groupe suffit. Elle passe par les Maleterres, Gadgetzan et Un'Goro.",
    ["The skeletal flayers and slavering ghouls of Sorrow Hill, in the south of the Western Plaguelands."] =
        "Les écorcheurs squelettes et les goules écumantes de la colline des Chagrins, au sud des Maleterres de l'Ouest.",
    ["Mark the four watchtowers of Andorhal with the beacon torch, standing in each doorway."] =
        "Marque les quatre tours de guet d'Andorhal avec la torche-balise, en te tenant dans chaque entrée.",
    ["Alchemist Arbington, at Chillwind Camp."] =
        "Alchimiste Arbington, au camp du Noroît.",
    ["The undead of the Western Plaguelands drop the skeletal fragments."] =
        "Les morts-vivants des Maleterres de l'Ouest laissent tomber les fragments de squelette.",
    ["Krinkle Goodsteel, in Gadgetzan, in Tanaris: bring 15 gold."] =
        "Krinkle Goodsteel, à Gadgetzan, à Tanaris : apporte 15 pièces d'or.",
    ["Bring two thorium bars to the top of Fire Plume Ridge, in Un'Goro Crater, and use the mold by the lava lake."] =
        "Apporte deux barres de thorium au sommet de la crête de la Fournaise, dans le cratère d'Un'Goro, et utilise le moule près du lac de lave.",
    ["Araj the Summoner stands in the middle of Andorhal."] =
        "Araj l'Invocateur se tient au centre d'Andorhal.",
    ["Betina Bigglezink, at Light's Hope Chapel, in the Eastern Plaguelands."] =
        "Betina Bigglezink, à la chapelle de l'Espoir de Lumière, dans les Maleterres de l'Est.",
    ["About 6,200 XP; a hatchling may drop a scale that starts another quest."] =
        "Environ 6\194\160200 XP ; un jeune pestiféré peut laisser tomber une écaille qui lance une autre quête.",
    ["Weldon Barov, at Chillwind Camp."] =
        "Weldon Barov, au camp du Noroît.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Alexi Barov in the Horde's Bulwark."] =
        "La fortune des Barov : quatre titres de propriété dans l'école ; sa suite t'envoie tuer Alexi Barov au Rempart, le camp de la Horde.",
    ["Eva Sarkhoff, in Caer Darrow, on the island of Darrowmere Lake."] =
        "Eva Sarkhoff, à Caer Darrow, sur l'île du lac Darrowmere.",
    ["Eva Sarkhoff's chain: three parts inside the school, then Kirtonos the Herald and a sword or an off-hand item among its rewards."] =
        "La chaîne d'Eva Sarkhoff : trois étapes dans l'école, puis Kirtonos le Héraut, avec parmi ses récompenses une épée ou un objet tenu en main gauche.",
    ["Enter Scholomance"] =
        "Entre dans Scholomance",
    ["The school stands on the island of Caer Darrow, in Darrowmere Lake, in the south-east of the Western Plaguelands."] =
        "L'école se dresse sur l'île de Caer Darrow, dans le lac Darrowmere, au sud-est des Maleterres de l'Ouest.",
    ["The deeds: Southshore's on a table north-east of the Reliquary; Tarren Mill's on a table on the left at the entry of the Great Ossuary; Brill's on a ledge south-west of the Laboratory; Caer Darrow's on a table east of the Barov Family Vault."] =
        "Les titres de propriété : celui d'Austrivage sur une table au nord-est du Reliquaire ; celui de Moulin-de-Tarren sur une table à gauche à l'entrée du Grand ossuaire ; celui de Brill sur un rebord au sud-ouest du Laboratoire ; celui de Caer Darrow sur une table à l'est du Caveau de la famille Barov.",
    ["The plagued hatchlings fill a room of the Great Ossuary."] =
        "Les jeunes pestiférés remplissent une salle du Grand ossuaire.",
    ["A hatchling may drop a healthy dragon scale: use it."] =
        "Un jeune pestiféré peut laisser tomber une écaille de dragon luisante : utilise-la.",
    ["Doctor Theolen Krastinov, in the east of the upper Headmaster's Study: kill him, then burn the two piles of remains, to the north and the south-east of his room."] =
        "Le docteur Theolen Krastinov, à l'est de la partie haute du Bureau du directeur : tue-le, puis brûle les deux tas de restes, au nord et au sud-est de sa salle.",
    ["Eva Sarkhoff, in Caer Darrow."] =
        "Eva Sarkhoff, à Caer Darrow.",
    ["Enter Scholomance again"] =
        "Entre de nouveau dans Scholomance",
    ["Jandice Barov waits in the north-east of the room down the stairs, on the right of the second big room."] =
        "Jandice Barov attend au nord-est de la salle en bas des escaliers, à droite de la deuxième grande salle.",
    ["Rattlegore, at the bottom of the Great Ossuary, drops the Viewing Room key; put the Blood of Innocents in the brazier on the balcony on the right of the Chamber of Summoning: Kirtonos the Herald comes."] =
        "Cliquettripes, au fond du Grand ossuaire, laisse tomber la Clé de la Chambre des visions ; mets le Sang des innocents dans le brasero du balcon, à droite de la Chambre d'invocation : Kirtonos le Héraut arrive.",
    ["Betina Bigglezink, at Light's Hope Chapel."] =
        "Betina Bigglezink, à la chapelle de l'Espoir de Lumière.",
    ["Optional: an assassination in the other side's camp, among its guards; it brings the Barov Peasant Caller."] =
        "Facultatif : un assassinat dans le camp de l'autre faction, au milieu de ses gardes ; il rapporte la Cloche des Barov.",
    ["Alexi Barov stands among the guards of the Bulwark, the Horde's camp in the north of the Western Plaguelands."] =
        "Alexi Barov se tient parmi les gardes du Rempart, le camp de la Horde au nord des Maleterres de l'Ouest.",
    ["Magistrate Marduke, in Caer Darrow."] =
        "Magistrat Marduke, à Caer Darrow.",
    ["Optional: a chain through Stromgarde, Light's Hope and the Baron's room of Stratholme, back to the school's last boss; it brings a sword, a dagger, a cloth crown or a shield and about 9,950 XP."] =
        "Facultatif : une chaîne qui passe par Stromgarde, l'Espoir de Lumière et la salle du baron à Stratholme, avant de revenir au dernier boss de l'école ; elle rapporte une épée, une dague, une couronne en tissu ou un bouclier et environ 9\194\160950 XP.",
    ["The Keepsake of Remembrance lies in the ruins of Stromgarde, in Arathi Highlands."] =
        "Le Livre du souvenir se trouve dans les ruines de Stromgarde, dans les Hautes-terres d'Arathi.",
    ["Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "Leonid Barthalomew le Révéré, à la chapelle de l'Espoir de Lumière.",
    ["Stratholme: place the keepsake on the unholy ground of Baron Rivendare's room."] =
        "Stratholme : place le livre sur le sol impie de la salle du baron Rivendare.",
    ["Ras Frostwhisper waits in the Laboratory: use the Soulbound Keepsake on him."] =
        "Ras Murmegivre attend dans le Laboratoire : utilise le Souvenir lié sur lui.",
    ["Stratholme"] =
        "Stratholme",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel, in the east of the Eastern Plaguelands."] =
        "Smokey LaRue et Leonid Barthalomew le Révéré, à la chapelle de l'Espoir de Lumière, à l'est des Maleterres de l'Est.",
    ["Smokey LaRue's tobacco brings a lighter (a trinket); Leonid's holy water, a cloth crown, a ring or potions."] =
        "Le tabac de Smokey LaRue rapporte un briquet (un bijou) ; l'eau sacrée de Leonid, une couronne en tissu, un anneau ou des potions.",
    ["Betina's flesh samples open The Active Agent: a choice of two trinkets."] =
        "Les échantillons de chair de Betina ouvrent L'agent actif : deux bijoux au choix.",
    ["Duke Nicholas Zverenhoff, at Light's Hope Chapel."] =
        "Duc Nicholas Zverenhoff, à la chapelle de l'Espoir de Lumière.",
    ["Duke Nicholas's chain leads to Balnazzar, then Baron Rivendare, then the Argent Hold: a sword, a staff or a shield."] =
        "La chaîne du duc Nicholas mène à Balnazzar, puis au baron Rivendare, puis au Siège de l'Aube d'argent : une épée, un bâton ou un bouclier.",
    ["Caretaker Alen, at Light's Hope Chapel."] =
        "Conservateur Alen, à la chapelle de l'Espoir de Lumière.",
    ["Egan's restless souls bring about 8,300 XP."] =
        "Les âmes tourmentées d'Egan rapportent environ 8\194\160300 XP.",
    ["Tirion Fordring, in his hut by the lake on the western edge of the Eastern Plaguelands."] =
        "Tirion Fordring, dans sa cabane au bord du lac, à la lisière ouest des Maleterres de l'Est.",
    ["Optional: Tirion Fordring's long chain across both Plaguelands and Caer Darrow; its painting hangs in the city, and its end, In Dreams, brings armor, a warhammer or jewelry and about 9,950 XP."] =
        "Facultatif : la longue chaîne de Tirion Fordring à travers les deux Maleterres et Caer Darrow ; son tableau est accroché dans la cité, et sa fin, En rêves, rapporte une armure, un marteau de guerre ou un bijou et environ 9\194\160950 XP.",
    ["The plaguehounds, plaguebats and carrion grubs of the Eastern Plaguelands."] =
        "Les chiens pestiférés, les chauves-souris pestiférées et les larves putrides des Maleterres de l'Est.",
    ["Listen to Tirion Fordring."] =
        "Écoute Tirion Fordring.",
    ["Taelan's hammer lies in the Undercroft, at the southern end of the Eastern Plaguelands."] =
        "Le Marteau de Taelan se trouve dans la Crypte, à l'extrémité sud des Maleterres de l'Est.",
    ["The Symbol of Lost Honor lies in Northdale, in the north-east of the Eastern Plaguelands."] =
        "Le Symbole de l'honneur perdu se trouve à Val-du-Nord, au nord-est des Maleterres de l'Est.",
    ["Artist Renfray, in Caer Darrow, in the Western Plaguelands."] =
        "Artiste Renfray, à Caer Darrow, dans les Maleterres de l'Ouest.",
    ["Egan, by the road to Stratholme's gate, in the north-west of the Eastern Plaguelands."] =
        "Egan, près de la route de la porte de Stratholme, au nord-ouest des Maleterres de l'Est.",
    ["Enter Stratholme"] =
        "Entre dans Stratholme",
    ["The city's main gate, in the north of the Eastern Plaguelands, opens on the Scarlet side."] =
        "La grande porte de la cité, au nord des Maleterres de l'Est, s'ouvre sur le côté écarlate.",
    ["King's Square: take the box of tobacco in Ezra Grimm's smoke shop; Ezra Grimm comes for it."] =
        "Place du Roi : prends la boîte de tabac dans la boutique de tabac d'Ezra Grimm ; Ezra Grimm vient la réclamer.",
    ["The supply crates along the city's walls hold the holy water; some call monsters."] =
        "Les caisses de ravitaillement le long des murs de la cité contiennent l'eau sacrée ; certaines font venir des monstres.",
    ["Every creature of the city may drop a flesh sample."] =
        "Chaque créature de la cité peut laisser tomber un échantillon de chair.",
    ["Use Egan's blaster on the spectral citizens, then again on the restless souls that break free."] =
        "Utilise le Libérateur d'Egan sur les citoyens spectraux, puis de nouveau sur les âmes sans repos qui se libèrent.",
    ["Archivist Galford waits near the end of the Scarlet Bastion: kill him and burn the book on his table."] =
        "L'archiviste Galford attend vers le fond du Bastion écarlate : tue-le et brûle le livre sur sa table.",
    ["The painting hangs in Galford's room."] =
        "Le tableau est accroché dans la salle de Galford.",
    ["Balnazzar, at the end of the Scarlet Bastion, drops his head: use it."] =
        "Balnazzar, au bout du Bastion écarlate, laisse tomber sa tête : utilise-la.",
    ["Aurius waits in a chapel by the service entrance, the other gate of the city."] =
        "Aurius attend dans une chapelle près de l'entrée de service, l'autre porte de la cité.",
    ["Optional: Aurius's medallion makes him join the fight against Baron Rivendare: a choice of two trinkets."] =
        "Facultatif : le médaillon d'Aurius le fait se joindre au combat contre le baron Rivendare : deux bijoux au choix.",
    ["The medallion lies in Malor's strongbox, in Malor the Zealous's room of the Hall of Lights: the Scarlet Key, or a rogue, opens the Bastion's door."] =
        "Le médaillon se trouve dans le Coffre de Malor, dans la salle de Malor le Zélé, au Hall des Lumières : la Clé écarlate, ou un voleur, ouvre la porte du Bastion.",
    ["Aurius, in his chapel."] =
        "Aurius, dans sa chapelle.",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "Smokey LaRue et Leonid Barthalomew le Révéré, à la chapelle de l'Espoir de Lumière.",
    ["Enter Stratholme by the service entrance"] =
        "Entre dans Stratholme par l'entrée de service",
    ["The service entrance, east of the main gate, opens on the side of Baron Rivendare."] =
        "L'entrée de service, à l'est de la grande porte, s'ouvre du côté du baron Rivendare.",
    ["The new Scourge data lies in one of the three ziggurats of the Gauntlet."] =
        "La nouvelle Donnée du Fléau se trouve dans l'une des trois ziggourats du Défilé.",
    ["Baron Rivendare waits downstairs in the building of Slaughter Square."] =
        "Le baron Rivendare attend en bas, dans le bâtiment de la place de l'Abattoir.",
    ["Aurius appears in the Baron's room and fights at your side."] =
        "Aurius apparaît dans la salle du baron et combat à tes côtés.",
    ["Lord Maxwell Tyrosus, inside Light's Hope Chapel."] =
        "Seigneur Maxwell Tyrosus, à l'intérieur de la chapelle de l'Espoir de Lumière.",
    ["Open the Argent Hold, inside the chapel."] =
        "Ouvre le Siège de l'Aube d'argent, à l'intérieur de la chapelle.",
    ["Egan, by the road to Stratholme."] =
        "Egan, près de la route de Stratholme.",
    ["Tirion Fordring, in his hut."] =
        "Tirion Fordring, dans sa cabane.",
    ["Myranda the Hag, at Uther's Tomb, in the Western Plaguelands."] =
        "Myranda la Mégère, au tombeau d'Uther, dans les Maleterres de l'Ouest.",
    ["Under Myranda's Scarlet illusion, walk into Hearthglen and give Tirion's gift to Highlord Taelan Fordring."] =
        "Sous l'illusion écarlate de Myranda, entre dans Âtreval et donne le Don de Tirion au généralissime Taelan Fordring.",
    ["Lead Taelan Fordring out of Hearthglen; the Scarlet give chase."] =
        "Conduis Taelan Fordring hors d'Âtreval ; les Écarlates te prennent en chasse.",
    ["Tirion Fordring."] =
        "Tirion Fordring.",
    ["Ragefire Chasm"] =
        "Gouffre de Ragefeu",
    ["Rahauro, on the Elder Rise of Thunder Bluff."] =
        "Rahauro, sur la cime des Anciens des Pitons-du-Tonnerre.",
    ["The lost satchel's quest ends with bracers of cloth, leather or mail."] =
        "La quête de la sacoche perdue se termine par des brassards en tissu, en cuir ou en mailles.",
    ["Varimathras, beside Sylvanas in the Royal Quarter of Undercity."] =
        "Varimathras, à côté de Sylvanas, dans le Quartier royal de Fossoyeuse.",
    ["Optional: given in Undercity, a zeppelin ride each way. Rewards leggings of cloth, leather or mail."] =
        "Facultatif : donnée à Fossoyeuse, un trajet en zeppelin dans chaque sens. Elle rapporte des jambières en tissu, en cuir ou en mailles.",
    ["Thrall, in Grommash Hold, in the Valley of Wisdom."] =
        "Thrall, au fort Grommash, dans la vallée de la Sagesse.",
    ["Thrall's chain of four quests ends with a weapon of your choice."] =
        "La chaîne de quatre quêtes de Thrall se termine par une arme de ton choix.",
    ["The Burning Blade cultists of the Cleft of Shadow carry the insignia."] =
        "Les sectateurs de la Lame ardente de la Faille de l'ombre portent les insignes.",
    ["Talk to Neeru Fireblade, in the Darkbriar Lodge of the Cleft of Shadow."] =
        "Parle à Neeru Fireblade, dans le pavillon de Sombronce, dans la Faille de l'ombre.",
    ["Neeru Fireblade also asks for the heart of the chasm's beast."] =
        "Neeru Fireblade demande aussi le cœur de la bête du gouffre.",
    ["Back to Thrall, in Grommash Hold."] =
        "Retour auprès de Thrall, au fort Grommash.",
    ["Enter Ragefire Chasm"] =
        "Entre dans le gouffre de Ragefeu",
    ["The entrance is a cave in the Cleft of Shadow, in the middle of Orgrimmar."] =
        "L'entrée est une grotte dans la Faille de l'ombre, au centre d'Orgrimmar.",
    ["Ragefire troggs and their shamans fill the first caves."] =
        "Les troggs Ragefeu et leurs chamans peuplent les premières grottes.",
    ["Maur Grimtotem's body lies in a small cave on the right, past the big trogg cave."] =
        "Le corps de Maur Grimtotem gît dans une petite grotte sur la droite, après la grande grotte des troggs.",
    ["The Searing Blade cultists and warlocks carry both books."] =
        "Les sectateurs et les démonistes de la Lame brûlante portent les deux livres.",
    ["Taragaman the Hungerer, the chasm's second boss, guards a lava cave."] =
        "Taragaman l'Affameur, le deuxième boss du gouffre, garde une grotte de lave.",
    ["Jergosh the Invoker is the third boss; Bazzalan waits at the very end of the chasm."] =
        "Jergosh l'Invocateur est le troisième boss ; Bazzalan attend tout au fond du gouffre.",
    ["Thrall, in Grommash Hold."] =
        "Thrall, au fort Grommash.",
    ["Neeru Fireblade, in the Cleft of Shadow."] =
        "Neeru Fireblade, dans la Faille de l'ombre.",
    ["Your reward: an axe, a mace, a dagger or a staff of Orgrimmar."] =
        "Ta récompense : une hache, une masse, une dague ou un bâton d'Orgrimmar.",
    ["Varimathras, in the Royal Quarter of Undercity."] =
        "Varimathras, dans le Quartier royal de Fossoyeuse.",
    ["Tonga Runetotem, at the Crossroads."] =
        "Tonga Runetotem, à la Croisée.",
    ["Tonga's three oases open Leaders of the Fang, the caverns' main quest: a weapon of your choice."] =
        "Les trois oasis de Tonga ouvrent Les druides du Croc, la quête principale des cavernes : une arme de ton choix.",
    ["The Forgotten Pools lie north-west of the Crossroads, north of the caverns' hill."] =
        "Les Bassins oubliés se trouvent au nord-ouest de la Croisée, au nord de la colline des cavernes.",
    ["The Stagnant Oasis lies south-east of the Crossroads: use the bubbling fissure in its water."] =
        "L'oasis stagnante se trouve au sud-est de la Croisée : utilise la fissure bouillonnante dans son eau.",
    ["The snapjaw turtles of the Lushwater Oasis, at the foot of the caverns' hill."] =
        "Les tortues gueule d'acier de l'oasis Luxuriante, au pied de la colline des cavernes.",
    ["Apothecary Zamah, in the Pools of Vision under the Spirit Rise."] =
        "Apothicaire Zamah, dans les bassins de la Vision, sous la cime des Esprits.",
    ["Reward: a piece of cloth, leather or mail armor."] =
        "Récompense : une pièce d'armure en tissu, en cuir ou en mailles.",
    ["Arch Druid Hamuul Runetotem, on the Elder Rise."] =
        "Archidruide Hamuul Runetotem, sur la cime des Anciens.",
    ["Nara Wildmane, on the Elder Rise."] =
        "Nara Wildmane, sur la cime des Anciens.",
    ["Serpentbloom: small green shrubs with violet flowers, in the caves before the door and inside."] =
        "Fleur de serpent : de petits arbustes verts aux fleurs violettes, dans les grottes avant la porte et à l'intérieur.",
    ["The four Fanglords each drop a gem: Lady Anacondra and Lord Cobrahn first, then Lord Pythas, and Lord Serpentis last."] =
        "Les quatre seigneurs du Croc laissent chacun tomber une gemme : dame Anacondra et le seigneur Cobrahn d'abord, puis le seigneur Pythas, et le seigneur Serpentis en dernier.",
    ["Nara Wildmane, on the Elder Rise of Thunder Bluff."] =
        "Nara Wildmane, sur la cime des Anciens des Pitons-du-Tonnerre.",
    ["Your reward: a staff, a mace or a sword."] =
        "Ta récompense : un bâton, une masse ou une épée.",
    ["Apothecary Zamah, in the Pools of Vision."] =
        "Apothicaire Zamah, dans les bassins de la Vision.",
    ["Tabitha Heartweaver, at the Sepulcher, in Silverpine Forest."] =
        "Tabitha Heartweaver, au Sépulcre, dans la forêt des Pins-Argentés.",
    ["Reward: a dagger or cloth cuffs."] =
        "Récompense : une dague ou des manchettes en tissu.",
    ["Deathguard Kristof, in Brill, in Tirisfal Glades."] =
        "Deathguard Kristof, à Brill, dans les clairières de Tirisfal.",
    ["Reward: a two-handed axe or a staff."] =
        "Récompense : une hache à deux mains ou un bâton.",
    ["Morbin Lightbane, in Undercity."] =
        "Morbin Lightbane, à Fossoyeuse.",
    ["Reward: leather armor or a mace."] =
        "Récompense : une armure en cuir ou une masse.",
    ["Theodore Griffs, in Undercity."] =
        "Theodore Griffs, à Fossoyeuse.",
    ["Reward: cloth gloves or a sword."] =
        "Récompense : des gants en tissu ou une épée.",
    ["The ruins rise above Undercity, in Tirisfal Glades."] =
        "Les ruines se dressent au-dessus de Fossoyeuse, dans les clairières de Tirisfal.",
    ["Look for Edward Heartweaver in the ruins."] =
        "Cherche Edward Heartweaver dans les ruines.",
    ["Twenty-five intact limbs, from the undead of the ruins."] =
        "Vingt-cinq membres intacts, sur les morts-vivants des ruines.",
    ["Rath'mael waits in the ruins."] =
        "Rath'mael attend dans les ruines.",
    ["Witherfang carries the highly toxic strain."] =
        "Witherfang porte la souche hautement toxique.",
    ["The Baron may drop an abominable head: read it."] =
        "Le Baron peut laisser tomber une tête abominable : lis-la.",
    ["Oran Snakewrithe, in Undercity."] =
        "Oran Snakewrithe, à Fossoyeuse.",
    ["Master Apothecary Faranell, in the Apothecarium of Undercity."] =
        "Maître apothicaire Faranell, dans l'Apothicarium de Fossoyeuse.",
    ["Optional: Faranell's Unending Torment goes on in Undercity; its last part has a two-handed sword among its rewards."] =
        "Facultatif : Unending Torment, la quête de Faranell, continue à Fossoyeuse ; sa dernière étape a une épée à deux mains parmi ses récompenses.",
    ["A toxic skullcap from Tawny Grisette in the Trade Quarter, blisterweed near the herbalism trainer, and an essence of agony from the poison vendor of the Rogues' Quarter."] =
        "Une scutellaire toxique chez Tawny Grisette, dans le quartier commerçant, de l'herbe-cloque près du maître en herboristerie, et une essence d'agonie chez le vendeur de poisons du quartier des Voleurs.",
    ["Inject the hissing serum into the system above Othmar's body."] =
        "Injecte le sérum sifflant dans le dispositif au-dessus du corps d'Othmar.",
    ["Bring the Baron's head to Othmar's body, the unfinished abomination."] =
        "Apporte la tête du Baron au corps d'Othmar, l'abomination inachevée.",
    ["Master Apothecary Faranell."] =
        "Maître apothicaire Faranell.",
    ["Deathguard Kristof, in Brill."] =
        "Deathguard Kristof, à Brill.",
    ["Tabitha Heartweaver, at the Sepulcher."] =
        "Tabitha Heartweaver, au Sépulcre.",
    ["Shadowfang Keep"] =
        "Donjon d'Ombrecroc",
    ["Keeper Bel'dugur, in Undercity."] =
        "Gardien Bel'dugur, à Fossoyeuse.",
    ["Dalar Dawnweaver, at the Sepulcher, in Silverpine Forest."] =
        "Dalar Dawnweaver, au Sépulcre, dans la forêt des Pins-Argentés.",
    ["Reward: a ring and about 3,300 XP."] =
        "Récompense : un anneau et environ 3\194\160300 XP.",
    ["High Executor Hadrec, at the Sepulcher."] =
        "Grand exécuteur Hadrec, au Sépulcre.",
    ["Reward: shoulders of cloth, leather or mail."] =
        "Récompense : des épaulières en tissu, en cuir ou en mailles.",
    ["Enter Shadowfang Keep"] =
        "Entre dans le donjon d'Ombrecroc",
    ["The keep stands south of the Sepulcher."] =
        "Le donjon se dresse au sud du Sépulcre.",
    ["Deathstalker Vincent lies in the courtyard: Deathstalker Adamant, freed after Rethilgore, opens its door."] =
        "Le traqueur noir Vincent gît dans la cour : le traqueur noir Adamant, libéré après Rethilgore, en ouvre la porte.",
    ["The Book of Ur, a blue book, stands on a bookshelf on the left of Fenrus the Devourer's room."] =
        "Le Livre d'Ur, un livre bleu, se trouve sur une étagère à gauche de la salle de Fenrus le Dévoreur.",
    ["Archmage Arugal, the last boss, waits at the top of the keep."] =
        "L'archimage Arugal, le dernier boss, attend au sommet du donjon.",
    ["Dalar Dawnweaver, at the Sepulcher."] =
        "Dalar Dawnweaver, au Sépulcre.",
    ["Tsunaman, at Sun Rock Retreat, in Stonetalon Mountains."] =
        "Tsunaman, à la retraite de Roche-Soleil, dans les Serres-Rocheuses.",
    ["Optional: a lead from Stonetalon to Zoram'gar Outpost."] =
        "Facultatif : une piste des Serres-Rocheuses vers l'avant-poste de Zoram'gar.",
    ["Je'neu Sancrea, at Zoram'gar Outpost, on Ashenvale's coast."] =
        "Je'neu Sancrea, à l'avant-poste de Zoram'gar, sur la côte d'Orneval.",
    ["Je'neu Sancrea, at Zoram'gar Outpost."] =
        "Je'neu Sancrea, à l'avant-poste de Zoram'gar.",
    ["The Earthen Ring's quests: Amongst the Ruins wakes Baron Aquanis, whose drop starts a quest with a sword among its rewards."] =
        "Les quêtes du Cercle terrestre : Parmi les ruines réveille le baron Aquanis, dont le butin lance une quête avec une épée parmi ses récompenses.",
    ["The deeps open in ruins half under water, on the coast of Zoram Strand."] =
        "Les profondeurs s'ouvrent dans des ruines à moitié sous l'eau, sur la côte de la grève de Zoram.",
    ["The Sapphires of Aku'Mai grow on the walls of the cave before the dungeon's door."] =
        "Les Saphirs d'Aku'Mai poussent sur les parois de la grotte qui précède la porte du donjon.",
    ["The Blackfathom tide priestesses of that cave may drop a damp note: read it."] =
        "Les prêtresses des marées de Brassenoire de cette grotte peuvent laisser tomber une note humide : lis-la.",
    ["Back to Je'neu Sancrea, at Zoram'gar Outpost, before the dungeon."] =
        "Retour auprès de Je'neu Sancrea, à l'avant-poste de Zoram'gar, avant le donjon.",
    ["Reward: a wand, a shield or leather armor."] =
        "Récompense : une baguette, un bouclier ou une armure en cuir.",
    ["Lorgus Jett walks the nooks on the west side, south of the Pool of Ask'ar."] =
        "Lorgus Jett parcourt les recoins du côté ouest, au sud du bassin d'Ask'ar.",
    ["The Fathom Stone lies under the water in the middle of the Moonshrine Ruins, under the walkway before Kelris; taking its core wakes Baron Aquanis."] =
        "La Pierre de la Brasse se trouve sous l'eau au centre des ruines du sanctuaire lunaire, sous la passerelle avant Kelris ; prendre son noyau réveille le baron Aquanis.",
    ["Baron Aquanis may drop a Strange Water Globe: use it."] =
        "Le baron Aquanis peut laisser tomber un Globe d'eau étrange : utilise-le.",
    ["Bashana Runetotem, on the Elder Rise of Thunder Bluff."] =
        "Bashana Runetotem, sur la cime des Anciens des Pitons-du-Tonnerre.",
    ["Borstan, the meat vendor of Orgrimmar."] =
        "Borstan, marchand de viande d'Orgrimmar.",
    ["Reward: a dagger or a satchel of potions."] =
        "Récompense : une dague ou une sacoche de potions.",
    ["Zaruk, at Hammerfall, in Arathi Highlands."] =
        "Zaruk, à Trépas-d'Orgrim, dans les Hautes-terres d'Arathi.",
    ["Dragonmaw Rumors leads to Open the Maw, inside the site."] =
        "Dragonmaw Rumors mène à Open the Maw, dans le site.",
    ["The Deathstalker Agent hides in the hills above the Dragonmaw camp, in the Wetlands."] =
        "L'agent Traqueur noir se cache dans les collines au-dessus du camp Dragonmaw, dans les Paluns.",
    ["Thicket raptor meat, from the raptors of the site."] =
        "De la viande de raptor des fourrés, sur les raptors du site.",
    ["The Dragonmaw forces of the site, their thaumaturgists among them."] =
        "Les forces Dragonmaw du site, dont leurs thaumaturges.",
    ["The Titan relic leads to the Earthen Ring: a staff or a two-handed mace."] =
        "La relique des Titans mène au Cercle terrestre : un bâton ou une masse à deux mains.",
    ["The Deathstalker Agent, above the Dragonmaw camp."] =
        "L'agent Traqueur noir, au-dessus du camp Dragonmaw.",
    ["Borstan, in Orgrimmar."] =
        "Borstan, à Orgrimmar.",
    ["Muln Earthfury, on the Skywatcher Plateau, in the north-west of Mulgore."] =
        "Muln Earthfury, sur le plateau des Guetteurs du ciel, au nord-ouest de Mulgore.",
    ["Nogg, in his machine shop in the Valley of Honor of Orgrimmar."] =
        "Nogg, dans son atelier de mécanique de la vallée de l'Honneur, à Orgrimmar.",
    ["Sovik, beside Nogg."] =
        "Sovik, à côté de Nogg.",
    ["Scooty's transponder sends you straight to Gnomeregan, far in Dun Morogh, and stays yours."] =
        "Le transpondeur de Scooty t'envoie directement à Gnomeregan, au loin à Dun Morogh, et il te reste.",
    ["Wait for Scooty to set up the transponder."] =
        "Attends que Scooty installe le transpondeur.",
    ["The transponder leaves you by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "Le transpondeur te dépose près des portes de Gnomeregan, à l'ouest de Dun Morogh.",
    ["Optional: an escort, turned in at Booty Bay; it rewards bracers or shoulders."] =
        "Facultatif : une escorte, à rendre à Baie-du-Butin ; elle rapporte des brassards ou des épaulières.",
    ["The last boss, Mekgineer Thermaplugg, carries the code of his safe, set in the far wall of the Tinkers' Court next to the third pillar counting from the right."] =
        "Le dernier boss, le mekgénieur Thermaplugg, porte la combinaison de son coffre, encastré dans le mur du fond de la Cour des Bricoleurs, à côté du troisième pilier en partant de la droite.",
    ["Scooty, in Booty Bay."] =
        "Scooty, à Baie-du-Butin.",
    ["Nogg, in Orgrimmar."] =
        "Nogg, à Orgrimmar.",
    ["It opens Hearts of Zeal, a quest of the Scarlet Monastery."] =
        "Elle ouvre Des cœurs zélés, une quête du Monastère écarlate.",
    ["Auld Stonespire, in Thunder Bluff."] =
        "Stonespire le Vieil, aux Pitons-du-Tonnerre.",
    ["Reward: cloth shoulders, a mail belt or a shield, and about 4,050 XP."] =
        "Récompense : des épaulières en tissu, une ceinture en mailles ou un bouclier, et environ 4\194\160050 XP.",
    ["Rau Cliffrunner, at Freewind Post, in Thousand Needles."] =
        "Rau Cliffrunner, au poste de Librevent, à Mille pointes.",
    ["The kraul bats of the cave west of the bridges drop the guano."] =
        "Les chauves-souris du kraal de la grotte à l'ouest des ponts laissent tomber le guano.",
    ["Charlga may drop a small scroll: read it."] =
        "Charlga peut laisser tomber un petit parchemin : lis-le.",
    ["Willix the Importer waits in a tent below Charlga's platform."] =
        "Willix l’Importateur attend dans une tente en contrebas de la plate-forme de Charlga.",
    ["Master Apothecary Faranell, in Undercity."] =
        "Maître apothicaire Faranell, à Fossoyeuse.",
    ["It opens An Unholy Alliance, a quest of Razorfen Downs."] =
        "Elle ouvre Une alliance impie, une quête des souilles de Tranchebauge.",
    ["Doctor Martin Felben, in the Apothecarium of Undercity."] =
        "Docteur Martin Felben, dans l'Apothicarium de Fossoyeuse.",
    ["Reward: a wand or a cloak."] =
        "Récompense : une baguette ou une cape.",
    ["Melisara and Magus Wordeen Voidglare, in Tarren Mill, in Hillsbrad Foothills."] =
        "Melisara et Magus Wordeen Voidglare, à Moulin-de-Tarren, dans les Contreforts de Hautebrande.",
    ["Tarren Mill's quests: The Grave Knight brings leather boots or mail bracers."] =
        "Les quêtes de Moulin-de-Tarren : The Grave Knight rapporte des bottes en cuir ou des brassards en mailles.",
    ["Reward: a staff or mail shoulders."] =
        "Récompense : un bâton ou des épaulières en mailles.",
    ["Atrexis the Grave Knight, inside the city."] =
        "Atrexis the Grave Knight, dans la cité.",
    ["Six cracked sentry cores, from the fragmented sentries of the city."] =
        "Six noyaux de sentinelle fêlés, sur les sentinelles fragmentées de la cité.",
    ["Magus Wordeen Voidglare and Melisara, in Tarren Mill."] =
        "Magus Wordeen Voidglare et Melisara, à Moulin-de-Tarren.",
    ["Doctor Martin Felben, in Undercity."] =
        "Docteur Martin Felben, à Fossoyeuse.",
    ["Dorn Plainstalker, in Thousand Needles."] =
        "Traqueur des plaines Dorn, à Mille pointes.",
    ["Optional: a chain of ten quests through Thousand Needles, Stonetalon, Ashenvale and Undercity, up to a book of the monastery; it ends with a mace or a wand and about 4,200 XP."] =
        "Facultatif : une chaîne de dix quêtes à travers Mille pointes, les Serres-Rocheuses, Orneval et Fossoyeuse, jusqu'à un livre du monastère ; elle se termine par une masse ou une baguette et environ 4\194\160200 XP.",
    ["Leap from the wooden planks over the canyon, in the west of Thousand Needles."] =
        "Saute depuis les planches de bois au-dessus du canyon, à l'ouest de Mille pointes.",
    ["Grenka Bloodscreech, a harpy of the west of Thousand Needles."] =
        "Grenka Hurlesang, une harpie de l'ouest de Mille pointes.",
    ["Rok'Alim the Pounder, an elemental of the north-west of Thousand Needles."] =
        "Rok'Alim le Marteleur, un élémentaire du nord-ouest de Mille pointes.",
    ["Braug Dimspirit, in the east of Stonetalon Mountains."] =
        "Braug Dimspirit, à l'est des Serres-Rocheuses.",
    ["The Legacy of the Aspects, a book in the south-east of Ashenvale."] =
        "L'Héritage des aspects, un livre au sud-est d'Orneval.",
    ["Braug Dimspirit, in Stonetalon."] =
        "Braug Dimspirit, dans les Serres-Rocheuses.",
    ["Braug Dimspirit asks a question: give him the right answer."] =
        "Braug Dimspirit pose une question : donne-lui la bonne réponse.",
    ["Sage Truthseeker, in Thunder Bluff."] =
        "Sage Truthseeker, aux Pitons-du-Tonnerre.",
    ["Reward: a shield or an off-hand orb, and about 3,550 XP."] =
        "Récompense : un bouclier ou un orbe tenu en main gauche, et environ 3\194\160550 XP.",
    ["Parqual Fintallas, in Undercity."] =
        "Parqual Fintallas, à Fossoyeuse.",
    ["Reward: a sword, an off-hand cane or a necklace, and about 5,150 XP."] =
        "Récompense : une épée, une canne tenue en main gauche ou un collier, et environ 5\194\160150 XP.",
    ["Master Apothecary Faranell, in the Apothecarium."] =
        "Maître apothicaire Faranell, dans l'Apothicarium.",
    ["Graveyard: Vorrel Sengutz lies on a table on the right of the Chamber of Atonement, by Interrogator Vishas."] =
        "Cimetière : Vorrel Sengutz est allongé sur une table à droite de la Chambre d'expiation, près de l'interrogateur Vishas.",
    ["Reward: a cloth cape or shoulders, or leather boots; the ring it asks for is in the Alterac Mountains."] =
        "Récompense : une cape ou des épaulières en tissu, ou des bottes en cuir ; l'anneau qu'elle demande se trouve dans les montagnes d'Alterac.",
    ["Every Scarlet of the monastery may drop a heart."] =
        "Chaque Écarlate du monastère peut laisser tomber un cœur.",
    ["Library: the book rests on a table, in the first side room on the left as you walk the Gallery of Treasures."] =
        "Bibliothèque : le livre est posé sur une table, dans la première salle latérale à gauche quand tu parcours la Galerie des trésors.",
    ["Library: the Compendium stands on a bookcase on the left wall at the entrance of the Athenaeum."] =
        "Bibliothèque : le Compendium se trouve sur une étagère contre le mur de gauche, à l'entrée de l'Athenaeum.",
    ["Parqual Fintallas asks a question: give him the right answer."] =
        "Parqual Fintallas pose une question : donne-lui la bonne réponse.",
    ["Varimathras, in the Royal Quarter."] =
        "Varimathras, dans le Quartier royal.",
    ["Nancy Vishas, an elite, keeps the ring in a house of the Alterac Mountains."] =
        "Nancy Vishas, une élite, garde l'anneau dans une maison des montagnes d'Alterac.",
    ["Monika Sengutz, in Tarren Mill, in Hillsbrad Foothills."] =
        "Monika Sengutz, à Moulin-de-Tarren, dans les Contreforts de Hautebrande.",
    ["Andrew Brownell, in Undercity."] =
        "Andrew Brownell, à Fossoyeuse.",
    ["Reward: a mace, a gun, a cloth robe or a leather chest."] =
        "Récompense : une masse, un fusil, une robe en tissu ou un plastron en cuir.",
    ["Ambassador Malcin walks among the quilboar outside the downs."] =
        "L'ambassadeur Malcin marche parmi les hurans devant les souilles.",
    ["Patrick Garrett, in Undercity."] =
        "Patrick Garrett, à Fossoyeuse.",
    ["Dran Droffers, in the Drag of Orgrimmar."] =
        "Dran Droffers, dans la Herse d'Orgrimmar.",
    ["Dran Droffers's chain goes back and forth between Orgrimmar, Kargath and Uldaman: it ends with a necklace and about 5,600 XP."] =
        "La chaîne de Dran Droffers fait des allers-retours entre Orgrimmar, Kargath et Uldaman : elle se termine par un collier et environ 5\194\160600 XP.",
    ["Jarkal Mossmeld, at Kargath, in the west of the Badlands."] =
        "Jarkal Mossmeld, à Kargath, à l'ouest des Terres ingrates.",
    ["The tablet lies in an ancient chest by the gates of Uldaman, in the north of the Badlands."] =
        "La tablette se trouve dans un coffre ancien près des portes d'Uldaman, au nord des Terres ingrates.",
    ["The Shadowforge dwarves around the gates drop the power stones and the shattered necklace."] =
        "Les nains Ombreforge autour des portes laissent tomber les pierres de puissance et le collier brisé.",
    ["The Garrett family chest stands in the dig west of Uldaman's gates."] =
        "Le Coffre de la famille Garrett se trouve dans les fouilles à l'ouest des portes d'Uldaman.",
    ["Jarkal Mossmeld, at Kargath."] =
        "Jarkal Mossmeld, à Kargath.",
    ["Dran Droffers, in Orgrimmar."] =
        "Dran Droffers, à Orgrimmar.",
    ["Magenta cap clusters grow on the cave walls, south-west of Uldaman's gates and inside."] =
        "Des champignons magenta poussent sur les parois de la grotte, au sud-ouest des portes d'Uldaman et à l'intérieur.",
    ["The dungeon's door is at the back of the cave by the dig at Uldaman's gates."] =
        "La porte du donjon se trouve au fond de la grotte, près des fouilles aux portes d'Uldaman.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage; then head out for Kargath."] =
        "Un paladin mort repose juste à côté de la première grande salle, au bout de son deuxième passage à droite ; repars ensuite pour Kargath.",
    ["Enter Uldaman again"] =
        "Entre de nouveau dans Uldaman",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault; Archaedas, the last boss, in the Hall of the Crafters, drops the power source."] =
        "La topaze est dans une urne ostentatoire au sud-est de la Fouille deux, le rubis dans un coffre de pierre au nord-ouest de la Fouille trois (il fait venir des monstres), le saphir sur Grimlok, au bout du Caveau de pierre ; Archaedas, le dernier boss, dans le Hall des Artisans, laisse tomber la source d'énergie.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Thunder Bluff with potions or a bag."] =
        "Facultatif : les Disques de Norgannon, derrière Archaedas, racontent leur histoire ; elle se termine aux Pitons-du-Tonnerre avec des potions ou un sac.",
    ["Bena Winterhoof, in Thunder Bluff."] =
        "Bena Winterhoof, aux Pitons-du-Tonnerre.",
    ["Venom bottles stand in the Witherbark trolls' camps of the south-west of the Hinterlands."] =
        "Des bouteilles de venin se trouvent dans les camps des trolls Witherbark du sud-ouest des Hinterlands.",
    ["Optional: a chain of six quests between the Hinterlands, Tarren Mill, Durotar and the city; it ends with a shield, a mail chest or a cloth robe."] =
        "Facultatif : une chaîne de six quêtes entre les Hinterlands, Moulin-de-Tarren, Durotar et la cité ; elle se termine par un bouclier, un plastron en mailles ou une robe en tissu.",
    ["Apothecary Lydon, in Tarren Mill, in Hillsbrad Foothills."] =
        "Apothicaire Lydon, à Moulin-de-Tarren, dans les Contreforts de Hautebrande.",
    ["The Witherbark broodguards, spiders of the Hinterlands' troll camps, carry the sacs."] =
        "Les gardes du clan Witherbark, des araignées des camps trolls des Hinterlands, portent les glandes à venin.",
    ["Apothecary Lydon, in Tarren Mill."] =
        "Apothicaire Lydon, à Moulin-de-Tarren.",
    ["Master Gadrin, in Sen'jin Village, in Durotar."] =
        "Maître Gadrin, au village de Sen'jin, à Durotar.",
    ["A tablet stands in the middle of the scarabs' chamber: read the spider god's name on it."] =
        "Une tablette se dresse au centre de la salle des scarabées : lis-y le nom du dieu-araignée.",
    ["Master Gadrin, in Sen'jin Village."] =
        "Maître Gadrin, au village de Sen'jin.",
    ["Defeat Shadra at her altar of Shadra'Alor, in the south-west of the Hinterlands, and take her venom."] =
        "Vaincs Shadra à son autel de Shadra'Alor, au sud-ouest des Hinterlands, et prends son venin.",
    ["Uthel'nay, in the Valley of Spirits of Orgrimmar."] =
        "Uthel'nay, dans la vallée des Esprits d'Orgrimmar.",
    ["Vark Battlescar and Selendra, at Shadowprey Village, on the west coast of Desolace."] =
        "Vark Battlescar et Selendra, au village de Proie-de-l'Ombre, sur la côte ouest de Désolace.",
    ["Shadowprey Village's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "Les deux quêtes du village de Proie-de-l'Ombre : un anneau, des gantelets en plaques ou une ceinture en cuir ; puis la fin de Theradras rapporte une épée, un bâton ou un arc.",
    ["Vark Battlescar and Selendra, at Shadowprey Village."] =
        "Vark Battlescar et Selendra, au village de Proie-de-l'Ombre.",
    ["Uthel'nay, in Orgrimmar."] =
        "Uthel'nay, à Orgrimmar.",
    ["Fel'zerul, in Stonard, in the Swamp of Sorrows."] =
        "Fel'zerul, à Pierrêche, dans le Marais des Chagrins.",
    ["Fel'zerul's chain goes to the Hinterlands and back: it opens The Temple of Atal'Hakkar, a talisman and about 5,900 XP."] =
        "La chaîne de Fel'zerul fait l'aller-retour jusqu'aux Hinterlands : elle ouvre Le temple d'Atal'Hakkar, un talisman et environ 5\194\160900 XP.",
    ["The Atal'ai artifacts lie in the ruins around the Pool of Tears, in the east of the swamp."] =
        "Les artefacts atal'ai se trouvent dans les ruines autour du bassin des larmes, à l'est du marais.",
    ["Fel'zerul, in Stonard."] =
        "Fel'zerul, à Pierrêche.",
    ["Jammal'an the Prophet: cloth leggings or a mail helm, and about 6,550 XP."] =
        "Jammal'an le Prophète : des jambières en tissu ou un casque en mailles, et environ 6\194\160550 XP.",
    ["Witch Doctor Uzer'i, at Camp Mojache, in Feralas."] =
        "Sorcier-docteur Uzer'i, au camp Mojache, à Féralas.",
    ["Larion, at Marshal's Refuge, in Un'Goro Crater."] =
        "Larion, au Refuge de Marshal, dans le cratère d'Un'Goro.",
    ["Larion's chain leads to the temple's haze; its end brings a bloodpetal zapper."] =
        "La chaîne de Larion mène à la brume du temple ; sa fin rapporte une Baguette Pétale-de-sang.",
    ["The bloodpetal plants of Un'Goro."] =
        "Les plantes Pétale-de-sang d'Un'Goro.",
    ["Liv Rizzlefix, in Ratchet."] =
        "Liv Rizzlefix, à Cabestan.",
    ["Every Atal'ai troll of the temple may drop a fetish."] =
        "Chaque troll atal'ai du temple peut laisser tomber un fétiche.",
    ["Apothecary Zinge, in the Apothecarium of Undercity."] =
        "Apothicaire Zinge, dans l'Apothicarium de Fossoyeuse.",
    ["Optional: a lead from Undercity to Vivian Lagrave, at Kargath."] =
        "Facultatif : une piste de Fossoyeuse vers Vivian Lagrave, à Kargath.",
    ["Shadowmage Vivian Lagrave, at Kargath, in the west of the Badlands."] =
        "Ombremage Vivian Lagrave, à Kargath, à l'ouest des Terres ingrates.",
    ["Shadowmage Vivian Lagrave, at Kargath."] =
        "Ombremage Vivian Lagrave, à Kargath.",
    ["Reward: a two-handed axe, a mace or potions."] =
        "Récompense : une hache à deux mains, une masse ou des potions.",
    ["Thunderheart, at Kargath."] =
        "Thunderheart, à Kargath.",
    ["Thunderheart's chain: Disharmony of Fire brings armor of any kind, and opens Commander Gor'shak and The Last Element."] =
        "La chaîne de Thunderheart : Discordance des flammes rapporte une armure de n'importe quel type, et ouvre Le commandant Gor'shak et Le dernier élément.",
    ["Hierophant Theodora Mulvadania, at Kargath."] =
        "Hiérophante Theodora Mulvadania, à Kargath.",
    ["The Rise of the Machines ends inside the depths with armor of any kind, and about 6,200 XP."] =
        "La révolte des machines se termine dans les profondeurs avec une armure de n'importe quel type, et environ 6\194\160200 XP.",
    ["The WANTED poster, at Kargath."] =
        "L'affiche RECHERCHE, à Kargath.",
    ["The wanted posters lead to General Angerforge, and a medallion."] =
        "Les affiches de recherche mènent au général Forgehargne, et à un médaillon.",
    ["The war reavers and obsidian elementals of the Badlands drop the shards."] =
        "Les ravageurs de guerre et les élémentaires d'obsidienne des Terres ingrates laissent tomber les fragments.",
    ["Lotwil Veriatus, in the west of the Badlands."] =
        "Lotwil Veriatus, à l'ouest des Terres ingrates.",
    ["Galamav the Marksman, at Kargath."] =
        "Galamav le Tireur d'élite, à Kargath.",
    ["Commander Gor'shak's chain leads to Thrall, the emperor and the princess: about 9,950 XP at its end, and Thrall's reward."] =
        "La chaîne du commandant Gor'shak mène à Thrall, à l'empereur et à la princesse : environ 9\194\160950 XP au bout, et la récompense de Thrall.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the depths' door is at the bottom of the mountain."] =
        "Le mont Rochenoire s'ouvre au sud de la gorge des Vents brûlants ; à l'intérieur, la porte des profondeurs se trouve au pied de la montagne.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Commander Gor'shak sits in the first cell on the left of the tunnel."] =
        "Le grand interrogateur Gerstahn, dans une arrière-salle à droite du Bloc de détention, porte la clé des cellules ; le commandant Gor'shak est assis dans la première cellule à gauche du tunnel.",
    ["Defend Gor'shak against two waves of guards."] =
        "Défends Gor'shak contre deux vagues de gardes.",
    ["Talk to Kharan Mighthammer, in the first cell on the left across the hallway."] =
        "Parle à Kharan Mighthammer, dans la première cellule à gauche, de l'autre côté du couloir.",
    ["The Anvilrage guardsmen, wardens and footmen of the Detention Block and the halls."] =
        "Les gardes, gardiens et fantassins Ragenclume du Bloc de détention et des salles.",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City: he carries the Tablet of Kurniya."] =
        "Le seigneur Incendius attend à l'Enclume noire, dans la cité d'Ombreforge : il porte la Tablette de Kurniya.",
    ["Golem Lord Argelmach waits in the Manufactory; his golems and constructs drop the cores and the essences."] =
        "Le seigneur golem Argelmach attend dans la Manufacture ; ses golems et ses assemblages laissent tomber les noyaux et les essences.",
    ["Warlord Goretooth, at Kargath."] =
        "Chef de guerre Goretooth, à Kargath.",
    ["The KILL ON SIGHT poster, at Kargath."] =
        "L'affiche TUER A VUE, à Kargath.",
    ["Thrall, in Grommash Hold, in Orgrimmar."] =
        "Thrall, au fort Grommash, à Orgrimmar.",
    ["The Anvilrage medics, soldiers and officers of the halls."] =
        "Les médecins, soldats et officiers Ragenclume des salles.",
    ["Warlord Goretooth, then Lexlort, at Kargath."] =
        "Chef de guerre Goretooth, puis Lexlort, à Kargath.",
    ["Grark Lorkrub, held in the Blackrock Stronghold of the Burning Steppes."] =
        "Grark Lorkrub, retenu dans le bastion de Rochenoire, dans les Steppes ardentes.",
    ["Optional: an escort in the Burning Steppes, then a third visit for General Angerforge: a medallion and about 7,750 XP."] =
        "Facultatif : une escorte dans les Steppes ardentes, puis une troisième visite pour le général Forgehargne : un médaillon et environ 7\194\160750 XP.",
    ["Bind Grark Lorkrub with the shackles and lead him through Blackrock Mountain to the Searing Gorge."] =
        "Attache Grark Lorkrub avec les chaînes et conduis-le à travers le mont Rochenoire jusqu'à la gorge des Vents brûlants.",
    ["Lexlort, then Warlord Goretooth, at Kargath."] =
        "Lexlort, puis le chef de guerre Goretooth, à Kargath.",
    ["Enter Blackrock Depths a third time"] =
        "Entre une troisième fois dans les profondeurs de Rochenoire",
    ["General Angerforge waits down the stairs of the West Garrison."] =
        "Le général Forgehargne attend en bas des escaliers de la Garnison ouest.",
    ["Galamav the Marksman, at Kargath, in the west of the Badlands."] =
        "Galamav le Tireur d'élite, à Kargath, à l'ouest des Terres ingrates.",
    ["Lexlort, at Kargath."] =
        "Lexlort, à Kargath.",
    ["Lexlort's chain: Bijou's report brings cloth gloves or a mail belt."] =
        "La chaîne de Lexlort : le rapport de Bijou te vaut des gants en tissu ou une ceinture en mailles.",
    ["Reward: armor of any kind, for the spire's three generals and their documents."] =
        "Récompense : une armure de n'importe quel type, pour les trois généraux du pic et leurs documents.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the spire's door is at the top of the mountain."] =
        "Le mont Rochenoire s'ouvre au sud de la gorge des Vents brûlants ; à l'intérieur, la porte du pic se trouve en haut de la montagne.",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle. The documents lie in one of their rooms, or by Urok's tribute pile."] =
        "Le généralissime Omokk, au nord de Mok'Doom ; le maître de guerre Voone, au fond de Tazz'Alaor ; le seigneur Wyrmthalak, le dernier boss, dans la Salle de bataille. Les documents se trouvent dans l'une de leurs salles, ou près du tas d'offrandes d'Urok.",
    ["Galamav the Marksman, Lexlort and Warlord Goretooth, at Kargath."] =
        "Galamav le Tireur d'élite, Lexlort et le chef de guerre Goretooth, à Kargath.",
    ["A herald of your capital: Harbinger Balthazad, Warcaller Gorlach or Bluff Runner Windstrider."] =
        "Un héraut de ta capitale : le messager Balthazad, Gorlach le Hurleguerre ou le messager de Thunder Bluff Windstrider.",
    ["Optional: a lead to Camp Mojache, about 1,500 XP."] =
        "Facultatif : une piste vers le camp Mojache, environ 1\194\160500 XP.",
    ["Talo Thornhoof, at Camp Mojache, in Feralas."] =
        "Talo Thornhoof, au camp Mojache, à Féralas.",
    ["Talo Thornhoof and Sage Korolusk, at Camp Mojache."] =
        "Talo Thornhoof et le sage Korolusk, au camp Mojache.",
    ["Talo Thornhoof, at Camp Mojache."] =
        "Talo Thornhoof, au camp Mojache.",
    ["Sage Korolusk, at Camp Mojache."] =
        "Sage Korolusk, au camp Mojache.",
    ["Harbinger Balthazad, in the Valley of Honor of Orgrimmar."] =
        "Messager Balthazad, dans la vallée de l'Honneur d'Orgrimmar.",
    ["High Executor Derrington, at the Bulwark, in the Western Plaguelands."] =
        "Grand exécuteur Derrington, au Rempart, dans les Maleterres de l'Ouest.",
    ["Burn the Scarlet command tent between Felstone Field and Dalson's Tears, and plant the Scourge banner there."] =
        "Brûle la tente de commandement écarlate entre le Champ de Felstone et les Larmes de Dalson, et plantes-y la Bannière du Fléau.",
    ["Apothecary Dithers, at the Bulwark."] =
        "Apothicaire Dithers, au Rempart.",
    ["Apothecary Dithers, at the Bulwark, in the Western Plaguelands."] =
        "Apothicaire Dithers, au Rempart, dans les Maleterres de l'Ouest.",
    ["Alexi Barov, at the Bulwark."] =
        "Alexi Barov, au Rempart.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Weldon Barov in the Alliance's Chillwind Camp."] =
        "La fortune des Barov : quatre titres de propriété dans l'école ; sa suite t'envoie tuer Weldon Barov au camp du Noroît, le camp de l'Alliance.",
    ["Weldon Barov stands among the guards of Chillwind Camp, the Alliance's camp in the west of the Western Plaguelands."] =
        "Weldon Barov se tient parmi les gardes du camp du Noroît, le camp de l'Alliance à l'ouest des Maleterres de l'Ouest.",
    ["Nathanos Blightcaller, at Marris Stead, in the south-west of the Eastern Plaguelands."] =
        "Nathanos le Flétrisseur, à la ferme des Marris, au sud-ouest des Maleterres de l'Est.",
    ["Optional: Nathanos Blightcaller's chain in the Eastern Plaguelands, up to Ramstein the Gorger inside the city: about 6,600 XP at its end."] =
        "Facultatif : la chaîne de Nathanos le Flétrisseur dans les Maleterres de l'Est, jusqu'à Ramstein Grandgosier dans la cité : environ 6\194\160600 XP au bout.",
    ["Corin's Crossing, to the east: collect the living rot in ten minutes, then grind it with the mortar."] =
        "La Croisée de Corin, à l'est : récolte la pourriture vivante en dix minutes, puis broie-la avec le mortier.",
    ["The plaguebats of the Eastern Plaguelands."] =
        "Les chauves-souris pestiférées des Maleterres de l'Est.",
    ["The Quel'Thalas Registry lies in the Quel'Lithien lodge, on the northern border."] =
        "Le Registre de Quel'Thalas se trouve dans le pavillon de Quel'Lithien, sur la frontière nord.",
    ["Duskwing, a bat, roams the country; Borelgore walks the northern wastes."] =
        "Crépuscaile, une chauve-souris, parcourt la région ; Creusechair arpente les terres désolées du nord.",
    ["Ramstein the Gorger comes into Slaughter Square once it is cleared."] =
        "Ramstein Grandgosier entre sur la place de l'Abattoir une fois qu'elle est nettoyée.",
    ["Nathanos Blightcaller, at Marris Stead."] =
        "Nathanos le Flétrisseur, à la ferme des Marris.",
}
