-- Brazilian Portuguese guide texts: [English text] = Portuguese text, one entry per phrase of
-- the guides (zone names of the titles, route intros, automatic notes, hand-written notes). tools/translate_guides.lua
-- writes Ding/Locales/Guides/ptBR/ from it; a note joining several phrases is translated
-- phrase by phrase. Keys: the English texts of the routes (tools/routes/*.lua), the
-- automatic notes of tools/draft_guide.lua and Ding/Guides/NightElf/01_Shadowglen.lua.
-- Zone, town and NPC names follow the official ptBR client (as in QuestieDB's ptBR data).
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "Umbravale",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "Os dois NPCs de missão estão bem à sua frente, ao pé de Aldrassil.",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "Sabres-da-noite jovens e javalis-espinho em volta de Aldrassil: mate tudo o que encontrar.",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "Tarindrella fica um pouco a sudoeste de Aldrassil (57.8, 45.2).",
    ["The class trainers are inside Aldrassil."] =
        "Os instrutores de classe ficam dentro de Aldrassil.",
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "Gilshalan exige nível 3: se você ainda não chegou lá, o Ding! avisará antes da caverna.",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "Um só circuito: sabres-da-noite sarnentos e javalis ao norte, musgo nos capetas, totens a oeste (54, 40).",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "Iverron espera diante da caverna, ao norte (54.6, 33).",
    ["Spiders in the cave, right behind Iverron."] =
        "Aranhas na caverna, logo atrás de Iverron.",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "Githyiss, a Torpe, no fundo da caverna (56.6, 26.3), pode soltar uma presa: use-a direto das bolsas.",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "De volta a Aldrassil: tudo é entregue no mesmo lugar.",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "Cogumelos nos capetas, lírios ao norte de Aldrassil (57, 37), icor nas aranhas, ovo no fundo da caverna.",
    ["Iverron, still in front of the cave."] =
        "Iverron, ainda diante da caverna.",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "Tenaron fica no topo de Aldrassil: siga a rampa que sobe em volta do tronco.",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "Encha o frasco no poço lunar, a nordeste (60, 33).",
    ["Porthannius, on the road out of Shadowglen."] =
        "Porthannius, na estrada que sai de Umbravale.",
    ["Head for Dolanaar"] =
        "Rumo a Dolanaar",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "Siga a estrada para o sul até a estalagem: as duas missões abertas são entregues em Dolanaar.",
    -- human
    ["Northshire"] =
        "Vila Norte",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "Tudo acontece em volta da Abadia de Vila Norte: siga a seta de NPC em NPC.",
    ["Elwynn Forest"] =
        "Floresta de Elwynn",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "Vila d'Ouro é sua base na floresta toda: estalagem, instrutores de classe e missões.",
    ["Westfall"] =
        "Cerro Oeste",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "Siga para oeste pela estrada de Vila d'Ouro, depois até o Morro da Sentinela, no centro de Cerro Oeste.",
    ["Loch Modan"] =
        "Loch Modan",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "Pegue o Metrô Correfundo de Ventobravo até Altaforja, depois a estrada para o leste por Dun Morogh até Thelsamar.",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "Vale Cristálgida",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "Tudo começa no Vale Cristálgida: siga a seta de NPC em NPC.",
    ["Dun Morogh"] =
        "Dun Morogh",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "Saia do vale pelo túnel a nordeste: Kharanos é sua base em Dun Morogh.",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "Pegue a estrada para o leste pelo túnel de South Gate até Thelsamar.",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "Metrô Correfundo de Altaforja até Ventobravo, depois a estrada para oeste por Vila d'Ouro até o Morro da Sentinela.",
    -- nightelf
    ["Teldrassil"] =
        "Teldrassil",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "Dolanaar é sua base em Teldrassil: estalagem, instrutores de classe e a maioria das missões.",
    ["Darkshore"] =
        "Costa Negra",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "Vila de Rut'theran (portal ao pé de Darnassus), depois o barco para Auberdine: sua base na Costa Negra.",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "Barco de Auberdine para o Porto de Menethil, depois a estrada para o leste pelo Pantanal até Loch Modan: Thelsamar é sua base.",
    -- alliance
    ["Redridge Mountains"] =
        "Montanhas Cristarrubra",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "Cristarrubra fica a leste da Floresta de Elwynn: siga a estrada para o leste até Vila Plácida. Elfos Noturnos: barco de Auberdine para Menethil, Altaforja, depois o metrô para Ventobravo.",
    ["Duskwood"] =
        "Floresta do Crepúsculo",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "A Floresta do Crepúsculo fica ao sul de Elwynn: Vila Sombria, no leste da floresta, é sua base.",
    ["Wetlands"] =
        "Pantanal",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "O Pantanal fica ao norte de Loch Modan: o Porto de Menethil, na costa oeste, é sua base.",
    ["Ashenvale"] =
        "Vale Gris",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "Barco de Menethil para Auberdine, depois a estrada para o sul até o Vale Gris: Astranaar é sua base.",
    ["Stonetalon Mountains"] =
        "Cordilheira das Torres de Pedra",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "A Cordilheira das Torres de Pedra fica a oeste do Vale Gris.",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "De volta a Astranaar para as últimas missões do Vale Gris.",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "De volta à Floresta do Crepúsculo para o fim das missões: Vila Sombria segue como sua base.",
    ["Hillsbrad Foothills"] =
        "Contraforte de Eira dos Montes",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "De Menethil, a estrada para o norte cruza a Ponte Thandol até o Contraforte: Costa Sul é sua base.",
    ["Thousand Needles"] =
        "Mil Agulhas",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "Chegue a Mil Agulhas por Theramore e o sul dos Sertões, ou por Feralas; o acampamento goblin a leste é sua base.",
    ["Desolace"] =
        "Desolação",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "Desolação fica ao sul da Cordilheira das Torres de Pedra: a base da Aliança está no nordeste da zona.",
    ["Stranglethorn Vale"] =
        "Selva do Espinhaço",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "A Selva do Espinhaço fica ao sul da Floresta do Crepúsculo: Acampamento dos Rebeldes ao norte, Angra do Butim ao sul.",
    ["Arathi Highlands"] =
        "Planalto Arathi",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "O Planalto Arathi fica ao norte do Pantanal, do outro lado da Ponte Thandol.",
    ["Dustwallow Marsh"] =
        "Pântano Vadeoso",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "Barco de Menethil para Theramore, a base da Aliança à beira do pântano.",
    ["Badlands"] =
        "Ermos",
    ["The Badlands are southeast of Loch Modan."] =
        "Os Ermos ficam a sudeste de Loch Modan.",
    ["Swamp of Sorrows"] =
        "Pântano das Mágoas",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "O Pântano das Mágoas fica a leste da Trilha do Vento Morto, ao sul de Cristarrubra.",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "De volta à Selva do Espinhaço para o fim das missões, a partir da Angra do Butim.",
    ["Tanaris"] =
        "Tanaris",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "Geringontzan, no norte de Tanaris, é sua base. Barco da Angra do Butim para Vila Catraca, ou voo a partir de Theramore.",
    ["Feralas"] =
        "Feralas",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "O bastião da Aliança em Feralas fica numa ilha a oeste da zona.",
    ["The Hinterlands"] =
        "Terras Agrestes",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "As Terras Agrestes ficam a nordeste do Contraforte de Eira dos Montes: o ninho dos Martelo Feroz está a oeste.",
    ["Searing Gorge"] =
        "Garganta Abrasadora",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "A Garganta Abrasadora fica ao sul de Loch Modan, passando pelos Ermos.",
    ["Blasted Lands"] =
        "Barreira do Inferno",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "Voe até a Barreira do Inferno, ao sul do Pântano das Mágoas: a fortaleza da Aliança, no norte da zona, é a sua base.",
    ["Un'Goro Crater"] =
        "Cratera Un'Goro",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "A Cratera Un'Goro se abre a sudoeste de Tanaris: de Geringontzan, desça a rampa.",
    ["Azshara"] =
        "Azshara",
    ["Azshara is east of Ashenvale."] =
        "Azshara fica a leste do Vale Gris.",
    ["Felwood"] =
        "Selva Maleva",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "A Selva Maleva fica ao norte do Vale Gris: a base da Aliança está no sul da zona.",
    ["Burning Steppes"] =
        "Estepes Ardentes",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "As Estepes Ardentes ficam ao norte de Cristarrubra: o acampamento da Aliança está no leste da zona.",
    ["Winterspring"] =
        "Hibérnia",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "Hibérnia fica a nordeste da Selva Maleva: Visteterna é sua base.",
    ["Western Plaguelands"] =
        "Terras Pestilentas Ocidentais",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "As Terras Pestilentas Ocidentais ficam ao norte do Contraforte de Eira dos Montes: o acampamento da Aliança está no sul da zona.",
    ["Eastern Plaguelands"] =
        "Terras Pestilentas Orientais",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "As Terras Pestilentas Orientais prolongam as Ocidentais para o leste: a Capela Esperança da Luz fica no leste.",
    ["Silithus"] =
        "Silithus",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "Silithus fica ao sul da Cratera Un'Goro: o Forte Cenariano está no norte da zona.",
    -- orc_troll
    ["Valley of Trials"] =
        "Vale das Provações",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "Tudo acontece no Vale das Provações: siga a seta de NPC em NPC.",
    ["Durotar"] =
        "Durotar",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "Saia do vale pela estrada do leste, depois siga ao norte até o Monte Navalha: sua base em Durotar.",
    ["The Barrens"] =
        "Sertões",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "Cruze a ponte a oeste do Monte Navalha para entrar nos Sertões, depois siga a estrada até a Encruzilhada: sua base.",
    -- tauren
    ["Camp Narache"] =
        "Aldeia Narache",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "Tudo começa na Aldeia Narache: siga a seta de NPC em NPC.",
    ["Mulgore"] =
        "Mulgore",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "Siga a estrada para o norte, saindo da Aldeia Narache, até a Aldeia Casco Sangrento: sua base em Mulgore.",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "Saia de Mulgore pela estrada do leste rumo aos Sertões, depois siga ao norte até a Encruzilhada: sua base.",
    -- undead
    ["Deathknell"] =
        "Plangemortis",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "Tudo começa em Plangemortis: siga a seta de NPC em NPC.",
    ["Tirisfal Glades"] =
        "Clareiras de Tirisfal",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "Saia de Plangemortis pela estrada do leste até Montalvo: sua base nas Clareiras de Tirisfal.",
    ["Silverpine Forest"] =
        "Floresta de Pinhaprata",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "De Montalvo, pegue a estrada para oeste e depois para o sul, pela ponte, até a Floresta de Pinhaprata: o Sepulcro é sua base.",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "Zepelim das torres perto da Cidade Baixa até Orgrimmar, depois a estrada para oeste e sul até a Encruzilhada: sua base nos Sertões.",
    -- horde
    ["The Barrens and Stonetalon"] =
        "Sertões e Torres de Pedra",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "A Encruzilhada, no centro dos Sertões, é sua base; a Cordilheira das Torres de Pedra fica a oeste dos Sertões.",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "O Vale Gris fica ao norte dos Sertões: o Posto Machadada, no leste da floresta, é sua base.",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "Zepelim da torre perto de Orgrimmar até a Cidade Baixa, depois a estrada para o sul pela Floresta de Pinhaprata até a Serraria Tarren: sua base.",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "Zepelim de volta a Orgrimmar para as missões mais altas dos Sertões e da Cordilheira das Torres de Pedra.",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "Mil Agulhas fica ao sul dos Sertões, descendo o Grande Elevador: a Aldeia Vento Livre é sua base.",
    ["Hillsbrad, Alterac and Arathi"] =
        "Eira dos Montes, Alterac e Arathi",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "Zepelim até a Cidade Baixa, depois a Serraria Tarren de novo; as Montanhas de Alterac ficam ao norte do Contraforte, o Planalto Arathi a leste, com Ruína do Martelo no leste do planalto.",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "Desolação fica ao sul da Cordilheira das Torres de Pedra: a aldeia da Horda está na costa oeste.",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "Zepelim de Orgrimmar até Grom'gol, o acampamento da Horda no norte da Selva do Espinhaço.",
    ["Dustwallow and Thousand Needles"] =
        "Pântano Vadeoso e Mil Agulhas",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "Zepelim de volta a Orgrimmar. O Pântano Vadeoso fica a leste do sul dos Sertões, com a Aldeia Muralha Verde no norte do pântano; o Salar Cintilante fica no leste de Mil Agulhas.",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "De volta ao Planalto Arathi: Ruína do Martelo fica no leste da zona.",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "Voe de Ruína do Martelo até Karrath, no oeste dos Ermos.",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "De volta à Selva do Espinhaço para o fim das missões, a partir de Grom'gol e da Angra do Butim.",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "O Pântano das Mágoas fica a leste da Trilha do Vento Morto: Pedregal é sua base.",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "Feralas fica a oeste de Mil Agulhas: a Aldeia Mojache, no leste da zona, é sua base.",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "Geringontzan, no norte de Tanaris, é sua base: a estrada para o sul por Mil Agulhas, ou o barco da Angra do Butim para Vila Catraca.",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "As Terras Agrestes ficam a leste do Contraforte de Eira dos Montes: a Aldeia Revatusco, dos trolls, está na costa leste.",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "A Garganta Abrasadora fica ao sul dos Ermos: voe até Karrath, depois a estrada para o sul. As Estepes Ardentes ficam ao sul da garganta.",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "Azshara fica a leste do Vale Gris: Valormok, no sudoeste da zona, é sua base.",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "A Selva Maleva fica ao norte do Vale Gris: o posto da Horda está no oeste da zona.",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "As Terras Pestilentas Ocidentais ficam a leste das Clareiras de Tirisfal: o Baluarte guarda a fronteira, a leste de Montalvo.",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "Se o item inicial caiu: use-o direto das bolsas.",
    ["Human"] =
        "Humano",
    ["Dwarf and Gnome"] =
        "Anão e gnomo",
    ["Night Elf"] =
        "Elfo noturno",
    ["Orc and Troll"] =
        "Orc e troll",
    ["Tauren"] =
        "Tauren",
    ["Undead"] =
        "Morto-vivo",
    ["Alliance"] =
        "Aliança",
    ["Horde"] =
        "Horda",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "A partir daqui, o guia passa sozinho de uma zona para outra: a primeira etapa em uma zona diz como chegar lá.",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "Atalho: deixe os monstros te matarem, liberte seu espírito e volte à vida com o Anjo da Cura; depois siga em frente.",
    ["Finish the level on nearby monsters before moving on."] =
        "Termine o nível nos monstros próximos antes de seguir.",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "Início dos humanos",
    ["Night Elf start"] =
        "Início dos elfos noturnos",
    ["Tauren start"] =
        "Início dos taurens",
    ["Undead start"] =
        "Início dos mortos-vivos",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Início dos skyborne",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "Tudo começa na Ilha de Zephras: siga a seta de NPC em NPC.",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "Floresta de Elwynn: Abadia de Vila Norte, onde todo humano começa.",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "Dun Morogh: Vale Cristálgida, onde anões e gnomos começam.",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "Teldrassil: Umbravale, onde os elfos noturnos começam.",
    ["Travel to Westfall"] =
        "Viaje até Cerro Oeste",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "Cerro Oeste: o Morro da Sentinela é a base, no meio da zona. A primeira parada é a fazenda no norte.",
    ["Travel to Auberdine"] =
        "Viaje até Auberdine",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "Costa Negra: Auberdine, o porto na costa oeste.",
    ["Travel to Thelsamar"] =
        "Viaje até Thelsamar",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "Loch Modan: Thelsamar, à beira da estrada, no oeste da zona.",
    ["Travel to Redridge Mountains"] =
        "Viaje até as Montanhas Cristarrubra",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "Montanhas Cristarrubra: Vila Plácida é a base, à beira do lago. A primeira parada é a passagem a oeste, vindo da Floresta de Elwynn.",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "Vale Gris: Posto de Maestra no oeste, depois Astranaar no meio da zona.",
    ["Travel to Menethil Harbor"] =
        "Viaje até o Porto de Menethil",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "Pantanal: Porto de Menethil, na costa oeste.",
    ["Travel to Darkshire"] =
        "Viaje até Vila Sombria",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "Floresta do Crepúsculo: Vila Sombria, no leste da zona.",
    ["Travel to Stonetalon Peak"] =
        "Viaje até o Morro das Torres de Pedra",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "Cordilheira das Torres de Pedra: Morro das Torres de Pedra, no extremo norte da zona.",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "Ventobravo primeiro, depois a Floresta do Crepúsculo e a Selva do Espinhaço.",
    ["Travel to Southshore"] =
        "Viaje até a Costa Sul",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "Contraforte de Eira dos Montes: Costa Sul, no litoral sul.",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "Pântano Vadeoso: Ilha de Theramore, ao largo da costa leste.",
    ["Travel to Booty Bay"] =
        "Viaje até a Angra do Butim",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "Selva do Espinhaço: Angra do Butim, na ponta sul. O barco de Vila Catraca chega lá.",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "Desolação: o Posto do Nijel, no canto nordeste, é a base da Aliança.",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "Selva do Espinhaço: Angra do Butim, na ponta sul.",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "Ventobravo primeiro, depois o Pântano das Mágoas.",
    ["Travel to Refuge Pointe"] =
        "Viaje até a Ponta do Refúgio",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "Planalto Arathi: Ponta do Refúgio, no meio da zona.",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "Ventobravo primeiro, depois o Pântano Vadeoso: Ilha de Theramore.",
    ["Travel to Nijel's Point"] =
        "Viaje até o Posto do Nijel",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "Desolação: Posto do Nijel, no canto nordeste.",
    ["Ironforge first, then the Badlands."] =
        "Altaforja primeiro, depois os Ermos.",
    ["Travel to Stormwind"] =
        "Viaje até Ventobravo",
    ["Stormwind first, then Stranglethorn Vale."] =
        "Ventobravo primeiro, depois a Selva do Espinhaço.",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "Floresta do Crepúsculo: Vila Sombria primeiro, depois o Pântano das Mágoas.",
    ["Travel to Gadgetzan"] =
        "Viaje até Geringontzan",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "Tanaris: Geringontzan, no norte da zona.",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "Tanaris: Geringontzan primeiro, depois Feralas: Domínio de Plumaluna.",
    ["Travel to Aerie Peak"] =
        "Viaje até o Ninho da Águia",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "Terras Agrestes: Ninho da Águia, no oeste da zona.",
    ["Travel to Un'Goro Crater"] =
        "Viaje até a Cratera Un'Goro",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "Cratera Un'Goro: o Refúgio do Marshal é a base, no norte. A primeira parada fica no sudeste.",
    ["Travel to Thorium Point"] =
        "Viaje até Thorium Point",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "Garganta Abrasadora: Thorium Point, no noroeste da zona.",
    ["Travel to Nethergarde Keep"] =
        "Viaje até a Bastilha de Etergarde",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "Barreira do Inferno: Bastilha de Etergarde, no nordeste, depois as Estepes Ardentes.",
    ["Travel to Chillwind Camp"] =
        "Viaje até o Acampamento Ventogelante",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "Terras Pestilentas Ocidentais: Acampamento Ventogelante, no sul da zona.",
    ["Travel to Rut'theran Village"] =
        "Viaje até a Vila de Rut'theran",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "Teldrassil: Vila de Rut'theran primeiro, depois Azshara e a Selva Maleva.",
    ["Travel to Feathermoon Stronghold"] =
        "Viaje até o Domínio de Plumaluna",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "Feralas: Domínio de Plumaluna, na ilha ao largo da costa oeste.",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "Tanaris: Geringontzan primeiro, depois a Cratera Un'Goro.",
    ["Travel to Emerald Sanctuary"] =
        "Viaje até o Santuário Esmeralda",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "Selva Maleva: Santuário Esmeralda, no sul da zona.",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "Altaforja primeiro, depois as Estepes Ardentes: Morgan's Vigil, no leste.",
    ["Travel to Ironforge"] =
        "Viaje até Altaforja",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "Altaforja primeiro, depois as Terras Pestilentas: Acampamento Ventogelante e Capela Esperança da Luz.",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "Hibérnia: Visteterna, no meio da zona.",
    ["Travel to Silithus"] =
        "Viaje até Silithus",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "Silithus: Repouso do Valor, no nordeste, depois o Forte Cenariano.",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "Clareiras de Tirisfal: Plangemortis, onde os mortos-vivos se erguem.",
    ["Mulgore: Camp Narache, where tauren start."] =
        "Mulgore: Aldeia Narache, onde os taurens começam.",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "Durotar: o Vale das Provações, onde orcs e trolls começam.",
    ["Travel to Silverpine Forest"] =
        "Viaje até a Floresta de Pinhaprata",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "Floresta de Pinhaprata: o Sepulcro é a base, no meio. A primeira parada fica na estrada, no norte.",
    ["Travel to Razor Hill"] =
        "Viaje até o Monte Navalha",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "Durotar: Monte Navalha primeiro, depois os Sertões: a Encruzilhada, e a Cordilheira das Torres de Pedra.",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "Vale Gris: Posto Machadada, no leste da zona. A entrada é pelo túnel que vem das Torres de Pedra.",
    ["Travel to the Undercity"] =
        "Viaje até a Cidade Baixa",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "Cidade Baixa primeiro, depois o Contraforte de Eira dos Montes: Serraria Tarren.",
    ["Thunder Bluff first, then the Barrens."] =
        "Penhasco do Trovão primeiro, depois os Sertões.",
    ["Travel to Sun Rock Retreat"] =
        "Viaje até o Retiro Rocha do Sol",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "Cordilheira das Torres de Pedra: Retiro Rocha do Sol, no meio da zona.",
    ["Travel to the Crossroads"] =
        "Viaje até a Encruzilhada",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "Sertões: a Encruzilhada primeiro, depois o Vale Gris: Posto Machadada.",
    ["Travel to Camp Taurajo"] =
        "Viaje até o Acampamento Taurajo",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "Sertões: Acampamento Taurajo primeiro, depois Mil Agulhas: Aldeia Vento Livre.",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "Planalto Arathi: Ruína do Martelo, no leste da zona.",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "Mil Agulhas: Aldeia Vento Livre, sobre os platôs no meio da zona.",
    ["Travel to Desolace"] =
        "Viaje até Desolação",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "Desolação: o Entreposto do Espírito que Anda é a base, no meio da zona.",
    ["Travel to Grom'gol Base Camp"] =
        "Viaje até o Acampamento Grom'gol",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "Selva do Espinhaço: Acampamento Grom'gol, na costa oeste. O zepelim de Orgrimmar chega lá.",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "Orgrimmar primeiro, depois o Pântano Vadeoso: Aldeia Muralha Verde.",
    ["Travel to Tarren Mill"] =
        "Viaje até a Serraria Tarren",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "Contraforte de Eira dos Montes: Serraria Tarren primeiro, depois as Montanhas de Alterac e o Planalto Arathi.",
    ["Travel to the Badlands"] =
        "Viaje até os Ermos",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "Ermos: Karrath, na borda oeste, é a base da Horda.",
    ["Travel to Ratchet"] =
        "Viaje até Vila Catraca",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "Sertões: Vila Catraca primeiro, depois a Selva do Espinhaço e o Pântano das Mágoas: Pedregal.",
    ["Travel to Shadowprey Village"] =
        "Viaje até a Aldeia Pescassombra",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "Desolação: Aldeia Pescassombra, na costa oeste.",
    ["Travel to Brackenwall Village"] =
        "Viaje até a Aldeia Muralha Verde",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "Pântano Vadeoso: Aldeia Muralha Verde, no noroeste da zona.",
    ["Travel to Camp Mojache"] =
        "Viaje até a Aldeia Mojache",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "Feralas: Aldeia Mojache, no leste da zona.",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "Selva do Espinhaço: Acampamento Grom'gol, na costa oeste.",
    ["Travel to the Swamp of Sorrows"] =
        "Viaje até o Pântano das Mágoas",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "Pântano das Mágoas: Pedregal é a base, no meio da zona.",
    ["Travel to the Shimmering Flats"] =
        "Viaje até o Salar Cintilante",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "Mil Agulhas: o Salar Cintilante primeiro, depois Tanaris e o Pântano Vadeoso.",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "Cidade Baixa primeiro, depois as Terras Agrestes: Aldeia Revatusco.",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "Feralas: Aldeia Mojache primeiro, depois a Cratera Un'Goro.",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "Selva do Espinhaço: Angra do Butim primeiro, depois o Pântano das Mágoas.",
    ["Travel to the Blasted Lands"] =
        "Viaje até a Barreira do Inferno",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "Barreira do Inferno: a primeira parada fica na entrada norte, perto do Pântano das Mágoas.",
    ["Travel to Kargath"] =
        "Viaje até Karrath",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "Ermos: Karrath primeiro, na borda oeste, depois a Garganta Abrasadora.",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "Estepes Ardentes: Monte Candente, no leste. A entrada é pela Montanha Rocha Negra.",
    ["Travel to Valormok"] =
        "Viaje até Valormok",
    ["Azshara: Valormok, in the west of the zone."] =
        "Azshara: Valormok, no oeste da zona.",
    ["Travel to Bloodvenom Post"] =
        "Viaje até o Posto Peçonha",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "Selva Maleva: Posto Peçonha, no oeste da zona.",
    ["Undercity first, then the Plaguelands."] =
        "Cidade Baixa primeiro, depois as Terras Pestilentas.",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "Isso libera espaço nas suas bolsas.",
    ["You receive one further along the route."] =
        "Você recebe um mais adiante na rota.",
    ["Pick up anything that sells for 10 copper or more."] =
        "Pegue tudo o que se vende por 10 de cobre ou mais.",
    ["You'll level faster with this."] =
        "Com isso, você sobe de nível mais rápido.",
    ["The NPC is outdoors, right beside the structure."] =
        "O NPC está do lado de fora, bem ao lado da construção.",
    ["Skip the foes and dash into the tent."] =
        "Ignore os inimigos e corra para dentro da tenda.",
    ["Foes cannot strike you from there."] =
        "Os inimigos não conseguem te atingir dali.",
    ["Widen the camera view."] =
        "Amplie a visão da câmera.",
    ["Recall to your bind point in Northshire Valley"] =
        "Volte ao seu lar no Vale de Vila Norte com a Pedra de Regresso",
    ["The NPC is indoors."] =
        "O NPC está lá dentro.",
    ["The NPC is indoors at street level."] =
        "O NPC está lá dentro, no nível da rua.",
    ["The quest giver stands outdoors, not indoors."] =
        "Quem dá a missão está do lado de fora, não lá dentro.",
    ["With the coming hand-ins, this brings you to level 4."] =
        "Com as próximas entregas, isso te leva ao nível 4.",
    ["The NPC is indoors, on the central storey."] =
        "O NPC está lá dentro, no andar do meio.",
    ["The objective is underground, in the mine shaft."] =
        "O objetivo fica no subsolo, no poço da mina.",
    ["The targets roam the mine and the area around it."] =
        "Os alvos circulam pela mina e pelos arredores.",
    ["Exit the mine shaft"] =
        "Saia do poço da mina",
    ["The quest giver stands outdoors at the back of the building."] =
        "Quem dá a missão está do lado de fora, nos fundos do prédio.",
    ["The NPC is out back, at the rear of the structure."] =
        "O NPC está lá fora, nos fundos da construção.",
    ["The NPC stands by the horse stalls."] =
        "O NPC fica perto das baias dos cavalos.",
    ["Look for wooden pails."] =
        "Procure baldes de madeira.",
    ["Leave it out if other players crowd the area."] =
        "Pule esta etapa se a área estiver cheia de outros jogadores.",
    ["With the coming hand-ins, this gets you to level 6."] =
        "Com as próximas entregas, isso te leva ao nível 6.",
    ["Climb to the highest floor of the building."] =
        "Suba até o último andar do prédio.",
    ["The NPC waits on the lower level, indoors."] =
        "O NPC espera no nível de baixo, lá dentro.",
    ["The NPC is indoors, one floor up."] =
        "O NPC está lá dentro, um andar acima.",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "Cure o Guarda Roberts com Cura Inferior (Grau 2).",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "Aplique Palavra de Poder: Fortitude no Guarda Roberts.",
    ["Do it only if you can."] =
        "Faça só se puder.",
    ["Go into the mine"] =
        "Entre na mina",
    ["Stay on the trail through the mine"] =
        "Siga a trilha pela mina",
    ["This one roams, so scan the surrounding area."] =
        "Este se desloca, então procure pelos arredores.",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "Junto com as próximas entregas, isso te leva ao nível 8.",
    ["Die on purpose at this spot"] =
        "Morra de propósito neste ponto",
    ["Die to the monsters here on purpose."] =
        "Deixe os monstros daqui te matarem de propósito.",
    ["Dying costs you nothing this early."] =
        "Neste início, morrer não custa nada.",
    ["This is the quickest way over."] =
        "É o caminho mais rápido para chegar lá.",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "Deixe-se matar e depois ressuscite com o Anjo da Cura",
    ["Look for little stacks of brown wood."] =
        "Procure pequenas pilhas de madeira marrom.",
    ["Look around tree trunks at ground level."] =
        "Procure em volta dos troncos das árvores, rente ao chão.",
    ["The targets are wolves."] =
        "Os alvos são lobos.",
    ["The following step may be hard."] =
        "A próxima etapa pode ser difícil.",
    ["One extra level makes it easier."] =
        "Um nível a mais facilita.",
    ["With the coming turn-ins, this gets you to level 10."] =
        "Com as próximas entregas, isso te leva ao nível 10.",
    ["The NPC waits outside, at the building's front."] =
        "O NPC espera do lado de fora, na frente do prédio.",
    ["Fly to Lakeshire"] =
        "Voe até Vila Plácida",
    ["Stay on the road and watch for danger."] =
        "Siga pela estrada e fique atento ao perigo.",
    ["Foes in this area outlevel you."] =
        "Os inimigos desta área têm nível acima do seu.",
    ["Let the conversation play out."] =
        "Deixe a conversa terminar.",
    ["Your targets here are gnolls."] =
        "Seus alvos aqui são gnolls.",
    ["Fly to Sentinel Hill"] =
        "Voe até o Morro da Sentinela",
    ["Fly to Stormwind City"] =
        "Voe até a Cidade de Ventobravo",
    ["Head indoors"] =
        "Vá para dentro",
    ["Step onto the pink rune."] =
        "Pise na runa rosa.",
    ["Look within the tomb."] =
        "Procure dentro do túmulo.",
    ["The NPC stands one level over the crypt."] =
        "O NPC fica um nível acima da cripta.",
    ["Be ready for a fight right away."] =
        "Esteja pronto para lutar logo de cara.",
    ["The NPC waits indoors, a floor above the entrance."] =
        "O NPC espera lá dentro, um andar acima da entrada.",
    ["Head down into the Deeprun Tram station"] =
        "Desça até a estação do Metrô Correfundo",
    ["Pass through the portal to teleport."] =
        "Atravesse o portal para se teletransportar.",
    ["Take the Deeprun Tram over to Ironforge."] =
        "Pegue o Metrô Correfundo até Altaforja.",
    ["The NPC stands by the wall on the central platform."] =
        "O NPC fica junto à parede, na plataforma central.",
    ["Target the Deeprun Rats with the item."] =
        "Use o item nos Ratos Correfundo.",
    ["Look for little gray rodents."] =
        "Procure pequenos roedores cinza.",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "Vá até a plataforma de Altaforja do Metrô Correfundo.",
    ["Fly to Ironforge"] =
        "Voe até Altaforja",
    ["Stay on the trail"] =
        "Siga a trilha",
    ["Steer clear of the elite yeti patrolling close by."] =
        "Fique longe do yeti de elite que patrulha por perto.",
    ["The NPC is up on the summit."] =
        "O NPC está lá no topo.",
    ["Let the elite yeti stroll off before you go near."] =
        "Deixe o yeti de elite se afastar antes de chegar perto.",
    ["Your objective lies in a little cavern."] =
        "Seu objetivo fica em uma pequena caverna.",
    ["Go quickly, time is short."] =
        "Vá rápido, o tempo é curto.",
    ["Go into the cavern"] =
        "Entre na caverna",
    ["Head to the lower level of the cavern."] =
        "Vá para o nível de baixo da caverna.",
    ["Targets are in the cavern and around its entrance too."] =
        "Os alvos ficam na caverna e também em volta da entrada.",
    ["Head out of the cave"] =
        "Saia da caverna",
    ["Climb the trail"] =
        "Suba a trilha",
    ["Once in the Wetlands, head north."] =
        "Ao chegar ao Pantanal, siga para o norte.",
    ["Leap down from the ledge."] =
        "Pule da beirada.",
    ["This makes Menethil Harbor quicker to get to."] =
        "Assim você chega mais rápido ao Porto de Menethil.",
    ["Keep climbing the trail"] =
        "Continue subindo a trilha",
    ["Take the trail downhill"] =
        "Desça pela trilha",
    ["Fly to Menethil Harbor"] =
        "Voe até o Porto de Menethil",
    ["Your targets are within the cavern."] =
        "Seus alvos estão dentro da caverna.",
    ["Without this, one quest can't be picked up."] =
        "Sem isso, não dá para pegar uma das missões.",
    ["The NPC is past the tunnel; stay on the road."] =
        "O NPC fica depois do túnel; siga pela estrada.",
    ["The target is a pale bear."] =
        "O alvo é um urso pálido.",
    ["Cross the tunnel to reach the NPC."] =
        "Atravesse o túnel para chegar ao NPC.",
    ["Fly to Thelsamar"] =
        "Voe até Thelsamar",
    ["The NPC patrols a long route; look along it."] =
        "O NPC patrulha uma rota longa; procure ao longo dela.",
    ["The targets are rat-like humanoids."] =
        "Os alvos são humanoides parecidos com ratos.",
    ["Hunt spiders for it."] =
        "Cace aranhas para isso.",
    ["Take the road to where the trail starts"] =
        "Pegue a estrada até o início da trilha",
    ["A class quest coming up requires this."] =
        "Uma missão de classe mais à frente precisa disso.",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "Saia do Stonesplinter Valley e siga pela estrada",
    ["The NPC waits on the tower's highest floor."] =
        "O NPC espera no último andar da torre.",
    ["Head up the incline"] =
        "Suba a ladeira",
    ["Dwarf and Gnome start"] =
        "Início dos anões e gnomos",
    ["Step back outside"] =
        "Volte para fora",
    ["They are rare and scattered widely."] =
        "São raros e bem espalhados.",
    ["Pass through the tunnel, then stay on the road"] =
        "Atravesse o túnel e siga pela estrada",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "Cure o Montanhista Dolf com Cura Inferior (Grau 2).",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "Aplique Palavra de Poder: Fortitude no Montanhista Dolf.",
    ["The quest wants yetis; seek them out."] =
        "A missão pede yetis; vá atrás deles.",
    ["Look for the timber baskets."] =
        "Procure os cestos de madeira.",
    ["Any spot around Brewnall Village works."] =
        "Qualquer ponto perto de Brewnall Village serve.",
    ["Give it a few seconds."] =
        "Espere alguns segundos.",
    ["Target one Large Crag Boar with it."] =
        "Use em um Rochetusco Grande.",
    ["Use it on any Snow Leopard."] =
        "Use em qualquer Leopardo da Neve.",
    ["Target any Ice Claw Bear with the item."] =
        "Use o item em qualquer Urso Garra de Gelo.",
    ["Keep it as pet food for later."] =
        "Guarde para alimentar seu ajudante mais tarde.",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "Encontre um Urso Garra de Gelo e use Domar Fera nele.",
    ["Push eastward if you still need more."] =
        "Avance para o leste se ainda precisar de mais.",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "Guarde: uma missão de Paladino mais à frente usa isso.",
    ["Keep to the road as it crosses the underground passages."] =
        "Siga pela estrada enquanto ela atravessa as passagens subterrâneas.",
    ["The NPC can be indoors or out."] =
        "O NPC pode estar dentro ou fora.",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "Pegue o Metrô Correfundo até a Cidade de Ventobravo.",
    ["Flight master in Stormwind"] =
        "Mestre de voo em Ventobravo",
    ["The NPC roams a wide loop; look along it."] =
        "O NPC percorre um circuito amplo; procure ao longo dele.",
    ["You likely gathered 10 Linen Cloth already."] =
        "Você provavelmente já juntou 10 Tecidos de Linho.",
    ["Narm Faulk lies dead; use the item on his body."] =
        "Narm Faulk está morto; use o item no corpo dele.",
    ["Wait for the talking to finish"] =
        "Espere a conversa terminar",
    ["Climb the big ramp"] =
        "Suba a grande rampa",
    ["The NPC stands high in the great tree."] =
        "O NPC fica no alto da grande árvore.",
    ["The NPC stands in an adjoining chamber."] =
        "O NPC fica em uma sala ao lado.",
    ["The targets are imps."] =
        "Os alvos são diabretes.",
    ["Look for groups of pink fungi."] =
        "Procure grupos de fungos rosa.",
    ["Mostly found beside tree trunks."] =
        "Ficam quase sempre junto aos troncos das árvores.",
    ["Look for big orange blossoms."] =
        "Procure grandes flores laranja.",
    ["Climb to the cave's upper level."] =
        "Suba ao nível de cima da caverna.",
    ["The NPC stands at the summit of the great tree."] =
        "O NPC fica no topo da grande árvore.",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "Cure a Sentinela Shaya com Cura Inferior (Grau 2).",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "Aplique Palavra de Poder: Fortitude na Sentinela Shaya.",
    ["Pick up 5 Earthroot while questing."] =
        "Colete 5 Raízes-telúricas durante as missões.",
    ["A class quest further on requires this."] =
        "Uma missão de classe mais adiante precisa disso.",
    ["Look for brown clumps of roots."] =
        "Procure tufos marrons de raízes.",
    ["Kill black-furred tigers."] =
        "Mate tigres de pelo preto.",
    ["The targets are spiders with green bodies."] =
        "Os alvos são aranhas de corpo verde.",
    ["Look for little brown pinecones giving off green smoke."] =
        "Procure pequenas pinhas marrons soltando fumaça verde.",
    ["The target is a satyr."] =
        "O alvo é um sátiro.",
    ["The targets are spread over several spots."] =
        "Os alvos estão espalhados por vários pontos.",
    ["With the coming hand-ins, this gets you to level 9."] =
        "Com as próximas entregas, isso te leva ao nível 9.",
    ["At this spot or a bit to the east."] =
        "Neste ponto ou um pouco a leste.",
    ["The NPC patrols the road; look along it."] =
        "O NPC patrulha a estrada; procure ao longo dela.",
    ["For this quest you guard an NPC on the move."] =
        "Nesta missão, você protege um NPC em movimento.",
    ["If she is absent, wait for her to reappear."] =
        "Se ela não estiver lá, espere ela reaparecer.",
    ["Move fast: the clock is ticking on this one."] =
        "Seja rápido: esta missão tem tempo limitado.",
    ["Kill harpies."] =
        "Mate harpias.",
    ["Step into the cavern within the trunk"] =
        "Entre na caverna dentro do tronco",
    ["The spot is on the lower floor of the hollow tree."] =
        "O local fica no andar de baixo da árvore oca.",
    ["Don't forget to train Pick Pocket."] =
        "Não se esqueça de treinar Pick Pocket.",
    ["Keep it; an upcoming task asks for it."] =
        "Guarde; uma missão mais à frente pede isso.",
    ["Fly to Moonglade"] =
        "Voe até a Clareira da Lua",
    ["Target a Webwood Lurker with it."] =
        "Use em uma Tocaieira Lenhateia.",
    ["Aim the item at any Nightsaber Stalker."] =
        "Use o item em qualquer Espreitador Sabre-da-noite.",
    ["The beasts are leopards with blue fur."] =
        "As feras são leopardos de pelo azul.",
    ["Aim the item at one Strigid Screecher."] =
        "Use o item em uma Guinchadora Estrígida.",
    ["Target the owls here."] =
        "Os alvos são as corujas daqui.",
    ["You need to stand close to this spot."] =
        "Você precisa ficar perto deste ponto.",
    ["Go into the hollow tree's cavern"] =
        "Entre na caverna da árvore oca",
    ["The target is a big gray spider."] =
        "O alvo é uma grande aranha cinza.",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "Mire em Sethir, o Antigo, e use Pick Pocket.",
    ["The target is a violet satyr."] =
        "O alvo é um sátiro violeta.",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "O NPC espera aqui e depois caminha até o grande galho próximo.",
    ["Fight the elementals of the swamp."] =
        "Enfrente os elementais do pântano.",
    ["Use Herbalism's Track Herbs to spot them."] =
        "Use o rastreamento de ervas do Herborismo para encontrá-los.",
    ["Pick these up while questing around Teldrassil."] =
        "Colete estes enquanto faz missões por Teldrassil.",
    ["Get your Herbalism skill to 15."] =
        "Leve seu Herborismo a 15.",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "Junto com as próximas entregas, isso te leva ao nível 11.",
    ["Circle the mountain, then climb the trail"] =
        "Contorne a montanha e depois suba a trilha",
    ["The NPC stands on the highest level of this structure."] =
        "O NPC fica no nível mais alto desta construção.",
    ["Flight master in Auberdine"] =
        "Mestre de voo em Auberdine",
    ["Your pet will need this food shortly."] =
        "Seu ajudante vai precisar desta comida em breve.",
    ["Hunt the crabs."] =
        "Cace os caranguejos.",
    ["You'll find extra ones swimming nearby as well."] =
        "Você também encontra outros nadando por perto.",
    ["Use the item on any Rabid Thistle Bear."] =
        "Use o item em qualquer Ursocardo Raivoso.",
    ["The targets are bears with grey fur."] =
        "Os alvos são ursos de pelo cinza.",
    ["Keep from damaging the creature."] =
        "Evite causar dano à criatura.",
    ["Your targets sit below the water's surface."] =
        "Seus alvos ficam abaixo da superfície da água.",
    ["Avoid slaying the satyrs if you can."] =
        "Evite matar os sátiros, se puder.",
    ["You'll need this for the following quest."] =
        "Você vai precisar disso para a próxima missão.",
    ["Hunt down satyrs."] =
        "Cace sátiros.",
    ["Big birds that roam on foot."] =
        "Aves grandes que andam pelo chão.",
    ["Make your way to the Gates of Ironforge"] =
        "Vá até os Portões de Altaforja",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "Nade até exatamente este ponto, depois, no menu do jogo, escolha Suporte e peça ajuda para personagem preso.",
    ["Stay outdoors by this building."] =
        "Fique do lado de fora, junto a este prédio.",
    ["Pull the camera back for a wider view."] =
        "Afaste a câmera para ter uma visão mais ampla.",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "Gire a visão até ver o Guarda-roupas do Taturana.",
    ["Look for beige sacks."] =
        "Procure sacos bege.",
    ["Look beside objects and structures."] =
        "Procure junto a objetos e construções.",
    ["Hunt the vultures."] =
        "Cace os abutres.",
    ["Many of them gather in this area."] =
        "Muitos se concentram nesta área.",
    ["The rest lie dotted across the zone."] =
        "O resto está espalhado pela zona.",
    ["Kill boars for these."] =
        "Mate javalis para obtê-los.",
    ["With the coming turn-ins, this gets you to level 15."] =
        "Com as próximas entregas, isso te leva ao nível 15.",
    ["Flight master at Rut'theran Village"] =
        "Mestre de voo na Vila de Rut'theran",
    ["Leave your pet with the stable master."] =
        "Deixe seu ajudante com o mestre do estábulo.",
    ["You will tame a short-term pet shortly."] =
        "Em breve você vai domar um ajudante temporário.",
    ["Here your pet picks up Claw (Rank 2)."] =
        "Aqui seu ajudante aprende Garra (Grau 2).",
    ["You will let it go shortly."] =
        "Você vai libertá-lo em breve.",
    ["Send your pet against a Thistle Bear."] =
        "Mande seu ajudante atacar um Ursocardo.",
    ["Get your companion back from the stable master."] =
        "Recupere seu ajudante com o mestre do estábulo.",
    ["Release the short-term pet you tamed."] =
        "Liberte o ajudante temporário que você domou.",
    ["The NPC stands on the pier."] =
        "O NPC fica no píer.",
    ["The targets are sea creatures with long necks."] =
        "Os alvos são criaturas marinhas de pescoço longo.",
    ["Head to the hilltop."] =
        "Vá até o topo da colina.",
    ["Wade in to use it."] =
        "Entre na água para usar.",
    ["The spot is at the foot of the falls."] =
        "O local fica ao pé da cachoeira.",
    ["Look for an urn of woven wicker."] =
        "Procure uma urna de vime trançado.",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "O alvo é o fantasma não hostil de uma elfa noturna.",
    ["Look for a figure in yellow and green garb."] =
        "Procure uma figura com roupas amarelas e verdes.",
    ["Go to the lowest deck of the wreck."] =
        "Vá até o convés mais baixo do naufrágio.",
    ["Swim in by way of a porthole."] =
        "Entre nadando por uma escotilha.",
    ["Search stacks of brown crates."] =
        "Vasculhe pilhas de caixotes marrons.",
    ["The NPC stands atop the dam."] =
        "O NPC fica no alto da represa.",
    ["The object rests by the barrier."] =
        "O objeto fica junto à barreira.",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "Junto com as próximas entregas, isso te leva ao nível 19.",
    ["This skips some tedious quests with a timer."] =
        "Assim você pula algumas missões chatas com tempo limitado.",
    ["The upcoming quest may prove hard."] =
        "A próxima missão pode ser difícil.",
    ["The targets are troggs."] =
        "Os alvos são troggs.",
    ["Redridge and Westfall"] =
        "Cristarrubra e Cerro Oeste",
    ["Look for a big mound of brown earth."] =
        "Procure um grande monte de terra marrom.",
    ["The target patrols a long route by the road."] =
        "O alvo patrulha uma rota longa junto à estrada.",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "A rota do alvo também entra fundo em Jangolode Mine e Gold Coast Quarry.",
    ["It takes roughly 5 minutes to reappear."] =
        "Leva cerca de 5 minutos para reaparecer.",
    ["The target is a murloc, grey and bigger than the others."] =
        "O alvo é um murloc cinza, maior que os outros.",
    ["It roams the shoreline."] =
        "Ele percorre o litoral.",
    ["If the NPC is absent, stay until he reappears."] =
        "Se o NPC não estiver lá, espere até ele reaparecer.",
    ["Escort The Defias Traitor and keep him alive."] =
        "Escolte o Traidor Défias e mantenha-o vivo.",
    ["The NPC is on an upper floor of the tower."] =
        "O NPC está em um andar de cima da torre.",
    ["Hunt the red-feathered birds."] =
        "Cace as aves de penas vermelhas.",
    ["The targets are little winged dragons."] =
        "Os alvos são pequenos dragões alados.",
    ["Skip Redridge Alphas; they don't carry them."] =
        "Ignore os Machos-alfa de Cristarrubra; eles não os carregam.",
    ["Raise Lockpicking to 95"] =
        "Eleve a perícia de abrir fechaduras a 95",
    ["Look for little gray coffers of metal."] =
        "Procure pequenos cofres de metal cinza.",
    ["Go inside and stay on the trail"] =
        "Entre e siga a trilha",
    ["Your target is a ghoul."] =
        "Seu alvo é um carniçal.",
    ["Fight undead foes."] =
        "Enfrente inimigos mortos-vivos.",
    ["The target is the dungeon's second boss."] =
        "O alvo é o segundo chefe da masmorra.",
    ["The target is the dungeon's last boss."] =
        "O alvo é o último chefe da masmorra.",
    ["The objective is aboard the vessel."] =
        "O objetivo fica a bordo do navio.",
    ["You'll find them all over the instance."] =
        "Você os encontra por toda a instância.",
    ["The NPC is indoors"] =
        "O NPC está lá dentro",
    ["Fight the murlocs."] =
        "Enfrente os murlocs.",
    ["The spot is at the cave's mouth."] =
        "O local fica na entrada da caverna.",
    ["Look for the brown fungi."] =
        "Procure os fungos marrons.",
    ["Extra ones are below, in the side chambers."] =
        "Há outros embaixo, nas salas laterais.",
    ["Gather the blue-capped fungi."] =
        "Colete os fungos de chapéu azul.",
    ["Expect a possible ambush while you gather it."] =
        "Pode haver uma emboscada enquanto você coleta.",
    ["It shows up a short way off."] =
        "Aparece a uma curta distância.",
    ["It shows up at your feet."] =
        "Aparece aos seus pés.",
    ["Murloc packs arrive at the waterside."] =
        "Bandos de murlocs chegam pela beira da água.",
    ["The attackers rush the camp."] =
        "Os atacantes invadem o acampamento.",
    ["Engage foes one at a time."] =
        "Enfrente os inimigos um de cada vez.",
    ["Watch out, the landscape conceals some monsters."] =
        "Cuidado, o terreno esconde alguns monstros.",
    ["Avoid drawing several foes together."] =
        "Evite puxar vários inimigos juntos.",
    ["Stay with Prospector Remtravel and defend him."] =
        "Fique com o Prospector Trilheiro e defenda-o.",
    ["He is frail and goes down fast."] =
        "Ele é frágil e cai rápido.",
    ["Look on top of the table."] =
        "Procure em cima da mesa.",
    ["Escort Therylune and defend her."] =
        "Escolte Therylune e defenda-a.",
    ["Escort Volcor and defend him."] =
        "Escolte Volcor e defenda-o.",
    ["Allow the foes to hit him before you join in."] =
        "Deixe os inimigos o atacarem antes de você entrar na luta.",
    ["If it is not around, move on without it."] =
        "Se não estiver por aqui, siga sem ele.",
    ["It reappears only after a long wait."] =
        "Só reaparece depois de uma longa espera.",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "Mantenha Kerlonian Perenumbra em segurança enquanto ele vem atrás de você.",
    ["Keep near him; he dozes off."] =
        "Fique perto dele; ele cai no sono.",
    ["The NPC is on the house's raised terrace."] =
        "O NPC está no terraço elevado da casa.",
    ["Ashenvale and Stonetalon"] =
        "Vale Gris e Torres de Pedra",
    ["The item drops rarely."] =
        "O item cai raramente.",
    ["Look for little gray sheaves of straw."] =
        "Procure pequenos feixes de palha cinza.",
    ["Lower the Ground Clutter option to 1."] =
        "Baixe a opção Ground Clutter para 1.",
    ["Find it in the game options, under System, then Graphics."] =
        "Fica nas opções do jogo, em Sistema e depois Gráficos.",
    ["Fly to Astranaar"] =
        "Voe até Astranaar",
    ["Keep to the road the whole way."] =
        "Fique na estrada o caminho todo.",
    ["Pick up Claw (Rank 3) for your pet."] =
        "Obtenha Garra (Grau 3) para o seu ajudante.",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "Dome um Urso do Vale Gris com Domar Fera.",
    ["Track down a chestnut-furred bear."] =
        "Encontre um urso de pelo castanho.",
    ["Keep to the road until you reach the Barrens"] =
        "Siga pela estrada até chegar aos Sertões",
    ["Keep your distance from the Crossroads."] =
        "Mantenha distância da Encruzilhada.",
    ["Flight master in Ratchet"] =
        "Mestre de voo em Vila Catraca",
    ["Look for white spheres."] =
        "Procure esferas brancas.",
    ["The target is a gray furbolg."] =
        "O alvo é um pelurso cinza.",
    ["Shrubs that glitter white."] =
        "Arbustos com brilho branco.",
    ["Exit Ruins of Stardust"] =
        "Saia das Ruínas de Poeira Estelar",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "Entre no Fire Scar Shrine e suba a trilha",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "O alvo evoca protetores com Ilkrud's Guardians.",
    ["Cut off the target's spells when you can."] =
        "Interrompa os feitiços do alvo quando puder.",
    ["Exit Fire Scar Shrine"] =
        "Saia do Fire Scar Shrine",
    ["Circle the mountain on foot."] =
        "Contorne a montanha a pé.",
    ["A yellowish naga; her fins look pinkish."] =
        "Uma naga amarelada; as barbatanas são rosadas.",
    ["The target is rare and seldom up."] =
        "O alvo é raro e quase nunca está presente.",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "O alvo é uma naga de pele cor de jade e barbatanas rosadas.",
    ["It circles the island clockwise, close to the shore."] =
        "Dá a volta na ilha no sentido horário, perto da costa.",
    ["She travels with a pair of guards."] =
        "Ela anda com dois guardas.",
    ["Hunt naga."] =
        "Cace nagas.",
    ["Take the passage into Stonetalon Mountains"] =
        "Pegue a passagem para a Cordilheira das Torres de Pedra",
    ["Look for it high on the clifftop."] =
        "Procure no alto do penhasco.",
    ["The targets are wyverns."] =
        "Os alvos são mantícoras.",
    ["Fly to Stonetalon Peak"] =
        "Voe até o Morro das Torres de Pedra",
    ["Watch out and keep away from Tideress."] =
        "Cuidado e fique longe de Mareante.",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "Sua presa é uma criatura esverdeada de água animada, de nível 27.",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "Fica na parte Pool of Ask'ar da masmorra.",
    ["Look on Ghamoo-ra's north side."] =
        "Procure ao norte de Ghamoo-ra.",
    ["Dive down into the submerged cave."] =
        "Mergulhe até a caverna submersa.",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "Encontre o NPC a sudoeste de Ghamoo-ra.",
    ["It is the dungeon's 4th boss."] =
        "É o 4º chefe da masmorra.",
    ["Kill Fallenroot and Blackfathom foes."] =
        "Mate inimigos Satíricon e das Profundezas Negras.",
    ["Fly to Talrendis Point"] =
        "Voe até Talrendis Point",
    ["This trip is dangerous; move with great caution."] =
        "Esta viagem é perigosa; avance com muito cuidado.",
    ["Stay on the road and keep away from Horde NPCs."] =
        "Fique na estrada e longe dos NPCs da Horda.",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "As Pioneiras do Brado Guerreiro que cavalgam pela estrada continuam pacíficas.",
    ["The target is a gray murloc."] =
        "O alvo é um murloc cinza.",
    ["The target appears at this spot."] =
        "O alvo aparece neste ponto.",
    ["Go into Whelgar's Excavation Site"] =
        "Entre no Sítio de Escavação Whelgar",
    ["Head out of Whelgar's Excavation Site"] =
        "Saia do Sítio de Escavação Whelgar",
    ["The targets are raptors."] =
        "Os alvos são raptores.",
    ["Targets are both in the tomb and around it."] =
        "Os alvos estão dentro do túmulo e em volta dele.",
    ["The vendor stocks only a few."] =
        "O vendedor tem poucas unidades.",
    ["A quest in Duskwood will require it afterward."] =
        "Uma missão na Floresta do Crepúsculo vai pedir isso depois.",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "Compre agora; uma missão na Floresta do Crepúsculo vai precisar disso em breve.",
    ["The spot is in the crypt under the building."] =
        "O local fica na cripta embaixo do prédio.",
    ["Duskwood and Redridge"] =
        "Floresta do Crepúsculo e Cristarrubra",
    ["Flight master at Darkshire"] =
        "Mestre de voo em Vila Sombria",
    ["The target is a ghoul with red skin."] =
        "O alvo é um carniçal de pele vermelha.",
    ["The targets are ghouls."] =
        "Os alvos são carniçais.",
    ["Exit the tomb"] =
        "Saia do túmulo",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "Roube um Parasita Défias Mal Formado com Pick Pocket.",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "Use Sap em Filipe Pinel e depois abra o baú.",
    ["Opening it puts a harmful effect on you."] =
        "Abri-lo aplica um efeito nocivo em você.",
    ["Climb the trail across the mountains"] =
        "Suba a trilha que atravessa as montanhas",
    ["Take the trail that circles the peak"] =
        "Pegue a trilha que contorna o pico",
    ["Defeat each wave of attackers."] =
        "Derrote cada onda de atacantes.",
    ["Beware of foes lurking in stealth."] =
        "Cuidado com inimigos furtivos à espreita.",
    ["Target Doc Mixilpixil, then take a seat."] =
        "Mire em Doc Mixilpixil e depois sente-se.",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "O alvo é um javali de couro marrom mais escuro.",
    ["The targets are orcs."] =
        "Os alvos são orcs.",
    ["You no longer need these; vendor or discard them."] =
        "Você não precisa mais destes; venda ou descarte.",
    ["The targets are Horrors and Fiends."] =
        "Os alvos são horrores e demônios.",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "Não enfrente Mor'Ladim, um morto-vivo de elite de nível 35.",
    ["The target wanders near the crypt, outdoors."] =
        "O alvo vagueia perto da cripta, do lado de fora.",
    ["Climb the steps and exit the tomb"] =
        "Suba os degraus e saia do túmulo",
    ["The target is a sword-wielding gnoll."] =
        "O alvo é um gnoll armado com espada.",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "O alvo é um gnoll de manto carmesim, com uma lâmina comprida.",
    ["Beware: nearby foes join when you attack him."] =
        "Cuidado: os inimigos próximos entram na luta quando você o ataca.",
    ["Keep to the cave's interior when you can."] =
        "Fique dentro da caverna sempre que puder.",
    ["The following step takes place in the cave."] =
        "A próxima etapa acontece na caverna.",
    ["Keep Corporal Keeshan safe during the escort."] =
        "Proteja o Cabo Keeshan durante a escolta.",
    ["At the cave's mouth, draw foes to him with care."] =
        "Na entrada da caverna, atraia os inimigos até ele com cuidado.",
    ["The target is the dungeon's fifth boss."] =
        "O alvo é o quinto chefe da masmorra.",
    ["Targets are within the wrecked vessel underwater."] =
        "Os alvos estão dentro do navio naufragado, debaixo d'água.",
    ["The target is a blue raptor."] =
        "O alvo é um raptor azul.",
    ["Look for a big mound of dirt."] =
        "Procure um grande monte de terra.",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "O item também pode surgir na saliência alta perto de Sarilodonte.",
    ["Look for a big, broad yellow urn."] =
        "Procure uma urna amarela, grande e larga.",
    ["Look for a big, tall crimson urn."] =
        "Procure uma urna carmesim, grande e alta.",
    ["The target is a big stone container."] =
        "O alvo é um grande recipiente de pedra.",
    ["The target is up on the boat's top deck."] =
        "O alvo está no convés superior do barco.",
    ["Climb the incline at the rear."] =
        "Suba a rampa na parte de trás.",
    ["Go to the lowest deck of the ship."] =
        "Vá até o convés mais baixo do navio.",
    ["Swim in via the gap at the base."] =
        "Entre nadando pela abertura na base.",
    ["These foes hide in stealth."] =
        "Estes inimigos ficam furtivos.",
    ["Most often found in or beside water."] =
        "Ficam quase sempre dentro ou perto da água.",
    ["Grab every one you spot on the way here."] =
        "Pegue todos que encontrar no caminho até aqui.",
    ["With the coming hand-ins, this brings you to level 29."] =
        "Com as próximas entregas, isso te leva ao nível 29.",
    ["Take the door on the bridge, then descend the steps"] =
        "Passe pela porta na ponte e depois desça os degraus",
    ["The NPC is on the lower level within the bridge."] =
        "O NPC está no nível de baixo, dentro da ponte.",
    ["Leap from the span and splash down below"] =
        "Pule da ponte e caia na água lá embaixo",
    ["Look for a pale, rolled scroll."] =
        "Procure um pergaminho claro e enrolado.",
    ["A dwarf corpse grips it."] =
        "Um cadáver de anão o segura.",
    ["Fly to Refuge Pointe"] =
        "Voe até a Ponta do Refúgio",
    ["Flight master at Southshore"] =
        "Mestre de voo na Costa Sul",
    ["The targets are turtles."] =
        "Os alvos são tartarugas.",
    ["Head north, keeping to the riverbank."] =
        "Siga para o norte pela margem do rio.",
    ["Flight master at Chillwind Camp"] =
        "Mestre de voo no Acampamento Ventogelante",
    ["Stonetalon and Ashenvale"] =
        "Torres de Pedra e Vale Gris",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "Pegue a estrada e depois suba a trilha até o Posto do Nijel",
    ["Fly to Nijel's Point"] =
        "Voe até o Posto do Nijel",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "A missão está cinza, mas as seguintes da série dão bastante XP.",
    ["Take the road until this trail"] =
        "Pegue a estrada até esta trilha",
    ["Keep on the trail"] =
        "Continue na trilha",
    ["Fight the treants."] =
        "Enfrente as árvores animadas.",
    ["Head uphill on the trail and across the passage"] =
        "Suba pela trilha e atravesse a passagem",
    ["Exit the Howling Vale by the tunnel"] =
        "Saia do Vale Uivante pelo túnel",
    ["You pick up Claw (Rank 4) here."] =
        "Aqui você obtém Garra (Grau 4).",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "Dome qualquer Urso Ancião do Vale Gris com Domar Fera.",
    ["They show up lying on the ground."] =
        "Eles aparecem caídos no chão.",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "Contorne o pico e depois suba a trilha de terra sinuosa até o santuário",
    ["Circle the mountain, then stay on the trail"] =
        "Contorne a montanha e depois siga a trilha",
    ["Stand on the marked point, then apply the item."] =
        "Fique no ponto marcado e depois use o item.",
    ["Obtain Furbolg Form"] =
        "Obtenha a forma de pelurso",
    ["Walk over the span"] =
        "Atravesse a ponte",
    ["The foes are gnomes."] =
        "Os inimigos são gnomos.",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "Nos salões externos de Gnomeregan, não na instância em si.",
    ["Take the lift down, then head north."] =
        "Desça pelo elevador e depois siga para o norte.",
    ["The NPC is atop the raised platform."] =
        "O NPC está no alto da plataforma elevada.",
    ["It sits a short distance southward from Techbot."] =
        "Fica a uma curta distância ao sul do Techbot.",
    ["Use it on foes that are Irradiated."] =
        "Use nos inimigos Irradiados.",
    ["The targets are troggs with a green glow."] =
        "Os alvos são troggs com um brilho verde.",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "Dentro do Hall of Gears, fique nos níveis mais altos.",
    ["Take the trail southwest into The Dormitory."] =
        "Siga a trilha para sudoeste até o Dormitório.",
    ["By the wall on The Dormitory's lower floor."] =
        "Junto à parede, no andar de baixo do Dormitório.",
    ["The target is the third boss you meet."] =
        "O alvo é o terceiro chefe que você encontra.",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "O alvo fica na plataforma elevada ao lado do Eletrocutor 6000.",
    ["In the Engineering Labs, on the lowest floor."] =
        "Nos Engineering Labs, no andar mais baixo.",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "O objetivo fica ao lado do Espanca-gente 9-60.",
    ["Keep to Launch Bay's top floor."] =
        "Fique no andar de cima da Launch Bay.",
    ["Look for boxy, standing devices."] =
        "Procure aparelhos quadrados, de pé.",
    ["The machine you need is in the Dormitory."] =
        "A máquina de que você precisa fica no Dormitório.",
    ["It can take more than one to get it."] =
        "Pode ser preciso mais de um para conseguir.",
    ["Duskwood and Stranglethorn"] =
        "Floresta do Crepúsculo e Selva do Espinhaço",
    ["Head into Stormwind Keep"] =
        "Entre na Bastilha Ventobravo",
    ["The NPC stands by the water's edge."] =
        "O NPC fica à beira da água.",
    ["The targets are worgen."] =
        "Os alvos são worgens.",
    ["Other ghouls occupy the same spawn points."] =
        "Outros carniçais surgem nos mesmos pontos.",
    ["The target can be in the house or around it."] =
        "O alvo pode estar dentro da casa ou em volta dela.",
    ["Just out of the mine."] =
        "Logo na saída da mina.",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "O NPC patrulha a rota do sul uma vez a cada 20-30 minutos.",
    ["A pair of foes go after him."] =
        "Dois inimigos vão atrás dele.",
    ["Saving his life unlocks a new task."] =
        "Salvar a vida dele libera uma nova missão.",
    ["Hang on to it; an upcoming quest uses it."] =
        "Guarde; uma missão mais à frente usa isso.",
    ["The NPC stands in the narrow lane between houses."] =
        "O NPC fica na viela estreita entre as casas.",
    ["Hillsbrad and Arathi"] =
        "Eira dos Montes e Arathi",
    ["Search for gray rocks standing up beside the walls."] =
        "Procure pedras cinza em pé junto às muralhas.",
    ["Further hidden ones lurk on the high ridgelines."] =
        "Há outras escondidas no alto das cristas.",
    ["Some are indoors as well."] =
        "Também há dentro das construções.",
    ["Fly to Aerie Peak"] =
        "Voe até o Ninho da Águia",
    ["The NPC is at the summit of the trail."] =
        "O NPC fica no topo da trilha.",
    ["This spares you time further on."] =
        "Isso te poupa tempo mais adiante.",
    ["Flight master at Theramore"] =
        "Mestre de voo em Theramore",
    ["This quest is buggy and may not show up."] =
        "Esta missão tem bug e pode não aparecer.",
    ["Expect several foes at once."] =
        "Espere vários inimigos de uma vez.",
    ["Make Private Hendel your main target."] =
        "Faça do Recruta Remos seu alvo principal.",
    ["Steer clear of Brackenwall Village."] =
        "Fique longe da Aldeia Muralha Verde.",
    ["Watch out: the foes here are above your level."] =
        "Cuidado: os inimigos daqui têm nível acima do seu.",
    ["The quest starts from a small piece of metal."] =
        "A missão começa com um pequeno pedaço de metal.",
    ["Take the lift down"] =
        "Desça pelo elevador",
    ["Look for a little brown tome."] =
        "Procure um pequeno tomo marrom.",
    ["The item is held by a dwarf corpse."] =
        "O item está com um cadáver de anão.",
    ["Flight master at Thalanaar"] =
        "Mestre de voo em Thalanaar",
    ["Keep clear of Freewind Post."] =
        "Fique longe da Aldeia Vento Livre.",
    ["This spot has most of them; elsewhere they are rare."] =
        "A maioria fica neste ponto; em outros lugares são raros.",
    ["Return here as you do your other quests."] =
        "Volte aqui enquanto faz suas outras missões.",
    ["The foes here are scorpions."] =
        "Os inimigos aqui são escorpiões.",
    ["Look for assorted mechanical pieces."] =
        "Procure peças mecânicas variadas.",
    ["Parts lie all across the Shimmering Flats."] =
        "Há peças por todo o Salar Cintilante.",
    ["Fly to Gadgetzan"] =
        "Voe até Geringontzan",
    ["Stand on the metal grating to begin the battle."] =
        "Fique sobre a grade de metal para começar a batalha.",
    ["Shows up once you defeat six challengers."] =
        "Aparece depois que você derrota seis desafiantes.",
    ["The NPC is upstairs, out on the balcony."] =
        "O NPC está no andar de cima, na sacada.",
    ["The NPC stands on the top tier of the pier."] =
        "O NPC fica no nível mais alto do píer.",
    ["Fly to Booty Bay"] =
        "Voe até a Angra do Butim",
    ["If he is absent, move on without him."] =
        "Se ele não estiver lá, siga em frente sem ele.",
    ["You may come back for it another time."] =
        "Você pode voltar para isso outra hora.",
    ["These foes heal both their allies and themselves."] =
        "Esses inimigos curam os aliados e a si mesmos.",
    ["When the targets run out, skip ahead."] =
        "Quando os alvos acabarem, pule esta etapa.",
    ["No rush; you may complete this afterwards."] =
        "Sem pressa; você pode concluir isso depois.",
    ["The objective sits up on the raised deck."] =
        "O objetivo fica no convés elevado.",
    ["Search the riverbanks."] =
        "Procure nas margens do rio.",
    ["Here your pet picks up Claw (Rank 5)."] =
        "Aqui seu ajudante aprende Garra (Grau 5).",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "Use Domar Fera em um Escorpachi Açoitador.",
    ["Head uphill into Nijel's Point"] =
        "Suba a colina até o Posto do Nijel",
    ["With the coming hand-ins, this brings you to level 36."] =
        "Com as próximas entregas, isso leva você ao nível 36.",
    ["The quest starts from a little book."] =
        "A missão começa em um livrinho.",
    ["The targets are lobsters."] =
        "Os alvos são lagostas.",
    ["Draw him to the doorway so other foes stay out of it."] =
        "Atraia-o até a porta para que outros inimigos fiquem de fora.",
    ["Escort Dalinda Malem and keep her alive."] =
        "Escolte Dalinda Malem e mantenha-a viva.",
    ["The targets here are centaurs."] =
        "Os alvos aqui são centauros.",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "Os Pisoteiros Magram patrulham com 2 hienas de escolta; fique longe.",
    ["Stay away from Ghost Walker Post."] =
        "Fique longe do Entreposto do Espírito que Anda.",
    ["Target kodos with the item."] =
        "Use o item nos kodos.",
    ["The kodos trail behind you."] =
        "Os kodos seguem você.",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "Leve-os até Smid Rabiscafuso e fale com eles lá.",
    ["Look for pale skulls of horned beasts."] =
        "Procure crânios claros de feras com chifres.",
    ["A lengthy grinding stretch is coming up."] =
        "Vem aí um longo trecho matando monstros.",
    ["The targets are Sea Witches and Tidehunters."] =
        "Os alvos são Bruxas do Mar e Caçamarés.",
    ["Other naga compete for the same spawn points."] =
        "Outras nagas disputam os mesmos pontos de surgimento.",
    ["The targets are on islands and beneath the surface."] =
        "Os alvos estão nas ilhas e debaixo d'água.",
    ["This spreads out the grinding so less is left later."] =
        "Isso distribui a matança de monstros, e sobra menos para depois.",
    ["Take the mountain trail to get there."] =
        "Pegue a trilha da montanha para chegar lá.",
    ["Stay clear of Valley of Spears."] =
        "Fique longe do Valley of Spears.",
    ["Look for tan sacks by the houses."] =
        "Procure sacos bege perto das casas.",
    ["Some of them are not usable."] =
        "Alguns deles não podem ser usados.",
    ["Basilisks compete for the same spawn points."] =
        "Basiliscos disputam os mesmos pontos de surgimento.",
    ["They compete for spawn points with the other Kurzen foes."] =
        "Eles disputam os pontos de surgimento com os outros inimigos de Kurzen.",
    ["A key class quest coming up requires this."] =
        "Uma missão de classe importante logo adiante exige isso.",
    ["The targets are on the cave floor."] =
        "Os alvos estão no chão da caverna.",
    ["Targets are spread across the whole cavern."] =
        "Os alvos estão espalhados por toda a caverna.",
    ["Hold on to it for a Searing Gorge task later."] =
        "Guarde-o para uma missão na Garganta Abrasadora mais tarde.",
    ["Stay away from Bhag'thera."] =
        "Fique longe de Bhag'thera.",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "O felino que você procura anda à vista: uma pantera negra de elite de nível 40.",
    ["The targets are in the water and along its edges."] =
        "Os alvos estão na água e nas margens.",
    ["Look for an orange tiger."] =
        "Procure um tigre laranja.",
    ["Mostly found atop the hill."] =
        "Encontrados principalmente no alto da colina.",
    ["Steer clear of elite murlocs."] =
        "Evite os murlocs de elite.",
    ["The targets are trolls."] =
        "Os alvos são trolls.",
    ["With the coming hand-ins, this gets you to level 38."] =
        "Com as próximas entregas, isso leva você ao nível 38.",
    ["Hunt the little winged dragonkin."] =
        "Cace os pequenos dracônicos alados.",
    ["The target is a humanoid escorted by 2 guards."] =
        "O alvo é um humanoide escoltado por 2 guardas.",
    ["Clear the monsters just south before you start."] =
        "Limpe os monstros logo ao sul antes de começar.",
    ["Escort Galen Goodward and keep him alive."] =
        "Escolte Galen Boaguarda e mantenha-o vivo.",
    ["Look for big blue crystals."] =
        "Procure grandes cristais azuis.",
    ["Keep to the water to skip foes above your level."] =
        "Fique na água para evitar inimigos acima do seu nível.",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "Com as próximas entregas, isso leva você ao nível 39.",
    ["Hold on to it for the Whirlwind class chain."] =
        "Guarde-o para a série de missões de classe do Redemoinho.",
    ["A major boost to your weapon."] =
        "Uma grande melhoria para a sua arma.",
    ["Arathi and Alterac"] =
        "Arathi e Alterac",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "O alvo percorre a estrada em um só sentido, escoltado por 4 guardas.",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "Se ela chegar à Serraria Tarren, ela reaparece.",
    ["She starts her route over in Arathi Highlands."] =
        "Ela recomeça o trajeto no Planalto Arathi.",
    ["The targets are kobolds."] =
        "Os alvos são kobolds.",
    ["Additional ones are in the cavern up the trail."] =
        "Há mais na caverna, subindo a trilha.",
    ["Keep away from Hammerfall."] =
        "Fique longe de Ruína do Martelo.",
    ["Climb the trail to the cavern"] =
        "Suba a trilha até a caverna",
    ["The NPC stands atop the ridge."] =
        "O NPC fica no alto do cume.",
    ["Escort Kinelory and keep her alive."] =
        "Escolte Kinelory e mantenha-a viva.",
    ["The targets are ogres."] =
        "Os alvos são ogros.",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "Com as próximas entregas, isso leva você ao nível 40.",
    ["Stay clear of Refuge Point."] =
        "Fique longe da Ponta do Refúgio.",
    ["A level 40 elite foe shows up shortly."] =
        "Um inimigo de elite de nível 40 aparece em seguida.",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "Beba uma segunda Poção de Proteção contra a Natureza no meio da luta.",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "Tome uma antes, para que a recarga termine quando o combate começar.",
    ["Get Essence of the Exile done as well."] =
        "Conclua também a missão Essência dos exilados.",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "Confira se a recarga da Poção de Proteção contra a Natureza terminou.",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "Fique atrás de Bath'rah, o Vigia dos Ventos, enquanto ele anda.",
    ["This calls up Cyclonian."] =
        "Isso evoca Ciclonium.",
    ["Take the trail across the peaks"] =
        "Pegue a trilha pelos picos",
    ["Take the passage to Faldir's Cove"] =
        "Pegue a passagem até a Enseada de Faldir",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "Escolte o Professor Bruzundanga e mantenha-o vivo.",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "O tomo tem capa marrom e fica dentro de uma chaleira de metal.",
    ["The objective is on the central deck of the submerged wreck."] =
        "O objetivo fica no convés central do navio naufragado.",
    ["Look for a flat beige parchment."] =
        "Procure um pergaminho bege estendido.",
    ["Search for a book lying open."] =
        "Procure um livro aberto.",
    ["The target is in the ship's lowest hold."] =
        "O alvo fica no porão mais baixo do navio.",
    ["Look for big gray rocks."] =
        "Procure grandes rochas cinza.",
    ["They show up as dots on the minimap."] =
        "Eles aparecem como pontos no minimapa.",
    ["Hold on to it, an upcoming quest uses it."] =
        "Guarde-o, uma missão mais adiante usa isso.",
    ["Clear the raptors around before you begin."] =
        "Limpe os raptores em volta antes de começar.",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "Deixe a conversa terminar, depois escolte Inácio \"Cascão\" e mantenha-o vivo.",
    ["Speak with him once he gives up."] =
        "Fale com ele quando ele se render.",
    ["Hunt the felguards."] =
        "Cace os Guardas Vis.",
    ["This is the sole spot; wait for them to reappear."] =
        "Este é o único local; espere que reapareçam.",
    ["The targets are felhounds."] =
        "Os alvos são canisvis.",
    ["The targets are succubi."] =
        "Os alvos são súcubos.",
    ["The spot is beside a giant skeleton."] =
        "O local fica ao lado de um esqueleto gigante.",
    ["Clear out the foes around here before you start."] =
        "Limpe os inimigos em volta antes de começar.",
    ["Target the spectral centaurs."] =
        "Ataque os centauros espectrais.",
    ["The targets are brown-colored skeletons."] =
        "Os alvos são esqueletos marrons.",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "Com as próximas entregas, isso leva você ao nível 41.",
    ["The target wanders inside the tent and around it."] =
        "O alvo anda dentro da tenda e em volta dela.",
    ["Take the road, then descend the trail"] =
        "Pegue a estrada, depois desça a trilha",
    ["On the road, Rexxar leaves you alone."] =
        "Na estrada, Rexxar não ataca você.",
    ["Cross by boat or by swimming"] =
        "Atravesse de barco ou a nado",
    ["Flight master at Feathermoon"] =
        "Mestre de voo do Domínio de Plumaluna",
    ["Your pet picks up Claw (Rank 6) here."] =
        "Seu ajudante aprende Garra (Grau 6) aqui.",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "Use Domar Fera em um Caçador Escorpídeo.",
    ["Head into the Library wing."] =
        "Entre na ala da Biblioteca.",
    ["The target is the dungeon's opening boss."] =
        "O alvo é o primeiro chefe da masmorra.",
    ["Head across the hall called Gallery of Treasures."] =
        "Atravesse o salão chamado Gallery of Treasures.",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "Observe o minimapa até o nome da área voltar a ser Monastério Escarlate.",
    ["This is in the Armory wing."] =
        "Fica na ala do Arsenal.",
    ["Found in the Cathedral wing."] =
        "Na ala da Catedral.",
    ["A lengthy stretch of quests is coming up."] =
        "Vem aí um longo trecho de missões.",
    ["This vendor sells no arrows or bullets."] =
        "Este vendedor não vende flechas nem balas.",
    ["Get these for simple Badlands turn-ins ahead."] =
        "Pegue estes para entregas fáceis nos Ermos mais adiante.",
    ["The NPC or item sits on the rocky shelf above."] =
        "O NPC ou item fica na saliência rochosa acima.",
    ["Fight the dwarves."] =
        "Lute contra os anões.",
    ["Look for a timber box."] =
        "Procure uma caixa de madeira.",
    ["A cluster of them gathers here."] =
        "Há um grupo deles aqui.",
    ["More of them dot the surroundings."] =
        "Há mais espalhados pelos arredores.",
    ["With the coming hand-ins, this brings you to level 42."] =
        "Com as próximas entregas, isso leva você ao nível 42.",
    ["Unlocks the flight point at Thorium Point."] =
        "Libera o ponto de voo de Thorium Point.",
    ["Flight master at Thorium Point"] =
        "Mestre de voo de Thorium Point",
    ["Take the passage out of Booty Bay"] =
        "Pegue a passagem para sair da Angra do Butim",
    ["Take the tunnel into Booty Bay"] =
        "Pegue o túnel para entrar na Angra do Butim",
    ["Take the trail toward the Ruins of Aboraz"] =
        "Pegue a trilha rumo às Ruínas de Aboraz",
    ["Gradually move toward the northeast."] =
        "Avance aos poucos para o nordeste.",
    ["The targets are goblins."] =
        "Os alvos são goblins.",
    ["Kill the witch doctors and the mystics."] =
        "Mate os médicos bruxos e os místicos.",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "Uma pantera escura, de elite de nível 40, visível, não furtiva.",
    ["Be ready: these opponents are elites at level 38."] =
        "Prepare-se: esses oponentes são de elite de nível 38.",
    ["Saltwater Crocolisks spawn in the same places."] =
        "Os Crocoliscos de Água Salgada surgem nos mesmos lugares.",
    ["The object is a table made of stone."] =
        "O objeto é uma mesa de pedra.",
    ["Drag him up until he breaks the surface."] =
        "Puxe-o para cima até ele chegar à superfície.",
    ["Follow the shoreline"] =
        "Siga a linha da costa",
    ["The item is a brownish sheet of parchment."] =
        "O item é uma folha de pergaminho amarronzada.",
    ["Look for a flat, white scroll lying open."] =
        "Procure um pergaminho branco, aberto e estendido.",
    ["If some pages are unavailable, go on without them."] =
        "Se algumas páginas não estiverem disponíveis, continue sem elas.",
    ["You want Chapters I, II and III."] =
        "Você precisa dos Capítulos I, II e III.",
    ["Collect the chunks of wood."] =
        "Recolha os pedaços de madeira.",
    ["Do not go near Stonard."] =
        "Não chegue perto de Pedregal.",
    ["Silt Crawlers drop it more often."] =
        "Os Guajás do Lodo soltam isso com mais frequência.",
    ["Fly to Nethergarde Keep"] =
        "Voe até a Bastilha de Etergarde",
    ["A timer runs on this one; don't dawdle."] =
        "Esta missão tem tempo limite; não demore.",
    ["Hold on until Rizzle has fled."] =
        "Espere até Rebu fugir.",
    ["Targets here are human."] =
        "Os alvos aqui são humanos.",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "Fazer masmorras também é uma boa opção aqui, se preferir.",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "Cada pilha de 5 entregue em Geringontzan dá 380 de XP.",
    ["Hyenas also use these spawn spots."] =
        "Hienas também surgem nesses pontos.",
    ["Feralas and Tanaris"] =
        "Feralas e Tanaris",
    ["Position yourself in its center."] =
        "Posicione-se no centro.",
    ["Consider bringing a group for this one."] =
        "Considere chamar um grupo para esta.",
    ["Zones with stronger foes lie just ahead."] =
        "Zonas com inimigos mais fortes vêm logo a seguir.",
    ["The quests alone won't give you the level you need."] =
        "Só as missões não vão dar o nível de que você precisa.",
    ["Swim this way to stay out of fatigue"] =
        "Nade por aqui para evitar a fadiga",
    ["Hunt the crimson winged serpents."] =
        "Cace as serpentes aladas carmesim.",
    ["Slay them, then apply the item to their remains."] =
        "Mate-os, depois use o item nos restos deles.",
    ["Once freed, they can be killed."] =
        "Depois de libertados, eles podem ser mortos.",
    ["Win the encounter at the temple."] =
        "Vença o confronto no templo.",
    ["Take the trail to the southeast."] =
        "Pegue a trilha para o sudeste.",
    ["Inside a big room around a central pool."] =
        "Em uma sala grande, em volta de um lago central.",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "A maioria fica na câmara dos escaravelhos de Theka, o Mártir.",
    ["It could take a few trips through the instance."] =
        "Pode levar algumas idas à instância.",
    ["Do more Zul'Farrak runs."] =
        "Faça Zul'Farrak mais algumas vezes.",
    ["Keep to the road, then cross the tunnel"] =
        "Siga pela estrada, depois atravesse o túnel",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "O robô fica na área aberta entre a caverna e o túnel.",
    ["Others lie past the tunnel."] =
        "Há outros depois do túnel.",
    ["Get out of the cave and use the passage beyond"] =
        "Saia da caverna e pegue a passagem mais adiante",
    ["Look for a big, pale egg."] =
        "Procure um ovo grande e claro.",
    ["Hunt gorillas."] =
        "Cace gorilas.",
    ["Bears appear at the same spawn spots."] =
        "Ursos aparecem nos mesmos pontos.",
    ["Hunt bears."] =
        "Cace ursos.",
    ["They appear in the same spots as the apes."] =
        "Eles aparecem nos mesmos pontos que os macacos.",
    ["Kill the foes near the big cage first."] =
        "Primeiro mate os inimigos perto da jaula grande.",
    ["This helps with the following step."] =
        "Isso ajuda na próxima etapa.",
    ["This sets Captured Sprite Darters free."] =
        "Isso liberta os Dardejantes Capturados.",
    ["Save as many of them as possible."] =
        "Salve o máximo possível.",
    ["Keep 6 or more of them alive."] =
        "Mantenha 6 ou mais vivos.",
    ["If she is gone, wait until she comes back."] =
        "Se ela não estiver lá, espere ela voltar.",
    ["Go into the cavern at the trail's foot"] =
        "Entre na caverna no pé da trilha",
    ["Getting it here speeds up Un'Goro Crater."] =
        "Pegar isso aqui agiliza a Cratera Un'Goro.",
    ["Stay clear of the elite foes."] =
        "Fique longe dos inimigos de elite.",
    ["Gather the big plumes colored brown and ivory."] =
        "Recolha as penas grandes marrons e cor de marfim.",
    ["Drop the Ground Clutter option down to 1."] =
        "Reduza a opção Ground Clutter para 1.",
    ["Hop onto the ledge here."] =
        "Pule na saliência aqui.",
    ["Monsters are unable to reach you from this spot."] =
        "Os monstros não conseguem alcançar você neste ponto.",
    ["Hold off until you have left combat."] =
        "Espere até sair do combate.",
    ["Other creatures use these spawn points too."] =
        "Outras criaturas também surgem nesses pontos.",
    ["If it hasn't turned up by level 49, move on."] =
        "Se não tiver aparecido até o nível 49, siga em frente.",
    ["Stay on the road, then take the trail downhill"] =
        "Siga pela estrada, depois desça pela trilha",
    ["Point it at Gammerita."] =
        "Use-o em Gammerita.",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "A presa: uma tartaruga de elite resistente, de casco azul-celeste.",
    ["Look for little blue flasks."] =
        "Procure frasquinhos azuis.",
    ["Steer around Revantusk Village."] =
        "Contorne a Aldeia Revatusco.",
    ["Stay away from Gammerita."] =
        "Fique longe de Gammerita.",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "Mate monstros até a recarga da Pedra de Regresso terminar",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "O alvo patrulha um circuito amplo, no sentido anti-horário.",
    ["Watch for a pair of guards hiding in stealth."] =
        "Cuidado com dois guardas escondidos em furtividade.",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "O alvo surge em 58.9, 39.3, em Tanaris.",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "Desça pela passagem que dá em Lost Rigger Cove",
    ["Few kills yield this item."] =
        "Poucos abates rendem este item.",
    ["Others can be found on raised wood platforms close by."] =
        "Há outros em plataformas de madeira elevadas por perto.",
    ["Others are indoors too."] =
        "Há outros dentro das construções também.",
    ["Take the passage out of Lost Rigger Cove"] =
        "Pegue a passagem para sair de Lost Rigger Cove",
    ["If the NPC is gone, hold on until it reappears."] =
        "Se o NPC não estiver lá, espere até ele reaparecer.",
    ["Search the sand mounds."] =
        "Procure nos montes de areia.",
    ["It competes for spawn points."] =
        "Disputa os pontos de surgimento.",
    ["Stay clear of the elite tyrannosaur."] =
        "Fique longe do tiranossauro de elite.",
    ["Every creature in Un'Goro Crater can drop it."] =
        "Todas as criaturas da Cratera Un'Goro podem soltar isso.",
    ["Gather from clumps of multicolored crystals."] =
        "Colete dos aglomerados de cristais multicoloridos.",
    ["Spawn points are shared, so pick up every one you find."] =
        "Os pontos de surgimento são compartilhados, então pegue todos os que encontrar.",
    ["Gathering it causes other hues to show up."] =
        "Coletá-lo faz outras cores aparecerem.",
    ["The targets are mobile plant monsters."] =
        "Os alvos são monstros-planta que andam.",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "Com as próximas entregas, isso leva você ao nível 50.",
    ["Flight master at Marshal's Refuge"] =
        "Mestre de voo do Refúgio do Marshal",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "Nos túneis de Maraudon, o alvo é um centauro de armadura violeta.",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "Entre na ala roxa dos túneis de Maraudon.",
    ["Use it on the Spirit of Gelk."] =
        "Use-o no Espírito de Gelk.",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "Nos túneis de Maraudon, encontre a câmara que liga as áreas roxa e laranja.",
    ["Target the Spirit of Kolk with the item."] =
        "Use o item no Espírito de Kolk.",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "Nos túneis de Maraudon, ao longo da ala laranja.",
    ["The target is beside the big pool holding orange crystals."] =
        "O alvo fica ao lado do grande lago com cristais laranja.",
    ["Target the Spirit of Magra with it."] =
        "Use-o no Espírito de Magra.",
    ["Target Spirit of Veng with it."] =
        "Use-o no Espírito de Veng.",
    ["In the orange area."] =
        "Na área laranja.",
    ["Use it beside the Vylestem Vines."] =
        "Use-o ao lado dos Cipós Caule Torpe.",
    ["Look for stumps topped with big leaves."] =
        "Procure tocos com folhas grandes por cima.",
    ["The spot is in Foulspore Cavern."] =
        "O local fica na Foulspore Cavern.",
    ["This happens in Maraudon's violet wing."] =
        "Isso acontece na ala violeta de Maraudon.",
    ["Aim the item at the Spirit of Maraudos."] =
        "Use o item no Espírito de Maraudos.",
    ["The target is a spectral centaur holding a spear."] =
        "O alvo é um centauro espectral com uma lança.",
    ["Small green flasks."] =
        "Frasquinhos verdes.",
    ["Search the shoreline, right by the waves."] =
        "Procure na beira da praia, junto às ondas.",
    ["The objective is on the ship's center deck."] =
        "O objetivo fica no convés central do navio.",
    ["Search for a parchment roll, white in color."] =
        "Procure um rolo de pergaminho branco.",
    ["Search the ship's middle or lowest deck."] =
        "Procure no convés do meio ou no mais baixo do navio.",
    ["If she is absent, wait for her to come back."] =
        "Se ela não estiver lá, espere ela voltar.",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "Cace um raptor de elite de nível 43 de escamas azul-celeste.",
    ["The quarry is a pale tiger, an elite at 43."] =
        "A presa é um tigre claro, de elite de nível 43.",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "Ele chama 2 pequenos reforços de nível mais baixo; nenhum é de elite.",
    ["When it drops to about 50% health."] =
        "Quando a vida dele cair para cerca de 50%.",
    ["Look underneath the bridge."] =
        "Procure embaixo da ponte.",
    ["Hunt flame and stone elementals."] =
        "Cace elementais de fogo e de pedra.",
    ["Fight elementals and golems."] =
        "Lute contra elementais e golens.",
    ["Drop onto the metal catwalk at this spot"] =
        "Desça na passarela de metal neste ponto",
    ["Drop off the cavern's bridge at this spot"] =
        "Pule da ponte da caverna neste ponto",
    ["Go in through the second cave opening"] =
        "Entre pela segunda entrada da caverna",
    ["Slave Workers can drop them too."] =
        "Os Trabalhadores Escravos também podem soltá-los.",
    ["Climb the trail out of the Cauldron"] =
        "Suba a trilha para sair do Caldeirão",
    ["The foes here are elite."] =
        "Os inimigos aqui são de elite.",
    ["Do not leave this quest undone; it matters."] =
        "Não deixe esta missão de lado; ela é importante.",
    ["The spot is at the tower's upper level."] =
        "O local fica no andar de cima da torre.",
    ["Beware, this foe is elite."] =
        "Cuidado, este inimigo é de elite.",
    ["Walk over the rope bridge"] =
        "Atravesse a ponte de corda",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "Cace o sáurio azul-celeste de elite; ele é de nível 48.",
    ["The target wanders the trail."] =
        "O alvo anda pela trilha.",
    ["Defeat every foe close by before you begin."] =
        "Derrote todos os inimigos por perto antes de começar.",
    ["Escort Dorius Stonetender and keep him safe."] =
        "Escolte Dório Tratapedra e proteja-o.",
    ["Keep it; a later quest calls for it."] =
        "Guarde-o; uma missão mais adiante pede isso.",
    ["Look by the lookout towers ringing the Cauldron."] =
        "Procure perto das torres de vigia em volta do Caldeirão.",
    ["Climb the trail into Thorium Point"] =
        "Suba a trilha até Thorium Point",
    ["Blasted Lands and Burning Steppes"] =
        "Barreira do Inferno e Estepes Ardentes",
    ["Prioritize these targets."] =
        "Dê prioridade a estes alvos.",
    ["Hunt basilisks."] =
        "Cace basiliscos.",
    ["They appear in the same spots as the boars."] =
        "Eles aparecem nos mesmos pontos que os javalis.",
    ["Hunt hyenas for these."] =
        "Cace hienas para conseguir isso.",
    ["Scorpions spawn in the same spots."] =
        "Escorpiões surgem nos mesmos pontos.",
    ["Climb the trail to Morgan's Vigil"] =
        "Suba a trilha até Morgan's Vigil",
    ["Flight master at Morgan's Vigil"] =
        "Mestre de voo de Morgan's Vigil",
    ["8 different quests will ask for it."] =
        "8 missões diferentes vão pedir isso.",
    ["You hand in 60 pieces of cloth for every quest."] =
        "Você entrega 60 tecidos em cada missão.",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "Inimigos mortos-vivos soltam isso nas duas Terras Pestilentas, Ocidentais e Orientais.",
    ["Keep your Argent Dawn Commission aura up."] =
        "Mantenha ativa a aura Comissão da Aurora Argêntea.",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "Com as próximas entregas, isso leva você ao nível 52.",
    ["Azshara and Felwood"] =
        "Azshara e Selva Maleva",
    ["A lengthy stretch of questing lies ahead."] =
        "Vem aí um longo trecho de missões.",
    ["Hand these in afterwards for experience and reputation."] =
        "Entregue-os depois por experiência e reputação.",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "Suba a reputação com o Domínio dos Presamatos até Não Amistoso",
    ["Extra targets wait in the caves."] =
        "Há mais alvos nas cavernas.",
    ["Stay on the trail to reach Jaedenar"] =
        "Siga a trilha até Jaedenar",
    ["Climb the trail into Jadefire Run"] =
        "Suba a trilha até Jadefire Run",
    ["Flight master at Talonbranch Glade"] =
        "Mestre de voo de Talonbranch Glade",
    ["Big blue plumes."] =
        "Penas grandes azuis.",
    ["Head eastward as you go."] =
        "Vá seguindo para o leste.",
    ["You pick up Claw (Rank 7) here."] =
        "Aqui você obtém Garra (Grau 7).",
    ["Flight master at Everlook"] =
        "Mestre de voo de Visteterna",
    ["The flight master stands past the walls, outdoors."] =
        "O mestre de voo fica do lado de fora das muralhas.",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "Use o feitiço Domar Fera em um Espancador Garraivoso.",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "Encontre um urso empesteado de pelagem castanha.",
    ["Feralas and Azshara"] =
        "Feralas e Azshara",
    ["Aim the item at the Strider foes."] =
        "Use o item nas moas.",
    ["The targets are towering green giants."] =
        "Os alvos são gigantes verdes enormes.",
    ["The item strips their elite status."] =
        "O item remove o status de elite deles.",
    ["Hunt down the elementals formed of water."] =
        "Cace os elementais de água.",
    ["Reveal Dire Maul on your map"] =
        "Revele o Gládio Cruel no seu mapa",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "Fique na saliência vizinha, depois pule nesta fenda do muro",
    ["Hop onto the ledge"] =
        "Pule na saliência",
    ["Leap over at this spot"] =
        "Pule para o outro lado neste ponto",
    ["Leap up at this spot"] =
        "Pule para cima neste ponto",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "Shay Velifrondes segue você; mantenha-a viva.",
    ["Keep near her, as she tends to stray."] =
        "Fique perto dela, pois ela costuma se desviar.",
    ["Finish the quest named The Videre Elixir."] =
        "Conclua a missão O elixir Videre.",
    ["Keep the elixir in your bags; never consume it."] =
        "Guarde o elixir nas bolsas; nunca o beba.",
    ["You will die from it."] =
        "Ele mata você.",
    ["Put these items in your bank vault."] =
        "Guarde estes itens no seu banco.",
    ["The quest giver waits on the hilltop."] =
        "Quem dá a missão espera no alto da colina.",
    ["The targets are Myrmidons and Sirens."] =
        "Os alvos são Mirmidões e Sirenas.",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "Contorne as Ruínas de Eldarath, depois atravesse a ponte",
    ["Drop down with care"] =
        "Desça com cuidado",
    ["The spot is the middle of the timber deck."] =
        "O local é o meio da plataforma de madeira.",
    ["It shows up close by after a while."] =
        "Aparece por perto depois de um tempo.",
    ["At times it takes several minutes."] =
        "Às vezes leva vários minutos.",
    ["The targets are flame elementals."] =
        "Os alvos são elementais de fogo.",
    ["An elite foe waits on the summit; steer clear."] =
        "Um inimigo de elite espera no cume; fique longe.",
    ["Ringo trails behind you; keep him alive."] =
        "Ringo segue você; mantenha-o vivo.",
    ["Keep near him; he passes out."] =
        "Fique perto dele; ele desmaia.",
    ["Take the trail through the cavern"] =
        "Pegue a trilha pela caverna",
    ["Escort A-Me 01 and keep it alive."] =
        "Escolte A-Me 01 e mantenha-o vivo.",
    ["Winterspring and Felwood"] =
        "Hibérnia e Selva Maleva",
    ["Go into Jaedenar"] =
        "Entre em Jaedenar",
    ["Go to the upper floor of the cavern."] =
        "Vá ao andar de cima da caverna.",
    ["Circle the gap in the ground, then take the trail downward"] =
        "Contorne o buraco no chão, depois desça pela trilha",
    ["The target is deep in the cave, on its lowest floor."] =
        "O alvo fica no fundo da caverna, no andar mais baixo.",
    ["Search the upper and lower floors of the cavern."] =
        "Procure nos andares de cima e de baixo da caverna.",
    ["The prisoner is held in a cage of yellow wood."] =
        "O prisioneiro está numa jaula de madeira amarela.",
    ["Climb the trail and exit the cavern"] =
        "Suba a trilha e saia da caverna",
    ["The targets are furbolgs."] =
        "Os alvos são pelursos.",
    ["With the coming hand-ins, this brings you to level 55."] =
        "Com as próximas entregas, isso leva você ao nível 55.",
    ["A tough quest lies just ahead."] =
        "Uma missão difícil vem logo a seguir.",
    ["Flee if things go badly."] =
        "Fuja se as coisas derem errado.",
    ["The NPC is a human spirit."] =
        "O NPC é um espírito humano.",
    ["The targets are leafless trees that walk."] =
        "Os alvos são árvores sem folhas que andam.",
    ["Slay the greenish beings of living water."] =
        "Mate os seres esverdeados de água viva.",
    ["The targets are wolves and bears."] =
        "Os alvos são lobos e ursos.",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "Os alvos são 3 pelursos brancos que andam em grupo.",
    ["The target patrols a long route beside the road."] =
        "O alvo patrulha um longo trajeto ao lado da estrada.",
    ["Move on if you have not seen it once the trail ends."] =
        "Siga em frente se não o tiver visto quando a trilha acabar.",
    ["Escort Ranshalla and guard her."] =
        "Escolte Ranshalla e proteja-a.",
    ["Wait until the foes hit her before you strike."] =
        "Espere os inimigos a atacarem antes de você atacar.",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "Eles aparecem perto de 28.1, 35.0, em Hibérnia.",
    ["You can also do dungeons until you hit level 56."] =
        "Você também pode fazer masmorras até chegar ao nível 56.",
    ["Give Nafien the items in sets of 5."] =
        "Entregue os itens a Nafien em pilhas de 5.",
    ["Every full set you hand over earns 50 reputation."] =
        "Cada pilha completa entregue dá 50 de reputação.",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "Suba a reputação com o Domínio dos Presamatos até Tolerado",
    ["The NPC stands within the passage."] =
        "O NPC fica dentro da passagem.",
    ["This foe is elite."] =
        "Este inimigo é de elite.",
    ["Target Black Broodlings with the item."] =
        "Use o item nos Filhotes Negros.",
    ["A red crystal hovers over each body."] =
        "Um cristal vermelho flutua sobre cada corpo.",
    ["Hunt the huge red dragons."] =
        "Cace os enormes dragões vermelhos.",
    ["Look for gray standing stones."] =
        "Procure menires cinza.",
    ["The target is an ogre."] =
        "O alvo é um ogro.",
    ["Watch out, its blows are strong."] =
        "Cuidado, os golpes dele são fortes.",
    ["The targets are wolves and orcs."] =
        "Os alvos são lobos e orcs.",
    ["The NPC is an elderly human lady."] =
        "O NPC é uma senhora humana idosa.",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "Se ela não estiver lá, pode estar no andar de cima da casa, em 52.4, 42.1, na Cidade de Ventobravo.",
    ["Walk over the rope bridge, then climb the trail"] =
        "Atravesse a ponte de corda, depois suba a trilha",
    ["The Plaguelands"] =
        "As Terras Pestilentas",
    ["Check each of the two floors indoors."] =
        "Confira os dois andares lá dentro.",
    ["Stand at the watchtower's doorway."] =
        "Fique na porta da torre de vigia.",
    ["An elite foe waits indoors; stay clear of it."] =
        "Um inimigo de elite espera lá dentro; fique longe dele.",
    ["Spiders also appear at these spawn spots."] =
        "Aranhas também surgem nesses pontos.",
    ["Look for a white set of bones."] =
        "Procure uma ossada branca.",
    ["The targets appear in several places."] =
        "Os alvos aparecem em vários lugares.",
    ["Finish Locked Away to obtain this."] =
        "Conclua Locked Away para obter isso.",
    ["The target is a ghoul armed with a pitchfork."] =
        "O alvo é um carniçal armado com um forcado.",
    ["Elites roam close by; keep your distance."] =
        "Há inimigos de elite por perto; mantenha distância.",
    ["Search the bones of a fallen person."] =
        "Procure nos ossos de uma pessoa morta.",
    ["The NPC is within the ruined home."] =
        "O NPC fica dentro da casa em ruínas.",
    ["Search within the houses here."] =
        "Procure dentro das casas aqui.",
    ["Look for big yellow grubs."] =
        "Procure larvas amarelas grandes.",
    ["With the coming hand-ins, this gets you to level 58."] =
        "Com as próximas entregas, isso leva você ao nível 58.",
    ["Flight master at Light's Hope Chapel"] =
        "Mestre de voo da Capela Esperança da Luz",
    ["Look for big rocks seeping green slime."] =
        "Procure rochas grandes que vertem gosma verde.",
    ["Progress westward as you go."] =
        "Vá avançando para o oeste.",
    ["Other undead compete for the same spawn points."] =
        "Outros mortos-vivos disputam os mesmos pontos de surgimento.",
    ["The spirits rise where those foes die."] =
        "Os espíritos se erguem onde esses inimigos morrem.",
    ["Go down into the tomb"] =
        "Desça até o túmulo",
    ["This is below ground, on the crypt's lower floor."] =
        "Fica no subsolo, no andar de baixo da cripta.",
    ["Your character must be seated first."] =
        "Seu personagem precisa estar sentado antes.",
    ["Move the camera close and check which book is genuine."] =
        "Aproxime a câmera e veja qual livro é o verdadeiro.",
    ["Some books are traps that summon foes."] =
        "Alguns livros são armadilhas que evocam inimigos.",
    ["The genuine book can look two ways:"] =
        "O livro verdadeiro pode ter duas aparências:",
    ["Close to the big buildings lit in blue."] =
        "Perto dos grandes prédios iluminados de azul.",
    ["A new one may appear when one is killed."] =
        "Um novo pode aparecer quando um é morto.",
    ["The targets are in the ruined houses."] =
        "Os alvos estão nas casas em ruínas.",
    ["It shows up on top of the box."] =
        "Aparece em cima da caixa.",
    ["Targets are in the tower and around its base."] =
        "Os alvos estão na torre e em volta da base.",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "Se houver um inimigo de elite no telhado da torre, espere do lado de fora.",
    ["Pick up Claw (Rank 8) for your pet."] =
        "Obtenha Garra (Grau 8) para o seu ajudante.",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "Use o feitiço Domar Fera em uma Guinchadora de Hibérnia.",
    ["Hunt the white owls."] =
        "Cace as corujas brancas.",
    ["Either the patriarch or the matriarch yetis work."] =
        "Servem tanto os yetis patriarcas quanto as matriarcas.",
    ["Climb across the mountain to the far side"] =
        "Atravesse a montanha até o outro lado",
    ["Hunt the chimaeras."] =
        "Cace as quimeras.",
    ["Target Legacki with the item."] =
        "Use o item em Legacki.",
    ["Target Sprinkle with it."] =
        "Use-o em Sguisha.",
    ["Target Quixxil with it."] =
        "Use-o em Quixxil.",
    ["Flight master at Cenarion Hold"] =
        "Mestre de voo do Forte Cenariano",
    ["Watch out: killing them can summon more foes."] =
        "Cuidado: matá-los pode evocar mais inimigos.",
    ["Look for fragments of rock that glow blue."] =
        "Procure fragmentos de rocha que brilham em azul.",
    ["Roam the area where the insects swarm."] =
        "Percorra a área onde os insetos enxameiam.",
    ["Hunt the gray scorpids."] =
        "Cace os escorpídeos cinza.",
    ["The target is an orc wearing violet robes."] =
        "O alvo é um orc de vestes violeta.",
    ["It shows up around here."] =
        "Aparece por aqui.",
    ["Hunt the yellow scorpids."] =
        "Cace os escorpídeos amarelos.",
    ["Target the burrowing worms."] =
        "Ataque os vermes escavadores.",
    ["This number shrinks while you kill monsters."] =
        "Este número diminui enquanto você mata monstros.",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "Leve as penas que coletar ao NPC em 64.8, 8.1.",
    ["The NPC stands outdoors, next to the crypt."] =
        "O NPC fica do lado de fora, ao lado da cripta.",
    ["The targets are bats."] =
        "Os alvos são morcegos.",
    ["Check in and around the structures."] =
        "Confira dentro e em volta das construções.",
    ["With the coming hand-ins, this gets you to level 5."] =
        "Com as próximas entregas, isso leva você ao nível 5.",
    ["The target is a shambling zombie."] =
        "O alvo é um zumbi cambaleante.",
    ["The quest giver is an abomination."] =
        "Quem dá a missão é uma abominação.",
    ["He may step off the road now and then to pick plants."] =
        "De vez em quando ele pode sair da estrada para colher plantas.",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "Cure Necroguarda Querêncio com Cura Inferior (Grau 2).",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "Aplique Palavra de Poder: Fortitude em Necroguarda Querêncio.",
    ["The targets are gray, demon-like hounds."] =
        "Os alvos são cães cinzentos com aparência de demônio.",
    ["The targets are zombies."] =
        "Os alvos são zumbis.",
    ["Look for wilted violet weeds."] =
        "Procure ervas violeta murchas.",
    ["Walk the shoreline toward the southwest."] =
        "Ande pela orla rumo ao sudoeste.",
    ["If the beach ends first, move on without it."] =
        "Se a praia acabar antes, siga em frente sem ele.",
    ["Keep to the trail as it curves."] =
        "Fique na trilha enquanto ela faz a curva.",
    ["Step into the flames."] =
        "Entre nas chamas.",
    ["Stay on the trail and keep climbing the steps"] =
        "Fique na trilha e continue subindo os degraus",
    ["Loot the gray chests built from metal."] =
        "Saqueie os baús cinza de metal.",
    ["Search in and around the sunken wrecks."] =
        "Procure dentro e em volta dos destroços afundados.",
    ["The target is a troll in crimson robes."] =
        "O alvo é um troll de vestes carmesim.",
    ["Look for the skull-shaped objects."] =
        "Procure os objetos em forma de caveira.",
    ["The targets are clumps of purple eggs."] =
        "Os alvos são aglomerados de ovos roxos.",
    ["Search close to the trunks."] =
        "Procure perto dos troncos.",
    ["Stay on the trail, then cross the tunnel"] =
        "Fique na trilha, depois atravesse o túnel",
    ["Traverse the passageway"] =
        "Atravesse a passagem",
    ["Fly to Orgrimmar"] =
        "Voe até Orgrimmar",
    ["The quest comes from a bounty sign."] =
        "A missão vem de um cartaz de recompensa.",
    ["Look for an iron slab marked with a skull."] =
        "Procure uma laje de ferro marcada com uma caveira.",
    ["Use the item at the pink marking."] =
        "Use o item na marca rosa.",
    ["Move gradually northwest toward Agamand Mills."] =
        "Avance aos poucos para o noroeste, rumo a Agamand Mills.",
    ["The target is a skeletal caster in armor."] =
        "O alvo é um conjurador esquelético de armadura.",
    ["The target is a banshee."] =
        "O alvo é uma banshee.",
    ["The targets are skeletons in armor."] =
        "Os alvos são esqueletos de armadura.",
    ["The targets are skeletal mages."] =
        "Os alvos são magos esqueléticos.",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "Junto com as próximas entregas, isto leva você ao nível 13.",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "O alvo patrulha a estrada de Montalvo até o Sepulcro.",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "O alvo aparece perto do Sepulcro, em 47.5, 39.8, na Floresta de Pinhaprata.",
    ["Fight quilboars."] =
        "Lute contra javatuscos.",
    ["Look for little brown pinecones."] =
        "Procure pequenas pinhas marrons.",
    ["Hunt the black-feathered birds."] =
        "Cace as aves de penas pretas.",
    ["Look for gray slabs of stone lying flat."] =
        "Procure lajes de pedra cinza deitadas no chão.",
    ["Do not trail after the wolf."] =
        "Não vá atrás do lobo.",
    ["Take the lift to the top of Thunder Bluff"] =
        "Pegue o elevador até o topo do Penhasco do Trovão",
    ["Beside the forge."] =
        "Ao lado da forja.",
    ["Take a lift down out of Thunder Bluff"] =
        "Desça de elevador para sair do Penhasco do Trovão",
    ["Aim the item at one Adult Plainstrider."] =
        "Mire o item em um Pinote Adulto.",
    ["Target a Prairie Stalker with it."] =
        "Mire-o em um Espreitador-da-pradaria.",
    ["Use the item on any Swoop."] =
        "Use o item em qualquer Rapineiro.",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "Escolha um animal de nível 9-10 e faça dele seu ajudante com o feitiço Domar Fera.",
    ["This pet is temporary; a lasting one comes shortly."] =
        "Este ajudante é temporário; um permanente vem em breve.",
    ["Flight master at Camp Taurajo"] =
        "Mestre de voo do Acampamento Taurajo",
    ["Fly to Thunder Bluff"] =
        "Voe até o Penhasco do Trovão",
    ["Stick to the road and stay alert."] =
        "Fique na estrada e mantenha-se atento.",
    ["Flight master at the Crossroads"] =
        "Mestre de voo da Encruzilhada",
    ["This is food for your pet."] =
        "Isto é comida para o seu ajudante.",
    ["A spirit shows up after this."] =
        "Depois disso, um espírito aparece.",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "Encontre um Escorpídeo Caudaçonha e use Domar Fera nele.",
    ["Release your current pet before this."] =
        "Abandone seu ajudante atual antes disso.",
    ["Here you tame a pet to keep."] =
        "Aqui você doma um ajudante permanente.",
    ["The NPC waits at the mountain's summit."] =
        "O NPC espera no cume da montanha.",
    ["Kill Water Seekers and Thornweavers."] =
        "Mate Rabdomantes e Tecespinhos.",
    ["The objective is at the far end."] =
        "O objetivo fica bem no fundo.",
    ["Receive Sapta Sight"] =
        "Receba a visão do sapta",
    ["The quest giver stands among the boulders."] =
        "Quem dá a missão fica entre os pedregulhos.",
    ["This NPC is found down in the Cleft of Shadow."] =
        "Este NPC fica lá embaixo, no Antro das Sombras.",
    ["This clears the quest's time limit."] =
        "Isto elimina o limite de tempo da missão.",
    ["Fly to Undercity"] =
        "Voe até a Cidade Baixa",
    ["Orc and Troll start"] =
        "Início de orcs e trolls",
    ["Stay out of the cave when you can."] =
        "Fique fora da caverna sempre que puder.",
    ["The following step is out of the cave."] =
        "A próxima etapa fica fora da caverna.",
    ["Look for a dark-shelled scorpion."] =
        "Procure um escorpião de carapaça escura.",
    ["Target Lazy Peons with the item."] =
        "Mire o item nos peões preguiçosos.",
    ["The targets are dozing orcs."] =
        "Os alvos são orcs cochilando.",
    ["Look for cacti bearing red fruit."] =
        "Procure cactos com frutos vermelhos.",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "Cure Bruta Kor'ja com o segundo grau de Cura Inferior.",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "Aplique Palavra de Poder: Fortitude em Bruta Kor'ja.",
    ["Aim the item at one Dire Mottled Boar."] =
        "Mire o item em um Mosquetusco Hediondo.",
    ["Use it on any Surf Crawler."] =
        "Use-o em qualquer Surfatisco.",
    ["Use it on any Armored Scorpid."] =
        "Use-o em qualquer Escorpídeo Encouraçado.",
    ["This leads to a quest for later levels."] =
        "Isto leva a uma missão de níveis mais altos.",
    ["Escort Deathstalker Erland and keep him alive."] =
        "Escolte o Sicário Orlando e mantenha-o vivo.",
    ["Hunt the wolves whose fur is jet black."] =
        "Cace os lobos de pelo preto retinto.",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "Escolha um Urso Cinzento Feroz e dome-o com Domar Fera.",
    ["Fly to The Sepulcher"] =
        "Voe até o Sepulcro",
    ["He has three ghouls at his side."] =
        "Ele tem três carniçais ao seu lado.",
    ["Hold off until one steps out, then slay it."] =
        "Espere até que um saia, depois mate-o.",
    ["The target shows up here sooner or later."] =
        "O alvo aparece aqui mais cedo ou mais tarde.",
    ["The NPC is on Undercity's upper level."] =
        "O NPC fica no nível superior da Cidade Baixa.",
    ["The NPC is in a little cave."] =
        "O NPC fica em uma pequena caverna.",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "O NPC fica depois da grande sala dos troggs, à direita.",
    ["The quest giver waits in the tent."] =
        "Quem dá a missão espera na tenda.",
    ["Move on if it is absent."] =
        "Siga em frente se ele não estiver lá.",
    ["If it isn't there, hold on until it shows up."] =
        "Se ele não estiver lá, espere até aparecer.",
    ["Circle the mountain by its northern flank."] =
        "Contorne a montanha pela encosta norte.",
    ["The target is a troll."] =
        "O alvo é um troll.",
    ["The target is a human in a crimson long coat."] =
        "O alvo é um humano de sobretudo carmesim.",
    ["The targets are the striped zhevras."] =
        "Os alvos são as zhevras listradas.",
    ["Go into the water beside the rock that bubbles."] =
        "Entre na água ao lado da rocha que borbulha.",
    ["Look for big blue fungi."] =
        "Procure fungos azuis grandes.",
    ["Up to two foes might jump you."] =
        "Até dois inimigos podem atacar você de surpresa.",
    ["Kill the purple raptors."] =
        "Mate os raptores roxos.",
    ["Targets are found across the entire Barrens."] =
        "Os alvos ficam espalhados por todos os Sertões.",
    ["Slay any you come across along the way."] =
        "Mate todos que encontrar pelo caminho.",
    ["With the coming hand-ins, this gets you to level 18."] =
        "Com as próximas entregas, isto leva você ao nível 18.",
    ["Steal from Gamon using Pick Pocket."] =
        "Roube de Gamon com Pick Pocket.",
    ["Use it on Tazan's Satchel."] =
        "Use-o na Algibeira de Tazan.",
    ["The item is already in your inventory."] =
        "O item já está no seu inventário.",
    ["Check the upper and lower tiers of the structure."] =
        "Verifique os níveis de cima e de baixo da estrutura.",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "Escolte o Retalhador do Manivela e mantenha-o inteiro.",
    ["Look for gray steel pails."] =
        "Procure baldes de aço cinza.",
    ["The target is a pale lion."] =
        "O alvo é um leão pálido.",
    ["It turns up in the area."] =
        "Ele aparece nesta área.",
    ["Keep away from Sister Rathtalon."] =
        "Fique longe da Irmã Rathalon.",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "O alvo é uma harpia de plumagem esmeralda; cuidado, é de elite.",
    ["The target circles in the air, so search around."] =
        "O alvo voa em círculos, então procure ao redor.",
    ["A small chest made of wood."] =
        "Um pequeno baú de madeira.",
    ["Polly is the target for the item."] =
        "Polly é o alvo do item.",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "Derrote inimigos Kolkar em volta do Oásis Estagnado.",
    ["Sooner or later a yell shows up in the chat window."] =
        "Mais cedo ou mais tarde, um grito aparece na janela de chat.",
    ["Watch for his yell: I am summoned!"] =
        "Fique atento ao grito dele: Fui invocado!",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "Verog chega depois que um grito desafia os intrusos a irem morrer na tenda dele.",
    ["Escort Kaya Flathoof and keep her safe."] =
        "Escolte Kaya Casco Chato e mantenha-a em segurança.",
    ["Close to the finish, 3 foes ambush you together."] =
        "Perto do fim, 3 inimigos emboscam você juntos.",
    ["Fly to Sun Rock Retreat"] =
        "Voe até o Retiro Rocha do Sol",
    ["Gather the big, white eggs."] =
        "Colete os ovos brancos grandes.",
    ["Monsters might jump you here."] =
        "Monstros podem atacar você de surpresa aqui.",
    ["Hatchling spiders may bring a level 22 spider."] =
        "Filhotes de aranha podem trazer uma aranha de nível 22.",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "Junto com as próximas entregas, isto leva você ao nível 20.",
    ["Look for a kodo with grey hide."] =
        "Procure um kodo de couro cinza.",
    ["The targets are big pink lizards."] =
        "Os alvos são lagartos rosa grandes.",
    ["The targets are under the water and along the shore."] =
        "Os alvos ficam debaixo d'água e ao longo da margem.",
    ["The target is a raptor."] =
        "O alvo é um raptor.",
    ["Trade your Blood Shards to gain buffs."] =
        "Troque seus Estilhaços de Sangue por bônus.",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "Durante as missões nos Sertões, troque com ele os Estilhaços de Sangue que sobrarem.",
    ["Ask him for the Spirit of the Wind buff"] =
        "Peça a ele o bônus Espírito do Vento",
    ["Hunt the winged serpents."] =
        "Cace as serpentes aladas.",
    ["Take the lift up into Thunder Bluff"] =
        "Suba de elevador até o Penhasco do Trovão",
    ["The object is a vase woven from wicker."] =
        "O objeto é um vaso de vime trançado.",
    ["They appear in scattered spots."] =
        "Eles aparecem em pontos espalhados.",
    ["Climb the mountainside"] =
        "Suba a encosta da montanha",
    ["Descend the slope"] =
        "Desça a encosta",
    ["Drop with care onto the rock, then go into the cave"] =
        "Desça com cuidado até a rocha, depois entre na caverna",
    ["The targets are oozes."] =
        "Os alvos são gosmas.",
    ["Look for little green shrubs bearing violet blooms."] =
        "Procure pequenos arbustos verdes com flores violeta.",
    ["A centaur flanked by two bodyguards."] =
        "Um centauro ladeado por dois guarda-costas.",
    ["Climb the trail and cross the peaks"] =
        "Suba a trilha e atravesse os picos",
    ["Look for a robot shaped like a person."] =
        "Procure um robô em forma de pessoa.",
    ["The target appears right here."] =
        "O alvo aparece bem aqui.",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "Pegue a passagem e siga a trilha de lanternas até o Vale Gris",
    ["Stay clear of Astranaar."] =
        "Fique longe de Astranaar.",
    ["Exit the tunnel into Ashenvale"] =
        "Saia do túnel no Vale Gris",
    ["Flight master at Zoram'gar Outpost"] =
        "Mestre de voo do Assentamento Zoram'gar",
    ["The NPC waits within the hut."] =
        "O NPC espera dentro da cabana.",
    ["Use it twice on Taskmaster Fizzule."] =
        "Use-o duas vezes em Capataz Arruela.",
    ["A short way north of here."] =
        "Um pouco ao norte daqui.",
    ["Target Taskmaster Fizzule and salute him."] =
        "Selecione o Capataz Arruela e faça a expressão /salute para ele.",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "Roube o Capataz Biela com Pick Pocket.",
    ["Open with Ambush for a bigger hit."] =
        "Abra com Emboscada para um golpe maior.",
    ["Lean on Rupture for bonus damage."] =
        "Use Ruptura para causar dano extra.",
    ["Eviscerate adds a burst of damage here."] =
        "Eviscerar acrescenta um pico de dano aqui.",
    ["The objective is on the terrace above."] =
        "O objetivo fica no terraço de cima.",
    ["Use Pick Lock to open it."] =
        "Use Pick Lock para abri-lo.",
    ["Poison crafting needs these."] =
        "São necessários para criar venenos.",
    ["Flight master at Tarren Mill"] =
        "Mestre de voo da Serraria Tarren",
    ["Get rid of your Touch of Zanzil."] =
        "Livre-se do seu Toque de Zanzil.",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "Escolha qualquer Urso Cinzento e use Domar Fera nele.",
    ["Go into Durnholde Keep, then over the bridge"] =
        "Entre no Forte do Desterro, depois atravesse a ponte",
    ["Look for it bound to the orc's leg."] =
        "Procure-o amarrado na perna do orc.",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "Junto com as próximas entregas, isto leva você ao nível 23.",
    ["Indoors or out in the open fields."] =
        "Dentro das construções ou nos campos abertos.",
    ["It may be found outdoors too."] =
        "Também pode estar ao ar livre.",
    ["The NPC is a little wolf."] =
        "O NPC é um lobinho.",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "Ele fica furioso e ataca você assim que a missão é entregue.",
    ["A woman holding a pitchfork."] =
        "Uma mulher segurando um forcado.",
    ["The target patrols the trail between the houses."] =
        "O alvo patrulha a trilha entre as casas.",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "O alvo surge em 30.5, 40.6, no Contraforte de Eira dos Montes.",
    ["With the coming hand-ins, this brings you to level 24."] =
        "Com as próximas entregas, isto leva você ao nível 24.",
    ["Tougher foes are coming up next."] =
        "Inimigos mais difíceis vêm a seguir.",
    ["Some may be in the smithy."] =
        "Alguns podem estar na ferraria.",
    ["The NPC is in the yard where black wolves roam."] =
        "O NPC fica no pátio onde vagam lobos pretos.",
    ["Do this once the prisoner is free."] =
        "Faça isto quando o prisioneiro estiver livre.",
    ["The tome is blue, resting on a bookshelf."] =
        "O tomo é azul e está numa estante.",
    ["Look in the room where Fenrus is."] =
        "Procure na sala onde está Fenrus.",
    ["The target is a dinosaur with blue hide."] =
        "O alvo é um dinossauro de couro azul.",
    ["Look for big boulders oozing green fluid."] =
        "Procure pedregulhos grandes vertendo um líquido verde.",
    ["The target is a quilboar robed in red."] =
        "O alvo é um javatusco de veste vermelha.",
    ["Kill Stalkers and Pathfinders."] =
        "Mate Espreitadores e Desbravadores.",
    ["The target is a red winged serpent."] =
        "O alvo é uma serpente alada vermelha.",
    ["The target roams; check the area."] =
        "O alvo se desloca; procure pela área.",
    ["Keep some range when you use the item."] =
        "Mantenha alguma distância ao usar o item.",
    ["With the coming hand-ins, this gets you to level 25."] =
        "Com as próximas entregas, isto leva você ao nível 25.",
    ["Fly to Brackenwall Village"] =
        "Voe até a Aldeia Muralha Verde",
    ["The target is an aquatic dinosaur."] =
        "O alvo é um dinossauro aquático.",
    ["The target roams through the water."] =
        "O alvo vaga pela água.",
    ["The target is beneath the platform."] =
        "O alvo fica embaixo da plataforma.",
    ["The target stands atop the timber platform."] =
        "O alvo fica em cima da plataforma de madeira.",
    ["Exit Windshear Crag"] =
        "Saia do Rochedo Cortavento",
    ["The targets are deer."] =
        "Os alvos são cervos.",
    ["The targets are tiny blue dragons."] =
        "Os alvos são dragõezinhos azuis.",
    ["Hunt the green slimes."] =
        "Cace as gosmas verdes.",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "As Feras de Seiva Corrosiva usam os mesmos pontos de surgimento.",
    ["Do not engage Sentinel Amarassan."] =
        "Não enfrente a Sentinela Amarassan.",
    ["The quarry is a kaldorei elite, level 27."] =
        "A presa é um kaldorei de elite, nível 27.",
    ["Exit Stonetalon Peak"] =
        "Saia do Morro das Torres de Pedra",
    ["Look for brown pinecones on the ground."] =
        "Procure pinhas marrons no chão.",
    ["Steer clear of the elite windstrider."] =
        "Fique longe da ave pernalta de elite.",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "Basiliscos e árvores ambulantes dividem estes pontos de surgimento.",
    ["Monsters are found throughout the Charred Vale."] =
        "Os monstros ficam por todo o Vale Carbonizado.",
    ["Take the trail toward Sun Rock Retreat"] =
        "Pegue a trilha rumo ao Retiro Rocha do Sol",
    ["Stay on the trail until the Charred Vale"] =
        "Fique na trilha até o Vale Carbonizado",
    ["The NPC is on the tower's middle floor."] =
        "O NPC fica no andar do meio da torre.",
    ["Flight master at Splintertree Post"] =
        "Mestre de voo do Posto Machadada",
    ["The targets are night elves hiding in stealth."] =
        "Os alvos são elfos noturnos escondidos na furtividade.",
    ["Track Hidden makes them simpler to spot."] =
        "Track Hidden facilita encontrá-los.",
    ["Escort Torek and guard him."] =
        "Escolte Torek e proteja-o.",
    ["Don't let him die."] =
        "Não deixe que ele morra.",
    ["Take the riverside trail, then climb this trail"] =
        "Pegue a trilha à beira do rio, depois suba esta trilha",
    ["The target is a panther with black fur."] =
        "O alvo é uma pantera de pelo preto.",
    ["The target roams a wide route."] =
        "O alvo percorre um trajeto amplo.",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "O alvo aparece perto de 62.4, 50.0, no Vale Gris.",
    ["Take the trail north into Thistlefur Hold"] =
        "Pegue a trilha ao norte até Thistlefur Hold",
    ["Search the brown crates built of timber."] =
        "Vasculhe os caixotes marrons de madeira.",
    ["Mostly on the cavern's upper level."] =
        "Principalmente no nível superior da caverna.",
    ["The NPC is on the cave's lowest level."] =
        "O NPC fica no nível mais baixo da caverna.",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "Escolte Ruul Casco de Neve e mantenha-o vivo.",
    ["Look for a gray druid-style bear."] =
        "Procure um urso cinza em forma de druida.",
    ["The target is a watery being tinted a deeper green."] =
        "O alvo é um ser aquoso de um verde mais escuro.",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "Junto com as próximas entregas, isto leva você ao nível 28.",
    ["Steer away from Silverwind Refuge."] =
        "Fique longe do Refúgio Brisaprata.",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "Suba a trilha, depois volte pela estrada ao Posto Machadada",
    ["Escort Muglash and keep him safe."] =
        "Escolte Muglash e mantenha-o em segurança.",
    ["If the item isn't usable yet, hold on a moment."] =
        "Se ainda não der para usar o item, espere um pouco.",
    ["Go into the Blackfathom Deeps instance"] =
        "Entre na instância Profundezas Negras",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "Nas Profundezas Negras, os inimigos nagas o soltam.",
    ["The targets are all over the tunnels."] =
        "Os alvos ficam por todos os túneis.",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "Colete os fragmentos azuis nas paredes da caverna, nas Profundezas Negras.",
    ["Head to the Moonshrine Ruins for this."] =
        "Vá às Moonshrine Ruins para isto.",
    ["Head back to Splintertree Post"] =
        "Volte ao Posto Machadada",
    ["Your quarry is a huge azure bird of level 31."] =
        "Sua presa é uma enorme ave azul de nível 31.",
    ["The target circles over a wide area."] =
        "O alvo voa em círculos sobre uma área ampla.",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "Ele aparece perto de 78.0, 66.0, no Vale Gris.",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "Desça de elevador até Mil Agulhas, siga a estrada rumo à Aldeia Vento Livre e suba de elevador",
    ["Fly to Freewind Post"] =
        "Voe até a Aldeia Vento Livre",
    ["A pair of level 30 foes stand guard over it."] =
        "Dois inimigos de nível 30 montam guarda.",
    ["Use the teleporter to reach the Plateau"] =
        "Use o teleportador para chegar ao platô",
    ["Go back to Dorn Plainstalker"] =
        "Volte a Dorn Espreitaprados",
    ["This won't kill you."] =
        "Isto não vai matar você.",
    ["Kill Surveyors and Diggers."] =
        "Mate Agrimensores e Escavadores.",
    ["Take the lift upward"] =
        "Suba de elevador",
    ["Look for big eggs."] =
        "Procure ovos grandes.",
    ["Keep away from Heartrazor."] =
        "Fique longe de Lamicárdio.",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap é uma hiena marrom com 2 hienas de escolta.",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "O alvo aparece perto de 17.3, 22.2, em Mil Agulhas.",
    ["The target is a centaur, black in color."] =
        "O alvo é um centauro de cor preta.",
    ["It roams a wide route."] =
        "Ele percorre um trajeto amplo.",
    ["Leave it out if you'd rather not hunt for it."] =
        "Deixe de lado se preferir não procurá-lo.",
    ["His patrol crosses this spot two times."] =
        "A patrulha dele passa por este ponto duas vezes.",
    ["Expect three foes to strike."] =
        "Espere o ataque de três inimigos.",
    ["Fight off the foes that come at you"] =
        "Rechace os inimigos que vierem até você",
    ["Look for thorny plants."] =
        "Procure plantas espinhosas.",
    ["Hard quests are coming up."] =
        "Missões difíceis vêm por aí.",
    ["Climb the trail and cross the rope bridges"] =
        "Suba a trilha e atravesse as pontes de corda",
    ["The objective lies atop the mesa."] =
        "O objetivo fica no alto do platô.",
    ["The target is a level 28 elite."] =
        "O alvo é um elite de nível 28.",
    ["You can defeat it alone without much trouble."] =
        "Você consegue derrotá-lo sozinho sem muita dificuldade.",
    ["Escort Lakota Windsong safely to the end."] =
        "Escolte Lakota Cantéolo em segurança até o fim.",
    ["On every plateau, a pair of foes spawns."] =
        "Em cada platô, surgem dois inimigos.",
    ["Be ready: this opponent is an elite at level 30."] =
        "Prepare-se: este oponente é um elite de nível 30.",
    ["Leave it if it proves too hard."] =
        "Deixe de lado se for difícil demais.",
    ["Climb the road into Feralas"] =
        "Suba a estrada até Feralas",
    ["Should you die, come back to life at Camp Mojache."] =
        "Se morrer, volte à vida na Aldeia Mojache.",
    ["Fly to Camp Mojache"] =
        "Voe até a Aldeia Mojache",
    ["Get Water Sapta done as well."] =
        "Conclua também Water Sapta.",
    ["You'll need this to pick up an upcoming quest."] =
        "Você vai precisar disto para pegar uma missão mais adiante.",
    ["Leap up and take the trail behind that tree"] =
        "Pule para cima e pegue a trilha atrás daquela árvore",
    ["Head north along the river to reach the NPC."] =
        "Siga para o norte ao longo do rio até o NPC.",
    ["Draw foes one at a time if you can."] =
        "Atraia os inimigos um de cada vez, se puder.",
    ["Do not take on the whole group together."] =
        "Não enfrente o grupo todo de uma vez.",
    ["Descend the ramp, then stay on the trail"] =
        "Desça a rampa, depois fique na trilha",
    ["Climb the trail to the cave's highest level"] =
        "Suba a trilha até o nível mais alto da caverna",
    ["When nearly dead, it calls two guards."] =
        "Quando está quase morto, chama dois guardas.",
    ["Warden Belamoore stands guard over it."] =
        "Vigia Belamore monta guarda sobre ele.",
    ["The target is a mage of level 36."] =
        "O alvo é um mago de nível 36.",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "Lute contra Kegan, quebrando a linha de visão dela com portas e escadas.",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "Enquanto os Escudeiros brilham, pare de atacá-los corpo a corpo.",
    ["Expect heavy damage from it."] =
        "Espere levar muito dano dele.",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "Junto com as próximas entregas, isto leva você ao nível 32.",
    ["Gather the big fungi."] =
        "Colete os fungos grandes.",
    ["The targets are out in front of the cavern."] =
        "Os alvos ficam na frente da caverna.",
    ["Flight master at Hammerfall"] =
        "Mestre de voo da Ruína do Martelo",
    ["Stay away from Refuge Pointe."] =
        "Fique longe da Ponta do Refúgio.",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "Junto com as próximas entregas, isto leva você ao nível 33.",
    ["Head out of the Apothecarium"] =
        "Saia do Boticarium",
    ["Hive Drones compete for these spawn points."] =
        "Os Zangões Silitídeos da Colmeia disputam estes pontos de surgimento.",
    ["The NPC is on the building's ground level."] =
        "O NPC fica no térreo do prédio.",
    ["The quest giver is in the Dormitory."] =
        "Quem dá a missão está no Dormitório.",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "Escolte Kernobill até o portal na entrada da masmorra.",
    ["Open the gray chest built of metal."] =
        "Abra o baú cinza de metal.",
    ["Close to the north wall."] =
        "Perto da parede norte.",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "Fica na mesma sala que o Mecangenheiro Termaplugue.",
    ["Plan on killing monsters for quite some time."] =
        "Conte com bastante tempo matando monstros.",
    ["Other satyrs use the same spawn points."] =
        "Outros sátiros usam os mesmos pontos de surgimento.",
    ["Take the trail toward Shadowprey Village"] =
        "Pegue a trilha rumo à Aldeia Pescassombra",
    ["Fly to Shadowprey Village"] =
        "Voe até a Aldeia Pescassombra",
    ["Defeat every foe in this chamber before starting."] =
        "Derrote todos os inimigos desta sala antes de começar.",
    ["Target Burning Blade foes with the item."] =
        "Mire o item nos inimigos da Lâmina Ardente.",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "Espere o inimigo ficar muito ferido, depois use-o.",
    ["Look for big white clams."] =
        "Procure mariscos brancos grandes.",
    ["Flight master at Grom'gol"] =
        "Mestre de voo de Grom'gol",
    ["They appear in the same spots as the panthers."] =
        "Eles surgem nos mesmos pontos que as panteras.",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "Cuidado com as Panteras Umbragorja; elas estão furtivas.",
    ["Tigers compete for the same spawn points."] =
        "Tigres disputam os mesmos pontos de surgimento.",
    ["The NPC is on the building's lowest floor"] =
        "O NPC fica no andar mais baixo do prédio",
    ["Climb the steps"] =
        "Suba os degraus",
    ["You won't find an ammunition seller."] =
        "Você não vai encontrar vendedor de munição.",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "Proteja Inácio \"Cascão\" enquanto o escolta.",
    ["Hunt the orange spiders."] =
        "Cace as aranhas laranja.",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "Cuidado: as Tocaieiras Presanegra ficam furtivas.",
    ["Escort Ogron, guarding him from attackers."] =
        "Escolte Ogron, protegendo-o dos atacantes.",
    ["Keep out of Theramore Isle."] =
        "Fique fora da Ilha de Theramore.",
    ["Let yourself drown for a quick trip."] =
        "Deixe-se afogar para uma viagem rápida.",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "Guarde-o: a série de missões da arma Redemoinho do guerreiro pede isso.",
    ["Alterac and Arathi"] =
        "Alterac e Arathi",
    ["Get ready to take down an elite of level 40 shortly."] =
        "Prepare-se para derrubar um elite de nível 40 em breve.",
    ["Quaff one potion right away so it is ready again later."] =
        "Beba uma poção agora mesmo para que ela esteja pronta de novo depois.",
    ["It wanders to the mouth of the cave."] =
        "Ele vaga até a entrada da caverna.",
    ["Look on the upper floor as well."] =
        "Procure também no andar de cima.",
    ["Climb the slope, then leap the wall"] =
        "Suba a encosta, depois pule o muro",
    ["Fly to Kargath"] =
        "Voe até Karrath",
    ["Stranglethorn and Swamp of Sorrows"] =
        "Selva do Espinhaço e Pântano das Mágoas",
    ["Go along the shore, then climb the trail"] =
        "Siga pela margem, depois suba a trilha",
    ["Keep clear of Darkshire."] =
        "Fique longe de Vila Sombria.",
    ["Flight master at Stonard"] =
        "Mestre de voo de Pedregal",
    ["Look for assorted little brown items."] =
        "Procure pequenos itens marrons variados.",
    ["Look for purple rings made of rock."] =
        "Procure círculos roxos de pedra.",
    ["A guardian shows up."] =
        "Um guardião aparece.",
    ["Stay clear of Lord Azrethoc."] =
        "Fique longe do Lorde Azrethoc.",
    ["An elite winged fiend of level 40 with brown hide."] =
        "Um demônio alado de elite de nível 40, de couro marrom.",
    ["The target wanders close by; look around."] =
        "O alvo vaga por perto; procure ao redor.",
    ["You can handle this alone without much trouble."] =
        "Você consegue fazer isto sozinho sem muita dificuldade.",
    ["A tougher foe is coming up."] =
        "Um inimigo mais difícil vem por aí.",
    ["Grab the loot."] =
        "Pegue o saque.",
    ["The target is a crocodile with white scales."] =
        "O alvo é um crocodilo de escamas brancas.",
    ["The target roams a wide loop through the water."] =
        "O alvo faz um circuito amplo pela água.",
    ["Accepting this starts a 2 hour countdown."] =
        "Aceitar isto inicia uma contagem regressiva de 2 horas.",
    ["The timer keeps running while you're offline."] =
        "O tempo continua correndo mesmo com você desconectado.",
    ["Take this quest only when you have time to spare."] =
        "Só pegue esta missão quando tiver tempo de sobra.",
    ["Watch out for a pair of stronger monsters here."] =
        "Cuidado com dois monstros mais fortes aqui.",
    ["Look for the NPC dressed in red armor."] =
        "Procure o NPC de armadura vermelha.",
    ["Climb the trail to Gordunni Outpost"] =
        "Suba a trilha até Gordunni Outpost",
    ["Beside the shining blue rings on the ground."] =
        "Ao lado dos círculos azuis brilhantes no chão.",
    ["Look for earth mounds that pop up."] =
        "Procure montes de terra que brotam do chão.",
    ["Ones holding the quest item shine blue."] =
        "Os que têm o item da missão brilham em azul.",
    ["Fight the tauren."] =
        "Lute contra os taurens.",
    ["The target is a winged green bug, level 47."] =
        "O alvo é um inseto verde alado, nível 47.",
    ["You can likely beat it at your current level."] =
        "Você provavelmente consegue vencê-lo no seu nível atual.",
    ["Kill bugs."] =
        "Mate insetos.",
    ["Extra targets lurk in the bug caverns."] =
        "Há mais alvos nas cavernas dos insetos.",
    ["Stay on the road"] =
        "Fique na estrada",
    ["The targets are ghosts that materialize."] =
        "Os alvos são fantasmas que se materializam.",
    ["No drops come from Stagwings and Skystormers."] =
        "Stagwings e Skystormers não soltam nada.",
    ["Saves you some monster farming afterward."] =
        "Assim você mata menos monstros depois.",
    ["You need Chapter I as well as Chapter II."] =
        "Você precisa do Capítulo I e também do Capítulo II.",
    ["It doesn't show up often."] =
        "Ele não aparece com frequência.",
    ["The NPC waits on the house's upper-floor terrace."] =
        "O NPC espera no terraço do andar de cima da casa.",
    ["Take the road until the trail starts"] =
        "Siga a estrada até o começo da trilha",
    ["Circle the mountain on the trail, then climb it"] =
        "Contorne a montanha pela trilha, depois suba-a",
    ["Kill the crocodiles."] =
        "Mate os crocodilos.",
    ["Stay out of Swamp Talker's way."] =
        "Fique fora do caminho do Falastrão do Pantanal.",
    ["Hunt down the gray murloc; it is level 50."] =
        "Cace o murloc cinza; ele é de nível 50.",
    ["Tanaris and Dustwallow"] =
        "Tanaris e Pântano Vadeoso",
    ["Watch out for foes hidden in stealth."] =
        "Cuidado com inimigos furtivos.",
    ["Look for brown eggs covered in spikes."] =
        "Procure ovos marrons cobertos de espinhos.",
    ["Buy plenty of arrows or bullets."] =
        "Compre muitas flechas ou balas.",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "Abasteça-se antes: ninguém nas Terras Agrestes vende flechas ou balas de nível 40.",
    ["Take the road that circles the peak, then descend the trail"] =
        "Pegue a estrada que contorna o pico, depois desça a trilha",
    ["Flight master at Revantusk Village"] =
        "Mestre de voo da Aldeia Revatusco",
    ["A trio of enemies attacks."] =
        "Um trio de inimigos ataca.",
    ["Look for a little silver pail holding tools."] =
        "Procure um baldinho prateado com ferramentas.",
    ["The targets are big eagle-like beasts."] =
        "Os alvos são grandes feras parecidas com águias.",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "Lobos e ferujas também usam estes pontos de surgimento.",
    ["Look for crates made of wood."] =
        "Procure caixotes de madeira.",
    ["The targets are wolves hidden in stealth."] =
        "Os alvos são lobos furtivos.",
    ["Steer clear of hostile Alliance NPCs."] =
        "Fique longe dos NPCs hostis da Aliança.",
    ["Warning: this turns on your PvP flag."] =
        "Atenção: isto ativa sua marcação de JxJ.",
    ["Head into Shadra'Alor"] =
        "Entre em Shadra'Alor",
    ["Get out of Shadra'Alor"] =
        "Saia de Shadra'Alor",
    ["Feralas and Un'Goro"] =
        "Feralas e Un'Goro",
    ["The targets are hippogryphs."] =
        "Os alvos são hipogrifos.",
    ["Use it on the stone giant foes."] =
        "Use-o nos gigantes de pedra inimigos.",
    ["You have 2 hours before it disappears."] =
        "Você tem 2 horas antes que ele desapareça.",
    ["Watch out: this foe is a level 50 elite."] =
        "Cuidado: este inimigo é um elite de nível 50.",
    ["You can likely do it alone."] =
        "Você provavelmente consegue sozinho.",
    ["The NPC turns hostile and fights you."] =
        "O NPC fica hostil e luta com você.",
    ["The target yields at roughly 30% health."] =
        "O alvo se rende com cerca de 30% de vida.",
    ["The NPC roams the trail close to Kargath."] =
        "O NPC vaga pela trilha perto de Karrath.",
    ["The NPC gives the quest only while at this spot."] =
        "O NPC só dá a missão quando está neste ponto.",
    ["If the NPC is away, stay until he comes back."] =
        "Se o NPC não estiver aqui, espere até ele voltar.",
    ["Burning Steppes and Azshara"] =
        "Estepes Ardentes e Azshara",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "Atravesse a Montanha Rocha Negra até as Estepes Ardentes",
    ["Fly to Flame Crest"] =
        "Voe até o Monte Candente",
    ["It lies atop a stone slab."] =
        "Fica em cima de uma laje de pedra.",
    ["The following quest needs you at level 52."] =
        "A missão seguinte exige nível 52.",
    ["Ammunition can't be bought here."] =
        "Não dá para comprar munição aqui.",
    ["Flight master at Valormok"] =
        "Mestre de voo de Valormok",
    ["Look for a rectangular slab etched with green glyphs."] =
        "Procure uma laje retangular gravada com glifos verdes.",
    ["Look for an oblong slab carved with pink glyphs."] =
        "Procure uma laje alongada entalhada com glifos rosa.",
    ["A rectangular slab carved with blue glyphs."] =
        "Uma laje retangular entalhada com glifos azuis.",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "Procure uma laje de pedra entalhada com glifos dourados.",
    ["The NPC is in the tower, which has several floors."] =
        "O NPC fica na torre, que tem vários andares.",
    ["Felwood and Winterspring"] =
        "Selva Maleva e Hibérnia",
    ["Walk west beside the river"] =
        "Caminhe para oeste ao lado do rio",
    ["Fly to Bloodvenom Post"] =
        "Voe até o Posto Peçonha",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "Junto com as próximas entregas, isto leva você ao nível 53.",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "Guarde-o para uma tarefa na Cratera Un'Goro mais tarde.",
    ["Get onto the massive incline."] =
        "Suba na enorme encosta.",
    ["Watch out for elite foes here."] =
        "Cuidado com inimigos de elite aqui.",
    ["Flee afterward."] =
        "Depois, fuja.",
    ["More than one crystal might be required."] =
        "Talvez seja preciso mais de um cristal.",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "O alvo grita pela Maga Rimtori quando fica muito ferido.",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "Um felino verde, um Dente-de-sabre Corrompido, aparece quando você o usa.",
    ["Hold on until it begins to trail you."] =
        "Espere até ele começar a seguir você.",
    ["The kitten is the green cat beside you."] =
        "O gatinho é o felino verde ao seu lado.",
    ["Look beside Winna Hazzard."] =
        "Procure ao lado de Winna Perícon.",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "Cace uma tartaruga de elite de nível 48 com casco azul.",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "O NPC usa uma camisa clara e carrega uma lamparina.",
    ["Elite human foes walk patrols here; stay clear."] =
        "Inimigos humanos de elite patrulham aqui; fique longe.",
    ["The NPC hides beneath the staircase."] =
        "O NPC se esconde embaixo da escadaria.",
    ["You can also take it out of your bank."] =
        "Você também pode pegá-lo no seu banco.",
    ["The target is a ghoul armed with a hayfork."] =
        "O alvo é um carniçal armado com um forcado.",
    ["It can appear at this spot."] =
        "Ele pode aparecer neste ponto.",
    ["One last lengthy stretch of monster farming."] =
        "Um último trecho longo matando monstros.",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "Guarde-o; uma tarefa na Cratera Un'Goro vai precisar dele depois.",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "Chega-se a Dalaran pelo portal dos skyborne.",
    ["Take the Skyborne portal to Stormwind"] =
        "Pegue o portal dos skyborne para Ventobravo",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "Saco de dormir aconchegante",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "Uma trilha de pistas nos dois continentes, a partir do nível 14, que termina num saco de dormir que vale até 3% a mais de experiência: sem combates, só objetos para clicar.",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "Cerro Oeste, a oeste do Morro da Sentinela: os restos queimados ao lado da carroça destruída.",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "Sertões, à beira da estrada ao sul do Acampamento Taurajo: os restos queimados ao pé da torre incendiada.",
    ["Horde land: stay clear of the guards."] =
        "Território da Horda: fique longe dos guardas.",
    ["Alliance land: stay clear of the guards."] =
        "Território da Aliança: fique longe dos guardas.",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "Bem ali: a próxima pista, nos restos ou na tábua pregada ao lado.",
    ["Path northeast of Sun Rock Retreat"] =
        "Trilha a nordeste do Retiro Rocha do Sol",
    ["The camp is up in the hills: follow this path west."] =
        "O acampamento fica no alto das colinas: siga esta trilha para oeste.",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "No fim da trilha, no acampamento abandonado: o saco de dormir sobre um caixote.",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "Opcional: a madeira e a isca desta recompensa reacendem a fogueira ao lado, uma pequena missão de que o saco não precisa.",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "Morro acima, ao norte do acampamento: um monte de terra fresca.",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "Loch Modan, no alto da represa: a estatueta de águia sobre as cabeças de pedra esculpidas voltadas para o Pantanal.",
    ["Cart against Thoradin's Wall"] =
        "Carroça junto à Muralha de Thoradin",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "Do lado do Contraforte de Eira dos Montes: suba na carroça e depois para dentro da muralha.",
    ["The messenger bag hangs on the outer face of the wall."] =
        "A bolsa de mensageiro fica pendurada na face externa da muralha.",
    ["The satchel just below it holds the sleeping bag."] =
        "A sacola logo abaixo guarda o saco de dormir.",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "Use-o ao ar livre e fique sobre ele sem se mexer: cada minuto de sono soma 1% de experiência, até 3%.",
    ["Try the sleeping bag"] =
        "Experimente o saco de dormir",
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "Saqueie as feras que você matar no caminho até aqui",
    ["Learn First Aid from the trainer"] =
        "Aprenda Primeiros Socorros com o instrutor",
    ["Learn Blacksmithing from the trainer"] =
        "Aprenda Ferraria com o instrutor",
    ["Learn Mining from the trainer"] =
        "Aprenda Mineração com o instrutor",
    ["Learn Cooking from the trainer"] =
        "Aprenda Culinária com o instrutor",
    ["Learn Herbalism from the trainer"] =
        "Aprenda Herborismo com o instrutor",
    ["Learn Thrown at the weapon master"] =
        "Aprenda Armas de Arremesso com o mestre de armas",
    ["Learn Staves at the weapon master"] =
        "Aprenda Báculos com o mestre de armas",
    ["Learn Swords at the weapon master"] =
        "Aprenda Espadas com o mestre de armas",
    ["Learn Maces at the weapon master"] =
        "Aprenda Maças com o mestre de armas",
    ["Learn Bows at the weapon master"] =
        "Aprenda Arcos com o mestre de armas",
    ["Learn Guns at the weapon master"] =
        "Aprenda Armas de Fogo com o mestre de armas",
    ["Learn Two-Handed Swords at the weapon master"] =
        "Aprenda Espadas de Duas Mãos com o mestre de armas",
    ["Learn Two-Handed Axes at the weapon master"] =
        "Aprenda Machados de Duas Mãos com o mestre de armas",
    ["Learn Two-Handed Maces at the weapon master"] =
        "Aprenda Maças de Duas Mãos com o mestre de armas",
    ["Learn Swords and Daggers at the weapon master"] =
        "Aprenda Espadas e Adagas com o mestre de armas",
    ["Learn Swords and Staves at the weapon master"] =
        "Aprenda Espadas e Báculos com o mestre de armas",
    ["Learn Bows and Staves at the weapon master"] =
        "Aprenda Arcos e Báculos com o mestre de armas",
    ["Learn Guns and Maces at the weapon master"] =
        "Aprenda Armas de Fogo e Maças com o mestre de armas",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "Aprenda Armas de Fogo e Machados de Duas Mãos com o mestre de armas",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "Aprenda Espadas de Duas Mãos e Báculos com o mestre de armas",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Aprenda Machados de Duas Mãos e Maças de Duas Mãos com o mestre de armas",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "Aprenda Maças de Duas Mãos e Báculos com o mestre de armas",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "Aprenda Bestas e Espadas de Duas Mãos com o mestre de armas",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Aprenda Armas de Fogo, Machados de Duas Mãos e Maças de Duas Mãos com o mestre de armas",
    ["Tame a pet here"] =
        "Dome um ajudante aqui",
    ["Tame a beast here to learn the next rank of Claw"] =
        "Dome uma fera aqui para aprender o próximo grau de Garra",
    ["Head to the big cage"] =
        "Vá até a jaula grande",
    ["Visit the caged quilboar"] =
        "Visite o javatusco enjaulado",
    ["Go to the corrupted moonwell"] =
        "Vá até o poço lunar corrompido",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "O objeto está lá dentro.",
    ["The object is indoors, one floor up."] =
        "O objeto está lá dentro, um andar acima.",
    ["The object is on the lower level, indoors."] =
        "O objeto está no nível de baixo, lá dentro.",
    ["The object is on the lower level within the bridge."] =
        "O objeto está no nível de baixo, dentro da ponte.",
    ["The object is on the highest level of this structure."] =
        "O objeto fica no nível mais alto desta construção.",
    ["The object is up on the summit."] =
        "O objeto está lá no topo.",
    ["The object sits on the rocky shelf above."] =
        "O objeto fica na saliência rochosa acima.",
    ["The target is indoors."] =
        "O alvo está lá dentro.",
    ["The target is indoors, one floor up."] =
        "O alvo está lá dentro, um andar acima.",
    ["The target is indoors at street level."] =
        "O alvo está lá dentro, no nível da rua.",
    ["The target is indoors, on the central storey."] =
        "O alvo está lá dentro, no andar do meio.",
    ["The target is on the lower level, indoors."] =
        "O alvo está no nível de baixo, lá dentro.",
    ["The target is on the tower's highest floor."] =
        "O alvo está no último andar da torre.",
    ["The target is up on the summit."] =
        "O alvo está lá no topo.",
    ["The target is down in the Cleft of Shadow."] =
        "O alvo fica lá embaixo, no Antro das Sombras.",
    ["The target can be indoors or out."] =
        "O alvo pode estar dentro ou fora.",
    ["The target patrols a long route; look along it."] =
        "O alvo patrulha uma rota longa; procure ao longo dela.",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "O alvo espera aqui e depois caminha até o grande galho próximo.",
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"A lenda de Galvão\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Alguém pediu um suco?\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Os irmãos Latafuso\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Uma bebida para poucos\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Caldo reconfortante de tartaruga\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Transferência\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Peças para Kravel\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Patrocínio goblínico\" e \"A chave oculta\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Capítulo I\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Capítulo II\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Capítulo III\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Capítulo IV\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"O naufrágio de Karnitol\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Análise mágica\" e \"Calça arriada!\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Rumores para Kravel\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Ongekan\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Tesouro submerso\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"De volta à Angra do Butim\" e \"Segurança em primeiro lugar\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Fale novamente com Mirrabolha\" e \"O Coquetel de Kalimdor do Rapsódico\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O empréstimo\", \"Espíritos guinchadores\", \"O super ovomático\" e \"O Coquetel de Kalimdor do Rapsódico\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Cristais de poder\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O caso do Rapsódico\", \"A Superinstantânea FX\", \"O grogue perdido do Aldo Isque\" e \"Protegidos de Eluna?\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Entrega para MacKinley\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"A isca para Lar'korwi\", \"Solo de Un'Goro\", \"Uma visita a Gregan\" e \"É segredo para todo mundo\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"A ascensão dos silitídeos\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"O gosto das chamas\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Procura-se A-Me 01\" e \"Runas arcanas\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Bondosa Bia\", \"Runas arcanas\" e \"O Ingrediente Secreto de Sguisha\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O círculo de pedra\", \"Ancientes aviltados\", \"Gosmologia\", \"Coruscantes Lunamarca\" e \"Encontro na sepultura\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Fale novamente com Timor\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Aquementas\", \"O relatório de Visteterna\", \"Duque Nicolau Zverenhoff\" e \"Espíritos atormentados de Kel'Theril\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Felnok Molaço\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Galho de carvalho com glifos\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Adeus aos ataques\" e \"Suprimentos para a Encruzilhada\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Barril Vazio do Chen\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Ovo tipo extra\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Lembrancinhas da morte\" e \"A batalha de Eira dos Montes\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Bocarragelo\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"O enxame se adensa\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Martek, o Exilado\" e \"Rosarães Guima\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Calça arriada!\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O escudo negro\" e \"Trabalho de campo\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Amostras de campo de Tanaris\" e \"Espíritos guinchadores\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"De volta à Angra do Butim\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Mortocharco\" e \"Segurança em primeiro lugar\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Mais uma mensagem para os Martelo Feroz\", \"Espíritos guinchadores\" e \"O super ovomático\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Fale novamente com Mandingueiro Uzer'i.\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"O exilado Atal'ai\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O teste do recipiente\" e \"Fale novamente com Mirrabolha\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Fale novamente com a Boticária Zilda\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O círculo de pedra\" e \"Cristais de poder\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Entrega de suco gami\", \"O grogue perdido do Aldo Isque\" e \"Corrupção líquida\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Sururu na selva\", \"A isca para Lar'korwi\" e \"É segredo para todo mundo\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Entrega para Magatha\" e \"Corrupção líquida\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"O pagamento de Sona'rima para Jediga\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Encontro na sepultura\": guarde-o no banco para liberar espaço nas bolsas.",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"Entrega para Andron Gante\", \"A sepultura\" e \"Traição\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "Você vai precisar deles mais tarde para \"O relatório de Visteterna\" e \"Duque Nicolau Zverenhoff\": guarde-os no banco para liberar espaço nas bolsas.",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "Você vai precisar dele mais tarde para \"Aquementas\": guarde-o no banco para liberar espaço nas bolsas.",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "Astranaar",
    ["Auberdine"] =
        "Auberdine",
    ["Bloodhoof Village"] =
        "Aldeia Casco Sangrento",
    ["Booty Bay"] =
        "Angra do Butim",
    ["Brill"] =
        "Montalvo",
    ["Camp Mojache"] =
        "Aldeia Mojache",
    ["Camp Taurajo"] =
        "Acampamento Taurajo",
    ["Cenarion Hold"] =
        "Forte Cenariano",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "Vila Sombria",
    ["Deepwater Tavern"] =
        "Porto de Menethil",
    ["Dolanaar"] =
        "Dolanaar",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "Visteterna",
    ["Feathermoon Stronghold"] =
        "Domínio de Plumaluna",
    ["Freewind Post"] =
        "Aldeia Vento Livre",
    ["Gadgetzan"] =
        "Geringontzan",
    ["Gallows' End Tavern"] =
        "Montalvo",
    ["Goldshire"] =
        "Vila d'Ouro",
    ["Grom'gol"] =
        "Grom'gol",
    ["Hammerfall"] =
        "Ruína do Martelo",
    ["Ironforge"] =
        "Altaforja",
    ["Kargath"] =
        "Karrath",
    ["Kharanos"] =
        "Kharanos",
    ["Lakeshire"] =
        "Vila Plácida",
    ["Light's Hope Chapel"] =
        "Capela Esperança da Luz",
    ["Menethil Harbor"] =
        "Porto de Menethil",
    ["Nijel's Point"] =
        "Posto do Nijel",
    ["Orgrimmar"] =
        "Orgrimmar",
    ["Ratchet"] =
        "Vila Catraca",
    ["Razor Hill"] =
        "Monte Navalha",
    ["Revantusk Village"] =
        "Aldeia Revatusco",
    ["Sentinel Hill"] =
        "Morro da Sentinela",
    ["Shadowprey Village"] =
        "Aldeia Pescassombra",
    ["Southshore"] =
        "Costa Sul",
    ["Splintertree Post"] =
        "Posto Machadada",
    ["Stonard"] =
        "Pedregal",
    ["Stonetalon Peak"] =
        "Morro das Torres de Pedra",
    ["Stormwind City"] =
        "Cidade de Ventobravo",
    ["Stoutlager Inn"] =
        "Thelsamar",
    ["Sun Rock Retreat"] =
        "Retiro Rocha do Sol",
    ["Tarren Mill"] =
        "Serraria Tarren",
    ["The Crossroads"] =
        "A Encruzilhada",
    ["The Sepulcher"] =
        "O Sepulcro",
    ["Thelsamar"] =
        "Thelsamar",
    ["Theramore"] =
        "Theramore",
    ["Theramore Isle"] =
        "Ilha de Theramore",
    ["Thunder Bluff"] =
        "Penhasco do Trovão",
    ["Thunderbrew Distillery"] =
        "Kharanos",
}
