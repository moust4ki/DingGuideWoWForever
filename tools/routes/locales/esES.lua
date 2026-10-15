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
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "Gilshalan pide nivel 3: si aún no lo tienes, Ding! te avisará antes de la cueva.",
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
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "Saquea las bestias que mates de camino aquí",
    ["Learn First Aid from the trainer"] =
        "Aprende Primeros auxilios con el instructor",
    ["Learn Blacksmithing from the trainer"] =
        "Aprende Herrería con el instructor",
    ["Learn Mining from the trainer"] =
        "Aprende Minería con el instructor",
    ["Learn Cooking from the trainer"] =
        "Aprende Cocina con el instructor",
    ["Learn Herbalism from the trainer"] =
        "Aprende Herboristería con el instructor",
    ["Learn Thrown at the weapon master"] =
        "Aprende Armas arrojadizas con el maestro de armas",
    ["Learn Staves at the weapon master"] =
        "Aprende Bastones con el maestro de armas",
    ["Learn Swords at the weapon master"] =
        "Aprende Espadas con el maestro de armas",
    ["Learn Maces at the weapon master"] =
        "Aprende Mazas con el maestro de armas",
    ["Learn Bows at the weapon master"] =
        "Aprende Arcos con el maestro de armas",
    ["Learn Guns at the weapon master"] =
        "Aprende Armas de fuego con el maestro de armas",
    ["Learn Two-Handed Swords at the weapon master"] =
        "Aprende Espadas de dos manos con el maestro de armas",
    ["Learn Two-Handed Axes at the weapon master"] =
        "Aprende Hachas de dos manos con el maestro de armas",
    ["Learn Two-Handed Maces at the weapon master"] =
        "Aprende Mazas de dos manos con el maestro de armas",
    ["Learn Swords and Daggers at the weapon master"] =
        "Aprende Espadas y Dagas con el maestro de armas",
    ["Learn Swords and Staves at the weapon master"] =
        "Aprende Espadas y Bastones con el maestro de armas",
    ["Learn Bows and Staves at the weapon master"] =
        "Aprende Arcos y Bastones con el maestro de armas",
    ["Learn Guns and Maces at the weapon master"] =
        "Aprende Armas de fuego y Mazas con el maestro de armas",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "Aprende Armas de fuego y Hachas de dos manos con el maestro de armas",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "Aprende Espadas de dos manos y Bastones con el maestro de armas",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Aprende Hachas de dos manos y Mazas de dos manos con el maestro de armas",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "Aprende Mazas de dos manos y Bastones con el maestro de armas",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "Aprende Ballestas y Espadas de dos manos con el maestro de armas",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Aprende Armas de fuego, Hachas de dos manos y Mazas de dos manos con el maestro de armas",
    ["Tame a pet here"] =
        "Domestica una mascota aquí",
    ["Tame a beast here to learn the next rank of Claw"] =
        "Domestica aquí una bestia para aprender el siguiente rango de Garra",
    ["Head to the big cage"] =
        "Ve a la jaula grande",
    ["Visit the caged quilboar"] =
        "Visita al jabaespín enjaulado",
    ["Go to the corrupted moonwell"] =
        "Ve al pozo de la luna corrupto",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "El objeto está dentro.",
    ["The object is indoors, one floor up."] =
        "El objeto está dentro, un piso más arriba.",
    ["The object is on the lower level, indoors."] =
        "El objeto está en el nivel inferior, dentro.",
    ["The object is on the lower level within the bridge."] =
        "El objeto está en el nivel inferior, dentro del puente.",
    ["The object is on the highest level of this structure."] =
        "El objeto está en el nivel más alto de esta estructura.",
    ["The object is up on the summit."] =
        "El objeto está arriba, en la cima.",
    ["The object sits on the rocky shelf above."] =
        "El objeto está en la repisa rocosa de arriba.",
    ["The target is indoors."] =
        "El objetivo está dentro.",
    ["The target is indoors, one floor up."] =
        "El objetivo está dentro, un piso más arriba.",
    ["The target is indoors at street level."] =
        "El objetivo está dentro, a pie de calle.",
    ["The target is indoors, on the central storey."] =
        "El objetivo está dentro, en el piso central.",
    ["The target is on the lower level, indoors."] =
        "El objetivo está en el nivel inferior, dentro.",
    ["The target is on the tower's highest floor."] =
        "El objetivo está en el piso más alto de la torre.",
    ["The target is up on the summit."] =
        "El objetivo está arriba, en la cima.",
    ["The target is down in the Cleft of Shadow."] =
        "El objetivo está abajo, en la Grieta de la Sombra.",
    ["The target can be indoors or out."] =
        "El objetivo puede estar dentro o fuera.",
    ["The target patrols a long route; look along it."] =
        "El objetivo patrulla una ruta larga; búscalo a lo largo de ella.",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "El objetivo espera aquí y luego sale paseando a la gran rama cercana.",
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «La leyenda de Stalvan»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Entrega de zumo»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Los hermanos Pernolatón»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Una noble cerveza»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Sopa de tortuga calmante»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Nueva asignación»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Las piezas de Kravel»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Apoyo al goblin» y «La llave oculta»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Capítulo I»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Capítulo II»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Capítulo III»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Capítulo IV»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «El naufragio de Karnitol»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Análisis mágico» y «Atrapado»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Rumores para Kravel»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Ongeku»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «El tesoro sumergido»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «De vuelta a Bahía del Botín» y «La seguridad primero»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Volver a informar a Pinchabujas,» y «El cubata de Kalimdor de Rapsodio»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El préstamo», «Los espíritus de los estriadores», «El Superhuevomático» y «El cubata de Kalimdor de Rapsodio»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Cristales de poder»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El relato de Rapsodio», «Superistánea FX», «El grog de Whiskey Slim» y «¿Creados por Elune?»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Un envío para MacKinley»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El cebo para Lar'korwi», «La tierra de Un'Goro», «Visita a Gregan» y «Un secreto bien guardado»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «La sublevación de los silítidos»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Un sabor a llamarada»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Buscando a Memo 01» y «Runas arcanas»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El buen carácter de Emma», «Runas arcanas» y «El ingrediente secreto de Roxio»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El Círculo de Piedras», «Los Ancestros corrompidos», «Un largo camino para unas babosas», «Lechúcico Lunadón» y «Encuentro en la tumba»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Vuelve con Tymor»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Aquementas», «El informe Vista Eterna», «El duque Nicolas Zverenhoff» y «Espíritus condenados de Kel'Theril»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Felnok Acerovera»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Rama de roble con inscripciones»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El fin de las hostilidades» y «Suministros para El Cruce»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «El barril vacío de Chen»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «¡A cazar huevos!»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Recuerdos de muerte» y «La batalla de Trabalomas»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Faucehielo»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «El enjambre crece»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Martek el Exiliado» y «Hemet Decautela»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Atrapado»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El escudo negro» y «In situ»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Recogida de muestras en Tanaris» y «Los espíritus de los estriadores»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «De vuelta a Bahía del Botín»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Lodomuerto» y «La seguridad primero»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Un nuevo mensaje para los Martillo Salvaje», «Los espíritus de los estriadores» y «El Superhuevomático»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Regresa junto al médico brujo Uzer'i»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «El exiliado Atal'ai»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Probar la vasija» y «Volver a informar a Pinchabujas,»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Regresa junto a la boticaria Zinge»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El Círculo de Piedras» y «Cristales de poder»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Entrega el calimocho», «El grog de Whiskey Slim» y «La filtración de la Corrupción»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Que jungla tan chunga», «El cebo para Lar'korwi» y «Un secreto bien guardado»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Entrega a Magatha» y «La filtración de la Corrupción»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «El pago de Jes'rimon a Jediga»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Encuentro en la tumba»: déjalo en el banco para liberar un hueco en las bolsas.",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «Entrega a Andron Gant», «Una situación mortal» y «Traición»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "Los necesitarás más adelante para «El informe Vista Eterna» y «El duque Nicolas Zverenhoff»: déjalos en el banco para liberar huecos en las bolsas.",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "Lo necesitarás más adelante para «Aquementas»: déjalo en el banco para liberar un hueco en las bolsas.",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "Astranaar",
    ["Auberdine"] =
        "Auberdine",
    ["Bloodhoof Village"] =
        "Poblado Pezuña de Sangre",
    ["Booty Bay"] =
        "Bahía del Botín",
    ["Brill"] =
        "Rémol",
    ["Camp Mojache"] =
        "Campamento Mojache",
    ["Camp Taurajo"] =
        "Campamento Taurajo",
    ["Cenarion Hold"] =
        "Fuerte Cenarion",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "Villa Oscura",
    ["Deepwater Tavern"] =
        "Puerto de Menethil",
    ["Dolanaar"] =
        "Dolanaar",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "Vista Eterna",
    ["Feathermoon Stronghold"] =
        "Bastión Plumaluna",
    ["Freewind Post"] =
        "Poblado Viento Libre",
    ["Gadgetzan"] =
        "Gadgetzan",
    ["Gallows' End Tavern"] =
        "Rémol",
    ["Goldshire"] =
        "Villadorada",
    ["Grom'gol"] =
        "Grom'gol",
    ["Hammerfall"] =
        "Sentencia",
    ["Ironforge"] =
        "Forjaz",
    ["Kargath"] =
        "Kargath",
    ["Kharanos"] =
        "Kharanos",
    ["Lakeshire"] =
        "Villa del Lago",
    ["Light's Hope Chapel"] =
        "Capilla de la Esperanza de la Luz",
    ["Menethil Harbor"] =
        "Puerto de Menethil",
    ["Nijel's Point"] =
        "Punta de Nijel",
    ["Orgrimmar"] =
        "Orgrimmar",
    ["Ratchet"] =
        "Trinquete",
    ["Razor Hill"] =
        "Cerrotajo",
    ["Revantusk Village"] =
        "Poblado Sañadiente",
    ["Sentinel Hill"] =
        "Colina del Centinela",
    ["Shadowprey Village"] =
        "Aldea Cazasombras",
    ["Southshore"] =
        "Costasur",
    ["Splintertree Post"] =
        "Puesto del Hachazo",
    ["Stonard"] =
        "Rocal",
    ["Stonetalon Peak"] =
        "Cima del Espolón",
    ["Stormwind City"] =
        "Ciudad de Ventormenta",
    ["Stoutlager Inn"] =
        "Thelsamar",
    ["Sun Rock Retreat"] =
        "Refugio Roca del Sol",
    ["Tarren Mill"] =
        "Molino Tarren",
    ["The Crossroads"] =
        "El Cruce",
    ["The Sepulcher"] =
        "El Sepulcro",
    ["Thelsamar"] =
        "Thelsamar",
    ["Theramore"] =
        "Theramore",
    ["Theramore Isle"] =
        "Isla Theramore",
    ["Thunder Bluff"] =
        "Cima del Trueno",
    ["Thunderbrew Distillery"] =
        "Kharanos",
    -- Ding! - Class quests (hand-written guides)
    ["Druid quests"] =
        "Misiones de druida",
    ["At level 10, your trainer teaches Teleport: Moonglade: the quick way to Moonglade and back, used all through this guide."] =
        "A nivel 10, tu instructor te enseña Teletransporte: Claro de la Luna: la forma rápida de ir al Claro de la Luna y volver, que se usa a lo largo de toda esta guía.",
    ["Denatharion, the druid trainer of the Cenarion Enclave in Darnassus, sends you to Mathrengyl next to him."] =
        "Denatharion, el instructor de druidas del Enclave Cenarion de Darnassus, te envía con Mathrengyl, que está a su lado.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave."] =
        "Mathrengyl Garroso, arriba en el Enclave Cenarion.",
    ["From level 10: the chain that teaches Bear Form."] =
        "Desde el nivel 10: la cadena que enseña Forma de oso.",
    ["Dendrite Starblaze waits on the upper floor of the great house of Nighthaven."] =
        "Dendrite Rafagaestelar espera en el piso de arriba de la casa grande de Amparo de la Noche.",
    ["The Great Bear Spirit waits northwest of the village, up the hill path: listen to all it has to say."] =
        "El Espíritu del gran oso espera al noroeste del poblado, subiendo por el sendero de la colina: escucha todo lo que tiene que decir.",
    ["Sindrayl, the hippogryph master south of Nighthaven: take this flight path for your next trips here."] =
        "Sindrayl, el maestro de hipogrifos al sur de Amparo de la Noche: consigue esta ruta de vuelo para tus próximos viajes aquí.",
    ["Lunaclaw's cave, in the hills east of Auberdine"] =
        "La cueva de Garraluna, en las colinas al este de Auberdine",
    ["Deep in the cave, use the Cenarion Moondust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "Al fondo de la cueva, usa el Polvo lunar Cenarion junto a la piedra de lechúcico lunar: aparece Garraluna. Derrótala y luego habla con su espíritu.",
    ["Turning this in teaches Bear Form."] =
        "Al entregarla aprendes Forma de oso.",
    ["From level 10: the Skyborne quests of the bear spirit, on Zephras Isle."] =
        "Desde el nivel 10: las misiones Skyborne del espíritu del oso, en la isla de Zephras.",
    ["Alfina Nightgaze, the druid trainer of Dalaran, gives it."] =
        "Te la da Alfina Nightgaze, la instructora de druidas de Dalaran.",
    ["Opens the way to Moonglade, the home of the druids."] =
        "Abre el camino al Claro de la Luna, el hogar de los druidas.",
    ["Sheldras Moontree, the druid trainer of Stormwind, in the park."] =
        "Sheldras Moontree, el instructor de druidas de Ventormenta, en el parque.",
    ["Five Earthroot will be needed: an herb found along the roads, picked with Herbalism or bought at the auction house."] =
        "Harán falta cinco unidades de Raíz terrenal: una hierba que se encuentra junto a los caminos, que se recoge con Herboristería o se compra en la casa de subastas.",
    ["From level 14: the chain that teaches Cure Poison."] =
        "Desde el nivel 14: la cadena que enseña Curar envenenamiento.",
    ["Fill the sampler at the mouth of the Cliffspring Falls cave, northeast of Auberdine."] =
        "Llena la muestra en la entrada de la cueva del Salto de Fonroca, al noreste de Auberdine.",
    ["Alanndarian Nightsong, in her house in Auberdine."] =
        "Alanndarian Arrullanoche, en su casa de Auberdine.",
    ["The Lunar Fungus grows in the small caves of the hills east of Auberdine, near Lunaclaw's."] =
        "La Seta lunar crece en las pequeñas cuevas de las colinas al este de Auberdine, cerca de la de Garraluna.",
    ["Sickly Deer wander the woods of Darkshore: use the salve on them."] =
        "Los ciervos enfermos deambulan por los bosques de Costa Oscura: usa el bálsamo en ellos.",
    ["Turning this in teaches Cure Poison."] =
        "Al entregarla aprendes Curar envenenamiento.",
    ["From level 16: the chain that teaches Aquatic Form."] =
        "Desde el nivel 16: la cadena que enseña Forma acuática.",
    ["The Shrine Bauble, a small wicker urn, lies on the bottom of Lake Elune'ara: dive around the shrine."] =
        "El Adorno de altar, una pequeña urna de mimbre, está en el fondo del Lago Elune'ara: bucea alrededor del santuario.",
    ["Use the bauble at the Shrine of Remulos, by the lake."] =
        "Usa el adorno en el Santuario de Remulos, junto al lago.",
    ["The first half of the pendant lies under the water off the north of Darkshore."] =
        "La primera mitad del colgante está bajo el agua, frente al norte de Costa Oscura.",
    ["The second half lies under the water off the western coast of Westfall."] =
        "La segunda mitad está bajo el agua, frente a la costa oeste de los Páramos de Poniente.",
    ["Back at the Shrine of Remulos: use a half pendant there to make it whole."] =
        "De vuelta en el Santuario de Remulos: usa allí una mitad del colgante para completarlo.",
    ["Turning this in teaches Aquatic Form."] =
        "Al entregarla aprendes Forma acuática.",
    ["Night Elves get it from Mathrengyl Bearwalker in Darnassus."] =
        "Los elfos de la noche la reciben de Mathrengyl Garroso, en Darnassus.",
    ["From level 20: Forever's chain of the Great Cat Spirit, in Moonglade."] =
        "Desde el nivel 20: la cadena del Gran espíritu felino, propia de Forever, en el Claro de la Luna.",
    ["The Great Cat Spirit rests in the south of Moonglade."] =
        "El Gran espíritu felino descansa al sur del Claro de la Luna.",
    ["The three relics lie in the southeast of Moonglade."] =
        "Las tres reliquias están al sureste del Claro de la Luna.",
    ["The Avatar of Saeyleenan waits in the south of Moonglade."] =
        "El Avatar of Saeyleenan espera al sur del Claro de la Luna.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave of Darnassus."] =
        "Mathrengyl Garroso, arriba en el Enclave Cenarion de Darnassus.",
    ["Any druid trainer of a capital gives it."] =
        "Te la da cualquier instructor de druidas de una capital.",
    ["From level 50: Torwa Pathfinder's chain in Un'Goro Crater, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena de Abrecaminos Torwa en el Cráter de Un'Goro, que termina en el Templo de Atal'Hakkar.",
    ["Torwa Pathfinder camps on the eastern side of the crater."] =
        "Abrecaminos Torwa acampa en el lado este del cráter.",
    ["The Gorishi wasps of the hive in the south carry the stings; the Bloodcaps grow on red plants all over the crater."] =
        "Las avispas Gorishi de la colmena del sur llevan los aguijones; los champiñones de sangre crecen en plantas rojas por todo el cráter.",
    ["Use the barb on a devilsaur: they roam the open plains of the crater."] =
        "Usa la púa en un demosaurio: recorren las llanuras abiertas del cráter.",
    ["Atal'alarion, the guardian of the idol in the temple, drops the Putrid Vine."] =
        "Atal'alarion, el guardián del ídolo del templo, suelta la Viña podrida.",
    ["Hunter quests"] =
        "Misiones de cazador",
    ["Dazalar, the hunter trainer of Dolanaar."] =
        "Dazalar, el instructor de cazadores de Dolanaar.",
    ["From level 10: three beasts to tame, then you can tame a pet of your own."] =
        "Desde el nivel 10: tres bestias que domesticar y luego podrás domesticar una mascota propia.",
    ["Use the taming rod on a Webwood Lurker, east of Dolanaar. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Usa la Fusta de domador en un Rondador Tejemadera, al este de Dolanaar. Una vez domesticado, retíralo: vuelve a atacarte, así que prepárate.",
    ["Use the rod on a Nightsaber Stalker, west of Dolanaar, then dismiss it the same way."] =
        "Usa la fusta en un Acechador sable de la noche, al oeste de Dolanaar, y luego retíralo de la misma forma.",
    ["Use the rod on a Strigid Screecher, south of Dolanaar."] =
        "Usa la fusta en un Estridador estrígido, al sur de Dolanaar.",
    ["Turning this in teaches Tame Beast: you can now keep a pet."] =
        "Al entregarla aprendes Domesticar bestia: ya puedes tener una mascota.",
    ["Jocaste, the hunter trainer of Darnassus, upstairs."] =
        "Jocaste, la instructora de cazadores de Darnassus, arriba.",
    ["Your pet can now learn new skills."] =
        "Tu mascota ya puede aprender nuevas habilidades.",
    ["Grif Wildheart, the hunter trainer of Kharanos."] =
        "Grif Corazón Salvaje, el instructor de cazadores de Kharanos.",
    ["Use the taming rod on a Large Crag Boar, north of Kharanos. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Usa la Fusta de domador en un Grande jabalí del risco, al norte de Kharanos. Una vez domesticado, retíralo: vuelve a atacarte, así que prepárate.",
    ["Use the rod on a Snow Leopard, south of Kharanos, then dismiss it the same way."] =
        "Usa la fusta en un Leopardo de la nieve, al sur de Kharanos, y luego retíralo de la misma forma.",
    ["Use the rod on an Ice Claw Bear, in the hills south of Kharanos."] =
        "Usa la fusta en un Oso zarpahelada, en las colinas al sur de Kharanos.",
    ["Belia Thundergranite, the pet trainer of Ironforge, in the Hall of Arms."] =
        "Belia Tronagranito, la instructora de mascotas de Forjaz, en la Sala de Armas.",
    ["Josephine Carson, the hunter trainer of Goldshire."] =
        "Josephine Carson, la instructora de cazadores de Villadorada.",
    ["Use the taming rod on a Rockhide Boar, in the southeast of Elwynn Forest. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Usa la Fusta de domador en un Jabalí Ocultorroca, al sureste del Bosque de Elwynn. Una vez domesticado, retíralo: vuelve a atacarte, así que prepárate.",
    ["Use the rod on a Gray Forest Wolf, in the east of the forest, then dismiss it the same way."] =
        "Usa la fusta en un Lobo gris del bosque, al este del bosque, y luego retíralo de la misma forma.",
    ["Use the rod on a Young Forest Bear, in the west of the forest near Westbrook Garrison."] =
        "Usa la fusta en un Oso del bosque joven, al oeste del bosque, cerca del Cuartel de Arroyoeste.",
    ["Isaac Chan, the pet trainer, stands next to Josephine."] =
        "Isaac Chan, el instructor de mascotas, está junto a Josephine.",
    ["Elayaa Easewind sends you to Quel'ana Quickgale."] =
        "Elayaa Easewind te envía con Quel'ana Quickgale.",
    ["Use the taming rod on a Windsong Crawler. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Usa la Fusta de domador en un Windsong Crawler. Una vez domesticado, retíralo: vuelve a atacarte, así que prepárate.",
    ["Use the rod on an Ornery Galestrider, then dismiss it the same way."] =
        "Usa la fusta en un Ornery Galestrider y luego retíralo de la misma forma.",
    ["Use the rod on a Vuldren Alpha."] =
        "Usa la fusta en un Vuldren Alpha.",
    ["Quel'dora Quickgale, the pet trainer, stands next to Quel'ana."] =
        "Quel'dora Quickgale, la instructora de mascotas, está junto a Quel'ana.",
    ["Any hunter trainer of a capital gives it."] =
        "Te la da cualquier instructor de cazadores de una capital.",
    ["From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena de Ogtinc en Azshara, que termina en el Templo de Atal'Hakkar.",
    ["Ogtinc lives up a hill path in the middle of Azshara."] =
        "Ogtinc vive en lo alto de un sendero de colina, en el centro de Azshara.",
    ["The Mosshoof Coursers of northern Azshara carry the antlers; only some do."] =
        "Los trotadores Pezuñamusgo del norte de Azshara llevan las astas; solo algunos.",
    ["Wavethrashers haunt the Azshara shoreline; not every one leaves a scale."] =
        "Los vándalos marinos rondan la costa de Azshara; no todos dejan una escama.",
    ["Morphaz, one of the green dragons of the temple, drops the tooth."] =
        "Morphaz, uno de los dragones verdes del templo, suelta el diente.",
    ["Mage quests"] =
        "Misiones de mago",
    ["Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."] =
        "Zaldimar Wefhellt, el instructor de magos de Villadorada, arriba en la posada.",
    ["From level 10: your trainer's first errand, a few minutes from Goldshire."] =
        "Desde el nivel 10: el primer encargo de tu instructor, a unos minutos de Villadorada.",
    ["Jennea Cannon, upstairs in the Wizard's Sanctum of the Mage Quarter, in Stormwind."] =
        "Jennea Cannon, arriba en el Sagrario del Mago del Barrio de los Magos, en Ventormenta.",
    ["Stand in the water of Mirror Lake, in the west of Elwynn Forest, and use the flask there."] =
        "Métete en el agua del Lago Espejo, al oeste del Bosque de Elwynn, y usa allí el frasco.",
    ["Magis Sparkmantle, the mage trainer of Kharanos."] =
        "Magis Chispamanto, el instructor de magos de Kharanos.",
    ["From level 10: your trainer's first errand, in Dun Morogh."] =
        "Desde el nivel 10: el primer encargo de tu instructor, en Dun Morogh.",
    ["Bink, the mage trainer of Ironforge, in the Hall of Mysteries."] =
        "Bink, la instructora de magos de Forjaz, en la Sala de los Misterios.",
    ["Bink's toolbox lies by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "La Caja de herramientas de Bink está junto a las puertas de Gnomeregan, al oeste de Dun Morogh.",
    ["From level 10: the Skyborne mage quests of Zephras Isle."] =
        "Desde el nivel 10: las misiones Skyborne de mago de la isla de Zephras.",
    ["The wind-infused boughs lie on the ground west of the camp."] =
        "Las ramas imbuidas de viento están en el suelo, al oeste del campamento.",
    ["Your mage trainer gives it."] =
        "Te la da tu instructor de magos.",
    ["From level 15: a chain in Stormwind that ends with a robe for you."] =
        "Desde el nivel 15: una cadena en Ventormenta que termina con una toga para ti.",
    ["The chest of coffers and the cantation lie in Jennea's tower."] =
        "El cofre de arcas y el canto están en la torre de Jennea.",
    ["The Blue Recluse, the inn of the Mage Quarter"] =
        "El Ermitaño Azul, la posada del Barrio de los Magos",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it. Three hide in the inn, one of them downstairs."] =
        "Lee el canto para revelar una Cría del risco, lucha con ella hasta que quede aturdida y luego usa un arca sobre ella. Hay tres escondidas en la posada, una de ellas en el piso de abajo.",
    ["The Charged Rift Gem lies in the Silver Stream Mine, in the north of Loch Modan; the linen comes from humanoids anywhere."] =
        "La Gema cargada de la falla está en la Mina de Fuenteplata, al norte de Loch Modan; el lino lo sueltan los humanoides de cualquier parte.",
    ["Wynne Larson, the robe merchant of the Mage Quarter."] =
        "Wynne Larson, la mercader de túnicas del Barrio de los Magos.",
    ["Your reward: the Manaweave Robe."] =
        "Tu recompensa: la Toga Tejemaná.",
    ["From level 26: a chain that ends with a second robe."] =
        "Desde el nivel 26: una cadena que termina con una segunda toga.",
    ["High Sorcerer Andromath, at the top of the Wizard's Sanctum."] =
        "El Sumo Hechicero Andromath, en lo alto del Sagrario del Mago.",
    ["The book lies in the Tower of Ilgalar, in the east of Redridge Mountains."] =
        "El libro está en la Torre de Ilgalar, al este de las Montañas Crestagrana.",
    ["The spiders of the western woods of Duskwood carry the silk."] =
        "Las arañas de los bosques del oeste del Bosque del Ocaso llevan la seda.",
    ["Your reward: the Astral Knot Garment."] =
        "Tu recompensa: las Prendas de nudo astral.",
    ["Your capital's mage trainer gives it."] =
        "Te la da el instructor de magos de tu capital.",
    ["From level 30: Tabetha's quests in Dustwallow Marsh, which end with a mage's wand."] =
        "Desde el nivel 30: las misiones de Tabetha en el Marjal Revolcafango, que terminan con una varita de mago.",
    ["Tabetha lives on her farm in the south of Dustwallow Marsh."] =
        "Tabetha vive en su granja, al sur del Marjal Revolcafango.",
    ["Magus Tirth, at the Shimmering Flats of Thousand Needles, near the race track."] =
        "Magus Tirth, en El Desierto de Sal de Las Mil Agujas, cerca de la pista de carreras.",
    ["\"Plucky\" Johnson, the chicken by the tent: beckon to him with the emote so he turns back into a man, then ask him for the phrase."] =
        "\"Desplumado\" Johnson, el pollo junto a la tienda: hazle señas con la emoción para que vuelva a ser un hombre y luego pídele la frase.",
    ["Tabetha gives it too."] =
        "Tabetha también te la da.",
    ["The Witherbark trolls of eastern Arathi Highlands carry the totem sticks."] =
        "Los trols Secacorteza del este de las Tierras Altas de Arathi llevan los palos de tótem.",
    ["Use the stick on the central stone of the Circle of Outer Binding, in Arathi Highlands; clear its guards first. The Jade is a gem found while mining, or at the auction house."] =
        "Usa el palo en la piedra central del Círculo de Vínculo Exterior, en las Tierras Altas de Arathi; antes, acaba con sus guardianes. El Jade es una gema que se encuentra al hacer minería, o en la casa de subastas.",
    ["The book lies in the Library of the Scarlet Monastery."] =
        "El libro está en la Biblioteca del Monasterio Escarlata.",
    ["Your reward: a mage's wand."] =
        "Tu recompensa: una varita de mago.",
    ["From level 35: Tabetha's second chain, which goes through Uldaman."] =
        "Desde el nivel 35: la segunda cadena de Tabetha, que pasa por Uldaman.",
    ["The Burning Blade summoners of Mannoroc Coven, in southern Desolace, carry the orb."] =
        "Los invocadores Filo Ardiente del Aquelarre Mannoroc, al sur de Desolace, llevan el orbe.",
    ["Right there: Tabetha frees the demon of the orb; defeat it."] =
        "Allí mismo: Tabetha libera al demonio del orbe; derrótalo.",
    ["The Obsidian Sentinel of Uldaman holds the power source."] =
        "El Centinela Obsidiano de Uldaman tiene la fuente de energía.",
    ["Right there: destroy the mana surges as they appear around Tabetha."] =
        "Allí mismo: destruye las oleadas de maná a medida que aparecen alrededor de Tabetha.",
    ["From level 40: Tabetha's task in Zul'Farrak."] =
        "Desde el nivel 40: el encargo de Tabetha en Zul'Farrak.",
    ["Hydromancer Velratha, by the sacred pool of Zul'Farrak, drops the tiara."] =
        "La Hidromántica Velratha, junto a la poza sagrada de Zul'Farrak, suelta la diadema.",
    ["Your capital's master mage gives it."] =
        "Te la da el maestro mago de tu capital.",
    ["From level 50: Archmage Xylem's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena del Archimago Xylem en Azshara, que termina en el Templo de Atal'Hakkar.",
    ["Sanath Lim-yo, at the foot of Archmage Xylem's tower in Azshara: talk to him to be sent up to the archmage."] =
        "Sanath Lim-yo, al pie de la torre del Archimago Xylem en Azshara: habla con él para que te envíe arriba, con el archimago.",
    ["The blood elves of the ruins in northeastern Azshara carry the dust."] =
        "Los elfos de sangre de las ruinas del noreste de Azshara llevan el polvo.",
    ["The Spitelash sirens of the western shore of Azshara carry the coral."] =
        "Las sirenas Látigo de Ira de la costa oeste de Azshara llevan el coral.",
    ["Morphaz, one of the green dragons of the temple, drops the shard."] =
        "Morphaz, uno de los dragones verdes del templo, suelta el fragmento.",
    ["From level 60: Lorekeeper Lydros' quest, inside Dire Maul."] =
        "Desde el nivel 60: la misión del Tradicionalista Lydros, dentro de La Masacre.",
    ["Hydrospawn, a water elemental of Dire Maul, drops the essence."] =
        "Hidromilecio, un elemental de agua de La Masacre, suelta la esencia.",
    ["Paladin quests"] =
        "Misiones de paladín",
    ["Brother Wilhelm, the paladin trainer of Goldshire, sends you to Stormwind."] =
        "El Hermano Fijalontad, el instructor de paladines de Villadorada, te envía a Ventormenta.",
    ["Duthorian Rall, in the Cathedral of Light."] =
        "Duthorian Rall, en la Catedral de la Luz.",
    ["From level 12: the chain that teaches Redemption."] =
        "Desde el nivel 12: la cadena que enseña Redención.",
    ["Read the Tome of Divinity from your bags to start the next quest."] =
        "Lee el Escrito sobre Divinidad desde tus bolsas para empezar la siguiente misión.",
    ["Stephanie Turner, a poor woman of Old Town."] =
        "Stephanie Turner, una mujer pobre del Casco Antiguo.",
    ["She needs Linen Cloth: humanoids carry it everywhere."] =
        "Necesita Paño de lino: lo llevan los humanoides de todas partes.",
    ["Gazin Tenorm, in the Cathedral of Light."] =
        "Gazin Tenorm, en la Catedral de la Luz.",
    ["Henze Faulk lies lifeless in the east of Elwynn Forest: use the Symbol of Life on him."] =
        "Henze Faulk yace sin vida al este del Bosque de Elwynn: usa el Símbolo de Vida sobre él.",
    ["The Defias around Henze carry the script."] =
        "Los Defias que rodean a Henze llevan el escrito.",
    ["Turning this in teaches Redemption."] =
        "Al entregarla aprendes Redención.",
    ["Azar Stronghammer, the paladin trainer of Kharanos, sends you to Ironforge."] =
        "Azar Martillopujante, el instructor de paladines de Kharanos, te envía a Forjaz.",
    ["Tiza Battleforge, in the Mystic Ward of Ironforge."] =
        "Tiza Forjabatalla, en la Sala Mística de Forjaz.",
    ["John Turner, a poor man who walks the streets of Ironforge."] =
        "John Turner, un hombre pobre que recorre las calles de Forjaz.",
    ["He needs Linen Cloth: humanoids carry it everywhere."] =
        "Necesita Paño de lino: lo llevan los humanoides de todas partes.",
    ["Muiredon Battleforge, beside Tiza."] =
        "Muiredon Forjabatalla, al lado de Tiza.",
    ["Narm Faulk lies lifeless in the east of Dun Morogh: use the Symbol of Life on him."] =
        "Narm Faulk yace sin vida al este de Dun Morogh: usa el Símbolo de Vida sobre él.",
    ["The Dark Iron spies around Narm carry the script."] =
        "Los espías Hierro Negro que rodean a Narm llevan el escrito.",
    ["From level 20: the Tome of Valor, then the Test of Righteousness, which ends with Verigan's Fist, a two-handed mace."] =
        "Desde el nivel 20: el Escrito sobre Valor y luego La prueba de rectitud, que termina con el Puño de Verigan, una maza de dos manos.",
    ["Read the Tome of Valor from your bags to start the next quest."] =
        "Lee el Escrito sobre Valor desde tus bolsas para empezar la siguiente misión.",
    ["Duthorian Rall, in the Cathedral of Light of Stormwind."] =
        "Duthorian Rall, en la Catedral de la Luz de Ventormenta.",
    ["Daphne Stilwell, at her house in the south of Westfall. Take her quest only when ready: three waves of Defias attack, then more."] =
        "Daphne Fontana, en su casa al sur de los Páramos de Poniente. Acepta su misión solo cuando te hayas preparado: atacan tres oleadas de Defias, y luego más.",
    ["Stay by Daphne until the last wave falls; a friend helps."] =
        "Quédate junto a Daphne hasta que caiga la última oleada; te ayuda un amigo.",
    ["Jordan Stilwell, outside the gates of Ironforge."] =
        "Jordan Fontana, fuera de las puertas de Forjaz.",
    ["Four items: the lumber from the Deadmines, the hammer from Shadowfang Keep, the ore from Loch Modan and the Kor Gem from Darkshore."] =
        "Cuatro objetos: la madera de Las Minas de la Muerte, el martillo del Castillo de Colmillo Oscuro, el mineral de Loch Modan y la gema Kor de Costa Oscura.",
    ["Bailor Stonehand, in Thelsamar."] =
        "Bailor Petramano, en Thelsamar.",
    ["The ore lies in a crate by a tree stump, in the northeast of Loch Modan."] =
        "El mineral está en una caja junto a un tocón, al noreste de Loch Modan.",
    ["Thundris Windweaver, in Auberdine."] =
        "Thundris Tejevientos, en Auberdine.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand in Ashenvale, carry the corrupted gem. They are elite: bring a group."] =
        "Las nagas de la entrada de las Cavernas de Brazanegra, bajo el agua de La Ensenada de Zoram en Vallefresno, llevan la gema corrupta. Son élite: ve en grupo.",
    ["The goblin woodcarvers of the Deadmines carry the lumber."] =
        "Los talladores de madera goblin de Las Minas de la Muerte llevan la madera.",
    ["Jordan's hammer lies in the stables of Shadowfang Keep."] =
        "El martillo de Jordan está en los establos del Castillo de Colmillo Oscuro.",
    ["Your reward: Verigan's Fist."] =
        "Tu recompensa: el Puño de Verigan.",
    ["Delgren the Purifier, at Maestra's Post in Ashenvale."] =
        "Delgren el Purificador, en la Atalaya de Maestra, en Vallefresno.",
    ["From level 22: Forever's paladin chain of Delgren the Purifier."] =
        "Desde el nivel 22: la cadena de paladín de Delgren el Purificador, propia de Forever.",
    ["Katherine the Pure, in the Cathedral of Light of Stormwind."] =
        "Katherine la Pura, en la Catedral de la Luz de Ventormenta.",
    ["Ursula Deline, the warlock trainer of the Mage Quarter."] =
        "Ursula Deline, la instructora de brujos del Barrio de los Magos.",
    ["The Blackrock orcs of Redridge Mountains carry the summoner's salt."] =
        "Los orcos Roca Negra de las Montañas Crestagrana llevan la sal del invocador.",
    ["The demons of Demon Fall Canyon, in the southeast of Ashenvale, carry the motes."] =
        "Los demonios del Barranco del Demonio Caído, al sureste de Vallefresno, llevan las motas.",
    ["Bring them to the Spear of Mannoroth, in the canyon."] =
        "Llévalas a la Lanza de Mannoroth, en el barranco.",
    ["From level 40: the quest of your warhorse."] =
        "Desde el nivel 40: la misión de tu caballo de guerra.",
    ["Turning this in teaches Summon Warhorse."] =
        "Al entregarla aprendes Invocar caballo de guerra.",
    ["Lord Grayson Shadowbreaker, in the Cathedral of Light."] =
        "Lord Grisillo Quiebrasombras, en la Catedral de la Luz.",
    ["From level 50: the chain of the Mightstone, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena de la Piedra sagrada del poderío, que termina en el Templo de Atal'Hakkar.",
    ["Commander Ashlam Valorfist, at Chillwind Camp in the Western Plaguelands."] =
        "El Comandante Ashlam Puñovalor, en el Campamento del Orvallo, en las Tierras de la Peste del Oeste.",
    ["The skeletons of the fields of Andorhal carry the scourgestones."] =
        "Los esqueletos de los campos de Andorhal llevan las piedras de la Plaga.",
    ["High Priest Thel'danis walks around Chillwind Camp."] =
        "El Sumo Sacerdote Thel'danis pasea por el Campamento del Orvallo.",
    ["The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro."] =
        "Los seis jefes trols del anillo superior del templo sueltan una pluma cada uno: Gasher, Zul'Lor, Mijan, Hukku, Zolo y Loh'ro.",
    ["From level 60: the long chain of your charger. It asks for about 200 gold and goes through Stratholme, Dire Maul and Scholomance."] =
        "Desde el nivel 60: la larga cadena de tu destrero. Pide unas 200 de oro y pasa por Stratholme, La Masacre y Scholomance.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge: the sacrifice he asks for is gold."] =
        "El Sumo Sacerdote Rohan, en la Sala Mística de Forjaz: el sacrificio que pide es oro.",
    ["Use the censer on the Terrordale Spirits, in the northwest of the Eastern Plaguelands."] =
        "Usa el incensario en los espíritus del Valle del Terror, al noroeste de las Tierras de la Peste del Este.",
    ["Grimand Elmore, in the Dwarven District of Stormwind."] =
        "Grimand Elmore, en el Distrito de los Enanos de Ventormenta.",
    ["Grimand wants gold, Arthas' Tears (a herb), Runecloth, an Arcanite Bar, and holy water from the supply crates of Stratholme."] =
        "Grimand quiere oro, Lágrimas de Arthas (una hierba), Paño rúnico, un Lingote de arcanita y agua bendita de los cajones de provisiones de Stratholme.",
    ["Merideth Carlson, the horse breeder of Southshore, makes the horse feed."] =
        "Merideth Carlson, la criadora de caballos de Costasur, prepara el pienso para caballos.",
    ["The Enriched Manna Biscuits are sold by the Argent Dawn's quartermasters."] =
        "Las Galletas de maná enriquecido las venden los intendentes del Alba Argenta.",
    ["The Ancient Equine Spirit waits in western Dire Maul, past Tendris Warpwood."] =
        "El Antiguo espíritu equino espera en el oeste de La Masacre, pasado Tendris Alabeo.",
    ["An Azerothian Diamond and a Pristine Black Diamond: found while mining and on monsters of the Plaguelands, or at the auction house."] =
        "Un Diamante de Azeroth y un Diamante negro prístino: se encuentran al hacer minería y en monstruos de las Tierras de la Peste, o en la casa de subastas.",
    ["In Scholomance, use the Divination Scryer to call Death Knight Darkreaver, defeat him, then use the charger's soul on his fallen mount."] =
        "En Scholomance, usa el Arúspice para llamar al Caballero de la Muerte Atracoscuro, derrótalo y luego usa el alma del destrero sobre su montura caída.",
    ["Your reward: Summon Charger, your epic mount."] =
        "Tu recompensa: Invocar destrero, tu montura épica.",
    ["Priest quests"] =
        "Misiones de sacerdote",
    ["Priestess Anetta, the priest trainer of Northshire Abbey."] =
        "La Sacerdotisa Anetta, la instructora de sacerdotes de la Abadía de Villanorte.",
    ["From level 5: heal a wounded guard, and get your first robe."] =
        "Desde el nivel 5: sana a un guardia herido y consigue tu primera toga.",
    ["Priestess Josetta, the priest trainer of Goldshire."] =
        "La Sacerdotisa Josetta, la instructora de sacerdotes de Villadorada.",
    ["Guard Roberts lies wounded east of Goldshire: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "El Guardia Roberts yace herido al este de Villadorada: sánalo con Sanación inferior y luego dale Palabra de poder: entereza.",
    ["Branstock Khalder, the priest trainer of Coldridge Valley."] =
        "Silo Khalder, el instructor de sacerdotes del Valle de Crestanevada.",
    ["From level 5: heal a wounded mountaineer, and get your first robe."] =
        "Desde el nivel 5: sana a un montaraz herido y consigue tu primera toga.",
    ["Maxan Anvol, the priest trainer of Kharanos."] =
        "Maxan Anvol, el instructor de sacerdotes de Kharanos.",
    ["Mountaineer Dolf lies wounded near Kharanos: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "El Montaraz Dolf yace herido cerca de Kharanos: sánalo con Sanación inferior y luego dale Palabra de poder: entereza.",
    ["Shanda, the priest trainer of Aldrassil, in Shadowglen."] =
        "Shanda, la instructora de sacerdotes de Aldrassil, en Cañada Umbría.",
    ["From level 5: heal a wounded sentinel, and get your first robe."] =
        "Desde el nivel 5: sana a una centinela herida y consigue tu primera toga.",
    ["Laurna Morninglight, the priest trainer of Dolanaar."] =
        "Laurna Luzdelalba, la instructora de sacerdotes de Dolanaar.",
    ["Sentinel Shaya lies wounded south of Dolanaar: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "La Centinela Shaya yace herida al sur de Dolanaar: sánala con Sanación inferior y luego dale Palabra de poder: entereza.",
    ["From level 10: the quest that teaches Desperate Prayer."] =
        "Desde el nivel 10: la misión que enseña Rezo desesperado.",
    ["High Priestess Laurena, in the Cathedral of Light of Stormwind."] =
        "La Suma Sacerdotisa Laurena, en la Catedral de la Luz de Ventormenta.",
    ["Priestess Josetta gives it too."] =
        "La Sacerdotisa Josetta también te la da.",
    ["From level 10: Forever's quest of Divine Grace, for Humans."] =
        "Desde el nivel 10: la misión de Divine Grace, propia de Forever, para humanos.",
    ["From level 10: Forever's quest of Confounding Flash, for Gnomes."] =
        "Desde el nivel 10: la misión de Confounding Flash, propia de Forever, para gnomos.",
    ["High Priestess Mims, in the Mystic Ward of Ironforge."] =
        "High Priestess Mims, en la Sala Mística de Forjaz.",
    ["From level 10: the quest that teaches Starshards."] =
        "Desde el nivel 10: la misión que enseña Astillas estelares.",
    ["Priestess Alathea, in the Temple of the Moon of Darnassus."] =
        "La Sacerdotisa Alathea, en el Templo de la Luna de Darnassus.",
    ["From level 20: the quest that teaches Feedback."] =
        "Desde el nivel 20: la misión que enseña Reacción.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge."] =
        "El Sumo Sacerdote Rohan, en la Sala Mística de Forjaz.",
    ["From level 20: the quest that teaches Fear Ward."] =
        "Desde el nivel 20: la misión que enseña Custodia de miedo.",
    ["From level 20: Forever's second Gnome priest quest."] =
        "Desde el nivel 20: la segunda misión de sacerdote gnomo, propia de Forever.",
    ["From level 20: the quest that teaches Elune's Grace."] =
        "Desde el nivel 20: la misión que enseña Gracia de Elune.",
    ["Any priest trainer of a capital gives it."] =
        "Te la da cualquier instructor de sacerdotes de una capital.",
    ["The Mosshoof Coursers of northern Azshara carry the glands; only some do."] =
        "Los trotadores Pezuñamusgo del norte de Azshara llevan las glándulas; solo algunos.",
    ["The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor."] =
        "Los no-muertos de las Tierras de la Peste del Oeste y los zombis Zanzil de Tuercespina llevan el icor.",
    ["Morphaz, one of the green dragons of the temple, carries the blood."] =
        "Morphaz, uno de los dragones verdes del templo, lleva la sangre.",
    ["Greta Mosshoof, at the Emerald Sanctuary in Felwood."] =
        "Greta Pezuñamusgo, en el Santuario Esmeralda, en Frondavil.",
    ["Rogue quests"] =
        "Misiones de pícaro",
    ["Hogral Bakkan, the rogue trainer of Kharanos."] =
        "Hogral Bakkan, el instructor de pícaros de Kharanos.",
    ["From level 10: a first errand for the rogues of Ironforge."] =
        "Desde el nivel 10: un primer encargo para los pícaros de Forjaz.",
    ["Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge."] =
        "Hulfdan Barbanegra, en La Caverna Abandonada de Forjaz.",
    ["Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan."] =
        "Onin MacHammar está en una plataforma al oeste de Dun Morogh, cerca de Gnomeregan.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75."] =
        "Aprende Forzar cerradura con tu instructor y luego practica con arcones hasta que tu habilidad llegue a 75.",
    ["From level 16: Pick Lock opens the chests and boxes of the quests to come."] =
        "Desde el nivel 16: Forzar cerradura abre los cofres y las cajas de las próximas misiones.",
    ["Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town."] =
        "El Maestro Mathias Shaw, en el último piso del cuartel general del IV:7, en el Casco Antiguo.",
    ["From level 20: the chain that teaches your poisons."] =
        "Desde el nivel 20: la cadena que te enseña los venenos.",
    ["Agent Kearnen watches from a hill in the southeast of Westfall."] =
        "Agente Kearnen vigila desde una colina al sureste de los Páramos de Poniente.",
    ["Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest."] =
        "Roba la Llave de la torre Defias del bolsillo de un Zángano defias deformado, junto a la torre; luego, arriba, usa Porrazo en Klaven Mortoalerta antes de abrir el cofre.",
    ["The chest leaves a sickness on you: that is the next quest."] =
        "El cofre te deja una enfermedad: esa es la siguiente misión.",
    ["Doc Mixilpixil works in the cellar of SI:7's headquarters."] =
        "Doc Mixilpixil trabaja en el sótano del cuartel general del IV:7.",
    ["Lie down in front of him (the emote) so he can examine you."] =
        "Túmbate delante de él (la emoción) para que pueda examinarte.",
    ["Turning this in teaches your poisons."] =
        "Al entregarla aprendes los venenos.",
    ["Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills."] =
        "Myrokos Silenforma, en la Mansión Ravenholdt, en las Montañas de Alterac: se entra por una cueva al norte de las Laderas de Trabalomas.",
    ["From level 24: Forever's Syndicate quests, at Ravenholdt Manor."] =
        "Desde el nivel 24: las misiones de la Hermandad, propias de Forever, en la Mansión Ravenholdt.",
    ["Lord Tomas is hiding in the east of Hillsbrad Foothills."] =
        "Lord Tomas se esconde al este de las Laderas de Trabalomas.",
    ["Any rogue trainer of a capital gives it."] =
        "Te la da cualquier instructor de pícaros de una capital.",
    ["From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena de Lord Jorach Ravenholdt, que termina en el Templo de Atal'Hakkar.",
    ["Lord Jorach Ravenholdt, in Ravenholdt Manor."] =
        "Lord Jorach Ravenholdt, en la Mansión Ravenholdt.",
    ["The Timbermaw shamans of northern Azshara carry the bag."] =
        "Los chamanes Fauces de Madera del norte de Azshara llevan la bolsa.",
    ["Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up."] =
        "El Archimago Xylem, en lo alto de su torre en Azshara: Sanath Lim-yo, al pie de ella, te envía arriba.",
    ["The Forest Oozes of northeastern Azshara carry the fragments."] =
        "Los mocos del bosque del noreste de Azshara llevan los fragmentos.",
    ["Morphaz, one of the green dragons of the temple, drops the key."] =
        "Morphaz, uno de los dragones verdes del templo, suelta la llave.",
    ["Shaman quests"] =
        "Misiones de chamán",
    ["Teo Hammerstorm, the shaman trainer of Coldridge Valley."] =
        "Teo Hammerstorm, el instructor de chamanes del Valle de Crestanevada.",
    ["From level 4: the Call of Earth, your first totem."] =
        "Desde el nivel 4: Clamor de Tierra, tu primer tótem.",
    ["The Frostmane trolls south of the valley carry the pendant."] =
        "Los trols Peloescarcha del sur del valle llevan el colgante.",
    ["On the hill west of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "En la colina al oeste del valle: bebe la Sapta de tierra para ver la Manifestación de tierra menor.",
    ["Turning this in teaches your first earth totem."] =
        "Al entregarla aprendes tu primer tótem de tierra.",
    ["Ingrid Dunwald in Kharanos, or Eldrun Stormbreaker in Ironforge."] =
        "Ingrid Dunwald en Kharanos, o Eldrun Stormbreaker en Forjaz.",
    ["From level 10: the Call of Fire, your first fire totem."] =
        "Desde el nivel 10: La llamada del Fuego, tu primer tótem de fuego.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh, by the road to Loch Modan."] =
        "Bruegs Kindleborn, en el extremo este de Dun Morogh, junto al camino de Loch Modan.",
    ["Braldir Ashmantle, on a hill in the southwest of Loch Modan."] =
        "Braldir Ashmantle, en una colina al suroeste de Loch Modan.",
    ["The Tunnel Rat geomancers of Loch Modan carry the Fire Tar; the Stonesplinter seers of the south carry the pouches."] =
        "Los geománticos Ratatúnel de Loch Modan llevan el Alquitrán; los profetas Rompecantos del sur llevan las bolsitas.",
    ["Right by Braldir: call the Minor Manifestation of Fire at the brazier, then defeat it for its ember."] =
        "Justo al lado de Braldir: llama a la Manifestación de fuego menor en el blandón y luego derrótala para conseguir su ascua.",
    ["Light the Brazier of the Dormant Flame with the ember."] =
        "Enciende el Blandón de la Llama Latente con el ascua.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh."] =
        "Bruegs Kindleborn, en el extremo este de Dun Morogh.",
    ["Turning this in teaches your first fire totem."] =
        "Al entregarla aprendes tu primer tótem de fuego.",
    ["Eldrun Stormbreaker, the shaman trainer of Ironforge."] =
        "Eldrun Stormbreaker, el instructor de chamanes de Forjaz.",
    ["From level 20: the Call of Water, your first water totem."] =
        "Desde el nivel 20: La llamada del agua, tu primer tótem de agua.",
    ["Norric Lochthane, by the dam in the north of Loch Modan."] =
        "Norric Lochthane, junto a la presa, al norte de Loch Modan.",
    ["Hervdana Saegrund, in the southeast of the Wetlands."] =
        "Hervdana Saegrund, al sureste de Los Humedales.",
    ["Fill the waterskin where Hervdana's quest says: DingDB does not hold this place yet."] =
        "Llena la bota donde indica la misión de Hervdana: DingDB aún no tiene este lugar.",
    ["At the Forgotten Shrine of Westfall: call the corrupt manifestation of water, then defeat it for its bracers."] =
        "En el Santuario Olvidado de los Páramos de Poniente: llama a la manifestación de agua corrupta y luego derrótala para conseguir sus brazales.",
    ["The Minor Manifestation of Water rises beside the shrine."] =
        "La Manifestación de agua menor surge junto al santuario.",
    ["Turning this in teaches your first water totem."] =
        "Al entregarla aprendes tu primer tótem de agua.",
    ["From level 30: the Call of Air, your first air totem."] =
        "Desde el nivel 30: La llamada del aire, tu primer tótem de aire.",
    ["Veyric Thunderhame, in the north of Arathi Highlands."] =
        "Veyric Thunderhame, al norte de las Tierras Altas de Arathi.",
    ["Turning this in teaches your first air totem."] =
        "Al entregarla aprendes tu primer tótem de aire.",
    ["From level 30: Veyric Thunderhame's elemental quests, to level 40."] =
        "Desde el nivel 30: las misiones elementales de Veyric Thunderhame, hasta el nivel 40.",
    ["Four twisted totems: from the Stonevault troggs of the Badlands, the Maraudine centaurs of Desolace, the Lost Ones of the Swamp of Sorrows and the Mirefin murlocs of Dustwallow Marsh."] =
        "Cuatro tótems retorcidos: de los troggs Grutacanto de las Tierras Inhóspitas, los centauros Maraudine de Desolace, los Perdidos del Pantano de las Penas y los múrlocs Ancalodo del Marjal Revolcafango.",
    ["Charlga Razorflank, the crone of Razorfen Kraul, carries the note."] =
        "Charlga Filonavaja, la bruja de Horado Rajacieno, lleva la nota.",
    ["The Ravaging Tempests of western Thousand Needles carry the eye."] =
        "Las Ravaging Tempests del oeste de Las Mil Agujas llevan el ojo.",
    ["Bath'rah the Windwatcher, in the hills of the Alterac Mountains."] =
        "Bath'rah el Vigía del viento, en las colinas de las Montañas de Alterac.",
    ["Warlock quests"] =
        "Misiones de brujo",
    ["Drusilla La Salle, the warlock trainer of Northshire Abbey."] =
        "Drusilla La Salle, la instructora de brujos de la Abadía de Villanorte.",
    ["Your trainer's first errand, around Northshire Abbey."] =
        "El primer encargo de tu instructor, en los alrededores de la Abadía de Villanorte.",
    ["The stolen books lie in the kobold camp east of the abbey."] =
        "Los libros robados están en el campamento kóbold al este de la abadía.",
    ["Alamar Grimm, the warlock trainer of Coldridge Valley."] =
        "Alamar Grimm, el instructor de brujos del Valle de Crestanevada.",
    ["Your trainer's first errand, around Coldridge Valley."] =
        "El primer encargo de tu instructor, en los alrededores del Valle de Crestanevada.",
    ["The Frostmane novices of the troll cave in the south of the valley carry the charm."] =
        "Los novicios Peloescarcha de la cueva trol del sur del valle llevan el amuleto.",
    ["Remen Marcot, in the inn of Goldshire, sends you to Stormwind."] =
        "Remen Marcot, en la posada de Villadorada, te envía a Ventormenta.",
    ["Lago Blackwrench, in the Forlorn Cavern of Ironforge, sends you to Stormwind."] =
        "Llago Llavenegra, en La Caverna Abandonada de Forjaz, te envía a Ventormenta.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb, in the Mage Quarter of Stormwind."] =
        "Gakin el Presotenebra, en el sótano de El Cordero Degollado, en el Barrio de los Magos de Ventormenta.",
    ["From level 10: the chain that teaches Summon Voidwalker."] =
        "Desde el nivel 10: la cadena que enseña Invocar abisario.",
    ["Surena Caledon hides in a house of the Brackwell Pumpkin Patch, in the east of Elwynn Forest."] =
        "Surena Caledon se esconde en una casa del Huerto de Calabazas de Brackwell, al este del Bosque de Elwynn.",
    ["Down the stairs of the Slaughtered Lamb's crypt: use the choker on the summoning circle, then defeat the voidwalker."] =
        "Bajando las escaleras de la cripta de El Cordero Degollado: usa la gargantilla en el círculo de invocación y luego derrota al abisario.",
    ["Turning this in teaches Summon Voidwalker."] =
        "Al entregarla aprendes Invocar abisario.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."] =
        "Gakin el Presotenebra, en el sótano de El Cordero Degollado.",
    ["From level 20: the chain that teaches Summon Succubus."] =
        "Desde el nivel 20: la cadena que enseña Invocar súcubo.",
    ["Takar the Seer, north of Camp Taurajo in the Barrens: Horde land, stay clear of the guards."] =
        "Takar el Vidente, al norte del Campamento Taurajo, en Los Baldíos: tierra de la Horda, mantente lejos de los guardias.",
    ["The Heartswood grows in the north of Ashenvale, near the Horde's lumber camp."] =
        "El Duramen crece al norte de Vallefresno, cerca del campamento maderero de la Horda.",
    ["In the Slaughtered Lamb's crypt again: use the heartswood core on the summoning circle, then defeat the succubus."] =
        "De nuevo en la cripta de El Cordero Degollado: usa el núcleo de duramen en el círculo de invocación y luego derrota al súcubo.",
    ["Turning this in teaches Summon Succubus."] =
        "Al entregarla aprendes Invocar súcubo.",
    ["From level 30: the chain that teaches Summon Felhunter."] =
        "Desde el nivel 30: la cadena que enseña Invocar manáfago.",
    ["Strahad Farsan, in Ratchet."] =
        "Strahad Farsan, en Trinquete.",
    ["Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "Krom Brazorrecio, en la Sala de los Exploradores de Forjaz.",
    ["The moldy tome lies in the southwest of Hillsbrad Foothills; the tattered manuscript, in a damaged chest of western Thousand Needles."] =
        "El escrito mohoso está al suroeste de las Laderas de Trabalomas; el manuscrito andrajoso, en un cofre dañado del oeste de Las Mil Agujas.",
    ["The Dragonmaw orcs of the Wetlands carry the rod."] =
        "Los orcos Faucedraco de Los Humedales llevan la vara.",
    ["Right by Strahad: use the tome on the summoning circle, then defeat the felhunter."] =
        "Justo al lado de Strahad: usa el escrito en el círculo de invocación y luego derrota al manáfago.",
    ["Turning this in teaches Summon Felhunter."] =
        "Al entregarla aprendes Invocar manáfago.",
    ["Demisette Cloyce, in the Slaughtered Lamb of Stormwind."] =
        "Demisette Cloyce, en El Cordero Degollado de Ventormenta.",
    ["From level 40: the quest of your felsteed."] =
        "Desde el nivel 40: la misión de tu corcel vil.",
    ["Turning this in teaches Summon Felsteed."] =
        "Al entregarla aprendes Invocar corcel vil.",
    ["Niby the Almighty and Impsy wait in a small camp of central Felwood."] =
        "Niby el Todopoderoso y Diblis esperan en un pequeño campamento del centro de Frondavil.",
    ["From level 50: the demonic quests of Niby and Impsy, in Felwood."] =
        "Desde el nivel 50: las misiones demoníacas de Niby y Diblis, en Frondavil.",
    ["Felcloth drops from demons and satyrs, Azshara's above all; the auction house sells it too."] =
        "La Tela de inferi la sueltan demonios y sátiros, sobre todo los de Azshara; también se vende en la casa de subastas.",
    ["The Irontree treants of northern Felwood carry the rotting wood; the oozes of the Bloodvenom river, the essence."] =
        "Los antárboles Troncoferro del norte de Frondavil llevan la madera podrida; los mocos del río Veneno de Sangre, la esencia.",
    ["Three essences: from the satyrs of Jaedenar in Felwood, the Legashi satyrs of Azshara, and the felguards by the Dark Portal in the Blasted Lands."] =
        "Tres esencias: de los sátiros de Jaedenar en Frondavil, los sátiros Legashi de Azshara y los guardias viles junto al Portal Oscuro, en las Tierras Devastadas.",
    ["North of the camp, by the remains of Kroshius: use the item Impsy gives you to wake him, then defeat him."] =
        "Al norte del campamento, junto a los restos de Kroshius: usa el objeto que te da Diblis para despertarlo y luego derrótalo.",
    ["Spackle Thornberry, the demon trainer of the Slaughtered Lamb."] =
        "Spackle Espinamora, el instructor de demonios de El Cordero Degollado.",
    ["From level 60: the long chain of your dreadsteed. It asks for costly materials and goes through Scholomance and Dire Maul."] =
        "Desde el nivel 60: la larga cadena de tu corcel nefasto. Pide materiales caros y pasa por Scholomance y La Masacre.",
    ["Mor'zul Bloodbringer, in the west of the Burning Steppes."] =
        "Mor'zul Sangredoble, al oeste de las Estepas Ardientes.",
    ["The owlbeasts of Winterspring carry the blood."] =
        "Los lechúcicos de Cuna del Invierno llevan la sangre.",
    ["Gorzeeki Wildeyes, right by Mor'zul."] =
        "Gorzeeki Ojosalvajes, justo al lado de Mor'zul.",
    ["Mor'zul gives these three."] =
        "Mor'zul te da estas tres.",
    ["These three ask for an alchemist's elixir, an enchanter's shard with ore of the Burning Steppes, and scales of black dragonkin: make them, find them, or buy them at the auction house."] =
        "Estas tres piden un elixir de alquimista, un fragmento de encantador con mineral de las Estepas Ardientes y escamas de dragonante negro: fabrícalos, encuéntralos o cómpralos en la casa de subastas.",
    ["An Arcanite Bar: an alchemist makes it, or the auction house sells it."] =
        "Un Lingote de arcanita: lo fabrica un alquimista, o se vende en la casa de subastas.",
    ["Lord Banehollow, in the shrine of Jaedenar, in Felwood."] =
        "Lord Pesadilla, en el santuario de Jaedenar, en Frondavil.",
    ["Ulathek hides in Jaedenar too: defeat him for his heart."] =
        "Ulathek también se esconde en Jaedenar: derrótalo para conseguir su corazón.",
    ["Ur'dan sells the stardust, right by Lord Banehollow."] =
        "Ur'dan vende el polvo estelar, justo al lado de Lord Pesadilla.",
    ["In the alchemy lab of Scholomance, use the imp in a jar and let it do its work."] =
        "En el laboratorio de alquimia de Scholomance, usa el Diablillo en una jarra y deja que haga su trabajo.",
    ["In Dire Maul, summon the Xorothian Dreadsteed with the ritual items and defeat it; then speak to its spirit."] =
        "En La Masacre, invoca al Corcel de la Muerte Xorothiano con los objetos del ritual y derrótalo; luego habla con su espíritu.",
    ["Your reward: Summon Dreadsteed, your epic mount."] =
        "Tu recompensa: Invocar corcel nefasto, tu montura épica.",
    ["Warrior quests"] =
        "Misiones de guerrero",
    ["Lyria Du Lac, the warrior trainer of Goldshire."] =
        "Lyria Du Lac, la instructora de guerreros de Villadorada.",
    ["From level 10: the chain that teaches Defensive Stance."] =
        "Desde el nivel 10: la cadena que enseña Actitud defensiva.",
    ["Harry Burlguard, in the tavern of Old Town, in Stormwind."] =
        "Harry Burlguard, en la taberna del Casco Antiguo, en Ventormenta.",
    ["Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest."] =
        "Bartleby, un borracho de la misma taberna: ataca en cuanto aceptas su misión.",
    ["Turning this in teaches Defensive Stance."] =
        "Al entregarla aprendes Actitud defensiva.",
    ["Granis Swiftaxe, the warrior trainer of Kharanos."] =
        "Granis Hachaveloz, el instructor de guerreros de Kharanos.",
    ["Muren Stormpike, upstairs in the Hall of Arms of Ironforge."] =
        "Muren Pico Tormenta, arriba en la Sala de Armas de Forjaz.",
    ["Vejrek waits in a Frostmane hut in the west of Dun Morogh."] =
        "Vejrek espera en una choza Peloescarcha al oeste de Dun Morogh.",
    ["Kyra Windblade, the warrior trainer of Dolanaar."] =
        "Kyra Espada del Viento, la instructora de guerreros de Dolanaar.",
    ["Elanaria, on the Warrior's Terrace of Darnassus."] =
        "Elanaria, en el Bancal del Guerrero de Darnassus.",
    ["Vorlus Vilehoof roams with the satyrs southwest of Dolanaar."] =
        "Vorlus Pezuñavil deambula con los sátiros al suroeste de Dolanaar.",
    ["Seena Skybreaker, the warrior trainer of Zephras Isle."] =
        "Seena Skybreaker, la instructora de guerreros de la isla de Zephras.",
    ["From level 10: the Skyborne warrior quest of Zephras Isle."] =
        "Desde el nivel 10: la misión Skyborne de guerrero de la isla de Zephras.",
    ["Zaal Stormshield carries the bulwark, in the north of the isle."] =
        "Zaal Stormshield lleva el baluarte, al norte de la isla.",
    ["Your capital's warrior trainer gives it."] =
        "Te la da el instructor de guerreros de tu capital.",
    ["From level 30: the chain that teaches Berserker Stance."] =
        "Desde el nivel 30: la cadena que enseña Actitud rabiosa.",
    ["Klannoc Macleod, on Fray Island, off the coast of the Barrens."] =
        "Klannoc Macleod, en la Isla de Batalla, frente a la costa de Los Baldíos.",
    ["Step on the grate of the arena: six fighters come one at a time, then Big Will."] =
        "Pisa la reja de la arena: llegan seis luchadores de uno en uno y luego Will el Grande.",
    ["Turning this in teaches Berserker Stance."] =
        "Al entregarla aprendes Actitud rabiosa.",
    ["From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice."] =
        "Desde el nivel 30: la cadena de Bath'rah, que termina con un arma espirálica a tu elección.",
    ["Eight Liferoot: an herb, picked with Herbalism or bought at the auction house."] =
        "Ocho unidades de Vidarraíz: una hierba que se recoge con Herboristería o se compra en la casa de subastas.",
    ["The Drywhisker kobolds of eastern Arathi Highlands carry the three charms."] =
        "Los kóbolds Mostacho Seco del este de las Tierras Altas de Arathi llevan los tres amuletos.",
    ["At Bath'rah's cauldron, right by him: put the three charms in it."] =
        "En el caldero de Bath'rah, justo a su lado: echa en él los tres amuletos.",
    ["The Bloodscalp trolls of northern Stranglethorn carry the tusks."] =
        "Los trols Cabellesangre del norte de Tuercespina llevan los colmillos.",
    ["Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help."] =
        "Sigue a Bath'rah hasta la invocación y luego derrota a Ciclonio para conseguir su corazón: es un enemigo fuerte, lleva ayuda.",
    ["Your reward: a Whirlwind weapon of your choice."] =
        "Tu recompensa: un arma espirálica a tu elección.",
    ["From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena del Héroe caído, que termina en el Templo de Atal'Hakkar.",
    ["The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows."] =
        "El Héroe caído de la Horda, un espíritu al oeste del Pantano de las Penas.",
    ["The Helboars of the Blasted Lands."] =
        "Los jabinfernos de las Tierras Devastadas.",
    ["The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly."] =
        "Los Sombra Jurada de las Tierras Devastadas, junto al Portal Oscuro; reaparecen rápido.",
    ["Gennia Runetotem, the druid trainer of Bloodhoof Village, sends you to Thunder Bluff."] =
        "Gennia Tótem de Runa, la instructora de druidas del Poblado Pezuña de Sangre, te envía a Cima del Trueno.",
    ["Turak Runetotem, in the Elder Rise of Thunder Bluff."] =
        "Turak Runatótem, en el Alto de los Ancestros de Cima del Trueno.",
    ["Faustron, the wind rider master southwest of Nighthaven: take this flight path for your next trips here."] =
        "Faustron, el maestro de jinetes del viento al suroeste de Amparo de la Noche: consigue esta ruta de vuelo para tus próximos viajes aquí.",
    ["Lunaclaw's spot, west of Camp Taurajo in the Barrens"] =
        "El lugar de Garraluna, al oeste del Campamento Taurajo, en Los Baldíos",
    ["Use the Cenarion Lunardust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "Usa el Polvo lunar Cenarion junto a la piedra de lechúcico lunar: aparece Garraluna. Derrótala y luego habla con su espíritu.",
    ["Muln Earthfury gives it, in the northwest of Mulgore."] =
        "Te la da Muln Earthfury, al noroeste de Mulgore.",
    ["Fill the sampler in the bubbling pool at the top of Dreadmist Peak: three acolytes attack right after, so clear the top first or bring help."] =
        "Llena la muestra en el estanque burbujeante de lo alto de la Cima Calígine: justo después atacan tres acólitos, así que limpia antes la cima o lleva ayuda.",
    ["Tonga Runetotem, just south of the Crossroads."] =
        "Tonga Tótem de Runa, justo al sur de El Cruce.",
    ["The kodos of the northern Barrens carry the Kodo Horns."] =
        "Los kodos del norte de Los Baldíos llevan los Cuernos de kodo.",
    ["Sickly Gazelles graze in the north of the Barrens: use the salve on them."] =
        "Las gacelas enfermas pastan al norte de Los Baldíos: usa el bálsamo en ellas.",
    ["The first half of the pendant lies under the water in the far north of the Barrens."] =
        "La primera mitad del colgante está bajo el agua, en el extremo norte de Los Baldíos.",
    ["The second half lies under the water off the coast of Silverpine Forest."] =
        "La segunda mitad está bajo el agua, frente a la costa del Bosque de Argénteos.",
    ["Turak Runetotem gives it, in the Elder Rise of Thunder Bluff."] =
        "Te la da Turak Runatótem, en el Alto de los Ancestros de Cima del Trueno.",
    ["Thotar, the hunter trainer of Razor Hill."] =
        "Thotar, el instructor de cazadores de Cerrotajo.",
    ["Use the taming rod on a Dire Mottled Boar, south of Razor Hill. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Usa la Fusta de domador en un Jabalí jaspeado feroz, al sur de Cerrotajo. Una vez domesticado, retíralo: vuelve a atacarte, así que prepárate.",
    ["Use the rod on a Surf Crawler, on the southern shore of Durotar, then dismiss it the same way."] =
        "Usa la fusta en un Reptador de espuma, en la costa sur de Durotar, y luego retíralo de la misma forma.",
    ["Use the rod on an Armored Scorpid, northwest of Razor Hill."] =
        "Usa la fusta en un Escórpido acorazado, al noroeste de Cerrotajo.",
    ["Ormak Grimshot, the hunter trainer of Orgrimmar, in the Valley of Honor."] =
        "Ormak Tirosiniestro, el instructor de cazadores de Orgrimmar, en el Valle del Honor.",
    ["Yaw Sharpmane, the hunter trainer of Bloodhoof Village."] =
        "Yaw Crinafilada, el instructor de cazadores del Poblado Pezuña de Sangre.",
    ["Use the taming rod on an Adult Plainstrider, north of the village. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Usa la Fusta de domador en un Zancudo de llanura adulto, al norte del poblado. Una vez domesticado, retíralo: vuelve a atacarte, así que prepárate.",
    ["Use the rod on a Prairie Stalker, southeast of the village, then dismiss it the same way."] =
        "Usa la fusta en un Acechador de pradera, al sureste del poblado, y luego retíralo de la misma forma.",
    ["Use the rod on a Swoop, in the plains north of the village."] =
        "Usa la fusta en un Aguilón, en las llanuras al norte del poblado.",
    ["Holt Thunderhorn, the hunter trainer of Thunder Bluff, on the Hunter Rise."] =
        "Holt Tronacuerno, el instructor de cazadores de Cima del Trueno, en el Alto de los Cazadores.",
    ["Uthel'nay, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "Uthel'nay, la instructora de magos de Orgrimmar, en el Valle de los Espíritus.",
    ["From level 10: your trainer's first errand, in Durotar."] =
        "Desde el nivel 10: el primer encargo de tu instructor, en Durotar.",
    ["Un'Thuwa, the mage trainer of Sen'jin Village."] =
        "Un'Thuwa, el instructor de magos del Poblado Sen'jin.",
    ["The Ju-Ju Heaps stand on the Echo Isles, off the southern coast."] =
        "Los Montones Ju-Ju están en las Islas del Eco, frente a la costa sur.",
    ["Cain Firesong, the mage trainer of Brill."] =
        "Cain Pirosón, el instructor de magos de Rémol.",
    ["From level 10: your trainer's first errand, in Tirisfal Glades."] =
        "Desde el nivel 10: el primer encargo de tu instructor, en los Claros de Tirisfal.",
    ["Anastasia Hartwell, the mage trainer of the Undercity, in the Magic Quarter."] =
        "Anastasia Hartwell, la instructora de magos de Entrañas, en el Barrio de la Magia.",
    ["The snapdragons grow by the farm of the Balnirs, in the east of Tirisfal Glades."] =
        "Las bocas de dragón crecen junto a la granja de los Balnir, al este de los Claros de Tirisfal.",
    ["From level 15: a chain in the Undercity that ends with a robe for you."] =
        "Desde el nivel 15: una cadena en Entrañas que termina con una toga para ti.",
    ["The chest of coffers and the cantation lie beside Anastasia."] =
        "El cofre de arcas y el canto están al lado de Anastasia.",
    ["The alchemist shop of the Undercity"] =
        "La tienda de alquimia de Entrañas",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it."] =
        "Lee el canto para revelar una Cría del risco, lucha con ella hasta que quede aturdida y luego usa un arca sobre ella.",
    ["The Dalaran mages of Ambermill, in Silverpine Forest, carry the mana gems; the linen comes from humanoids anywhere."] =
        "Los magos de Dalaran de Molino Ámbar, en el Bosque de Argénteos, llevan las gemas de maná; el lino lo sueltan los humanoides de cualquier parte.",
    ["Josef Gregorian, the tailor of the Undercity's Rogues' Quarter."] =
        "Josef Gregorian, el sastre del Barrio de los Pícaros de Entrañas.",
    ["Your reward: the Spellfire Robes."] =
        "Tu recompensa: la Toga Fuegohechizo.",
    ["Deino, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "Deino, la instructora de magos de Orgrimmar, en el Valle de los Espíritus.",
    ["Fill the flask at the waterfall of Xavian, in eastern Ashenvale: take the path up from the south."] =
        "Llena el frasco en la cascada de Xavian, al este de Vallefresno: sube por el sendero desde el sur.",
    ["The Laughing Sisters, nymphs of the woods of central Ashenvale, carry the hair."] =
        "Las Hermanas sonrientes, ninfas de los bosques del centro de Vallefresno, llevan el cabello.",
    ["Kil'hala, the tailor of the Crossroads."] =
        "Kil'hala, la sastra de El Cruce.",
    ["Your reward: the Nether-lace Garment."] =
        "Tu recompensa: las Prendas de encaje abisal.",
    ["Shadow Priest Sarvis, at the start of Deathknell."] =
        "El Sacerdote de las Sombras Sarvis, al principio de Camposanto.",
    ["The Forsaken paladin's story, a chain added by Forever, starts in Deathknell."] =
        "La historia del paladín renegado, una cadena añadida por Forever, empieza en Camposanto.",
    ["Aramis Hammerhand, the paladin trainer of Deathknell."] =
        "Aramis Hammerhand, el instructor de paladines de Camposanto.",
    ["Shari Stilwell, the paladin trainer of Brill."] =
        "Shari Stilwell, la instructora de paladines de Rémol.",
    ["Breton Samuels, at the outpost in the west of Tirisfal Glades."] =
        "Breton Samuels, en la avanzada del oeste de los Claros de Tirisfal.",
    ["Jorin Croge, a few steps away."] =
        "Jorin Croge, a pocos pasos.",
    ["The Vile Fin murlocs of the western coast."] =
        "Los múrlocs Anca Vil de la costa oeste.",
    ["The lumber piles lie on the western coast, south of the murlocs."] =
        "Los montones de madera están en la costa oeste, al sur de los múrlocs.",
    ["Danitha Morr, at the outpost."] =
        "Danitha Morr, en la avanzada.",
    ["The Tarnished gather on the western coast; Rudolph Gelhardt, their paladin, carries the head the quest asks for."] =
        "Los Tarnished se reúnen en la costa oeste; Rudolph Gelhardt, su paladín, lleva la cabeza que pide la misión.",
    ["Lady Sylvanas Windrunner, in the Royal Quarter of the Undercity."] =
        "Lady Sylvanas Brisaveloz, en el Barrio Real de Entrañas.",
    ["Danitha Morr, at the outpost in the west of Tirisfal Glades."] =
        "Danitha Morr, en la avanzada del oeste de los Claros de Tirisfal.",
    ["From level 12: the lessons in divinity, the next chapter of the Forsaken paladin's story."] =
        "Desde el nivel 12: las lecciones de divinidad, el siguiente capítulo de la historia del paladín renegado.",
    ["Tanis Alderwood, in the Undercity."] =
        "Tanis Alderwood, en Entrañas.",
    ["Tanis needs Linen Cloth: humanoids carry it everywhere."] =
        "Tanis necesita Paño de lino: lo llevan los humanoides de todas partes.",
    ["Deathguard Billmuth, at the outpost."] =
        "Deathguard Billmuth, en la avanzada.",
    ["Deathguard Falgan, in the east of Tirisfal Glades, near the Scarlet watch post."] =
        "Deathguard Falgan, al este de los Claros de Tirisfal, cerca del puesto de vigilancia Escarlata.",
    ["The Scarlet zealots and friars of the watch post carry the attack plans."] =
        "Los zelotes y frailes Escarlata del puesto de vigilancia llevan los planes de ataque.",
    ["From level 18: the story goes on in Silverpine Forest, around a moonsilver blade."] =
        "Desde el nivel 18: la historia sigue en el Bosque de Argénteos, en torno a una hoja de plata lunar.",
    ["Trevan Rol, at the Sepulcher."] =
        "Trevan Rol, en El Sepulcro.",
    ["Deathguard Baldren, at the Sepulcher."] =
        "Deathguard Baldren, en El Sepulcro.",
    ["The charred remains lie in the east of Silverpine Forest, facing Fenris Isle."] =
        "Los restos calcinados están al este del Bosque de Argénteos, frente a la Isla de Fenris.",
    ["Lumina Windsinger, held in Fenris Keep."] =
        "Lumina Windsinger, presa en el Castillo de Fenris.",
    ["The Rot Hide gnolls of Fenris Isle carry the key."] =
        "Los gnolls Putrepellejo de la Isla de Fenris llevan la llave.",
    ["Lumina Windsinger waits again at the Sepulcher."] =
        "Lumina Windsinger vuelve a esperar en El Sepulcro.",
    ["Old Fire-Eye prowls the south of Silverpine Forest."] =
        "Old Fire-Eye merodea por el sur del Bosque de Argénteos.",
    ["Ott, the weaponsmith of Tarren Mill."] =
        "Ott, el forjador de armas de Molino Tarren.",
    ["Ulric Frostveil, at Zoram'gar Outpost on the coast of Ashenvale."] =
        "Ulric Frostveil, en la Avanzada de Zoram'gar, en la costa de Vallefresno.",
    ["From level 20: Ulric Frostveil's quest of the Kor Gem, in Ashenvale."] =
        "Desde el nivel 20: la misión de la gema Kor de Ulric Frostveil, en Vallefresno.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand, carry the corrupted gem. They are elite: bring a group."] =
        "Las nagas de la entrada de las Cavernas de Brazanegra, bajo el agua de La Ensenada de Zoram, llevan la gema corrupta. Son élite: ve en grupo.",
    ["Ken'jai, the priest trainer of the Valley of Trials."] =
        "Ken'jai, el instructor de sacerdotes del Valle de los Retos.",
    ["From level 5: heal a wounded grunt, and get your first robe."] =
        "Desde el nivel 5: sana a un bruto herido y consigue tu primera toga.",
    ["Tai'jin, the priest trainer of Razor Hill."] =
        "Tai'jin, la instructora de sacerdotes de Cerrotajo.",
    ["Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "Bruto Kor'ja yace herida al sur de Cerrotajo: sánala con Sanación inferior y luego dale Palabra de poder: entereza.",
    ["Dark Cleric Duesten, the priest trainer of Deathknell."] =
        "El Clérico oscuro Duesten, el instructor de sacerdotes de Camposanto.",
    ["From level 5: heal a wounded deathguard, and get your first robe."] =
        "Desde el nivel 5: sana a un guardia de la Muerte herido y consigue tu primera toga.",
    ["Dark Cleric Beryl, the priest trainer of Brill."] =
        "El Clérico oscuro Beryl, el instructor de sacerdotes de Rémol.",
    ["Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "El Guardia de la Muerte Kel yace herido al norte de Rémol: sánalo con Sanación inferior y luego dale Palabra de poder: entereza.",
    ["From level 10: the quest that teaches Hex of Weakness."] =
        "Desde el nivel 10: la misión que enseña Maleficio de debilidad.",
    ["Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits."] =
        "Ur'kyo, el instructor de sacerdotes de Orgrimmar, en el Valle de los Espíritus.",
    ["Aelthalyste, the priest trainer of the Undercity, in the War Quarter."] =
        "Aelthalyste, la instructora de sacerdotes de Entrañas, en el Barrio de la Guerra.",
    ["From level 10: the quest that teaches Touch of Weakness."] =
        "Desde el nivel 10: la misión que enseña Toque de debilidad.",
    ["From level 20: the quest that teaches Shadowguard."] =
        "Desde el nivel 20: la misión que enseña Guardia de las Sombras.",
    ["From level 20: the quest that teaches Devouring Plague."] =
        "Desde el nivel 20: la misión que enseña Peste devoradora.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it."] =
        "Aprende Forzar cerradura con tu instructor y luego practica con arcones hasta que tu habilidad llegue a 75: el arcón de Gallywix, a nivel 20, lo necesita.",
    ["Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar."] =
        "Shenthul, en una tienda del Circo de las Sombras, en Orgrimmar.",
    ["Shenthul greets you with a hand sign: answer it with the salute emote."] =
        "Shenthul te saluda con una seña: respóndele con la emoción de saludo.",
    ["By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him."] =
        "Junto a la torre de Ventura y Cía., en el extremo norte de Los Baldíos: selecciona al Capataz Burbujita, dispara dos veces la pistola de bengalas y luego salúdalo.",
    ["In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox."] =
        "En la torre: roba la llave de Silixiz de su bolsillo, mata a los guardias piso a piso, con Gallywix en lo alto, y luego abre su arcón.",
    ["The lockbox leaves a sickness on you: Shenthul sends you to be cured."] =
        "El arcón te deja una enfermedad: Shenthul te envía a que te curen.",
    ["Serge Hinott, the alchemist of Tarren Mill."] =
        "Serge Hinott, el alquimista de Molino Tarren.",
    ["Stay by Serge while he prepares the cure."] =
        "Quédate junto a Serge mientras prepara la cura.",
    ["Canaga Earthcaller, in the Valley of Trials."] =
        "Canaga Clamatierras, en el Valle de los Retos.",
    ["The Felstalkers of the valley carry the hooves."] =
        "Los acechadores viles del valle llevan las pezuñas.",
    ["Up the hill path south of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "Subiendo por el sendero de la colina al sur del valle: bebe la Sapta de tierra para ver la Manifestación de tierra menor.",
    ["Seer Ravenfeather, in Camp Narache."] =
        "Vidente Pluma de Cuervo, en el Campamento Narache.",
    ["The Bristleback shamans east of the camp carry the salve."] =
        "Los chamanes Lomopelo al este del campamento llevan el bálsamo.",
    ["On the hill south of the camp: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "En la colina al sur del campamento: bebe la Sapta de tierra para ver la Manifestación de tierra menor.",
    ["Windshaper Boro, on Zephras Isle."] =
        "Windshaper Boro, en la isla de Zephras.",
    ["Drink the Earth Sapta to see the Minor Manifestation of Earth, east of Boro."] =
        "Bebe la Sapta de tierra para ver la Manifestación de tierra menor, al este de Boro.",
    ["Swart, the shaman trainer of Razor Hill."] =
        "Swart, el instructor de chamanes de Cerrotajo.",
    ["Narm Skychaser, the shaman trainer of Bloodhoof Village."] =
        "Narm Cazacielo, el instructor de chamanes del Poblado Pezuña de Sangre.",
    ["Kranal Fiss, at the Far Watch Post on the border of the Barrens."] =
        "Kranal Fiss, en la Avanzada del Puente, en la frontera de Los Baldíos.",
    ["Telf Joolam, on top of a mountain in the west of Durotar."] =
        "Telf Joolam, en lo alto de una montaña al oeste de Durotar.",
    ["The Razormane of the northern Barrens carry the Fire Tar; the Burning Blade cultists of the cave north of Razor Hill carry the pouches."] =
        "Los Crines de Acero del norte de Los Baldíos llevan el Alquitrán; los fieles Filo Ardiente de la cueva al norte de Cerrotajo llevan las bolsitas.",
    ["Right by Telf: drink the Fire Sapta, then defeat the Minor Manifestation of Fire for its ember."] =
        "Justo al lado de Telf: bebe la Sapta de fuego y luego derrota a la Manifestación de fuego menor para conseguir su ascua.",
    ["Sessaria Skystride, on Zephras Isle."] =
        "Sessaria Skystride, en la isla de Zephras.",
    ["Olariaan Swiftburn, in the south of the isle."] =
        "Olariaan Swiftburn, al sur de la isla.",
    ["Skypriest Faladiel carries the heart."] =
        "Skypriest Faladiel lleva el corazón.",
    ["Kuramaa, the spirit of mischief, carries the mask."] =
        "Kuramaa, el espíritu de la travesura, lleva la máscara.",
    ["Light the Brazier of Offering by Olariaan, then the Brazier of Eternal Flame by Sessaria."] =
        "Enciende el Brazier of Offering junto a Olariaan y luego el Brazier of Eternal Flame junto a Sessaria.",
    ["Searn Firewarder, in the Valley of Wisdom of Orgrimmar."] =
        "Searn Guardafogo, en el Valle de la Sabiduría de Orgrimmar.",
    ["Xanis Flameweaver, on the Elder Rise of Thunder Bluff."] =
        "Xanis Tejedor de Fuego, en el Alto de los Ancestros de Cima del Trueno.",
    ["Islen Waterseer, by the coast east of the Barrens."] =
        "Islen Vident'aqua, junto a la costa al este de Los Baldíos.",
    ["Brine, in the south of the Barrens."] =
        "Salmuera, al sur de Los Baldíos.",
    ["Fill the waterskin at the quilboar watering hole, right by Brine."] =
        "Llena la bota en el abrevadero de los jabaespines, justo al lado de Salmuera.",
    ["Fill it at the Spring Well of Tarren Mill, in Hillsbrad Foothills."] =
        "Llénala en la Fontana de Molino Tarren, en las Laderas de Trabalomas.",
    ["Fill it at the ruins of the Stardust Fountain, in the south of Ashenvale."] =
        "Llénala en las ruinas de la Fuente del Polvo Estelar, al sur de Vallefresno.",
    ["By the Brazier of Everfount, in the lake of Silverpine Forest: use the brazier's water, then defeat the corrupt manifestation for its bracers."] =
        "Junto al Blandón de Siemprefuente, en el lago del Bosque de Argénteos: usa el agua del blandón y luego derrota a la manifestación corrupta para conseguir sus brazales.",
    ["The Minor Manifestation of Water rises beside the brazier."] =
        "La Manifestación de agua menor surge junto al blandón.",
    ["Prate Cloudseer, on a mesa in the middle of Thousand Needles."] =
        "Prate Vidente de las Nubes, en una meseta en el centro de Las Mil Agujas.",
    ["Rau Cliffrunner, at Freewind Post."] =
        "Rau Abiscorredor, en el Poblado Viento Libre.",
    ["From level 33: Forever's elemental quests of Rau Cliffrunner, in Thousand Needles."] =
        "Desde el nivel 33: las misiones elementales de Rau Abiscorredor, propias de Forever, en Las Mil Agujas.",
    ["Beram Skychaser in Thunder Bluff, or Sagorne Creststrider in Orgrimmar."] =
        "Beram Cazacielo en Cima del Trueno, o Sagorne Zanca Cresta en Orgrimmar.",
    ["From level 50: Bath'rah the Windwatcher's chain, which ends in the Temple of Atal'Hakkar."] =
        "Desde el nivel 50: la cadena de Bath'rah el Vigía del viento, que termina en el Templo de Atal'Hakkar.",
    ["One Elemental Earth, Fire, Water and Air: elementals drop them, or the auction house sells them."] =
        "Un Elemental de tierra, de fuego, de agua y de aire: los sueltan los elementales, o se venden en la casa de subastas.",
    ["The spiders and the bears of the Western Plaguelands carry the eyes and the claws."] =
        "Las arañas y los osos de las Tierras de la Peste del Oeste llevan los ojos y las garras.",
    ["Ruzan, in the Valley of Trials."] =
        "Ruzan, en el Valle de los Retos.",
    ["Your trainer's first errand, in the Valley of Trials."] =
        "El primer encargo de tu instructor, en el Valle de los Retos.",
    ["The Vile Familiars of the cave south of the valley carry the heads."] =
        "Los familiares viles de la cueva al sur del valle llevan las cabezas.",
    ["Zureetha Fargaze, beside Ruzan."] =
        "Zureetha Vistalonga, al lado de Ruzan.",
    ["Venya Marthand, in Deathknell."] =
        "Venya Martmani, en Camposanto.",
    ["Your trainer's first errand, in Deathknell."] =
        "El primer encargo de tu instructor, en Camposanto.",
    ["The Rattlecage Skeletons east of Deathknell carry the skulls."] =
        "Los esqueletos armadóseos al este de Camposanto llevan los cráneos.",
    ["Ophek, in Razor Hill, sends you to Orgrimmar."] =
        "Ophek, en Cerrotajo, te envía a Orgrimmar.",
    ["Gan'rul Bloodeye, in the Cleft of Shadow of Orgrimmar."] =
        "Ojo sangriento de Gan'rul, en el Circo de las Sombras de Orgrimmar.",
    ["The Tablet of Verga lies in the Burning Blade stash at the back of Skull Rock, in the north of Durotar."] =
        "La Tablilla de Verga está en el alijo del Filo Ardiente, al fondo de la Roca del Cráneo, al norte de Durotar.",
    ["Right by Gan'rul: use the glyphs on the summoning circle, then defeat the voidwalker."] =
        "Justo al lado de Gan'rul: usa los glifos en el círculo de invocación y luego derrota al abisario.",
    ["Ageron Kargal, in Brill, sends you to the Undercity."] =
        "Ageron Kargal, en Rémol, te envía a Entrañas.",
    ["Carendin Halgar, in the Magic Quarter of the Undercity."] =
        "Carendin Halgar, en el Barrio de la Magia de Entrañas.",
    ["Egalin's Grimoire lies in Perrine's chest, in the house south of Brill."] =
        "El Grimorio de Egalin está en el cofre de Perrine, en la casa al sur de Rémol.",
    ["Right by Carendin: use the runes on the summoning circle, then defeat the voidwalker."] =
        "Justo al lado de Carendin: usa las runas en el círculo de invocación y luego derrota al abisario.",
    ["Cazul, in the Cleft of Shadow."] =
        "Cazul, en el Circo de las Sombras.",
    ["Zankaja, in the Valley of Spirits of Orgrimmar."] =
        "Zankaja, en el Valle de los Espíritus de Orgrimmar.",
    ["Gazrog, at the Crossroads."] =
        "Gazrog, en El Cruce.",
    ["Ken'zigla, at the camp of Malaka'jin in the far south of Stonetalon Mountains."] =
        "Ken'zigla, en el campamento de Malaka'jin, en el extremo sur de la Sierra Espolón.",
    ["Grunt Logmar, by the road north of Camp Taurajo."] =
        "El Bruto Logmar, junto al camino al norte del Campamento Taurajo.",
    ["Grunt Dogran is held by the Kolkar in the Barrens: give him the draught."] =
        "El Bruto Dogran es prisionero de los Kolkar en Los Baldíos: dale el brebaje.",
    ["Right by Gan'rul: use Dogran's pendant on the summoning circle, then defeat the succubus."] =
        "Justo al lado de Gan'rul: usa el colgante de Dogran en el círculo de invocación y luego derrota al súcubo.",
    ["Jorah Annison, in the Magic Quarter of the Undercity."] =
        "Jorah Annison, en el Barrio de la Magia de Entrañas.",
    ["The Dragonmaw orcs of the Wetlands carry the rod: Alliance land, stay clear of the guards."] =
        "Los orcos Faucedraco de Los Humedales llevan la vara: tierra de la Alianza, mantente lejos de los guardias.",
    ["Zevrost, the warlock trainer of the Cleft of Shadow."] =
        "Zevrost, el instructor de brujos del Circo de las Sombras.",
    ["Kurgul, the demon trainer of the Cleft of Shadow."] =
        "Kurgul, el instructor de demonios del Circo de las Sombras.",
    ["Your warrior trainer, in Razor Hill or Bloodhoof Village, sends you to Uzzek."] =
        "Tu instructor de guerreros, en Cerrotajo o en el Poblado Pezuña de Sangre, te envía con Uzzek.",
    ["Uzzek, at the Far Watch Post on the border of the Barrens."] =
        "Uzzek, en la Avanzada del Puente, en la frontera de Los Baldíos.",
    ["From level 10: the quest that teaches Defensive Stance."] =
        "Desde el nivel 10: la misión que enseña Actitud defensiva.",
    ["The Thunder Lizards of the north of Durotar carry the scales."] =
        "Los truenagartos del norte de Durotar llevan las escamas.",
    ["Thun'grim Firegaze, on a hill east of the Crossroads."] =
        "Thun'grim Vistafuego, en una colina al este de El Cruce.",
    ["The steel bars lie in the Razormane camp below the hill."] =
        "Las barras de acero están en el campamento Crines de Acero, al pie de la colina.",
    ["Austil de Mon, the warrior trainer of Brill."] =
        "Austil de Mon, el instructor de guerreros de Rémol.",
    ["Deathguard Dillinger, in Brill."] =
        "El Guardia de la Muerte Dillinger, en Rémol.",
    ["Open the mausoleum north of Brill: Ulag the Cleaver comes out."] =
        "Abre el mausoleo al norte de Rémol: sale Ulag el Cuchillero.",
    ["Coleman Farthing, in the inn of Brill."] =
        "Coleman Lontananza, en la posada de Rémol.",
    ["The four heirlooms lie in the crypt of the Agamand Mills, in the northwest of Tirisfal Glades."] =
        "Las cuatro reliquias están en la cripta de los Molinos de Agamand, al noroeste de los Claros de Tirisfal.",
    -- Ding! - Dungeon quests (hand-written guides)
    ["The Hall of Thanes"] =
        "La Sala de los Thanes",
    ["Afadra Dunwall and Thom Filch, in the west of Ironforge."] =
        "Afadra Dunwall y Thom Filch, en la parte oeste de Forjaz.",
    ["Two quests of the hall: a leather belt or mail bracers, cloth gloves or an off-hand tome."] =
        "Dos misiones de la sala: un cinturón de cuero o unos brazales de malla, unos guantes de tela o un tomo para la mano izquierda.",
    ["The Dark Iron spies of the east of Dun Morogh may drop a Dark Iron map: read it."] =
        "Los espías Hierro Negro del este de Dun Morogh pueden soltar un mapa Hierro Negro: léelo.",
    ["The Dark Iron map opens Old Ironforge Incursion: a gun, a wand or a two-handed mace."] =
        "El mapa Hierro Negro abre «Old Ironforge Incursion»: un arma de fuego, una varita o una maza de dos manos.",
    ["Earthseer Farsen, in the east of Dun Morogh."] =
        "Earthseer Farsen, al este de Dun Morogh.",
    ["Enter the Hall of Thanes"] =
        "Entra en la Sala de los Thanes",
    ["The hall lies beneath Old Ironforge, in the west of the city."] =
        "La sala está bajo la Antigua Forjaz, en la parte oeste de la ciudad.",
    ["Kill the enraged apparitions and the tormented souls of the hall, then put the spirit of Anvilmar to rest."] =
        "Mata a las apariciones enfurecidas y a las almas atormentadas de la sala, y luego da descanso al espíritu de Anvilmar.",
    ["The dwarven heirlooms lie around the hall."] =
        "Las reliquias familiares enanas están repartidas por la sala.",
    ["The Treaty of Understanding lies in the hall: take it, then read it."] =
        "El Treaty of Understanding está en la sala: recógelo y luego léelo.",
    ["Durgen Dirgehammer carries the head the quest asks for."] =
        "Durgen Dirgehammer lleva la cabeza que pide la misión.",
    ["Afadra Dunwall and Thom Filch, in Ironforge."] =
        "Afadra Dunwall y Thom Filch, en Forjaz.",
    ["King Magni Bronzebeard, in the High Seat of Ironforge."] =
        "El Rey Magni Barbabronce, en El Trono de Forjaz.",
    ["King Magni Bronzebeard."] =
        "El Rey Magni Barbabronce.",
    ["Wailing Caverns"] =
        "Cuevas de los Lamentos",
    ["Mebok Mizzyrix, in Ratchet."] =
        "Mebok Mizzyrix, en Trinquete.",
    ["Raptor Horns opens Smart Drinks, a quest of the caverns."] =
        "«Los cuernos de raptor» abre «Las bebidas astutas», una misión de las cuevas.",
    ["Crane Operator Bigglefuzz, on the docks of Ratchet."] =
        "El Operador de grúa Pelardo, en los muelles de Trinquete.",
    ["The sunscale raptors roam the plains between the Crossroads and Ratchet."] =
        "Los raptores Solescama recorren las llanuras entre El Cruce y Trinquete.",
    ["Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge."] =
        "Nalpak y Ebru están en una cueva de la colina de las cuevas: sube a la colina por el este, sigue el sendero y déjate caer sobre la cornisa de roca.",
    ["Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand."] =
        "Dos misiones de las criaturas descarriadas; entre sus recompensas hay una bolsa, unos leotardos de cuero, unos guanteletes de malla o una varita.",
    ["Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door."] =
        "Magglish el Loco, un goblin que se mantiene oculto, recorre las cuevas alrededor de la puerta de la mazmorra.",
    ["Enter Wailing Caverns"] =
        "Entra en las Cuevas de los Lamentos",
    ["The mouth of the caverns opens on the hill above the Lushwater Oasis."] =
        "La boca de las cuevas se abre en la colina que hay sobre el Oasis Aguaverde.",
    ["Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on."] =
        "Todas las criaturas descarriadas sueltan pellejos: raptores, latigadores y serpientes, desde las primeras salas.",
    ["The ectoplasms, living oozes of the caverns, drop the essence."] =
        "Los ectoplasmas, mocos vivientes de las cuevas, sueltan la esencia.",
    ["Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in."] =
        "Los devastadores y las víboras llenan las primeras salas; los arrastrados y los colminfernos aparecen más adentro.",
    ["Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead."] =
        "Mutanus el Devorador puede soltar el Fragmento resplandeciente: aparece tras el ritual del Discípulo de Naralex, que empieza cuando han muerto los cuatro señores del Colmillo.",
    ["Nalpak and Ebru, in their cave on the caverns' hill."] =
        "Nalpak y Ebru, en su cueva de la colina de las cuevas.",
    ["Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet."] =
        "Mebok Mizzyrix y el Operador de grúa Pelardo, en Trinquete.",
    ["Sputtervalve, in Ratchet, knows what the shard is."] =
        "Petardol, en Trinquete, sabe qué es el fragmento.",
    ["Falla Sagewind, on top of the caverns' hill."] =
        "Fala Ventsalvia, en lo alto de la colina de las cuevas.",
    ["Mathrengyl Bearwalker, in the Cenarion Enclave of Darnassus."] =
        "Mathrengyl Garroso, en el Enclave Cenarion de Darnassus.",
    ["The Deadmines"] =
        "Las Minas de la Muerte",
    ["Wilder Thistlenettle, in the Dwarven District of Stormwind."] =
        "Wilder Cardortiga, en el Distrito de los Enanos de Ventormenta.",
    ["Two quests of the mine under Moonbrook; their rewards include a two-handed axe and cloth, leather or mail armor."] =
        "Dos misiones de la mina bajo Arroyo de la Luna; entre sus recompensas hay un hacha de dos manos y armaduras de tela, de cuero o de malla.",
    ["Shoni the Shilent, in the Dwarven District."] =
        "Shoni el Shilenshioso, en el Distrito de los Enanos.",
    ["Reward: armor of leather or mail, or a wand."] =
        "Recompensa: una armadura de cuero o de malla, o una varita.",
    ["Gryan Stoutmantle, in the tower of Sentinel Hill, in Westfall."] =
        "Gryan Mantorrecio, en la torre de la Colina del Centinela, en los Páramos de Poniente.",
    ["A long chain of six quests between Westfall, Redridge and Stormwind: it leads to VanCleef, whose head brings mail leggings, a leather tunic or a staff."] =
        "Una larga cadena de seis misiones entre los Páramos de Poniente, Crestagrana y Ventormenta: lleva hasta VanCleef, cuya cabeza da unos leotardos de malla, una túnica de cuero o un bastón.",
    ["Alba Fairmoon, south-west of Sentinel Hill."] =
        "Alba Fairmoon, al suroeste de la Colina del Centinela.",
    ["A quest of the mine under Moonbrook, ended at the Deadmines' exit."] =
        "Una misión de la mina bajo Arroyo de la Luna, que se entrega a la salida de Las Minas de la Muerte.",
    ["Wiley the Black, in the inn of Lakeshire, in Redridge."] =
        "Wiley el Negro, en la posada de Villa del Lago, en Crestagrana.",
    ["Gryan Stoutmantle, at Sentinel Hill."] =
        "Gryan Mantorrecio, en la Colina del Centinela.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town, in Stormwind."] =
        "El Maestro Mathias Shaw, en la casa del IV:7 del Casco Antiguo, en Ventormenta.",
    ["The Defias Messenger walks the road to Moonbrook; he carries the message."] =
        "El Mensajero Defias recorre el camino de Arroyo de la Luna; lleva el mensaje.",
    ["Follow the Defias Traitor to Moonbrook; Defias attack on the way."] =
        "Sigue al Traidor de los Defias hasta Arroyo de la Luna; los Defias atacan por el camino.",
    ["Scout Riell, at the top of the Sentinel Hill tower."] =
        "El Explorador Riell, en lo alto de la torre de la Colina del Centinela.",
    ["Reward: a weapon of your choice."] =
        "Recompensa: un arma a tu elección.",
    ["Go down into the mine under Moonbrook"] =
        "Baja a la mina bajo Arroyo de la Luna",
    ["The mine opens inside a house in the middle of Moonbrook."] =
        "La mina se abre dentro de una casa, en el centro de Arroyo de la Luna.",
    ["Foreman Thistlenettle and the undead miners roam the mine's tunnels, before the dungeon's door."] =
        "El Supervisor Cardortiga y los mineros no-muertos recorren los túneles de la mina, antes de la puerta de la mazmorra.",
    ["Plant the explosives by the forge hidden in the Deadmines."] =
        "Coloca los explosivos junto a la forja oculta en Las Minas de la Muerte.",
    ["Every Defias of the dungeon may drop a bandana."] =
        "Todos los Defias de la mazmorra pueden soltar un pañuelo.",
    ["Sneed's Shredder, the second boss, in the goblins' lumber cave, drops the Gnoam Sprecklesprocket."] =
        "La Trituradora de Sneed, el segundo jefe, en la cueva maderera de los goblins, suelta la Dentrituradora goblin.",
    ["Edwin VanCleef, the last boss, waits on the deck of the Defias ship at the end of the cave."] =
        "Edwin VanCleef, el último jefe, espera en la cubierta del barco Defias, al final de la cueva.",
    ["VanCleef drops a letter: read it to take its quest."] =
        "VanCleef suelta una carta: léela para aceptar su misión.",
    ["Alba Fairmoon waits at the Deadmines' exit, on the coast south-west of Moonbrook."] =
        "Alba Fairmoon espera a la salida de Las Minas de la Muerte, en la costa al suroeste de Arroyo de la Luna.",
    ["Use her detonator, then tell her."] =
        "Usa su detonador y luego avísala.",
    ["Gryan Stoutmantle and Scout Riell, in the Sentinel Hill tower."] =
        "Gryan Mantorrecio y el Explorador Riell, en la torre de la Colina del Centinela.",
    ["Baros Alexston, in the City Hall of the Cathedral Square."] =
        "Baros Alexston, en el Ayuntamiento de la Plaza de la Catedral.",
    ["Bazil Thredd leads to the Stockade's riots."] =
        "«Bazil Thredd» lleva al motín de Las Mazmorras.",
    ["Warden Thelwater, at the door of the Stockade, in Stormwind."] =
        "El Alcaide Thelagua, en la puerta de Las Mazmorras, en Ventormenta.",
    ["Ruins of Lordaeron"] =
        "Ruinas de Lordaeron",
    ["Enter the Ruins of Lordaeron"] =
        "Entra en las Ruinas de Lordaeron",
    ["The ruins rise above Undercity, in Tirisfal Glades: Horde land, keep your guard up."] =
        "Las ruinas se alzan sobre Entrañas, en los Claros de Tirisfal: tierra de la Horda, mantente alerta.",
    ["The undead of the ruins may drop a bloodied insignia: read it."] =
        "Los no-muertos de las ruinas pueden soltar una insignia ensangrentada: léela.",
    ["Reward: leather leggings or mail armor."] =
        "Recompensa: unos leotardos de cuero o una armadura de malla.",
    ["Ten insignias, from the undead of the ruins."] =
        "Diez insignias, de los no-muertos de las ruinas.",
    ["The Crest of Lordaeron lies in the ruins: take it, then read it."] =
        "El Crest of Lordaeron está en las ruinas: recógelo y luego léelo.",
    ["Reward: a small sack of gems."] =
        "Recompensa: un saquito de gemas.",
    ["Edward Heartweaver's last letter lies in the ruins: read it."] =
        "La última carta de Edward Heartweaver está en las ruinas: léela.",
    ["General Marcus Jonathan, at the gate of Stormwind."] =
        "El General Marcus Jonathan, en la puerta de Ventormenta.",
    ["Lady Dena Kennedy, in Stormwind."] =
        "Lady Dena Kennedy, en Ventormenta.",
    ["Orphan Matron Nightingale, at the orphanage of Stormwind."] =
        "La Supervisora de huérfanos Ruiseñor, en el orfanato de Ventormenta.",
    ["Blackfathom Deeps"] =
        "Cavernas de Brazanegra",
    ["Argos Nightwhisper, in Stormwind."] =
        "Argos Noctusurro, en Ventormenta.",
    ["Optional: a lead to Auberdine, worth about 1,450 XP once there."] =
        "Opcional: una misión que lleva a Auberdine y da unos 1.450 de XP al llegar.",
    ["Gerrig Bonegrip, in the Forlorn Cavern of Ironforge."] =
        "Gerrig Agarrahueso, en La Caverna Abandonada de Forjaz.",
    ["Reward: a ring."] =
        "Recompensa: un anillo.",
    ["Gershala Nightwhisper, in Auberdine, in Darkshore."] =
        "Gershala Noctusurro, en Auberdine, en Costa Oscura.",
    ["Gershala Nightwhisper, in Auberdine."] =
        "Gershala Noctusurro, en Auberdine.",
    ["Reward: cloth, leather or mail armor."] =
        "Recompensa: una armadura de tela, de cuero o de malla.",
    ["Argent Guard Manados and Dawnwatcher Shaedlass, in Darnassus."] =
        "El Guardia Argenta Manados y Shaedlass Guardalbas, en Darnassus.",
    ["Two quests of the Argent Dawn: the second leads to Twilight Lord Kelris and a wand, a shield or leather armor."] =
        "Dos misiones del Alba Argenta: la segunda lleva hasta el Señor Crepuscular Kelris y a una varita, un escudo o una armadura de cuero.",
    ["Enter Blackfathom Deeps"] =
        "Entra en las Cavernas de Brazanegra",
    ["The deeps open in ruins half under water, on the coast of Ashenvale's Zoram Strand."] =
        "Las cavernas se abren en unas ruinas medio sumergidas, en la costa de La Ensenada de Zoram, en Vallefresno.",
    ["The Blackfathom and Fallenroot creatures carry the brain stems, from the cave before the dungeon's door on."] =
        "Las criaturas Brazanegra y Malarraíz llevan los bulbos raquídeos, desde la cueva anterior a la puerta de la mazmorra.",
    ["The manuscript lies in a chest under the water, by Ghamoo-ra, the first boss, in the Pool of Ask'ar."] =
        "El manuscrito está en un cofre bajo el agua, junto a Ghamoo-ra, el primer jefe, en la Poza de Ask'ar.",
    ["Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar."] =
        "El Guardia Argenta Thaelrid espera en una cueva submarina al suroeste de la Poza de Ask'ar.",
    ["Every Twilight cultist of the deeps may drop a pendant."] =
        "Todos los cultores Crepusculares de las cavernas pueden soltar un colgante.",
    ["Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum."] =
        "El Señor Crepuscular Kelris, el cuarto jefe, ocupa el Sagrario del Santuario Lunar.",
    ["Argent Guard Manados, in Darnassus."] =
        "El Guardia Argenta Manados, en Darnassus.",
    ["Dawnwatcher Selgorm, beside him in Darnassus."] =
        "Selgorm Guardalbas, a su lado en Darnassus.",
    ["The Stockade"] =
        "Las Mazmorras",
    ["Motley Garmason, at Dun Modr, in the north of the Wetlands."] =
        "Motley Garmason, en Dun Modr, al norte de Los Humedales.",
    ["Far north in the Wetlands: it opens The Fury Runs Deep, whose reward is a two-handed mace or a leather belt."] =
        "En el extremo norte de Los Humedales: abre «La furia mora en las profundidades», cuya recompensa es una maza de dos manos o un cinturón de cuero.",
    ["The Dark Iron dwarves camp around Dun Modr."] =
        "Los enanos Hierro Negro acampan alrededor de Dun Modr.",
    ["Guard Berton, in Lakeshire, in Redridge."] =
        "El Guardia Berton, en Villa del Lago, en Crestagrana.",
    ["Reward: a staff, a sword or a two-handed mace."] =
        "Recompensa: un bastón, una espada o una maza de dos manos.",
    ["Councilman Millstipe, in the town hall of Darkshire, in Duskwood."] =
        "El Consejero Tallolino, en el Concejo de Villa Oscura, en el Bosque del Ocaso.",
    ["Nikova Raskol, in Old Town, in Stormwind."] =
        "Nikova Raskol, en el Casco Antiguo, en Ventormenta.",
    ["Warden Thelwater, at the door of the Stockade."] =
        "El Alcaide Thelagua, en la puerta de Las Mazmorras.",
    ["Warden Thelwater asks for Bazil Thredd's head."] =
        "El Alcaide Thelagua pide la cabeza de Bazil Thredd.",
    ["Enter the Stockade"] =
        "Entra en Las Mazmorras",
    ["The prison's door is by Warden Thelwater, in Stormwind."] =
        "La puerta de la prisión está junto al Alcaide Thelagua, en Ventormenta.",
    ["Targorr the Dread, the first boss, sits in a cell near the start."] =
        "Targor el Pavoroso, el primer jefe, está en una celda cerca de la entrada.",
    ["Kam Deepfury: go north, then east; he waits in the second small cell on the left."] =
        "Kam Furiahonda: ve al norte y luego al este; espera en la segunda celda pequeña de la izquierda.",
    ["Bazil Thredd waits at the end of the east corridor."] =
        "Bazil Thredd espera al final del pasillo este.",
    ["Dextren Ward waits at the end of the west corridor."] =
        "Dextren Tutor espera al final del pasillo oeste.",
    ["The prisoners, convicts and insurgents fill every cell; the Defias among them drop the bandanas."] =
        "Los prisioneros, los presidiarios y los insurgentes llenan todas las celdas; los Defias de entre ellos sueltan los pañuelos.",
    ["Optional: nine more quests in Stormwind; the last brings a ring and about 3,750 XP."] =
        "Opcional: nueve misiones más en Ventormenta; la última da un anillo y unos 3.750 de XP.",
    ["Baros Alexston, in the City Hall."] =
        "Baros Alexston, en el Ayuntamiento.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town."] =
        "El Maestro Mathias Shaw, en la casa del IV:7 del Casco Antiguo.",
    ["Elling Trias, in the cheese shop of the Trade District."] =
        "Elling Trias, en la quesería del Distrito de Mercaderes.",
    ["Tyrion, near Stormwind Keep."] =
        "Tyrion, cerca del Castillo de Ventormenta.",
    ["Three silk cloth, and two of Clara's fresh apples, from a basket north-west of Goldshire, in Elwynn Forest."] =
        "Tres piezas de Paño de seda y dos Manzanas frescas de Clara, de una cesta al noroeste de Villadorada, en el Bosque de Elwynn.",
    ["Wait in the garden by Stormwind Keep until Lord Gregor Lescovar and Marzon the Silent Blade have talked, then defeat both."] =
        "Espera en el jardín junto al Castillo de Ventormenta hasta que Lord Gregor Lescovar y Marzon el Filo Silencioso hayan hablado, y luego derrota a los dos.",
    ["Elling Trias, in the cheese shop."] =
        "Elling Trias, en la quesería.",
    ["Master Mathias Shaw, in the SI:7 house."] =
        "El Maestro Mathias Shaw, en la casa del IV:7.",
    ["Lady Katrana Prestor, beside the king in Stormwind Keep."] =
        "Lady Katrana Prestor, al lado del rey en el Castillo de Ventormenta.",
    ["Nikova Raskol, in Old Town."] =
        "Nikova Raskol, en el Casco Antiguo.",
    ["Guard Berton, in Lakeshire."] =
        "El Guardia Berton, en Villa del Lago.",
    ["Councilman Millstipe, in Darkshire."] =
        "El Consejero Tallolino, en Villa Oscura.",
    ["Motley Garmason, at Dun Modr."] =
        "Motley Garmason, en Dun Modr.",
    ["Excavation Site: Wetlands"] =
        "Excavación: Los Humedales",
    ["James Halloran, the tanner of Menethil Harbor, in the Wetlands."] =
        "James Halloran, el curtidor del Puerto de Menethil, en Los Humedales.",
    ["Caitlin Grassman, in Menethil Harbor."] =
        "Caitlin Grassman, en el Puerto de Menethil.",
    ["Optional: the guide does not know yet who ends this search; its follow-up brings a satchel of potions."] =
        "Opcional: la guía aún no sabe quién termina esta búsqueda; la misión siguiente da una bolsa de pociones.",
    ["Rethiel the Greenwarden, in the middle of the Wetlands."] =
        "Rethiel el Guardaverde, en el centro de Los Humedales.",
    ["Reward: an axe, and about 3,200 XP."] =
        "Recompensa: un hacha y unos 3.200 de XP.",
    ["Dorin Songblade, the armorer of Lakeshire, in Redridge."] =
        "Dorin Filosón, el armero de Villa del Lago, en Crestagrana.",
    ["Optional: the guide does not know yet who ends this search."] =
        "Opcional: la guía aún no sabe quién termina esta búsqueda.",
    ["Enter the Excavation Site"] =
        "Entra en la excavación",
    ["The excavation site opens by the dig in the middle of the Wetlands."] =
        "La excavación se abre junto al yacimiento del centro de Los Humedales.",
    ["Four thicket raptor hides, from the raptors of the site."] =
        "Cuatro pieles de raptor de la espesura, de los raptores de la excavación.",
    ["A Highland Horror carries the root core."] =
        "Un Highland Horror lleva el núcleo de raíz.",
    ["Ardin Grassman, somewhere in the site."] =
        "Ardin Grassman, en algún lugar de la excavación.",
    ["Daewyn, somewhere in the site."] =
        "Daewyn, en algún lugar de la excavación.",
    ["The relic guardians may drop a Titan relic: read it."] =
        "Los guardianes de reliquias pueden soltar una reliquia de los titanes: léela.",
    ["The Titan relic leads to Ironforge's explorers: a staff or a two-handed mace."] =
        "La reliquia de los titanes lleva a los expedicionarios de Forjaz: un bastón o una maza de dos manos.",
    ["Prospector Whelgar, at his excavation camp in the Wetlands."] =
        "El Prospector Whelgar, en su campamento de excavación de Los Humedales.",
    ["Rethiel the Greenwarden."] =
        "Rethiel el Guardaverde.",
    ["James Halloran, in Menethil Harbor."] =
        "James Halloran, en el Puerto de Menethil.",
    ["Dorin Songblade, in Lakeshire."] =
        "Dorin Filosón, en Villa del Lago.",
    ["High Explorer Magellas, in the Hall of Explorers of Ironforge."] =
        "El Alto Expedicionario Magellas, en la Sala de los Exploradores de Forjaz.",
    ["Gnomeregan"] =
        "Gnomeregan",
    ["Shoni the Shilent, in the Dwarven District of Stormwind."] =
        "Shoni el Shilenshioso, en el Distrito de los Enanos de Ventormenta.",
    ["Reward: cloth or leather gloves, or an axe."] =
        "Recompensa: unos guantes de tela o de cuero, o un hacha.",
    ["Brother Sarno, in the Cathedral of Light."] =
        "El Hermano Sarno, en la Catedral de la Luz.",
    ["Optional: a lead to Tinkmaster Overspark in Ironforge."] =
        "Opcional: una misión que lleva al Maestro manitas Sobrechispa, en Forjaz.",
    ["Tinkmaster Overspark, in Tinker Town, in Ironforge."] =
        "El Maestro manitas Sobrechispa, en Ciudad Manitas, en Forjaz.",
    ["Tinkmaster Overspark, in Tinker Town."] =
        "El Maestro manitas Sobrechispa, en Ciudad Manitas.",
    ["Master Mechanic Castpipe, Klockmort Spannerspan and High Tinker Mekkatorque, in Tinker Town."] =
        "El Maestro mecánico Funditubo, Klockmort Palmalicate y el Alto Mecachifle Mekkatorque, en Ciudad Manitas.",
    ["Tinker Town's quests: Data Rescue brings a two-handed mace or a cloak, The Grand Betrayal cloth, leather or mail armor."] =
        "Las misiones de Ciudad Manitas: «Rescatar los datos» da una maza de dos manos o una capa, y «La gran traición», una armadura de tela, de cuero o de malla.",
    ["Gnoarn, in Tinker Town."] =
        "Gnoarn, en Ciudad Manitas.",
    ["Ozzie Togglevolt, in Kharanos, in Dun Morogh."] =
        "Oci Voltiflop, en Kharanos, en Dun Morogh.",
    ["Use the empty phial on the irradiated troggs that roam the gates of Gnomeregan."] =
        "Usa la ampolla vacía en los troggs irradiados que recorren las puertas de Gnomeregan.",
    ["Back to Ozzie Togglevolt, in Kharanos."] =
        "Vuelve con Oci Voltiflop, en Kharanos.",
    ["Enter Gnomeregan"] =
        "Entra en Gnomeregan",
    ["The gates of Gnomeregan stand in the west of Dun Morogh."] =
        "Las puertas de Gnomeregan están al oeste de Dun Morogh.",
    ["Techbot, the first boss, waits just inside: he drops the memory core."] =
        "Tecnobot, el primer jefe, espera nada más entrar: suelta el núcleo de memoria.",
    ["The tall, square machines of the city hold the artificials; every mechanical creature may drop the guts."] =
        "Las máquinas altas y cuadradas de la ciudad contienen las esencias artificiales; todas las criaturas mecánicas pueden soltar las entrañas.",
    ["Use the heavy phial on a living irradiated slime, in the lower Hall of Gears; the fallout does not last long."] =
        "Usa la ampolla pesada en una babosa irradiada viva, en la parte baja de la Sala de los Engranajes; los restos radiactivos no duran mucho.",
    ["The addled leper gnomes drop the white card; the four Matrix Punchographs, from A to D, turn it yellow, blue, red, then prismatic: A on the way in, B at the bottom of the Dormitory, C on the Launch Bay's platform (Electrocutioner 6000's key opens it), D in the lower Engineering Labs."] =
        "Los gnomos parias aturdidos sueltan la tarjeta blanca; los cuatro Perforágrafos Matriz, de la A a la D, la vuelven amarilla, azul, roja y luego prismática: el A, de camino hacia dentro; el B, al fondo del Dormitorio; el C, en la plataforma de la Bahía de Lanzamiento (la llave del Electrocutor 6000 la abre); el D, en la parte baja de los Laboratorios de Ingeniería.",
    ["Kernobee, a gnome held inside the city."] =
        "Kernobee, un gnomo retenido dentro de la ciudad.",
    ["Optional: an escort, turned in at Booty Bay, far away; it rewards bracers or shoulders."] =
        "Opcional: una escolta que se entrega en Bahía del Botín, muy lejos; da unos brazales o unas hombreras.",
    ["Lead Kernobee to the Clean Zone, by the dungeon's back door."] =
        "Lleva a Kernobee hasta la Zona Limpia, junto a la puerta trasera de la mazmorra.",
    ["The Dark Iron agents may drop a grimy ring: use it."] =
        "Los agentes Hierro Negro pueden soltar un anillo mugriento: úsalo.",
    ["Put it in the Sparklematic 5200, a cleaning machine of the city."] =
        "Mételo en la Chispamática 5200, una máquina de limpieza de la ciudad.",
    ["Mekgineer Thermaplugg, the last boss, waits in the Tinkers' Court."] =
        "El Mekigeniero Termochufe, el último jefe, espera en el Patio de los Manitas.",
    ["Ozzie Togglevolt, in Kharanos."] =
        "Oci Voltiflop, en Kharanos.",
    ["Tinker Town, in Ironforge."] =
        "Ciudad Manitas, en Forjaz.",
    ["Talvash del Kissel, in the Mystic Ward of Ironforge."] =
        "Talvash del Kissel, en la Sala Mística de Forjaz.",
    ["A gold ring, for a silver bar, a moss agate and 30 silver."] =
        "Un anillo de oro, a cambio de un Lingote de plata, una Ágata musgosa y 30 de plata.",
    ["A silver bar and a moss agate: from mining, or the auction house."] =
        "Un Lingote de plata y una Ágata musgosa: de la minería o de la casa de subastas.",
    ["Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale."] =
        "Scooty, el ingeniero goblin de Bahía del Botín, en la Vega de Tuercespina.",
    ["Razorfen Kraul"] =
        "Horado Rajacieno",
    ["Veyric Thunderhame, in the north-east of Arathi Highlands."] =
        "Veyric Thunderhame, al noreste de las Tierras Altas de Arathi.",
    ["Shamans: Charlga Razorflank carries the note this quest asks for."] =
        "Chamanes: Charlga Filonavaja lleva la nota que pide esta misión.",
    ["Reward: a small container of gems."] =
        "Recompensa: un pequeño contenedor de gemas.",
    ["Take the crate with holes and the owner's manual beside Mebok, and read the manual."] =
        "Toma el Cajón con agujeros y el manual del propietario que hay junto a Mebok, y lee el manual.",
    ["The journal lies by a body in the north-west of Thousand Needles, below the Great Lift: read it."] =
        "El diario está junto a un cadáver al noroeste de Las Mil Agujas, debajo del Gran Elevador: léelo.",
    ["Henrig Lonebrow's journal opens The Crone of the Kraul: cloth shoulders, mail belt or a shield."] =
        "El Diario de Henrig Soliceja abre «La bruja del Horado»: unas hombreras de tela, un cinturón de malla o un escudo.",
    ["Falfindel Waywarder, at Thalanaar, on the eastern edge of Feralas."] =
        "Díscolo Falfildel, en Thalanaar, en el borde este de Feralas.",
    ["Enter Razorfen Kraul"] =
        "Entra en Horado Rajacieno",
    ["The kraul's thorny mound rises in the far south of the Barrens."] =
        "El montículo de espinas del Horado se alza en el extremo sur de Los Baldíos.",
    ["Past Overlord Ramtusk, open the crate to call the gopher and use the stick on it: it digs up the tubers."] =
        "Pasado el Señor Supremo Colmicarnero, abre el cajón para llamar a la taltuza y usa la vara en ella: desentierra los tubérculos.",
    ["Charlga Razorflank, the last boss, holds the top of the kraul."] =
        "Charlga Filonavaja, el último jefe, ocupa lo alto del Horado.",
    ["Heralath Fallowbrook lies in the tent on the left, below Charlga Razorflank's platform."] =
        "Heralath Arroyobarbecho yace en la tienda de la izquierda, debajo de la plataforma de Charlga Filonavaja.",
    ["Reward: boots of leather or mail, or a cloak."] =
        "Recompensa: unas botas de cuero o de malla, o una capa.",
    ["Willix the Importer waits beside Heralath's tent."] =
        "Willix el Importador espera junto a la tienda de Heralath.",
    ["Reward: a ring of your choice."] =
        "Recompensa: un anillo a tu elección.",
    ["Lead Willix back to the entrance; quilboar attack on the way."] =
        "Lleva a Willix de vuelta a la entrada; los jabaespines atacan por el camino.",
    ["Every Razorfen quilboar may drop Treshala's pendant."] =
        "Todos los jabaespines Rajacieno pueden soltar el Colgante de Treshala.",
    ["Falfindel Waywarder, at Thalanaar."] =
        "Díscolo Falfildel, en Thalanaar.",
    ["Treshala Fallowbrook, in Darnassus."] =
        "Treshala Arroyobarbecho, en Darnassus.",
    ["Veyric Thunderhame, in Arathi Highlands."] =
        "Veyric Thunderhame, en las Tierras Altas de Arathi.",
    ["City of Dalaran"] =
        "Ciudad de Dalaran",
    ["Shylamiir, the herbalism trainer of Stormwind, and High Sorcerer Andromath, in the Mage Quarter."] =
        "Shylamiir, la instructora de herboristería de Ventormenta, y el Sumo Hechicero Andromath, en el Barrio de los Magos.",
    ["Two quests of the city from Stormwind: the blossom brings a cloak or a mail belt."] =
        "Dos misiones de la ciudad que se aceptan en Ventormenta: la de la flor da una capa o un cinturón de malla.",
    ["Emissary Jacques, in Hillsbrad Foothills."] =
        "Emissary Jacques, en las Laderas de Trabalomas.",
    ["The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest."] =
        "La Image of Archmage Modera, junto a las murallas de Dalaran, en el borde este del Bosque de Argénteos.",
    ["The Image of Archmage Modera."] =
        "La Image of Archmage Modera.",
    ["Archmage Modera's quests: a pendant or an off-hand rod, and an introduction to the Kirin Tor."] =
        "Las misiones de Archmage Modera: un colgante o una vara para la mano izquierda, y una presentación ante el Kirin Tor.",
    ["Enter the City of Dalaran"] =
        "Entra en la Ciudad de Dalaran",
    ["The city lies under its dome, in the west of the Alterac Mountains."] =
        "La ciudad está bajo su cúpula, al oeste de las Montañas de Alterac.",
    ["Eight seeking remnants, eight saturated remnants and eight mana echoes, inside the city."] =
        "Ocho restos buscadores, ocho restos saturados y ocho ecos de maná, dentro de la ciudad.",
    ["The arcane mote, inside the city."] =
        "La mota arcana, dentro de la ciudad.",
    ["A fel infused blossom, inside the city."] =
        "Una flor imbuida de inferi, dentro de la ciudad.",
    ["The mana elemental, inside the city."] =
        "El elemental de maná, dentro de la ciudad.",
    ["Archmage Celindra, in the City of Dalaran."] =
        "Archmage Celindra, en la Ciudad de Dalaran.",
    ["The Image of Archmage Modera, by the walls of Dalaran."] =
        "La Image of Archmage Modera, junto a las murallas de Dalaran.",
    ["Shylamiir and High Sorcerer Andromath, in Stormwind."] =
        "Shylamiir y el Sumo Hechicero Andromath, en Ventormenta.",
    ["Scarlet Monastery"] =
        "Monasterio Escarlata",
    ["Brother Crowley, in the Cathedral of Light of Stormwind."] =
        "El Hermano Cuerviz, en la Catedral de la Luz de Ventormenta.",
    ["Optional: a lead to Brother Anton in Desolace."] =
        "Opcional: una misión que lleva al Hermano Antón, en Desolace.",
    ["Librarian Mae Paledust, in the Hall of Explorers of Ironforge."] =
        "La Bibliotecaria Mae Palipolvo, en la Sala de los Exploradores de Forjaz.",
    ["Reward: a necklace, and about 3,550 XP."] =
        "Recompensa: un collar y unos 3.550 de XP.",
    ["Brother Anton, at Nijel's Point, in Desolace."] =
        "El Hermano Antón, en la Punta de Nijel, en Desolace.",
    ["Brother Anton, at Nijel's Point."] =
        "El Hermano Antón, en la Punta de Nijel.",
    ["Down the Scarlet Path, in Desolace then Southshore, opens In the Name of the Light: a weapon or an off-hand orb, and about 4,700 XP."] =
        "«El sendero Escarlata», en Desolace y luego en Costasur, abre «En el nombre de la Luz»: un arma o un orbe para la mano izquierda, y unos 4.700 de XP.",
    ["The undead ravagers roam the south-east of Desolace."] =
        "Los devastadores no-muertos recorren el sureste de Desolace.",
    ["Raleigh the Devout, in the inn of Southshore, in Hillsbrad Foothills."] =
        "Raleigh el Devoto, en la posada de Costasur, en las Laderas de Trabalomas.",
    ["Magus Olvek, in the west of the Alterac Mountains."] =
        "Magus Olvek, al oeste de las Montañas de Alterac.",
    ["About 3,200 XP."] =
        "Unos 3.200 de XP.",
    ["Enter the Scarlet Monastery"] =
        "Entra en el Monasterio Escarlata",
    ["The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door."] =
        "El monasterio se alza en el extremo este de los Claros de Tirisfal; sus cuatro alas, Cementerio, Biblioteca, Armería y Catedral, tienen cada una su propia puerta.",
    ["Magus Olvek's book lies somewhere in the monastery."] =
        "El libro de Magus Olvek está en algún lugar del monasterio.",
    ["Library: the book lies on the floor under a window, on the left of the room after the Gallery of Treasures."] =
        "Biblioteca: el libro está en el suelo bajo una ventana, a la izquierda de la sala que sigue a la Galería de los Tesoros.",
    ["Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral."] =
        "El Maestro de canes Loksey, el primer jefe de la Biblioteca; Herod, el único jefe de la Armería; el Comandante Escarlata Mograine y la Alta inquisidora Melenablanca, al final de la Catedral. El cofre del Arcanista Doan, al final de la Biblioteca, contiene La llave Escarlata, que abre la Armería y la Catedral.",
    ["Magus Olvek, in the Alterac Mountains."] =
        "Magus Olvek, en las Montañas de Alterac.",
    ["Raleigh the Devout, in Southshore."] =
        "Raleigh el Devoto, en Costasur.",
    ["Librarian Mae Paledust, in Ironforge."] =
        "La Bibliotecaria Mae Palipolvo, en Forjaz.",
    ["Razorfen Downs"] =
        "Zahúrda Rajacieno",
    ["Archbishop Benedictus, in the Cathedral of Light of Stormwind."] =
        "El Arzobispo Benedictus, en la Catedral de la Luz de Ventormenta.",
    ["Reward: a sword or a talisman, and about 4,300 XP."] =
        "Recompensa: una espada o un talismán, y unos 4.300 de XP.",
    ["Myriam Moonsinger, outside Razorfen Downs, in the far south of the Barrens."] =
        "Myriam Lunacanta, fuera de Zahúrda Rajacieno, en el extremo sur de Los Baldíos.",
    ["About 3,450 XP, without entering the downs."] =
        "Unos 3.450 de XP, sin entrar en la Zahúrda.",
    ["The Razorfen battleguards, thornweavers and Death's Head cultists guard the slopes before the downs."] =
        "Los guardias de batalla y los tejespinas de Rajacieno y los cultores Caramuerte guardan las laderas antes de la Zahúrda.",
    ["Myriam Moonsinger."] =
        "Myriam Lunacanta.",
    ["Enter Razorfen Downs"] =
        "Entra en Zahúrda Rajacieno",
    ["The downs' entrance is by Myriam Moonsinger, at the foot of the great thorn mound."] =
        "La entrada de la Zahúrda está junto a Myriam Lunacanta, al pie del gran montículo de espinas.",
    ["Belnistrasz waits in the Holding Pen, on the north side of the Murder Pens; taking his second quest starts his ritual at once."] =
        "Belnistrasz espera en el Redil, en el lado norte de los Rediles de la Muerte; aceptar su segunda misión inicia su ritual al instante.",
    ["Belnistrasz's ritual: a ring, and about 4,250 XP."] =
        "El ritual de Belnistrasz: un anillo y unos 4.250 de XP.",
    ["Defend Belnistrasz while he works: waves of quilboar and undead come. Then use his brazier, in the same room."] =
        "Defiende a Belnistrasz mientras trabaja: llegan oleadas de jabaespines y de no-muertos. Luego usa su blandón, en la misma sala.",
    ["Amnennar the Coldbringer, the last boss, waits at the top of the Spiral of Thorns."] =
        "Amnennar el Gélido, el último jefe, espera en lo alto de la Espiral de Espinas.",
    ["Archbishop Benedictus, in Stormwind."] =
        "El Arzobispo Benedictus, en Ventormenta.",
    ["Uldaman"] =
        "Uldaman",
    ["Prospector Stormpike, in the Hall of Explorers of Ironforge."] =
        "El Prospector Pico Tormenta, en la Sala de los Exploradores de Forjaz.",
    ["The Lost Dwarves leads to the Hidden Chamber: a two-handed axe or a lodestar, and about 3,900 XP."] =
        "«Los enanos desaparecidos» lleva a «La cámara oculta»: un hacha de dos manos o el Norte y guía de la Liga de Expedicionarios, y unos 3.900 de XP.",
    ["Krom Stoutarm, in the Hall of Explorers."] =
        "Krom Brazorrecio, en la Sala de los Exploradores.",
    ["About 3,600 XP for a chest at Uldaman's gates."] =
        "Unos 3.600 de XP por un cofre a las puertas de Uldaman.",
    ["Prospector Ironband, at his excavation site in the south-east of Loch Modan."] =
        "El Prospector Vetaferro, en su excavación al sureste de Loch Modan.",
    ["Find Agmond leads to Agmond's Fate: gloves of cloth, leather or mail."] =
        "«Encontrar a Agmond» lleva a «El sino de Agmond»: unos guantes de tela, de cuero o de malla.",
    ["Ghak Healtouch, in Thelsamar."] =
        "Ghak Sanadón, en Thelsamar.",
    ["It opens Uldaman Reagent Run: restorative potions and about 3,450 XP."] =
        "Abre «Componentes de Uldaman»: pociones reconstituyentes y unos 3.450 de XP.",
    ["Rigglefuzz, in the middle of the Badlands."] =
        "Aparejez, en el centro de las Tierras Inhóspitas.",
    ["Reward: leather or mail bracers, cloth boots or a shield."] =
        "Recompensa: unos brazales de cuero o de malla, unas botas de tela o un escudo.",
    ["Theldurin the Lost, in the south of the Badlands."] =
        "Theldurin el Perdido, al sur de las Tierras Inhóspitas.",
    ["Reward: a cloth robe."] =
        "Recompensa: una toga de tela.",
    ["A crumpled map lies on the ground in the north of the Badlands."] =
        "Un Mapa arrugado está en el suelo, al norte de las Tierras Inhóspitas.",
    ["A long chain of nine quests between the Badlands and Ironforge: it ends inside Uldaman with the Lost Tablets of Will, a medal and about 5,850 XP."] =
        "Una larga cadena de nueve misiones entre las Tierras Inhóspitas y Forjaz: termina dentro de Uldaman con «Las tablillas perdidas de Voluntad», una medalla y unos 5.850 de XP.",
    ["Prospector Ryedol, a short walk south of the map."] =
        "El Prospector Ryedol, a poca distancia al sur del mapa.",
    ["A battered dwarven skeleton lies in the middle of the Badlands."] =
        "Un Esqueleto de enano maltrecho yace en el centro de las Tierras Inhóspitas.",
    ["Murdaloc and the Stonevault troggs camp just south of the skeleton."] =
        "Murdaloc y los troggs Grutacanto acampan justo al sur del esqueleto.",
    ["The buzzards and crag coyotes of the Badlands drop the gizzards and fangs."] =
        "Las águilas ratoneras y los coyotes del risco de las Tierras Inhóspitas sueltan las mollejas y los colmillos.",
    ["Hammertoe Grez, by the gates of Uldaman, in the north of the Badlands."] =
        "Grez Dedomaza, junto a las puertas de Uldaman, al norte de las Tierras Inhóspitas.",
    ["Magregan Deepshadow, a Shadowforge dwarf by the gates, carries the amulet; the tablet lies in an ancient chest close by."] =
        "Magregan Sombraprofunda, un enano Forjatiniebla junto a las puertas, lleva el amuleto; la tablilla está en un Cofre antiguo, muy cerca.",
    ["The Shadowforge dwarves around the gates drop the power stones."] =
        "Los enanos Forjatiniebla de alrededor de las puertas sueltan las piedras de energía.",
    ["The Shadowforge dwarves may also drop a shattered necklace: use it."] =
        "Los enanos Forjatiniebla también pueden soltar un collar destrozado: úsalo.",
    ["Hammertoe Grez."] =
        "Grez Dedomaza.",
    ["Prospector Ryedol."] =
        "El Prospector Ryedol.",
    ["Theldurin the Lost."] =
        "Theldurin el Perdido.",
    ["Prospector Ironband, in Loch Modan."] =
        "El Prospector Vetaferro, en Loch Modan.",
    ["Historian Karnik, in the Hall of Explorers of Ironforge."] =
        "Karnik el Historiador, en la Sala de los Exploradores de Forjaz.",
    ["Advisor Belgrum, in the Hall of Explorers."] =
        "El Consejero Belgrum, en la Sala de los Exploradores.",
    ["Historian Karnik."] =
        "Karnik el Historiador.",
    ["Talvash's chain ends inside Uldaman with a necklace and about 5,600 XP."] =
        "La cadena de Talvash termina dentro de Uldaman con un collar y unos 5.600 de XP.",
    ["Five silver bars: from mining, or the auction house."] =
        "Cinco Lingotes de plata: de la minería o de la casa de subastas.",
    ["Ambassador Infernus walks with the Dark Iron dwarves south of Uldaman's gates."] =
        "El Embajador Infernus anda con los enanos Hierro Negro al sur de las puertas de Uldaman.",
    ["Krom Stoutarm's chest stands in the dig south-west of Uldaman's gates."] =
        "El cofre de Krom Brazorrecio está en el yacimiento al suroeste de las puertas de Uldaman.",
    ["Carved stone urns lie around the dig and inside Uldaman."] =
        "Hay urnas de piedra labrada alrededor del yacimiento y dentro de Uldaman.",
    ["Magenta cap clusters grow on the cave walls, south-west of the gates and inside."] =
        "Las setas magenta crecen en las paredes de la cueva, al suroeste de las puertas y dentro.",
    ["Advisor Belgrum, in the Hall of Explorers of Ironforge."] =
        "El Consejero Belgrum, en la Sala de los Exploradores de Forjaz.",
    ["Enter Uldaman"] =
        "Entra en Uldaman",
    ["The dungeon's door is at the back of the cave by Hammertoe Grez's dig."] =
        "La puerta de la mazmorra está al fondo de la cueva, junto al yacimiento de Grez Dedomaza.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage."] =
        "Un paladín muerto yace justo al lado de la primera gran sala, por su segundo pasaje de la derecha.",
    ["Baelog, the first boss, in Dig Two: the left corridor, then the room to the south."] =
        "Baelog, el primer jefe, en la Excavación Dos: el pasillo de la izquierda y luego la sala del sur.",
    ["The Tablet of Will stands against a wall of Dig Three."] =
        "La Tablilla de Voluntad está contra una pared de la Excavación Tres.",
    ["The Gni'kiv Medallion lies in Baelog's chest, Revelosh drops the Shaft of Tsol: join them into the Staff of Prehistoria, use it in the Map Chamber, then step into Ironaya's room."] =
        "El Medallón Gni'kiv está en el Cofre de Baelog y Revelosh suelta El bastón de Tsol: únelos en el Bastón de Prehistoria, úsalo en la Cámara del Mapa y luego entra en la sala de Hierraya.",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault."] =
        "El topacio está en una Urna llamativa al sureste de la Excavación Dos; el rubí, en un cofre de piedra al noroeste de la Excavación Tres (llama a monstruos); el zafiro lo lleva Grimlok, al final de la Cámara de Piedra.",
    ["Use Talvash's phial at his scrying bowl, in the dungeon."] =
        "Usa la Ampolla de visión de Talvash en su cuenco de visión, en la mazmorra.",
    ["Archaedas, the last boss, guards the Hall of the Crafters: he drops the power source."] =
        "Archaedas, el último jefe, guarda la Sala de los Artesanos: suelta la fuente de energía.",
    ["The Discs of Norgannon, in the room behind Archaedas."] =
        "Los Discos de Norgannon, en la sala detrás de Archaedas.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Ironforge with potions or a bag."] =
        "Opcional: Los Discos de Norgannon, detrás de Archaedas, cuentan su historia; termina en Forjaz con pociones o una bolsa.",
    ["Prospector Stormpike and Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "El Prospector Pico Tormenta y Krom Brazorrecio, en la Sala de los Exploradores de Forjaz.",
    ["Talvash del Kissel, in the Mystic Ward."] =
        "Talvash del Kissel, en la Sala Mística.",
    ["High Explorer Magellas, in the Hall of Explorers."] =
        "El Alto Expedicionario Magellas, en la Sala de los Exploradores.",
    ["Dinita Stonemantle, in Ironforge."] =
        "Dinita Mantopétreo, en Forjaz.",
    ["Zul'Farrak"] =
        "Zul'Farrak",
    ["Gryphon Master Talonaxe, at Aerie Peak, in the Hinterlands."] =
        "El Maestro de grifos Garracha, en Pico Nidal, en las Tierras del Interior.",
    ["Optional: a chain of seven quests between the Hinterlands, the Blasted Lands and the city; the last one, an elite fight to the top of Jintha'Alor, brings a mace or leather leggings."] =
        "Opcional: una cadena de siete misiones entre las Tierras del Interior, las Tierras Devastadas y la ciudad; la última, un combate élite hasta lo alto de Jintha'Alor, da una maza o unos leotardos de cuero.",
    ["The Witherbark cages stand in the troll camps of the south-west of the Hinterlands."] =
        "Las jaulas Secacorteza están en los campamentos trols del suroeste de las Tierras del Interior.",
    ["Search the Altar of Zul, in the middle of the trolls' ruins in the south of the Hinterlands."] =
        "Registra el Altar de Zul, en el centro de las ruinas trols del sur de las Tierras del Interior.",
    ["Thadius Grimshade, at the top of Nethergarde Keep, in the Blasted Lands."] =
        "Thadius Sombramacabra, en lo alto del Castillo de Nethergarde, en las Tierras Devastadas.",
    ["Your mage trainer, in a capital."] =
        "Tu instructor de magos, en una capital.",
    ["Tabetha, in her house in the middle of Dustwallow Marsh."] =
        "Tabetha, en su casa, en el centro del Marjal Revolcafango.",
    ["Reward: a staff or plate shoulders."] =
        "Recompensa: un bastón o unas hombreras de placas.",
    ["Wizzle Brassbolts, at the racetrack of the Shimmering Flats, in Thousand Needles."] =
        "Wizzle Pernolatón, en la pista de carreras de El Desierto de Sal, en Las Mil Agujas.",
    ["Reward: a carrot on a stick, which makes your mount faster."] =
        "Recompensa: una Zanahoria pinchada en un palo, que hace más rápida tu montura.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan, in Tanaris."] =
        "Tran'rek, Trenton Mazaligera y el Ingeniero jefe Pasaquillas, en Gadgetzan, en Tanaris.",
    ["Gadgetzan's quests: the Divino-matic Rod brings a ring or a leather helm; the other two, about 3,900 XP each."] =
        "Las misiones de Gadgetzan: «Cetro Divinomático» da un anillo o un yelmo de cuero; las otras dos, unos 3.900 de XP cada una.",
    ["Yeh'kinya, at Steamwheedle Port, on the east coast of Tanaris."] =
        "Yeh'kinya, en Puerto Bonvapor, en la costa este de Tanaris.",
    ["It opens The Prophecy of Mosh'aru, about 5,250 XP."] =
        "Abre «La profecía de Mosh'aru», unos 5.250 de XP.",
    ["Kill the vale screechers of Feralas and use Yeh'kinya's bramble on their bodies."] =
        "Mata a los estridadores del valle de Feralas y usa la Zarza de Yeh'kinya en sus cadáveres.",
    ["Yeh'kinya, at Steamwheedle Port."] =
        "Yeh'kinya, en Puerto Bonvapor.",
    ["Enter Zul'Farrak"] =
        "Entra en Zul'Farrak",
    ["The city's gate is in the north-west of Tanaris."] =
        "La puerta de la ciudad está al noroeste de Tanaris.",
    ["The scarabs drop the shells; most of them crowd Theka the Martyr's chamber."] =
        "Los escarabajos sueltan los caparazones; la mayoría se agolpa en la cámara de Theka el Mártir.",
    ["Theka the Martyr, the second boss, in the scarabs' room to the north, holds the first tablet; Hydromancer Velratha, by the pool to the south-east, the second."] =
        "Theka el Mártir, el segundo jefe, en la sala de los escarabajos al norte, tiene la primera tablilla; la Hidromántica Velratha, junto a la poza del sureste, la segunda.",
    ["Hydromancer Velratha also wears the Tiara of the Deep."] =
        "La Hidromántica Velratha también lleva la Tiara de las profundidades.",
    ["Gahz'rilla rises from the pool when its gong is struck with the Mallet of Zul'Farrak, made in the Hinterlands: one of the group needs it."] =
        "Gahz'rilla surge de la poza cuando se golpea su gong con la Marra de Zul'Farrak, que se fabrica en las Tierras del Interior: alguien del grupo debe tenerla.",
    ["Nekrum Gutchewer joins the fight at the top of the pyramid, when the prisoners are freed."] =
        "Nekrum Cometripas se une al combate en lo alto de la pirámide, cuando se libera a los prisioneros.",
    ["Sergeant Bly, one of the prisoners at the top of the pyramid: free them, defend them, then he turns on you."] =
        "El Sargento Bly, uno de los prisioneros de lo alto de la pirámide: libéralos, defiéndelos y luego se vuelve contra ti.",
    ["Every troll of the city may drop a troll temper; it can take more than one run."] =
        "Todos los trols de la ciudad pueden soltar un Temple trol; puede hacer falta más de una visita.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan."] =
        "Tran'rek, Trenton Mazaligera y el Ingeniero jefe Pasaquillas, en Gadgetzan.",
    ["Optional: an egg in the Hinterlands; it opens The God Hakkar, a quest of the Temple of Atal'Hakkar."] =
        "Opcional: un huevo en las Tierras del Interior; abre «El dios Hakkar», una misión del Templo de Atal'Hakkar.",
    ["Wizzle Brassbolts, at the Shimmering Flats."] =
        "Wizzle Pernolatón, en El Desierto de Sal.",
    ["Tabetha, in Dustwallow Marsh."] =
        "Tabetha, en el Marjal Revolcafango.",
    ["Thadius Grimshade, in Nethergarde Keep."] =
        "Thadius Sombramacabra, en el Castillo de Nethergarde.",
    ["Wait while Thadius Grimshade performs his divination."] =
        "Espera mientras Thadius Sombramacabra realiza su adivinación.",
    ["Gryphon Master Talonaxe, at Aerie Peak."] =
        "El Maestro de grifos Garracha, en Pico Nidal.",
    ["Vile Priestess Hexx, at the top of Jintha'Alor, carries the key to Sharpbeak's cage: elite trolls all the way up."] =
        "La Sacerdotisa Vil Hexx, en lo alto de Jintha'Alor, lleva la llave de la Jaula de Picoafilado: hay trols élite durante toda la subida.",
    ["The Ancient Egg lies at the top of Jintha'Alor too."] =
        "El Huevo antiguo también está en lo alto de Jintha'Alor.",
    ["Gryphon Master Talonaxe."] =
        "El Maestro de grifos Garracha.",
    ["Maraudon"] =
        "Maraudon",
    ["Archmage Tervosh, in his tower in Theramore, in Dustwallow Marsh."] =
        "El Archimago Tervosh, en su torre de Theramore, en el Marjal Revolcafango.",
    ["Reward: a pendant of your choice."] =
        "Recompensa: un colgante a tu elección.",
    ["Talendria and Keeper Marandis, at Nijel's Point, in the north of Desolace."] =
        "Talendria y el Vigilante Marandis, en la Punta de Nijel, al norte de Desolace.",
    ["Nijel's Point's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "Las dos misiones de la Punta de Nijel: un anillo, unos guanteletes de placas o un cinturón de cuero; luego, el fin de Theradras da una espada, un bastón o un arco.",
    ["Willow, in the middle of Desolace."] =
        "Willow, en el centro de Desolace.",
    ["Reward: cloth, leather, mail or plate armor."] =
        "Recompensa: una armadura de tela, de cuero, de malla o de placas.",
    ["The Centaur Pariah, an outcast in the south of Desolace."] =
        "El Paria Centauro, un desterrado del sur de Desolace.",
    ["About 5,450 XP."] =
        "Unos 5.450 de XP.",
    ["Cavindra, on the path to Maraudon, in the west of Desolace."] =
        "Cavindra, en el camino de Maraudon, al oeste de Desolace.",
    ["Legends of Maraudon leads to the Scepter of Celebras, a shortcut into the inner falls."] =
        "«Leyendas de Maraudón» lleva al Cetro de Celebras, un atajo hacia las cascadas interiores.",
    ["Enter Maraudon"] =
        "Entra en Maraudon",
    ["Maraudon's caves open in the west of Desolace; inside, an orange and a purple wing lead down to the inner falls."] =
        "Las cuevas de Maraudon se abren al oeste de Desolace; dentro, un ala naranja y un ala morada bajan hasta las cascadas interiores.",
    ["The Shadowshard elementals of the outer caves drop the fragments."] =
        "Los elementales Fragmento Oscuro de las cuevas exteriores sueltan los fragmentos.",
    ["Fill the vial at the orange crystal pool, in the caves before the Orange wing; in the wing, use it on the stumps with red tops: the Noxxious scions come out."] =
        "Llena el vial en el estanque de cristal naranja, en las cuevas antes del ala Naranja; en el ala, úsalo en los tocones de copa roja: salen los vástagos tóxicos.",
    ["Every creature of Maraudon may drop a crystal carving."] =
        "Todas las criaturas de Maraudon pueden soltar una talla de cristal.",
    ["Use the Amulet of Spirits on the Spirit of Veng, who walks the Orange wing, then kill Veng; then on the Spirit of Maraudos in the Purple wing's grotto, then kill Maraudos. Join the two gems."] =
        "Usa el Amuleto de los espíritus en el Espíritu de Veng, que recorre el ala Naranja, y luego mata a Veng; después, en el Espíritu de Maraudos, en la gruta del ala Morada, y luego mata a Maraudos. Une las dos gemas.",
    ["Noxxion, the Orange wing's first boss, drops the rod; Lord Vyletongue, in a small room north of his seat in the Purple wing, the diamond."] =
        "Noxxion, el primer jefe del ala Naranja, suelta la vara; Lord Lenguavil, en una pequeña sala al norte de su trono en el ala Morada, el diamante.",
    ["Kill Celebras the Cursed, on the island of the Poison Falls: Celebras the Redeemed appears."] =
        "Mata a Celebras el Maldito, en la isla de las Cascadas Venenosas: aparece Celebras el Redimido.",
    ["Follow Celebras to his stone and wait for his incantation."] =
        "Sigue a Celebras hasta su piedra y espera a que termine su conjuro.",
    ["Celebras the Redeemed, by his stone."] =
        "Celebras el Redimido, junto a su piedra.",
    ["Princess Theradras, the last boss, waits at the end of Zaetar's Grave, south and down the waterfall."] =
        "La Princesa Theradras, el último jefe, espera al final de la Tumba de Zaetar, al sur y bajando por la cascada.",
    ["Zaetar's Spirit appears in the middle of Theradras's room."] =
        "El Espíritu de Zaetar aparece en el centro de la sala de Theradras.",
    ["About 6,100 XP; the seed goes to Moonglade."] =
        "Unos 6.100 de XP; la semilla va al Claro de la Luna.",
    ["The Centaur Pariah, in the south of Desolace."] =
        "El Paria Centauro, al sur de Desolace.",
    ["Talendria and Keeper Marandis, at Nijel's Point."] =
        "Talendria y el Vigilante Marandis, en la Punta de Nijel.",
    ["Archmage Tervosh, in Theramore."] =
        "El Archimago Tervosh, en Theramore.",
    ["Keeper Remulos, at the Shrine of Remulos, in Moonglade."] =
        "El Guardián Rémulos, en el Santuario de Remulos, en el Claro de la Luna.",
    ["The Temple of Atal'Hakkar"] =
        "El Templo de Atal'Hakkar",
    ["Brohann Caskbelly, in the Dwarven District of Stormwind."] =
        "Brohann Barriliga, en el Distrito de los Enanos de Ventormenta.",
    ["Optional: a chain of eight quests from Stormwind to the Hinterlands, Tanaris and Feralas; it opens Into the Temple of Atal'Hakkar, a talisman and about 7,100 XP."] =
        "Opcional: una cadena de ocho misiones desde Ventormenta hasta las Tierras del Interior, Tanaris y Feralas; abre «En El Templo de Atal'Hakkar», un talismán y unos 7.100 de XP.",
    ["Find the temple: the ruins in the Pool of Tears, in the east of the Swamp of Sorrows."] =
        "Encuentra el templo: las ruinas de la Charca de Lágrimas, al este del Pantano de las Penas.",
    ["Brohann Caskbelly, in Stormwind."] =
        "Brohann Barriliga, en Ventormenta.",
    ["Falstad Wildhammer, at Aerie Peak, in the Hinterlands."] =
        "Falstad Martillo Salvaje, en Pico Nidal, en las Tierras del Interior.",
    ["Rhapsody Shindigger, on the road east of Aerie Peak."] =
        "Rapsodio Machacacanillas, en el camino al este de Pico Nidal.",
    ["The Atal'ai Exile, in the south of the Hinterlands."] =
        "El Exiliado Atal'ai, al sur de las Tierras del Interior.",
    ["Reward: cloth leggings or a mail helm, and about 6,550 XP."] =
        "Recompensa: unos leotardos de tela o un yelmo de malla, y unos 6.550 de XP.",
    ["Muigin, at Marshal's Refuge, in Un'Goro Crater."] =
        "Muigin, en el Refugio de Marshal, en el Cráter de Un'Goro.",
    ["Muigin's chain leads to the temple's haze."] =
        "La cadena de Muigin lleva a la calima del templo.",
    ["The bloodpetal plants of Un'Goro drop the petals."] =
        "Las plantas Sangrepétalo de Un'Goro sueltan los pétalos.",
    ["Gregan Brewspewer, in the north of Feralas."] =
        "Gregan Vomitabrebaje, al norte de Feralas.",
    ["Angelas Moonbreeze, at Feathermoon Stronghold, in Feralas."] =
        "Ángelas Brisaluna, en el Bastión Plumaluna, en Feralas.",
    ["Marvon's chain opens two quests of the temple; one rewards a Hakkari urn."] =
        "La cadena de Marvon abre dos misiones del templo; una da una Urna Hakkari.",
    ["Groddoc and ironfur livers in Feralas, roc gizzards in Tanaris."] =
        "Hígados Groddoc y de Cueracero en Feralas, mollejas de roc en Tanaris.",
    ["Marvon Rivetseeker, in Tanaris, south of Gadgetzan."] =
        "Marvon Buscarroblones, en Tanaris, al sur de Gadgetzan.",
    ["Marvon's chest, in his old workshop in Ratchet, holds the stone circle."] =
        "El Cofre de Marvon, en su antiguo taller de Trinquete, contiene el círculo de piedra.",
    ["Marvon Rivetseeker, in Tanaris."] =
        "Marvon Buscarroblones, en Tanaris.",
    ["Yeh'kinya, at Steamwheedle Port, in Tanaris."] =
        "Yeh'kinya, en Puerto Bonvapor, en Tanaris.",
    ["The Ancient Egg lies at the top of Jintha'Alor, in the Hinterlands, among elite trolls."] =
        "El Huevo antiguo está en lo alto de Jintha'Alor, en las Tierras del Interior, entre trols élite.",
    ["Reward: a plate helm, a cloth circlet or a dagger, and about 7,900 XP."] =
        "Recompensa: un yelmo de placas, una diadema de tela o una daga, y unos 7.900 de XP.",
    ["Rhapsody Shindigger, in the Hinterlands."] =
        "Rapsodio Machacacanillas, en las Tierras del Interior.",
    ["The Atal'ai tablets lie in the ruins around the Pool of Tears, and inside the temple."] =
        "Las tablillas Atal'ai están en las ruinas alrededor de la Charca de Lágrimas y dentro del templo.",
    ["Enter the Temple of Atal'Hakkar"] =
        "Entra en el Templo de Atal'Hakkar",
    ["The temple lies sunken in the Pool of Tears, in the east of the Swamp of Sorrows: swim down to the ruins' stairs."] =
        "El templo está hundido en la Charca de Lágrimas, al este del Pantano de las Penas: bucea hasta las escaleras de las ruinas.",
    ["The murk worms, deep lurkers and oozes of the temple drop the haze."] =
        "Los gusanos de la oscuridad, los rondadores de lo profundo y los mocos del templo sueltan la calima.",
    ["Hall of Serpents: use the six statues in this order: south, north, south-west, south-east, north-west, north-east; Atal'alarion appears. The Idol of Hakkar stands in the middle of the Pit of Refuse."] =
        "Sala de las Serpientes: usa las seis estatuas en este orden: sur, norte, suroeste, sureste, noroeste, noreste; aparece Atal'alarion. El Ídolo de Hakkar está en el centro del Foso de los Desechos.",
    ["Climb the stairs of the Pit of Refuse: the Altar of Hakkar waits up there."] =
        "Sube las escaleras del Foso de los Desechos: el Altar de Hakkar está arriba.",
    ["Kill the six troll elites on the balconies first: Jammal'an's barrier falls; he waits south-east of the Pit of Sacrifice."] =
        "Mata primero a los seis trols élite de los balcones: cae la barrera de Jammal'an; espera al sureste del Foso del Sacrificio.",
    ["The Shade of Eranikus, at the end of the south path, may drop his essence: use it."] =
        "La Sombra de Eranikus, al final del camino sur, puede soltar su esencia: úsala.",
    ["The Essence Font, in the north-east corner of his room."] =
        "La Fuente de esencia, en la esquina noreste de su sala.",
    ["Use the Oathstone of Ysera's Dragonflight it gives you."] =
        "Usa la Piedra de juramento del Vuelo de Ysera que te da.",
    ["Keep the Chained Essence of Eranikus, the font's reward: Itharius asks for it."] =
        "Guarda la Esencia encadenada de Eranikus, la recompensa de la fuente: Itharius la pide.",
    ["Use the Egg of Hakkar by the skeleton in the Sanctum of the Fallen God, south-west: Hakkari bloodkeepers come, their blood puts out the four eternal flames, then the Avatar of Hakkar comes; his essence fills the egg."] =
        "Usa el Huevo de Hakkar junto al esqueleto del Sagrario del Dios Caído, al suroeste: llegan vigilasangres Hakkari, su sangre apaga las cuatro llamas eternas y luego llega el Avatar de Hakkar; su esencia llena el huevo.",
    ["Itharius, a green dragon in the south-west of the Swamp of Sorrows."] =
        "Itharius, un dragón verde al suroeste del Pantano de las Penas.",
    ["The Atal'ai Exile, in the Hinterlands."] =
        "El Exiliado Atal'ai, en las Tierras del Interior.",
    ["The beasts of Un'Goro drop the bloodpetal sprouts."] =
        "Las bestias de Un'Goro sueltan los brotes de pétalo de sangre.",
    ["Umbranse the Spiritspeaker, in the east of Winterspring."] =
        "Umbranse el Hablaalmas, al este de Cuna del Invierno.",
    ["Blackrock Depths"] =
        "Profundidades de Roca Negra",
    ["Royal Historian Archesonus, in the Hall of Explorers of Ironforge."] =
        "El Historiador Real Archesonus, en la Sala de los Exploradores de Forjaz.",
    ["The royal historian's chain leads to Kharan Mighthammer, then to the emperor and the princess: King Magni's reward and about 9,650 XP at its end."] =
        "La cadena del historiador real lleva a Kharan Martillazo y luego al emperador y a la princesa: al final, la recompensa del Rey Magni y unos 9.650 de XP.",
    ["Listen to the royal historian."] =
        "Escucha al historiador real.",
    ["Ragnar Thunderbrew, in Kharanos, in Dun Morogh."] =
        "Ragnar Cebatruenos, en Kharanos, en Dun Morogh.",
    ["Reward: a two-handed axe or a mace, or dark dwarven lager."] =
        "Recompensa: un hacha de dos manos o una maza, o Cerveza negra enana.",
    ["Kalaran Windblade, in the middle of the Searing Gorge."] =
        "Kalaran Espada del Viento, en el centro de La Garganta de Fuego.",
    ["Optional: ten quests in the Searing Gorge before A Taste of Flame, which brings a cloth cape or sash or leather shoulders."] =
        "Opcional: diez misiones en La Garganta de Fuego antes de «Un sabor a llamarada», que da una capa o una faja de tela, o unas hombreras de cuero.",
    ["Listen to Kalaran Windblade's story."] =
        "Escucha la historia de Kalaran Espada del Viento.",
    ["The fire elementals of the Searing Gorge drop the hearts of flame; the golems, the oil."] =
        "Los elementales de fuego de La Garganta de Fuego sueltan los corazones de llama; los gólems, el aceite.",
    ["The Dark Iron dwarves of the gorge carry the thorium plated daggers."] =
        "Los enanos Hierro Negro de la garganta llevan las dagas bañadas en torio.",
    ["The Twilight cultists of the gorge carry the symbols of Ragnaros."] =
        "Los cultores Crepusculares de la garganta llevan los símbolos de Ragnaros.",
    ["Listen to Kalaran Windblade."] =
        "Escucha a Kalaran Espada del Viento.",
    ["Use the Torch of Retribution beside Kalaran."] =
        "Usa la Antorcha de retribución junto a Kalaran.",
    ["Squire Maltrake, beside Kalaran."] =
        "El Escudero Maltrake, junto a Kalaran.",
    ["Light the four sentry braziers on the Dark Iron watchtowers of the gorge."] =
        "Enciende los cuatro blandones de centinela de las atalayas Hierro Negro de la garganta.",
    ["The Hoard of the Black Dragonflight, beside Squire Maltrake."] =
        "El Tesoro del Vuelo Negro, junto al Escudero Maltrake.",
    ["The ghost of Franclorn Forgewright, inside Blackrock Mountain, by the way down to the depths."] =
        "El fantasma de Franclorn Forjador, dentro de la Montaña Roca Negra, junto a la bajada a las profundidades.",
    ["Franclorn's quest brings the Shadowforge Key, which opens doors of the depths."] =
        "La misión de Franclorn da la Llave Sombratiniebla, que abre puertas de las profundidades.",
    ["Use the Thaurissan relic in the ruins of Thaurissan, in the middle of the Burning Steppes."] =
        "Usa la reliquia Thaurissan en las ruinas de Thaurissan, en el centro de Las Estepas Ardientes.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest, in the north of the Burning Steppes."] =
        "Yuka Llavenrosca y Maxwort Suprandor, en la Cresta de la Llama, al norte de Las Estepas Ardientes.",
    ["Flame Crest's two quests: Ribbly's head brings leather shoulders, cloth boots or mail armor."] =
        "Las dos misiones de la Cresta de la Llama: la cabeza de Ribbly da unas hombreras de cuero, unas botas de tela o una armadura de malla.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "Jalinda Espiga y Oralius, en la Vigilia de Morgan, al este de Las Estepas Ardientes.",
    ["Morgan's Vigil's quests: Incendius! brings armor of any kind, The Good Stuff a fanny pack of loot."] =
        "Las misiones de la Vigilia de Morgan: «¡Incendius!» da una armadura de cualquier tipo, y «Buena mercancía», una riñonera con botín.",
    ["Cyrus Therepentous, in the far east of the Burning Steppes."] =
        "Cyrus Therepentio, en el extremo este de Las Estepas Ardientes.",
    ["A frenzied black drake of the steppes drops the molt; then talk to Cyrus."] =
        "Un Draco Negro demenciado de las estepas suelta la muda; luego habla con Cyrus.",
    ["Helendis Riverhorn, at Morgan's Vigil."] =
        "Helendis Rivacuerno, en la Vigilia de Morgan.",
    ["Optional: eight quests between the steppes, Lakeshire and Stormwind before Marshal Windsor, whose Jail Break! brings a sword or a dagger among its rewards, and about 7,750 XP."] =
        "Opcional: ocho misiones entre las estepas, Villa del Lago y Ventormenta antes del Alguacil Windsor, cuya misión «La fuga de la prisión» incluye una espada o una daga entre sus recompensas, y unos 7.750 de XP.",
    ["The black dragonkin of the steppes' north."] =
        "Los dragonantes negros del norte de las estepas.",
    ["Magistrate Solomon, in the town hall of Lakeshire, in Redridge."] =
        "El Magistrado Salomón, en el Concejo de Villa del Lago, en Crestagrana.",
    ["Highlord Bolvar Fordragon, in Stormwind Keep."] =
        "El Alto Señor Bolvar Fordragon, en el Castillo de Ventormenta.",
    ["Talk to Lady Katrana Prestor, beside the king."] =
        "Habla con Lady Katrana Prestor, al lado del rey.",
    ["Magistrate Solomon, in Lakeshire."] =
        "El Magistrado Salomón, en Villa del Lago.",
    ["Marshal Maxwell, at Morgan's Vigil."] =
        "El Mariscal Maxwell, en la Vigilia de Morgan.",
    ["Talk to Ragged John, at Flame Crest."] =
        "Habla con John Andrajoso, en la Cresta de la Llama.",
    ["Royal Historian Archesonus, in Ironforge."] =
        "El Historiador Real Archesonus, en Forjaz.",
    ["Overmaster Pyron walks the bottom of Blackrock Mountain, before the depths' door."] =
        "El Maestro Supremo Pyron recorre el fondo de la Montaña Roca Negra, antes de la puerta de las profundidades.",
    ["Enter Blackrock Depths"] =
        "Entra en las Profundidades de Roca Negra",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the depths' door is at the bottom of the mountain."] =
        "La Montaña Roca Negra se abre al oeste de Las Estepas Ardientes; dentro, la puerta de las profundidades está en el fondo de la montaña.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Kharan Mighthammer sits in the second cell on the right of the tunnel."] =
        "El Alto Interrogador Gerstahn, en una sala del fondo a la derecha del Bloque de Detención, lleva la llave de la celda; Kharan Martillazo está en la segunda celda a la derecha del túnel.",
    ["Let Kharan tell his story."] =
        "Deja que Kharan cuente su historia.",
    ["Marshal Windsor, two cells further."] =
        "El Alguacil Windsor, dos celdas más allá.",
    ["The Anvilrage dwarves of the first rooms may drop a crumpled note: read it."] =
        "Los enanos Yunque Colérico de las primeras salas pueden soltar Una nota arrugada: léela.",
    ["Marshal Windsor, in his cell."] =
        "El Alguacil Windsor, en su celda.",
    ["Fineous Darkvire, in the lower Hall of Crafting, carries Ironfel; the Monument of Franclorn Forgewright stands at the dead end past the Shrine of Thaurissan."] =
        "Finoso Virunegro, en la parte baja de la Sala de Artesanía, lleva Ferrovil; el Monumento a Franclorn Forjador está en el callejón sin salida que hay pasado el Santuario de Thaurissan.",
    ["The Monument of Franclorn Forgewright."] =
        "El Monumento a Franclorn Forjador.",
    ["Bael'Gar waits at the end of the Dark Iron Highway: use Cyrus's molt on his body."] =
        "Bael'Gar espera al final de la Calzada Hierro Negro: usa la muda de Cyrus en su cadáver.",
    ["General Angerforge, down the stairs of the West Garrison, and Golem Lord Argelmach, in the Manufactory, carry Windsor's lost information."] =
        "El General Forjainquina, bajando las escaleras del Cuartel Oeste, y el Señor Gólem Argelmach, en el Taller, llevan la información perdida de Windsor.",
    ["Free Marshal Windsor and follow him through the Detention Block and the Halls of the Law."] =
        "Libera al Alguacil Windsor y síguelo por el Bloque de Detención y las Salas de la Ley.",
    ["Mistress Nagmara, in the Grim Guzzler tavern."] =
        "La Coima Nagmara, en la taberna Tragapenas.",
    ["Optional: Mistress Nagmara's love potion needs herbs, silver veins of giants and water of Un'Goro's hot springs; it brings cloth bracers or a leather belt."] =
        "Opcional: la poción de enamoramiento de la Coima Nagmara necesita hierbas, vetas de plata de gigantes y agua de las fuentes termales de Un'Goro; da unos brazales de tela o un cinturón de cuero.",
    ["Ribbly Screwspigot sits at the bottom of the Grim Guzzler: talk to him, then fight him."] =
        "Ribbly Llavenrosca está en la parte baja del Tragapenas: habla con él y luego lucha contra él.",
    ["Break the three Thunderbrew lager kegs in a side room of the lower Grim Guzzler: Hurley Blackbreath comes."] =
        "Rompe los tres barriles de cerveza Cebatruenos de una sala lateral de la parte baja del Tragapenas: llega Hurley Negrálito.",
    ["The relic coffer keys drop from the dwarves; the twelve coffers of the Black Vault call Watchman Doomgrip, who opens the Heart's vault."] =
        "Los enanos sueltan las llaves del arca de reliquias; las doce arcas de la Cámara Negra llaman al Vigía Presaletal, que abre la cámara del Corazón.",
    ["The Anvilrage dwarves drop the fanny packs."] =
        "Los enanos Yunque Colérico sueltan las talegas.",
    ["King Magni Bronzebeard, in Ironforge."] =
        "El Rey Magni Barbabronce, en Forjaz.",
    ["Jalinda Sprig, at Morgan's Vigil."] =
        "Jalinda Espiga, en la Vigilia de Morgan.",
    ["Gromsblood, from herbalism or the auction house; giant silver veins from the giants of Azshara; the vial filled at the Golakka Hot Springs of Un'Goro Crater."] =
        "Gromsanguina, de la herboristería o de la casa de subastas; vetas gigantes de plata, de los gigantes de Azshara; el vial, lleno en las Fuentes Termales de Golakka del Cráter de Un'Goro.",
    ["Enter Blackrock Depths again"] =
        "Vuelve a entrar en las Profundidades de Roca Negra",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City."] =
        "Lord Incendius espera en el Yunque Negro, en la Ciudad Forjatiniebla.",
    ["Mistress Nagmara, in the Grim Guzzler."] =
        "La Coima Nagmara, en el Tragapenas.",
    ["Emperor Dagran Thaurissan, the last boss, sits in the Imperial Seat: keep Princess Moira alive while you fight him."] =
        "El Emperador Dagran Thaurissan, el último jefe, ocupa el Trono Imperial: mantén con vida a la Princesa Moira mientras luchas contra él.",
    ["Princess Moira Bronzebeard, in the Imperial Seat."] =
        "La Princesa Moira Barbabronce, en el Trono Imperial.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest."] =
        "Yuka Llavenrosca y Maxwort Suprandor, en la Cresta de la Llama.",
    ["Cyrus Therepentous, in the far east of the steppes."] =
        "Cyrus Therepentio, en el extremo este de las estepas.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil."] =
        "Jalinda Espiga y Oralius, en la Vigilia de Morgan.",
    ["Marshal Maxwell."] =
        "El Mariscal Maxwell.",
    ["Ragnar Thunderbrew, in Kharanos."] =
        "Ragnar Cebatruenos, en Kharanos.",
    ["Blackrock Spire"] =
        "Cumbre de Roca Negra",
    ["Prospector Ironboot, at Steamwheedle Port, in Tanaris."] =
        "El Prospector Ferrobota, en Puerto Bonvapor, en Tanaris.",
    ["Yeh'kinya's chain from Zul'Farrak and the sunken temple goes on: two tablets in the Eastern Plaguelands, two inside the spire, then a cloak."] =
        "La cadena de Yeh'kinya de Zul'Farrak y del templo sumergido continúa: dos tablillas en las Tierras de la Peste del Este, dos dentro de la cumbre y luego una capa.",
    ["The third and fourth tablets lie in the troll ruins of the north of the Eastern Plaguelands."] =
        "La tercera y la cuarta tablilla están en las ruinas trols del norte de las Tierras de la Peste del Este.",
    ["Prospector Ironboot, at Steamwheedle Port."] =
        "El Prospector Ferrobota, en Puerto Bonvapor.",
    ["Kibler, at Flame Crest, in the north of the Burning Steppes."] =
        "Kibler, en la Cresta de la Llama, al norte de Las Estepas Ardientes.",
    ["Kibler's two quests: a worg pup or a smolderweb spider, pets that follow you."] =
        "Las dos misiones de Kibler: un cachorro de huargo o una araña Telabrasada, mascotas que te siguen.",
    ["Ragged John, at Flame Crest."] =
        "John Andrajoso, en la Cresta de la Llama.",
    ["Reward: Ragged John's neverending cup, and about 9,950 XP."] =
        "Recompensa: la Copa interminable de John Andrajoso y unos 9.950 de XP.",
    ["Helendis Riverhorn, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "Helendis Rivacuerno, en la Vigilia de Morgan, al este de Las Estepas Ardientes.",
    ["Reward: a cloth robe, a leather jerkin or a mail breastplate."] =
        "Recompensa: una toga de tela, un jubón de cuero o una coraza de malla.",
    ["Enter Blackrock Spire"] =
        "Entra en la Cumbre de Roca Negra",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the spire's door is at the top of the mountain."] =
        "La Montaña Roca Negra se abre al oeste de Las Estepas Ardientes; dentro, la puerta de la cumbre está en lo alto de la montaña.",
    ["Warosh, a troll who walks near the spire's entrance."] =
        "Warosh, un trol que anda cerca de la entrada de la cumbre.",
    ["Reward: a charm, after a fight with Urok Doomhowl."] =
        "Recompensa: un amuleto, tras un combate contra Urok Aullasino.",
    ["Vaelan, a Scarshield infiltrator, stands up the ramp near the spire's entrance."] =
        "Vaelan, un infiltrado del Escudo del Estigma, está subiendo la rampa, cerca de la entrada de la cumbre.",
    ["Optional: the Seal of Ascension, the key to the Upper Spire, a raid of ten; its last part is in Dustwallow Marsh."] =
        "Opcional: el Lacre de Ascensión, la llave de la Cumbre Superior, una banda de diez; su última parte es en el Marjal Revolcafango.",
    ["Bijou hides down in the trench after Hordemar City's second bridge."] =
        "Bijou se esconde abajo, en la zanja que hay pasado el segundo puente de la Ciudad Hordemar.",
    ["Bijou's chain leads to Maxwell's Mission: armor of any kind, after a second visit."] =
        "La cadena de Bijou lleva a «La misión de Maxwell»: una armadura de cualquier tipo, tras una segunda visita.",
    ["Her belongings lie in a chest on the bottom tier of Hordemar City; it can also stand as far as the Skitterweb Tunnels."] =
        "Sus pertenencias están en un cofre del nivel inferior de la Ciudad Hordemar; también puede estar tan lejos como en los Túneles Corretela.",
    ["Back to Bijou."] =
        "Vuelve con Bijou.",
    ["The fifth tablet hangs on a wall of Shadow Hunter Vosh'gajin's room, the sixth on a wall of War Master Voone's room."] =
        "La quinta tablilla cuelga de una pared de la sala del Cazador de las Sombras Vosh'gajin; la sexta, de una pared de la sala del Maestro de guerra Voone.",
    ["Take the Roughshod Pike from a weapon rack on the left wall after Hordemar City's second bridge, join it to Highlord Omokk's head, and use it on the skull pile up the ramp past Mother Smolderweb: ogres come, then Urok Doomhowl."] =
        "Toma la Pica despiadada de un armero de la pared izquierda, pasado el segundo puente de la Ciudad Hordemar, únela a la cabeza del Alto Señor Omokk y úsala en el montón de calaveras que hay subiendo la rampa, pasada la Madre Telabrasada: llegan ogros y luego Urok Aullasino.",
    ["The spire spider eggs lie in the upper Skitterweb Tunnels."] =
        "Los huevos de araña de la cumbre están en la parte alta de los Túneles Corretela.",
    ["Use the empty cage on a Bloodaxe worg pup, in Halycon's room."] =
        "Usa la jaula vacía en un cachorro de huargo Hacha de Sangre, en la sala de Halycon.",
    ["Halycon, the worgs' mother, holds Halycon's Lair."] =
        "Halycon, la madre de los huargos, ocupa la Guarida de Halycon.",
    ["The Scarshield dwarves drop the unadorned seal; Highlord Omokk, north of Mok'Doom, may drop the Spirestone gem, War Master Voone, at the bottom of Tazz'Alaor, the Smolderthorn gem, and Overlord Wyrmthalak, the last boss, the Bloodaxe gem."] =
        "Los enanos del Escudo del Estigma sueltan el lacre sin adornar; el Alto Señor Omokk, al norte de Mok'Doom, puede soltar la Gema de Cumbrerroca; el Maestro de guerra Voone, al fondo de Tazz'Alaor, la Gema de Espina Ahumada; y el Señor Supremo Vermiothalak, el último jefe, la Gema de Hacha de Sangre.",
    ["Vaelan, near the entrance."] =
        "Vaelan, cerca de la entrada.",
    ["Warosh, near the entrance."] =
        "Warosh, cerca de la entrada.",
    ["Let Mother Smolderweb poison you and do not cure it: the poison must last until Ragged John, at Flame Crest."] =
        "Deja que la Madre Telabrasada te envenene y no te cures: el veneno debe durar hasta que llegues a John Andrajoso, en la Cresta de la Llama.",
    ["Enter Blackrock Spire again"] =
        "Vuelve a entrar en la Cumbre de Roca Negra",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle."] =
        "El Alto Señor Omokk, al norte de Mok'Doom; el Maestro de guerra Voone, al fondo de Tazz'Alaor; el Señor Supremo Vermiothalak, el último jefe, en la Cámara de Batalla.",
    ["Kibler and Ragged John, at Flame Crest."] =
        "Kibler y John Andrajoso, en la Cresta de la Llama.",
    ["Helendis Riverhorn and Marshal Maxwell, at Morgan's Vigil."] =
        "Helendis Rivacuerno y el Mariscal Maxwell, en la Vigilia de Morgan.",
    ["Beat Emberstrife, a dragon of the Wyrmbog in Dustwallow Marsh, until his will breaks, then place the seal before him."] =
        "Golpea a Brasaliza, un dragón de la Ciénaga de Fuego del Marjal Revolcafango, hasta doblegar su voluntad, y luego coloca el lacre ante él.",
    ["Vaelan, near the spire's entrance."] =
        "Vaelan, cerca de la entrada de la cumbre.",
    ["Yeh'kinya, beside him."] =
        "Yeh'kinya, a su lado.",
    ["Dire Maul"] =
        "La Masacre",
    ["A herald of your capital: Crier Goodman in Stormwind, Courier Hammerfall in Ironforge, Herald Moonstalker in Darnassus."] =
        "Un heraldo de tu capital: Crier Bonombre en Ventormenta, el Mensajero Sentencia en Forjaz, el Heraldo Acechalunas en Darnassus.",
    ["Optional: a lead to Feathermoon Stronghold, about 1,500 XP."] =
        "Opcional: una misión que lleva al Bastión Plumaluna, unos 1.500 de XP.",
    ["Latronicus Moonspear, at Feathermoon Stronghold, in Feralas."] =
        "Latronicus Lanzaluna, en el Bastión Plumaluna, en Feralas.",
    ["Latronicus Moonspear and Scholar Runethorn, at Feathermoon Stronghold."] =
        "Latronicus Lanzaluna y el Erudito Runaespina, en el Bastión Plumaluna.",
    ["Lethtendris's Web brings a dagger; Elven Legends, about 8,300 XP for a search in the library."] =
        "«La Membrana de Lethtendris» da una daga; «Leyendas élficas», unos 8.300 de XP por una búsqueda en la biblioteca.",
    ["Azj'Tordin, at Lariss Pavilion, in the east of Feralas."] =
        "Azj'Tordin, en el Pabellón Lariss, al este de Feralas.",
    ["Reward: a two-handed sword or leather boots; Pusillin also drops the Crescent Key, which opens the west and north wings."] =
        "Recompensa: una espada de dos manos o unas botas de cuero; Pusillín también suelta la Llave creciente, que abre las alas oeste y norte.",
    ["Rabine Saturna, in Nighthaven, in Moonglade."] =
        "Rabine Saturna, en Amparo de la Noche, en el Claro de la Luna.",
    ["Optional: a reliquary in Silithus for Rabine Saturna in Moonglade, then a shard of the Felvine: a shield or an off-hand lexicon."] =
        "Opcional: un relicario en Silithus para Rabine Saturna, en el Claro de la Luna, y luego un fragmento de gangrevid: un escudo o un léxico para la mano izquierda.",
    ["The Reliquary of Purity lies in the ruins of Southwind Village, in Silithus."] =
        "El Relicario de Pureza está en las ruinas de la Aldea del Viento del Sur, en Silithus.",
    ["Rabine Saturna, in Nighthaven."] =
        "Rabine Saturna, en Amparo de la Noche.",
    ["Enter Dire Maul"] =
        "Entra en La Masacre",
    ["The ruins of Dire Maul stand in the middle of Feralas; the east, west and north wings each have their own door."] =
        "Las ruinas de La Masacre se alzan en el centro de Feralas; las alas este, oeste y norte tienen cada una su propia puerta.",
    ["East: talk to Pusillin each time he stops; he runs five times, then fights on a small platform up a ramp and drops the book."] =
        "Este: habla con Pusillín cada vez que se detenga; huye cinco veces, luego lucha en una pequeña plataforma en lo alto de una rampa y suelta el libro.",
    ["East: Lethtendris waits on the upper level of the room left of the ramps between the Hidden Reach and the Warpwood Quarter."] =
        "Este: Lethtendris espera en el nivel superior de la sala a la izquierda de las rampas entre el Confín Oculto y el Barrio Alabeo.",
    ["East: kill Zevrim Thornhoof, then Ironbark the Redeemed, in the Conservatory, opens the door to Alzzin the Wildshaper; after Alzzin, use the reliquary by the twisted vine."] =
        "Este: mata a Zevrim Pezuñahendida; luego Cortezaférrea el Redimido, en el Invernadero, abre la puerta que lleva a Alzzin el Formaferal; tras Alzzin, usa el relicario junto a la enredadera retorcida.",
    ["West: the Shen'dralar Ancient stands above the platform over Tendris Warpwood."] =
        "Oeste: el Anciano Shen'dralar está encima de la plataforma que hay sobre Tendris Alabeo.",
    ["About 9,950 XP; its treasure, a chest in the library, brings a two-handed mace, a mail helm or leather boots."] =
        "Unos 9.950 de XP; su tesoro, un cofre de la biblioteca, da una maza de dos manos, un yelmo de malla o unas botas de cuero.",
    ["West: destroy the five pylons of the Capital Gardens, the Court of the Highborne and the Prison; Immol'thar waits in the Prison, behind Tendris (the Crescent Key opens it); Prince Tortheldrin, under the entry platform of the Athenaeum."] =
        "Oeste: destruye las cinco torres de los Jardines de la Capital, la Corte de los Altonato y la Prisión; Immol'thar espera en la Prisión, detrás de Tendris (la Llave creciente la abre); el Príncipe Tortheldrin, bajo la plataforma de entrada del Athenaeum.",
    ["West: the treasure is a big stone chest under the ramp of the Athenaeum."] =
        "Oeste: el tesoro es un gran cofre de piedra bajo la rampa del Athenaeum.",
    ["West: through the Conservatory Door (the Crescent Key opens it), the remains lie by a dead elf and a bookcase, in the north of the Athenaeum."] =
        "Oeste: tras la Puerta del Invernadero (la Llave creciente la abre), los restos están junto a un elfo muerto y una estantería, al norte del Athenaeum.",
    ["North: Knot Thimblejack is chained in the north-east corner of the Halls of Destruction."] =
        "Norte: Knot Llavededo está encadenado en la esquina noreste de las Salas de la Destrucción.",
    ["About 6,600 XP for a key the Gordok guards carry."] =
        "Unos 6.600 de XP por una llave que llevan los guardias Gordok.",
    ["Optional: the Gordok Ogre Suit needs runecloth, rugged leather and rune threads."] =
        "Opcional: el traje de ogro Gordok necesita paño rúnico, cuero basto e hilo rúnico.",
    ["North: the Gordok guards Mol'dar, Slip'kik and Fengus, and Captain Kromcrush, carry the shackle key."] =
        "Norte: los guardias Gordok Mol'dar, Slip'kik y Fengus, y el Capitán Kromcrush, llevan la llave de los grilletes.",
    ["Knot Thimblejack."] =
        "Knot Llavededo.",
    ["North: the ogre tannin lies up the ramp above Knot, in the north-west corner: one per group."] =
        "Norte: el Tanino ogro está subiendo la rampa que hay sobre Knot, en la esquina noroeste: uno por grupo.",
    ["North: Captain Kromcrush, once King Gordok is dead."] =
        "Norte: el Capitán Kromcrush, una vez muerto el Rey Gordok.",
    ["Optional, after a tribute run (King Gordok dead, his guards alive): gloves of any kind."] =
        "Opcional, tras una partida de tributo (el Rey Gordok muerto y sus guardias vivos): unos guantes de cualquier tipo.",
    ["The Gauntlet of Gordok Might lies in the Prince's chest, in the Athenaeum of the west wing."] =
        "El Guante del Poderío de Gordok está en el cofre del Príncipe, en el Athenaeum del ala oeste.",
    ["North: Stomper Kreeg, after a tribute run."] =
        "Norte: el Vapuleador Kreeg, tras una partida de tributo.",
    ["Azj'Tordin, at Lariss Pavilion."] =
        "Azj'Tordin, en el Pabellón Lariss.",
    ["Latronicus Moonspear, at Feathermoon Stronghold."] =
        "Latronicus Lanzaluna, en el Bastión Plumaluna.",
    ["Scholar Runethorn, at Feathermoon Stronghold."] =
        "El Erudito Runaespina, en el Bastión Plumaluna.",
    ["Scholomance"] =
        "Scholomance",
    ["Commander Ashlam Valorfist, at Chillwind Camp, in the Western Plaguelands."] =
        "El Comandante Ashlam Puñovalor, en el Campamento del Orvallo, en las Tierras de la Peste del Oeste.",
    ["Optional: the chain of the Skeleton Key, which opens Scholomance's door: one key per group is enough. It goes through the Plaguelands, Gadgetzan and Un'Goro."] =
        "Opcional: la cadena de la Llave esqueleto, que abre la puerta de Scholomance: basta con una llave por grupo. Pasa por las Tierras de la Peste, Gadgetzan y Un'Goro.",
    ["The skeletal flayers and slavering ghouls of Sorrow Hill, in the south of the Western Plaguelands."] =
        "Los despellejadores esqueléticos y los necrófagos esclavizantes de la Colina de las Penas, al sur de las Tierras de la Peste del Oeste.",
    ["Mark the four watchtowers of Andorhal with the beacon torch, standing in each doorway."] =
        "Marca las cuatro atalayas de Andorhal con la Antorcha de aviso, de pie en cada entrada.",
    ["Alchemist Arbington, at Chillwind Camp."] =
        "El Alquimista Arbington, en el Campamento del Orvallo.",
    ["The undead of the Western Plaguelands drop the skeletal fragments."] =
        "Los no-muertos de las Tierras de la Peste del Oeste sueltan los fragmentos esqueléticos.",
    ["Krinkle Goodsteel, in Gadgetzan, in Tanaris: bring 15 gold."] =
        "Krinkle Buenacero, en Gadgetzan, en Tanaris: lleva 15 de oro.",
    ["Bring two thorium bars to the top of Fire Plume Ridge, in Un'Goro Crater, and use the mold by the lava lake."] =
        "Lleva dos Lingotes de torio a lo alto de la Cresta del Penacho en Llamas, en el Cráter de Un'Goro, y usa el molde junto al lago de lava.",
    ["Araj the Summoner stands in the middle of Andorhal."] =
        "Araj el Invocador está en el centro de Andorhal.",
    ["Betina Bigglezink, at Light's Hope Chapel, in the Eastern Plaguelands."] =
        "Betina Bigglezink, en la Capilla de la Esperanza de la Luz, en las Tierras de la Peste del Este.",
    ["About 6,200 XP; a hatchling may drop a scale that starts another quest."] =
        "Unos 6.200 de XP; una cría puede soltar una escama que inicia otra misión.",
    ["Weldon Barov, at Chillwind Camp."] =
        "Weldon Barov, en el Campamento del Orvallo.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Alexi Barov in the Horde's Bulwark."] =
        "La fortuna de los Barov: cuatro escrituras dentro de la escuela; la misión siguiente te envía a matar a Alexi Barov en El Baluarte de la Horda.",
    ["Eva Sarkhoff, in Caer Darrow, on the island of Darrowmere Lake."] =
        "Eva Sarkhoff, en Castel Darrow, en la isla del Lago Darrowmere.",
    ["Eva Sarkhoff's chain: three parts inside the school, then Kirtonos the Herald and a sword or an off-hand item among its rewards."] =
        "La cadena de Eva Sarkhoff: tres partes dentro de la escuela, luego Kirtonos el Heraldo, y una espada o un objeto para la mano izquierda entre sus recompensas.",
    ["Enter Scholomance"] =
        "Entra en Scholomance",
    ["The school stands on the island of Caer Darrow, in Darrowmere Lake, in the south-east of the Western Plaguelands."] =
        "La escuela se alza en la isla de Castel Darrow, en el Lago Darrowmere, al sureste de las Tierras de la Peste del Oeste.",
    ["The deeds: Southshore's on a table north-east of the Reliquary; Tarren Mill's on a table on the left at the entry of the Great Ossuary; Brill's on a ledge south-west of the Laboratory; Caer Darrow's on a table east of the Barov Family Vault."] =
        "Las escrituras: la de Costasur, en una mesa al noreste del Relicario; la de Molino Tarren, en una mesa a la izquierda de la entrada de El Gran Osario; la de Rémol, en un saliente al suroeste del Laboratorio; la de Castel Darrow, en una mesa al este de la Cripta de la Familia Barov.",
    ["The plagued hatchlings fill a room of the Great Ossuary."] =
        "Los trampedores infestados llenan una sala de El Gran Osario.",
    ["A hatchling may drop a healthy dragon scale: use it."] =
        "Una cría puede soltar una Escama de dragón sana: úsala.",
    ["Doctor Theolen Krastinov, in the east of the upper Headmaster's Study: kill him, then burn the two piles of remains, to the north and the south-east of his room."] =
        "El Doctor Theolen Krastinov, en el este de la parte alta del Estudio del Rector: mátalo y luego quema los dos montones de restos, al norte y al sureste de su sala.",
    ["Eva Sarkhoff, in Caer Darrow."] =
        "Eva Sarkhoff, en Castel Darrow.",
    ["Enter Scholomance again"] =
        "Vuelve a entrar en Scholomance",
    ["Jandice Barov waits in the north-east of the room down the stairs, on the right of the second big room."] =
        "Jandice Barov espera en el noreste de la sala que hay bajando las escaleras, a la derecha de la segunda sala grande.",
    ["Rattlegore, at the bottom of the Great Ossuary, drops the Viewing Room key; put the Blood of Innocents in the brazier on the balcony on the right of the Chamber of Summoning: Kirtonos the Herald comes."] =
        "Traquesangre, al fondo de El Gran Osario, suelta la Llave de la Sala de visión; pon la Sangre de los inocentes en el blandón del balcón, a la derecha de la Cámara de Invocación: llega Kirtonos el Heraldo.",
    ["Betina Bigglezink, at Light's Hope Chapel."] =
        "Betina Bigglezink, en la Capilla de la Esperanza de la Luz.",
    ["Optional: an assassination in the other side's camp, among its guards; it brings the Barov Peasant Caller."] =
        "Opcional: un asesinato en el campamento del bando contrario, entre sus guardias; da el Llamador de campesino Barov.",
    ["Alexi Barov stands among the guards of the Bulwark, the Horde's camp in the north of the Western Plaguelands."] =
        "Alexi Barov está entre los guardias de El Baluarte, el campamento de la Horda al norte de las Tierras de la Peste del Oeste.",
    ["Magistrate Marduke, in Caer Darrow."] =
        "El Magistrado Marduke, en Castel Darrow.",
    ["Optional: a chain through Stromgarde, Light's Hope and the Baron's room of Stratholme, back to the school's last boss; it brings a sword, a dagger, a cloth crown or a shield and about 9,950 XP."] =
        "Opcional: una cadena que pasa por Stromgarde, la Esperanza de la Luz y la sala del Barón en Stratholme, y vuelve al último jefe de la escuela; da una espada, una daga, una corona de tela o un escudo, y unos 9.950 de XP.",
    ["The Keepsake of Remembrance lies in the ruins of Stromgarde, in Arathi Highlands."] =
        "El Recuerdo de Evocación está en las ruinas de Stromgarde, en las Tierras Altas de Arathi.",
    ["Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "Leonid Barthalomew el Venerado, en la Capilla de la Esperanza de la Luz.",
    ["Stratholme: place the keepsake on the unholy ground of Baron Rivendare's room."] =
        "Stratholme: coloca el recuerdo en el suelo profano de la sala del Barón Osahendido.",
    ["Ras Frostwhisper waits in the Laboratory: use the Soulbound Keepsake on him."] =
        "Ras Murmuhielo espera en el Laboratorio: usa las Memorias del Vínculo del Alma en él.",
    ["Stratholme"] =
        "Stratholme",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel, in the east of the Eastern Plaguelands."] =
        "Smokey LaRue y Leonid Barthalomew el Venerado, en la Capilla de la Esperanza de la Luz, al este de las Tierras de la Peste del Este.",
    ["Smokey LaRue's tobacco brings a lighter (a trinket); Leonid's holy water, a cloth crown, a ring or potions."] =
        "El tabaco de Smokey LaRue da un mechero (un abalorio); el agua bendita de Leonid, una corona de tela, un anillo o pociones.",
    ["Betina's flesh samples open The Active Agent: a choice of two trinkets."] =
        "Las muestras de carne de Betina abren «El agente activo»: dos abalorios a elegir.",
    ["Duke Nicholas Zverenhoff, at Light's Hope Chapel."] =
        "El Duque Nicholas Zverenhoff, en la Capilla de la Esperanza de la Luz.",
    ["Duke Nicholas's chain leads to Balnazzar, then Baron Rivendare, then the Argent Hold: a sword, a staff or a shield."] =
        "La cadena del Duque Nicholas lleva a Balnazzar, luego al Barón Osahendido y luego al Bastión Argenta: una espada, un bastón o un escudo.",
    ["Caretaker Alen, at Light's Hope Chapel."] =
        "El Custodio Alen, en la Capilla de la Esperanza de la Luz.",
    ["Egan's restless souls bring about 8,300 XP."] =
        "Las almas inquietas de Egan dan unos 8.300 de XP.",
    ["Tirion Fordring, in his hut by the lake on the western edge of the Eastern Plaguelands."] =
        "Tirión Vadín, en su cabaña junto al lago, en el borde oeste de las Tierras de la Peste del Este.",
    ["Optional: Tirion Fordring's long chain across both Plaguelands and Caer Darrow; its painting hangs in the city, and its end, In Dreams, brings armor, a warhammer or jewelry and about 9,950 XP."] =
        "Opcional: la larga cadena de Tirión Vadín por las dos Tierras de la Peste y Castel Darrow; su cuadro cuelga en la ciudad, y su final, «En sueños», da una armadura, un martillo de guerra o una joya, y unos 9.950 de XP.",
    ["The plaguehounds, plaguebats and carrion grubs of the Eastern Plaguelands."] =
        "Los canes de peste, los murcipestes y las larvas carroñeras de las Tierras de la Peste del Este.",
    ["Listen to Tirion Fordring."] =
        "Escucha a Tirión Vadín.",
    ["Taelan's hammer lies in the Undercroft, at the southern end of the Eastern Plaguelands."] =
        "El Martillo de Taelan está en La Subgranja, en el extremo sur de las Tierras de la Peste del Este.",
    ["The Symbol of Lost Honor lies in Northdale, in the north-east of the Eastern Plaguelands."] =
        "El Símbolo del Honor Perdido está en Vallenorte, al noreste de las Tierras de la Peste del Este.",
    ["Artist Renfray, in Caer Darrow, in the Western Plaguelands."] =
        "El Artista Renfray, en Castel Darrow, en las Tierras de la Peste del Oeste.",
    ["Egan, by the road to Stratholme's gate, in the north-west of the Eastern Plaguelands."] =
        "Egan, junto al camino a la puerta de Stratholme, al noroeste de las Tierras de la Peste del Este.",
    ["Enter Stratholme"] =
        "Entra en Stratholme",
    ["The city's main gate, in the north of the Eastern Plaguelands, opens on the Scarlet side."] =
        "La puerta principal de la ciudad, al norte de las Tierras de la Peste del Este, da al lado Escarlata.",
    ["King's Square: take the box of tobacco in Ezra Grimm's smoke shop; Ezra Grimm comes for it."] =
        "Plaza del Rey: toma la caja de tabaco de la tabaquería de Ezra Grimm; Ezra Grimm viene a por ella.",
    ["The supply crates along the city's walls hold the holy water; some call monsters."] =
        "Los cajones de provisiones a lo largo de las murallas de la ciudad contienen el agua bendita; algunos llaman a monstruos.",
    ["Every creature of the city may drop a flesh sample."] =
        "Todas las criaturas de la ciudad pueden soltar una muestra de carne.",
    ["Use Egan's blaster on the spectral citizens, then again on the restless souls that break free."] =
        "Usa el Libertador de Egan en los ciudadanos espectrales y luego otra vez en las almas inquietas que se liberan.",
    ["Archivist Galford waits near the end of the Scarlet Bastion: kill him and burn the book on his table."] =
        "El Archivista Galford espera cerca del final de El Bastión Escarlata: mátalo y quema el libro de su mesa.",
    ["The painting hangs in Galford's room."] =
        "El cuadro cuelga en la sala de Galford.",
    ["Balnazzar, at the end of the Scarlet Bastion, drops his head: use it."] =
        "Balnazzar, al final de El Bastión Escarlata, suelta su cabeza: úsala.",
    ["Aurius waits in a chapel by the service entrance, the other gate of the city."] =
        "Aurius espera en una capilla junto a la entrada de servicio, la otra puerta de la ciudad.",
    ["Optional: Aurius's medallion makes him join the fight against Baron Rivendare: a choice of two trinkets."] =
        "Opcional: el medallón de Aurius hace que se una a la lucha contra el Barón Osahendido: dos abalorios a elegir.",
    ["The medallion lies in Malor's strongbox, in Malor the Zealous's room of the Hall of Lights: the Scarlet Key, or a rogue, opens the Bastion's door."] =
        "El medallón está en la Caja fuerte de Malor, en la sala de Malor el Fanático de la Sala de las Luces: La llave Escarlata, o un pícaro, abre la puerta del Bastión.",
    ["Aurius, in his chapel."] =
        "Aurius, en su capilla.",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "Smokey LaRue y Leonid Barthalomew el Venerado, en la Capilla de la Esperanza de la Luz.",
    ["Enter Stratholme by the service entrance"] =
        "Entra en Stratholme por la entrada de servicio",
    ["The service entrance, east of the main gate, opens on the side of Baron Rivendare."] =
        "La entrada de servicio, al este de la puerta principal, da al lado del Barón Osahendido.",
    ["The new Scourge data lies in one of the three ziggurats of the Gauntlet."] =
        "Los nuevos Datos de la Plaga están en uno de los tres zigurats del Guantelete.",
    ["Baron Rivendare waits downstairs in the building of Slaughter Square."] =
        "El Barón Osahendido espera en el piso de abajo del edificio de la Plaza de la Matanza.",
    ["Aurius appears in the Baron's room and fights at your side."] =
        "Aurius aparece en la sala del Barón y lucha a tu lado.",
    ["Lord Maxwell Tyrosus, inside Light's Hope Chapel."] =
        "Lord Maxwell Neófitus, dentro de la Capilla de la Esperanza de la Luz.",
    ["Open the Argent Hold, inside the chapel."] =
        "Abre el Bastión Argenta, dentro de la capilla.",
    ["Egan, by the road to Stratholme."] =
        "Egan, junto al camino a Stratholme.",
    ["Tirion Fordring, in his hut."] =
        "Tirión Vadín, en su cabaña.",
    ["Myranda the Hag, at Uther's Tomb, in the Western Plaguelands."] =
        "Myranda la Fada, en la Tumba de Uther, en las Tierras de la Peste del Oeste.",
    ["Under Myranda's Scarlet illusion, walk into Hearthglen and give Tirion's gift to Highlord Taelan Fordring."] =
        "Bajo la ilusión Escarlata de Myranda, entra en la Vega del Amparo y entrega el Obsequio de Tirion al Alto señor Taelan Vadín.",
    ["Lead Taelan Fordring out of Hearthglen; the Scarlet give chase."] =
        "Saca a Taelan Vadín de la Vega del Amparo; los Escarlata te persiguen.",
    ["Tirion Fordring."] =
        "Tirión Vadín.",
    ["Ragefire Chasm"] =
        "Sima Ígnea",
    ["Rahauro, on the Elder Rise of Thunder Bluff."] =
        "Rahauro, en el Alto de los Ancestros de Cima del Trueno.",
    ["The lost satchel's quest ends with bracers of cloth, leather or mail."] =
        "La misión de la cartera perdida termina con unos brazales de tela, de cuero o de malla.",
    ["Varimathras, beside Sylvanas in the Royal Quarter of Undercity."] =
        "Varimathras, al lado de Sylvanas, en el Barrio Real de Entrañas.",
    ["Optional: given in Undercity, a zeppelin ride each way. Rewards leggings of cloth, leather or mail."] =
        "Opcional: se acepta en Entrañas, a un viaje en zepelín de ida y otro de vuelta. Da unos leotardos de tela, de cuero o de malla.",
    ["Thrall, in Grommash Hold, in the Valley of Wisdom."] =
        "Thrall, en el Fuerte Grommash, en el Valle de la Sabiduría.",
    ["Thrall's chain of four quests ends with a weapon of your choice."] =
        "La cadena de cuatro misiones de Thrall termina con un arma a tu elección.",
    ["The Burning Blade cultists of the Cleft of Shadow carry the insignia."] =
        "Los fieles Filo Ardiente del Circo de las Sombras llevan las insignias.",
    ["Talk to Neeru Fireblade, in the Darkbriar Lodge of the Cleft of Shadow."] =
        "Habla con Neeru Hojafuego, en el Refugio Zarzaoscura del Circo de las Sombras.",
    ["Neeru Fireblade also asks for the heart of the chasm's beast."] =
        "Neeru Hojafuego también pide el corazón de la bestia de la sima.",
    ["Back to Thrall, in Grommash Hold."] =
        "Vuelve con Thrall, en el Fuerte Grommash.",
    ["Enter Ragefire Chasm"] =
        "Entra en la Sima Ígnea",
    ["The entrance is a cave in the Cleft of Shadow, in the middle of Orgrimmar."] =
        "La entrada es una cueva del Circo de las Sombras, en el centro de Orgrimmar.",
    ["Ragefire troggs and their shamans fill the first caves."] =
        "Los troggs Furia Ardiente y sus chamanes llenan las primeras cuevas.",
    ["Maur Grimtotem's body lies in a small cave on the right, past the big trogg cave."] =
        "El cuerpo de Maur Tótem Siniestro está en una pequeña cueva a la derecha, pasada la gran cueva de los troggs.",
    ["The Searing Blade cultists and warlocks carry both books."] =
        "Los fieles y los brujos abrasadores llevan los dos libros.",
    ["Taragaman the Hungerer, the chasm's second boss, guards a lava cave."] =
        "Taragaman el Hambriento, el segundo jefe de la sima, guarda una cueva de lava.",
    ["Jergosh the Invoker is the third boss; Bazzalan waits at the very end of the chasm."] =
        "Jergosh el Conjurador es el tercer jefe; Bazzalan espera al final del todo de la sima.",
    ["Thrall, in Grommash Hold."] =
        "Thrall, en el Fuerte Grommash.",
    ["Neeru Fireblade, in the Cleft of Shadow."] =
        "Neeru Hojafuego, en el Circo de las Sombras.",
    ["Your reward: an axe, a mace, a dagger or a staff of Orgrimmar."] =
        "Tu recompensa: un hacha, una maza, una daga o un bastón de Orgrimmar.",
    ["Varimathras, in the Royal Quarter of Undercity."] =
        "Varimathras, en el Barrio Real de Entrañas.",
    ["Tonga Runetotem, at the Crossroads."] =
        "Tonga Tótem de Runa, en El Cruce.",
    ["Tonga's three oases open Leaders of the Fang, the caverns' main quest: a weapon of your choice."] =
        "Los tres oasis de Tonga abren «Líderes del Colmillo», la misión principal de las cuevas: un arma a tu elección.",
    ["The Forgotten Pools lie north-west of the Crossroads, north of the caverns' hill."] =
        "Las Charcas del Olvido están al noroeste de El Cruce, al norte de la colina de las cuevas.",
    ["The Stagnant Oasis lies south-east of the Crossroads: use the bubbling fissure in its water."] =
        "El Oasis Estancado está al sureste de El Cruce: usa la Fisura burbujeante que hay en su agua.",
    ["The snapjaw turtles of the Lushwater Oasis, at the foot of the caverns' hill."] =
        "Las tortugas quijafortes del Oasis Aguaverde, al pie de la colina de las cuevas.",
    ["Apothecary Zamah, in the Pools of Vision under the Spirit Rise."] =
        "La Boticaria Zamah, en las Pozas de las Visiones, bajo el Alto de los Espíritus.",
    ["Reward: a piece of cloth, leather or mail armor."] =
        "Recompensa: una pieza de armadura de tela, de cuero o de malla.",
    ["Arch Druid Hamuul Runetotem, on the Elder Rise."] =
        "El Archidruida Hamuul Runatótem, en el Alto de los Ancestros.",
    ["Nara Wildmane, on the Elder Rise."] =
        "Nara Bravacrín, en el Alto de los Ancestros.",
    ["Serpentbloom: small green shrubs with violet flowers, in the caves before the door and inside."] =
        "Reptilia: pequeños arbustos verdes con flores violetas, en las cuevas antes de la puerta y dentro.",
    ["The four Fanglords each drop a gem: Lady Anacondra and Lord Cobrahn first, then Lord Pythas, and Lord Serpentis last."] =
        "Cada uno de los cuatro señores del Colmillo suelta una gema: primero Lady Anacondra y Lord Cobrahn, luego Lord Pythas y, por último, Lord Serpentis.",
    ["Nara Wildmane, on the Elder Rise of Thunder Bluff."] =
        "Nara Bravacrín, en el Alto de los Ancestros de Cima del Trueno.",
    ["Your reward: a staff, a mace or a sword."] =
        "Tu recompensa: un bastón, una maza o una espada.",
    ["Apothecary Zamah, in the Pools of Vision."] =
        "La Boticaria Zamah, en las Pozas de las Visiones.",
    ["Tabitha Heartweaver, at the Sepulcher, in Silverpine Forest."] =
        "Tabitha Heartweaver, en El Sepulcro, en el Bosque de Argénteos.",
    ["Reward: a dagger or cloth cuffs."] =
        "Recompensa: una daga o unos puños de tela.",
    ["Deathguard Kristof, in Brill, in Tirisfal Glades."] =
        "Deathguard Kristof, en Rémol, en los Claros de Tirisfal.",
    ["Reward: a two-handed axe or a staff."] =
        "Recompensa: un hacha de dos manos o un bastón.",
    ["Morbin Lightbane, in Undercity."] =
        "Morbin Lightbane, en Entrañas.",
    ["Reward: leather armor or a mace."] =
        "Recompensa: una armadura de cuero o una maza.",
    ["Theodore Griffs, in Undercity."] =
        "Theodore Griffs, en Entrañas.",
    ["Reward: cloth gloves or a sword."] =
        "Recompensa: unos guantes de tela o una espada.",
    ["The ruins rise above Undercity, in Tirisfal Glades."] =
        "Las ruinas se alzan sobre Entrañas, en los Claros de Tirisfal.",
    ["Look for Edward Heartweaver in the ruins."] =
        "Busca a Edward Heartweaver en las ruinas.",
    ["Twenty-five intact limbs, from the undead of the ruins."] =
        "Veinticinco extremidades intactas, de los no-muertos de las ruinas.",
    ["Rath'mael waits in the ruins."] =
        "Rath'mael espera en las ruinas.",
    ["Witherfang carries the highly toxic strain."] =
        "Witherfang lleva la cepa muy tóxica.",
    ["The Baron may drop an abominable head: read it."] =
        "El Barón puede soltar una cabeza abominable: léela.",
    ["Oran Snakewrithe, in Undercity."] =
        "Oran Contorpiente, en Entrañas.",
    ["Master Apothecary Faranell, in the Apothecarium of Undercity."] =
        "El Maestro boticario Faranell, en el Apothecarium de Entrañas.",
    ["Optional: Faranell's Unending Torment goes on in Undercity; its last part has a two-handed sword among its rewards."] =
        "Opcional: «Unending Torment» de Faranell sigue en Entrañas; su última parte incluye una espada de dos manos entre sus recompensas.",
    ["A toxic skullcap from Tawny Grisette in the Trade Quarter, blisterweed near the herbalism trainer, and an essence of agony from the poison vendor of the Rogues' Quarter."] =
        "Una Toxic Skullcap de Tawny Grisette, en el Barrio del Comercio; Blisterweed, junto al instructor de herboristería; y una Esencia de agonía del vendedor de venenos del Barrio de los Pícaros.",
    ["Inject the hissing serum into the system above Othmar's body."] =
        "Inyecta el suero sibilante en el sistema que hay sobre el cuerpo de Othmar.",
    ["Bring the Baron's head to Othmar's body, the unfinished abomination."] =
        "Lleva la cabeza del Barón al cuerpo de Othmar, la abominación inacabada.",
    ["Master Apothecary Faranell."] =
        "El Maestro boticario Faranell.",
    ["Deathguard Kristof, in Brill."] =
        "Deathguard Kristof, en Rémol.",
    ["Tabitha Heartweaver, at the Sepulcher."] =
        "Tabitha Heartweaver, en El Sepulcro.",
    ["Shadowfang Keep"] =
        "Castillo de Colmillo Oscuro",
    ["Keeper Bel'dugur, in Undercity."] =
        "El Vigilante Bel'dugur, en Entrañas.",
    ["Dalar Dawnweaver, at the Sepulcher, in Silverpine Forest."] =
        "Dalar Tejalba, en El Sepulcro, en el Bosque de Argénteos.",
    ["Reward: a ring and about 3,300 XP."] =
        "Recompensa: un anillo y unos 3.300 de XP.",
    ["High Executor Hadrec, at the Sepulcher."] =
        "El Sumo Ejecutor Hadrec, en El Sepulcro.",
    ["Reward: shoulders of cloth, leather or mail."] =
        "Recompensa: unas hombreras de tela, de cuero o de malla.",
    ["Enter Shadowfang Keep"] =
        "Entra en el Castillo de Colmillo Oscuro",
    ["The keep stands south of the Sepulcher."] =
        "El castillo se alza al sur de El Sepulcro.",
    ["Deathstalker Vincent lies in the courtyard: Deathstalker Adamant, freed after Rethilgore, opens its door."] =
        "El Mortacechador Vincent yace en el patio: el Mortacechador Adamant, liberado tras Rethilgore, abre su puerta.",
    ["The Book of Ur, a blue book, stands on a bookshelf on the left of Fenrus the Devourer's room."] =
        "El libro de Ur, un libro azul, está en una estantería a la izquierda de la sala de Fenrus el Devorador.",
    ["Archmage Arugal, the last boss, waits at the top of the keep."] =
        "El Archimago Arugal, el último jefe, espera en lo alto del castillo.",
    ["Dalar Dawnweaver, at the Sepulcher."] =
        "Dalar Tejalba, en El Sepulcro.",
    ["Tsunaman, at Sun Rock Retreat, in Stonetalon Mountains."] =
        "Tsunaman, en el Refugio Roca del Sol, en la Sierra Espolón.",
    ["Optional: a lead from Stonetalon to Zoram'gar Outpost."] =
        "Opcional: una misión que lleva de la Sierra Espolón a la Avanzada de Zoram'gar.",
    ["Je'neu Sancrea, at Zoram'gar Outpost, on Ashenvale's coast."] =
        "Je'neu Sancrea, en la Avanzada de Zoram'gar, en la costa de Vallefresno.",
    ["Je'neu Sancrea, at Zoram'gar Outpost."] =
        "Je'neu Sancrea, en la Avanzada de Zoram'gar.",
    ["The Earthen Ring's quests: Amongst the Ruins wakes Baron Aquanis, whose drop starts a quest with a sword among its rewards."] =
        "Las misiones del Anillo de la Tierra: «Entre ruinas» despierta al Barón Aquanis, cuyo botín inicia una misión con una espada entre sus recompensas.",
    ["The deeps open in ruins half under water, on the coast of Zoram Strand."] =
        "Las cavernas se abren en unas ruinas medio sumergidas, en la costa de La Ensenada de Zoram.",
    ["The Sapphires of Aku'Mai grow on the walls of the cave before the dungeon's door."] =
        "Los Zafiros de Aku'Mai crecen en las paredes de la cueva antes de la puerta de la mazmorra.",
    ["The Blackfathom tide priestesses of that cave may drop a damp note: read it."] =
        "Las sacerdotisas de las mareas Brazanegra de esa cueva pueden soltar una Nota mojada: léela.",
    ["Back to Je'neu Sancrea, at Zoram'gar Outpost, before the dungeon."] =
        "Vuelve con Je'neu Sancrea, en la Avanzada de Zoram'gar, antes de la mazmorra.",
    ["Reward: a wand, a shield or leather armor."] =
        "Recompensa: una varita, un escudo o una armadura de cuero.",
    ["Lorgus Jett walks the nooks on the west side, south of the Pool of Ask'ar."] =
        "Lorgus Jett recorre los recovecos del lado oeste, al sur de la Poza de Ask'ar.",
    ["The Fathom Stone lies under the water in the middle of the Moonshrine Ruins, under the walkway before Kelris; taking its core wakes Baron Aquanis."] =
        "La Piedra de las profundidades está bajo el agua, en el centro de las Ruinas del Santuario Lunar, bajo la pasarela que hay antes de Kelris; tomar su núcleo despierta al Barón Aquanis.",
    ["Baron Aquanis may drop a Strange Water Globe: use it."] =
        "El Barón Aquanis puede soltar un Globo de agua extraño: úsalo.",
    ["Bashana Runetotem, on the Elder Rise of Thunder Bluff."] =
        "Bashana Runatótem, en el Alto de los Ancestros de Cima del Trueno.",
    ["Borstan, the meat vendor of Orgrimmar."] =
        "Borstan, el vendedor de carne de Orgrimmar.",
    ["Reward: a dagger or a satchel of potions."] =
        "Recompensa: una daga o una bolsa de pociones.",
    ["Zaruk, at Hammerfall, in Arathi Highlands."] =
        "Zaruk, en Sentencia, en las Tierras Altas de Arathi.",
    ["Dragonmaw Rumors leads to Open the Maw, inside the site."] =
        "«Dragonmaw Rumors» lleva a «Open the Maw», dentro de la excavación.",
    ["The Deathstalker Agent hides in the hills above the Dragonmaw camp, in the Wetlands."] =
        "El Agente Mortacechador se esconde en las colinas que hay sobre el campamento Faucedraco, en Los Humedales.",
    ["Thicket raptor meat, from the raptors of the site."] =
        "Carne de raptor de la espesura, de los raptores de la excavación.",
    ["The Dragonmaw forces of the site, their thaumaturgists among them."] =
        "Las fuerzas Faucedraco de la excavación, entre ellas sus taumaturgos.",
    ["The Titan relic leads to the Earthen Ring: a staff or a two-handed mace."] =
        "La reliquia de los titanes lleva al Anillo de la Tierra: un bastón o una maza de dos manos.",
    ["The Deathstalker Agent, above the Dragonmaw camp."] =
        "El Agente Mortacechador, sobre el campamento Faucedraco.",
    ["Borstan, in Orgrimmar."] =
        "Borstan, en Orgrimmar.",
    ["Muln Earthfury, on the Skywatcher Plateau, in the north-west of Mulgore."] =
        "Muln Earthfury, en la Meseta del Vigía del Cielo, al noroeste de Mulgore.",
    ["Nogg, in his machine shop in the Valley of Honor of Orgrimmar."] =
        "Nogg, en su taller de máquinas del Valle del Honor de Orgrimmar.",
    ["Sovik, beside Nogg."] =
        "Sovik, al lado de Nogg.",
    ["Scooty's transponder sends you straight to Gnomeregan, far in Dun Morogh, and stays yours."] =
        "El transpondedor de Scooty te envía directamente a Gnomeregan, lejos, en Dun Morogh, y te lo quedas.",
    ["Wait for Scooty to set up the transponder."] =
        "Espera a que Scooty prepare el transpondedor.",
    ["The transponder leaves you by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "El transpondedor te deja junto a las puertas de Gnomeregan, al oeste de Dun Morogh.",
    ["Optional: an escort, turned in at Booty Bay; it rewards bracers or shoulders."] =
        "Opcional: una escolta que se entrega en Bahía del Botín; da unos brazales o unas hombreras.",
    ["The last boss, Mekgineer Thermaplugg, carries the code of his safe, set in the far wall of the Tinkers' Court next to the third pillar counting from the right."] =
        "El último jefe, el Mekigeniero Termochufe, lleva el código de su caja fuerte, empotrada en la pared del fondo del Patio de los Manitas, junto al tercer pilar contando desde la derecha.",
    ["Scooty, in Booty Bay."] =
        "Scooty, en Bahía del Botín.",
    ["Nogg, in Orgrimmar."] =
        "Nogg, en Orgrimmar.",
    ["It opens Hearts of Zeal, a quest of the Scarlet Monastery."] =
        "Abre «Corazones de fervor», una misión del Monasterio Escarlata.",
    ["Auld Stonespire, in Thunder Bluff."] =
        "Auld Picopiedra, en Cima del Trueno.",
    ["Reward: cloth shoulders, a mail belt or a shield, and about 4,050 XP."] =
        "Recompensa: unas hombreras de tela, un cinturón de malla o un escudo, y unos 4.050 de XP.",
    ["Rau Cliffrunner, at Freewind Post, in Thousand Needles."] =
        "Rau Abiscorredor, en el Poblado Viento Libre, en Las Mil Agujas.",
    ["The kraul bats of the cave west of the bridges drop the guano."] =
        "Los murciélagos del Horado de la cueva al oeste de los puentes sueltan el guano.",
    ["Charlga may drop a small scroll: read it."] =
        "Charlga puede soltar un Pergamino pequeño: léelo.",
    ["Willix the Importer waits in a tent below Charlga's platform."] =
        "Willix el Importador espera en una tienda debajo de la plataforma de Charlga.",
    ["Master Apothecary Faranell, in Undercity."] =
        "El Maestro boticario Faranell, en Entrañas.",
    ["It opens An Unholy Alliance, a quest of Razorfen Downs."] =
        "Abre «Una alianza nefasta», una misión de Zahúrda Rajacieno.",
    ["Doctor Martin Felben, in the Apothecarium of Undercity."] =
        "El Doctor Martin Felben, en el Apothecarium de Entrañas.",
    ["Reward: a wand or a cloak."] =
        "Recompensa: una varita o una capa.",
    ["Melisara and Magus Wordeen Voidglare, in Tarren Mill, in Hillsbrad Foothills."] =
        "Melisara y el Magus Wordeen Vacuamirada, en Molino Tarren, en las Laderas de Trabalomas.",
    ["Tarren Mill's quests: The Grave Knight brings leather boots or mail bracers."] =
        "Las misiones de Molino Tarren: «The Grave Knight» da unas botas de cuero o unos brazales de malla.",
    ["Reward: a staff or mail shoulders."] =
        "Recompensa: un bastón o unas hombreras de malla.",
    ["Atrexis the Grave Knight, inside the city."] =
        "Atrexis the Grave Knight, dentro de la ciudad.",
    ["Six cracked sentry cores, from the fragmented sentries of the city."] =
        "Seis núcleos de centinela agrietados, de los centinelas fragmentados de la ciudad.",
    ["Magus Wordeen Voidglare and Melisara, in Tarren Mill."] =
        "El Magus Wordeen Vacuamirada y Melisara, en Molino Tarren.",
    ["Doctor Martin Felben, in Undercity."] =
        "El Doctor Martin Felben, en Entrañas.",
    ["Dorn Plainstalker, in Thousand Needles."] =
        "Dorn Acechallanos, en Las Mil Agujas.",
    ["Optional: a chain of ten quests through Thousand Needles, Stonetalon, Ashenvale and Undercity, up to a book of the monastery; it ends with a mace or a wand and about 4,200 XP."] =
        "Opcional: una cadena de diez misiones por Las Mil Agujas, la Sierra Espolón, Vallefresno y Entrañas, hasta un libro del monasterio; termina con una maza o una varita y unos 4.200 de XP.",
    ["Leap from the wooden planks over the canyon, in the west of Thousand Needles."] =
        "Salta desde los tablones de madera sobre el cañón, al oeste de Las Mil Agujas.",
    ["Grenka Bloodscreech, a harpy of the west of Thousand Needles."] =
        "Grenka Aullasangre, una arpía del oeste de Las Mil Agujas.",
    ["Rok'Alim the Pounder, an elemental of the north-west of Thousand Needles."] =
        "Rok'Alim el Aporreador, un elemental del noroeste de Las Mil Agujas.",
    ["Braug Dimspirit, in the east of Stonetalon Mountains."] =
        "Braug Espiritoscuro, al este de la Sierra Espolón.",
    ["The Legacy of the Aspects, a book in the south-east of Ashenvale."] =
        "El legado de los Aspectos, un libro al sureste de Vallefresno.",
    ["Braug Dimspirit, in Stonetalon."] =
        "Braug Espiritoscuro, en la Sierra Espolón.",
    ["Braug Dimspirit asks a question: give him the right answer."] =
        "Braug Espiritoscuro hace una pregunta: dale la respuesta correcta.",
    ["Sage Truthseeker, in Thunder Bluff."] =
        "El Sabio Buscaverdad, en Cima del Trueno.",
    ["Reward: a shield or an off-hand orb, and about 3,550 XP."] =
        "Recompensa: un escudo o un orbe para la mano izquierda, y unos 3.550 de XP.",
    ["Parqual Fintallas, in Undercity."] =
        "Parqual Fintallas, en Entrañas.",
    ["Reward: a sword, an off-hand cane or a necklace, and about 5,150 XP."] =
        "Recompensa: una espada, un bastón para la mano izquierda o un collar, y unos 5.150 de XP.",
    ["Master Apothecary Faranell, in the Apothecarium."] =
        "El Maestro boticario Faranell, en el Apothecarium.",
    ["Graveyard: Vorrel Sengutz lies on a table on the right of the Chamber of Atonement, by Interrogator Vishas."] =
        "Cementerio: Vorrel Sengutz yace en una mesa a la derecha de la Cámara de Expiación, junto al Interrogador Vishas.",
    ["Reward: a cloth cape or shoulders, or leather boots; the ring it asks for is in the Alterac Mountains."] =
        "Recompensa: una capa o unas hombreras de tela, o unas botas de cuero; el anillo que pide está en las Montañas de Alterac.",
    ["Every Scarlet of the monastery may drop a heart."] =
        "Todos los Escarlata del monasterio pueden soltar un corazón.",
    ["Library: the book rests on a table, in the first side room on the left as you walk the Gallery of Treasures."] =
        "Biblioteca: el libro está sobre una mesa, en la primera sala lateral de la izquierda según recorres la Galería de los Tesoros.",
    ["Library: the Compendium stands on a bookcase on the left wall at the entrance of the Athenaeum."] =
        "Biblioteca: el Compendio está en una estantería de la pared izquierda, a la entrada del Athenaeum.",
    ["Parqual Fintallas asks a question: give him the right answer."] =
        "Parqual Fintallas hace una pregunta: dale la respuesta correcta.",
    ["Varimathras, in the Royal Quarter."] =
        "Varimathras, en el Barrio Real.",
    ["Nancy Vishas, an elite, keeps the ring in a house of the Alterac Mountains."] =
        "Nancy Vishas, una élite, guarda el anillo en una casa de las Montañas de Alterac.",
    ["Monika Sengutz, in Tarren Mill, in Hillsbrad Foothills."] =
        "Monika Sengutz, en Molino Tarren, en las Laderas de Trabalomas.",
    ["Andrew Brownell, in Undercity."] =
        "Andrew Brownell, en Entrañas.",
    ["Reward: a mace, a gun, a cloth robe or a leather chest."] =
        "Recompensa: una maza, un arma de fuego, una toga de tela o un peto de cuero.",
    ["Ambassador Malcin walks among the quilboar outside the downs."] =
        "El Embajador Malcin anda entre los jabaespines, fuera de la Zahúrda.",
    ["Patrick Garrett, in Undercity."] =
        "Patrick Garrett, en Entrañas.",
    ["Dran Droffers, in the Drag of Orgrimmar."] =
        "Dran Droffers, en La Calle Mayor de Orgrimmar.",
    ["Dran Droffers's chain goes back and forth between Orgrimmar, Kargath and Uldaman: it ends with a necklace and about 5,600 XP."] =
        "La cadena de Dran Droffers va y viene entre Orgrimmar, Kargath y Uldaman: termina con un collar y unos 5.600 de XP.",
    ["Jarkal Mossmeld, at Kargath, in the west of the Badlands."] =
        "Jarkal Musgofusión, en Kargath, al oeste de las Tierras Inhóspitas.",
    ["The tablet lies in an ancient chest by the gates of Uldaman, in the north of the Badlands."] =
        "La tablilla está en un Cofre antiguo junto a las puertas de Uldaman, al norte de las Tierras Inhóspitas.",
    ["The Shadowforge dwarves around the gates drop the power stones and the shattered necklace."] =
        "Los enanos Forjatiniebla de alrededor de las puertas sueltan las piedras de energía y el collar destrozado.",
    ["The Garrett family chest stands in the dig west of Uldaman's gates."] =
        "El Cofre de la familia Garrett está en el yacimiento al oeste de las puertas de Uldaman.",
    ["Jarkal Mossmeld, at Kargath."] =
        "Jarkal Musgofusión, en Kargath.",
    ["Dran Droffers, in Orgrimmar."] =
        "Dran Droffers, en Orgrimmar.",
    ["Magenta cap clusters grow on the cave walls, south-west of Uldaman's gates and inside."] =
        "Las setas magenta crecen en las paredes de la cueva, al suroeste de las puertas de Uldaman y dentro.",
    ["The dungeon's door is at the back of the cave by the dig at Uldaman's gates."] =
        "La puerta de la mazmorra está al fondo de la cueva, junto al yacimiento de las puertas de Uldaman.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage; then head out for Kargath."] =
        "Un paladín muerto yace justo al lado de la primera gran sala, por su segundo pasaje de la derecha; luego sal hacia Kargath.",
    ["Enter Uldaman again"] =
        "Vuelve a entrar en Uldaman",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault; Archaedas, the last boss, in the Hall of the Crafters, drops the power source."] =
        "El topacio está en una Urna llamativa al sureste de la Excavación Dos; el rubí, en un cofre de piedra al noroeste de la Excavación Tres (llama a monstruos); el zafiro lo lleva Grimlok, al final de la Cámara de Piedra; Archaedas, el último jefe, en la Sala de los Artesanos, suelta la fuente de energía.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Thunder Bluff with potions or a bag."] =
        "Opcional: Los Discos de Norgannon, detrás de Archaedas, cuentan su historia; termina en Cima del Trueno con pociones o una bolsa.",
    ["Bena Winterhoof, in Thunder Bluff."] =
        "Bena Pezuña Invernal, en Cima del Trueno.",
    ["Venom bottles stand in the Witherbark trolls' camps of the south-west of the Hinterlands."] =
        "Las botellas de veneno están en los campamentos de los trols Secacorteza del suroeste de las Tierras del Interior.",
    ["Optional: a chain of six quests between the Hinterlands, Tarren Mill, Durotar and the city; it ends with a shield, a mail chest or a cloth robe."] =
        "Opcional: una cadena de seis misiones entre las Tierras del Interior, Molino Tarren, Durotar y la ciudad; termina con un escudo, un peto de malla o una toga de tela.",
    ["Apothecary Lydon, in Tarren Mill, in Hillsbrad Foothills."] =
        "El Boticario Lydon, en Molino Tarren, en las Laderas de Trabalomas.",
    ["The Witherbark broodguards, spiders of the Hinterlands' troll camps, carry the sacs."] =
        "Los guardias de la prole Secacorteza, arañas de los campamentos trols de las Tierras del Interior, llevan las glándulas.",
    ["Apothecary Lydon, in Tarren Mill."] =
        "El Boticario Lydon, en Molino Tarren.",
    ["Master Gadrin, in Sen'jin Village, in Durotar."] =
        "El Maestro Gadrin, en el Poblado Sen'jin, en Durotar.",
    ["A tablet stands in the middle of the scarabs' chamber: read the spider god's name on it."] =
        "Hay una tablilla en el centro de la cámara de los escarabajos: lee en ella el nombre del dios araña.",
    ["Master Gadrin, in Sen'jin Village."] =
        "El Maestro Gadrin, en el Poblado Sen'jin.",
    ["Defeat Shadra at her altar of Shadra'Alor, in the south-west of the Hinterlands, and take her venom."] =
        "Derrota a Shadra en su altar de Shadra'Alor, al suroeste de las Tierras del Interior, y toma su veneno.",
    ["Uthel'nay, in the Valley of Spirits of Orgrimmar."] =
        "Uthel'nay, en el Valle de los Espíritus de Orgrimmar.",
    ["Vark Battlescar and Selendra, at Shadowprey Village, on the west coast of Desolace."] =
        "Vark Marcaguerra y Selendra, en la Aldea Cazasombras, en la costa oeste de Desolace.",
    ["Shadowprey Village's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "Las dos misiones de la Aldea Cazasombras: un anillo, unos guanteletes de placas o un cinturón de cuero; luego, el fin de Theradras da una espada, un bastón o un arco.",
    ["Vark Battlescar and Selendra, at Shadowprey Village."] =
        "Vark Marcaguerra y Selendra, en la Aldea Cazasombras.",
    ["Uthel'nay, in Orgrimmar."] =
        "Uthel'nay, en Orgrimmar.",
    ["Fel'zerul, in Stonard, in the Swamp of Sorrows."] =
        "Fel'zerul, en Rocal, en el Pantano de las Penas.",
    ["Fel'zerul's chain goes to the Hinterlands and back: it opens The Temple of Atal'Hakkar, a talisman and about 5,900 XP."] =
        "La cadena de Fel'zerul va a las Tierras del Interior y vuelve: abre «El Templo de Atal'Hakkar», un talismán y unos 5.900 de XP.",
    ["The Atal'ai artifacts lie in the ruins around the Pool of Tears, in the east of the swamp."] =
        "Los artefactos Atal'ai están en las ruinas alrededor de la Charca de Lágrimas, al este del pantano.",
    ["Fel'zerul, in Stonard."] =
        "Fel'zerul, en Rocal.",
    ["Jammal'an the Prophet: cloth leggings or a mail helm, and about 6,550 XP."] =
        "«El profeta Jammal'an»: unos leotardos de tela o un yelmo de malla, y unos 6.550 de XP.",
    ["Witch Doctor Uzer'i, at Camp Mojache, in Feralas."] =
        "El Médico brujo Uzer'i, en el Campamento Mojache, en Feralas.",
    ["Larion, at Marshal's Refuge, in Un'Goro Crater."] =
        "Larion, en el Refugio de Marshal, en el Cráter de Un'Goro.",
    ["Larion's chain leads to the temple's haze; its end brings a bloodpetal zapper."] =
        "La cadena de Larion lleva a la calima del templo; su final da un liquidador de pétalos de sangre.",
    ["The bloodpetal plants of Un'Goro."] =
        "Las plantas Sangrepétalo de Un'Goro.",
    ["Liv Rizzlefix, in Ratchet."] =
        "Liv Rizzlefix, en Trinquete.",
    ["Every Atal'ai troll of the temple may drop a fetish."] =
        "Todos los trols Atal'ai del templo pueden soltar un fetiche.",
    ["Apothecary Zinge, in the Apothecarium of Undercity."] =
        "La Boticaria Zinge, en el Apothecarium de Entrañas.",
    ["Optional: a lead from Undercity to Vivian Lagrave, at Kargath."] =
        "Opcional: una misión que lleva de Entrañas a Vivian Latumba, en Kargath.",
    ["Shadowmage Vivian Lagrave, at Kargath, in the west of the Badlands."] =
        "La Maga oscura Vivian Latumba, en Kargath, al oeste de las Tierras Inhóspitas.",
    ["Shadowmage Vivian Lagrave, at Kargath."] =
        "La Maga oscura Vivian Latumba, en Kargath.",
    ["Reward: a two-handed axe, a mace or potions."] =
        "Recompensa: un hacha de dos manos, una maza o pociones.",
    ["Thunderheart, at Kargath."] =
        "Truenozón, en Kargath.",
    ["Thunderheart's chain: Disharmony of Fire brings armor of any kind, and opens Commander Gor'shak and The Last Element."] =
        "La cadena de Truenozón: «La discordia de las llamas» da una armadura de cualquier tipo y abre «Comandante Gor'shak» y «El último elemento».",
    ["Hierophant Theodora Mulvadania, at Kargath."] =
        "La Hierofante Theodora Mulvadania, en Kargath.",
    ["The Rise of the Machines ends inside the depths with armor of any kind, and about 6,200 XP."] =
        "«La revuelta de las máquinas» termina dentro de las profundidades con una armadura de cualquier tipo y unos 6.200 de XP.",
    ["The WANTED poster, at Kargath."] =
        "El cartel de SE BUSCA, en Kargath.",
    ["The wanted posters lead to General Angerforge, and a medallion."] =
        "Los carteles de se busca llevan hasta el General Forjainquina y a un medallón.",
    ["The war reavers and obsidian elementals of the Badlands drop the shards."] =
        "Los atracadores de guerra y los elementales obsidiana de las Tierras Inhóspitas sueltan los fragmentos.",
    ["Lotwil Veriatus, in the west of the Badlands."] =
        "Lotwil Veriatus, al oeste de las Tierras Inhóspitas.",
    ["Galamav the Marksman, at Kargath."] =
        "Galamav el Preciso, en Kargath.",
    ["Commander Gor'shak's chain leads to Thrall, the emperor and the princess: about 9,950 XP at its end, and Thrall's reward."] =
        "La cadena del Comandante Gor'shak lleva a Thrall, al emperador y a la princesa: unos 9.950 de XP al final, y la recompensa de Thrall.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the depths' door is at the bottom of the mountain."] =
        "La Montaña Roca Negra se abre al sur de La Garganta de Fuego; dentro, la puerta de las profundidades está en el fondo de la montaña.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Commander Gor'shak sits in the first cell on the left of the tunnel."] =
        "El Alto Interrogador Gerstahn, en una sala del fondo a la derecha del Bloque de Detención, lleva la llave de la celda; el Comandante Gor'shak está en la primera celda a la izquierda del túnel.",
    ["Defend Gor'shak against two waves of guards."] =
        "Defiende a Gor'shak de dos oleadas de guardias.",
    ["Talk to Kharan Mighthammer, in the first cell on the left across the hallway."] =
        "Habla con Kharan Martillazo, en la primera celda a la izquierda, al otro lado del pasillo.",
    ["The Anvilrage guardsmen, wardens and footmen of the Detention Block and the halls."] =
        "Los custodios, alcaides y lacayos Yunque Colérico del Bloque de Detención y de las salas.",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City: he carries the Tablet of Kurniya."] =
        "Lord Incendius espera en el Yunque Negro, en la Ciudad Forjatiniebla: lleva la Tablilla de Kurniya.",
    ["Golem Lord Argelmach waits in the Manufactory; his golems and constructs drop the cores and the essences."] =
        "El Señor Gólem Argelmach espera en el Taller; sus gólems y ensamblajes sueltan los núcleos y las esencias.",
    ["Warlord Goretooth, at Kargath."] =
        "El Señor de la guerra Dientegore, en Kargath.",
    ["The KILL ON SIGHT poster, at Kargath."] =
        "El cartel de MATAR INMEDIATAMENTE, en Kargath.",
    ["Thrall, in Grommash Hold, in Orgrimmar."] =
        "Thrall, en el Fuerte Grommash, en Orgrimmar.",
    ["The Anvilrage medics, soldiers and officers of the halls."] =
        "Los médicos, soldados y oficiales Yunque Colérico de las salas.",
    ["Warlord Goretooth, then Lexlort, at Kargath."] =
        "El Señor de la guerra Dientegore y luego Lexlort, en Kargath.",
    ["Grark Lorkrub, held in the Blackrock Stronghold of the Burning Steppes."] =
        "Grark Lorkrub, retenido en el Bastión Roca Negra de Las Estepas Ardientes.",
    ["Optional: an escort in the Burning Steppes, then a third visit for General Angerforge: a medallion and about 7,750 XP."] =
        "Opcional: una escolta en Las Estepas Ardientes y luego una tercera visita a por el General Forjainquina: un medallón y unos 7.750 de XP.",
    ["Bind Grark Lorkrub with the shackles and lead him through Blackrock Mountain to the Searing Gorge."] =
        "Ata a Grark Lorkrub con los grilletes y llévalo a través de la Montaña Roca Negra hasta La Garganta de Fuego.",
    ["Lexlort, then Warlord Goretooth, at Kargath."] =
        "Lexlort y luego el Señor de la guerra Dientegore, en Kargath.",
    ["Enter Blackrock Depths a third time"] =
        "Entra por tercera vez en las Profundidades de Roca Negra",
    ["General Angerforge waits down the stairs of the West Garrison."] =
        "El General Forjainquina espera bajando las escaleras del Cuartel Oeste.",
    ["Galamav the Marksman, at Kargath, in the west of the Badlands."] =
        "Galamav el Preciso, en Kargath, al oeste de las Tierras Inhóspitas.",
    ["Lexlort, at Kargath."] =
        "Lexlort, en Kargath.",
    ["Lexlort's chain: Bijou's report brings cloth gloves or a mail belt."] =
        "La cadena de Lexlort: el informe de Bijou da unos guantes de tela o un cinturón de malla.",
    ["Reward: armor of any kind, for the spire's three generals and their documents."] =
        "Recompensa: una armadura de cualquier tipo, por los tres generales de la cumbre y sus documentos.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the spire's door is at the top of the mountain."] =
        "La Montaña Roca Negra se abre al sur de La Garganta de Fuego; dentro, la puerta de la cumbre está en lo alto de la montaña.",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle. The documents lie in one of their rooms, or by Urok's tribute pile."] =
        "El Alto Señor Omokk, al norte de Mok'Doom; el Maestro de guerra Voone, al fondo de Tazz'Alaor; el Señor Supremo Vermiothalak, el último jefe, en la Cámara de Batalla. Los documentos están en una de sus salas, o junto al montón de tributos de Urok.",
    ["Galamav the Marksman, Lexlort and Warlord Goretooth, at Kargath."] =
        "Galamav el Preciso, Lexlort y el Señor de la guerra Dientegore, en Kargath.",
    ["A herald of your capital: Harbinger Balthazad, Warcaller Gorlach or Bluff Runner Windstrider."] =
        "Un heraldo de tu capital: el Presagista Balthazad, el Clamaguerras Gorlach o el Asaltaviento Correbrisa.",
    ["Optional: a lead to Camp Mojache, about 1,500 XP."] =
        "Opcional: una misión que lleva al Campamento Mojache, unos 1.500 de XP.",
    ["Talo Thornhoof, at Camp Mojache, in Feralas."] =
        "Talo Pezuñahendida, en el Campamento Mojache, en Feralas.",
    ["Talo Thornhoof and Sage Korolusk, at Camp Mojache."] =
        "Talo Pezuñahendida y el Sabio Korolusk, en el Campamento Mojache.",
    ["Talo Thornhoof, at Camp Mojache."] =
        "Talo Pezuñahendida, en el Campamento Mojache.",
    ["Sage Korolusk, at Camp Mojache."] =
        "El Sabio Korolusk, en el Campamento Mojache.",
    ["Harbinger Balthazad, in the Valley of Honor of Orgrimmar."] =
        "El Presagista Balthazad, en el Valle del Honor de Orgrimmar.",
    ["High Executor Derrington, at the Bulwark, in the Western Plaguelands."] =
        "El Sumo ejecutor Derrington, en El Baluarte, en las Tierras de la Peste del Oeste.",
    ["Burn the Scarlet command tent between Felstone Field and Dalson's Tears, and plant the Scourge banner there."] =
        "Quema la tienda de mando Escarlata entre el Campo de Piedramácula y el Llanto de Dalson, y planta allí el estandarte de la Plaga.",
    ["Apothecary Dithers, at the Bulwark."] =
        "El Boticario Dithers, en El Baluarte.",
    ["Apothecary Dithers, at the Bulwark, in the Western Plaguelands."] =
        "El Boticario Dithers, en El Baluarte, en las Tierras de la Peste del Oeste.",
    ["Alexi Barov, at the Bulwark."] =
        "Alexi Barov, en El Baluarte.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Weldon Barov in the Alliance's Chillwind Camp."] =
        "La fortuna de los Barov: cuatro escrituras dentro de la escuela; la misión siguiente te envía a matar a Weldon Barov en el Campamento del Orvallo de la Alianza.",
    ["Weldon Barov stands among the guards of Chillwind Camp, the Alliance's camp in the west of the Western Plaguelands."] =
        "Weldon Barov está entre los guardias del Campamento del Orvallo, el campamento de la Alianza al oeste de las Tierras de la Peste del Oeste.",
    ["Nathanos Blightcaller, at Marris Stead, in the south-west of the Eastern Plaguelands."] =
        "Nathanos Clamañublo, en la Hacienda de Marris, al suroeste de las Tierras de la Peste del Este.",
    ["Optional: Nathanos Blightcaller's chain in the Eastern Plaguelands, up to Ramstein the Gorger inside the city: about 6,600 XP at its end."] =
        "Opcional: la cadena de Nathanos Clamañublo en las Tierras de la Peste del Este, hasta Ramstein el Empachador dentro de la ciudad: unos 6.600 de XP al final.",
    ["Corin's Crossing, to the east: collect the living rot in ten minutes, then grind it with the mortar."] =
        "El Cruce de Corin, al este: recoge la Caña viva en diez minutos y luego muélela con el mortero.",
    ["The plaguebats of the Eastern Plaguelands."] =
        "Los murcipestes de las Tierras de la Peste del Este.",
    ["The Quel'Thalas Registry lies in the Quel'Lithien lodge, on the northern border."] =
        "El Registro de Quel'Thalas está en el Refugio Quel'Lithien, en la frontera norte.",
    ["Duskwing, a bat, roams the country; Borelgore walks the northern wastes."] =
        "Alaocaso, un murciélago, vaga por la región; Borelgore recorre los páramos del norte.",
    ["Ramstein the Gorger comes into Slaughter Square once it is cleared."] =
        "Ramstein el Empachador entra en la Plaza de la Matanza una vez despejada.",
    ["Nathanos Blightcaller, at Marris Stead."] =
        "Nathanos Clamañublo, en la Hacienda de Marris.",
}
