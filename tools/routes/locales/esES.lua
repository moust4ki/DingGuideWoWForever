-- Spanish guide texts: [English text] = Spanish text, one entry per phrase of the guides
-- (zone names of the titles, route intros, automatic notes, hand-written notes), shared by the esES and esMX
-- clients. tools/translate_guides.lua writes Ding/Locales/Guides/esES/ from it; a note
-- joining several phrases is translated phrase by phrase. Keys: the English texts of the
-- routes (tools/routes/*.lua), the automatic notes of tools/draft_guide.lua and
-- Ding/Guides/NightElf/01_Shadowglen.lua, in the order of frFR.lua. Place names are those
-- of the Spanish (esES) client; the player is addressed with "tú".
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "Cañada Umbría",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "Los dos PNJ de misión están justo delante, al pie de Aldrassil.",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "Sables de la noche jóvenes y jabalíes alrededor de Aldrassil: mata todo lo que encuentres.",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "Tarindrella está un poco al suroeste de Aldrassil (57.8, 45.2).",
    ["The class trainers are inside Aldrassil."] =
        "Los instructores de clase están dentro de Aldrassil.",
    ["Gilshalan needs level 3: if you are not there yet, Ding will remind you before the cave."] =
        "Gilshalan pide nivel 3: si aún no lo tienes, Ding te avisará antes de la cueva.",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "Una sola vuelta: sables sarnosos y jabalíes al norte, musgo en los grells, tótems al oeste (54, 40).",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "Iverron espera ante la cueva, al norte (54.6, 33).",
    ["Spiders in the cave, right behind Iverron."] =
        "Arañas en la cueva, justo detrás de Iverron.",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "Githyiss la Vil, al fondo de la cueva (56.6, 26.3), puede soltar un colmillo: úsalo desde tus bolsas.",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "Vuelve a Aldrassil: todo se entrega en el mismo sitio.",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "Setas en los grells, lirios al norte de Aldrassil (57, 37), icor en las arañas, huevo al fondo de la cueva.",
    ["Iverron, still in front of the cave."] =
        "Iverron, aún delante de la cueva.",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "Tenaron está en lo más alto de Aldrassil: sigue la rampa que sube rodeando el tronco.",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "Llena el vial en el pozo de la luna, al noreste (60, 33).",
    ["Porthannius, on the road out of Shadowglen."] =
        "Porthannius, en el camino que sale de Cañada Umbría.",
    ["Head for Dolanaar"] =
        "Rumbo a Dolanaar",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "Sigue el camino al sur hasta la posada: las dos misiones abiertas se entregan en Dolanaar.",
    -- human
    ["Northshire"] =
        "Villanorte",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "Todo pasa en torno a la Abadía de Villanorte: sigue la flecha de PNJ en PNJ.",
    ["Elwynn Forest"] =
        "Bosque de Elwynn",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "Villadorada es tu base en todo el bosque: posada, instructores de clase y misiones.",
    ["Westfall"] =
        "Páramos de Poniente",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "Ve al oeste por el camino de Villadorada y luego a la Colina del Centinela, en el centro de los Páramos.",
    ["Loch Modan"] =
        "Loch Modan",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "Toma el Tranvía Subterráneo de Ventormenta a Forjaz y luego el camino al este por Dun Morogh hasta Thelsamar.",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "Valle de Crestanevada",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "Todo empieza en Crestanevada: sigue la flecha de PNJ en PNJ.",
    ["Dun Morogh"] =
        "Dun Morogh",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "Sal del valle por el túnel del noreste: Kharanos es tu base en Dun Morogh.",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "Toma el camino al este por el túnel de South Gate hasta Thelsamar.",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "Tranvía Subterráneo de Forjaz a Ventormenta y luego el camino al oeste por Villadorada hasta la Colina del Centinela.",
    -- nightelf
    ["Teldrassil"] =
        "Teldrassil",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "Dolanaar es tu base en Teldrassil: posada, instructores de clase y casi todas las misiones.",
    ["Darkshore"] =
        "Costa Oscura",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "Rut'theran (portal al pie de Darnassus) y luego el barco a Auberdine: tu base en Costa Oscura.",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "Barco de Auberdine al Puerto de Menethil, luego el camino al este por los Humedales hasta Loch Modan: Thelsamar es tu base.",
    -- alliance
    ["Redridge Mountains"] =
        "Montañas Crestagrana",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "Crestagrana está al este del Bosque de Elwynn: sigue el camino al este hasta Villa del Lago. Elfos de la noche: barco de Auberdine a Menethil, Forjaz y luego el tranvía a Ventormenta.",
    ["Duskwood"] =
        "Bosque del Ocaso",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "El Bosque del Ocaso está al sur de Elwynn: Villa Oscura, al este del bosque, es tu base.",
    ["Wetlands"] =
        "Los Humedales",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "Los Humedales están al norte de Loch Modan: el Puerto de Menethil, en la costa oeste, es tu base.",
    ["Ashenvale"] =
        "Vallefresno",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "Barco de Menethil a Auberdine y luego el camino al sur hasta Vallefresno: Astranaar es tu base.",
    ["Stonetalon Mountains"] =
        "Sierra Espolón",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "La Sierra Espolón está al oeste de Vallefresno.",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "Vuelve a Astranaar para las últimas misiones de Vallefresno.",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "Vuelve al Bosque del Ocaso para acabar sus misiones: Villa Oscura sigue siendo tu base.",
    ["Hillsbrad Foothills"] =
        "Laderas de Trabalomas",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "Desde Menethil, el camino al norte cruza el Puente Thandol hasta las Laderas: Costasur es tu base.",
    ["Thousand Needles"] =
        "Las Mil Agujas",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "Llega a Las Mil Agujas por Theramore y el sur de Los Baldíos, o por Feralas; el campamento goblin del este es tu base.",
    ["Desolace"] =
        "Desolace",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "Desolace está al sur de la Sierra Espolón: la base de la Alianza está al noreste de la zona.",
    ["Stranglethorn Vale"] =
        "Vega de Tuercespina",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "La Vega de Tuercespina está al sur del Bosque del Ocaso: Campamento Rebelde al norte, Bahía del Botín al sur.",
    ["Arathi Highlands"] =
        "Tierras Altas de Arathi",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "Las Tierras Altas de Arathi están al norte de Los Humedales, cruzando el Puente Thandol.",
    ["Dustwallow Marsh"] =
        "Marjal Revolcafango",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "Barco de Menethil a Theramore, la base de la Alianza al borde del marjal.",
    ["Badlands"] =
        "Tierras Inhóspitas",
    ["The Badlands are southeast of Loch Modan."] =
        "Las Tierras Inhóspitas están al sureste de Loch Modan.",
    ["Swamp of Sorrows"] =
        "Pantano de las Penas",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "El Pantano de las Penas está al este del Paso de la Muerte, al sur de Crestagrana.",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "Vuelve a Tuercespina para acabar sus misiones, desde Bahía del Botín.",
    ["Tanaris"] =
        "Tanaris",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "Gadgetzan, al norte de Tanaris, es tu base. Barco de Bahía del Botín a Trinquete, o vuelo desde Theramore.",
    ["Feralas"] =
        "Feralas",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "El bastión de la Alianza en Feralas está en una isla al oeste de la zona.",
    ["The Hinterlands"] =
        "Tierras del Interior",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "Las Tierras del Interior están al noreste de las Laderas de Trabalomas: el nido de los Martillo Salvaje está al oeste.",
    ["Searing Gorge"] =
        "La Garganta de Fuego",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "La Garganta de Fuego está al sur de Loch Modan, tras las Tierras Inhóspitas.",
    ["Blasted Lands"] =
        "Las Tierras Devastadas",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "Vuela a Las Tierras Devastadas, al sur del Pantano de las Penas: la fortaleza de la Alianza, al norte de la zona, es tu base.",
    ["Un'Goro Crater"] =
        "Cráter de Un'Goro",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "El Cráter de Un'Goro se abre al suroeste de Tanaris: baja por la rampa desde Gadgetzan.",
    ["Azshara"] =
        "Azshara",
    ["Azshara is east of Ashenvale."] =
        "Azshara está al este de Vallefresno.",
    ["Felwood"] =
        "Frondavil",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "Frondavil está al norte de Vallefresno: la base de la Alianza está al sur de la zona.",
    ["Burning Steppes"] =
        "Las Estepas Ardientes",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "Las Estepas Ardientes están al norte de Crestagrana: el campamento de la Alianza está al este.",
    ["Winterspring"] =
        "Cuna del Invierno",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "Cuna del Invierno está al noreste de Frondavil: Vista Eterna es tu base.",
    ["Western Plaguelands"] =
        "Tierras de la Peste del Oeste",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "Las Tierras de la Peste del Oeste están al norte de las Laderas de Trabalomas: el campamento de la Alianza está al sur.",
    ["Eastern Plaguelands"] =
        "Tierras de la Peste del Este",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "Las Tierras de la Peste del Este siguen a las del Oeste: la Capilla de la Esperanza de la Luz está al este.",
    ["Silithus"] =
        "Silithus",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "Silithus está al sur del Cráter de Un'Goro: el Fuerte Cenarion está al norte de la zona.",
    -- orc_troll
    ["Valley of Trials"] =
        "Valle de los Retos",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "Todo pasa en el Valle de los Retos: sigue la flecha de PNJ en PNJ.",
    ["Durotar"] =
        "Durotar",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "Sal del valle por el camino del este y sube al norte hasta Cerrotajo: tu base en Durotar.",
    ["The Barrens"] =
        "Los Baldíos",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "Cruza el puente al oeste de Cerrotajo para entrar en Los Baldíos y sigue el camino hasta El Cruce: tu base.",
    -- tauren
    ["Camp Narache"] =
        "Campamento Narache",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "Todo empieza en el Campamento Narache: sigue la flecha de PNJ en PNJ.",
    ["Mulgore"] =
        "Mulgore",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "Sigue el camino al norte desde el Campamento Narache hasta el Poblado Pezuña de Sangre: tu base en Mulgore.",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "Sal de Mulgore por el camino del este hacia Los Baldíos y sube al norte hasta El Cruce: tu base.",
    -- undead
    ["Deathknell"] =
        "Camposanto",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "Todo empieza en Camposanto: sigue la flecha de PNJ en PNJ.",
    ["Tirisfal Glades"] =
        "Claros de Tirisfal",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "Sal de Camposanto por el camino del este hasta Rémol: tu base en los Claros de Tirisfal.",
    ["Silverpine Forest"] =
        "Bosque de Argénteos",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "Desde Rémol, toma el camino al oeste y luego al sur por el puente hasta el Bosque de Argénteos: El Sepulcro es tu base.",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "Zepelín de las torres junto a Entrañas a Orgrimmar y luego el camino al oeste y al sur hasta El Cruce: tu base en Los Baldíos.",
    -- horde
    ["The Barrens and Stonetalon"] =
        "Los Baldíos y Sierra Espolón",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "El Cruce, en el centro de Los Baldíos, es tu base; la Sierra Espolón está al oeste de Los Baldíos.",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "Vallefresno está al norte de Los Baldíos: el Puesto del Hachazo, al este del bosque, es tu base.",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "Zepelín de la torre junto a Orgrimmar a Entrañas y luego el camino al sur por el Bosque de Argénteos hasta Molino Tarren: tu base.",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "Zepelín de vuelta a Orgrimmar para las misiones de más nivel de Los Baldíos y la Sierra Espolón.",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "Las Mil Agujas están al sur de Los Baldíos, bajando por el Gran Elevador: el Poblado Viento Libre es tu base.",
    ["Hillsbrad, Alterac and Arathi"] =
        "Trabalomas, Alterac y Arathi",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "Zepelín a Entrañas y de nuevo Molino Tarren; las Montañas de Alterac están al norte de las Laderas, las Tierras Altas de Arathi al este, con Sentencia al este de estas.",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "Desolace está al sur de la Sierra Espolón: el poblado de la Horda está en la costa oeste.",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "Zepelín de Orgrimmar a Grom'gol, el campamento de la Horda al norte de Tuercespina.",
    ["Dustwallow and Thousand Needles"] =
        "Revolcafango y Las Mil Agujas",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "Zepelín de vuelta a Orgrimmar. El Marjal Revolcafango está al este del sur de Los Baldíos, con el Poblado Murohelecho al norte del marjal; Shimmering Flats está al este de Las Mil Agujas.",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "Vuelve a las Tierras Altas de Arathi: Sentencia está al este de la zona.",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "Vuela de Sentencia a Kargath, al oeste de las Tierras Inhóspitas.",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "Vuelve a Tuercespina para acabar sus misiones, desde Grom'gol y Bahía del Botín.",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "El Pantano de las Penas está al este del Paso de la Muerte: Rocal es tu base.",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "Feralas está al oeste de Las Mil Agujas: el Campamento Mojache, al este de la zona, es tu base.",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "Gadgetzan, al norte de Tanaris, es tu base: el camino al sur por Las Mil Agujas, o el barco de Bahía del Botín a Trinquete.",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "Las Tierras del Interior están al este de las Laderas de Trabalomas: el poblado trol Sañadiente está en la costa este.",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "La Garganta de Fuego está al sur de las Tierras Inhóspitas: vuela a Kargath y toma el camino al sur. Las Estepas Ardientes están al sur de la garganta.",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "Azshara está al este de Vallefresno: Valormok, al suroeste de la zona, es tu base.",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "Frondavil está al norte de Vallefresno: el puesto de la Horda está al oeste de la zona.",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "Las Tierras de la Peste del Oeste están al este de los Claros de Tirisfal: El Baluarte guarda la frontera, al este de Rémol.",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "Si tienes el objeto que inicia la misión: úsalo desde tus bolsas.",
    ["Human"] =
        "Humano",
    ["Dwarf and Gnome"] =
        "Enano y gnomo",
    ["Night Elf"] =
        "Elfo de la noche",
    ["Orc and Troll"] =
        "Orco y trol",
    ["Tauren"] =
        "Tauren",
    ["Undead"] =
        "No-muerto",
    ["Alliance"] =
        "Alianza",
    ["Horde"] =
        "Horda",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "A partir de aquí, la guía pasa sola de una zona a otra: el primer paso en una zona dice cómo llegar.",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "Atajo: deja que los monstruos te maten, libera tu espíritu y vuelve a la vida con el Ángel de la Resurrección; luego sigue.",
    ["Finish the level on nearby monsters before moving on."] =
        "Termina el nivel con monstruos cercanos antes de seguir.",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "Inicio humano",
    ["Night Elf start"] =
        "Inicio elfo de la noche",
    ["Tauren start"] =
        "Inicio tauren",
    ["Undead start"] =
        "Inicio no-muerto",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Inicio skyborne",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "Todo empieza en la isla de Zephras: sigue la flecha de PNJ en PNJ.",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "Bosque de Elwynn: Abadía de Villanorte, donde empiezan todos los humanos.",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "Dun Morogh: Valle de Crestanevada, donde empiezan enanos y gnomos.",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "Teldrassil: Cañada Umbría, donde empiezan los elfos de la noche.",
    ["Travel to Westfall"] =
        "Viaja a los Páramos de Poniente",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "Páramos de Poniente: la Colina del Centinela es tu base, en el centro de la zona. La primera parada es la granja del norte.",
    ["Travel to Auberdine"] =
        "Viaja a Auberdine",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "Costa Oscura: Auberdine, el puerto de la costa oeste.",
    ["Travel to Thelsamar"] =
        "Viaja a Thelsamar",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "Loch Modan: Thelsamar, en el camino, al oeste de la zona.",
    ["Travel to Redridge Mountains"] =
        "Viaja a las Montañas Crestagrana",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "Montañas Crestagrana: Villa del Lago es tu base, junto al lago. La primera parada es el paso del oeste que viene del Bosque de Elwynn.",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "Vallefresno: la Atalaya de Maestra al oeste y luego Astranaar, en el centro de la zona.",
    ["Travel to Menethil Harbor"] =
        "Viaja al Puerto de Menethil",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "Los Humedales: Puerto de Menethil, en la costa oeste.",
    ["Travel to Darkshire"] =
        "Viaja a Villa Oscura",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "Bosque del Ocaso: Villa Oscura, al este de la zona.",
    ["Travel to Stonetalon Peak"] =
        "Viaja a la Cima del Espolón",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "Sierra Espolón: Cima del Espolón, en el extremo norte de la zona.",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "Primero Ventormenta y luego el Bosque del Ocaso y la Vega de Tuercespina.",
    ["Travel to Southshore"] =
        "Viaja a Costasur",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "Laderas de Trabalomas: Costasur, en la costa sur.",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "Marjal Revolcafango: Isla Theramore, frente a la costa este.",
    ["Travel to Booty Bay"] =
        "Viaja a Bahía del Botín",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "Vega de Tuercespina: Bahía del Botín, en el extremo sur. Allí llega el barco de Trinquete.",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "Desolace: Punta de Nijel, en la esquina noreste, es la base de la Alianza.",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "Vega de Tuercespina: Bahía del Botín, en el extremo sur.",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "Primero Ventormenta y luego el Pantano de las Penas.",
    ["Travel to Refuge Pointe"] =
        "Viaja al Refugio de la Zaga",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "Tierras Altas de Arathi: Refugio de la Zaga, en el centro de la zona.",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "Primero Ventormenta y luego el Marjal Revolcafango: Isla Theramore.",
    ["Travel to Nijel's Point"] =
        "Viaja a Punta de Nijel",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "Desolace: Punta de Nijel, en la esquina noreste.",
    ["Ironforge first, then the Badlands."] =
        "Primero Forjaz y luego las Tierras Inhóspitas.",
    ["Travel to Stormwind"] =
        "Viaja a Ventormenta",
    ["Stormwind first, then Stranglethorn Vale."] =
        "Primero Ventormenta y luego la Vega de Tuercespina.",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "Bosque del Ocaso: primero Villa Oscura y luego el Pantano de las Penas.",
    ["Travel to Gadgetzan"] =
        "Viaja a Gadgetzan",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "Tanaris: Gadgetzan, al norte de la zona.",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "Tanaris: primero Gadgetzan y luego Feralas: Bastión Plumaluna.",
    ["Travel to Aerie Peak"] =
        "Viaja a Pico Nidal",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "Tierras del Interior: Pico Nidal, al oeste de la zona.",
    ["Travel to Un'Goro Crater"] =
        "Viaja al Cráter de Un'Goro",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "Cráter de Un'Goro: el Refugio de Marshal es tu base, al norte. La primera parada está al sureste.",
    ["Travel to Thorium Point"] =
        "Viaja al Puesto del Torio",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "La Garganta de Fuego: Puesto del Torio, al noroeste de la zona.",
    ["Travel to Nethergarde Keep"] =
        "Viaja al Castillo de Nethergarde",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "Las Tierras Devastadas: Castillo de Nethergarde, al noreste, y luego las Estepas Ardientes.",
    ["Travel to Chillwind Camp"] =
        "Viaja al Campamento del Orvallo",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "Tierras de la Peste del Oeste: Campamento del Orvallo, al sur de la zona.",
    ["Travel to Rut'theran Village"] =
        "Viaja a la Aldea Rut'theran",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "Teldrassil: primero la Aldea Rut'theran y luego Azshara y Frondavil.",
    ["Travel to Feathermoon Stronghold"] =
        "Viaja al Bastión Plumaluna",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "Feralas: Bastión Plumaluna, en la isla frente a la costa oeste.",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "Tanaris: primero Gadgetzan y luego el Cráter de Un'Goro.",
    ["Travel to Emerald Sanctuary"] =
        "Viaja al Santuario Esmeralda",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "Frondavil: Santuario Esmeralda, al sur de la zona.",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "Primero Forjaz y luego las Estepas Ardientes: la Vigilia de Morgan, al este.",
    ["Travel to Ironforge"] =
        "Viaja a Forjaz",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "Primero Forjaz y luego las Tierras de la Peste: el Campamento del Orvallo y la Capilla de la Esperanza de la Luz.",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "Cuna del Invierno: Vista Eterna, en el centro de la zona.",
    ["Travel to Silithus"] =
        "Viaja a Silithus",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "Silithus: Sosiego del Valor, al noreste, y luego el Fuerte Cenarion.",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "Claros de Tirisfal: Camposanto, donde se alzan los no-muertos.",
    ["Mulgore: Camp Narache, where tauren start."] =
        "Mulgore: Campamento Narache, donde empiezan los tauren.",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "Durotar: el Valle de los Retos, donde empiezan orcos y trols.",
    ["Travel to Silverpine Forest"] =
        "Viaja al Bosque de Argénteos",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "Bosque de Argénteos: El Sepulcro es tu base, en el centro. La primera parada está en el camino del norte.",
    ["Travel to Razor Hill"] =
        "Viaja a Cerrotajo",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "Durotar: primero Cerrotajo y luego Los Baldíos: El Cruce, y la Sierra Espolón.",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "Vallefresno: Puesto del Hachazo, al este de la zona. Se entra por el túnel que viene de la Sierra Espolón.",
    ["Travel to the Undercity"] =
        "Viaja a Entrañas",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "Primero Entrañas y luego las Laderas de Trabalomas: Molino Tarren.",
    ["Thunder Bluff first, then the Barrens."] =
        "Primero Cima del Trueno y luego Los Baldíos.",
    ["Travel to Sun Rock Retreat"] =
        "Viaja al Refugio Roca del Sol",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "Sierra Espolón: Refugio Roca del Sol, en el centro de la zona.",
    ["Travel to the Crossroads"] =
        "Viaja a El Cruce",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "Los Baldíos: primero El Cruce y luego Vallefresno: Puesto del Hachazo.",
    ["Travel to Camp Taurajo"] =
        "Viaja al Campamento Taurajo",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "Los Baldíos: primero el Campamento Taurajo y luego Las Mil Agujas: Poblado Viento Libre.",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "Tierras Altas de Arathi: Sentencia, al este de la zona.",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "Las Mil Agujas: Poblado Viento Libre, sobre las mesetas del centro de la zona.",
    ["Travel to Desolace"] =
        "Viaja a Desolace",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "Desolace: el Campamento del Espíritu Errante es tu base, en el centro de la zona.",
    ["Travel to Grom'gol Base Camp"] =
        "Viaja al Campamento Grom'gol",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "Vega de Tuercespina: Campamento Grom'gol, en la costa oeste. Allí llega el zepelín de Orgrimmar.",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "Primero Orgrimmar y luego el Marjal Revolcafango: Poblado Murohelecho.",
    ["Travel to Tarren Mill"] =
        "Viaja a Molino Tarren",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "Laderas de Trabalomas: primero Molino Tarren y luego las Montañas de Alterac y las Tierras Altas de Arathi.",
    ["Travel to the Badlands"] =
        "Viaja a las Tierras Inhóspitas",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "Tierras Inhóspitas: Kargath, en el extremo oeste, es la base de la Horda.",
    ["Travel to Ratchet"] =
        "Viaja a Trinquete",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "Los Baldíos: primero Trinquete y luego la Vega de Tuercespina y el Pantano de las Penas: Rocal.",
    ["Travel to Shadowprey Village"] =
        "Viaja a la Aldea Cazasombras",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "Desolace: Aldea Cazasombras, en la costa oeste.",
    ["Travel to Brackenwall Village"] =
        "Viaja al Poblado Murohelecho",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "Marjal Revolcafango: Poblado Murohelecho, al noroeste de la zona.",
    ["Travel to Camp Mojache"] =
        "Viaja al Campamento Mojache",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "Feralas: Campamento Mojache, al este de la zona.",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "Vega de Tuercespina: Campamento Grom'gol, en la costa oeste.",
    ["Travel to the Swamp of Sorrows"] =
        "Viaja al Pantano de las Penas",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "Pantano de las Penas: Rocal es tu base, en el centro de la zona.",
    ["Travel to the Shimmering Flats"] =
        "Viaja a El Desierto de Sal",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "Las Mil Agujas: primero El Desierto de Sal y luego Tanaris y el Marjal Revolcafango.",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "Primero Entrañas y luego las Tierras del Interior: Poblado Sañadiente.",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "Feralas: primero el Campamento Mojache y luego el Cráter de Un'Goro.",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "Vega de Tuercespina: primero Bahía del Botín y luego el Pantano de las Penas.",
    ["Travel to the Blasted Lands"] =
        "Viaja a las Tierras Devastadas",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "Las Tierras Devastadas: la primera parada está en la entrada norte, junto al Pantano de las Penas.",
    ["Travel to Kargath"] =
        "Viaja a Kargath",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "Tierras Inhóspitas: primero Kargath, en el extremo oeste, y luego La Garganta de Fuego.",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "Las Estepas Ardientes: Cresta de la Llama, al este. Se entra por la Montaña Roca Negra.",
    ["Travel to Valormok"] =
        "Viaja a Valormok",
    ["Azshara: Valormok, in the west of the zone."] =
        "Azshara: Valormok, al oeste de la zona.",
    ["Travel to Bloodvenom Post"] =
        "Viaja al Puesto del Veneno",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "Frondavil: Puesto del Veneno, al oeste de la zona.",
    ["Undercity first, then the Plaguelands."] =
        "Primero Entrañas y luego las Tierras de la Peste.",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "Así liberas espacio en tus bolsas.",
    ["You receive one further along the route."] =
        "Recibirás uno más adelante en la ruta.",
    ["Pick up anything that sells for 10 copper or more."] =
        "Recoge todo lo que se venda por 10 de cobre o más.",
    ["You'll level faster with this."] =
        "Con esto subirás de nivel más rápido.",
    ["The NPC is outdoors, right beside the structure."] =
        "El PNJ está fuera, justo al lado del edificio.",
    ["Skip the foes and dash into the tent."] =
        "Esquiva a los enemigos y entra corriendo en la tienda.",
    ["Foes cannot strike you from there."] =
        "Desde ahí los enemigos no pueden alcanzarte.",
    ["Widen the camera view."] =
        "Aleja la cámara para ver más.",
    ["Recall to your bind point in Northshire Valley"] =
        "Vuelve a tu punto de hogar en el Valle de Villanorte",
    ["The NPC is indoors."] =
        "El PNJ está dentro.",
    ["The NPC is indoors at street level."] =
        "El PNJ está dentro, a pie de calle.",
    ["The quest giver stands outdoors, not indoors."] =
        "El PNJ de la misión está fuera, no dentro.",
    ["With the coming hand-ins, this brings you to level 4."] =
        "Con las próximas entregas, esto te lleva a nivel 4.",
    ["The NPC is indoors, on the central storey."] =
        "El PNJ está dentro, en el piso central.",
    ["The objective is underground, in the mine shaft."] =
        "El objetivo está bajo tierra, en el pozo de la mina.",
    ["The targets roam the mine and the area around it."] =
        "Los objetivos deambulan por la mina y sus alrededores.",
    ["Exit the mine shaft"] =
        "Sal del pozo de la mina",
    ["The quest giver stands outdoors at the back of the building."] =
        "El PNJ de la misión está fuera, en la parte trasera del edificio.",
    ["The NPC is out back, at the rear of the structure."] =
        "El PNJ está detrás, en la parte trasera del edificio.",
    ["The NPC stands by the horse stalls."] =
        "El PNJ está junto a las cuadras de los caballos.",
    ["Look for wooden pails."] =
        "Busca cubos de madera.",
    ["Leave it out if other players crowd the area."] =
        "Sáltalo si hay muchos jugadores en la zona.",
    ["With the coming hand-ins, this gets you to level 6."] =
        "Con las próximas entregas, esto te lleva a nivel 6.",
    ["Climb to the highest floor of the building."] =
        "Sube al piso más alto del edificio.",
    ["The NPC waits on the lower level, indoors."] =
        "El PNJ espera en el nivel inferior, dentro.",
    ["The NPC is indoors, one floor up."] =
        "El PNJ está dentro, un piso más arriba.",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "Cura al Guardia Roberts con Sanación inferior (Rango 2).",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "Lanza Palabra de poder: entereza sobre el Guardia Roberts.",
    ["Do it only if you can."] =
        "Hazlo solo si puedes.",
    ["Go into the mine"] =
        "Entra en la mina",
    ["Stay on the trail through the mine"] =
        "Sigue el sendero por la mina",
    ["This one roams, so scan the surrounding area."] =
        "Este deambula, así que revisa los alrededores.",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "Junto con las próximas entregas, esto te lleva a nivel 8.",
    ["Die on purpose at this spot"] =
        "Muere a propósito en este punto",
    ["Die to the monsters here on purpose."] =
        "Deja que los monstruos de aquí te maten a propósito.",
    ["Dying costs you nothing this early."] =
        "A estos niveles morir no te cuesta nada.",
    ["This is the quickest way over."] =
        "Es el camino más rápido para llegar.",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "Deja que te maten y resucita con el Ángel de la Resurrección",
    ["Look for little stacks of brown wood."] =
        "Busca pequeñas pilas de madera marrón.",
    ["Look around tree trunks at ground level."] =
        "Busca alrededor de los troncos, a ras de suelo.",
    ["The targets are wolves."] =
        "Los objetivos son lobos.",
    ["The following step may be hard."] =
        "El siguiente paso puede ser difícil.",
    ["One extra level makes it easier."] =
        "Un nivel más lo hace más fácil.",
    ["With the coming turn-ins, this gets you to level 10."] =
        "Con las próximas entregas, esto te lleva a nivel 10.",
    ["The NPC waits outside, at the building's front."] =
        "El PNJ espera fuera, delante del edificio.",
    ["Fly to Lakeshire"] =
        "Vuela a Villa del Lago",
    ["Stay on the road and watch for danger."] =
        "Sigue el camino y vigila los peligros.",
    ["Foes in this area outlevel you."] =
        "Los enemigos de esta zona son de nivel superior al tuyo.",
    ["Let the conversation play out."] =
        "Deja que termine la conversación.",
    ["Your targets here are gnolls."] =
        "Aquí tus objetivos son gnolls.",
    ["Fly to Sentinel Hill"] =
        "Vuela a la Colina del Centinela",
    ["Fly to Stormwind City"] =
        "Vuela a la Ciudad de Ventormenta",
    ["Head indoors"] =
        "Ve al interior",
    ["Step onto the pink rune."] =
        "Pisa la runa rosa.",
    ["Look within the tomb."] =
        "Busca dentro de la tumba.",
    ["The NPC stands one level over the crypt."] =
        "El PNJ está un nivel por encima de la cripta.",
    ["Be ready for a fight right away."] =
        "Prepárate para luchar de inmediato.",
    ["The NPC waits indoors, a floor above the entrance."] =
        "El PNJ espera dentro, un piso por encima de la entrada.",
    ["Head down into the Deeprun Tram station"] =
        "Baja a la estación del Tranvía Subterráneo",
    ["Pass through the portal to teleport."] =
        "Cruza el portal para teletransportarte.",
    ["Take the Deeprun Tram over to Ironforge."] =
        "Toma el Tranvía Subterráneo hasta Forjaz.",
    ["The NPC stands by the wall on the central platform."] =
        "El PNJ está junto a la pared, en el andén central.",
    ["Target the Deeprun Rats with the item."] =
        "Usa el objeto sobre las Deeprun Rats.",
    ["Look for little gray rodents."] =
        "Busca pequeños roedores grises.",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "Ve al andén de Forjaz del Tranvía Subterráneo.",
    ["Fly to Ironforge"] =
        "Vuela a Forjaz",
    ["Stay on the trail"] =
        "Sigue el sendero",
    ["Steer clear of the elite yeti patrolling close by."] =
        "Evita al yeti élite que patrulla cerca.",
    ["The NPC is up on the summit."] =
        "El PNJ está arriba, en la cima.",
    ["Let the elite yeti stroll off before you go near."] =
        "Deja que el yeti élite se aleje antes de acercarte.",
    ["Your objective lies in a little cavern."] =
        "Tu objetivo está en una pequeña cueva.",
    ["Go quickly, time is short."] =
        "Date prisa, hay poco tiempo.",
    ["Go into the cavern"] =
        "Entra en la cueva",
    ["Head to the lower level of the cavern."] =
        "Ve al nivel inferior de la cueva.",
    ["Targets are in the cavern and around its entrance too."] =
        "Los objetivos están en la cueva y también alrededor de la entrada.",
    ["Head out of the cave"] =
        "Sal de la cueva",
    ["Climb the trail"] =
        "Sube por el sendero",
    ["Once in the Wetlands, head north."] =
        "Una vez en Los Humedales, ve al norte.",
    ["Leap down from the ledge."] =
        "Salta desde el saliente.",
    ["This makes Menethil Harbor quicker to get to."] =
        "Así llegas antes al Puerto de Menethil.",
    ["Keep climbing the trail"] =
        "Sigue subiendo por el sendero",
    ["Take the trail downhill"] =
        "Baja por el sendero",
    ["Fly to Menethil Harbor"] =
        "Vuela al Puerto de Menethil",
    ["Your targets are within the cavern."] =
        "Tus objetivos están dentro de la cueva.",
    ["Without this, one quest can't be picked up."] =
        "Sin esto, no podrás aceptar una misión.",
    ["The NPC is past the tunnel; stay on the road."] =
        "El PNJ está al otro lado del túnel; sigue el camino.",
    ["The target is a pale bear."] =
        "El objetivo es un oso pálido.",
    ["Cross the tunnel to reach the NPC."] =
        "Cruza el túnel para llegar al PNJ.",
    ["Fly to Thelsamar"] =
        "Vuela a Thelsamar",
    ["The NPC patrols a long route; look along it."] =
        "El PNJ patrulla una ruta larga; búscalo a lo largo de ella.",
    ["The targets are rat-like humanoids."] =
        "Los objetivos son humanoides con aspecto de rata.",
    ["Hunt spiders for it."] =
        "Caza arañas para conseguirlo.",
    ["Take the road to where the trail starts"] =
        "Sigue el camino hasta el inicio del sendero",
    ["A class quest coming up requires this."] =
        "Lo necesitas para una próxima misión de clase.",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "Sal de Stonesplinter Valley y sigue el camino",
    ["The NPC waits on the tower's highest floor."] =
        "El PNJ espera en el piso más alto de la torre.",
    ["Head up the incline"] =
        "Sube la cuesta",
    ["Dwarf and Gnome start"] =
        "Inicio enano y gnomo",
    ["Step back outside"] =
        "Vuelve a salir",
    ["They are rare and scattered widely."] =
        "Son escasos y están muy dispersos.",
    ["Pass through the tunnel, then stay on the road"] =
        "Cruza el túnel y sigue el camino",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "Cura al Montañero Dolf con Sanación inferior (Rango 2).",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "Lanza Palabra de poder: entereza sobre el Montañero Dolf.",
    ["The quest wants yetis; seek them out."] =
        "La misión pide yetis; búscalos.",
    ["Look for the timber baskets."] =
        "Busca las cestas de madera.",
    ["Any spot around Brewnall Village works."] =
        "Sirve cualquier punto alrededor de Brewnall Village.",
    ["Give it a few seconds."] =
        "Espera unos segundos.",
    ["Target one Large Crag Boar with it."] =
        "Úsalo sobre un Large Crag Boar.",
    ["Use it on any Snow Leopard."] =
        "Úsalo sobre cualquier Snow Leopard.",
    ["Target any Ice Claw Bear with the item."] =
        "Usa el objeto sobre cualquier Ice Claw Bear.",
    ["Keep it as pet food for later."] =
        "Guárdalo como comida para tu mascota.",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "Busca un Ice Claw Bear y lanza Domesticar bestia sobre él.",
    ["Push eastward if you still need more."] =
        "Sigue hacia el este si aún te faltan.",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "Guárdalo: lo necesitarás en una próxima misión de paladín.",
    ["Keep to the road as it crosses the underground passages."] =
        "No dejes el camino mientras cruza los pasajes subterráneos.",
    ["The NPC can be indoors or out."] =
        "El PNJ puede estar dentro o fuera.",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "Toma el Tranvía Subterráneo hasta la Ciudad de Ventormenta.",
    ["Flight master in Stormwind"] =
        "Maestro de vuelo de Ventormenta",
    ["The NPC roams a wide loop; look along it."] =
        "El PNJ recorre un circuito amplio; búscalo a lo largo de él.",
    ["You likely gathered 10 Linen Cloth already."] =
        "Seguramente ya tienes 10 Paños de lino.",
    ["Narm Faulk lies dead; use the item on his body."] =
        "Narm Faulk yace muerto; usa el objeto sobre su cadáver.",
    ["Wait for the talking to finish"] =
        "Espera a que termine la conversación",
    ["Climb the big ramp"] =
        "Sube la gran rampa",
    ["The NPC stands high in the great tree."] =
        "El PNJ está en lo alto del gran árbol.",
    ["The NPC stands in an adjoining chamber."] =
        "El PNJ está en una sala contigua.",
    ["The targets are imps."] =
        "Los objetivos son diablillos.",
    ["Look for groups of pink fungi."] =
        "Busca grupos de hongos rosas.",
    ["Mostly found beside tree trunks."] =
        "Suelen estar junto a los troncos de los árboles.",
    ["Look for big orange blossoms."] =
        "Busca grandes flores naranjas.",
    ["Climb to the cave's upper level."] =
        "Sube al nivel superior de la cueva.",
    ["The NPC stands at the summit of the great tree."] =
        "El PNJ está en la cima del gran árbol.",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "Cura a la Centinela Shaya con Sanación inferior (Rango 2).",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "Lanza Palabra de poder: entereza sobre la Centinela Shaya.",
    ["Pick up 5 Earthroot while questing."] =
        "Recoge 5 Raíces terrestres mientras haces misiones.",
    ["A class quest further on requires this."] =
        "Lo necesitas para una misión de clase más adelante.",
    ["Look for brown clumps of roots."] =
        "Busca matas de raíces marrones.",
    ["Kill black-furred tigers."] =
        "Mata tigres de pelaje negro.",
    ["The targets are spiders with green bodies."] =
        "Los objetivos son arañas de cuerpo verde.",
    ["Look for little brown pinecones giving off green smoke."] =
        "Busca pequeñas piñas marrones que desprenden humo verde.",
    ["The target is a satyr."] =
        "El objetivo es un sátiro.",
    ["The targets are spread over several spots."] =
        "Los objetivos están repartidos en varios puntos.",
    ["With the coming hand-ins, this gets you to level 9."] =
        "Con las próximas entregas, esto te lleva a nivel 9.",
    ["At this spot or a bit to the east."] =
        "En este punto o un poco más al este.",
    ["The NPC patrols the road; look along it."] =
        "El PNJ patrulla el camino; búscalo a lo largo de él.",
    ["For this quest you guard an NPC on the move."] =
        "En esta misión proteges a un PNJ que se desplaza.",
    ["If she is absent, wait for her to reappear."] =
        "Si no está, espera a que reaparezca.",
    ["Move fast: the clock is ticking on this one."] =
        "Date prisa: esta misión tiene tiempo límite.",
    ["Kill harpies."] =
        "Mata arpías.",
    ["Step into the cavern within the trunk"] =
        "Entra en la cueva del interior del tronco",
    ["The spot is on the lower floor of the hollow tree."] =
        "El punto está en el piso inferior del árbol hueco.",
    ["Don't forget to train Pick Pocket."] =
        "No olvides aprender Robar.",
    ["Keep it; an upcoming task asks for it."] =
        "Guárdalo; lo pide una próxima misión.",
    ["Fly to Moonglade"] =
        "Vuela al Claro de la Luna",
    ["Target a Webwood Lurker with it."] =
        "Úsalo sobre un Webwood Lurker.",
    ["Aim the item at any Nightsaber Stalker."] =
        "Usa el objeto sobre cualquier Nightsaber Stalker.",
    ["The beasts are leopards with blue fur."] =
        "Las bestias son leopardos de pelaje azul.",
    ["Aim the item at one Strigid Screecher."] =
        "Usa el objeto sobre un Strigid Screecher.",
    ["Target the owls here."] =
        "Elige como objetivo a los búhos de aquí.",
    ["You need to stand close to this spot."] =
        "Tienes que estar cerca de este punto.",
    ["Go into the hollow tree's cavern"] =
        "Entra en la cueva del árbol hueco",
    ["The target is a big gray spider."] =
        "El objetivo es una araña gris grande.",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "Toma como objetivo a Sethir el Anciano y usa Robar.",
    ["The target is a violet satyr."] =
        "El objetivo es un sátiro violeta.",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "El PNJ espera aquí y luego sale paseando a la gran rama cercana.",
    ["Fight the elementals of the swamp."] =
        "Lucha contra los elementales del pantano.",
    ["Use Herbalism's Track Herbs to spot them."] =
        "Usa el rastreo de hierbas de Herboristería para localizarlas.",
    ["Pick these up while questing around Teldrassil."] =
        "Recógelas mientras haces misiones por Teldrassil.",
    ["Get your Herbalism skill to 15."] =
        "Sube Herboristería a 15.",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "Junto con las próximas entregas, esto te lleva a nivel 11.",
    ["Circle the mountain, then climb the trail"] =
        "Rodea la montaña y sube por el sendero",
    ["The NPC stands on the highest level of this structure."] =
        "El PNJ está en el nivel más alto de esta estructura.",
    ["Flight master in Auberdine"] =
        "Maestro de vuelo de Auberdine",
    ["Your pet will need this food shortly."] =
        "Tu mascota necesitará esta comida pronto.",
    ["Hunt the crabs."] =
        "Caza los cangrejos.",
    ["You'll find extra ones swimming nearby as well."] =
        "También encontrarás más nadando cerca.",
    ["Use the item on any Rabid Thistle Bear."] =
        "Usa el objeto sobre cualquier Rabid Thistle Bear.",
    ["The targets are bears with grey fur."] =
        "Los objetivos son osos de pelaje gris.",
    ["Keep from damaging the creature."] =
        "No dañes a la criatura.",
    ["Your targets sit below the water's surface."] =
        "Tus objetivos están bajo la superficie del agua.",
    ["Avoid slaying the satyrs if you can."] =
        "Evita matar a los sátiros si puedes.",
    ["You'll need this for the following quest."] =
        "Lo necesitarás para la siguiente misión.",
    ["Hunt down satyrs."] =
        "Caza sátiros.",
    ["Big birds that roam on foot."] =
        "Grandes aves que van a pie.",
    ["Make your way to the Gates of Ironforge"] =
        "Ve a las Puertas de Forjaz",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "Nada hasta este punto exacto; luego, en el menú del juego, elige Soporte y pide que desatasquen tu personaje.",
    ["Stay outdoors by this building."] =
        "Quédate fuera, junto a este edificio.",
    ["Pull the camera back for a wider view."] =
        "Aleja la cámara para tener una vista más amplia.",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "Gira la cámara para ver el armario de Furlbrow.",
    ["Look for beige sacks."] =
        "Busca sacos beis.",
    ["Look beside objects and structures."] =
        "Busca junto a objetos y construcciones.",
    ["Hunt the vultures."] =
        "Caza los buitres.",
    ["Many of them gather in this area."] =
        "Muchos se concentran en esta zona.",
    ["The rest lie dotted across the zone."] =
        "El resto está repartido por la zona.",
    ["Kill boars for these."] =
        "Mata jabalíes para conseguirlos.",
    ["With the coming turn-ins, this gets you to level 15."] =
        "Con las próximas entregas, esto te lleva a nivel 15.",
    ["Flight master at Rut'theran Village"] =
        "Maestro de vuelo de la Aldea Rut'theran",
    ["Leave your pet with the stable master."] =
        "Deja tu mascota con el maestro de establos.",
    ["You will tame a short-term pet shortly."] =
        "Pronto domesticarás una mascota temporal.",
    ["Here your pet picks up Claw (Rank 2)."] =
        "Aquí tu mascota aprende Garra (Rango 2).",
    ["You will let it go shortly."] =
        "La abandonarás pronto.",
    ["Send your pet against a Thistle Bear."] =
        "Envía a tu mascota contra un Thistle Bear.",
    ["Get your companion back from the stable master."] =
        "Pide al maestro de establos que te devuelva a tu compañero.",
    ["Release the short-term pet you tamed."] =
        "Abandona la mascota temporal que domesticaste.",
    ["The NPC stands on the pier."] =
        "El PNJ está en el muelle.",
    ["The targets are sea creatures with long necks."] =
        "Los objetivos son criaturas marinas de cuello largo.",
    ["Head to the hilltop."] =
        "Ve a la cima de la colina.",
    ["Wade in to use it."] =
        "Métete en el agua para usarlo.",
    ["The spot is at the foot of the falls."] =
        "El punto está al pie de la cascada.",
    ["Look for an urn of woven wicker."] =
        "Busca una urna de mimbre trenzado.",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "El objetivo es el fantasma no hostil de una elfa de la noche.",
    ["Look for a figure in yellow and green garb."] =
        "Busca una figura vestida de amarillo y verde.",
    ["Go to the lowest deck of the wreck."] =
        "Ve a la cubierta más baja del pecio.",
    ["Swim in by way of a porthole."] =
        "Entra nadando por un ojo de buey.",
    ["Search stacks of brown crates."] =
        "Registra las pilas de cajas marrones.",
    ["The NPC stands atop the dam."] =
        "El PNJ está encima de la presa.",
    ["The object rests by the barrier."] =
        "El objeto está junto a la barrera.",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "Junto con las próximas entregas, esto te lleva a nivel 19.",
    ["This skips some tedious quests with a timer."] =
        "Así te saltas algunas misiones pesadas con tiempo límite.",
    ["The upcoming quest may prove hard."] =
        "La próxima misión puede resultar difícil.",
    ["The targets are troggs."] =
        "Los objetivos son troggs.",
    ["Redridge and Westfall"] =
        "Crestagrana y Páramos de Poniente",
    ["Look for a big mound of brown earth."] =
        "Busca un gran montículo de tierra marrón.",
    ["The target patrols a long route by the road."] =
        "El objetivo patrulla una ruta larga junto al camino.",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "La ruta del objetivo también se adentra mucho en Jangolode Mine y Gold Coast Quarry.",
    ["It takes roughly 5 minutes to reappear."] =
        "Tarda unos 5 minutos en reaparecer.",
    ["The target is a murloc, grey and bigger than the others."] =
        "El objetivo es un múrloc gris, más grande que los demás.",
    ["It roams the shoreline."] =
        "Deambula por la orilla.",
    ["If the NPC is absent, stay until he reappears."] =
        "Si el PNJ no está, quédate hasta que reaparezca.",
    ["Escort The Defias Traitor and keep him alive."] =
        "Escolta al Traidor Defias y mantenlo con vida.",
    ["The NPC is on an upper floor of the tower."] =
        "El PNJ está en un piso superior de la torre.",
    ["Hunt the red-feathered birds."] =
        "Caza las aves de plumas rojas.",
    ["The targets are little winged dragons."] =
        "Los objetivos son pequeños dragones alados.",
    ["Skip Redridge Alphas; they don't carry them."] =
        "Ignora a los Redridge Alphas; no los llevan.",
    ["Raise Lockpicking to 95"] =
        "Sube Forzar cerraduras a 95",
    ["Look for little gray coffers of metal."] =
        "Busca pequeños cofres grises de metal.",
    ["Go inside and stay on the trail"] =
        "Entra y sigue el sendero",
    ["Your target is a ghoul."] =
        "Tu objetivo es un necrófago.",
    ["Fight undead foes."] =
        "Lucha contra enemigos no-muertos.",
    ["The target is the dungeon's second boss."] =
        "El objetivo es el segundo jefe de la mazmorra.",
    ["The target is the dungeon's last boss."] =
        "El objetivo es el último jefe de la mazmorra.",
    ["The objective is aboard the vessel."] =
        "El objetivo está a bordo del barco.",
    ["You'll find them all over the instance."] =
        "Los encontrarás por toda la instancia.",
    ["The NPC is indoors"] =
        "El PNJ está dentro",
    ["Fight the murlocs."] =
        "Lucha contra los múrlocs.",
    ["The spot is at the cave's mouth."] =
        "El punto está en la boca de la cueva.",
    ["Look for the brown fungi."] =
        "Busca los hongos marrones.",
    ["Extra ones are below, in the side chambers."] =
        "Hay más abajo, en las salas laterales.",
    ["Gather the blue-capped fungi."] =
        "Recoge los hongos de sombrero azul.",
    ["Expect a possible ambush while you gather it."] =
        "Cuidado con una posible emboscada mientras lo recoges.",
    ["It shows up a short way off."] =
        "Aparece a poca distancia.",
    ["It shows up at your feet."] =
        "Aparece a tus pies.",
    ["Murloc packs arrive at the waterside."] =
        "Llegan grupos de múrlocs por la orilla.",
    ["The attackers rush the camp."] =
        "Los atacantes asaltan el campamento.",
    ["Engage foes one at a time."] =
        "Enfréntate a los enemigos de uno en uno.",
    ["Watch out, the landscape conceals some monsters."] =
        "Cuidado, el paisaje oculta algunos monstruos.",
    ["Avoid drawing several foes together."] =
        "Evita atraer a varios enemigos a la vez.",
    ["Stay with Prospector Remtravel and defend him."] =
        "Quédate con el Prospector Remtravel y defiéndelo.",
    ["He is frail and goes down fast."] =
        "Es frágil y cae rápido.",
    ["Look on top of the table."] =
        "Busca encima de la mesa.",
    ["Escort Therylune and defend her."] =
        "Escolta a Therylune y defiéndela.",
    ["Escort Volcor and defend him."] =
        "Escolta a Volcor y defiéndelo.",
    ["Allow the foes to hit him before you join in."] =
        "Deja que los enemigos le golpeen antes de intervenir.",
    ["If it is not around, move on without it."] =
        "Si no está por aquí, pasa al siguiente paso.",
    ["It reappears only after a long wait."] =
        "Tarda mucho en reaparecer.",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "Protege a Kerlonian Evershade mientras te sigue.",
    ["Keep near him; he dozes off."] =
        "Quédate cerca de él; se queda dormido.",
    ["The NPC is on the house's raised terrace."] =
        "El PNJ está en la terraza elevada de la casa.",
    ["Ashenvale and Stonetalon"] =
        "Vallefresno y Sierra Espolón",
    ["The item drops rarely."] =
        "El objeto cae pocas veces.",
    ["Look for little gray sheaves of straw."] =
        "Busca pequeñas gavillas grises de paja.",
    ["Lower the Ground Clutter option to 1."] =
        "Baja la opción de densidad del suelo (Ground Clutter) a 1.",
    ["Find it in the game options, under System, then Graphics."] =
        "Está en las opciones del juego, en Sistema y luego Gráficos.",
    ["Fly to Astranaar"] =
        "Vuela a Astranaar",
    ["Keep to the road the whole way."] =
        "No dejes el camino en todo el trayecto.",
    ["Pick up Claw (Rank 3) for your pet."] =
        "Consigue Garra (Rango 3) para tu mascota.",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "Domestica un Ashenvale Bear con Domesticar bestia.",
    ["Track down a chestnut-furred bear."] =
        "Busca un oso de pelaje castaño.",
    ["Keep to the road until you reach the Barrens"] =
        "Sigue el camino hasta llegar a Los Baldíos",
    ["Keep your distance from the Crossroads."] =
        "Mantente lejos de El Cruce.",
    ["Flight master in Ratchet"] =
        "Maestro de vuelo de Trinquete",
    ["Look for white spheres."] =
        "Busca esferas blancas.",
    ["The target is a gray furbolg."] =
        "El objetivo es un fúrbolg gris.",
    ["Shrubs that glitter white."] =
        "Arbustos con un brillo blanco.",
    ["Exit Ruins of Stardust"] =
        "Sal de Ruins of Stardust",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "Entra en Fire Scar Shrine y sube por el sendero",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "El objetivo invoca protectores con Ilkrud's Guardians.",
    ["Cut off the target's spells when you can."] =
        "Interrumpe los hechizos del objetivo cuando puedas.",
    ["Exit Fire Scar Shrine"] =
        "Sal de Fire Scar Shrine",
    ["Circle the mountain on foot."] =
        "Rodea la montaña a pie.",
    ["A yellowish naga; her fins look pinkish."] =
        "Una naga amarillenta; sus aletas son rosadas.",
    ["The target is rare and seldom up."] =
        "El objetivo es raro y casi nunca está.",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "El objetivo es una naga de piel jade y aletas rosadas.",
    ["It circles the island clockwise, close to the shore."] =
        "Rodea la isla en el sentido de las agujas del reloj, cerca de la orilla.",
    ["She travels with a pair of guards."] =
        "Va acompañada de dos guardias.",
    ["Hunt naga."] =
        "Caza nagas.",
    ["Take the passage into Stonetalon Mountains"] =
        "Toma el paso hacia la Sierra Espolón",
    ["Look for it high on the clifftop."] =
        "Búscalo en lo alto del acantilado.",
    ["The targets are wyverns."] =
        "Los objetivos son dracoleones.",
    ["Fly to Stonetalon Peak"] =
        "Vuela a la Cima del Espolón",
    ["Watch out and keep away from Tideress."] =
        "Cuidado, mantente lejos de Tideress.",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "Tu presa es una criatura de agua viva de tono verde, de nivel 27.",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "Está en la sección The Pool of Ask'ar de la mazmorra.",
    ["Look on Ghamoo-ra's north side."] =
        "Busca al norte de Ghamoo-ra.",
    ["Dive down into the submerged cave."] =
        "Bucea hasta la cueva sumergida.",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "Busca al PNJ al suroeste de Ghamoo-ra.",
    ["It is the dungeon's 4th boss."] =
        "Es el 4.º jefe de la mazmorra.",
    ["Kill Fallenroot and Blackfathom foes."] =
        "Mata enemigos Fallenroot y Brazanegra.",
    ["Fly to Talrendis Point"] =
        "Vuela a Talrendis Point",
    ["This trip is dangerous; move with great caution."] =
        "Este viaje es peligroso; avanza con mucha precaución.",
    ["Stay on the road and keep away from Horde NPCs."] =
        "Sigue el camino y mantente lejos de los PNJ de la Horda.",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "Los Warsong Outriders que cabalgan por el camino no son hostiles.",
    ["The target is a gray murloc."] =
        "El objetivo es un múrloc gris.",
    ["The target appears at this spot."] =
        "El objetivo aparece en este punto.",
    ["Go into Whelgar's Excavation Site"] =
        "Entra en la Excavación de Whelgar",
    ["Head out of Whelgar's Excavation Site"] =
        "Sal de la Excavación de Whelgar",
    ["The targets are raptors."] =
        "Los objetivos son raptores.",
    ["Targets are both in the tomb and around it."] =
        "Los objetivos están dentro de la tumba y a su alrededor.",
    ["The vendor stocks only a few."] =
        "El vendedor solo tiene unos pocos.",
    ["A quest in Duskwood will require it afterward."] =
        "Después lo necesitarás para una misión en el Bosque del Ocaso.",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "Cómpralo ahora; pronto lo pedirá una misión en el Bosque del Ocaso.",
    ["The spot is in the crypt under the building."] =
        "El punto está en la cripta bajo el edificio.",
    ["Duskwood and Redridge"] =
        "Bosque del Ocaso y Crestagrana",
    ["Flight master at Darkshire"] =
        "Maestro de vuelo de Villa Oscura",
    ["The target is a ghoul with red skin."] =
        "El objetivo es un necrófago de piel roja.",
    ["The targets are ghouls."] =
        "Los objetivos son necrófagos.",
    ["Exit the tomb"] =
        "Sal de la tumba",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "Usa Robar sobre un Malformed Defias Drone.",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "Usa Aporrear sobre Klaven Mortwake y luego abre el cofre.",
    ["Opening it puts a harmful effect on you."] =
        "Al abrirlo recibes un efecto perjudicial.",
    ["Climb the trail across the mountains"] =
        "Sube por el sendero a través de las montañas",
    ["Take the trail that circles the peak"] =
        "Toma el sendero que rodea el pico",
    ["Defeat each wave of attackers."] =
        "Derrota cada oleada de atacantes.",
    ["Beware of foes lurking in stealth."] =
        "Cuidado con los enemigos ocultos en sigilo.",
    ["Target Doc Mixilpixil, then take a seat."] =
        "Toma como objetivo a Doc Mixilpixil y siéntate.",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "El objetivo es un jabalí de piel marrón más oscura.",
    ["The targets are orcs."] =
        "Los objetivos son orcos.",
    ["You no longer need these; vendor or discard them."] =
        "Ya no los necesitas; véndelos o tíralos.",
    ["The targets are Horrors and Fiends."] =
        "Los objetivos son horrores y malignos.",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "No te enfrentes a Mor'Ladim, un enemigo no-muerto élite de nivel 35.",
    ["The target wanders near the crypt, outdoors."] =
        "El objetivo deambula cerca de la cripta, fuera.",
    ["Climb the steps and exit the tomb"] =
        "Sube las escaleras y sal de la tumba",
    ["The target is a sword-wielding gnoll."] =
        "El objetivo es un gnoll armado con una espada.",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "El objetivo es un gnoll con túnica carmesí que empuña una hoja larga.",
    ["Beware: nearby foes join when you attack him."] =
        "Cuidado: los enemigos cercanos se unen cuando lo atacas.",
    ["Keep to the cave's interior when you can."] =
        "Quédate dentro de la cueva siempre que puedas.",
    ["The following step takes place in the cave."] =
        "El siguiente paso transcurre en la cueva.",
    ["Keep Corporal Keeshan safe during the escort."] =
        "Protege al Cabo Keeshan durante la escolta.",
    ["At the cave's mouth, draw foes to him with care."] =
        "En la boca de la cueva, atrae a los enemigos hacia él con cuidado.",
    ["The target is the dungeon's fifth boss."] =
        "El objetivo es el quinto jefe de la mazmorra.",
    ["Targets are within the wrecked vessel underwater."] =
        "Los objetivos están dentro del barco hundido, bajo el agua.",
    ["The target is a blue raptor."] =
        "El objetivo es un raptor azul.",
    ["Look for a big mound of dirt."] =
        "Busca un gran montículo de tierra.",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "El objeto también puede aparecer en el saliente alto junto a Sarltooth.",
    ["Look for a big, broad yellow urn."] =
        "Busca una urna amarilla grande y ancha.",
    ["Look for a big, tall crimson urn."] =
        "Busca una urna carmesí grande y alta.",
    ["The target is a big stone container."] =
        "El objetivo es un gran recipiente de piedra.",
    ["The target is up on the boat's top deck."] =
        "El objetivo está arriba, en la cubierta superior del barco.",
    ["Climb the incline at the rear."] =
        "Sube la cuesta de la parte trasera.",
    ["Go to the lowest deck of the ship."] =
        "Ve a la cubierta más baja del barco.",
    ["Swim in via the gap at the base."] =
        "Entra nadando por el hueco de la base.",
    ["These foes hide in stealth."] =
        "Estos enemigos se ocultan en sigilo.",
    ["Most often found in or beside water."] =
        "Suelen estar en el agua o junto a ella.",
    ["Grab every one you spot on the way here."] =
        "Recoge todos los que veas de camino aquí.",
    ["With the coming hand-ins, this brings you to level 29."] =
        "Con las próximas entregas, esto te lleva a nivel 29.",
    ["Take the door on the bridge, then descend the steps"] =
        "Cruza la puerta del puente y baja las escaleras",
    ["The NPC is on the lower level within the bridge."] =
        "El PNJ está en el nivel inferior, dentro del puente.",
    ["Leap from the span and splash down below"] =
        "Salta del puente y cae al agua",
    ["Look for a pale, rolled scroll."] =
        "Busca un pergamino enrollado de color pálido.",
    ["A dwarf corpse grips it."] =
        "Lo sujeta un cadáver de enano.",
    ["Fly to Refuge Pointe"] =
        "Vuela al Refugio de la Zaga",
    ["Flight master at Southshore"] =
        "Maestro de vuelo de Costasur",
    ["The targets are turtles."] =
        "Los objetivos son tortugas.",
    ["Head north, keeping to the riverbank."] =
        "Ve al norte siguiendo la orilla del río.",
    ["Flight master at Chillwind Camp"] =
        "Maestro de vuelo del Campamento del Orvallo",
    ["Stonetalon and Ashenvale"] =
        "Sierra Espolón y Vallefresno",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "Sigue el camino y sube por el sendero hasta Punta de Nijel",
    ["Fly to Nijel's Point"] =
        "Vuela a Punta de Nijel",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "La misión es gris, pero las siguientes de la cadena dan mucha experiencia.",
    ["Take the road until this trail"] =
        "Sigue el camino hasta este sendero",
    ["Keep on the trail"] =
        "Sigue por el sendero",
    ["Fight the treants."] =
        "Lucha contra los antárboles.",
    ["Head uphill on the trail and across the passage"] =
        "Sube por el sendero y cruza el paso",
    ["Exit the Howling Vale by the tunnel"] =
        "Sal de Howling Vale por el túnel",
    ["You pick up Claw (Rank 4) here."] =
        "Aquí consigues Garra (Rango 4).",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "Domestica cualquier Elder Ashenvale Bear con Domesticar bestia.",
    ["They show up lying on the ground."] =
        "Aparecen tirados en el suelo.",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "Rodea el pico y sube por el sinuoso sendero de tierra hasta el santuario",
    ["Circle the mountain, then stay on the trail"] =
        "Rodea la montaña y sigue el sendero",
    ["Stand on the marked point, then apply the item."] =
        "Colócate en el punto marcado y usa el objeto.",
    ["Obtain Furbolg Form"] =
        "Obtén la forma de fúrbolg",
    ["Walk over the span"] =
        "Cruza el puente",
    ["The foes are gnomes."] =
        "Los enemigos son gnomos.",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "En las salas exteriores de Gnomeregan, no en la propia instancia.",
    ["Take the lift down, then head north."] =
        "Baja en el ascensor y ve al norte.",
    ["The NPC is atop the raised platform."] =
        "El PNJ está encima de la plataforma elevada.",
    ["It sits a short distance southward from Techbot."] =
        "Está un poco al sur de Techbot.",
    ["Use it on foes that are Irradiated."] =
        "Úsalo sobre enemigos irradiados.",
    ["The targets are troggs with a green glow."] =
        "Los objetivos son troggs con un brillo verde.",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "Dentro de The Hall of Gears, quédate en los niveles superiores.",
    ["Take the trail southwest into The Dormitory."] =
        "Toma el sendero al suroeste hacia The Dormitory.",
    ["By the wall on The Dormitory's lower floor."] =
        "Junto a la pared, en el piso inferior de The Dormitory.",
    ["The target is the third boss you meet."] =
        "El objetivo es el tercer jefe que encuentras.",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "El objetivo está en la plataforma elevada junto a Electrocutioner 6000.",
    ["In the Engineering Labs, on the lowest floor."] =
        "En Engineering Labs, en el piso más bajo.",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "El objetivo está junto a Crowd Pummeler 9-60.",
    ["Keep to Launch Bay's top floor."] =
        "Quédate en el piso superior de Launch Bay.",
    ["Look for boxy, standing devices."] =
        "Busca máquinas verticales con forma de caja.",
    ["The machine you need is in the Dormitory."] =
        "La máquina que necesitas está en The Dormitory.",
    ["It can take more than one to get it."] =
        "Puede que necesites más de uno para conseguirlo.",
    ["Duskwood and Stranglethorn"] =
        "Bosque del Ocaso y Tuercespina",
    ["Head into Stormwind Keep"] =
        "Entra en el Castillo de Ventormenta",
    ["The NPC stands by the water's edge."] =
        "El PNJ está a la orilla del agua.",
    ["The targets are worgen."] =
        "Los objetivos son huargen.",
    ["Other ghouls occupy the same spawn points."] =
        "Otros necrófagos ocupan los mismos puntos de aparición.",
    ["The target can be in the house or around it."] =
        "El objetivo puede estar en la casa o a su alrededor.",
    ["Just out of the mine."] =
        "Justo a la salida de la mina.",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "El PNJ patrulla la ruta del sur una vez cada 20-30 minutos.",
    ["A pair of foes go after him."] =
        "Dos enemigos lo atacan.",
    ["Saving his life unlocks a new task."] =
        "Salvarle la vida desbloquea una nueva misión.",
    ["Hang on to it; an upcoming quest uses it."] =
        "Guárdalo; lo usa una próxima misión.",
    ["The NPC stands in the narrow lane between houses."] =
        "El PNJ está en el callejón estrecho entre las casas.",
    ["Hillsbrad and Arathi"] =
        "Trabalomas y Arathi",
    ["Search for gray rocks standing up beside the walls."] =
        "Busca rocas grises en pie junto a los muros.",
    ["Further hidden ones lurk on the high ridgelines."] =
        "Hay más escondidos en las crestas altas.",
    ["Some are indoors as well."] =
        "Algunos también están dentro.",
    ["Fly to Aerie Peak"] =
        "Vuela a Pico Nidal",
    ["The NPC is at the summit of the trail."] =
        "El PNJ está en lo alto del sendero.",
    ["This spares you time further on."] =
        "Así ahorras tiempo más adelante.",
    ["Flight master at Theramore"] =
        "Maestro de vuelo de Theramore",
    ["This quest is buggy and may not show up."] =
        "Esta misión tiene errores y puede que no aparezca.",
    ["Expect several foes at once."] =
        "Prepárate para varios enemigos a la vez.",
    ["Make Private Hendel your main target."] =
        "Céntrate en el Soldado Hendel.",
    ["Steer clear of Brackenwall Village."] =
        "Evita el Poblado Murohelecho.",
    ["Watch out: the foes here are above your level."] =
        "Cuidado: aquí los enemigos son de nivel superior al tuyo.",
    ["The quest starts from a small piece of metal."] =
        "La misión empieza con un pequeño trozo de metal.",
    ["Take the lift down"] =
        "Baja en el ascensor",
    ["Look for a little brown tome."] =
        "Busca un pequeño tomo marrón.",
    ["The item is held by a dwarf corpse."] =
        "El objeto lo tiene un cadáver de enano.",
    ["Flight master at Thalanaar"] =
        "Maestro de vuelo de Thalanaar",
    ["Keep clear of Freewind Post."] =
        "Mantente lejos del Poblado Viento Libre.",
    ["This spot has most of them; elsewhere they are rare."] =
        "La mayoría están en este punto; en otros sitios escasean.",
    ["Return here as you do your other quests."] =
        "Vuelve aquí mientras haces tus otras misiones.",
    ["The foes here are scorpions."] =
        "Aquí los enemigos son escorpiones.",
    ["Look for assorted mechanical pieces."] =
        "Busca piezas mecánicas de todo tipo.",
    ["Parts lie all across the Shimmering Flats."] =
        "Hay piezas por todo El Desierto de Sal.",
    ["Fly to Gadgetzan"] =
        "Vuela a Gadgetzan",
    ["Stand on the metal grating to begin the battle."] =
        "Ponte sobre la rejilla metálica para empezar el combate.",
    ["Shows up once you defeat six challengers."] =
        "Aparece cuando derrotas a seis aspirantes.",
    ["The NPC is upstairs, out on the balcony."] =
        "El PNJ está arriba, fuera, en el balcón.",
    ["The NPC stands on the top tier of the pier."] =
        "El PNJ está en el nivel superior del muelle.",
    ["Fly to Booty Bay"] =
        "Vuela a Bahía del Botín",
    ["If he is absent, move on without him."] =
        "Si no está, sigue sin él.",
    ["You may come back for it another time."] =
        "Puedes volver a por ello en otro momento.",
    ["These foes heal both their allies and themselves."] =
        "Estos enemigos se curan a sí mismos y a sus aliados.",
    ["When the targets run out, skip ahead."] =
        "Cuando se acaben los objetivos, sigue adelante.",
    ["No rush; you may complete this afterwards."] =
        "Sin prisa; puedes completarlo más tarde.",
    ["The objective sits up on the raised deck."] =
        "El objetivo está arriba, en la cubierta elevada.",
    ["Search the riverbanks."] =
        "Busca en las orillas del río.",
    ["Here your pet picks up Claw (Rank 5)."] =
        "Aquí tu mascota aprende Garra (Rango 5).",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "Domestica un Scorpashi Lasher con Domesticar bestia.",
    ["Head uphill into Nijel's Point"] =
        "Sube hasta Punta de Nijel",
    ["With the coming hand-ins, this brings you to level 36."] =
        "Con las próximas entregas, esto te lleva a nivel 36.",
    ["The quest starts from a little book."] =
        "La misión empieza con un librito.",
    ["The targets are lobsters."] =
        "Los objetivos son langostas.",
    ["Draw him to the doorway so other foes stay out of it."] =
        "Atráelo hasta la puerta para que los demás enemigos no se metan.",
    ["Escort Dalinda Malem and keep her alive."] =
        "Escolta a Dalinda Malem y mantenla con vida.",
    ["The targets here are centaurs."] =
        "Aquí los objetivos son centauros.",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "Los Magram Pack Runners patrullan con 2 hienas de escolta; mantente lejos.",
    ["Stay away from Ghost Walker Post."] =
        "Aléjate del Campamento del Espíritu Errante.",
    ["Target kodos with the item."] =
        "Usa el objeto sobre los kodos.",
    ["The kodos trail behind you."] =
        "Los kodos te siguen.",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "Llévalos hasta Smeed Scrabblescrew y luego habla con ellos allí.",
    ["Look for pale skulls of horned beasts."] =
        "Busca cráneos pálidos de bestias con cuernos.",
    ["A lengthy grinding stretch is coming up."] =
        "Se acerca un largo tramo de matar monstruos.",
    ["The targets are Sea Witches and Tidehunters."] =
        "Los objetivos son Sea Witches y Tidehunters.",
    ["Other naga compete for the same spawn points."] =
        "Otros naga comparten los mismos puntos de aparición.",
    ["The targets are on islands and beneath the surface."] =
        "Los objetivos están en islas y bajo el agua.",
    ["This spreads out the grinding so less is left later."] =
        "Así repartes el tiempo de matar monstruos y luego queda menos.",
    ["Take the mountain trail to get there."] =
        "Toma el sendero de montaña para llegar.",
    ["Stay clear of Valley of Spears."] =
        "Evita el Valle de las Lanzas.",
    ["Look for tan sacks by the houses."] =
        "Busca sacos de color tostado junto a las casas.",
    ["Some of them are not usable."] =
        "Algunos no se pueden usar.",
    ["Basilisks compete for the same spawn points."] =
        "Los basiliscos comparten los mismos puntos de aparición.",
    ["They compete for spawn points with the other Kurzen foes."] =
        "Comparten puntos de aparición con los demás enemigos Kurzen.",
    ["A key class quest coming up requires this."] =
        "Lo necesita una misión de clase importante que viene después.",
    ["The targets are on the cave floor."] =
        "Los objetivos están en el suelo de la cueva.",
    ["Targets are spread across the whole cavern."] =
        "Los objetivos están repartidos por toda la caverna.",
    ["Hold on to it for a Searing Gorge task later."] =
        "Guárdalo para una misión de La Garganta de Fuego más adelante.",
    ["Stay away from Bhag'thera."] =
        "Aléjate de Bhag'thera.",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "El felino que buscas deambula a la vista: una pantera negra élite de nivel 40.",
    ["The targets are in the water and along its edges."] =
        "Los objetivos están en el agua y en sus orillas.",
    ["Look for an orange tiger."] =
        "Busca un tigre naranja.",
    ["Mostly found atop the hill."] =
        "Casi todos están en lo alto de la colina.",
    ["Steer clear of elite murlocs."] =
        "Evita a los múrlocs élite.",
    ["The targets are trolls."] =
        "Los objetivos son trols.",
    ["With the coming hand-ins, this gets you to level 38."] =
        "Con las próximas entregas, esto te lleva a nivel 38.",
    ["Hunt the little winged dragonkin."] =
        "Caza a los pequeños dragonantes alados.",
    ["The target is a humanoid escorted by 2 guards."] =
        "El objetivo es un humanoide escoltado por 2 guardias.",
    ["Clear the monsters just south before you start."] =
        "Limpia los monstruos que hay justo al sur antes de empezar.",
    ["Escort Galen Goodward and keep him alive."] =
        "Escolta a Galen Goodward y mantenlo con vida.",
    ["Look for big blue crystals."] =
        "Busca cristales azules grandes.",
    ["Keep to the water to skip foes above your level."] =
        "Ve por el agua para evitar enemigos de nivel superior al tuyo.",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "Junto con las próximas entregas, esto te lleva a nivel 39.",
    ["Hold on to it for the Whirlwind class chain."] =
        "Guárdalo para la cadena de clase de Torbellino.",
    ["A major boost to your weapon."] =
        "Una gran mejora para tu arma.",
    ["Arathi and Alterac"] =
        "Arathi y Alterac",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "El objetivo recorre el camino en un solo sentido, escoltado por 4 guardias.",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "Si llega a Molino Tarren, vuelve a aparecer.",
    ["She starts her route over in Arathi Highlands."] =
        "Vuelve a empezar su ruta en las Tierras Altas de Arathi.",
    ["The targets are kobolds."] =
        "Los objetivos son kóbolds.",
    ["Additional ones are in the cavern up the trail."] =
        "Hay más en la caverna, sendero arriba.",
    ["Keep away from Hammerfall."] =
        "Aléjate de Sentencia.",
    ["Climb the trail to the cavern"] =
        "Sube por el sendero hasta la caverna",
    ["The NPC stands atop the ridge."] =
        "El PNJ está en lo alto de la cresta.",
    ["Escort Kinelory and keep her alive."] =
        "Escolta a Kinelory y mantenla con vida.",
    ["The targets are ogres."] =
        "Los objetivos son ogros.",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "Junto con las próximas entregas, esto te lleva a nivel 40.",
    ["Stay clear of Refuge Point."] =
        "Evita el Refugio de la Zaga.",
    ["A level 40 elite foe shows up shortly."] =
        "Enseguida aparece un enemigo élite de nivel 40.",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "Bébete una segunda Poción de protección contra la Naturaleza a mitad del combate.",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "Tómate una antes, para que ya esté recargada cuando empiece el combate.",
    ["Get Essence of the Exile done as well."] =
        "Completa también Essence of the Exile.",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "Asegúrate de que la Poción de protección contra la Naturaleza ya no esté en reutilización.",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "Quédate detrás de Bath'rah the Windwatcher mientras camina.",
    ["This calls up Cyclonian."] =
        "Esto invoca a Cyclonian.",
    ["Take the trail across the peaks"] =
        "Toma el sendero que cruza las cumbres",
    ["Take the passage to Faldir's Cove"] =
        "Toma el paso hasta la Cala de Faldir",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "Escolta al Profesor Phizzlethorpe y mantenlo con vida.",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "El tomo tiene tapas marrones y está dentro de un caldero de metal.",
    ["The objective is on the central deck of the submerged wreck."] =
        "El objetivo está en la cubierta central del barco hundido.",
    ["Look for a flat beige parchment."] =
        "Busca un pergamino plano de color beis.",
    ["Search for a book lying open."] =
        "Busca un libro abierto.",
    ["The target is in the ship's lowest hold."] =
        "El objetivo está en la bodega más baja del barco.",
    ["Look for big gray rocks."] =
        "Busca rocas grises grandes.",
    ["They show up as dots on the minimap."] =
        "Aparecen como puntos en el minimapa.",
    ["Hold on to it, an upcoming quest uses it."] =
        "Guárdalo, lo usa una misión próxima.",
    ["Clear the raptors around before you begin."] =
        "Limpia los raptores de alrededor antes de empezar.",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "Deja que termine la conversación y luego escolta a \"Stinky\" Ignatz y mantenlo con vida.",
    ["Speak with him once he gives up."] =
        "Habla con él cuando se rinda.",
    ["Hunt the felguards."] =
        "Caza a los guardias viles.",
    ["This is the sole spot; wait for them to reappear."] =
        "Es el único sitio; espera a que reaparezcan.",
    ["The targets are felhounds."] =
        "Los objetivos son canes viles.",
    ["The targets are succubi."] =
        "Los objetivos son súcubos.",
    ["The spot is beside a giant skeleton."] =
        "El sitio está junto a un esqueleto gigante.",
    ["Clear out the foes around here before you start."] =
        "Limpia los enemigos de esta zona antes de empezar.",
    ["Target the spectral centaurs."] =
        "Ve a por los centauros espectrales.",
    ["The targets are brown-colored skeletons."] =
        "Los objetivos son esqueletos de color marrón.",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "Junto con las próximas entregas, esto te lleva a nivel 41.",
    ["The target wanders inside the tent and around it."] =
        "El objetivo deambula dentro de la tienda y a su alrededor.",
    ["Take the road, then descend the trail"] =
        "Toma el camino y luego baja por el sendero",
    ["On the road, Rexxar leaves you alone."] =
        "En el camino, Rexxar te deja en paz.",
    ["Cross by boat or by swimming"] =
        "Cruza en barco o a nado",
    ["Flight master at Feathermoon"] =
        "Maestro de vuelo de Bastión Plumaluna",
    ["Your pet picks up Claw (Rank 6) here."] =
        "Aquí tu mascota aprende Garra (Rango 6).",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "Domestica un Scorpid Hunter con Domesticar bestia.",
    ["Head into the Library wing."] =
        "Ve al ala de la Biblioteca.",
    ["The target is the dungeon's opening boss."] =
        "El objetivo es el primer jefe de la mazmorra.",
    ["Head across the hall called Gallery of Treasures."] =
        "Cruza la sala llamada Gallery of Treasures.",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "Vigila el minimapa hasta que el nombre de la zona vuelva a ser Monasterio Escarlata.",
    ["This is in the Armory wing."] =
        "Está en el ala de la Armería.",
    ["Found in the Cathedral wing."] =
        "Está en el ala de la Catedral.",
    ["A lengthy stretch of quests is coming up."] =
        "Se acerca un largo tramo de misiones.",
    ["This vendor sells no arrows or bullets."] =
        "Este vendedor no vende flechas ni balas.",
    ["Get these for simple Badlands turn-ins ahead."] =
        "Consíguelos para entregas fáciles en las Tierras Inhóspitas más adelante.",
    ["The NPC or item sits on the rocky shelf above."] =
        "El PNJ o el objeto está en la repisa rocosa de arriba.",
    ["Fight the dwarves."] =
        "Lucha contra los enanos.",
    ["Look for a timber box."] =
        "Busca una caja de madera.",
    ["A cluster of them gathers here."] =
        "Aquí se agrupan muchos.",
    ["More of them dot the surroundings."] =
        "Hay más repartidos por los alrededores.",
    ["With the coming hand-ins, this brings you to level 42."] =
        "Con las próximas entregas, esto te lleva a nivel 42.",
    ["Unlocks the flight point at Thorium Point."] =
        "Desbloquea el punto de vuelo del Puesto del Torio.",
    ["Flight master at Thorium Point"] =
        "Maestro de vuelo del Puesto del Torio",
    ["Take the passage out of Booty Bay"] =
        "Toma el paso para salir de Bahía del Botín",
    ["Take the tunnel into Booty Bay"] =
        "Toma el túnel para entrar en Bahía del Botín",
    ["Take the trail toward the Ruins of Aboraz"] =
        "Toma el sendero hacia las Ruinas de Aboraz",
    ["Gradually move toward the northeast."] =
        "Avanza poco a poco hacia el noreste.",
    ["The targets are goblins."] =
        "Los objetivos son goblins.",
    ["Kill the witch doctors and the mystics."] =
        "Mata a los médicos brujos y a los místicos.",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "Una pantera oscura, élite de nivel 40, visible y no en sigilo.",
    ["Be ready: these opponents are elites at level 38."] =
        "Prepárate: estos rivales son élites de nivel 38.",
    ["Saltwater Crocolisks spawn in the same places."] =
        "Los Saltwater Crocolisks aparecen en los mismos sitios.",
    ["The object is a table made of stone."] =
        "El objeto es una mesa de piedra.",
    ["Drag him up until he breaks the surface."] =
        "Súbelo hasta que salga a la superficie.",
    ["Follow the shoreline"] =
        "Sigue la orilla",
    ["The item is a brownish sheet of parchment."] =
        "El objeto es una hoja de pergamino parduzca.",
    ["Look for a flat, white scroll lying open."] =
        "Busca un pergamino blanco, plano y abierto.",
    ["If some pages are unavailable, go on without them."] =
        "Si faltan algunas páginas, sigue sin ellas.",
    ["You want Chapters I, II and III."] =
        "Necesitas los capítulos I, II y III.",
    ["Collect the chunks of wood."] =
        "Recoge los trozos de madera.",
    ["Do not go near Stonard."] =
        "No te acerques a Rocal.",
    ["Silt Crawlers drop it more often."] =
        "Los Silt Crawlers lo sueltan más a menudo.",
    ["Fly to Nethergarde Keep"] =
        "Vuela al Castillo de Nethergarde",
    ["A timer runs on this one; don't dawdle."] =
        "Esta tiene tiempo límite; no te entretengas.",
    ["Hold on until Rizzle has fled."] =
        "Espera a que Rizzle haya huido.",
    ["Targets here are human."] =
        "Aquí los objetivos son humanos.",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "Aquí también puedes hacer mazmorras, si quieres.",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "Cada lote de 5 entregado en Gadgetzan da 380 de experiencia.",
    ["Hyenas also use these spawn spots."] =
        "Las hienas también usan estos puntos de aparición.",
    ["Feralas and Tanaris"] =
        "Feralas y Tanaris",
    ["Position yourself in its center."] =
        "Colócate en el centro.",
    ["Consider bringing a group for this one."] =
        "Plantéate ir en grupo para esta.",
    ["Zones with stronger foes lie just ahead."] =
        "Se acercan zonas con enemigos más fuertes.",
    ["The quests alone won't give you the level you need."] =
        "Las misiones solas no te darán el nivel que necesitas.",
    ["Swim this way to stay out of fatigue"] =
        "Nada por aquí para evitar la fatiga",
    ["Hunt the crimson winged serpents."] =
        "Caza a las serpientes aladas carmesí.",
    ["Slay them, then apply the item to their remains."] =
        "Mátalos y luego usa el objeto sobre sus restos.",
    ["Once freed, they can be killed."] =
        "Una vez liberados, se les puede matar.",
    ["Win the encounter at the temple."] =
        "Gana el combate del templo.",
    ["Take the trail to the southeast."] =
        "Toma el sendero hacia el sureste.",
    ["Inside a big room around a central pool."] =
        "Dentro de una sala grande, alrededor de un estanque central.",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "La mayoría está en la sala de los escarabajos de Theka el Mártir.",
    ["It could take a few trips through the instance."] =
        "Puede que necesites varias pasadas por la instancia.",
    ["Do more Zul'Farrak runs."] =
        "Haz Zul'Farrak más veces.",
    ["Keep to the road, then cross the tunnel"] =
        "Sigue el camino y luego cruza el túnel",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "El robot está en el terreno abierto que une la cueva y el túnel.",
    ["Others lie past the tunnel."] =
        "Hay más pasado el túnel.",
    ["Get out of the cave and use the passage beyond"] =
        "Sal de la cueva y usa el paso que hay más allá",
    ["Look for a big, pale egg."] =
        "Busca un huevo grande y pálido.",
    ["Hunt gorillas."] =
        "Caza gorilas.",
    ["Bears appear at the same spawn spots."] =
        "Los osos aparecen en los mismos puntos de aparición.",
    ["Hunt bears."] =
        "Caza osos.",
    ["They appear in the same spots as the apes."] =
        "Aparecen en los mismos sitios que los simios.",
    ["Kill the foes near the big cage first."] =
        "Mata primero a los enemigos que hay junto a la jaula grande.",
    ["This helps with the following step."] =
        "Esto ayuda en el paso siguiente.",
    ["This sets Captured Sprite Darters free."] =
        "Esto libera a los Captured Sprite Darters.",
    ["Save as many of them as possible."] =
        "Salva a todos los que puedas.",
    ["Keep 6 or more of them alive."] =
        "Mantén con vida al menos a 6.",
    ["If she is gone, wait until she comes back."] =
        "Si no está, espera a que vuelva.",
    ["Go into the cavern at the trail's foot"] =
        "Entra en la caverna al pie del sendero",
    ["Getting it here speeds up Un'Goro Crater."] =
        "Conseguirlo aquí acelera el Cráter de Un'Goro.",
    ["Stay clear of the elite foes."] =
        "Evita a los enemigos élite.",
    ["Gather the big plumes colored brown and ivory."] =
        "Recoge las plumas grandes de color marrón y marfil.",
    ["Drop the Ground Clutter option down to 1."] =
        "Baja la opción de densidad del suelo (Ground Clutter) a 1.",
    ["Hop onto the ledge here."] =
        "Salta a la repisa de aquí.",
    ["Monsters are unable to reach you from this spot."] =
        "Desde aquí los monstruos no pueden alcanzarte.",
    ["Hold off until you have left combat."] =
        "Espera hasta salir de combate.",
    ["Other creatures use these spawn points too."] =
        "Otras criaturas también usan estos puntos de aparición.",
    ["If it hasn't turned up by level 49, move on."] =
        "Si no ha aparecido al llegar a nivel 49, sigue adelante.",
    ["Stay on the road, then take the trail downhill"] =
        "Sigue por el camino y luego baja por el sendero",
    ["Point it at Gammerita."] =
        "Úsalo sobre Gammerita.",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "La presa: una tortuga élite muy dura, de caparazón azul celeste.",
    ["Look for little blue flasks."] =
        "Busca frasquitos azules.",
    ["Steer around Revantusk Village."] =
        "Rodea el Poblado Sañadiente.",
    ["Stay away from Gammerita."] =
        "Aléjate de Gammerita.",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "Mata monstruos hasta que tu piedra de hogar esté lista",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "El objetivo patrulla un gran circuito, en sentido contrario a las agujas del reloj.",
    ["Watch for a pair of guards hiding in stealth."] =
        "Cuidado con dos guardias ocultos en sigilo.",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "El objetivo aparece en 58.9, 39.3, en Tanaris.",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "Baja por el paso que da a Lost Rigger Cove",
    ["Few kills yield this item."] =
        "Este objeto cae pocas veces.",
    ["Others can be found on raised wood platforms close by."] =
        "Hay más en plataformas de madera elevadas cercanas.",
    ["Others are indoors too."] =
        "También hay más en el interior.",
    ["Take the passage out of Lost Rigger Cove"] =
        "Toma el paso para salir de Lost Rigger Cove",
    ["If the NPC is gone, hold on until it reappears."] =
        "Si el PNJ no está, espera a que reaparezca.",
    ["Search the sand mounds."] =
        "Busca en los montículos de arena.",
    ["It competes for spawn points."] =
        "Comparte puntos de aparición.",
    ["Stay clear of the elite tyrannosaur."] =
        "Evita al tiranosaurio élite.",
    ["Every creature in Un'Goro Crater can drop it."] =
        "Cualquier criatura del Cráter de Un'Goro puede soltarlo.",
    ["Gather from clumps of multicolored crystals."] =
        "Recógelos de los grupos de cristales multicolores.",
    ["Spawn points are shared, so pick up every one you find."] =
        "Los puntos de aparición son compartidos, así que recoge todos los que encuentres.",
    ["Gathering it causes other hues to show up."] =
        "Al recogerlo aparecen otros colores.",
    ["The targets are mobile plant monsters."] =
        "Los objetivos son monstruos vegetales que se mueven.",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "Junto con las próximas entregas, esto te lleva a nivel 50.",
    ["Flight master at Marshal's Refuge"] =
        "Maestro de vuelo del Refugio de Marshal",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "En los túneles de Maraudon, el objetivo es un centauro con armadura violeta.",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "Ve al ala morada de los túneles de Maraudon.",
    ["Use it on the Spirit of Gelk."] =
        "Úsalo sobre Spirit of Gelk.",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "En los túneles de Maraudon, busca la sala que une las zonas morada y naranja.",
    ["Target the Spirit of Kolk with the item."] =
        "Usa el objeto sobre Spirit of Kolk.",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "Está en los túneles de Maraudon, por el ala naranja.",
    ["The target is beside the big pool holding orange crystals."] =
        "El objetivo está junto al gran estanque con cristales naranjas.",
    ["Target the Spirit of Magra with it."] =
        "Úsalo sobre Spirit of Magra.",
    ["Target Spirit of Veng with it."] =
        "Úsalo sobre Spirit of Veng.",
    ["In the orange area."] =
        "En la zona naranja.",
    ["Use it beside the Vylestem Vines."] =
        "Úsalo junto a las Vylestem Vines.",
    ["Look for stumps topped with big leaves."] =
        "Busca tocones cubiertos de hojas grandes.",
    ["The spot is in Foulspore Cavern."] =
        "El sitio está en Foulspore Cavern.",
    ["This happens in Maraudon's violet wing."] =
        "Esto pasa en el ala violeta de Maraudon.",
    ["Aim the item at the Spirit of Maraudos."] =
        "Usa el objeto sobre Spirit of Maraudos.",
    ["The target is a spectral centaur holding a spear."] =
        "El objetivo es un centauro espectral con una lanza.",
    ["Small green flasks."] =
        "Frasquitos verdes.",
    ["Search the shoreline, right by the waves."] =
        "Busca en la orilla, justo junto a las olas.",
    ["The objective is on the ship's center deck."] =
        "El objetivo está en la cubierta central del barco.",
    ["Search for a parchment roll, white in color."] =
        "Busca un rollo de pergamino de color blanco.",
    ["Search the ship's middle or lowest deck."] =
        "Busca en la cubierta central o en la más baja del barco.",
    ["If she is absent, wait for her to come back."] =
        "Si no está, espera a que vuelva.",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "Caza a un raptor élite de nivel 43 de escamas azul celeste.",
    ["The quarry is a pale tiger, an elite at 43."] =
        "La presa es un tigre pálido, élite de nivel 43.",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "Llama a 2 esbirros pequeños de nivel inferior; ninguno es élite.",
    ["When it drops to about 50% health."] =
        "Cuando baja a cerca del 50% de salud.",
    ["Look underneath the bridge."] =
        "Mira debajo del puente.",
    ["Hunt flame and stone elementals."] =
        "Caza elementales de fuego y de piedra.",
    ["Fight elementals and golems."] =
        "Lucha contra elementales y gólems.",
    ["Drop onto the metal catwalk at this spot"] =
        "Déjate caer en la pasarela metálica en este punto",
    ["Drop off the cavern's bridge at this spot"] =
        "Déjate caer del puente de la caverna en este punto",
    ["Go in through the second cave opening"] =
        "Entra por la segunda boca de la cueva",
    ["Slave Workers can drop them too."] =
        "Los Slave Workers también pueden soltarlos.",
    ["Climb the trail out of the Cauldron"] =
        "Sube por el sendero para salir de La Caldera",
    ["The foes here are elite."] =
        "Aquí los enemigos son élite.",
    ["Do not leave this quest undone; it matters."] =
        "No te saltes esta misión; es importante.",
    ["The spot is at the tower's upper level."] =
        "El sitio está en el piso superior de la torre.",
    ["Beware, this foe is elite."] =
        "Cuidado, este enemigo es élite.",
    ["Walk over the rope bridge"] =
        "Cruza el puente de cuerda",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "Caza al saurio élite azul celeste; es de nivel 48.",
    ["The target wanders the trail."] =
        "El objetivo deambula por el sendero.",
    ["Defeat every foe close by before you begin."] =
        "Derrota a todos los enemigos cercanos antes de empezar.",
    ["Escort Dorius Stonetender and keep him safe."] =
        "Escolta a Dorius Stonetender y protégelo.",
    ["Keep it; a later quest calls for it."] =
        "Guárdalo; una misión posterior lo pide.",
    ["Look by the lookout towers ringing the Cauldron."] =
        "Busca junto a las atalayas que rodean La Caldera.",
    ["Climb the trail into Thorium Point"] =
        "Sube por el sendero hasta el Puesto del Torio",
    ["Blasted Lands and Burning Steppes"] =
        "Las Tierras Devastadas y las Estepas Ardientes",
    ["Prioritize these targets."] =
        "Dales prioridad a estos objetivos.",
    ["Hunt basilisks."] =
        "Caza basiliscos.",
    ["They appear in the same spots as the boars."] =
        "Aparecen en los mismos sitios que los jabalíes.",
    ["Hunt hyenas for these."] =
        "Caza hienas para conseguirlos.",
    ["Scorpions spawn in the same spots."] =
        "Los escorpiones aparecen en los mismos sitios.",
    ["Climb the trail to Morgan's Vigil"] =
        "Sube por el sendero hasta la Vigilia de Morgan",
    ["Flight master at Morgan's Vigil"] =
        "Maestro de vuelo de la Vigilia de Morgan",
    ["8 different quests will ask for it."] =
        "Lo pedirán 8 misiones distintas.",
    ["You hand in 60 pieces of cloth for every quest."] =
        "Entregas 60 piezas de tela por cada misión.",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "Los enemigos no-muertos los sueltan en las dos Tierras de la Peste, la del Oeste y la del Este.",
    ["Keep your Argent Dawn Commission aura up."] =
        "Mantén activa el aura de tu Argent Dawn Commission.",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "Junto con las próximas entregas, esto te lleva a nivel 52.",
    ["Azshara and Felwood"] =
        "Azshara y Frondavil",
    ["A lengthy stretch of questing lies ahead."] =
        "Te espera un largo tramo de misiones.",
    ["Hand these in afterwards for experience and reputation."] =
        "Entrégalos después por experiencia y reputación.",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "Sube tu reputación con el Bastión Fauces de Madera a Adverso",
    ["Extra targets wait in the caves."] =
        "Hay más objetivos en las cuevas.",
    ["Stay on the trail to reach Jaedenar"] =
        "Sigue el sendero hasta llegar a Jaedenar",
    ["Climb the trail into Jadefire Run"] =
        "Sube por el sendero hasta Jadefire Run",
    ["Flight master at Talonbranch Glade"] =
        "Maestro de vuelo de Talonbranch Glade",
    ["Big blue plumes."] =
        "Plumas azules grandes.",
    ["Head eastward as you go."] =
        "Avanza hacia el este sobre la marcha.",
    ["You pick up Claw (Rank 7) here."] =
        "Aquí consigues Garra (Rango 7).",
    ["Flight master at Everlook"] =
        "Maestro de vuelo de Vista Eterna",
    ["The flight master stands past the walls, outdoors."] =
        "El maestro de vuelo está pasada la muralla, al aire libre.",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "Domestica un Angerclaw Mauler con tu hechizo Domesticar bestia.",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "Busca un oso apestado de pelaje castaño.",
    ["Feralas and Azshara"] =
        "Feralas y Azshara",
    ["Aim the item at the Strider foes."] =
        "Usa el objeto sobre los enemigos zancudos.",
    ["The targets are towering green giants."] =
        "Los objetivos son enormes gigantes verdes.",
    ["The item strips their elite status."] =
        "El objeto les quita el estatus de élite.",
    ["Hunt down the elementals formed of water."] =
        "Caza a los elementales de agua.",
    ["Reveal Dire Maul on your map"] =
        "Descubre La Masacre en tu mapa",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "Ponte en la repisa de al lado y luego salta a esta grieta de la pared",
    ["Hop onto the ledge"] =
        "Salta a la repisa",
    ["Leap over at this spot"] =
        "Salta al otro lado en este punto",
    ["Leap up at this spot"] =
        "Salta hacia arriba en este punto",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "Shay Leafrunner te sigue; mantenla con vida.",
    ["Keep near her, as she tends to stray."] =
        "Quédate cerca de ella, porque tiende a alejarse.",
    ["Finish the quest named The Videre Elixir."] =
        "Termina la misión The Videre Elixir.",
    ["Keep the elixir in your bags; never consume it."] =
        "Guarda el elixir en tus bolsas; no te lo bebas nunca.",
    ["You will die from it."] =
        "Te matará.",
    ["Put these items in your bank vault."] =
        "Guarda estos objetos en el banco.",
    ["The quest giver waits on the hilltop."] =
        "El PNJ de la misión espera en lo alto de la colina.",
    ["The targets are Myrmidons and Sirens."] =
        "Los objetivos son mirmidones y sirenas.",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "Rodea las Ruinas de Eldarath y luego cruza el puente",
    ["Drop down with care"] =
        "Baja con cuidado",
    ["The spot is the middle of the timber deck."] =
        "El sitio es el centro de la plataforma de madera.",
    ["It shows up close by after a while."] =
        "Aparece cerca al cabo de un rato.",
    ["At times it takes several minutes."] =
        "A veces tarda varios minutos.",
    ["The targets are flame elementals."] =
        "Los objetivos son elementales de fuego.",
    ["An elite foe waits on the summit; steer clear."] =
        "Hay un enemigo élite en la cumbre; mantente lejos.",
    ["Ringo trails behind you; keep him alive."] =
        "Ringo te sigue; mantenlo con vida.",
    ["Keep near him; he passes out."] =
        "Quédate cerca de él; se desmaya.",
    ["Take the trail through the cavern"] =
        "Toma el sendero que cruza la caverna",
    ["Escort A-Me 01 and keep it alive."] =
        "Escolta a A-Me 01 y mantenlo con vida.",
    ["Winterspring and Felwood"] =
        "Cuna del Invierno y Frondavil",
    ["Go into Jaedenar"] =
        "Entra en Jaedenar",
    ["Go to the upper floor of the cavern."] =
        "Ve al piso superior de la caverna.",
    ["Circle the gap in the ground, then take the trail downward"] =
        "Rodea el agujero del suelo y luego baja por el sendero",
    ["The target is deep in the cave, on its lowest floor."] =
        "El objetivo está en lo más hondo de la cueva, en el piso más bajo.",
    ["Search the upper and lower floors of the cavern."] =
        "Busca en los pisos superior e inferior de la caverna.",
    ["The prisoner is held in a cage of yellow wood."] =
        "El prisionero está en una jaula de madera amarilla.",
    ["Climb the trail and exit the cavern"] =
        "Sube por el sendero y sal de la caverna",
    ["The targets are furbolgs."] =
        "Los objetivos son fúrbolgs.",
    ["With the coming hand-ins, this brings you to level 55."] =
        "Con las próximas entregas, esto te lleva a nivel 55.",
    ["A tough quest lies just ahead."] =
        "Se acerca una misión difícil.",
    ["Flee if things go badly."] =
        "Huye si las cosas van mal.",
    ["The NPC is a human spirit."] =
        "El PNJ es un espíritu humano.",
    ["The targets are leafless trees that walk."] =
        "Los objetivos son árboles sin hojas que caminan.",
    ["Slay the greenish beings of living water."] =
        "Mata a los seres verdosos de agua viva.",
    ["The targets are wolves and bears."] =
        "Los objetivos son lobos y osos.",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "Los objetivos son 3 fúrbolgs blancos que van en grupo.",
    ["The target patrols a long route beside the road."] =
        "El objetivo patrulla una larga ruta junto al camino.",
    ["Move on if you have not seen it once the trail ends."] =
        "Sigue adelante si no lo has visto al final del sendero.",
    ["Escort Ranshalla and guard her."] =
        "Escolta a Ranshalla y protégela.",
    ["Wait until the foes hit her before you strike."] =
        "Espera a que los enemigos la ataquen antes de atacar tú.",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "Aparecen cerca de 28.1, 35.0, en Cuna del Invierno.",
    ["You can also do dungeons until you hit level 56."] =
        "También puedes hacer mazmorras hasta llegar a nivel 56.",
    ["Give Nafien the items in sets of 5."] =
        "Dale los objetos a Nafien en lotes de 5.",
    ["Every full set you hand over earns 50 reputation."] =
        "Cada lote completo que entregas da 50 de reputación.",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "Sube tu reputación con el Bastión Fauces de Madera a Neutral",
    ["The NPC stands within the passage."] =
        "El PNJ está dentro del paso.",
    ["This foe is elite."] =
        "Este enemigo es élite.",
    ["Target Black Broodlings with the item."] =
        "Usa el objeto sobre los Black Broodlings.",
    ["A red crystal hovers over each body."] =
        "Sobre cada cuerpo flota un cristal rojo.",
    ["Hunt the huge red dragons."] =
        "Caza a los enormes dragones rojos.",
    ["Look for gray standing stones."] =
        "Busca menhires grises.",
    ["The target is an ogre."] =
        "El objetivo es un ogro.",
    ["Watch out, its blows are strong."] =
        "Cuidado, golpea fuerte.",
    ["The targets are wolves and orcs."] =
        "Los objetivos son lobos y orcos.",
    ["The NPC is an elderly human lady."] =
        "El PNJ es una anciana humana.",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "Si no está, puede estar en el piso de arriba de la casa, en 52.4, 42.1, en Ciudad de Ventormenta.",
    ["Walk over the rope bridge, then climb the trail"] =
        "Cruza el puente de cuerda y luego sube por el sendero",
    ["The Plaguelands"] =
        "Las Tierras de la Peste",
    ["Check each of the two floors indoors."] =
        "Mira en los dos pisos del interior.",
    ["Stand at the watchtower's doorway."] =
        "Ponte en la puerta de la atalaya.",
    ["An elite foe waits indoors; stay clear of it."] =
        "Dentro hay un enemigo élite; evítalo.",
    ["Spiders also appear at these spawn spots."] =
        "Las arañas también aparecen en estos puntos de aparición.",
    ["Look for a white set of bones."] =
        "Busca unos huesos blancos.",
    ["The targets appear in several places."] =
        "Los objetivos aparecen en varios sitios.",
    ["Finish Locked Away to obtain this."] =
        "Termina Locked Away para conseguirlo.",
    ["The target is a ghoul armed with a pitchfork."] =
        "El objetivo es un necrófago armado con una horca.",
    ["Elites roam close by; keep your distance."] =
        "Hay élites cerca; mantén las distancias.",
    ["Search the bones of a fallen person."] =
        "Registra los huesos de una persona caída.",
    ["The NPC is within the ruined home."] =
        "El PNJ está dentro de la casa en ruinas.",
    ["Search within the houses here."] =
        "Busca dentro de las casas de aquí.",
    ["Look for big yellow grubs."] =
        "Busca larvas amarillas grandes.",
    ["With the coming hand-ins, this gets you to level 58."] =
        "Con las próximas entregas, esto te lleva a nivel 58.",
    ["Flight master at Light's Hope Chapel"] =
        "Maestro de vuelo de la Capilla de la Esperanza de la Luz",
    ["Look for big rocks seeping green slime."] =
        "Busca rocas grandes que rezuman limo verde.",
    ["Progress westward as you go."] =
        "Avanza hacia el oeste sobre la marcha.",
    ["Other undead compete for the same spawn points."] =
        "Otros no-muertos comparten los mismos puntos de aparición.",
    ["The spirits rise where those foes die."] =
        "Los espíritus surgen donde mueren esos enemigos.",
    ["Go down into the tomb"] =
        "Baja a la tumba",
    ["This is below ground, on the crypt's lower floor."] =
        "Está bajo tierra, en el piso inferior de la cripta.",
    ["Your character must be seated first."] =
        "Primero tu personaje tiene que estar sentado.",
    ["Move the camera close and check which book is genuine."] =
        "Acerca la cámara y comprueba qué libro es el auténtico.",
    ["Some books are traps that summon foes."] =
        "Algunos libros son trampas que invocan enemigos.",
    ["The genuine book can look two ways:"] =
        "El libro auténtico puede tener dos aspectos:",
    ["Close to the big buildings lit in blue."] =
        "Cerca de los grandes edificios iluminados de azul.",
    ["A new one may appear when one is killed."] =
        "Puede aparecer otro cuando matas a uno.",
    ["The targets are in the ruined houses."] =
        "Los objetivos están en las casas en ruinas.",
    ["It shows up on top of the box."] =
        "Aparece encima de la caja.",
    ["Targets are in the tower and around its base."] =
        "Los objetivos están en la torre y alrededor de su base.",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "Si hay un élite en el tejado de la torre, espera fuera.",
    ["Pick up Claw (Rank 8) for your pet."] =
        "Consigue Garra (Rango 8) para tu mascota.",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "Domestica un Winterspring Screecher con el hechizo Domesticar bestia.",
    ["Hunt the white owls."] =
        "Caza a los búhos blancos.",
    ["Either the patriarch or the matriarch yetis work."] =
        "Sirven tanto los yetis patriarca como los matriarca.",
    ["Climb across the mountain to the far side"] =
        "Cruza la montaña hasta el otro lado",
    ["Hunt the chimaeras."] =
        "Caza a las quimeras.",
    ["Target Legacki with the item."] =
        "Usa el objeto sobre Legacki.",
    ["Target Sprinkle with it."] =
        "Úsalo sobre Sprinkle.",
    ["Target Quixxil with it."] =
        "Úsalo sobre Quixxil.",
    ["Flight master at Cenarion Hold"] =
        "Maestro de vuelo del Fuerte Cenarion",
    ["Watch out: killing them can summon more foes."] =
        "Cuidado: al matarlos pueden invocar más enemigos.",
    ["Look for fragments of rock that glow blue."] =
        "Busca fragmentos de roca que brillan en azul.",
    ["Roam the area where the insects swarm."] =
        "Recorre la zona donde se arremolinan los insectos.",
    ["Hunt the gray scorpids."] =
        "Caza a los escórpidos grises.",
    ["The target is an orc wearing violet robes."] =
        "El objetivo es un orco con túnica violeta.",
    ["It shows up around here."] =
        "Aparece por aquí.",
    ["Hunt the yellow scorpids."] =
        "Caza a los escórpidos amarillos.",
    ["Target the burrowing worms."] =
        "Ve a por los gusanos excavadores.",
    ["This number shrinks while you kill monsters."] =
        "Este número baja a medida que matas monstruos.",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "Lleva las plumas que recojas al PNJ en 64.8, 8.1.",
    ["The NPC stands outdoors, next to the crypt."] =
        "El PNJ está fuera, junto a la cripta.",
    ["The targets are bats."] =
        "Los objetivos son murciélagos.",
    ["Check in and around the structures."] =
        "Mira dentro y alrededor de las estructuras.",
    ["With the coming hand-ins, this gets you to level 5."] =
        "Con las próximas entregas, esto te lleva a nivel 5.",
    ["The target is a shambling zombie."] =
        "El objetivo es un zombi tambaleante.",
    ["The quest giver is an abomination."] =
        "El PNJ de misión es una abominación.",
    ["He may step off the road now and then to pick plants."] =
        "A veces se sale del camino para recoger plantas.",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "Sana al Guardia de la Muerte Kel con Sanación inferior (Rango 2).",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "Dale Palabra de poder: entereza al Guardia de la Muerte Kel.",
    ["The targets are gray, demon-like hounds."] =
        "Los objetivos son canes grises de aspecto demoníaco.",
    ["The targets are zombies."] =
        "Los objetivos son zombis.",
    ["Look for wilted violet weeds."] =
        "Busca hierbas violetas marchitas.",
    ["Walk the shoreline toward the southwest."] =
        "Camina por la orilla hacia el suroeste.",
    ["If the beach ends first, move on without it."] =
        "Si la playa se acaba antes, sigue adelante sin completarlo.",
    ["Keep to the trail as it curves."] =
        "Sigue el sendero por la curva.",
    ["Step into the flames."] =
        "Métete en las llamas.",
    ["Stay on the trail and keep climbing the steps"] =
        "Sigue el sendero y sube los escalones",
    ["Loot the gray chests built from metal."] =
        "Saquea los cofres grises de metal.",
    ["Search in and around the sunken wrecks."] =
        "Busca dentro y alrededor de los restos hundidos.",
    ["The target is a troll in crimson robes."] =
        "El objetivo es un trol con túnica carmesí.",
    ["Look for the skull-shaped objects."] =
        "Busca los objetos con forma de calavera.",
    ["The targets are clumps of purple eggs."] =
        "Los objetivos son grupos de huevos morados.",
    ["Search close to the trunks."] =
        "Busca cerca de los troncos.",
    ["Stay on the trail, then cross the tunnel"] =
        "Sigue el sendero y cruza el túnel",
    ["Traverse the passageway"] =
        "Atraviesa el pasadizo",
    ["Fly to Orgrimmar"] =
        "Vuela a Orgrimmar",
    ["The quest comes from a bounty sign."] =
        "La misión sale de un cartel de recompensa.",
    ["Look for an iron slab marked with a skull."] =
        "Busca una losa de hierro marcada con una calavera.",
    ["Use the item at the pink marking."] =
        "Usa el objeto en la marca rosa.",
    ["Move gradually northwest toward Agamand Mills."] =
        "Avanza poco a poco al noroeste hacia los Molinos de Agamand.",
    ["The target is a skeletal caster in armor."] =
        "El objetivo es un esqueleto lanzador de hechizos con armadura.",
    ["The target is a banshee."] =
        "El objetivo es un alma en pena.",
    ["The targets are skeletons in armor."] =
        "Los objetivos son esqueletos con armadura.",
    ["The targets are skeletal mages."] =
        "Los objetivos son esqueletos magos.",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "Junto con las próximas entregas, esto te sube al nivel 13.",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "El objetivo patrulla el camino de Rémol a El Sepulcro.",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "El objetivo aparece cerca de El Sepulcro, en 47.5, 39.8, en el Bosque de Argénteos.",
    ["Fight quilboars."] =
        "Lucha contra jabaespines.",
    ["Look for little brown pinecones."] =
        "Busca piñas marrones pequeñas.",
    ["Hunt the black-feathered birds."] =
        "Caza las aves de plumas negras.",
    ["Look for gray slabs of stone lying flat."] =
        "Busca losas de piedra grises tendidas en el suelo.",
    ["Do not trail after the wolf."] =
        "No sigas al lobo.",
    ["Take the lift to the top of Thunder Bluff"] =
        "Sube en el elevador hasta lo alto de Cima del Trueno",
    ["Beside the forge."] =
        "Junto a la forja.",
    ["Take a lift down out of Thunder Bluff"] =
        "Baja en un elevador para salir de Cima del Trueno",
    ["Aim the item at one Adult Plainstrider."] =
        "Apunta el objeto a un Adult Plainstrider.",
    ["Target a Prairie Stalker with it."] =
        "Úsalo sobre un Prairie Stalker.",
    ["Use the item on any Swoop."] =
        "Usa el objeto sobre cualquier Swoop.",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "Elige un animal de nivel 9-10 y conviértelo en tu mascota con el hechizo Domesticar bestia.",
    ["This pet is temporary; a lasting one comes shortly."] =
        "Esta mascota es temporal; pronto tendrás una permanente.",
    ["Flight master at Camp Taurajo"] =
        "Maestro de vuelo del Campamento Taurajo",
    ["Fly to Thunder Bluff"] =
        "Vuela a Cima del Trueno",
    ["Stick to the road and stay alert."] =
        "No te salgas del camino y mantente alerta.",
    ["Flight master at the Crossroads"] =
        "Maestro de vuelo de El Cruce",
    ["This is food for your pet."] =
        "Es comida para tu mascota.",
    ["A spirit shows up after this."] =
        "Después aparece un espíritu.",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "Encuentra un Venomtail Scorpid y usa Domesticar bestia sobre él.",
    ["Release your current pet before this."] =
        "Antes, abandona a tu mascota actual.",
    ["Here you tame a pet to keep."] =
        "Aquí domesticas una mascota para quedártela.",
    ["The NPC waits at the mountain's summit."] =
        "El PNJ espera en la cima de la montaña.",
    ["Kill Water Seekers and Thornweavers."] =
        "Mata a Water Seekers y Thornweavers.",
    ["The objective is at the far end."] =
        "El objetivo está al fondo.",
    ["Receive Sapta Sight"] =
        "Obtén Sapta Sight",
    ["The quest giver stands among the boulders."] =
        "El PNJ de misión está entre las rocas.",
    ["This NPC is found down in the Cleft of Shadow."] =
        "Este PNJ está abajo, en la Grieta de la Sombra.",
    ["This clears the quest's time limit."] =
        "Esto elimina el límite de tiempo de la misión.",
    ["Fly to Undercity"] =
        "Vuela a Entrañas",
    ["Orc and Troll start"] =
        "Inicio orco y trol",
    ["Stay out of the cave when you can."] =
        "Quédate fuera de la cueva si puedes.",
    ["The following step is out of the cave."] =
        "El siguiente paso está fuera de la cueva.",
    ["Look for a dark-shelled scorpion."] =
        "Busca un escorpión de caparazón oscuro.",
    ["Target Lazy Peons with the item."] =
        "Usa el objeto sobre los Lazy Peons.",
    ["The targets are dozing orcs."] =
        "Los objetivos son orcos adormilados.",
    ["Look for cacti bearing red fruit."] =
        "Busca cactus con frutos rojos.",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "Sana al Bruto Kor'ja con el rango 2 de Sanación inferior.",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "Dale Palabra de poder: entereza al Bruto Kor'ja.",
    ["Aim the item at one Dire Mottled Boar."] =
        "Apunta el objeto a un Dire Mottled Boar.",
    ["Use it on any Surf Crawler."] =
        "Úsalo sobre cualquier Surf Crawler.",
    ["Use it on any Armored Scorpid."] =
        "Úsalo sobre cualquier Armored Scorpid.",
    ["This leads to a quest for later levels."] =
        "Lleva a una misión para niveles más altos.",
    ["Escort Deathstalker Erland and keep him alive."] =
        "Escolta al Mortacechador Erland y mantenlo con vida.",
    ["Hunt the wolves whose fur is jet black."] =
        "Caza los lobos de pelaje negro azabache.",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "Elige un Ferocious Grizzled Bear y domestícalo con Domesticar bestia.",
    ["Fly to The Sepulcher"] =
        "Vuela a El Sepulcro",
    ["He has three ghouls at his side."] =
        "Lo acompañan tres necrófagos.",
    ["Hold off until one steps out, then slay it."] =
        "Espera a que salga uno y mátalo.",
    ["The target shows up here sooner or later."] =
        "El objetivo aparece aquí tarde o temprano.",
    ["The NPC is on Undercity's upper level."] =
        "El PNJ está en el nivel superior de Entrañas.",
    ["The NPC is in a little cave."] =
        "El PNJ está en una pequeña cueva.",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "El PNJ está pasada la gran sala de troggs, a su derecha.",
    ["The quest giver waits in the tent."] =
        "El PNJ de misión espera en la tienda.",
    ["Move on if it is absent."] =
        "Si no está, sigue adelante.",
    ["If it isn't there, hold on until it shows up."] =
        "Si no está, espera a que aparezca.",
    ["Circle the mountain by its northern flank."] =
        "Rodea la montaña por su ladera norte.",
    ["The target is a troll."] =
        "El objetivo es un trol.",
    ["The target is a human in a crimson long coat."] =
        "El objetivo es un humano con un abrigo largo carmesí.",
    ["The targets are the striped zhevras."] =
        "Los objetivos son las zhevras a rayas.",
    ["Go into the water beside the rock that bubbles."] =
        "Métete en el agua junto a la roca que burbujea.",
    ["Look for big blue fungi."] =
        "Busca hongos azules grandes.",
    ["Up to two foes might jump you."] =
        "Pueden atacarte hasta dos enemigos.",
    ["Kill the purple raptors."] =
        "Mata a los raptores morados.",
    ["Targets are found across the entire Barrens."] =
        "Los objetivos están repartidos por todos Los Baldíos.",
    ["Slay any you come across along the way."] =
        "Mata a los que encuentres por el camino.",
    ["With the coming hand-ins, this gets you to level 18."] =
        "Con las próximas entregas, esto te lleva al nivel 18.",
    ["Steal from Gamon using Pick Pocket."] =
        "Roba a Gamon con Robar.",
    ["Use it on Tazan's Satchel."] =
        "Úsalo sobre Tazan's Satchel.",
    ["The item is already in your inventory."] =
        "El objeto ya está en tu inventario.",
    ["Check the upper and lower tiers of the structure."] =
        "Mira en los niveles superior e inferior de la estructura.",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "Escolta a Wizzlecrank's Shredder y mantenlo intacto.",
    ["Look for gray steel pails."] =
        "Busca cubos de acero grises.",
    ["The target is a pale lion."] =
        "El objetivo es un león pálido.",
    ["It turns up in the area."] =
        "Aparece por la zona.",
    ["Keep away from Sister Rathtalon."] =
        "Mantente lejos de Sister Rathtalon.",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "El objetivo es una arpía de plumaje esmeralda; cuidado, es élite.",
    ["The target circles in the air, so search around."] =
        "El objetivo vuela en círculos, así que busca por la zona.",
    ["A small chest made of wood."] =
        "Un pequeño cofre de madera.",
    ["Polly is the target for the item."] =
        "Usa el objeto sobre Polly.",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "Derrota enemigos Kolkar alrededor del Oasis Estancado.",
    ["Sooner or later a yell shows up in the chat window."] =
        "Tarde o temprano aparece un grito en la ventana de chat.",
    ["Watch for his yell: I am summoned!"] =
        "Atento a su grito: ¡He sido invocado!",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "Verog llega tras un grito que reta a los intrusos a ir a su tienda a morir.",
    ["Escort Kaya Flathoof and keep her safe."] =
        "Escolta a Kaya Flathoof y mantenla a salvo.",
    ["Close to the finish, 3 foes ambush you together."] =
        "Cerca del final, 3 enemigos te emboscan a la vez.",
    ["Fly to Sun Rock Retreat"] =
        "Vuela al Refugio Roca del Sol",
    ["Gather the big, white eggs."] =
        "Recoge los huevos blancos grandes.",
    ["Monsters might jump you here."] =
        "Aquí pueden atacarte monstruos.",
    ["Hatchling spiders may bring a level 22 spider."] =
        "Las crías de araña pueden atraer una araña de nivel 22.",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "Junto con las próximas entregas, esto te sube al nivel 20.",
    ["Look for a kodo with grey hide."] =
        "Busca un kodo de piel gris.",
    ["The targets are big pink lizards."] =
        "Los objetivos son lagartos rosas grandes.",
    ["The targets are under the water and along the shore."] =
        "Los objetivos están bajo el agua y a lo largo de la orilla.",
    ["The target is a raptor."] =
        "El objetivo es un raptor.",
    ["Trade your Blood Shards to gain buffs."] =
        "Cambia tus Fragmentos de sangre por beneficios.",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "Mientras hagas misiones en Los Baldíos, cámbiale los Fragmentos de sangre que te sobren.",
    ["Ask him for the Spirit of the Wind buff"] =
        "Pídele el beneficio Spirit of the Wind",
    ["Hunt the winged serpents."] =
        "Caza las serpientes aladas.",
    ["Take the lift up into Thunder Bluff"] =
        "Sube en el elevador para entrar en Cima del Trueno",
    ["The object is a vase woven from wicker."] =
        "El objeto es un jarrón de mimbre.",
    ["They appear in scattered spots."] =
        "Aparecen en lugares dispersos.",
    ["Climb the mountainside"] =
        "Sube por la ladera de la montaña",
    ["Descend the slope"] =
        "Baja la pendiente",
    ["Drop with care onto the rock, then go into the cave"] =
        "Déjate caer con cuidado sobre la roca y entra en la cueva",
    ["The targets are oozes."] =
        "Los objetivos son mocos.",
    ["Look for little green shrubs bearing violet blooms."] =
        "Busca arbustos verdes pequeños con flores violetas.",
    ["A centaur flanked by two bodyguards."] =
        "Un centauro escoltado por dos guardaespaldas.",
    ["Climb the trail and cross the peaks"] =
        "Sube por el sendero y cruza los picos",
    ["Look for a robot shaped like a person."] =
        "Busca un robot con forma humana.",
    ["The target appears right here."] =
        "El objetivo aparece justo aquí.",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "Toma el pasaje y sigue el rastro de faroles hasta Vallefresno",
    ["Stay clear of Astranaar."] =
        "Mantente lejos de Astranaar.",
    ["Exit the tunnel into Ashenvale"] =
        "Sal del túnel hacia Vallefresno",
    ["Flight master at Zoram'gar Outpost"] =
        "Maestro de vuelo de la Avanzada de Zoram'gar",
    ["The NPC waits within the hut."] =
        "El PNJ espera dentro de la choza.",
    ["Use it twice on Taskmaster Fizzule."] =
        "Úsalo dos veces sobre Taskmaster Fizzule.",
    ["A short way north of here."] =
        "Un poco al norte de aquí.",
    ["Target Taskmaster Fizzule and salute him."] =
        "Selecciona a Taskmaster Fizzule y hazle el saludo militar.",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "Usa Robar sobre Foreman Silixiz.",
    ["Open with Ambush for a bigger hit."] =
        "Abre con Emboscada para un golpe más fuerte.",
    ["Lean on Rupture for bonus damage."] =
        "Usa Ruptura para infligir daño extra.",
    ["Eviscerate adds a burst of damage here."] =
        "Eviscerar añade aquí una ráfaga de daño.",
    ["The objective is on the terrace above."] =
        "El objetivo está en la terraza de arriba.",
    ["Use Pick Lock to open it."] =
        "Usa Forzar cerradura para abrirlo.",
    ["Poison crafting needs these."] =
        "Los necesitas para fabricar venenos.",
    ["Flight master at Tarren Mill"] =
        "Maestro de vuelo de Molino Tarren",
    ["Get rid of your Touch of Zanzil."] =
        "Quítate el Touch of Zanzil.",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "Elige cualquier Gray Bear y usa Domesticar bestia sobre él.",
    ["Go into Durnholde Keep, then over the bridge"] =
        "Entra en el Castillo de Durnholde y cruza el puente",
    ["Look for it bound to the orc's leg."] =
        "Búscalo atado a la pierna del orco.",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "Junto con las próximas entregas, esto te sube al nivel 23.",
    ["Indoors or out in the open fields."] =
        "Dentro de los edificios o en campo abierto.",
    ["It may be found outdoors too."] =
        "También puede estar al aire libre.",
    ["The NPC is a little wolf."] =
        "El PNJ es un lobo pequeño.",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "Al entregar la misión, se vuelve loco y te ataca.",
    ["A woman holding a pitchfork."] =
        "Una mujer con una horca.",
    ["The target patrols the trail between the houses."] =
        "El objetivo patrulla el sendero entre las casas.",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "El objetivo aparece en 30.5, 40.6, en las Laderas de Trabalomas.",
    ["With the coming hand-ins, this brings you to level 24."] =
        "Con las próximas entregas, esto te sube al nivel 24.",
    ["Tougher foes are coming up next."] =
        "A continuación vienen enemigos más duros.",
    ["Some may be in the smithy."] =
        "Puede que algunos estén en la herrería.",
    ["The NPC is in the yard where black wolves roam."] =
        "El PNJ está en el patio donde merodean lobos negros.",
    ["Do this once the prisoner is free."] =
        "Hazlo cuando el prisionero esté libre.",
    ["The tome is blue, resting on a bookshelf."] =
        "El tomo es azul y está en una estantería.",
    ["Look in the room where Fenrus is."] =
        "Busca en la sala donde está Fenrus.",
    ["The target is a dinosaur with blue hide."] =
        "El objetivo es un dinosaurio de piel azul.",
    ["Look for big boulders oozing green fluid."] =
        "Busca grandes rocas que rezuman un líquido verde.",
    ["The target is a quilboar robed in red."] =
        "El objetivo es un jabaespín con túnica roja.",
    ["Kill Stalkers and Pathfinders."] =
        "Mata a acechadores y exploradores.",
    ["The target is a red winged serpent."] =
        "El objetivo es una serpiente alada roja.",
    ["The target roams; check the area."] =
        "El objetivo deambula; busca por la zona.",
    ["Keep some range when you use the item."] =
        "Mantén algo de distancia al usar el objeto.",
    ["With the coming hand-ins, this gets you to level 25."] =
        "Con las próximas entregas, esto te lleva al nivel 25.",
    ["Fly to Brackenwall Village"] =
        "Vuela al Poblado Murohelecho",
    ["The target is an aquatic dinosaur."] =
        "El objetivo es un dinosaurio acuático.",
    ["The target roams through the water."] =
        "El objetivo deambula por el agua.",
    ["The target is beneath the platform."] =
        "El objetivo está debajo de la plataforma.",
    ["The target stands atop the timber platform."] =
        "El objetivo está encima de la plataforma de madera.",
    ["Exit Windshear Crag"] =
        "Sal de Windshear Crag",
    ["The targets are deer."] =
        "Los objetivos son ciervos.",
    ["The targets are tiny blue dragons."] =
        "Los objetivos son dragones azules diminutos.",
    ["Hunt the green slimes."] =
        "Caza los mocos verdes.",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "Los Corrosive Sap Beasts usan los mismos puntos de aparición.",
    ["Do not engage Sentinel Amarassan."] =
        "No te enfrentes a la Centinela Amarassan.",
    ["The quarry is a kaldorei elite, level 27."] =
        "La presa es un kaldorei élite de nivel 27.",
    ["Exit Stonetalon Peak"] =
        "Sal de la Cima del Espolón",
    ["Look for brown pinecones on the ground."] =
        "Busca piñas marrones en el suelo.",
    ["Steer clear of the elite windstrider."] =
        "Evita al windstrider élite.",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "Los basiliscos y los árboles andantes comparten estos puntos de aparición.",
    ["Monsters are found throughout the Charred Vale."] =
        "Hay monstruos por todo Charred Vale.",
    ["Take the trail toward Sun Rock Retreat"] =
        "Toma el sendero hacia el Refugio Roca del Sol",
    ["Stay on the trail until the Charred Vale"] =
        "Sigue el sendero hasta Charred Vale",
    ["The NPC is on the tower's middle floor."] =
        "El PNJ está en el piso intermedio de la torre.",
    ["Flight master at Splintertree Post"] =
        "Maestro de vuelo del Puesto del Hachazo",
    ["The targets are night elves hiding in stealth."] =
        "Los objetivos son elfos de la noche ocultos en sigilo.",
    ["Track Hidden makes them simpler to spot."] =
        "Rastrear ocultos te ayuda a verlos.",
    ["Escort Torek and guard him."] =
        "Escolta a Torek y protégelo.",
    ["Don't let him die."] =
        "No dejes que muera.",
    ["Take the riverside trail, then climb this trail"] =
        "Toma el sendero junto al río y sube por este sendero",
    ["The target is a panther with black fur."] =
        "El objetivo es una pantera de pelaje negro.",
    ["The target roams a wide route."] =
        "El objetivo recorre una ruta amplia.",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "El objetivo aparece cerca de 62.4, 50.0, en Vallefresno.",
    ["Take the trail north into Thistlefur Hold"] =
        "Toma el sendero al norte hasta Thistlefur Hold",
    ["Search the brown crates built of timber."] =
        "Registra las cajas marrones de madera.",
    ["Mostly on the cavern's upper level."] =
        "Sobre todo en el nivel superior de la caverna.",
    ["The NPC is on the cave's lowest level."] =
        "El PNJ está en el nivel más bajo de la cueva.",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "Escolta a Ruul Snowhoof y mantenlo con vida.",
    ["Look for a gray druid-style bear."] =
        "Busca un oso gris de aspecto druídico.",
    ["The target is a watery being tinted a deeper green."] =
        "El objetivo es un ser de agua de un verde más oscuro.",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "Junto con las próximas entregas, esto te sube al nivel 28.",
    ["Steer away from Silverwind Refuge."] =
        "Evita Silverwind Refuge.",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "Sube por el sendero y vuelve por el camino al Puesto del Hachazo",
    ["Escort Muglash and keep him safe."] =
        "Escolta a Muglash y mantenlo a salvo.",
    ["If the item isn't usable yet, hold on a moment."] =
        "Si aún no puedes usar el objeto, espera un momento.",
    ["Go into the Blackfathom Deeps instance"] =
        "Entra en la instancia Cavernas de Brazanegra",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "En Cavernas de Brazanegra lo sueltan las nagas enemigas.",
    ["The targets are all over the tunnels."] =
        "Los objetivos están por todos los túneles.",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "Recoge los fragmentos azules de las paredes de la caverna en Cavernas de Brazanegra.",
    ["Head to the Moonshrine Ruins for this."] =
        "Para esto, ve a Moonshrine Ruins.",
    ["Head back to Splintertree Post"] =
        "Vuelve al Puesto del Hachazo",
    ["Your quarry is a huge azure bird of level 31."] =
        "Tu presa es un enorme pájaro azul de nivel 31.",
    ["The target circles over a wide area."] =
        "El objetivo vuela en círculos sobre una zona amplia.",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "Aparece cerca de 78.0, 66.0, en Vallefresno.",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "Baja en un elevador a Las Mil Agujas, sigue el camino hacia el Poblado Viento Libre y vuelve a subir en un elevador",
    ["Fly to Freewind Post"] =
        "Vuela al Poblado Viento Libre",
    ["A pair of level 30 foes stand guard over it."] =
        "Lo vigilan dos enemigos de nivel 30.",
    ["Use the teleporter to reach the Plateau"] =
        "Usa el teletransportador para llegar a la meseta",
    ["Go back to Dorn Plainstalker"] =
        "Vuelve con Dorn Plainstalker",
    ["This won't kill you."] =
        "Esto no te matará.",
    ["Kill Surveyors and Diggers."] =
        "Mata a agrimensores y excavadores.",
    ["Take the lift upward"] =
        "Sube en el elevador",
    ["Look for big eggs."] =
        "Busca huevos grandes.",
    ["Keep away from Heartrazor."] =
        "Mantente lejos de Heartrazor.",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap es una hiena marrón escoltada por 2 hienas.",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "El objetivo aparece cerca de 17.3, 22.2, en Las Mil Agujas.",
    ["The target is a centaur, black in color."] =
        "El objetivo es un centauro negro.",
    ["It roams a wide route."] =
        "Recorre una ruta amplia.",
    ["Leave it out if you'd rather not hunt for it."] =
        "Sáltatelo si prefieres no buscarlo.",
    ["His patrol crosses this spot two times."] =
        "Su patrulla pasa dos veces por este punto.",
    ["Expect three foes to strike."] =
        "Prepárate para el ataque de tres enemigos.",
    ["Fight off the foes that come at you"] =
        "Repele a los enemigos que te atacan",
    ["Look for thorny plants."] =
        "Busca plantas espinosas.",
    ["Hard quests are coming up."] =
        "Se acercan misiones difíciles.",
    ["Climb the trail and cross the rope bridges"] =
        "Sube por el sendero y cruza los puentes de cuerda",
    ["The objective lies atop the mesa."] =
        "El objetivo está en lo alto de la meseta.",
    ["The target is a level 28 elite."] =
        "El objetivo es un élite de nivel 28.",
    ["You can defeat it alone without much trouble."] =
        "Puedes derrotarlo tú solo sin mucho problema.",
    ["Escort Lakota Windsong safely to the end."] =
        "Escolta a Lakota Windsong sana y salva hasta el final.",
    ["On every plateau, a pair of foes spawns."] =
        "En cada meseta aparecen dos enemigos.",
    ["Be ready: this opponent is an elite at level 30."] =
        "Prepárate: este rival es un élite de nivel 30.",
    ["Leave it if it proves too hard."] =
        "Déjalo si resulta demasiado difícil.",
    ["Climb the road into Feralas"] =
        "Sube por el camino hasta Feralas",
    ["Should you die, come back to life at Camp Mojache."] =
        "Si mueres, resucita en el Campamento Mojache.",
    ["Fly to Camp Mojache"] =
        "Vuela al Campamento Mojache",
    ["Get Water Sapta done as well."] =
        "Completa también Water Sapta.",
    ["You'll need this to pick up an upcoming quest."] =
        "Lo necesitarás para aceptar una misión más adelante.",
    ["Leap up and take the trail behind that tree"] =
        "Salta arriba y toma el sendero detrás de ese árbol",
    ["Head north along the river to reach the NPC."] =
        "Ve al norte siguiendo el río para llegar al PNJ.",
    ["Draw foes one at a time if you can."] =
        "Atrae a los enemigos de uno en uno si puedes.",
    ["Do not take on the whole group together."] =
        "No te enfrentes a todo el grupo a la vez.",
    ["Descend the ramp, then stay on the trail"] =
        "Baja la rampa y sigue el sendero",
    ["Climb the trail to the cave's highest level"] =
        "Sube por el sendero hasta el nivel más alto de la cueva",
    ["When nearly dead, it calls two guards."] =
        "Cuando está a punto de morir, llama a dos guardias.",
    ["Warden Belamoore stands guard over it."] =
        "Lo vigila Warden Belamoore.",
    ["The target is a mage of level 36."] =
        "El objetivo es un mago de nivel 36.",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "Lucha contra Kegan y córtale la línea de visión con puertas y escaleras.",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "Mientras los Shield Guards brillen, no los ataques cuerpo a cuerpo.",
    ["Expect heavy damage from it."] =
        "Te hará mucho daño.",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "Junto con las próximas entregas, esto te sube al nivel 32.",
    ["Gather the big fungi."] =
        "Recoge los hongos grandes.",
    ["The targets are out in front of the cavern."] =
        "Los objetivos están delante de la caverna.",
    ["Flight master at Hammerfall"] =
        "Maestro de vuelo de Sentencia",
    ["Stay away from Refuge Pointe."] =
        "Mantente lejos del Refugio de la Zaga.",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "Junto con las próximas entregas, esto te sube al nivel 33.",
    ["Head out of the Apothecarium"] =
        "Sal del Apothecarium",
    ["Hive Drones compete for these spawn points."] =
        "Los Hive Drones compiten por estos puntos de aparición.",
    ["The NPC is on the building's ground level."] =
        "El PNJ está en la planta baja del edificio.",
    ["The quest giver is in the Dormitory."] =
        "El PNJ de misión está en la zona de dormitorios.",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "Escolta a Kernobee hasta el portal de la entrada de la mazmorra.",
    ["Open the gray chest built of metal."] =
        "Abre el cofre gris de metal.",
    ["Close to the north wall."] =
        "Cerca del muro norte.",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "Está en la misma sala que Mekgineer Thermaplugg.",
    ["Plan on killing monsters for quite some time."] =
        "Cuenta con matar monstruos durante un buen rato.",
    ["Other satyrs use the same spawn points."] =
        "Otros sátiros usan los mismos puntos de aparición.",
    ["Take the trail toward Shadowprey Village"] =
        "Toma el sendero hacia la Aldea Cazasombras",
    ["Fly to Shadowprey Village"] =
        "Vuela a la Aldea Cazasombras",
    ["Defeat every foe in this chamber before starting."] =
        "Antes de empezar, derrota a todos los enemigos de esta sala.",
    ["Target Burning Blade foes with the item."] =
        "Usa el objeto sobre enemigos del Filo Ardiente.",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "Espera a que el enemigo esté muy herido y entonces úsalo.",
    ["Look for big white clams."] =
        "Busca almejas blancas grandes.",
    ["Flight master at Grom'gol"] =
        "Maestro de vuelo de Grom'gol",
    ["They appear in the same spots as the panthers."] =
        "Aparecen en los mismos puntos que las panteras.",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "Atento a los Shadowmaw Panthers; van ocultos en sigilo.",
    ["Tigers compete for the same spawn points."] =
        "Los tigres compiten por los mismos puntos de aparición.",
    ["The NPC is on the building's lowest floor"] =
        "El PNJ está en la planta más baja del edificio",
    ["Climb the steps"] =
        "Sube los escalones",
    ["You won't find an ammunition seller."] =
        "No encontrarás vendedor de munición.",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "Protege a \"Stinky\" Ignatz mientras lo escoltas.",
    ["Hunt the orange spiders."] =
        "Caza las arañas naranjas.",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "Cuidado: los Darkfang Lurkers se ocultan en sigilo.",
    ["Escort Ogron, guarding him from attackers."] =
        "Escolta a Ogron y protégelo de los atacantes.",
    ["Keep out of Theramore Isle."] =
        "No entres en la Isla Theramore.",
    ["Let yourself drown for a quick trip."] =
        "Déjate ahogar para viajar rápido.",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "Guárdalo: lo pide la cadena de misiones del arma de Torbellino del guerrero.",
    ["Alterac and Arathi"] =
        "Alterac y Arathi",
    ["Get ready to take down an elite of level 40 shortly."] =
        "Prepárate: pronto tendrás que derrotar a un élite de nivel 40.",
    ["Quaff one potion right away so it is ready again later."] =
        "Bébete una poción ya para que vuelva a estar lista más tarde.",
    ["It wanders to the mouth of the cave."] =
        "Deambula hasta la entrada de la cueva.",
    ["Look on the upper floor as well."] =
        "Mira también en el piso de arriba.",
    ["Climb the slope, then leap the wall"] =
        "Sube la pendiente y salta el muro",
    ["Fly to Kargath"] =
        "Vuela a Kargath",
    ["Stranglethorn and Swamp of Sorrows"] =
        "Tuercespina y Pantano de las Penas",
    ["Go along the shore, then climb the trail"] =
        "Ve por la orilla y sube por el sendero",
    ["Keep clear of Darkshire."] =
        "Mantente lejos de Villa Oscura.",
    ["Flight master at Stonard"] =
        "Maestro de vuelo de Rocal",
    ["Look for assorted little brown items."] =
        "Busca objetos marrones pequeños de varios tipos.",
    ["Look for purple rings made of rock."] =
        "Busca anillos de roca morados.",
    ["A guardian shows up."] =
        "Aparece un guardián.",
    ["Stay clear of Lord Azrethoc."] =
        "Mantente lejos de Lord Azrethoc.",
    ["An elite winged fiend of level 40 with brown hide."] =
        "Un maligno alado élite de nivel 40, de piel marrón.",
    ["The target wanders close by; look around."] =
        "El objetivo deambula cerca; busca por los alrededores.",
    ["You can handle this alone without much trouble."] =
        "Puedes con esto tú solo sin mucho problema.",
    ["A tougher foe is coming up."] =
        "Se acerca un enemigo más duro.",
    ["Grab the loot."] =
        "Recoge el botín.",
    ["The target is a crocodile with white scales."] =
        "El objetivo es un cocodrilo de escamas blancas.",
    ["The target roams a wide loop through the water."] =
        "El objetivo recorre un amplio circuito por el agua.",
    ["Accepting this starts a 2 hour countdown."] =
        "Al aceptarla empieza una cuenta atrás de 2 horas.",
    ["The timer keeps running while you're offline."] =
        "El tiempo sigue corriendo aunque te desconectes.",
    ["Take this quest only when you have time to spare."] =
        "Acepta esta misión solo cuando tengas tiempo de sobra.",
    ["Watch out for a pair of stronger monsters here."] =
        "Cuidado con dos monstruos más fuertes aquí.",
    ["Look for the NPC dressed in red armor."] =
        "Busca al PNJ con armadura roja.",
    ["Climb the trail to Gordunni Outpost"] =
        "Sube por el sendero hasta la Avanzada Gordunni",
    ["Beside the shining blue rings on the ground."] =
        "Junto a los anillos azules brillantes del suelo.",
    ["Look for earth mounds that pop up."] =
        "Busca montículos de tierra que aparecen.",
    ["Ones holding the quest item shine blue."] =
        "Los que tienen el objeto de misión brillan en azul.",
    ["Fight the tauren."] =
        "Lucha contra los tauren.",
    ["The target is a winged green bug, level 47."] =
        "El objetivo es un insecto verde alado de nivel 47.",
    ["You can likely beat it at your current level."] =
        "Probablemente puedas vencerlo con tu nivel actual.",
    ["Kill bugs."] =
        "Mata insectos.",
    ["Extra targets lurk in the bug caverns."] =
        "Hay más objetivos en las cavernas de insectos.",
    ["Stay on the road"] =
        "Sigue el camino",
    ["The targets are ghosts that materialize."] =
        "Los objetivos son fantasmas que se materializan.",
    ["No drops come from Stagwings and Skystormers."] =
        "Los Stagwings y los Skystormers no lo sueltan.",
    ["Saves you some monster farming afterward."] =
        "Así te ahorras matar monstruos después.",
    ["You need Chapter I as well as Chapter II."] =
        "Necesitas el Capítulo I y también el Capítulo II.",
    ["It doesn't show up often."] =
        "No aparece a menudo.",
    ["The NPC waits on the house's upper-floor terrace."] =
        "El PNJ espera en la terraza del piso de arriba de la casa.",
    ["Take the road until the trail starts"] =
        "Sigue el camino hasta donde empieza el sendero",
    ["Circle the mountain on the trail, then climb it"] =
        "Rodea la montaña por el sendero y luego súbela",
    ["Kill the crocodiles."] =
        "Mata a los cocodrilos.",
    ["Stay out of Swamp Talker's way."] =
        "No te cruces con Swamp Talker.",
    ["Hunt down the gray murloc; it is level 50."] =
        "Caza al múrloc gris; es de nivel 50.",
    ["Tanaris and Dustwallow"] =
        "Tanaris y Revolcafango",
    ["Watch out for foes hidden in stealth."] =
        "Cuidado con los enemigos ocultos en sigilo.",
    ["Look for brown eggs covered in spikes."] =
        "Busca huevos marrones cubiertos de púas.",
    ["Buy plenty of arrows or bullets."] =
        "Compra muchas flechas o balas.",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "Abastécete antes: en las Tierras del Interior nadie vende flechas ni balas de nivel 40.",
    ["Take the road that circles the peak, then descend the trail"] =
        "Toma el camino que rodea el pico y baja por el sendero",
    ["Flight master at Revantusk Village"] =
        "Maestro de vuelo del Poblado Sañadiente",
    ["A trio of enemies attacks."] =
        "Te atacan tres enemigos.",
    ["Look for a little silver pail holding tools."] =
        "Busca un pequeño cubo plateado con herramientas.",
    ["The targets are big eagle-like beasts."] =
        "Los objetivos son grandes bestias parecidas a águilas.",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "Los lobos y los lechúcicos también usan estos puntos de aparición.",
    ["Look for crates made of wood."] =
        "Busca cajas de madera.",
    ["The targets are wolves hidden in stealth."] =
        "Los objetivos son lobos ocultos en sigilo.",
    ["Steer clear of hostile Alliance NPCs."] =
        "Evita a los PNJ hostiles de la Alianza.",
    ["Warning: this turns on your PvP flag."] =
        "Atención: esto activa tu marca JcJ.",
    ["Head into Shadra'Alor"] =
        "Entra en Shadra'Alor",
    ["Get out of Shadra'Alor"] =
        "Sal de Shadra'Alor",
    ["Feralas and Un'Goro"] =
        "Feralas y Un'Goro",
    ["The targets are hippogryphs."] =
        "Los objetivos son hipogrifos.",
    ["Use it on the stone giant foes."] =
        "Úsalo sobre los gigantes de piedra enemigos.",
    ["You have 2 hours before it disappears."] =
        "Tienes 2 horas antes de que desaparezca.",
    ["Watch out: this foe is a level 50 elite."] =
        "Cuidado: este enemigo es un élite de nivel 50.",
    ["You can likely do it alone."] =
        "Probablemente puedas hacerlo tú solo.",
    ["The NPC turns hostile and fights you."] =
        "El PNJ se vuelve hostil y te ataca.",
    ["The target yields at roughly 30% health."] =
        "El objetivo se rinde con alrededor del 30% de salud.",
    ["The NPC roams the trail close to Kargath."] =
        "El PNJ recorre el sendero cerca de Kargath.",
    ["The NPC gives the quest only while at this spot."] =
        "El PNJ solo da la misión cuando está en este punto.",
    ["If the NPC is away, stay until he comes back."] =
        "Si el PNJ no está, espera a que vuelva.",
    ["Burning Steppes and Azshara"] =
        "Las Estepas Ardientes y Azshara",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "Cruza la Montaña Roca Negra hasta Las Estepas Ardientes",
    ["Fly to Flame Crest"] =
        "Vuela a Cresta de la Llama",
    ["It lies atop a stone slab."] =
        "Está sobre una losa de piedra.",
    ["The following quest needs you at level 52."] =
        "La siguiente misión requiere nivel 52.",
    ["Ammunition can't be bought here."] =
        "Aquí no se puede comprar munición.",
    ["Flight master at Valormok"] =
        "Maestro de vuelo de Valormok",
    ["Look for a rectangular slab etched with green glyphs."] =
        "Busca una losa rectangular grabada con glifos verdes.",
    ["Look for an oblong slab carved with pink glyphs."] =
        "Busca una losa alargada tallada con glifos rosas.",
    ["A rectangular slab carved with blue glyphs."] =
        "Una losa rectangular tallada con glifos azules.",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "Busca una losa de roca tallada con glifos dorados.",
    ["The NPC is in the tower, which has several floors."] =
        "El PNJ está en la torre, que tiene varios pisos.",
    ["Felwood and Winterspring"] =
        "Frondavil y Cuna del Invierno",
    ["Walk west beside the river"] =
        "Camina al oeste junto al río",
    ["Fly to Bloodvenom Post"] =
        "Vuela al Puesto del Veneno",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "Junto con las próximas entregas, esto te sube al nivel 53.",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "Guárdalo para una misión posterior en el Cráter de Un'Goro.",
    ["Get onto the massive incline."] =
        "Sube a la enorme pendiente.",
    ["Watch out for elite foes here."] =
        "Cuidado con los enemigos élite aquí.",
    ["Flee afterward."] =
        "Después, huye.",
    ["More than one crystal might be required."] =
        "Puede que necesites más de un cristal.",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "Cuando está muy herido, el objetivo llama a gritos a Magus Rimtori.",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "Al usarlo aparece un felino verde, un Corrupted Saber.",
    ["Hold on until it begins to trail you."] =
        "Espera a que empiece a seguirte.",
    ["The kitten is the green cat beside you."] =
        "El gatito es el felino verde que está a tu lado.",
    ["Look beside Winna Hazzard."] =
        "Busca junto a Winna Hazzard.",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "Caza una tortuga élite de nivel 48 con caparazón azul.",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "El PNJ lleva una camisa clara y una lámpara.",
    ["Elite human foes walk patrols here; stay clear."] =
        "Aquí patrullan enemigos humanos élite; mantente lejos.",
    ["The NPC hides beneath the staircase."] =
        "El PNJ se esconde bajo la escalera.",
    ["You can also take it out of your bank."] =
        "También puedes sacarlo del banco.",
    ["The target is a ghoul armed with a hayfork."] =
        "El objetivo es un necrófago armado con una horca.",
    ["It can appear at this spot."] =
        "Puede aparecer en este punto.",
    ["One last lengthy stretch of monster farming."] =
        "Un último tramo largo matando monstruos.",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "Guárdalo; una tarea en el Cráter de Un'Goro lo pedirá más adelante.",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "A Dalaran se llega por el portal skyborne.",
    ["Take the Skyborne portal to Stormwind"] =
        "Toma el portal skyborne a Ventormenta",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "Saco de dormir acogedor",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "Un rastro de pistas en los dos continentes, desde el nivel 14, que termina en un saco de dormir que da hasta un 3 % más de experiencia: sin combates, solo objetos que pulsar.",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "Páramos de Poniente, al oeste de la Colina del Centinela: los restos quemados junto a la carreta destrozada.",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "Los Baldíos, junto al camino al sur del Campamento Taurajo: los restos quemados al pie de la torre calcinada.",
    ["Horde land: stay clear of the guards."] =
        "Territorio de la Horda: evita a los guardias.",
    ["Alliance land: stay clear of the guards."] =
        "Territorio de la Alianza: evita a los guardias.",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "Justo ahí: la siguiente pista, en los restos o en la tabla clavada al lado.",
    ["Path northeast of Sun Rock Retreat"] =
        "Sendero al noreste del Refugio Roca del Sol",
    ["The camp is up in the hills: follow this path west."] =
        "El campamento está en lo alto de las colinas: sigue este sendero hacia el oeste.",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "Al final del sendero, en el campamento abandonado: el saco de dormir sobre una caja.",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "Opcional: la madera y la yesca de esta recompensa reavivan la hoguera de al lado, una pequeña misión que el saco no necesita.",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "Colina arriba, al norte del campamento: un montón de tierra fresca.",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "Loch Modan, en lo alto de la presa: la figurilla de águila sobre las cabezas de piedra talladas que miran a Los Humedales.",
    ["Cart against Thoradin's Wall"] =
        "Carreta junto a la Muralla de Thoradin",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "Por el lado de las Laderas de Trabalomas: sube a la carreta y luego al interior de la muralla.",
    ["The messenger bag hangs on the outer face of the wall."] =
        "La bolsa de mensajero cuelga en la cara exterior de la muralla.",
    ["The satchel just below it holds the sleeping bag."] =
        "La cartera justo debajo contiene el saco de dormir.",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "Úsalo al aire libre y quédate encima sin moverte: cada minuto de sueño suma un 1 % de experiencia, hasta un 3 %.",
    ["Try the sleeping bag"] =
        "Prueba el saco de dormir",
}
