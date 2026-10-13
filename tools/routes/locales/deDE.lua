-- German guide texts: [English text] = German text, one entry per phrase of the guides
-- (zone names of the titles, route intros, automatic notes, hand-written notes). tools/translate_guides.lua
-- writes Ding/Locales/Guides/deDE/ from it; a note joining several phrases is translated
-- phrase by phrase. Keys: the English texts of the routes (tools/routes/*.lua), the
-- automatic notes of tools/draft_guide.lua and Ding/Guides/NightElf/01_Shadowglen.lua.
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "Laubschattental",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "Beide Questgeber stehen direkt vor dir, am Fuß von Aldrassil.",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "Junge Nachtsäbler und Keiler rund um Aldrassil: Töte alles, was dir begegnet.",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "Tarindrella steht etwas südwestlich von Aldrassil (57.8, 45.2).",
    ["The class trainers are inside Aldrassil."] =
        "Die Klassenlehrer sind in Aldrassil.",
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "Für Gilshalan brauchst du Stufe 3: Sonst erinnert dich Ding! vor der Höhle daran.",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "Eine einzige Runde: räudige Nachtsäbler und Keiler im Norden, Moos von den Grells, Totems im Westen (54, 40).",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "Iverron wartet vor der Höhle im Norden (54.6, 33).",
    ["Spiders in the cave, right behind Iverron."] =
        "Spinnen in der Höhle, direkt hinter Iverron.",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "Githyiss the Vile, hinten in der Höhle (56.6, 26.3), kann einen Zahn fallen lassen: Benutze ihn aus deinen Taschen.",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "Zurück nach Aldrassil: Alles wird am selben Ort abgegeben.",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "Pilze von den Grells, Lilien nördlich von Aldrassil (57, 37), Sekret von den Spinnen, Ei hinten in der Höhle.",
    ["Iverron, still in front of the cave."] =
        "Iverron, immer noch vor der Höhle.",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "Tenaron ist ganz oben in Aldrassil: Folge der Rampe, die sich um den Stamm hinaufwindet.",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "Fülle die Phiole am Mondbrunnen im Nordosten (60, 33).",
    ["Porthannius, on the road out of Shadowglen."] =
        "Porthannius, an der Straße aus dem Laubschattental.",
    ["Head for Dolanaar"] =
        "Auf nach Dolanaar",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "Folge der Straße nach Süden zum Gasthaus: Beide offenen Quests gibst du in Dolanaar ab.",
    -- human
    ["Northshire"] =
        "Nordhain",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "Alles spielt sich um die Abtei von Nordhain ab: Folge dem Pfeil von NSC zu NSC.",
    ["Elwynn Forest"] =
        "Wald von Elwynn",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "Goldhain ist deine Basis für den ganzen Wald: Gasthaus, Klassenlehrer und Quests.",
    ["Westfall"] =
        "Westfall",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "Nimm die Straße von Goldhain nach Westen, dann zur Späherkuppe mitten in Westfall.",
    ["Loch Modan"] =
        "Loch Modan",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "Nimm die Tiefenbahn von Sturmwind nach Eisenschmiede, dann die Straße nach Osten durch Dun Morogh bis Thelsamar.",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "Eisklammtal",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "Alles beginnt im Eisklammtal: Folge dem Pfeil von NSC zu NSC.",
    ["Dun Morogh"] =
        "Dun Morogh",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "Verlasse das Tal durch den Tunnel im Nordosten: Kharanos ist deine Basis für Dun Morogh.",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "Nimm die Straße nach Osten durch den Tunnel am South Gate bis Thelsamar.",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "Tiefenbahn von Eisenschmiede nach Sturmwind, dann die Straße nach Westen über Goldhain zur Späherkuppe.",
    -- nightelf
    ["Teldrassil"] =
        "Teldrassil",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "Dolanaar ist deine Basis für Teldrassil: Gasthaus, Klassenlehrer und die meisten Quests.",
    ["Darkshore"] =
        "Dunkelküste",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "Rut'theran (Portal am Fuß von Darnassus), dann das Schiff nach Auberdine: deine Basis an der Dunkelküste.",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "Schiff von Auberdine zum Hafen von Menethil, dann die Straße nach Osten durch das Sumpfland bis Loch Modan: Thelsamar ist deine Basis.",
    -- alliance
    ["Redridge Mountains"] =
        "Rotkammgebirge",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "Das Rotkammgebirge liegt östlich des Waldes von Elwynn: Folge der Straße nach Osten bis Seenhain. Nachtelfen: Schiff von Auberdine nach Menethil, Eisenschmiede, dann die Bahn nach Sturmwind.",
    ["Duskwood"] =
        "Dämmerwald",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "Der Dämmerwald liegt südlich von Elwynn: Dunkelhain im Osten des Waldes ist deine Basis.",
    ["Wetlands"] =
        "Sumpfland",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "Das Sumpfland liegt nördlich von Loch Modan: Der Hafen von Menethil an der Westküste ist deine Basis.",
    ["Ashenvale"] =
        "Eschental",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "Schiff von Menethil nach Auberdine, dann die Straße nach Süden ins Eschental: Astranaar ist deine Basis.",
    ["Stonetalon Mountains"] =
        "Steinkrallengebirge",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "Das Steinkrallengebirge liegt westlich des Eschentals.",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "Zurück nach Astranaar für die letzten Quests im Eschental.",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "Zurück in den Dämmerwald für seine letzten Quests: Dunkelhain bleibt deine Basis.",
    ["Hillsbrad Foothills"] =
        "Vorgebirge des Hügellands",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "Von Menethil führt die Straße nach Norden über den Thandolübergang ins Vorgebirge: Süderstade ist deine Basis.",
    ["Thousand Needles"] =
        "Tausend Nadeln",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "Nach Tausend Nadeln über Theramore und das südliche Brachland oder über Feralas; das Goblinlager im Osten ist deine Basis.",
    ["Desolace"] =
        "Desolace",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "Desolace liegt südlich des Steinkrallengebirges: Die Basis der Allianz ist im Nordosten des Gebiets.",
    ["Stranglethorn Vale"] =
        "Schlingendorntal",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "Das Schlingendorntal liegt südlich des Dämmerwalds: Rebellenlager im Norden, Beutebucht im Süden.",
    ["Arathi Highlands"] =
        "Arathihochland",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "Das Arathihochland liegt nördlich des Sumpflands, hinter dem Thandolübergang.",
    ["Dustwallow Marsh"] =
        "Düstermarschen",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "Schiff von Menethil nach Theramore, der Basis der Allianz am Rand der Marschen.",
    ["Badlands"] =
        "Ödland",
    ["The Badlands are southeast of Loch Modan."] =
        "Das Ödland liegt südöstlich von Loch Modan.",
    ["Swamp of Sorrows"] =
        "Sümpfe des Elends",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "Die Sümpfe des Elends: östlich vom Gebirgspass der Totenwinde, südlich vom Rotkammgebirge.",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "Zurück ins Schlingendorntal für seine letzten Quests, ab Beutebucht.",
    ["Tanaris"] =
        "Tanaris",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "Gadgetzan im Norden von Tanaris ist deine Basis. Schiff von Beutebucht nach Ratschet oder Flug ab Theramore.",
    ["Feralas"] =
        "Feralas",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "Die Festung der Allianz in Feralas liegt auf einer Insel im Westen des Gebiets.",
    ["The Hinterlands"] =
        "Hinterland",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "Das Hinterland liegt nordöstlich des Vorgebirges des Hügellands: Der Nistgipfel der Wildhammerzwerge ist im Westen.",
    ["Searing Gorge"] =
        "Sengende Schlucht",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "Die Sengende Schlucht liegt südlich von Loch Modan, über das Ödland.",
    ["Blasted Lands"] =
        "Verwüstete Lande",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "Flieg in die Verwüsteten Lande, südlich der Sümpfe des Elends: Die Festung der Allianz im Norden des Gebiets ist deine Basis.",
    ["Un'Goro Crater"] =
        "Krater von Un'Goro",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "Der Krater von Un'Goro liegt südwestlich von Tanaris: Nimm ab Gadgetzan die Rampe hinunter.",
    ["Azshara"] =
        "Azshara",
    ["Azshara is east of Ashenvale."] =
        "Azshara liegt östlich des Eschentals.",
    ["Felwood"] =
        "Teufelswald",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "Der Teufelswald liegt nördlich des Eschentals: Die Basis der Allianz ist im Süden des Gebiets.",
    ["Burning Steppes"] =
        "Brennende Steppe",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "Die Brennende Steppe liegt nördlich des Rotkammgebirges: Das Lager der Allianz ist im Osten des Gebiets.",
    ["Winterspring"] =
        "Winterquell",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "Winterquell liegt nordöstlich des Teufelswalds: Die Ewige Warte ist deine Basis.",
    ["Western Plaguelands"] =
        "Westliche Pestländer",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "Die Westlichen Pestländer liegen nördlich des Vorgebirges des Hügellands: Das Lager der Allianz ist im Süden des Gebiets.",
    ["Eastern Plaguelands"] =
        "Östliche Pestländer",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "Die Östlichen Pestländer schließen östlich an die Westlichen an: Die Kapelle des Hoffnungsvollen Lichts liegt im Osten.",
    ["Silithus"] =
        "Silithus",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "Silithus liegt südlich des Kraters von Un'Goro: Burg Cenarius ist im Norden des Gebiets.",
    -- orc_troll
    ["Valley of Trials"] =
        "Tal der Prüfungen",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "Alles spielt sich im Tal der Prüfungen ab: Folge dem Pfeil von NSC zu NSC.",
    ["Durotar"] =
        "Durotar",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "Verlasse das Tal über die Straße nach Osten, dann nach Norden zum Klingenhügel: deine Basis für Durotar.",
    ["The Barrens"] =
        "Brachland",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "Überquere die Brücke westlich vom Klingenhügel ins Brachland, dann folge der Straße zum Wegekreuz: deine Basis.",
    -- tauren
    ["Camp Narache"] =
        "Camp Narache",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "Alles beginnt im Camp Narache: Folge dem Pfeil von NSC zu NSC.",
    ["Mulgore"] =
        "Mulgore",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "Folge der Straße vom Camp Narache nach Norden zum Dorf der Bluthufe: deine Basis für Mulgore.",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "Verlasse Mulgore über die Straße nach Osten ins Brachland, dann nach Norden zum Wegekreuz: deine Basis.",
    -- undead
    ["Deathknell"] =
        "Todesend",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "Alles beginnt in Todesend: Folge dem Pfeil von NSC zu NSC.",
    ["Tirisfal Glades"] =
        "Tirisfal",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "Verlasse Todesend über die Straße nach Osten bis Brill: deine Basis für Tirisfal.",
    ["Silverpine Forest"] =
        "Silberwald",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "Nimm ab Brill die Straße nach Westen, dann nach Süden über die Brücke in den Silberwald: Das Grabmal ist deine Basis.",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "Zeppelin von den Türmen vor Unterstadt nach Orgrimmar, dann die Straße nach Westen und Süden zum Wegekreuz: deine Basis im Brachland.",
    -- horde
    ["The Barrens and Stonetalon"] =
        "Brachland und Steinkrallengebirge",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "Das Wegekreuz mitten im Brachland ist deine Basis; das Steinkrallengebirge liegt westlich des Brachlands.",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "Das Eschental liegt nördlich des Brachlands: Der Splitterholzposten im Osten des Waldes ist deine Basis.",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "Zeppelin vom Turm vor Orgrimmar nach Unterstadt, dann die Straße nach Süden durch den Silberwald bis Tarrens Mühle: deine Basis.",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "Zeppelin zurück nach Orgrimmar für die höheren Quests im Brachland und im Steinkrallengebirge.",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "Tausend Nadeln liegt südlich des Brachlands, unten am Great Lift: Der Freiwindposten ist deine Basis.",
    ["Hillsbrad, Alterac and Arathi"] =
        "Hügelland, Alterac und Arathi",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "Zeppelin nach Unterstadt, dann wieder Tarrens Mühle; das Alteracgebirge liegt nördlich des Vorgebirges, das Arathihochland östlich, mit Hammerfall im Osten des Hochlands.",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "Desolace liegt südlich des Steinkrallengebirges: Das Dorf der Horde ist an der Westküste.",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "Zeppelin von Orgrimmar nach Grom'gol, dem Lager der Horde im Norden des Schlingendorntals.",
    ["Dustwallow and Thousand Needles"] =
        "Düstermarschen und Tausend Nadeln",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "Zeppelin zurück nach Orgrimmar. Die Düstermarschen liegen östlich des südlichen Brachlands, mit Brackenwall Village im Norden der Marschen; die Schimmernde Ebene ist im Osten von Tausend Nadeln.",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "Zurück ins Arathihochland: Hammerfall liegt im Osten des Gebiets.",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "Flieg von Hammerfall nach Kargath im Westen des Ödlands.",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "Zurück ins Schlingendorntal für seine letzten Quests, ab Grom'gol und Beutebucht.",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "Sümpfe des Elends, östlich vom Gebirgspass der Totenwinde: Steinard ist deine Basis.",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "Feralas liegt westlich von Tausend Nadeln: Camp Mojache im Osten des Gebiets ist deine Basis.",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "Gadgetzan im Norden von Tanaris ist deine Basis: die Straße nach Süden durch Tausend Nadeln oder das Schiff von Beutebucht nach Ratschet.",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "Das Hinterland liegt östlich des Vorgebirges des Hügellands: Das Trolldorf der Revantusk ist an der Ostküste.",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "Die Sengende Schlucht liegt südlich des Ödlands: Flug nach Kargath, dann die Straße nach Süden. Die Brennende Steppe liegt südlich der Schlucht.",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "Azshara liegt östlich des Eschentals: Valormok im Südwesten des Gebiets ist deine Basis.",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "Der Teufelswald liegt nördlich des Eschentals: Der Posten der Horde ist im Westen des Gebiets.",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "Die Westlichen Pestländer liegen östlich von Tirisfal: Das Bollwerk bewacht die Grenze, östlich von Brill.",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "Startgegenstand erbeutet? Benutze ihn aus deinen Taschen.",
    ["Human"] =
        "Mensch",
    ["Dwarf and Gnome"] =
        "Zwerg und Gnom",
    ["Night Elf"] =
        "Nachtelf",
    ["Orc and Troll"] =
        "Orc und Troll",
    ["Tauren"] =
        "Tauren",
    ["Undead"] =
        "Untoter",
    ["Alliance"] =
        "Allianz",
    ["Horde"] =
        "Horde",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "Ab hier wechselt der Guide selbst zwischen den Gebieten: Der erste Schritt in einem Gebiet sagt, wie du dorthin kommst.",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "Abkürzung: Lass dich von Monstern töten, lass deinen Geist frei und lass dich vom Geistheiler wiederbeleben, dann geht es weiter.",
    ["Finish the level on nearby monsters before moving on."] =
        "Beende die Stufe an nahen Monstern, bevor du weiterziehst.",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "Start: Mensch",
    ["Night Elf start"] =
        "Start: Nachtelf",
    ["Tauren start"] =
        "Start: Tauren",
    ["Undead start"] =
        "Start: Untoter",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Start: Skyborne",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "Alles beginnt auf der Insel Zephras: Folge dem Pfeil von NSC zu NSC.",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "Wald von Elwynn: Abtei von Nordhain, wo jeder Mensch beginnt.",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "Dun Morogh: Eisklammtal, wo Zwerge und Gnome beginnen.",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "Teldrassil: Laubschattental, wo Nachtelfen beginnen.",
    ["Travel to Westfall"] =
        "Reise nach Westfall",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "Westfall: Die Späherkuppe in der Mitte des Gebiets ist die Basis. Der erste Halt ist der Hof im Norden.",
    ["Travel to Auberdine"] =
        "Reise nach Auberdine",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "Dunkelküste: Auberdine, der Hafen an der Westküste.",
    ["Travel to Thelsamar"] =
        "Reise nach Thelsamar",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "Loch Modan: Thelsamar, an der Straße im Westen des Gebiets.",
    ["Travel to Redridge Mountains"] =
        "Reise ins Rotkammgebirge",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "Rotkammgebirge: Seenhain am See ist die Basis. Der erste Halt ist der westliche Pass vom Wald von Elwynn.",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "Eschental: Maestras Posten im Westen, dann Astranaar in der Mitte des Gebiets.",
    ["Travel to Menethil Harbor"] =
        "Reise zum Hafen von Menethil",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "Sumpfland: Hafen von Menethil, an der Westküste.",
    ["Travel to Darkshire"] =
        "Reise nach Dunkelhain",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "Dämmerwald: Dunkelhain, im Osten des Gebiets.",
    ["Travel to Stonetalon Peak"] =
        "Reise zum Steinkrallengipfel",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "Steinkrallengebirge: Steinkrallengipfel, im äußersten Norden des Gebiets.",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "Zuerst Sturmwind, dann der Dämmerwald und das Schlingendorntal.",
    ["Travel to Southshore"] =
        "Reise nach Süderstade",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "Vorgebirge des Hügellands: Süderstade, an der Küste im Süden.",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "Düstermarschen: Insel Theramore, vor der Ostküste.",
    ["Travel to Booty Bay"] =
        "Reise nach Beutebucht",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "Schlingendorntal: Beutebucht, an der Südspitze. Dort legt das Schiff aus Ratschet an.",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "Desolace: Die Nijelspitze in der Nordostecke ist die Basis der Allianz.",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "Schlingendorntal: Beutebucht, an der Südspitze.",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "Zuerst Sturmwind, dann die Sümpfe des Elends.",
    ["Travel to Refuge Pointe"] =
        "Reise zur Zuflucht",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "Arathihochland: Zuflucht, in der Mitte des Gebiets.",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "Zuerst Sturmwind, dann die Düstermarschen: Insel Theramore.",
    ["Travel to Nijel's Point"] =
        "Reise zur Nijelspitze",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "Desolace: Nijelspitze, in der Nordostecke.",
    ["Ironforge first, then the Badlands."] =
        "Zuerst Eisenschmiede, dann das Ödland.",
    ["Travel to Stormwind"] =
        "Reise nach Sturmwind",
    ["Stormwind first, then Stranglethorn Vale."] =
        "Zuerst Sturmwind, dann das Schlingendorntal.",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "Dämmerwald: zuerst Dunkelhain, dann die Sümpfe des Elends.",
    ["Travel to Gadgetzan"] =
        "Reise nach Gadgetzan",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "Tanaris: Gadgetzan, im Norden des Gebiets.",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "Tanaris: zuerst Gadgetzan, dann Feralas: Mondfederfeste.",
    ["Travel to Aerie Peak"] =
        "Reise zum Nistgipfel",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "Hinterland: Nistgipfel, im Westen des Gebiets.",
    ["Travel to Un'Goro Crater"] =
        "Reise in den Krater von Un'Goro",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "Krater von Un'Goro: Marschalls Zuflucht im Norden ist die Basis. Der erste Halt ist im Südosten.",
    ["Travel to Thorium Point"] =
        "Reise zur Thoriumspitze",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "Sengende Schlucht: Thoriumspitze, im Nordwesten des Gebiets.",
    ["Travel to Nethergarde Keep"] =
        "Reise zur Burg Nethergarde",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "Verwüstete Lande: Burg Nethergarde im Nordosten, dann die Brennende Steppe.",
    ["Travel to Chillwind Camp"] =
        "Reise zum Lager Kühlwind",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "Westliche Pestländer: Lager Kühlwind, im Süden des Gebiets.",
    ["Travel to Rut'theran Village"] =
        "Reise nach Rut'theran",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "Teldrassil: zuerst Rut'theran, dann Azshara und der Teufelswald.",
    ["Travel to Feathermoon Stronghold"] =
        "Reise zur Mondfederfeste",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "Feralas: Mondfederfeste, auf der Insel vor der Westküste.",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "Tanaris: zuerst Gadgetzan, dann der Krater von Un'Goro.",
    ["Travel to Emerald Sanctuary"] =
        "Reise zum Smaragdrefugium",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "Teufelswald: Smaragdrefugium, im Süden des Gebiets.",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "Zuerst Eisenschmiede, dann die Brennende Steppe: Morgans Wacht, im Osten.",
    ["Travel to Ironforge"] =
        "Reise nach Eisenschmiede",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "Zuerst Eisenschmiede, dann die Pestländer: Lager Kühlwind und Kapelle des Hoffnungsvollen Lichts.",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "Winterquell: Ewige Warte, in der Mitte des Gebiets.",
    ["Travel to Silithus"] =
        "Reise nach Silithus",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "Silithus: Valors Ruh im Nordosten, dann Burg Cenarius.",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "Tirisfal: Todesend, wo sich die Untoten erheben.",
    ["Mulgore: Camp Narache, where tauren start."] =
        "Mulgore: Camp Narache, wo Tauren beginnen.",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "Durotar: Tal der Prüfungen, wo Orcs und Trolle beginnen.",
    ["Travel to Silverpine Forest"] =
        "Reise in den Silberwald",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "Silberwald: Das Grabmal in der Mitte ist die Basis. Der erste Halt ist an der Straße im Norden.",
    ["Travel to Razor Hill"] =
        "Reise zum Klingenhügel",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "Durotar: zuerst der Klingenhügel, dann das Brachland: das Wegekreuz und das Steinkrallengebirge.",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "Eschental: Splitterholzposten, im Osten des Gebiets. Der Weg hinein führt durch den Tunnel vom Steinkrallengebirge.",
    ["Travel to the Undercity"] =
        "Reise nach Unterstadt",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "Zuerst Unterstadt, dann das Vorgebirge des Hügellands: Tarrens Mühle.",
    ["Thunder Bluff first, then the Barrens."] =
        "Zuerst Donnerfels, dann das Brachland.",
    ["Travel to Sun Rock Retreat"] =
        "Reise zum Sonnenfels",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "Steinkrallengebirge: Sonnenfels, in der Mitte des Gebiets.",
    ["Travel to the Crossroads"] =
        "Reise zum Wegekreuz",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "Brachland: zuerst das Wegekreuz, dann das Eschental: Splitterholzposten.",
    ["Travel to Camp Taurajo"] =
        "Reise ins Camp Taurajo",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "Brachland: zuerst Camp Taurajo, dann Tausend Nadeln: Freiwindposten.",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "Arathihochland: Hammerfall, im Osten des Gebiets.",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "Tausend Nadeln: Freiwindposten, auf den Tafelbergen in der Mitte des Gebiets.",
    ["Travel to Desolace"] =
        "Reise nach Desolace",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "Desolace: Der Geistwandlerposten in der Mitte des Gebiets ist die Basis.",
    ["Travel to Grom'gol Base Camp"] =
        "Reise zum Basislager von Grom'gol",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "Schlingendorntal: Basislager von Grom'gol, an der Westküste. Dort landet der Zeppelin aus Orgrimmar.",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "Zuerst Orgrimmar, dann die Düstermarschen: Brackenwall Village.",
    ["Travel to Tarren Mill"] =
        "Reise nach Tarrens Mühle",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "Vorgebirge des Hügellands: zuerst Tarrens Mühle, dann das Alteracgebirge und das Arathihochland.",
    ["Travel to the Badlands"] =
        "Reise ins Ödland",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "Ödland: Kargath am Westrand ist die Basis der Horde.",
    ["Travel to Ratchet"] =
        "Reise nach Ratschet",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "Brachland: zuerst Ratschet, dann das Schlingendorntal und die Sümpfe des Elends: Steinard.",
    ["Travel to Shadowprey Village"] =
        "Reise nach Shadowprey Village",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "Desolace: Shadowprey Village, an der Westküste.",
    ["Travel to Brackenwall Village"] =
        "Reise nach Brackenwall Village",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "Düstermarschen: Brackenwall Village, im Nordwesten des Gebiets.",
    ["Travel to Camp Mojache"] =
        "Reise ins Camp Mojache",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "Feralas: Camp Mojache, im Osten des Gebiets.",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "Schlingendorntal: Basislager von Grom'gol, an der Westküste.",
    ["Travel to the Swamp of Sorrows"] =
        "Reise in die Sümpfe des Elends",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "Sümpfe des Elends: Steinard in der Mitte des Gebiets ist die Basis.",
    ["Travel to the Shimmering Flats"] =
        "Reise zur Schimmernden Ebene",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "Tausend Nadeln: zuerst die Schimmernde Ebene, dann Tanaris und die Düstermarschen.",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "Zuerst Unterstadt, dann das Hinterland: Dorf der Revantusk.",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "Feralas: zuerst Camp Mojache, dann der Krater von Un'Goro.",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "Schlingendorntal: zuerst Beutebucht, dann die Sümpfe des Elends.",
    ["Travel to the Blasted Lands"] =
        "Reise in die Verwüsteten Lande",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "Verwüstete Lande: Der erste Halt ist am nördlichen Eingang, bei den Sümpfen des Elends.",
    ["Travel to Kargath"] =
        "Reise nach Kargath",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "Ödland: zuerst Kargath am Westrand, dann die Sengende Schlucht.",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "Brennende Steppe: Flammenkamm, im Osten. Der Weg hinein führt durch den Schwarzfels.",
    ["Travel to Valormok"] =
        "Reise nach Valormok",
    ["Azshara: Valormok, in the west of the zone."] =
        "Azshara: Valormok, im Westen des Gebiets.",
    ["Travel to Bloodvenom Post"] =
        "Reise zum Blutgiftposten",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "Teufelswald: Blutgiftposten, im Westen des Gebiets.",
    ["Undercity first, then the Plaguelands."] =
        "Zuerst Unterstadt, dann die Pestländer.",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "Das schafft Platz in deinen Taschen.",
    ["You receive one further along the route."] =
        "Weiter auf der Route bekommst du eins.",
    ["Pick up anything that sells for 10 copper or more."] =
        "Heb alles auf, was sich für 10 Kupfer oder mehr verkaufen lässt.",
    ["You'll level faster with this."] =
        "Damit levelst du schneller.",
    ["The NPC is outdoors, right beside the structure."] =
        "Der NPC ist draußen, direkt neben dem Gebäude.",
    ["Skip the foes and dash into the tent."] =
        "Lass die Gegner aus und renn ins Zelt.",
    ["Foes cannot strike you from there."] =
        "Dort können dich die Gegner nicht treffen.",
    ["Widen the camera view."] =
        "Zieh die Kamera weiter heraus.",
    ["Recall to your bind point in Northshire Valley"] =
        "Benutze den Ruhestein, um nach Nordhain zurückzukehren",
    ["The NPC is indoors."] =
        "Der NPC ist drinnen.",
    ["The NPC is indoors at street level."] =
        "Der NPC ist drinnen, auf Straßenhöhe.",
    ["The quest giver stands outdoors, not indoors."] =
        "Der Questgeber steht draußen, nicht drinnen.",
    ["With the coming hand-ins, this brings you to level 4."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 4.",
    ["The NPC is indoors, on the central storey."] =
        "Der NPC ist drinnen, im mittleren Stockwerk.",
    ["The objective is underground, in the mine shaft."] =
        "Das Ziel ist unter der Erde, im Minenschacht.",
    ["The targets roam the mine and the area around it."] =
        "Die Ziele streifen durch die Mine und ihre Umgebung.",
    ["Exit the mine shaft"] =
        "Verlass den Minenschacht",
    ["The quest giver stands outdoors at the back of the building."] =
        "Der Questgeber steht draußen hinter dem Gebäude.",
    ["The NPC is out back, at the rear of the structure."] =
        "Der NPC ist draußen auf der Rückseite des Gebäudes.",
    ["The NPC stands by the horse stalls."] =
        "Der NPC steht bei den Pferdeboxen.",
    ["Look for wooden pails."] =
        "Such nach Holzeimern.",
    ["Leave it out if other players crowd the area."] =
        "Lass es aus, wenn sich dort viele andere Spieler drängen.",
    ["With the coming hand-ins, this gets you to level 6."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 6.",
    ["Climb to the highest floor of the building."] =
        "Steig ins oberste Stockwerk des Gebäudes.",
    ["The NPC waits on the lower level, indoors."] =
        "Der NPC wartet drinnen auf der unteren Ebene.",
    ["The NPC is indoors, one floor up."] =
        "Der NPC ist drinnen, ein Stockwerk höher.",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "Heile Wache Roberts mit Geringes Heilen (Rang 2).",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "Wirke Machtwort: Seelenstärke auf Wache Roberts.",
    ["Do it only if you can."] =
        "Mach das nur, wenn du kannst.",
    ["Go into the mine"] =
        "Geh in die Mine",
    ["Stay on the trail through the mine"] =
        "Bleib auf dem Weg durch die Mine",
    ["This one roams, so scan the surrounding area."] =
        "Dieses Ziel wandert umher, also such die Umgebung ab.",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 8.",
    ["Die on purpose at this spot"] =
        "Stirb an dieser Stelle absichtlich",
    ["Die to the monsters here on purpose."] =
        "Lass dich hier absichtlich von den Monstern töten.",
    ["Dying costs you nothing this early."] =
        "So früh kostet dich der Tod nichts.",
    ["This is the quickest way over."] =
        "Das ist der schnellste Weg hinüber.",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "Lass dich töten, dann lass dich vom Geistheiler wiederbeleben",
    ["Look for little stacks of brown wood."] =
        "Such nach kleinen Stapeln aus braunem Holz.",
    ["Look around tree trunks at ground level."] =
        "Such am Boden rund um die Baumstämme.",
    ["The targets are wolves."] =
        "Die Ziele sind Wölfe.",
    ["The following step may be hard."] =
        "Der nächste Schritt kann schwer sein.",
    ["One extra level makes it easier."] =
        "Eine Stufe mehr macht es leichter.",
    ["With the coming turn-ins, this gets you to level 10."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 10.",
    ["The NPC waits outside, at the building's front."] =
        "Der NPC wartet draußen vor dem Gebäude.",
    ["Fly to Lakeshire"] =
        "Flieg nach Seenhain",
    ["Stay on the road and watch for danger."] =
        "Bleib auf der Straße und achte auf Gefahren.",
    ["Foes in this area outlevel you."] =
        "Die Gegner in dieser Gegend haben eine höhere Stufe als du.",
    ["Let the conversation play out."] =
        "Lass das Gespräch zu Ende laufen.",
    ["Your targets here are gnolls."] =
        "Deine Ziele hier sind Gnolle.",
    ["Fly to Sentinel Hill"] =
        "Flieg zur Späherkuppe",
    ["Fly to Stormwind City"] =
        "Flieg nach Sturmwind",
    ["Head indoors"] =
        "Geh hinein",
    ["Step onto the pink rune."] =
        "Stell dich auf die rosa Rune.",
    ["Look within the tomb."] =
        "Such im Grabmal.",
    ["The NPC stands one level over the crypt."] =
        "Der NPC steht eine Ebene über der Krypta.",
    ["Be ready for a fight right away."] =
        "Mach dich sofort auf einen Kampf gefasst.",
    ["The NPC waits indoors, a floor above the entrance."] =
        "Der NPC wartet drinnen, ein Stockwerk über dem Eingang.",
    ["Head down into the Deeprun Tram station"] =
        "Geh hinunter in die Station der Tiefenbahn",
    ["Pass through the portal to teleport."] =
        "Geh durch das Portal, um dich zu teleportieren.",
    ["Take the Deeprun Tram over to Ironforge."] =
        "Nimm die Tiefenbahn nach Eisenschmiede.",
    ["The NPC stands by the wall on the central platform."] =
        "Der NPC steht an der Wand auf dem mittleren Bahnsteig.",
    ["Target the Deeprun Rats with the item."] =
        "Benutze den Gegenstand an den Tiefenbahnratten.",
    ["Look for little gray rodents."] =
        "Such nach kleinen grauen Nagern.",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "Geh zum Bahnsteig der Tiefenbahn auf der Seite von Eisenschmiede.",
    ["Fly to Ironforge"] =
        "Flieg nach Eisenschmiede",
    ["Stay on the trail"] =
        "Bleib auf dem Weg",
    ["Steer clear of the elite yeti patrolling close by."] =
        "Halt dich vom Eliteyeti fern, der in der Nähe patrouilliert.",
    ["The NPC is up on the summit."] =
        "Der NPC ist oben auf dem Gipfel.",
    ["Let the elite yeti stroll off before you go near."] =
        "Lass den Eliteyeti weiterziehen, bevor du dich näherst.",
    ["Your objective lies in a little cavern."] =
        "Dein Ziel liegt in einer kleinen Höhle.",
    ["Go quickly, time is short."] =
        "Beeil dich, die Zeit ist knapp.",
    ["Go into the cavern"] =
        "Geh in die Höhle",
    ["Head to the lower level of the cavern."] =
        "Geh auf die untere Ebene der Höhle.",
    ["Targets are in the cavern and around its entrance too."] =
        "Ziele gibt es in der Höhle und auch rund um ihren Eingang.",
    ["Head out of the cave"] =
        "Verlass die Höhle",
    ["Climb the trail"] =
        "Steig den Weg hinauf",
    ["Once in the Wetlands, head north."] =
        "Sobald du im Sumpfland bist, geh nach Norden.",
    ["Leap down from the ledge."] =
        "Spring vom Felsvorsprung hinunter.",
    ["This makes Menethil Harbor quicker to get to."] =
        "So erreichst du den Hafen von Menethil schneller.",
    ["Keep climbing the trail"] =
        "Steig weiter den Weg hinauf",
    ["Take the trail downhill"] =
        "Nimm den Weg bergab",
    ["Fly to Menethil Harbor"] =
        "Flieg zum Hafen von Menethil",
    ["Your targets are within the cavern."] =
        "Deine Ziele sind in der Höhle.",
    ["Without this, one quest can't be picked up."] =
        "Ohne das kannst du eine Quest nicht annehmen.",
    ["The NPC is past the tunnel; stay on the road."] =
        "Der NPC ist hinter dem Tunnel; bleib auf der Straße.",
    ["The target is a pale bear."] =
        "Das Ziel ist ein heller Bär.",
    ["Cross the tunnel to reach the NPC."] =
        "Geh durch den Tunnel, um den NPC zu erreichen.",
    ["Fly to Thelsamar"] =
        "Flieg nach Thelsamar",
    ["The NPC patrols a long route; look along it."] =
        "Der NPC patrouilliert eine lange Route; such entlang dieser Route.",
    ["The targets are rat-like humanoids."] =
        "Die Ziele sind rattenartige Humanoide.",
    ["Hunt spiders for it."] =
        "Jag dafür Spinnen.",
    ["Take the road to where the trail starts"] =
        "Folge der Straße bis zum Anfang des Wegs",
    ["A class quest coming up requires this."] =
        "Eine kommende Klassenquest braucht das.",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "Verlass Stonesplinter Valley, dann bleib auf der Straße",
    ["The NPC waits on the tower's highest floor."] =
        "Der NPC wartet im obersten Stockwerk des Turms.",
    ["Head up the incline"] =
        "Geh den Hang hinauf",
    ["Dwarf and Gnome start"] =
        "Start: Zwerg und Gnom",
    ["Step back outside"] =
        "Geh wieder hinaus",
    ["They are rare and scattered widely."] =
        "Sie sind selten und weit verstreut.",
    ["Pass through the tunnel, then stay on the road"] =
        "Geh durch den Tunnel, dann bleib auf der Straße",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "Heile Gebirgsjäger Dolf mit Geringes Heilen (Rang 2).",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "Wirke Machtwort: Seelenstärke auf Gebirgsjäger Dolf.",
    ["The quest wants yetis; seek them out."] =
        "Die Quest verlangt Yetis; such sie auf.",
    ["Look for the timber baskets."] =
        "Such nach den Holzkörben.",
    ["Any spot around Brewnall Village works."] =
        "Jede Stelle rund um Brewnall Village geht.",
    ["Give it a few seconds."] =
        "Warte ein paar Sekunden.",
    ["Target one Large Crag Boar with it."] =
        "Benutze es an einem Large Crag Boar.",
    ["Use it on any Snow Leopard."] =
        "Benutze es an einem beliebigen Schneeleoparden.",
    ["Target any Ice Claw Bear with the item."] =
        "Benutze den Gegenstand an einem beliebigen Eisklauenbären.",
    ["Keep it as pet food for later."] =
        "Behalte es als Futter für dein Tier.",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "Such einen Eisklauenbären und wirke Wildtier zähmen auf ihn.",
    ["Push eastward if you still need more."] =
        "Geh weiter nach Osten, wenn du noch mehr brauchst.",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "Behalte es: Eine kommende Paladinaufgabe braucht es.",
    ["Keep to the road as it crosses the underground passages."] =
        "Bleib auf der Straße, während sie durch die unterirdischen Gänge führt.",
    ["The NPC can be indoors or out."] =
        "Der NPC kann drinnen oder draußen sein.",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "Nimm die Tiefenbahn nach Sturmwind.",
    ["Flight master in Stormwind"] =
        "Flugmeister in Sturmwind",
    ["The NPC roams a wide loop; look along it."] =
        "Der NPC zieht eine große Runde; such entlang dieser Runde.",
    ["You likely gathered 10 Linen Cloth already."] =
        "Du hast wahrscheinlich schon 10 Leinenstoff gesammelt.",
    ["Narm Faulk lies dead; use the item on his body."] =
        "Narm Faulk liegt tot da; benutze den Gegenstand an seiner Leiche.",
    ["Wait for the talking to finish"] =
        "Warte, bis das Gespräch endet",
    ["Climb the big ramp"] =
        "Geh die große Rampe hinauf",
    ["The NPC stands high in the great tree."] =
        "Der NPC steht hoch oben im großen Baum.",
    ["The NPC stands in an adjoining chamber."] =
        "Der NPC steht in einem Nebenraum.",
    ["The targets are imps."] =
        "Die Ziele sind Wichtel.",
    ["Look for groups of pink fungi."] =
        "Such nach Gruppen von rosa Pilzen.",
    ["Mostly found beside tree trunks."] =
        "Meist neben Baumstämmen.",
    ["Look for big orange blossoms."] =
        "Such nach großen orangen Blüten.",
    ["Climb to the cave's upper level."] =
        "Steig auf die obere Ebene der Höhle.",
    ["The NPC stands at the summit of the great tree."] =
        "Der NPC steht ganz oben im großen Baum.",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "Heile Schildwache Shaya mit Geringes Heilen (Rang 2).",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "Wirke Machtwort: Seelenstärke auf Schildwache Shaya.",
    ["Pick up 5 Earthroot while questing."] =
        "Sammle beim Questen 5 Erdwurzeln.",
    ["A class quest further on requires this."] =
        "Eine spätere Klassenquest braucht das.",
    ["Look for brown clumps of roots."] =
        "Such nach braunen Wurzelbüscheln.",
    ["Kill black-furred tigers."] =
        "Töte Tiger mit schwarzem Fell.",
    ["The targets are spiders with green bodies."] =
        "Die Ziele sind Spinnen mit grünem Körper.",
    ["Look for little brown pinecones giving off green smoke."] =
        "Such nach kleinen braunen Tannenzapfen, die grünen Rauch abgeben.",
    ["The target is a satyr."] =
        "Das Ziel ist ein Satyr.",
    ["The targets are spread over several spots."] =
        "Die Ziele sind auf mehrere Stellen verteilt.",
    ["With the coming hand-ins, this gets you to level 9."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 9.",
    ["At this spot or a bit to the east."] =
        "An dieser Stelle oder etwas weiter östlich.",
    ["The NPC patrols the road; look along it."] =
        "Der NPC patrouilliert auf der Straße; such entlang der Straße.",
    ["For this quest you guard an NPC on the move."] =
        "Bei dieser Quest beschützt du einen NPC, der unterwegs ist.",
    ["If she is absent, wait for her to reappear."] =
        "Wenn sie nicht da ist, warte, bis sie wieder erscheint.",
    ["Move fast: the clock is ticking on this one."] =
        "Beeil dich: Bei dieser Quest läuft die Zeit.",
    ["Kill harpies."] =
        "Töte Harpyien.",
    ["Step into the cavern within the trunk"] =
        "Geh in die Höhle im Baumstamm",
    ["The spot is on the lower floor of the hollow tree."] =
        "Die Stelle ist auf der unteren Ebene des hohlen Baums.",
    ["Don't forget to train Pick Pocket."] =
        "Vergiss nicht, Taschendiebstahl zu lernen.",
    ["Keep it; an upcoming task asks for it."] =
        "Behalte es; eine kommende Aufgabe verlangt es.",
    ["Fly to Moonglade"] =
        "Flieg zur Mondlichtung",
    ["Target a Webwood Lurker with it."] =
        "Benutze es an einem Webwood Lurker.",
    ["Aim the item at any Nightsaber Stalker."] =
        "Benutze den Gegenstand an einem beliebigen Nightsaber Stalker.",
    ["The beasts are leopards with blue fur."] =
        "Die Tiere sind Leoparden mit blauem Fell.",
    ["Aim the item at one Strigid Screecher."] =
        "Benutze den Gegenstand an einem Strigid Screecher.",
    ["Target the owls here."] =
        "Nimm die Eulen hier ins Ziel.",
    ["You need to stand close to this spot."] =
        "Du musst nah an dieser Stelle stehen.",
    ["Go into the hollow tree's cavern"] =
        "Geh in die Höhle des hohlen Baums",
    ["The target is a big gray spider."] =
        "Das Ziel ist eine große graue Spinne.",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "Nimm Sethir the Ancient ins Ziel und benutze Taschendiebstahl.",
    ["The target is a violet satyr."] =
        "Das Ziel ist ein violetter Satyr.",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "Der NPC wartet hier und geht dann auf den großen Ast in der Nähe hinaus.",
    ["Fight the elementals of the swamp."] =
        "Bekämpfe die Elementare des Sumpfs.",
    ["Use Herbalism's Track Herbs to spot them."] =
        "Benutze Kräutersuche aus der Kräuterkunde, um sie zu finden.",
    ["Pick these up while questing around Teldrassil."] =
        "Sammle sie beim Questen auf Teldrassil.",
    ["Get your Herbalism skill to 15."] =
        "Bring deine Kräuterkunde auf Fertigkeit 15.",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 11.",
    ["Circle the mountain, then climb the trail"] =
        "Geh um den Berg herum, dann steig den Weg hinauf",
    ["The NPC stands on the highest level of this structure."] =
        "Der NPC steht auf der obersten Ebene dieses Gebäudes.",
    ["Flight master in Auberdine"] =
        "Flugmeister in Auberdine",
    ["Your pet will need this food shortly."] =
        "Dein Tier braucht dieses Futter bald.",
    ["Hunt the crabs."] =
        "Jag die Krabben.",
    ["You'll find extra ones swimming nearby as well."] =
        "Weitere schwimmen auch in der Nähe.",
    ["Use the item on any Rabid Thistle Bear."] =
        "Benutze den Gegenstand an einem beliebigen tollwütigen Distelbären.",
    ["The targets are bears with grey fur."] =
        "Die Ziele sind Bären mit grauem Fell.",
    ["Keep from damaging the creature."] =
        "Füg der Kreatur keinen Schaden zu.",
    ["Your targets sit below the water's surface."] =
        "Deine Ziele sind unter der Wasseroberfläche.",
    ["Avoid slaying the satyrs if you can."] =
        "Töte die Satyrn möglichst nicht.",
    ["You'll need this for the following quest."] =
        "Du brauchst das für die nächste Quest.",
    ["Hunt down satyrs."] =
        "Jag Satyrn.",
    ["Big birds that roam on foot."] =
        "Große Vögel, die zu Fuß umherlaufen.",
    ["Make your way to the Gates of Ironforge"] =
        "Geh zu den Toren von Eisenschmiede",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "Schwimm genau zu diesem Punkt, wähle dann im Spielmenü Support und fordere Hilfe für feststeckende Charaktere an.",
    ["Stay outdoors by this building."] =
        "Bleib draußen bei diesem Gebäude.",
    ["Pull the camera back for a wider view."] =
        "Zieh die Kamera zurück, um mehr zu sehen.",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "Dreh die Ansicht, bis Furlbrows Kleiderschrank zu sehen ist.",
    ["Look for beige sacks."] =
        "Such nach beigen Säcken.",
    ["Look beside objects and structures."] =
        "Such neben Gegenständen und Gebäuden.",
    ["Hunt the vultures."] =
        "Jag die Geier.",
    ["Many of them gather in this area."] =
        "Viele davon sammeln sich in dieser Gegend.",
    ["The rest lie dotted across the zone."] =
        "Der Rest ist über das Gebiet verstreut.",
    ["Kill boars for these."] =
        "Töte dafür Eber.",
    ["With the coming turn-ins, this gets you to level 15."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 15.",
    ["Flight master at Rut'theran Village"] =
        "Flugmeister in Rut'theran",
    ["Leave your pet with the stable master."] =
        "Stell dein Tier beim Stallmeister in den Stall.",
    ["You will tame a short-term pet shortly."] =
        "Du zähmst gleich ein Tier für kurze Zeit.",
    ["Here your pet picks up Claw (Rank 2)."] =
        "Hier lernt dein Tier Klaue (Rang 2).",
    ["You will let it go shortly."] =
        "Du lässt es gleich wieder frei.",
    ["Send your pet against a Thistle Bear."] =
        "Schick dein Tier auf einen Distelbären.",
    ["Get your companion back from the stable master."] =
        "Hol dein Tier beim Stallmeister ab.",
    ["Release the short-term pet you tamed."] =
        "Lass das kurzzeitig gezähmte Tier frei.",
    ["The NPC stands on the pier."] =
        "Der NPC steht auf dem Steg.",
    ["The targets are sea creatures with long necks."] =
        "Die Ziele sind Meereswesen mit langem Hals.",
    ["Head to the hilltop."] =
        "Geh auf die Hügelkuppe.",
    ["Wade in to use it."] =
        "Geh ins Wasser, um es zu benutzen.",
    ["The spot is at the foot of the falls."] =
        "Die Stelle ist am Fuß des Wasserfalls.",
    ["Look for an urn of woven wicker."] =
        "Such nach einer Urne aus Korbgeflecht.",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "Das Ziel ist der nicht feindliche Geist einer Nachtelfe.",
    ["Look for a figure in yellow and green garb."] =
        "Such nach einer Gestalt in gelb-grüner Kleidung.",
    ["Go to the lowest deck of the wreck."] =
        "Geh zum untersten Deck des Wracks.",
    ["Swim in by way of a porthole."] =
        "Schwimm durch ein Bullauge hinein.",
    ["Search stacks of brown crates."] =
        "Durchsuche Stapel brauner Kisten.",
    ["The NPC stands atop the dam."] =
        "Der NPC steht oben auf dem Damm.",
    ["The object rests by the barrier."] =
        "Das Objekt liegt an der Barriere.",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 19.",
    ["This skips some tedious quests with a timer."] =
        "So umgehst du ein paar mühsame Quests mit Zeitlimit.",
    ["The upcoming quest may prove hard."] =
        "Die nächste Quest kann schwer werden.",
    ["The targets are troggs."] =
        "Die Ziele sind Troggs.",
    ["Redridge and Westfall"] =
        "Rotkammgebirge und Westfall",
    ["Look for a big mound of brown earth."] =
        "Such nach einem großen Haufen brauner Erde.",
    ["The target patrols a long route by the road."] =
        "Das Ziel patrouilliert eine lange Route an der Straße.",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "Die Route des Ziels führt auch tief in den Jangoschacht und den Goldküstensteinbruch.",
    ["It takes roughly 5 minutes to reappear."] =
        "Es dauert etwa 5 Minuten, bis es wieder erscheint.",
    ["The target is a murloc, grey and bigger than the others."] =
        "Das Ziel ist ein Murloc, grau und größer als die anderen.",
    ["It roams the shoreline."] =
        "Es streift die Küste entlang.",
    ["If the NPC is absent, stay until he reappears."] =
        "Wenn der NPC nicht da ist, bleib, bis er wieder erscheint.",
    ["Escort The Defias Traitor and keep him alive."] =
        "Begleite den Verräter der Defias und halte ihn am Leben.",
    ["The NPC is on an upper floor of the tower."] =
        "Der NPC ist in einem oberen Stockwerk des Turms.",
    ["Hunt the red-feathered birds."] =
        "Jag die Vögel mit rotem Gefieder.",
    ["The targets are little winged dragons."] =
        "Die Ziele sind kleine geflügelte Drachen.",
    ["Skip Redridge Alphas; they don't carry them."] =
        "Lass Redridge Alphas aus; sie tragen sie nicht bei sich.",
    ["Raise Lockpicking to 95"] =
        "Bring Schlossknacken auf 95",
    ["Look for little gray coffers of metal."] =
        "Such nach kleinen grauen Metallkästchen.",
    ["Go inside and stay on the trail"] =
        "Geh hinein und bleib auf dem Weg",
    ["Your target is a ghoul."] =
        "Dein Ziel ist ein Ghul.",
    ["Fight undead foes."] =
        "Bekämpfe untote Gegner.",
    ["The target is the dungeon's second boss."] =
        "Das Ziel ist der zweite Boss des Dungeons.",
    ["The target is the dungeon's last boss."] =
        "Das Ziel ist der letzte Boss des Dungeons.",
    ["The objective is aboard the vessel."] =
        "Das Ziel ist an Bord des Schiffs.",
    ["You'll find them all over the instance."] =
        "Du findest sie überall in der Instanz.",
    ["The NPC is indoors"] =
        "Der NPC ist drinnen",
    ["Fight the murlocs."] =
        "Bekämpfe die Murlocs.",
    ["The spot is at the cave's mouth."] =
        "Die Stelle ist am Höhleneingang.",
    ["Look for the brown fungi."] =
        "Such nach den braunen Pilzen.",
    ["Extra ones are below, in the side chambers."] =
        "Weitere sind unten in den Seitenkammern.",
    ["Gather the blue-capped fungi."] =
        "Sammle die Pilze mit blauem Hut.",
    ["Expect a possible ambush while you gather it."] =
        "Rechne beim Einsammeln mit einem Hinterhalt.",
    ["It shows up a short way off."] =
        "Es erscheint ein Stück entfernt.",
    ["It shows up at your feet."] =
        "Es erscheint direkt vor deinen Füßen.",
    ["Murloc packs arrive at the waterside."] =
        "Murlocgruppen kommen ans Ufer.",
    ["The attackers rush the camp."] =
        "Die Angreifer stürmen das Lager.",
    ["Engage foes one at a time."] =
        "Kämpfe gegen einen Gegner nach dem anderen.",
    ["Watch out, the landscape conceals some monsters."] =
        "Vorsicht, die Landschaft verbirgt einige Monster.",
    ["Avoid drawing several foes together."] =
        "Zieh nicht mehrere Gegner auf einmal.",
    ["Stay with Prospector Remtravel and defend him."] =
        "Bleib bei Prospector Remtravel und verteidige ihn.",
    ["He is frail and goes down fast."] =
        "Er ist schwach und stirbt schnell.",
    ["Look on top of the table."] =
        "Schau oben auf dem Tisch nach.",
    ["Escort Therylune and defend her."] =
        "Begleite Therylune und verteidige sie.",
    ["Escort Volcor and defend him."] =
        "Begleite Volcor und verteidige ihn.",
    ["Allow the foes to hit him before you join in."] =
        "Lass die Gegner ihn zuerst angreifen, bevor du eingreifst.",
    ["If it is not around, move on without it."] =
        "Wenn es nicht da ist, mach ohne es weiter.",
    ["It reappears only after a long wait."] =
        "Es erscheint erst nach langer Zeit wieder.",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "Beschütze Kerlonian Evershade, während er dir folgt.",
    ["Keep near him; he dozes off."] =
        "Bleib in seiner Nähe; er schläft ein.",
    ["The NPC is on the house's raised terrace."] =
        "Der NPC ist auf der erhöhten Terrasse des Hauses.",
    ["Ashenvale and Stonetalon"] =
        "Eschental und Steinkrallengebirge",
    ["The item drops rarely."] =
        "Der Gegenstand fällt selten.",
    ["Look for little gray sheaves of straw."] =
        "Such nach kleinen grauen Strohgarben.",
    ["Lower the Ground Clutter option to 1."] =
        "Setze die Option Bodenvegetation auf 1.",
    ["Find it in the game options, under System, then Graphics."] =
        "Du findest sie in den Spieloptionen unter System, dann Grafik.",
    ["Fly to Astranaar"] =
        "Flieg nach Astranaar",
    ["Keep to the road the whole way."] =
        "Bleib den ganzen Weg auf der Straße.",
    ["Pick up Claw (Rank 3) for your pet."] =
        "Hol dir Klaue (Rang 3) für dein Tier.",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "Zähme mit Wildtier zähmen einen Ashenvale Bear.",
    ["Track down a chestnut-furred bear."] =
        "Such einen Bären mit kastanienbraunem Fell.",
    ["Keep to the road until you reach the Barrens"] =
        "Bleib auf der Straße, bis du das Brachland erreichst",
    ["Keep your distance from the Crossroads."] =
        "Halt Abstand zum Wegekreuz.",
    ["Flight master in Ratchet"] =
        "Flugmeister in Ratschet",
    ["Look for white spheres."] =
        "Such nach weißen Kugeln.",
    ["The target is a gray furbolg."] =
        "Das Ziel ist ein grauer Furbolg.",
    ["Shrubs that glitter white."] =
        "Sträucher, die weiß glitzern.",
    ["Exit Ruins of Stardust"] =
        "Verlass die Ruins of Stardust",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "Betritt Fire Scar Shrine und steig den Weg hinauf",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "Das Ziel beschwört mit Ilkrud's Guardians Beschützer.",
    ["Cut off the target's spells when you can."] =
        "Unterbrich die Zauber des Ziels, wenn du kannst.",
    ["Exit Fire Scar Shrine"] =
        "Verlass Fire Scar Shrine",
    ["Circle the mountain on foot."] =
        "Geh zu Fuß um den Berg herum.",
    ["A yellowish naga; her fins look pinkish."] =
        "Eine gelbliche Naga; ihre Flossen wirken rosa.",
    ["The target is rare and seldom up."] =
        "Das Ziel ist selten und nur selten da.",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "Das Ziel ist eine Naga mit jadegrüner Haut und rosafarbenen Flossen.",
    ["It circles the island clockwise, close to the shore."] =
        "Es umrundet die Insel im Uhrzeigersinn, nah am Ufer.",
    ["She travels with a pair of guards."] =
        "Sie ist mit zwei Wachen unterwegs.",
    ["Hunt naga."] =
        "Jag Naga.",
    ["Take the passage into Stonetalon Mountains"] =
        "Nimm den Durchgang ins Steinkrallengebirge",
    ["Look for it high on the clifftop."] =
        "Such es hoch oben auf der Klippe.",
    ["The targets are wyverns."] =
        "Die Ziele sind Wyvern.",
    ["Fly to Stonetalon Peak"] =
        "Flieg zum Steinkrallengipfel",
    ["Watch out and keep away from Tideress."] =
        "Pass auf und halt dich von Tideress fern.",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "Deine Beute ist ein grünliches Wesen aus lebendem Wasser, Stufe 27.",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "Das ist im Abschnitt The Pool of Ask'ar des Dungeons.",
    ["Look on Ghamoo-ra's north side."] =
        "Such auf der Nordseite von Ghamoo-ra.",
    ["Dive down into the submerged cave."] =
        "Tauch hinunter in die Unterwasserhöhle.",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "Du findest den NPC südwestlich von Ghamoo-ra.",
    ["It is the dungeon's 4th boss."] =
        "Es ist der 4. Boss des Dungeons.",
    ["Kill Fallenroot and Blackfathom foes."] =
        "Töte Gegner der Fallenroot und Blackfathom.",
    ["Fly to Talrendis Point"] =
        "Flieg nach Talrendis Point",
    ["This trip is dangerous; move with great caution."] =
        "Diese Reise ist gefährlich; sei sehr vorsichtig.",
    ["Stay on the road and keep away from Horde NPCs."] =
        "Bleib auf der Straße und halt dich von NPCs der Horde fern.",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "Die Warsong Outriders, die auf der Straße reiten, bleiben friedlich.",
    ["The target is a gray murloc."] =
        "Das Ziel ist ein grauer Murloc.",
    ["The target appears at this spot."] =
        "Das Ziel erscheint an dieser Stelle.",
    ["Go into Whelgar's Excavation Site"] =
        "Betritt Whelgars Ausgrabungsstätte",
    ["Head out of Whelgar's Excavation Site"] =
        "Verlass Whelgars Ausgrabungsstätte",
    ["The targets are raptors."] =
        "Die Ziele sind Raptoren.",
    ["Targets are both in the tomb and around it."] =
        "Ziele gibt es im Grabmal und darum herum.",
    ["The vendor stocks only a few."] =
        "Der Händler hat nur wenige vorrätig.",
    ["A quest in Duskwood will require it afterward."] =
        "Eine Quest im Dämmerwald braucht es später.",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "Kauf es jetzt; eine Aufgabe im Dämmerwald braucht es bald.",
    ["The spot is in the crypt under the building."] =
        "Die Stelle ist in der Krypta unter dem Gebäude.",
    ["Duskwood and Redridge"] =
        "Dämmerwald und Rotkammgebirge",
    ["Flight master at Darkshire"] =
        "Flugmeister in Dunkelhain",
    ["The target is a ghoul with red skin."] =
        "Das Ziel ist ein Ghul mit roter Haut.",
    ["The targets are ghouls."] =
        "Die Ziele sind Ghule.",
    ["Exit the tomb"] =
        "Verlass das Grabmal",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "Bestiehl eine Malformed Defias Drone mit Taschendiebstahl.",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "Belege Klaven Mortwake mit Kopfnuss, dann öffne die Truhe.",
    ["Opening it puts a harmful effect on you."] =
        "Beim Öffnen bekommst du einen schädlichen Effekt.",
    ["Climb the trail across the mountains"] =
        "Steig den Weg über die Berge hinauf",
    ["Take the trail that circles the peak"] =
        "Nimm den Weg, der um den Gipfel führt",
    ["Defeat each wave of attackers."] =
        "Besiege jede Welle von Angreifern.",
    ["Beware of foes lurking in stealth."] =
        "Vorsicht vor getarnten Gegnern.",
    ["Target Doc Mixilpixil, then take a seat."] =
        "Nimm Doc Mixilpixil ins Ziel, dann setz dich hin.",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "Das Ziel ist ein Eber mit dunklerem braunem Fell.",
    ["The targets are orcs."] =
        "Die Ziele sind Orcs.",
    ["You no longer need these; vendor or discard them."] =
        "Du brauchst sie nicht mehr; verkauf sie oder wirf sie weg.",
    ["The targets are Horrors and Fiends."] =
        "Die Ziele sind Schrecken und Unholde.",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "Greif Mor'Ladim nicht an, einen untoten Elitegegner der Stufe 35.",
    ["The target wanders near the crypt, outdoors."] =
        "Das Ziel streift draußen nahe der Krypta umher.",
    ["Climb the steps and exit the tomb"] =
        "Steig die Stufen hinauf und verlass das Grabmal",
    ["The target is a sword-wielding gnoll."] =
        "Das Ziel ist ein Gnoll mit Schwert.",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "Das Ziel ist ein Gnoll in purpurroter Robe mit einer langen Klinge.",
    ["Beware: nearby foes join when you attack him."] =
        "Vorsicht: Gegner in der Nähe greifen mit ein, wenn du ihn angreifst.",
    ["Keep to the cave's interior when you can."] =
        "Bleib möglichst im Inneren der Höhle.",
    ["The following step takes place in the cave."] =
        "Der nächste Schritt findet in der Höhle statt.",
    ["Keep Corporal Keeshan safe during the escort."] =
        "Beschütze Corporal Keeshan während der Eskorte.",
    ["At the cave's mouth, draw foes to him with care."] =
        "Lock die Gegner am Höhleneingang vorsichtig zu ihm.",
    ["The target is the dungeon's fifth boss."] =
        "Das Ziel ist der fünfte Boss des Dungeons.",
    ["Targets are within the wrecked vessel underwater."] =
        "Die Ziele sind im Schiffswrack unter Wasser.",
    ["The target is a blue raptor."] =
        "Das Ziel ist ein blauer Raptor.",
    ["Look for a big mound of dirt."] =
        "Such nach einem großen Erdhaufen.",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "Der Gegenstand kann auch auf dem hohen Felsvorsprung bei Sarltooth erscheinen.",
    ["Look for a big, broad yellow urn."] =
        "Such nach einer großen, breiten gelben Urne.",
    ["Look for a big, tall crimson urn."] =
        "Such nach einer großen, hohen purpurroten Urne.",
    ["The target is a big stone container."] =
        "Das Ziel ist ein großer Steinbehälter.",
    ["The target is up on the boat's top deck."] =
        "Das Ziel ist oben auf dem obersten Deck des Schiffs.",
    ["Climb the incline at the rear."] =
        "Geh hinten die Schräge hinauf.",
    ["Go to the lowest deck of the ship."] =
        "Geh zum untersten Deck des Schiffs.",
    ["Swim in via the gap at the base."] =
        "Schwimm durch die Lücke unten hinein.",
    ["These foes hide in stealth."] =
        "Diese Gegner sind getarnt.",
    ["Most often found in or beside water."] =
        "Meist im oder am Wasser.",
    ["Grab every one you spot on the way here."] =
        "Nimm auf dem Weg hierher jedes mit, das du siehst.",
    ["With the coming hand-ins, this brings you to level 29."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 29.",
    ["Take the door on the bridge, then descend the steps"] =
        "Nimm die Tür auf der Brücke, dann geh die Stufen hinunter",
    ["The NPC is on the lower level within the bridge."] =
        "Der NPC ist auf der unteren Ebene im Inneren der Brücke.",
    ["Leap from the span and splash down below"] =
        "Spring von der Brücke ins Wasser darunter",
    ["Look for a pale, rolled scroll."] =
        "Such nach einer hellen, gerollten Schriftrolle.",
    ["A dwarf corpse grips it."] =
        "Eine Zwergenleiche hält sie fest.",
    ["Fly to Refuge Pointe"] =
        "Flieg zur Zuflucht",
    ["Flight master at Southshore"] =
        "Flugmeister in Süderstade",
    ["The targets are turtles."] =
        "Die Ziele sind Schildkröten.",
    ["Head north, keeping to the riverbank."] =
        "Geh am Flussufer entlang nach Norden.",
    ["Flight master at Chillwind Camp"] =
        "Flugmeister im Lager Kühlwind",
    ["Stonetalon and Ashenvale"] =
        "Steinkrallengebirge und Eschental",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "Folge der Straße, dann steig den Weg hinauf zur Nijelspitze",
    ["Fly to Nijel's Point"] =
        "Flieg zur Nijelspitze",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "Die Quest ist grau, aber die späteren Quests der Reihe geben viel EP.",
    ["Take the road until this trail"] =
        "Folge der Straße bis zu diesem Weg",
    ["Keep on the trail"] =
        "Bleib auf dem Weg",
    ["Fight the treants."] =
        "Bekämpfe die Treants.",
    ["Head uphill on the trail and across the passage"] =
        "Geh den Weg bergauf und durch den Durchgang",
    ["Exit the Howling Vale by the tunnel"] =
        "Verlass das Howling Vale durch den Tunnel",
    ["You pick up Claw (Rank 4) here."] =
        "Hier bekommst du Klaue (Rang 4).",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "Zähme mit Wildtier zähmen einen beliebigen Elder Ashenvale Bear.",
    ["They show up lying on the ground."] =
        "Sie liegen auf dem Boden.",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "Geh um den Gipfel herum, dann den gewundenen Erdweg hinauf zum Schrein",
    ["Circle the mountain, then stay on the trail"] =
        "Geh um den Berg herum, dann bleib auf dem Weg",
    ["Stand on the marked point, then apply the item."] =
        "Stell dich auf den markierten Punkt, dann benutze den Gegenstand.",
    ["Obtain Furbolg Form"] =
        "Erhalte Furbolggestalt",
    ["Walk over the span"] =
        "Geh über die Brücke",
    ["The foes are gnomes."] =
        "Die Gegner sind Gnome.",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "In den äußeren Hallen von Gnomeregan, nicht in der Instanz selbst.",
    ["Take the lift down, then head north."] =
        "Fahr mit dem Aufzug hinunter, dann geh nach Norden.",
    ["The NPC is atop the raised platform."] =
        "Der NPC ist oben auf der erhöhten Plattform.",
    ["It sits a short distance southward from Techbot."] =
        "Es ist ein kurzes Stück südlich von Techbot.",
    ["Use it on foes that are Irradiated."] =
        "Benutze es an verstrahlten Gegnern.",
    ["The targets are troggs with a green glow."] =
        "Die Ziele sind grün leuchtende Troggs.",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "Bleib in The Hall of Gears auf den obersten Ebenen.",
    ["Take the trail southwest into The Dormitory."] =
        "Nimm den Weg nach Südwesten in den Schlafsaal.",
    ["By the wall on The Dormitory's lower floor."] =
        "An der Wand auf der unteren Ebene des Schlafsaals.",
    ["The target is the third boss you meet."] =
        "Das Ziel ist der dritte Boss, dem du begegnest.",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "Das Ziel ist auf der erhöhten Plattform neben Elektrokutor 6000.",
    ["In the Engineering Labs, on the lowest floor."] =
        "In den Engineering Labs, auf der untersten Ebene.",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "Das Ziel ist neben Crowd Pummeler 9-60.",
    ["Keep to Launch Bay's top floor."] =
        "Bleib auf der obersten Ebene der Launch Bay.",
    ["Look for boxy, standing devices."] =
        "Such nach kastenförmigen, aufrecht stehenden Geräten.",
    ["The machine you need is in the Dormitory."] =
        "Die Maschine, die du brauchst, ist im Schlafsaal.",
    ["It can take more than one to get it."] =
        "Eventuell brauchst du mehr als einen Versuch.",
    ["Duskwood and Stranglethorn"] =
        "Dämmerwald und Schlingendorntal",
    ["Head into Stormwind Keep"] =
        "Geh in die Burg Sturmwind",
    ["The NPC stands by the water's edge."] =
        "Der NPC steht am Ufer.",
    ["The targets are worgen."] =
        "Die Ziele sind Worgen.",
    ["Other ghouls occupy the same spawn points."] =
        "Andere Ghule teilen sich dieselben Spawnpunkte.",
    ["The target can be in the house or around it."] =
        "Das Ziel kann im Haus oder darum herum sein.",
    ["Just out of the mine."] =
        "Direkt vor der Mine.",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "Der NPC patrouilliert alle 20-30 Minuten einmal die südliche Route.",
    ["A pair of foes go after him."] =
        "Zwei Gegner greifen ihn an.",
    ["Saving his life unlocks a new task."] =
        "Wenn du ihn rettest, schaltest du eine neue Aufgabe frei.",
    ["Hang on to it; an upcoming quest uses it."] =
        "Behalte es; eine kommende Quest braucht es.",
    ["The NPC stands in the narrow lane between houses."] =
        "Der NPC steht in der schmalen Gasse zwischen den Häusern.",
    ["Hillsbrad and Arathi"] =
        "Hügelland und Arathihochland",
    ["Search for gray rocks standing up beside the walls."] =
        "Such nach aufrecht stehenden grauen Steinen an den Mauern.",
    ["Further hidden ones lurk on the high ridgelines."] =
        "Weitere liegen versteckt auf den hohen Bergkämmen.",
    ["Some are indoors as well."] =
        "Einige sind auch drinnen.",
    ["Fly to Aerie Peak"] =
        "Flieg zum Nistgipfel",
    ["The NPC is at the summit of the trail."] =
        "Der NPC ist am höchsten Punkt des Wegs.",
    ["This spares you time further on."] =
        "Das spart dir später Zeit.",
    ["Flight master at Theramore"] =
        "Flugmeister in Theramore",
    ["This quest is buggy and may not show up."] =
        "Diese Quest ist fehlerhaft und erscheint vielleicht nicht.",
    ["Expect several foes at once."] =
        "Rechne mit mehreren Gegnern gleichzeitig.",
    ["Make Private Hendel your main target."] =
        "Mach Gefreiten Hendel zu deinem Hauptziel.",
    ["Steer clear of Brackenwall Village."] =
        "Halt dich von Brackenwall Village fern.",
    ["Watch out: the foes here are above your level."] =
        "Vorsicht: Die Gegner hier haben eine höhere Stufe als du.",
    ["The quest starts from a small piece of metal."] =
        "Die Quest beginnt mit einem kleinen Metallstück.",
    ["Take the lift down"] =
        "Fahr mit dem Aufzug hinunter",
    ["Look for a little brown tome."] =
        "Such nach einem kleinen braunen Buch.",
    ["The item is held by a dwarf corpse."] =
        "Eine Zwergenleiche hält den Gegenstand.",
    ["Flight master at Thalanaar"] =
        "Flugmeister in Thalanaar",
    ["Keep clear of Freewind Post."] =
        "Halt dich vom Freiwindposten fern.",
    ["This spot has most of them; elsewhere they are rare."] =
        "Hier gibt es die meisten; anderswo sind sie selten.",
    ["Return here as you do your other quests."] =
        "Komm während deiner anderen Quests hierher zurück.",
    ["The foes here are scorpions."] =
        "Die Gegner hier sind Skorpione.",
    ["Look for assorted mechanical pieces."] =
        "Such nach verschiedenen mechanischen Teilen.",
    ["Parts lie all across the Shimmering Flats."] =
        "Die Teile liegen überall in der Schimmernden Ebene.",
    ["Fly to Gadgetzan"] =
        "Flieg nach Gadgetzan",
    ["Stand on the metal grating to begin the battle."] =
        "Stell dich auf das Metallgitter, um den Kampf zu beginnen.",
    ["Shows up once you defeat six challengers."] =
        "Erscheint, sobald du sechs Herausforderer besiegt hast.",
    ["The NPC is upstairs, out on the balcony."] =
        "Der NPC ist oben, draußen auf dem Balkon.",
    ["The NPC stands on the top tier of the pier."] =
        "Der NPC steht auf der obersten Ebene des Piers.",
    ["Fly to Booty Bay"] =
        "Flieg nach Beutebucht",
    ["If he is absent, move on without him."] =
        "Ist er nicht da, mach ohne ihn weiter.",
    ["You may come back for it another time."] =
        "Du kannst ein andermal dafür zurückkommen.",
    ["These foes heal both their allies and themselves."] =
        "Diese Gegner heilen ihre Verbündeten und sich selbst.",
    ["When the targets run out, skip ahead."] =
        "Wenn keine Ziele mehr da sind, überspring den Schritt.",
    ["No rush; you may complete this afterwards."] =
        "Keine Eile, du kannst das später abschließen.",
    ["The objective sits up on the raised deck."] =
        "Das Ziel ist oben auf dem erhöhten Deck.",
    ["Search the riverbanks."] =
        "Such an den Flussufern.",
    ["Here your pet picks up Claw (Rank 5)."] =
        "Hier lernt dein Tier Klaue (Rang 5).",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "Zähme einen Scorpashi Lasher mit Wildtier zähmen.",
    ["Head uphill into Nijel's Point"] =
        "Geh bergauf zur Nijelspitze",
    ["With the coming hand-ins, this brings you to level 36."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 36.",
    ["The quest starts from a little book."] =
        "Die Quest beginnt mit einem kleinen Buch.",
    ["The targets are lobsters."] =
        "Die Ziele sind Hummer.",
    ["Draw him to the doorway so other foes stay out of it."] =
        "Zieh ihn zum Eingang, damit sich andere Gegner nicht einmischen.",
    ["Escort Dalinda Malem and keep her alive."] =
        "Begleite Dalinda Malem und halte sie am Leben.",
    ["The targets here are centaurs."] =
        "Die Ziele hier sind Zentauren.",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "Magram Pack Runners patrouillieren mit 2 Hyänen als Begleitung; halte dich fern.",
    ["Stay away from Ghost Walker Post."] =
        "Halte dich vom Geistwandlerposten fern.",
    ["Target kodos with the item."] =
        "Benutze den Gegenstand an Kodos.",
    ["The kodos trail behind you."] =
        "Die Kodos folgen dir.",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "Führ sie zu Smeed Scrabblescrew und sprich dort mit ihnen.",
    ["Look for pale skulls of horned beasts."] =
        "Such nach bleichen Schädeln gehörnter Tiere.",
    ["A lengthy grinding stretch is coming up."] =
        "Gleich kommt eine lange Grindphase.",
    ["The targets are Sea Witches and Tidehunters."] =
        "Die Ziele sind Meerhexen und Gezeitenjäger.",
    ["Other naga compete for the same spawn points."] =
        "Andere Naga teilen sich dieselben Spawnpunkte.",
    ["The targets are on islands and beneath the surface."] =
        "Die Ziele sind auf Inseln und unter Wasser.",
    ["This spreads out the grinding so less is left later."] =
        "So verteilt sich das Grinden, und später bleibt weniger übrig.",
    ["Take the mountain trail to get there."] =
        "Nimm den Bergpfad dorthin.",
    ["Stay clear of Valley of Spears."] =
        "Halte dich vom Tal der Speere fern.",
    ["Look for tan sacks by the houses."] =
        "Such nach hellbraunen Säcken bei den Häusern.",
    ["Some of them are not usable."] =
        "Manche davon sind nicht benutzbar.",
    ["Basilisks compete for the same spawn points."] =
        "Basilisken teilen sich dieselben Spawnpunkte.",
    ["They compete for spawn points with the other Kurzen foes."] =
        "Sie teilen sich Spawnpunkte mit den anderen Kurzen-Gegnern.",
    ["A key class quest coming up requires this."] =
        "Eine wichtige Klassenquest braucht das bald.",
    ["The targets are on the cave floor."] =
        "Die Ziele sind auf dem Höhlenboden.",
    ["Targets are spread across the whole cavern."] =
        "Die Ziele sind über die ganze Höhle verteilt.",
    ["Hold on to it for a Searing Gorge task later."] =
        "Behalte es für eine spätere Quest in der Sengenden Schlucht.",
    ["Stay away from Bhag'thera."] =
        "Halte dich von Bhag'thera fern.",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "Die Großkatze, die du brauchst, streift offen umher: ein schwarzer Elitepanther der Stufe 40.",
    ["The targets are in the water and along its edges."] =
        "Die Ziele sind im Wasser und an seinen Ufern.",
    ["Look for an orange tiger."] =
        "Such nach einem orangefarbenen Tiger.",
    ["Mostly found atop the hill."] =
        "Meist oben auf dem Hügel.",
    ["Steer clear of elite murlocs."] =
        "Halte dich von Elitemurlocs fern.",
    ["The targets are trolls."] =
        "Die Ziele sind Trolle.",
    ["With the coming hand-ins, this gets you to level 38."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 38.",
    ["Hunt the little winged dragonkin."] =
        "Jage die kleinen geflügelten Drachkin.",
    ["The target is a humanoid escorted by 2 guards."] =
        "Das Ziel ist ein Humanoider mit 2 Wachen als Begleitung.",
    ["Clear the monsters just south before you start."] =
        "Räum vor dem Start die Monster direkt im Süden ab.",
    ["Escort Galen Goodward and keep him alive."] =
        "Begleite Galen Goodward und halte ihn am Leben.",
    ["Look for big blue crystals."] =
        "Such nach großen blauen Kristallen.",
    ["Keep to the water to skip foes above your level."] =
        "Bleib im Wasser, um Gegnern über deiner Stufe auszuweichen.",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 39.",
    ["Hold on to it for the Whirlwind class chain."] =
        "Behalte es für die Wirbelwind-Klassenquestreihe.",
    ["A major boost to your weapon."] =
        "Eine große Verbesserung für deine Waffe.",
    ["Arathi and Alterac"] =
        "Arathi und Alterac",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "Das Ziel zieht in eine Richtung die Straße entlang, begleitet von 4 Wachen.",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "Erreicht sie Tarrens Mühle, erscheint sie erneut.",
    ["She starts her route over in Arathi Highlands."] =
        "Sie beginnt ihren Weg im Arathihochland von vorn.",
    ["The targets are kobolds."] =
        "Die Ziele sind Kobolde.",
    ["Additional ones are in the cavern up the trail."] =
        "Weitere sind in der Höhle den Pfad hinauf.",
    ["Keep away from Hammerfall."] =
        "Halte dich von Hammerfall fern.",
    ["Climb the trail to the cavern"] =
        "Steig den Pfad zur Höhle hinauf",
    ["The NPC stands atop the ridge."] =
        "Der NPC steht oben auf dem Grat.",
    ["Escort Kinelory and keep her alive."] =
        "Begleite Kinelory und halte sie am Leben.",
    ["The targets are ogres."] =
        "Die Ziele sind Oger.",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 40.",
    ["Stay clear of Refuge Point."] =
        "Halte dich von der Zuflucht fern.",
    ["A level 40 elite foe shows up shortly."] =
        "Gleich erscheint ein Elitegegner der Stufe 40.",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "Trink mitten im Kampf einen zweiten Naturschutztrank.",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "Nimm vorher einen ein, damit er bei Kampfbeginn wieder bereit ist.",
    ["Get Essence of the Exile done as well."] =
        "Schließe auch Essence of the Exile ab.",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "Achte darauf, dass die Abklingzeit des Naturschutztranks vorbei ist.",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "Bleib hinter Bath'rah the Windwatcher, während er läuft.",
    ["This calls up Cyclonian."] =
        "Das beschwört Cyclonian.",
    ["Take the trail across the peaks"] =
        "Nimm den Pfad über die Gipfel",
    ["Take the passage to Faldir's Cove"] =
        "Nimm den Durchgang nach Faldirs Bucht",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "Begleite Professor Phizzlethorpe und halte ihn am Leben.",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "Der Band ist braun gebunden und liegt in einem Metallkessel.",
    ["The objective is on the central deck of the submerged wreck."] =
        "Das Ziel ist auf dem mittleren Deck des versunkenen Wracks.",
    ["Look for a flat beige parchment."] =
        "Such nach einem flachen beigen Pergament.",
    ["Search for a book lying open."] =
        "Such nach einem aufgeschlagenen Buch.",
    ["The target is in the ship's lowest hold."] =
        "Das Ziel ist im untersten Laderaum des Schiffs.",
    ["Look for big gray rocks."] =
        "Such nach großen grauen Felsen.",
    ["They show up as dots on the minimap."] =
        "Sie erscheinen als Punkte auf der Minikarte.",
    ["Hold on to it, an upcoming quest uses it."] =
        "Behalte es, eine kommende Quest braucht es.",
    ["Clear the raptors around before you begin."] =
        "Räum vor dem Start die Raptoren in der Nähe ab.",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "Warte das Gespräch ab, dann begleite \"Stinky\" Ignatz und halte ihn am Leben.",
    ["Speak with him once he gives up."] =
        "Sprich mit ihm, sobald er aufgibt.",
    ["Hunt the felguards."] =
        "Jage die Teufelswachen.",
    ["This is the sole spot; wait for them to reappear."] =
        "Das ist die einzige Stelle; warte, bis sie wieder erscheinen.",
    ["The targets are felhounds."] =
        "Die Ziele sind Teufelshunde.",
    ["The targets are succubi."] =
        "Die Ziele sind Sukkuben.",
    ["The spot is beside a giant skeleton."] =
        "Die Stelle ist neben einem riesigen Skelett.",
    ["Clear out the foes around here before you start."] =
        "Räum vor dem Start die Gegner hier in der Nähe ab.",
    ["Target the spectral centaurs."] =
        "Nimm die geisterhaften Zentauren ins Ziel.",
    ["The targets are brown-colored skeletons."] =
        "Die Ziele sind braune Skelette.",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 41.",
    ["The target wanders inside the tent and around it."] =
        "Das Ziel wandert im Zelt und drumherum umher.",
    ["Take the road, then descend the trail"] =
        "Nimm die Straße, dann geh den Pfad hinab",
    ["On the road, Rexxar leaves you alone."] =
        "Auf der Straße lässt Rexxar dich in Ruhe.",
    ["Cross by boat or by swimming"] =
        "Setz mit dem Boot über oder schwimm",
    ["Flight master at Feathermoon"] =
        "Flugmeister der Mondfederfeste",
    ["Your pet picks up Claw (Rank 6) here."] =
        "Hier lernt dein Tier Klaue (Rang 6).",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "Zähme einen Scorpid Hunter mit Wildtier zähmen.",
    ["Head into the Library wing."] =
        "Geh in die Bibliothek.",
    ["The target is the dungeon's opening boss."] =
        "Das Ziel ist der erste Boss des Dungeons.",
    ["Head across the hall called Gallery of Treasures."] =
        "Geh durch die Halle namens Galerie der Schätze.",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "Behalte die Minikarte im Blick, bis dort wieder Scharlachrotes Kloster steht.",
    ["This is in the Armory wing."] =
        "Das ist in der Waffenkammer.",
    ["Found in the Cathedral wing."] =
        "Zu finden in der Kathedrale.",
    ["A lengthy stretch of quests is coming up."] =
        "Gleich kommt eine lange Questphase.",
    ["This vendor sells no arrows or bullets."] =
        "Dieser Händler verkauft keine Pfeile oder Kugeln.",
    ["Get these for simple Badlands turn-ins ahead."] =
        "Hol sie dir für einfache Abgaben im Ödland, die später kommen.",
    ["The NPC or item sits on the rocky shelf above."] =
        "Der NPC oder Gegenstand ist oben auf dem Felsvorsprung.",
    ["Fight the dwarves."] =
        "Kämpfe gegen die Zwerge.",
    ["Look for a timber box."] =
        "Such nach einer Holzkiste.",
    ["A cluster of them gathers here."] =
        "Hier gibt es eine ganze Ansammlung davon.",
    ["More of them dot the surroundings."] =
        "Weitere sind in der Umgebung verstreut.",
    ["With the coming hand-ins, this brings you to level 42."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 42.",
    ["Unlocks the flight point at Thorium Point."] =
        "Schaltet den Flugpunkt an der Thoriumspitze frei.",
    ["Flight master at Thorium Point"] =
        "Flugmeister der Thoriumspitze",
    ["Take the passage out of Booty Bay"] =
        "Nimm den Durchgang aus Beutebucht hinaus",
    ["Take the tunnel into Booty Bay"] =
        "Nimm den Tunnel nach Beutebucht",
    ["Take the trail toward the Ruins of Aboraz"] =
        "Nimm den Pfad zu den Ruinen von Aboraz",
    ["Gradually move toward the northeast."] =
        "Arbeite dich nach und nach nach Nordosten vor.",
    ["The targets are goblins."] =
        "Die Ziele sind Goblins.",
    ["Kill the witch doctors and the mystics."] =
        "Töte die Hexendoktoren und die Mystiker.",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "Ein dunkler Panther, Elite der Stufe 40, sichtbar statt getarnt.",
    ["Be ready: these opponents are elites at level 38."] =
        "Sei bereit: Diese Gegner sind Elite der Stufe 38.",
    ["Saltwater Crocolisks spawn in the same places."] =
        "Saltwater Crocolisks erscheinen an denselben Stellen.",
    ["The object is a table made of stone."] =
        "Das Objekt ist ein Tisch aus Stein.",
    ["Drag him up until he breaks the surface."] =
        "Zieh ihn hoch, bis er die Wasseroberfläche durchbricht.",
    ["Follow the shoreline"] =
        "Folge der Küste",
    ["The item is a brownish sheet of parchment."] =
        "Der Gegenstand ist ein bräunliches Blatt Pergament.",
    ["Look for a flat, white scroll lying open."] =
        "Such nach einer flachen, weißen, offen liegenden Schriftrolle.",
    ["If some pages are unavailable, go on without them."] =
        "Fehlen manche Seiten, mach ohne sie weiter.",
    ["You want Chapters I, II and III."] =
        "Du brauchst die Kapitel I, II und III.",
    ["Collect the chunks of wood."] =
        "Sammle die Holzstücke.",
    ["Do not go near Stonard."] =
        "Geh nicht in die Nähe von Steinard.",
    ["Silt Crawlers drop it more often."] =
        "Silt Crawlers lassen es öfter fallen.",
    ["Fly to Nethergarde Keep"] =
        "Flieg zur Burg Nethergarde",
    ["A timer runs on this one; don't dawdle."] =
        "Hier läuft ein Timer; trödle nicht.",
    ["Hold on until Rizzle has fled."] =
        "Warte, bis Rizzle geflohen ist.",
    ["Targets here are human."] =
        "Die Ziele hier sind Menschen.",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "Dungeons sind hier auch eine gute Wahl, ganz wie du magst.",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "Jeder in Gadgetzan abgegebene 5er-Satz bringt 380 EP.",
    ["Hyenas also use these spawn spots."] =
        "Hyänen nutzen auch diese Spawnpunkte.",
    ["Feralas and Tanaris"] =
        "Feralas und Tanaris",
    ["Position yourself in its center."] =
        "Stell dich in die Mitte.",
    ["Consider bringing a group for this one."] =
        "Nimm dafür am besten eine Gruppe mit.",
    ["Zones with stronger foes lie just ahead."] =
        "Gleich kommen Gebiete mit stärkeren Gegnern.",
    ["The quests alone won't give you the level you need."] =
        "Die Quests allein bringen dich nicht auf die nötige Stufe.",
    ["Swim this way to stay out of fatigue"] =
        "Schwimm hier entlang, um Erschöpfung zu vermeiden",
    ["Hunt the crimson winged serpents."] =
        "Jage die purpurroten geflügelten Schlangen.",
    ["Slay them, then apply the item to their remains."] =
        "Töte sie, dann benutze den Gegenstand an ihren Überresten.",
    ["Once freed, they can be killed."] =
        "Sobald sie befreit sind, kannst du sie töten.",
    ["Win the encounter at the temple."] =
        "Gewinne den Kampf am Tempel.",
    ["Take the trail to the southeast."] =
        "Nimm den Pfad nach Südosten.",
    ["Inside a big room around a central pool."] =
        "In einem großen Raum rund um ein Becken in der Mitte.",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "Die meisten sind in der Skarabäenkammer von Theka der Märtyrerin.",
    ["It could take a few trips through the instance."] =
        "Das kann ein paar Durchläufe der Instanz dauern.",
    ["Do more Zul'Farrak runs."] =
        "Mach weitere Durchläufe in Zul'Farrak.",
    ["Keep to the road, then cross the tunnel"] =
        "Bleib auf der Straße, dann durchquere den Tunnel",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "Der Roboter steht auf dem offenen Gelände zwischen Höhle und Tunnel.",
    ["Others lie past the tunnel."] =
        "Weitere liegen hinter dem Tunnel.",
    ["Get out of the cave and use the passage beyond"] =
        "Verlass die Höhle und nimm den Durchgang dahinter",
    ["Look for a big, pale egg."] =
        "Such nach einem großen, blassen Ei.",
    ["Hunt gorillas."] =
        "Jage Gorillas.",
    ["Bears appear at the same spawn spots."] =
        "Bären erscheinen an denselben Spawnpunkten.",
    ["Hunt bears."] =
        "Jage Bären.",
    ["They appear in the same spots as the apes."] =
        "Sie erscheinen an denselben Stellen wie die Affen.",
    ["Kill the foes near the big cage first."] =
        "Töte zuerst die Gegner nahe dem großen Käfig.",
    ["This helps with the following step."] =
        "Das hilft beim nächsten Schritt.",
    ["This sets Captured Sprite Darters free."] =
        "Das befreit die Captured Sprite Darters.",
    ["Save as many of them as possible."] =
        "Rette so viele wie möglich.",
    ["Keep 6 or more of them alive."] =
        "Halte mindestens 6 davon am Leben.",
    ["If she is gone, wait until she comes back."] =
        "Ist sie weg, warte, bis sie zurückkommt.",
    ["Go into the cavern at the trail's foot"] =
        "Geh in die Höhle am Fuß des Pfads",
    ["Getting it here speeds up Un'Goro Crater."] =
        "Wenn du es hier holst, geht der Krater von Un'Goro schneller.",
    ["Stay clear of the elite foes."] =
        "Halte dich von den Elitegegnern fern.",
    ["Gather the big plumes colored brown and ivory."] =
        "Sammle die großen braun-elfenbeinfarbenen Federn.",
    ["Drop the Ground Clutter option down to 1."] =
        "Setz die Option Bodenvegetation auf 1 herunter.",
    ["Hop onto the ledge here."] =
        "Spring hier auf den Vorsprung.",
    ["Monsters are unable to reach you from this spot."] =
        "Monster können dich hier nicht erreichen.",
    ["Hold off until you have left combat."] =
        "Warte, bis du nicht mehr im Kampf bist.",
    ["Other creatures use these spawn points too."] =
        "Andere Kreaturen nutzen diese Spawnpunkte auch.",
    ["If it hasn't turned up by level 49, move on."] =
        "Ist es bis Stufe 49 nicht aufgetaucht, mach weiter.",
    ["Stay on the road, then take the trail downhill"] =
        "Bleib auf der Straße, dann nimm den Pfad bergab",
    ["Point it at Gammerita."] =
        "Richte es auf Gammerita.",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "Die Beute: eine zähe Eliteschildkröte mit azurblauem Panzer.",
    ["Look for little blue flasks."] =
        "Such nach kleinen blauen Fläschchen.",
    ["Steer around Revantusk Village."] =
        "Umgehe das Dorf der Revantusk.",
    ["Stay away from Gammerita."] =
        "Halte dich von Gammerita fern.",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "Töte Monster, bis dein Ruhestein wieder bereit ist",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "Das Ziel patrouilliert eine weite Runde gegen den Uhrzeigersinn.",
    ["Watch for a pair of guards hiding in stealth."] =
        "Achte auf zwei getarnte Wachen.",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "Der Spawnpunkt des Ziels ist bei 58.9, 39.3 in Tanaris.",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "Geh den Durchgang hinunter, der nach Lost Rigger Cove führt",
    ["Few kills yield this item."] =
        "Nur wenige Kills bringen diesen Gegenstand.",
    ["Others can be found on raised wood platforms close by."] =
        "Weitere findest du auf erhöhten Holzplattformen in der Nähe.",
    ["Others are indoors too."] =
        "Weitere sind auch drinnen.",
    ["Take the passage out of Lost Rigger Cove"] =
        "Nimm den Durchgang aus Lost Rigger Cove hinaus",
    ["If the NPC is gone, hold on until it reappears."] =
        "Ist der NPC weg, warte, bis er wieder erscheint.",
    ["Search the sand mounds."] =
        "Durchsuche die Sandhügel.",
    ["It competes for spawn points."] =
        "Es teilt sich Spawnpunkte mit anderen.",
    ["Stay clear of the elite tyrannosaur."] =
        "Halte dich vom Elite-Tyrannosaurus fern.",
    ["Every creature in Un'Goro Crater can drop it."] =
        "Jede Kreatur im Krater von Un'Goro kann es fallen lassen.",
    ["Gather from clumps of multicolored crystals."] =
        "Sammle an Haufen bunter Kristalle.",
    ["Spawn points are shared, so pick up every one you find."] =
        "Die Spawnpunkte sind geteilt, also nimm jeden mit, den du findest.",
    ["Gathering it causes other hues to show up."] =
        "Sammelst du einen, erscheinen andere Farben.",
    ["The targets are mobile plant monsters."] =
        "Die Ziele sind wandelnde Pflanzenmonster.",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 50.",
    ["Flight master at Marshal's Refuge"] =
        "Flugmeister von Marschalls Zuflucht",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "In den Tunneln von Maraudon ist das Ziel ein Zentaur in violetter Rüstung.",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "Geh in den lila Flügel der Tunnel von Maraudon.",
    ["Use it on the Spirit of Gelk."] =
        "Benutze es an Spirit of Gelk.",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "Finde in den Tunneln von Maraudon die Kammer zwischen dem lila und dem orangefarbenen Bereich.",
    ["Target the Spirit of Kolk with the item."] =
        "Benutze den Gegenstand an Spirit of Kolk.",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "In den Tunneln von Maraudon, entlang des orangefarbenen Flügels.",
    ["The target is beside the big pool holding orange crystals."] =
        "Das Ziel ist neben dem großen Becken mit orangefarbenen Kristallen.",
    ["Target the Spirit of Magra with it."] =
        "Benutze es an Spirit of Magra.",
    ["Target Spirit of Veng with it."] =
        "Benutze es an Spirit of Veng.",
    ["In the orange area."] =
        "Im orangefarbenen Bereich.",
    ["Use it beside the Vylestem Vines."] =
        "Benutze es neben den Vylestem Vines.",
    ["Look for stumps topped with big leaves."] =
        "Such nach Baumstümpfen mit großen Blättern darauf.",
    ["The spot is in Foulspore Cavern."] =
        "Die Stelle ist in der Foulspore Cavern.",
    ["This happens in Maraudon's violet wing."] =
        "Das passiert im violetten Flügel von Maraudon.",
    ["Aim the item at the Spirit of Maraudos."] =
        "Richte den Gegenstand auf Spirit of Maraudos.",
    ["The target is a spectral centaur holding a spear."] =
        "Das Ziel ist ein geisterhafter Zentaur mit einem Speer.",
    ["Small green flasks."] =
        "Kleine grüne Fläschchen.",
    ["Search the shoreline, right by the waves."] =
        "Such an der Küste, direkt an den Wellen.",
    ["The objective is on the ship's center deck."] =
        "Das Ziel ist auf dem mittleren Deck des Schiffs.",
    ["Search for a parchment roll, white in color."] =
        "Such nach einer weißen Pergamentrolle.",
    ["Search the ship's middle or lowest deck."] =
        "Durchsuche das mittlere oder unterste Deck des Schiffs.",
    ["If she is absent, wait for her to come back."] =
        "Ist sie nicht da, warte, bis sie zurückkommt.",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "Jage einen Eliteraptor der Stufe 43 mit azurblauen Schuppen.",
    ["The quarry is a pale tiger, an elite at 43."] =
        "Die Beute ist ein blasser Tiger, Elite der Stufe 43.",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "Er ruft 2 kleine Helfer niedrigerer Stufe; keiner davon ist Elite.",
    ["When it drops to about 50% health."] =
        "Wenn er auf etwa 50% Gesundheit fällt.",
    ["Look underneath the bridge."] =
        "Schau unter der Brücke nach.",
    ["Hunt flame and stone elementals."] =
        "Jage Feuer- und Steinelementare.",
    ["Fight elementals and golems."] =
        "Kämpfe gegen Elementare und Golems.",
    ["Drop onto the metal catwalk at this spot"] =
        "Lass dich hier auf den Metallsteg fallen",
    ["Drop off the cavern's bridge at this spot"] =
        "Lass dich hier von der Brücke der Höhle fallen",
    ["Go in through the second cave opening"] =
        "Geh durch den zweiten Höhleneingang hinein",
    ["Slave Workers can drop them too."] =
        "Auch Sklavenarbeiter können sie fallen lassen.",
    ["Climb the trail out of the Cauldron"] =
        "Steig den Pfad hinauf aus dem Kessel",
    ["The foes here are elite."] =
        "Die Gegner hier sind Elite.",
    ["Do not leave this quest undone; it matters."] =
        "Lass diese Quest nicht aus; sie ist wichtig.",
    ["The spot is at the tower's upper level."] =
        "Die Stelle ist auf der oberen Ebene des Turms.",
    ["Beware, this foe is elite."] =
        "Vorsicht, dieser Gegner ist Elite.",
    ["Walk over the rope bridge"] =
        "Geh über die Hängebrücke",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "Jage den azurblauen Elitesaurier; er ist Stufe 48.",
    ["The target wanders the trail."] =
        "Das Ziel wandert den Pfad entlang.",
    ["Defeat every foe close by before you begin."] =
        "Besiege vor dem Start alle Gegner in der Nähe.",
    ["Escort Dorius Stonetender and keep him safe."] =
        "Begleite Dorius Stonetender und beschütze ihn.",
    ["Keep it; a later quest calls for it."] =
        "Behalte es; eine spätere Quest braucht es.",
    ["Look by the lookout towers ringing the Cauldron."] =
        "Such bei den Wachtürmen rund um den Kessel.",
    ["Climb the trail into Thorium Point"] =
        "Steig den Pfad hinauf zur Thoriumspitze",
    ["Blasted Lands and Burning Steppes"] =
        "Verwüstete Lande und Brennende Steppe",
    ["Prioritize these targets."] =
        "Kümmere dich zuerst um diese Ziele.",
    ["Hunt basilisks."] =
        "Jage Basilisken.",
    ["They appear in the same spots as the boars."] =
        "Sie erscheinen an denselben Stellen wie die Eber.",
    ["Hunt hyenas for these."] =
        "Jage dafür Hyänen.",
    ["Scorpions spawn in the same spots."] =
        "Skorpione erscheinen an denselben Stellen.",
    ["Climb the trail to Morgan's Vigil"] =
        "Steig den Pfad hinauf zu Morgans Wacht",
    ["Flight master at Morgan's Vigil"] =
        "Flugmeister von Morgans Wacht",
    ["8 different quests will ask for it."] =
        "8 verschiedene Quests verlangen es.",
    ["You hand in 60 pieces of cloth for every quest."] =
        "Für jede Quest gibst du 60 Stoff ab.",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "Untote Gegner lassen sie in beiden Pestländern fallen, im Westen wie im Osten.",
    ["Keep your Argent Dawn Commission aura up."] =
        "Halte die Aura von Argent Dawn Commission aktiv.",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 52.",
    ["Azshara and Felwood"] =
        "Azshara und Teufelswald",
    ["A lengthy stretch of questing lies ahead."] =
        "Eine lange Questphase liegt vor dir.",
    ["Hand these in afterwards for experience and reputation."] =
        "Gib sie danach für Erfahrung und Ruf ab.",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "Steigere deinen Ruf bei der Holzschlundfeste auf Unfreundlich",
    ["Extra targets wait in the caves."] =
        "Weitere Ziele warten in den Höhlen.",
    ["Stay on the trail to reach Jaedenar"] =
        "Bleib auf dem Pfad bis Jaedenar",
    ["Climb the trail into Jadefire Run"] =
        "Steig den Pfad hinauf nach Jadefire Run",
    ["Flight master at Talonbranch Glade"] =
        "Flugmeister von Talonbranch Glade",
    ["Big blue plumes."] =
        "Große blaue Federn.",
    ["Head eastward as you go."] =
        "Arbeite dich dabei nach Osten vor.",
    ["You pick up Claw (Rank 7) here."] =
        "Hier lernst du Klaue (Rang 7).",
    ["Flight master at Everlook"] =
        "Flugmeister der Ewigen Warte",
    ["The flight master stands past the walls, outdoors."] =
        "Der Flugmeister steht draußen, hinter den Mauern.",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "Zähme einen Angerclaw Mauler mit deinem Zauber Wildtier zähmen.",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "Spür einen verseuchten Bären mit kastanienbraunem Fell auf.",
    ["Feralas and Azshara"] =
        "Feralas und Azshara",
    ["Aim the item at the Strider foes."] =
        "Richte den Gegenstand auf die Schreiter-Gegner.",
    ["The targets are towering green giants."] =
        "Die Ziele sind turmhohe grüne Riesen.",
    ["The item strips their elite status."] =
        "Der Gegenstand nimmt ihnen den Elitestatus.",
    ["Hunt down the elementals formed of water."] =
        "Jage die Elementare aus Wasser.",
    ["Reveal Dire Maul on your map"] =
        "Deck Düsterbruch auf deiner Karte auf",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "Stell dich auf den benachbarten Vorsprung, dann spring in diesen Spalt in der Mauer",
    ["Hop onto the ledge"] =
        "Spring auf den Vorsprung",
    ["Leap over at this spot"] =
        "Spring hier hinüber",
    ["Leap up at this spot"] =
        "Spring hier hinauf",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "Shay Leafrunner folgt dir; halte sie am Leben.",
    ["Keep near her, as she tends to stray."] =
        "Bleib in ihrer Nähe, sie läuft gern weg.",
    ["Finish the quest named The Videre Elixir."] =
        "Schließe die Quest The Videre Elixir ab.",
    ["Keep the elixir in your bags; never consume it."] =
        "Behalte das Elixier in deinen Taschen; trink es nie.",
    ["You will die from it."] =
        "Du stirbst daran.",
    ["Put these items in your bank vault."] =
        "Leg diese Gegenstände in dein Bankfach.",
    ["The quest giver waits on the hilltop."] =
        "Der Questgeber wartet oben auf dem Hügel.",
    ["The targets are Myrmidons and Sirens."] =
        "Die Ziele sind Myrmidonen und Sirenen.",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "Umgehe die Ruinen von Eldarath, dann nimm die Brücke hinüber",
    ["Drop down with care"] =
        "Lass dich vorsichtig hinunter",
    ["The spot is the middle of the timber deck."] =
        "Die Stelle ist die Mitte des Holzdecks.",
    ["It shows up close by after a while."] =
        "Es erscheint nach einer Weile in der Nähe.",
    ["At times it takes several minutes."] =
        "Manchmal dauert es mehrere Minuten.",
    ["The targets are flame elementals."] =
        "Die Ziele sind Feuerelementare.",
    ["An elite foe waits on the summit; steer clear."] =
        "Auf dem Gipfel wartet ein Elitegegner; halte dich fern.",
    ["Ringo trails behind you; keep him alive."] =
        "Ringo folgt dir; halte ihn am Leben.",
    ["Keep near him; he passes out."] =
        "Bleib in seiner Nähe; er wird ohnmächtig.",
    ["Take the trail through the cavern"] =
        "Nimm den Pfad durch die Höhle",
    ["Escort A-Me 01 and keep it alive."] =
        "Begleite A-Me 01 und halte es am Leben.",
    ["Winterspring and Felwood"] =
        "Winterquell und Teufelswald",
    ["Go into Jaedenar"] =
        "Geh nach Jaedenar hinein",
    ["Go to the upper floor of the cavern."] =
        "Geh auf die obere Ebene der Höhle.",
    ["Circle the gap in the ground, then take the trail downward"] =
        "Geh um die Spalte im Boden herum, dann nimm den Pfad nach unten",
    ["The target is deep in the cave, on its lowest floor."] =
        "Das Ziel ist tief in der Höhle, auf der untersten Ebene.",
    ["Search the upper and lower floors of the cavern."] =
        "Durchsuche die obere und untere Ebene der Höhle.",
    ["The prisoner is held in a cage of yellow wood."] =
        "Der Gefangene sitzt in einem Käfig aus gelbem Holz.",
    ["Climb the trail and exit the cavern"] =
        "Steig den Pfad hinauf und verlass die Höhle",
    ["The targets are furbolgs."] =
        "Die Ziele sind Furbolgs.",
    ["With the coming hand-ins, this brings you to level 55."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 55.",
    ["A tough quest lies just ahead."] =
        "Gleich kommt eine schwere Quest.",
    ["Flee if things go badly."] =
        "Flieh, wenn es schlecht läuft.",
    ["The NPC is a human spirit."] =
        "Der NPC ist ein menschlicher Geist.",
    ["The targets are leafless trees that walk."] =
        "Die Ziele sind wandelnde Bäume ohne Blätter.",
    ["Slay the greenish beings of living water."] =
        "Töte die grünlichen Wesen aus lebendem Wasser.",
    ["The targets are wolves and bears."] =
        "Die Ziele sind Wölfe und Bären.",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "Die Ziele sind 3 weiße Furbolgs, die als Gruppe unterwegs sind.",
    ["The target patrols a long route beside the road."] =
        "Das Ziel patrouilliert eine lange Strecke neben der Straße.",
    ["Move on if you have not seen it once the trail ends."] =
        "Hast du es am Ende des Pfads nicht gesehen, mach weiter.",
    ["Escort Ranshalla and guard her."] =
        "Begleite Ranshalla und beschütze sie.",
    ["Wait until the foes hit her before you strike."] =
        "Warte, bis die Gegner sie angreifen, bevor du zuschlägst.",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "Sie erscheinen nahe 28.1, 35.0 in Winterquell.",
    ["You can also do dungeons until you hit level 56."] =
        "Du kannst auch Dungeons laufen, bis du Stufe 56 erreichst.",
    ["Give Nafien the items in sets of 5."] =
        "Gib Nafien die Gegenstände in 5er-Sätzen.",
    ["Every full set you hand over earns 50 reputation."] =
        "Jeder volle Satz, den du abgibst, bringt 50 Ruf.",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "Steigere deinen Ruf bei der Holzschlundfeste auf Neutral",
    ["The NPC stands within the passage."] =
        "Der NPC steht im Durchgang.",
    ["This foe is elite."] =
        "Dieser Gegner ist Elite.",
    ["Target Black Broodlings with the item."] =
        "Benutze den Gegenstand an Black Broodlings.",
    ["A red crystal hovers over each body."] =
        "Über jeder Leiche schwebt ein roter Kristall.",
    ["Hunt the huge red dragons."] =
        "Jage die riesigen roten Drachen.",
    ["Look for gray standing stones."] =
        "Such nach grauen Menhiren.",
    ["The target is an ogre."] =
        "Das Ziel ist ein Oger.",
    ["Watch out, its blows are strong."] =
        "Vorsicht, seine Schläge sind stark.",
    ["The targets are wolves and orcs."] =
        "Die Ziele sind Wölfe und Orcs.",
    ["The NPC is an elderly human lady."] =
        "Der NPC ist eine ältere Menschenfrau.",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "Ist sie nicht da, kann sie im Obergeschoss des Hauses sein, bei 52.4, 42.1 in Sturmwind.",
    ["Walk over the rope bridge, then climb the trail"] =
        "Geh über die Hängebrücke, dann steig den Pfad hinauf",
    ["The Plaguelands"] =
        "Die Pestländer",
    ["Check each of the two floors indoors."] =
        "Sieh dir drinnen beide Stockwerke an.",
    ["Stand at the watchtower's doorway."] =
        "Stell dich in den Eingang des Wachturms.",
    ["An elite foe waits indoors; stay clear of it."] =
        "Drinnen wartet ein Elitegegner; halte dich von ihm fern.",
    ["Spiders also appear at these spawn spots."] =
        "An diesen Spawnpunkten erscheinen auch Spinnen.",
    ["Look for a white set of bones."] =
        "Such nach weißen Knochen.",
    ["The targets appear in several places."] =
        "Die Ziele erscheinen an mehreren Stellen.",
    ["Finish Locked Away to obtain this."] =
        "Schließe Locked Away ab, um das zu bekommen.",
    ["The target is a ghoul armed with a pitchfork."] =
        "Das Ziel ist ein Ghul mit einer Mistgabel.",
    ["Elites roam close by; keep your distance."] =
        "In der Nähe streifen Elitegegner umher; halte Abstand.",
    ["Search the bones of a fallen person."] =
        "Durchsuche die Gebeine eines Gefallenen.",
    ["The NPC is within the ruined home."] =
        "Der NPC ist im zerstörten Haus.",
    ["Search within the houses here."] =
        "Such hier in den Häusern.",
    ["Look for big yellow grubs."] =
        "Such nach großen gelben Maden.",
    ["With the coming hand-ins, this gets you to level 58."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 58.",
    ["Flight master at Light's Hope Chapel"] =
        "Flugmeister der Kapelle des Hoffnungsvollen Lichts",
    ["Look for big rocks seeping green slime."] =
        "Such nach großen Felsen, aus denen grüner Schleim sickert.",
    ["Progress westward as you go."] =
        "Arbeite dich dabei nach Westen vor.",
    ["Other undead compete for the same spawn points."] =
        "Andere Untote teilen sich dieselben Spawnpunkte.",
    ["The spirits rise where those foes die."] =
        "Die Geister erheben sich dort, wo diese Gegner sterben.",
    ["Go down into the tomb"] =
        "Geh hinunter in die Gruft",
    ["This is below ground, on the crypt's lower floor."] =
        "Das ist unter der Erde, auf der unteren Ebene der Krypta.",
    ["Your character must be seated first."] =
        "Dein Charakter muss zuerst sitzen.",
    ["Move the camera close and check which book is genuine."] =
        "Fahr mit der Kamera nah heran und prüfe, welches Buch echt ist.",
    ["Some books are traps that summon foes."] =
        "Manche Bücher sind Fallen, die Gegner beschwören.",
    ["The genuine book can look two ways:"] =
        "Das echte Buch kann auf zwei Arten aussehen:",
    ["Close to the big buildings lit in blue."] =
        "Nahe den großen, blau beleuchteten Gebäuden.",
    ["A new one may appear when one is killed."] =
        "Wenn einer getötet wird, kann ein neuer erscheinen.",
    ["The targets are in the ruined houses."] =
        "Die Ziele sind in den zerstörten Häusern.",
    ["It shows up on top of the box."] =
        "Es erscheint oben auf der Kiste.",
    ["Targets are in the tower and around its base."] =
        "Die Ziele sind im Turm und rund um seinen Fuß.",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "Steht ein Elitegegner auf dem Turmdach, bleib draußen.",
    ["Pick up Claw (Rank 8) for your pet."] =
        "Hol dir Klaue (Rang 8) für dein Tier.",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "Zähme einen Winterspring Screecher mit dem Zauber Wildtier zähmen.",
    ["Hunt the white owls."] =
        "Jage die weißen Eulen.",
    ["Either the patriarch or the matriarch yetis work."] =
        "Die Yeti-Patriarchen und die Yeti-Matriarchen zählen beide.",
    ["Climb across the mountain to the far side"] =
        "Kletter über den Berg auf die andere Seite",
    ["Hunt the chimaeras."] =
        "Jage die Schimären.",
    ["Target Legacki with the item."] =
        "Benutze den Gegenstand an Legacki.",
    ["Target Sprinkle with it."] =
        "Benutze es an Sprinkle.",
    ["Target Quixxil with it."] =
        "Benutze es an Quixxil.",
    ["Flight master at Cenarion Hold"] =
        "Flugmeister von Burg Cenarius",
    ["Watch out: killing them can summon more foes."] =
        "Vorsicht: Wenn du sie tötest, können weitere Gegner erscheinen.",
    ["Look for fragments of rock that glow blue."] =
        "Such nach blau leuchtenden Gesteinsbrocken.",
    ["Roam the area where the insects swarm."] =
        "Streif durch das Gebiet, in dem die Insekten schwärmen.",
    ["Hunt the gray scorpids."] =
        "Jage die grauen Skorpide.",
    ["The target is an orc wearing violet robes."] =
        "Das Ziel ist ein Orc in violetten Roben.",
    ["It shows up around here."] =
        "Es erscheint hier in der Gegend.",
    ["Hunt the yellow scorpids."] =
        "Jage die gelben Skorpide.",
    ["Target the burrowing worms."] =
        "Nimm die grabenden Würmer ins Ziel.",
    ["This number shrinks while you kill monsters."] =
        "Diese Zahl sinkt, während du Monster tötest.",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "Bring alle gesammelten Federn zum NPC bei 64.8, 8.1.",
    ["The NPC stands outdoors, next to the crypt."] =
        "Der NPC steht draußen neben der Krypta.",
    ["The targets are bats."] =
        "Die Ziele sind Fledermäuse.",
    ["Check in and around the structures."] =
        "Sieh in den Gebäuden und drumherum nach.",
    ["With the coming hand-ins, this gets you to level 5."] =
        "Mit den nächsten Abgaben bringt dich das auf Stufe 5.",
    ["The target is a shambling zombie."] =
        "Das Ziel ist ein schlurfender Zombie.",
    ["The quest giver is an abomination."] =
        "Der Questgeber ist eine Monstrosität.",
    ["He may step off the road now and then to pick plants."] =
        "Er verlässt ab und zu die Straße, um Pflanzen zu pflücken.",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "Heile Todeswache Kel mit Geringes Heilen (Rang 2).",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "Buffe Todeswache Kel mit Machtwort: Seelenstärke.",
    ["The targets are gray, demon-like hounds."] =
        "Die Ziele sind graue, dämonenartige Hunde.",
    ["The targets are zombies."] =
        "Die Ziele sind Zombies.",
    ["Look for wilted violet weeds."] =
        "Such nach verwelktem violettem Unkraut.",
    ["Walk the shoreline toward the southwest."] =
        "Geh die Küste entlang nach Südwesten.",
    ["If the beach ends first, move on without it."] =
        "Endet der Strand vorher, zieh ohne es weiter.",
    ["Keep to the trail as it curves."] =
        "Folge dem Pfad durch seine Kurven.",
    ["Step into the flames."] =
        "Tritt in die Flammen.",
    ["Stay on the trail and keep climbing the steps"] =
        "Bleib auf dem Pfad und steig weiter die Treppe hinauf",
    ["Loot the gray chests built from metal."] =
        "Plündere die grauen Metalltruhen.",
    ["Search in and around the sunken wrecks."] =
        "Such in und um die versunkenen Wracks.",
    ["The target is a troll in crimson robes."] =
        "Das Ziel ist ein Troll in purpurroter Robe.",
    ["Look for the skull-shaped objects."] =
        "Such nach den schädelförmigen Objekten.",
    ["The targets are clumps of purple eggs."] =
        "Die Ziele sind Haufen violetter Eier.",
    ["Search close to the trunks."] =
        "Such nahe den Baumstämmen.",
    ["Stay on the trail, then cross the tunnel"] =
        "Bleib auf dem Pfad, dann durchquere den Tunnel",
    ["Traverse the passageway"] =
        "Durchquere den Durchgang",
    ["Fly to Orgrimmar"] =
        "Flieg nach Orgrimmar",
    ["The quest comes from a bounty sign."] =
        "Die Quest stammt von einem Kopfgeldaushang.",
    ["Look for an iron slab marked with a skull."] =
        "Such nach einer Eisenplatte mit einem Schädel darauf.",
    ["Use the item at the pink marking."] =
        "Benutze den Gegenstand an der rosa Markierung.",
    ["Move gradually northwest toward Agamand Mills."] =
        "Bewege dich nach und nach Richtung Nordwesten zu Agamands Mühlen.",
    ["The target is a skeletal caster in armor."] =
        "Das Ziel ist ein gepanzerter Skelett-Zauberwirker.",
    ["The target is a banshee."] =
        "Das Ziel ist eine Banshee.",
    ["The targets are skeletons in armor."] =
        "Die Ziele sind gepanzerte Skelette.",
    ["The targets are skeletal mages."] =
        "Die Ziele sind Skelettmagier.",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 13.",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "Das Ziel patrouilliert auf der Straße von Brill zum Grabmal.",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "Das Ziel erscheint nahe dem Grabmal, bei 47.5, 39.8 im Silberwald.",
    ["Fight quilboars."] =
        "Kämpfe gegen Stacheleber.",
    ["Look for little brown pinecones."] =
        "Such nach kleinen braunen Tannenzapfen.",
    ["Hunt the black-feathered birds."] =
        "Jage die schwarz gefiederten Vögel.",
    ["Look for gray slabs of stone lying flat."] =
        "Such nach flach liegenden grauen Steinplatten.",
    ["Do not trail after the wolf."] =
        "Folge dem Wolf nicht.",
    ["Take the lift to the top of Thunder Bluff"] =
        "Fahr mit dem Aufzug ganz nach oben auf Donnerfels",
    ["Beside the forge."] =
        "Neben der Esse.",
    ["Take a lift down out of Thunder Bluff"] =
        "Fahr mit einem Aufzug hinunter und verlass Donnerfels",
    ["Aim the item at one Adult Plainstrider."] =
        "Richte den Gegenstand auf einen ausgewachsenen Ebenenschreiter.",
    ["Target a Prairie Stalker with it."] =
        "Ziele damit auf einen Prairie Stalker.",
    ["Use the item on any Swoop."] =
        "Benutze den Gegenstand an einem beliebigen Swoop.",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "Wähle ein Tier der Stufe 9-10 und mach es mit dem Zauber Wildtier zähmen zu deinem Tier.",
    ["This pet is temporary; a lasting one comes shortly."] =
        "Dieses Tier ist nur vorübergehend; ein dauerhaftes folgt bald.",
    ["Flight master at Camp Taurajo"] =
        "Flugmeister im Camp Taurajo",
    ["Fly to Thunder Bluff"] =
        "Flieg nach Donnerfels",
    ["Stick to the road and stay alert."] =
        "Bleib auf der Straße und sei wachsam.",
    ["Flight master at the Crossroads"] =
        "Flugmeister am Wegekreuz",
    ["This is food for your pet."] =
        "Das ist Futter für dein Tier.",
    ["A spirit shows up after this."] =
        "Danach erscheint ein Geist.",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "Such einen Venomtail Scorpid und wirke Wildtier zähmen auf ihn.",
    ["Release your current pet before this."] =
        "Lass vorher dein aktuelles Tier frei.",
    ["Here you tame a pet to keep."] =
        "Hier zähmst du ein Tier, das du behältst.",
    ["The NPC waits at the mountain's summit."] =
        "Der NPC wartet auf dem Gipfel des Berges.",
    ["Kill Water Seekers and Thornweavers."] =
        "Töte Wassersucher und Dornenweber.",
    ["The objective is at the far end."] =
        "Das Ziel ist am hinteren Ende.",
    ["Receive Sapta Sight"] =
        "Erhalte Sapta Sight",
    ["The quest giver stands among the boulders."] =
        "Der Questgeber steht zwischen den Felsbrocken.",
    ["This NPC is found down in the Cleft of Shadow."] =
        "Dieser NPC ist unten in der Kluft der Schatten.",
    ["This clears the quest's time limit."] =
        "Damit entfällt das Zeitlimit der Quest.",
    ["Fly to Undercity"] =
        "Flieg nach Unterstadt",
    ["Orc and Troll start"] =
        "Start: Orc und Troll",
    ["Stay out of the cave when you can."] =
        "Bleib nach Möglichkeit aus der Höhle draußen.",
    ["The following step is out of the cave."] =
        "Der nächste Schritt ist außerhalb der Höhle.",
    ["Look for a dark-shelled scorpion."] =
        "Such nach einem Skorpion mit dunklem Panzer.",
    ["Target Lazy Peons with the item."] =
        "Ziele mit dem Gegenstand auf faule Peons.",
    ["The targets are dozing orcs."] =
        "Die Ziele sind dösende Orcs.",
    ["Look for cacti bearing red fruit."] =
        "Such nach Kakteen mit roten Früchten.",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "Heile Grunzer Kor'ja mit Rang 2 von Geringes Heilen.",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "Buffe Grunzer Kor'ja mit Machtwort: Seelenstärke.",
    ["Aim the item at one Dire Mottled Boar."] =
        "Richte den Gegenstand auf einen Dire Mottled Boar.",
    ["Use it on any Surf Crawler."] =
        "Benutze es an einem beliebigen Surf Crawler.",
    ["Use it on any Armored Scorpid."] =
        "Benutze es an einem beliebigen gepanzerten Skorpid.",
    ["This leads to a quest for later levels."] =
        "Das führt zu einer Quest für spätere Stufen.",
    ["Escort Deathstalker Erland and keep him alive."] =
        "Eskortiere Todespirscher Erland und halte ihn am Leben.",
    ["Hunt the wolves whose fur is jet black."] =
        "Jage die Wölfe mit pechschwarzem Fell.",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "Such dir einen Ferocious Grizzled Bear aus und zähme ihn mit Wildtier zähmen.",
    ["Fly to The Sepulcher"] =
        "Flieg zum Grabmal",
    ["He has three ghouls at his side."] =
        "Er hat drei Ghule an seiner Seite.",
    ["Hold off until one steps out, then slay it."] =
        "Warte, bis einer herauskommt, und töte ihn dann.",
    ["The target shows up here sooner or later."] =
        "Das Ziel taucht hier früher oder später auf.",
    ["The NPC is on Undercity's upper level."] =
        "Der NPC ist auf der oberen Ebene von Unterstadt.",
    ["The NPC is in a little cave."] =
        "Der NPC ist in einer kleinen Höhle.",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "Der NPC ist hinter der großen Troggkammer, auf ihrer rechten Seite.",
    ["The quest giver waits in the tent."] =
        "Der Questgeber wartet im Zelt.",
    ["Move on if it is absent."] =
        "Zieh weiter, wenn es nicht da ist.",
    ["If it isn't there, hold on until it shows up."] =
        "Ist es nicht da, warte, bis es auftaucht.",
    ["Circle the mountain by its northern flank."] =
        "Umrunde den Berg an seiner Nordflanke.",
    ["The target is a troll."] =
        "Das Ziel ist ein Troll.",
    ["The target is a human in a crimson long coat."] =
        "Das Ziel ist ein Mensch in einem purpurroten Mantel.",
    ["The targets are the striped zhevras."] =
        "Die Ziele sind die gestreiften Zhevras.",
    ["Go into the water beside the rock that bubbles."] =
        "Geh ins Wasser neben dem blubbernden Felsen.",
    ["Look for big blue fungi."] =
        "Such nach großen blauen Pilzen.",
    ["Up to two foes might jump you."] =
        "Bis zu zwei Gegner können dich angreifen.",
    ["Kill the purple raptors."] =
        "Töte die violetten Raptoren.",
    ["Targets are found across the entire Barrens."] =
        "Ziele gibt es im ganzen Brachland.",
    ["Slay any you come across along the way."] =
        "Töte alle, denen du unterwegs begegnest.",
    ["With the coming hand-ins, this gets you to level 18."] =
        "Mit den kommenden Abgaben bringt dich das auf Stufe 18.",
    ["Steal from Gamon using Pick Pocket."] =
        "Bestiehl Gamon mit Taschendiebstahl.",
    ["Use it on Tazan's Satchel."] =
        "Benutze es an Tazan's Satchel.",
    ["The item is already in your inventory."] =
        "Der Gegenstand ist schon in deinem Inventar.",
    ["Check the upper and lower tiers of the structure."] =
        "Sieh auf der oberen und der unteren Ebene des Bauwerks nach.",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "Eskortiere Wizzlecrank's Shredder und halte ihn heil.",
    ["Look for gray steel pails."] =
        "Such nach grauen Stahleimern.",
    ["The target is a pale lion."] =
        "Das Ziel ist ein blasser Löwe.",
    ["It turns up in the area."] =
        "Es taucht in der Gegend auf.",
    ["Keep away from Sister Rathtalon."] =
        "Halte dich von Schwester Rathtalon fern.",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "Das Ziel ist eine Harpyie mit smaragdgrünem Gefieder; Vorsicht, sie ist ein Elite.",
    ["The target circles in the air, so search around."] =
        "Das Ziel kreist in der Luft, also such die Umgebung ab.",
    ["A small chest made of wood."] =
        "Eine kleine Holztruhe.",
    ["Polly is the target for the item."] =
        "Polly ist das Ziel für den Gegenstand.",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "Besiege Kolkar-Gegner rund um die Stagnant Oasis.",
    ["Sooner or later a yell shows up in the chat window."] =
        "Früher oder später erscheint ein Ruf im Chatfenster.",
    ["Watch for his yell: I am summoned!"] =
        "Achte auf seinen Ruf: Ich wurde gerufen!",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "Verog erscheint, nachdem ein Ruf Eindringlinge herausfordert, in sein Zelt zu kommen und zu sterben.",
    ["Escort Kaya Flathoof and keep her safe."] =
        "Eskortiere Kaya Flathoof und beschütze sie.",
    ["Close to the finish, 3 foes ambush you together."] =
        "Kurz vor dem Ziel greifen dich 3 Gegner gleichzeitig aus dem Hinterhalt an.",
    ["Fly to Sun Rock Retreat"] =
        "Flieg zum Sonnenfels",
    ["Gather the big, white eggs."] =
        "Sammle die großen weißen Eier.",
    ["Monsters might jump you here."] =
        "Hier können dich Monster angreifen.",
    ["Hatchling spiders may bring a level 22 spider."] =
        "Jungspinnen können eine Spinne der Stufe 22 mitbringen.",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 20.",
    ["Look for a kodo with grey hide."] =
        "Such nach einem Kodo mit grauer Haut.",
    ["The targets are big pink lizards."] =
        "Die Ziele sind große rosa Echsen.",
    ["The targets are under the water and along the shore."] =
        "Die Ziele sind unter Wasser und am Ufer.",
    ["The target is a raptor."] =
        "Das Ziel ist ein Raptor.",
    ["Trade your Blood Shards to gain buffs."] =
        "Tausch deine Blutsplitter gegen Buffs ein.",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "Gib ihm beim Questen im Brachland deine übrigen Blutsplitter.",
    ["Ask him for the Spirit of the Wind buff"] =
        "Bitte ihn um den Buff Geist des Windes",
    ["Hunt the winged serpents."] =
        "Jage die geflügelten Schlangen.",
    ["Take the lift up into Thunder Bluff"] =
        "Fahr mit dem Aufzug hinauf nach Donnerfels",
    ["The object is a vase woven from wicker."] =
        "Das Objekt ist eine aus Weide geflochtene Vase.",
    ["They appear in scattered spots."] =
        "Sie erscheinen an verstreuten Stellen.",
    ["Climb the mountainside"] =
        "Steig den Berghang hinauf",
    ["Descend the slope"] =
        "Steig den Hang hinunter",
    ["Drop with care onto the rock, then go into the cave"] =
        "Lass dich vorsichtig auf den Felsen fallen, dann geh in die Höhle",
    ["The targets are oozes."] =
        "Die Ziele sind Schleime.",
    ["Look for little green shrubs bearing violet blooms."] =
        "Such nach kleinen grünen Sträuchern mit violetten Blüten.",
    ["A centaur flanked by two bodyguards."] =
        "Ein Zentaur zwischen zwei Leibwächtern.",
    ["Climb the trail and cross the peaks"] =
        "Steig den Pfad hinauf und überquere die Gipfel",
    ["Look for a robot shaped like a person."] =
        "Such nach einem menschenförmigen Roboter.",
    ["The target appears right here."] =
        "Das Ziel erscheint genau hier.",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "Nimm den Durchgang und folge dem Laternenpfad ins Eschental",
    ["Stay clear of Astranaar."] =
        "Halte dich von Astranaar fern.",
    ["Exit the tunnel into Ashenvale"] =
        "Verlass den Tunnel ins Eschental",
    ["Flight master at Zoram'gar Outpost"] =
        "Flugmeister im Außenposten von Zoram'gar",
    ["The NPC waits within the hut."] =
        "Der NPC wartet in der Hütte.",
    ["Use it twice on Taskmaster Fizzule."] =
        "Benutze es zweimal an Taskmaster Fizzule.",
    ["A short way north of here."] =
        "Ein kurzes Stück nördlich von hier.",
    ["Target Taskmaster Fizzule and salute him."] =
        "Nimm Taskmaster Fizzule ins Ziel und salutiere vor ihm.",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "Bestiehl Vorarbeiter Silixiz mit Taschendiebstahl.",
    ["Open with Ambush for a bigger hit."] =
        "Eröffne mit Hinterhalt für einen stärkeren Treffer.",
    ["Lean on Rupture for bonus damage."] =
        "Setz auf Blutung für zusätzlichen Schaden.",
    ["Eviscerate adds a burst of damage here."] =
        "Ausweiden bringt hier einen Schadensschub.",
    ["The objective is on the terrace above."] =
        "Das Ziel ist auf der Terrasse darüber.",
    ["Use Pick Lock to open it."] =
        "Öffne es mit Schloss knacken.",
    ["Poison crafting needs these."] =
        "Die brauchst du zum Herstellen von Giften.",
    ["Flight master at Tarren Mill"] =
        "Flugmeister in Tarrens Mühle",
    ["Get rid of your Touch of Zanzil."] =
        "Werde deinen Touch of Zanzil los.",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "Such dir einen beliebigen Gray Bear aus und wirke Wildtier zähmen auf ihn.",
    ["Go into Durnholde Keep, then over the bridge"] =
        "Geh in die Burg Durnholde, dann über die Brücke",
    ["Look for it bound to the orc's leg."] =
        "Du findest es am Bein des Orcs festgebunden.",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 23.",
    ["Indoors or out in the open fields."] =
        "Drinnen oder draußen auf den offenen Feldern.",
    ["It may be found outdoors too."] =
        "Es kann auch draußen sein.",
    ["The NPC is a little wolf."] =
        "Der NPC ist ein kleiner Wolf.",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "Nach der Abgabe der Quest dreht er durch und greift dich an.",
    ["A woman holding a pitchfork."] =
        "Eine Frau mit einer Mistgabel.",
    ["The target patrols the trail between the houses."] =
        "Das Ziel patrouilliert auf dem Weg zwischen den Häusern.",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "Der Spawnpunkt des Ziels ist bei 30.5, 40.6 im Vorgebirge des Hügellands.",
    ["With the coming hand-ins, this brings you to level 24."] =
        "Mit den kommenden Abgaben bringt dich das auf Stufe 24.",
    ["Tougher foes are coming up next."] =
        "Als Nächstes kommen stärkere Gegner.",
    ["Some may be in the smithy."] =
        "Einige können in der Schmiede sein.",
    ["The NPC is in the yard where black wolves roam."] =
        "Der NPC ist im Hof, in dem schwarze Wölfe umherstreifen.",
    ["Do this once the prisoner is free."] =
        "Mach das, sobald der Gefangene frei ist.",
    ["The tome is blue, resting on a bookshelf."] =
        "Der Foliant ist blau und liegt auf einem Bücherregal.",
    ["Look in the room where Fenrus is."] =
        "Sieh im Raum nach, in dem Fenrus ist.",
    ["The target is a dinosaur with blue hide."] =
        "Das Ziel ist ein Dinosaurier mit blauer Haut.",
    ["Look for big boulders oozing green fluid."] =
        "Such nach großen Felsbrocken, aus denen grüne Flüssigkeit sickert.",
    ["The target is a quilboar robed in red."] =
        "Das Ziel ist ein Stacheleber in roter Robe.",
    ["Kill Stalkers and Pathfinders."] =
        "Töte Pirscher und Pfadfinder.",
    ["The target is a red winged serpent."] =
        "Das Ziel ist eine rote geflügelte Schlange.",
    ["The target roams; check the area."] =
        "Das Ziel streift umher; such die Gegend ab.",
    ["Keep some range when you use the item."] =
        "Halte etwas Abstand, wenn du den Gegenstand benutzt.",
    ["With the coming hand-ins, this gets you to level 25."] =
        "Mit den kommenden Abgaben bringt dich das auf Stufe 25.",
    ["Fly to Brackenwall Village"] =
        "Flieg nach Brackenwall Village",
    ["The target is an aquatic dinosaur."] =
        "Das Ziel ist ein Wasserdinosaurier.",
    ["The target roams through the water."] =
        "Das Ziel streift durchs Wasser.",
    ["The target is beneath the platform."] =
        "Das Ziel ist unter der Plattform.",
    ["The target stands atop the timber platform."] =
        "Das Ziel steht oben auf der Holzplattform.",
    ["Exit Windshear Crag"] =
        "Verlass Windshear Crag",
    ["The targets are deer."] =
        "Die Ziele sind Hirsche.",
    ["The targets are tiny blue dragons."] =
        "Die Ziele sind winzige blaue Drachen.",
    ["Hunt the green slimes."] =
        "Jage die grünen Schleime.",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "Corrosive Sap Beasts nutzen dieselben Spawnpunkte.",
    ["Do not engage Sentinel Amarassan."] =
        "Greif Schildwache Amarassan nicht an.",
    ["The quarry is a kaldorei elite, level 27."] =
        "Das Ziel ist ein Kaldorei-Elite, Stufe 27.",
    ["Exit Stonetalon Peak"] =
        "Verlass den Steinkrallengipfel",
    ["Look for brown pinecones on the ground."] =
        "Such nach braunen Tannenzapfen am Boden.",
    ["Steer clear of the elite windstrider."] =
        "Halte dich vom Elite-Windschreiter fern.",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "Basilisken und wandelnde Baumwesen teilen sich diese Spawnpunkte.",
    ["Monsters are found throughout the Charred Vale."] =
        "Monster gibt es überall im Charred Vale.",
    ["Take the trail toward Sun Rock Retreat"] =
        "Nimm den Pfad Richtung Sonnenfels",
    ["Stay on the trail until the Charred Vale"] =
        "Bleib auf dem Pfad bis zum Charred Vale",
    ["The NPC is on the tower's middle floor."] =
        "Der NPC ist im mittleren Stockwerk des Turms.",
    ["Flight master at Splintertree Post"] =
        "Flugmeister im Splitterholzposten",
    ["The targets are night elves hiding in stealth."] =
        "Die Ziele sind getarnte Nachtelfen.",
    ["Track Hidden makes them simpler to spot."] =
        "Mit Verborgenes aufspüren entdeckst du sie leichter.",
    ["Escort Torek and guard him."] =
        "Eskortiere Torek und beschütze ihn.",
    ["Don't let him die."] =
        "Lass ihn nicht sterben.",
    ["Take the riverside trail, then climb this trail"] =
        "Nimm den Pfad am Fluss, dann steig diesen Pfad hinauf",
    ["The target is a panther with black fur."] =
        "Das Ziel ist ein Panther mit schwarzem Fell.",
    ["The target roams a wide route."] =
        "Das Ziel läuft eine weite Route ab.",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "Das Ziel erscheint nahe 62.4, 50.0 im Eschental.",
    ["Take the trail north into Thistlefur Hold"] =
        "Nimm den Pfad nach Norden bis in Thistlefur Hold",
    ["Search the brown crates built of timber."] =
        "Durchsuche die braunen Holzkisten.",
    ["Mostly on the cavern's upper level."] =
        "Meist auf der oberen Ebene der Höhle.",
    ["The NPC is on the cave's lowest level."] =
        "Der NPC ist auf der untersten Ebene der Höhle.",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "Eskortiere Ruul Snowhoof und halte ihn am Leben.",
    ["Look for a gray druid-style bear."] =
        "Such nach einem grauen Bären im Druidenstil.",
    ["The target is a watery being tinted a deeper green."] =
        "Das Ziel ist ein Wasserwesen in dunklerem Grün.",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 28.",
    ["Steer away from Silverwind Refuge."] =
        "Halte dich von der Silberwindzuflucht fern.",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "Steig den Pfad hinauf, dann kehr über die Straße zum Splitterholzposten zurück",
    ["Escort Muglash and keep him safe."] =
        "Eskortiere Muglash und beschütze ihn.",
    ["If the item isn't usable yet, hold on a moment."] =
        "Ist der Gegenstand noch nicht benutzbar, warte einen Moment.",
    ["Go into the Blackfathom Deeps instance"] =
        "Betritt die Instanz Tiefschwarze Grotte",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "In der Tiefschwarzen Grotte lassen Naga-Gegner es fallen.",
    ["The targets are all over the tunnels."] =
        "Die Ziele sind überall in den Tunneln.",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "Sammle die azurblauen Splitter an den Höhlenwänden in der Tiefschwarzen Grotte.",
    ["Head to the Moonshrine Ruins for this."] =
        "Geh dafür zu den Moonshrine Ruins.",
    ["Head back to Splintertree Post"] =
        "Kehr zum Splitterholzposten zurück",
    ["Your quarry is a huge azure bird of level 31."] =
        "Dein Ziel ist ein riesiger azurblauer Vogel der Stufe 31.",
    ["The target circles over a wide area."] =
        "Das Ziel kreist über einem weiten Gebiet.",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "Es erscheint nahe 78.0, 66.0 im Eschental.",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "Fahr mit einem Aufzug hinunter nach Tausend Nadeln, folge der Straße zum Freiwindposten, dann mit einem Aufzug wieder hinauf",
    ["Fly to Freewind Post"] =
        "Flieg zum Freiwindposten",
    ["A pair of level 30 foes stand guard over it."] =
        "Zwei Gegner der Stufe 30 bewachen es.",
    ["Use the teleporter to reach the Plateau"] =
        "Benutze den Teleporter, um das Plateau zu erreichen",
    ["Go back to Dorn Plainstalker"] =
        "Geh zurück zu Dorn Plainstalker",
    ["This won't kill you."] =
        "Das tötet dich nicht.",
    ["Kill Surveyors and Diggers."] =
        "Töte Vermesser und Gräber.",
    ["Take the lift upward"] =
        "Fahr mit dem Aufzug nach oben",
    ["Look for big eggs."] =
        "Such nach großen Eiern.",
    ["Keep away from Heartrazor."] =
        "Halte dich von Heartrazor fern.",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap ist eine braune Hyäne mit 2 Hyänen als Begleitung.",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "Das Ziel erscheint nahe 17.3, 22.2 in Tausend Nadeln.",
    ["The target is a centaur, black in color."] =
        "Das Ziel ist ein schwarzer Zentaur.",
    ["It roams a wide route."] =
        "Es läuft eine weite Route ab.",
    ["Leave it out if you'd rather not hunt for it."] =
        "Lass es aus, wenn du nicht danach suchen willst.",
    ["His patrol crosses this spot two times."] =
        "Seine Patrouille kommt zweimal an dieser Stelle vorbei.",
    ["Expect three foes to strike."] =
        "Rechne mit drei angreifenden Gegnern.",
    ["Fight off the foes that come at you"] =
        "Wehr die Gegner ab, die dich angreifen",
    ["Look for thorny plants."] =
        "Such nach dornigen Pflanzen.",
    ["Hard quests are coming up."] =
        "Schwere Quests stehen bevor.",
    ["Climb the trail and cross the rope bridges"] =
        "Steig den Pfad hinauf und überquere die Seilbrücken",
    ["The objective lies atop the mesa."] =
        "Das Ziel liegt oben auf dem Tafelberg.",
    ["The target is a level 28 elite."] =
        "Das Ziel ist ein Elite der Stufe 28.",
    ["You can defeat it alone without much trouble."] =
        "Du kannst es ohne große Mühe allein besiegen.",
    ["Escort Lakota Windsong safely to the end."] =
        "Eskortiere Lakota Windsong sicher bis zum Ende.",
    ["On every plateau, a pair of foes spawns."] =
        "Auf jedem Plateau erscheinen zwei Gegner.",
    ["Be ready: this opponent is an elite at level 30."] =
        "Sei bereit: Dieser Gegner ist ein Elite der Stufe 30.",
    ["Leave it if it proves too hard."] =
        "Lass es aus, wenn es zu schwer ist.",
    ["Climb the road into Feralas"] =
        "Folge der Straße hinauf nach Feralas",
    ["Should you die, come back to life at Camp Mojache."] =
        "Falls du stirbst, kehr im Camp Mojache ins Leben zurück.",
    ["Fly to Camp Mojache"] =
        "Flieg ins Camp Mojache",
    ["Get Water Sapta done as well."] =
        "Erledige auch Water Sapta.",
    ["You'll need this to pick up an upcoming quest."] =
        "Das brauchst du, um eine kommende Quest anzunehmen.",
    ["Leap up and take the trail behind that tree"] =
        "Spring hinauf und nimm den Pfad hinter diesem Baum",
    ["Head north along the river to reach the NPC."] =
        "Geh am Fluss entlang nach Norden zum NPC.",
    ["Draw foes one at a time if you can."] =
        "Zieh die Gegner wenn möglich einzeln.",
    ["Do not take on the whole group together."] =
        "Nimm es nicht mit der ganzen Gruppe gleichzeitig auf.",
    ["Descend the ramp, then stay on the trail"] =
        "Geh die Rampe hinunter, dann bleib auf dem Pfad",
    ["Climb the trail to the cave's highest level"] =
        "Steig den Pfad hinauf zur obersten Ebene der Höhle",
    ["When nearly dead, it calls two guards."] =
        "Kurz vor dem Tod ruft es zwei Wachen.",
    ["Warden Belamoore stands guard over it."] =
        "Warden Belamoore bewacht es.",
    ["The target is a mage of level 36."] =
        "Das Ziel ist ein Magier der Stufe 36.",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "Kämpfe gegen Kegan und unterbrich ihre Sichtlinie mit Türen und Treppen.",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "Solange Shield Guards leuchten, stell deine Nahkampfangriffe auf sie ein.",
    ["Expect heavy damage from it."] =
        "Rechne mit hohem Schaden.",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 32.",
    ["Gather the big fungi."] =
        "Sammle die großen Pilze.",
    ["The targets are out in front of the cavern."] =
        "Die Ziele sind draußen vor der Höhle.",
    ["Flight master at Hammerfall"] =
        "Flugmeister in Hammerfall",
    ["Stay away from Refuge Pointe."] =
        "Halte dich von der Zuflucht fern.",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 33.",
    ["Head out of the Apothecarium"] =
        "Geh aus dem Apothekarium hinaus",
    ["Hive Drones compete for these spawn points."] =
        "Hive Drones konkurrieren um diese Spawnpunkte.",
    ["The NPC is on the building's ground level."] =
        "Der NPC ist im Erdgeschoss des Gebäudes.",
    ["The quest giver is in the Dormitory."] =
        "Der Questgeber ist im Schlafsaal.",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "Eskortiere Kernobee zum Portal am Eingang des Dungeons.",
    ["Open the gray chest built of metal."] =
        "Öffne die graue Metalltruhe.",
    ["Close to the north wall."] =
        "Nahe der Nordwand.",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "Es ist im selben Raum wie Robogenieur Thermaplugg.",
    ["Plan on killing monsters for quite some time."] =
        "Stell dich darauf ein, eine ganze Weile Monster zu töten.",
    ["Other satyrs use the same spawn points."] =
        "Andere Satyrn nutzen dieselben Spawnpunkte.",
    ["Take the trail toward Shadowprey Village"] =
        "Nimm den Pfad Richtung Shadowprey Village",
    ["Fly to Shadowprey Village"] =
        "Flieg nach Shadowprey Village",
    ["Defeat every foe in this chamber before starting."] =
        "Besiege vor dem Start alle Gegner in diesem Raum.",
    ["Target Burning Blade foes with the item."] =
        "Ziele mit dem Gegenstand auf Gegner der Brennenden Klinge.",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "Warte, bis der Gegner schwer verletzt ist, dann benutze es.",
    ["Look for big white clams."] =
        "Such nach großen weißen Muscheln.",
    ["Flight master at Grom'gol"] =
        "Flugmeister in Grom'gol",
    ["They appear in the same spots as the panthers."] =
        "Sie erscheinen an denselben Stellen wie die Panther.",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "Achte auf Shadowmaw Panthers; sie sind getarnt.",
    ["Tigers compete for the same spawn points."] =
        "Tiger konkurrieren um dieselben Spawnpunkte.",
    ["The NPC is on the building's lowest floor"] =
        "Der NPC ist im untersten Stockwerk des Gebäudes",
    ["Climb the steps"] =
        "Steig die Treppe hinauf",
    ["You won't find an ammunition seller."] =
        "Du findest keinen Munitionshändler.",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "Beschütze \"Stinky\" Ignatz, während du ihn eskortierst.",
    ["Hunt the orange spiders."] =
        "Jage die orangefarbenen Spinnen.",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "Vorsicht: Darkfang Lurkers sind getarnt.",
    ["Escort Ogron, guarding him from attackers."] =
        "Eskortiere Ogron und schütze ihn vor Angreifern.",
    ["Keep out of Theramore Isle."] =
        "Halte dich von der Insel Theramore fern.",
    ["Let yourself drown for a quick trip."] =
        "Lass dich ertrinken, so geht es am schnellsten.",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "Behalte es: Die Questreihe der Wirbelwindwaffe für Krieger verlangt es.",
    ["Alterac and Arathi"] =
        "Alterac und Arathi",
    ["Get ready to take down an elite of level 40 shortly."] =
        "Mach dich bereit, gleich einen Elite der Stufe 40 zu besiegen.",
    ["Quaff one potion right away so it is ready again later."] =
        "Trink sofort einen Trank, damit er später wieder bereit ist.",
    ["It wanders to the mouth of the cave."] =
        "Es wandert bis zum Höhleneingang.",
    ["Look on the upper floor as well."] =
        "Sieh auch im oberen Stockwerk nach.",
    ["Climb the slope, then leap the wall"] =
        "Steig den Hang hinauf, dann spring über die Mauer",
    ["Fly to Kargath"] =
        "Flieg nach Kargath",
    ["Stranglethorn and Swamp of Sorrows"] =
        "Schlingendorntal und Sümpfe des Elends",
    ["Go along the shore, then climb the trail"] =
        "Geh am Ufer entlang, dann steig den Pfad hinauf",
    ["Keep clear of Darkshire."] =
        "Halte dich von Dunkelhain fern.",
    ["Flight master at Stonard"] =
        "Flugmeister in Steinard",
    ["Look for assorted little brown items."] =
        "Such nach verschiedenen kleinen braunen Gegenständen.",
    ["Look for purple rings made of rock."] =
        "Such nach violetten Steinringen.",
    ["A guardian shows up."] =
        "Ein Wächter erscheint.",
    ["Stay clear of Lord Azrethoc."] =
        "Halte dich von Lord Azrethoc fern.",
    ["An elite winged fiend of level 40 with brown hide."] =
        "Ein geflügelter Elite-Unhold der Stufe 40 mit brauner Haut.",
    ["The target wanders close by; look around."] =
        "Das Ziel wandert in der Nähe umher; sieh dich um.",
    ["You can handle this alone without much trouble."] =
        "Das schaffst du ohne große Mühe allein.",
    ["A tougher foe is coming up."] =
        "Ein stärkerer Gegner steht bevor.",
    ["Grab the loot."] =
        "Schnapp dir die Beute.",
    ["The target is a crocodile with white scales."] =
        "Das Ziel ist ein Krokodil mit weißen Schuppen.",
    ["The target roams a wide loop through the water."] =
        "Das Ziel zieht eine weite Runde durchs Wasser.",
    ["Accepting this starts a 2 hour countdown."] =
        "Mit der Annahme beginnt ein Countdown von 2 Stunden.",
    ["The timer keeps running while you're offline."] =
        "Der Timer läuft weiter, während du offline bist.",
    ["Take this quest only when you have time to spare."] =
        "Nimm diese Quest nur an, wenn du genug Zeit hast.",
    ["Watch out for a pair of stronger monsters here."] =
        "Achte hier auf zwei stärkere Monster.",
    ["Look for the NPC dressed in red armor."] =
        "Such den NPC in roter Rüstung.",
    ["Climb the trail to Gordunni Outpost"] =
        "Steig den Pfad hinauf zum Außenposten der Gordunni",
    ["Beside the shining blue rings on the ground."] =
        "Neben den leuchtend blauen Ringen am Boden.",
    ["Look for earth mounds that pop up."] =
        "Such nach Erdhügeln, die aus dem Boden auftauchen.",
    ["Ones holding the quest item shine blue."] =
        "Die mit dem Questgegenstand leuchten blau.",
    ["Fight the tauren."] =
        "Kämpfe gegen die Tauren.",
    ["The target is a winged green bug, level 47."] =
        "Das Ziel ist ein grünes geflügeltes Insekt, Stufe 47.",
    ["You can likely beat it at your current level."] =
        "Auf deiner aktuellen Stufe schaffst du es wahrscheinlich.",
    ["Kill bugs."] =
        "Töte Insekten.",
    ["Extra targets lurk in the bug caverns."] =
        "Weitere Ziele lauern in den Insektenhöhlen.",
    ["Stay on the road"] =
        "Bleib auf der Straße",
    ["The targets are ghosts that materialize."] =
        "Die Ziele sind Geister, die sich materialisieren.",
    ["No drops come from Stagwings and Skystormers."] =
        "Stagwings und Skystormers lassen nichts fallen.",
    ["Saves you some monster farming afterward."] =
        "Das erspart dir später etwas Monsterfarmen.",
    ["You need Chapter I as well as Chapter II."] =
        "Du brauchst Kapitel I und auch Kapitel II.",
    ["It doesn't show up often."] =
        "Es erscheint nicht oft.",
    ["The NPC waits on the house's upper-floor terrace."] =
        "Der NPC wartet auf der Terrasse im Obergeschoss des Hauses.",
    ["Take the road until the trail starts"] =
        "Folge der Straße, bis der Pfad beginnt",
    ["Circle the mountain on the trail, then climb it"] =
        "Umrunde den Berg auf dem Pfad, dann steig hinauf",
    ["Kill the crocodiles."] =
        "Töte die Krokodile.",
    ["Stay out of Swamp Talker's way."] =
        "Geh Swamp Talker aus dem Weg.",
    ["Hunt down the gray murloc; it is level 50."] =
        "Jage den grauen Murloc; er ist Stufe 50.",
    ["Tanaris and Dustwallow"] =
        "Tanaris und Düstermarschen",
    ["Watch out for foes hidden in stealth."] =
        "Achte auf getarnte Gegner.",
    ["Look for brown eggs covered in spikes."] =
        "Such nach braunen Eiern voller Stacheln.",
    ["Buy plenty of arrows or bullets."] =
        "Kauf reichlich Pfeile oder Kugeln.",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "Deck dich vorher ein: Im Hinterland verkauft niemand Pfeile oder Kugeln für Stufe 40.",
    ["Take the road that circles the peak, then descend the trail"] =
        "Nimm die Straße rund um den Gipfel, dann steig den Pfad hinunter",
    ["Flight master at Revantusk Village"] =
        "Flugmeister im Dorf der Revantusk",
    ["A trio of enemies attacks."] =
        "Drei Gegner greifen an.",
    ["Look for a little silver pail holding tools."] =
        "Such nach einem kleinen silbernen Eimer mit Werkzeug.",
    ["The targets are big eagle-like beasts."] =
        "Die Ziele sind große adlerähnliche Bestien.",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "Wölfe und Eulenbestien nutzen diese Spawnpunkte ebenfalls.",
    ["Look for crates made of wood."] =
        "Such nach Holzkisten.",
    ["The targets are wolves hidden in stealth."] =
        "Die Ziele sind getarnte Wölfe.",
    ["Steer clear of hostile Alliance NPCs."] =
        "Halte dich von feindlichen NPCs der Allianz fern.",
    ["Warning: this turns on your PvP flag."] =
        "Achtung: Dadurch wirst du für PvP markiert.",
    ["Head into Shadra'Alor"] =
        "Geh hinein nach Shadra'Alor",
    ["Get out of Shadra'Alor"] =
        "Geh hinaus aus Shadra'Alor",
    ["Feralas and Un'Goro"] =
        "Feralas und Un'Goro",
    ["The targets are hippogryphs."] =
        "Die Ziele sind Hippogryphen.",
    ["Use it on the stone giant foes."] =
        "Benutze es an den Steinriesen.",
    ["You have 2 hours before it disappears."] =
        "Du hast 2 Stunden, bevor es verschwindet.",
    ["Watch out: this foe is a level 50 elite."] =
        "Vorsicht: Dieser Gegner ist ein Elite der Stufe 50.",
    ["You can likely do it alone."] =
        "Das schaffst du wahrscheinlich allein.",
    ["The NPC turns hostile and fights you."] =
        "Der NPC wird feindlich und kämpft gegen dich.",
    ["The target yields at roughly 30% health."] =
        "Das Ziel ergibt sich bei etwa 30% Gesundheit.",
    ["The NPC roams the trail close to Kargath."] =
        "Der NPC streift auf dem Pfad nahe Kargath umher.",
    ["The NPC gives the quest only while at this spot."] =
        "Der NPC gibt die Quest nur an dieser Stelle.",
    ["If the NPC is away, stay until he comes back."] =
        "Ist der NPC weg, bleib, bis er zurückkommt.",
    ["Burning Steppes and Azshara"] =
        "Brennende Steppe und Azshara",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "Geh durch den Schwarzfels in die Brennende Steppe",
    ["Fly to Flame Crest"] =
        "Flieg zum Flammenkamm",
    ["It lies atop a stone slab."] =
        "Es liegt auf einer Steinplatte.",
    ["The following quest needs you at level 52."] =
        "Für die nächste Quest brauchst du Stufe 52.",
    ["Ammunition can't be bought here."] =
        "Hier kannst du keine Munition kaufen.",
    ["Flight master at Valormok"] =
        "Flugmeister in Valormok",
    ["Look for a rectangular slab etched with green glyphs."] =
        "Such nach einer rechteckigen Platte mit eingeritzten grünen Glyphen.",
    ["Look for an oblong slab carved with pink glyphs."] =
        "Such nach einer länglichen Platte mit eingemeißelten rosa Glyphen.",
    ["A rectangular slab carved with blue glyphs."] =
        "Eine rechteckige Platte mit eingemeißelten blauen Glyphen.",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "Such eine behauene Steinplatte mit goldenen Glyphen.",
    ["The NPC is in the tower, which has several floors."] =
        "Der NPC ist im Turm, der mehrere Stockwerke hat.",
    ["Felwood and Winterspring"] =
        "Teufelswald und Winterquell",
    ["Walk west beside the river"] =
        "Geh am Fluss entlang nach Westen",
    ["Fly to Bloodvenom Post"] =
        "Flieg zum Blutgiftposten",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "Zusammen mit den nächsten Abgaben bringt dich das auf Stufe 53.",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "Behalte es für eine spätere Aufgabe im Krater von Un'Goro.",
    ["Get onto the massive incline."] =
        "Steig auf den gewaltigen Hang.",
    ["Watch out for elite foes here."] =
        "Achte hier auf Elite-Gegner.",
    ["Flee afterward."] =
        "Flieh danach.",
    ["More than one crystal might be required."] =
        "Eventuell brauchst du mehr als einen Kristall.",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "Das Ziel ruft nach Magus Rimtori, sobald es schwer verletzt ist.",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "Wenn du es benutzt, erscheint eine grüne Katze, ein Corrupted Saber.",
    ["Hold on until it begins to trail you."] =
        "Warte, bis sie dir zu folgen beginnt.",
    ["The kitten is the green cat beside you."] =
        "Das Kätzchen ist die grüne Katze neben dir.",
    ["Look beside Winna Hazzard."] =
        "Sieh neben Winna Hazzard nach.",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "Jage eine Elite-Schildkröte der Stufe 48 mit azurblauem Panzer.",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "Der NPC trägt ein helles Hemd und eine Lampe.",
    ["Elite human foes walk patrols here; stay clear."] =
        "Menschliche Elite-Gegner patrouillieren hier; halte Abstand.",
    ["The NPC hides beneath the staircase."] =
        "Der NPC versteckt sich unter der Treppe.",
    ["You can also take it out of your bank."] =
        "Du kannst es auch aus deiner Bank holen.",
    ["The target is a ghoul armed with a hayfork."] =
        "Das Ziel ist ein Ghul mit einer Heugabel.",
    ["It can appear at this spot."] =
        "Es kann an dieser Stelle erscheinen.",
    ["One last lengthy stretch of monster farming."] =
        "Ein letzter langer Abschnitt Monsterfarmen.",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "Behalte es; eine Aufgabe im Krater von Un'Goro braucht es später.",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "Dalaran erreichst du über das Skyborne-Portal.",
    ["Take the Skyborne portal to Stormwind"] =
        "Nimm das Skyborne-Portal nach Sturmwind",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "Gemütlicher Schlafsack",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "Eine Spur aus Hinweisen auf beiden Kontinenten, ab Stufe 14, die zu einem Schlafsack mit bis zu 3 % mehr Erfahrung führt: keine Kämpfe, nur Objekte zum Anklicken.",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "Westfall, westlich der Späherkuppe: die verbrannten Überreste neben dem zerstörten Karren.",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "Brachland, an der Straße südlich von Camp Taurajo: die verbrannten Überreste am Fuß des abgebrannten Turms.",
    ["Horde land: stay clear of the guards."] =
        "Gebiet der Horde: Halte dich von den Wachen fern.",
    ["Alliance land: stay clear of the guards."] =
        "Gebiet der Allianz: Halte dich von den Wachen fern.",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "Gleich hier: der nächste Hinweis, auf den Überresten oder auf dem Brett, das daneben angenagelt ist.",
    ["Path northeast of Sun Rock Retreat"] =
        "Pfad nordöstlich von Sonnenfels",
    ["The camp is up in the hills: follow this path west."] =
        "Das Lager liegt oben in den Hügeln: Folge diesem Pfad nach Westen.",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "Am Ende des Pfads, im verlassenen Lager: der Schlafsack auf einer Kiste.",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "Optional: Holz und Zunder aus dieser Belohnung entfachen das Lagerfeuer daneben neu, eine kleine Quest, die der Schlafsack nicht braucht.",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "Den Hügel hinauf, nördlich des Lagers: ein Haufen frischer Erde.",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "Loch Modan, oben auf dem Damm: die Adlerfigur auf den gemeißelten Steinköpfen, die zum Sumpfland blicken.",
    ["Cart against Thoradin's Wall"] =
        "Karren am Thoradinswall",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "Auf der Seite des Vorgebirges des Hügellands: Klettere auf den Karren und dann hinauf in den Wall.",
    ["The messenger bag hangs on the outer face of the wall."] =
        "Die Botentasche hängt an der Außenseite des Walls.",
    ["The satchel just below it holds the sleeping bag."] =
        "Der Beutel direkt darunter enthält den Schlafsack.",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "Benutze ihn im Freien und bleib reglos darauf: Jede Minute Schlaf bringt 1 % Erfahrung, bis zu 3 %.",
    ["Try the sleeping bag"] =
        "Probiere den Schlafsack aus",
}
